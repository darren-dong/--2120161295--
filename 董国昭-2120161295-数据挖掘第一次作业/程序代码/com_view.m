clear all;
data_ys=xlsread('data_join.xlsx');
data_del=xlsread('re_delete.xlsx');
data_mos=xlsread('re_most.xlsx');
data_cor=xlsread('re_corr.xlsx');
data_sub=xlsread('re_subject.xlsx');
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
for i=1:28
    ys=data_ys(i,:);
    del=data_del(i,:);
    mos=data_mos(i,:);
    cor=data_cor(i,:);
    sub=data_sub(i,:);
    figure(i);
    subplot(1,5,1)
    hist(ys);
    title(strcat('the ys of_',listname(i)));
    subplot(1,5,2)
    hist(del);
    title(strcat('the del of_',listname(i)));
    subplot(1,5,3)
    hist(mos);
    title(strcat('the mos of_',listname(i)));
    subplot(1,5,4)
    hist(cor);
    title(strcat('the cor of_',listname(i)));
    subplot(1,5,5)
    hist(sub);
    title(strcat('the sub of_',listname(i)));
end

    
    