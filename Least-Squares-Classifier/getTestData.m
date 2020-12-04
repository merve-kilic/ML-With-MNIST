function [X,Y] = getTestData(primary,versus)
% Extracts Train data from MNIST
%   (same logic as getTrainData.m but uses test data rather than train data

    load('mnist.mat', 'testX', 'testY');
    indP = find(testY==primary);
    indV = [];
    for i=1:length(versus) 
        indV = [indV find(testY==versus(i))];
    end

    XP = testX(indP,:);
    XV = testX(indV,:);

    YP = testY(indP);
    YV = testY(indV);

    YPb = ones([1 length(YP)]);
    YVb = -ones([1 length(YV)]);

    X = [XP; XV];
    Y = [YPb'; YVb'];
    X = [X ones(length(Y),1)];
    X = double(X);

end

