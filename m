Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A33490BFE;
	Fri, 21 Aug 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317736; cv=none; b=cqFVF65CoeolvIxY0ucy8s0OzJaiXMNmBWvhI0x0C9cATTWbOHf++ZnGUJYcwNz1bguDLnoGUnMsPK3Fbwe5RMmrV85Syf9U9uJ8KjsAsEMXzpYAbTphQL1NYL23u/XkfWosFekJUcnpmE11yznVzattPC6WiULT6K/o2EFi9aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317736; c=relaxed/simple;
	bh=0wag83Q7tskPXJRBizXmK2wT/JnCcuZnkQswIB0zS1w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=huGdgaJXh4qMJNfqLKw/CFwd3RrkwPZgrFu8CoGcnfsbAwfkCeDol81/gbwtEQSAdsbn2Ddc8D39lfUFrRuIxO+kODI4wLvRnBzZy2J4UrD4/G5w/wf8gD0Kl3hSbF0EQFKm+6iPvYV9CFj64cEfrfqsWXgl6wlF2CRbHs5kO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QZnXKY7g; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QZnXKY7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787317712; bh=vqeUfK5KmqUcXVO9cY3trCzW9qBV9YNFh/9G5G055wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QZnXKY7gnxFmE2yEMof32k6tFrfs6WupBCksRZCj28trALJkD/HtMHDHCCczg7bpO
	 ydN+wYqyF/7FcO09r3SgmbmpJ/brZvc6zJTUy2KZJJ+aaFx/TyPGoeuqHCnGzrA83n
	 tRizQd6ndbd4K7B9uaqnRSWLS4CKe8qP1Y9GxvfI=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 21D10602; Fri, 21 Aug 2026 21:08:29 +0800
X-QQ-mid: xmsmtpt1787317709t55j7padg
Message-ID: <tencent_28325D965DCC99364FA08DA525A90DEC9207@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuGdP4hWhakNBXMy65moMuCxZXgNJkMQBus7/FXskc3c/O6RwqUA
	 aGqjwp2MAtFdfQiZylfdwBTc/fR6HsQEErdj3DhqUpocsDUGsOHJJ1xqN3Isfi0xX/bujENPkR7j
	 fhvku7v+u2xToIGu4fgoonZTdBSqVaqhnjJL0nWFuqhhWNqoin8zrgWgtOJeexBGkMuVHqgPWeMV
	 VJYiE88bwF77qY1+KKen+4npJCBKj7++Hnh5W4gxbB1P1xqIQAJ3QKfjteDTMt2SmiZzKkXjI1Es
	 92xC0lsUprfLRlyfoe7LYlKIGRBJ12ds9POYQ5/0aCUZeY+3bpumLzhZtQImUQ2rA8/XJZYTIcuZ
	 O36pkgKZGvAI9x5xwPwV1oObbd2deEWHkNGEj1bqdz0+Htg+WKhcOVhE7QlhFf9rAcpS/sKrZGBh
	 UkWloSaf3IzEkUi46pIcop1Z6wgJwh2xADPMwZ9Z0tRIAJhYiQfD5Uyr97CYhI7mpFVuu+BFd7uV
	 yFG5S/vwrEqb4MDPsPa0w5qKZtuX6JAZnkDXvPNzVGlsN5IntMWf7fYu6dNSs9BNg2f6JlU7mNNE
	 IQMncFWSekasXXYKT4KgJM0xlIrGRynxW5Su9a37VxpL2NzYKT5fkSwaV96vCarCdo6T9U3q39I2
	 U3HhDLKCIrYAmI7UCa34b8zPuoH4rB8x6dOMT1HFcXH/AopqXN2zCeTPyMEceRIptCmZGyOC6o6W
	 6FsbzErU/f1Fp8CxqVbKT5NwuRisbwfio2Sn5BgeCldbMlnO+lWgHHqi1I+MFnTdQOC+gg2+ft1m
	 ve6s7KaoB67zqabj4c8uOWEeR+cE4lAAtZWNXoFy8E+JCGBHXS7h9sTR4pRJlgqbsWNMxcSv970X
	 Nrqvz8T06us1yF0SSGCsJwM0QaOhMq3MYjH03BJqV3X/QqPfa3+AK67tT7fj0SWs7Qn/DMtrJm6X
	 mvMzKaffMzsjK5eDCmR4yQzSvgB5Xj9XkbXwv+ApxbWc/zW0FvKBNesGm1KfdVhF6UoY/3cYAvry
	 UTa2ifsf1OtU75emmfDeTrijZylbXUclR3jMlWGg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+ecbb1750082f7528b507@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	kees@kernel.org,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] usbip: prevent the use of unavailable urb and hcpriv in tx
Date: Fri, 21 Aug 2026 21:08:29 +0800
X-OQ-MSGID: <20260821130828.41907-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a871611.4d75e56a.c9a88.0041.GAE@google.com>
References: <6a871611.4d75e56a.c9a88.0041.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race condition between TX and RX causes the URB to enter an unstable
state, triggering [1].

Similarly, a race condition exists between TX and URB reaping, leading
to [2].

In vhci_send_cmd_submit(), the URB refer count is temporarily incremented
to prevent RX or the reaping process from prematurely freeing a URB that
has not yet finished transmitting.

The priv_lock is used to protect access to hcpriv, preventing it from being
prematurely freed by RX while TX is unaware.

[1]
BUG: KASAN: slab-use-after-free in vhci_send_cmd_submit+0xed2/0x10c0 drivers/usb/usbip/vhci_tx.c:91
Read of size 4 at addr ffff888022a66584 by task vhci_tx/6044
Call Trace:
 vhci_send_cmd_submit+0xed2/0x10c0 drivers/usb/usbip/vhci_tx.c:91
 vhci_tx_loop+0xff/0x460 drivers/usb/usbip/vhci_tx.c:241
 
Allocated by task 6031:
 usb_alloc_urb+0x66/0xa0 drivers/usb/core/urb.c:75
 alloc_async drivers/usb/core/devio.c:408 [inline]
 proc_do_submiturb+0x741/0x3820 drivers/usb/core/devio.c:1780
 proc_submiturb drivers/usb/core/devio.c:2002 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2702 [inline]
 usbdev_ioctl+0x2adb/0x3aa0 drivers/usb/core/devio.c:2826

Freed by task 6031:
 urb_destroy drivers/usb/core/urb.c:27 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb.part.0+0xa5/0x110 drivers/usb/core/urb.c:96
 usb_free_urb+0x1f/0x30 drivers/usb/core/urb.c:95
 free_async+0x358/0x530 drivers/usb/core/devio.c:435
 proc_reapurbnonblock drivers/usb/core/devio.c:2129 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2621 [inline]
 usbdev_ioctl+0x2e7/0x3aa0 drivers/usb/core/devio.c:2826

[2]
BUG: KASAN: slab-use-after-free in vhci_send_cmd_submit+0xe87/0x1110
Read of size 8 at addr ffff888020de4820 by task vhci_tx/9324
Call Trace:
vhci_send_cmd_submit drivers/usb/usbip/vhci_tx.c:158
vhci_tx_loop drivers/usb/usbip/vhci_tx.c:256

Allocated by task 9322:
vhci_urb_enqueue drivers/usb/usbip/vhci_hcd.c:674
usb_hcd_submit_urb drivers/usb/core/hcd.c:1542
usb_submit_urb drivers/usb/core/urb.c:586
proc_do_submiturb drivers/usb/core/devio.c:1968
usbdev_ioctl drivers/usb/core/devio.c:2003

Freed by task 9323:
pickup_urb_and_free_priv drivers/usb/usbip/vhci_rx.c:46
vhci_rx_loop drivers/usb/usbip/vhci_rx.c:66

Fixes: ddeee0b2eec2 ("USB: usbfs: properly clean up the as structure on error paths")
Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Reported-by: syzbot+ecbb1750082f7528b507@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ecbb1750082f7528b507
Tested-by: syzbot+ecbb1750082f7528b507@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/usb/usbip/vhci_tx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/usbip/vhci_tx.c b/drivers/usb/usbip/vhci_tx.c
index 32e6fabccf72..03fc070d5825 100644
--- a/drivers/usb/usbip/vhci_tx.c
+++ b/drivers/usb/usbip/vhci_tx.c
@@ -68,7 +68,9 @@ static int vhci_send_cmd_submit(struct vhci_device *vdev)
 		int ret;
 		struct urb *urb = priv->urb;
 		struct usbip_header pdu_header;
+		unsigned long flags;
 
+		usb_get_urb(urb);
 		txsize = 0;
 		memset(&pdu_header, 0, sizeof(pdu_header));
 		memset(&msg, 0, sizeof(msg));
@@ -85,6 +87,7 @@ static int vhci_send_cmd_submit(struct vhci_device *vdev)
 		iov = kzalloc_objs(*iov, iovnum);
 		if (!iov) {
 			usbip_event_add(&vdev->ud, SDEV_EVENT_ERROR_MALLOC);
+			usb_put_urb(urb);
 			return -ENOMEM;
 		}
 
@@ -92,7 +95,15 @@ static int vhci_send_cmd_submit(struct vhci_device *vdev)
 			urb->transfer_flags |= URB_DMA_MAP_SG;
 
 		/* 1. setup usbip_header */
+		spin_lock_irqsave(&vdev->priv_lock, flags);
+		if (!urb->hcpriv) {
+			err = -EIO;
+			spin_unlock_irqrestore(&vdev->priv_lock, flags);
+			usb_put_urb(urb);
+			goto err_iso_buffer;
+		}
 		setup_cmd_submit_pdu(&pdu_header, urb);
+		spin_unlock_irqrestore(&vdev->priv_lock, flags);
 		usbip_header_correct_endian(&pdu_header, 1);
 		iovnum = 0;
 
@@ -127,6 +138,7 @@ static int vhci_send_cmd_submit(struct vhci_device *vdev)
 			if (!iso_buffer) {
 				usbip_event_add(&vdev->ud,
 						SDEV_EVENT_ERROR_MALLOC);
+				usb_put_urb(urb);
 				goto err_iso_buffer;
 			}
 
@@ -143,8 +155,10 @@ static int vhci_send_cmd_submit(struct vhci_device *vdev)
 			       txsize);
 			usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_TCP);
 			err = -EPIPE;
+			usb_put_urb(urb);
 			goto err_tx;
 		}
+		usb_put_urb(urb);
 
 		kfree(iov);
 		/* This is only for isochronous case */
-- 
2.43.0

