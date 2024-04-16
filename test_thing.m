clearvars;

nimages = 13;
nlakes = randi([1,20],13);

all_all_labels = zeros(10,10,nimages);
for n = 1:nimages
    all_labels = zeros(10,10);
    for i = 1:nlakes(n)
        lake = zeros(10,10); lake(randi([1,100],1)) = 1;
        all_labels = all_labels + lake;
    end
    all_all_labels(:,:,n) = all_all_labels(:,:,n) + all_labels;
end


