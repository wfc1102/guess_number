#!/bin/bash
clear
i=0
echo "猜数字游戏[1-999]:"
a=$(((RANDOM%999)+1))
while true;do
   num=`cat number.txt|wc -l`
   ((num++))
   read b
   while [[ ${b} -gt 999  ||  ${b} -lt 1 ]];do
      read b
   done
   ((i++))
   [[ ${b} -gt ${a} ]] && echo "${i}: ${b} 高了"
   [[ ${b} -lt ${a} ]] && echo "${i}: ${b} 低了"
   [[ ${b} -eq ${a} ]] && echo "${i}: ${b} 对喽" && echo "${i}: ${b}">> number.txt && echo "=========历史数据" && cat number.txt && echo "=========猜数字游戏[1-999]: 第${num}局开始" && i=0&& a=$(((RANDOM%999)+1))
done
