function [m, thd, SWR, rloss] = smith_ch_calc(Z0,Z1)
    % Draw chart
    draw_smith_chart;
    
    % normalize impedance 
    zl = Z1 / Z0;
    
    % Reflection
    g = (zl - 1) / (zl + 1);
    m = abs(g);
    th = angle(g);

    % plot point
    polar(th, m, 'r*');

    % radians to degrees
    thd = th * 180/pi;

    % VSWR and reture loss
    SWR = (1 + m) / (1 - m + eps);
    rloss = -20 * log10(m + eps);
end