clc; clear;

% Load data
ii = 1;
number = int2str(ii);
fname = ['Perturb_Data New/Chamber', number, 'F.csv'];
wname = ['Perturb_Data New/Chamber', number, 'W.csv'];

A = readmatrix(fname);
B = readmatrix(wname);

% Set sampling parameters
Fs = 12;             % Hz
T = 1 / Fs;          % Sampling interval
windowSize = 200;    % Length of the sliding window
maxStart = size(A, 1) - windowSize + 1;

% Create a figure for plots
hFig = figure('Name', 'Sliding Window Visualization', 'NumberTitle', 'off', 'Position', [100, 100, 1200, 600]);

% Create slider
uicontrol('Style', 'slider', ...
    'Min', 1, 'Max', maxStart, ...
    'Value', 400, ...
    'SliderStep', [1/(maxStart-1) 10/(maxStart-1)], ...
    'Position', [150 20 900 20], ...
    'Callback', @(src, event) updatePlots(round(get(src, 'Value'))));

% Initial plot call
updatePlots(400);

% Callback function
function updatePlots(startIdx)
    % Access shared variables
    ii = 1;
    number = int2str(ii);
    fname = ['Perturb_Data New/Chamber', number, 'F.csv'];
    wname = ['Perturb_Data New/Chamber', number, 'W.csv'];
    A = readmatrix(fname);
    B = readmatrix(wname);
    Fs = 12;
    T = 1 / Fs;
    windowSize = 200;
    till = startIdx + windowSize - 1;

    % Extract window
    subA = A(startIdx:till, :);
    subB = B(startIdx:till, :);

    % Mean subtraction
    meanA = mean(subA);
    meanB = mean(subB);
    subA = subA - meanA;
    subB = subB - meanB;

    % Time vector
    L = windowSize;
    t = (0:L-1) * T;

    % FFT
    afft = fft(subA);
    bfft = fft(subB);

    % Clear and redraw figures
    clf;

    subplot(2,2,1);
    plot(t, subA);
    legend('ax','ay','az','gx','gy','gz');
    title(['A: ', fname(18:end-4), ', Start=', num2str(startIdx)]);

    subplot(2,2,2);
    plot(t, subB);
    legend('ax','ay','az','gx','gy','gz');
    title(['B: ', wname(18:end-4), ', Start=', num2str(startIdx)]);

    subplot(2,2,3);
    f = Fs * (0:(L-1)) / L;
    plot(f, abs(afft), 'LineWidth', 1);
    legend('ax','ay','az','gx','gy','gz');
    title(['A FFT']);

    subplot(2,2,4);
    plot(f, abs(bfft), 'LineWidth', 1);
    legend('ax','ay','az','gx','gy','gz');
    title(['B FFT']);

    drawnow;
end
