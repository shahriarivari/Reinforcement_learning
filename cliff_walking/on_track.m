function check_on_track = on_track(new_state)

if new_state(1)== 4 && new_state(2)>=2 && new_state(2)<=11
    check_on_track = 1 ;
elseif new_state(1) <= 0 || new_state(1)>=5
    check_on_track = 2 ;
elseif new_state(2) <= 0 || new_state(2)>=13
    check_on_track = 2 ;
else
    check_on_track = 0 ;
end

end