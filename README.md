# UpperLimbMotion

License
========
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Authors: Blanca Larraga García <blanca.larraga@upm.es>, 
         Antonio J. del Ama Espinosa <ajdela@sescam.jccm.es> , A
	 Álvaro Gutierrez Martin <aguti@etsit.upm.es>

Developed in Hospital Nacional de Parapléjicos de Toledo <http://hnparaplejicos.sescam.castillalamancha.es>  and in Robolabo <http://www.robolabo.etsit.upm.es/> 

Introduction
==============

A clinical oriented application along with an experimental protocol that would enable clinicians without specific skills and technical knowledge on movement analysis, to perform a biomechanical analysis of manual wheelchair propulsion. Therefore, the objective is to develop a clinical oriented application in which a complete biomechanical analysis is embedded, guiding the clinicians through the process of performing a wheelchair propulsion test and providing them with the necessary information to accomplish the analysis as well as to generate a comprehensive report with the outcome of the analysis. 

Biomechanical analysis
=======================
The anatomy of the upper limb can be represented as a kinematic chain linked by different joints: shoulder, elbow and wrist. For analyzing the upper limb, a kinematic and kinetic analysis is performed in order to obtain the positions, forces and moments of the joints at any time during wheelchair propulsion. 

Technologies used
====================
Motion capture techniques are used quite broadly nowadays thanks to the different technologies available and for a very broad field of applications. In this section the technologies used for this biomechanical analysis are described.

* Kinescan system: photogrammetry system provided by the IBV (Instituto de Biomecánica de Valencia) based on passive markers that are detected thanks to an infrared light which is coupled to a digital camera. Furthermore, this system allows the synchronization with the device that acquires kinetic data on the hand-handrim contact point.

* SmartWheels: these wheels gather information about forces during the interaction between the hand and the ring of the wheel while propelling. Smartwheels are designed in a way that the size of the wheel is the regular size for a wheelchair and there is an instrumented ring that collects the force information thanks to the strain gauge and encoder integrated into the wheel.

Clinical application
=====================
The information obtained from both, the Kinescan and the Smartwheels, is processed through a custom-made software interface in which the inverse dynamic and post-processing algorithms are embedded, being transparent to the user. Therefore, a clinical application which allows the clinical staff to obtain all biomechanical results without the need for having a deep technical knowledge and without having to deal with any programming software has been developed. Moreover, a report functionality is incorporated into the solution based on the interaction with the processed data creating a comprehensive solution.
The application could be found in the bin folder. In order to run it, the MATLAB Runtime is needed which is an open source standalone set of shared libraries which allows the execution of compiled MATLAB applications as the one created. The structure of what is behind the application is explained in the src folder in which all the MATLAB code is shown.
