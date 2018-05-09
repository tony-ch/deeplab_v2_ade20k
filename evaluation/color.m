%{
Variables need to be modified: data_root, eval_list;
%}

close all; clc; clear;
addpath('visualizationCode');

data_root = '/home/tony/app/sceneparsing/ADEChallengeData2016'; %root path of dataset
eval_list = 'list/ADE20K_train.txt'; %evaluation list, refer to lists in folder 'samplelist'
%eval_list = 'list/v1/ADE20K_val_v1_2.txt'; %evaluation list, refer to lists in folder 'samplelist'
data_class = 'objectName150.mat'; %class name
data_colormap = 'color150.mat'; %color map
save_color_folder = [data_root '/annotations/' 'train_color/']; %path for predicted color image


list = importdata(fullfile(data_root,eval_list));
load(data_class);
load(data_colormap);
if(~isdir(save_color_folder))
    mkdir(save_color_folder);
end

pathAnno = data_root;

% main loop
for i = 1: numel(list) %change filesPred to list
    fprintf(1, 'processing %d (%d)...\n', i, numel(list));
    % check file existence
    str = strsplit(list{i});
    
    img_fn = strsplit(str{1},'/');
    img_fn = img_fn{end};
    img_fn = img_fn(1:end-4);

    fileAnno = fullfile(pathAnno, str{2});
    if ~exist(fileAnno, 'file')
        fprintf('Label file [%s] does not exist!\n', fileAnno); continue;
    end

    % read in prediction and label
    imAnno = imread(fileAnno);
    imAnno = imAnno + 1;
    imAnno(imAnno==255) = 0;
    rgbPred = colorEncode(imAnno, colors);
    imwrite(rgbPred,[save_color_folder img_fn '.png']);
end

