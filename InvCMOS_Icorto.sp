* -------------------------------------------------------
* Tecnológico de Costa Rica

* Escuela de Ingeniería en Electrónica

* Introducción al Diseño de Circuitos Integrados
* Profesor: Alfonso Chacon Quesada

* Tarea 1. Parte 2. 
* Diseño de un Inversor CMOS Mínimo de Tamaño Óptimo
* Determinación de la corriente de corto circuito del inversor

* Realizado por: Alexander Castro Lara, 2017153854
* correo: alexanderestudiantec.cr

* I Semestre, 2024
* -------------------------------------------------------



* -------------------------------------------------------
* Librerías, Parámetros y Opciones

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/config.lib' default

.option search=/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Castro_Lara_I_2024_vlsi/tarea1/Hspice/lpmos
.option post

.temp 25	*Temperatura ambiente

.GLOBAL vin vdd
* -------------------------------------------------------



* -------------------------------------------------------
* Elementos, Circuito Principal y Estímulos

xm1 Dp vin vdd vdd pe w=0.44u l=0.18u as=2.112e-13 ad=2.112e-13 ps=1.84e-6 		*Transistor pMOS con modelo de nivel 50.
+ pd=1.84e-6 nrs=0.613636 nrd=0.613636 m='(1*1)' par1='(1*1)'

xm0 Dn vin 0 0 ne w=0.22u l=0.18u as=1.056e-13 ad=1.056e-13 ps=1.4e-6 		*Transistor nMOS con modelo de nivel 50.
+ pd=1.4e-6 nrs=1.22727 nrd=1.22727 m='(1*1)' par1='(1*1)' xf_subext=0

Vent vin 0 0v	*Voltaje de entrada

Valim vdd 0 1.8v       *Voltaje de alimentación

Vprueba Dp Dn 0v	*Fuente de prueba para medir la corriente de corto circuito
* -------------------------------------------------------



* -------------------------------------------------------
* Análisis y Mediciones
.DC Vent 0 1.8 0.05
.PROBE DC i(Vprueba)
* -------------------------------------------------------



* -------------------------------------------------------
* Fin de la simulación
.end
* -------------------------------------------------------
