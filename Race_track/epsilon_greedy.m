function [num_action]=epsilon_greedy(Q,state_num,epsilon)
rand=random('uniform',0,1);
[max_value,index]=max(Q(state_num,:));
if rand<1-epsilon
    num_action=index;
else
    while(1)
    num_action=randi(size(Q,2));
    if num_action~=index
        break
    end
    end
end
end