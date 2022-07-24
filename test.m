function label = test()
load Mdl;

rmdir('test/testset_grayscale', 's');
mkdir('test/testset_grayscale');

Files=dir('test/*.bmp');
for k=1:length(Files)
    
    FileNames = Files(k).name;
    dr = Files(k).folder;
    fileLocation = strcat(dr, '\', FileNames);
    
    path = strsplit(dr, '\');
    folder = path{length(path)};

    filename = strsplit(FileNames, '.');
    name = filename{1};
    extension = filename{2};
    
    im=imread(fileLocation);
    image_out = rgb2gray(im);
    image_out=imresize(image_out,[50,50]);
    output_folder = strcat('C:/Users/Ayush/Desktop/MATLAB/KMeans/test/','testset_grayscale', '/',name, '_grayed.', extension);
    imwrite(image_out, output_folder);
end



Files=dir('test/testset_grayscale/*.bmp');
z=zeros(length(Files),2500);
for k=1:length(Files)
    FileNames = Files(k).name;
    dr = Files(k).folder;
    fileLocation = strcat(dr, '\', FileNames);
    
    path = strsplit(dr, '\');
    folder = path{length(path)};
    im=imread(fileLocation);
    temp=im(:);
    z(k,:)=temp;
end

label=predict(Mdl,z);
