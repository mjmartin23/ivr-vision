% returns filename files and paths folderNames of each file in cell array
% of directories: paths
function [ files, folderNames ] = pullFiles( paths )
    files = {};
    folderNames ={};
    for k = 1:length(paths)
        path = paths{k};
        [~,attr] = fileattrib(strcat(path,'*.jpg'));
        for file = attr
            folderName = regexp(path,'/','split');
            name = file.Name;
            folderNames{end+1} = folderName{end-1};
            files{end + 1} = imread(name);        
        end
    end

end

