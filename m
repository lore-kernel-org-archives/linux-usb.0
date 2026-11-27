Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786141;
	b=fWUwlKuC+pvdtEsHnbbLgDhgaPetfYbCXRqpjLIJdbwHiQiMvyr7RxITSRT35V24670E
	 WQpPSYwLCfOMvJ+kTxgf1dGiAYvq2fjUjs+tJ344VHFCOmcemWvi3vgbB+87KAkQDsdMJ
	 2/5nmng9DTMRMKnGIyToD1gdTBHl3VtxDjDGoqPf5gd5YbMVuZ5661EsOvCy6iMLQ9Nk0
	 5O23gPb0TZzHIT/sXWFQ1ggiq/gFStGyQFlJYLn/8OOXgmt6Hf9F66nHnCQuYRtwgnEaO
	 XHzliEdQ31jGWvs6SR4d38QFslv88lXTdlr1fb07MrPNAkeS4dgvOwo7TZP2W1JnHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
	b=jPk2mbVwvKptMefWX9PzvenZP7XCo7Fc9F81c9xdJzKBkqJIT4p8uWqq0t58Supw4c7J
	 XOaTmtNEiBJU65E5CtVzYbacdYHHp4sSkQWFX/OVrV6XmMvMAuyjYujhQ3Hmr8WgJVhVo
	 dX4ah5fx2HNP2wkWe92pHXMj9M0SANQQTfwld2NyM+eH4gkll2W4PdlgfkrtDylYl9oGo
	 urb33TVB44FDcgWtR2NN+ceVZJv/t4gQ8pi69dO3zK4C/ZWE+0i+GMDCtikCAGnbiSl6F
	 i8O0FzHgtNGv3qRIPt8iNw1J2aoh/SQOsL/3xg5cDhwyzBrcmDO6EPVT+Oae6fa3lKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0A606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so4516452a91.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786140; x=1796390940;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
        b=OHVU2RvLMPyqyHi2Wlt0oQZoKxinBThBD9zRUzrmvDi+vqyekAYumdeUS/h9mdjLw8
         kCtYeIzoLfH15ACvJAqvsiVKoxZFG5cT3DZzRjD0YHjOs7iENv+EqEpc/Z/KeCzIfSeW
         THGk8r+GxTMY/vVDK7GrR5g3GckDfmxrwyMuEf1ISqEQnqOKKSeBNdDD1l1t3rBKEnpG
         VpYr/UrvT2bJ8by9UCAdxSwVP4x7nUAuh47wfj61FcivfCo/FVMZjjIeBFJenXV45Zr+
         XXyDBfaRWy2r1+ZosDFHg7lsC6FdU2tpUZ7/qN1X0C8UXAZz0bx7uiHfZYGh5cOWV56W
         ea2Q==
X-Forwarded-Encrypted: i=1; AL+hErHKHfqa4x7IA4QDC/9q/EmrzCpUNP7/Pum+v7aA0kk4QfrD+DnFqaGF15b9BvfRWPQ6rIzft8H30Bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E5U3c5l/m2JRMY3chdRvimsEL3UIZZP9VFlGBDEc8Jc2nruir
	iOj1zADaNdOeVQkLSkgDpE0rdW1usThzKScgQlY2SzPHXccy29oSL9D5
X-Gm-Gg: AZFdTZfhs5PNFFtIaiC6MavWLEMGutQqdbtA+1E+6Ax8DC1Xd7v2/5dPw5BxvxYioVm
	IHWDMlDwp++02u07xiDqMb60Z8wJpoit1wdBq0MClhtKHqHaPhMZm0i+T4GMB1J+EbXzPQiy7mb
	+w+mXxMjRh8yynZbUD5jHVbV27WFV2Mb/Zf6jTCh1lvODoM+6Jvoqqe4DplYVgIaf8+LKRThNNz
	wCQjrEQsBAxths5ANkQMp7V4nEJ/SmfrXCU7DY67JQil/B0vIm11P+jTCjMlX0N3mUc0+2t7/Za
	nCUsalw3okR4tYwgGpTwUiYSkIkEKtUi5U383NM/BpThrZB1HptyZxmwt+uo6s2dr8TJ7G3529Y
	e90gHPevJ0zt8WW+WpPXy2fawsV85mpIScMCsmlQjS5+Mncegp9J1K+5g2LQe+EvhZW/XMupxJg
	TwCNdazZQhQPeNL5vnX4qBOM2FLXJaDUx4C+TO1v7EDnei/Czi6FqSHUful/Ff1vQAf/A3924/u
	prAsY0tmzIFNxgVCXrMD+u1Jfqt3fSrlsArYkeUtfkWEBDPI3ZoCCJyE1UF3DWFHtUTFxBqSDP3
	QmZ7mATXn/Q7yZYpD7O1jh5ja2RqM8Ttitft0h8HRzUCam7BcJThxEDOZ3tnP5Bq4thJKUbi96Z
	CL7J+cpkAZEAF8ybkMKstK7tGWTVTxF5pd4e2n2229/VyvA==
X-Received: by 2002:a17:90b:2416:b0:3b4:a6ab:b846 with SMTP id 98e67ed59e1d1-3b4a6abb9e0mr7253839a91.17.1795786140042;
        Fri, 27 Nov 2026 05:29:00 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm41143707a91.12.2026.11.27.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:28:59 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] usb: core: Close anchor capture-to-increment race in
 URB giveback
Date: Fri, 27 Nov 2026 21:28:57 +0800
Message-ID: <179578613710.44635.10714432326136808343@kylinos.cn>
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

