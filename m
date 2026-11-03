Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672458;
	b=rtz0QFmEBTuWLp0WQyzdwSqbd/iqc5W+3gi3TaRhWHAFPCP+m4dCYdurN9G4QvGabnHQ
	 XMpFaXbly/Tf3IG77qX6LI0QDuJ6gzezU4PvewGTWSkoJSx3fY6MubEbkTrD1DJ7jUhcl
	 1TLc1iar5h+OqZuc77weqf5YUYkm/IojhdcsyS6vzaQSglXafZyUPmc0NErAvE9OcbMAA
	 9Si1f3rlg4M3X08Tp8f71JYJrTy1cKnRFtiHJbPF3fG9k6+zccPB3wilULzFqxIu5rNfO
	 7QLT4fsEyO/xIuMZVr0H1VLXCuXz61K85MgciqdC6UAzYp95M2EGyvPK3AjE0v7ZqVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672458;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=s0WFfD140zeObqBaZr8xqm6sVgpfEHh1ShRzvSvWrJM=;
	b=e6OOlfHnqepZBTTLM1zFDGyd7pbrtqs/zj8iTLIg4gWKtarXPiKb2aznr3orollmQhiM
	 4YMa7OjZ2QFSMCltgZTYx/Wj5d90JUIdZm4cYeFzMOENFa7ilEt2wPQv/Ewz7BrQxgUxE
	 r6MQRI/Xb625wHgRYIlfLOIEXV2RgjM4Lh6RMHxivmbvh89Cidytll7U6pwI5i+XuTx9L
	 038Brcr8ZJSAVRv+rlcwj+sgu8SaaXwEilD1KralZr6SH8PpJGYx1yB6+2l3ohUcjxzND
	 UP93kXHBe/RnJ7DVRxd5ILAlWsWAqM8Xbq1heYTEzj+zGpmzoM1N4cWkGSVkZgpI3SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A0606A330
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 02:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so6267008c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 18:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672457; x=1794277257;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0WFfD140zeObqBaZr8xqm6sVgpfEHh1ShRzvSvWrJM=;
        b=uDGqjPP6y02DkQ0Ph0uMOvwE0a2Vrv3KaPrbnc5D854QOUvc5Sc+QBNbnd/p0wg+bs
         cRffdZL6nSj3aX3FLDcY4ccZnrfmNeawy5vUrUWSzesrMmHx7AEr6MEVzvKn6c34QGnA
         N4g9ODwnju6ht2T7q59z6l0WsHazeQF+eduSbGULDIsxjBdr9VxDub8ortNA/Mkl/f7D
         6kGOzOM4H2TYbC3yfhzLHf9hpRBGpy5bmrg/rzgOVjkUES6FXhVTM+O05erZ7TYjmrRK
         KRsqJi6h7D6Ghz9p6HdR6LTC30VdrGtlAYJQbd1Lh9vZw0/eZA9Hz9D8JRhx9TBegDaQ
         p+ow==
X-Gm-Message-State: AFq9FYIElWyImjTkQ4wU8gJ//sgPTiW8mt45lDlnENgPUF81Ye4g9xHH
	pStx24zntLqcF5H22vD9Th5CQT505ngOtoC1hEnZ4AzspRQqr8D5tpFwmYSHW82H
X-Gm-Gg: AYBFou1Oi0Y4LJqKq+XY2h3rw3iZcIuzVIvI3GSFR09Dtrhu9hOupy9wkpiRGjcWT2A
	lYA4/+rOnG9H1EqghF3VdWwcIZ7a5UBPo3sDSK9DfnQ1Zoi+YS3AvnxJRfmWxFWMNJk81JtKCTG
	bf0u8h0QWKfiWvS1w61OjZO9C06AIXE/SuXbvv1BPC3hjfNKSGiSrHhSFcsbUY9IKWXLTZiFC80
	4qVmNyGD7ECTbAezFoWWryRB/S4SniUrGkMra/UXVzYeJVPLTzY1uawP+u/Mmy8L7Am0ZWxxMPW
	qa9CSB0PpdLCeYleOMQTfRaHe1MwrSv2MeHCW/otok8/vpQmnjRQF36f8nxZewFUumR4M3jrz+M
	qLoixnckWd6h5IzcRlTKhn7bHdU4DxYCLtxEGZEn5edllC+96ZMA8vfj0YDZll2i1GZ/tocCs6v
	BvKZNAV18V+qFCIU0zzhEecUB2zQkgdJExJdmmHZ0+O4YWu31ocLeya4HH5onLbwhC01tRiGQrP
	r3rOLow/WougP82z28GKHojzUw+3KoPc8paDuU6/rF8jI3bEbO3GstwO+HrSEtSF7LexJDlPmtl
	h3D9ZdHKZyS/Dquz9tcXzQVPb6KcXgfeqJ2hWmcj35mTtk7KNdWDxTBg3w9cVib4sGIYOHReDi1
	Sk6oMNp8Xi4Pbe7J7c3WR4iAHHQCAoIuR2pAS
X-Received: by 2002:a05:7023:903:b0:17f:7280:1332 with SMTP id a92af1059eb24-1ac5c92f6e4mr19493863c88.40.1793672456994;
        Mon, 02 Nov 2026 18:20:56 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm38657160c88.0.2026.11.02.18.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:20:56 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: core: Close anchor capture-to-increment race in
 URB giveback
Date: Tue, 03 Nov 2026 10:20:53 +0800
Message-ID: <179367245366.76534.1936893633318556361@kylinos.cn>
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
index 3afd184c9b32..22312892e528 100644
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
2.32.0

