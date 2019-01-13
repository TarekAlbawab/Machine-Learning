Train_Data=[0.12 0.79 0.87 0.20 0.13 0.81 0.78 0.25 0.17 0.75 0.84 0.25 0.28 0.72 0.95 0.29; 0.22 0.85 0.15 0.79 0.19 0.92 0.31 0.73 0.15 0.93 0.24 0.86 0.31 0.74 0.26 0.94]   % Training Data set
net = newc([0 1; 0 1], 4, 0.1,0.001);  % Creates Kohonen net
net.inputWeights{1,1}.learnFcn ='learnk';
net.biases{1}.learnFcn ='learnk';
net.trainParam.epochs=500;
net = init(net); % initialize the neural network which going to be train
InputWeightMatrixBT = net.IW{1,1} % To display the Input Weight Matrix before training
BiasBT = net.b{1} % To display the Input bias Matrix before training
net = train(net,Train_Data); % train the network with Training Data set
a = sim(net,Train_Data); % simulate the network with Training Data set
ay= vec2ind(a)   % vector to indices conversion
InputWeightMAtrixAT = net.IW{1,1} % To display the Input Weight Matrix after training
BiasAT = net.b{1} % To display the Input bias Matrix after training
xp = [0.12 0.79 0.87 0.20 0.13 0.81 0.78 0.25 0.17 0.75 0.84 0.25 0.28 0.72 0.95 0.29];
yp = [0.22 0.85 0.15 0.79 0.19 0.92 0.31 0.73 0.15 0.93 0.24 0.86 0.31 0.74 0.26 0.94];
xi = [InputWeightMAtrixAT(1,1),InputWeightMAtrixAT(2,1),InputWeightMAtrixAT(3,1),InputWeightMAtrixAT(4,1)];
yi = [InputWeightMAtrixAT(1,2),InputWeightMAtrixAT(2,2),InputWeightMAtrixAT(3,2),InputWeightMAtrixAT(4,2)];
xii = [0.5 0.5 0.5 0.5];
yii = [0.5 0.5 0.5 0.5];
subplot(1,2,1) % create subplot to plot multiple graph simultaneously
plot(xp,yp,'.',xii,yii,'r+');grid; % plot the graph of Training Data set and Input Weight Matrix before training
xlabel('x-axis') % label graph x-axis
ylabel('y-axis') % label graph y-axis
title('Before Training') % label graph title
subplot(1,2,2)
plot(xp,yp,'.',xi,yi,'r+');grid; % plot the graph of Training Data set and Input Weight Matrix after training
xlabel('x-axis')
ylabel('y-axis')
title('After Training')
prompt=('Press 1 to test network; press 0 to stop testing: '); % prompt user to continue test network or exit test network
while input(prompt)~= 0 % the following code will repeat until user key in 0
prompt=('Please input X vector value: '); % prompt user to key in X vector value
x=input(prompt) % save the input of user into variable x
prompt=('Please input Y vector value: ');
y=input(prompt)
xc1=InputWeightMAtrixAT(1,1)-x; % calculate the x distance of the input and the first column Input Weight Matrix after training
yc1=InputWeightMAtrixAT(1,2)-y; % calculate the y distance of the input and the first column Input Weight Matrix after training
xc2=InputWeightMAtrixAT(2,1)-x;
yc2=InputWeightMAtrixAT(2,2)-y;
xc3=InputWeightMAtrixAT(3,1)-x;
yc3=InputWeightMAtrixAT(3,2)-y;
xc4=InputWeightMAtrixAT(4,1)-x;
yc4=InputWeightMAtrixAT(4,2)-y;
minVal=-0.3; % set the minimum range
maxVal=0.3; %set the maximum range
if (xc1 <= maxVal)&&(yc1 <= maxVal)&&(xc1 >= minVal)&&(yc1 >= minVal) % check whether the x and y distance fall inside the maximum and minimum range
    Nueron_Fired = 1
elseif (xc2 <= maxVal)&&(yc2 <= maxVal)&&(xc2 >= minVal)&&(yc2 >= minVal)
    Nueron_Fired = 2
elseif (xc3 <= maxVal)&&(yc3 <= maxVal)&&(xc3 >= minVal)&&(yc3 >= minVal)
    Nueron_Fired = 3
elseif (xc4 <= maxVal)&&(yc4 <= maxVal)&&(xc4 >= minVal)&&(yc4 >= minVal)
    Nueron_Fired = 4
else Neuron_fired = 'not available'
end
prompt=('Press Enter to test network; press 0 to stop testing: ');
end
