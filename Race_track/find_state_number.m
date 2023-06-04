function [state_num] = find_state_number(state)
state_num = sub2ind([32 17],state(1),state(2)) ;
end