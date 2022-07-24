rmdir('dataset_grayscale', 's');
mkdir('dataset_grayscale');
mkdir('dataset_grayscale/1');
mkdir('dataset_grayscale/2');
mkdir('dataset_grayscale/3');
mkdir('dataset_grayscale/4');

Files=dir('dataset/*/*.bmp');
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
    output_folder = strcat('C:\Users\Ayush\Desktop\MATLAB\KMeans\','dataset_grayscale', '/', folder, '/', name, '_grayed.', extension);
    imwrite(image_out, output_folder);
end