clear all;
data=xlsread('data_join.xlsx');
data1=xlsread('data_join.xlsx');
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
data1(isnan(data1)==1)=-1;
for i=1:28
    numdata=data(i,:);
    numtab=tabulate(numdata);
    [ma,l]=max(numtab(:,2));
    for j=1:368
        if data1(i,j)==-1
            data1(i,j)=numtab(l,1);
        end
    end
end
xlswrite('re_most.xlsx',data1);
disp('re_mosr save succeed!');
