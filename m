Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C136308E
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586877; cv=none; b=soxnMLmG/Gq5bqlzlUgo1iX1yf4NpbSUwwXIdx1By9aDn5BqA7Jcwmllv2XTPBfnfW7Ajeo+hens8e/0dpjkc7ypHqzzlKQXoFPFBkYbNz2rXDq3ERFT5EJgr3OHkz3R/mK9CFOBq8usqVs440Vn+GLwyJWYs7h54W/GtQAE1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586877; c=relaxed/simple;
	bh=r3g0uR7K178jsk4j3C4NhnNL/PI9NLzvqlW704uPqT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ptGrmFEFghQGl6SWEXYLMnlgsHT7Rw/GcWKM8TJVddzBvWMAVXLcM0vgKsgrr0k5TUkqzqNhhhGV2bPdanijLWlnwUhIyAUaTOImpD0rDUJsjDmVk9izSmrV1LAE1ZYcFM/iul9pqWELg9PpIPV1Z2ckNQSUwC2ydor6ZzKMokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=svKyjy29; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="svKyjy29"
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:41e:0:640:522e:0])
	by forward502d.mail.yandex.net (postfix) with ESMTPS id 7452CC5AC8;
	Mon, 24 Aug 2026 18:54:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp) with ESMTPSA id SsdwsFieMCg0-EjaSrZw4;
	Mon, 24 Aug 2026 18:54:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787586869; bh=9NesL/yw1pVWD3s1vrkH3bOpyAmCQYtX3TnzyfsCJvg=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=svKyjy29OPICbUlPpyj7qcBx80p7K/DExeA7S/9lpm+uUJezdtYjC7g1/2pBIAtCR
	 ABZ5PPSRMaUol8YAwwncBeD68MdjOd0Qs/3kWs9JkItBoxDIRfBlfjkWXFip+WGgXf
	 a0TP7zBVfa7CeVpypTbns4l/VVIf96s+PTeK0tmc=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5] usb: gadget: dummy_hcd: add tick_us module parameter for
 timer-rate tuning
Date: Mon, 24 Aug 2026 15:54:28 -0000
Message-ID: <178758686883.288478.6637939361965647417@yandex.ru>
In-Reply-To: <178750530003.146199.10916428504166445366@yandex.ru>
References: <178750530003.146199.10916428504166445366@yandex.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

dummy_hcd services URB completions from an hrtimer callback that
rearms itself with a fixed 125 us delay (one high-speed microframe)
for as long as any URBs are queued.  Against a permanently polled HID
interrupt endpoint the queue never drains, so the timer runs at ~8 kHz
regardless of actual traffic.

On timer-rate-sensitive platforms (observed on one consumer AM4 board
with a current BIOS and a stock kernel) this timer rate co-existing
with a live Bluetooth session on the machine's real xHCI controller
resulted in a hard, below-software platform hang: printk, SysRq, NMI
and both watchdogs died in the same instant, with no panic, no MCE,
and empty pstore.  13 occurrences over 5 days, reliably reproducible
with that configuration (hangs within 20 min to 2.5 h of uptime).
The same workload with the emulated microframe lengthened to 1000 us
(this parameter) ran ~8 hours with zero hangs, and USB-cable sessions
(identical gadget traffic, no Bluetooth co-existence) never hung.

Note that lengthening the emulated microframe makes the emulation run
slower than a physical device would; users of the parameter trade
that emulation fidelity for interrupt-rate headroom.

The per-frame bandwidth budget in dummy_timer() does not scale with
the emulated microframe length; making that accounting microframe-
correct is planned as a follow-up patch.  Otherwise nothing in the
driver's behaviour depends on the emulated microframe length.

Default keeps the current 125 us behaviour bit-for-bit (and defaults
to 1000 us for full-speed emulation, where the natural unit is the
1-ms frame).  Values below 125 are rejected.

Signed-off-by: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
---
Changes in v5:
- remove a leftover blank line where the macro was (review)
- spell "(micro)frame" in the parameter description (review)

Changes in v2 (addressing Alan Stern's review):
- reword the description: the timer rearms while URBs are queued, not
  an unconditional "pendulum"; drop the word entirely
- clarify the xHCI wording: the Bluetooth session lives on the
  machine's real xHCI controller (platform-level co-existence)
- move tick_us into dummy_hcd_module_parameters with a custom setter
  (module_param_cb) that rejects values < 125
- speed-aware default: 125 us for high/super-speed, 1000 us for
  full-speed emulation
- reword MODULE_PARM_DESC per review ("length in microseconds of an
  emulated microframe")
- pre-compute the delay into a ktime_t (timer_interval) at setup;
  remove the DUMMY_TIMER_INT_NSECS macro; explicit (u64) cast so the
  tick_us * NSEC_PER_USEC product does not overflow on 32-bit
- parameter is 0444 (load-time only): a runtime write would not
  affect live controllers
- note the emulation-fidelity tradeoff and the per-frame budget
  follow-up in the commit message

 drivers/usb/gadget/udc/dummy_hcd.c | 48 +++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dumm=
y_hcd.c
index c0e40fa..3edc4fc 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -51,8 +51,6 @@
 #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
 #define POWER_BUDGET_3	900	/* in mA */
=20
-#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
-
 static const char	driver_name[] =3D "dummy_hcd";
 static const char	driver_desc[] =3D "USB Host+Gadget Emulator";
=20
@@ -66,6 +64,31 @@ struct dummy_hcd_module_parameters {
 	bool is_super_speed;
 	bool is_high_speed;
 	unsigned int num;
+	unsigned int tick_us;
+};
+
+/*
+ * Length in microseconds of an emulated microframe.  The default (125,
+ * one high-speed microframe) preserves the historical timer rate; larger
+ * values slow the emulated controller down and reduce its interrupt-rate
+ * pressure on the host platform.  Values below 125 are rejected.
+ */
+static int tick_us_set(const char *val,
+		const struct kernel_param *kp)
+{
+	unsigned int v;
+	int ret =3D kstrtouint(val, 0, &v);
+
+	if (ret < 0 || v < 125) {
+		pr_err("dummy_hcd: tick_us must be >=3D 125\n");
+		return -EINVAL;
+	}
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops tick_us_ops =3D {
+	.set =3D tick_us_set,
+	.get =3D param_get_uint,
 };
=20
 static struct dummy_hcd_module_parameters mod_data =3D {
@@ -79,6 +102,9 @@ module_param_named(is_high_speed, mod_data.is_high_speed, =
bool, S_IRUGO);
 MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
 module_param_named(num, mod_data.num, uint, S_IRUGO);
 MODULE_PARM_DESC(num, "number of emulated controllers");
+module_param_cb(tick_us, &tick_us_ops, &mod_data.tick_us, 0444);
+MODULE_PARM_DESC(tick_us,
+		"Length in microseconds of an emulated (micro)frame (default 125 for high/=
super-speed emulation, 1000 for full-speed); larger values reduce the interru=
pt-rate pressure on the host platform");
 /*-------------------------------------------------------------------------*/
=20
 /* gadget side driver data structures */
@@ -244,6 +270,7 @@ struct dummy_hcd {
 	struct dummy			*dum;
 	enum dummy_rh_state		rh_state;
 	struct hrtimer			timer;
+	ktime_t				timer_interval;	/* emulated microframe length */
 	u32				port_status;
 	u32				old_status;
 	unsigned long			re_timeout;
@@ -1329,7 +1356,7 @@ static int dummy_urb_enqueue(
 	/* kick the scheduler, it'll do the rest */
 	if (!dum_hcd->timer_pending) {
 		dum_hcd->timer_pending =3D 1;
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
 				HRTIMER_MODE_REL_SOFT);
 	}
=20
@@ -2029,7 +2056,7 @@ return_urb:
 			dum_hcd->rh_state =3D=3D DUMMY_RH_RUNNING) {
 		/* want a 1 msec delay here */
 		dum_hcd->timer_pending =3D 1;
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
 				HRTIMER_MODE_REL_SOFT);
 	}
=20
@@ -2509,6 +2536,7 @@ static DEVICE_ATTR_RO(urbs);
 static int dummy_start_ss(struct dummy_hcd *dum_hcd)
 {
 	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL_SOFT);
+	dum_hcd->timer_interval =3D ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_US=
EC);
 	dum_hcd->rh_state =3D DUMMY_RH_RUNNING;
 	dum_hcd->stream_en_ep =3D 0;
 	INIT_LIST_HEAD(&dum_hcd->urbp_list);
@@ -2538,6 +2566,7 @@ static int dummy_start(struct usb_hcd *hcd)
=20
 	spin_lock_init(&dum_hcd->dum->lock);
 	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL_SOFT);
+	dum_hcd->timer_interval =3D ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_US=
EC);
 	dum_hcd->rh_state =3D DUMMY_RH_RUNNING;
=20
 	INIT_LIST_HEAD(&dum_hcd->urbp_list);
@@ -2828,6 +2857,17 @@ static int __init dummy_hcd_init(void)
 		return -EINVAL;
 	}
=20
+	/*
+	 * The emulated microframe length defaults to one high-speed
+	 * microframe (125 us).  When neither is_high_speed nor
+	 * is_super_speed is set the emulation is full-speed, where the
+	 * natural scheduling unit is the 1-ms frame, so default to
+	 * 1000 us instead.
+	 */
+	if (!mod_data.tick_us)
+		mod_data.tick_us =3D (mod_data.is_super_speed ||
+				    mod_data.is_high_speed) ? 125 : 1000;
+
 	for (i =3D 0; i < mod_data.num; i++) {
 		the_hcd_pdev[i] =3D platform_device_alloc(driver_name, i);
 		if (!the_hcd_pdev[i]) {
--=20
2.43.0


