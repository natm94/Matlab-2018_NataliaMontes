% Matlab Final Project by Natalia Montes
% This program looks to analyze data from a study in which participants
% with high BMI scores were asked a small series of high
% vulnerability-inducing questions. Mean HR was collected pre and post. 

%% Importing Dataset 

[~, ~, raw] = xlsread('C:\Users\natmm\Documents\Winter 2018\Matlab Winter 2018\Project\projectdataset.xlsx','Sheet1','A2:C18');

data = reshape([raw{:}],size(raw));

participant_number = data(:,1);
%participants with NaNs have already been removed
pre_HR = data(:,2);
post_HR = data(:,3);
data(:,4) = pre_HR-post_HR;
mean_difference = data(:, 4);
mean_difference = sqrt(mean_difference.^2);

clearvars data raw;

%Participant and Mean Difference
disp([participant_number mean_difference])
%% Paired Samples T Test for Difference Between Pre and Post HR Means

%pre-defined *function* for T-Test! 
H = ttest(pre_HR, post_HR) 

% A returned value of h = 0 indicates that ttest does not reject the null
% hypothesis at the 5% significance level. 

%% Displaying the Data (Plotting) 

x = pre_HR;
y = post_HR;

figure(1)
scatter(x, y,'w*')
title('Mean HR Data per Participant')
xlabel('Mean BPM (Pre)')
ylabel('Mean BPM (Post)')
set(gcf,'color','cyan');
set(gca,'color','black')
%% Findind Anomaly Participants w/ Mean Differences > 10 

newdata = [participant_number pre_HR post_HR mean_difference];

x = find(newdata(:, 4)>10);
silly_anomalies = newdata(x, :)

%% Loading Anomaly .acq Files 

chan3pre = load_acq('hrv3pre.acq');
chan3post = load_acq('hrv3post.acq');
chan32pre = load_acq('hrv32pre.acq');
chan32post = load_acq('hrv32post.acq');
chan33pre = load_acq('hrv33pre.acq');
chan33post = load_acq('hrv33post.acq');
chan39pre = load_acq('hrv39pre.acq');
chan39post = load_acq('hrv39post.acq');

%% Plotting Continous Data 

plotacq(chan3pre)