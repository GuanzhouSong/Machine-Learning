clear ; close all; clc
tic

X=zeros(2900,1899);
y=zeros(2900,1);
parfor i = 1:1000
    dir1 ='Email/spam/';
    email_contents = readFile([dir1 num2str(i+2000) '.txt']);
    word_indices = processEmailWithHead(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing spam %d files\n',i);
    y(i)=1;
end

parfor i = 1001:2900
    dir2 ='Email/ham/';
    email_contents = readFile([dir2 num2str(i+3000) '.txt']);
    word_indices = processEmailWithHead(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing ham %d files\n',i);
    y(i)=0;
end
save MySpamTest;
 t2=toc;
display(strcat('multiple thread ',num2str(t2),'s'));