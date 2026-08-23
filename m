Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10A3346BE
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787505325; cv=none; b=KJucM7r+bFMn5ZG2CQbItcm8vkQz2sunWFS+yw0S9wE2YBxU3IjyGeT/Hp/aJ+sTBH5Tbl6Owv1aZyyIBpYpfjzu+vEwDCowx+F2TNGndqpXDwXoG8kRHGgKsCduYw3Bf1efJs5U7T8sieYLvubkBt4j/ltVmMTAjJGgNRM2iUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787505325; c=relaxed/simple;
	bh=l/TH0P6NHckfNTOVfMrf2tL1foeMjYSY2cw0A8LBgPk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p2tquJLVf7VCVhow20DlIjSwO/cgGeScnvM7yrVTvBsJAoCUZC1tORccTLP4vbEVwc93yzW3FZWI+RU5uZTFrrYe88hSlBPKnH6b+BtKt1h7dNl2taxrSC1cUCAOSk8F7YLYdmLOdWoRuvC7WwNxnNS0+FtGytvVBkmRjK5K4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ruCksvKV; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="ruCksvKV"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward200a.mail.yandex.net (postfix) with ESMTPS id DF564C30D6
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 20:15:09 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:ba1f:0:640:6bea:0])
	by forward100a.mail.yandex.net (postfix) with ESMTPS id 576E4C0449;
	Sun, 23 Aug 2026 20:15:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id 0FeRqtZeQKo0-vnHFgmbP;
	Sun, 23 Aug 2026 20:15:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787505301; bh=PryXxOhFEZUgDL162wMBCrifHiGUkXsLqlF6hq/3DE8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ruCksvKVIkilgrQ0Gv/C902i83jFKS42WYUiS8UWEFAxyeIkMEWYPQiHne3qwpD77
	 a5/8rzGFict0m3loE4JW6Xv+EHGoXU90viirEU85VK8aaSABhVIOn77iAGW4YuXpLr
	 KSZKl9nyazN82yGCNZrOtcaOesxdwtlnGYQ38kcQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
Date: Sun, 23 Aug 2026 17:15:00 -0000
Message-ID: <178750530003.146199.10916428504166445366@yandex.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Date: Sun, 23 Aug 2026 17:12:49 +0000
Subject: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
 timer-rate tuning

The simulated controller completes URBs on a hrtimer armed at a fixed
125 us (one high-speed microframe). Against a permanently polled HID
interrupt endpoint this creates a self-sustaining pendulum at ~8 kHz:
every completion triggers an immediate resubmit, which rearms the
timer. The rate is unconditional - it does not depend on traffic.

On timer-rate-sensitive platforms (observed: one consumer AM4 board,
BIOS current, stock kernel) this pendulum co-existing with a live
Bluetooth session behind the same xHCI controller results in a hard,
below-software platform hang: printk, SysRq, NMI and both watchdogs
die in the same instant, with no panic, no MCE, and empty pstore.
13 occurrences over 5 days, fully reproducible; the same workload
with the pendulum slowed to 1000 us (this parameter) ran ~8 hours
with zero hangs, and USB-cable sessions (identical gadget traffic,
no BT co-existence) never hung.

Nothing else in the driver's behaviour depends on the exact tick:
the bandwidth model accounts per-frame budget regardless of how
often frames are simulated, so a larger tick trades latency
(1 ms added worst case at tick_us=3D1000) for interrupt-rate headroom.

Default keeps the current 125 us behaviour bit-for-bit.

Signed-off-by: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dumm=
y_hcd.c
index c0e40fa..f185b87 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -51,7 +51,7 @@
 #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
 #define POWER_BUDGET_3	900	/* in mA */
=20
-#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
+#define DUMMY_TIMER_INT_NSECS	((u64)tick_us * NSEC_PER_USEC)
=20
 static const char	driver_name[] =3D "dummy_hcd";
 static const char	driver_desc[] =3D "USB Host+Gadget Emulator";
@@ -79,6 +79,12 @@ module_param_named(is_high_speed, mod_data.is_high_speed, =
bool, S_IRUGO);
 MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
 module_param_named(num, mod_data.num, uint, S_IRUGO);
 MODULE_PARM_DESC(num, "number of emulated controllers");
+
+static unsigned int tick_us =3D 125;
+module_param(tick_us, uint, 0644);
+MODULE_PARM_DESC(tick_us,
+		"enqueue-to-completion latency of the simulated controller, in microsecond=
s (default 125, one high-speed microframe);"
+		" larger values slow the internal timer pendulum and reduce its interrupt-=
rate pressure on the host platform");
 /*-------------------------------------------------------------------------*/
=20
 /* gadget side driver data structures */
--=20
2.43.0

