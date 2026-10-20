Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519988;
	b=O3zRfL2Hmcb1A3oE5IhG49S3oH8yoh3qFTvOHQT0ywV0zqoXud1hNX4gDpuMy+ywrhyS
	 VDO3FtuBVaW8MctbqBfFqPKksWe9aCvljJWXhrvrhuVG9EisF46ZWNEHp0wLmxpLi7jZE
	 vYg3zKNvzbc2MGQImAXuq7JTz7UX3mLuZfn6S7BPKvJRCu84H+H/mApirAYHh4EFziMxQ
	 HX66ksHvvL3OJGUbdgA1XX8IBcY7Nzj/FSpzyhyHz4QMSjLQaFiUrevhB/wYxx1YFoiIX
	 NExttkHbKisnMTXeRvGA3RHfQWNx470CONBsd/xh3EJXfJCsd/gko4eW5B0Ti4Cg5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Wx9GyoHHfawHRnV0Cg3i7Hst1BvQl6Kp0zfGCvvP3g=;
	b=SK/YfO6U7EErFAu4Bv3vLClFFJZquuxfk227DJHUW49wRBoYBjwtEhtXxz8JUZeSRNLM
	 2yHsdhr2kXsrRIArGXvfWV6brkMcPIdWyzPtYAQocukmQovUZRSBmyk4fr3TnUFh+aCin
	 VXqLvzXaXlCXmzBD/8AgZrdWA/5NpxXnG7T3uGIr5D+Y8U1e6wvhHg/pqEeeIDGkuzuj6
	 BBtaJNzFoHjA34nWSeDSW5ea8Tb3pfdKjwWlgcvermy2mzGYUyWQf1DazSBJWP2rAkitg
	 ZxCz+0phgKG7gQsacWCpzCpMZiAyaIXOsHNnZLUer7h5w1EwfB2R/VPatwRDUVibOSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dd3axunV;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D7606A322
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 18:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6D7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dd3axunV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6393008eec.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519988; x=1793124788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Wx9GyoHHfawHRnV0Cg3i7Hst1BvQl6Kp0zfGCvvP3g=;
        b=dd3axunVuUqRuGrGGRSfLkb1V8FvMQ424d9Mzy0sC6Mk8rBd+qmiIfOpd9wkRXU7N3
         QazkkiHhdfGV8qnqKWXHIO5Lv0Vvx0yb5h6EpRB2UVGv3OKrHmY3bkfnj4t9rd7ZtEGN
         6Vp4P2VDjhHXjYOsALXNwbWhaKKxCeEfPDdaYlgcQWig4aYrjgYIh9ci+avYY7wjWGo6
         CnTgsiURhUCBlzMHXSe88xGlEHv2YRSYUZXIIuknz4iQFOIkW8LvTzZJ/qTMlb3JQ4Jk
         bQfhlGSfHvH1y9OviUtBf/sty6IPXxG6urYRWk2bpT0ic4WSTe+lV4ZDa3X8bwbS1Kvl
         2Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519988; x=1793124788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Wx9GyoHHfawHRnV0Cg3i7Hst1BvQl6Kp0zfGCvvP3g=;
        b=q6BnO82dTbe72PWl3TsmP5tA0t7qCMuFtPAP5/22uGqxC/nsY6zfcGJlzFeuiIFX5X
         Ul6Ra9KWQzyDg0RK9gxZb5fVj7KWIXQCiwavaqLaQIHaDqfQrIXpOLOrdR9YrnlF7JSL
         VizpLwbpDrLHz5TUGDeEZeLtx/CBYNTsNwyilq7JAmgG02ZwqXppolMjeE+pvexQqcU4
         245F1TNUd33dPUDDHJbPzYeV2kaoda7Jrg099vHqYrAirreoPgwe9v5YIZlnnF/Z0HUT
         e73lb4EONdDnvqvXIB85jBQzmUTv0s+ag/MvEIYyH/fGcy9SBv6k3KcfE5aTomcvBwns
         vOag==
X-Forwarded-Encrypted: i=1; AKwUvByum5Igyj1eWlasrfQx054Qrb1mDbf0cztVzyXAVN434ixvNxM7gKkpq60vt8P8DputTcb3TiS2pGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRgaJkcaJ4Muw8qKZT/1uKq5VIoBkzAF46EWGlKc3mpu0i0S3A
	IDjuDQRkTFWV+OmsZeTH3qyX7ftBALEmD240lf/Esn4WTUqMR53opw3k
X-Gm-Gg: AYBFou3cHJct8FgFkWEBULIV2b4Fiv9dktwIFrhFnvY8GYgIJVy3vYsk0DueJZ8zFSQ
	bJqpbK9TUZqDNXKpfdxlFO1iavNZ+2T9mMsbQAsxvMHWvSPnBXmKORT3e2ZaYhloE91ej90rVda
	04EiWg/gTpxo3oCaF14Rbn4mZBZyssuif3rYEnR+KqY5FpysQf1bRdYvyczip8FH4B1xwnaph7Y
	XqMzNlxxLqyImTLMZODq5U84pRYUcYsC304vfyR+w38W4DV9MPOazXIQ8UiClZoMQyI3YvsckyL
	N0woO2xsKj8dIQBx6xTzBM/aFqAarzZOqRZHfuyNnLpmJcnJ0Ep5MbDx2Bb3rp9AnNdXV7VjHBr
	5L7REGonQauyQtSlgm0rzpz4UZL+j6+grGSErrRSrOZkcitQMwPGlBiZ5tV2Ue+6ChziPjUtQ4S
	qEQrJLDLUs2vJH5sJ/YczcYu2khIl65kznKoJwBjl3T0OADxndaBGOFCnuuFmNnk/B5IcE8oyQz
	X3lnkZDD8g5NeunkgVKmA==
X-Received: by 2002:a05:693c:608b:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-3674a41869amr97000eec.2.1792519987538;
        Tue, 20 Oct 2026 11:13:07 -0700 (PDT)
Received: from arch.localdomain ([2401:4900:e005:334b:4504:532e:b7dc:d438])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm265873eec.20.2026.10.20.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:13:06 -0700 (PDT)
From: Prashant Sengar <prashantsengar25031@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	linux-usb@vger.kernel.org
Subject: [PATCH net v3] net: usb: lan78xx: avoid NULL PHY dereference in WoL setup
Date: Tue, 20 Oct 2026 23:42:37 +0530
Message-ID: <20261020181237.2374075-1-prashantsengar25031@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN7801 supports fixed-link configurations without an attached PHY.
However, lan78xx_set_wol() unconditionally passes netdev->phydev
to phy_ethtool_set_wol(), causing a NULL pointer dereference when
a userspace WoL request reaches this path.

Report no WoL capabilities when no PHY is attached, and return
-EOPNOTSUPP from lan78xx_set_wol() before modifying the wakeup
configuration. Keep the existing phylib WoL handling for devices
with an attached PHY.

The issue was reproduced using USB Raw Gadget and dummy_hcd in QEMU.
An ETHTOOL_SWOL ioctl triggered a kernel Oops with the original
driver. With this change, the PHY-less configuration no longer
advertises unsupported WoL operations, avoiding the crash.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>
---
v3:
  - Report no WoL capabilities when no PHY is attached.
  - Return -EOPNOTSUPP from set_wol() before updating wakeup state
    when no PHY is present.
  - Retain the original phylib WoL call for PHY-attached devices,
    following Andrew Lunn's review.
  - Leave fixed-link MAC WoL support for separate net-next work.

v2: https://lore.kernel.org/netdev/20261019193148.1381545-1-prashantsengar25031@gmail.com/
 drivers/net/usb/lan78xx.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..612e1e46de6d 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1763,7 +1763,11 @@ static void lan78xx_get_wol(struct net_device *netdev,
 	int ret;
 	u32 buf;
 	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
-
+	if (!netdev->phydev) {
+		wol->supported = 0;
+		wol->wolopts = 0;
+		return;
+	}
 	if (usb_autopm_get_interface(dev->intf) < 0)
 		return;
 
@@ -1795,6 +1799,9 @@ static int lan78xx_set_wol(struct net_device *netdev,
 	if (wol->wolopts & ~WAKE_ALL)
 		return -EINVAL;
 
+	if (!netdev->phydev)
+		return -EOPNOTSUPP;
+
 	ret = usb_autopm_get_interface(dev->intf);
 	if (ret < 0)
 		return ret;
@@ -1807,6 +1814,7 @@ static int lan78xx_set_wol(struct net_device *netdev,
 
 	ret = phy_ethtool_set_wol(netdev->phydev, wol);
 
+
 exit_pm_put:
 	usb_autopm_put_interface(dev->intf);
 
-- 
2.55.0

