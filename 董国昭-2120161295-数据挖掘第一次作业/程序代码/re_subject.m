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

for i=1:368
    sub1=data1(:,i);
    score=zeros(27,1);
    score_sum=zeros(368,1);
    for j=1:368
        sub2=data1(:,j);
        for n=1:20
            ncom1=sub1(numlist(n),1);
            ncom2=sub2(numlist(n),1);
            if ncom1==ncom2
                if ncom1==0
                    score(n,1)=100;
                else
                    score(n,1)=0;
                end
            else
                score(n,1)=1;
            end
        end
        for v=1:7
            vcom1=sub1(numlist(v),1);
            vcom2=sub2(numlist(v),1);
            if vcom1==vcom2
                if vcom1==0
                    score(v+20,1)=100;
                else
                    score(v+20,1)=abs(vcom1-vcom2);
                end
            else
                score(v+20,1)=abs(vcom1-vcom2);
            end
        end
        score_sum(j,1)=sum(score);
    end
    score_sum(i,1)=99999;
    disp('score sum succeed!')
    loc=find(score_sum==min(score_sum));
    for k=1:28
        if data2(k,i)<0
            data(k,i)=data(k,min(loc));
        end
    end
    disp('data rewrite succeed!');      
end
xlswrite('re_subject.xlsx',data);
disp('re_subject save succeed!');
        
    