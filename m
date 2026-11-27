Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770080;
	b=w0oohxmqvrhliJWNE5Sw65XHXU0v9bZQfEZCPGPRv7ew/yZPgjXDIQkvbC8f363zHgtt
	 ZMUm9WxDgC5pAMXf2hAQTU9RP3q9Sq+F78F1U9/zr5Cb0riM0UMBQSNEP/PgsxaImrnCl
	 uMEc8nlwlQDGk3WQUrMvIxADt5hiewo9NPy4Tjli2ckmb0AYSrRHowHLiPRRaGhbsgEZ4
	 +hcm8vDmxJJSycMc2dJfWqUrGm6OOvC2Ou3dwflkOcpOmHDjpjDfK6POU9ujyPD3G2tEk
	 0/Y7bMbPJ5qMkqX97H82LZbxkJz0V7PVs5ptbf2dzjJX5pi8nXhXh30gZr+zyre4nvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770080;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/+WYvR/9EaXmxOqqFc/IFig4eapx8xrmhOZ5R/PhDkc=;
	b=firi3xvG0ob/xyLfnePwee9gAXJCagOBR3m04UXxPla6zqotF+msRyFOglJe7dMHM2kU
	 mQ19k9FtjQyc+I6HvlNhmWntYgSAeIx33MT5Pyj7qBSSf7+q7aalLHLyTMQdck0LB3U7w
	 Ec0bIqEPIAU4vefWjgUxayZZz6UjLB42FgKo1uIc+W0QaLiqoKw7mfykMWSiw1REH5u+u
	 Emnztjjq7ZDQmBdMkIAWFM9u3aVSio0NXmNnNjY/uAavfJhBDqVArI0jkz2MjJFLpgTVH
	 +jldDDIaNzMQxkeYeRIKjgl/tCVkNveVBQKfG6FTSpyjZ6qbS3QaLrg/tIzQNi/OqtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB2606A32D
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADAB2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f03920c477so65854825ad.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770070; x=1796374870;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+WYvR/9EaXmxOqqFc/IFig4eapx8xrmhOZ5R/PhDkc=;
        b=e3jcG4VAZBJwlmuybvlABwn5hlCGEuMNXlheXsroDcAXEggUwQMsJf+qpfysxBb2PW
         sqNGPE9+lmQUl9nMUlMjhl348414xd/jolzazyfXap1VIeb1Byxa/ItRTESgc98IvrMU
         PChghpFpUmoI3z4gERUtLu6pvhzHHAxeUdb31tZ1AbA2vj7K+9Yy+lO7RuhEZH0ZaB84
         h73sNYwgNjsBoM6CMWRSAGzcgb8eNKnJ5fky/+E9UMC2Y4kdalrsScEiN+k4BQTItNSM
         8vKR5jdYqBkar1eWov1lLOma+aaCJHQq5hj15p4z/39kyrJGXvgyKaC7LpCU8RQVC68O
         46lg==
X-Forwarded-Encrypted: i=1; AL+hErF7mLTvfRzt6sxpx5jQCr/rlEkCT5Tismnz2LiCOVp3IrSL6wvFsOUS4mSPGsU/4HfNzAdBSxdrj5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pimSG/7fFiTlFps+BbQkJVwI8nDVeiCLAVUHwWP7ljnDfw7jx
	MDEhTF/n365aSPLFqjy3btvnsXcFa8vAhawCBXVzOS/GzNnsWnT28ZIu
X-Gm-Gg: AZFdTZcQTTRz1e0p9tvQg9tBBR1EuR3Kb3FUK4BDyFmfkSa3rTLrWV4wyuuAth7ZRKi
	YEYOzUii+gTfjb6lM8Od/vDeELTlWseGpYVwC0y8dxuVhUUFk/w9FOYDI769Blw0T6x2n+1Qylu
	yLcJn1sP89V3YgFZPh7uXd76FDC06UTTgaBsZGgtSLcuDc1F5VJM7pNDQD7wawLt6wFTVUjUX7y
	H3AptClga4UQrFH8InN5+Rn5JxeTCz1t6je5+Fv/Kr4DVF/MQrLvVMLdTl226NYaMel51q7lIzG
	qYGNIKC9cLcJbqVog3LS9oDYiv6qrIXrxdOMUadgFT4z97x+HTC/u3DSXV/ChRL0ovg5EcX2f8h
	7g+IVt72k6M9JKgTRPsbDCPNbsE7MoWQikdb7en7GfL16odIh6KhOG3FCiLS3LlvntE7A1Rg4K/
	hgnpddKI3fmclGbYyyPgPhBppayppTKJJamNTp0pcx1CoHFWh7oPsbFy5rzVFrfK1g1HK4b2Qyu
	+ZcGYzAVXaTUOt3BAQQ/b56mfiR5jkiSnbGoIynopQm5GmvZiTJ2EyBfeZhrb63C6Xj8xx6E/vW
	v3E4UmGdguI4++Tyg3S3vxV8kvbQCMgGCP2x+xTodgt5qfsrdDVm5JER8FMMdVfgVRi+dUatvo7
	om2wkY0ruKWg4Zv4pCHy9vl2fzSweP3TjymrdwW+pVlnBoA==
X-Received: by 2002:a17:903:1a2b:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2f03f1403acmr262673985ad.30.1795770069602;
        Fri, 27 Nov 2026 01:01:09 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:01:09 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 0/3] usb: core: fix three use-after-free windows in
 the USB anchor protocol
Date: Fri, 27 Nov 2026 17:01:06 +0800
Message-ID: <179577006613.23588.1120308700542393912@kylinos.cn>
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

Anchors are usually embedded in driver-private structures, and
several anchor API returns -- a non-zero
usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
usb_poison_anchored_urbs() and usb_scuttle_anchored_urbs() --
license the caller to free that memory.  The wakeup protocol backing
this license has three windows in which a URB giveback or unanchor
still touches the anchor after the caller has been told it is
unused:

 1. The waiter's condition check and the giveback's
    suspend_wakeups decrement plus wake_up() were not serialized,
    so the waiter could return while a giveback was still in
    flight.  Reported by syzbot repeatedly since 2019; patch 1
    references the two reports this analysis is built on.

 2. __usb_hcd_giveback_urb() captured urb->anchor at the top of
    the function but incremented suspend_wakeups only after DMA
    unmapping and the usbmon hooks.  A concurrent unanchor could
    empty the anchor with suspend_wakeups still zero, so the waiter
    returned and freed the anchor underneath the pending increment.
    No syzbot report is attributed to this interleaving; it was
    found by extending the analysis of patch 1.

 3. usb_unanchor_urb() and the giveback read urb->anchor and only
    then acquire anchor->lock; between the two the anchor can
    already have been freed.  The gap is as old as
    usb_unanchor_urb() itself and cannot be closed with a
    reference count: the first dereference of the freshly read
    pointer would have to be the increment itself.

Patch 1 completes the locking protocol for the waiter/wakeup side.
Patch 2 folds the giveback's pointer capture, the increment and the
unanchor into a single anchor->lock critical section.  Patch 3
turns the wakeup protocol into a lifetime protocol: the lockless
anchor reads run in RCU read-side critical sections, urb->anchor is
published with rcu_assign_pointer(), and every return that lets the
caller free the anchor first waits one synchronize_rcu() and
touches nothing on the anchor after it.

Patch 3 changes contracts, stated up front:

 - usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() may now sleep even on an empty
   anchor: the empty-anchor retry blocks on the anchor's wait queue
   instead of busy-waiting.  usb_scuttle_anchored_urbs() is the
   only contract change among the three (the others already slept
   transitively through usb_kill_urb()/usb_poison_urb()), and all
   three carry a might_sleep() so an atomic-context caller is
   caught at the call site with debugging configurations enabled.
   All in-tree callers already sleep.

 - usb_wait_anchor_empty_timeout() returns 1 on success instead of
   the remaining jiffies, and a successful wait -- including one
   with a zero timeout -- pays one RCU grace period.  The condition
   itself is unchanged from the wakeup-protocol fix.

 - The safe-to-free license is per caller: a caller that frees on
   its own successful return must first wait for any other
   in-flight teardown calls to return.  The kerneldoc of all four
   teardown returns states this proviso alongside the no-new-URBs
   one.

 - The cost is one grace period per successful teardown exit.  On
   x86-64 real hardware, 100 consecutive successful waits on an
   empty anchor cost 3.8 us per call on the base kernel and 3.9 us
   with this series (+4.3%); per call site, a usbtmc synchronous
   read converges on a kill and a scuttle and pays two grace
   periods, btusb pays one per anchor it stops, and zd1211rw one
   per command batch.  It is small next to the URB I/O these paths
   bracket, but it is the price of the free-after-return guarantee.

Why the retry loop must not busy-wait: on !PREEMPT_RCU kernels
whose scheduler tick reports no quiescent state for a spinning
process context (the v6.6 stable tree, for one; the 7.3 base of
this series adds process context only with CONFIG_PREEMPT_COUNT),
a busy retry stalls every grace period that still awaits that
CPU's quiescent state for as long as it spins, and under real-time
scheduling it can starve the very completion path it is waiting
for.  On PREEMPT_RCU builds the tick reports from process context
and the window self-heals, which is why the v1 test kernels never
showed it.  Current mainline x86 can no longer build a !PREEMPT_RCU
kernel at all (since 7dadeaa6e851); the exposure is the stable
backports of this series and older kernels.

The sleeping retry keeps the re-drain behavior of the busy loop it
replaces: usb_anchor_urb() wakes the anchor's wait queue (gated by
waitqueue_active(), so the per-submission hot path stays off the
wakeup machinery when no drain is sleeping; both the wakeup and the
sleepers' condition evaluation run under anchor->lock, so the gate
cannot lose a wakeup), and the wait also ends -- without declaring
the anchor unused -- when a URB is anchored after the drain, so the
drain restarts and tears the late arrival down too.  A
late-anchored URB cannot strand the teardown.

No fields are added to struct usb_anchor or struct urb, and no
driver changes are needed.

Testing:

 - A QEMU/KASAN attack harness reproduced each window separately
   (deterministic arming for the two giveback windows, a forced
   free inside the read-to-lock gap for the third) and verified
   that each patch closes its own window with zero reports under
   identical pressure.  The v2 kernel reruns the full matrix with
   zero reports and keeps the zero-timeout contract (empty anchor,
   timeout 0, returns 1).

 - The livelock boundary is driven directly: a waiter thread bound
   to CPU0 calls usb_wait_anchor_empty_timeout() on a shared anchor
   while a killer thread bound to CPU1 calls
   usb_kill_anchored_urbs(), round after round, on v6.6 (the
   stable-backport representative, where PREEMPT_NONE x86 is still
   selectable) with PREEMPT_NONE and no PREEMPT_DYNAMIC.  The v1
   kernel wedges in the first waiter-first round -- kill rounds
   stop completing and RCU stall warnings follow -- while the v2
   kernel completes every round; both complete every round on
   preemptible configs.

 - The late-anchor liveness of the sleeping retry is probed
   directly: a scuttle thread is parked in the empty-anchor wait
   behind a manual suspend_wakeups pin, a never-submitted URB is
   anchored after it sleeps, and the pin is dropped.  The
   intermediate v2 kernel (before the re-drain fix) never returns,
   while the final v2 kernel wakes, drains the late arrival and
   returns.

 - The full stack also ran on real x86-64 hardware with KASAN
   kernels built from the same base, on two machines.  The base
   kernel hits every probe: both deterministic windows fire within
   100 iterations (hundreds of probe arm hits), and the natural
   free-race variants hit within 2000 iterations with zero window
   widening -- one of them with no arming at all on the second
   machine.  The kernel with all three patches runs the identical
   workload with zero reports (the attack still executes there,
   its probes arm hundreds of times too, only the windows are
   gone), and completes the kill-in-parallel-with-wait rounds
   (10/10) and the loser-path late-anchored-URB drain on real
   hardware as well.

checkpatch: 0 errors, 0 warnings for all three patches.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---

RESEND note:

 - Resending v2 (originally posted on Nov 3 during the 7.4 merge window:
   https://lore.kernel.org/r/179367244039.76534.2082245841677015355@kylinos.c=
n)
   as a standalone thread, rebased onto v7.4-rc3 to resolve a context
   conflict with commit d58dffe9ee2c ("USB: core: amend
   usb_get_from_anchor() kernel-doc") with no code changes.  Alan,
   Oliver -- could you please take a look at the anchor locking and RCU
   lifetime changes when you have a chance?

Changes in v2 (patches 2 and 3; patch 1 is unchanged):

 - Patch 2's usb_unanchor_urb_and_suspend_wakeups() race-loser
   path cleared the local anchor variable before the shared
   unlock, so the documented lose-the-race return unlocked
   &NULL->lock -- a near-NULL fault with the real anchor left
   locked.  v2 unlocks, in each branch, the anchor that branch
   locked.  (Found by our own review of the v1 series.)

 - The kill/poison/scuttle empty-anchor retry waits on the
   anchor's wait queue and takes the same grace-period exit as
   usb_wait_anchor_empty_timeout() instead of busy-waiting,
   removing the self-deadlocking busy loop on !PREEMPT_RCU
   kernels (review feedback on v1).

 - The retry keeps the re-drain behavior of the busy loop:
   usb_anchor_urb() wakes the anchor's wait queue and the
   teardown wait ends on a late-anchored URB, so the drain
   restarts for it instead of stranding a teardown that would
   previously have killed it (review feedback on the v2 draft).
   The wake is gated by waitqueue_active() so the per-submission
   hot path stays off the wakeup machinery when no drain is
   sleeping.

 - The teardown functions no longer take suspend_wakeups pins of
   their own: the pins of an earlier v2 draft let a concurrent
   kill/poison/scuttle make a zero- or short-timeout wait on an
   empty anchor spuriously return 0 (review feedback on v1).  The
   wait condition is again the giveback-only check, each teardown
   exit waits its one grace period and touches nothing after it,
   and concurrent teardown calls remain governed by the per-caller
   proviso, as in the baseline.

 - The safe-to-free kerneldoc of the four teardown returns now
   also excludes concurrent in-flight teardown calls on the same
   anchor, states the completion-callback recursion ban, and
   notes that a manually held suspend_wakeups pin holds up a
   teardown until released; kill/poison/scuttle carry
   might_sleep() (for kill and poison it covers the empty-anchor
   entry path); in-code comments spell out that
   usb_anchor_check_wakeup()'s success does not by itself license
   freeing, and why the waitqueue_active() gate is safe under
   anchor->lock.

 - The anchor documentation now matches the new contract: the
   deallocation section of
   Documentation/driver-api/usb/anchors.rst states that freeing
   requires a successful teardown return with no concurrent
   anchoring or in-flight teardown, and the wait section
   describes the 0/1 return values and the one-grace-period
   overrun.

 - Cover letter: per-call-site grace-period cost enumeration, the
   livelock test evidence, and the two-machine real-hardware
   results.

 Documentation/driver-api/usb/anchors.rst |  23 +-
 drivers/usb/core/hcd.c                   |  10 +-
 drivers/usb/core/urb.c                   | 388 ++++++++++++++++++++++++++++-=
--
 drivers/usb/core/usb.h                   |   1 +
 include/linux/usb.h                      |   7 +-
 5 files changed, 382 insertions(+), 47 deletions(-)

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--=20
2.39.5 (Apple Git-150)
