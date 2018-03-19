clear all


%% load in data
[~, headers]=xlsread('Psych315W18survey.csv', 'A1:AP1');
[~, ~, data]=xlsread('Psych315W18survey.csv', 'A2:AP153');

%% breakdown of computers by gender 
gender_header=find(strcmp(headers,'gender'));
pc_header=find(strcmp(headers,'computer'));

female_ind=find(strcmp(data(:, gender_header), 'Female'));
male_ind=find(strcmp(data(:, gender_header), 'Male'));
gender=NaN(size(data,1), 1);
gender(female_ind)=1; % set Females to 1
gender(male_ind)=2; % set Females to 1

n_women=length(female_ind);
n_men=length(male_ind);

computer=NaN(size(data,1), 1);
pc_ind=find(strcmp(data(:, pc_header), 'PC'));
computer(pc_ind)=1;
apple_ind=find(strcmp(data(:, pc_header), 'Apple'));
computer(apple_ind)=2;

women_computer=computer(female_ind);
women_pc=length(find(women_computer==1))./n_women;
women_apple=length(find(women_computer==2))./n_women;
men_computer=computer(male_ind);
men_pc=length(find(men_computer==1))./n_men;
men_apple=length(find(men_computer==2))./n_men;

% plot stuff
f=figure(1);
set(f, 'Name','computer by gender');

% bar graph
a1=subplot(2,2,1); % axis!
set(a1, 'FontName', 'Geneva');
t=title('simple bar', 'FontAngle', 'italic');
p1=bar([women_pc women_apple men_pc men_apple]);
set(p1, 'FaceColor', [1 .5 .5])
labels={'women pc' 'women apple' 'men pc' 'men apple'};
set(gca,'XTick', [1:4]);
set(gca,'XTickLabel', labels);

% for binary options the absolute std err is sqrt(npq) where n is the number of
% trials, p is the probability of option a and q is the probability of
% option b
% because we are plotting data after dividing by the number of women and
% the number of men, we need to do that to the stderr as well
sterr=sqrt([[n_women * women_pc * women_apple]./n_women ...
           [n_women * women_pc * women_apple]./n_women ; ...
           [n_men * men_pc * men_apple]./n_men ...
           [n_men * men_pc * men_apple]./n_men]);

a2 = subplot(2,2,2); title('bar plot with errorbars');

p2 = barweb([women_pc women_apple; men_pc men_apple], sterr, .5, {'women' 'men'}, 'gender & computers','percent',[ 1 .5 .5; 1 0 1]); 
%KEEP GETTING AN ERROR ABOVE

set(a2, 'YLim', [0 1.2])

% ================================%
% QUESTION 1. Add a stacked bar plot in this subplot. 
% use >doc bar for help or try this code as an example

bar(subplot(2,1,1), f)
    set(gca,'XTickLabel',{'Apple','PC'});
    legend({'Female','Male'})

bar(subplot(2,1,2), f, 'stacked')
    set(gca,'XTickLabel',{'Apple','PC'});
    legend({'Female','Male'})


% ================================% 

a4=subplot(2,4,7); title('women'); 
l4 = legend({'pc', 'apple'}, 'Position', [0.6917 0.0607 0.1536 0.0905]);
p4 = pie([women_pc women_apple]); hold on

a5=subplot(2,4,8); title('men')
p5 = pie([ men_pc men_apple]); hold on


%% do computers rot your brain

p.friends = [3 5 9 20 49 16 13 4 6 19 5 0];
p.hours_gaming = [3 5 19 50 20 13 49 1 4 6 24 2];
p.hours_slept = [ 8 9 7 4 5 4 3 9 10 8 7 10];
p.Netflix = [ 1 7 2 8 3 9 4 19 39 1 2 4];

facebook_header=find(strcmp(headers,'friends'));
grade_header=find(strcmp(headers,'Exam1'));

figure(2);
set(gcf,'Name', 'Do computers rot your brain?');
subplot(1,3,1)
plot([data{:,facebook_header}], [data{:, grade_header}], 'ko');
xlabel('Facebook friends')
ylabel('grade')


% ================================% 
% QUESTION 2.add a subplot that is the same as the one above but
% replaces facebook friends with the number of gaming hours 
% ================================% 

set(subplot(2,2,1), 'XLim',[-500, 3500])
set(subplot(2,2,1), 'YLim',[30, 110])
set(subplot(2,2,1), 'XTick', [0 1500 3000])
set(subplot(2,2,1), 'YTick', 30:10:100)

subplot(2,2,2)
plot(p.friends, p.hours_gaming)
xlabel('Facebook friends')
ylabel('grade')
set(subplot(2,2,2), 'XLim',[-500, 3500])
set(subplot(2,2,2), 'YLim',[-1, 8])
set(subplot(2,2,2), 'XTick',0:1500:3000)
set(subplot(2,2,2), 'YTick',0:1:7)

% ================================% 
% QUESTION 3.add a subplot that is the same as the one above but
% plots  the number of gaming hours on the x-axis, and the number of hours
% of sleep on the y-axis
% ================================% 

subplot(2,2,3)
plot(p.hours_gaming, p.hours_slept);
xlabel('hours gaming')
ylabel('hours slept')
set(subplot(2,2,3), 'XLim',[-2.5, 12.5])
set(subplot(2,2,3), 'YLim',[3, 11])
set(subplot(2,2,3), 'XTick',0:5:10)
set(subplot(2,2,3), 'YTick',4:1:10)

% ================================% 
% QUESTION 4. In figure 3. use plot3d to do a 3d plot comparing hours slept, gaming and
% facebookfriends
% ================================% 

subplot(2,2,4)
plot(p.hours_gaming, p.Netflix);
xlabel('hours gaming')
ylabel('Netflix')
set(subplot(2,2,4), 'XLim',[-2.5, 12.5])
set(subplot(2,2,4), 'YLim',[0, 5])
set(subplot(2,2,4), 'XTick',0:5:10)
set(subplot(2,2,4), 'YTick',1:1:4)

% ================================% 
% QUESTION 5. Choose anything to plot and plot it
% ================================% 

figure(3)
scatter(p.hours_gaming, p.hours_slept)