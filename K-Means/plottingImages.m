load maxCenters_10.mat;
load maxCenters_20.mat;
load maxCenters_5.mat;
load minCenters_10.mat;
load minCenters_20.mat;
load minCenters_5.mat;

plotImages_20(minCenters_20,maxCenters_20);
plotImages_10(minCenters_10,maxCenters_10);
plotImages_5(minCenters_5,maxCenters_5);

function [] = plotImages_20(minCenters,maxCenters)
    figure(2);    
    for i=1:20
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(4,5,i),imshow(uint8(Im1'));
        sgtitle("Minimum J-clust Means for K = 20")
    end
    figure(3);
    for i=1:20
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(4,5,i),imshow(uint8(Im1'));
        sgtitle("Maximum J-clust Means for K = 20")
    end
end

function [] = plotImages_10(minCenters,maxCenters)
    figure(4);    
    for i=1:10
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(2,5,i),imshow(uint8(Im1'));
        sgtitle("Minimum J-clust Means for K = 10")
    end
    figure(5);
    for i=1:10
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(2,5,i),imshow(uint8(Im1'));
        sgtitle("Maximum J-clust Means for K = 10")
    end
end

function [] = plotImages_5(minCenters,maxCenters)
    figure(6);    
    for i=1:5
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(1,5,i),imshow(uint8(Im1'));
        sgtitle("Minimum J-clust Means for K = 5")
    end
    figure(7);
    for i=1:5
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(1,5,i),imshow(uint8(Im1'));
        sgtitle("Maximum J-clust Means for K = 5")
    end
end

