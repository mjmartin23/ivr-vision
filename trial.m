function [ tab,pr,rec,f1,tp ] = trial(tr,te, v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i = 1:size(v,2)
    if(isempty(v{i}))
        v(i) =[];
        i = max(i-1,1);
    end
end
[means,c,p] = train2(tr,v);
[tab,pr,rec,f1,tp] = validate(te,tr.clusters,means,c,p,v);

end

