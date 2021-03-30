//  FLOW TRHOUGH FIELD WITH HEADER//
//  2 CHANNELS//
//  ELECTRODE INTRUSION AVAILABLE//

//electrode 
// e_t = 6e-3;             //electrode felt thickness
e_t = 0.32e-3;         //electrode paper thickness
// e_i = 5e-4;           //electrode felt intrusion
e_i = 5e-5;             //electrode paper intrusion
e_l = 3e-3;            //electrode lenght
e_w = 30e-3;            //electrode width

//channels
ch_i_l = e_l;         //channel inlet lenght
ch_i_d = 3e-3;          //channel inlet depth 
ch_o_l = e_l;         //channel outlet lenght
ch_o_d = 3e-3;          //channel outlet depth 

//headers
h_i_w = 3e-3;             //header inlet width
h_i_l = e_l;             //header inlet lenght
h_i_d = 3e-3;             //header inlet depth
h_o_w = 3e-3;             //header outlet width
h_o_l = e_l;             //header outlet lenght
h_o_d = 3e-3;             //header outlet depth

//ports
p_i_w = h_i_w;             //port inlet width
p_i_l = 3e-3;             //port inlet lenght
p_i_d = 3e-3;             //port inlet depth
p_o_w = h_o_w;             //port outlet width
p_o_l = 3e-3;             //port outlet lenght
p_o_d = 3e-3;             //port outlet depth



//element size
el_s = 1e-4;

Point(1)        =   {0,                               0,                      0,      el_s};
Point(2)        =   {0,                               -p_i_l,                 0,      el_s};
Point(3)        =   {h_i_w,                           -p_i_l,                 0,      el_s};
Point(4)        =   {h_i_w,                           0,                      0,      el_s};
Point(5)        =   {h_i_w,                           e_l,                 0,      el_s};
Point(6)        =   {0,                               ch_i_l,                 0,      el_s};
Point(7)        =   {h_i_w + e_w,                     0,                      0,      el_s};
Point(8)        =   {h_i_w + e_w,                     e_l,                    0,      el_s};
Point(9)        =   {h_i_w + e_w + h_o_w,             0,                      0,      el_s};
Point(10)       =   {h_i_w + e_w + h_o_w,             ch_o_l,                 0,      el_s};
Point(11)       =   {h_i_w + e_w + h_o_w,             ch_o_l + p_o_l,         0,      el_s};
Point(12)       =   {h_i_w + e_w,                     ch_o_l + p_o_l,         0,      el_s};//+



Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Line(5) = {4, 5};
//+
Line(6) = {5, 6};
//+
Line(7) = {6, 1};
//+
Line(8) = {4, 7};
//+
Line(9) = {7, 8};
//+
Line(10) = {8, 5};
//+
Line(11) = {7, 9};
//+
Line(12) = {9, 10};
//+
Line(13) = {10, 8};
//+
Line(14) = {10, 11};
//+
Line(15) = {11, 12};
//+
Line(16) = {12, 8};
//+
Curve Loop(1) = {2, 3, 4, 1};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, 6, 7, -4};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {8, 9, 10, -5};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {11, 12, 13, -9};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {13, -16, -15, -14};
//+
Plane Surface(5) = {5};


// HEADER INLET
Extrude {0, 0, -e_i} {Surface{1};}
Extrude {0, 0, -h_i_d + e_i} {Surface{38};}

// CHANNEL INLET
Extrude {0, 0, -e_i} {Surface{2};}
Extrude {0, 0, -ch_i_d + e_i} {Surface{82};}

// // CHANNEL OUTLET
Extrude {0, 0, -e_i} {Surface{4};}
Extrude {0, 0, -ch_o_d + e_i} {Surface{126};}

// // HEADER OUTLET
Extrude {0, 0, -e_i} {Surface{5};}
Extrude {0, 0, -h_o_d + e_i} {Surface{170};}

// // ELECTRODE
Extrude {0, 0, e_t} {
  Surface{2}; Surface{3}; Surface{4};
}

// ----------- DISCRETIZATION ----------------------------------------------------------------------
// ELECTRODE INTRUSSION THICKNESS 
Transfinite Curve {116, 164, 120, 160, 68, 72, 112, 111, 24, 28, 23, 32} = 
//felt
// 10 Using Bump 0.2;
//paper
5 Using Bump 0.2;

//ELECTRODE THICKNESS
Transfinite Curve {244, 248, 222, 226, 200, 199, 208, 204} = 30 Using Bump 0.1;

//ELECTRODE LENGHT 
Transfinite Curve {10, 218, 8, 216} = 50 Using Bump 0.05;

// CHANNEL / ELECTRODE LENGHT
Transfinite Curve {12, 239, 129, 107, 109, 131, 217, 9, 5, 62, 84, 194, 196, 7, 64, 86,5} = 50 Using Bump 0.2;

// PORT LENGHT
Transfinite Curve {-14, 153, 175, 16, -151, -173, 3, 19, 41, -1, -21, -43} = 10 Using Progression 0.7;

// CHANNEL / PORT WIDTH
Transfinite Curve {174, 152, 15, 13, 240, 130, 108, 11, 238, 128, 106, 6, 63, 85, 195, 4, 20, 42, 197, 2, 18, 40} = 20 Using Bump 0.2;

// CHANNEL / PORT DEPTH
Transfinite Curve {134, 138, 186, 133, 142, 182, 46, 90, 50, 94, 54, 45} = 
//felt
// 15 Using Bump 0.2;
//paper
20 Using Bump 0.01;

Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";

//+
Physical Surface("inlet") = {47, 25};
//+
Physical Surface("outlet") = {165, 187};
//+
Physical Surface("walls_channel") = {135, 148, 147, 139, 192, 191, 104, 51, 29, 1, 37, 59, 99, 91, 95, 169, 5, 161, 183,60};
//+
Physical Surface("walls_porous") = {223,3, 236, 231,213,205,209,214,245,249,253,258};
//+
Physical Surface("walls_intrusion") = {117,113,125,77,69,73};
//+
Physical Volume("fluid") = {1,2,4,6,7,8};
//+
Physical Volume("electrode") = {10,11,9};
//+
Physical Volume("intrusion") = {3,5};

