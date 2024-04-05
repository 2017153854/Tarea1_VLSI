* -------------------------------------------------------
* Tecnológico de Costa Rica

* Escuela de Ingeniería en Electrónica

* Introducción al Diseño de Circuitos Integrados
* Profesor: Alfonso Chacon Quesada

* Tarea 1. Parte 2. 
* Diseño de un Inversor CMOS Mínimo de Tamaño Óptimo:
* Búsqueda de la ralación óptima PMOS/NMOS 
* para obtener tpdr = tpdf

* Realizado por: Alexander Castro Lara, 2017153854
* correo: alexanderestudiantec.cr

* I Semestre, 2024

* NOTA: Basado en la figura 8.11 del libro de Weste (2011)
* -------------------------------------------------------



*----------------------------------------------------------------------
* Parameters and models
*----------------------------------------------------------------------
.param SUPPLY=1.8

.temp 70

.option post
.option scale=90n	*Ajustado al valor de lambda (0.09um)
.option search='/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Castro_Lara_I_2024_vlsi/tarea1/Hspice/lpmos'

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/config.lib' default
*----------------------------------------------------------------------



*----------------------------------------------------------------------
* Subcircuits
*----------------------------------------------------------------------
.global vdd gnd

.subckt inv a y N=2.4445 P=4.8890	*Wn=0.22u=2.4445*LAMBDA y Wp=0.44u=4.8890*LAMBDA

*Transistor pMOS.
xm1 y a vdd vdd pe w=P l=2 
+ as='P*5' ad='P*5' ps='2*P+10' pd='2*P+10'

*Transistor nMOS.
xm0 y a 0 0 ne w=N l=2
+ as='N*5' ad='N*5' ps='2*N+10' pd='2*N+10'

.ends
*----------------------------------------------------------------------



*----------------------------------------------------------------------
* Simulation netlist
*----------------------------------------------------------------------
Vdd vdd 0 'SUPPLY'
Vin a 0 PULSE 0 'SUPPLY' 0ps 20ps 20ps 120ps 500ps

X1 a b inv P='P1'       * shape input waveform
X2 b c inv P='P1' M=4   * reshape input waveform
X3 c d inv P='P1' M=16  * device under test
X4 d e inv P='P1' M=64  * load
X5 e f inv P='P1' M=256 * load on load
*----------------------------------------------------------------------



*----------------------------------------------------------------------
* Optimization setup
*----------------------------------------------------------------------
.param P1=optrange(7,2.4445,16) * search from 2.4445 (0.22um) to 16 (1.44um), guess 7 (0.63um)
.model optmod opt itropt=30 * maximum of 30 iterations
.measure bestratio param='P1/2.4445' * compute best P/N ratio. N = N_minimo = 0.22um
*----------------------------------------------------------------------



*----------------------------------------------------------------------
* Stimulus
*----------------------------------------------------------------------
.tran 0.1ps 400ps SWEEP OPTIMIZE=optrange RESULTS=diff MODEL=optmod

.measure tpdr 				* rising propagation delay
+ TRIG v(c) VAL='SUPPLY/2' FALL=1 
+ TARG v(d) VAL='SUPPLY/2' RISE=1

.measure tpdf 				* falling propagation delay
+ TRIG v(c) VAL='SUPPLY/2' RISE=1
+ TARG v(d) VAL='SUPPLY/2' FALL=1 

.measure tpd param='(tpdr+tpdf)/2' goal=0    * average prop delay

.measure diff param='tpdr-tpdf' goal=0     * diff between delays
*----------------------------------------------------------------------



*----------------------------------------------------------------------
* End program
*----------------------------------------------------------------------
.end
*----------------------------------------------------------------------



