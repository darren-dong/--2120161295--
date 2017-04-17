clear all;
data=xlsread('data_join.xlsx');
listname={'surgery','age','hospital number','rectal temperture','pulse'...
    'respiratory rate','temperature of extremities','peripheral pulse','mucous membranes','capillary refill time'...
    'pain','peristalsis','abdominal distension','nasogastric tube','nasogastric reflux'...
    'nasogastric reflux PH','rectal examination','abdomen','packed cell volume','total protein'...
    'abdominocentesis appearance','abdomcentesis total protein','outcome','surgical lesion','type of lesion'...
    'type of lesion 26','type of lesion 27','cp_data'};
numlist=[1,2,7,8,9,10,11,12,13,14,15,17,18,21,23,24,25,26,27,28];
vallist=[4,5,6,16,19,20,22];
num=20;
val=7;

disp('--------------');
disp('--------------');
disp('part one!');
disp('--------------');
disp('--------------');
for i=1:20
    ii=numlist(i);
    numdata=data(ii,:);
    numtab=tabulate(numdata);
    [m,n]=size(numtab);
    til1=strcat('in_',listname(ii),'  level');
    disp('_________________');
    disp(til1);
    for j=1:m
        til2=strcat('              the number of_',num2str(numtab(j,1)),' is_',num2str(numtab(j,2)));
        disp(til2);
    end
    disp('_________________');
end

disp('--------------');
disp('--------------');
disp('part two!');
disp('--------------');
disp('--------------');
result2=zeros(7,7);
for i=1:7
    ii=vallist(i);
    valdata1=data(ii,:);
    valdata=data(ii,:);
    disp('_________________');
    disp(strcat('the describe of_',listname(ii)));
    result2(i,1)=max(valdata);
    disp(strcat('          the max value is_',num2str(result2(i,1))));
    result2(i,2)=min(valdata);
    disp(strcat('          the min value is_',num2str(result2(i,2))));
    valdata1(isnan(valdata1)==1)=0;
    result2(i,3)=mean(valdata1);
    disp(strcat('          the mean value is_',num2str(result2(i,3))));
    result2(i,4)=prctile(valdata,50);
    disp(strcat('          the Q2 value is_',num2str(result2(i,4))));
    result2(i,5)=prctile(valdata,25);
    disp(strcat('          the Q1 value is_',num2str(result2(i,5))));
    result2(i,6)=prctile(valdata,75);
    disp(strcat('          the Q3 value is_',num2str(result2(i,6))));
    result2(i,7)=sum(isnan(valdata));
    disp(strcat('          the NAN number is_',num2str(result2(i,7))));
    disp('_________________');
    figure(i);
    subplot(2,2,1)
    hist(valdata);
    title(strcat('the histogram of_',listname(ii)));
    subplot(2,2,2)
    qqplot(valdata);
    title(strcat('the Q-Qplot of_',listname(ii)));
    subplot(2,2,3)
    boxplot(valdata);
    title(strcat('the boxplot of_',listname(ii)));
    disp('disp the plot succeed!');
end
