+++
title = "macpro build - day 2"
date = 2020-08-29
draft = false
weight = 4004
toc = false
+++

Day two is dedicated to some early annoyance fixes, and some temperature and
performance measurements of the NVMe storage.


## a tiny fan {#a-tiny-fan}

With a little more burn in time in a quiet room, I noticed a change in the sound
profile of the Mac Pro.  The addition of the Syba I/O card had added in a
high-pitched, whiny fan noise.  This didn't seem to ramp up and down with
temperatures on the M.2 cards; it was a constant, awful whir.

{{< figure src="/images/mp_12.jpg" caption="Figure 1: The fan in question" >}}

I know that NVMe thermal management is a significant problem, but my ambient and
component temperatures within the machine were pretty good (and I _really_ didn't
like that fan noise), so I thought I'd give it a try with the fan unplugged.
The heatsink closed up nicely, and kept the fan cable tidily in place.

With the (thankfully much quieter) machine back up and running, I thought I'd
see if I could push some I/O to the NVMe devices and see how they handled
dissipating the heat.  I also took it as an opportunity to confirm the
performance characteristics of my storage.

```text
tglynn@jupiter /Volumes/nvme_storage_01/test_temps $ fio --name=randwrite --rw=randwrite --direct=1 --ioengine=posixaio --bs=64k --numjobs=8 --size=4g --runtime=600 --group_reporting
randwrite: (g=0): rw=randwrite, bs=(R) 64.0KiB-64.0KiB, (W) 64.0KiB-64.0KiB, (T) 64.0KiB-64.0KiB, ioengine=posixaio, iodepth=1
...
fio-3.19
Starting 8 processes
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
randwrite: Laying out IO file (1 file / 4096MiB)
Jobs: 8 (f=8): [w(8)][100.0%][w=2075MiB/s][w=33.2k IOPS][eta 00m:00s]
randwrite: (groupid=0, jobs=8): err= 0: pid=3544: Thu Apr 16 18:56:50 2020
  write: IOPS=35.5k, BW=2222MiB/s (2329MB/s)(32.0GiB/14750msec)
    slat (usec): min=2, max=185, avg= 7.37, stdev= 3.60
    clat (usec): min=85, max=7605, avg=214.44, stdev=42.70
     lat (usec): min=96, max=7611, avg=221.81, stdev=42.75
    clat percentiles (usec):
     |  1.00th=[  161],  5.00th=[  174], 10.00th=[  182], 20.00th=[  192],
     | 30.00th=[  198], 40.00th=[  206], 50.00th=[  212], 60.00th=[  219],
     | 70.00th=[  227], 80.00th=[  235], 90.00th=[  249], 95.00th=[  262],
     | 99.00th=[  306], 99.50th=[  355], 99.90th=[  498], 99.95th=[  553],
     | 99.99th=[  742]
   bw (  MiB/s): min= 2073, max= 2264, per=100.00%, avg=2229.27, stdev= 7.56, samples=224
   iops        : min=33168, max=36232, avg=35664.32, stdev=120.83, samples=224
  lat (usec)   : 100=0.01%, 250=90.94%, 500=8.95%, 750=0.09%, 1000=0.01%
  lat (msec)   : 2=0.01%, 4=0.01%, 10=0.01%
  cpu          : usr=5.41%, sys=4.33%, ctx=571965, majf=0, minf=204
  IO depths    : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued rwts: total=0,524288,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
  WRITE: bw=2222MiB/s (2329MB/s), 2222MiB/s-2222MiB/s (2329MB/s-2329MB/s), io=32.0GiB (34.4GB), run=14750-14750msec
```

```text
tglynn@jupiter /Volumes/nvme_storage_01/test_temps $ fio --name=randwrite --rw=randwrite --direct=1 --ioengine=posixaio --bs=64k --numjobs=8 --size=512m --runtime=600 --group_reporting
randwrite: (g=0): rw=randwrite, bs=(R) 64.0KiB-64.0KiB, (W) 64.0KiB-64.0KiB, (T) 64.0KiB-64.0KiB, ioengine=posixaio, iodepth=1
...
fio-3.19
Starting 8 processes
Jobs: 8 (f=8)
randwrite: (groupid=0, jobs=8): err= 0: pid=3522: Thu Apr 16 18:55:58 2020
  write: IOPS=35.6k, BW=2222MiB/s (2330MB/s)(4096MiB/1843msec)
    slat (usec): min=2, max=127, avg= 6.83, stdev= 3.27
    clat (usec): min=93, max=21151, avg=212.97, stdev=145.17
     lat (usec): min=110, max=21160, avg=219.80, stdev=145.17
    clat percentiles (usec):
     |  1.00th=[  159],  5.00th=[  172], 10.00th=[  180], 20.00th=[  190],
     | 30.00th=[  198], 40.00th=[  204], 50.00th=[  210], 60.00th=[  217],
     | 70.00th=[  223], 80.00th=[  233], 90.00th=[  245], 95.00th=[  260],
     | 99.00th=[  297], 99.50th=[  318], 99.90th=[  465], 99.95th=[  619],
     | 99.99th=[ 1434]
   bw (  MiB/s): min= 2259, max= 2283, per=100.00%, avg=2269.96, stdev= 1.33, samples=24
   iops        : min=36154, max=36538, avg=36313.67, stdev=21.17, samples=24
  lat (usec)   : 100=0.01%, 250=92.19%, 500=7.73%, 750=0.05%, 1000=0.02%
  lat (msec)   : 2=0.01%, 50=0.01%
  cpu          : usr=5.17%, sys=4.42%, ctx=71930, majf=0, minf=189
  IO depths    : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued rwts: total=0,65536,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
  WRITE: bw=2222MiB/s (2330MB/s), 2222MiB/s-2222MiB/s (2330MB/s-2330MB/s), io=4096MiB (4295MB), run=1843-1843msec
```

Temperatures on the NVMe devices peaked around 52° (C), and dropped back down to
the idle temp of 39° in less than a minute. Those are not worrying temperatures,
but unplugging the Syba's fan does compound my fears around airflow, since the
Syba I/O card rests right up against the GPU, and the GPU exhaust will blow
right across it.  I'm not so sure that the Syba's fan would be able to do much about that
suboptimal situation anyway.  It would still be pulling in the hot exhaust from
the GPU to do whatever cooling it can (and I imagine the GPU fans are moving
much more air than the tiny Syba fan ever could).  But it's worth testing nonetheless.


## changing slots {#changing-slots}

Moving the Syba I/O card to slot 3 was trivial (I was worried that there might
be some problems finding the boot drive, but it was a total nonevent).  The
change from slot 2 to slot 3 means the card is now in a PCI Express 1.0 x4 slot,
rather than a PCI Express 2.0 x16 slot.  So the maximum theoretical throughput
of the Syba is now (250 MB/s \* 4 \* 2) 2000 MB/s (made even slower due to limited
connection from South Bridge, where slots 3 and 4 are connected, to the North
Bridge).  A quick `fio` benchmark proved that change out:

```text
tglynn@jupiter /Volumes/nvme_storage_01/test_temps $ fio --name=randwrite --rw=randwrite --direct=1 --ioengine=posixaio --bs=64k --numjobs=8 --size=4g --runtime=600 --group_reporting
randwrite: (g=0): rw=randwrite, bs=(R) 64.0KiB-64.0KiB, (W) 64.0KiB-64.0KiB, (T) 64.0KiB-64.0KiB, ioengine=posixaio, iodepth=1
...
fio-3.19
Starting 8 processes
Jobs: 8 (f=8): [w(5),f(1),w(2)][100.0%][w=1503MiB/s][w=24.0k IOPS][eta 00m:00s]
randwrite: (groupid=0, jobs=8): err= 0: pid=943: Fri Apr 17 16:46:54 2020
  write: IOPS=23.8k, BW=1490MiB/s (1562MB/s)(32.0GiB/21994msec)
    slat (nsec): min=2715, max=98380, avg=7062.84, stdev=3011.27
    clat (usec): min=117, max=9036, avg=325.37, stdev=48.69
     lat (usec): min=127, max=9042, avg=332.43, stdev=48.67
    clat percentiles (usec):
     |  1.00th=[  289],  5.00th=[  302], 10.00th=[  310], 20.00th=[  314],
     | 30.00th=[  318], 40.00th=[  318], 50.00th=[  322], 60.00th=[  322],
     | 70.00th=[  326], 80.00th=[  330], 90.00th=[  343], 95.00th=[  355],
     | 99.00th=[  445], 99.50th=[  644], 99.90th=[  668], 99.95th=[  676],
     | 99.99th=[  807]
   bw (  MiB/s): min= 1406, max= 1520, per=100.00%, avg=1491.52, stdev= 2.70, samples=344
   iops        : min=22510, max=24322, avg=23861.98, stdev=43.04, samples=344
  lat (usec)   : 250=0.02%, 500=99.17%, 750=0.80%, 1000=0.01%
  lat (msec)   : 2=0.01%, 4=0.01%, 10=0.01%
  cpu          : usr=3.55%, sys=2.97%, ctx=542369, majf=0, minf=193
  IO depths    : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued rwts: total=0,524288,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
  WRITE: bw=1490MiB/s (1562MB/s), 1490MiB/s-1490MiB/s (1562MB/s-1562MB/s), io=32.0GiB (34.4GB), run=21994-21994msec
```

Temperature was totally unchanged.  The NVMe cards idled around 39°, and peaked
under heaviest sustained load around 52°.

With no temperature impact and a clear performance change, I decided to keep the
Syba I/O card in slot 2, and run it with the built in fan unplugged.
