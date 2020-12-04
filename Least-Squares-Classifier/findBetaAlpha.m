function [Z_1v1, Z_1vA] = findBetaAlpha(trainX,trainY)
% Solve least squares problem for beta and alpha

    Z_1v1 = zeros(785,45);
    Z_1vA = zeros(785,10);
    
    count = 1; % count will count which number classifier is being computed
    for i=0:8
        for j=i+1:9
            [X,Y] = getTrainData(i,j,trainX,trainY);
            Z_1v1(:,count) = pinv(X'*X)*X'*Y;
            % Z is beta and alpha where the first 784 columns are the beta 
            % values and the last column is the alpha values. Each column
            % represents a classifier
            count = count + 1;
            % increment count
        end
    end

    for i=0:9
        j = [0,1,2,3,4,5,6,7,8,9];
        j(i+1) = [];
        [X,Y] = getTrainData(i,j,trainX,trainY);
        Z_1vA(:,i+1) = pinv(X'*X)*X'*Y;
        % Z is beta and alpha where the first 784 columns are the beta 
        % values and the last column is the alpha values. Each column
        % represents a classifier
    end
end