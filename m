Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458398;
	b=xqbLu4JQ+Floccubq57TjM/JlRFo74/EQs+5rr5bR66LkynVl3s7YLZgKTChWKunj6uS
	 0Wy0HHktwXlYkgAHOG9UhFyoC1b05cEsv3J3X2iMIQY3Z9fgKleqU3ADuWIGTnbRQYtxn
	 ny4e/y7y3YqtZ3eYMwAhTlLJh97W1Y9Ch0vMN7PLTuJ9qylHBnLn1p32QsMC5FMWQy/uY
	 AhB5FjapVuSpKBuB06K4jj47NUqfyNvjtVOjH5Q4TrNnFXUeqlEa3FuSDUPQRb8nDcvIp
	 kZg3Zl1t1Drsz1/PO2r/q6MZCYKZUMdbH9DyCUY16liUpnn8UCBB282cHf/PSgjezNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458398;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vApd+m8RjiogfgCrcacegjW4GNTe7fU7dT0IqvHT2vc=;
	b=io5oZroi533DquqhdS2lJMSFjw684hWgCcPYn7HbyYftMMJw+N16i45rpRvLbaMCRs9b
	 0XMclcQA0xaiC935l3Ga1N0b+uda7lxQHyNDOsw0dggFsMUM8kKlDI7NWv9NftCeztq/6
	 4WC//OTjE4ei7EJW0Ko1qArXmXOwy5/41HtDRGNDKsuusUVN/4gZqsjTbjJwqp3Bf7C93
	 SvlXaKCEyjZVlcD09I5ArPpyyMkEzZ+YXY9xbdUc1rL5oOHXCMJUOR+lYJQpEQg3c5IY5
	 Y0s/ozzS9jFkOzkRprxV4mesPTfokYZqQHP/ZfXePsNUKqDVYm2IDa9Glo0RyX/xQgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eYrQd/4O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4107606A31A;
	Mon, 23 Nov 2026 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYrQd/4O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795458398;
	b=N9zqtyRrcxzi/v6zYAB5pJLuCgQq3X7t1BI1UTEeJt945huxDtaPJ4zq5nSgfc376rmd
	 GEc36LKXu95SyZJNbx4GOCh/ZkTmah3RyRIl/ADGKmagcSVqubQKjCekNnred1XxfZhDx
	 XjuoFvyqy+E0v6UxgTiROOzVF0kkSli7uEw89RcmiRzqncvOZ7C8heV4qHAlvbFKtZ91B
	 PhX40HxQtM8Tgwy9INvGxPCulrmBnl2o3BG7RZ9Dg0a6GhNmkY+5QqUbN3vi0pBBTtKTD
	 YX1xJCmO5ZAv/fO/Zw0GruWQWo+zt62Bx4HmLXZv0vUokdeQvMMDQMW2OWQSBTfshhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795458398;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vApd+m8RjiogfgCrcacegjW4GNTe7fU7dT0IqvHT2vc=;
	b=0KeIYslpaVMpYKXJqf7AQB1lq88rK1OzjlHbwUsb/xeknh6RFsWfGY06Vz2t5vwhpBrU
	 P7B4uf/PWP5CoBcHqT5IhqKSXWLhUumQA5vPcyIKc5eXghWvBOWHHhytsiuUbz5qJija0
	 wXOyRc3KzKtUO3+OIfoKa0Vk4ZixLVosTCM2RbokSHHLvnjQuU4x1Xf+CpN/HAuNACq45
	 Vl0shMWHUYfIU/mFXrlq9l5Aiv4e4S2pITS+g6TNBqYdxG67X7ei6IoGoEWQ90nLISf9N
	 8abGpC3VSBQatF0pubnJLiPDE0WOmd0GJNLQHMlKJE+W3dDHK4jf5pLoe9D3VLeZ/0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5ACD1F000C6;
	Mon, 23 Nov 2026 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458398;
	bh=vApd+m8RjiogfgCrcacegjW4GNTe7fU7dT0IqvHT2vc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=eYrQd/4ObldxlEvoUORYGzQqG/dQ2sxNxaCH+cXW3NCzfwMh4lYQP1Leoszw+o32o
	 lJUFN2vxwukdmdi7w98Ezieh+U+/Xr/YyCF9o3h4uibPs1KClgjCLJhPSeS9VB0GDA
	 Sg6sbu51zvUQXCMu8v+gkGMZul8vArd9d4ygOFE2s9ZUDRvkRUC5CxMxkDDWYCotLl
	 s/SR8s91yg/eWWYFn3phfaY4a89OYPSWpJ6FJEHOMFzGO4XXZNuzYYbHxWmhJxgFh4
	 gujgjQDBI/tnUndvsLXYSvn2dFygGNYQvkdc/4dvP0y1dLle3cWEkS2JGorCObQ0Z/
	 uIv9Oq7GmYcbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 41C1C4C5A0;
	Mon, 23 Nov 2026 18:26:34 +0000 (UTC)
From: Alex Kononov via B4 Relay <devnull+alex.albefly.com@kernel.org>
Date: Mon, 23 Nov 2026 13:26:32 -0500
Subject: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
X-B4-Tracking: v=1; b=H4sIAFeFBGsC/x3MMQqAMAxA0auUzAZsK4JeRRy0iZqlSopFkN7d4
 viG/19IrMIJRvOCcpYkZ6ywjYFwLHFnFKoG17reWufxOYLgmVn1jkjrjjyQ954sU+egZpfyJs+
 /nOZSPse2GBxiAAAA
X-Change-ID: 20261123-xhci-overrun-dbg-e9d333d1ed42
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michal Pecio <michal.pecio@gmail.com>, Alex Kononov <alex@albefly.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458394; l=1879;
 i=alex@albefly.com; s=20261123; h=from:subject:message-id;
 bh=u+iI1iAggLCRGR0rnKKFeDkRp02wixUihtaOmHnQhog=;
 b=BFA99X9w25yNj5WzNcCScet0Hzq+cz0KIYve1wY7kDXm51PxKZGZFfQT8ElFnnZf2BjR/bWTY
 gvvaCQNu3GvBo1YMbsL9dzh5HkpAhjp/rFBB8qn48edCVxKm3RpVz2p
X-Developer-Key: i=alex@albefly.com; a=ed25519;
 pk=ixYEiZnk4RC7w0j2uj7JxJC3KhroqtYXGx4EgLM0u/0=
X-Endpoint-Received: by B4 Relay for alex@albefly.com/20261123 with
 auth_id=1618
X-Original-From: Alex Kononov <alex@albefly.com>
Reply-To: alex@albefly.com
Content-Transfer-Encoding: 7bit

From: Alex Kononov <alex@albefly.com>

An isochronous Buffer Overrun event means the device sent more
data than the TD could hold.
This is triggered by the device, not by a driver bug, and the
error is already reported to the class driver as
-EOVERFLOW in iso_frame_desc[].status.

Logging it with xhci_warn() can flood the kernel log.
A USB S/PDIF adapter (262a:9123) whose S/PDIF input loses its
signal produces this event on nearly every microframe,
about 7,200 messages per second, keeping systemd-journald
busy at 100% of a CPU.

Use xhci_dbg() like the other device-triggerable completion codes.

Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Alex Kononov <alex@albefly.com>
---
As suggested by Michal and agreed by Mathias in the discussion:
https://lore.kernel.org/linux-usb/2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com/T/

COMP_BANDWIDTH_OVERRUN_ERROR is arguably device-triggerable as well and
has been reported to flood logs (https://bugs.debian.org/1035939);
I left it alone here. Happy to send a separate patch if you think
it should get the same treatment.
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a1fa188680f5867e151c32ab94e2218cd6e26864..39d214e8a0289ec0b86e75833a566c2b7a91adb8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2815,7 +2815,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			  slot_id, ep_index);
 		break;
 	case COMP_ISOCH_BUFFER_OVERRUN:
-		xhci_warn(xhci,
+		xhci_dbg(xhci,
 			  "WARN: buffer overrun event for slot %u ep %u on endpoint",
 			  slot_id, ep_index);
 		break;

---
base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
change-id: 20261123-xhci-overrun-dbg-e9d333d1ed42

Best regards,
-- 
Alex Kononov <alex@albefly.com>


