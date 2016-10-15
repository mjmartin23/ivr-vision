% read in all images
function outs = median_filter(Is,medians)
    
    layers = size(Is,2);
    for count = 1:layers
        if(iscell(Is))
            I = Is{count};
            b=false;
        else
            I =Is;
            b=true;
        end
        [rows,cols,~]=size(I);
        I=double(I);
        out = zeros(rows,cols);
        for i = 1:rows
            for j = 1:cols
                diff = sum(abs(medians(i,j,:)-I(i,j,:)));
                if (diff < 50)
                    out(i,j) = 0;
                else
                    out(i,j) = 1;
                end
            end
        end

        out = bwareaopen(out,20);
        if(b)
            outs = out;
            break;
        else
            outs(:,:,count) = out;
        end
    end
end