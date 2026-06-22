Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5EB241C8C
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782107039; cv=none; b=jQTAmQxc2ncU/HykS0F/IIfMlLbzsT/tjlAnKcGzt2xXbrs+XadK+vByFKP7ZYLmKOhA9xx6SQkinoaOgbci0FVC3DlI+AVR1U7FwjaLdl3LJcHQlsbRFepJSyh64LUHXr30LeIves6PSJNupQMQVcgxauu6grusvqDfWAEctwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782107039; c=relaxed/simple;
	bh=NkMzUCH19V3Jo6yfBVYa6YyjB4S/DpuAJyVlhH6akQI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P+7u84xgUiL3Gp1vf6Y5KqZ98/wFUez0xSsKsw4wmGp7YTeO/nqIoz3HtreE0AAoliFUFJgaGVr9K/1W83mFJL0tzoMcg/DvVgxwTNVJjpb16lfkY8LmAJa36dC6tWz0AUmK3qKLpXH8g9c1VCZJPZYzCQBTqr1rFrKqvGSL+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF2b98XK; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF2b98XK"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so7305706eec.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 22:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782107037; x=1782711837; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcRyY+mBYQGRZAiyCkUgz5MrUDwc1+16DWFULnkRTLc=;
        b=cF2b98XKwO+3UaGSljMlKdpeRGhFQ0aCnmuJETdl7mR5tqdFnPo7LPzQ+mn7FBnGRg
         MQBx1KEriI4OiUdYtY41fuwGhQxE4+9G/X1ADYD+p0kQF7AO4em3rOsSIFWXgrhVGV/p
         tD2ZTuCwnoNi+LXBfnLyVhYTX+9eb5TLlNE+WA92NS5qaGeuOmRGB09WhpzBCvIaEEsv
         XgFJ9LFRWzb/lQbR42nLt98DU7XcQzWZ76KnqxJqxYCQcoJiy21glUU1ymExecfj1cGd
         BmWp/Sp9a+VfQjVRbj0F3MjgtUN3o/823JyCHbvop1rLEgUCMyVebgCNS1qN40PJ8qiu
         iaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782107037; x=1782711837;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcRyY+mBYQGRZAiyCkUgz5MrUDwc1+16DWFULnkRTLc=;
        b=izlgZCs16gXOpXSvrQzd66DG5GIQMeqg343BIv66+r48t7eYvfWoly8r8q1lGmCVpI
         4P41Z5WKNPLgo8aiDs9X79l9ufvzZUw2mkdRH0e/DgvDaYvnBOHEK8pK2NQenLaFbAdU
         vgIqeHrZUA/gzwyy4unf5iQ3JiWJjvqDAurbpPXjaEBXgN8mHMnNB2eWZkQP5sj891/b
         I6nqlxzbhoyPwy4v2SaYNMpRbxJZ/DLTS+Z/mM6cS7igRkvEkYFT9arlIfcUCX6T0Gpf
         Mz+1GL4pueMGnbDWscGn1K/N5h0JA+K2o9S/R7TxWvnYDLGpg2QREjwULVI0/IPBA8BG
         6PzA==
X-Gm-Message-State: AOJu0Yxagn0lEWVYYUF17Pr2ddc70CoCPzy/W8YAFiZY77y1md0xJhGv
	YtEMDS6QpbXWs557eedSqYEH0ELVlIR3oVdMZU6L7OwXvnrJcXGK/OLBuKtTPxiIR8g=
X-Gm-Gg: AfdE7clGkKJAs9dBSU6vofbRWVPWYGvXHlsLQrVlNncNLYcJ0kNDmlrLJZ6OjOTrsxQ
	DzDE68RmDpNSLCyHSaruTvvqo21sE4KrRknSK+4jw18GIHDQZYif2q6TJHV3lpIBuVYcH+Ro6m2
	XFQ1RoMUMlIL38kvidJdhwvpGh/11uAwBqsMu8tja4sChbCNBh2TVc1QgX22tusept9c1TyuHn1
	Qv7ZiSGDuDdLchou7gfGehc3gruvzJw76fVrdw6HOEGHxeIH8pC75Tg17CNrmVGFdGf2+QCnAA0
	9EcG4X2d0ZdBn3wOj4VfDfD72VY3hgSbvbUgeXn8ryAoNmqh6PCTTOOZxkwa1+28lfolYipxTtY
	iuta5s+ku8W7g0sGFytZ2TC58HR6ND9qiLEcZj15HTzu7JV6MrPYA56UTE/LTGf1XyVbf02TYXi
	MBsgl6wCxuHQH6tVjeHTJEJMWGSdmHD5hNULqZ04xU
X-Received: by 2002:a05:7301:19ac:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30c0cd3e894mr7446390eec.3.1782107036425;
        Sun, 21 Jun 2026 22:43:56 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:8e0a:2041:e8ce:c3f6:cac8:c8ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f8b2sm9070692eec.4.2026.06.21.22.43.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2026 22:43:55 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] inflate max_tt_usecs and implement sitd backpointers
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <0c2fc88b-eec8-4267-b6df-99c62f4d5229@rowland.harvard.edu>
Date: Sun, 21 Jun 2026 22:43:44 -0700
Cc: linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E19252E2-3620-4D3C-805C-1FCA8084291E@gmail.com>
References: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
 <20260602064201.84065-1-brentfpage@gmail.com>
 <0c2fc88b-eec8-4267-b6df-99c62f4d5229@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

---
> You mean six 0xff bytes followed by four 0x00 bytes, right?
Yes

> Why is this?  What goes wrong?  That sort of issue should never arise.
Now, the test results are as follows:
Setup 3:
- configure the "main" (1023-byte-endpoint full-speed iso-in) peripheral =
to
  send nine 0xff bytes followed by one 0x00 byte 100 times per transfer
- plug the main peripheral into a four-port USB 2 hub that plugs in to a
  computer's USB 2 port.  Don't plug anything else into the hub.
- for both bInterval=3D1 and 2, there's a good data link between the =
peripheral
  and the computer
  - I see a bit error in the last word of each transfer; it's typically =
1101
    or 1110 instead of 1111, but I see these for USB 3 ports as well.  =
Maybe a
    ferrite bead on the peripheral would help?  That's the only error I =
see in
    the data link.
Setup 4:
- same data as for Setup 3
- also plug a high-speed webcam into the four-port hub
- bInterval=3D2: both the "main" peripheral and the webcam work well
- bInterval=3D1: ~50% of the raster scan lines in the webcam's stream =
are blank.
  The main peripheral's data link remains good (same near-optimal =
quality as
  for Setup 3).
Setup 5:
- same data for the main peripheral as in Setups 3 and 4.
- in addition to the main peripheral, plug in a full-speed HID with an =
8-byte
  interrupt endpoint to the four-port hub
- bInterval=3D1: the HID doesn't work
- bInterval=3D2: two interrupt full-speed HIDs work well alongside the =
main
  peripheral.  Would it make sense if the first time plugging one in has =
a
  50% success rate (presumably if it fortuitously gets scheduled for the
  free frame) and all subsequent unplug/replug events work after the =
first
  successful one?  Seems like that might be the case.
Setup 1:
- repeating from my previous email
- configure the main peripheral to send five 0xff bytes followed by five =
0x00
  bytes 100 times per transfer
- plug in the main peripheral, two full-speed HIDs, and the high-speed =
webcam
  into the four-port hub
- bInterval=3D1 and bInterval=3D2: everything works great.  Considering =
that this
  worked even before I fixed up the patch, it doesn't depend on =
backpointers at
  all.

So, the patch improves things (it can do a data stream from the main =
peripheral
with 90% ones through the four-port hub.  Without the patch, only 50% =
ones is
possible), but isn't perfect.  One change that's necessary for the patch =
to work
is in scan_isoc, which now doesn't consider an sitd to be expired until =
it is
three frames in the past.  Looking through the history of ehci-sched, I =
see
that sitds originally were considered expired if they were a single =
frame in
the past.  Then, commit 22e1869 changed this to two frames in the past =
to
accommodate some aberrant HW.  This current backpointer patch allows =
sitds to
complete one frame after they appear in the queue as a matter of normal =
course,
and I guess that the four-port hub that I'm using occasionally reports =
sitd
completion late. So, the expiration frame needs to be delayed one frame
further.  BTW, this change for whatever reason is only required to get =
the
bInterval=3D1 case to work.

This frame delay I think is a possible cause of remaining failures in =
the
test results. The TT is clearly busy on the main peripheral's data until =
past
the primary frame, so maybe getting an HID to work for the Setup 5: =
bInterval=3D1
case would require FSTNs? Also, maybe the missed raster scan lines from =
the
webcam can be mitigated by allowing itds to complete in future frames,
specifically by tweaking scan_isoc?  Considering that the itds don't use =
the
TT, I don't know why this would matter, but I still plan to try it.

> Why does this case behave differently?  Does the computer have an OHCI
or UHCI host controller in addition to EHCI?
Just EHCI according to the output of /sys/kernel/debug/usb/devices

> > So, start off by allocating an sitd for each transfer, and only add =
an extra
> > sitd if a transfer has frame-hopping CSPLITS?

> Yes, that is the approach the driver uses everywhere else.  Not to =
mention
> that it's foolish to allocate twice as many sitd's as the URB will =
actually
> use.

Done now.  I broke out the sitd allocation part of sitd_urb_transaction =
into
new function: allocate_sitds.  This new function is called once in
sitd_urb_transacton, making this latter function nearly* equivalent to =
what it
is in the current kernel.  Then, iso_stream_schedule gets
called, which determines whether the urb requires 2 sitds for each =
packet. If
the urb does, allocate_sitds is called a second time.

An alternative would be to not allocate any sitds until after
iso_stream_schedule gets called, and then do either 1 or 2 for each =
packet as
appropriate.  This would conserve fewer the choices made in the current =
driver,
which allocates sitds before iso_stream_schedule, but seems harmless and =
would
make the patched driver slightly more streamlined.  Do you have any =
immediate
objections to this alternative?

The exception to *, above, is that allocate_sitds now does not recycle =
sitds
from the free list until they are two frames in the past, as opposed to =
just
one frame in the past like before.  I guess this may lead to an =
occasional
extra sitd being allocated if urbs are resubmitted soon after they =
finish,
i.e., when the last sitd of the finished urb isn't 3 frames in the past =
yet.
Is the harm here minimal enough?

One more thing on this topic: allocate_sitds gets called with ehci->lock =
held
and also ends with ehci->lock held, but in the middle of allocate_sitds, =
the
lock gets unlocked and then relocked surrounding a call to =
dma_pool_alloc.  For
correct unlocking here, allocate sitds takes the associated irq =
save/restore
flags as an argument and passes it on in its call to =
spin_unlock_irqrestore.
Easy enough.  But, allocate_sitds also needs to be able to communicate =
the
flags that are set when it relocks the lock back up to the caller of
allocate_sitds.  So, I made the flags argument of allocate_sitds a =
pointer that
gets dereferenced in allocate_sitds calls to =
spin_(un)lock_irq(restore/save).
Is that objectionable?  Seems to work (specifically, ensures that the =
whole
computer doesn't crash, which is what I saw when I got this wrong), but =
maybe
diverges from current practice.

In principal, there's a nasty failure mode for the bInterval=3D1 case.  =
It stems
from ehci1's prescription - not this patch's particular implementation.
Namely, a single sitd failure breaks the stream for all subsequent =
sitds.  This
is because those subsequent sitds are initialized in a Do Complete Split =
state.
An error in a single sitd causes the subsequent sitd to never transition =
out of
the Do Complete Split state.  This subsequent sitd then also isn't =
successful,
causing the next sitd to also fail, and so forth.
I haven't encountered this failure mode, so it seems that it is =
addressed in
HW. Maybe after a few failed sitds, the HC simply ignores the initial Do
Complete Split flag?  I didn't see any comment like that when reading =
ehci1,
but maybe it's in there.

v3 of the patch is below.

 drivers/usb/host/ehci-sched.c | 248 +++++++++++++++++++++++++++-------
 drivers/usb/host/ehci.h       |  12 +-
 2 files changed, 206 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/host/ehci-sched.c =
b/drivers/usb/host/ehci-sched.c
index a241337c9..67ef1a918 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -285,13 +285,14 @@ static void compute_tt_budget(u8 =
budget_table[EHCI_BANDWIDTH_SIZE],
 			for (uf =3D ps->phase_uf; uf < 8; ++uf) {
 				x +=3D budget_line[uf];
=20
-				/* Each microframe lasts 125 us */
-				if (x <=3D 125) {
+				/* Cumulative tt_usecs can be as large =
as 145
+				 * us */
+				if (x <=3D 145) {
 					budget_line[uf] =3D x;
 					break;
 				}
-				budget_line[uf] =3D 125;
-				x -=3D 125;
+				budget_line[uf] =3D 145;
+				x -=3D 145;
 			}
 		}
 	}
@@ -313,7 +314,12 @@ static int __maybe_unused same_tt(struct usb_device =
*dev1,
 #ifdef CONFIG_USB_EHCI_TT_NEWSCHED
=20
 static const unsigned char
-max_tt_usecs[] =3D { 125, 125, 125, 125, 125, 125, 30, 0 };
+/*
+ * tt_usecs includes worst-case bit stuffing time, so the transactions
+ * budgeted for a given 125 us uframe can have cumulative tt_usecs as =
large
+ * as 145 us and still possibly fit into the uframe.
+ */
+max_tt_usecs[] =3D { 145, 145, 145, 145, 145, 145, 35, 0 };
=20
 /* carryover low/fullspeed bandwidth that crosses uframe boundries */
 static inline void carryover_tt_bandwidth(unsigned short tt_usecs[8])
@@ -378,13 +384,13 @@ static int tt_available(
 		if (max_tt_usecs[uframe] <=3D tt_usecs[uframe])
 			return 0;
=20
-		/* special case for isoc transfers larger than 125us:
+		/* special case for isoc transfers larger than =
max_tt_usecs:
 		 * the first and each subsequent fully used uframe
 		 * must be empty, so as to not illegally delay
 		 * already scheduled transactions
 		 */
-		if (usecs > 125) {
-			int ufs =3D (usecs / 125);
+		if (usecs > 145) {
+			int ufs =3D (usecs / 145);
=20
 			for (i =3D uframe; i < (uframe + ufs) && i < 8; =
i++)
 				if (tt_usecs[i] > 0)
@@ -1302,7 +1308,7 @@ static void reserve_release_iso_bandwidth(struct =
ehci_hcd *ehci,
 {
 	unsigned		uframe;
 	unsigned		i, j;
-	unsigned		s_mask, c_mask, m;
+	unsigned		s_mask, c_mask, c_mask2, m;
 	int			usecs =3D stream->ps.usecs;
 	int			c_usecs =3D stream->ps.c_usecs;
 	int			tt_usecs =3D stream->ps.tt_usecs;
@@ -1328,16 +1334,18 @@ static void reserve_release_iso_bandwidth(struct =
ehci_hcd *ehci,
 	} else {			/* Full speed */
 		s_mask =3D stream->ps.cs_mask;
 		c_mask =3D s_mask >> 8;
+		c_mask2 =3D stream->ps.c_mask2 >> 8;
=20
-		/* NOTE: adjustment needed for frame overflow */
 		for (i =3D uframe; i < EHCI_BANDWIDTH_SIZE;
 				i +=3D stream->ps.bw_uperiod) {
-			for ((j =3D stream->ps.phase_uf, m =3D 1 << j); =
j < 8;
+			for ((j =3D 0, m =3D 1 << j); j < 8;
 					(++j, m <<=3D 1)) {
 				if (s_mask & m)
 					ehci->bandwidth[i+j] +=3D usecs;
 				else if (c_mask & m)
 					ehci->bandwidth[i+j] +=3D =
c_usecs;
+				if (c_mask2 & m)
+					=
ehci->bandwidth[(i+8+j)%EHCI_BANDWIDTH_SIZE] +=3D c_usecs;
 			}
 		}
=20
@@ -1388,7 +1396,7 @@ sitd_slot_ok(
 	struct ehci_tt		*tt
 )
 {
-	unsigned		mask, tmp;
+	unsigned		mask, c_mask2, tmp;
 	unsigned		frame, uf;
=20
 	mask =3D stream->ps.cs_mask << (uframe & 7);
@@ -1397,10 +1405,38 @@ sitd_slot_ok(
 	if (((stream->ps.cs_mask & 0xff) << (uframe & 7)) >=3D (1 << 7))
 		return 0;
=20
-	/* for IN, don't wrap CSPLIT into the next frame */
-	if (mask & ~0xffff)
+	/* for IN, don't wrap SSPLIT too far into next frame */
+	if (mask & ~0x7ffff)
 		return 0;
=20
+	c_mask2 =3D mask >> 16;
+	mask =3D mask & 0xffff;
+	if((c_mask2 & 1) && (c_mask2 & 1<<1) && (c_mask2 & 1<<2)) {
+		/* if BuFrame6 is the last uframe in which a transaction =
is
+		 * budgeted, the transaction will initially be =
configured to
+		 * have CSPLITS in BuFrame7 as well as BuFrames 0 and 1 =
of
+		 * the following frame (HuFrames 0,1,2)
+		 */
+		/* below: usb2 spec 11.18.4.3.c paragraph 3 */
+		if(mask & 1) {
+			c_mask2 =3D 1;
+		} else {
+			c_mask2 =3D (1<<2)-1;
+		}
+	} else if ((c_mask2 & 1) && (c_mask2 & 1<<1)) {
+		/* if BuFrame5 is the last uframe in which a transaction =
is
+		 * budgeted, the transaction will initially be =
configured to
+		 * have CSPLITS in BuFrames 6 and 7 as well as BuFrame 0 =
of
+		 * the following frame (HuFrames 7,0,1)
+		 */
+		/* below: usb2 spec 11.18.4.3.c paragraph 2 */
+		if(mask & 1) {
+			c_mask2 =3D 1;
+		}
+	}
+	if((c_mask2 & mask & 1<<1))
+		return 0; /* ehci1 4.12.3.1 */
+
 	/* check bandwidth */
 	uframe &=3D stream->ps.bw_uperiod - 1;
 	frame =3D uframe >> 3;
@@ -1445,13 +1481,22 @@ sitd_slot_ok(
 				if (ehci->bandwidth[uf+i] > max_used)
 					return 0;
 			}
+			tmp =3D 1;
+			for (i =3D 0; i < 2; (++i, tmp <<=3D 1)) {
+				if ((stream->ps.c_mask2 & tmp) =3D=3D 0)
+					continue;
+				if (ehci->bandwidth[(uf+8+i) % =
EHCI_BANDWIDTH_SIZE] > max_used)
+					return 0;
 		}
=20
 		uframe +=3D stream->ps.bw_uperiod;
 	} while (uframe < EHCI_BANDWIDTH_SIZE);
=20
-	stream->ps.cs_mask <<=3D uframe & 7;
+	stream->ps.cs_mask =3D mask;
+	stream->ps.c_mask2 =3D c_mask2 << 8;
 	stream->splits =3D cpu_to_hc32(ehci, stream->ps.cs_mask);
+	stream->c_splits2 =3D cpu_to_hc32(ehci, stream->ps.c_mask2);
+
 	return 1;
 }
=20
@@ -2028,54 +2073,45 @@ sitd_sched_init(
 }
=20
 static int
-sitd_urb_transaction(
+allocate_sitds(
 	struct ehci_iso_stream	*stream,
 	struct ehci_hcd		*ehci,
 	struct urb		*urb,
-	gfp_t			mem_flags
+	struct ehci_iso_sched	*iso_sched,
+	gfp_t			mem_flags,
+	unsigned long		*ehci_lock_flags
 )
 {
+	/* caller must hold ehci->lock and provide associated irq flags =
*/
 	struct ehci_sitd	*sitd;
 	dma_addr_t		sitd_dma;
 	int			i;
-	struct ehci_iso_sched	*iso_sched;
-	unsigned long		flags;
-
-	iso_sched =3D iso_sched_alloc(urb->number_of_packets, =
mem_flags);
-	if (iso_sched =3D=3D NULL)
-		return -ENOMEM;
-
-	sitd_sched_init(ehci, iso_sched, stream, urb);
=20
 	/* allocate/init sITDs */
-	spin_lock_irqsave(&ehci->lock, flags);
 	for (i =3D 0; i < urb->number_of_packets; i++) {
=20
-		/* NOTE:  for now, we don't try to handle wraparound =
cases
-		 * for IN (using sitd->hw_backpointer, like a FSTN), =
which
-		 * means we never need two sitds for full speed packets.
-		 */
-
 		/*
-		 * Use siTDs from the free list, but not siTDs that may
+		 * Use iTDs from the free list, but not iTDs that may
 		 * still be in use by the hardware.
 		 */
 		if (likely(!list_empty(&stream->free_list))) {
 			sitd =3D list_first_entry(&stream->free_list,
 					 struct ehci_sitd, sitd_list);
-			if (sitd->frame =3D=3D ehci->now_frame)
+			/* include frame+1 to accommodate frame-hopping =
CSPLITS */
+			if (sitd->frame =3D=3D ehci->now_frame ||
+				sitd->frame + 1 =3D=3D ehci->now_frame)
 				goto alloc_sitd;
 			list_del(&sitd->sitd_list);
 			sitd_dma =3D sitd->sitd_dma;
 		} else {
- alloc_sitd:
-			spin_unlock_irqrestore(&ehci->lock, flags);
+alloc_sitd:
+			spin_unlock_irqrestore(&ehci->lock, =
*ehci_lock_flags);
 			sitd =3D dma_pool_alloc(ehci->sitd_pool, =
mem_flags,
 					&sitd_dma);
-			spin_lock_irqsave(&ehci->lock, flags);
+			spin_lock_irqsave(&ehci->lock, =
*ehci_lock_flags);
 			if (!sitd) {
 				iso_sched_free(stream, iso_sched);
-				spin_unlock_irqrestore(&ehci->lock, =
flags);
+				/* caller should release ehic->lock */
 				return -ENOMEM;
 			}
 		}
@@ -2085,6 +2121,32 @@ sitd_urb_transaction(
 		sitd->frame =3D NO_FRAME;
 		list_add(&sitd->sitd_list, &iso_sched->td_list);
 	}
+	return 0;
+}
+
+static int
+sitd_urb_transaction(
+	struct ehci_iso_stream	*stream,
+	struct ehci_hcd		*ehci,
+	struct urb		*urb,
+	gfp_t			mem_flags
+)
+{
+	struct ehci_iso_sched	*iso_sched;
+	unsigned long		flags;
+	int			status;
+
+	iso_sched =3D iso_sched_alloc(urb->number_of_packets, =
mem_flags);
+	if (iso_sched =3D=3D NULL)
+		return -ENOMEM;
+
+	sitd_sched_init(ehci, iso_sched, stream, urb);
+	spin_lock_irqsave(&ehci->lock, flags);
+	status =3D allocate_sitds(stream, ehci, urb, iso_sched, =
mem_flags, &flags);
+	if(status) {
+		spin_unlock_irqrestore(&ehci->lock, flags);
+		return status;
+	}
=20
 	/* temporarily store schedule info in hcpriv */
 	urb->hcpriv =3D iso_sched;
@@ -2107,12 +2169,29 @@ sitd_patch(
 {
 	struct ehci_iso_packet	*uf =3D &iso_sched->packet[index];
 	u64			bufp;
+	__hc32			transaction;
=20
 	sitd->hw_next =3D EHCI_LIST_END(ehci);
 	sitd->hw_fullspeed_ep =3D stream->address;
-	sitd->hw_uframe =3D stream->splits;
-	sitd->hw_results =3D uf->transaction;
-	sitd->hw_backpointer =3D EHCI_LIST_END(ehci);
+	sitd->hw_backpointer =3D cpu_to_hc32(ehci, =
sitd->backpointer_sitd_dma);
+	transaction =3D uf->transaction;
+
+	if(stream->ps.period!=3D1 && sitd->backpointer_sitd_dma!=3D1) {
+		sitd->hw_uframe=3Dstream->c_splits2;
+	} else {
+		/*
+		 * frame-hopping CSPLITS get skipped if the sitd doesn't
+		 * start in the Do Complete Split state.
+		 */
+		sitd->hw_uframe=3Dstream->splits|stream->c_splits2;
+	}
+
+	if(sitd->backpointer_sitd_dma!=3D1) {
+		/* start in Do Complete Split mode, ehci1 4.12.3.3.2.1 =
*/
+		transaction |=3D cpu_to_hc32(ehci, SITD_STS_STS);
+	}
+
+	sitd->hw_results =3D transaction;
=20
 	bufp =3D uf->bufp;
 	sitd->hw_buf[0] =3D cpu_to_hc32(ehci, bufp);
@@ -2149,13 +2228,26 @@ static void sitd_link_urb(
 	unsigned		next_uframe;
 	struct ehci_iso_sched	*sched =3D urb->hcpriv;
 	struct ehci_sitd	*sitd;
+	struct ehci_sitd	*sitd_before;
+	int			sitd_mult;
=20
 	next_uframe =3D stream->next_uframe;
=20
-	if (list_empty(&stream->td_list))
+	if (list_empty(&stream->td_list)) {
 		/* usbfs ignores TT bandwidth */
 		ehci_to_hcd(ehci)->self.bandwidth_allocated
 				+=3D stream->bandwidth;
+		sitd_before =3D NULL;
+	} else {
+		sitd_before =3D list_last_entry(&stream->td_list,
+				struct ehci_sitd, sitd_list);
+		/* only add a bkptr to sitds scheduled in frames past =
now_frame */
+		if(sitd_before->frame =3D=3D ehci->now_frame ||
+			sitd_before->frame + 1 =3D=3D ehci->now_frame)
+		{
+			sitd_before =3D NULL;
+		}
+	}
=20
 	if (ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs =3D=3D 0) {
 		if (ehci->amd_pll_fix =3D=3D 1)
@@ -2163,11 +2255,15 @@ static void sitd_link_urb(
 	}
=20
 	ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs++;
+	if(stream->ps.c_mask2 && stream->ps.period!=3D1)
+		sitd_mult =3D 2;
+	else
+		sitd_mult =3D 1;
=20
 	/* fill sITDs frame by frame */
-	for (packet =3D sched->first_packet, sitd =3D NULL;
-			packet < urb->number_of_packets;
-			packet++) {
+	for (int i =3D sched->first_packet, sitd =3D NULL;
+			i < sitd_mult * urb->number_of_packets;
+			i++) {
=20
 		/* ASSERT:  we have all necessary sitds */
 		BUG_ON(list_empty(&sched->td_list));
@@ -2176,15 +2272,41 @@ static void sitd_link_urb(
=20
 		sitd =3D list_entry(sched->td_list.next,
 				struct ehci_sitd, sitd_list);
+		if(stream->ps.cs_mask2 && sitd_before!=3DNULL &&
+			!(sched->first_packet!=3D0 && =
i=3D=3Dsched->first_packet) &&
+			(stream->ps.period=3D=3D1 || i%2=3D=3D1) ) {
+
+			sitd->backpointer_sitd_dma =3D =
sitd_before->sitd_dma;
+		} else {
+			sitd->backpointer_sitd_dma =3D 1;
+		}
+
 		list_move_tail(&sitd->sitd_list, &stream->td_list);
 		sitd->stream =3D stream;
 		sitd->urb =3D urb;
=20
+		if(stream->ps.c_mask2 && (stream->ps.period!=3D1)) {
+			packet =3D i/2;
+			sitd->first_in_pair =3D i%2 =3D=3D 0;
+		} else {
+			packet =3D i;
+		}
+
 		sitd_patch(ehci, stream, sitd, sched, packet);
 		sitd_link(ehci, (next_uframe >> 3) & =
(ehci->periodic_size - 1),
 				sitd);
=20
-		next_uframe +=3D stream->uperiod;
+		if(stream->ps.c_mask2 && (stream->ps.period!=3D1)) {
+			if((i%2)=3D=3D0) {
+				/* next sitd only has frame-hopping =
CSPLITS */
+				next_uframe +=3D 8;
+			} else if ((i%2)=3D=3D1) {
+				next_uframe +=3D stream->uperiod - 8;
+			}
+		} else {
+			next_uframe +=3D stream->uperiod;
+		}
+		sitd_before =3D sitd;
 	}
 	stream->next_uframe =3D next_uframe & (mod - 1);
=20
@@ -2220,6 +2342,13 @@ static bool sitd_complete(struct ehci_hcd *ehci, =
struct ehci_sitd *sitd)
 	struct ehci_iso_stream			*stream =3D =
sitd->stream;
 	bool					retval =3D false;
=20
+	if(stream->force_sitd_done) {
+		/* sitd is the 2nd in a pair for a bIntrvl!=3D1 case w/ =
bkptrs */
+		stream->force_sitd_done =3D false;
+		goto done;
+	}
+	stream->force_sitd_done =3D sitd->first_in_pair; /* for next =
sitd */
+
 	urb_index =3D sitd->index;
 	desc =3D &urb->iso_frame_desc[urb_index];
 	t =3D hc32_to_cpup(ehci, &sitd->hw_results);
@@ -2245,7 +2374,7 @@ static bool sitd_complete(struct ehci_hcd *ehci, =
struct ehci_sitd *sitd)
 	}
=20
 	/* handle completion now? */
-	if ((urb_index + 1) !=3D urb->number_of_packets)
+	if (likely ((urb_index + 1) !=3D urb->number_of_packets))
 		goto done;
=20
 	/*
@@ -2293,6 +2422,7 @@ static int sitd_submit(struct ehci_hcd *ehci, =
struct urb *urb,
 	gfp_t mem_flags)
 {
 	int			status =3D -EINVAL;
+	int			status2 =3D 0;
 	unsigned long		flags;
 	struct ehci_iso_stream	*stream;
=20
@@ -2335,13 +2465,21 @@ static int sitd_submit(struct ehci_hcd *ehci, =
struct urb *urb,
 		goto done_not_linked;
 	status =3D iso_stream_schedule(ehci, urb, stream);
 	if (likely(status =3D=3D 0)) {
+		if(stream->ps.c_mask2 && stream->ps.period!=3D1) {
+			/*
+			 * stream has frame-hopping CSPLITS and period =
isn't 1:
+			 * 2 sitds required for each packet
+			 */
+			status2 =3D allocate_sitds(stream, ehci, urb, =
urb->hcpriv, mem_flags,
+					&flags);
+		}
 		sitd_link_urb(ehci, urb, ehci->periodic_size << 3, =
stream);
 	} else if (status > 0) {
 		status =3D 0;
 		ehci_urb_done(ehci, urb, 0);
-	} else {
-		usb_hcd_unlink_urb_from_ep(ehci_to_hcd(ehci), urb);
 	}
+	if(status<0 || status2<0)
+		usb_hcd_unlink_urb_from_ep(ehci_to_hcd(ehci), urb);
  done_not_linked:
 	spin_unlock_irqrestore(&ehci->lock, flags);
  done:
@@ -2433,10 +2571,16 @@ static void scan_isoc(struct ehci_hcd *ehci)
 			 * No need to check for activity unless the
 			 * frame is current.
 			 */
+			/* delay the expiration frame by one frame past =
now_frame to
+			 * accommodate HW delay (commit 22e1869). delay =
it one further
+			 * frame to accommodate frame-hopping csplits
+			 */
 			if (((frame =3D=3D now_frame) ||
-					(((frame + 1) & fmask) =3D=3D =
now_frame))
+					(((frame + 1) & fmask) =3D=3D =
now_frame) ||
+					(((frame + 2) & fmask) =3D=3D =
now_frame))
 				&& live
-				&& (q.sitd->hw_results & =
SITD_ACTIVE(ehci))) {
+				&& (q.sitd->hw_results & =
SITD_ACTIVE(ehci))
+				&& !q.sitd->stream->force_sitd_done) {
=20
 				q_p =3D &q.sitd->sitd_next;
 				hw_p =3D &q.sitd->hw_next;
@@ -2482,8 +2626,8 @@ static void scan_isoc(struct ehci_hcd *ehci)
 	if (frame =3D=3D now_frame)
 		return;
=20
-	/* The last frame may still have active siTDs */
-	ehci->last_iso_frame =3D frame;
+	/* next call's scan begins at this call's now_frame-2 */
+	ehci->last_iso_frame =3D (frame - 1) & fmask;
 	frame =3D (frame + 1) & fmask;
=20
 	goto restart;
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7a3c8d13..e4a387976 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -50,7 +50,9 @@ struct ehci_per_sched {
 	struct usb_host_endpoint *ep;
 	struct list_head	ps_list;	/* node on ehci_tt's =
ps_list */
 	u16			tt_usecs;	/* time on the FS/LS bus =
*/
-	u16			cs_mask;	/* C-mask and S-mask =
bytes */
+	u32			cs_mask;	/* C-mask and S-mask =
bytes */
+	u16			c_mask2;	/* C-mask for =
frame-hopping CSPLITS */
+
 	u16			period;		/* actual period in =
frames */
 	u16			phase;		/* actual phase, frame =
part */
 	u8			bw_phase;	/* same, for bandwidth
@@ -485,11 +487,13 @@ struct ehci_iso_stream {
 	u8			highspeed;
 	struct list_head	td_list;	/* queued itds/sitds */
 	struct list_head	free_list;	/* list of unused =
itds/sitds */
+	bool			force_sitd_done;/* for bIntrvl!=3D1 case =
w/ bkptrs */
=20
 	/* output of (re)scheduling */
 	struct ehci_per_sched	ps;		/* scheduling info */
 	unsigned		next_uframe;
-	__hc32			splits;
+	__hc32			splits;		/* C-mask and S-mask */
+	__hc32			c_splits2;	/* C-mask for =
frame-hopping CSPLITS */
=20
 	/* the rest is derived from the endpoint descriptor,
 	 * including the extra info for hw_bufp[0..2]
@@ -579,7 +583,11 @@ struct ehci_sitd {
=20
 	/* the rest is HCD-private */
 	dma_addr_t		sitd_dma;
+	dma_addr_t		backpointer_sitd_dma;
+
 	union ehci_shadow	sitd_next;	/* ptr to periodic q =
entry */
+	bool			first_in_pair;  /* for period!=3D1 w/ =
bkptrs */
+
=20
 	struct urb		*urb;
 	struct ehci_iso_stream	*stream;	/* endpoint's queue */
--=20
2.39.5


