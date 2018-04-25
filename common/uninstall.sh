if ! $MAGISK || $SYSOVERRIDE; then
  for OFILE in ${CFGS}; do
    FILE="$UNITY$(echo $OFILE | sed "s|^/vendor|/system/vendor|g")"
    case $FILE in
      *.conf) sed -i "/am3daudioenhancement { #$MODID/,/} #$MODID/d" $FILE;;
      *.xml) sed -i "/<!--$MODID-->/d" $FILE;;
    esac
  done
fi
