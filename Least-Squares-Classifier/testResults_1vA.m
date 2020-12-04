% This is automatically run in runResults.m
%
% Running testResults_1vA.m finds and saves the error rate and confusion
% matrix for the 1-v-A classifier run on the testing data.
%
% Reference trainResults_1vA.m for comments

load('mnist.mat', 'testX', 'testY');
load Z_1vA.mat;

nSamp = 10000;
X = double([testX ones(nSamp,1)]);
yTilda = X*Z_1vA;
votes = zeros(nSamp,10);

[M,I] = max(yTilda,[],2);
yHat = I - ones(nSamp,1);

testY = testY';

confusionMatrix_test_1vA = zeros(10,10);
for m=1:nSamp
    confusionMatrix_test_1vA(testY(m)+1,yHat(m)+1) = confusionMatrix_test_1vA(testY(m)+1,yHat(m)+1) +1;
end

nErrors = nnz(double(testY)-yHat);
errorRate_test_1vA = nErrors/nSamp;

save("confusionMatrix_test_1vA.mat","confusionMatrix_test_1vA");
save("errorRate_test_1vA.mat","errorRate_test_1vA");
