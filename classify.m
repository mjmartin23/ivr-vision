% classifies a test feature vector v into one of N classes
% given the class means (Means) and inverse of covariance matrices
% (Invcors) and aprori probabilities (Aprioris)
function [class,top3] = classify(v,N,Means,Invcors,Dim,Aprioris,feats,clusters,vec)

        evals = zeros(N,size(Means,2));
        spens = zeros(N,1);
        fpens = zeros(N,1);
        for i = 1 : N
            % We need to reshape since Invcors(i,:,:) gives 1xDimxDim matrix
            for j = 1:size(Means,2)
            ind = vec{j};
            Dim = size(Means{j},2);
            IC = reshape(Invcors{j}(i,:,:),Dim,Dim);
            evals(i,j) = multivariate(v(ind),Means{j}(i,:),IC,Aprioris{j}(i));
            end
            surfC = clusters.surf{i};
            s = cell2mat(feats.surf);
            spen =0;
            for j = 1:size(s,1)
                spen = spen + median((sum(bsxfun(@minus,surfC,s(j,:)).^2,2)));
            end
            
            spens(i) =spen;
            
           fastC = clusters.fast{i};
            f = cell2mat(feats.fast);
            fpen =0;
            if(size(f,1)~=0)
            for j = 1:size(f,1)  
                fpen =fpen +min(sum(bsxfun(@minus,fastC,f(j)).^2));
            end
            end
            fpens(i) =fpen;
            
            
        end
        fprobs = ones(N,1)-(fpens/sum(fpens));
        sprobs = ones(N,1)-(spens/sum(spens));
        evals = prod(evals,2);
        if( sum(spens)~=0)    
        evals = (evals.*sprobs);
        end
        evals = evals/sum(evals)
        
        [~,bestclasses] = max(evals);
        top3 = zeros(3,2);
        %for i =1:3
%             
%             [j,k] = max(evals)
%             top3(i,:) = [j,k]
%             evals = evals([1:k-1,k+1:end],:);
        %end
        class = bestclasses;
