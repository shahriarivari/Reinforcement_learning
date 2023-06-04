function [new_state] = movement(action,state)

switch action
    case 1
        new_state = state + [-1 0] ;
    case 2
        new_state = state + [0 1] ;
    case 3
        new_state = state + [1 0] ;
    case 4
        new_state = state + [0 -1] ;
end

end