Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7A4CA773
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535209; cv=pass; b=jL5DTAoYgHU8Uk3jlxJGz13dgx0h3Nsy99gsWi+K6pAEX36G7pgqzsFaHPdj2wCUq5hl0YWb5HYrxl+emy6UKUFw89AmXadJgOSIGc9WvfMAehR1FW+JcY9RxliK5SG6KdI0U3nhJ0iaHPpU6JPxFSqLcqza/YJcMl7drDWRUqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535209; c=relaxed/simple;
	bh=btfr7/6hdpHMMHY4/qUvK1JUkWbFbUcwa0nGqxafBBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQPB/8zW9zBX+UuiOUaLwE39EKvB9V/c79/A/TQqmFxV2T2EizqqIOjsAzdEs70w70SMgRz+cXH8Hv/hR13H9Nav19sC4yCduSMXUiTKC+v4FxfRFQpbzwKqP7z++O3q8qlFA9FsvsG9F6bK8BhZ28hGsKfwXd8GQFHV2s4qooM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdRBzZiO; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdRBzZiO"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-861f30636f9so17207987b3.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 08:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535206; cv=none;
        d=google.com; s=arc-20260327;
        b=TGhYr4rwRgHt4bkAJI/3JhIVwjKYmfGkob0DyQdxxtN5NKsr8HwyVWk79GhlAeM9lB
         YF3YZS3Lpy91VgiZP3IG+mpIf100oFDF+vKVKb5bEHmLfK4aUnvGd15RtXHgNWLwfcHm
         BnjXSVHeRuhjJrW3V8DEZzQwci8XdOBSjUBjtU55xmF9M8TwXbm7HTb6RqtJwfBCaCm9
         xLFaCW5Bnxy2z46vMWvZpocuv6FWqEcZca/M3f1oBiNpuhizgPqLziwqFfclAnEKKLa0
         EEBf2YSyw53iTpib/yOfB7Gu4dx5a7VjYxaMsrId6e2/TcqMsMPZdcHjcJ/+3YAynJhv
         7lfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6HR3A2guW3Nu+trTsbsY+GfZFYku9Gf2pLXBr9XniQ=;
        fh=9Lm0bDqrP1i4uQcKl9iRMpqjPsW9+didrGYlt03tpnA=;
        b=XwRHQ0y/SMCHQIV2zKIDW/llpTBkQQH8qnfZsMczfufAT2Wf5ODWWV2/DXs++MKuCt
         nZuenVdqYmcBwsI2pYT4HO0mGUb10437Ld9v5w50wXXt71k0ZLP31s69z2M00eNdRGz+
         hRD8MMw3VA1gdZBeIDxEQ7zW+WANWiEp3M60aa0+bumnK1hvbQ+tDmQEkYzg+hxI3Wsh
         X1L3EhDHz0cTHzi8atJBzpVaYBziikaLonzzGcqO6aN8pF9Nn0/CHVWHHpMgzgWhNJ71
         nfy09Xsfdd6w0jaNfUbm71nebNFr9yNlHxZMqUCzEDOf6vFLaoPsgsL009zxHF0jMbve
         torA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535206; x=1789140006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6HR3A2guW3Nu+trTsbsY+GfZFYku9Gf2pLXBr9XniQ=;
        b=bdRBzZiO8fL0zi5v+cz2OQEmENwCDH080QUhzZYWc5MSWZqOAp73hFlVCplHi571yt
         KOTVIC65VO66nw+D3AaGtjCFR8VimPwk6dw+SoEeMx2Usv+E9TPlUjCNbixQshAK9vjJ
         Vahd1aA6DY1XuIot23k4+Lbj/13j5BKGmLZ7IlpP10LozE/eA0GbgDPmhHEU99veQLjA
         vQ2H2J3VsbHRh+5DCGWfE80zEUB9MBV9r7s71IYYtBq9adTx/AOtctsYoEvLdFoVEBVH
         GblZIw2H0HcoVYjh5BdVxfQq/SYMWMgJZ4KCjI0wwuS6TN62yZE3ZmGsLUgML1OdmbPH
         9Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535206; x=1789140006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6HR3A2guW3Nu+trTsbsY+GfZFYku9Gf2pLXBr9XniQ=;
        b=TwiCkNN+bRi/hwiRrdIgJoR+BoQ3tP0Xr1GBysyztPUV76WFPsFwIOr7mekfs+Bi65
         W3yU8kRiIDZBhKyUSs7lp1edoYy7tD6P0xcg6jdKAKr4Yi/ITET0Bn4r9pj1xPn72Da4
         qDEuUICvCs6WsV/Wq32YbMMh1I2KyovTyFFshokWRMVmjlWPDKjHlQrTK+ZpyH7qVISt
         u6Cfr6dkVrZXeVmYLHtw2AooEVtmPdUxVbnA4OsFRnwSck8sfforkBVcgzy3rZh6Fbut
         B4q04rcxfUC3RC0dZvsZgKVHsYX2AlHB7iYtr3+uglUSEGH8Oahqgrwhvbsd3tQoOMDp
         gRbg==
X-Forwarded-Encrypted: i=1; AKwUvBz8ScoSCgj3WsdrhB3Qh5wjKLAUq2Q9rXBlX46t5F1XKiGxDDLKw/s/PnwglXtsTBLIRu4Vn+CV65w=@vger.kernel.org
X-Gm-Message-State: AFuF++nuWLM1TSYBi71zAzGBOP7EucpehZIw7EkbeTcIVh3IbRsRVApK
	ZxlvUk4x01NPuOd+GRXrTdFuJ5qflXoBzlLU5m+4wyRF12A84Cl64G4evW+I6RRanTaQdenaLPs
	/AR3flc7jhJffWSq5U7Gq61WkCdCc+Vw=
X-Gm-Gg: AYBFou1komivpc5DWKym0/ESJ5cB3kyWhMZTwYbbTHMDdaARcJdtRyDWV3lDsFkbqdu
	sBExtkLHwnZKgCGrzbA/oshre+pSBdGzXNoCB5BNIYA1TuQrGV0nGzMeaHuPGUtKGiKZHS8yBn+
	34pB9aiHRWAj5omVgT+8lSP8hRtb/1DokJYoSqD6J9pdLNP/OuL2331PYcPqyEiZOuz50IJb5YQ
	+mqzrEJ0zxdmJSGhCPBw2sFg26FBlkx31C1msMo682u2POgmseBdM5c1HCX4aOE/DIEbLQi17s3
	5ALdsBXvwv2UNHcLljaLNFTZZuNM0Ez50sfIIgkeCyf1aQo5tBKcgA4Q
X-Received: by 2002:a05:690e:44e:b0:66d:1a9b:83be with SMTP id
 956f58d0204a3-66fb5a92dc6mr2114299d50.42.1788535205394; Fri, 04 Sep 2026
 08:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOmNcAB8nBueNabeR_tBOjtximEwG9gdn4vt0Os4qac9OukTOQ@mail.gmail.com>
 <app5WjDz9rnUNM_x@eggarch>
In-Reply-To: <app5WjDz9rnUNM_x@eggarch>
From: te36de <te36de@gmail.com>
Date: Fri, 4 Sep 2026 08:19:54 -0700
X-Gm-Features: AcwNN1W5pRr4oqJBcFYw5IdOmTdvkEiYeEomHeEfJJNaOMy2z2dr0zqhv7L8Ppg
Message-ID: <CAOmNcAD2iEghDtyuXfwjWAQq30DmTjQ_FrxhxDVjX1+AY_gobQ@mail.gmail.com>
Subject: Re: H618 sunxi/musb driver (likely) looses interrupts ->
 g_mass_storage I/O errors/resets
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the suggestion, Lovekesh.

Unfortunately, it did not change anything.  ;-( I/O errors still
equally occurring under CPU load.

Let me know what else i should try to help resolve the issue.


On Fri, Sep 4, 2026 at 12:56=E2=80=AFAM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> On Thu, Sep 03, 2026 at 11:55:50AM -0700, te36de wrote:
> > Summary:
> >   Likely problem in H618 sunxi/musb driver code leading to I/O errors,
> > resets on g_mass_storage.
> >   Produced on Orange Pi Zero 3 (OPZ3, H618 based), Linux
> > 6.18.48-current-sunxi64:
> >     reproduced also with 7.1.12-edge-sunxi64 (problem not fixed in 7).
> >   set up g_mass_storage on sparse file (no actual I/O required reading
> > from it), read from host:
> >     Works reliable for minutes (14...22MByte/sec) when OPZ3 is otherwis=
e idle.
> >     Creates repeatedly intermitting I/O errors and resets on USB host a=
s soon
> >     as there is even just some process-level only CPU load on H618
> > (stress-ng on 2 kernel).
> >   Problem does not occur on RPI4 using dwc2 (instead of sunxi/musb)
> > with same tests
> >   Diagnosis seems to point to lost interrupts.
> >
> > 1. Reproduce by:
> >
> > 1.1 Connect gadget device (Orange PI zero 3 1GB in my case) USB-C port =
to host.
> >
> > Note: Given how this powers the gadget device, it may not be
> > sufficient for gadget devices needing
> > a lot more current, but OPZ3 stays well below 500 mA under all conditio=
ns.
> >
> > 1.2 On gadget device (Orange PI zero 3 1GB):
> >
> > truncate -s 12T /tmp/empty.img
> > modprobe g_mass_storage
> > file=3D/disk/S2/Shelf.UHD/TMP/avatar/AVATAR_BONUS1.iso stall=3D0 ro=3D1
> > removable=3D1
> >
> > 1.3. On host device
> >
> > Determine device name for gadget, in this case /dev/sdb:
> >
> > [129005.654791] usb 1-1: new high-speed USB device number 9 using xhci_=
hcd
> > [129005.785710] usb 1-1: New USB device found, idVendor=3D0525,
> > idProduct=3Da4a5, bcdDevice=3D 6.18
> > [129005.785730] usb 1-1: New USB device strings: Mfr=3D3, Product=3D4,
> > SerialNumber=3D0
> > [129005.785736] usb 1-1: Product: Mass Storage Gadget
> > [129005.785740] usb 1-1: Manufacturer: Armbian Linux
> > 6.18.48-current-sunxi64 with musb-hdrc
> > [129005.787697] usb-storage 1-1:1.0: USB Mass Storage device detected
> > [129005.788090] usb-storage 1-1:1.0: Quirks match for vid 0525 pid a4a5=
: 10000
> > [129005.788244] scsi host2: usb-storage 1-1:1.0
> > [129006.798208] scsi 2:0:0:0: Direct-Access     Linux    File-Stor
> > Gadget 0618 PQ: 0 ANSI: 2
> > [129006.798370] sd 2:0:0:0: Attached scsi generic sg1 type 0
> > [129006.798560] sd 2:0:0:0: Power-on or device reset occurred
> > [129006.799139] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> > CAPACITY(16).
> > [129006.799905] sd 2:0:0:0: [sdb] 25769803776 512-byte logical blocks:
> > (13.2 TB/12.0 TiB)
> > [129006.800049] sd 2:0:0:0: [sdb] Write Protect is on
> > [129006.800053] sd 2:0:0:0: [sdb] Mode Sense: 0f 00 80 00
> > [129006.800181] sd 2:0:0:0: [sdb] Write cache: disabled, read cache:
> > enabled, doesn't support DPO or FUA
> > [129006.801447] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> > CAPACITY(16).
> > [129006.821771] sd 2:0:0:0: [sdb] Attached SCSI removable disk
> >
> > Then start program to read from the disk:
> >
> > pv -ptera < /dev/sdb > /dev/zero
> >
> > And in another window check for I/O errors:
> >
> > dmesg -w
> >
> > 1.3.1 "empty" run:
> >
> > With nothing else running on the gadget, this should run reliable
> > without any I/O errors. Throughput
> > should be beteween 15...22 MByte/sec depending on block size of host
> > (due to the stop&go nature of BOT
> > i think).
> >
> > 1.3.2 error run:
> >
> > In addition to 3.1, start some CPU activity on the gadget, e.g.:
> >
> > stress-ng --cpu 4 --timeout 6000s
> >
> > Now observe that after at most a few minutes, I/O error(s) and resets
> > will happen to the
> > gadget device, visible on the host, e.g.:
> >
> > [131887.406689] I/O error, dev sdb, sector 4682752 op 0x0:(READ) flags
> > 0x84700 phys_seg 2 prio class 0
> > [131887.406725] sd 2:0:0:0: [sdb] tag#0 device offline or changed
> > [131887.406731] I/O error, dev sdb, sector 4682992 op 0x0:(READ) flags
> > 0x84700 phys_seg 2 prio class 0
> > [131887.406810] sd 2:0:0:0: [sdb] tag#0 device offline or changed
> > [131887.406828] I/O error, dev sdb, sector 4683232 op 0x0:(READ) flags
> > 0x80700 phys_seg 1 prio class 0
> > [131887.416234] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> > CAPACITY(16).
> > [131974.304607] usb 1-1: reset high-speed USB device number 9 using xhc=
i_hcd
> > [131974.435735] sd 2:0:0:0: [sdb] tag#0 FAILED Result:
> > hostbyte=3DDID_TIME_OUT driverbyte=3DDRIVER_OK cmd_age=3D31s
> > [131974.435754] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
> > 00 00 60 51 e0 00 00 00 20 00 00
> > [131974.435759] I/O error, dev sdb, sector 6312416 op 0x0:(READ) flags
> > 0x80700 phys_seg 1 prio class 0
> > [131974.436075] sd 2:0:0:0: Power-on or device reset occurred
> > [131974.436097] sd 2:0:0:0: [sdb] tag#0 FAILED Result: hostbyte=3DDID_O=
K
> > driverbyte=3DDRIVER_OK cmd_age=3D0s
> > [131974.436105] sd 2:0:0:0: [sdb] tag#0 Sense Key : Unit Attention [cur=
rent]
> > [131974.436112] sd 2:0:0:0: [sdb] tag#0 Add. Sense: Power on, reset,
> > or bus device reset occurred
> > [131974.436119] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
> > 00 00 60 52 00 00 00 00 f0 00 00
> > (host using larger block size for reads achieve lowe
> >
> > On OPZ3, these errors happen already with as few as just 2 CPU cores
> > (out of 4) loaded.
> >
> > 1.4. Notes
> >
> > - The test from 3. are just to eliminate as many possible sources of
> > error as possible.
> >   In the target application, the additional load comes from network
> > I/O, but i tried to
> >   simplify the reproduction of the error down to just process level
> > CPU being used.
> >
> > - Problem does not happen on RPI4, which is why i think the problem is
> > not in g_mass_storage/f_mass_storage,
> >   but in the sunxi/musb driver - RPI4 useses instead dwc2 driver.
> >
> > - The problem may be happening less often with loweer g_mass_storage
> > transfer rates,
> >   but for the target use-case, a speed of 12MByte/sec or more is
> > required, otherwise
> >   cheaper (but slower)  gadget devices than H618 would also become an o=
ption.
> >
> > - Problem does not depend on size of file used, happens equally for
> > smaller file sizes,
> >   just using such a large file because of intended use-case.
> >
> > - Lots of parameters that don't change the result when changed
> >   - "stall=3D0/1
> >   - musb_hdrc.use_dma=3D0
> >   - capping the host's transfer size (max_sectors_kb=3D16)
> >   - different idVendor/idProduct
> >   - moving the musb IRQ to another CPU via smp_affinity (IRQ 310 is
> > not shared with any other device)
> >   - powering the board from a separate supply rather than the host port
> >
> > 2. Troubleshooting
> >
> > I had claude.ai vibe code me some tracingon the gadget. I can't claim
> > i understood it really
> > down to the details, but here is how claude.ai is summarizing it. Rest
> > of email below
> > is writeup from claude
> >
> > Working - one SCSI READ(10), 16 KiB:
> >
> >   file-storage   do_read() {
> >   file-storage     kernel_read()             0.03  ms   data from backi=
ng file
> >   file-storage     usb_ep_queue() {
> >   file-storage       musb_gadget_queue()     0.004 ms   UDC accepts req=
uest
> >   file-storage     }                         0.008 ms
> >   file-storage   }
> >   file-storage   sleep_thread() {                       thread waits
> >     <irq ctx>      sunxi_musb_interrupt() {
> >     <irq ctx>        musb_interrupt() {
> >     <irq ctx>          musb_g_tx()           0.010 ms   one packet sent
> >     <irq ctx>        }                       0.012 ms
> >     <irq ctx>      }                         0.014 ms
> >                    ... ~20 such interrupts, one per packet ...
> >     <irq ctx>      sunxi_musb_interrupt() {
> >     <irq ctx>        musb_interrupt() {
> >     <irq ctx>          musb_g_tx() {                    last packet
> >     <irq ctx>            bulk_in_complete()             request given b=
ack
> >     <irq ctx>          }                     0.010 ms
> >     <irq ctx>        }                       0.012 ms
> >     <irq ctx>      }                         0.015 ms
> >   file-storage   }                           3.8   ms   thread woken
> >
> > Failing - identical up to the queue, then nothing:
> >
> >   file-storage   usb_ep_queue() {
> >   file-storage     musb_gadget_queue()       0.005 ms   UDC accepts req=
uest
> >   file-storage   }                           0.008 ms
> >   file-storage   sleep_thread() {                       thread waits
> >
> >                  ... ~30 s of complete silence ...
> >
> >                  no sunxi_musb_interrupt, no musb_interrupt,
> >                  no musb_g_tx, no musb_g_rx, no bulk_in_complete
> >
> >     [host]       SCSI command times out, I/O errors, port reset
> >     [gadget]     re-enumerates, resumes normally
> >
> >   Kernel stack of the file-storage thread during the hang:
> >
> >     [<0>] sleep_thread+0x10c/0x180 [usb_f_mass_storage]
> >     [<0>] fsg_main_thread+0x10c/0x16b0 [usb_f_mass_storage]
> >     [<0>] kthread+0x134/0x1f8
> >     [<0>] ret_from_fork+0x10/0x20
> >
> >   task state S (interruptible sleep), i.e. it is not blocked on I/O.
> >
> >   Event counts at the moment of the hang, and the delta over the 2 s
> >   after the thread parked:
> >
> >     usb_ep_queue           650      +0
> >     musb_gadget_queue      650      +0
> >     sunxi_musb_interrupt 14605      +0
> >     musb_interrupt       14605      +0
> >     musb_g_tx            14519      +0
> >     musb_g_rx               86      +0
> >     bulk_in_complete       566      +0
> >     kernel_read            478      +0
> >
> > What this appears to show
> > -------------------------
> >
> > The request is accepted by musb_gadget_queue() and the transfer never
> > starts: not a completion lost at the end of a transfer that otherwise
> > ran, but no packet sent at all.
> >
> > Notably sunxi_musb_interrupt() - the registered handler for the musb
> > IRQ - does not run even once during the hang.  So the failure is not th=
e
> > driver mishandling an interrupt; no interrupt is delivered to the handl=
er
> > at all.  I cannot tell from this whether the controller never raised it=
s
> > line or whether the interrupt was lost or masked elsewhere.
> >
> > Since the failure is triggered by CPU load alone, with a sparse backing
> > file and no I/O of any kind, this looks like a race between queueing a
> > request and the endpoint's interrupt or FIFO state, rather than anythin=
g
> > in f_mass_storage or the storage path.
> >
> Wondering if its a timing issue on writes sent to the chip.
> The controller may be getting FIFO bytes after TXPKTRDY is set.
> If we read back the register before setting TXPKTRDY flag, that may fix
> the the issue. Could you try testing this patch below?
>
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e0..1fdd2fe64d67 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -386,6 +386,7 @@ static void txstate(struct musb *musb, struct musb_re=
quest *req)
>                 musb_write_fifo(musb_ep->hw_ep, fifo_count,
>                                 (u8 *) (request->buf + request->actual));
>                 request->actual +=3D fifo_count;
> +               csr =3D musb_readw(epio, MUSB_TXCSR);
>                 csr |=3D MUSB_TXCSR_TXPKTRDY;
>                 csr &=3D ~MUSB_TXCSR_P_UNDERRUN;
>                 musb_writew(epio, MUSB_TXCSR, csr);
