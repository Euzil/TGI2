(async function () {
    const Logger = require("Logger").default;
    const Modules = require("Modules");
    const IrqManager = require("IrqManager").default;
    const PinIrq = require("IrqManager.irqs").PinIrq;
    const Irq = require("IrqManager.irqs").Irq;
    const Key = require("Key").default;
    const LayoutManager = require("LayoutManager").default;
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    const signed8 = (v) => (v > 0x7f ? v - 0x100 : v);
    const signed16 = (v) => (v > 0x7fff ? v - 0x10000 : v);
    const signed32 = (v) => (v >> 0);
    const unsigned32 = (v) => (v >>> 0);
    const toHex = (v, s) => (v >>> 0).toString(16).padStart(s, "0");
    const toBin = (v, s) => (v >>> 0).toString(2).padStart(s, "0");
    const toHex32 = (v) => toHex(v, 8);
    const mergeBytes = (v) => unsigned32((v[3] << 24) | (v[2] << 16) | (v[1] << 8) | (v[0]));
    const splitBytes = (v) => [((v >>> 24) & 0xFF), ((v >>> 16) & 0xFF), ((v >>> 8) & 0xFF), ((v >>> 0) & 0xFF)];
    function disassemble(instruction, pc, labelMap) {
        const opcode = (instruction >> 0) & 0x7F;
        const rd_addr = (instruction >> 7) & 0x1F;
        const funct3 = (instruction >> 12) & 0x07;
        const rs1_addr = (instruction >> 15) & 0x1F;
        const rs2_addr = (instruction >> 20) & 0x1F;
        const funct7 = (instruction >> 25) & 0x7F;
        const irType = (opcode === 0b0110111 ||
            opcode === 0b0010111 ? "U" :
            opcode === 0b1101111 ? "J" :
                opcode === 0b1100111 ||
                    opcode === 0b0000011 ||
                    opcode === 0b0010011 ? "I" :
                    opcode === 0b1100011 ? "B" :
                        opcode === 0b0100011 ? "S" :
                            opcode === 0b0110011 ? "R" : "UNKNOWN");
        const name = (opcode === 0b0110111 ? "lui" :
            opcode === 0b0010111 ? "auipc" :
                opcode === 0b1101111 ? "jal" :
                    opcode === 0b1100111 ? "jalr" :
                        opcode === 0b1100011 ? (funct3 === 0b000 ? "beq" :
                            funct3 === 0b001 ? "bne" :
                                funct3 === 0b100 ? "blt" :
                                    funct3 === 0b101 ? "bge" :
                                        funct3 === 0b110 ? "bltu" :
                                            funct3 === 0b111 ? "bgeu" : "???") :
                            opcode === 0b0000011 ? (funct3 === 0b000 ? "lb" :
                                funct3 === 0b001 ? "lh" :
                                    funct3 === 0b010 ? "lw" :
                                        funct3 === 0b100 ? "lbu" :
                                            funct3 === 0b101 ? "lhu" : "???") :
                                opcode === 0b0100011 ? (funct3 === 0b000 ? "sb" :
                                    funct3 === 0b001 ? "sh" :
                                        funct3 === 0b010 ? "sw" : "???") :
                                    opcode === 0b0010011 ? (funct3 === 0b000 ? "addi" :
                                        funct7 === 0b0000000 && funct3 === 0b001 ? "slli" :
                                            funct3 === 0b010 ? "slti" :
                                                funct3 === 0b011 ? "sltiu" :
                                                    funct3 === 0b100 ? "xori" :
                                                        funct7 === 0b0000000 && funct3 === 0b101 ? "srli" :
                                                            funct7 === 0b1000000 && funct3 === 0b101 ? "srai" :
                                                                funct3 === 0b110 ? "ori" :
                                                                    funct3 === 0b111 ? "andi" : "???") :
                                        opcode === 0b0110011 ? (funct7 === 0b0000000 && funct3 === 0b000 ? "add" :
                                            funct7 === 0b0100000 && funct3 === 0b000 ? "sub" :
                                                funct7 === 0b0000000 && funct3 === 0b001 ? "sll" :
                                                    funct7 === 0b0000000 && funct3 === 0b010 ? "slt" :
                                                        funct7 === 0b0000000 && funct3 === 0b011 ? "sltu" :
                                                            funct7 === 0b0000000 && funct3 === 0b100 ? "xor" :
                                                                funct7 === 0b0000000 && funct3 === 0b101 ? "srl" :
                                                                    funct7 === 0b0100000 && funct3 === 0b101 ? "sra" :
                                                                        funct7 === 0b0000000 && funct3 === 0b110 ? "or" :
                                                                            funct7 === 0b0000000 && funct3 === 0b111 ? "and" : "???") : "???").padEnd(7, " ");
        function nearestLabel(target) {
            let offset = 0xFFFFFFFF;
            let tLabel = "";
            for (const { addr, label } of labelMap) {
                if (Math.abs(addr - target) <= Math.abs(offset)) {
                    tLabel = label;
                    offset = target - addr;
                }
            }
            if (offset === 0)
                return tLabel;
            else if (offset > 0)
                return `${tLabel}+${offset}`;
            else
                return `${tLabel}-${-offset}`;
        }
        function decode_imm() {
            const instr = (b, a) => (instruction >> a) & (0xFFFFFFFF >>> (31 - (b - a)));
            return (irType === "U" ? instr(31, 12) << 12 :
                irType === "J" ? 0 |
                    (instr(31, 31) === 1 ? 0xFFF00000 : 0x00000000) |
                    (instr(19, 12) << 12) |
                    (instr(20, 20) << 11) |
                    (instr(30, 21) << 1) :
                    irType === "I" ? 0 |
                        (instr(31, 31) === 1 ? 0xFFFFF000 : 0x00000000) |
                        (instr(31, 20)) :
                        irType === "B" ? 0 |
                            (instr(31, 31) === 1 ? 0xFFFFF000 : 0x00000000) |
                            (instr(7, 7) << 11) |
                            (instr(30, 25) << 5) |
                            (instr(11, 8) << 1) :
                            irType === "S" ? 0 |
                                (instr(31, 31) === 1 ? 0xFFFFF000 : 0x00000000) |
                                (instr(31, 25) << 5) |
                                (instr(11, 7)) :
                                irType === "R" ? 0 : 0);
        }
        const imm = unsigned32(decode_imm());
        const imm_i = signed32(imm);
        const imm_s = signed32(imm);
        const imm_u = (imm >>> 12);
        const imm_j = unsigned32(pc + signed32(imm));
        const imm_b = unsigned32(pc + signed32(imm));
        const label_j = nearestLabel(imm_j);
        const label_b = nearestLabel(imm_b);
        const rs1_name = `${rs1_addr < 10 ? "" : ""}x${rs1_addr}`;
        const rs2_name = `${rs2_addr < 10 ? "" : ""}x${rs2_addr}`;
        const rd_name = `${rd_addr < 10 ? "" : ""}x${rd_addr}`;
        return (name.startsWith("???") ? `.word   0x${toHex(unsigned32(instruction), 8)}` :
            opcode === 0b0110111 ||
                opcode === 0b0010111 ? `${name} ${rd_name}, 0x${toHex(imm_u, 5)}` :
                opcode === 0b1101111 ? `${name} ${rd_name}, 0x${toHex(imm_j, 3)} <${label_j}>` :
                    opcode === 0b0000011 ? `${name} ${rd_name}, ${imm_i}(${rs1_name})` :
                        opcode === 0b1100111 ||
                            opcode === 0b0010011 ? `${name} ${rd_name}, ${rs1_name}, ${imm_i}` :
                            opcode === 0b1100011 ? `${name} ${rs1_name}, ${rs2_name}, 0x${toHex(imm_b, 3)} <${label_b}>` :
                                opcode === 0b0100011 ? `${name} ${rs2_name}, ${imm_s}(${rs1_name})` :
                                    opcode === 0b0110011 ? `${name} ${rd_name}, ${rs1_name}, ${rs2_name}` :
                                        name);
    }
    const state_mapper = (v) => v === 0b0001 ? "WB >> IF" :
        v === 0b0010 ? "IF >> ID" :
            v === 0b0011 ? "ID >> EX" :
                v === 0b0100 ? "EX >> MEM" :
                    v === 0b0101 ? "MEM >> WB" : "???";
    const alu_src_mapper = (v) => v === 0b00 ? "REG" :
        v === 0b01 ? "IMM" :
            v === 0b10 ? "PC" :
                v === 0b11 ? "4" : "???";
    const alu_op_mapper = (v) => v === 0b0000000 ? "NOP" :
        v === 0b0000001 ? "ADD" :
            v === 0b0000010 ? "SUB" :
                v === 0b0000011 ? "OR" :
                    v === 0b0000100 ? "AND" :
                        v === 0b0000101 ? "XOR" :
                            v === 0b0000110 ? "SLL" :
                                v === 0b0000111 ? "SRL" :
                                    v === 0b0001000 ? "SRA" :
                                        v === 0b0001001 ? "EQ" :
                                            v === 0b0001010 ? "NEQ" :
                                                v === 0b0001011 ? "LT" :
                                                    v === 0b0001100 ? "GE" :
                                                        v === 0b0001101 ? "LTU" :
                                                            v === 0b0001110 ? "GEU" :
                                                                v === 0b0001111 ? "OP1" :
                                                                    v === 0b0010000 ? "OP2" : "???";
    const mem_cmd_mapper = (v) => v === 0b0000 ? "NOP" :
        v === 0b0001 ? "WRITE_B" :
            v === 0b0010 ? "WRITE_H" :
                v === 0b0011 ? "WRITE_W" :
                    v === 0b0100 ? "READ_B" :
                        v === 0b0101 ? "READ_H" :
                            v === 0b0110 ? "READ_W" :
                                v === 0b0111 ? "READ_BU" :
                                    v === 0b1000 ? "READ_HU" : "???";
    const rd_src_mapper = (v) => v === 0b0 ? "ALU_RESULT" :
        v === 0b1 ? "MEM_DATA" : "???";
    const pc_src_mapper = (v) => v === 0b00 ? "PC_NEXT" :
        v === 0b01 ? "PC_IMM" :
            v === 0b10 ? "RS1_IMM" : "???";
    class EduCoreVTiny {
        constructor() {
            this.state = 0;
            this.pc_prev = 0;
            this.pc = 0;
            this.rs1 = 0;
            this.rs2 = 0;
            this.rd = 0;
            this.alu = 0;
            this.ir = 0;
            this.ctrl_mem_cmd = 0;
            this.ctrl_alu_src_1 = 0;
            this.ctrl_alu_src_2 = 0;
            this.ctrl_alu_op = 0;
            this.ctrl_rd_src = 0;
            this.ctrl_rd_we = 0;
            this.ctrl_pc_src = 0;
            this.ctrl_branch = 0;
            this.ctrl_imm = 0;
            this.ram = new Uint8Array(512);
            this.ram32 = new DataView(this.ram.buffer);
            this.mem_cmd = 0;
            this.mem_addr = 0;
            this.mem_rdata = 0;
            this.mem_wdata = 0;
            this.reg = new Uint32Array(32);
        }
        opcode() { return (this.ir >> 0) & 0x7F; }
        rd_addr() { return (this.ir >> 7) & 0x1F; }
        funct3() { return (this.ir >> 12) & 0x07; }
        rs1_addr() { return (this.ir >> 15) & 0x1F; }
        rs2_addr() { return (this.ir >> 20) & 0x1F; }
        funct7() { return (this.ir >> 25) & 0x7F; }
        irType() {
            const opcode = this.opcode();
            return (opcode === 0b0110111 ||
                opcode === 0b0010111 ? "U" :
                opcode === 0b1101111 ? "J" :
                    opcode === 0b1100111 ||
                        opcode === 0b0000011 ||
                        opcode === 0b0010011 ? "I" :
                        opcode === 0b1100011 ? "B" :
                            opcode === 0b0100011 ? "S" :
                                opcode === 0b0110011 ? "R" : "UNKNOWN");
        }
    }
    const categories = new Map([
        ["Core", new Map([
                ["State", (core) => state_mapper(core.state)],
                ["PC", (core) => "0x" + toHex32(core.pc)],
                ["IR", (core) => "0x" + toHex32(core.ir)],
                ["RS1 Value", (core) => "0x" + toHex32(core.rs1)],
                ["RS2 Value", (core) => "0x" + toHex32(core.rs2)],
                ["ALU Result", (core) => "0x" + toHex32(core.alu)],
            ])],
        ["Memory Interface", new Map([
                ["Command", (core) => "CTRL_MEM_CMD_" + mem_cmd_mapper(core.mem_cmd)],
                ["Address", (core) => "0x" + toHex32(core.mem_addr)],
                ["Read Data", (core) => "0x" + toHex32(core.mem_rdata)],
                ["Write Data", (core) => "0x" + toHex32(core.mem_wdata)],
            ])],
        ["Instruction", new Map([
                ["Immediate Type", (core) => core.irType()],
                ["Opcode", (core) => toBin(core.opcode(), 7)],
                ["RS1 Address", (core) => "x" + core.rs1_addr()],
                ["RS2 Address", (core) => "x" + core.rs2_addr()],
                ["RD Address", (core) => "x" + core.rd_addr()],
                ["Funct3", (core) => toBin(core.funct3(), 3)],
                ["Funct7", (core) => toBin(core.funct7(), 7)],
            ])],
        ["Control Signals", new Map([
                ["ALU Source 1", (core) => "CTRL_ALU_SRC_" + alu_src_mapper(core.ctrl_alu_src_1)],
                ["ALU Source 2", (core) => "CTRL_ALU_SRC_" + alu_src_mapper(core.ctrl_alu_src_2)],
                ["ALU Operation", (core) => "CTRL_ALU_OP_" + alu_op_mapper(core.ctrl_alu_op)],
                ["Memory Command", (core) => "CTRL_MEM_CMD_" + mem_cmd_mapper(core.ctrl_mem_cmd)],
                ["RD Source", (core) => "CTRL_RD_SRC_" + rd_src_mapper(core.ctrl_rd_src)],
                ["RD Write Enable", (core) => core.ctrl_rd_we !== 0 ? "true" : "false"],
                ["PC Source", (core) => "CTRL_PC_SRC_" + pc_src_mapper(core.ctrl_pc_src)],
                ["Branch", (core) => core.ctrl_branch !== 0 ? "true" : "false"],
            ])],
        ["Immediate Decoder", new Map([
                ["Immediate (hex)", (core) => "0x" + toHex32(core.ctrl_imm)],
                ["Immediate (unsigned)", (core) => unsigned32(core.ctrl_imm).toString()],
                ["Immediate (signed)", (core) => signed32(core.ctrl_imm).toString()],
            ])],
        ["Registers", new Map([
                ["x0", (core) => "0x" + toHex32(core.reg[0])],
                ["x1", (core) => "0x" + toHex32(core.reg[1])],
                ["x2", (core) => "0x" + toHex32(core.reg[2])],
                ["x3", (core) => "0x" + toHex32(core.reg[3])],
                ["x4", (core) => "0x" + toHex32(core.reg[4])],
                ["x5", (core) => "0x" + toHex32(core.reg[5])],
                ["x6", (core) => "0x" + toHex32(core.reg[6])],
                ["x7", (core) => "0x" + toHex32(core.reg[7])],
                ["x8", (core) => "0x" + toHex32(core.reg[8])],
                ["x9", (core) => "0x" + toHex32(core.reg[9])],
                ["x10", (core) => "0x" + toHex32(core.reg[10])],
                ["x11", (core) => "0x" + toHex32(core.reg[11])],
                ["x12", (core) => "0x" + toHex32(core.reg[12])],
                ["x13", (core) => "0x" + toHex32(core.reg[13])],
                ["x14", (core) => "0x" + toHex32(core.reg[14])],
                ["x15", (core) => "0x" + toHex32(core.reg[15])],
                ["x16", (core) => "0x" + toHex32(core.reg[16])],
                ["x17", (core) => "0x" + toHex32(core.reg[17])],
                ["x18", (core) => "0x" + toHex32(core.reg[18])],
                ["x19", (core) => "0x" + toHex32(core.reg[19])],
                ["x20", (core) => "0x" + toHex32(core.reg[20])],
                ["x21", (core) => "0x" + toHex32(core.reg[21])],
                ["x22", (core) => "0x" + toHex32(core.reg[22])],
                ["x23", (core) => "0x" + toHex32(core.reg[23])],
                ["x24", (core) => "0x" + toHex32(core.reg[24])],
                ["x25", (core) => "0x" + toHex32(core.reg[25])],
                ["x26", (core) => "0x" + toHex32(core.reg[26])],
                ["x27", (core) => "0x" + toHex32(core.reg[27])],
                ["x28", (core) => "0x" + toHex32(core.reg[28])],
                ["x29", (core) => "0x" + toHex32(core.reg[29])],
                ["x30", (core) => "0x" + toHex32(core.reg[30])],
                ["x31", (core) => "0x" + toHex32(core.reg[31])],
            ])]
    ]);
    function convertToHtml(core) {
        let html = `
            <colgroup>
                <col style="width: 170px; ">
                <col style="">
            </colgroup>
            <thead><tr>
                <th>Name</th>
                <th>Value</th>
            </tr></thead>
        `;
        for (const [category, properties] of categories) {
            html += `
                <tr data-tt-id='${category}'>
                    <td>${category}</td>
                    <td></td>
                </tr>
            `;
            for (const [name, mapper] of properties) {
                html += `
                    <tr data-tt-id='${category}/${name}' data-tt-parent-id='${category}'>
                        <td>${name}</td>
                        <td style="padding-left: 10px; font-family: 'courier new'" class="prop" category="${category}" name="${name}">${mapper(core)}</td>
                    </tr>
                `;
            }
        }
        return `<table style="min-width: 200px;"> ${html} </table>`;
    }
    function IoComponent(_core) {
        let domContainer;
        const valuesDomElements = [];
        const core = _core;
        this.init = (container) => {
            domContainer = $('<div class="ioContainer"></div>');
            container.getElement().append(domContainer);
            const table = $(convertToHtml(core))
                .appendTo(domContainer)
                .treetable({
                expandable: true,
                clickableNodeNames: true,
                initialState: "collapsed",
                onNodeExpandAfter: () => this.update()
            });
            for (const elem of $(".prop", table).toArray()) {
                const category = $(elem).attr("category");
                const name = $(elem).attr("name");
                const mapper = categories.get(category).get(name);
                valuesDomElements.push([$(elem), mapper]);
            }
        };
        this.reset = () => {
            this.update();
        };
        this.update = () => {
            for (const elem of valuesDomElements.filter(a => a[0][0].offsetWidth > 0)) {
                const val = elem[1](core);
                const mark = val !== elem[0].text();
                elem[0].text(val);
                if (mark)
                    elem[0].addClass("mark");
                else
                    elem[0].removeClass("mark");
            }
        };
    }
    function RamMemoryComponent(_core) {
        let domContainer;
        const domElements = [];
        const core = _core;
        this.init = (container) => {
            domContainer = $('<div class="memoryContainer"></div>')
                .css({
                "padding": "12px",
                "white-space": "pre",
                "font-family": "Consolas, 'Courier New', Courier, monospace",
                "font-size": "14px",
                "line-height": "16px",
            })
                .appendTo(container.getElement());
            domContainer.append("      3 2 1 0  7 6 5 4  b a 9 8  f e d c\n");
            for (let address = 0; address < 512;) {
                const val = toHex(address, 3);
                domContainer.append(val + ": ");
                for (let j = 0; j < 4; j++) {
                    const elem = $(`<span ram="${address}">00000000</span>`);
                    domElements.push(elem);
                    domContainer.append(elem);
                    domContainer.append(" ");
                    address += 4;
                }
                domContainer.append("\n");
            }
        };
        this.reset = () => {
            this.update();
        };
        this.update = () => {
            for (let i = 0; i < 512; i += 4) {
                const val = toHex(core.ram32.getUint32(i, true) >>> 0, 8);
                const elem = domElements[i / 4];
                const mark = val !== elem.text();
                elem.text(val);
                if (mark)
                    elem.addClass("mark");
                else
                    elem.removeClass("mark");
            }
        };
    }
    function DisassemblyComponent(_core) {
        const core = _core;
        const style = document.createElement('style');
        style.type = 'text/css';
        style.innerHTML = `
            .lm_content .disassemblyContainer {
                padding: 12px 0px 32px 0px;
                white-space: pre;
                font-family: Consolas, 'Courier New', Courier, monospace;
                font-size: 14px;
                line-height: 16px;
            }
            .lm_content .disassemblyContainer div {
                padding-left: 8px;
            }
            .lm_content .disassemblyContainer div.previous {
                background: #afe6ff;
            }
            .lm_content .disassemblyContainer div.active {
                background: #2bbdff;
                position: relative;
            }
            .lm_content .disassemblyContainer div.active::before {
                content: ">";
                position: absolute;
            }
        `;
        document.getElementsByTagName('head')[0].appendChild(style);
        let domContainer;
        this.init = (container) => {
            domContainer = $('<div class="disassemblyContainer"></div>');
            container.getElement().append(domContainer);
        };
        this.reset = () => {
            this.setContent("");
        };
        let labelMap = [];
        let instrList = [];
        this.setContent = (mapFile) => {
            labelMap = [];
            instrList = [];
            for (const line of mapFile.split("\n")) {
                const parts = line.split(" ");
                if (parts.length !== 3 || parts[1].toLowerCase() !== "t")
                    continue;
                const addr = parseInt(parts[0], 16);
                const label = parts[2];
                labelMap.push({ addr, label });
            }
            domContainer.html("");
            const _dis = disassemble(0, 0, labelMap);
            for (let i = 0; i < 512; i += 4) {
                for (const { addr, label } of labelMap) {
                    if (i === addr)
                        domContainer.append(`${toHex(addr, 8)} &lt;${label}&gt;:<br>`);
                }
                const iElem = $("<span/>").attr("addr", i).attr("value", 0).attr("title", "00000000").text("    " + _dis);
                const oElem = $("<div/>").attr("_addr", i).append($("<div/>").text(i.toString(16).padStart(4, " ") + ":").append(iElem));
                domContainer.append(oElem);
                instrList.push(iElem);
            }
        };
        let previousElement = $("<div/>");
        let activeElement = $("<div/>");
        this.update = () => {
            for (const elem of instrList) {
                const addr = parseInt(elem.attr("addr") ?? "0", 10);
                const value = parseInt(elem.attr("value") ?? "0", 10);
                const ir = core.ram32.getUint32(addr, true);
                if (value !== ir) {
                    elem.attr("value", ir);
                    elem.attr("title", toHex(ir, 8));
                    elem.text("    " + disassemble(ir, addr, labelMap));
                }
            }
            previousElement.removeClass("previous");
            activeElement.removeClass("active");
            previousElement = $(`div[_addr='${core.pc_prev}']`);
            activeElement = $(`div[_addr='${core.pc}']`);
            previousElement.addClass("previous");
            activeElement.addClass("active");
        };
    }
    const core = new EduCoreVTiny();
    LayoutManager.addComponent(IoComponent, core);
    LayoutManager.addComponent(RamMemoryComponent, core);
    const disassembleComponent = LayoutManager.addComponent(DisassemblyComponent, core);
    const parent = LayoutManager.layout().root.contentItems[0]?.contentItems[0]?.contentItems[1] ?? LayoutManager.layout().root.contentItems[0];
    parent.addChild({
        title: "I/O View 1",
        type: 'component',
        isClosable: false,
        componentName: 'IoComponent'
    });
    parent.addChild({
        title: "I/O View 2",
        type: 'component',
        isClosable: false,
        componentName: 'IoComponent'
    });
    parent.addChild({
        title: "I/O View 3",
        type: 'component',
        isClosable: false,
        componentName: 'IoComponent'
    });
    parent.addChild({
        title: "Disassembly",
        type: 'component',
        isClosable: false,
        componentName: 'DisassemblyComponent'
    });
    parent.addChild({
        title: "RAM",
        type: 'component',
        isClosable: false,
        componentName: 'RamMemoryComponent'
    });
    const offsets = {
        ld: { x: 10, y: 230 },
        sw: { x: 10, y: 300 },
        bt: { x: 560, y: 30 },
        ss: { x: 150, y: 60 }
    };
    const inPortDef = (vioId, portId) => ({ jtagIndex: 0, xsdbIndex: vioId, portIndex: portId + 2, type: 'INPUT' });
    const outPortDef = (vioId, portId) => ({ jtagIndex: 0, xsdbIndex: vioId, portIndex: portId, type: 'OUTPUT' });
    const boardVioId = await IrqManager.xsdbIndexFromIdentifier(0, "BASYS3_BRD", 0);
    const coreVioId = await IrqManager.xsdbIndexFromIdentifier(0, "CORE_DEBUG", 0);
    const memVioId = await IrqManager.xsdbIndexFromIdentifier(0, "MEM_DEBUG", 0);
    const progVioId = await IrqManager.xsdbIndexFromIdentifier(0, "PROGRAMMER", 0);
    console.log("BASYS3_BRD", boardVioId);
    console.log("CORE_DEBUG", coreVioId);
    console.log("MEM_DEBUG", memVioId);
    console.log("PROGRAMMER", progVioId);
    const vioActive = new Modules.ToggleButton(30, 30, new PinIrq(outPortDef(boardVioId, 0), 0, "vioActive"));
	const leds = [];
	const switches = [];
    for (let i = 0; i < 16; i++) {
        const ld = new Modules.LED(offsets.ld.x + 50 * i, offsets.ld.y, new PinIrq(inPortDef(boardVioId, 0), 15 - i, "LD" + (15 - i)));
        const sw = new Modules.ToggleButton(offsets.sw.x + 50 * i, offsets.sw.y, new PinIrq(outPortDef(boardVioId, 2), 15 - i, "SW" + (15 - i)));
		leds.push(ld);
		switches.push(sw);
    }
    const seg1 = new Modules.SevenSegment(offsets.ss.x + 150, offsets.ss.y, new Irq(inPortDef(boardVioId, 1), "Seg1"));
    const seg2 = new Modules.SevenSegment(offsets.ss.x + 100, offsets.ss.y, new Irq(inPortDef(boardVioId, 2), "Seg2"));
    const seg3 = new Modules.SevenSegment(offsets.ss.x + 50, offsets.ss.y, new Irq(inPortDef(boardVioId, 3), "Seg3"));
    const seg4 = new Modules.SevenSegment(offsets.ss.x + 0, offsets.ss.y, new Irq(inPortDef(boardVioId, 4), "Seg4"));
    const btn0 = new Modules.Button(offsets.bt.x + 50, offsets.bt.y + 0, new PinIrq(outPortDef(boardVioId, 3), 0, ""), Key.ArrowUp);
    const btn4 = new Modules.Button(offsets.bt.x + 50, offsets.bt.y + 50, new PinIrq(outPortDef(boardVioId, 3), 4, ""), Key.Space);
    const btn2 = new Modules.Button(offsets.bt.x + 50, offsets.bt.y + 100, new PinIrq(outPortDef(boardVioId, 3), 2, ""), Key.ArrowDown);
    const btn0Txt = new Modules.TextBox(offsets.bt.x + 90, offsets.bt.y + 5, "100 Hz Clock");
    const btn4Txt = new Modules.TextBox(offsets.bt.x + 90, offsets.bt.y + 55, "Manual Clock");
    const btn2Txt = new Modules.TextBox(offsets.bt.x + 90, offsets.bt.y + 105, "  5 Hz Clock");
	
    const switchChangedProbe = new Irq(outPortDef(boardVioId, 2), "SW");
    const coreProbe0 = new Irq(inPortDef(coreVioId, 0));
    const coreProbe1 = new Irq(inPortDef(coreVioId, 1));
    const coreProbe2 = new Irq(inPortDef(coreVioId, 2));
    const coreProbe3 = new Irq(inPortDef(coreVioId, 3));
    const coreProbe4 = new Irq(inPortDef(coreVioId, 4));
    const coreProbe5 = new Irq(inPortDef(coreVioId, 5));
    const coreProbe6 = new Irq(inPortDef(coreVioId, 6));
    const coreProbe7 = new Irq(inPortDef(coreVioId, 7));
    coreProbe0.filtered = true;
    coreProbe1.filtered = true;
    coreProbe2.filtered = true;
    coreProbe3.filtered = true;
    coreProbe4.filtered = true;
    coreProbe5.filtered = true;
    coreProbe6.filtered = true;
    coreProbe7.filtered = true;
    const memProbe0 = new Irq(inPortDef(memVioId, 0));
    const memProbe1 = new Irq(inPortDef(memVioId, 1));
    const memProbe2 = new Irq(inPortDef(memVioId, 2));
    const memProbe3 = new Irq(inPortDef(memVioId, 3));
    memProbe0.filtered = true;
    memProbe1.filtered = true;
    memProbe2.filtered = true;
    memProbe3.filtered = true;
	
	const dummyObj = {
		register: function() {
			switchChangedProbe.registerNotify((port, old, value) => {
				core.ram[0x1f4] = value[0];
				core.ram[0x1f5] = value[1];
			});
			coreProbe0.registerNotify((port, old, value) => {
				core.ctrl_pc_src = (value[0] & 0x03) >>> 0;
				core.ctrl_rd_we = (value[0] & 0x04) >>> 2;
				core.ctrl_rd_src = (value[0] & 0x08) >>> 3;
				core.ctrl_mem_cmd = (value[0] & 0xF0) >>> 4;
				core.ctrl_alu_op = (value[1] & 0x7F) >>> 0;
				core.ctrl_branch = (value[1] & 0x80) >>> 7;
				core.ctrl_alu_src_2 = (value[2] & 0x03) >>> 0;
				core.ctrl_alu_src_1 = (value[2] & 0x0C) >>> 2;
				core.state = (value[2] & 0xF0) >>> 4;
			});
			coreProbe1.registerNotify((port, old, value) => { core.pc_prev = core.pc; core.pc = mergeBytes(value); });
			coreProbe2.registerNotify((port, old, value) => { core.ir = mergeBytes(value); });
			coreProbe3.registerNotify((port, old, value) => { core.rs1 = mergeBytes(value); });
			coreProbe4.registerNotify((port, old, value) => { core.rs2 = mergeBytes(value); });
			coreProbe5.registerNotify((port, old, value) => { core.rd = mergeBytes(value); });
			coreProbe6.registerNotify((port, old, value) => { core.ctrl_imm = mergeBytes(value); });
			coreProbe7.registerNotify((port, old, value) => { core.alu = mergeBytes(value); });
			memProbe0.registerNotify((port, old, value) => { core.mem_cmd = value[0]; });
			memProbe1.registerNotify((port, old, value) => { core.mem_addr = mergeBytes(value); });
			memProbe2.registerNotify((port, old, value) => { core.mem_rdata = mergeBytes(value); });
			memProbe3.registerNotify((port, old, value) => { core.mem_wdata = mergeBytes(value); });
		}
	};
	
    const progActive = new Irq(outPortDef(progVioId, 0));
    const progWriteEn = new Irq(outPortDef(progVioId, 1));
    const progAddr = new Irq(outPortDef(progVioId, 2));
    const progData = new Irq(outPortDef(progVioId, 3));
    progActive.value = [0];
    progWriteEn.value = [0];
    async function programBoard(bytes) {
        Logger.info("Layout", "Start uploading hex-file...");
        bytes = (bytes ?? []).concat((new Array(512)).fill(0)).slice(0, 512);
        await progActive.valueAsync([1]);
        await sleep(20);
        for (let i = 0; i < 512; i += 32) {
            await progAddr.valueAsync(splitBytes(i).reverse());
            await progData.valueAsync(bytes.slice(i, i + 32));
            await progWriteEn.valueAsync([1]);
            await progWriteEn.valueAsync([0]);
        }
        await progActive.valueAsync([0]);
        Logger.info("Layout", "Upload done!");
    }
    const uploadButton = $(`<input id="hexFileUpload" type="file" accept='.hex'/>`);
    const uploadLabel = $(`<label for="hexFileUpload" class="module">Upload Hex-File</label>`);
    uploadButton.css({
        "display": "none"
    });
    uploadLabel.css({
        "top": 80 + "px",
        "left": 430 + "px",
        "height": "32px",
        "border-radius": "5px",
        "border": "1px solid black",
        "font-size": "16px",
        "padding": "3px 6px",
        "cursor": "pointer",
    });
    uploadButton.on("change", async function () {
        const files = [...this.files];
        const fileContent = await new Promise(resolve => {
            const reader = new FileReader();
            reader.onload = () => resolve(reader.result);
            reader.readAsText(files[0]);
        });
        this.value = null;
        const hexFile = fileContent.split("\n#\n")[0];
        const mapFile = fileContent.split("\n#\n")[1];
        const bytes = hexFile.split("\n")
            .filter(line => line !== "")
            .map(line => line.match(/..?/g)?.map(x => parseInt(x, 16)))
            .reduce((a, v) => [...a, ...v], []);
        await programBoard(bytes);
        const bytes2 = (bytes ?? []).concat((new Array(512)).fill(0)).slice(0, 512);
        for (let i = 0; i < 512; i++) {
            core.ram[i] = bytes2[i];
        }
        disassembleComponent.setContent(mapFile);
    });
    LayoutManager.modulesComponent().append(uploadButton);
    LayoutManager.modulesComponent().append(uploadLabel);
    let intervalId = -1;
    LayoutManager.layoutResetCallback = () => {
        if (intervalId !== -1)
            clearInterval(intervalId);
    };
    intervalId = setInterval(() => {
        if (core.state === 1 && core.ctrl_rd_we === 1 && core.rd_addr() !== 0) {
            core.reg[core.rd_addr()] = core.rd;
        }
        if (core.state === 5) {
            if (core.ctrl_mem_cmd === 1) {
                core.ram[core.mem_addr + 0] = (core.mem_wdata >>> 0) & 0xFF;
            }
            if (core.ctrl_mem_cmd === 2) {
                core.ram[core.mem_addr + 0] = (core.mem_wdata >>> 0) & 0xFF;
                core.ram[core.mem_addr + 1] = (core.mem_wdata >>> 8) & 0xFF;
            }
            if (core.ctrl_mem_cmd === 3) {
                core.ram[core.mem_addr + 0] = (core.mem_wdata >>> 0) & 0xFF;
                core.ram[core.mem_addr + 1] = (core.mem_wdata >>> 8) & 0xFF;
                core.ram[core.mem_addr + 2] = (core.mem_wdata >>> 16) & 0xFF;
                core.ram[core.mem_addr + 3] = (core.mem_wdata >>> 24) & 0xFF;
            }
        }
        LayoutManager.update();
    }, 50);
    // IrqManager.requestOutputState();
	return [vioActive, seg1, seg2, seg3, seg4, btn0, btn2, btn4, ...leds, ...switches, dummyObj];
}());
