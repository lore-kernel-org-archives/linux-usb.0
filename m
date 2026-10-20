Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527357;
	b=0ZK8Tp8+43w+dT5GOoqdjTT5j4L5UdINYhXkIe4Igw3+UhaI0MEt/2mNv9KlsL9Yc5B/
	 C1xMaeFgbVUyDTyScIc/QWK/1dzaut2Mxu/ZcOvN/GyBzGEjfzKvB1r5vraHFZmnLq76Y
	 FZWZ7T8msE+egy8qDlA8usA+0pYUmrqntS3iNBeE6vYHazacODI9wYGgTdu2pphvZWWu+
	 fkrkeZFIJOmR5f6Hi0PWkHx+YIppgx6p6kVkZp0Mx9ecMqDY2UFh1isr/Je/wE77u65jW
	 6MqaR2+iKpBjQsj2I6Or9mvLjhecPi+aWWQsOxWoNN9cjQSy1jK+gxyQyEkDMhBoKhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UskgvncvUpPt8ituFGdb7oQlhxbaiJTmOeLamQsyhQ4=;
	b=Xtm7g725h93nehqVpJ8EjBlYCQPhHeEsnUYwqpRPNX72lkFj0DKYGel2pEpoHdOP57cK
	 hRnboN/rvzNrpWubEIA4ZBdmSDtXm7Y4D4w1UC8Dk5qLHNgqlgr8Z0z76XpBhy+ie5SvN
	 GIVU7Lr5GiSqrdyFHAZ829XuOOiPiv4DWE4cuYlLyzEEAN804im36tR6PO2q8OfG+s9yR
	 uCPtN7IMd7Q82p8Iz8WM3883nvpqXEqvU8T6UefnRJQxLsbAHMjR6T05R4ioj3nmWJrEB
	 kCM3HoKSIXh2meh20G5slPGyQi132A5/y3XJv7znjhF5QaOPCUW5WJB7Z4I6g4DlHdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkNdjM2W;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99565606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 20:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99565606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkNdjM2W
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso8528977eec.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527357; x=1793132157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UskgvncvUpPt8ituFGdb7oQlhxbaiJTmOeLamQsyhQ4=;
        b=KkNdjM2WRZU+wtKJ20+0ZHo+LXraciSWuqpBXt5e/UQEE+V4xzsXI3Id6rPaiAGRyQ
         CXEyWrM7f69l5W9gPlKigwzJeHTPrbIhoF6mfAV4H8CLRkd4D06fy1++xizx6k7eywkI
         x/iv0fwdq7wYnY7gFPho1cskbXZU0NEY7YG7Px0sBEuAdiX7LYh3GsncfFewaoJgYWoU
         bwtIoBJkRK+sQa5UypDB4uf7uw4E0JvQEm1uJftKT2FpKmmtV4HZHGRwlzKb4SMNNzwU
         xwUQYANdC9z2JAMhXLY+j++o5bXVw5epvsUM/clkemu/U8TmkDXDnom4X+ZTW4XLR4fs
         Zk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527357; x=1793132157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UskgvncvUpPt8ituFGdb7oQlhxbaiJTmOeLamQsyhQ4=;
        b=n2kmfiWpnNYPqQJBEixBEUNpKq50H4Ks0tuDF5h2oytv94cKAZS4x58IXFHtBR6H/z
         7PObsXUpJfyPiT3V5H2Et1VTOmehuZghoTK1K5D83UGEMAr3mRHGZzWsxD+YwWO889Xy
         VTGDhVm6z8U99TOEZW45n+FXQzmDNC4c7+rwo/SJbt6+ks1QeyaFBirkIUvD1/swLalJ
         tihRDfQvFLwDLI+ZG2Uy+zB9C9GsO1LjrGYuRMmbkR2NzFTVeZ8Rnx/ggNsCPsV5w+HD
         GvV5HgpTz54aze41W3HxfjJEOKh8S37oDIumQesig/iq1vR49pQ0lrLF3cD0D4PwSLt9
         x4zg==
X-Forwarded-Encrypted: i=1; AKwUvByeJKXR7DmjOUmZ7Y3FVBgJtFM9bWAkUqhr90L5Bp154LiThiUUv0lVL0gU9GaVs+vd7Ic0Gjia/Mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl6s9DZ3KpYySp5WcJUOuNVzZKfoIcjjcZGYiArgoQi8wUEkaa
	Ztv7VZF9HPJCk5jySNLqYD9ZdWx0/sDjePuxjrXcRd8x1nWka2aRdIcv
X-Gm-Gg: AYBFou3sHQ7fHDhhAVbM/ViOXQi7xLmg8VD7FHFp+wOYEXx357Dx2qoSd7nvXIGqNBW
	44yiBnkB2Hbtk4Ht+/2oi5tSd7fUcMk1y9RZrGAIPpQ5wez+qGDKEpaqbyP7nEx5Yr6uv/y46pX
	ILfesGxbO+o/7QlOoE8RdNwHXYeULqU6TF0jm0NDmanHGZpvXL6kPe+N5uxI4mHry9fWlD5paPm
	AtkbsXNijcEC+3l6nclqgP7nwFeiOUKCCiPusRDPiNY23YdJwm3dN3rZxx+QfH4QMIHGOdR/GZf
	1tZI7hvA/9qu55Qc09WvOouHZka/VZCVPgJYCiKvQWtGRtjDlDP8gWHX6S/Wy5mtun5nhD7qNuf
	O/q6GYtT882QV5Sk7uM3oMXuAfk8VZGjxbvXnCkH7QVMTYnaDZpNlSZ5eefI8bgAR9rHedbUDKN
	SUXsnj2vtm9UNe0j5Z1CZbBEPB4NWz4xK6Hoc3q8JsGHnpEOLwqUV4tNSLl9E/5ewPPnQ0xvDay
	bJhBKIysyVPMKnchViICYK/DnJk1GtSPA==
X-Received: by 2002:a05:7300:c00b:20b0:35c:ba31:6fef with SMTP id 5a478bee46e88-3674f21af3amr445718eec.36.1792527356516;
        Tue, 20 Oct 2026 13:15:56 -0700 (PDT)
Received: from arch.iiitdmj.ac.in ([103.199.188.243])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm912580eec.12.2026.10.20.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:15:55 -0700 (PDT)
From: Prashant Sengar <prashantsengar25031@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	linux-usb@vger.kernel.org
Subject: [PATCH net v4] net: usb: lan78xx: avoid NULL PHY dereference in WoL setup
Date: Wed, 21 Oct 2026 01:45:37 +0530
Message-ID: <20261020201537.2465655-1-prashantsengar25031@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v4:
  - Remove the unrelated blank-line change noted in review.
  - Preserve the existing spacing in lan78xx_get_wol().

v3:
  - Report WoL as unsupported when no PHY is attached.
  - Keep the existing phylib WoL handling for attached PHYs.

v2:
  - Use the phylink API instead of calling phylib directly.

v1: https://lore.kernel.org/netdev/20261018151830.643511-1-prashantsengar25031@gmail.com/
 drivers/net/usb/lan78xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..4f100bec5b3a 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1764,6 +1764,12 @@ static void lan78xx_get_wol(struct net_device *netdev,
 	u32 buf;
 	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
 
+	if (!netdev->phydev) {
+		wol->supported = 0;
+		wol->wolopts = 0;
+		return;
+	}
+
 	if (usb_autopm_get_interface(dev->intf) < 0)
 		return;
 
@@ -1795,6 +1801,9 @@ static int lan78xx_set_wol(struct net_device *netdev,
 	if (wol->wolopts & ~WAKE_ALL)
 		return -EINVAL;
 
+	if (!netdev->phydev)
+		return -EOPNOTSUPP;
+
 	ret = usb_autopm_get_interface(dev->intf);
 	if (ret < 0)
 		return ret;
-- 
2.55.0

