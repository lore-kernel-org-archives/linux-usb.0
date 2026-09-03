Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC373CE4B1
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 18:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461776; cv=pass; b=RvAiaHf1RjNyP6/5rolC/WR87H10l0voPYHfdmrxMlmKjDLTbrFNYG1B/EwO3yF0/5gcXv886eHbuOkYPZcuPKNGsc8jW6MfMvz5rZIxfxJSlrIvKbHz157NUE5NYF6ccvgIGC8NNjmsla8xjyeBXXToQjX2BCfs7vIYTp7RWMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461776; c=relaxed/simple;
	bh=PvGPM92pAWPfnhuZLqhuou6zjC5m6M62hnp+2pSaCy0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=V8z1QMb6ygs8EGi76jlPmEdr0NYFMEZaOOsP3akIS82xF7pstkMXduI8lTrXyV4CUGuLulaG+HFW8RFQ8m4tAJhfEDfKg4VM0vEYbKfAl4iXqSITuYvrEWsBcrYz+CoSjJQ1CYBgombSitMAiSnhY3ATbRk8eLaafnxZDoxqLGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn+LiFeY; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn+LiFeY"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66cf1f9965dso133741d50.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 11:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788461763; cv=none;
        d=google.com; s=arc-20260327;
        b=A5y1Ax9q4iZFnmXNn+NPskm8W2Fp7vOCJxKn8QFyGJTpB+QIqms5/IqQvQwqePG6tE
         ZOIJVLJbuouiAYXbHhjzw4Hd0kskXhmsZuLiAzrSXT+TFlPioyxvDF9b0g+K5CKp38A9
         2nSpO1P3G4Td1GKO1V6/QR9ULzU8YzVs96BniFHQa4TaqMSXi0A/LV312YKNTEbWo84l
         EMMnA3kLOgjsg9chxdYlUFlPoA0RgpNDAsEyfvGNDzMANqEVNq84UihacHuMW+XW+wDy
         93dpFZ5Vi7rwkXfx9jSGYAM8nELdRnIAi/jRfQrbB9hOih3n8TJYN9HN9+k8nbbLTzTe
         UheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        fh=j0UnINdJUhfDnzzf5RNJ9pngw1wePvukxwkkJ+i+d2g=;
        b=SE/LxE0j9DwB5iwwcQf0DE4hY4v3McQGLLQJT2XBFzrKRmB1FtWzR8uXKUGi1uIYM5
         3SedvqMq17HQ03EpIizMp5CnfcglJE+K7U6HAvX8R6/7ordBA8seU/leBjgSpoG50QlN
         TV5jPWYBFzgHMsA3/M+DaTQQ8eNB76CZ9H0enrzNeZ/Fom8y3piferrf5Ilj81Rwk1vX
         Mh5eqsgpQe42lDT0AFmnOKLPV3Gg8dxnCqKBZaMzF/b6RjfeFod/dVwOZypNAGPrOlEY
         IqojhsukQFakPWjiwjmFbmWDsVJJOML1TiQexCOl+15PEqZMEEptMZZD/A8YKIE2BIax
         ajhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788461763; x=1789066563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        b=Dn+LiFeYXuzml2Z0gekYiJKhD3ZJQZztTBXjzY4mGDxGpokBwzuWt50i6gkJLgGOTT
         MGUjzEIB9z9Kjll42nEZibNfz+kPaHy8jq2eD/VT3tF/9x2j6mV8fo8KIGP3vIzuh04Y
         T7jg76Nmbqj/SHLCQsTeHkpdbmanWZez3JzO/OJ920UAHFSxvVrYBrCm81N4XoBxMc4N
         IDAJCWgsfdVL1+wUjKGxfrvAed/N7Lw9MaWkS4dYtSKcBDB22IWlqEsV3sIcSbP0bYoO
         8GKK9STKcm8GQMxl2fpMW/Xd/7aNW/bdW9uFBtieqEIT+H8BMWitSbMpUgUReSLp8zku
         vuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461763; x=1789066563;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        b=QxflbavkYT1VU+aqkX4xG6d7KLyWSpDZgdzP5UBMMMFDRs17x+oTUE9M52P/K3oAzc
         Dw/zQ4S+rYOLTQi/ucZ7RsMbcFoTLrmSyMSamvWIE63Y1iHEtJ6phZfcJk8tv7IdGPTN
         V7S/LxGsxIwUlOxaySHaW+6ILCldeao6kz2wRfti1r4Gn+8gYOYfI9A7UIB0YS/C9fIc
         Ns+AA5ASlpQQK5E+TRA+aR+7pi90ckSo4tmejdzUaxvKkUUd2/W2Nj/KInmbCMQw7Acs
         uTb4fcCbrAiBjHJ9tQCcJ4kYesw+bnY22jYkohzazh2WZFozzZbJ4DSXh+QhFN2GGudl
         5J4Q==
X-Forwarded-Encrypted: i=1; AKwUvBylcvHQY5LHM+zGhJ+UBPBjGFBvbotIvun0kPSGvEc7M3/pGmmSQTjRy6bmcnf0JJ5YNqxphAGAf7I=@vger.kernel.org
X-Gm-Message-State: AFuF++me2f0p1U3fqftqSeTqGjDSIzpT06hwVlmes9Ktl6okFcCE2pEh
	QrKFSbze4CM0io14G8RF4BUx97wXhWP20DYQsSVcoThO1xgz3z+6gWjUIDOY9xOZ4KBAbpSbb9t
	7wr9a8rcahXF/WNHtklR+96AvSmZDIWM=
X-Gm-Gg: AYBFou3ZGGMHyBGA1G+vT0a8rH5SlRVssCLJuc0boRI9I3I5EAS4Y3U6mpoBM3oefXj
	AR70r5rAZtk1g49U3lweycXs8aUv7+8LKVBiEHV3z8iB99NhFTGX3linqJxO1IIs6wsMEDx6VDA
	5/CQ3obcjxA+No8yyRLahZMHxDoGy10v4yaDTH4gkimve9N0GafxBPnheBvFfWYKUp8w6XKMP9Z
	/KPCWRlu+0mQxO4X8RxCxM6D3mEcg/Wnb2O+P7i2Zxo7IpHJPzW25jafqHf5QcdNavx9QCIlo7P
	dLHN8gTovWSqX93+Xo12XW3RvMQyOLUtc/GnmZcyAEAvJA==
X-Received: by 2002:a05:690e:118e:b0:66f:8a11:5dc0 with SMTP id
 956f58d0204a3-66fb5a0f7b9mr261926d50.29.1788461762813; Thu, 03 Sep 2026
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: te36de <te36de@gmail.com>
Date: Thu, 3 Sep 2026 11:55:50 -0700
X-Gm-Features: AcwNN1XWb-DGN3vM5fntojDMjxVQWROYAm6W2gQckxCweT_zU5JBMdj-2AdsdhU
Message-ID: <CAOmNcAB8nBueNabeR_tBOjtximEwG9gdn4vt0Os4qac9OukTOQ@mail.gmail.com>
Subject: H618 sunxi/musb driver (likely) looses interrupts -> g_mass_storage
 I/O errors/resets
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Summary:
  Likely problem in H618 sunxi/musb driver code leading to I/O errors,
resets on g_mass_storage.
  Produced on Orange Pi Zero 3 (OPZ3, H618 based), Linux
6.18.48-current-sunxi64:
    reproduced also with 7.1.12-edge-sunxi64 (problem not fixed in 7).
  set up g_mass_storage on sparse file (no actual I/O required reading
from it), read from host:
    Works reliable for minutes (14...22MByte/sec) when OPZ3 is otherwise idle.
    Creates repeatedly intermitting I/O errors and resets on USB host as soon
    as there is even just some process-level only CPU load on H618
(stress-ng on 2 kernel).
  Problem does not occur on RPI4 using dwc2 (instead of sunxi/musb)
with same tests
  Diagnosis seems to point to lost interrupts.

1. Reproduce by:

1.1 Connect gadget device (Orange PI zero 3 1GB in my case) USB-C port to host.

Note: Given how this powers the gadget device, it may not be
sufficient for gadget devices needing
a lot more current, but OPZ3 stays well below 500 mA under all conditions.

1.2 On gadget device (Orange PI zero 3 1GB):

truncate -s 12T /tmp/empty.img
modprobe g_mass_storage
file=/disk/S2/Shelf.UHD/TMP/avatar/AVATAR_BONUS1.iso stall=0 ro=1
removable=1

1.3. On host device

Determine device name for gadget, in this case /dev/sdb:

[129005.654791] usb 1-1: new high-speed USB device number 9 using xhci_hcd
[129005.785710] usb 1-1: New USB device found, idVendor=0525,
idProduct=a4a5, bcdDevice= 6.18
[129005.785730] usb 1-1: New USB device strings: Mfr=3, Product=4,
SerialNumber=0
[129005.785736] usb 1-1: Product: Mass Storage Gadget
[129005.785740] usb 1-1: Manufacturer: Armbian Linux
6.18.48-current-sunxi64 with musb-hdrc
[129005.787697] usb-storage 1-1:1.0: USB Mass Storage device detected
[129005.788090] usb-storage 1-1:1.0: Quirks match for vid 0525 pid a4a5: 10000
[129005.788244] scsi host2: usb-storage 1-1:1.0
[129006.798208] scsi 2:0:0:0: Direct-Access     Linux    File-Stor
Gadget 0618 PQ: 0 ANSI: 2
[129006.798370] sd 2:0:0:0: Attached scsi generic sg1 type 0
[129006.798560] sd 2:0:0:0: Power-on or device reset occurred
[129006.799139] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[129006.799905] sd 2:0:0:0: [sdb] 25769803776 512-byte logical blocks:
(13.2 TB/12.0 TiB)
[129006.800049] sd 2:0:0:0: [sdb] Write Protect is on
[129006.800053] sd 2:0:0:0: [sdb] Mode Sense: 0f 00 80 00
[129006.800181] sd 2:0:0:0: [sdb] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[129006.801447] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[129006.821771] sd 2:0:0:0: [sdb] Attached SCSI removable disk

Then start program to read from the disk:

pv -ptera < /dev/sdb > /dev/zero

And in another window check for I/O errors:

dmesg -w

1.3.1 "empty" run:

With nothing else running on the gadget, this should run reliable
without any I/O errors. Throughput
should be beteween 15...22 MByte/sec depending on block size of host
(due to the stop&go nature of BOT
i think).

1.3.2 error run:

In addition to 3.1, start some CPU activity on the gadget, e.g.:

stress-ng --cpu 4 --timeout 6000s

Now observe that after at most a few minutes, I/O error(s) and resets
will happen to the
gadget device, visible on the host, e.g.:

[131887.406689] I/O error, dev sdb, sector 4682752 op 0x0:(READ) flags
0x84700 phys_seg 2 prio class 0
[131887.406725] sd 2:0:0:0: [sdb] tag#0 device offline or changed
[131887.406731] I/O error, dev sdb, sector 4682992 op 0x0:(READ) flags
0x84700 phys_seg 2 prio class 0
[131887.406810] sd 2:0:0:0: [sdb] tag#0 device offline or changed
[131887.406828] I/O error, dev sdb, sector 4683232 op 0x0:(READ) flags
0x80700 phys_seg 1 prio class 0
[131887.416234] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[131974.304607] usb 1-1: reset high-speed USB device number 9 using xhci_hcd
[131974.435735] sd 2:0:0:0: [sdb] tag#0 FAILED Result:
hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK cmd_age=31s
[131974.435754] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
00 00 60 51 e0 00 00 00 20 00 00
[131974.435759] I/O error, dev sdb, sector 6312416 op 0x0:(READ) flags
0x80700 phys_seg 1 prio class 0
[131974.436075] sd 2:0:0:0: Power-on or device reset occurred
[131974.436097] sd 2:0:0:0: [sdb] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_OK cmd_age=0s
[131974.436105] sd 2:0:0:0: [sdb] tag#0 Sense Key : Unit Attention [current]
[131974.436112] sd 2:0:0:0: [sdb] tag#0 Add. Sense: Power on, reset,
or bus device reset occurred
[131974.436119] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
00 00 60 52 00 00 00 00 f0 00 00
(host using larger block size for reads achieve lowe

On OPZ3, these errors happen already with as few as just 2 CPU cores
(out of 4) loaded.

1.4. Notes

- The test from 3. are just to eliminate as many possible sources of
error as possible.
  In the target application, the additional load comes from network
I/O, but i tried to
  simplify the reproduction of the error down to just process level
CPU being used.

- Problem does not happen on RPI4, which is why i think the problem is
not in g_mass_storage/f_mass_storage,
  but in the sunxi/musb driver - RPI4 useses instead dwc2 driver.

- The problem may be happening less often with loweer g_mass_storage
transfer rates,
  but for the target use-case, a speed of 12MByte/sec or more is
required, otherwise
  cheaper (but slower)  gadget devices than H618 would also become an option.

- Problem does not depend on size of file used, happens equally for
smaller file sizes,
  just using such a large file because of intended use-case.

- Lots of parameters that don't change the result when changed
  - "stall=0/1
  - musb_hdrc.use_dma=0
  - capping the host's transfer size (max_sectors_kb=16)
  - different idVendor/idProduct
  - moving the musb IRQ to another CPU via smp_affinity (IRQ 310 is
not shared with any other device)
  - powering the board from a separate supply rather than the host port

2. Troubleshooting

I had claude.ai vibe code me some tracingon the gadget. I can't claim
i understood it really
down to the details, but here is how claude.ai is summarizing it. Rest
of email below
is writeup from claude

Working - one SCSI READ(10), 16 KiB:

  file-storage   do_read() {
  file-storage     kernel_read()             0.03  ms   data from backing file
  file-storage     usb_ep_queue() {
  file-storage       musb_gadget_queue()     0.004 ms   UDC accepts request
  file-storage     }                         0.008 ms
  file-storage   }
  file-storage   sleep_thread() {                       thread waits
    <irq ctx>      sunxi_musb_interrupt() {
    <irq ctx>        musb_interrupt() {
    <irq ctx>          musb_g_tx()           0.010 ms   one packet sent
    <irq ctx>        }                       0.012 ms
    <irq ctx>      }                         0.014 ms
                   ... ~20 such interrupts, one per packet ...
    <irq ctx>      sunxi_musb_interrupt() {
    <irq ctx>        musb_interrupt() {
    <irq ctx>          musb_g_tx() {                    last packet
    <irq ctx>            bulk_in_complete()             request given back
    <irq ctx>          }                     0.010 ms
    <irq ctx>        }                       0.012 ms
    <irq ctx>      }                         0.015 ms
  file-storage   }                           3.8   ms   thread woken

Failing - identical up to the queue, then nothing:

  file-storage   usb_ep_queue() {
  file-storage     musb_gadget_queue()       0.005 ms   UDC accepts request
  file-storage   }                           0.008 ms
  file-storage   sleep_thread() {                       thread waits

                 ... ~30 s of complete silence ...

                 no sunxi_musb_interrupt, no musb_interrupt,
                 no musb_g_tx, no musb_g_rx, no bulk_in_complete

    [host]       SCSI command times out, I/O errors, port reset
    [gadget]     re-enumerates, resumes normally

  Kernel stack of the file-storage thread during the hang:

    [<0>] sleep_thread+0x10c/0x180 [usb_f_mass_storage]
    [<0>] fsg_main_thread+0x10c/0x16b0 [usb_f_mass_storage]
    [<0>] kthread+0x134/0x1f8
    [<0>] ret_from_fork+0x10/0x20

  task state S (interruptible sleep), i.e. it is not blocked on I/O.

  Event counts at the moment of the hang, and the delta over the 2 s
  after the thread parked:

    usb_ep_queue           650      +0
    musb_gadget_queue      650      +0
    sunxi_musb_interrupt 14605      +0
    musb_interrupt       14605      +0
    musb_g_tx            14519      +0
    musb_g_rx               86      +0
    bulk_in_complete       566      +0
    kernel_read            478      +0

What this appears to show
-------------------------

The request is accepted by musb_gadget_queue() and the transfer never
starts: not a completion lost at the end of a transfer that otherwise
ran, but no packet sent at all.

Notably sunxi_musb_interrupt() - the registered handler for the musb
IRQ - does not run even once during the hang.  So the failure is not the
driver mishandling an interrupt; no interrupt is delivered to the handler
at all.  I cannot tell from this whether the controller never raised its
line or whether the interrupt was lost or masked elsewhere.

Since the failure is triggered by CPU load alone, with a sparse backing
file and no I/O of any kind, this looks like a race between queueing a
request and the endpoint's interrupt or FIFO state, rather than anything
in f_mass_storage or the storage path.
