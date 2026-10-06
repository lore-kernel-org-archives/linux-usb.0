Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE184445AD5
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291433; cv=none; b=u9aivWDFe9ZVkyvZ9i6j/UuksBCLtMBJh96XmOm6aa4HEBVWZySf7OISLoIswhBohIqPrRfI1wa2batdk40H4Nim+1iR4WwyLG8STVL0q1I3D96IVMCeAg6+uhITZY44KUByN/eqRIU6XgMJeVk7cJ4hMos33UuUURwmH4FBbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291433; c=relaxed/simple;
	bh=IQzkSqogxGGRgXN1GzMR82u/VoXXG/33SfL7HSbceGo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AqXCQbm0O4X4gv36+Bd6GzZ89sp5BHUAIOdYgBLivBVbRGJndGixPP/kyadiBdgkP7mVhVoz7auoynW54Cbiz3Q7DBvhdZ1oNE78R/7gZ5BiDU6mYSN9FrduSsHQ7UV5gftBdupMtPffSY5vv3/URXV6ivRw2JmyKQ+CoAZz1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917bab38b14so32780916d6.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 05:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291428; x=1791896228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDV5pXUD41N70RN2FIh7Yk5bKSGu8mBxzH82CLXiukw=;
        b=RLnjaDrGISpm9AEE9IgUUMknOx2nix48KHlbcJLBXMNPJAqtzVQ1iJj9atjmQ1jfjE
         ND1SXaZ4lpplQvT3QQox1+J7cu/ftcngFurG9ftAULBtGAAGXe7xJ2Yp0gQ4xlvYg8JK
         ERxwvT9Gb8JZ/9xT8Qe5tfIysa6nbTn/4NwW0cBsJKXxOmERNM/kflU+CgxCtU3XwEAb
         mIWuG2Rk9trjq6o5mYt7wgJCJT3+j0ml9EecI1uqnGC7dRm9egsSPH6bfiLRz+OLbKCI
         cq0F91D6G21zYaCyUoVSJdCGAvN9SYZ5wi2oTL2smSXu00ZsVmiMlguT2sLzgXsU+zQi
         ZFNw==
X-Forwarded-Encrypted: i=1; AKwUvBzPpbzQ8Eb6d6UvFaxfu1HNB16VWA3bJ7fiklw78Zo52iINp6gWRaiUHqoNqwi0lks/utp0kHlDLfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsfgAvHCmr3HgNIrdrM9RvCtL6SCN6At1ScQs7cBOwsODfPE4C
	WTHMJmoeY3wkwWw96CVCskBGarhCt/b3RFmPG4dicRO4R8lSgB/Al0B0
X-Gm-Gg: AYBFou2e6KeQIrzbzMznxdgw+2QfgtMnzyrNdnj8TAXdPf6iBeXuGk+4nkalABKCFSD
	ZA2wvAJ82jYaCzbybuctPk2QnJgdHdWk7LtWYutDob0La8Q1Qvml3Y+L31dzmaUdYgEVRurOaqo
	TwU6NTDYaXU8Z/ZvWJvu1FmI/NFZn7VcweeWIKfixvUdjBwRWZYM6X5z/ao+tI8Vw78hPSGqHAg
	axuWo122XBLP6A7gqYVkNeFZBsT7VFAgKpXz0eXYnhkAvmqRgNW8Wpq4kFc4G5fyEARb1o5iIbT
	KF84Gnfa0GBWJqKKNYerqAsY5kI6Pp+hNVIxxVcBsjPWPTtJ0N5k9ynd+Jp5TrDdGwqt+fxSU/a
	e0Z617ok4l1Nw4/lJqDlrg2W/AAWKGh1or9Yx6xDU+0oXgkE59Ny/ipTtjJOX7Cu0BXXizKtzXe
	wqbYRDHRb87gWbJcPo8/aB8co8nnDd+bmu8UHzWuceP0ql1m0/Dp9VozLKffR0W6rblPNYWDSTy
	2iy/uG4YPfCRRFnHvQrCryhTxTk
X-Received: by 2002:a05:6214:29ea:b0:919:557c:f0a5 with SMTP id 6a1803df08f44-9198b7a2b91mr25577606d6.23.1791291428077;
        Tue, 06 Oct 2026 05:57:08 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c074desm112575806d6.38.2026.10.06.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:57:07 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	bgmerrell@novell.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
	syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
	syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Subject: [PATCH] usbip: vhci_hcd: time out unanswered unlink requests
Date: Tue,  6 Oct 2026 20:56:52 +0800
Message-Id: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
request is still unanswered past its own deadline.  The teardown
already knows how to give back every pending URB with -ENODEV, and a
RET_UNLINK that arrives late (or never) after that is handled by the
existing "already given back" paths.

The watchdog is cancelled whenever no request is outstanding.  Queueing
a request re-arms it to that request's deadline, so the callback does
not trust the timer's expiry: it re-checks the outstanding requests
against their own deadlines under priv_lock and becomes a no-op when
none has run out.  A peer that answers promptly is therefore unaffected.
Controller removal quiesces the device first - the event handler
stops the per-device rx/tx threads and drains the pending events -
and only then calls timer_shutdown_sync(), which also waits for a
watchdog callback that is already running, so the callback cannot
touch the controller after it is freed.

A similar fix was proposed as an RFC by the syzbot assisted-fix
pipeline; this version arms a single per-device watchdog instead of a
timer per unlink request.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Reported-by: syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=58aef18c1ad93d87652f24a0bc7a74b6d98ac710
Reported-by: syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=7ff8ae4abed51ff2354c1addb664143ec26ca588
Reported-by: syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=048da78aba1a3a6139509492b2be505b2d223762
Link: https://lore.kernel.org/all/1d6db53d-07ab-46ad-adc4-d09c95b2c83f@mail.kernel.org/
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/usbip/vhci.h     |  8 ++++
 drivers/usb/usbip/vhci_hcd.c | 83 ++++++++++++++++++++++++++++++++++++
 drivers/usb/usbip/vhci_rx.c  |  2 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..6222283d9551 100644
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
 
+	/* fires when the peer leaves an unlink request unanswered */
+	struct timer_list unlink_timer;
+
 	/* vhci_tx thread sleeps for this queue */
 	wait_queue_head_t waitq_tx;
 };
@@ -65,6 +69,9 @@ struct vhci_unlink {
 
 	/* seqnum of the unlink target */
 	unsigned long unlink_seqnum;
+
+	/* deadline enforced by the per-device unlink watchdog */
+	unsigned long expires;
 };
 
 enum hub_speed {
@@ -124,6 +131,7 @@ extern struct attribute_group vhci_attr_group;
 
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
+void vhci_stop_unlink_timer(struct vhci_device *vdev);
 
 /* vhci_sysfs.c */
 int vhci_init_attr_group(void);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..220051339445 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -19,6 +19,15 @@
 #define DRIVER_AUTHOR "Takahiro Hirofuchi"
 #define DRIVER_DESC "USB/IP 'Virtual' Host Controller (VHCI) Driver"
 
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
@@ -846,6 +855,67 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	return ret;
 }
 
+/*
+ * Is any queued unlink request past its own deadline?  Each request
+ * carries the time by which the peer must have answered it, and the
+ * timer may have been re-armed by a newer request before that, so the
+ * callback decides by walking the lists rather than by the timer's own
+ * expiry.
+ */
+static bool vhci_unlink_expired(struct vhci_device *vdev, unsigned long now)
+{
+	struct vhci_unlink *unlink;
+
+	list_for_each_entry(unlink, &vdev->unlink_tx, list)
+		if (time_after_eq(now, unlink->expires))
+			return true;
+	list_for_each_entry(unlink, &vdev->unlink_rx, list)
+		if (time_after_eq(now, unlink->expires))
+			return true;
+
+	return false;
+}
+
+static void vhci_unlink_timeout(struct timer_list *t)
+{
+	struct vhci_device *vdev = timer_container_of(vdev, t, unlink_timer);
+	unsigned long flags;
+	bool expired;
+
+	spin_lock_irqsave(&vdev->priv_lock, flags);
+	expired = vhci_unlink_expired(vdev, jiffies);
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
+/*
+ * Stop the unlink watchdog once every queued unlink request is answered
+ * or given back.  Safe from any context: a concurrent watchdog expiry
+ * re-checks the per-request deadlines under vdev->priv_lock and becomes
+ * a no-op.
+ */
+void vhci_stop_unlink_timer(struct vhci_device *vdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&vdev->priv_lock, flags);
+	if (list_empty(&vdev->unlink_tx) && list_empty(&vdev->unlink_rx))
+		timer_delete(&vdev->unlink_timer);
+	spin_unlock_irqrestore(&vdev->priv_lock, flags);
+}
+
 /*
  * vhci_rx gives back the urb after receiving the reply of the urb.  If an
  * unlink pdu is sent or not, vhci_rx receives a normal return pdu and gives
@@ -968,6 +1038,14 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* send cmd_unlink and try to cancel the pending URB in the
 		 * peer */
 		list_add_tail(&unlink->list, &vdev->unlink_tx);
+
+		/* if the peer does not answer this request within the
+		 * timeout, tear the connection down
+		 */
+		unlink->expires =
+			jiffies + msecs_to_jiffies(VHCI_UNLINK_TIMEOUT_MS);
+		mod_timer(&vdev->unlink_timer, unlink->expires);
+
 		wake_up(&vdev->waitq_tx);
 
 		spin_unlock(&vdev->priv_lock);
@@ -1029,6 +1107,8 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 
 	/* give back URB of unanswered unlink request */
 	vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
+
+	vhci_stop_unlink_timer(vdev);
 }
 
 /*
@@ -1143,6 +1223,8 @@ static void vhci_device_init(struct vhci_device *vdev)
 
 	init_waitqueue_head(&vdev->waitq_tx);
 
+	timer_setup(&vdev->unlink_timer, vhci_unlink_timeout, 0);
+
 	vdev->ud.eh_ops.shutdown = vhci_shutdown_connection;
 	vdev->ud.eh_ops.reset = vhci_device_reset;
 	vdev->ud.eh_ops.unusable = vhci_device_unusable;
@@ -1269,6 +1351,7 @@ static void vhci_stop(struct usb_hcd *hcd)
 
 		usbip_event_add(&vdev->ud, VDEV_EVENT_REMOVED);
 		usbip_stop_eh(&vdev->ud);
+		timer_shutdown_sync(&vdev->unlink_timer);
 	}
 }
 
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89837..32b1550839d2 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -179,6 +179,8 @@ static void vhci_recv_ret_unlink(struct vhci_device *vdev,
 	}
 
 	kfree(unlink);
+
+	vhci_stop_unlink_timer(vdev);
 }
 
 static int vhci_priv_tx_empty(struct vhci_device *vdev)
-- 
2.32.0

