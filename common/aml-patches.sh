ui_print "    Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  if [ ! "$(grep "am3daudioenhancement" $AMLPATH$FILE)" ]; then
    sed -i 's/^effects {/effects {\n  am3daudioenhancement {\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  }/g' $AMLPATH$FILE
    sed -i 's/^libraries {/libraries {\n  am3daudioenhancement {\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  }/g' $AMLPATH$FILE
  fi
done
for FILE in ${CFGSXML}; do
  if [ ! "$(grep "am3daudioenhancement" $AMLPATH$FILE)" ]; then
    sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $AMLPATH$FILE
    sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $AMLPATH$FILE
  fi
done
# if [ ! -z $XML_PRFX ]; then
  # # Enter xmlstarlet logic here
# fi
