% for going the pressure veruss angle graphs for each of the 4 faces 


data = xlsread('face1.xlsx');
p = data(:,1); 
angle = data(:,2); 


data_2 = xlsread('face2.xlsx'); 
p_2 = data_2(:,1); 
angle_2 = data_2(:,2); 


data_3 = xlsread('face3.xlsx'); 
p_3 = data_3(:,1); 
angle_3 = data_3(:,2); 


data_4 = xlsread('face4.xlsx'); 
p_4 = data_4(:,1); 
angle_4 = data_4(:,2); 

figure(); 
hold on; ylabel('Tip angle, \phi_{t}');
ax = gca; ax.FontSize = 20; 
ax.FontWeight = 'bold';
ax.LineWidth = 2; 
box(ax,'on')

plot(p, angle);
plot(p_2,angle_2); 
plot(p_3, angle_3); 
plot(p_4, angle_4); 
legend('1', '2', '3', '4'); 

%linearly interpolate all of them so we can directly compare the samne
%pressures to each other and use the point-wise confidence bars. 
interp_p = 0:0.5:14; 
angle_interp = interp1(p,angle,interp_p);
angle_2interp = interp1(p_2,angle_2,interp_p);
angle_3interp = interp1(p_3,angle_3,interp_p);
angle_4interp = interp1(p_4,angle_4,interp_p);

interp_p = 6894.76*interp_p./1000; % convert from psi to kPa 

hold off;
figure(); 
hold on; ylabel('Tip angle, \phi_{t} [\circ]');
ax = gca; ax.FontSize = 20; 
ax.FontWeight = 'bold';
ax.LineWidth = 2; 
box(ax,'on')

a = smooth(angle_interp,8);
b = smooth(angle_2interp,8);
c = smooth(angle_3interp,8);
d = smooth(angle_4interp,8);

plot(interp_p(1:18), a(1:18),  'color', [0 0.7 0.5],'linewidth', 2);    
plot(interp_p(1:22), b(1:22),  '-b', 'linewidth', 2); 
plot(interp_p(1:17), c(1:17), '-k', 'linewidth', 2); 
plot(interp_p(1:19), d(1:19), 'color',[.7 0 .7], 'linewidth', 2); 

plot(interp_p(18:end), a(18:end),  '--', 'color', [0 0.7 0.5], 'linewidth', 2);
plot(interp_p(22:end), b(22:end),  '--b', 'linewidth', 2); 
plot(interp_p(17:end), c(17:end),   '--k', 'linewidth', 2); 
plot(interp_p(19:end), d(19:end),  '--','color',[.7 0 .7], 'linewidth', 2); 

legend('1', '2', '3', '4'); 
xlabel('Pressure, P [kPa]')
ylim([0 50])
% 
% [hl,hp] = boundedline( hot_dist, mean_hot, 2*std_hot, 'alpha', 'r');
% set(hl, 'linewidth', 2); 
