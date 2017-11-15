% Nama: Dindin Dhino Alamsyah
% NIM : 1301144360

close all;
clear;
clc;

% 18(a) Visualisasi data di ruang 2D
dataset = load('non-linear_0.csv');
figure;
gscatter(dataset(:,1), dataset(:,2), dataset(:,3), 'br', 'xo');
title('SVM Non-linearly Separable 2D');
xlabel('Atribut 1');
ylabel('Atribut 2');
pause(1)

%18(b) Implementasi polynomial kernel
X = polynomialkernel(dataset(:,1), dataset(:,2));

% 18(c) Visualisasi data di ruang 3D
figure;
labeldata = unique(dataset(:,3));
colors = 'rgb';
markers = 'osd';
view(3)
title('SVM Non-linearly Separable 3D');
xlabel('x1');
ylabel('x2');
zlabel('x1^2+x2^2');
grid on
hold on
for k = 1:length(labeldata)
      ind = dataset(:,3)==labeldata(k); 
      scatter3(X(ind,1), X(ind,2), X(ind,3),[colors(k) markers(k)]); 
end
legend('-1','1')
pause(1)

% 18(d) Cari nilai w dan b dengan quadprog
Y = dataset(:,3); 
H = eye(size(X,2)+1);
H(size(X,2)+1, size(X,2)+1) = 0;
f = zeros(size(X,2)+1, 1);
Z = [X ones(size(X,1), 1)];
A = -diag(Y)*Z; %linear case, karena datanya udah di transformasiin
c = -1*ones(size(X,1),1);
w = quadprog(H,f,A,c)
w1 = w(1);
w2 = w(2);
w3 = w(3);
b = w(4);

% 18(e) Visualisasi Hyperplane
Yhp = -(((w1*X).*(w2*X))+b)/w3; %untuk sumbu y hyperplane
hold on
fsurf(mode(mode(Yhp)));
hold off
rotate3d on