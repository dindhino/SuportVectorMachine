% Nama: Dindin Dhino Alamsyah
% NIM : 1301144360

close all;
clear;
clc;

% 17(a) Visualisasi Data
dataset = load('linear_0.csv');
figure;
gscatter(dataset(:,1), dataset(:,2), dataset(:,3), 'br', 'xo');
title('SVM Linearly Separable');
xlabel('Atribut 1');
ylabel('Atribut 2');
pause(1)

% 17(b) Cari nilai w dan b dengan quadprog
X = [dataset(:,1) dataset(:,2)];
Y = dataset(:,3); 
H = eye(size(X,2)+1);
H(size(X,2)+1, size(X,2)+1) = 0;
f = zeros(size(X,2)+1, 1);
Z = [X ones(size(X,1), 1)];
A = -diag(Y)*Z; %linear case
c = -1*ones(size(X,1),1);
w = quadprog(H,f,A,c)
w1 = w(1);
w2 = w(2);
b = w(3);

% 17(c) Visualisasi Hyperplane
Yhp = -(w1*X+b)/w2; %untuk sumbu y hyperplane
hold on
plot(X,Yhp,'k-')
hold off

MarginAtas=(1-w1*X-b)/w2;
hold on
plot(X,MarginAtas,'m:')
hold off

MarginBawah=(-1-w1*X-b)/w2;
hold on
plot(X,MarginBawah,'m:') 
hold off