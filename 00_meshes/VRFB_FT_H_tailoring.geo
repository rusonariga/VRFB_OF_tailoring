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
el_s = 1e-3;

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
Point(13)       =   {0,                               ch_o_l + p_o_l,         0,      el_s};
Point(14)       =   {h_i_w,                           ch_o_l + p_o_l,                      0,      el_s};




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
Line(17) = {6,13};
//+
Line(18) = {13,14};
//+
Line(19) = {14,5};
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
//+
Curve Loop(6) = {6, 17, 18, 19};
//+
Plane Surface(6) = {6};

// ELECTRODE
Extrude {0, 0, e_t} {Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6};
}

//ELECTRODE INTRUSSION
Extrude {0, 0, -e_i} {Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6};
}

//CHANNEL DEPTH
Extrude {0, 0, -ch_i_d + e_i} {Surface{283}; Surface{195}; Surface{173}; Surface{217}; Surface{239}; Surface{261};
}

// ----------- DISCRETIZATION ----------------------------------------------------------------------

// ELECTRODE INTRUSSION THICKNESS 
Transfinite Curve {251, 255, 229, 207, 225, 203, 158, 159, 163, 167, 181, 185, 277, 273} =
//felt
// 10 Using Bump 0.2;
//paper
10 Using Bump 0.2;

//ELECTRODE THICKNESS
Transfinite Curve {119, 123, 75, 97, 71, 93, 145, 141, 49, 53, 31, 35, 27, 26}  = 20 Using Bump 0.1;

//ELECTRODE LENGHT 
 Transfinite Curve {65, 67, 10, 199, 353, 65, 8, 197, 351} = 50 Using Bump 0.05;

// PORT LENGHT
 Transfinite Curve {373, 375, 397, 243, 111, 15, 13, 89, 221, 87, 11, 219, 329, 310, 285, 287, 
33, 18, 265, 44, 6, 176, 23, 4, 4, 155, 21, 2, 153,133} = 10 Using Bump 0.2;

// PORT WIDTH
Transfinite Curve {288, -132, -17, -264, -286, 134, 19, 266, 330, -332, -24, -1, -156, 22, 3, 154, 398, 14, 
14, 112, -110, 16, -242, 14, 244,-396} = 10 Using Progression 0.7;

// CHANNEL / PORT WIDTH
 Transfinite Curve {45, 7, 177, 307, 309, 43, 5, 175, 374, 352, 220, 12, 88, 9, 66, 198}= 20 Using Bump 0.2;

// CHANNEL / PORT DEPTH
 Transfinite Curve {409, 405, 361, 383, 357, 379, 335, 334, 312, 321, 290, 291, 299, 295} = 
//felt
// 15 Using Bump 0.2;
//paper
20 Using Bump 0.01;

Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";

//+
Physical Surface("inlet") = {336, 28, 160};
//+
Physical Surface("outlet1") = {300, 146, 278};
//+
Physical Surface("outlet2") = {410, 124, 256};
//+
Physical Surface("wallsPorous") = {63,151, 41, 63128, 129, 98, 230, 26,0, 107, 94, 226, 85, 72, 204, 80, 212, 120, 252, 150, 282, 32, 164, 142, 274, 58, 40, 172, 190};
//+
Physical Surface("walls") = {384, 414, 415, 406, 393, 366, 371, 358, 304, 305, 296, 322, 327, 348, 349, 340,380};

