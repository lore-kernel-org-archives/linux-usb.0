Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786148;
	b=Hna3cR0anDyY1o4ostUvL/W6RBSzKZohgMaNO3hOTXLArYNGZPnTRelFUhFLQfFx3nMp
	 +aEqlbVteAol+tqOLpL9HZ2uhhUqkli6/eX9l8PN7jIxUgeizkoCnmO0KTMTocjZe4vJO
	 5se5kv2B8VcCtPOMOcWEh6sU4+zUIR4LygBjU9sjGPH2PjMSAoTepBp0WiqFdHMZrWDdy
	 Z3rkNas+iwdB7mFwSZzV5bU+EyNGlyk0FKJcnY98xawvNQC4CrD6t2eAMwdR+h7BfoEEd
	 rBoSXBhn9lIStltSEy4p6a+EWmrn246qKuDCMxKr9Xi9a98JYeyogppJxvRnpvMUJxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786148;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h+yzGuC6Ihy7a1o457kOxiREfUniP1MIz0K9bhQz6pQ=;
	b=O20SfVNfcpRwrSSQv1fuFe+i3fy5F1ZSkle+jZPuCImJoYlCh2RyuyCIhiq02d5uvmqE
	 Wn/1j0MFvi5Kf88mo7J1KuZSMbXuqS2cgc3jtNdOwAPIqx0BzRsfDzlv0C1W4MgqdtTO0
	 i3ZCRG/6dr92NJawqSjst7bAvAMLA7YDqYbOcnK9/gwyTbw1OFMvm8GIwzdW2Jj1jKC5b
	 gmRADyGx144gcUeWoxnngDTKgXE9QVMVw0MJJtZjSGf0/zPSKPe4MmHX+dnAPP7hjJ6xn
	 Phzl3TSaIdLnXXkqJIyAyJWz4dwCNSaNvJaqK6gbtFwUn10wiVh/TqGy8nLQL2elJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4862B606A31F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4862B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so5542661a91.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786147; x=1796390947;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+yzGuC6Ihy7a1o457kOxiREfUniP1MIz0K9bhQz6pQ=;
        b=Cm2bWUAENt1PtI8ZlqA3FkpjJ9iYjA58dfBKHm0svpFSNkIRWGwhygTCElbxV16gCI
         9sYTqPXaTP5XVpNRTVS68kTbVAE2Bj4Sxl3kow41zTRl6bTuGxSO5URzcK3ytF5wvCyB
         BwTnqWqHCH13zdIzaWowzOatMPJnqrSHAmPzfEiIGbb0+OHLZgBtvDFt+VRHZpaohhfi
         aj1C8zpnKAxNos3h/AVvM8o8+Hj3Gp/rMEW03honuoOSAAsUuyxADa0yhjAaT6Ccsvhd
         UqgS8FBv5K8Jwl8wwBk5M8eAwvKX0f1BE29iiIsOGAMqT0CAX5K8zENp0/la6O+ofzNQ
         pMsQ==
X-Forwarded-Encrypted: i=1; AL+hErHW9wNIjbn7/lzrc1SoYozuCosK5T9pWvlMu0fXf4VML0LnMU0AJ7lwiT2CmhqHg350OvUECN+begY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X8vplU9YydWX7NpBYmKxlxhrVqQp/bLzJikNyaQLfIVTdL1WK
	/IIS/SlerQo/hiCwrkuAUod1JViHl1pqIB6+HPo3GcwXtfunR1a/fyeUMIRy4vOwSz8zOg==
X-Gm-Gg: AZFdTZck49qAynptcdya5E4c8QBmpdZ/NTn/haVkrPCuLqb+GpmzpRYxjomjBaqn38Z
	9G407dlOJ2eG1lRM/FPS+40Oz3gRkyYy1s2nqRhSPuJH9AfpKZjwFXGwyAA8ch9gX6Tn1hZYYyC
	dCcTelShOOXFgMVH30ZGtUC1cqUY/tLuF5/5d/r4Sxhc+1gI1pnN2+K45Ol+kOSImfePyWTXYRn
	lL2/PH0g6e0fpsjiRm/3zVMNQaOxGSUvuiMf9LsfNcyuAerZYqoKiMLUA7MmK+c3ZD5bH0Otj0c
	Adghi0FVVTnPkyp4HIwxuVUhezAmwc/i31vuOsslBrZ3OYxKHcJ6eYrT7Y9f9J5P0mAz6tnbZaY
	1+GWBBrl1u+2yoqItsygltSY+TUXEp94RetRWs3r06s7JOSyAVjJMsTwOe8fXjbxS7ZYQ9QN9O3
	I6KWitT5mnb04+hy/VWxVl7KDmeLFczQ2dhupAcu3pm3L2hhuqWu/xtvi8L3T11/kbQhYJwEMxY
	v7XeJhHykLMqfJXSqAtHOFNXoqlEQHa69XiFgaLtdKqynf+8ZOVB9JfpZ6XHu2+YhO31f0QT3Rq
	OeQOOApun+4fHNUBybPhPtMc8Mh0XHiFycwV6Gcl6fcs9oSjdh2BBkDvlun3kjmPu9i0GQA7bqs
	j2OrKQWofnU27/KBCDrHe5biBQsMRcF+f+tiODNFOfpQa0A==
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr23555717a91.23.1795786146206;
        Fri, 27 Nov 2026 05:29:06 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm41143707a91.12.2026.11.27.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:29:05 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH v3 3/3] usb: core: Close residual anchor read-to-lock window with RCU
Date: Fri, 27 Nov 2026 21:29:03 +0800
Message-ID: <179578614314.44635.11154874108099670302@kylinos.cn>
In-Reply-To: <179578612505.44635.14553263875690325600@kylinos.cn>
References: <179578612505.44635.14553263875690325600@kylinos.cn>
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

However, waiting for an unconditional synchronize_rcu() on every
successful wait or drain would penalize runtime I/O paths that wait
on persistent or empty anchors without freeing them (such as
zd1211rw register write batches, ALSA stream stops or btusb traffic
stops), even though an uncontended unanchor already releases
anchor->lock before any waiter can observe the anchor empty.  A
grace period is only needed when a second thread actually raced on
urb->anchor and may still be inside the read-to-lock gap after
__usb_unanchor_urb() cleared urb->anchor.

Convert the anchor wakeup protocol into a contention-gated RCU
lifetime protocol:

 - Lockless unanchor readers (usb_unanchor_urb() and
   usb_unanchor_urb_and_suspend_wakeups()) register in
   urb->anchor_readers inside RCU read-side critical sections
   (ordered by smp_mb__after_atomic()) before dereferencing
   urb->anchor, and urb->anchor is published with
   rcu_assign_pointer().  Unanchored URBs take an early
   rcu_access_pointer() exit without touching the counter.

 - Under anchor->lock, __usb_unanchor_urb() clears urb->anchor,
   orders the clear against reading the remaining urb->anchor_readers
   count (dropping the caller's own reader count before
   usb_put_urb()), and only when another reader is still in flight
   snapshots get_state_synchronize_rcu() into anchor->rcu_gp_seq and
   sets anchor->need_rcu_gp.

 - Every function whose return lets the caller free the anchor --
   usb_wait_anchor_empty_timeout() on a non-zero return,
   usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() -- inspects anchor->need_rcu_gp under
   anchor->lock when observing the anchor unused, retiring the flag
   in place via poll_state_synchronize_rcu() if that grace period has
   already elapsed, and otherwise waits with cond_synchronize_rcu()
   after dropping the lock while touching nothing on the anchor
   afterwards.  Uncontended waits and drains pay zero grace periods.
   Provided the caller stops anchoring new URBs, any losing reader
   from a contended unanchor has released anchor->lock before the
   caller may free the anchor, and readers starting after the clear
   find urb->anchor =3D=3D NULL and never touch the anchor at all.  The
   license is per caller: another teardown call may still be sleeping
   on the anchor's wait queue, so a caller that frees on its own
   success must first let other in-flight teardown calls return.  And
   as with any wait on the anchor, these calls must not be made from
   the completion callback of a URB on the same anchor.

The empty-anchor retry of kill/poison/scuttle waits on the anchor's
wait queue instead of busy-waiting.  On !PREEMPT_RCU kernels whose
scheduler tick reports no quiescent state for a spinning process
context, a busy retry keeps this CPU from reporting a quiescent
state and stalls every grace period that still awaits this CPU's
quiescent state -- a concurrent teardown's grace-period exit
included -- and under real-time scheduling it can starve the very
completion path it is waiting for.  The retry keeps the re-drain
behavior of the busy loop it replaces: usb_anchor_urb() wakes the
anchor's wait queue (gated by waitqueue_active() under anchor->lock),
and the wait also ends -- without declaring the anchor unused --
when a URB is anchored after the drain, so the loop restarts and
tears the late arrival down too.

usb_wait_anchor_empty_timeout() keeps its documented contract and
remaining-jiffies return value on uncontended waits; when a
contended-unanchor grace period is pending, a successful wait --
including one with a zero timeout -- waits with
cond_synchronize_rcu(), may overrun the caller's timeout by up to
one grace period, and clamps its non-zero return to at least 1.

usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs() must be called from a context that can
sleep (all in-tree callers already do) and carry might_sleep() at
entry so atomic-context callers are caught even when no grace period
is needed.  No driver changes are required: struct urb gains a
usbcore-private reader counter (anchor_readers), and struct
usb_anchor records the conditional grace-period state (need_rcu_gp
and rcu_gp_seq).  Documentation/driver-api/usb/anchors.rst is
updated to match.

Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
Changes in v3:
- Gate the RCU grace period on actual unanchor contention via
  urb->anchor_readers + anchor->need_rcu_gp / get_state_synchronize_rcu()
  + cond_synchronize_rcu() instead of calling synchronize_rcu()
  unconditionally on every successful wait and drain, eliminating
  grace-period stalls on uncontended persistent or empty anchors (such
  as zd1211rw register write batches, hiface stream stops, usbtmc reads
  and btusb traffic stops) while preserving remaining-jiffies returns on
  uncontended usb_wait_anchor_empty_timeout() calls.
- Link to v2: https://lore.kernel.org/r/179577006613.23588.112030870054239391=
2@kylinos.cn

 Documentation/driver-api/usb/anchors.rst |  26 +-
 drivers/usb/core/urb.c                   | 439 ++++++++++++++++++++---
 include/linux/usb.h                      |  10 +-
 3 files changed, 411 insertions(+), 64 deletions(-)

diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-=
api/usb/anchors.rst
index 5a93d171e76c..68b6d966e38a 100644
--- a/Documentation/driver-api/usb/anchors.rst
+++ b/Documentation/driver-api/usb/anchors.rst
@@ -22,8 +22,16 @@ initialise the data structure.
 Deallocation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Once it has no more URBs associated with it, the anchor can be
-freed with normal memory management operations.
+Once it has no more URBs associated with it, and one of
+usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
+usb_poison_anchored_urbs() or usb_scuttle_anchored_urbs() has returned
+successfully, the anchor can be freed with normal memory management
+operations.  When a concurrent unanchor raced on one of the anchor's
+URBs, the successful return drains any lockless reader that may still
+hold the anchor pointer by waiting for an RCU grace period.  This holds
+only for the caller's own teardown: the caller must have stopped
+anchoring new URBs, and must not free the anchor while another call on
+it is still in flight.
=20
 Association and disassociation of URBs with anchors
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -48,14 +56,22 @@ This way no data can be reordered.
 :c:func:`usb_scuttle_anchored_urbs`
 -----------------------------------
=20
-All URBs of an anchor are unanchored en masse.
+All URBs of an anchor are unanchored en masse.  This function may
+sleep while draining in-flight givebacks or waiting for a contended
+unanchor's RCU grace period.
=20
 :c:func:`usb_wait_anchor_empty_timeout`
 ---------------------------------------
=20
 This function waits for all URBs associated with an anchor to finish
-or a timeout, whichever comes first. Its return value will tell you
-whether the timeout was reached.
+or a timeout, whichever comes first.  Its return value will tell you
+whether the timeout was reached (0 on timeout, remaining jiffies or 1
+if the anchor drained).  If a concurrent unanchor raced on the anchor,
+a successful wait -- even with a zero timeout -- waits for the
+corresponding RCU grace period before returning, so it may overrun the
+caller's timeout by up to one grace period; uncontended waits pay no
+grace period; this is what makes it safe for the caller to free the
+anchor on a non-zero return.
=20
 :c:func:`usb_anchor_empty`
 --------------------------
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 174dc42c95c1..b1085fc02e40 100644
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
@@ -149,28 +173,130 @@ static int __usb_anchor_check_wakeup(struct usb_anchor=
 *anchor)
 }
=20
 /*
- * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
- * meant for waiters which do not hold the lock: the critical section
- * serializes with the URB giveback path, so once the check succeeds no
- * giveback that has incremented suspend_wakeups will touch the anchor
- * anymore and the caller may free the memory holding the anchor.
+ * Called under anchor->lock right after __usb_anchor_check_wakeup()
+ * observes @anchor unused.  Only an anchor that experienced a contended
+ * unanchor (a second reader in flight on urb->anchor when
+ * __usb_unanchor_urb() cleared it) needs an RCU grace period before the
+ * caller may free @anchor: an uncontended unanchor releases anchor->lock
+ * before any waiter can observe @anchor unused and never touches @anchor
+ * afterwards.  Retire need_rcu_gp in place once the recorded grace
+ * period has elapsed so persistent anchors pay nothing thereafter and
+ * never carry a stale cookie across gp_seq wraparound.
+ */
+static bool __usb_anchor_prepare_rcu_gp(struct usb_anchor *anchor,
+					unsigned long *gp_seq)
+{
+	if (likely(!anchor->need_rcu_gp))
+		return false;
+
+	if (poll_state_synchronize_rcu(anchor->rcu_gp_seq)) {
+		anchor->need_rcu_gp =3D 0;
+		return false;
+	}
+
+	*gp_seq =3D anchor->rcu_gp_seq;
+	return true;
+}
+
+/*
+ * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock and
+ * snapshots any pending contended-unanchor grace-period cookie in the
+ * same critical section.  The check alone does not make freeing safe:
+ * when @need_gp is set, the caller must wait with
+ * cond_synchronize_rcu(@gp_seq) after dropping the lock, and must not
+ * anchor new URBs concurrently; see usb_wait_anchor_empty_timeout() for
+ * the full contract.
  */
-static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+static int usb_anchor_check_wakeup(struct usb_anchor *anchor,
+				   bool *need_gp, unsigned long *gp_seq)
 {
 	unsigned long flags;
 	int wakeup;
=20
 	spin_lock_irqsave(&anchor->lock, flags);
 	wakeup =3D __usb_anchor_check_wakeup(anchor);
+	if (wakeup)
+		*need_gp =3D __usb_anchor_prepare_rcu_gp(anchor, gp_seq);
 	spin_unlock_irqrestore(&anchor->lock, flags);
=20
 	return wakeup;
 }
=20
+/*
+ * Wait-condition helper for the teardown drain loops: the wait ends
+ * either with the anchor observed unused under anchor->lock (*unused
+ * is set, *need_gp and *gp_seq are captured, and the caller takes the
+ * conditional grace-period exit), or -- without that observation --
+ * when a URB was anchored after the drain, so the caller returns to
+ * the top of its loop and drains the late arrival.  usb_anchor_urb()
+ * wakes the anchor's wait queue for the second case, and the lockless
+ * list read is only a fast path: a stale non-empty entry merely
+ * restarts the drain, and a stale empty one is caught by the locked
+ * re-check below, so neither direction can lose the restart.
+ */
+static bool usb_anchor_teardown_progress(struct usb_anchor *anchor,
+					 bool *unused, bool *need_gp,
+					 unsigned long *gp_seq)
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
+		if (*unused)
+			*need_gp =3D __usb_anchor_prepare_rcu_gp(anchor, gp_seq);
+		ret =3D *unused;
+	}
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return ret;
+}
+
 /* Callers must hold anchor->lock */
-static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
+static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor,
+			       bool from_reader)
 {
-	urb->anchor =3D NULL;
+	int remaining;
+
+	rcu_assign_pointer(urb->anchor, NULL);
+	if (from_reader) {
+		/*
+		 * atomic_dec_return() implies full barriers on both
+		 * sides, pairing with smp_mb__after_atomic() after
+		 * atomic_inc(&urb->anchor_readers) on reader entry:
+		 * either a racing reader sees urb->anchor =3D=3D NULL and
+		 * never touches @anchor, or @remaining > 0 observes
+		 * that reader (which only decrements after acquiring
+		 * anchor->lock).  Drop our own reader count before
+		 * usb_put_urb() in case @anchor held the last @urb ref.
+		 */
+		remaining =3D atomic_dec_return(&urb->anchor_readers);
+	} else {
+		/*
+		 * Same store-to-load full barrier for unanchorers that
+		 * already hold anchor->lock without entering through
+		 * the lockless reader path (usb_get_from_anchor() and
+		 * usb_scuttle_anchored_urbs()).
+		 */
+		smp_mb();
+		remaining =3D atomic_read(&urb->anchor_readers);
+	}
+
+	if (unlikely(remaining > 0)) {
+		anchor->rcu_gp_seq =3D get_state_synchronize_rcu();
+		anchor->need_rcu_gp =3D 1;
+	}
+
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
 	if (__usb_anchor_check_wakeup(anchor))
@@ -191,19 +317,43 @@ void usb_unanchor_urb(struct urb *urb)
 	if (!urb)
 		return;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
+	if (!rcu_access_pointer(urb->anchor))
 		return;
=20
-	spin_lock_irqsave(&anchor->lock, flags);
 	/*
-	 * At this point, we could be competing with another thread which
-	 * has the same intention. To protect the urb from being unanchored
-	 * twice, only the winner of the race gets the job.
+	 * The anchor pointer is read locklessly: a concurrent unanchor
+	 * can empty the anchor and let a waiter return and free it
+	 * before this thread manages to acquire anchor->lock.  Register
+	 * in urb->anchor_readers inside an RCU read-side critical
+	 * section before dereferencing urb->anchor: if we win the
+	 * unanchor under anchor->lock with no other reader in flight,
+	 * no grace period is needed; if another thread unanchors @urb
+	 * first while we are in the read-to-lock gap, __usb_unanchor_urb()
+	 * sees our reader count and arms a conditional grace-period wait
+	 * on @anchor so its memory stays alive until we release
+	 * anchor->lock and rcu_read_unlock().
 	 */
-	if (likely(anchor =3D=3D urb->anchor))
-		__usb_unanchor_urb(urb, anchor);
-	spin_unlock_irqrestore(&anchor->lock, flags);
+	rcu_read_lock();
+	atomic_inc(&urb->anchor_readers);
+	/* Pairs with __usb_unanchor_urb(): order inc before urb->anchor load. */
+	smp_mb__after_atomic();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		/*
+		 * At this point, we could be competing with another thread
+		 * which has the same intention. To protect the urb from being
+		 * unanchored twice, only the winner of the race gets the job.
+		 */
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor)))
+			__usb_unanchor_urb(urb, anchor, true);
+		else
+			atomic_dec(&urb->anchor_readers);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	} else {
+		atomic_dec(&urb->anchor_readers);
+	}
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
@@ -227,6 +377,13 @@ EXPORT_SYMBOL_GPL(usb_unanchor_urb);
  * "@urb is on anchor->urb_list" are changed together only while
  * holding anchor->lock.
  *
+ * Like usb_unanchor_urb(), the initial urb->anchor read registers in
+ * urb->anchor_readers inside an RCU read-side critical section so a
+ * concurrent unanchor that wins the race arms a conditional grace
+ * period on @anchor before @anchor can be freed.  Anchoring new URBs
+ * concurrently would re-publish urb->anchor and is outside that
+ * teardown contract.
+ *
  * Return: the anchor, which the caller must later pass to
  * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
  * anymore (a concurrent unanchor won the race).
@@ -236,19 +393,29 @@ struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups=
(struct urb *urb)
 	struct usb_anchor *anchor;
 	unsigned long flags;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
+	if (!rcu_access_pointer(urb->anchor))
 		return NULL;
=20
-	spin_lock_irqsave(&anchor->lock, flags);
-	if (likely(anchor =3D=3D urb->anchor)) {
-		atomic_inc(&anchor->suspend_wakeups);
-		__usb_unanchor_urb(urb, anchor);
-		spin_unlock_irqrestore(&anchor->lock, flags);
+	rcu_read_lock();
+	atomic_inc(&urb->anchor_readers);
+	/* Pairs with __usb_unanchor_urb(): order inc before urb->anchor load. */
+	smp_mb__after_atomic();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor))) {
+			atomic_inc(&anchor->suspend_wakeups);
+			__usb_unanchor_urb(urb, anchor, true);
+			spin_unlock_irqrestore(&anchor->lock, flags);
+		} else {
+			atomic_dec(&urb->anchor_readers);
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			anchor =3D NULL;
+		}
 	} else {
-		spin_unlock_irqrestore(&anchor->lock, flags);
-		anchor =3D NULL;
+		atomic_dec(&urb->anchor_readers);
 	}
+	rcu_read_unlock();
=20
 	return anchor;
 }
@@ -882,15 +1049,31 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
  * with guarantee that no completer callbacks will take place from the
  * anchor after this function returns.
  *
+ * It is safe to free the anchor (or the structure embedding it) once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call (a kill, poison, scuttle or
+ * wait on the same anchor) is still in flight: such a call may be
+ * sleeping on the anchor's wait queue, which lives in the memory to
+ * be freed.  This function may sleep.
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
+	unsigned long gp_seq =3D 0;
+	bool need_gp =3D false;
 	struct urb *victim;
-	int surely_empty;
+	bool unused;
+
+	might_sleep();
=20
-	do {
+	for (;;) {
 		spin_lock_irq(&anchor->lock);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
@@ -903,11 +1086,50 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			need_gp =3D __usb_anchor_prepare_rcu_gp(anchor, &gp_seq);
+			spin_unlock_irq(&anchor->lock);
+			/*
+			 * If a contended unanchor left a lockless reader
+			 * between reading urb->anchor and acquiring
+			 * anchor->lock, wait until that grace period has
+			 * elapsed before returning; uncontended drains pay
+			 * no grace period.  Nothing in this path may touch
+			 * @anchor after unlocking above.
+			 */
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
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
+		 * change and take the same conditional grace-period
+		 * exit as above.  The wait also ends without an unused
+		 * observation when a URB is anchored after the drain,
+		 * so the loop restarts and kills it, like the busy
+		 * loop this replaced did.
+		 */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused,
+							&need_gp, &gp_seq));
+		if (unused) {
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
+			return;
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
=20
@@ -920,15 +1142,28 @@ EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
  * from the back of the queue. Newly added URBs will also be
  * poisoned
  *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call on the same anchor is still
+ * in flight.  This function may sleep.
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
+	unsigned long gp_seq =3D 0;
+	bool need_gp =3D false;
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
@@ -942,11 +1177,27 @@ void usb_poison_anchored_urbs(struct usb_anchor *ancho=
r)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			need_gp =3D __usb_anchor_prepare_rcu_gp(anchor, &gp_seq);
+			spin_unlock_irq(&anchor->lock);
+			/* Same conditional lifetime exit as usb_kill_anchored_urbs(). */
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
+			return;
+		}
=20
 		spin_unlock_irq(&anchor->lock);
-		cpu_relax();
-	} while (!surely_empty);
+		/* Same sleepable retry as usb_kill_anchored_urbs(). */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused,
+							&need_gp, &gp_seq));
+		if (unused) {
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
+			return;
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
=20
@@ -976,8 +1227,15 @@ EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
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
@@ -1016,29 +1274,60 @@ void usb_anchor_resume_wakeups(struct usb_anchor *anc=
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
- * Return: Non-zero if the anchor became unused. Zero on timeout.
+ * A non-zero return also makes it safe to free the anchor (or the
+ * structure embedding it), provided that no new URBs are anchored to
+ * it concurrently and no other teardown call on the same anchor is
+ * still in flight (it may be sleeping on the anchor's wait queue).
+ * This function may sleep; if a concurrent unanchor raced on @anchor,
+ * a successful wait -- even with a zero timeout -- waits for the
+ * corresponding RCU grace period before returning, whereas uncontended
+ * waits pay no grace period.  It must not be called from the completion
+ * callback of a URB on @anchor: the wait cannot end before the giveback
+ * releases its suspend_wakeups pin, which happens only after the
+ * callback returns.
+ *
+ * Return: Non-zero (remaining jiffies, or 1 if none remain) if the
+ * anchor became unused. Zero on timeout.
  */
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	unsigned long deadline =3D jiffies + msecs_to_jiffies(timeout);
+	unsigned long gp_seq =3D 0;
+	bool need_gp =3D false;
+	long ret;
+
 	/*
-	 * The condition must be evaluated under anchor->lock: when this
-	 * function returns non-zero, every URB giveback that has incremented
-	 * suspend_wakeups has finished with the anchor, so the caller may
-	 * free the anchor, which is typically embedded in the driver's
-	 * private structure.  A zero return (timeout) means a giveback may
-	 * still be in flight and gives no such guarantee.
+	 * The condition is evaluated under anchor->lock.  When this
+	 * function returns non-zero, every URB giveback that has
+	 * incremented suspend_wakeups has finished with the anchor and
+	 * any lockless reader left in flight by a contended unanchor is
+	 * flushed by cond_synchronize_rcu() below, so the caller may
+	 * free the anchor -- provided that no new URBs are anchored
+	 * concurrently -- which is typically embedded in the driver's
+	 * private structure.  A zero return (timeout) means a giveback
+	 * may still be in flight and gives no such guarantee.
 	 */
-	return wait_event_timeout(anchor->wait,
-				  usb_anchor_check_wakeup(anchor),
-				  msecs_to_jiffies(timeout));
+	ret =3D wait_event_timeout(anchor->wait,
+				 usb_anchor_check_wakeup(anchor, &need_gp,
+							 &gp_seq),
+				 msecs_to_jiffies(timeout));
+	if (!ret)
+		return 0;
+
+	if (unlikely(need_gp)) {
+		cond_synchronize_rcu(gp_seq);
+		ret =3D max_t(long, (long)(deadline - jiffies), 1);
+	}
+
+	return min_t(long, ret, INT_MAX);
 }
 EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
=20
@@ -1049,6 +1338,11 @@ EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
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
@@ -1062,7 +1356,7 @@ struct urb *usb_get_from_anchor(struct usb_anchor *anch=
or)
 		victim =3D list_entry(anchor->urb_list.next, struct urb,
 				    anchor_list);
 		usb_get_urb(victim);
-		__usb_unanchor_urb(victim, anchor);
+		__usb_unanchor_urb(victim, anchor, false);
 	} else {
 		victim =3D NULL;
 	}
@@ -1078,25 +1372,54 @@ EXPORT_SYMBOL_GPL(usb_get_from_anchor);
  * @anchor: the anchor whose urbs you want to unanchor
  *
  * use this to get rid of all an anchor's urbs
+ *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently and no other teardown call on the same anchor is still
+ * in flight.  This function may sleep.
+ *
+ * Like usb_kill_anchored_urbs(), it must not be called from the
+ * completion callback of a URB on @anchor: the drain would wait for
+ * the pin its own giveback holds.
  */
 void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 {
+	unsigned long gp_seq =3D 0;
+	bool need_gp =3D false;
 	struct urb *victim;
 	unsigned long flags;
-	int surely_empty;
+	bool unused;
+
+	might_sleep();
=20
-	do {
+	for (;;) {
 		spin_lock_irqsave(&anchor->lock, flags);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
 					    struct urb, anchor_list);
-			__usb_unanchor_urb(victim, anchor);
+			__usb_unanchor_urb(victim, anchor, false);
+		}
+
+		if (__usb_anchor_check_wakeup(anchor)) {
+			need_gp =3D __usb_anchor_prepare_rcu_gp(anchor, &gp_seq);
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			/* Same conditional lifetime exit as usb_kill_anchored_urbs(). */
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
+			return;
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irqrestore(&anchor->lock, flags);
-		cpu_relax();
-	} while (!surely_empty);
+		/* Same sleepable retry as usb_kill_anchored_urbs(). */
+		wait_event(anchor->wait,
+			   usb_anchor_teardown_progress(anchor, &unused,
+							&need_gp, &gp_seq));
+		if (unused) {
+			if (unlikely(need_gp))
+				cond_synchronize_rcu(gp_seq);
+			return;
+		}
+	}
 }
=20
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
@@ -1105,6 +1428,8 @@ EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
  * usb_anchor_empty - is an anchor empty
  * @anchor: the anchor you want to query
  *
+ * This is an unsynchronized peek; it gives no lifetime guarantee.
+ *
  * Return: 1 if the anchor has no urbs associated with it.
  */
 int usb_anchor_empty(struct usb_anchor *anchor)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..c84a0791f199 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1431,6 +1431,8 @@ struct usb_anchor {
 	spinlock_t lock;
 	atomic_t suspend_wakeups;
 	unsigned int poisoned:1;
+	unsigned int need_rcu_gp:1;
+	unsigned long rcu_gp_seq;
 };
=20
 static inline void init_usb_anchor(struct usb_anchor *anchor)
@@ -1447,7 +1449,10 @@ typedef void (*usb_complete_t)(struct urb *);
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
@@ -1642,12 +1647,13 @@ struct urb {
 	void *hcpriv;			/* private data for host controller */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
+	atomic_t anchor_readers;	/* lockless urb->anchor readers */
=20
 	/* public: documented fields in the urb that can be used by drivers */
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

