Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A883D954A
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508610; cv=none; b=VhWaaBW7ryVh6pRyh/A5X0Q+1yzO1XdGVkuQfUhkPZZtuQwzaFvDoKbMarSYJcYNaY5q/d1+CSDoo7zVJbflN7PqIaHqrEgco1lj0kY+OYF3N5x+jFLY2tB/e1CofquvKlFL0IgJo1CT2bjpiNiMeRdVw73pmfqsukRFpbNBz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508610; c=relaxed/simple;
	bh=dq6zzWOeDYraCUVgOZvm+dHVeU5qwSlxbu/ZwP3CjSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG5I5sPukDnj9KZA+0P++xkNRCcZGyMKLJxy/J3IhFlpOZYfbEED1z0/r4guJgDIidDn37nCVQ0840J2RD5AbbkH4N5N8Kd8Ijf5Nnls5vS2/GAftcIJQycWIdfT7wsX9ns5MTWISm4S4I9GpUHfYeKyEEQWbDswkoTSZOvKjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8cbIuNj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8cbIuNj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d8f265cbe6so5986225ad.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508608; x=1789113408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6CTy8VslM6D9WV7fzKYuRsEIqOpX8eaulE7m+wbh/8=;
        b=a8cbIuNjc5Shw9A8sTB0hiYHL+h0eiUvm0qE/EG4vWx/393kJW/7YjJNSAniOESM0V
         T0/BTbxFvtG0N7pS6L6iUbGUV4V+PO6rBantGPfjT2bKxLWoPmAqGLcfMnfWdn92QXtd
         ZE5bDFUiDpkzHCC1lFKqwNibkOVIayNqnqUiLGRCxCINuEhb2IK/M93z2/f7/rFJjv6M
         PkVaTHQY/dt3L7r8SgFajJmbZny1wr0PSzGRviqjvqLbDMgEs14MvGLHkkpjJ56PbHJG
         kfbhM5SYy28qv8MRMYDhpFHPPKIe3pH76hO3jDDm+hbk6Rbq1Sb17f1wBaFOG+QT+YMh
         NpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508608; x=1789113408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6CTy8VslM6D9WV7fzKYuRsEIqOpX8eaulE7m+wbh/8=;
        b=oUqxSSEqj6irZDJcqSSGSsKRYgSmZnbUCN5k9u85RHJkOoUg0//Rxk6t33cdtnKbwl
         AASxIk4IWF+mqV5Vv5kxNu4AQXi9R6ZrPkjvM+tdrZ6AOfcWiGRvr2/ibVHIhUHDhGj7
         KKA/RZNxdNs6gZKSQ5QaU+LvdeXJhV5S9i/RcvBDbix7Bsy3Ou6Ni+RhAsPv88OoBI5r
         aL3C08HrfnwJcEzwuipoRzd8Ak8MR5otvCBCuEs0JZQGoQj9P6uQ5rzUTMIgStOkSx8c
         oyKp9GH4tmsvIPAWtj7jvoHJJzu3rT7g7sfGaZPUPZmgGyOP87BwnUwkA3bNugT4zNHj
         Sjdw==
X-Forwarded-Encrypted: i=1; AKwUvBycY9NhyBgD27nM8FcNWLIQ4ntydIpkpp0lkxtTAv536K9wrAFOn/0GtmkxHfaikf8D37yFE6MuTlY=@vger.kernel.org
X-Gm-Message-State: AFuF++nSrep1Tqk+jsvWvMMuCqn/l8BrHupK7W4KIKV3XwC7FyAfQm9f
	A7saS0V8u/o2irMRhoaJMXVRE4t3eGR2qnkHp1SRxrVezFg5CVoIbLHueCgp8A==
X-Gm-Gg: AYBFou2NbY159cBTb/QBU/JJZhc5/+yxZvUufuD8IXJdiOBqFiMlOKD3qr0Vfeeh2Jk
	Py/CL+k7eHxjH4SRRAcBrVHeYc74q1zVjB/N5zjDZnePJb25B8S3VuWqcmctXnPhPtL3YRNOJ5w
	ECRVANEFEgjXOVguy/r/slSFNXeHZAF/FEnbFnnj3M1C6OZUnIhYa/5reYAyRi2rGSp9E19bvrm
	cGzRzmJeg0UrQptyj47hTFFIx6SbcPOzWZv/If1q5fv99gjfCyHeZVlhlhxg9Wl+xCx7uy6TBWP
	b2YF2/k0VndSch6EedtfRu+sTXV+4ThKa7v+IzmRSGfW3P+iCKRTv256P6DJU9JHwLgBdVm3QHo
	nA6iy+7tn2Azu0xfpPac2HAsbW4qvhkl/U2hEn39tb2oaJWorxSUhrHqw2GvsJ2RMMmY6Qp0i1a
	PZ0CJFiUcXfdrgxgEyOK9/O6YfBPocxrZ8itKxpsR7lzYAU7uXdgrPH1WKKWyeE1ax5paM+QlJ8
	k92VS8I1us+c40zZw71cDtkYA==
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr6828466a91.6.1788508607942;
        Fri, 04 Sep 2026 00:56:47 -0700 (PDT)
Received: from localhost ([2409:40c4:3:c9c:397c:1716:c137:de54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm3159366a91.15.2026.09.04.00.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:47 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:26:44 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: te36de <te36de@gmail.com>
Cc: Bin Liu <b-liu@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: H618 sunxi/musb driver (likely) looses interrupts ->
 g_mass_storage I/O errors/resets
Message-ID: <app5WjDz9rnUNM_x@eggarch>
References: <CAOmNcAB8nBueNabeR_tBOjtximEwG9gdn4vt0Os4qac9OukTOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOmNcAB8nBueNabeR_tBOjtximEwG9gdn4vt0Os4qac9OukTOQ@mail.gmail.com>

On Thu, Sep 03, 2026 at 11:55:50AM -0700, te36de wrote:
> Summary:
>   Likely problem in H618 sunxi/musb driver code leading to I/O errors,
> resets on g_mass_storage.
>   Produced on Orange Pi Zero 3 (OPZ3, H618 based), Linux
> 6.18.48-current-sunxi64:
>     reproduced also with 7.1.12-edge-sunxi64 (problem not fixed in 7).
>   set up g_mass_storage on sparse file (no actual I/O required reading
> from it), read from host:
>     Works reliable for minutes (14...22MByte/sec) when OPZ3 is otherwise idle.
>     Creates repeatedly intermitting I/O errors and resets on USB host as soon
>     as there is even just some process-level only CPU load on H618
> (stress-ng on 2 kernel).
>   Problem does not occur on RPI4 using dwc2 (instead of sunxi/musb)
> with same tests
>   Diagnosis seems to point to lost interrupts.
> 
> 1. Reproduce by:
> 
> 1.1 Connect gadget device (Orange PI zero 3 1GB in my case) USB-C port to host.
> 
> Note: Given how this powers the gadget device, it may not be
> sufficient for gadget devices needing
> a lot more current, but OPZ3 stays well below 500 mA under all conditions.
> 
> 1.2 On gadget device (Orange PI zero 3 1GB):
> 
> truncate -s 12T /tmp/empty.img
> modprobe g_mass_storage
> file=/disk/S2/Shelf.UHD/TMP/avatar/AVATAR_BONUS1.iso stall=0 ro=1
> removable=1
> 
> 1.3. On host device
> 
> Determine device name for gadget, in this case /dev/sdb:
> 
> [129005.654791] usb 1-1: new high-speed USB device number 9 using xhci_hcd
> [129005.785710] usb 1-1: New USB device found, idVendor=0525,
> idProduct=a4a5, bcdDevice= 6.18
> [129005.785730] usb 1-1: New USB device strings: Mfr=3, Product=4,
> SerialNumber=0
> [129005.785736] usb 1-1: Product: Mass Storage Gadget
> [129005.785740] usb 1-1: Manufacturer: Armbian Linux
> 6.18.48-current-sunxi64 with musb-hdrc
> [129005.787697] usb-storage 1-1:1.0: USB Mass Storage device detected
> [129005.788090] usb-storage 1-1:1.0: Quirks match for vid 0525 pid a4a5: 10000
> [129005.788244] scsi host2: usb-storage 1-1:1.0
> [129006.798208] scsi 2:0:0:0: Direct-Access     Linux    File-Stor
> Gadget 0618 PQ: 0 ANSI: 2
> [129006.798370] sd 2:0:0:0: Attached scsi generic sg1 type 0
> [129006.798560] sd 2:0:0:0: Power-on or device reset occurred
> [129006.799139] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> CAPACITY(16).
> [129006.799905] sd 2:0:0:0: [sdb] 25769803776 512-byte logical blocks:
> (13.2 TB/12.0 TiB)
> [129006.800049] sd 2:0:0:0: [sdb] Write Protect is on
> [129006.800053] sd 2:0:0:0: [sdb] Mode Sense: 0f 00 80 00
> [129006.800181] sd 2:0:0:0: [sdb] Write cache: disabled, read cache:
> enabled, doesn't support DPO or FUA
> [129006.801447] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> CAPACITY(16).
> [129006.821771] sd 2:0:0:0: [sdb] Attached SCSI removable disk
> 
> Then start program to read from the disk:
> 
> pv -ptera < /dev/sdb > /dev/zero
> 
> And in another window check for I/O errors:
> 
> dmesg -w
> 
> 1.3.1 "empty" run:
> 
> With nothing else running on the gadget, this should run reliable
> without any I/O errors. Throughput
> should be beteween 15...22 MByte/sec depending on block size of host
> (due to the stop&go nature of BOT
> i think).
> 
> 1.3.2 error run:
> 
> In addition to 3.1, start some CPU activity on the gadget, e.g.:
> 
> stress-ng --cpu 4 --timeout 6000s
> 
> Now observe that after at most a few minutes, I/O error(s) and resets
> will happen to the
> gadget device, visible on the host, e.g.:
> 
> [131887.406689] I/O error, dev sdb, sector 4682752 op 0x0:(READ) flags
> 0x84700 phys_seg 2 prio class 0
> [131887.406725] sd 2:0:0:0: [sdb] tag#0 device offline or changed
> [131887.406731] I/O error, dev sdb, sector 4682992 op 0x0:(READ) flags
> 0x84700 phys_seg 2 prio class 0
> [131887.406810] sd 2:0:0:0: [sdb] tag#0 device offline or changed
> [131887.406828] I/O error, dev sdb, sector 4683232 op 0x0:(READ) flags
> 0x80700 phys_seg 1 prio class 0
> [131887.416234] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
> CAPACITY(16).
> [131974.304607] usb 1-1: reset high-speed USB device number 9 using xhci_hcd
> [131974.435735] sd 2:0:0:0: [sdb] tag#0 FAILED Result:
> hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK cmd_age=31s
> [131974.435754] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
> 00 00 60 51 e0 00 00 00 20 00 00
> [131974.435759] I/O error, dev sdb, sector 6312416 op 0x0:(READ) flags
> 0x80700 phys_seg 1 prio class 0
> [131974.436075] sd 2:0:0:0: Power-on or device reset occurred
> [131974.436097] sd 2:0:0:0: [sdb] tag#0 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_OK cmd_age=0s
> [131974.436105] sd 2:0:0:0: [sdb] tag#0 Sense Key : Unit Attention [current]
> [131974.436112] sd 2:0:0:0: [sdb] tag#0 Add. Sense: Power on, reset,
> or bus device reset occurred
> [131974.436119] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
> 00 00 60 52 00 00 00 00 f0 00 00
> (host using larger block size for reads achieve lowe
> 
> On OPZ3, these errors happen already with as few as just 2 CPU cores
> (out of 4) loaded.
> 
> 1.4. Notes
> 
> - The test from 3. are just to eliminate as many possible sources of
> error as possible.
>   In the target application, the additional load comes from network
> I/O, but i tried to
>   simplify the reproduction of the error down to just process level
> CPU being used.
> 
> - Problem does not happen on RPI4, which is why i think the problem is
> not in g_mass_storage/f_mass_storage,
>   but in the sunxi/musb driver - RPI4 useses instead dwc2 driver.
> 
> - The problem may be happening less often with loweer g_mass_storage
> transfer rates,
>   but for the target use-case, a speed of 12MByte/sec or more is
> required, otherwise
>   cheaper (but slower)  gadget devices than H618 would also become an option.
> 
> - Problem does not depend on size of file used, happens equally for
> smaller file sizes,
>   just using such a large file because of intended use-case.
> 
> - Lots of parameters that don't change the result when changed
>   - "stall=0/1
>   - musb_hdrc.use_dma=0
>   - capping the host's transfer size (max_sectors_kb=16)
>   - different idVendor/idProduct
>   - moving the musb IRQ to another CPU via smp_affinity (IRQ 310 is
> not shared with any other device)
>   - powering the board from a separate supply rather than the host port
> 
> 2. Troubleshooting
> 
> I had claude.ai vibe code me some tracingon the gadget. I can't claim
> i understood it really
> down to the details, but here is how claude.ai is summarizing it. Rest
> of email below
> is writeup from claude
> 
> Working - one SCSI READ(10), 16 KiB:
> 
>   file-storage   do_read() {
>   file-storage     kernel_read()             0.03  ms   data from backing file
>   file-storage     usb_ep_queue() {
>   file-storage       musb_gadget_queue()     0.004 ms   UDC accepts request
>   file-storage     }                         0.008 ms
>   file-storage   }
>   file-storage   sleep_thread() {                       thread waits
>     <irq ctx>      sunxi_musb_interrupt() {
>     <irq ctx>        musb_interrupt() {
>     <irq ctx>          musb_g_tx()           0.010 ms   one packet sent
>     <irq ctx>        }                       0.012 ms
>     <irq ctx>      }                         0.014 ms
>                    ... ~20 such interrupts, one per packet ...
>     <irq ctx>      sunxi_musb_interrupt() {
>     <irq ctx>        musb_interrupt() {
>     <irq ctx>          musb_g_tx() {                    last packet
>     <irq ctx>            bulk_in_complete()             request given back
>     <irq ctx>          }                     0.010 ms
>     <irq ctx>        }                       0.012 ms
>     <irq ctx>      }                         0.015 ms
>   file-storage   }                           3.8   ms   thread woken
> 
> Failing - identical up to the queue, then nothing:
> 
>   file-storage   usb_ep_queue() {
>   file-storage     musb_gadget_queue()       0.005 ms   UDC accepts request
>   file-storage   }                           0.008 ms
>   file-storage   sleep_thread() {                       thread waits
> 
>                  ... ~30 s of complete silence ...
> 
>                  no sunxi_musb_interrupt, no musb_interrupt,
>                  no musb_g_tx, no musb_g_rx, no bulk_in_complete
> 
>     [host]       SCSI command times out, I/O errors, port reset
>     [gadget]     re-enumerates, resumes normally
> 
>   Kernel stack of the file-storage thread during the hang:
> 
>     [<0>] sleep_thread+0x10c/0x180 [usb_f_mass_storage]
>     [<0>] fsg_main_thread+0x10c/0x16b0 [usb_f_mass_storage]
>     [<0>] kthread+0x134/0x1f8
>     [<0>] ret_from_fork+0x10/0x20
> 
>   task state S (interruptible sleep), i.e. it is not blocked on I/O.
> 
>   Event counts at the moment of the hang, and the delta over the 2 s
>   after the thread parked:
> 
>     usb_ep_queue           650      +0
>     musb_gadget_queue      650      +0
>     sunxi_musb_interrupt 14605      +0
>     musb_interrupt       14605      +0
>     musb_g_tx            14519      +0
>     musb_g_rx               86      +0
>     bulk_in_complete       566      +0
>     kernel_read            478      +0
> 
> What this appears to show
> -------------------------
> 
> The request is accepted by musb_gadget_queue() and the transfer never
> starts: not a completion lost at the end of a transfer that otherwise
> ran, but no packet sent at all.
> 
> Notably sunxi_musb_interrupt() - the registered handler for the musb
> IRQ - does not run even once during the hang.  So the failure is not the
> driver mishandling an interrupt; no interrupt is delivered to the handler
> at all.  I cannot tell from this whether the controller never raised its
> line or whether the interrupt was lost or masked elsewhere.
> 
> Since the failure is triggered by CPU load alone, with a sparse backing
> file and no I/O of any kind, this looks like a race between queueing a
> request and the endpoint's interrupt or FIFO state, rather than anything
> in f_mass_storage or the storage path.
> 
Wondering if its a timing issue on writes sent to the chip.
The controller may be getting FIFO bytes after TXPKTRDY is set.
If we read back the register before setting TXPKTRDY flag, that may fix
the the issue. Could you try testing this patch below?

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..1fdd2fe64d67 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -386,6 +386,7 @@ static void txstate(struct musb *musb, struct musb_request *req)
 		musb_write_fifo(musb_ep->hw_ep, fifo_count,
 				(u8 *) (request->buf + request->actual));
 		request->actual += fifo_count;
+		csr = musb_readw(epio, MUSB_TXCSR);
 		csr |= MUSB_TXCSR_TXPKTRDY;
 		csr &= ~MUSB_TXCSR_P_UNDERRUN;
 		musb_writew(epio, MUSB_TXCSR, csr);
