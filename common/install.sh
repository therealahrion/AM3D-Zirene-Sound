ui_print "   Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  if $MAGISK; then
    cp_ch $ORIGDIR$FILE $UNITY$FILE
  else
    [ ! -f $ORIGDIR$FILE.bak ] && cp_ch $ORIGDIR$FILE $UNITY$FILE.bak
  fi
  case $FILE in
    *.conf) [ ! "$(grep '^ *# *music_helper {' $UNITY$FILE)" -a "$(grep '^ *music_helper {' $UNITY$FILE)" ] && sed -i "/effects {/,/^}/ {/music_helper {/,/}/ s/^/#/g}" $UNITY$FILE
            [ ! "$(grep '^ *# *sa3d {' $UNITY$FILE)" -a "$(grep '^ *sa3d {' $UNITY$FILE)" ] && sed -i "/effects {/,/^}/ {/sa3d {/,/^  }/ s/^/#/g}" $UNITY$FILE
            sed -i "/am3daudioenhancement {/,/}/d" $UNITY$FILE
            sed -i "s/^effects {/effects {\n  am3daudioenhancement { #$MODID\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  } #$MODID/g" $UNITY$FILE
            sed -i "s/^libraries {/libraries {\n  am3daudioenhancement { #$MODID\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  } #$MODID/g" $UNITY$FILE;;
    *.xml) [ ! "$(grep '^ *<\!--<effect name=\"music_helper\"*' $UNITY$FILE)" -a "$(grep '^ *<effect name=\"music_helper\"*' $UNITY$FILE)" ] && sed -i "s/^\( *\)<effect name=\"music_helper\"\(.*\)/\1<\!--<effect name=\"music_helper\"\2-->/" $UNITY$FILE
           [ ! "$(grep '^ *<\!--<effect name=\"sa3d\"*' $UNITY$FILE)" -a "$(grep '^ *<effect name=\"sa3d\"*' $UNITY$FILE)" ] && sed -i "s/^\( *\)<effect name=\"sa3d\"\(.*\)/\1<\!--<effect name=\"sa3d\"\2-->/" $UNITY$FILE
           sed -i "/am3daudioenhancement/d" $UNITY$FILE
           sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $UNITY$FILE
           sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $UNITY$FILE;;
  esac
done
