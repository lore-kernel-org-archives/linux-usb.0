Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460424AE102
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474855; cv=none; b=jkJa9YGcrKThp6gTWKkRz7DW18yBb2IZfCU+HSSblIwzDmSTKVcpFndkJNOnOl53avyHmGo1mZuYwTDMIK1vmlu+a2/XkaUyA8IOv7a+noCO5QJiW68OYnYWJXr68tXdraYkEYScFdbW6ItXnxqwt7Wg4+kxX8qr6/APdCnYVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474855; c=relaxed/simple;
	bh=S1II56ylg/97q6dhjDqRpRIkCOMFFzoLox0FF2Ni0VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZOvfyBxtGDXQDEHydqTLtnpVls4BtwxrzOlHBjpm5pb2bLz1c4JvHtHhjVk9Qovmc6nRt+yW+/BnP5f2SR+GuvnmZaXjcJOoth+SL52GayP9HoMTiP7ZqP14/cmxIli920KqIpLOjlyjsrqz3gTGqmo5qQ+KZ59LIL7oqCtdwWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=dSLzE9l9; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="dSLzE9l9"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1914447a91.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1791474852; x=1792079652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sE8lwTNdLkYWc1LQF/cZxBSB3EKclBzuC8NPFeXmPwo=;
        b=dSLzE9l9Y6mYySM54duzz4qGRgu2KgjjVtRQYYg20qBU5iBdtH1SfI9KeoUivrcUkX
         DiTQsFcoan3vDnRDpREMSNMfTQzWEmvlsy5XTpxHbWteNwVpaVeCm+V3l1bCNJZREmzG
         ryEDojpMyTjCuPIGJKyjXfCpGOJioUcISNScgVRXNyFVYnc+IBxIkt3QLkajdTWi2792
         o84iZqPHaaX2ix/c4neK7lD33QZZk9LN5/84sGdA8At1cwvJtd1qibHnd6hdeJdoOgLn
         TbfnPdWT7wLzDOHPBNF9wi2EbesHOVbCP3Sc3te3uxNAizukOIM+xrAO4kcFA494yTkq
         janw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474852; x=1792079652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE8lwTNdLkYWc1LQF/cZxBSB3EKclBzuC8NPFeXmPwo=;
        b=jr5dIxuoyRsteORdSYI+71i8OwIhbB2iQEC6vhCtwVYfHFqeMxGa7f1qma9rFkOKH7
         9hl1wue2GZJxFEdkj7Q81VorQX8JDnEX8rLcwbSCkL24b1ZWH1B5AXPtwut1ZtJRs5qk
         UewbWC8wxPQdVblUR0RP0qTD1+oTrxmDcIPIQFHhWvPQfJGfZkHQDe/4w4bB4YlO21yq
         C0YWfXweS+Ecm0iuK4a4FJxXN7NVE16c3TiJmqAA+ptgQxau3sE1Knz2GM2LTs4uke6w
         vtlXUcpS9tkFCK7ApU7uHtIBALAq1BGJArhLI9W89aVTsSMbN4VdeZBMeE/sqalhwXs1
         DYOg==
X-Forwarded-Encrypted: i=1; AKwUvBxLS5sRHwXTfnH9o52N9duAiz0dSxg4NIAIozkIIURntklEphXLWxQbEd0l860jTSYfiQ4Z/WL2+6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjwo8G9eu0/67QTOhcpOEgRtfSNctOxlSUnTsKajIQxQMAiNFn
	bXCNAQ5OMiyikAu4MYC132uWeTQw0+uT7uOxo0We2T9Al1/NgIIkbyL1SETZIXNxOws1
X-Gm-Gg: AYBFou2/jZvXOW729Ir/n7xpgWu8Li3HANvnHHoCtWHcSxq6yoUJd2021nRfOX9325/
	AtKixO86IEfDbgMKMQfFpWNYn1mINDTFHJYBkBFctcNWbQl+O3jNM96LRRoBpDlvymTiE4uFz8h
	UU0NlL0I0jkHsHZCq8rYKAyhWg9VrTVVA1NGsdRy1h4McO96gyCKmz8jzXAf+BMzF7XKF708JXv
	es3GfmFyjDED+6hEg16zX9St6OQ2gA+AFEtjG7H4u91bdBE99USSow7PYX5p9s36cXpDn9L/Q77
	p+J2eUdlSptdWJ1jqGmwgGD9+fwNk7mRIHkIzZmRnvpMI2euh9wZ9lNkLSSB+5EctDJbsRc4mM0
	YF+119KOupqd9p/PyxCjxLv3s+MzMUyD3ItaZdX8yMgTtsC4O0Xk0ZlW66VNIPgZxa//qlDangH
	J1DqbHyEmgwqTJIuJomojptKmSWwklfOqS34Ubs4JiemSdDvZTt9LWrPcG5JRBATIHdMeSAtS4l
	kGO5Mo=
X-Received: by 2002:a17:90b:1812:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3a8a072a80dmr5549464a91.15.1791474852449;
        Thu, 08 Oct 2026 08:54:12 -0700 (PDT)
Received: from ltu.. ([116.101.18.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd357149824sm293486a12.18.2026.10.08.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:54:11 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johan Hovold <johan@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: musb: Disable the D+ pullup during system suspend
Date: Thu,  8 Oct 2026 22:54:02 +0700
Message-Id: <20261008155402.66266-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When musb_suspend() clears DEVCTL, the host sees a disconnect. But VBUS
is still there, so the controller can start a new session on its own
and, with SOFTCONN still set, pull D+ up again while its interrupts are
masked. The host then fails to enumerate the gadget ("unable to
enumerate USB device") and gives up, and nothing at resume makes it try
again. On a T113-S3 board the gadget link never survived an s2idle
cycle.

Clear SOFTCONN once the context is saved; musb_restore_context() puts
it back on resume. This is what the FIXME asked for, as USB can't wake
us in time with the interrupts masked. Platforms that power the PHY off
during suspend, like the AM335x, never showed the problem: D+ drops
with the PHY.

Fixes: 6fc6f4b87cb3 ("usb: musb: Disable interrupts on suspend, enable them on resume")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
Changes in v2:
- Comment: why only some platforms see this; where the PHY is powered
  off during suspend, D+ drops anyway (Andreas Kemnade).
- Message: one sentence on the same, in place of the da8xx one; da8xx
  powers its PHY off during suspend, so its host saw a disconnect
  before the patch as well.
- "Disable" instead of "Drop" in the subject.
- The code is the same as in v1.
- Link to v1: https://lore.kernel.org/all/20260927164145.1956429-1-tien.nguyenminh@embeddedlinux.blog/

I found this on a T113-S3 board (sunxi, s2idle, Intel xHCI host): ssh
over the gadget never came back after a suspend. With the patch, all 30
cycles I ran re-enumerated after resume.

To check for regressions, I also tried a BeagleBone Black (AM335x,
dsps glue, suspend to RAM). There the link came back after every
resume (10 cycles without the patch, 30 with it), as
am335x_phy_suspend() powers the PHY off. A test on an OMAP3 board
(omap2430 glue, twl4030 PHY) would be welcome.

 drivers/usb/musb/musb_core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 73ac25f536..39b0845108 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2825,18 +2825,26 @@ static int musb_suspend(struct device *dev)
 
 	spin_lock_irqsave(&musb->lock, flags);
 
+	musb_save_context(musb);
+
 	if (is_peripheral_active(musb)) {
-		/* FIXME force disconnect unless we know USB will wake
-		 * the system up quickly enough to respond ...
+		/*
+		 * We can't answer a host with the interrupts off, so disable
+		 * the D+ pullup. musb_restore_context() puts back the state
+		 * saved above. Where the PHY is powered off during suspend
+		 * (AM335x, for one), D+ drops anyway; where it stays powered,
+		 * as on sunxi, the host would see a device that can't answer.
 		 */
+		u8 power = musb_readb(musb->mregs, MUSB_POWER);
+
+		musb_writeb(musb->mregs, MUSB_POWER,
+			    power & ~MUSB_POWER_SOFTCONN);
 	} else if (is_host_active(musb)) {
 		/* we know all the children are suspended; sometimes
 		 * they will even be wakeup-enabled.
 		 */
 	}
 
-	musb_save_context(musb);
-
 	spin_unlock_irqrestore(&musb->lock, flags);
 	return 0;
 }

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1

