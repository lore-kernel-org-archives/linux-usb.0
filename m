Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08043B3EE
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553466; cv=none; b=kQu/E98lG3xeyZq97W3p2OgRea5HcSsJnK00n/HgAAmFSywibtxbOig0x134qX8MPzDXZAIUQCkh6yzOLuB7152Rw7tzLsvqkKAy52UIYfIzYuUalKH7meEJkPiFNF/+SgDBN5bjLS032KT+ODu0rNhMz7f9YLT/APonDGtJ9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553466; c=relaxed/simple;
	bh=Q2MBoFUHV/smTZZWOcBAdjojsve64nf3Mj4LdcOfrm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SH5kvzebSNgSBduMSpNeTNgbab9re01YRZP4u0b2sK8+UNBABE3H7l1HTAeTOZZvcjv3Qf0R8dDFC0iM2thvv8V+FVmaAXCXi/bGn6DUMDUZWEwg5vZjkp6qjFAH+JThOJXWQjHtm/nV2eMWn2MiKs7S41hQcD8ziEpejuPARr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=L2L49zvd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="L2L49zvd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so18210545e9.1
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553461; x=1791158261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mUPVIFEve71ZMNF6KJowk+Nf2/oAe4+dmXwALOSfNI=;
        b=L2L49zvd4UsnUVQuUR1SX2YqDT6A361lRAdMI46Y7DmufnOOl6x70jdBpWiM2m7JWR
         sJswNYGNZdugKyccJT1LKX2di3Rk6wpKfa+LoZrX8pjpEAS73NoT/bLKPjThlkf+mx2Q
         7VCxdPDLchHDsjwGWmw22ZoVbP1r53Oya0HJJEOBt9Mbz5NVTOatRZ3Kz22rbZEQm0FX
         Az7pjT333yOiTMRlIHRz6l7cKe6AKzQis6h3y9p+G7LWMj5YUhvy/8a/Rt89pOqkeePD
         x2oKC328eeAwphSWc6kBz57n7aqM6OcQzbuTrfu84da2hGrE1oR8tjhtqWlxEUz1D4Eq
         2nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553461; x=1791158261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mUPVIFEve71ZMNF6KJowk+Nf2/oAe4+dmXwALOSfNI=;
        b=A4zk0k3iY5PugiuWnb3krEGzYSfFax1rKtZgMVQ4pK0oTDBxZVTxjlzzHXgikeB+Uq
         9/k5DIYNIEV0R/r0xub4vkXiwk/Pk6/ST4K5iZ8QAPU/MMjKQzx3oE35ehBjQKsnqePv
         BkXfVqlWDczEFvGMZm+EZ+asUaBeh8IRbsO7MYwEZqM1K/5Js72DoJZyulDL/Vrv1FMK
         tyoFiTfLkkVdr6hNsMP6+uCmPu+bpuVIFoc3tNMl4narrYAVvj6409JOJPcW4pb+BXRk
         1cB1q16hpX69Fqd9Dcuvva5RkJ/zUtQKLfqsjXeSdQTMi9iF6XNxSk9v4EP6F1B3gbX5
         7Wyg==
X-Forwarded-Encrypted: i=1; AKwUvBzO73aCfKB/Zd3JO46Y3Ay/h2tTwuuNhh3M1qRx7wOh2tqgrZ46chYHdd6HlpCK0lrWh7aZtyx4NL0=@vger.kernel.org
X-Gm-Message-State: AFuF++lbkmE4pgOMPz/Z4try5sVG1PrX/k6PJHqFnI62JmMovMrU6AXr
	/rogMfxjbhPZigBQ52yh4Kc/wXX72FoX6FgHScHcE2Tamypttv7mPkIog3uT9PI9fDI=
X-Gm-Gg: AYBFou0vVuv0ZMbC1hTzalxc3SpI+AQUxHaaT8d0/J0U3Tebhd1T/k3GI7c+zrFX91r
	SDH5IIgyT/wts3OOcxBDWfdAAMprMnWSQphA3v1zo7oz5oGkRbK9+cxP5xf/Nj9SnD2awAJTdQw
	yR2nXN0teXNStuK2svXiDnFNiy/9f/AgvKDd8qkH/0yBrPEGojmiJ4+q31BxtZyp6VXJmK5b91w
	lyuUF93QcDBwwS0QdIuVOBNxrI58+ZdcpBfXUBXIWB6G3pKu/o+fOcmKTfKX3FLoY5dzOw746pR
	jy6WqJlEahweK6e9SVVpL5zovo01lrADCZfr2qBbkaH5qiI9By1mi7DC1DpgPNvETMWKdMN/9IY
	A9R3Yl3n63eY6OZOEk1hWgU6+Eu1v544yM+1BefCTgaKt2DSiTl3/XP6/RSnLtSBj/77YaB4Tan
	L2dj0dpdp4QoyJvBXnvnzdF9lUGprYe4ZmnhNEz8bGG8wAIPov6w==
X-Received: by 2002:a05:600d:d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-49fe7726ee3mr175937705e9.32.1790553460961;
        Sun, 27 Sep 2026 16:57:40 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:40 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	f.fainelli@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v12 1/4] net: usb: lan78xx: register the PHY interrupt with the MDIO bus
Date: Mon, 28 Sep 2026 02:57:30 +0300
Message-ID: <20260927235733.2619081-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927235733.2619081-1-f@lex.la>
References: <20260927235733.2619081-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

Put it in the table before the bus is registered, so that the PHY the
scan creates is born with the number, and drop the write to phydev->irq
that phylib then makes by itself. Fill the whole table rather than one
entry: for 7801 the address is not known until the scan, and for the
other two phy_mask leaves only address 1 readable, so a loop costs less
than a second switch on the chip id. A devicetree PHY node that
describes an interrupt now overrides that, where the driver's number
used to win.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v12: no change.
    
    Compile-tested only; I have no LAN78xx device. No Fixes: tag, since
    nothing reads the bus table back until patch 3.

 drivers/net/usb/lan78xx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..522fb4daeb46 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2092,6 +2092,7 @@ static int lan78xx_mdio_init(struct lan78xx_net *dev)
 {
 	struct device_node *node;
 	int ret;
+	int i;
 
 	dev->mdiobus = mdiobus_alloc();
 	if (!dev->mdiobus) {
@@ -2118,6 +2119,10 @@ static int lan78xx_mdio_init(struct lan78xx_net *dev)
 		break;
 	}
 
+	if (dev->domain_data.phyirq > 0)
+		for (i = 0; i < PHY_MAX_ADDR; i++)
+			dev->mdiobus->irq[i] = dev->domain_data.phyirq;
+
 	node = of_get_child_by_name(dev->udev->dev.of_node, "mdio");
 	ret = of_mdiobus_register(dev->mdiobus, node);
 	of_node_put(node);
@@ -2892,13 +2897,6 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		return 0;
 	}
 
-	/* if phyirq is not set, use polling mode in phylib */
-	if (dev->domain_data.phyirq > 0)
-		phydev->irq = dev->domain_data.phyirq;
-	else
-		phydev->irq = PHY_POLL;
-	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
-
 	ret = phylink_connect_phy(dev->phylink, phydev);
 	if (ret) {
 		netdev_err(dev->net, "can't attach PHY to %s, error %pe\n",
-- 
2.53.0

