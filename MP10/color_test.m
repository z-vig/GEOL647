% dummy data 
N = 100;
Xc = 5; % center X coordinate
Yc = 5; % center Y coordinate
X = randn(N,1)+Xc;
Y = randn(N,1)+Yc;
dist = sqrt((X-Xc).^2 + (Y-Yc).^2);
[weight,ind]  = sort(dist,'ascend');
X = X(ind);
Y = Y(ind);
% light to dark blue colormap
n=256; % number of colors
cmap = [linspace(.9,0,n)', linspace(.9447,.447,n)', linspace(.9741,.741,n)']; % light to dark blue colormap
cmap_inverted = flip(cmap); % now dark to light blue
S = (weight-min(weight))/(max(weight)-min(weight))*(n-1)+1;  % map to n colors
% scatter(Xc,Yc,'r', 'filled');hold on
scatter(X,Y,[],S, 'filled');hold off
colormap('hot')
hcb=colorbar('ver'); % colorbar handle
hcb.FontSize = 12;
hcb.Title.String = "Range";
hcb.Title.FontSize = 15;