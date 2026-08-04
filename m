Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6722C027F;
	Tue,  4 Aug 2026 04:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817530; cv=none; b=JkXqPdSm9QUCJyniF4NulUXHp0Oj1FjOltBMO0l+rgNkvVQ+AGVT82EvMx46xNvdbOKrLmLNfp80018QquiFfPiILwpc7iW/mt/egSJnY4WR9f97BLEjfNkBnFVkkhvd23iU6ZtKRA3gMoP8bNTrXNXMuQz1U8hiv5KAlXCnddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817530; c=relaxed/simple;
	bh=rM0mY0j877vcVz0fCL+Dk4GjYVnAT5MHVI831jFvFFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UDu4vQyGskQvrqrHug9bb0jqw8jIhztg7vYaO3tXc3D2FIZrucYatQ2TFtoYFv6VmJ202uWAZH8C6VsXexggRpFMW24IiWpqW88/z5E9beEC+P0GHhCULOKZrYBgX4O03yBEchZ6lnyjF87n2PTemU6Gw5i7gRaD0xY0ZDuRMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnkAgvmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnkAgvmj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36F18C2BCF5;
	Tue,  4 Aug 2026 04:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785817530;
	bh=rM0mY0j877vcVz0fCL+Dk4GjYVnAT5MHVI831jFvFFc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cnkAgvmjrkCFRcRH/sGNDz1lIjt6ByP/UzzJXfs9nmDmTb2ESLhb3D30uv+7/YYEL
	 jqTnHY647mBo7gWN7q7Xt9lKnBsI3cCCb7HNRbcPWYH7Yi0k+GUeBtjbvP0qyIAwCT
	 hHqAudpJ5kSSXnfW4qnoxKSuCalF9CKDgvMtGPP6A/0puAr+JtdHzbNXlax78TatRF
	 B5IgCJ2GRP2MWN3e2PcG2B8Ke7M7n+BCq4CxPv+HXRxFp5MHEjxD8R0AAGGoCGWkfm
	 AeLfA/lIpJ7qeZiw+QHd0GqJbq6njUHudxIv/1fZOAX32sYrHlTGEvtGXLsaDb5cPF
	 dCoBHf+Ut6uww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12728C55822;
	Tue,  4 Aug 2026 04:25:30 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 09:55:29 +0530
Subject: [PATCH] usb: raw_gadget: fix use-after-free when UDC is removed
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-raw-gadget-ep0-uaf-v1-1-07878773da15@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7VkIkCIq1QdnMQEM1CUAK2Eu
 DsBxjf8v0OSqJKgK3aIsmnS75RRvgpwA09BUH02GDINtVRh5B8G9kEWlJlw5R5L4tZY77m2DnI
 4R+n1f0/fn8dptaO45TrBcZzkdz6QdgAAAA==
X-Change-ID: 20260804-raw-gadget-ep0-uaf-10a82bdda5bc
To: Andrey Konovalov <andreyknvl@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com, 
 Anuj Bolewar <bolewara@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785817528; l=3419;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=qhiaYn09tLH9YWJZgXmuebtXULUgOs9TL6YTq4LuyUk=;
 b=awzMXsShbudvZ3SZ/9Omcmt6c/NHoRE5MBKLz0YotbE/PufH3c0jZ/NJU7hh5pjYiinHI8226
 IugLCdU07A/AgDNomOLpqCfWvpqIRJetqH6nLuNm7NXKB+pbutad9Nx
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

When the UDC is removed (e.g. dummy_hcd unbind via sysfs) while the raw
gadget fd is still open, usb_del_gadget() destroys the gadget device and
its name. raw_gadget keeps a dangling pointer in dev->gadget, and ioctls
dereference it after releasing dev->lock, leading to a use-after-free in
dev_err() when usb_ep_queue() fails.

Hold a gadget reference from bind until unbind and clear dev->gadget
under dev->lock, so ioctls either observe the gadget as unbound or keep
the device alive through the reference.

Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
The gadget device embedded in the UDC is destroyed when the UDC is
removed while the raw gadget fd is still open (e.g. unbinding dummy_hcd
via sysfs). raw_gadget keeps a dangling pointer in dev->gadget and
ioctls dereference it after dropping dev->lock, which KASAN reports as a
slab use-after-free in raw_process_ep0_io() (dev_err with a freed device
name).

Fix it by taking a gadget reference while dev->gadget is set and clearing
dev->gadget under dev->lock on unbind, so ioctls either observe the
gadget as unbound or keep the device alive through the reference.
---
 drivers/usb/gadget/legacy/raw_gadget.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7c..acc6e4799ee 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -303,6 +303,8 @@ static int gadget_bind(struct usb_gadget *gadget,
 	dev->req->context = dev;
 	dev->req->complete = gadget_ep0_complete;
 	dev->gadget = gadget;
+	/* Keep the gadget alive while the device holds a reference to it. */
+	usb_get_gadget(gadget);
 	gadget_for_each_ep(ep, dev->gadget) {
 		dev->eps[i].ep = ep;
 		dev->eps[i].addr = get_ep_addr(ep->name);
@@ -316,6 +318,10 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->gadget = NULL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		usb_put_gadget(gadget);
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
@@ -328,7 +334,19 @@ static int gadget_bind(struct usb_gadget *gadget,
 static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
+	unsigned long flags;
 
+	/*
+	 * The gadget is going away (e.g. the UDC is being removed), so stop
+	 * using it. Hold the lock to synchronize with ioctls that check
+	 * dev->gadget and may dereference it after dropping the lock.
+	 */
+	spin_lock_irqsave(&dev->lock, flags);
+	dev->state = STATE_DEV_FAILED;
+	dev->gadget = NULL;
+	spin_unlock_irqrestore(&dev->lock, flags);
+	/* Matches usb_get_gadget() in gadget_bind(). */
+	usb_put_gadget(gadget);
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
 	kref_put(&dev->count, dev_free);

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260804-raw-gadget-ep0-uaf-10a82bdda5bc

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>


