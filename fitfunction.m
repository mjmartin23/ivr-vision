function [ out ] = fitfunction(a,b,c,d,e,f,g,h,i)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
        u=[a,b,c];
        v = [d,e,f];
        w = [g,h,i];
        u = u(u~=0);
        v = v(v~=0);
        w = w(w~=0);
        
        [~,~,~,f1]=trial(tr,val,{u,v,w});
        out = sum(f1);
        

end

