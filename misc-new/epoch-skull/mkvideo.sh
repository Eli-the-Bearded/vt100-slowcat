#!/bin/sh
# sh mkvideo.sh > epoch-skull.vt
# slowcat epoch-skull.vt
clear
this=$0
cat ../../videos/helper-bits/hide-cursor.vt
for loop in 1 2 ; do
 for i in 00 01 02 03 04 05 06 07 08 09 10 11;do
  grep=skull$i
  printf "\e[H"
  grep "^$grep:" $this | cut -f 2- -d :
  printf "\n\nAnimation by epoch 2022\n"
  for delay in q w e r t y u i o p ; do
   printf "%79s\r" " "
  done
 done
done
cat ../../videos/helper-bits/show-cursor.vt

exit

skull00:.________________.
skull00:|    ________    |
skull00:|   /        \   |
skull00:|  |          |  |
skull00:|  |          |  |
skull00:|   \     () ()  |
skull00:|    \____  A/   |
skull00:|       \ \mm    |
skull00:|        \|ww    |
skull00:|         '--    |
skull00:'----------------'
skull01:.________________.
skull01:|     _______    |
skull01:|    /       \   |
skull01:|   |         |  |
skull01:|   |   _   _ |  |
skull01:|   |  (.) (.)|  |
skull01:|    \__  A  /   |
skull01:|     \ \mmm/|   |
skull01:|      \|www|/   |
skull01:|       '---'    |
skull01:'----------------'
skull02:.________________.
skull02:|     _______    |
skull02:|    /       \   |
skull02:|   |         |  |
skull02:|   |  _   _  |  |
skull02:|   | (.) (.) |  |
skull02:|    \_  A  _/   |
skull02:|     |\mmm/|    |
skull02:|     \|www|/    |
skull02:|      '---'     |
skull02:'----------------'
skull03:.________________.
skull03:|     _______    |
skull03:|    /       \   |
skull03:|   |         |  |
skull03:|   | _   _   |  |
skull03:|   |(.) (.)  |  |
skull03:|    \  A  __/   |
skull03:|     |mmm/ /    |
skull03:|     \www|/     |
skull03:|     '---'      |
skull03:'----------------'
skull04:.________________.
skull04:|     ________   |
skull04:|    /        \  |
skull04:|   |          | |
skull04:|   |          | |
skull04:|   () ()     /  |
skull04:|    \A  ____/   |
skull04:|     mm/ /      |
skull04:|     ww|/       |
skull04:|     --'        |
skull04:'----------------'
skull05:.________________.
skull05:|     ________   |
skull05:|    /        \  |
skull05:|   |          | |
skull05:|   |          | |
skull05:|   |)        /  |
skull05:|    \   ____/   |
skull05:|     m/  /      |
skull05:|     w| /       |
skull05:|     --'        |
skull05:'----------------'
skull06:.________________.
skull06:|     ________   |
skull06:|    /        \  |
skull06:|   |          | |
skull06:|   |          | |
skull06:|   |         /  |
skull06:|    \    ___/   |
skull06:|     |/  /      |
skull06:|     |  /       |
skull06:|     --'        |
skull06:'----------------'
skull07:.________________.
skull07:|     _______    |
skull07:|    /       \   |
skull07:|   |         |  |
skull07:|   |         |  |
skull07:|   |         |  |
skull07:|    \    o  /   |
skull07:|     |     /    |
skull07:|     \    /     |
skull07:|     '---'      |
skull07:'----------------'
skull08:.________________.
skull08:|     _______    |
skull08:|    /       \   |
skull08:|   |         |  |
skull08:|   |         |  |
skull08:|   |         |  |
skull08:|    \_  o  _/   |
skull08:|     |     |    |
skull08:|     \     /    |
skull08:|      '---'     |
skull08:'----------------'
skull09:.________________.
skull09:|     _______    |
skull09:|    /       \   |
skull09:|   |         |  |
skull09:|   |         |  |
skull09:|   |         |  |
skull09:|    \  o    /   |
skull09:|     \      |   |
skull09:|      \     /   |
skull09:|       '---'    |
skull09:'----------------'
skull10:.________________.
skull10:|    ________    |
skull10:|   /        \   |
skull10:|  |          |  |
skull10:|  |          |  |
skull10:|   \         |  |
skull10:|    \___    /   |
skull10:|       \  \|    |
skull10:|        \  |    |
skull10:|         '--    |
skull10:'----------------'
skull11:.________________.
skull11:|    ________    |
skull11:|   /        \   |
skull11:|  |          |  |
skull11:|  |          |  |
skull11:|   \        (|  |
skull11:|    \____   /   |
skull11:|       \  \m    |
skull11:|        \ |m    |
skull11:|         '--    |
skull11:'----------------'
