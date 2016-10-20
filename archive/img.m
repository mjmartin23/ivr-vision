
I=imread('../simpler/02.jpg');
% need to variable-ize 480*640
rmid=median(reshape(I(:,:,1),[1,480*640]));
gmid=median(reshape(I(:,:,2),[1,480*640]));
bmid=median(reshape(I(:,:,3),[1,480*640]));
J = I;
newJ = zeros(480,640);
for i = 1:size(J,1)
    for j = 1:size(J,2)
        if ((J(i,j,1) < rmid+20) && (J(i,j,1) > rmid-20) && ... 
            (J(i,j,2) < gmid+20) && (J(i,j,2) > gmid-20) && ...
            (J(i,j,3) < bmid+20) && (J(i,j,3) > bmid-20))
            newJ(i,j) = 0;
        else
            newJ(i,j) = 1;
        end
    end
end
imshow(newJ);
% 
% newnewJ = zeros(480,640);
% % now compare to nearby pixels
% for i = 2:size(newJ,1)-1
%     for j = 2:size(newJ,2)-1
%         neighbors = 0;
%         
%         neighbors = neighbors + newJ(i-1,j);
%         neighbors = neighbors + newJ(i-1,j+1);
%         neighbors = neighbors + newJ(i,j+1);
%         neighbors = neighbors + newJ(i,j-1);
%         neighbors = neighbors + newJ(i-1,j-1);
%         neighbors = neighbors + newJ(i+1,j);
%         neighbors = neighbors + newJ(i+1,j+1);
%         neighbors = neighbors + newJ(i+1,j-1);
%         
%         if neighbors > 6
%             if newJ(i,j) ~= 1
%                 newnewJ(i,j) = 1;
%             else
%                 newnewJ(i,j) = 1;
%             end
%         elseif neighbors < 2
%             if newJ(i,j) ~= 0
%                 newnewJ(i,j) = 0;
%             else
%                 newnewJ(i,j) = 0;
%             end
%         else
%             newnewJ(i,j) = newJ(i,j);
%         end
%     end
% end
% 
% figure(2), imshow(newJ);
% figure(1), imshow(newnewJ);
% 
% %K=edge(newJ)