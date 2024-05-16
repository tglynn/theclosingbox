+++
title = "macpro build - day 0"
date = 2020-05-12
draft = false
weight = 4006
toc = false
+++

Now that we now what we're going to try to do here and why, let's formulate some
kind of plan for this project.


## the plan {#the-plan}

I'm going to start with the lowest spec 2 processor tray.  I might have been
able to find a better deal on a single processor machine and then source a dual
proc CPU tray, but from a cursory search of ebay and craigslist, that might take
a while, and I'm a little concerned about extra shipping cycles and part
availability.  Ultimately, I landed on:

`Apple Mac Pro 5,1 MC561LL/A (2010) 8 Core/16GB/1TB/ ATI Radeon 5770`

(Note that the `8 Core` specification spells out two quad core CPUs)

More details around that particular Mac available [here](https://everymac.com/systems/apple/mac%5Fpro/specs/mac-pro-eight-core-2.4-mid-2010-westmere-specs.html).

Most of those specs are stock - that is the GPU that shipped with that machine in
2010, which is important for getting the bootscreen and will be a useful thing to keep
around for troubleshooting, and a 1 TB 7200 RPM rotating drive also could well
be original.  The RAM isn't stock (the original machine shipped with six 1 GB
DIMMs), but that's a super common upgrade, and I don't imagine we'll need the
factory RAM for anything.

From the listing, the machine is running High Sierra.  Unclear which firmware it
will ship with.

_What's the plan?_

There are a few interlocking steps here. To upgrade from High Sierra to Mojave,
I'll need a metal capable graphics card.  Switching to a metal capable graphics
card probably means giving up the boot screen (there are flashed firmware cards,
and folks who offer firmware flashing as a service, but I don't think it's worth
it for my use case).  I'll likely end up running [OpenCore](https://github.com/acidanthera/OpenCorePkg) anyway to allow me to
update to Catalina with hardware acceleration and Thunderbolt 3 support, so the
boot screen isn't a big loss.

So I need a metal capable GPU.  I've gone back and forth a bit, trying to decide
between the 5700 XT and the Radeon VII.  The 5700 XT is a newer Navi card, with
some significant benefits to power draw and cooling.  They're both 7nm
processes, but the Radeon VII is much more power hungry.  To the Radeon VII's
credit, it appears to benchmark better than the 5700 XT in several performance
characteristics, and, most importantly, is supported in both Mojave and Catalina
(the 5700XT requires a relatively new version of Catalina).  Both would likely
require modifying my power supply.  In the end, I landed on the Radeon VII for
the slightly increased flexibility, slightly better performance and slightly
better price.  I will need an interim card, a card that runs in both High Sierra
and Mojave so that I can perform the litany of firmware updates and the crucial
update from High Sierra to Mojave.  It will also take some time to get the parts
required for the power supply mod, so I'll be using an MSI RX 580 Armor 8G OC
with a dual mini 6 pin to 8 pin power adapter in the interim.

I'll keep the 1 TB HDD on High Sierra so that I can use the original 5770 (once
I upgrade to Mojave, the 5770 won't be able to boot the OS).  The plan starts to
look like:

1.  Document and benchmark the initial system
2.  Run High Sierra firmware updates, wipe 1 TB HDD and clean install High Sierra
3.  Install Radeon RX 580.  Power the card with a dual mini 6 pin to single 8 pin
    adapter.
4.  Run all firmware updates bundled in the Mojave installer. This will bring the
    machine's firmware to `144.0.0.0.0`, and crucially adds the ability to boot
    off of NVMe drives.
5.  Install PCIe NVMe bifurcation Riser and boot NVMe drive in slot 2
6.  Install Mojave to NVMe drive.  Remove 1 TB HDD, store in safe place.
7.  Flash Titan Ridge thunderbolt 3 card
8.  Install Thunderbolt 3 card
9.  Upgrade CPUs
10. Upgrade memory
11. Perform [pixlas mod on power supply](http://blog.greggant.com/posts/2018/05/07/definitive-mac-pro-upgrade-guide.html#pixlas)
12. Install Radeon VII
13. Upgrade optical drive to Blu-ray drive
14. Install Windows 10 (to either SATA SSD or, if I've installed OpenCore, to
    the second NVMe drive)


## componentry {#componentry}

This will leave me with a machine that looks like (from the bottom of the box
up):

| Location            | Component                                                                        |
|---------------------|----------------------------------------------------------------------------------|
| CPU Tray            | 2 x Xeon 5690 (32 nm 6 core, 12 thread 3.46-3.73 GHz processors)                 |
| Memory Slots        | 96 gigabytes (6 x 16) DDR3 ECC memory at 1333 MHz                                |
| PCIe Slot 1         | Radeon VII                                                                       |
| PCIe Slot 2         | Syba I/O Crest SI-PEX40129 Dual M.2 NVMe Bifurcation Riser                       |
| Syba Slot 1         | 1 TB Samsung 970 Evo NVMe (macOS boot drive)                                     |
| Syba Slot 2         | 1 TB Samsung 970 Evo NVMe (Windows 10)                                           |
| PCIe Slot 3         | Sonnet Allegro USB-c 4 port PCIe card                                            |
| PCIe Slot 4         | Gigabyte GC-Titan Ridge Thunderbolt 3 card                                       |
| Drive Bay 1         | 8 TB Seagate HDD (Time Machine, EFI host for OpenCore)                           |
| Drive Bay 2         | 3 TB WD Red HDD (Mac rotational storage)                                         |
| Drive Bay 3         | 3 TB WD Red HDD (Windows rotational storage)                                     |
| Drive Bay 4         | 3 TB WD Red HDD (Vanilla Mojave bootable snapshot, for OpenCore troubleshooting) |
| Optical Drive Bay 2 | Empty                                                                            |
| Optical Drive Bay 1 | LG WH16NS60 16x Internal Blu-ray BDXL M-Disc Drive (flashed for UHD rips)        |


## references {#references}

-   [The Definitive Classic Mac Pro Upgrade Guide](http://blog.greggant.com/posts/2018/05/07/definitive-mac-pro-upgrade-guide.html) - just an outstanding
    resource. Lots of information, lots of links.  This single post provides
    almost all of required info for this project.

-   [MacRumors thread, Thunderbolt 3](https://forums.macrumors.com/threads/testing-tb3-aic-with-mp-5-1.2143042/) - ever evolving, source of some great
    information about flashing the Titan Ridge for use in the cMP 5,1

-   [OpenCore on Legacy Apple Hardware](https://forums.macrumors.com/threads/opencore-on-the-mac-pro.2207814/?view=reaction%5Fscore) - another fantastically maintained wiki
    post.  Improved by leaps and bounds even as I'm writing this up.

-   [Thunderbolt Mac Pro Early 2009](https://github.com/ameyrupji/thunderbolt-macpro-5-1) - good summation of the flashing process, with
    some very useful pictures and links

-   [Flashing for 4k UHD](https://www.makemkv.com/forum/viewtopic.php?f=16&t=19928&sid=66451896270b9a530b25b882ed3aad55) - not cMP 5,1 specific, but great information on flashing
    the Blu-ray drive for 4k UHD rips

-   [Gigabyte designare flashing](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/) - the micro guides provide a ton of useful
    background information, and tend to be a little more technical in their
    explanations.  Useful for trying to understand _why_ some steps are required.
