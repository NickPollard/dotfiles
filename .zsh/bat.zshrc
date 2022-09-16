if [[ -a $(which bat) ]]
then
  BATTER=`which bat`
else
  BATTER=`which cat`
fi

if [[ -a $(which fd) ]]
then
  FDER=`which fd`
else
  FDER=`which find`
fi
