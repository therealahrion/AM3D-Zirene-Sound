osp_detect() {
  case $1 in
    *.conf) SPACES=$(sed -n "/^output_session_processing {/,/^}/ {/^ *music {/p}" $1 | sed -r "s/( *).*/\1/")
            EFFECTS=$(sed -n "/^output_session_processing {/,/^}/ {/^$SPACES\music {/,/^$SPACES\}/p}" $1 | grep -E "^$SPACES +[A-Za-z]+" | sed -r "s/( *.*) .*/\1/g")
            for EFFECT in ${EFFECTS}; do
              SPACES=$(sed -n "/^effects {/,/^}/ {/^ *$EFFECT {/p}" $1 | sed -r "s/( *).*/\1/")
              [ "$EFFECT" != "atmos" ] && sed -i "/^effects {/,/^}/ {/^$SPACES$EFFECT {/,/^$SPACES}/ s/^/#/g}" $1
            done;;
     *.xml) EFFECTS=$(sed -n "/^ *<postprocess>$/,/^ *<\/postprocess>$/ {/^ *<stream type=\"music\">$/,/^ *<\/stream>$/ {/<stream type=\"music\">\|<\/stream>/d; s/<apply effect=\"//g; s/\"\/>//g; p}}" $1)
            for EFFECT in ${EFFECTS}; do
              [ "$EFFECT" != "atmos" ] && sed -ri "s/^( *)<apply effect=\"$EFFECT\"\/>/\1<\!--<apply effect=\"$EFFECT\"\/>-->/" $1
            done;;
  esac
}

ui_print "   Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  cp_ch $ORIGDIR$FILE $UNITY$FILE
  osp_detect $UNITY$FILE
  case $FILE in
    *.conf) sed -i "/am3daudioenhancement {/,/}/d" $UNITY$FILE
            sed -i "s/^effects {/effects {\n  am3daudioenhancement { #$MODID\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  } #$MODID/g" $UNITY$FILE
            sed -i "s/^libraries {/libraries {\n  am3daudioenhancement { #$MODID\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  } #$MODID/g" $UNITY$FILE;;
    *.xml) sed -i "/am3daudioenhancement/d" $UNITY$FILE
           sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $UNITY$FILE
           sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $UNITY$FILE;;
  esac
done
