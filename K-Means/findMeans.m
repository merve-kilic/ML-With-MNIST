function [ctr, Jclust, closest10] = findMeans(data,centers,K)

    nFeat = size(data,2); % number of features (784)
    nSamp = size(data,1); % number of samples (60,000 for training data)
    diff = zeros(nSamp,K); % matrix of zeros (size nsamp by K)
       
    ctr = zeros(K,nFeat); % matrix of zeros (size K by nfeat)
    
    for k=1:K
        diff(:,k) = sum((data-ones(nSamp,1)*centers(k,:)).^2, 2);
        % First, the difference between the rows in data and the ith row of
        % centers is calculated and saved as a matrix of the same size as
        % data.
        % Next, each element of the matrix is squared rather than taking
        % the 2-norm and squaring. 
        % Lastly, diff saves the sum of each row as a column vector which
        % is assigned to column i of diff.
    end

    [M, Ind] = min(diff,[],2); 
    % ind is a column vector with the index of the minimum value of each
    % row ####
    % This represents which cluster's mean value it is closes to, and
    % therefore, which cluster it belongs to.
    
    vn = 0;
    closest10 = zeros(10*K, nFeat);
    for k=1:K
        clust = data(find(Ind==k),:);
        % find all the data points (rows in data) that belong in cluster i
        clust_size = size(clust,1);
        % number of data points in cluster i
        ctr(k,:) = mean(clust);
        % assign the mean of the new cluster as the new center of cluster i
        dist = sum((clust-ones(clust_size,1)*ctr(k,:)).^2,2);
        % 2-norm squared of each point in the cluster minus the mean of the
        % cluster
        if clust_size >= 10
            [m,ind] = mink(dist,10);
            % ind is a vector of the indeces of the 10 closest data points to
            % the mean
            for j=1:10
                closest10(10*k-10+j,:) = clust(ind(j),:);
                % assigning closest 10 data points in each cluster
            end
        else
            for j=1:clust_size
                closest10(10*k-10+j,:) = clust(j,:);
            end
            for j=clust_size+1:10
                closest10(10*k-10+j,:) = zeros(1,nFeat);
            end
        end
        vn = vn + sum(dist); 
        % vn is the sum of the square of the 2-norm of each data point's
        % distance from the center/mean of the cluster it is in.
    end
        Jclust = vn / nSamp;
end

