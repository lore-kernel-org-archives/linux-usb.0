Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FF44DB73;
	Tue,  4 Aug 2026 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855774; cv=none; b=a5TUvLsf/EVKsKBbUYe4Bb9y79P/x79ihKYbkCzXxvW7eLhHXCiferM4nh1+HwlV7OwE6Tl4jEpKLVS3QN7akITMUakppb+FWrVRpnEzMzcQV7rtKZLe89knmJHkx1q9A9b/o83lD7MGvLqg9M3SRYvT+d01UDmXsK6Z8i+Sx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855774; c=relaxed/simple;
	bh=p9sSAQckyN6YNEPYfVr0Mp/hEVY97uneL0c8SXCfHJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OBt6iNYStOQfWegayywhYDJCYxxaBOYCkitffUNnWqYqexa+9QpK4P0j6OoVERnDkz3/LT8w470G/lIE5MJzZrRspCTz8VxIGjyttkoKNZPXGnHPhbRSJIrVVZj4DUOhNNzgT2VlE6HzBgSacHaVKvZwgPQiIXOISk8uemSaXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv29wc57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv29wc57"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2E26C2BCF4;
	Tue,  4 Aug 2026 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785855771;
	bh=p9sSAQckyN6YNEPYfVr0Mp/hEVY97uneL0c8SXCfHJc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gv29wc57hyNn9rs/bEypBXHdO+Nd5ClAhT2GM+5CJ2PlUV7aPACHl3TAUL74E/2iH
	 Mg7oX7OyJT8IJuBPNf8Ck0iy87N7wsdNk891H7UAQ9WeoYgpxl6sCdlIgnAwo5VGUH
	 3y0eGnJlc4To60TCeKSllei12qYZpd26lZe8yNzAlDqSFQG6SyEpQRuUrWcaINpmiv
	 uCZKyhuZPDOvFlRAgOZ6bgAiO241PgriiUaz/mVkllZXGAWGc8asaMIPXPhruqIUh7
	 9uXhjXwHh0U0VgKM7Cf9Wy3+9aRFrpRbtutqBTN+oUojalSr28dsFSwGQC8bFUFr1T
	 WZH102Usv4u7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE82BC55822;
	Tue,  4 Aug 2026 15:02:50 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 20:32:50 +0530
Subject: [PATCH v3] usb: raw_gadget: fix use-after-free when UDC is removed
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-raw-gadget-ep0-uaf-v3-1-bb7cf1d892af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ7CIBAGX6XhLAZoaRtPvofxsMC2xdifQIuap
 u8u1IsnzZ4m+XZmJR6dRU9O2UocBuvtOETIDxnRHQwtUmsiE8FEyWpWUAcP2oJpcaY4MbpAQzm
 DWihjQCpN4uPksLHPXXq5ftgv6oZ6Tqa06KyfR/faq4Gn3c9A4JRTVtXxqtwAl+e2B3s/6rEnK
 RDEf4WIihykQVOUoCT7Vmzb9gZFmA9aCQEAAA==
X-Change-ID: 20260804-raw-gadget-ep0-uaf-10a82bdda5bc
To: Andrey Konovalov <andreyknvl@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com, 
 Anuj Bolewar <bolewara@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785855769; l=3861;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=9HHZvo2aa/FJzquprkweq3XaHjJz/PlTTjlhPeXxzqM=;
 b=cOBn1KgZttb+i0l/66Xwb+JEhAn5RmQ7zZ20MavfckkHIcf2dBDiKiRHOU/9TSvRVZlgLDKpY
 YoxU5H83r07DfBJGM64/OwtX7jTV0yZq0y+qYv+T/ELk8dVnglseIma
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

When the UDC is removed (e.g. dummy_hcd unbind via sysfs) while the raw
gadget fd is still open, usb_del_gadget() destroys the gadget device
and its name. raw_gadget keeps a dangling pointer in dev->gadget, and
ioctls dereference it after releasing dev->lock, leading to a
use-after-free in dev_err() when usb_ep_queue() fails.

Take a gadget reference in gadget_bind() and drop it in dev_free() so
the gadget device and its name stay alive for as long as the fd is open
and an ioctl may still dereference dev->gadget. gadget_unbind() only
marks the device as failed under dev->lock; the reference is dropped in
dev_free(), which runs only after the fd is closed and no ioctl can be
in flight.

Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Assisted-by: deepseek:v4-pro
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
The gadget device embedded in the UDC is destroyed when the UDC is
removed while the raw gadget fd is still open (e.g. unbinding dummy_hcd
via sysfs). raw_gadget keeps a dangling pointer in dev->gadget and
ioctls dereference it after dropping dev->lock, which KASAN reports as a
slab use-after-free in raw_process_ep0_io() (dev_err with a freed device
name).

Fix it by holding a gadget reference for the raw device lifetime:
gadget_bind() takes it, gadget_unbind() only marks the device as failed
under dev->lock, and the reference is dropped in dev_free() once the fd
is closed and no ioctl can still be in flight.
---
Changes in v3:
- Use scoped_guard() for the spinlock in gadget_unbind() per review.
- Add Assisted-by trailer per Documentation/process/coding-assistants.rst.
- Link to v2: https://patch.msgid.link/20260804-raw-gadget-ep0-uaf-v2-1-3a5ded46ab50@gmail.com

Changes in v2:
- Reworked per review: the gadget reference is now held for the raw
  device lifetime (bind until dev_free()) instead of the bind/unbind
  window, since ioctls dereference dev->gadget after releasing dev->lock
  and the UDC core owns the gadget's lifetime during bind/unbind.
- gadget_unbind() now only marks the device as failed under dev->lock;
  the reference is dropped in dev_free() after the fd is closed.
- Dropped the now-unneeded comment and switched the spinlock to guard().
- Link to v1: https://patch.msgid.link/20260804-raw-gadget-ep0-uaf-v1-1-07878773da15@gmail.com
---
 drivers/usb/gadget/legacy/raw_gadget.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7c..fb15ab6fc73 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -226,6 +226,7 @@ static void dev_free(struct kref *kref)
 		kfree(dev->eps[i].ep->desc);
 		dev->eps[i].state = STATE_EP_DISABLED;
 	}
+	usb_put_gadget(dev->gadget);
 	kfree(dev);
 }
 
@@ -302,7 +303,7 @@ static int gadget_bind(struct usb_gadget *gadget,
 	dev->req = req;
 	dev->req->context = dev;
 	dev->req->complete = gadget_ep0_complete;
-	dev->gadget = gadget;
+	dev->gadget = usb_get_gadget(gadget);
 	gadget_for_each_ep(ep, dev->gadget) {
 		dev->eps[i].ep = ep;
 		dev->eps[i].addr = get_ep_addr(ep->name);
@@ -329,6 +330,8 @@ static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
 
+	scoped_guard(spinlock_irqsave, &dev->lock)
+		dev->state = STATE_DEV_FAILED;
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
 	kref_put(&dev->count, dev_free);

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260804-raw-gadget-ep0-uaf-10a82bdda5bc

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>


