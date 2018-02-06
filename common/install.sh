# Temp fix for op3/3t oreo devices
if [ $API -ge 26 ] && ( device_check "OnePlus3" || device_check "OnePlus3T" ); then
  ui_print "   ! Oneplus 3/3T Oreo device detected !"
  ui_print "   Setting selinux to permissive..."
  if $MAGISK; then echo "#!/system/bin/sh" > $INSTALLER/common/post-fs-data.sh; else echo "$SHEBANG" > $INSTALLER/common/post-fs-data.sh; fi
  echo "setenforce 0" >> $INSTALLER/common/post-fs-data.sh
  echo "" >> $INSTALLER/common/post-fs-data.sh
fi

ui_print "   Patching existing audio_effects files..."
# Create vendor audio_effects.conf if missing
if $MAGISK && [ -f $ORIGDIR/system/etc/audio_effects.conf ] && [ ! -f $ORIGDIR/system/vendor/etc/audio_effects.conf ] && [ ! -f $ORIGDIR/system/vendor/etc/audio_effects.xml ]; then
  cp_ch $ORIGDIR/system/etc/audio_effects.conf $UNITY/system/vendor/etc/audio_effects.conf
  CFGS="${CFGS} /system/vendor/etc/audio_effects.conf"
fi
for FILE in ${CFGS}; do
  $MAGISK && cp_ch $ORIGDIR$FILE $UNITY$FILE
  case $FILE in
    *.conf) [ ! "$(grep '^ *# *music_helper {' $UNITY$FILE)" -a "$(grep '^ *music_helper {' $UNITY$FILE)" ] && sed -i "/effects {/,/^}/ {/music_helper {/,/}/ s/^/#/g}" $UNITY$FILE
            sed -i "/am3daudioenhancement {/,/}/d" $UNITY$FILE
            sed -i "s/^effects {/effects {\n  am3daudioenhancement { #$MODID\n    library am3daudioenhancement\n    uuid 6723dd80-f0b7-11e0-98a2-0002a5d5c51b\n  } #$MODID/g" $UNITY$FILE
            sed -i "s/^libraries {/libraries {\n  am3daudioenhancement { #$MODID\n    path $LIBPATCH\/lib\/soundfx\/libam3daudioenhancement.so\n  } #$MODID/g" $UNITY$FILE;;
    *.xml) [ ! "$(grep '^ *<\!--<effect name=\"music_helper\"*' $UNITY$FILE)" -a "$(grep '^ *<effect name=\"music_helper\"*' $UNITY$FILE)" ] && sed -i "s/^\( *\)<effect name=\"music_helper\"\(.*\)/\1<\!--<effect name=\"music_helper\"\2-->/" $UNITY$FILE
           sed -i "/am3daudioenhancement/d" $UNITY$FILE
           sed -i "/<libraries>/ a\        <library name=\"am3daudioenhancement\" path=\"libam3daudioenhancement.so\"\/><!--$MODID-->" $UNITY$FILE
           sed -i "/<effects>/ a\        <effect name=\"am3daudioenhancement\" library=\"am3daudioenhancement\" uuid=\"6723dd80-f0b7-11e0-98a2-0002a5d5c51b\"\/><!--$MODID-->" $UNITY$FILE;;
  esac
done
