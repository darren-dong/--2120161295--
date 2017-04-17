clear all;
dat=xlsread('data_join.xlsx');
data=xlsread('data_join.xlsx');
data1=xlsread('data_join.xlsx');
data2=xlsread('data_join.xlsx');
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
data1(isnan(data1)==1)=0;
data2(isnan(data2)==1)=-1;
p=zeros(28,28);
r=zeros(28,28);
val1=data1(1,:)';
for i=1:28
    val1=data1(i,:)';
    for j=1:28
        val2=data1(j,:)';
        [r(i,j),p(i,j)]=corr(val1,val2);
    end
end
for i=1:28
    p(i,i)=1;
end
disp('corr compute succeed');
loc=zeros(28,4);
for k=1:28
    vmin=min(p(k,:));
    lmin=find(p(k,:)==vmin);
    if vmin<0.05
        loc(k,1)=k;
        loc(k,2)=lmin;
    end
end
disp('corr_subject succeed');
for k=1:28
    nh1=data1(loc(k,1),:);
    nh2=data2(loc(k,2),:);
    loc(k,3:4)=polyfit(nh2,nh1,1);
end
disp('polyfit succeed');

for i=1:28
    k=loc(i,3);
    b=loc(i,4);
    xl=loc(i,2);
    for j=1:368
        if data2(i,j)==-1
            x=data1(i,xl);
            data(i,j)=k*x+b;
        end
    end
end
disp('re_corr succeed');
xlswrite('re_corr.xlsx',data);
disp('re_corr save succeed!');
        
        


        