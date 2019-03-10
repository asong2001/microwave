clc;
clear;
close all;

% [m2, d2, VSWR2, Rloss1] = smith_ch_calc(50, 100 + 50j);

% example 5 data
Z0 = 50;
Zl = 100 + 100 * 1j;
[m5, d5, VSWR5, Rloss5, radii] = smith_ch_calc(Z0, Zl);
grid on

disp(['Magenitude  ',num2str(m5)]);
disp(['VSWR          ',num2str(VSWR5)]);
disp(['Angle           ',num2str(d5)]);
disp(['Return loss  ',num2str(Rloss5)]);

centers = [0 0];
viscircles(centers,radii)