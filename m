Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641218;
	b=FjYdDBln158Y4ki7p51cB1uNbNoEbyhb6hKlgs9hBXXK1eDG1FbBssODe72UkKJzWXLI
	 XHMk3fe0kMC/Zo4BwkbiYnpXefa40TrBbeb8zPshuUDvGhDjjakY2eKVVXZeNVZLZWn//
	 Fpy+pcNRonTQmZBx6gP2kodtypf6j4qxTDQNzTo5LN8YD2VQ8Q+aPJ7Jabj2jEvqy446+
	 s5yiGpA3nCm0wNcPG/gAc1DByGgutTI8wE4NqmMA+Na8Akeas540QksmmmaIP+psVM/DG
	 XzpnQVTPpMUQUL6Kq6/eyUKwlQmGlj1F3oND3npDQVOYM/fjWvnSwhwSv9AMazXNc7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641218;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=pmCm0VY/35PyEXuwvzY8jI/4ezEWltsiR7PLhroRjx0=;
	b=Y8tD8/ATlxFWtzslGZ/03XZyO33ck1sW+eNkisbyU1dM2qQann3bJfjTXvInmX8S8Dp+
	 G8+qQLYF2Ncxn/vrBqaKHi5dOr3rWBKbMQI0lVvRZPBIxWpd7RnMmBWQsV0esnne8cwLR
	 OfJuc+HV4cNPqbNUMmEC5wvze7fkXCLlH+dXteervJexHwRTmlQocCmH8JpiAjdTpV6iS
	 h0efAV4NDyMeotmbjgvJC5ImG54GyV3Z/80vFXd+DQi7Tgplzk+RWWig4Ez2zrLpx3usJ
	 QqllMeN2dmmkpH89kJswiBjnoBZc2C+PRAhwY45vMB1JZn22sEXO9ag/qOjWJVbkeAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F0606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437F0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so1925979eec.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 20:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641216; x=1793246016;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmCm0VY/35PyEXuwvzY8jI/4ezEWltsiR7PLhroRjx0=;
        b=ClPxfEDM5Vg0XFPW4aenhI5oro2REoO+qvzlRFzEbT64Ab7lCDxC54ug+CWMeTh2pw
         bCAo+qNrdAQrkO6nxBf6zN0gh3to4ykPs0Ywe1JuFdHJIXQGPrSQC7sJH/CbDcK9XxzJ
         anUlj2bYc2mb6QdT0YXznJSeQ4gA7rihdOaW186B8zsbLFlm3wjFcyLctgzBgW25cmL7
         kag+Kl7K/c7U5T+12qBXtAeb+6l1NiUautn3xMybAbk9YwghN+rij1kOysTMguwZqn9f
         /z3J4b2aLK7Ic16CA6q/sSCRaluyMyfX59fvW0GXJhjG0CjeYKDT4DrZ+NE9lM2YY1w7
         CivQ==
X-Gm-Message-State: AFq9FYI5sj6tSHTFq2qh+KhtkxYCZvZxMRzqB7BLGtCtTXVfCcco+v/Z
	0DVlWMDRZhS38h0IAci1hntthm1J0VlqTlE3XH67JnGcPgRhUD51HGon
X-Gm-Gg: AYBFou1Du46M52odlXQuMkAj0+BfXvMAv8aGT6wVbpjHnqjJoClTXsRbM92P38Z1MWA
	LqbNA+CjcX3sTjDiMTc8SAz2tf83uxpB8X6tQzy3hmltT/kkrC4RMKqn+Db0JxwlpajGxRp05uC
	1EA5qjYBQDzIpavbnKVCzZO00vN+57D0O9Ql5WmxLXZ2JK5GgYL5gJDSZApGTsw+NC+qRRyuxZx
	ptRU6hzDr6AIDYibA60otRa/Ru/xKknwd5BB0zuQ1x1FFrG0DkchxjZQpvKmoJRSOfgYjKxxaGT
	SPcB4dmODrPjldZoyYLIRxMh2sdFNZUtItu4TLlmV2sKWiFvLRxzwIc8zn+gT4PzusMeIov6Rvv
	lV34zGNy72RTLpgwh5/tVGKbIXUBrxAK9kaHB7lePGQ3DPtTMzXhBmCj1Jvkwalusb6T7UWeAhE
	mT2Yu76FP7Mqecnxc1gexxXTJLhjzKmFC60J5xquUneO7k9pFHxuvNfKfgkmoNs5I1gZw00qhYJ
	WUKUHYAruPC8zk67hUFCOIbPR3DkNBOSDKqBxBMsbYxakHn/BEiUHr/niuGbHFKLu1PCBE2Ninq
	h3ZPQwVqkViitmlKRotEbRptScVAY/ZDDKf4hDNZQpWItYHoifebYXkk2Rs=
X-Received: by 2002:a05:7022:3b86:b0:190:b2a0:7250 with SMTP id a92af1059eb24-190b2a07272mr5289513c88.10.1792641216007;
        Wed, 21 Oct 2026 20:53:36 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:35 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject:
 [PATCH 2/3] usb: core: Close anchor capture-to-increment race in URB giveback
Date: Thu, 22 Oct 2026 11:53:33 +0800
Message-ID: <179264121348.17277.2207660107714201051@kylinos.cn>
In-Reply-To: <179264120148.17277.68253767316647311@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
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

__usb_hcd_giveback_urb() captures urb->anchor into a local variable at
the top of the function, but increments the anchor's suspend_wakeups
counter only after unmapping the URB for DMA and running the usbmon
hooks.  Nothing pins the anchor during that window.  If the URB is
concurrently unanchored by another thread -- a driver calling
usb_unanchor_urb() on its own in-flight URB, or usb_get_from_anchor()
or usb_scuttle_anchored_urbs() taking it -- the anchor list can become
empty while suspend_wakeups is still zero.  A
usb_wait_anchor_empty_timeout() waiter then observes the wait condition
true, returns, and the driver may free the anchor (anchors are
typically embedded in driver-private structures); the giveback's
atomic_inc() on the captured pointer, and the later decrement and
wake_up() in usb_anchor_resume_wakeups(), operate on freed memory.

The previous fix ("usb: core: Fix use-after-free in anchor wakeup
protocol") made the waiter's condition check and the decrement/wakeup
side hold anchor->lock, but its guarantee was deliberately scoped to
givebacks that had already incremented suspend_wakeups: the
capture-to-increment gap remained open.

Fold the pointer capture, the suspend_wakeups increment and the
unanchor into a single anchor->lock critical section which re-verifies
that urb->anchor still names the captured anchor, so a giveback that
lost the race against a concurrent unanchor performs no anchor work at
all.  From the verified increment onward, a non-zero suspend_wakeups
keeps waiters from freeing the anchor until
usb_anchor_resume_wakeups() has finished with it.

What remains open is the few instructions between reading urb->anchor
and acquiring anchor->lock inside the new helper: a concurrent
unanchor plus waiter return plus anchor free would all have to fit
into that gap for the lock acquisition itself to touch freed memory.
This is the same residual exposure usb_unanchor_urb() has had since
usb_anchor was introduced; closing it entirely would require a
lifetime protocol change (reference count or RCU) for anchors, which
is out of scope for a bugfix.

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
 drivers/usb/core/urb.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h |  1 +
 3 files changed, 55 insertions(+), 3 deletions(-)

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
index 3afd184c9b32..c78f72bc7cc0 100644
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
@@ -205,6 +207,51 @@ void usb_unanchor_urb(struct urb *urb)
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
+	} else {
+		anchor =3D NULL;
+	}
+	spin_unlock_irqrestore(&anchor->lock, flags);
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
2.32.0

