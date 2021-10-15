#!/usr/bin/python3
# Хакимуллин Рустем Рафаилевич 11-901
from os import getpid, _exit
from sys import argv
from time import sleep
from random import randint

s = int(argv[1])
print('Запущена программа Child в процессе с PID {0} с аргументом {1}'.format(getpid(), s))
sleep(s)
print('Завершился процесс с PID {0}'.format(getpid()))
_exit(randint(0, 1))
