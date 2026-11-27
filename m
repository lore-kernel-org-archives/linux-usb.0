Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770084;
	b=JWVHQDdfTd3DYBF+LPCQ0LE1Rrk40bEI2IedahXKhZV18NUyKAfK0wo9i01nJGO6oH3D
	 /vr4UEdLiuWLRhM4tEMbJ/cgtLekQLiYq95+9NQXnsR3NjhBOjwYJqeHaN0a0ev59FmfM
	 w2thYCujI+G0/jLlNX3DLaS2iQMGC1BFM3p9J+8xaHyKtWGQU5mkIaW/33gYYml1DdeSw
	 PzeMcFfOIH71QCaL6am1BOO3ybY1wl/pdoJoCsMj1XNXRiWsQAc6TJ1iCcZ/EK+5MvjpT
	 q0KHC7gDe1JDBd9uALPLpwFKYd2nBSrk+YZbcTeJXSdIProWg09BfbaGH3De3mnrhig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770084;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
	b=GxvGeV2OtaTvfsFyOa8ha/KsL9tEJ3OpOOVFoHkvAyrzNbuFeqe7DS87Cbg2Wc7dnoQa
	 IRHJzpV3CLjAvqUdZrdqTHxn86xK5ImjdeSOxVbNSgUgPAF+pKqC2/d+i1Nj/qTejEqAc
	 tC6AYk0259obp7N+d7IUqFxJE+c+lvbvlJOwokSUrlh+LQ231r9iwp28uQcDMn7mw/ejq
	 mIoduIL/t/7R/5QCpE9O5v1uPoA3uTEzRvfw6ZD63fhDyZuCbpDD7XbVX5yMDb+GdMdFx
	 DvopDPLQYqSTv6oXuBwHcspThgvy3SKiias+lVOwd66upyzXpO05u5sc/UsA1ccjKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D57606A33E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D57606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f046b0adc0so44969715ad.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770083; x=1796374883;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
        b=kkeIF/df3A7IjHvWoPkd4vDp4TEm28+OVDHADvmFWwgnRQKFZb8rGjo8lgT7bTsCGA
         jyCu7jUi9ZGkNikghZZaeW+I5Ve4aR2/9l1Z+IwucP56dEbF/2qYKC8Sh9Q4wS0rGnV+
         QZ8KGmZa2zEYq3MaaR4izgslJP4tQr2jD6k2N1H7lifDEW4gaOsMrzmikJXiTXKO8xWP
         CdKDCmMiCj+UovMQq7aTtwX36M3PA3fGrjDWppfNdKpH4s8/8Rp6XHAudSi7NcsFhciP
         jehQSnbTEkw4U3MoU1b5pO3l5W0JeT7L4Cr18ELXg2ijIOS6lQxV9HCsAg727jOpzmE/
         UnXA==
X-Forwarded-Encrypted: i=1; AL+hErHYBLqXm/OdVnaYuqtnb8VjF9zlrdwlxWea6H6rQYEbe0XaJw6KJxa6VLHV4MyWOvEW7AAVkRpfPE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5LX8NAcJJ3XGrclB78bwXo7yfUS0Vof2IblUOnU98CWjZDk5I
	6OVIBzOxmbM2acoPggeSaI/KZPbq8ZSbSzlpMqnJCAoaKqtcehJtHpji
X-Gm-Gg: AZFdTZegrLpNi6NjpcW2JtZ0izy9lRMb9LgVARlrIYntxx7JovGQ97M77U+cz/DrbS2
	++ztAoBSk5fGHGu+94Djw8vWcgMl93pmuWVlnVTYctytJlOZ9LNm49mOBuCiIadcC9GxZ4xVVk1
	vtI4dJJ20xNKcqlLVBMBh4IShhlzqTcmNmT1L4ok3zllUba5ELp4h3ZzMk8yzAPJ7Nsfe8a3lmA
	EGT3Hbyjj4Gek1nNDWeAFdWrIPOm9DuOwTRBWPWL+olvYdjOOwLuDuo/O2d+hP/Nfiu/n3kW/iB
	AiqMFIjGswMHVMiKHmZ+dU4mXsUV5TOMpzZlU3F/RjBzpkV+980c38qXYeQfGZX9Y+EMK6FU2q7
	zTjU0bZC0pC+1z1TkzzH92alnk+IXl2eBuYHzaolbSLtsSuUlpZ7HCUJvd4q/FVwRkC/dq1J3oV
	a+tCfdMg3fejdETp8REb9b4XC5N0zanGJwpEbeos6IqB23ezoksIVbcEi+xjXWHoMVZ9Ws2lfR+
	hc/1HqJf+JioMG+DY9T+dc9eV6/wZ146f8UzjFtDFyrgJ/5WuaDVo2UEJ3f94AACjPM0mWOF10h
	StgtEtjjftZa2OOg+ApQ5tV+6hWpFtgCdc+SokWEGq/npNolQjv59z9QvvUUxa99V+8HX9O+2w2
	Q2wrHt/c6ZGnv6K3NshU3JVe1PvKrdfAd5BKMCedH98th5A==
X-Received: by 2002:a17:903:3803:b0:2ed:379:1592 with SMTP id d9443c01a7336-2f0ea5af0b7mr60270675ad.26.1795770082662;
        Fri, 27 Nov 2026 01:01:22 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:01:22 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 2/3] usb: core: Close anchor capture-to-increment
 race in URB giveback
Date: Fri, 27 Nov 2026 17:01:18 +0800
Message-ID: <179577007898.23588.10805062257297682962@kylinos.cn>
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

__usb_hcd_giveback_urb() captures urb->anchor into a local
variable at the top of the function, but increments the anchor's
suspend_wakeups counter only after unmapping the URB for DMA and
running the usbmon hooks.  Nothing pins the anchor during that
window.  If the URB is concurrently unanchored by another thread --
a driver calling usb_unanchor_urb() on its own in-flight URB, or
usb_get_from_anchor() or usb_scuttle_anchored_urbs() taking it --
the anchor list can become empty while suspend_wakeups is still
zero.  A usb_wait_anchor_empty_timeout() waiter then observes the
condition true, returns, and the driver frees the anchor (anchors
are typically embedded in driver-private structures); the giveback's
atomic_inc() on the captured pointer, and the later decrement and
wake_up() in usb_anchor_resume_wakeups(), operate on freed memory.

The previous fix ("usb: core: Fix use-after-free in anchor wakeup
protocol") made both the waiter's condition check and the wakeup
side hold anchor->lock, but its guarantee was deliberately scoped
to givebacks that had already incremented suspend_wakeups: the
capture-to-increment gap remained open.

Fold the pointer capture, the increment and the unanchor into a
single anchor->lock critical section which re-verifies that
urb->anchor still names the captured anchor, so a giveback that
lost the race to a concurrent unanchor performs no anchor work at
all.  From the verified increment onward, a non-zero
suspend_wakeups keeps waiters from freeing the anchor until
usb_anchor_resume_wakeups() has finished with it.

What remains open is the few instructions between reading
urb->anchor and acquiring anchor->lock inside the new helper: a
concurrent unanchor plus waiter return plus anchor free would all
have to fit into that gap for the lock acquisition itself to touch
freed memory.  This is the same residual exposure
usb_unanchor_urb() has had since usb_anchor was introduced; closing
it entirely would require a lifetime protocol change (reference
count or RCU) for anchors, which is out of scope for a bugfix.

No syzbot report has been attributed to this interleaving; it was
found by extending the analysis of the previous fix.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/hcd.c | 10 ++++++---
 drivers/usb/core/urb.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h |  1 +
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f221425fec0a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1630,7 +1630,7 @@ int usb_hcd_unlink_urb (struct urb *urb, int status)
 static void __usb_hcd_giveback_urb(struct urb *urb)
 {
 	struct usb_hcd *hcd =3D bus_to_hcd(urb->dev->bus);
-	struct usb_anchor *anchor =3D urb->anchor;
+	struct usb_anchor *anchor;
 	int status =3D urb->unlinked;
=20
 	urb->hcpriv =3D NULL;
@@ -1641,8 +1641,12 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
=20
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
-	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	/*
+	 * Capturing the anchor, suspending its wakeups and unanchoring
+	 * must be atomic with each other; see
+	 * usb_unanchor_urb_and_suspend_wakeups().
+	 */
+	anchor =3D usb_unanchor_urb_and_suspend_wakeups(urb);
 	if (likely(status =3D=3D 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
=20
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index bb1778d9e9db..174dc42c95c1 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -14,6 +14,8 @@
 #include <linux/usb/hcd.h>
 #include <linux/scatterlist.h>
=20
+#include "usb.h"
+
 #define to_urb(d) container_of(d, struct urb, kref)
=20
=20
@@ -205,6 +207,52 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
+/*
+ * usb_unanchor_urb_and_suspend_wakeups - atomically unanchor @urb and
+ * increment the suspend_wakeups counter of its anchor.
+ * @urb: the URB to unanchor
+ *
+ * Used by the URB giveback path, which must capture urb->anchor and
+ * increment anchor->suspend_wakeups atomically with the removal of
+ * @urb from anchor->urb_list.  Otherwise a concurrent unanchor of
+ * @urb (a driver calling usb_unanchor_urb() on its own in-flight URB,
+ * or usb_get_from_anchor() or usb_scuttle_anchored_urbs() taking it)
+ * can leave the anchor with an empty urb_list while suspend_wakeups
+ * is still zero, so a usb_wait_anchor_empty_timeout() waiter observes
+ * the wait condition true, returns, and the driver may free the
+ * anchor before the giveback gets to touch it.
+ *
+ * The verification of urb->anchor under anchor->lock makes this safe
+ * against racing re-anchoring, because "urb->anchor =3D=3D anchor" and
+ * "@urb is on anchor->urb_list" are changed together only while
+ * holding anchor->lock.
+ *
+ * Return: the anchor, which the caller must later pass to
+ * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
+ * anymore (a concurrent unanchor won the race).
+ */
+struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *urb)
+{
+	struct usb_anchor *anchor;
+	unsigned long flags;
+
+	anchor =3D urb->anchor;
+	if (!anchor)
+		return NULL;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	if (likely(anchor =3D=3D urb->anchor)) {
+		atomic_inc(&anchor->suspend_wakeups);
+		__usb_unanchor_urb(urb, anchor);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	} else {
+		spin_unlock_irqrestore(&anchor->lock, flags);
+		anchor =3D NULL;
+	}
+
+	return anchor;
+}
+
 /*-------------------------------------------------------------------*/
=20
 static const int pipetypes[4] =3D {
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..362bfda497cc 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -20,6 +20,7 @@ extern int usb_create_ep_devs(struct device *parent,
 				struct usb_host_endpoint *endpoint,
 				struct usb_device *udev);
 extern void usb_remove_ep_devs(struct usb_host_endpoint *endpoint);
+extern struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *u=
rb);
=20
 extern void usb_enable_endpoint(struct usb_device *dev,
 		struct usb_host_endpoint *ep, bool reset_toggle);
--=20
2.39.5 (Apple Git-154)

