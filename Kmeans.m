clear all;

Files=dir('dataset_grayscale/*/*.bmp');
train_x=zeros(length(Files),2500);

for k=1:length(Files)
    FileNames = Files(k).name;
    dr = Files(k).folder;
    fileLocation = strcat(dr, '\', FileNames);

    path = strsplit(dr, '\');
    folder = path{length(path)};
    im=imread(fileLocation);
    temp=im(:);
    train_x(k,:)=temp;
end

train_y=zeros(length(Files),1);
train_y(1:900)=1;
train_y(900:1708)=2;
train_y(1708:2515)=3;
train_y(2515:3234)=4;

Mdl = fitcknn(train_x,train_y,'NumNeighbors',4,'Standardize',1);

save Mdl;