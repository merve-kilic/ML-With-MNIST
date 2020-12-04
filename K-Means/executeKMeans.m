function [maxJ, maxCenters, maxClosest10, minJ, minCenters, minClosest10] = executeKMeans(trainX,K,P,epsilon,maxIter)

    init = unidrnd(length(trainX),1,K);
    % vector of length K with elements that are random discrete numbers
    % between 1 and 60,000
    centers = trainX(init,:);
    % centers is the data points at the random K indIcies

    maxJVal = 1e5;
    maxJ = zeros(1,maxIter);
    maxCenters = centers;
    maxClosest10 = zeros(10*K, 784);
    minJVal = 1e7;
    minJ = zeros(1,maxIter);
    minCenters = centers;
    minClosest10 = zeros(10*K, 784);

    for p=1:P
        init = unidrnd(length(trainX),1,K);
        centers = trainX(init,:);
        J=zeros(1,maxIter);
        for i=1:maxIter
            [centers,J(i),closest10] = findMeans(double(trainX),double(centers),K);
            if i>3 && (abs(J(i)-J(i-1)) < epsilon) && (abs(J(i)-J(i-3)) < epsilon)
                if J(i) > maxJVal
                    maxJVal = J(i);
                    maxJ = J;
                    maxCenters = centers;
                    maxClosest10 = closest10;
                end
                if J(i) < minJVal
                    minJVal = J(i);
                    minJ = J;
                    minCenters = centers;
                    minClosest10 = closest10;
                end
                break;
            elseif i == maxIter
                if J(i) > maxJVal
                    maxJVal = J(i);
                    maxJ = J;
                    maxCenters = centers;
                    maxClosest10 = closest10;
                end
                if J(i) < minJVal
                    minJVal = J(i);
                    minJ = J;
                    minCenters = centers;
                    minClosest10 = closest10;
                end
            end
        end
    end
end
