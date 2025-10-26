for i in $HOME/PATH/TO/THING/*;
do
   zip -j -r $HOME/PATH/TO/CONVERTED/$(basename "$i").cbz  "$i"
done
