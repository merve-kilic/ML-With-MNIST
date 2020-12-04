% Running RUN_THIS.m finds and saves the alpha and beta values for each 
% classifier based on the training data in mnist.mat. Then it saves the 
% error rates and confusion matricies for all classifiers.

load('mnist.mat', 'trainX', 'trainY');
findBetaAlpha(trainX,trainY);
testResults_1v1;
testResults_1vA;
trainResults_1v1;
trainResults_1vA;