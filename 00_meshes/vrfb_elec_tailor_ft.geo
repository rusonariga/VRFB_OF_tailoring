// TAILOR TEST ON POROUS MEDIA
// **** set up with 2 porous zones, one inside another ****

e_s = 1e-3;   // element size

ch_i_l  =   20e-3;      //channel inlet lenght
ch_o_l  =   20e-3;      //channel outlet lenght
ch_w    =   10e-3;      //channel width
ch_p_l  =   10e-3;       //channel porous lenght
pt_l    =   1e-3;       //porous hole lenght
pt_w    =   1e-3;       //porous hole widht

Point(1) = {0,0,0,e_s};
Point(2) = {ch_i_l,                                         0,                              0,e_s};
Point(3) = {ch_i_l,                                         ch_w/2-pt_w/2,                  0,e_s};
Point(4) = {ch_i_l,                                         ch_w/2+pt_w/2,                  0,e_s};
Point(5) = {ch_i_l,                                         ch_w,                           0,e_s};
Point(6) = {0,                                              ch_w,                           0,e_s};
Point(7) = {0,                                              ch_w/2-pt_w/2,                  0,e_s};
Point(8) = {0,                                              ch_w/2+pt_w/2,                  0,e_s};
Point(9) = {ch_i_l+ch_p_l/2-pt_l/2,                         0,                              0,e_s};
Point(10) = {ch_i_l+ch_p_l/2-pt_l/2,                        ch_w/2-pt_w/2,                  0,e_s};
Point(11) = {ch_i_l+ch_p_l/2-pt_l/2,                        ch_w/2+pt_w/2,                  0,e_s};
Point(12) = {ch_i_l+ch_p_l/2-pt_l/2,                        ch_w,                           0,e_s};
Point(13) = {ch_i_l+ch_p_l/2+pt_l/2,                        0,                              0,e_s};
Point(14) = {ch_i_l+ch_p_l/2+pt_l/2,                        ch_w/2-pt_w/2,                  0,e_s};
Point(15) = {ch_i_l+ch_p_l/2+pt_l/2,                        ch_w/2+pt_w/2,                  0,e_s};
Point(16) = {ch_i_l+ch_p_l/2+pt_l/2,                        ch_w,                           0,e_s};
Point(17) = {ch_i_l+ch_p_l,                                 0,                              0,e_s};
Point(18) = {ch_i_l+ch_p_l,                                 ch_w/2-pt_w/2,                  0,e_s};
Point(19) = {ch_i_l+ch_p_l,                                 ch_w/2+pt_w/2,                  0,e_s};
Point(20) = {ch_i_l+ch_p_l,                                 ch_w,                           0,e_s};
Point(21) = {ch_i_l+ch_p_l+ch_o_l,                          0,                              0,e_s};
Point(22) = {ch_i_l+ch_p_l+ch_o_l,                                 ch_w/2-pt_w/2,                  0,e_s};
Point(23) = {ch_i_l+ch_p_l+ch_o_l,                                 ch_w/2+pt_w/2,                  0,e_s};
Point(24) = {ch_i_l+ch_p_l+ch_o_l,                                 ch_w,                           0,e_s};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 7};
//+
Line(4) = {7, 1};
//+
Line(5) = {3, 4};
//+
Line(6) = {4, 8};
//+
Line(7) = {8, 7};
//+
Line(8) = {4, 5};
//+
Line(9) = {5, 6};
//+
Line(10) = {6, 8};
//+
Line(11) = {2, 9};
//+
Line(12) = {9, 10};
//+
Line(13) = {10, 3};
//+
Line(14) = {10, 11};
//+
Line(15) = {11, 4};
//+
Line(16) = {11, 12};
//+
Line(17) = {12, 5};
//+
Line(18) = {9, 13};
//+
Line(19) = {13, 14};
//+
Line(20) = {14, 10};
//+
Line(21) = {14, 15};
//+
Line(22) = {15, 11};
//+
Line(23) = {15, 16};
//+
Line(24) = {16, 12};
//+
Line(25) = {13, 17};
//+
Line(26) = {17, 18};
//+
Line(27) = {18, 14};
//+
Line(28) = {18, 19};
//+
Line(29) = {19, 15};
//+
Line(30) = {19, 20};
//+
Line(31) = {20, 16};
//+
Line(32) = {17, 21};
//+
Line(33) = {21, 22};
//+
Line(34) = {22, 18};
//+
Line(35) = {22, 23};
//+
Line(36) = {23, 19};
//+
Line(37) = {23, 24};
//+
Line(38) = {24, 20};
//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {3, -7, -6, -5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {6, -10, -9, -8};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {11, 12, 13, -2};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {13, 5, -15, -14};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {16, 17, -8, -15};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {18, 19, 20, -12};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {27, -19, 25, 26};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {27, 21, -29, -28};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {29, 23, -31, -30};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {23, 24, -16, -22};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {20, 14, -22, -21};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {32, 33, 34, -26};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {34, 28, -36, -35};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {36, 30, -38, -37};
//+
Plane Surface(15) = {15};
//+
Transfinite Curve {-9, -6, -3, 1} = ch_i_l/e_s Using Progression 0.9;
//+
Transfinite Curve {38, 36, 34, -32} = ch_o_l/e_s Using Progression 0.9;
//+
Transfinite Curve {17, 15, 13, 11, 25, 27, 29, 31} = ch_p_l/e_s Using Progression 1;
//+
Transfinite Curve {24, 22, 20, 18, 7, 5, 14, 21, 28, 35} = 2+pt_l/e_s Using Progression 1;
//+
Transfinite Curve {10, 8, 16, 23, 30, 37, 4, 2, 12, 19, 26, 33} = ch_w/e_s Using Progression 1;
//+
Transfinite Surface "*";
Recombine Surface "*";
//+
Extrude {0, 0, ch_w} {
  Surface{3}; Surface{6}; Curve{29}; Curve{27}; Curve{25}; Surface{10}; Surface{9}; Surface{8}; Surface{15}; Surface{14}; Surface{13}; Surface{11}; Surface{12}; Surface{7}; Surface{4}; Surface{5}; Surface{2}; Surface{1}; 
  Layers{10}; Recombine;
}
//+
Physical Surface("inlet") = {51, 349, 379};
//+
Physical Surface("outlet") = {181, 203, 217};
//+
Physical Surface("wall_channel") = {1, 367, 60, 380, 358, 55, 2, 213, 226, 204, 182, 177, 13, 14, 3, 15};
//+
Physical Surface("wall_porous") = {301, 279, 94, 314, 292, 160, 82, 336, 270, 138, 116, 248, 73, 239, 111, 6, 11, 10, 9, 8, 7, 4, 5, 12};
//+
Physical Volume("fluid") = {1, 14, 15, 6, 7, 8};
//+
Physical Volume("porous") = {2, 9, 3, 4, 5, 11, 12, 13};
//+
Physical Volume("tailor") = {10};
