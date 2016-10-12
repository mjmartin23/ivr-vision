function [ out,centres,groups ] = mean_shift( im,k_size ,n_iter,window  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
out = im;   
[i,j,k] = size(im);
groups=cell(k_size);
centres=cell(k_size);
for count = 1:k_size
centres{count} = round(random('unif',100*ones(k),ones(k)*250));
end
oldcentres = centres;

for count = 1: n_iter
    %disp(count);
     centres{1:k};

  for clustcount = 1:k_size
    c = centres{clustcount};
    
    for kcount = 1:k
    if(isnan(c(kcount)))
        c(kcount)=0;
    end
        vals(:,:,kcount,clustcount) = im(:,:,kcount)-c(kcount) ;
    end
    vals(:,:,:,clustcount) = vals(:,:,:,clustcount).^2;
    sums(:,:,clustcount)= sum(vals(:,:,:,clustcount),3);
  end
    [mins,minArgs] = min(sums,[],3);
    
    ave = mode(mode(min(min(sums,3))));
    for clustercount = 1:k_size
        is= find((minArgs == clustercount)==((mins < (window))));
        size(is);
        [is,js] = ind2sub(size(minArgs),is);
        ind = sub2ind(size(im(:,:,1)),is,js);
        

        groups{clustercount} = [is,js];
        
        
        vec=[];
        for ck = 1:k
            ims=im(:,:,ck);
            vec = [vec,ims(ind)];
        end
        oldcentres{clustercount} = centres{clustercount};
        centres{clustercount} = round(nanmean(vec));
        for kcon = 1:k
            if(isnan(centres{clustercount}(kcon)))
               centres{clustercount} = oldcentres{clustercount};
               break;
            end
        end
        
    end 
%         disp(groups)
       for clustcount=1:k_size
                mat = groups{clustcount};
                col1 = mat(:,1);
                col2 =mat(:,2);
                indxs=[];
                for kcount = 1:k
                    indxs = [indxs,sub2ind(size(out(:,:,1)),col1,col2)];
                    outer = out(:,:,kcount);
                    outer(indxs) = 50*(clustcount-1);
                    out(:,:,kcount) = outer; 

                end
       end
        %figure(2);
        %imshow(out);
    
end

% cleaning:       
bw = im2bw(out);
out = bwareaopen(1-bw,20);
%figure(3),imshow(cleaned);
    

end

