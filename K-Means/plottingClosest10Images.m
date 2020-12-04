load maxCenters_10.mat;
load maxCenters_20.mat;
load maxCenters_5.mat;
load minCenters_10.mat;
load minCenters_20.mat;
load minCenters_5.mat;
load minClosest10_10.mat;
load minClosest10_20.mat;
load minClosest10_5.mat;
load maxClosest10_10.mat;
load maxClosest10_20.mat;
load maxClosest10_5.mat;

plotImages_20(minCenters_20,maxCenters_20,minClosest10_20,maxClosest10_20);
plotImages_10(minCenters_10,maxCenters_10,minClosest10_10,maxClosest10_10);
plotImages_5(minCenters_5,maxCenters_5,minClosest10_5,maxClosest10_5);

function [] = plotImages_20(minCenters,maxCenters, minClosest10, maxClosest10)
    figure(2);    
    for i=1:20
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(20,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(minClosest10(j,:),28,28);
            subplot(20,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Minimum J-clust Means for K = 20")
    end
    figure(3);
    for i=1:20
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(20,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(maxClosest10(j,:),28,28);
            subplot(20,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Maximum J-clust Means for K = 20")
    end
end

function [] = plotImages_10(minCenters,maxCenters, minClosest10, maxClosest10)
    figure(4);    
    for i=1:10
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(10,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(minClosest10(j,:),28,28);
            subplot(10,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Minimum J-clust Means for K = 10")
    end
    figure(3);
    for i=1:10
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(10,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(maxClosest10(j,:),28,28);
            subplot(10,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Maximum J-clust Means for K = 10")
    end
end

function [] = plotImages_5(minCenters,maxCenters, minClosest10, maxClosest10)
    figure(6);    
    for i=1:5
        Im1 = reshape(minCenters(i,:),28,28);
        subplot(5,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(minClosest10(j,:),28,28);
            subplot(5,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Minimum J-clust for K = 5")
    end
    figure(7);
    for i=1:5
        Im1 = reshape(maxCenters(i,:),28,28);
        subplot(5,11,(11*i-10)),imshow(uint8(Im1'));
        for j=(10*i-9):(10*i)
            Im1 = reshape(maxClosest10(j,:),28,28);
            subplot(5,11,(i+j)),imshow(uint8(Im1'));
        end
        sgtitle("10 Nearest Data Points to Each of the K Group Representatives; Maximum J-clust Means for K = 5")
    end
end

