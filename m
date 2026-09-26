Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A53ACF06
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 23:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790466637; cv=none; b=MIvr16pokp0cO8OAcogPUPZxlgLYRdUoHn2Zbs1GQYU3xBrkMGu805OTlhpZcDBdXaIWdsedxIBdCkMzs5gmKY4fDeTIKZeJlIuxzSjOTstKFc9gwpA+etD3zOlleYuLBbBukGtPZ4eJCv0QXIJTNK6avscOygYX1WJUmPrSC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790466637; c=relaxed/simple;
	bh=QtDZR337q23j7KOgxZTKLqjd9pUTG5+9I0iXLactZI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4C1STW947mEnBY/mXw18YRMmPOF5ML61qSL5MxI5qrWTN8lJqyl3buGE8fF4cC9JzpL9QT3FGD8mjJloRE2+NNhotVDdUQCXmiBhwCKiblsZlzqZKKJ6cyIBEI02wa+upyghjMK5EV6Ry4Vi4yxG7y76dzZJUJGqUWfthCbn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=jDr+f2a7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="jDr+f2a7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso10188115e9.3
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 16:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790466633; x=1791071433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DefuFGEpAsqPRSUMm/fTrNv+5wIf1mTSbAcF4G14UAQ=;
        b=jDr+f2a7LyzJdi/8zC+JySlQtYPlyqK8RSAJ06cFFELaRoA8qB1HDPZPUDbloYyMSG
         U+fNsJeNOPsO5nCiC0en/jWIkauqK4OjibllJdUjrL5gkMLX0Ui7PDZ4nBw3yYdXhG90
         Adytyu+fxs2fFcCRinUCYZMPPnZjIZ/O1tq0lSbcrwOE5ZMTdKHJn7LgKOGm1OgUkN4g
         yneWu5K8mvSpX3X6YHsO6TvZ64eUx3GzbLDc8deaVKsjwFsmLMxiXGxTF3EjB34nmcAL
         iZsLsjhjvR01gmx6TLAXvzE5flo1+LRCbLnNcd26N/s6G8Xc/EBEoYNkJiSMYF/xednu
         RQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790466633; x=1791071433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DefuFGEpAsqPRSUMm/fTrNv+5wIf1mTSbAcF4G14UAQ=;
        b=jvvzG+vc0zHBqMhN65PjpmRWLBw/jdclVyHQdS++7V1XOFnjsQXRn162VJnbMt1pJ4
         N/NaJb+BI9HTKnSHMVDIu9GcWJpwtI09cOAldhsQUtaSHRGUJA21OS/JxyUgdIcD1G03
         xymxwXkTWkwu0ls05h4v5ZcX7o/kI0sgXvRQmJAmxvqPXWtmM6SKIlbH43Utsn0eto6H
         /n6WSYKH4QCAQawO6/acoLX+5Q6ePBXn+7QFd9OwA9c8jOprJ0QzZTMto4Qhj5dyOEL8
         Tn460pVq/qOnnODss5wCoNELfFBYSpEn4k4MZlLP/BcVcr5mv3Q/k6XVLhVMj+D3uM/m
         MZUg==
X-Forwarded-Encrypted: i=1; AKwUvBxgMjjxQ12bV5lTZylF6MOUYqPA9fh+JqsAOAgvACa3jkNVY6t6b2oT0EYA3BPfeSpteKathQcRniU=@vger.kernel.org
X-Gm-Message-State: AFuF++lf8sPDMnAICxXoabhGzSNW58V1gXk5DvVHDjZQyDTCNxjK4ur+
	jaSUo5NBq0PmKxVIMItGHIEQYXt776OqzEJ29USO3xt+LPeR0PeGwdjvBPLqNQg9OAQ=
X-Gm-Gg: AYBFou2RQIy3UosACQ5QWf+300XuQ8AUjzc7O8tmRdiztBeFu8ekNN22VbgvQd9BXRG
	Qj6HmdLNNnsuuGi8LdORjlD4tpe6WOSVvjsx24RKLLxSk2K4mjFkoyPBLfwmaU/ffIpcZWy7nvH
	vkmLVEhGZcnxwq5SHiVcLNIA6cM6cYiDF2lbCmK+c82AwIJEtlinjScp479Qwc1CI7g8304jreE
	DDM2fX4M9nExWW0zeEWYTQSzI0MAyYVNnnt+Gz3f63gI09bhzRkncUt7lgq3/1CasXGu/i62FE4
	hDcriA4HHzMP4VO0L8vbtLzq59BmDc8Z0GXohIUI9ZL3pKbgbs9MVRw0Bppqpgn9HihA2csnBTR
	7jf135Fj5NuZ4uO7/2j/EazDfbL1Z6ikSNYu3KSAj6YhoFtmADESZRbBwv6bNzaIZmchHO+qyQT
	mj+8Z2OH38hZkJqQM+nUiq0MUOW1Nia08WcHxqBlz+SLgjzUfXiZeT4G0W2OHp
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr166757005e9.31.1790466633381;
        Sat, 26 Sep 2026 16:50:33 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm24716798f8f.8.2026.09.26.16.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:50:33 -0700 (PDT)
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
Subject: [PATCH net v11 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Sun, 27 Sep 2026 02:50:22 +0300
Message-ID: <20260926235024.705646-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926235024.705646-1-f@lex.la>
References: <20260926235024.705646-1-f@lex.la>
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

The bus is the one this function is about to register, so put the number
in its table first and let the scan seed the PHY from there. The whole
table gets it: with an external PHY the address is not known until the
scan, and with the internal one phy_mask has already left a single
reachable entry, so a loop costs less than a branch on which case this
is.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Compile-tested only; I have no LAN95xx device.
    
    No Fixes: tag, for the same reason as patch 1: the write has no reader until
    patch 3 lands.
    
    The mapping is created before mdiobus_alloc(), so the number is in hand
    where the table is filled. mdiobus_alloc_size() fills it with PHY_POLL,
    the loop here is the only other write before mdiobus_register(), and the
    scan only reads it, in phy_device_create(), so the fill survives. The
    fill covers the whole table because the external-PHY case leaves the
    address to phy_find_first() afterwards; on the internal path phy_mask
    has already reduced it to one entry.
    
    Teardown order keeps the number live for as long as it is read:
    smsc95xx_unbind() disconnects the PHY before it disposes the interrupt
    mapping.

 drivers/net/usb/smsc95xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..b629092b94c2 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1147,8 +1147,8 @@ static void smsc95xx_handle_link_change(struct net_device *net)
 static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 {
 	struct smsc95xx_priv *pdata;
+	int ret, phy_irq, i;
 	char usb_path[64];
-	int ret, phy_irq;
 	u32 val;
 
 	ret = usbnet_get_endpoints(dev, intf);
@@ -1239,6 +1239,9 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 	snprintf(pdata->mdiobus->id, ARRAY_SIZE(pdata->mdiobus->id),
 		 "usb-%03d:%03d", dev->udev->bus->busnum, dev->udev->devnum);
 
+	for (i = 0; i < PHY_MAX_ADDR; i++)
+		pdata->mdiobus->irq[i] = phy_irq;
+
 	ret = mdiobus_register(pdata->mdiobus);
 	if (ret) {
 		netdev_err(dev->net, "Could not register MDIO bus\n");
@@ -1252,7 +1255,6 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
-	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
 	/* detect device revision as different features may be available */
-- 
2.53.0

