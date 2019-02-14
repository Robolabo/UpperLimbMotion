%% SALIDA DE LAS VARIABLES CINEM�TICAS EN ORDEN PARA LA BASE DE DATOS
tronflexmax = -a2(6); %Maximo de flexi�n de tronco
tronexmax = a2(5); %M�ximo de extensi�n de tronco
tronflexrom = abs(tronflexmax-tronexmax); %ROM flexoextensi�n
tronrotmax_izd = a2(3); %M�ximo de rotaci�n de tronco (positivo izda)
tronrotmin_izd = a2(4); %M�nimo de rotaci�n de tronco (positivo izda)
tronrotrom_izd_der = abs(tronrotmax_izd-tronrotmin_izd); %ROM rotaci�n
tronbalmax = a2(1); %M�ximo de balanceo de tronco (positivo hacia la derecha)
tronbalmin = a2(2); %M�nimo de balanceo de tronco (positivo hacia la derecha)
tronbalrom = abs(tronbalmax-tronbalmin); %ROM balanceo de tronco

munulmax = a2(25); %M�ximo desviaci�n ulnar
munramax = -a2(26); %M�nimo desviaci�n radial
munromulra = abs(munulmax-munramax); %ROM Desviaci�n radial-ulnar

munmaxlfex = a2(29); %M�ximo de flexi�n de mu�eca
munminflex = -a2(30); %M�ximo de extensi�n de mu�eca
munromflex = abs(munmaxlfex-munminflex); %ROM flexoextensi�n de mu�eca

codflexmax = a2(47); %Maximo de flexi�n de codo
codflexmin = a2(48); %M�nimo de flexi�n de codo
codromflex = abs(codflexmax-codflexmin); %ROM Flexiextensi�n de codo

codpromax = a2(45); %Maximo de pronaci�n del antebrazo
codpromin = a2(46); %M�nimo de pronaci�n del antebrazo
codprorom = abs(codpromax-codpromin); %ROM pronoupinaci�n del antebrazo

homflexmax = a2(7); %M�ximo de elevaci�n de hombro
homflexmin = a2(8); %M�nimo de elevaci�n de hombro
homromflex = abs(homflexmax-homflexmin); %ROM de elevaci�n de hombro

homrotmax = a2(11); %M�ximo de rotaci�n interna del hombro
homrotmin = a2(12); %M�nimo de rotaci�n interna del hombro
homrotrom = abs(homrotmax-homrotmin); %ROM de rotaci�n interna del hombro

homadumax = a2(9); %M�ximo de aducci�n (plano de elevaci�n del hombro)
homadumon = a2(10); %M�nimo de aducci�n (plano de elevaci�n del hombro)
homadurom = abs(homadumax-homadumon); %ROM aducci�n-abducci�n (plano de elevaci�n)

munhcul = b2(1); %Mu�eca Hands Contact desvaci�n ulnar
muntcul = b2(2); %Mu�eca Top Center desviaci�n ulnar
munhoul = b2(3); %Mu�eca Hands Off desviaci�n ulnar
munfthul = b2(4); %Mu�eca Follow Thru desviaci�n ulnar
munapul = b2(5); %Mu�eca Arm Preparation desviaci�n ulnar
munhcflex = b2(6); %Mu�eca Hands Contact flexi�n
muntcflex = b2(7); %Mu�eca Top Center flexi�n
munhoflex = b2(8); %Mu�eca Hands Off flexi�n
munfthflex = b2(9); %Mu�eca Follow Thru flexi�n
munapflex = b2(10); %Mu�eca Arm Preparation flexi�n
codhcflex = b2(11); %Codo Hands Contact flexi�n
codtcflex = b2(12); %Codo Top Center flexi�n
codhoflex = b2(13); %Codo Hands Off flexi�n
codfthflex = b2(14); %Codo Follow Trhu flexi�n
codapflex = b2(15); %Codo Arm Preparation flexi�n
codhcpro = b2(16); %Codo Hands Contact pronaci�n
codtcpro = b2(17); %Codo Top Center pronaci�n
codhopro = b2(18); %Codo Hands Off pronaci�n
codfthpro = b2(19); %Codo Follow Trhu pronaci�n
codappro = b2(20); %Codo Arm Preparation pronaci�n
homhcelev = b2(21); %Hombro Hands Contact elevaci�n de hombro
homtcelev = b2(22); %Hombro Top Center elevaci�n de hombro
homhoelev = b2(23); %Hombro Hands Off elevaci�n de hombro
homfthelev = b2(24); %Hombro Follow Trhu elevaci�n de hombro
homapelev = b2(25); %Hombro Arm Preparation elevaci�n de hombro
homhcrot = b2(26); %Hombro Hands Contact rotaci�n interna
homtcrot = b2(27); %Hombro Top Center rotaci�n interna
homhorot = b2(28); %Hombro Hands Off rotaci�n interna
homfthrot = b2(29); %Hombro Follow Trhu rotaci�n interna
homaprot = b2(30); %Hombro Arm Preparation rotaci�n interna
homhcadu = b2(31); %Hombro Hands Contact aducci�n
homtcpadu = b2(32); %Hombro Top Center aducci�n
homhoadu = b2(33); %Hombro Hands Off aducci�n
homfthadu = b2(34); %Hombro Follow Trhu aducci�n
homapadu = b2(35); %Hombro Arm Preparation aducci�n
%% SALIDA DE LAS VARIABLES CIN�TICAS EN ORDEN PARA LA BASE DE DATOS
cad = stroke_med;
vel = vel_prop_med;
dist = vel/cad;
empujet = t_empuje_med;
rect = t_rec_med;
emprec = empujet/rect;
ca = contact_angle_med;
ra = release_angle_med;
ang = ca-ra;
ftmax = Ft_max;
ftmin = Ft_min;
ftotmax = Ftot_max;
ftotmin = Ftot_min;
fme = ftmax/ftotmax;
tasf = tasa_F_max;
mxm = Mx_max;
mym = My_max;
mpmax = Mp_max;
mpmin = Mp_min;
tasm = tasa_M_max;
munfxmax = a2(31);
munfxmin = a2(32);
munhcfx = c1(1);
muntcfx = c1(7);
munhofx = c1(13);
munfthfx = c1(19);
munapfx = c1(25);
munfymax = a2(33);
munfymin = a2(34);
munhcfy = c2(2);
muntcfy = c2(8);
munhofy = c2(14);
munfthfy = c2(20);
munapfy = c2(26);
munfzmax = a2(35);
munfzmin = a2(36);
munhcfyz = c2(3);
muntcfz = c2(9);
munhofz = c2(15);
munfthfz = c2(21);
munapfz = c2(27);
munmxmax = a2(37);
munmxmin = a2(38);
munhcmx = c2(4);
muntcmx = c2(10);
munhomx = c2(16);
munfthfmx = c2(22);
munapmx = c2(28);
munmymax = a2(39);
munmymin = a2(40);
munhcmy = c2(5);
muntcmy = c2(11);
munhomy = c2(17);
munfthfmy = c2(23);
munapmy = c2(29);
munmzmax = a2(41);
munmzmin = a2(42);
munhcmz = c2(6);
muntcmz = c2(12);
munhomz = c2(18);
munfthfmz = c2(24);
munapmz = c2(30);
codfxmax = a2(49);
codfxmin = a2(50);
codhcfx = c2(31);
codtcfx = c2(37);
codhofx = c2(43);
codfthfx = c2(49);
codapfx = c2(55);
codfymax = a2(51);
codfymin = a2(52);
codhcfy = c2(32);
codtcfy = c2(38);
codhofy = c2(44);
codfthfy = c2(50);
codapfy = c2(56);
codfzmax = a2(53);
codfzmin = a2(54);
codhcfz = c2(33);
codtcfz = c2(39);
codhofz = c2(45);
codfthfz = c2(51);
codapfz = c2(57);
codmxmax = a2(55);
codmxmin = a2(56);
codhcmx = c2(34);
codtcmx = c2(40);
codhomx = c2(46);
codfthmx = c2(52);
codapmxv = c2(58);
codmymax = a2(57);
codmymin = a2(58);
codhcmy = c2(35);
codtcmy = c2(41);
codhomy = c2(47);
codfthmy = c2(53);
codapmy = c2(59);
codmzmax = a2(59);
codmzmin = a2(60);
codhcmz = c2(36);
codtcmz = c2(42);
codhomz = c2(48);
codfthmz = c2(54);
codapmz = c2(60);
homfxmax = a2(13);
homfxmin = a2(14);
homhcfx = c2(61);
homtcfx = c2(67);
homhofx = c2(73);
homfthfx = c2(79);
homapfx = c2(85);
homfymax = a2(15);
homfymin = a2(16);
homhcfy = c2(62);
homtcfy = c2(68);
homhofy = c2(74);
homfthfy = c2(80);
homapfy = c2(86);
homfzmax = a2(17);
homfzmin = a2(18);
homhcfz = c2(63);
homtcfz = c2(69);
homhofz = c2(75);
homfthfz = c2(81);
homapfz = c2(87);
hommxmax = a2(19);
hommxmin = a2(20);
homhcmx = c2(64);
homtcmx = c2(70);
homhomx = c2(76);
homfthmx = c2(82);
homapmx = c2(88);
hommymax = a2(21);
hommymin = a2(22);
homhcmy = c2(65);
homtcmy = c2(71);
homhomy = c2(77);
homfthmy = c2(83);
homapmy = c2(89);
hommzmax = a2(23);
hommzmin = a2(24);
homhcmz = c2(66);
homtcmz = c2(72);
homhomz = c2(78);
homfthmz = c2(84);
homapmz = c2(90);
% Escritura en la hoja de excel

cinematica = [tronflexmax tronexmax tronflexrom tronrotmax_izd...
    tronrotmin_izd tronrotrom_izd_der tronbalmax tronbalmin...
    tronbalrom munulmax munramax munromulra munhcul muntcul...
    munhoul munfthul munapul munmaxlfex munminflex munromflex...
    munhcflex muntcflex munhoflex munfthflex munapflex codflexmax...
    codflexmin codromflex codhcflex codtcflex codhoflex codfthflex...
    codapflex codpromax codpromin codprorom codhcpro codtcpro codhopro...
    codfthpro codappro homflexmax homflexmin homromflex homhcelev...
    homtcelev homhoelev homfthelev homapelev homrotmax homrotmin...
    homrotrom homhcrot homtcrot homhorot homfthrot homaprot homadumax...
    homadumon homadurom homhcadu homtcpadu homhoadu homfthadu homapadu];

cinetica = [cad vel dist empujet rect emprec ca ra ang ftmax ftmin...
    ftotmax ftotmin fme tasf mxm mym mpmax mpmin tasm munfxmax...
    munfxmin munhcfx muntcfx munhofx munfthfx munapfx munfymax...
    munfymin munhcfy muntcfy munhofy munfthfy munapfy munfzmax...
    munfzmin munhcfyz muntcfz munhofz munfthfz munapfz munmxmax...
    munmxmin munhcmx muntcmx munhomx munfthfmx munapmx munmymax...
    munmymin munhcmy muntcmy munhomy munfthfmy munapmy munmzmax...
    munmzmin munhcmz muntcmz munhomz munfthfmz munapmz codfxmax...
    codfxmin codhcfx codtcfx codhofx codfthfx codapfx codfymax...
    codfymin codhcfy codtcfy codhofy codfthfy codapfy codfzmax...
    codfzmin codhcfz codtcfz codhofz codfthfz codapfz codmxmax...
    codmxmin codhcmx codtcmx codhomx codfthmx codapmxv codmymax...
    codmymin codhcmy codtcmy codhomy codfthmy codapmy codmzmax...
    codmzmin codhcmz codtcmz codhomz codfthmz codapmz homfxmax...
    homfxmin homhcfx homtcfx homhofx homfthfx homapfx homfymax...
    homfymin homhcfy homtcfy homhofy homfthfy homapfy homfzmax...
    homfzmin homhcfz homtcfz homhofz homfthfz homapfz hommxmax...
    hommxmin homhcmx homtcmx homhomx homfthmx homapmx hommymax...
    hommymin homhcmy homtcmy homhomy homfthmy homapmy hommzmax...
    hommzmin homhcmz homtcmz homhomz homfthmz homapmz];
%% SELECCION DEL RANGO DEL ARCHIVO DE DESTINO (BASE DE DATOS)

% % velocidad=inputdlg('velocidad');
     xlswrite('Base_de_Datos', cinematica);
     xlswrite('Base_de_Datos', cinetica);
 cd('/Users/blancalarragagarcia/Documents/blancal/Fotogrametria original  Antonio')