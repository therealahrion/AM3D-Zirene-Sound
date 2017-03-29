#!/system/bin/sh

LOG_FILE=/data/local/am3dzs_run.log;

if [ -e /data/local/am3dzs_run.log ]; then
  rm /data/local/am3dzs_run.log
fi

echo "AM3D Zirene script has run successfully $(date +"%m-%d-%Y %H:%M:%S")" | tee -a $LOG_FILE;

# Keep AM3D Zirene in Memory
setprop sys.keep_app_1 com.fihtdc.am3dfx.todo
PPID=$(pidof com.fihtdc.am3dfx.todo)
echo "-17" > /proc/$PPID/oom_adj
renice -18 $PPID