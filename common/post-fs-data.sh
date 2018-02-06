if [ "$SEINJECT" != "/sbin/sepolicy-inject" ]; then
  $SEINJECT --live "permissive audioserver"
  $SEINJECT --live "allow mediaserver mediaserver_tmpfs file { read write execute }"
  $SEINJECT --live "allow mediaserver system_file file execmod"
else
  $SEINJECT -Z audioserver -l
  $SEINJECT -s mediaserver -t mediaserver_tmpfs -c file -p read,write,execute -l
  $SEINJECT -s mediaserver -t system_file -c file -p execmod -l
fi
