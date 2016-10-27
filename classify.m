% classifies a test feature vector v into one of N classes
% given the class means (Means) and inverse of covariance matrices
% (Invcors) and aprori probabilities (Aprioris)
function [class,top3] = classify(v,N,Means,Invcors,Dim,Aprioris,vec)

        evals = zeros(N,size(Means,2));
        for i = 1 : N
            % We need to reshape since Invcors(i,:,:) gives 1xDimxDim matrix
            for j = 1:size(Means,2)
            ind = vec{j};
            Dim = size(Means{j},2);
            IC = reshape(Invcors{j}(i,:,:),Dim,Dim);
            evals(i,j) = multivariate(v(ind),Means{j}(i,:),IC,Aprioris{j}(i));
            end       
    
        end
   
        evals = prod(evals,2);
        evals = evals./(Aprioris{1}'.^(numel(Aprioris)-1));
        evals=evals/sum(evals);
        
       
        [p,bestclasses] = max(evals);
        if(p<0.5)
            bestclasses=11;
        end
        top3 = zeros(3,2);
        for i =1:3           
            [j,k] = max(evals);
            top3(i,:) = [j,k];
            evals(k,:) = 0;
        end
        
        class = bestclasses;
