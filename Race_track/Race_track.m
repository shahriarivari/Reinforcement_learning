clear all
close all
clc

epsilon=0.3;
alpha=0.3;
% shape the track by defining the obstacles, used the excel file to find
% the numbers
track_obstacles = [1:4 16:35 56:65 94:96 296:320 327:352 359:384 391:416 423:448 455:480 487:512 519:544 ] ;
goal = [513:518] ;

actions = [1:12] ;          % actions 1 ,2  and 3  Adds +1 ,-1 and 0 to the velocity to the up direction respectively
                            % actions 4 ,5  and 6  Adds +1 ,-1 and 0 to the velocity to the up direction respectively
                            % actions 7 ,8  and 9  Adds +1 ,-1 and 0 to the velocity to the up direction respectively
                            % actions 10 ,11  and 12  Adds +1 ,-1 and 0 to the velocity to the up direction respectively

states = zeros(32,17) ;              % in this problem state is the position of the car
Q=zeros(32*17,size(actions,2));
games_played = [0 0];
counter = 0 ;

for race = 1 : 100000
    n = 1 ;
    nn = 0 ;
    velocity = 0 ;
    start_over = 0 ;
    chain_state_action_reward=[0 0 0];
    
    state = start() ;
    while(start_over == 0)
        
        games_played(race ,:)=[nn 0]  ;
        state_num = find_state_number(state) ;
        action_num = epsilon_greedy(Q,state_num,epsilon) ;
        [new_state , new_velocity] = movement(action_num,state,velocity) ;
        [Report] = check_state(new_state,track_obstacles) ;
        % if Report == 0 => on track
        % if Report == 1 => off_track
        switch Report
            
            case 0
                state = new_state ;
                next_state_num = find_state_number(state) ;
                Reward = -1 ;
                
            case 1
                next_state_num = 1;
                Reward = -100 ;
                start_over = 1 ;
        end
        
        K = find(next_state_num == goal) ;
        FLAG = isempty(K) ;
        if FLAG == 0
            start_over = 1 ;
            games_played(race , :)=[nn 1] ;
        end
        
        velocity = new_velocity ;
        chain_state_action_reward(n,:)=[state_num action_num Reward];
        n = n +1 ;
        nn= nn +1 ;
    end
    %%updating Q
    for ii=1:size(chain_state_action_reward,1)
        Q(chain_state_action_reward(ii,1),chain_state_action_reward(ii,2))= ...
            Q(chain_state_action_reward(ii,1),chain_state_action_reward(ii,2))+ ...
            alpha*[chain_state_action_reward(ii,3)-Q(chain_state_action_reward(ii,1),chain_state_action_reward(ii,2))];
    end
    
    epsilon=epsilon*0.9999;
    counter = counter +1
end