function layers = hier_cluster(I,cutoff)
    % just as useless as kmeans... seems like the cutoff parameter needs to
    % have the number of clusters.
    [rows,cols] = size(I);
    [is,js] = find(I);
    T = clusterdata([is,js],cutoff);
    uni = unique(T);
    length(uni)
    layers = zeros(rows,cols,length(uni));
    for i = 1:length(uni)
        newIm = zeros(size(I));
        [inds,jnds] = find(T == i);
        indexs = sub2ind(size(T),inds,jnds);
        a = [is,js];
        tmp = a(indexs,:);
        indexs = sub2ind(size(I),tmp(:,1),tmp(:,2));
        newIm(indexs) = 1;
        layers(:,:,i) = newIm;
        
        figure(),imshow(newIm);
    end
    
end