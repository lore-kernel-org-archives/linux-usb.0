Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790608;
	b=ssL/chNHEZUQnyM3H1EZ75V3saB0y3PIVIv1mrCQK2IsFtufJmahZyRqrMSzkE+yNFet
	 ZO4Fxlwswqvf+7D8cXrk2vWudK1LRHuU5EXbiJjmm9DZKnxkF5NgJ9GJRU5BJ+DDCpEFk
	 4uBXl9VkPybehoDfIsui2dkm5VmXmRnakPjjn6G1jqBflaUYCqm7S9LOzAqlvr7m9N/5i
	 hLkdtQ/stG+Wv47KPeJ+32F9f8ANekPIpFJtEBtfm2ZRmoInCwxs4EblcInA3ZCjo4D/1
	 e3jAYmlMPwhRq//zZ1Sb06mYe1eHhLd8JzFVm99sIMtJlo/o3XoxE8+rdGRy22RPAiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790608;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UakudTfMFD0Grv+nF2HayxQINkZzLgeIdbc8TIqvNyU=;
	b=kysZcyyNiIt/IViUWRXnkwkBpRo4txUGjuZELQtpBxH8Hu2Rp4K7ZsbStSJwZun7msM1
	 JmGSPo0cJoCGQXYE45dOUwQOZPC/05opjwalFA4BnF3AzN7Ay2yfwhTd8ByTkgl5VStZZ
	 X27wkD9Lps4se9NHr//3xu9HKvjnLeSjUNgxTICezZWOO9w39nhmfVUj2sgnjO40JuAWD
	 dhs1nTg7ihx6+jytiMRDiCrUeMs6/VXLU9HkGxBNWGLqDJm3MBCl0LrK2lLhNkuHDznR/
	 K9qCH9yqzvLxVIN+THRbjz0GRAHC47r51+Kp8r9V7rTUs84yaDHoVe3ljNSp8KERLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAF2606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAF2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02ee04378so63747075ad.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 06:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790607; x=1796395407;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UakudTfMFD0Grv+nF2HayxQINkZzLgeIdbc8TIqvNyU=;
        b=YfbC/YtWUv9ARymqhLmcB4RlznwRY9ZBikpAnBT4//HSTVRvH2k0WWLpM0dcwd8NFx
         diCh+8iRLS/Swu54ANLEE3y92w6pPlIhK9j/AXlDgE5B9oqAPc1OIObam+pqrMc8MQ9o
         PEFNg6/UPfwJUvvyTZTP1UF7QWY90FByBu67Ag9l63DHltTeZKd28Toeu/lEoz4agJ1s
         I6mvsOBvEOUrtjAxV2kV0Lb/ysZaB5tlgAd6n2OnXS0d1HGsboKSWNlOteIw5EapX+uV
         oGrY9QDxwb/89n0v3jHiTPAFKfR9uNdT0/tfLbPJ6jovmf+KkZPAqaOOsBQ0BihPX0H/
         HDgA==
X-Forwarded-Encrypted: i=1; AL+hErEnnB94P1nxZsbuk2smJw5HtvEEGlYVRAljoHRMqbcaQOtdWMy3eksa33YMdam9om4xpGRYfeKX/xI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RgjuvpiLuqWIP4btvovJ5htZkTpI+gFj1apPpmRxmm5hiZ/0c
	/UpzgEaEowQsZlRu4x3y5VSTUbrasSjZlxCj5ZD3fxAWe8xpfX/t6VnO
X-Gm-Gg: AZFdTZfihpPYx73XU9GPGxdv1F47MQWuYAYCRmQbk9lkAz9mrubTWQcFIWgITzww/LO
	X/9wVGjShe5Z/OCw0e48hFfmVPxzXNidjeFo9s95kZLl6zfM2wu/VFuZ3HgnQqqRKehmRq8GDHL
	NKdY1TOGmWf/N/P0PKmrI36GkC/Ba5t+H4Nx70l3BwO8L5LBH34VLO5k2Xy8jjWf68TfEjA/BvP
	PFxLgwfL9x0zfuw8iqAs7bQd+tQqQgnRt14EuxT5qUM1Cfioa1fK0rv7iBQ4HySUEYi87LXjzQv
	bfTukqExgXATzyXWgkPszhOci5MW23o/CsIQrtC6kxEjuFzJD5pbEk7v8eDi0tCCB+hm+s9FnP+
	H2rBhOSn3gyvP14n65/pDEowpkrwgjj9slXwpnRd6+5OzOL+V3Mz5CADs4r/3FaOW6JMJU3WTng
	LIc2F/FABd82QjNdIDTOCZpSN7vv19qc6w7Ixt4t3Bewo7Ty20mgW2ZGxZ2O7HG7/yI2XKjmkMb
	qoWgNsF9XPPBLe7DAJOPPOGqAM5ypt+tP0Tj73dc+LjZrh3MgNgaKqhKS14mmFAcXnjl8T3E53Q
	k6IQOuN0SIybsu+z5nmQFle4uzshOzreINWsb+ryx8KnFdjHhAAwDc0BRCo3iM3conu7QvtRmFw
	xS2PgDm2Xm9bAthwDBMiABMXsutqhoLpl0jkJQQ2/UKq2jA==
X-Received: by 2002:a17:902:e802:b0:2ef:dbee:373e with SMTP id d9443c01a7336-2f03efb10a4mr297498585ad.6.1795790606590;
        Fri, 27 Nov 2026 06:43:26 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm120659185ad.9.2026.11.27.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:43:26 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org,
 valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Subject: [PATCH v3] usbip: vhci_hcd: time out unanswered unlink requests
Date: Fri, 27 Nov 2026 22:43:22 +0800
Message-ID: <179579060266.47199.14552707473292683159@kylinos.cn>
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

When the connection to the peer is alive, vhci_urb_dequeue() only queues
a CMD_UNLINK PDU and relies on the peer to send RET_UNLINK (or
RET_SUBMIT) before the unlinked URB is given back.  A peer that keeps
the socket open but never answers therefore makes usb_kill_urb() wait
forever.  The waiter is typically the hub work item, which runs with
the shared address0_mutex held, so every later task that needs that
mutex or the device lock chain - a second attach, usbfs open/release/
ioctl, udev - piles up behind it and the whole USB stack wedges.

syzbot reports this shape in three long-lived bugs:
  INFO: task hung in hub_port_init
  INFO: task hung in hub_event
  INFO: task hung in usbdev_release

Give every queued unlink request a deadline of its own and arm a
per-device watchdog; when the watchdog fires, it tears the connection
down through the existing error path (VDEV_EVENT_ERROR_TCP) if any
active request is still unanswered past its own deadline.  The teardown
already knows how to give back every pending URB with -ENODEV, and a
RET_UNLINK that arrives late (or never) after that is handled by the
existing "already given back" paths.

Queueing an unlink arms the watchdog with timer_reduce() so newer
requests cannot push the expiry past an older pending deadline.  When a
request is answered via RET_UNLINK, or its target URB completes first
via RET_SUBMIT, the watchdog is re-armed to the earliest remaining
active deadline or cancelled when none remains; if the callback fires
early, it likewise re-arms to the next pending deadline.  Connection
cleanup stops the timer with timer_delete_sync() before port reset so an
in-flight callback cannot queue a stale teardown against a later
attachment, and controller removal calls timer_shutdown_sync() before
posting VDEV_EVENT_REMOVED so no callback can queue work after
usbip_stop_eh() returns.

In a regular setup, any network stall that leaves the TCP connection
established while the peer stops replying (such as a wedged proxy, a
firewall dropping server-to-client traffic, or a hung server) triggers
this whenever a client control transfer times out into usb_kill_urb().
Verified end to end with usbipd exporting g_serial on usbip-vudc and
usbip attach through a TCP relay stopped with SIGSTOP after enumeration:
deauthorizing the device hangs forever in usb_kill_urb() without this
patch, whereas with it the 5s watchdog tears the connection down and
the writer returns cleanly.

A similar fix was proposed as an RFC by the syzbot assisted-fix
pipeline; this version arms a single per-device watchdog instead of a
timer per unlink request.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Reported-by: syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D58aef18c1ad93d87652f24a0bc7a74=
b6d98ac710
Reported-by: syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D7ff8ae4abed51ff2354c1addb66414=
3ec26ca588
Reported-by: syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D048da78aba1a3a6139509492b2be50=
5b2d223762
Link: https://lore.kernel.org/all/1d6db53d-07ab-46ad-adc4-d09c95b2c83f@mail.k=
ernel.org/
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
Changes in v3:
- Arm the watchdog with timer_reduce() in vhci_urb_dequeue() and re-arm
  it to the earliest remaining active deadline when requests complete or
  when the callback wakes early, preventing newer unlinks from starving
  an older deadline.
- Mark matching queued unlinks completed when their target URB finishes
  via RET_SUBMIT (and skip queueing CMD_UNLINK if vhci_rx already claimed
  urb->hcpriv) so a lazy server RET_UNLINK cannot trigger a spurious
  timeout on an idle connection.
- Use timer_delete_sync() in vhci_device_unlink_cleanup() so an in-flight
  timeout callback cannot post VDEV_EVENT_ERROR_TCP after port reset.
- Move timer_shutdown_sync() before VDEV_EVENT_REMOVED in vhci_stop() so
  a racing timeout callback cannot queue event work after usbip_stop_eh().
- Link to v2: https://lore.kernel.org/r/179577001740.23588.175989404245058093=
86@kylinos.cn

Changes in v2:
- Document regular-setup reproduction and end-to-end usbipd/vhci test
  verification in the commit message per Shuah Khan's question on v1
  (no code changes).
- Link to v1: https://lore.kernel.org/r/20261006125652.10296-1-xiehongyu1@kyl=
inos.cn

 drivers/usb/usbip/vhci.h     |  12 +++
 drivers/usb/usbip/vhci_hcd.c | 138 +++++++++++++++++++++++++++++++++++
 drivers/usb/usbip/vhci_rx.c  |   4 +
 3 files changed, 154 insertions(+)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..af5d6504eb83 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -11,6 +11,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
+#include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -44,6 +45,9 @@ struct vhci_device {
 	struct list_head unlink_tx;
 	struct list_head unlink_rx;
=20
+	/* fires when the peer leaves an unlink request unanswered */
+	struct timer_list unlink_timer;
+
 	/* vhci_tx thread sleeps for this queue */
 	wait_queue_head_t waitq_tx;
 };
@@ -65,6 +69,12 @@ struct vhci_unlink {
=20
 	/* seqnum of the unlink target */
 	unsigned long unlink_seqnum;
+
+	/* deadline enforced by the per-device unlink watchdog */
+	unsigned long expires;
+
+	/* target URB completed via RET_SUBMIT; no longer watched */
+	bool completed;
 };
=20
 enum hub_speed {
@@ -124,6 +134,8 @@ extern struct attribute_group vhci_attr_group;
=20
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
+void vhci_rearm_unlink_timer_locked(struct vhci_device *vdev);
+void vhci_complete_unlink_locked(struct vhci_device *vdev, __u32 seqnum);
=20
 /* vhci_sysfs.c */
 int vhci_init_attr_group(void);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..18a0d42ba390 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -19,6 +19,15 @@
 #define DRIVER_AUTHOR "Takahiro Hirofuchi"
 #define DRIVER_DESC "USB/IP 'Virtual' Host Controller (VHCI) Driver"
=20
+/*
+ * How long to wait for RET_UNLINK after sending CMD_UNLINK.  A peer that
+ * cannot answer an unlink request within a control-transfer timeout
+ * (USB_CTRL_GET_TIMEOUT) worth of time is considered stuck, and the
+ * connection is torn down so that URBs waiting for their unlink reply can
+ * be given back instead of hanging their owners forever.
+ */
+#define VHCI_UNLINK_TIMEOUT_MS	5000
+
 /*
  * TODO
  *	- update root hub emulation
@@ -846,6 +855,105 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct=
 urb *urb, gfp_t mem_flag
 	return ret;
 }
=20
+/*
+ * Find the earliest deadline among queued unlink requests whose target URB
+ * has not completed yet.  Requests whose target URB already came back via
+ * RET_SUBMIT have nobody waiting on them and are ignored.
+ *
+ * Caller must hold vdev->priv_lock.
+ */
+static bool vhci_unlink_next_deadline(struct vhci_device *vdev,
+				      unsigned long *expires)
+{
+	struct vhci_unlink *unlink;
+	bool found =3D false;
+
+	lockdep_assert_held(&vdev->priv_lock);
+
+	list_for_each_entry(unlink, &vdev->unlink_rx, list) {
+		if (unlink->completed)
+			continue;
+		if (!found || time_before(unlink->expires, *expires)) {
+			*expires =3D unlink->expires;
+			found =3D true;
+		}
+	}
+	list_for_each_entry(unlink, &vdev->unlink_tx, list) {
+		if (unlink->completed)
+			continue;
+		if (!found || time_before(unlink->expires, *expires)) {
+			*expires =3D unlink->expires;
+			found =3D true;
+		}
+	}
+
+	return found;
+}
+
+void vhci_rearm_unlink_timer_locked(struct vhci_device *vdev)
+{
+	unsigned long expires =3D 0;
+
+	if (vhci_unlink_next_deadline(vdev, &expires))
+		mod_timer(&vdev->unlink_timer, expires);
+	else
+		timer_delete(&vdev->unlink_timer);
+}
+
+void vhci_complete_unlink_locked(struct vhci_device *vdev, __u32 seqnum)
+{
+	struct vhci_unlink *unlink;
+	bool changed =3D false;
+
+	lockdep_assert_held(&vdev->priv_lock);
+
+	list_for_each_entry(unlink, &vdev->unlink_rx, list) {
+		if (unlink->unlink_seqnum =3D=3D seqnum && !unlink->completed) {
+			unlink->completed =3D true;
+			changed =3D true;
+		}
+	}
+	list_for_each_entry(unlink, &vdev->unlink_tx, list) {
+		if (unlink->unlink_seqnum =3D=3D seqnum && !unlink->completed) {
+			unlink->completed =3D true;
+			changed =3D true;
+		}
+	}
+
+	if (changed)
+		vhci_rearm_unlink_timer_locked(vdev);
+}
+
+static void vhci_unlink_timeout(struct timer_list *t)
+{
+	struct vhci_device *vdev =3D timer_container_of(vdev, t, unlink_timer);
+	unsigned long expires =3D 0;
+	unsigned long flags;
+	bool expired =3D false;
+
+	spin_lock_irqsave(&vdev->priv_lock, flags);
+	if (vhci_unlink_next_deadline(vdev, &expires)) {
+		if (time_after_eq(jiffies, expires))
+			expired =3D true;
+		else
+			mod_timer(&vdev->unlink_timer, expires);
+	}
+	spin_unlock_irqrestore(&vdev->priv_lock, flags);
+
+	if (!expired)
+		return;
+
+	dev_info(hcd_dev(vhci_hcd_to_hcd(vdev_to_vhci_hcd(vdev))),
+		 "peer did not reply to an unlink request within %d msecs\n",
+		 VHCI_UNLINK_TIMEOUT_MS);
+
+	/*
+	 * Reuses the teardown path taken on other peer failures, which
+	 * gives back all URBs waiting for their unlink reply.
+	 */
+	usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_TCP);
+}
+
 /*
  * vhci_rx gives back the urb after receiving the reply of the urb.  If an
  * unlink pdu is sent or not, vhci_rx receives a normal return pdu and gives
@@ -949,6 +1057,15 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct=
 urb *urb, int status)
 		struct vhci_unlink *unlink;
=20
 		spin_lock(&vdev->priv_lock);
+		if (!urb->hcpriv) {
+			/*
+			 * URB was just picked up by vhci_rx and will be
+			 * given back shortly; no CMD_UNLINK needed.
+			 */
+			spin_unlock(&vdev->priv_lock);
+			spin_unlock_irqrestore(&vhci->lock, flags);
+			return 0;
+		}
=20
 		/* setup CMD_UNLINK pdu */
 		unlink =3D kzalloc_obj(struct vhci_unlink, GFP_ATOMIC);
@@ -968,6 +1085,17 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct=
 urb *urb, int status)
 		/* send cmd_unlink and try to cancel the pending URB in the
 		 * peer */
 		list_add_tail(&unlink->list, &vdev->unlink_tx);
+
+		/*
+		 * Tear the connection down if the peer leaves this request
+		 * unanswered past its deadline; timer_reduce() keeps any
+		 * earlier pending deadline armed so newer unlinks cannot
+		 * starve it.
+		 */
+		unlink->expires =3D
+			jiffies + msecs_to_jiffies(VHCI_UNLINK_TIMEOUT_MS);
+		timer_reduce(&vdev->unlink_timer, unlink->expires);
+
 		wake_up(&vdev->waitq_tx);
=20
 		spin_unlock(&vdev->priv_lock);
@@ -1029,6 +1157,13 @@ static void vhci_device_unlink_cleanup(struct vhci_dev=
ice *vdev)
=20
 	/* give back URB of unanswered unlink request */
 	vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
+
+	/*
+	 * Wait for any running watchdog callback before vhci_device_reset()
+	 * clears the port so a racing timeout cannot queue a stale teardown
+	 * event against a later attachment.
+	 */
+	timer_delete_sync(&vdev->unlink_timer);
 }
=20
 /*
@@ -1143,6 +1278,8 @@ static void vhci_device_init(struct vhci_device *vdev)
=20
 	init_waitqueue_head(&vdev->waitq_tx);
=20
+	timer_setup(&vdev->unlink_timer, vhci_unlink_timeout, 0);
+
 	vdev->ud.eh_ops.shutdown =3D vhci_shutdown_connection;
 	vdev->ud.eh_ops.reset =3D vhci_device_reset;
 	vdev->ud.eh_ops.unusable =3D vhci_device_unusable;
@@ -1267,6 +1404,7 @@ static void vhci_stop(struct usb_hcd *hcd)
 	for (rhport =3D 0; rhport < VHCI_HC_PORTS; rhport++) {
 		struct vhci_device *vdev =3D &vhci_hcd->vdev[rhport];
=20
+		timer_shutdown_sync(&vdev->unlink_timer);
 		usbip_event_add(&vdev->ud, VDEV_EVENT_REMOVED);
 		usbip_stop_eh(&vdev->ud);
 	}
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89837..c71645499a7b 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -63,6 +63,8 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
=20
 	spin_lock_irqsave(&vdev->priv_lock, flags);
 	urb =3D pickup_urb_and_free_priv(vdev, pdu->base.seqnum);
+	if (urb)
+		vhci_complete_unlink_locked(vdev, pdu->base.seqnum);
 	spin_unlock_irqrestore(&vdev->priv_lock, flags);
=20
 	if (!urb) {
@@ -123,6 +125,8 @@ static struct vhci_unlink *dequeue_pending_unlink(struct =
vhci_device *vdev,
 			usbip_dbg_vhci_rx("found pending unlink, %lu\n",
 					  unlink->seqnum);
 			list_del(&unlink->list);
+			if (!unlink->completed)
+				vhci_rearm_unlink_timer_locked(vdev);
=20
 			spin_unlock_irqrestore(&vdev->priv_lock, flags);
 			return unlink;

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
--=20
2.32.0

