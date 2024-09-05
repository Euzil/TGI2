# TGI [\>\>](marginnote3app://note/3D58CD9C-A830-4DFE-ACC4-A4E5B9ACCDA8)

## 开关函数 Schaltalgebra und Schaltfunktionen \>\>

### 运算定律及运算性质 \>\>

![](media/19caa647d78551e2aaf4dbebf2d35aad.png)  
  
![](media/21085f660dba9ff1dfb9e9e4723bec33.png)

### 真值表 \>\>

![](media/1dc07c44463d6e1663f9f974d63c1f8f.png)

### 开关函数 \>\>

![](media/906905c2a194ce7a6a99b7e760c82850.png)  
  
![](media/1d4adb07365827bdc3f96d3010b956de.png)  
  
![](media/715d697bb8f56406f93162e229ee74c2.png)

### 布尔范式 Boolesche Normalformen \>\>

• Es gibt mehr Boolesche Ausdrücke als Funktionen. Unter anderem zu Vergleichszwecken drängt sich deshalb eine Normalform auf. • Jeder Zeile der Wahrheitstafel kann ein Minterm zugeordnet werden. Dieser entsteht durch UND-Verknüpfung der zugehörigen Schaltvariablen, die im Falle einer 0 negiert und für eine 1 nichtnegiert übernommen werden 真值表的每个行都是一个Minterm • Jeder Minterm erzwingt für ‚seine‘ Zeile eine 1, für alle anderen Zeilen ist er 0 每个Minterm的结果不是1就是0 • Die ODER-Verknüpfung (Disjunktion) der Minterme für den Funktionswert 1 liefert dann eine eindeutige Darstellung der Schaltfunktion, die disjunktive kanonische Normalform (DKN)

#### DNF 析取范式 \>\>

DKN 标准析取范式 Disjunktive kanonische Normalform (DKN) – Disjunktion von Mintermen ⇒ Ein Term kann ganze Funktion auf „1“ setzen 把Minterm中所有取1的拿出用且的关系连接 – Minterme sind daran erkennbar, dass sie alle Schaltvariablen der Schaltfunktion entweder negiert oder nichtnegiert enthalten. – Jede beliebige Schaltfunktion ist somit als DKN und damit mittels Schaltalgebra unter Verwendung der Operatoren UND, ODER, NICHT darstellbar. Diese Operatoren sind damit eine vollständige Verknüpfungsbasis (Junktorensystem) 并通过将所有的Minterm用和的关系连接  
• Disjunktive Normalform (DNF) – Ist nicht kanonisch, da sie nicht nur aus Mintermen besteht (nicht jeder Teilterm enthält jedes Literal)! – Es gibt keine eindeutige Normierung mehr 将DKN化简  
  
![](media/e6092249dc04f46b46c99be0ba9d2aa8.png)

##### Minimierung \>\>

Minimierungsverfahren • Angelpunkt zur Reduktion komplexer Funktionen in DNF ist folgende Beziehung 𝑝∗𝑥+𝑝∗𝑥=𝑝∗ 𝑥+𝑥 =𝑝∗1=𝑝 𝑝:beliebigerkonjunktiverTeilterm • Unterscheiden sich zwei Terme nur dadurch, dass eine Variable in dem einen Term nicht negiert und dem anderen Term negiert vorkommt, können beide zu einem Term verschmolzen werden, der nur die identischen Variablen enthält (Verschmelzungsgesetz).

##### DMF 析取最小范式 \>\>

• Definition – Ein Term 𝑇 = x1\*x2\*x3\*x4….. mit 𝑑K ∈ {0,1,2} einer Funktion in disjunktiver Normalform (DNF) heißt Primimplikant, wenn in der DNF kein Term 𝑇’ existiert, der sich gemäß 蕴含项 𝑝∗𝑥+𝑝∗𝑥=𝑝∗ 𝑥+𝑥 =𝑝∗1=𝑝 aus 𝑇 zu einem einfacheren Term zusammenfassen lässt. – Eine DNF 𝐴 heißt disjunktive Minimalform (DMF) bzgl. einer Längendefinition 𝐿, wenn es für die durch 𝐴 dargestellteFunktionkeineDNF𝐴’gibt,diebzgl.𝐿kürzerist,d.h.wennkeinA’existiertmit𝐿𝐴’ \<𝐿(𝐴). • Satz – Gegeben sei eine Längendefinition, bei der die Länge eines Ausdrucks nicht steigt, wenn eine Variable gestrichen wird. Dann existiert zu jeder Schaltfunktion wenigstens eine DMF, die eine Disjunktion von Primimplikanten ist. – Bemerkung: Für 𝐿H und 𝐿I erfüllt

#### KNF 合取范式 \>\>

Maxterme entstehen (analog zu Mintermen) durch ODER-Verknüpfung der zugehörigen Schaltvariablen (nicht negiert für 0, negiert für 1). 将每个行为0的拿出用合连接 Jeder Maxterm kann für genau eine Zeile eine Null erzwingen Für alle anderen Zeilen außer seiner eigenen ist er Eins Die UND-Verknüpfung (Konjunktion) der Maxterme für den Funktionswert 0 liefert dann eine eindeutige Darstellung der Schaltfunktion, die konjunktive kanonische Normalform (KKN). 将各个Maxterm用且连接  
  
![](media/920a318c765a043242e0cc9cf9be460e.png)

##### Minimierung \>\>

• Nach dem Dualitätsprinzip können ganz entsprechend wie für die DNF auch Funktionen in KNF minimiert werden. Das Verschmelzungsgesetz lautet dann (𝑝+𝑥) ∗ (𝑝+𝑥) =𝑝+ (𝑥∗𝑥) =𝑝+0=𝑝 𝑝:beliebigerdisjunktiverTeilterm • Systematische Minimierungsverfahren – Minimierung durch Umformung per Hand sehr aufwendig und mühsam! – Daher sind systematische Minimierungsverfahren entwickelt worden (z. B. KV-Diagramme, Quine- McCluskey), die garantiert eine Minimalform finden. – Heute in der Regel in Tools zum Schaltungsentwurf integriert. – Hier nur Minimierung von DKN mit bis zu bis vier Variablen mit Hilfe von KV-Diagrammen Vertiefung und Erweiterung =\> siehe TGI 2

#### Minimierung \>\>

Optimierungskriterien – Minimale Anzahl von Variablen 𝐿H(𝐴) in einem Ausdruck 𝐴 (entspricht der Anzahl der Eingänge der UND- Gatter der ersten Stufe bzw. einzelner Eingänge des ODER-Gatters). 𝐿H(𝐴)是接口数 – 𝐿I 𝐴 = 𝐿H 𝐴 + Zahl disjunktiv verknüpfter Terme mit mehr als einer Variablen (entspricht der Gesamtzahl der Gattereingänge).

##### KV图化简 \>\>

I. 生成KV图 Darstellung einer Schaltfunktion als KV- Diagramm – Einteilung eines Rechtecks in 2N Felder, die den Mintermen der Schaltfunktion entsprechen. – Benachbarte Felder unterscheiden sich genau um eine Variable (möglich bis zu 6 Variablen, ab 5 aber bereits recht unübersichtlich.   
  
![](media/66f1c897d5392ad08c05c62b2161895d.png)  
II. 找到Minterm Eintragung der zur DKN gehörigen Minterme  
  
![](media/4d2f0c10eae25c0c289ad5c3b8bfb783.png)  
III.运用结合律化简 Verschmelzung benachbarter Minterme 1. Die Variable, um die sich die Felder unterscheiden, fällt weg. 2. Die benachbarten Minterme reduzieren sich auf einen Term mit den verbleibenden gemeinsamen Variablen. 3. Verallgemeinerung auf 2\^k benachbarte „1“ Felder mit 𝑖 = 1, 2, 3, ... Es fallen dann jeweils 𝑖 Variablen weg.  
IV.KV图化简 Minimierung mit KV-Diagrammen – Primimplikanten Durch Zusammenfassen von Mintermen zu möglichst großen Feldern der Größe 2K erhält man die Primimplikanten der Funktion. 素蕴涵项:这些项有重叠，去掉其中一个仍然成立，表示的是不同的形式或是不同的可能 – Wesentliche (Kern-) Primimplikanten Diejenigen Felder, die als einzige einen Minterm überdecken, entsprechen den wesentlichen oder Kern-Primimplikanten und müssen in die DMF aufgenommen werden. 质蕴涵项:这些项是唯一的，去掉其中的会使式子不完备 – Minimale Restüberdeckung Die noch nicht abgedeckten Minterme müssen mit einer minimalen Anzahl der verbleibenden (nicht wesentlichen) Primimplikanten überdeckt werden (i. Allg. nicht eindeutig!).   
  
![](media/06436e776b8de0f25ba340404967597d.png)

###### 更多的变量 \>\>

![](media/fb936becb061692fa53acf0c8d8afbec.png)

###### KMF的化简 \>\>

![](media/09f9cb4ea21a2e083cedfdb227315846.png)  
  
![](media/7cf15d2dd0629bf98a3108f664e7566d.png)

###### 不完全定义的函数 \>\>

Partiell definierte Schaltfunktionen – Für einige Variablenbelegungen ist der Funktionswert nicht definiert (bzw. beliebig 0 oder 1, “don’t care“)   
  
![](media/c9471b78ac5d05f03443279e2010dc9c.png)  
 – Im Falle der DMF werden sie so mit dem Wert „1“ belegt, dass möglichst große „1“-Felder entstehen

###### 卡诺图 \>\>

![](media/3fcd4ccf2e3f65a91501c41f066c1030.png)  
  
![](media/04b390673ebc6519c79ce73bd87d93c3.png)  
  
![](media/c34780b1cb4d71584d120879b755a01b.png)

##### MC奎因化简 \>\>

Schritt 1: Bilden der DKN 生成DKN  
  
![](media/ef5306572ce22f6ea99d46d588762671.png)  
Schritt II: Ermitteln der Primimplikanten 得到素蕴涵项 • Einteilen der Minterme in Klassen 𝐾' mit 𝑖 nichtnegierten Variablen – Binärdarstellung, 1 entspricht 𝑥, 0 entspricht 𝑥, „-“ steht für herausgefallene Variable – Beispiele: 1101 entspricht 𝑎𝑏𝑐𝑑, 0-01 entspricht 𝑎 𝑐𝑑   
  
![](media/0537d9c36ea16149a952cdb6ec8ff5af.png)  
Schritt III: Wesentliche Primimplikanten 得到质蕴涵项 • Aufstellen der Primimplikantentafel – Listet die Minterme (Nummern in den Spalten) auf, die der jeweilige Primimplikant 𝑃! abdeckt; diejenigen Minterme, aus denen 𝑃! durch Verschmelzung entstanden ist.  
  
![](media/0f66c733b3f138fd33b01ca4f7b8cb4a.png)  
Schritt IV: Minimale Restüberdeckung 剩余部分最小化 • Wesentliche Primimplikanten (hier P1, P4) decken i. A. nur einen Teilbereich ab (farbig markiert). • Rest wird durch minimale Anzahl unwesentlicher Primimplikanten abgedeckt – i. A. nicht eindeutig! – Hier vier Möglichkeiten für gleichwertige Lösungen: (P2 oder P3) und (P5 oder P6) • Minimierte Schaltfunktion (DMF) – Disjunktion aus wesentlichen Primimplikanten und den unwesentlichen Primimplikanten aus einer minimalen Restüberdeckung  
  
![](media/118ac76ef292456feb41b5d8a6188e29.png)

###### 奎因麦克拉斯算法 \>\>

![](media/6c1bbab9b56bb4be767d3a1b54b13ed1.png)  
  
![](media/ffa847d3d1c66dc8b51223781fb25762.png)  
  
![](media/49b853e112e95958408c613609c67a3e.png)

## 组合逻辑电路 Schaltnetz \>\>

Realisierung z. B. mittels Gattern (z. B. UND, ODER, NEGATION) oder PLDs. 由与，或，非等逻辑门电路组成  
 Combinational logic, kein Gedächtnis. Die Ausgangsgrößen hängen nur von den Eingangsvariablen ab. 组合逻辑是无记忆数字逻辑电路，其任何时刻的输出仅取决于其输入的组合。  
  
![](media/6036e319616800ec7b15f41d07883a54.png)

## CPU [\>\>](marginnote3app://note/1A48D1F0-FEB5-4EF4-ACAC-0EC2B0FA4AC2)

![](media/fd86e22a788020d45e2f7566db4538b3.png)  
  
![](media/6e90d613bd9ad9f351c3e9d32ea4d805.png)  
  
![](media/5feba5bedf6bd9c30b848d28111a109a.png)  
  
![](media/b11042b1e1cc9e0016de421c605016ac.png)  
ABlauf der Maschinenbefehle  
  
![](media/04a084ba4c9a29c9181757d139caf196.png)  
  
![](media/ef0a5c752e871d0d96dde52105e45781.png)  
  
![](media/03be43b5060cfa9c7980ea2faeb4d7a9.png)  
  
![](media/d563d6462fa1733276a3782f212cc58a.png)

### Moore-Timing [\>\>](marginnote3app://note/FD08E065-B62D-4762-8AD9-BB467899352D)

![](media/e7e80c68d6f6e329e91637f40b91102f.png)  
  
![](media/4838c65e4d495a2c523e74c7b1ce8c36.png)  
  
![](media/017cbfec831a294cd1eff72ed8ba6195.png)

### Mealy-Timing [\>\>](marginnote3app://note/341CA00C-BAD2-44BF-BAF4-29E230ED5614)

![](media/bd6c4525af5ebaaa3d2af503b8bc337d.png)  
  
![](media/b139b0defdd34589f4abead8451f3285.png)  
  
![](media/cab12d52d75487a88a84a4257816ee31.png)

## 时序逻辑电路 Schaltwerk \>\>

Schaltungen mit inneren Zuständen, die ebenfalls die Ausgangsfunktionen beeinflussen. 由储存电路和组合逻辑电路组成。其在任何一个时刻的输出状态由当时的输入信号和电路原来的状态共同决定，而他的状态主要由储存电路来记忆和表示的。  
  
![](media/fddd1e0926ce492661587b060db46b6f.png)  
  
![](media/fad932f43e94fff47009a6dddc95bdaf.png)

### 同步与异步时序电路 \>\>

Synchrone Schaltwerke Takt sorgt für sequentielle Arbeitsweise (neuen Zustand übernehmen und für die nächste Taktperiode speichern). 同步时序电路中所有存储器件都在时钟脉冲CP的统一控制下，用触发器作为存储器件。几乎现在所有的时序逻辑都是“同步逻辑”：有一个“时钟”信号，所有的内部内存（'内部状态'）只会在时钟的边沿时候改变。在时序逻辑中最基本的储存器件是触发器。 同步逻辑最主要的优点是它很简单。每一个电路里的运算必须要在时钟的两个脉冲之间固定的间隔内完成，称为一个 '时钟周期'。只有在这个条件满足下（不考虑其他的某些细节），电路才能保证是可靠的。 Asynchrone Schaltwerke Zustandsänderung bei Änderung der Eingangsbelegung (abhängig von Laufzeiten) 异步时序逻辑是循序逻辑的普遍本质，但是由于它的弹性关系，他也是设计上困难度最高的。最基本的储存器件是锁存器。锁存器可以在任何时间改变它的状态，依照其他的锁存器信号的变动，他们新的状态就会被产生出来。异步电路的复杂度随着逻辑门的增加，而复杂性也快速的增加，因此他们大部分仅仅使用在小的应用。然而，电脑辅助设计工具渐渐的可以简化这些工作，允许更复杂的设计。

### 状态机 \>\>

状态图  
  
![](media/097735cf98593761954b9015039beaea.png)  
状态表  
  
![](media/1b66f36fa71b8bcdc7a07ac725d8bc66.png)  
VHDL模拟图  
  
![](media/6792335a163a868acb8d79cc8abc257a.png)

#### 摩尔型状态机 \>\>

输出只跟内部的状态有关。（因为内部的状态只会在时脉触发边缘的时候改变，输出的值只会在时脉边缘有改变） 摩尔型有限状态机的输出只与有限状态自动机的当前状态有关，与输入信号的当前值无关。摩尔型有限状态机在时钟脉冲的有效边沿后的有限个门延后，输出达到稳定值。即使在一个时钟周期内输入信号发生变化，输出也会在一个完整的时钟周期内保持稳定值而不变。输入对输出的影响要到下一个时钟周期才能反映出来。摩尔型有限状态机最重要的特点就是将输入与输出信号隔离开来。  
  
![](media/845a030254cc2c76ce8acbab7eb31df0.png)  
代码  
状态图例  
  
![](media/14d01e4bc39e760198536952c8ae67a3.png)  
实体  
  
![](media/f7f80dfc3a471cb997d6fa4973ad495a.png)  
提纲部分  
  
![](media/d37284906af9d41479ff66eb4148efde.png)  
状态储存器和输出逻辑部分  
  
![](media/6c256753872ae72571ffac0e14457122.png)  
状态逻辑部分  
  
![](media/cd61d16f312e7f802ae546c3c2c16009.png)  
  
![](media/778ef86679cf02fc27891e3464651a81.png)

#### 米利型状态机 \>\>

输出不只跟目前内部状态有关，也跟现在的输入有关系。 Mealy有限状态机的输出不单与当前状态有关，而且与输入信号的当前值有关。Mealy有限状态机的输出直接受输入信号的当前值影响，而输入信号可能在一个时钟周期内任意时刻变化，这使得Mealy有限状态机对输入的响应发生在当前时钟周期  
  
![](media/3fcd1631a0958db74592bd97f498795f.png)  
  
![](media/f193f16e0a2ff023948f50892158ab73.png)  
代码  
状态图例  
  
![](media/9faa6e379d193b2f8f66598c3b98cf8e.png)  
实体部分  
  
![](media/424e1ccdb1ac97ada70da879e60dd94a.png)  
提纲部分  
  
![](media/aa4816ab62423de7c270bf25aaf01d82.png)  
状态储存器  
  
![](media/071e75e9a441a20b6a4479971aeb065d.png)  
状态逻辑部分  
  
![](media/4179692b61f9a71420e4a25925ff0b8b.png)  
输出逻辑部分  
  
![](media/e5beff7e85c1c379071a6a3a20f96b5c.png)  
  
![](media/374931c56c6d0dfd9d14ea2666aa60be.png)

### 触发器 \>\>

触发器是一种具有记忆能力、构成时序逻辑的基本单元电路。一个触发器能“存储”一位二进制数字信息：“0”或“1”。该电路可以通过一个或多个施加在控制输入端的信号来改变自身的状态，并会有1个或2个输出。  
一个触发器有两个稳定状态： 1 “0”状态：Q＝0，＝1； 2 “1”状态：Q＝1，＝0。  
触发器（FF）应具有以下功能： 1 在新数据输入之前（无触发信号）时，触发器一直保持原来的状态（原数据）不变。 2 输入信号触发下，它能从一种状态转换为另一种状态。即：FF能够“接收”“保持”并“输出”数字信息。  
触发器（FF）的分类： 1 从功能分： 1 RS触发器（置0、置1触发器） 2 JK触发器（多功能触发器） 3 D触发器（延迟触发器） 4 T触发器（翻转触发器） 2 从结构分： 1 基本RS触发器 2 同步触发器（时钟CP-FF） 3 主从触发器 4 维持-阻塞触发器（WZ-FF） 5 CMOS边沿触发器 3 从触发方式分： 1 电位触发： 1 高电位触发 2 低电位触发 2 边沿触发： 1 上升沿触发 2 下降沿触发  
  
![](media/ff6f75e2987a79d7f0319a05ee2c891c.png)

#### RS-触发器 \>\>

![](media/3ad709109efba2d13d18e093c4389a8d.png)  
  
![](media/29305d07bf17b577c030812ec632207e.png)  
  
![](media/c7347f4f9a0ba458bdc4165c455343a4.png)  
  
![](media/b2d22fbb0a4714897a841efc53805dd2.png)  
当R与S皆为低电位，回授会让Q与Q（Q的反相）保持于一个固定的状态。 当S（Set）为高电位，R（Reset）为低电位时，输出Q会被强制设置为高电位；相反的，当S为低电位，R为高电位时，输出Q会被强制设置为低电位。  
RS-触发器的时钟控制 Eingangsbeschaltung des asynchronen RS-Flipflops mit zwei UND-Gattern. Nur bei Takt C = 1 kann das Flipflop Eingangsinformation übernehmen, bei C = 0 wird der aktuelle Wert gehalten. Wird im Englischen auch als ‚Latch‘ (‚Klinke‘) bezeichnet.  
  
![](media/758eb09c53efadf3770b2d79d426d2ef.png)  
  
![](media/cd5f5b6f651b94d42ce6d757af3620f5.png)  
Serielle Schaltung aus zwei RS-Flipflops (Zweizustandssteuerung) – C = 1: Master wird gesetzt, Slave hält alten Wert – C = 0: Slave übernimmt neuen Wert, Master ist deaktiviert. Die RS-Signale sollten sich nur während der Halbperiode C = 0 ändern und während C = 1 stabil bleiben, da sonst falsche Werte übernommen werden können!

#### D-触发器 \>\>

• Nur ein Dateneingang D und ein Takteingang C • Werte am Eingang D zum Zeitpunkt n werden zum Zeitpunkt n+1 am Ausgang Q sichtbar, d. h. mit einer Verzögerung (Delay) von einem Takt  
触发器 在clk正跳沿前接收输入信号 在clk正跳沿是触发翻转 在clk正跳沿后输入被封锁  
  
![](media/8abd11cd9a3706d56e66f6b431a31e18.png)  
  
![](media/1ac639c92f9d12105ee8d07dd3aa8a64.png)  
  
![](media/339274064738c60ce9d187d71c364580.png)  
D-触发器的时钟控制  
  
![](media/5e4b5fa36a09211a2e9e15e57accb0a3.png)

#### JK-触发器 \>\>

JK触发器和触发器中最基本的RS触发器结构相似，其区别在于，RS触发器不允许R与S同时为1，而JK触发器允许J与K同时为1。当J与K同时变为1的同时，输出的值状态会反转。也就是说，原来是0的话，变成1；原来是1的话，变成0。  
  
![](media/219e3956da9d3c9b235f927a10539781.png)  
Vermeidet gleichzeitiges R = 1, S = 1 durch vorgeschaltete UND-Gatter. Achtung: Master kann während der Halbperiode C = 1 seinen Zustand aufgrund der Verriegelung nur einmal ändern Regel: Die JK-Signale sollten sich nur während der Halbperiode C = 0 ändern und während C = 1 stabil bleiben! Zweizustandssteuerung – C = 1: Immer nur ein Eingang ist wirksam, der andere gesperrt: FürQ=0istJoffenundKgesperrt. FürQ=1istKoffenundJgesperrt. – C = 0: Beide Eingänge gesperrt, Zustand wird vom Master in Slave übernommen.  
  
![](media/bbbcae7abe1c5bab6cd6efddadecd340.png)

#### T-触发器 \>\>

T触发器（Toggle Flip-Flop，or Trigger Flip-Flop）设有一个输入和输出，当时脉由0转为1时，如果T和Q不相同时，其输出值会是1。输入端T为1的时候，输出端的状态Q发生反转；输入端T为0的时候，输出端的状态Q保持不变。把JK触发器的J和K输入点连接在一起，即构成一个T触发器。  
  
![](media/59f3219b00a78eff10505a3e4c621b05.png)  
• Falls beim JK-(MS)-Flipflop E = J = K = 1 und ein zusätzlicher Takt angelegt wird, ergibt sich ein Wechselflipflop. • Varianten mit Zweiflankensteuerung ebenfalls gebräuchlich.  
  
![](media/ec0df3d270cc09261a20e40d1ddcb386.png)

### 时间脉冲控制 Taktsteuerung \>\>

• Zusätzlicher Takteingang C (Clock), der den Zeitpunkt des Umschaltens des Flipflops bestimmt (synchrone Arbeitsweise) 在同步电路中，Takt扮演计时器的角色，只有同步信号到达的时候，子昂管的触发器才会按输入信号改变状态  
• Zustandssteuerung – Am Eingang anliegende Information wird während der gesamten Dauer des Taktimpulses C übernommen (und wirkt am Ausgang) 状态控制   
  
![](media/58889be12a2eb92446417d595ccfc028.png)  
• Einflankensteuerung – Eingangsinformation wird mit aktiver (positiver oder negativer) Taktflanke von C übernommen. Anschließende Änderungen während der Impulsdauer des Taktes wirken sich nicht mehr am Ausgang aus 边缘控制  
  
![](media/251ebffd769c4f226c290a907a7e7415.png)  
 • 创建时间（setup time）是指数据在被采样时钟边沿采样到之前，需保持稳定的最小时间。 也就是时钟信号边沿到来前，数据稳定不变的时间，时间不够，数据不能被稳定打入触发器 • 维持时间（hold time）是指数据在被采样时钟边沿采样到之后，需保持稳定的最小时间。 也就是时钟信号边沿到来之后，数据保持不变的时间，时间不够，数据不能稳定打入触发器  
没有时钟脉冲时，输入信号有一个传播时延(propagation dalay) 时延的差别导致会有短暂的不希望出现的信号，也就是空翻现象(race condition)  
  
![](media/bed8c8db3842862c4c06ddb677b8b7cf.png)

### 执行单元 \>\>

![](media/6780618042c6fb25d466c7b45ca1ead1.png)

#### ALU [\>\>](marginnote3app://note/B8164E17-E1C7-4BA8-8B0A-1368D8982288)

![](media/88d2135b0ad61907660d3d8734d1efb0.png)  
  
![](media/8f591bf5f58790625bafc77c2b18df26.png)  
  
![](media/312e7b64537e66b13a23489f8d2effe9.png)  
简单运算 大部分ALU都可以完成以下运算∶ 整数算术运算 位逻辑运算（与、或、非、异或） 移位运算（将一个字向左或向右移位或浮动特定位，而无符号延伸），移位可被认为是乘以2或除以2。 复杂运算 工程师可设计能完成任何运算的ALU，不论运算有多复杂；问题在于运算越复杂，ALU成本越高，在处理器中占用的空间越大，消耗的电能越多。

#### 寄存器 [\>\>](marginnote3app://note/F064A782-E948-402E-816F-AC51D61D2E10)

• Operanden stehen in Registern A und B, Ergebnis in Register D. 运算子在寄存器中A,B中保存，结果在D中保存  
  
![](media/edecf9241d4941e43da1670a79dcba00.png)  
  
![](media/988a8566759c2199297c6a91fdf443b5.png)  
  
![](media/d35ec2ae57208436b4a2e31fd3c41967.png)

#### 标志 Flags [\>\>](marginnote3app://note/A57CE71B-B8B0-489C-A99B-E35A0C6956B9)

• Flags (z. B. Carry, Overflow, Zero, Negative) werden als sog. Kriterien ausgegeben. 标志（Flag）用于反映指令执行结果或控制指令执行形式。 许多指令执行之后将影响有关的状态标志位；不少指令的执行要利用某些标志；当然，也有很多指令与标志无关。 状态标志有6个，处理器主要使用其中5个构成各种条件，分支指令判断这些条件实现程序分支。 它们从低位到高位是： 进位标志CF（Carry Flag） 奇偶标志PF（Parity Flag） 调整标志AF（Adjust Flag） 零标志ZF（Zero Flag） 符号标志SF（Sign Flag） 溢出标志OF（Overflow Flag） 控制标志 控制标志用于控制处理器执行指令的方式，可由程序根据需要用相关指令设置。 8086的控制标志有3个： 方向标志DF（Direction Flag），仅用于串操作指令中，控制地址的变化方向； 中断允许标志IF（Interrupt-enable Flag）或简称中断标志，用于控制外部可屏蔽中断是否可以被处理器响应； 陷阱标志TF（Trap Flag），也常称为单步标志，用于控制处理器是否进入单步操作方式。  
  
![](media/e8d39b43cc33e087f4c05f648c26e299.png)

#### 控制信号 OP [\>\>](marginnote3app://note/BB6D1AE6-10C5-42F5-BED3-59E17619DE33)

• Operation op wird über Kontrollsignale OP ausgewählt. 运算方式通过控制信号OP选择执行什么操作

## 寄存器 Registertransfer \>\>

Geordnete Menge von Speicherelementen (oft 8, 16, 32 oder 64 Bit) 寄存器的功能是存储二进制代码，是由具有储存功能的触发器组成，一个触发器可以储存一位二进制代码，存放n位二进制代码，需n个触发器 Register dienen in der Regel der (schnellen) Zwischenspeicherung von Daten, nicht deren längerfristigen Aufbewahrung wie Speicherwerke • Registertransfer-Ebene ist beim Rechnerentwurf wichtige Betrachtungsebene oberhalb der Gatterebene 寄存器传输表示法 Register dienen in der Regel der (schnellen) Zwischenspeicherung von Daten, nicht deren längerfristigen Aufbewahrung wie Speicherwerke 用于数据的中间储存，不能用于长时间储存  
  
![](media/4edba91049c968eb76f96d1f50b9efef.png)  
• Wert rechts wird im nächsten Takt in das Register links vom Pfeil transferiert. • Die Werte rechts bleiben dabei erhalten, das Register links wird überschrieben. • Vergleich – Wertzuweisung in höheren Programmiersprachen! • Abstrahiert von der konkreten Implementierung der Register.

### 寄存器的运算 Operationen \>\>

![](media/d04d9a8d8928d77e97c066fc920758df.png)

### 移位寄存器 Schieberegister \>\>

![](media/be998a63c5da049f579bba008b5e081b.png)  
  
![](media/f009fc632337b392104f74db13c871b8.png)  
Bei jedem Takt wird der Registerinhalt um eine Position nach rechts bzw. nach links weitergeschoben. 每个时钟将寄存器的内容向左或右依次移动一个位置 Beim normalen Shift wird eine 0 von links bzw. rechts nachgezogen, beim Ringshift das am weitesten rechts bzw. links liegende Bit 一般移位，会在最左边或最右边补0, 循环移位，会将移出寄存器的再移到另一边  
  
![](media/ebeb908501548d06493cdcbcacd8b608.png)  
平行输入输出  
  
![](media/5b108982f90edbacf892ed20aa29da83.png)

### 计数寄存器 Zähler \>\>

Registertransfer: A =A + 1   
  
![](media/6dbc166cfc1bab491eb2f01b8a768a03.png)  
  
![](media/c69dad014485f8034cee51ea3ba71864.png)  
四位触发器可以保存16个数 八位寄存器可以保存256个数 十六位寄存器可以保存65535个数  
异步计数器  
  
![](media/90c571680ab1394305c4fe12f0a16b2f.png)  
• Kein gemeinsamer Takt, sondern Takteingang jeweils mit Q-Ausgang der vorangehenden Stufe verbunden (daher ‚asynchron‘). • Kaskadierung für größere n über RCO-Ausgang möglich. • Viele weitere Varianten von Zählern, z.B. mit Reset- und Preset-Eingängen, BCD (Binary Coded Decimals)-Zähler (mod 10), verschiedene Codes etc.  
同步二进制浮点计数器 Synchroner BCD-Zähler • Zählt im BCD (Binary Coded Decimal)-Code, d. h. wie Dualzähler, aber mod. 10 最大到10, 因此可以计十进制的数  
  
![](media/5a2da8c4844457afe0e763e0331333d1.png)  
  
![](media/51a8764cecc6a9b52be63944620ee5be.png)  
  
![](media/8a39ebf647288f937f36ff84c277e62a.png)

### 多个寄存器的运算 Operationen mit zwei oder mehr Registern \>\>

![](media/733e11c6c5cb8b1300fc2eee61a8c7f4.png)  
  
![](media/776da9e7170d0b5e2b6e213e0b380fff.png)  
  
![](media/955f3858113d798930ab8ecbfde7230f.png)  
平行加法器  
  
![](media/7c63b83dc9089eef4103253a45cab92d.png)  
• Inhalt von Register A wird durch die Summe der Inhalte von Register A und B ersetzt, der von Register B bleibt erhalten. 寄存器A中的数和寄存器B中的数 • Addition findet in einem Takt statt. 在一个时钟内完成加法部分 • Realisierung z. B. als Addierer mit durchlaufendem Übertrag (Ripple-Carry) oder anderes Addierer-Schaltnetz. • 2 Register Variante Summe wird in Register A abgelegt, B bleibt erhalten 结果还会保存在寄存器A中 • 3 Register Variante Summe wird in Register D abgelegt, A und B bleiben erhalten.结果保存在新的寄存器D中

### 寄存器传输层 [\>\>](marginnote3app://note/739D66DD-C6CF-460D-9110-FAEA77DF6E16)

#### 实例 乘法计算器 [\>\>](marginnote3app://note/F2694D86-5EAC-4387-A244-A18F3BFAB813)

表达数字  
  
![](media/74dbd15a33f0fd4f23e3a9c9e6969de6.png)  
执行乘法  
  
![](media/98d37a240abe78ed1c83dcf8e2990295.png)  
流程图   
  
![](media/80749b2e91ac36581d98dc506c0c8ef8.png)  
硬件语言描述  
  
![](media/c28cc12394b6c5557cba4f2ed2792445.png)  
关于时钟问题 1,Anweisungen, die mit Komma getrennt sind, werden parallel ausgeführt. Busse werden wie Register behandelt. Schreiben und Lesen im gleichen Taktzyklus möglich. 用逗号隔开的将会并行进行，BUS的对于寄存器的操作将在同一个时间段内进行。 2, Else-Zweig kann hier auch wegfallen, da Addition von 0. Es wird dann ein Leertakt ausgeführt (Optimierungspotential!) 加0的选项可以用空时钟执行 3, Rechtsshift und Test können im gleichen Takt ausgeführt werden, da unabhängig. Daher Trennung durch Komma. Bei Semikolon würde der Test einen eigenen Takt brauchen. 移位可以用在一个时钟内完成移位和测试   
  
![](media/758747ecf9bb6325682cb1c3688cdcc1.png)  
  
![](media/b339ddd4adccb6536435059c66ff0626.png)  
• INBUS und OUTBUS dienen zur Ein- bzw. Ausgabe 两条总线把数据输入输出进去 • START-Signal startet Multiplikation • DONE-Signal meldet Ende START和DONE信号在控制单元 • Akkumulator A und Multiplikator-Register Q sind zu einem Schieberegister verbunden A和Q与一个移位器连接 • Der Addierer addiert zwei 7-Bit Operanden (Bit 6...0). Ein evtl. entstehender Übertrag (Cout) wird in Bit A(7) des Akkumulators transferiert 加法器将两个7位的运算子加在一起，然后再传输回A 在A(7)中放入命令符 • Vorzeichenlogik berechnet Vorzeichen separat 符号逻辑将被单独计算 • Bit Q(0) kann von der Kontrolleinheit abgefragt werden Q(0)将向控制单元发送命令 • Counter ist in Kontrolleinheit realsiert 计数器在控制单元实现 • Kontrolleinheit generiert Steuersignale ci 控制单元生成控制信号ci  
  
![](media/aa64c8288fa1acf43ff06a952bdc799c.png)

## 控制单元和处理单元 \>\>

![](media/2814f2ba2c3707b8b4eb54d0d68128ff.png)  
C’out : Kontrollsignale (Mikrooperationen) an die Verarbeitungseinheit K’in : Eingabesignale (Kriterien), die die Ablaufsteuerung beeinflussen (z. B. ZERO, OVERFLOW) K’’in : Eingabesignale von anderen Kontrolleinheiten (z. B. START, RESET) C’’out : Ausgabesignale an andere Kontrolleinheiten (z. B. BUSY, DONE) • Aufteilung des Schaltwerks in Verarbeitungseinheit (Operationswerk) und Kontrolleinheit (Steuerwerk)  
• Operationswerk (Verarbeitungseinheit, Data Processing Unit, Data Path). Zusätzlich i. Allg. Kontrollsignale (Start, Stopp, Fehler etc.) von bzw. nach außen. 处理单元:将给出的数据纳入计算，得到结果。 • Führt Transporte und Verknüpfungen durch • Besitzt Kontrollpunkte, an denen die einzelnen Operationen durch Kontrollsignale ci ausgelöst werden können 通过控制信号执行处理方法 • parallele Aktivierung mehrerer Kontrollpunkte möglich/nötig 可以同时执行多个控制信号的命令 • Encoder/Multiplexer-Schaltung verhindert, dass mehrere Quellen gleichzeitig auf den Eingang der Zieleinheit gelegt werden können 通过复合电路，且门电路执行实现控制信号 • Bei einer Quelle und einem Ziel reicht ein UND-Gatter pro Bit (‚Tor‘).  
• Steuerwerke (Kontrolleinheiten, Control Units) steuern den Ablauf in dem 控制单元:控制计算单元，计算单元应进行哪些操作，由控制单元给出命令(控制信号) • steuert den (sequentiellen) Ablauf der Kontrollsignale 生成控制信号 • berücksichtigt dabei ggf. Kriterien kj 要考虑由给出的结果而得到的下一个控制信号 • legt fest, welche Signale gleichzeitig anliegen 有需要同时执行的控制信号 • sorgt für das richtige Zeitverhalten (Timing) 在正确的时间沿控制 • fest verdrahtete Ausführung oder programmierbar   
运行控制 Ablaufsteuerung • Kann durch Registertransfer-Programme (RT-Programme) beschrieben werden. • Den Registertransfer-Anweisungen entsprechen dann Kontrollsignale {ci}, die an das Operationswerk gehen. Mehrere Anweisungen können gleichzeitig im einem Takt ausgeführt werden (Abschluss durch Semikolon).   
  
![](media/3b5f4c41080daa5732dc4d9e2049c643.png)  
  
![](media/364e8902c7dbcfeffff21f0dfca40b6e.png)

## 硬件控制 Festverdrahtet \>\>

![](media/07ffa3779094bf1395639e5f868c4acc.png)  
  
![](media/6ad83175142a0def125e4624810d9631.png)

### Klassisches Methode \>\>

Steuerwerk wird als Moore- oder Mealy-Automat (Schaltwerk) nach bekannten Verfahren der Schaltwerksynthese entworfen  
  
![](media/6211902958f7b251a48492554453d475.png)

#### Moore-Automat [\>\>](marginnote3app://note/D3A6EECC-E9C6-4B87-9E59-3A98C529730E)

![](media/647c2b3611cd5922093781778ae9ef46.png)  
  
![](media/2a687accb47cfeff267b48f210790adf.png)  
  
![](media/d27375d650c760d85f37c8b4fb28aadd.png)  
  
![](media/52a55f0e328d5f9e0489dbb45dd0e29b.png)  
  
![](media/2dc720195f5cfc499e73c10885cb7184.png)  
  
![](media/3b9b22849804b24718b41e957f45eda2.png)  
  
![](media/802869e25c6b0bfca9b55829775f4335.png)  
  
![](media/a3e5a590e4dd30496c0d5f6474e7bc22.png)  
  
![](media/4240ac2eb7b4c014c0dd59b734b5fb02.png)  
  
![](media/37a47a482f7a3cd0b8273ef339e33282.png)  
  
![](media/fca4fe6fdd295cb331e69fa4a5c0b73d.png)

#### Mealy-Automat [\>\>](marginnote3app://note/1C6A7A23-C6A8-4E56-8E99-1251C1885C5C)

![](media/318a086dcc55a2268e79cc505be410cd.png)  
  
![](media/9e114ce0fa365effab10afd1de813c1c.png)  
  
![](media/c8ef8181439b84f790a8dd2ab46bef8f.png)  
  
![](media/c1f067a70313ad3ce235129af08a715e.png)  
  
![](media/d843440a80e19ba3fcf6df1facd22e79.png)  
  
![](media/78b1be67d4198723b76d6a0ce297593f.png)  
  
![](media/8978c4f92d98ad212fc73095890aa245.png)  
  
![](media/d582c6b028b4dd7022dd32e15599a2bb.png)  
  
![](media/c8391f7b99d5e2fabf774a449bc0a6b4.png)

### Verzögerungsketten (One-Hot Design) [\>\>](marginnote3app://note/6E625D60-5A6D-4592-B086-2CBC12E0941E)

![](media/33e56f74192f65ecbea6e0306308b9df.png)  
  
![](media/8f3f47aff2cfd4131c9155587d20c3f3.png)  
  
![](media/c56f552442f45870581a3c3a268446a1.png)  
  
![](media/b0e80919210a04beb0d919f37569009d.png)

### Zählersteuerung \>\>

![](media/4fe774f47e7dca6558116bf87a41b151.png)  
  
![](media/bdfe1b36c0cbf618f80fe7932b8f18b1.png)  
  
![](media/0a21d1ba908b7c024c0b1d0a034cd877.png)

## EduCore-V Tiny [\>\>](marginnote3app://note/F50FD063-962F-464F-9390-115683BA890D)

![](media/558e7c7967d736e644279d88909ab435.png)

### Register-Modul [\>\>](marginnote3app://note/ACFD93CF-FB06-4007-AB12-293FE1666658)

![](media/6aa53fccfe71caaf6d7768fc33fe8fae.png)

### Memory-Interface [\>\>](marginnote3app://note/714EB387-86C6-4C78-A414-E7A4A6FD62DB)

![](media/edda98e91e620eff90fe4fc25855466b.png)

### ALU-Modul [\>\>](marginnote3app://note/4D4B6849-0ABA-4A85-B669-47AF1D861383)

![](media/9f276215448632f8821c45cfa0ed3a4b.png)  
  
![](media/29f75057818187f6c25ad7f5e02436c3.png)  
  
![](media/6891e8d1051deb3157f0e0b2797d68c0.png)

### PC-Select [\>\>](marginnote3app://note/9D2D3AF7-B508-486D-B6D1-4E7F5E6C0037)

![](media/92a9698ce0c23ab1d93da3b380828c86.png)

### Immediate-Decoder-Modul [\>\>](marginnote3app://note/533386D0-9F0A-44C3-954C-88074F9221C1)

![](media/d46bb201af55c1a0ae803d389d664675.png)  
  
![](media/02fda81d79c2064b6aa0dc5de581acd6.png)

### Kontrollsignal-Generator [\>\>](marginnote3app://note/98725007-E109-422B-B87E-00FA5FD371A0)

![](media/f5c7112d0b9ac1be5dd188a9bdcd560d.png)  
  
![](media/c5d228530603874fb0f1e1c82f083b96.png)  
  
![](media/a9480aed22e3e4b17f42b6344b993610.png)  
  
![](media/fb98deab54b5ce699631085392f7be85.png)  
  
![](media/632a971b8551c1fff441025e8ff0b193.png)  
  
![](media/44e9c8be00e3b9d09b83e052d12ca0ac.png)  
  
![](media/f0f62f27232469cff01a9161d468f140.png)

### Simulation [\>\>](marginnote3app://note/E61B6AB3-9002-4E90-93ED-1575DC146F28)

![](media/f756826bd6ae63d2bf5b9e6846143420.png)

#### Start [\>\>](marginnote3app://note/E492E908-3D76-4BB4-A34D-5DAC26CF0C61)

![](media/30cb01360cbbeb139fd7d08c4fd1d6f7.png)

#### Instruction Fetch [\>\>](marginnote3app://note/F75C14DD-DBEF-43CE-A99D-9DCBA6A3FC4F)

![](media/f68038a329c1a0269a2d450804b45424.png)

#### Instruction Decode [\>\>](marginnote3app://note/4B7B29D5-7BC8-4C10-909A-D0B9DB0501D8)

![](media/3bc890801397033d545bb69ad760060d.png)

#### Execution [\>\>](marginnote3app://note/56799049-B1E8-4783-A06E-343352CB5279)

![](media/1454089aa4bac992a46b9ef5ef180393.png)

#### Memory Access [\>\>](marginnote3app://note/5BAAAFEB-753B-46AB-88F2-3BD076C49CDF)

![](media/1e1c8c43e1128c4676233e88286e9de1.png)

#### Writeback [\>\>](marginnote3app://note/1BA9C141-FE82-405C-91AF-0193A5BEF297)

![](media/b27aef6cd19075c80228e80cdd067ab8.png)

## Mikroprogrammierung \>\>

### Mikrobefehlsformate \>\>

![](media/b2f6997e9267993baab5b618d4ca010f.png)  
  
![](media/cb0ed89c71ada69ecc3ad0b7003a8223.png)  
  
![](media/61ef7565f257d29dcabc4402b77b9bed.png)

### Mikroprogrammwerke [\>\>](marginnote3app://note/9252F4B5-413D-4827-8B2D-C9CF48535617)
