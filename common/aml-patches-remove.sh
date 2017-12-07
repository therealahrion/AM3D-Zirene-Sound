for FILE in ${CFGS}; do
  sed -i '/am3daudioenhancement {/,/}/d' $AMLPATH$FILE
done
for FILE in ${CFGSXML}; do
  sed -i '/am3daudioenhancement/d' $AMLPATH$FILE
done
# if [ ! -z $XML_PRFX ]; then
  # # Enter xmlstarlet logic here
# fi
