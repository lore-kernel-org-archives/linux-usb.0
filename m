Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA7364E98
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783875641; cv=none; b=kdWTHr0JRsdHcnThm5BBpXEaML/pSkyOfjLhz1aSh+iXGEAeLtzHa2QPpiTJK/dt3QmfoSEEj9RIK55geBW0Bo6Oo4WqVo2IgJva3u1oASbDfEmxYjm6r88eGcEGs66hHM6EgH11tyeeUGpas0vjIadSih7el2mWaF+xJr3GPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783875641; c=relaxed/simple;
	bh=/gh2oI/rhVZqMAzhUzsYKqioJWGzuqDMFDGofGOqRnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JnQmVuiJ0C/XJqrV0LJut0oG+w5/l7kFYwlL86c/H4Z/kssxpIIlfv/Pk/O1NHsF8WvygRIis/rc6GhBaDDWztLbfqp255QPTCscqZoRO+asq8TEyWCC3mvSXNcC0giKtbqFxxif8YXFgZ4trmxdBSFqrfMzHnJZ51lufukljPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GH3U4I96; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GH3U4I96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=U4
	+pUgiExEUL+gjw1u62dhG26bzlo9VX9Xi7I9X30m8=; b=GH3U4I96SMDClbigAv
	YUV962dlWnSFZ9uWQe36R/JCbT1RK8Jrpl5qO+3UMU+49F06Nj75ZkNyK5ZC8wac
	uZJA8mDG4gbKvP2787eZt4Rjtar7IRU1etMxCSEWYSWjSWDMVSm/GyR5tnUFXujy
	0Qvk9jhUAR0Jyi5rNGUtemBfg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAXgJIeyFNqCkxiIQ--.5997S2;
	Mon, 13 Jul 2026 01:00:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt URB callback
Date: Mon, 13 Jul 2026 01:00:12 +0800
Message-Id: <20260712170012.3503601-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgJIeyFNqCkxiIQ--.5997S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1fKFy8tw1UXw1DArWUJwb_yoW8Wr4rpr
	ZxKayjvrs8XrW7Xw13AF1fAryrAw4kXa42g392v3yFvrnxJr1Fva43tFyFva4xCF93XF1q
	vr4qya1xu39rAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRb6p9UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7x+o4mpTyB-9TgAA3n

The interrupt URB buffer is allocated in setup_port_interrupt_in() based
on the endpoint's wMaxPacketSize:

    buffer_size = usb_endpoint_maxp(epd);
    port->interrupt_in_buffer = kmalloc(buffer_size, GFP_KERNEL);

When a USB device declares wMaxPacketSize = 8 on its interrupt IN
endpoint, the buffer is allocated from kmalloc-8 cache (exactly 8 bytes).

If the device sends a short packet (actual_length < wMaxPacketSize),
the URB completes with status == 0 and the callback proceeds to read:

    data[sizeof(struct usb_ctrlrequest)]

which evaluates to data[8], accessing 1 byte beyond the allocated 8-byte
buffer. This results in a slab out-of-bounds read.

Fix this by adding a bounds check before accessing data[8], ensuring that
the actual length is sufficient to contain a full USB control request
header.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/usb/serial/option.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 4c4009b8a46d..4aae54e1eacf 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2672,6 +2672,13 @@ static void option_instat_callback(struct urb *urb)
 			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
 			return;
 		}
+
+		if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1) {
+			dev_dbg(dev, "%s: short interrupt transfer: %d bytes\n",
+				__func__, urb->actual_length);
+			return;
+		}
+
 		if ((req_pkt->bRequestType == 0xA1) &&
 				(req_pkt->bRequest == 0x20)) {
 			int old_dcd_state;
-- 
2.34.1

