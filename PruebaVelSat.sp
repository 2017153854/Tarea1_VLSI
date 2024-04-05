* -------------------------------------------------------
* Tecnológico de Costa Rica

* Escuela de Ingeniería en Electrónica

* Introducción al Diseño de Circuitos Integrados
* Profesor: Alfonso Chacon Quesada

* Tarea 1. Parte 2. 
* Diseño de un Inversor CMOS Mínimo de Tamaño Óptimo
* Circuito de prueba para determinar el estado de los transistores (regimen de canal largo o de velocidad de saturación)

* Realizado por: Alexander Castro Lara, 2017153854
* correo: alexanderestudiantec.cr

* I Semestre, 2024

* NOTA: El criterio de escogencia se basa en el siguiente enunciado:
* Drain current is quadratically dependent on voltage in the long-channel regime 
* and linearly dependent when fully velocity saturated
* -------------------------------------------------------



* -------------------------------------------------------
* Librerías, Parámetros y Opciones

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Hspice/lp5mos/config.lib' default

.option search=/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Castro_Lara_I_2024_vlsi/tarea1/Hspice/lpmos
.option post

.temp 25	*Temperatura ambiente
* -------------------------------------------------------



* -------------------------------------------------------
* Elementos, Circuito Principal y Estímulos

xm0 D G 0 0 ne w=0.22u l=0.18u as=1.056e-13 ad=1.056e-13 ps=1.4e-6 		*Transistor nMOS con modelo de nivel 50.
+ pd=1.4e-6 nrs=1.22727 nrd=1.22727 m='(1*1)' par1='(1*1)' xf_subext=0

Vgs G 0 0		*Fuente conectada a la compuerta

Vid n1 D 0	*Fuente de prueba para medir la corriente del transistor

Vds n1 0 1.8v       *Voltaje de alimentación
* -------------------------------------------------------



* -------------------------------------------------------
* Análisis y Mediciones
.DC Vds 0 2.5 0.05
.PROBE DC i(xm1)
* -------------------------------------------------------



* -------------------------------------------------------
* Fin de la simulación
.end
* -------------------------------------------------------
