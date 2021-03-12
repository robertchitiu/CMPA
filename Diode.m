% Robert Chitiu 101047296

Is = 0.01*10^-12;
Ib = 0.1*10^-12;
Vb = 1.3;
Gp = 0.1;

V = linspace(-1.95,0.7,200);
I = Is*(exp((1.2/0.025)*V)-1) + Gp*V - Ib*(exp((-1.2/0.025)*(V+Vb))-1);

random = 0.8 + (1.2-0.8)*rand(1,200);
Irand = I .* random;
%task 1
clf
figure (1)
plot(V,I);
hold on
plot(V,Irand)

%polyfit task 2
p1= polyfit(V,Irand,4);
plot1 = polyval(p1,V);
plot(V,plot1)
p2= polyfit(V,Irand,8);
plot2 = polyval(p2,V);
plot(V,plot2)
%Both polyfit are not that good of fits 

figure (2)
hold on
plot(V,plot1)
semilogy(V,I)

%fit part 3


fo1 = fittype('A.*(exp(1.2*x/25e-3)-1) + 0.1.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fo2 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C*(exp(1.2*(-(x+D))/25e-3)-1)');
fo3 = fittype('A*(exp(1.2*x/0.025)-1) + (B*x) - (C*(exp(-1.2*(x+D)/0.025)-1))');
fit1 = fit(V',I',fo1);
fit2 = fit(V',I',fo2);
fit3 = fit(V',I',fo3);
If1 = fit1(V);
If2 = fit2(V);
If3 = fit3(V);

figure (3)
plot(V,If1,'r',V,If2,'g',V,If3,'b')
%all plot showed promiss in fitting graphs lines

%part 4 

inputs = V.';
targets = I.';
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
view(net)
Inn = outputs

% it shows that there is a good fit of the data but not all are correct
% since mulitple ratios are one the graph


