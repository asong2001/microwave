function draw_smich_chart
    % Draw outer circle
    t = linspace(0, 2*pi, 100);
    x = cos(t);
    y = sin(t);
    plot(x,y, 'LineWidth', 3);
    axis equal;

    % place title
    title('Smith Chart');
    set(get(gca, 'XLabel'), 'String', {[]});
    set(get(gca, 'YLabel'), 'String', {[]});
    hold on

    % circles along horizontal
    k = [0.25 0.5 0.75];
    for i = 1:length(k)
        x(i, :) = k(i) + (1 - k(i)) * cos(t);
        y(i, :) = (1 - k(i)) * sin(t);
        plot(x(i,:),y(i,:),'k');
    end

    % draw partial circles along vertical axis
    kt = [2.5 pi 3.79 4.22];
    k = [0.5 1 2 4];
    for i = 1:length(kt)
        t = linspace(kt(i) , 1.5 * pi, 50);
        a(i,:) = 1 + k(i) *cos(t);
        b(i,:) = k(i) + k(i) * sin(t);
        plot(a(i,:), b(i,:) , 'k', a(i,:), -b(i,:), 'k');
    end
end