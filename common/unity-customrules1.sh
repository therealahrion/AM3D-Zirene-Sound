# v DO NOT MODIFY v
# See instructions file for predefined variables
# User defined custom rules
# Can have multiple ones based on when you want them to be run
# You can create copies of this file and name is the same as this but with the next number after it (ex: unity-customrules2.sh)
# See instructions for TIMEOFEXEC values, do not remove it
# ^ DO NOT MODIFY ^
TIMEOFEXEC=3
$CP_PRFX $INSTALLER/custom/presets.xml $UNITY$SYS/etc/presets/presets.xml$CP_SFFX
$CP_PRFX $INSTALLER/custom/TransducerEQ_XML/Foxconn/TransducerEQ.xml $UNITY$SYS/etc/presets/TransducerEQ_XML/Foxconn/TransducerEQ.xml$CP_SFFX
$CP_PRFX $INSTALLER/custom/TransducerEQ_XML/Fugoo_Speaker/Fugoo_v1_TEQ_v1.xml $UNITY$SYS/etc/presets/TransducerEQ_XML/Fugoo_Speaker/Fugoo_v1_TEQ_v1.xml$CP_SFFX
$CP_PRFX $INSTALLER/custom/TransducerEQ_XML/JBL_Flip/M810_BT_TEQ_v2.xml $UNITY$SYS/etc/presets/TransducerEQ_XML/JBL_Flip/M810_BT_TEQ_v2.xml$CP_SFFX
$CP_PRFX $INSTALLER/custom/TransducerEQ_XML/JBL_Micro_Wireless/JBL_MICRO_WIRELESS_TEQ_v2.xml $UNITY$SYS/etc/presets/TransducerEQ_XML/JBL_Micro_Wireless/JBL_MICRO_WIRELESS_TEQ_v2.xml$CP_SFFX
