% This is automatically run in runResults.m
%
% Running trainResults_1vA.m finds and saves the error rate and confusion
% matrix for the 1-v-A classifier run on the training data.

load('mnist.mat', 'trainX', 'trainY');
load Z_1vA.mat;
% Z_1vA is a matrix with rows of all the beta values and the last one being
% alpha, and each column is for each classifier.

nSamp = 60000;
X = double([trainX ones(nSamp,1)]);
yTilda = X*Z_1vA;

[M,I] = max(yTilda,[],2);
yHat = I - ones(nSamp,1); % predicted y values

trainY = trainY';

confusionMatrix_train_1vA = zeros(10,10);
for m=1:nSamp
    % This loop assigns values to the confusion matrix
    confusionMatrix_train_1vA(trainY(m)+1,yHat(m)+1) = confusionMatrix_train_1vA(trainY(m)+1,yHat(m)+1) +1;
end

nErrors = nnz(double(trainY)-yHat);
errorRate_train_1vA = nErrors/nSamp; % Calculate the error rate

save("confusionMatrix_train_1vA.mat","confusionMatrix_train_1vA");
save("errorRate_train_1vA.mat","errorRate_train_1vA");
