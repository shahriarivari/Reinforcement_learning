function check_on_track = on_track(new_state)
% this function check dimensions of the new state, since its a 4 by 12
% matrix if the first component of the matrix exceeds number 4 or is less
% than 0 the target is out of the track, same thing also applies for the second component of the state matrix,
% if its less than 0 or bigger than 13 its out side the track
% for the cliff it should not be on [4 2] ... [4 11]

if new_state(1)== 4 && new_state(2)>=2 && new_state(2)<=11
    check_on_track = 1 ; % hits the cliff
elseif new_state(1) <= 0 || new_state(1)>=5
    check_on_track = 2 ; % off the track
elseif new_state(2) <= 0 || new_state(2)>=13
    check_on_track = 2 ; % off the track
else
    check_on_track = 0 ; % on the track
end

end