for FILE in ${CFGS}; do
  sed -i '/am3daudioenhancement {/,/}/d' $AMLPATH$FILE
done
