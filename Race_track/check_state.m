function [Report]= check_state(state,track_obstacles)
% this function checks whether the agent has hit the obstacles or not
% returns 1, if agent hits the obstacles
% returns 0 if the agent gets to the finish line
Report = 0 ;
a = 0 ;
if state(1)>32 || state(1)<1
    Report = 1 ;
    a = 1 ;
end

if state(2)>17 || state(2)<1
    Report = 1 ;
    a = 1 ;
end
if a == 0
    state_num = find_state_number(state) ;
    F = find(state_num == track_obstacles) ;
    flag = isempty(F) ;
    
    if flag == 0
        Report = 1 ;
    end
end
end
