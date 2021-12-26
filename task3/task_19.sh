cnt=1
last_numbers=()
cnt_guessed=0
re='^[0-9]+$'
for ((;;))  do
        rand=$((190 + $RANDOM % 10))
        echo Step: $cnt
        read -p "Please enter number from 190 to 199 (q - quit): " num
        if [[ $num == q ]]; then
                echo Exit; break
        elif ! [[ $num =~ $re ]] || (($num > 199)) || (($num < 190)); then
                echo Incorrect input! please enter again
        else
                if (($num == $rand)); then
                        last_numbers[cnt - 1]=$rand+
                        ((cnt_guessed++))
                        echo Correctly! My number: $rand
                else
                        last_numbers[cnt - 1]=$rand
                        echo Miss! My number: $rand
                fi
                guess_per=$((100 * $cnt_guessed/$cnt))
                not_guess_per=$((100 - $guess_per))
                echo Hit:  $guess_per% Miss:  $not_guess_per%
                echo -n Numbers:" "
                for ((i=1; ((i <=7)) && ((i <=cnt)) ; i++)) do
                        echo -n ${last_numbers[-i]}" "
                done
                echo
                ((cnt++))
        fi
done