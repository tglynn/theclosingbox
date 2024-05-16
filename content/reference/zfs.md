---
title: "zfs"
---

# zfs 

## create datestamped snapshot 


```bash
sudo zfs snapshot ssd_vol0/tim@DAILY-$(date | tr ' ' '_' | tr ':' '.')
```



## create raidz2 zpool with cache disk


```bash
sudo zpool create storage_vol0 raidz2 /dev/diskid/DISK-ZCT2FF84 /dev/diskid/DISK-ZCT2FFZW /dev/diskid/DISK-WD-WX41D995H5SE /dev/diskid/DISK-WD-WX51D8986JTL /dev/diskid/DISK-WD-WX51D99AYZNK /dev/diskid/DISK-ZCT2QW77\

sudo zpool add storage_vol0 cache /dev/diskid/DISK-S19MNEAD420548E
```


## list snapshots 


```bash
zfs list -t snapshot -o name -s creation -H
```

## show io statistics for zpools 


```bash
sudo zpool iostat -v 1
```


