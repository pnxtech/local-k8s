echo
for i in $(seq $2 -1 1)
do
  echo "$1$i seconds       "
  sleep 1
done
echo
