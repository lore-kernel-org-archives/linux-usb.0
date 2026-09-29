Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0951357E
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681307; cv=none; b=FEF9CbKaLAIklcqhHnvTB8kXtEXktm2dTFPvHl0E2Y/f2U8pbXirjDHG9+x9/Fd51+/N24+oTfpdhMeyLnPzwlWCnfj1LH29sv7IHfQ1jRLPcTHwSIVj2034A+zwLU+1E0Oe+psnodNQs0iYciADw1yTY5HCsPI7ZLy29AV/M9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681307; c=relaxed/simple;
	bh=7x9j/mQkz+9LqO2zN4yz7ILszVlzJ5BNxaCgRcCzcXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lv4z3lSzIl9LTUKk7JxmRta9ceFjIwH6L+HsZgBE3Ww1QH+wxGdD5bzxsqKa3TQrj55ty/SDnZ4YHTYuV8pxmZY6KOPh9DDqa+5lPzx2UZ8JWl6rEW6l5i3enG2rqWFZJcCCrBb9/NGOiVRN8JVqPdmXWXiVIxsX+yqeZli30xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZUbOOzg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZUbOOzg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso3257074a91.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681306; x=1791286106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uJK2jAccBhhhLsB7fWlTzcOgHsYndkPD1RuUGHrRxs=;
        b=LZUbOOzgsSPvc5YlY72gVXwGlZCyETCXSaZxJYP7Om3RW5V+diDU21vXPPzFqWi7/c
         dLlrahJ+5qGHaGqt2mbE8DZpqBZpZy/3ain4IJOMljspy4AGYI+txrMDnQcfmyPQMBWR
         Wf00lHrAaEKNbhZwNpfj+2W0iOn2xP+jrQBbI37IYsNrLEeh9ls1HVOK0cS0svAyGhMX
         uYsXBY67dsI2mBLfAK1FRArj6aEv9Ooip8IgjTxbJc7ryZrgLA7G7bkKhv6jCvDF31t1
         GK+y0g0CGcf2amGLlPpugmBHImpRrgab0lZSbuj6MBoywxZRRGKtoTIwHECM4HwOnnYX
         b6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681306; x=1791286106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uJK2jAccBhhhLsB7fWlTzcOgHsYndkPD1RuUGHrRxs=;
        b=UJgpUwGQMSDNGf2D/aNguwolxjvu9dJJ38OkdmMA97iVqkU7M5WmK22jdTuQnQ0mJ3
         sR1Ysdd59ggTojsNaqF+IvKk2283803m1kYNbA2m7mLgQtT8q8JlYq5Z2N6l9J4n9Ef7
         C9VKHWgYEa+MIi6xG/glzfUTo1cxyLtLcNAkB0ItGfbZdMj4z0T4i/sX9wyta0b0srJl
         z/qhfYw6pU7g7rQ71XZCOZf2RvxQzuXK57o1/g5YgUOY8GAvrEIJTSsnhk8HG3aMC7zo
         sLFA86tRttlnRKCnuIvufD3V54KDytmLYcg/Biy6Z1bta7Ix6C3lYZQj6t0yJtf+O6Ft
         iVXA==
X-Forwarded-Encrypted: i=1; AKwUvBwyOkpZBg6cSwVtQvSsujVmfYO1wUxP9Su5xZIyH165oNkHYV/vXd/aq3NbkouElVZIZ/4qQY+4FhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3gzsdteLD1h3iccLLs4dgo3F70+LO1dzRBiJ/4IBs0W4TLGO2
	O5EYSoJngkuxHSB4XAV/NK2Q9CsrbYuQKjo9GwscdT8d2a/qXudAomoV1GEo0A8d
X-Gm-Gg: AYBFou3/GaDW3uUM0Wzl5DNBNIvGfCEeointZpFWPqLqdSlOdwldWXMI4MwoQFCJOWy
	DZJferTKeWfum06HXtahkz8ydimCsZ8tQI4ss4OiOvjbTa+a5w5Ya4XYxkne5oFFftjRwLkISqz
	esWE3aPrgTOr9ZT+ZFbwP6ef0JHGm5UNu5MM0228Wx8X6d3BLgAuIgpYocETioF5zvITiouP7iq
	RBjaX9dqBmh6WNWqxpx851VmoV5ycFkkzUV84C0XqA+cGOF2mGO6mWKsZcyQKv6qzE/kTLJD21J
	0W1eyQPbyrKuP49aMdZFAMbW9vdbFbbRiMaMIzuvMzYefbXDuml7KdAUycr5mww/gpYGrxt/Bp/
	EXkmRNgwlM/TRa51H89e9eC+TQXYXBR73NDB/9+bbN+frdVDT6jzcYRcKHEbLG37nlw3J07BXJ8
	nozQWbXraKTP6JO3rBacfzadI9/oYhutpoer7pCmXiYFZB8/3wGqW5LE9bF2PosNvuxEKVaOwi2
	aT1qng1juEWDnVAnJsO3qs=
X-Received: by 2002:a17:90b:574d:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a099230a7fmr14962078a91.46.1790681305497;
        Tue, 29 Sep 2026 04:28:25 -0700 (PDT)
Received: from localhost.localdomain ([216.236.36.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm5162218a91.13.2026.09.29.04.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:28:25 -0700 (PDT)
From: xy521521@gmail.com
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH] xhci: check device notification type before forwarding wake event
Date: Tue, 29 Sep 2026 19:28:21 +0800
Message-Id: <20260929112821.60641-1-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

The xHCI driver programs the Device Notification Control register to
only enable the Function Wake device notification (N1), so any Device
Notification Event TRB received is expected to be a function wake
notification. handle_device_notification() does however not check the
Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
bits 7:4), and forwards every device notification event as a function
wake.

A host controller that delivers an unexpected notification type (e.g.
due to broken firmware or emulation) would trigger a spurious wake
notification on the parent hub.

Parse the notification type and drop events other than Function Wake
with a warning, mirroring the slot ID validation in the same function.

DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
(N1), while the event TRB carries the notification type value itself,
so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++++
 drivers/usb/host/xhci.h      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..af5d93a4e586 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1952,6 +1952,7 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		union xhci_trb *event)
 {
 	u32 slot_id;
+	u32 type;
 	struct usb_device *udev;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->generic.field[3]));
@@ -1961,6 +1962,14 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		return;
 	}
 
+	/* xHCI 1.2 6.4.2.7: Notification Type is DW0 bits 7:4 */
+	type = TRB_TO_DEV_NOTE_TYPE(le32_to_cpu(event->generic.field[0]));
+	if (type != DEV_NOTE_TYPE_FWAKE) {
+		xhci_warn(xhci, "Unsupported device notification type %u for slot ID %u\n",
+				type, slot_id);
+		return;
+	}
+
 	xhci_dbg(xhci, "Device Wake Notification event for slot ID %u\n",
 			slot_id);
 	udev = xhci->devs[slot_id]->udev;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..ec4bfeb4887c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -187,6 +187,8 @@ struct xhci_op_regs {
  * SW does need to pay attention to function wake notifications.
  */
 #define	DEV_NOTE_FWAKE		BIT(1)
+/* Notification Type value carried by a Device Notification Event TRB (6.4.2.7) */
+#define	DEV_NOTE_TYPE_FWAKE	1
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
@@ -996,6 +998,9 @@ enum xhci_ep_reset_type {
 #define TRB_TO_PACKET_TYPE(p)		((p) & 0x1f)
 #define TRB_TO_ROOTHUB_PORT(p)		(((p) & (0xff << 24)) >> 24)
 
+/* Device Notification Event TRB fields, 6.4.2.7 */
+#define TRB_TO_DEV_NOTE_TYPE(p)		(((p) & (0xf << 4)) >> 4)
+
 enum xhci_setup_dev {
 	SETUP_CONTEXT_ONLY,
 	SETUP_CONTEXT_ADDRESS,
-- 
2.32.0

