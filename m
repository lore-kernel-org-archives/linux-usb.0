Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435BE3B42F2
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495225; cv=none; b=NT9lyV4gRovm3IO/WVafqNnEu7/NFp5qNeTGmgSSLMU/rcK+AFNjVp0OKVALuZw4nFHcgAJqAKdKllDBg6ejLY/DIz+m9Debt446MSqIogH+qbliVeLzfIiyBPrW5nH8/mGk1VYNI5eEY5glwHGkElJeVg/tnw5Opv+E0RwXB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495225; c=relaxed/simple;
	bh=Q+1O3tRDfbn/86U7C5mg+qTtPjxf7jG1gT/xqt4SFEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmygh8sPjJ/+yMm93Rxz9CYwLg4Upbo329qOsiDKABj+rG4lY4dAQ27yT4dLjmAZ37BOYiLpqciJiQheZ9iupRpd9/zTwpw5SXSULrtme9gdAFrpB2W2/3S4WWOHCJ9m8/ccBwLBLD/JbS5ubYgngEBq28r8M3DItXwnolYl+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ7gpn6g; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ7gpn6g"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-919abb3335fso15249776d6.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791495221; x=1792100021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5sZmbVXx25gBaCh/VEfL3wZ4pRH9BSl85pkkgIKJEo=;
        b=GJ7gpn6gDSgA5SxU6ovyBx3YBpUDUqHhYZfkmk0vAvb+Z0JesZ0gKGG33ncMl5nrDG
         fdUN3n1qOEuDzECv+rMooEmVs7nCMmcIVdREb5ecQsKqo9QZZiyQyRjuuAEz7pJh3y+W
         sy+R1OEy4baTHJmCrAy2R6h5YE6LRnYMeFPmuUhghOkGFszQ2vkkz500MrqUyaufgjOH
         V3b2PAMhHcTH/7HBYrJW0XJxLmMe9b8vuM6MhpAyIVt2XthRrCy8TzZrRjid++Oa1Nl9
         WCjNE//Kb3kUKsIGeicqNf+viakxqI1P6SetN9XcCrNXTdE7RipG+tQtoM3iDEpLechp
         cTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495221; x=1792100021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5sZmbVXx25gBaCh/VEfL3wZ4pRH9BSl85pkkgIKJEo=;
        b=pnl1vnyiQjM8R4ZWwvnhjr84WSqvRTyTa69VGXGC5FYh+HUpFUYY3/cnhNegnK3887
         FHaFs9QsEdMwgTLfYNFLe37yXoE8V2+xQ36T16kyQa1XF7+iG48elYSId5MRgWgoV5Gd
         /b1pmCQYSK4KxcG9O+7djExxHL5d/FVEwtF7cUiIAe0WAYM2AYdK1SBcUMB96LAkQEbQ
         ZN6yf460F4YYg1Xwaj3urN2fWfzF4W+0Dx2BM+S8L9H79DBxor7sN5XXQhDSJ+3YxUcv
         CUmMNkYrQtxEpbzoi/RGiMDgawP3R0y8EbzGMbzsSaHZ+pnadYERfIDg8vAl5kFzKqwb
         VVfw==
X-Gm-Message-State: AFuF++l+YT3IX+w5Z8qe9lhlsHWWtubxFR3DLxJwg4bAMwVp8lr08CFC
	SMYYhBe1qSoW8wGIykHgRKf3g4eRUetkFnxJyFWWsKz3heL5I5qHnd30
X-Gm-Gg: AYBFou3DkHZabgCr0hgaK9kVSXyM4KcXwtq1m55+om2SyRcSzM84U0OICKH8/h7vkRY
	hcng97VhmQgqggsyAYZX9H6bjwo2RRt6wHl85jEA0tXGW/sS878vtlHYob6eHk4Q6G9K61Ozz9K
	DK5NMxVOlpXv8NtsBg3CQ0TW1cLF/Y+vlQEYqs9xjrBnOAicHDwCw8cjpUNfZv5pUniTep1rnXd
	tHzU0M71dYB6CJRpVDwp1RuWh+a6HH8ttijrEYvbx2+P8duTcvGc5DOFwMZ0ZIQV1QnvZPdEfdf
	MhxLwuIhlxOwkyJCTcTQYrJKVnCGw97M9oovtEnRInsC3I/hyc5xpVB48C3dN6xt4n/oU8XXiO0
	N7fiHuHKNLCfbeNQa/fxcg3tFEhcxVyOhveWGoJi9PjYWYyLihC6dPDuHt9wxDxntrOAIemz00E
	nRvL/6Mh5IAILro/flRbgd6pgNlKjtc8tw5f5LYRamKU3ZDrGSlBAK15IUc5i6aY94KjQy1zpup
	dcr0/QzswbMo86gXAU1ab23rCu+CJtpBhFVAOqf6ZWwp8fX7RRlyNeMOxWGG5r1NWyOvSKOC8ZL
	2cgyzVqd1jBXMxEbbMrY2F1uicRZnq8nDRKntDc9IVqtyk9Tbaq6HCyUqFUpEPArPMFiIfbRWdH
	8/d3fPvg3X/gO6s+LmITpNWP/u1NuEQOd+ZrwH7hjBcp1KvnfHMwhPSd0T0zFqNMzeo5xu63ntb
	RzIXMEChqf7b1rh9NZuWfTPK72ztng
X-Received: by 2002:a05:620a:808c:b0:93c:7e9c:3bba with SMTP id af79cd13be357-93eb9688d40mr83613085a.41.1791495221069;
        Thu, 08 Oct 2026 14:33:41 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98861bdsm29484885a.24.2026.10.08.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:33:40 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: sashiko-bot@kernel.org
Cc: linux-usb@vger.kernel.org,
	mohsafer@gmail.com,
	sashiko-reviews@lists.linux.dev,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] driver core: complete deferred binds when drivers_autoprobe is off
Date: Thu,  8 Oct 2026 16:33:20 -0500
Message-Id: <20261008213320.268141-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-164361@kernel.org>
References: <sashiko-outbox-164361@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Mosafer <mohsafer@gmail.com>

device_add() registers a device and then runs the bus's initial probe
via bus_probe_device() -> device_initial_probe().  With
drivers_autoprobe disabled for the bus, device_initial_probe() skipped
__device_attach() entirely.

That is correct for automatic *matching* against the bus's driver list,
but __device_attach() also doubles as "complete a bind that a driver
already initiated": when dev->driver has been pre-assigned outside the
normal match/probe path, it finishes the bind by calling
device_bind_driver() under the device lock, bypassing probe().

With autoprobe off, that second duty was skipped too.  USB depends on
it: usb_driver_claim_interface() pre-sets dev->driver on an interface
that is not yet registered, documenting "let the future device_add()
bind it, bypassing probe()".  Composite drivers (cdc-acm, cdc_ncm,
cdc_mbim, ...) rely on it to bind their sibling data interfaces.  If
drivers_autoprobe is written with 0 while such an interface is between
the claim and its device_add(), the interface ends up registered, with
dev->driver set and iface->condition == USB_INTERFACE_BOUND, but never
bound: its knode_driver is never attached to the driver's
klist_devices.

Teardown then trusts those flags: usb_driver_release_interface() ->
device_release_driver() -> __device_release_driver() runs a full
release and calls klist_remove(&dev->p->knode_driver) on a
never-attached node whose knode_klist() is NULL, which klist_put()
dereferences:

  Oops: general protection fault
  KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
  klist_put <- klist_remove <- device_release_driver_internal <-
  usb_driver_release_interface <- acm_disconnect / cdc_ncm_unbind

Keep device_initial_probe() always calling __device_attach(), but pass
whether automatic matching is allowed (sp->drivers_autoprobe) down to
it, and evaluate that flag inside __device_attach() under the device
lock, where dev->driver is read anyway:  a device with a pre-assigned
driver completes its bind regardless of autoprobe, and only a device
without one is subject to the matching policy.  Evaluating the two
conditions inside the locked branch (rather than as
"autoprobe || dev->driver" in the caller) also closes a TOCTOU: a
concurrent detach can no longer turn the completion of a pre-assigned
bind into bus-wide matching behind an "autoprobe off" policy.

Other subsystems that preset dev->driver before device_add() (w1,
tegra xusb, zynqmp-ipi-mailbox) get the same correctness back; for
devices with no pre-assigned driver and autoprobe off, behavior is
unchanged.

Reproduced with syzkaller's C reproducer on a 7.3.0-rc6 tree:
instrumentation shows the doomed interface's device_add() racing an
autoprobe=0 write; the bind-completion branch never runs for it; later
teardown hits klist_remove() with a pristine node.  With this patch the
same instrumented race completes the bind inside the window (3 VMs,
5 min per run: window hit 3 times, bind completed 3 times, and 802
devices with no pre-assigned driver correctly skipped matching despite
__device_attach() now always running): zero KLIST-REMOVE-BAD, zero
Oops.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

---

Thanks for the review. The TOCTOU is real: v1 evaluated
"sp->drivers_autoprobe || dev->driver" in device_initial_probe() without
device_lock held, so a concurrent detach in that window could make
__device_attach() observe dev->driver == NULL under the lock and fall
through to bus_for_each_drv() - a bus-wide match despite the
drivers_autoprobe=0 policy.

Changes since v1:
  - Move the decision into __device_attach(): it gains an allow_match
    argument (device_initial_probe() passes sp->drivers_autoprobe,
    device_attach() passes true) and evaluates it inside the locked
    if/else chain: a pre-assigned dev->driver completes its bind
    regardless of autoprobe; the bus_for_each_drv() matching branch only
    runs when matching is allowed or requested.  dev->driver is now read
    exactly once, under device_lock, so a concurrent detach can neither
    bypass the bind completion nor turn it into a spurious autoprobe.
  - The crash fix itself is untouched code: the else-if branch that
    completes the pre-assigned bind is identical to v1 / to the
    autoprobe-on path; only its reachability changed.

Re-verified with the same instrumented race (3 VMs, 5 min): window hit
3 times (DATT match=0 drv=1 bound=0), bind completed all 3 (DD-BIND,
teardown attached=1), and 802 devices with no pre-assigned driver under
match=0 returned without touching bus_for_each_drv(); zero
KLIST-REMOVE-BAD, zero Oops.

v1:     https://lore.kernel.org/all/20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us/
review: https://lore.kernel.org/all/sashiko-outbox-164361@kernel.org/

 drivers/base/dd.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..4c1bb1979519 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1065,7 +1065,8 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 	put_device(dev);
 }
 
-static int __device_attach(struct device *dev, bool allow_async)
+static int __device_attach(struct device *dev, bool allow_async,
+			   bool allow_match)
 {
 	int ret = 0;
 	bool async = false;
@@ -1085,6 +1086,17 @@ static int __device_attach(struct device *dev, bool allow_async)
 			device_set_driver(dev, NULL);
 			ret = 0;
 		}
+	} else if (!allow_match) {
+		/*
+		 * Automatic driver matching is suppressed for this device
+		 * (drivers_autoprobe is off), and no driver has been
+		 * assigned to it: do not run bus_for_each_drv() matching
+		 * for it.  Deciding this here, under device_lock, means a
+		 * concurrent driver detach between the caller picking
+		 * allow_match=false and reaching here cannot turn the
+		 * completion of a pre-assigned bind into bus-wide matching.
+		 */
+		goto out_unlock;
 	} else {
 		struct device_attach_data data = {
 			.dev = dev,
@@ -1138,7 +1150,7 @@ static int __device_attach(struct device *dev, bool allow_async)
  */
 int device_attach(struct device *dev)
 {
-	return __device_attach(dev, false);
+	return __device_attach(dev, false, true);
 }
 EXPORT_SYMBOL_GPL(device_attach);
 
@@ -1149,8 +1161,18 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
-		__device_attach(dev, true);
+	/*
+	 * Always run the attach, but tell it whether automatic matching is
+	 * allowed.  Completing a bind that a driver already initiated (e.g.
+	 * usb_driver_claim_interface() pre-setting dev->driver for an
+	 * unregistered interface, expecting device_add() to bind it) is not
+	 * automatic matching and must happen even with drivers_autoprobe
+	 * off; matching is evaluated in __device_attach() under the device
+	 * lock.  Skipping the call entirely used to leave such devices
+	 * registered-but-unbound, and teardown then oopsed klist_removing
+	 * the never-attached knode_driver.
+	 */
+	__device_attach(dev, true, sp->drivers_autoprobe);
 
 	subsys_put(sp);
 }
-- 
2.34.1

