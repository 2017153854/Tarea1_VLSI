* -------------------------------------------------------
* Tecnológico de Costa Rica

* Escuela de Ingeniería en Electrónica

* Introducción al Diseño de Circuitos Integrados
* Profesor: Alfonso Chacon Quesada

* Tarea 1. Parte 1. 
* Resistencia Efectiva de un transistor pMOS (REpMOS.sp)
* Circuito de prueba para determinar los valores de las corrientes I_H e I_L

* Realizado por: Alexander Castro Lara, 2017153854
* correo: alexanderestudiantec.cr

* I Semestre, 2024

* NOTA: El circuito de prueba es basado en la siguiente referencia:
* HSpice Tutorial #3: I-V Characteristics of a PMOS Transistor. (s. f.). https://www.yzuda.org/tutorials/hspice/03/
* -------------------------------------------------------



* -------------------------------------------------------
* Librerías, Parámetros y Opciones

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/config.lib' default

.option search=/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Castro_Lara_I_2024_vlsi/tarea1/Hspice/lpmos	*Para que hspice sepa donde buscar
.option post

.temp 25	*Temperatura ambiente

.GLOBAL vdd! gnd!
* -------------------------------------------------------



* -------------------------------------------------------
* Elementos, Circuito Principal y Estímulos

xm1 D G vdd! vdd! pe w=0.44u l=0.18u as=2.112e-13 ad=2.112e-13 ps=1.84e-6 		*Transistor nMOS con modelo de nivel 50.
+ pd=1.84e-6 nrs=0.613636 nrd=0.613636 m='(1*1)' par1='(1*1)'

Vgs G vdd! 0		*Voltaje de entrada   //   -1.8V para IH y -0.9V para IL

Vds D vdd! 0       *Voltaje de drenador  //  -0.9V para IH y -1.8V para IL 

Vvdd vdd! 0 1.8V	*Valor del riel vdd!

Vgnd gnd! 0 0V		*Valor del riel gnd!
* -------------------------------------------------------



* -------------------------------------------------------
* Análisis y Mediciones
*.tran 1us 30us
.DC Vds -1.8 0 0.05 SWEEP Vgs -1.8 0 0.3
.PROBE DC i(xm1)
* -------------------------------------------------------



* -------------------------------------------------------
* Fin de la simulación
.end
* -------------------------------------------------------
