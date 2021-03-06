cd('C:\Users\Sam Nguyen\Documents\MATLAB\Imaging\080917 - processedNew')
load('segtracksint_EV080917RatioDead2.mat')
load('Model.mat')
Time =struct();
%%%%%%%%%%%%
Gate = 1; %this is live cell
for i= 1:numel(objects)
    a = [];
    b = [];
    t = [];
    p = [];
    for j= 1:numel(objects(i).obj)
        Features = [];
        k = 1;
        Features(k,1) = objects(i).obj(j).data.GeneralArea;
        Features(k,2) = objects(i).obj(j).data.GeneralPerimeter;
        Features(k,3) = objects(i).obj(j).data.logMeanIntensity;
        Features(k,4) = objects(i).obj(j).data.Cutoffpunctaarea;
        Features(k,5) = objects(i).obj(j).data.LapacianPunctaNumber;    
        Features(k,6) = objects(i).obj(j).data.LapacianMeanPunctaArea;
        Features(k,7) = objects(i).obj(j).data.LapacianMeanPunctaPerimeter;
        LiveDead = predict(tree,Features);
        %display(LiveDead);
        if LiveDead(1) == 1
       
                a = [a objects(i).obj(j).data.logYFP];
                b = [b objects(i).obj(j).data.logRFP];
                p = [p objects(i).obj(j).data.p];
                t = [t i];
            
        end
    Time(i).logYFP = a;
    Time(i).logRFP = b;
    Time(i).time = t;
    Time(i).position = p;
    Time(i).cellnum = numel(a);
    
    end
end
YFPtotal = [];
RFPtotal = [];
Timetotal = [];
Ptotal = [];
CelltotalEVLive = [];
for i= 1:numel(objects)
    YFPtotal = [YFPtotal  Time(i).logYFP];
    RFPtotal = [RFPtotal  Time(i).logRFP];
    Timetotal = [Timetotal Time(i).time];
    Ptotal = [Ptotal Time(i).position];
    CelltotalEVLive = [CelltotalEVLive Time(i).cellnum];
end
traw = 1:numel(CelltotalEVLive);
save('CellNumber_EV080917Raw.mat','traw','CelltotalEVLive');

