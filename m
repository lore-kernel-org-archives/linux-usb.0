Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770091;
	b=GbA12psWElirZHzZhLeAaLHJaOxIFJENt4/EsJV1JtGYAkn/hh+WuIlj3W9dSBQnKFPf
	 7qTtxnekpE8i6sObEhYugUptAknfxykF3LpVQCOcXcFJW3eJ/bp+nvkV+0efmx4Nd0cZX
	 6/TKMczuKGDsDtafnFAdrdHx1PaoXRqnBEZqMnRLEAwDmrrv2gydxEPT+nLjMTrtJ0Ju3
	 iiTThtkxAfay0lewBak5ykm6iF9IvqLEuo8vcDITEVCu6wIW0feOz5X0a5VWzdlJQK+BF
	 2OjT5+TqYwAkVn3y+A+aGbdc69sXwqLJ+NKOvdSUb/nF9Yl6jd7f4RzbQwlqabKDxsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770091;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Cykp/EnFJtnkIq6AjQgA35aI29lF93NWrFk56jTm4RI=;
	b=PUBd3TwLk9Pq8nPBf8d3Byc+h/XqLbmLuipr4VLk8/gu34bJ7yB2uu16t4gmdxR6G8Xz
	 Hoe5ho4ZAVtKMp5Mt7ZHnUBehm6/izUoERN+KhcGry3s8p86GRmgNuZNbu6tYffLJa2wX
	 /uXFfuEVsh/4QHU+GfHFjXDkpN5j1CS0wLywO5NLesn+xEVI4n+8bJAxroDOAli0/+hKR
	 xd2eYCoqAXEL9dX/TjacT33kN7cGrf+TPRj9nlxM7kOpzGhqtb+eYW/OQjRbYBq5OMWDs
	 knYyKmAg5lYTCsqC0aWcHvhi16elP4ev3kgfd5agqn2iqTEwK1DouJPt14ZU7rPYmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08350606A329
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08350606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f11330e550so2016505ad.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770090; x=1796374890;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cykp/EnFJtnkIq6AjQgA35aI29lF93NWrFk56jTm4RI=;
        b=KK3Xq1OKNgLvz6aiJplKF9b6eaLqAGGTXmyW62gUbgO9Yqua1nomskzRAwD1iqUEoP
         7FWpcwdq3poG0X0uq6tLU6DldVUR8tAasYlroZAE7Lc9gdtDU8tRTqrL8KgAJc9x5GTq
         6k/ZaR3A2Hbq/wQeWAaGuSpnWUTz0y3BCIrjvJ3wqfJmsh3MfCpR1+c6AW6A360Q/A2V
         qDEjSgiQ8wKsZ9IqMBj0ApOUo409qnuiNgGzCsirqKPMsguBG/CEXUf30DzeA2z898sx
         8xdh0Ps68Uq1oeIrmNhV2FT+MchU4AafTZs8i8GARfc5t+F22kvr1vHPYocHIehkbo/a
         nS3A==
X-Forwarded-Encrypted: i=1; AL+hErHd/cgqKQKp59AqFCWzdwdrwfDGSqU+3/Bp4Rx/qNjYtwCkRWywPJQmEVtXKYdUYyMXV7ByCCukXrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/0+a0xBX679g2p4+RBJyM7x088KXvbNUkHNEYIiLzVl2rKeBP
	loMPUsCYkG2zTZpmYrYWY6LIrJCcP0LYKO915Z3TWRbtHteqWi5TWQoV
X-Gm-Gg: AZFdTZd5ythzHCNbLfXSGrfnnpgzz4Er0TSzGVJvxLj0q2/O3J1cMgiO7msKimuHDIB
	brhSsYb/gd6mG+xOvZ9R2WXxz6ulIXU48B+FfWnETggZ8It+7GG5dyn+sODKPPHUco1qLTtUTrK
	ujBcBdtM0x/o2QBBEyGuk+pkGJD/0WbG7q0d4K9kxT7QNb/XDChfwMtqJxRxyFxm9RkVSm+ob/g
	fZ+FJzIDi6GwCFgBWE2XqNeC/ItkgrMZ+AETy3OkqtSZShL8aLrma/ZM2W2wvbKjhmwb0VuCk5x
	ce/LkJL2R7p8vft+D6kQ65+hanUsDv4KWW5+nHYdr/g34vbeFY0cFfg8xxST4HJvmDbX7H8raGC
	zdF16a9Kaevr4LQmptNKCOhjFAi/O0GYeUV2fR5I2Q/qgr0FjIZ1kQORk07NUo6I/6PpBUKDpfX
	nHwU+6uWAhxeVrDA6Qm734v2a9owmOd9sduZHGtwQNBdS02jKFYjSVR+biiA2ydq7uPPkTUZtT7
	bYLvukWSXSzPqP+RepbqzYwP5qd+mD1B6UoqxCwVuJII6BOFQXYtsSodMwd6IRN/gL1kVOMApJL
	Ry/4KilgJYDHaD3otxY7H/bMndqKQ/KaIlDRyVZVvP8MDn8gYMBw/GAZ/ISsEjFlyZDr5uA+JHt
	IbkdGn9oPwxP8Vrubl5zzVWumZg89eMK1/opBVzajO9G9QMx0eR4JGYNzbR8lgmt7Hbs=
X-Received: by 2002:a17:903:41cd:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2f03ef5a3ebmr241339015ad.3.1795770089701;
        Fri, 27 Nov 2026 01:01:29 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:01:29 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 3/3] usb: core: Close residual anchor read-to-lock
 window with RCU
Date: Fri, 27 Nov 2026 17:01:25 +0800
Message-ID: <179577008559.23588.16952362934102548601@kylinos.cn>
In-Reply-To: <179577006613.23588.1120308700542393912@kylinos.cn>
References: <179577006613.23588.1120308700542393912@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

usb_unanchor_urb() and the URB giveback read urb->anchor and only
then acquire anchor->lock.  Between the read and the lock
acquisition the anchor can already have been freed: a concurrent
unanchor of the last URB empties the anchor, a
usb_wait_anchor_empty_timeout() waiter observes the condition true,
returns, and the driver frees the memory holding the anchor; the
spin_lock() then touches freed memory.  This gap is as old as
usb_unanchor_urb() itself and was deliberately left open by the
capture-to-increment fix, whose guarantee is scoped to givebacks
that have already incremented suspend_wakeups.

A plain reference count cannot close it: the first dereference of
the freshly read anchor pointer would have to be the refcount
increment itself, so the pin would be taken on memory that may
already have been freed.  Protecting the pointer read requires
deferred reclamation, and because anchors are embedded in
driver-private structures and freed with plain kfree() right after
a successful wait, the deferral has to live on the side usbcore
controls: the return of the wait.

Convert the anchor wakeup protocol into a lifetime protocol:

 - The lockless urb->anchor reads (usb_unanchor_urb() and
   usb_unanchor_urb_and_suspend_wakeups()) run inside RCU
   read-side critical sections, and urb->anchor is published with
   rcu_assign_pointer().

 - Every function whose return lets the caller free the anchor --
   usb_wait_anchor_empty_timeout() on a non-zero return,
   usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() -- waits one synchronize_rcu()
   before returning, and touches nothing on the anchor after it.
   These are teardown guarantees: provided the caller stops
   anchoring new URBs, readers that read urb->anchor before the
   grace period have acquired and released anchor->lock by the
   time the caller may free the anchor, and readers after it find
   urb->anchor =3D=3D NULL and never touch the anchor at all.  (A
   concurrent usb_anchor_urb() would re-publish urb->anchor; the
   protocol does not police the caller's own anchoring.)  The
   license is per caller: another teardown call may still be
   sleeping on the anchor's wait queue, so a caller that frees on
   its own success must first let other in-flight teardown calls
   return.  And as with any wait on the anchor, these calls must
   not be made from the completion callback of a URB on the same
   anchor: the giveback holds its suspend_wakeups pin until after
   the callback returns, so such a call would wait for itself.

The empty-anchor retry of kill/poison/scuttle waits on the
anchor's wait queue and takes the same grace-period exit as
usb_wait_anchor_empty_timeout() instead of busy-waiting.  On
!PREEMPT_RCU kernels whose scheduler tick reports no quiescent
state for a spinning process context, a busy retry keeps this CPU
from reporting a quiescent state and stalls every grace period
that still awaits this CPU's quiescent state -- a concurrent
teardown's grace-period exit included -- and under real-time
scheduling it can starve the very completion path it is waiting
for.  The retry keeps the re-drain behavior of the busy loop it
replaces: usb_anchor_urb() wakes the anchor's wait queue, and the
wait also ends -- without declaring the anchor unused -- when a
URB is anchored after the drain, so the loop restarts and tears
the late arrival down too.

usb_wait_anchor_empty_timeout() keeps its documented contract: a
zero timeout still performs a single condition evaluation without
entering the wait queue -- a successful evaluation still waits one
grace period before returning -- and a successful wait returns 1
rather than the remaining jiffies.  The wait may overrun the
caller's timeout by up to one grace period, because the grace
period is waited after the condition is observed true: a non-zero
return must carry the safe-to-free guarantee.

The giveback's long window across the completion handler keeps
the suspend_wakeups pin it already takes.  No fields are added to
struct usb_anchor or struct urb and no driver changes are
required.  The cost is one RCU grace period per successful
teardown exit -- including teardown of an already-empty anchor,
which previously returned without one -- which cannot be elided
for a caller that frees the anchor without giving up the
safe-to-free guarantee of the non-zero return; callers that keep
the anchor alive across teardowns pay it without needing it
(usbtmc waits on its submission anchor, btusb stops five anchors
in a row, and a usbtmc synchronous read converges on a kill and a
scuttle, paying two grace periods per read).

usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs() must now be called from a context
that can sleep (all in-tree callers already do).  Only
usb_scuttle_anchored_urbs() changes contract, because the other
two already slept transitively through usb_kill_urb() and
usb_poison_urb().  All three carry a might_sleep() -- for kill
and poison it covers the empty-anchor entry path, which returns
through the grace-period exit without ever reaching
usb_kill_urb() or usb_poison_urb() -- so that an atomic-context
caller is caught at the call site with debugging configurations
enabled.  The per-URB hot paths gain rcu_read_lock()/
rcu_dereference() around the lockless anchor reads,
rcu_assign_pointer() for the anchor pointer updates, and one
waitqueue_active()-gated wakeup in usb_anchor_urb(), which lets a
teardown drain sleeping on the anchor notice a late-anchored URB
without putting an unconditional wake_up() under the lock on
every submission.

The deallocation and usb_wait_anchor_empty_timeout() sections of
Documentation/driver-api/usb/anchors.rst are updated to describe
the grace-period teardown guarantee and the new wait return
semantics.

Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 Documentation/driver-api/usb/anchors.rst |  23 +-
 drivers/usb/core/urb.c                   | 329 +++++++++++++++++++----
 include/linux/usb.h                      |   7 +-
 3 files changed, 301 insertions(+), 58 deletions(-)

diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-=
api/usb/anchors.rst
index 5a93d171e76c..1715a8a5aecd 100644
--- a/Documentation/driver-api/usb/anchors.rst
+++ b/Documentation/driver-api/usb/anchors.rst
@@ -22,8 +22,15 @@ initialise the data structure.
 Deallocation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Once it has no more URBs associated with it, the anchor can be
-freed with normal memory management operations.
+Once it has no more URBs associated with it, and one of
+usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
+usb_poison_anchored_urbs() or usb_scuttle_anchored_urbs() has returned
+successfully, the anchor can be freed with normal memory management
+operations.  The successful return drains readers that may still hold
+the anchor pointer by waiting one RCU grace period.  This holds only
+for the caller's own teardown: the caller must have stopped anchoring
+new URBs, and must not free the anchor while another call on it is
+still in flight.
=20
 Association and disassociation of URBs with anchors
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -48,14 +55,20 @@ This way no data can be reordered.
 :c:func:`usb_scuttle_anchored_urbs`
 -----------------------------------
=20
-All URBs of an anchor are unanchored en masse.
+All URBs of an anchor are unanchored en masse.  This function may
+sleep; an empty anchor is torn down through the same grace-period
+exit as a non-empty one.
=20
 :c:func:`usb_wait_anchor_empty_timeout`
 ---------------------------------------
=20
 This function waits for all URBs associated with an anchor to finish
-or a timeout, whichever comes first. Its return value will tell you
-whether the timeout was reached.
+or a timeout, whichever comes first.  It returns 0 if the timeout was
+reached and 1 if the anchor drained.  A successful wait -- even one
+whose condition was already true, with a zero timeout -- waits one RCU
+grace period before returning, so it may overrun the caller's timeout
+by up to one grace period; this is what makes it safe for the caller
+to free the anchor on a non-zero return.
=20
 :c:func:`usb_anchor_empty`
 --------------------------
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 174dc42c95c1..d7528bd45d11 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/log2.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
 #include <linux/usb/hcd.h>
@@ -132,11 +133,34 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor =
*anchor)
 	spin_lock_irqsave(&anchor->lock, flags);
 	usb_get_urb(urb);
 	list_add_tail(&urb->anchor_list, &anchor->urb_list);
-	urb->anchor =3D anchor;
+	rcu_assign_pointer(urb->anchor, anchor);
=20
 	if (unlikely(anchor->poisoned))
 		atomic_inc(&urb->reject);
=20
+	/*
+	 * Wake a teardown drain sleeping on this anchor: the late URB
+	 * makes the drain's wait condition true again, so the wait
+	 * ends with the anchor not unused and the drain restarts to
+	 * take care of the late arrival.  The waitqueue_active()
+	 * gate keeps the common no-drain submission off the wakeup
+	 * path; it cannot lose this wakeup, because a drain that
+	 * enqueues only after this critical section re-checks the
+	 * list under anchor->lock and restarts on its own (see
+	 * usb_anchor_teardown_progress()).
+	 *
+	 * The gate deviates from the two usages wait.h sanctions for
+	 * waitqueue_active() (the waitqueue lock, or an explicit
+	 * smp_mb()): here it is evaluated inside the same
+	 * anchor->lock critical section as the list_add_tail() above,
+	 * and the drains evaluate their wait condition under that
+	 * lock too, so the store and the gate load cannot be
+	 * reordered apart.  Hoisting the gate out of the lock would
+	 * silently lose wakeups.
+	 */
+	if (waitqueue_active(&anchor->wait))
+		wake_up(&anchor->wait);
+
 	spin_unlock_irqrestore(&anchor->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
@@ -153,7 +177,11 @@ static int __usb_anchor_check_wakeup(struct usb_anchor *=
anchor)
  * meant for waiters which do not hold the lock: the critical section
  * serializes with the URB giveback path, so once the check succeeds no
  * giveback that has incremented suspend_wakeups will touch the anchor
- * anymore and the caller may free the memory holding the anchor.
+ * anymore.  This does not by itself make freeing safe: the caller must
+ * still wait one RCU grace period for readers that are between reading
+ * urb->anchor and acquiring anchor->lock, and must not anchor new URBs
+ * concurrently; see usb_wait_anchor_empty_timeout() for the full
+ * contract.
  */
 static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
@@ -167,10 +195,47 @@ static int usb_anchor_check_wakeup(struct usb_anchor *a=
nchor)
 	return wakeup;
 }
=20
+/*
+ * Wait-condition helper for the teardown drain loops: the wait ends
+ * either with the anchor observed unused under anchor->lock (*unused
+ * is set and the caller takes the grace-period exit), or -- without
+ * that observation -- when a URB was anchored after the drain, so the
+ * caller returns to the top of its loop and drains the late arrival.
+ * usb_anchor_urb() wakes the anchor's wait queue for the second case,
+ * and the lockless list read is only a fast path: a stale non-empty
+ * entry merely restarts the drain, and a stale empty one is caught by
+ * the locked re-check below, so neither direction can lose the
+ * restart.
+ */
+static bool usb_anchor_teardown_progress(struct usb_anchor *anchor,
+					 bool *unused)
+{
+	unsigned long flags;
+	bool ret;
+
+	if (!list_empty_careful(&anchor->urb_list)) {
+		*unused =3D false;
+		return true;
+	}
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	if (!list_empty(&anchor->urb_list)) {
+		/* A late URB landed: restart the drain for it. */
+		*unused =3D false;
+		ret =3D true;
+	} else {
+		*unused =3D __usb_anchor_check_wakeup(anchor);
+		ret =3D *unused;
+	}
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return ret;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
-	urb->anchor =3D NULL;
+	rcu_assign_pointer(urb->anchor, NULL);
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
 	if (__usb_anchor_check_wakeup(anchor))
@@ -191,19 +256,28 @@ void usb_unanchor_urb(struct urb *urb)
 	if (!urb)
 		return;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
-		return;
-
-	spin_lock_irqsave(&anchor->lock, flags);
 	/*
-	 * At this point, we could be competing with another thread which
-	 * has the same intention. To protect the urb from being unanchored
-	 * twice, only the winner of the race gets the job.
+	 * The anchor pointer is read locklessly: a concurrent unanchor can
+	 * empty the anchor and let a waiter return and free it before this
+	 * thread manages to acquire anchor->lock.  The RCU read-side
+	 * critical section keeps the anchor memory alive across that gap;
+	 * every anchor teardown exit waits for a grace period before it
+	 * lets the caller free the anchor.
 	 */
-	if (likely(anchor =3D=3D urb->anchor))
-		__usb_unanchor_urb(urb, anchor);
-	spin_unlock_irqrestore(&anchor->lock, flags);
+	rcu_read_lock();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		/*
+		 * At this point, we could be competing with another thread which
+		 * has the same intention. To protect the urb from being unanchored
+		 * twice, only the winner of the race gets the job.
+		 */
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor)))
+			__usb_unanchor_urb(urb, anchor);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	}
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
@@ -227,6 +301,13 @@ EXPORT_SYMBOL_GPL(usb_unanchor_urb);
  * "@urb is on anchor->urb_list" are changed together only while
  * holding anchor->lock.
  *
+ * Like usb_unanchor_urb(), the initial urb->anchor read is protected by
+ * an RCU read-side critical section, so a concurrent unanchor cannot
+ * make the anchor vanish between the read and the lock acquisition:
+ * an anchor is only freed after a grace period that flushes readers
+ * of the anchoring being torn down.  Anchoring new URBs concurrently
+ * would re-publish urb->anchor and is outside that teardown contract.
+ *
  * Return: the anchor, which the caller must later pass to
  * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
  * anymore (a concurrent unanchor won the race).
@@ -236,19 +317,20 @@ struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups=
(struct urb *urb)
 	struct usb_anchor *anchor;
 	unsigned long flags;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
-		return NULL;
-
-	spin_lock_irqsave(&anchor->lock, flags);
-	if (likely(anchor =3D=3D urb->anchor)) {
-		atomic_inc(&anchor->suspend_wakeups);
-		__usb_unanchor_urb(urb, anchor);
-		spin_unlock_irqrestore(&anchor->lock, flags);
-	} else {
-		spin_unlock_irqrestore(&anchor->lock, flags);
-		anchor =3D NULL;
+	rcu_read_lock();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor))) {
+			atomic_inc(&anchor->suspend_wakeups);
+			__usb_unanchor_urb(urb, anchor);
+			spin_unlock_irqrestore(&anchor->lock, flags);
+		} else {
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			anchor =3D NULL;
+		}
 	}
+	rcu_read_unlock();
=20
 	return anchor;
 }
@@ -882,15 +964,30 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
  * with guarantee that no completer callbacks will take place from the
  * anchor after this function returns.
  *
+ * It is safe to free the anchor (or the structure embedding it) once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call (a kill, poison, scuttle or
+ * wait on the same anchor) is still in flight: such a call may be
+ * sleeping on the anchor's wait queue, which lives in the memory to
+ * be freed.  This function may sleep (it waits one RCU grace period
+ * on the success path).
+ *
+ * This function must not be called from the completion callback of a
+ * URB on @anchor: the callback runs while the giveback still holds
+ * the anchor's suspend_wakeups pin, so the drain would wait for
+ * itself.
+ *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
  */
 void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
-	int surely_empty;
+	bool unused;
=20
-	do {
+	might_sleep();
+
+	for (;;) {
 		spin_lock_irq(&anchor->lock);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
@@ -903,11 +1000,47 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			spin_unlock_irq(&anchor->lock);
+			/*
+			 * One grace period before declaring the anchor
+			 * unused and returning: a thread that has read
+			 * urb->anchor but has not yet acquired anchor->lock
+			 * must not touch the anchor after the caller frees
+			 * it.  Nothing in this path may touch the anchor
+			 * after this point.
+			 */
+			synchronize_rcu();
+			return;
+		}
=20
 		spin_unlock_irq(&anchor->lock);
-		cpu_relax();
-	} while (!surely_empty);
+		/*
+		 * The anchor is empty but a giveback still holds a
+		 * suspend_wakeups pin.  Busy-waiting for it would
+		 * keep this CPU from reporting a quiescent state on
+		 * !PREEMPT_RCU kernels whose scheduler tick reports
+		 * none for a spinning process context, stalling every
+		 * grace period that still awaits this CPU's quiescent
+		 * state -- a concurrent teardown's grace-period exit
+		 * included -- and under real-time scheduling it can
+		 * starve the very completion path it is waiting for.
+		 * Wait for the wakeup protocol to signal the state
+		 * change and take the same grace-period exit as
+		 * usb_wait_anchor_empty_timeout().  The wait also
+		 * ends without an unused observation when a URB is
+		 * anchored after the drain, so the loop restarts and
+		 * kills it, like the busy loop this replaced did.
+		 */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused));
+		if (unused) {
+			/* Same lifetime exit as above. */
+			synchronize_rcu();
+			return;
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
=20
@@ -920,15 +1053,27 @@ EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
  * from the back of the queue. Newly added URBs will also be
  * poisoned
  *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call on the same anchor is still
+ * in flight.  This function may sleep (it waits one RCU grace period
+ * on the success path).
+ *
+ * Like usb_kill_anchored_urbs(), it must not be called from the
+ * completion callback of a URB on @anchor: the drain would wait for
+ * the pin its own giveback holds.
+ *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
  */
 void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
-	int surely_empty;
+	bool unused;
+
+	might_sleep();
=20
-	do {
+	for (;;) {
 		spin_lock_irq(&anchor->lock);
 		anchor->poisoned =3D 1;
 		while (!list_empty(&anchor->urb_list)) {
@@ -942,11 +1087,24 @@ void usb_poison_anchored_urbs(struct usb_anchor *ancho=
r)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			spin_unlock_irq(&anchor->lock);
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			synchronize_rcu();
+			return;
+		}
=20
 		spin_unlock_irq(&anchor->lock);
-		cpu_relax();
-	} while (!surely_empty);
+		/* Same sleepable retry as usb_kill_anchored_urbs(). */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused));
+		if (unused) {
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			synchronize_rcu();
+			return;
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
=20
@@ -976,8 +1134,15 @@ EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
  * @anchor: the anchor you want to suspend wakeups on
  *
  * Call this to stop the last urb being unanchored from waking up any
- * usb_wait_anchor_empty_timeout waiters. This is used in the hcd urb give-
- * back path to delay waking up until after the completion handler has run.
+ * usb_wait_anchor_empty_timeout waiters. The hcd urb give-back path,
+ * which delays waking up until after the completion handler has run,
+ * uses usb_unanchor_urb_and_suspend_wakeups() for that nowadays; this
+ * export remains for external users pairing it with
+ * usb_anchor_resume_wakeups().
+ *
+ * Note that a manually held pin also holds up anchor teardown: a
+ * kill, poison, scuttle or wait call on the same anchor will not
+ * return while the pin is outstanding.
  */
 void usb_anchor_suspend_wakeups(struct usb_anchor *anchor)
 {
@@ -1016,29 +1181,59 @@ void usb_anchor_resume_wakeups(struct usb_anchor *anc=
hor)
 EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
=20
 /**
- * usb_wait_anchor_empty_timeout - wait for an anchor to be unused
+ * usb_wait_anchor_empty_timeout - wait for an anchor to become unused
  * @anchor: the anchor you want to become unused
  * @timeout: how long you are willing to wait in milliseconds
  *
  * Call this is you want to be sure all an anchor's
  * URBs have finished
  *
+ * A non-zero return also makes it safe to free the anchor (or the
+ * structure embedding it), provided that no new URBs are anchored to
+ * it concurrently and no other teardown call on the same anchor is
+ * still in flight (it may be sleeping on the anchor's wait queue).
+ * This function may sleep; in particular, a successful wait -- even
+ * with a zero timeout -- waits one RCU grace period before returning.
+ * It must not be called from the completion callback of a URB on
+ * @anchor: the wait cannot end before the giveback releases its
+ * suspend_wakeups pin, which happens only after the callback returns.
+ *
  * Return: Non-zero if the anchor became unused. Zero on timeout.
  */
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	unsigned long deadline =3D jiffies + msecs_to_jiffies(timeout);
+	long ret;
+
 	/*
-	 * The condition must be evaluated under anchor->lock: when this
-	 * function returns non-zero, every URB giveback that has incremented
-	 * suspend_wakeups has finished with the anchor, so the caller may
-	 * free the anchor, which is typically embedded in the driver's
+	 * The condition is evaluated under anchor->lock.  When
+	 * this function returns non-zero, every URB giveback that has
+	 * incremented suspend_wakeups has finished with the anchor and one
+	 * RCU grace period has flushed any reader that was still between
+	 * reading urb->anchor and acquiring anchor->lock, so the caller
+	 * may free the anchor -- provided that no new URBs are anchored
+	 * concurrently -- which is typically embedded in the driver's
 	 * private structure.  A zero return (timeout) means a giveback may
 	 * still be in flight and gives no such guarantee.
 	 */
-	return wait_event_timeout(anchor->wait,
-				  usb_anchor_check_wakeup(anchor),
-				  msecs_to_jiffies(timeout));
+	/*
+	 * Clamped to zero so that a timeout of zero keeps its
+	 * historical meaning of a single condition evaluation
+	 * without entering the wait queue (a successful
+	 * evaluation still waits one grace period before
+	 * returning), and so the macro never sees a negative
+	 * timeout after the deadline passes.
+	 */
+	ret =3D wait_event_timeout(anchor->wait,
+				 usb_anchor_check_wakeup(anchor),
+				 max_t(long, (long)(deadline - jiffies), 0));
+	if (!ret)
+		return 0;
+
+	/* Same lifetime exit as the teardown drains. */
+	synchronize_rcu();
+	return 1;
 }
 EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
=20
@@ -1049,6 +1244,11 @@ EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
  * This will take the oldest urb from an anchor, unanchor and return it with
  * a reference held.
  *
+ * A %NULL return does not mean the anchor is quiescent: a URB giveback
+ * may still be between its suspend_wakeups increment and its wakeup
+ * resume.  Call usb_wait_anchor_empty_timeout() and check for a
+ * non-zero return before freeing the anchor.
+ *
  * Return: The oldest urb from @anchor, or %NULL if @anchor has no
  * urbs associated with it.
  */
@@ -1078,25 +1278,50 @@ EXPORT_SYMBOL_GPL(usb_get_from_anchor);
  * @anchor: the anchor whose urbs you want to unanchor
  *
  * use this to get rid of all an anchor's urbs
+ *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call on the same anchor is still
+ * in flight.  This function may sleep (it waits one RCU grace period
+ * on the success path).
+ *
+ * Like usb_kill_anchored_urbs(), it must not be called from the
+ * completion callback of a URB on @anchor: the drain would wait for
+ * the pin its own giveback holds.
  */
 void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
 	unsigned long flags;
-	int surely_empty;
+	bool unused;
=20
-	do {
+	might_sleep();
+
+	for (;;) {
 		spin_lock_irqsave(&anchor->lock, flags);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
 					    struct urb, anchor_list);
 			__usb_unanchor_urb(victim, anchor);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			synchronize_rcu();
+			return;
+		}
=20
 		spin_unlock_irqrestore(&anchor->lock, flags);
-		cpu_relax();
-	} while (!surely_empty);
+		/* Same sleepable retry as usb_kill_anchored_urbs(). */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused));
+		if (unused) {
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			synchronize_rcu();
+			return;
+		}
+	}
 }
=20
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
@@ -1105,6 +1330,8 @@ EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
  * usb_anchor_empty - is an anchor empty
  * @anchor: the anchor you want to query
  *
+ * This is an unsynchronized peek; it gives no lifetime guarantee.
+ *
  * Return: 1 if the anchor has no urbs associated with it.
  */
 int usb_anchor_empty(struct usb_anchor *anchor)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..28cfd59defd4 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1447,7 +1447,10 @@ typedef void (*usb_complete_t)(struct urb *);
  * struct urb - USB Request Block
  * @urb_list: For use by current owner of the URB.
  * @anchor_list: membership in the list of an anchor
- * @anchor: to anchor URBs to a common mooring
+ * @anchor: to anchor URBs to a common mooring; usbcore publishes it
+ *	with rcu_assign_pointer() and consumes it under
+ *	rcu_read_lock() with rcu_dereference(), see
+ *	drivers/usb/core/urb.c for the anchor lifetime protocol
  * @ep: Points to the endpoint's data structure.  Will eventually
  *	replace @pipe.
  * @pipe: Holds endpoint number, direction, type, and more.
@@ -1647,7 +1650,7 @@ struct urb {
 	struct list_head urb_list;	/* list head for use by the urb's
 					 * current owner */
 	struct list_head anchor_list;	/* the URB may be anchored */
-	struct usb_anchor *anchor;
+	struct usb_anchor __rcu *anchor;
 	struct usb_device *dev;		/* (in) pointer to associated device */
 	struct usb_host_endpoint *ep;	/* (internal) pointer to endpoint */
 	unsigned int pipe;		/* (in) pipe information */
--=20
2.39.5 (Apple Git-154)

