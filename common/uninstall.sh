$MAGISK || { for FILE in ${CFGS}; do
               case $FILE in
                 *.conf) sed -i "/am3daudioenhancement { #$MODID/,/} #$MODID/d" $UNITY$FILE;;
                 *.xml) sed -i "/<!--$MODID-->/d" $UNITY$FILE;;
               esac
             done }
