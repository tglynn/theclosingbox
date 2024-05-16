+++
title = "home rack rebuild plan"
date = 2021-05-30
draft = false
toc = false
+++

## what's the problem? {#what-s-the-problem}

My virtualization lab, networking gear, NAS and AV backbone is an absolute mess.  The current 12u server rack is full, the 6u network rack has stuff sitting not just in it but on top of it, and it's all a real mess down there.  Lots of wasted space, awkward network and power runs, and poor use of the large mesh storage shelves in that area.  I'd like to store other stuff in that space, and sitting the 6u rack unit on top of wire mesh shelves with printer/AV equipment underneath just doesn't work.

The space is an unfinished portion of the basement that used to house our washer and dryer.  Since we moved them up into the second floor laundry closet earlier this year, I've got a bunch of extra floor space to properly rearrange the equipment.  That area is a great storage spot, with easy outdoor access, so maximizing shelf space is a priority.  Getting all equipment into a rack or onto a permanent shelf, and keeping the shelves as accessible as possible are my two guiding principles.

You can see in the original floorplan drawing how awkward the layout is.

{{< figure src="/images/floorplanbefore.jpg" caption="<span class=\"figure-number\">Figure 1: </span>A rough outline of the original floorplan" >}}


## failed solutions {#failed-solutions}


### 42u or bust {#42u-or-bust}

My first thought was to collapse it all down into one large rack.  A 42u rack would fit everything that I have, with room to grow.  This has some great benefits around easier power and network runs (running within a single rack is **way** easier than cleanly running outside).

Unfortunately, a 42u rack needs 78" (well, more precisely it needs 72.1875" plus whatever is required for the rack's structure) of vertical clearance.  From poured slab to first floor joist, I've got 79", but plumbing runs more than an inch below anywhere that I'd like to actually stick this rack.  I could stick a 42u rack in another portion of the basement, but that would be less than ideal (suddenly, I'm solving the sliding tile puzzle of emptying another portion out before I can even start.  No way).  So we'll have to go shorter.


### square pegs in round holes {#square-pegs-in-round-holes}

Not all of the equipment that I have is really rack mountable.  The [printer](https://www.hp.com/us-en/shop/pdp/hp-color-laserjet-pro-m255dw#!) and [PS5](https://www.playstation.com/en-us/ps5/?smcid=pdc%3Aen-us%3Aprimary%20nav%3Amsg-hardware%3Aps5) are really not workable in a rack mount; the printer would take up way too much space, and need a pull out shelf to be useful.  The PS5 just doesn't fit right in a rack (or anywhere, really).  The [Xbox One X](http://www.xbox.com/en-US/xbox-one-x) could rack mount pretty cleanly in a 2u shelf, but since I need to keep a separate AV shelf anyway, let's keep the PS5 and Xbox One X together, alongside the printer.  I'll lose one shelf on my mesh shelves, but such is life.  The wire shelf unit can stay where it is, and dedicate one shelf to printer + consoles.  A single [Ubiquiti switch lite 16 PoE](https://store.ui.com/collections/unifi-network-switching/products/usw-lite-16-poe) will deal with networking, and I'll run two HDMI 2.0 cables along the ceiling to the HDMI matrix.


### have less computer stuff {#have-less-computer-stuff}

No.


## solution {#solution}

Add a 25u rack, positioned immediately to the left when walking into the raised basement area.  Put the 12u rack, currently floating in front of three shelving units and blocking access, to the right of the 25u rack.  The 8 shelf metal wire shelving unit currently on the opposite side of the basement can go against the wall next to the outside door.  The two existing metal shelves can stay in place, and the white cube units can also stay where they are for now.  All will be accessible again once the rack units are out of the way.

So the new floor plan will be something like:

{{< figure src="/images/floorplanafter.jpg" caption="<span class=\"figure-number\">Figure 2: </span>So much room for activities!" >}}


## what's in the rack? {#what-s-in-the-rack}

Both of these racks have variable depth, which is useful if I ever want to lose my mind and mount units to the front and back.
I'll plan to set them to their shallowest setting, since all of my equipment fits in that.
They're both open topped, but once they're in place I'll likely cut down some plywood to make the tops work surfaces.


### r1 - 25u rack {#r1-25u-rack}

r1 is a [StarTech 25U Open Frame Server Rack](https://www.amazon.com/gp/product/B00O6GNLQE/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1)

Drawn out, it should look like:

{{< figure src="/images/r1.jpg" caption="<span class=\"figure-number\">Figure 3: </span>25u Rack, r1" >}}

And in table form with links:

| Rack unit | Contents                                                                                                                                                                                                                                                                                                      |
|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 25        | E1,[ Startech 8 outlet 1u PDU](https://www.amazon.com/gp/product/B0035PS5AE/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1)                                                                                                                                                                                 |
| 24        | hdmi.iot.,  [HDMI Matrix](https://www.amazon.com/gp/product/B01GKFQNG8/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                                                                                                                                                                       |
| 23        | Basement Rack 8 ([UB US-8-150w)](https://store.ui.com/collections/unifi-network-switching/products/unifi-switch-8-150w), vesta.internal. ([RPi 4](https://www.amazon.com/gp/product/B07V5JTMV9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1), with [this case](https://www.thingiverse.com/thing:4746666)) |
| 22        | P1, [Cable Matters 24 port keystone patch panel](https://www.amazon.com/gp/product/B0072JVT02/ref=ppx_yo_dt_b_asin_title_o01_s03?ie=UTF8&psc=1)                                                                                                                                                               |
| 21        | Basement Rack 24, [UB USW-Pro-24](https://store.ui.com/collections/unifi-network-switching/products/usw-pro-24)                                                                                                                                                                                               |
| 20        | P2, [Cable Matters 24 port keystone patch panel](https://www.amazon.com/gp/product/B0072JVT02/ref=ppx_yo_dt_b_asin_title_o01_s03?ie=UTF8&psc=1)                                                                                                                                                               |
| 19        | Core,  [UB US-16-XG](https://store.ui.com/collections/unifi-network-switching/products/unifi-switch-16-xg)                                                                                                                                                                                                    |
| 18        | UDM,  [UDM Pro](https://store.ui.com/collections/unifi-network-unifi-os-consoles/products/udm-pro)                                                                                                                                                                                                            |
| 17        | cerberus.internal., [Mac Mini, 2011](https://support.apple.com/kb/sp632?locale=en_US),                                                                                                                                                                                                                        |
| 16        |                                                                                                                                                                                                                                                                                                               |
| 15        | [Intel NUC (Proxmox02)](https://www.amazon.com/gp/product/B07GX59NY8/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1), [Apple TV HD](https://www.apple.com/apple-tv-hd/specs/), [Hue Bridge](https://www.philips-hue.com/en-us/p/hue-bridge/046677458478)                                                     |
| 14        | E2, [CyberPower 12 Outlet Surge Protector](https://www.amazon.com/gp/product/B00077INZU/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                                                                                                                                                      |
| 13        |                                                                                                                                                                                                                                                                                                               |
| 12        | [2U Rack Drawer](https://www.amazon.com/gp/product/B009WS7TSW/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                                                                                                                                                                                |
| 11        |                                                                                                                                                                                                                                                                                                               |
| 10        |                                                                                                                                                                                                                                                                                                               |
| 9         | [X32 Rack](https://www.behringer.com/product.html?modelCode=P0AWN)                                                                                                                                                                                                                                            |
| 8         |                                                                                                                                                                                                                                                                                                               |
| 7         |                                                                                                                                                                                                                                                                                                               |
| 6         |                                                                                                                                                                                                                                                                                                               |
| 5         | [4U Rack Drawer](https://www.amazon.com/gp/product/B009WS7S1A/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                                                                                                                                                                                |
| 4         |                                                                                                                                                                                                                                                                                                               |
| 3         |                                                                                                                                                                                                                                                                                                               |
| 2         |                                                                                                                                                                                                                                                                                                               |
| 1         | [Proxmox03](https://www.amazon.com/gp/product/B00Q2Z11QE/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                                                                                                                                                                                     |


### r2 - 12u rack {#r2-12u-rack}

r2 is a [StarTech 12U Open Frame Server Rack](https://www.amazon.com/gp/product/B00P1RJ9LS/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&th=1).

A quick sketch of the unit once filled:

{{< figure src="/images/r2.jpg" caption="<span class=\"figure-number\">Figure 4: </span>12u Rack, r2" >}}

And in table form with links:

| Rack unit | Contents                                                                                                                                        |
|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| 12        | E3, [CyberPower 12 Outlet Surge Protector](https://www.amazon.com/gp/product/B00077INZU/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)        |
| 11        | P3, [Cable Matters 24 port keystone patch panel](https://www.amazon.com/gp/product/B0072JVT02/ref=ppx_yo_dt_b_asin_title_o01_s03?ie=UTF8&psc=1) |
| 10        |                                                                                                                                                 |
| 9         | [2U Rack Drawer](https://www.amazon.com/gp/product/B009WS7TSW/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                  |
| 8         |                                                                                                                                                 |
| 7         |                                                                                                                                                 |
| 6         |                                                                                                                                                 |
| 5         | [Proxmox01](https://www.silverstonetek.com/product.php?pid=488)                                                                                 |
| 4         |                                                                                                                                                 |
| 3         |                                                                                                                                                 |
| 2         |                                                                                                                                                 |
| 1         | [janus.internal.](https://www.amazon.com/gp/product/B0055EV30W/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)                                 |


### pdu mapping {#pdu-mapping}

I don't have rack mountable UPS's yet, which is a bit of a bummer. The tower models that I've got will have to do; upstream of e1+e2 will be one Cyberpower tower UPS, and upstream of e3 will be the second.


#### e1 - PDU at r1.25 {#e1-pdu-at-r1-dot-25}

e1 has 8 rear facing plugs.

| name | plug 1        | plug 2      | plug 3     | plug 4       | plug 5         | plug 6     | plug 7          | plug 8  |
|------|---------------|-------------|------------|--------------|----------------|------------|-----------------|---------|
| e1   | matrix, r1.24 | UB 8, r1.23 | RPi, r1.23 | UB 24, r1.21 | UB Core, r1.19 | UDM, r1.18 | Cerberus, r1.17 | (empty) |


#### e2 - PDU at r1.14 {#e2-pdu-at-r1-dot-14}

e2 has only 6 rear facing plugs.  I have this PDU already, and the 6 externally facing plugs might be useful for one off/quick plugins.

| name | plug 1           | plug 2          | plug 3     | plug 4    | plug 5          | plug 6  |
|------|------------------|-----------------|------------|-----------|-----------------|---------|
| e2   | Proxmox02, r1.15 | Apple TV, r1.15 | Hue, r1.15 | X32, r1.9 | Proxmox03, r1.1 | (empty) |


#### e3 - PDU at r2.12 {#e3-pdu-at-r2-dot-12}

e3 is identical to e2, and again benefits from me already owning it.

| name | plug 1      | plug 2          | plug 3  | plug 4  | plug 5  | plug 6  |
|------|-------------|-----------------|---------|---------|---------|---------|
| e3   | Janus, r2.1 | Proxmox01, r2.5 | (empty) | (empty) | (empty) | (empty) |


### patch panel mapping {#patch-panel-mapping}

I really like these keystone patch panels.  I made the mistake of punching down the patch panel in my current 6u network rack; it was a tremendous waste of time,
and the second I wanted to change something I regretted the configuration.  Cat6 keystones are definitely the way to go.


#### p1 - patch panel at r1.22 {#p1-patch-panel-at-r1-dot-22}

| port number | in (behind)                        | out (front)   |
|-------------|------------------------------------|---------------|
| 1           | 1st Floor Switch (out of rack)     | UB 8 port 1   |
| 2           | Basement AP  (out of rack)         | UB 8 port 2   |
| 3           | Octoprint RPi server (out of rack) | UB 8 port 3   |
| 4           | Matrix r1.25                       | UB 24 port 3  |
| 5           | Rpi loop p1.24                     | UB 24 port 4  |
| 6           | Mac Mini r1.17                     | UB 24 port 5  |
| 7           | Hue, r1.15                         | UB 24 port 6  |
| 8           | Proxmox02, r1.15                   | UB 24 port 7  |
| 9           | Apple TV, r1.15                    | UB 24 port 8  |
| 10          | X32, r1.9                          | UB 24 port 9  |
| 11          | X32, r1.9                          | UB 24 port 10 |
| 12          | X32, r1.9                          | UB 24 port 11 |
| 13          | Proxmox03, r1.1                    | UB 24 port 12 |
| 14          | Proxmox01, r2.11, p3.8             | UB 24 port 13 |
| 15          | Janus, r2.11, p3.2                 | UB 24 port 14 |
| 16          | Basement Switch                    | UB 24 port 15 |
| 17          | AV Switch (out of rack)            | UB 24 port 16 |
| 18          | (empty)                            | (empty)       |
| 19          | (empty)                            | (empty)       |
| 20          | (empty)                            | (empty)       |
| 21          | (empty)                            | (empty)       |
| 22          | (empty)                            | (empty)       |
| 23          | (empty)                            | (empty)       |
| 24          | Rpi loop p1.5                      | RPi,  r1.23   |


#### p2 - patch panel at r1.20 {#p2-patch-panel-at-r1-dot-20}

| port number | in (behind)                    | out (front)         |
|-------------|--------------------------------|---------------------|
| 1           | Proxmox03, p1.1                | Core port 1         |
| 2           | Proxmox03, p1.1                | Core port 3         |
| 3           | Proxmox01, p2.11, p3.10        | Core port 4         |
| 4           | Proxmox01, p2.11, p3.12        | Core port 5         |
| 5           | Janus, r2.11, p3.4             | Core port 6         |
| 6           | Janus, r2.11, p3.6             | Core port 7         |
| 7           | (empty)                        | (empty)             |
| 8           | (empty)                        | (empty)             |
| 9           | (empty)                        | (empty)             |
| 10          | (empty)                        | (empty)             |
| 11          | (empty)                        | (empty)             |
| 12          | (empty)                        | (empty)             |
| 13          | (empty)                        | (empty)             |
| 14          | (empty)                        | (empty)             |
| 15          | (empty)                        | (empty)             |
| 16          | (empty)                        | (empty)             |
| 17          | (empty)                        | (empty)             |
| 18          | (empty)                        | (empty)             |
| 19          | (empty)                        | (empty)             |
| 20          | (empty)                        | (empty)             |
| 21          | (empty)                        | (empty)             |
| 22          | (empty)                        | (empty)             |
| 23          | (empty)                        | (empty)             |
| 24          | WAN, Verizon ONT (out of rack) | UDM WAN port, r1.18 |


#### p3 - patch panel at r2.11 {#p3-patch-panel-at-r2-dot-11}

| port number | in (behind)          | out (front)  |
|-------------|----------------------|--------------|
| 1           | Janus.1g, p2.1       | Loop to p3.2 |
| 2           | r1.22, p1.15         | Loop to p3.1 |
| 3           | Janus.10g1, p2.1     | Loop to p3.4 |
| 4           | r1.20, p2.5          | Loop to p3.3 |
| 5           | Janus.10g2, p2.1     | Loop to p3.6 |
| 6           | r1.20, p2.6          | Loop to p3.5 |
| 7           | Proxmox01.1g, p2.5   | Loop to p3.8 |
| 8           | r1.22, p1.14         | Loop to 3.7  |
| 9           | Proxmox01.10g1, p2.5 | Loop to 3.10 |
| 10          | r1.20, p2.3          | Loop to 3.9  |
| 11          | Proxmox01.10g2, p2.5 | Loop to 3.12 |
| 12          | r1.20, p2.4          | Loop to 3.11 |
| 13          | (empty)              | (empty)      |
| 14          | (empty)              | (empty)      |
| 15          | (empty)              | (empty)      |
| 16          | (empty)              | (empty)      |
| 17          | (empty)              | (empty)      |
| 18          | (empty)              | (empty)      |
| 19          | (empty)              | (empty)      |
| 20          | (empty)              | (empty)      |
| 21          | (empty)              | (empty)      |
| 22          | (empty)              | (empty)      |
| 23          | (empty)              | (empty)      |
| 24          | (empty)              | (empty)      |


### switch mapping {#switch-mapping}

Three primary switches in this rack.  `us-8-150w` deals with all things PoE.  `usw-pro-24` acts as the primary 1gig switch, and `us-16-xg` sits in as the core 10gig switch.


#### us-8-150w {#us-8-150w}

| port | connection        | vlan  | notes                 |
|------|-------------------|-------|-----------------------|
| 1    | r1.22, p1.1 front | LAN   | PoE                   |
| 2    | r1.22, p1.2 front | LAN   | PoE                   |
| 3    | r1.22, p1.3 front | LAN   | PoE                   |
| 3    | (empty)           |       |                       |
| 4    | (empty)           |       |                       |
| 5    | (empty)           |       |                       |
| 6    | (empty)           |       |                       |
| 7    | (empty)           |       |                       |
| 8    | (empty)           |       |                       |
| sfp1 | r1.21  port 1     | trunk | SFP to RJ45, LAG sfp2 |
| sfp2 | r1.21 port 2      | trunk | SFP to RJ45, LAG sfp1 |


#### usw-pro-24 {#usw-pro-24}

| port  | connection      | vlan  | notes                  |
|-------|-----------------|-------|------------------------|
| 1     | r1.23 port sfp1 | trunk | LAG port 2             |
| 2     | r1.23 port sfp2 | trunk | LAG port 1             |
| 3     | r1.22 p1.4      | IoT   |                        |
| 4     | r1.22 p1.5      | LAN   |                        |
| 5     | r1.22 p1.6      | LAN   |                        |
| 6     | r1.22 p1.7      | LAN   |                        |
| 7     | r1.22 p1.8      | LAN   |                        |
| 8     | r1.22 p1.9      | LAN   |                        |
| 9     | r1.22 p1.10     | LAN   | control for X32        |
| 10    | r1.22 p1.11     | dante | x-dante card           |
| 11    | r1.22 p1.12     | dante | x-dante card           |
| 12    | r1.22 p1.13     | LAN   |                        |
| 13    | r1.22 p1.14     | LAN   |                        |
| 14    | r1.22 p1.15     | LAN   |                        |
| 15    | r1.22 p1.16     | trunk | downstream to office   |
| 16    | r1.22 p1.17     | LAN   | downstream to AV shelf |
| 17    | (empty)         |       |                        |
| 18    | (empty)         |       |                        |
| 19    | (empty)         |       |                        |
| 20    | (empty)         |       |                        |
| 21    | (empty)         |       |                        |
| 22    | (empty)         |       |                        |
| 23    | (empty)         |       |                        |
| 24    | (empty)         |       |                        |
| sfp+1 | r1.19 port 11   | trunk | DAC, LAG with sfp+2    |
| sfp+2 | r1.19 port 12   | trunk | DAC, LAG with sfp+1    |


#### us-16-xg {#us-16-xg}

| port | connection             | vlan  | notes                          |
|------|------------------------|-------|--------------------------------|
| 1    | r1.20, p2.1            | lab   | SFP+ to RJ45                   |
| 2    | Attic sfp, out of rack | trunk | SFP                            |
| 3    | r1.20 p2.2             | lab   | SFP+ to RJ45                   |
| 4    | r1.20 p2.3             | lab   | SFP+ to RJ45                   |
| 5    | r1.20 p2.4             | lab   | SFP+ to RJ45                   |
| 6    | r1.20 p2.5             | LAN   | SFP+ to RJ45 (LAN NAS service) |
| 7    | r1.20 p2.6             | lab   | SFP+ to RJ45                   |
| 8    | r1.18 UDM pro SFP+ LAN | trunk | DAC, STP blocked               |
| 9    | (empty)                |       |                                |
| 10   | (empty)                |       |                                |
| 11   | r1.21, port sfp+1      | trunk | DAC, LAG with 12               |
| 12   | r1.21, port sfp+2      | trunk | DAC, LAG with 11               |
| 13   | (empty)                |       |                                |
| 14   | (empty)                |       |                                |
| 15   | (empty)                |       |                                |
| 16   | r1.18 UDM pro RJ45 LAN | trunk | Redundant with port 8          |


### hdmi matrix mapping {#hdmi-matrix-mapping}

I love this lunatic device.  Being able to reprogram display flows is so much fun, and the flexibility to easily share any device remotely with folks via the matrix/Atem Mini Extreme combo is down right magical.

Input mapping is mostly reliant on out of rack cables.  The Apple TV and Proxmox01 (windows 10 gaming VM with passthrough GPU) inputs are both in rack, and the consoles will both need slightly longer cables
since the matrix is moving off of the shelf that they currently live in.  The rest is in my big desk HDMI bundle, coming in through the ceiling.

| port   | connection                          | edid                        |
|--------|-------------------------------------|-----------------------------|
| HDMI 1 | Desktop, nvidia 1070 HDMI out       | 1080p HD Audio 7.1          |
| HDMI 2 | m1 MacMini HDMI out                 | 1080p HD Audio 7.1          |
| HDMI 3 | Desk HDMI cable                     | 1080p HD Audio 7.1          |
| HDMI 4 | Proxmox01 RX580 hdmi out (win01 vm) | 1080p HD Audio 7.1          |
| HDMI 5 | PS5                                 | COPY_FROM_OUT_1 (4k60,444)  |
| HDMI 6 | XboxOneX                            | COPY_FROM_OUT_1 (4k60, 444) |
| HDMI 7 | Apple TV                            | 1080p HD Audio 7.1          |
| HDMI 8 | Atem Mini Extreme Output 1          | 1080p HD Audio 7.1          |

Output mapping is entirely out of rack at the moment.  I'll move my HDMI bundle over pretty much unchanged.

| port     | connection                                                                                                                                                                    | scaler mode |
|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| Output 1 | [Desk Dell Ultrasharp](https://www.dell.com/en-us/work/shop/dell-ultrasharp-27-4k-hdr-monitor-up2718q/apd/210-amvp/monitors-monitor-accessories)                              | Bypass      |
| Output 2 | [Desk AOC Monitor](https://us.aoc.com/en/gaming-monitors/c24g1)                                                                                                               | Auto        |
| Output 3 | [Camera Mount Feelworld 4k](http://www.feelworld.cn/ShowInfo.aspx?id=530&py=FEELWORLD-T7-7-4K-On-camera-Monitor-with-HDMI-Input-Output-IPS-1920x1200-Rugged-Aluminum-Housing) | Auto        |
| Output 4 | (empty)                                                                                                                                                                       | (empty)     |
| Output 5 | Atem Mini Extreme input 5                                                                                                                                                     | AUTO        |
| Output 6 | Atem Mini Extreme input 6                                                                                                                                                     | AUTO        |
| Output 7 | (empty)                                                                                                                                                                       | (empty)     |
| Output 8 | (empty)                                                                                                                                                                       | (empty)     |

Loopout HDMI port mapping:

| port   | device          | connection                |
|--------|-----------------|---------------------------|
| loop 1 | Desktop         | (empty)                   |
| loop 2 | MacMini         | (empty)                   |
| loop 3 | Desk HDMI cable | Atem Mini Extreme input 7 |
| loop 4 | Win01           | (empty)                   |
| loop 5 | PS5             | (empty)                   |
| loop 6 | Xbone           | (empty)                   |
| loop 7 | Apple TV        | Atem Mini Extreme input 8 |
| loop 8 | AtemOut         | (empty)                   |

Courtesy of the analog audio outputs, I can get audio flows into the Behringer and onto the Dante network.  This lets me reprogam audio even more dynamically than video, sending buses anywhere I need along the Dante network.  So here we'll have two 3.5mm to dual 1/4 inch cables running down from the matrix into the X32 rack.

Analog audio output mapping from the matrix:

| port  | output device        | connection                             |
|-------|----------------------|----------------------------------------|
| aux 1 | Desk Dell Ultrasharp | x32 Aux 1 + 2 (3.5mm to dual 1/4 inch) |
| aux 2 | Desk AOC Monitor     | x32 Aux 3 + 4 (3.5mm to dual 1/4 inch) |
| aux 3 | Feelworld            | (empty)                                |
| aux 4 | (empty)              | (empty)                                |
| aux 5 | Atem Input 5         | (empty)                                |
| aux 6 | Atem Input 6         | (empty)                                |
| aux 7 | (empty)              | (empty)                                |
| aux 8 | (empty)              | (empty)                                |


## what's next? {#what-s-next}

I think that's the plan.  It doesn't rely on me adding a whole bunch of new equipment (the only new stuff is the 25u rack, one more patch panel and a third PDU), and it should have some space for me to rearrange things and expand (the drawers can come out in the future, the fractal design case can be collapsed down into 2u)

If I've totally whiffed on something, let me know! If all goes well, I should be able to make the switch next weekend.  I'll document the process, and hopefully when next I write, it will be with a newly reorganized home rack!
