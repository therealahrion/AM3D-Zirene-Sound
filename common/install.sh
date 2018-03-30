ospeff_rem() {
  case $2 in
    *.conf) [ "$(sed -n "/^output_session_processing {/,/^}/ {/$1/p}" $2)" ] && sed -i "/effects {/,/^}/ {/^ *$1 {/,/}/ s/^/#/g}" $2;;
    *.xml) sed -ri "/^ *<postprocess>$/,/<\/postprocess>/ {/<stream type=\"music\">/,/<\/stream>/ s/^( *)<apply effect=\"$1\"\/>/\1<\!--<apply effect=\"$1\"\/>-->/}" $2;;
  esac
}

ui_print "   Patching existing audio_effects files..."
for FILE in ${CFGS}; do
  cp_ch $ORIGDIR$FILE $UNITY$FILE
  ospeff_rem "music_helper" $UNITY$FILE
  ospeff_rem "sa3d" $UNITY$FILE
  ospeff_rem "soundalive" $UNITY$FILE
  ospeff_rem "dha" $UNITY$FILE
  case $FILE in
    *.conf) sed -i "/am3daudioenhancement {/,/}/d" $UNITY$FILE
            sed -i "s/^effects {/effects {\n  am3daudioenhancement { #$MODID\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  } #$MODID/g" $UNITY$FILE
            sed -i "s/^libraries {/libraries {\n  am3daudioenhancement { #$MODID\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  } #$MODID/g" $UNITY$FILE;;
    *.xml) sed -i "/am3daudioenhancement/d" $UNITY$FILE
           sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $UNITY$FILE
           sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $UNITY$FILE;;
  esac
done
