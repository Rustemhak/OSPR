cnt=1
last_numbers=()
cnt_guessed=0
re='^[0-9]+$'
for ((;;))  do
        rand=$((190 + $RANDOM % 10))
        echo Введите число от 190 до 199:
        read num
        if [[ $num == q ]]; then
                echo Выход; break
        elif ! [[ $num =~ $re ]] || (($num > 199)) || (($num < 190)); then
                echo Неверный ввод, повторите ещё раз!
        else
                if (($num == $rand)); then
                        last_numbers[cnt - 1]=$rand+
                        ((cnt_guessed++))
                        echo Число угадано
                else
                        last_numbers[cnt - 1]=$rand
                        echo Число не угадано
                fi
                guess_per=$((100 * $cnt_guessed/$cnt))
                not_guess_per=$((100 - $guess_per))
                echo Процент угаданных:  $guess_per%
                echo Процент неугаданных:  $not_guess_per%
                echo "Последние загаданные числа (до 7): "
                for ((i=1; ((i <=7)) && ((i <=cnt)) ; i++)) do
                        echo ${last_numbers[-i]}
                done
                ((cnt++))
        fi
done