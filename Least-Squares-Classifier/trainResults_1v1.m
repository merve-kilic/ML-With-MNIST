% This is automatically run in runResults.m
%
% Running trainResults_1v1.m finds and saves the error rate and confusion
% matrix for the 1-v-1 classifier run on the training data.

load('mnist.mat', 'trainX', 'trainY');
load Z_1v1.mat; 
% Z_1v1 is a matrix with rows of all the beta values and the last one being
% alpha, and each column is for each classifier.

nSamp = 60000;
IJ = zeros(45,2);
count = 1;
for i=0:8
    % This loop assigns values for the IJ matrix which stores the pairs i
    % and j in order of which the classifier called them (order of columns
    % of Z_1v1)
    for j=i+1:9
        IJ(count,1) = i;
        IJ(count,2) = j;
        count = count + 1;
    end
end
X = double([trainX ones(nSamp,1)]);
yTilda = X*Z_1v1; % predicted y on a scale of -1 to 1
votes = zeros(nSamp,10);

for r=1:nSamp
    % This loop votes to decide what the predicted y values are
    for c=1:45
        if yTilda(r,c) > 0
            votes(r,IJ(c,1)+1) = votes(r,IJ(c,1)+1) + 1;
        elseif yTilda(r,c) < 0
            votes(r,IJ(c,2)+1) = votes(r,IJ(c,2)+1) + 1;
        end
    end
end

[M,I] = max(votes,[],2);
yHat = I - ones(nSamp,1); % predicted y values

trainY = trainY';

confusionMatrix_train_1v1 = zeros(10,10);
for m=1:nSamp
    % This loop assigns values to the confusion matrix
    confusionMatrix_train_1v1(trainY(m)+1,yHat(m)+1) = confusionMatrix_train_1v1(trainY(m)+1,yHat(m)+1) +1;
end

nErrors = nnz(double(trainY)-yHat);
errorRate_train_1v1 = nErrors/nSamp; % Calculate the error rate

save("confusionMatrix_train_1v1.mat","confusionMatrix_train_1v1");
save("errorRate_train_1v1.mat","errorRate_train_1v1");
