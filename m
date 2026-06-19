Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F286331;
	Fri, 19 Jun 2026 00:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781828935; cv=none; b=R460qfxIWDbASAxWAF3cvKUZnHrwMfmjzlOIVGYZiv/HdBTmkQpQivKZJ1c58QNG4IfQCURXoQTKR+rlCmgjkBqOYx6x/BNdS5YwSuBz9o1GPJZAa9ZnVzZJZ4JlOFZH5XFT0WGJzK6Zphb45Xpk0lcRPMc3yfjrytl8VcfnG0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781828935; c=relaxed/simple;
	bh=a7J2vjFOpzjFBVE77dN1yd66J+NGlsSCBrq+iApzqd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ky/QgglRW6ZfuwGQs5rtb1xlFlhRE8yXonEsaRLCNL4L/i3ZXoblDrmLzakePOFHubY5udSi4totw0goJEBjXAMsvaBRhCOaOU/Bvy0kCGqOFnhvt6oe1onaf1Qlh86tWwxDlE3MDBUye3b9mm6LSCYb/K8fyB7yE+w2I0z1Dng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvOKG3SV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvOKG3SV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9103FC2BCB0;
	Fri, 19 Jun 2026 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781828935;
	bh=a7J2vjFOpzjFBVE77dN1yd66J+NGlsSCBrq+iApzqd0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BvOKG3SVosm1H0BkCj2WJmptfKzwCMKc353zwEWaFaRbH8i6H5FQnpRrukAM+Ogz1
	 Jkf+IHqALcjpbOcEzaBL17LvO8JTUUP89xBuXAw9c8ZK4lMXn6ZpscBx3wk33hzJrD
	 +64TfQE87lgzKNpSETbgB7tX2HnM9dAjxSTS4Lm+CN1FtlIvzizfYmFIqdvyDyQ/2P
	 0gLvGdf6AkwuMygGnHgD0JsS1FPvvc/R81xLlKKZKkPlOk71licIwb8pbe9S2IPTCo
	 PiItoKhcgh3JWWoBTFEAjlFb6hENsCcoQAr2ri6qU6fnvZ9VLAnLwrCTRFvzDhDRq7
	 b+lT+J8Z3tdxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78150CD98FA;
	Fri, 19 Jun 2026 00:28:55 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Fri, 19 Jun 2026 10:28:49 +1000
Subject: [PATCH] usbip: vudc: fix NULL deref in vep_dequeue()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23IIPEOpXokO1W+3FTFEC6d+Tj
 jMwUyFxFE4wdhUiF0ly+Qa672A7F38wCjUGo4xTTg+Y0yoBS6YNie/MuMuDZLUjtmR37aClIXL
 T/3aa3/cDPmYkymYAAAA=
X-Change-ID: 20260619-usbip-vudc-deque-fix-d316de3d3f16
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krzysztof Opasiak <k.opasiak@samsung.com>, 
 Igor Kotrasinski <i.kotrasinsk@samsung.com>, Karol Kosik <karo9@interia.eu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781828934; l=1715;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=JVJhd3pJhD1WvH0uTHxGI5DtrMLVc93YCbkxWy2vbjU=;
 b=mCvH0QQzyVr4xaU1WgxDh4XXu3UvflWoTXd75tyXz6TTb4J5HwEzGc1+dNKLWe//gJhRa2cag
 9xZhwOm4ohiBZkvFeuZBqf8O0nIE2mEjFFls/Xt6x+f0Y9fMt8Wggj4
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Sam Day <me@samcday.com>

vep_alloc_request() wasn't initializing vrequest->udc, so cancellations
on the FunctionFS AIO path were arriving in vep_dequeue without a valid
UDC reference.

AFAICT this bug has existed for ~10 years. Seems that nobody has really
stressed the FunctionFS AIO path on usbip's vudc.

I tested this fix in a QEMU aarch64 guest driving FunctionFS endpoints
via AIO. Before the fix, running `usbip attach` from the host would
cause the guest to oops with the following backtrace:

Call trace:
 vep_dequeue+0x1c/0xe4 (P)
 usb_ep_dequeue+0x14/0x20
 ffs_aio_cancel+0x24/0x34
 __arm64_sys_io_cancel+0xb0/0x124
 do_el0_svc+0x68/0x100
 el0_svc+0x18/0x5c
 el0t_64_sync_handler+0x98/0xdc
 el0t_64_sync+0x154/0x158

Assisted-by: opencode:openai/gpt-5.5
Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
Signed-off-by: Sam Day <me@samcday.com>
---
 drivers/usb/usbip/vudc_dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index c5f079c5a1ea..2f1f141909b2 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -279,15 +279,18 @@ static int vep_disable(struct usb_ep *_ep)
 static struct usb_request *vep_alloc_request(struct usb_ep *_ep,
 		gfp_t mem_flags)
 {
+	struct vep *ep;
 	struct vrequest *req;
 
 	if (!_ep)
 		return NULL;
+	ep = to_vep(_ep);
 
 	req = kzalloc_obj(*req, mem_flags);
 	if (!req)
 		return NULL;
 
+	req->udc = ep_to_vudc(ep);
 	INIT_LIST_HEAD(&req->req_entry);
 
 	return &req->req;

---
base-commit: 5cd1731cc883a9914d91e3b93d4597317b5b5339
change-id: 20260619-usbip-vudc-deque-fix-d316de3d3f16

Best regards,
-- 
Sam Day <me@samcday.com>


