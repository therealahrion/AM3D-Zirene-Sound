ui_print "   Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  cp_ch $ORIGDIR$FILE $UNITY$FILE
  case $FILE in
    *.conf) sed -i "/effects {/,/^}/ {/^ *music_helper {/,/^  }/ s/^/#/g}" $UNITY$FILE
            sed -i "/effects {/,/^}/ {/^ *sa3d {/,/^  }/ s/^/#/g}" $UNITY$FILE
            sed -i "/effects {/,/^}/ {/^ *soundalive {/,/^  }/ s/^/#/g}" $UNITY$FILE
            sed -i "/effects {/,/^}/ {/^ *dha {/,/^  }/ s/^/#/g}" $UNITY$FILE
            sed -i "/am3daudioenhancement {/,/}/d" $UNITY$FILE
            sed -i "s/^effects {/effects {\n  am3daudioenhancement { #$MODID\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  } #$MODID/g" $UNITY$FILE
            sed -i "s/^libraries {/libraries {\n  am3daudioenhancement { #$MODID\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  } #$MODID/g" $UNITY$FILE;;
    *.xml) sed -ri "/^ *<postprocess>$/,/<\/postprocess>/ {/<stream type=\"music\">/,/<\/stream>/ s/^( *)<apply effect=\"music_helper\"\/>/\1<\!--<apply effect=\"music_helper\"\/>-->/}" $UNITY$FILE
           sed -ri "/^ *<postprocess>$/,/<\/postprocess>/ {/<stream type=\"music\">/,/<\/stream>/ s/^( *)<apply effect=\"sa3d\"\/>/\1<\!--<apply effect=\"sa3d\"\/>-->/}" $UNITY$FILE
           sed -ri "/^ *<postprocess>$/,/<\/postprocess>/ {/<stream type=\"music\">/,/<\/stream>/ s/^( *)<apply effect=\"soundalive\"\/>/\1<\!--<apply effect=\"soundalive\"\/>-->/}" $UNITY$FILE
           sed -ri "/^ *<postprocess>$/,/<\/postprocess>/ {/<stream type=\"music\">/,/<\/stream>/ s/^( *)<apply effect=\"dha\"\/>/\1<\!--<apply effect=\"dha\"\/>-->/}" $UNITY$FILE
           sed -i "/am3daudioenhancement/d" $UNITY$FILE
           sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $UNITY$FILE
           sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $UNITY$FILE;;
  esac
done
