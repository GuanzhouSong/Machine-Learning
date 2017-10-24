clear ; close all; clc
tic

X=zeros(5000,1899);
y=zeros(5000,1);
parfor i = 1:2000
    dir1 ='Email/spam/';
    email_contents = readFile([dir1 num2str(i) '.txt']);
    word_indices = processEmailWithHead(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing spam %d files\n',i);
    y(i)=1;
end

parfor i = 2001:5000
    dir2 ='Email/ham/';
    email_contents = readFile([dir2 num2str(i-2000) '.txt']);
    word_indices = processEmailWithHead(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing ham %d files\n',i);
    y(i)=0;
end
save MySpamTrain;
 t2=toc;
display(strcat('multiple thread ',num2str(t2),'s'));