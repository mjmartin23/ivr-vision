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
        diff = sum(abs(medians(1:rows,1:cols,:)-I),3);
        out = diff>=50;

        out = bwareaopen(out,25);
        if(b)
            outs = out;
            break;
        else
            outs(:,:,count) = out;
        end
    end
end