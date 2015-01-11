#!/system/bin/sh
pr_reset_file="/data/prReset/pr_reset.log"

# function dump()
# dumps the argument to dmesg
dump ()
{
  echo $1 > /dev/kmsg
}

if [ -f $pr_reset_file ]; then
  chmod 644 ${pr_reset_file}
  echo "file exists, no cleanup done" > ${pr_reset_file}
  dump "file exists, no cleanup done"
else
  dump "deleting /persist/data/app_ms/license.hds"
  /system/bin/rm /persist/data/app_ms/license.hds

  dump "deleting /data/app_ms/license.hds"
  /system/bin/rm /data/app_ms/license.hds

  dump "deleting /persist/data/app_ms/keyfile.dat"
  /system/bin/rm /persist/data/app_ms/keyfile.dat

  /system/bin/mkdir /data/prReset
  /system/bin/chmod 644 /data/prReset
  echo "cleanup done, file created" > ${pr_reset_file}
  /system/bin/chmod 644 ${pr_reset_file}
  dump "cleanup done, file created"
fi