%%Calculate the model evaluation index
%Calculate accuracy rate
accuracy = max(Acc(:, location(1)));
%Calculate precision rate
P1=[];
P2=[];
P3=[];
P4=[];
for m = 1:size(label_T_sim_use, 2)
    if label_T_sim_use(m) == 1 && label_test(m) == 1
        P1(m) = 1;
    end
    if label_T_sim_use(m) == 2 && label_test(m) == 2
        P2(m) = 1;
    end
    if label_T_sim_use(m) == 3 && label_test(m) == 3
        P3(m) = 1;
    end
    if label_T_sim_use(m) == 4 && label_test(m) == 4
        P4(m) = 1;
    end
end
precision_1=sum(P1)/length(find(label_test==1));
precision_2=sum(P2)/length(find(label_test==2));
precision_3=sum(P3)/length(find(label_test==3));
precision_4=sum(P4)/length(find(label_test==4));
%Calculate the recall rate
Recall_1 = sum(P1) / length(find(label_T_sim_use == 1));
Recall_2 = sum(P2) / length(find(label_T_sim_use == 2));
Recall_3 = sum(P3) / length(find(label_T_sim_use == 3));
Recall_4 = sum(P4) / length(find(label_T_sim_use == 4));
%Calculate the Fl score
F1_1 = 2 * precision_1 * Recall_1 / (precision_1 + Recall_1);
F1_2 = 2 * precision_2 * Recall_2 / (precision_2 + Recall_2);
F1_3 = 2 * precision_3 * Recall_3 / (precision_3 + Recall_3);
F1_4 = 2 * precision_4 * Recall_4 / (precision_4 + Recall_4);