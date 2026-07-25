Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55941A6813;
	Sat, 25 Jul 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996915; cv=none; b=V6z53YjXHz5/Fql3X08QWlr+pgndWefH1fe4W6l7xiTFmtGUNtpEKW5YEL8WxSSArBhkeQSUJSwy4jNWRM/+eDsja/fAWAKmjjCFJDnjLB2wsvfZ3WUkkKzvGJHaBXVeqOXiHV99dBVWYt6raAZ8TzN8ngXqyzgkiM++U74a94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996915; c=relaxed/simple;
	bh=U3qQjuRNPpLfY7TrgJ3WRG2Wisb1hB9F3UEm+VvkDtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Smfg+y/f1+U8TUnLGJvciKeQOw+uyir+feeZl5rr9++Ni/0c5g8/d8gnJjxDwqBPmgC1i0IgOKzvi7Y0XKvq5XTB6TraEISNHT4NLZbMx8KF46+8JGjyJkBduFTSVjtGaDqfxQhAeP/ZCEkTfwoebp7PT93WeX7Bb4SptOUoFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OVu7k7V1; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OVu7k7V1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VH
	N+v7M01kQQBD++2huMW3GagxOuhUS523J0kslKRhY=; b=OVu7k7V1mUkIGvDvtt
	I3lEhRl3mzdeasZfi4wgm5xcgfS3GGzMddcirFbVjB1B6Ai0n6/Nt02ZBCwbIwLL
	w8mXF5LL757drrziDX95NC8CMmHM+N5tVYc/WAJWPvqY6+8dK5poGSDkGlMGuo0J
	hY3Xdt0Au1+XWVXh6cpUiNpCk=
Received: from pc.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCn5fMI5GRqXb4wIQ--.49959S2;
	Sun, 26 Jul 2026 00:27:53 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2] usb: serial: fix slab out-of-bounds read in interrupt URB callback
Date: Sun, 26 Jul 2026 00:27:51 +0800
Message-Id: <20260725162751.1045657-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCn5fMI5GRqXb4wIQ--.49959S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWfZw4fCFW7Gw15KFWrAFb_yoW5XFy7pF
	W3Kayjyrs8Jry3tw17AF4fAry5Aws7Xa42kr97t34SyrnxJr1Yva43KF9YqFW7Cr93XF10
	yrWqvFsxuryqyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi89NxUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AruKWpk5AqeyQAA3K

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

Fix this by splitting the bounds check into two: first verify that the
actual length is large enough to contain the struct usb_ctrlrequest
header before accessing req_pkt->bRequestType and req_pkt->bRequest,
and then verify that there is an additional byte for the modem signal
state before reading data[sizeof(struct usb_ctrlrequest)] inside the
conditional.  Use sizeof(*req_pkt) instead of sizeof(struct
usb_ctrlrequest) for consistency.

Changes in v2:
- Split the bounds check into two separate checks: one for the
  usb_ctrlrequest header (before the conditional) and one for the
  modem signal state (inside the conditional), as requested by
  Johan Hovold and Oliver Neukum.
- Use sizeof(*req_pkt) instead of sizeof(struct usb_ctrlrequest),
  as suggested by Greg Kroah-Hartman.
- Link to v1: https://lore.kernel.org/all/20260712170012.3503601-1-yaojiale02@163.com/T/#u

Assisted-by: Claude:deepseek-v4-pro
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/usb/serial/option.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 4c4009b8a46d..caef872a3c40 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2672,12 +2672,25 @@ static void option_instat_callback(struct urb *urb)
 			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
 			return;
 		}
+
+		if (urb->actual_length < sizeof(*req_pkt)) {
+			dev_dbg(dev, "%s: short packet: %u bytes\n",
+				__func__, urb->actual_length);
+			return;
+		}
+
 		if ((req_pkt->bRequestType == 0xA1) &&
 				(req_pkt->bRequest == 0x20)) {
 			int old_dcd_state;
+			if (urb->actual_length < sizeof(*req_pkt) + 1) {
+				dev_dbg(dev, "%s: short interrupt transfer: %u bytes\n",
+					__func__, urb->actual_length);
+				return;
+			}
+
 			unsigned char signals = *((unsigned char *)
 					urb->transfer_buffer +
-					sizeof(struct usb_ctrlrequest));
+					sizeof(*req_pkt));
 
 			dev_dbg(dev, "%s: signal x%x\n", __func__, signals);
 
-- 
2.34.1

