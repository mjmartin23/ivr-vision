N=40;
Constant=12;

    inimage = imread(['simpler/02.jpg'],'jpg');
    inimage = rgb2gray(inimage);
    %inimage = myjpgload('02.jpg',0);
        
    [H,W] = size(inimage);
    outimage = zeros(H,W);
    N2 = floor(N/2);
    for i = 1+N2 : H-N2
%i
      for j = 1+N2 : W-N2
        % extract subimage
        subimage = inimage(i-N2:i+N2,j-N2:j+N2);
        threshold = mean(mean(subimage)) - Constant;
        if inimage(i,j) < threshold
         outimage(i,j) = 1;
        else
         outimage(i,j) = 0;
        end
      end
    end

  figure()
  colormap(gray)
  imshow(outimage)

                           
%out2 = bwmorph(outimage,'open');
%figure(4)
%colormap(gray)
%imshow(out2)
%out3 = bwmorph(out2,'dilate',25);
%out4 = bwmorph(out3,'erode',25);
%figure(5)
%colormap(gray)
%imshow(out4)

