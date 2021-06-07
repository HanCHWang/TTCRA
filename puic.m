% clear all;
% load('FMINCONtime');
% load('FMINCONresults');
% load('TTCRAtime');
% load('TTCRAresults');

dimension=[10 30 50];

figure
plot(dimension,FMINCONtime,'b--o',dimension,TTCRAtime,'-o');

title('convergence time of TTCRA and convex-to-concave')
xlabel('dimension')
ylabel('convergence time/sec')
legend('convex-to-concave','TTCRA') 

figure
plot(dimension,FMINCONresults,'b--o',dimension,TTCRAresults,'-o');

title('convergence results of TTCRA and convex-to-concave')
xlabel('dimension')
ylabel('cost function value')
legend('convex-to-concave','TTCRA') 