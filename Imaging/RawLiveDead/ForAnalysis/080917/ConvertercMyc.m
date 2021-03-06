cd('C:\Users\Sam Nguyen\Documents\MATLAB\Imaging\RawLiveDead\080917')
cd('C:\Users\Sam Nguyen\Documents\MATLAB\Imaging\RawLiveDead')
outdir = 'C:\Users\Sam Nguyen\Documents\MATLAB\Imaging\RawLiveDead\080917\';
TimePoints = [20 40 60 80 100 120 140 160];
Positions  = [277 293 314 323 367];

for i = 1:numel(Positions)
    for j = 1:numel(TimePoints)
        load(['080917Pos' num2str(Positions(i)) 'T' num2str(TimePoints(j)) '.mat'])
        objects(j).obj.data = Cell;
        objects(j).obj.trno = 10;
        objects(j).obj.x = 10;
        objects(j).obj.y = 10;
        objects(j).obj.gate = 0;
        
        
    end
end

save([outdir 'CellcMyc.mat'],'objects') 
cd('C:\Users\Sam Nguyen\Documents\MATLAB\Imaging\RawLiveDead\080917')