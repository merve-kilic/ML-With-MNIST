function [X,Y] = getTrainData(primary,versus,trainX,trainY)
% Extracts and converts the train data in the input to more usable form
%   primary is the first number in the binary classifier
%   versus is a vector of all possible second numbers in the binary classifier 

    indP = find(trainY==primary);
    % all indecies where the training data is the primary number are found
    indV = [];
    for i=1:length(versus) 
        indV = [indV find(trainY==versus(i))];
        % all indecies where the training data is one of the second numbers
        % is found
    end

    XP = trainX(indP,:);
    % XP are the data points where the corresponding Y is the primary
    % number in the binary classifier
    XV = trainX(indV,:);
    % XV are the data points where the corresponding Y is one of the
    % second values in the binary classifier

    YP = trainY(indP);
    YV = trainY(indV);
    % YP and YV are the corresponding values to XP and XV

    YPb = ones([1 length(YP)]);
    % YP values are turned into 1's
    YVb = -ones([1 length(YV)]);
    % YV values are turned into -1's

    X = [XP; XV];
    % X is all the data points belonging to either of the two values in 
    % the binary classifier 
    Y = [YPb'; YVb'];
    % Y is all the data points belonging to either of the two values in 
    % the binary classifier 
    X = [X ones(length(Y),1)];
    % a vector of 1's is added to the end of the data points because it
    % will correspond to the coeffient of alpha
    X = double(X);
    % X is made into double values to ensure smooth calculations

end

