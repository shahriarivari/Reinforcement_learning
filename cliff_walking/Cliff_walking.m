clear all
close all
clc

epsilon=0.3;
alpha=0.1;
gamma=0.5;

states = zeros(4,12) ;
actions = [1 2 3 4]  ;      % 1 = north , 2 = east , 3 = south and 4 = west

Q = zeros(4*12,4)   ;

goal = [4 12] ;
num_goal = find_state_number(goal) ;
games_played = [0] ;
for game = 1:10000
    n = 0 ;
    start_again = 0 ;
    state = start() ;
 
    while(start_again == 0 )
        games_played(game , 1) =  n ;
        
        num_state = find_state_number(state) ;
        num_action = epsilon_greedy(Q,num_state,epsilon) ;
        new_state = movement(num_action,state) ;
        check_on_track = on_track(new_state) ; %if check_on_track == 1 ==> hit the cliff
        %if check_on_track == 2 ==> off the track
        %if check_on_track == 0 ==> on  the track
        switch check_on_track
            case 0
                Reward = -1 ;
                num_next_state = find_state_number(new_state) ;
            case 1
                Reward = -100 ;
                num_next_state = find_state_number(start()) ;
                start_again = 1 ;
            case 2
                Reward = -5 ;
                num_next_state = find_state_number(state) ;
                new_state = state ;
        end
        [Q]=update_Q_learning(Q,num_state,num_next_state,num_action,Reward,alpha,gamma);
        if num_next_state == num_goal
            start_again = 1 ;
        end
        state = new_state ;
        n = n +1 ;
    end
    
    epsilon=epsilon*0.999;
    
end