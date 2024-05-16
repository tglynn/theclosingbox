---
title: "proxmox"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# proxmox 

## add nfs mount to proxmox


First, show the available NFS exports:

`showmount -e $NFS_SERVER_IP`


`pvesm scan nfs $NFS_SERVER_IP`

` pvesm add nfs $STORAGE_NAME --server $NFS_SERVER_IP --path $LOCAL_PATH_TO_MOUNT_ON --export $EXPORT_PATH_OBTAINED_FROM_SHOWMOUNT --content $WHATEVER_PROXMOX_CONTENT_TYPE`

{{< expand "Example"  >}}

Add a mount named `plex-media`, served from `nas01.internal.glynn.xyz`, to be mounted on `/mnt/shared/plex_media/` using the export (found from `showmount -e `) `/mnt/storage_vol0/plex_media` with a storage type of `iso`:

```
pvesm add nfs plex-media --server nas01.internal.glynn.xyz --path /mnt/shared/plex_media/ --export /mnt/storage_vol0/plex_media --content iso
```

{{< /expand >}}
