%%Build an RF network model
aa=size(label_test,1);%Returns the number of test set rows
bb=size(label_test,2);%Returns the number of test set columns
Acc=[];%Define classification accuracy
Acc_average=[];%Define average classification accuracy
label_output=[];%Define output labels
for i=1:10 %Set the number of repeated experiments in the same experiment to avoid randommess and take the average value
    for j=1:30 %Set the range of tree variation of random forest tree
        model = classRF_train(P_train', T_train', j);%Modeling
       [label_output(1+(i-1)*aa:aa*i, 1+(j-1)*bb:bb*j), votes] = classRF_predict(P_test', model);%using model predictions
       label_output = label_output(1+(i-1)*aa:aa*i, 1+(j-1)*bb:bb*j);%Save and name the label as label_output
       %Calculate the error of training set classification
       Acc(i,j)= (length(find(label_test == label_output))/length(label_test));%calculate the accuracy of each run result
       Acc_average(j)= mean(Acc(:,j));%Calculate the accuracy of each tree
    end
end