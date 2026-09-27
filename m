Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60543D4E9
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553467; cv=none; b=a9tIFYPQ2+MyJzAcvgEHslNXTdZFzvUuBgygbr+t5e69cxstH9EY3KqRd7UU9l5yuSlbny3JhW9p7tTxTKXg5dMeF5UvfSP2cu3ZfLfuC77S1TeJEBMUydtJUbezZHBL1qIhAH3sWWT1Q2H71pxcxww6YzHAKNakMr1xVcn7F0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553467; c=relaxed/simple;
	bh=sbmklAVHibtrHK+aKwm3e6Jyo1t6iyYb4SwjQprbp88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgfd5B0dZx72oKWNtrhgIFHz15zCvLHgN9PiKWu298fVSHlBZiX6usIAwYNi8AyDCe66omAwM0uqZDi5TYAJWUkwKek5Ly+fNpZdHu3fMtnL+oQWi28H+OKz/5U2sswIk3RbB5xDFVejW5Xrxecy2hHiujLAt5pHfClWbjYors0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=NZzP0fDP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="NZzP0fDP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so13220635e9.1
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 16:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553462; x=1791158262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZSYVYi3gtff7QUtLESbvRwDDV82KQPV1j3mmqyZYLs=;
        b=NZzP0fDPjMHt2ckwlkrI5NF/+4sNo1YiYacExM6Y4Pr/0rggIZ0LImmzKgFy2Vpdp/
         kCJmpe8C4GXDNtBDtqfTYBFuXv40J8GfDp59KlRh25DZVTdmkGurDqMI1oT6m2wT+V9e
         nM/kiw3jczyvikiGOWClI+OAjFIPpl2u7PWMa+jfdGHIe5LkqOaQVpkWg8hPl0FeO1r1
         wwYZZxB2i6F/DaIst7ZJ1Z02d1xuXwsROXWjA7LFPddbCvOKJYZgRDHMQ4jRalBehQEc
         67Ro8O7gJxUCQ2WRTHg/BNtCAIS14KVWrkb1YGHHhK5O+GIV4o9gUz+dZYOirW2NC8LZ
         MXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553462; x=1791158262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZSYVYi3gtff7QUtLESbvRwDDV82KQPV1j3mmqyZYLs=;
        b=IWyKB7GMtDiO0ecu/HSWOnQAZzKWqkuBeOr1T95PQsmH9sbZbghs/ebjePtFWfOZx5
         b8eVs0xWH3QPs6+F48yioiIwcdFWfeyIAYiV7pT4QDw6wZ7OabQEy8nOOy3w5dQXMcQR
         REHXhdf9OoOWkyZDXWj3ExPFiGAKlc7uM6hog0OMxxfEH3L5Jd5+vmAikuPom7nSvpE9
         KJl1y+Y1udyBB1RMSFvLQSl6D9RFrFij7Cy+ruDRuDbBrmYjZu+LWjt00lalTHQwkX5R
         6d4aOQeplodrR3ogchzx1Vu7EowY+po2AjcyuQKzKzZ8gF0KRBt3X+oBQyYrHd1kSDSa
         FOGw==
X-Forwarded-Encrypted: i=1; AKwUvBzqJLH707AFRI+LMoZJwng7cYqGEj2h5UbPIj0+QxgwJGqe1GyQ+Bj2o0dmj7BVP4rLWg17hd/Aw0E=@vger.kernel.org
X-Gm-Message-State: AFuF++mGDIC6H7sn8wNVXrcbOGsH+0YwzM+4Sy2s5z+YPxx1HLEEJzz6
	NFIWGJPyok+he5h2ik8832+XmKSeQD39HkBGfxsgPSW/cjeZbht4VPiFUyR4tjPhKpI=
X-Gm-Gg: AYBFou3ejdc/0kiekZv9etkr1cm6m01qM5+qISBsnXVans4aOJGq3Aj9971DBJ8WljS
	/Khm6qNCsRzEJHSvhPtU7qxv3PrB5/0bb6PqVmnPdILpNcJfcE9fxmPDcgVXzfa+vqh9yZkiF2Z
	G2t/nzahap73Uk3LprIkhrC73WT0PwZJmnUa8ymOcvc1//VYoR1BAqe3j9oYaCsX5l2Rg8fzPdV
	xB2rdvQWFi8J7h00hphKYwPtwqLgyA9PCcrg/8MNe5Azb4qqaUaiYYhmafvRs8K385DSQ4bsIWR
	xENUu04J48XkH6FmxkAGGh+kYKsd5TwKjmhwrWpSerSlJCvKsujfoNiUP25Il/GibikIi51mKFp
	waCLCPg08rq2AkH54yYjwXjx0f2dIjAPfXi70HAr3+37C/41BnprLLaRtjbWUH3rxvsAiDco+Pe
	KxrteezpKYwLfgQ6pNx4c5QflNJqo0DaI+lIf9aQzKOAS5bCyr7A==
X-Received: by 2002:a05:600c:1c21:b0:4a0:2dd:7573 with SMTP id 5b1f17b1804b1-4a002dd77demr41913855e9.33.1790553462406;
        Sun, 27 Sep 2026 16:57:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:42 -0700 (PDT)
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
Subject: [PATCH net v12 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Mon, 28 Sep 2026 02:57:31 +0300
Message-ID: <20260927235733.2619081-3-f@lex.la>
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

The bus is the one this function is about to register, so put the number
in its table first and let the scan seed the PHY from there. The whole
table gets it: with an external PHY the address is not known until the
scan, and with the internal one phy_mask has already left a single
reachable entry, so a loop costs less than a branch on which case this
is.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v12: no change.
    
    Compile-tested only; I have no LAN95xx device. No Fixes: tag, for the
    same reason as patch 1.

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

