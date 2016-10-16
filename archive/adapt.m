function out = adapt(I,N,C)
    % recommended N=50, C=12
    inimage = rgb2gray(I);
    [H,W] = size(inimage);
    out = zeros(H,W);
    N2 = floor(N/2);
    for i = 1+N2 : H-N2
      for j = 1+N2 : W-N2
        % extract subimage
        subimage = inimage(i-N2:i+N2,j-N2:j+N2);
        threshold = mean(mean(subimage)) - C;
        if inimage(i,j) < threshold
         out(i,j) = 1;
        else
         out(i,j) = 0;
        end
      end
    end

    bw = im2bw(out);
    out = bwareaopen(bw,20);
    figure(),imshow(out);
end