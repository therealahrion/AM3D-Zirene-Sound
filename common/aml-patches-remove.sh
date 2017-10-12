for CFG in $CONFIG_FILE $HTC_CONFIG_FILE $OTHER_V_FILE $OFFLOAD_CONFIG $V_CONFIG_FILE; do
  if [ -f $CFG ]; then
	sed -i '/am3daudioenhancement {/,/}/d' $AMLPATH$CFG
  fi
done
