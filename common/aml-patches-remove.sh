for FILE in ${CFGS}; do
  sed -i '/am3daudioenhancement {/,/}/d' $AMLPATH$FILE
done
for FILE in ${CFGSXML}; do
  sed -i '/<!--$MODID-->/d' $AMLPATH$FILE
done
