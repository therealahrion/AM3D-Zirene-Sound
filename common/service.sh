if [ "$SEINJECT" != "/sbin/sepolicy-inject" ]; then
  $SEINJECT --live "allow audioserver audioserver_tmpfs file { read write execute }" "allow audioserver system_file file execmod" "allow mediaserver mediaserver_tmpfs file { read write execute }" "allow mediaserver system_file file execmod"
else
  $SEINJECT -s audioserver -t audioserver_tmpfs -c file -p read,write,execute -l
  $SEINJECT -s audioserver -t system_file -c file -p execmod -l
  $SEINJECT -s mediaserver -t mediaserver_tmpfs -c file -p read,write,execute -l
  $SEINJECT -s mediaserver -t system_file -c file -p execmod -l
fi
