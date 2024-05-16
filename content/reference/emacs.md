---
title: "emacs"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# emacs


## tramp sudo syntax

The syntax is:
```bash
C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file RET
```

{{< expand "Example" >}}

So to connect to a remote host `centos01.internal.glynn.xyz` as the current user, `sudo` to root and open `/etc/nginx`:

```bash
C-x C-f /ssh:centos01.internal.glynn.xyz|sudo:root@centos01.internal.glynn.xyz:/etc/nginx
```

{{< /expand >}}

## remove newlines from a region 

[stackoverflow source](https://stackoverflow.com/questions/5194294/how-to-remove-all-newlines-from-selected-region-in-emacs)


```bash
Select region

shift-option-%

C-q C-j

return

return

```

Or to put it another way, query replace region, ctrl-q to get extended characters, ctrl-j to put in a newline, replace with nothing, all of them.


## named frames 

First name the frame:

```emacs
set-name-frame notes
```

Then select it:

```emacs
(select-frame-by-name "notes")
```
