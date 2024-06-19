---
title: "bind"
weight: 1
draft: true
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false

---

# bind

## make updates to a dynamic zone

If you need to manual updates to a zone dynamically managed (by say kea for dhcp), you have to pause dynamic updates before making the change.

```bash
rndc freeze
```

Then make changes to the zone file, making sure to increment the serial.

Finally, thaw the zone when it's time to resume.

```bash
rndc thaw
```
