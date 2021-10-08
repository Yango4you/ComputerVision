
I = imread('2020_12q.jpg');
I_g=im2gray(I);
figure;
imshow(I);

%anzahl der cluster auswählen
anzahl_cluster=3;

%kmeans anwenden. wobei L die angehörigkeit der pixel zu einem kluster
%anzeigt und Centers die Mittepunkte der cluster sind.
[L,Centers] = imsegkmeans(I,anzahl_cluster);
B = labeloverlay(I,L);
figure;
imshow(B);

% Kuchen diagramm
switch anzahl_cluster
    case 2
        %labels festlegen
        labels = {'Cluster 1','Cluster 2'};
        %prozente berechnen
        k_1=find(L==1);
        k_1= numel(k_1)/numel(I_g);
        
        k_2=find(L==2);
        k_2= numel(k_2)/numel(I_g);
        
        X=[k_1 k_2];
        
    case 3
        labels = {'Cluster 1','Cluster 2','Cluster 3'};
        
        k_1=find(L==1);
        k_1= numel(k_1)/numel(I_g);
        
        k_2=find(L==2);
        k_2= numel(k_2)/numel(I_g);
        
        k_3=find(L==3);
        k_3= numel(k_3)/numel(I_g);
        
        X=[k_1 k_2 k_3];
    
    case 4
        labels = {'Cluster 1','Cluster 2','Cluster 3','Cluster 4'};
        
        k_1=find(L==1);
        k_1= numel(k_1)/numel(I_g);
        
        k_2=find(L==2);
        k_2= numel(k_2)/numel(I_g);
        
        k_3=find(L==3);
        k_3= numel(k_3)/numel(I_g);
        
        k_4=find(L==4);
        k_4= numel(k_4)/numel(I_g);
        
        X=[k_1 k_2 k_3 k_4];
    
    case 5
        labels = {'Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5'};
        
        k_1=find(L==1);
        k_1= numel(k_1)/numel(I_g);
        
        k_2=find(L==2);
        k_2= numel(k_2)/numel(I_g);
        
        k_3=find(L==3);
        k_3= numel(k_3)/numel(I_g);
        
        k_4=find(L==4);
        k_4= numel(k_4)/numel(I_g);
        
        k_5=find(L==5);
        k_5= numel(k_5)/numel(I_g);
        
        X=[k_1 k_2 k_3 k_4 k_5];
        
    case 6
        labels = {'Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6'};
        
        k_1=find(L==1);
        k_1= numel(k_1)/numel(I_g);
        
        k_2=find(L==2);
        k_2= numel(k_2)/numel(I_g);
        
        k_3=find(L==3);
        k_3= numel(k_3)/numel(I_g);
        
        k_4=find(L==4);
        k_4= numel(k_4)/numel(I_g);
        
        k_5=find(L==5);
        k_5= numel(k_5)/numel(I_g);
        
        k_6=find(L==6);
        k_6= numel(k_6)/numel(I_g);        
        
        X=[k_1 k_2 k_3 k_4 k_5 k_6];
end
figure;
pie(X);
lgd = legend(labels);
lgd.Location = 'best';


