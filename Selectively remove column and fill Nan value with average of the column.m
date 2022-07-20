%-----------------------this script is used to selectively maintain specific columns of table and fill the NaN values with the average value of the corresponding column and write to text format
clear
Maindir = 'E:\xiuxian\VRdata\BOTREC\newtrial\social-nonsocial'  
BIDsdir = '\BIDs'
sublist = dir(fullfile(Maindir, BIDsdir, 'sub*')) 
confoundlist = dir(fullfile(Maindir, BIDsdir, '**\*desc-confounds_timeseries.xlsx*'))

for i = 1:length(confoundlist)
    cd(confoundlist(i).folder)
    conftable = readtable([confoundlist(i).folder, filesep, confoundlist(i).name]);
    conftable = table2array(conftable(:, {'global_signal', 'csf', 'white_matter', 'csf_wm', 'dvars', 'framewise_displacement', 'trans_x', 'trans_y', 'trans_z', 'rot_x', 'rot_y', 'rot_z'}));
    conftable = fillmissing(conftable, 'nearest')
    writematrix(conftable, 'regressor.txt', 'Delimiter','\t');
end
    