% ---------------------------- Copyright Notice ---------------------------
% This file is part of BioPatRec © which is open and free software under 
% the GNU Lesser General Public License (LGPL). See the file "LICENSE" for 
% the full license governing this code and copyrights.
%
% BioPatRec was initially developed by Max J. Ortiz C. at Integrum AB and 
% Chalmers University of Technology. All authorsí contributions must be kept
% acknowledged below in the section "Updates % Contributors". 
%
% Would you like to contribute to science and sum efforts to improve 
% amputeesí quality of life? Join this project! or, send your comments to:
% maxo@chalmers.se.
%
% The entire copyright notice must be kept in this or any source file 
% linked to BioPatRec. This will ensure communication with all authors and
% acknowledge contributions here and in the project web page (optional).
%
% ------------------- Function Description ------------------
% Reads the file sensors.def and loads the data into sensor objects.
% --------------------------Updates--------------------------
% 2015-06-11 / Sebastian Karlsson  / Creation

function obj = InitSensors

global ctrl_dir

sensorspath = 'sensors.def';
if ctrl_dir
    sensorspath = [ctrl_dir filesep 'sensors.def'];
end

fid = fopen(sensorspath);
if fid == -1
    obj = -1;
else
    tline = fgetl(fid);
    i = 1;
    while(ischar(tline))
        t = textscan(tline,'%s','delimiter',',');
        t = t{1};
        obj(i) = sensor(t(1), t(2));
        tline = fgetl(fid);
        i = i + 1;
    end
    fclose(fid);
end
