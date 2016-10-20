% classifies a test feature vector v into one of N classes
% given the class means (Means) and inverse of covariance matrices
% (Invcors) and aprori probabilities (Aprioris)
function [class,top3] = classify(v,N,Means,Invcors,Dim,Aprioris)

        evals = zeros(N,1);
        for i = 1 : N
            % We need to reshape since Invcors(i,:,:) gives 1xDimxDim matrix
            IC = reshape(Invcors(i,:,:),Dim,Dim);
            evals(i) = multivariate(v,Means(i,:),IC,Aprioris(i));
        end
        bestclasses = find(evals == max(evals));
        top3 = zeros(3,2);
        for i =1:3
 
            [j,k] = max(evals);
            top3(i,:) = [j,k];
            evals = evals([1:k-1,k+1:end],:);
        end
        class = bestclasses(1);
