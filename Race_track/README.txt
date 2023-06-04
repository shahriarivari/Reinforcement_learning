in this problem we try to go from the start to finish line, there are different actions defined which
could be founf the picture "race_track".
in order to define the obstacles and demonstrate the track, we used a excel file to locate the track indexes as 
well as the obstacles.

check_state.m -----> checks if the agent's states if its on track or hit the obstacles.
epsilon_greedy.m -----> chooses an action.
movement.m -----> moves the agent based on the action and its previous state.
start.m -----> give the agent a random starting point regarding to the valid starting points.
find_state_number.m -----> findes the index of the state which is required to update the Q table.
in this code the Q-learning is done inside the main code which is Race_track.m.
