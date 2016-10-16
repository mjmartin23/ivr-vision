function [ files ] = pullFiles( paths,m )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    files = {};
    for k = 1:length(paths)
        path = paths{k};
        [~,attr] = fileattrib(strcat(path,'*.jpg'));
        for file = attr
            name = file.Name;
            files{end + 1} = imread(name);        
        end
    end

end

