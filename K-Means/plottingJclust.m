load maxJ_10.mat;
load maxJ_20.mat;
load maxJ_5.mat;
load minJ_10.mat;
load minJ_20.mat;
load minJ_5.mat;

max_20 = find(maxJ_20==0);
max_10 = find(maxJ_10==0);
max_5 = find(maxJ_5==0);
min_20 = find(minJ_20==0);
min_10 = find(minJ_10==0);
min_5 = find(minJ_5==0);

figure(1);
subplot(2,1,1),plot(maxJ_20(1:50)./255)
title("Maximum J-clust");
ylabel("J-clust Value");
xlabel("Number of Iterations")
x1 = xlim;
subplot(2,1,2),plot(minJ_20(1:50)./255)
title("Minimum J-clust")
ylabel("J-clust Value");
xlabel("Number of Iterations")
xlim(x1);
sgtitle("K = 20");

figure(2);
subplot(2,1,1),plot(maxJ_10(1:50)./255)
title("Maximum J-clust");
ylabel("J-clust Value");
xlabel("Number of Iterations")
x2 = xlim;
subplot(2,1,2),plot(minJ_10(1:50)./255)
title("Minimum J-clust")
ylabel("J-clust Value");
xlabel("Number of Iterations")
xlim(x2);
sgtitle("K = 10");

figure(3);
subplot(2,1,1),plot(maxJ_5(1:50)./255)
title("Maximum J-clust");
ylabel("J-clust Value");
xlabel("Number of Iterations")
x3 = xlim;
subplot(2,1,2),plot(minJ_5(1:min_5(1)-1)./255)
title("Minimum J-clust")
ylabel("J-clust Value");
xlabel("Number of Iterations")
xlim(x3);
sgtitle("K = 5");