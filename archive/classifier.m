function [ output_args ] = classifier( im,bin,w )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [is,js] = size(im,1);
    grps;
    prevclass = 0;
    i=bin(1);
    j=bin(2);
    while(true)
            ind = [i-1,j;i,j-1;i+1,j;i,j+1];
            sub(:,:,1) = im(i-w:i+w,j-w:j+w);
            sub(:,:,2) = im(i-1-w:i-1+w,j-w:j+w);
            sub(:,:,3) = im(i-w:i+w,j-1-w:j-1+w);
            sub(:,:,4) = im(i+1-w:i+1+w,j-w:j+w);
            sub(:,:,5) = im(i-w:i+w,j+1-w:j+1+w);
            
            for c = 1:5
            [class,prob] = classify(sub(:,:,c));
            if(class ~= 0)
                classes(c,:) = [class,prob];
            end
            end
            %check for empty matrix
            if(isempty(classes))
                %Do stuff
                if(i+1<i+1+w)
                i = i+1;
                elseif(j+1<j+1+w)
                    j=j+1;
                else
                    %Do stuff.
                end
            else
            [index,prob] = max(classes(:,2));
            maxFound = index==1;
            end
            if(maxFound)
                temp = groups{index};
                temp(:,:,size(temp,3)+1) = sub(:,:,index);
                %remove indexs in subimage from main index image
                
                break;
            else
                maxProb = prob;
                [index,prob] = max(classes(2:end,2));
                i = ind(index,1);
                j = ind(index,2);

            end
    end

end

