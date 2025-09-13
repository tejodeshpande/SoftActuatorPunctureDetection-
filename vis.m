clc;clear;
% for ii = 1:1:
ii=1;
number =int2str(ii);
fname = ['Perturb_Data New/Chamber',number,'F.csv'];
wname = ['Perturb_Data New/Chamber',number,'W.csv'];

A=readmatrix(fname);
B=readmatrix(wname);

from =90;
% len = 200
% till = from+len -1;
till = 270;

subA =A(from:till,:);
subB =B(from:till,:);

% %Calculate mean 
meanA= mean(subA);
meanB= mean(subB);

subA = subA-meanA;
subB = subB-meanB;

% visualize data

t = linspace(0,1.5,100);
% figure(1)
% plot(t,subA(1:100,:),LineWidth=2)
% legend('ax','ay','az','gx','gy','gz')
% title(fname(18:100))


figure(2)
plot(t,subB(1:100,:),LineWidth=2)
legend('ax','ay','az','gx','gy','gz')
% % title(wname(18:end-4))


grid on
xlabel("Time (s)");
ylabel("Amplitude");


fontsize(26,"points")

% fft params

% Fs = 12 ; %Hz
% T= 1/Fs; % Sampling length 
% L = till-from+1; %signal length
% t = (0:L-1) * T; %Time Vector


% perform fft

% afft = fft(subA); 
% bfft = fft(subB);
% 
% %visualize fft 
% 
% figure(3)
% plot(Fs/2*L*(0:L-1),abs(afft),LineWidth=1)
% legend('ax','ay','az','gx','gy','gz')
% title([fname(18:end-4),'(fft)'])
% figure(4)
% plot(Fs/L*(0:L-1),abs(bfft),LineWidth=1)
% legend('ax','ay','az','gx','gy','gz')
% title([wname(18:end-4),'(fft)'])
    
    % saveas(1,['Chamber',number,'F'],'png')
    % saveas(2,['Chamber',number,'w'],'png')
    % saveas(3,['Chamber',number,'F(FFT)'],'png')
    % saveas(4,['Chamber',number,'W(FFT)'],'png')
% end