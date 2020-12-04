clear;
load mnist.mat;
epsilon = 1;
maxIter = 50;

K1 = 20;
P1 = 30;

K2 = 10;
P2 = 20;

K3 = 5;
P3 = 10;

[maxJ_20, maxCenters_20, maxClosest10_20, minJ_20, minCenters_20, minClosest10_20] = executeKMeans(trainX,K1,P1,epsilon,maxIter);
save('maxJ_20.mat','maxJ_20');
save('minJ_20.mat','minJ_20');
save('maxCenters_20.mat','maxCenters_20');
save('minCenters_20.mat','minCenters_20');
save('maxClosest10_20.mat','maxClosest10_20');
save('minClosest10_20.mat','minClosest10_20');

[maxJ_10, maxCenters_10, maxClosest10_10, minJ_10, minCenters_10, minClosest10_10] = executeKMeans(trainX,K2,P2,epsilon,maxIter);
save('maxJ_10.mat','maxJ_10');
save('minJ_10.mat','minJ_10');
save('maxCenters_10.mat','maxCenters_10');
save('minCenters_10.mat','minCenters_10');
save('maxClosest10_10.mat','maxClosest10_10');
save('minClosest10_10.mat','minClosest10_10');

[maxJ_5, maxCenters_5, maxClosest10_5, minJ_5, minCenters_5, minClosest10_5] = executeKMeans(trainX,K3,P3,epsilon,maxIter);
save('maxJ_5.mat','maxJ_5');
save('minJ_5.mat','minJ_5');
save('maxCenters_5.mat','maxCenters_5');
save('minCenters_5.mat','minCenters_5');
save('maxClosest10_5.mat','maxClosest10_5');
save('minClosest10_5.mat','minClosest10_5');
