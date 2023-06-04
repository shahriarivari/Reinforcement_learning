function [new_state,new_velocity] = movement(action,state,velocity)
% this outputs new state and new velocity by checking the action
% first checks what action has considered then changes the velocity
% also checks velocity doesnt pass the limitations, not over 5 and below 0
% then based on the new velocity and the action changes the state matrix
% returns the new state and the new velocity

if action <= 3                            %going up
    switch action
        case 1
            velocity = velocity + 1 ;
        case 2
            velocity = velocity - 1 ;
        case 3
            velocity = velocity ;
    end
    if velocity <=0
        velocity = 0 ;
    elseif velocity >= 5
        velocity = 5 ;
    end
    new_state = state - [velocity 0] ;
    
elseif action >= 4 && action <=6              %going right
    switch action
        case 4
            velocity = velocity + 1 ;
        case 5
            velocity = velocity - 1 ;
        case 6
            velocity = velocity ;
    end
    if velocity <=0
        velocity = 0 ;
    elseif velocity >= 5
        velocity = 5 ;
    end
    new_state = state + [0 velocity] ;
    
elseif action >= 7 && action <=9              %going down
    switch action
        case 7
            velocity = velocity + 1 ;
        case 8
            velocity = velocity - 1 ;
        case 9
            velocity = velocity ;
    end
    if velocity <=0
        velocity = 0 ;
    elseif velocity >= 5
        velocity = 5 ;
    end
    new_state = state + [velocity 0] ;
    
elseif action >= 10 && action <=12            %going left
    switch action
        case 10
            velocity = velocity + 1 ;
        case 11
            velocity = velocity - 1 ;
        case 12
            velocity = velocity ;
    end
    if velocity <=0
        velocity = 0 ;
    elseif velocity >= 5
        velocity = 5 ;
    end
    new_state = state - [0 velocity] ;
end

new_velocity = velocity ;

end