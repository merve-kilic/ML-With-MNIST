% This is automatically run in runResults.m
%
% Running testResults_1v1.m finds and saves the error rate and confusion
% matrix for the 1-v-1 classifier run on the testing data.
%
% Reference trainResults_1v1.m for comments

load('mnist.mat', 'testX', 'testY');
load Z_1v1.mat;

nSamp = 10000;
IJ = zeros(45,2);
count = 1;
for i=0:8
    for j=i+1:9
        IJ(count,1) = i;
        IJ(count,2) = j;
        count = count + 1;
    end
end
X = double([testX ones(nSamp,1)]);
yTilda = X*Z_1v1;
votes = zeros(nSamp,10);

for r=1:nSamp
    for c=1:45
        if yTilda(r,c) > 0
            votes(r,IJ(c,1)+1) = votes(r,IJ(c,1)+1) + 1;
        elseif yTilda(r,c) < 0
            votes(r,IJ(c,2)+1) = votes(r,IJ(c,2)+1) + 1;
        end
    end
end

[M,I] = max(votes,[],2);
yHat = I - ones(nSamp,1);

testY = testY';

confusionMatrix_test_1v1 = zeros(10,10);
for m=1:nSamp
    confusionMatrix_test_1v1(testY(m)+1,yHat(m)+1) = confusionMatrix_test_1v1(testY(m)+1,yHat(m)+1) +1;
end

nErrors = nnz(double(testY)-yHat);
errorRate_test_1v1 = nErrors/nSamp;

save("confusionMatrix_test_1v1.mat","confusionMatrix_test_1v1");
save("errorRate_test_1v1.mat","errorRate_test_1v1");
