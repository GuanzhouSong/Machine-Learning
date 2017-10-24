clear ; close all; clc
X=zeros(300,1899);
y=zeros(300,1);
for i = 1:100
    dir1 ='Email/spam/';
    email_contents = readFile([dir1 num2str(i) '.txt']);
    word_indices = processEmail(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing spam %d files',i);
    y(i)=1;
end

for i = 101:300
    dir2 ='Email/ham/';
    email_contents = readFile([dir2 num2str(i-100) '.txt']);
    word_indices = processEmail(email_contents);
    x = emailFeatures(word_indices);
    X(i,:) = reshape(x,1,[]);
    clc;
    fprintf('Processing ham %d files',i);
    y(i)=0;
end
save MySpamTrain;