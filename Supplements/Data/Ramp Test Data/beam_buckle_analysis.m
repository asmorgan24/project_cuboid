% slope test: what minimum pressure was required for the cuboid to roll up
% a slope ? 

P = [25, 28,30,33,37,42]; % pressures were read from the wall on an analog pressure reader accurate to 0.5 kpa 
P = P + 68; % kpa units 


alpha = [0, atan(.5/36), atan(1/36), atan(1.5/36), atan(2.5/36),  atan((4.25)/36)];% our setup was a table which we measured %%dimensions of so we could do math to calculate angle of grade 
alpha = rad2deg(alpha); 

figure(); hold on; ylim([24+68,45+68]); xlim([-0.4, 7])
plot(alpha, P, 'k', 'linewidth', 2); 
plot(alpha, P, 'ok', 'markersize', 10); 
ylabel('Minimum Pressure, P_{min} [kPa]'); xlabel('Grade angle, \alpha [\circ]');
ax = gca; ax.FontSize = 20; 
ax.FontWeight = 'bold';
ax.LineWidth = 2; 
box(ax,'on')

