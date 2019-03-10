function [m, thd, SWR, rloss, radii] = smith_ch_calc(Z0,Z1)
    % Draw chart
    draw_smith_chart;
    
    % normalize impedance 
    zl = Z1 / Z0;
    disp(['zl ',num2str(zl)]);
    
%     % 显示均一化之后的点
%     zl_polar = [2*sqrt(2) -4 /pi];
%     [x, y] = pol2cart(zl_polar(2), zl_polar(1));
%     plot(x,y,'b*');
%     hold on
    
    % Reflection
    g = (zl - 1) / (zl + 1);
    m = abs(g);
    th = angle(g);

    % plot appropriate point
    polar(th, m, 'r*');
    
    % 求交叉点的笛卡尔坐标系
    [x, y] = pol2cart(th, m);
    origin = [0 0];
    radii = norm([x y]-origin);
    disp(['x  ', num2str(x)]);
    disp(['y  ', num2str(y)]);

    % radians to degrees
    thd = th * 180/pi;

    % VSWR and reture loss
    SWR = (1 + m) / (1 - m + eps);
    rloss = -20 * log10(m + eps);
end