function [num_state] = find_state_number(state)

num_state = sub2ind([4 12],state(1),state(2)) ;
end