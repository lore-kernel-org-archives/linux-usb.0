Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950D40D566;
	Sat, 20 Jun 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781914692; cv=none; b=jt/U2947kLH7s8TnjOptH6mW1R3y2u4OYb2NHNhSKLyr3ca24p+RLY9V46IkZgTJRn8bdzhVvdsF4z8OqutZ03SwiX0p5/reCM9tDTlPF7gNAhqducjdU1/x4XxlQ/yJCu4qZ+rX3WfE5Cvzrb1ZJCEXbX7b+Ombrv6f0nOchEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781914692; c=relaxed/simple;
	bh=/IFzhCK+/F7bES44UwWGnLMwjN3GzVH28FNvCOUALBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EI1mkEQAvvaWe+UGsODU/k+bCxy+SuVPc7J4rr6ozLssrXSm2b4Mpiu4olbn8d4DN03PACNZsAYiBSH/Db04sLkLxBpe5RCczYAyegMyvk0Py60Gp/k/i1VQq3x4FipkhZGBAUlDKJK1RQ+MCTUseSRyZTghh0gv97BWZxUNQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObTu0XMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObTu0XMo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2668FC2BCB4;
	Sat, 20 Jun 2026 00:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781914692;
	bh=/IFzhCK+/F7bES44UwWGnLMwjN3GzVH28FNvCOUALBg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ObTu0XMomlev/12BDaza3edg2NVGfl1lWc27yUtcbeXKzP0/n28UAZYZb7Bw7KDK+
	 aDtXymK1fDd547o1oY2lYF0mvbtHGkj0viZt9+0r6jp3w4VULDR/HRq85uhTexCTGT
	 I8rYv+HaIC/vYtyveO7Tgx6tRHVVZ+SDpJHxgeIXULFSdwWLZxbn5/vgvKW1iYAdbE
	 1t7btu9RtM2Qqj8w+DpRToozNDkz0xBFmz/aBG6wDqXCPdIFrHc7aSidhdl02HNkjp
	 elczqAKi08fyuc3RNOZmJ2jlq5pQhBseHnhN4IFlZFwP2zbiyVaXJqibXAUz1ZywtR
	 7oWw3hRp0EAYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA54CD98FA;
	Sat, 20 Jun 2026 00:18:12 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Sat, 20 Jun 2026 10:18:09 +1000
Subject: [PATCH v2] usbip: vudc: fix NULL deref in vep_dequeue()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-usbip-vudc-deque-fix-v2-1-d1913ab4611b@samcday.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw7CMAwFr4K8xihOUKSy4h6oizZ2qRf9kNCIq
 urdCb0AyxnpzdsgSVRJcDttECVr0mksYM8nCH0zPgWVC4M11htPFS6p1RnzwgFZXotgpx9kR57
 FsevIQ5nOUYo+so+6cK/pPcX1eMn0s3+CmZCwMpau3rVUGXdPzRC4WS9hGqDe9/0LIPfhR7oAA
 AA=
X-Change-ID: 20260619-usbip-vudc-deque-fix-d316de3d3f16
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krzysztof Opasiak <k.opasiak@samsung.com>, 
 Igor Kotrasinski <i.kotrasinsk@samsung.com>, Karol Kosik <karo9@interia.eu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781914691; l=2322;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=GLmEAnmmolN7RmslJaZq0kmBP1DApWjkYarBGRustN0=;
 b=nWekajJaf3aB8Rh5eTaCmPpk14fgklWvp1yex74rN/oRns08oB5YnUvZ1ZmkCvmJRwMK/rURj
 bLtZGhBz9Z9ButjaPadysHxfbi1yS2k5pPpZZOS/tG4oOuI+jdgnJY+
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

Since vrequest->udc is never actually properly used anywhere, we opt to
remove it, and update vep_dequeue to obtain a reference to the udc with
ep_to_vudc(), consistent with the other vep_ ops.

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
Changes in v2:
- Reworked to remove vrequest->udc entirely and a call to ep_to_vudc()
  from vep_deqe
- Link to v1: https://lore.kernel.org/r/20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com
---
 drivers/usb/usbip/vudc.h     | 1 -
 drivers/usb/usbip/vudc_dev.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index faf61c9c6a98..5ef0e7d9b23a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -38,7 +38,6 @@ struct vep {
 
 struct vrequest {
 	struct usb_request req;
-	struct vudc *udc;
 	struct list_head req_entry; /* Request queue */
 };
 
diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index c5f079c5a1ea..f0a1a44c18e3 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -344,7 +344,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 
 	ep = to_vep(_ep);
 	req = to_vrequest(_req);
-	udc = req->udc;
+	udc = ep_to_vudc(ep);
 
 	if (!udc->driver)
 		return -ESHUTDOWN;

---
base-commit: 5cd1731cc883a9914d91e3b93d4597317b5b5339
change-id: 20260619-usbip-vudc-deque-fix-d316de3d3f16

Best regards,
-- 
Sam Day <me@samcday.com>


