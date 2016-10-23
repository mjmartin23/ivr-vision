% classifies a test feature vector v into one of N classes
% given the class means (Means) and inverse of covariance matrices
% (Invcors) and aprori probabilities (Aprioris)
function [class,top3] = classify(v,N,Means,Invcors,Dim,Aprioris,feats,clusters)

        evals = zeros(N,1);
        spens = zeros(N,1);
        fpens = zeros(N,1);
        for i = 1 : N
            % We need to reshape since Invcors(i,:,:) gives 1xDimxDim matrix
            IC = reshape(Invcors(i,:,:),Dim,Dim);
            evals(i) = multivariate(v,Means(i,:),IC,Aprioris(i));
            
            surfC = clusters.surf{i};
            s = cell2mat(feats.surf);
            
            spen =0;
            for j = 1:size(s,1)
                spen = spen +min(sum(bsxfun(@minus,surfC,s(j,:)).^2));
            end
            spens(i) =spen;
            
           fastC = clusters.fast{i};
            f = cell2mat(feats.fast);
            fpen =0;
            for j = 1:size(s,1)
                fpen =fpen +min(sum(bsxfun(@minus,fastC,f(j,:)).^2));
            end
            fpens(i) =fpen;
            
        end
        fprobs = fpens/sum(fpens);
        sprobs = spens/sum(spens);
        if(sum(fpens)~=0 && sum(spens)~=0)    
        evals = evals.*fprobs;
        end
        bestclasses = find(evals == max(evals));
        top3 = zeros(3,2);
        %for i =1:3
%             
%             [j,k] = max(evals)
%             top3(i,:) = [j,k]
%             evals = evals([1:k-1,k+1:end],:);
        %end
        class = bestclasses(1);
