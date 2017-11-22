ui_print "    Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  if [ ! "$(cat $AMLPATH$FILE | grep ' am3daudioenhancement {')" ]; then
    sed -i 's/^effects {/effects {\n  am3daudioenhancement {\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  }/g' $AMLPATH$FILE
    sed -i 's/^libraries {/libraries {\n  am3daudioenhancement {\n    path \/system\/lib\/soundfx\/libam3daudioenhancement.so\n  }/g' $AMLPATH$FILE
  fi
done
