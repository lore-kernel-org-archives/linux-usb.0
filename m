Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47569509F1C
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859771; cv=none; b=atxcahn3ojegUNJphBvmA3gkRoLKUKKFjA4PHZWRYSzaMOq8S7moIwWhPsh7osNlErJerqE+fPXOq3OquNOx0w9Ci7yRL9fG888wbSu2/yZ2jlk9VMh136nx7Oddsn7bMKCcB0Y3r0Bi3fmTX3lbcHLZA+6AIQwAzJUit9w0aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859771; c=relaxed/simple;
	bh=T2hRaWTZtnyeAyT/IqlJFITQYFUON1ACZ2n+rRMz/ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dgu52y67kYXAMlPqS7mlG6L+SKG33Ws9geU1G/REAkDbtTpQ8ak5zpLTOajczRMpMoBZFeeNygTvuj3S3xHTm9KBsc0B0t4SUyvLuwBWdIhCR2whtajFaBKp3L+RAxneHx7BfKfpVsvMz6w9iY3bbZONff9DnC8ury70gGV9kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TzgmVXsz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TzgmVXsz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so40082315e9.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859767; x=1791464567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVNxhF07KcpW0FWzSzGhZUEHWjUDgCJiVaTXKv5li40=;
        b=TzgmVXsza83/QpXqXyM5TOnzr3AXUJQM5LVB7YJGLzfVOMn4x/iQAHBCCRoeO8nPQz
         oUtJFqPPptrULiGen5aIejS3ov23U1RxD9wh76qjhx5ROGIlamlZMZyHdQQh3HjBSFfB
         Q+R6hwu33wiZnm1RdEemouZT2POrfRBkOIbVQ+Xfy4cULfvg+V8luNv9DR5S4scVbR17
         OERl8239KKkw2GxZwpWmjLcnqaKj9NHWQ6veQRVzCzKBuE0sZPsIAxfbLdEm7xMHeghX
         WJ084i7TpB6R0ZuX+cOrp+IsxCu1VVFWk/03OKdaDY5hz/OT0qy6K52Ry37NMefT62ba
         BlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859767; x=1791464567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVNxhF07KcpW0FWzSzGhZUEHWjUDgCJiVaTXKv5li40=;
        b=rXgIMy46rp+h4UaT9xTzveH8huhhA/cRUFYKTniIop4AYST2KmDWf53teHlTbgThPT
         KuMo92IczFBdQnBxA7GIQ2ZEnsfjwW4PSXdQFA8f5M6BUesSM0P54xeY2x5+p2I1z0iE
         LvTJHDSBquRwGOv/lftEXa5ld3eVfgj8FlF64OwqQ6Mu2KI/Pa9NM6e0OCYaSTFg7r/2
         I3533QAbhpvgL7X8Uyr4Flx8fyJGzL0IRIcZpncnZy2XI7fvtJLR5Dl1txFjhzecP9pw
         iIpAZOw1Fgr6sUr5IwKZ4RCrMWCTtqiJaccWBlclBaUaGdnPTNY2n7FB6/YCVFtg49O4
         O8sA==
X-Forwarded-Encrypted: i=1; AKwUvBwkPNESckZJjXLdJTVG4PA/KQ5RGVVbdwM56iw5ux/kMPdDEX8gp+O0P4wr6OqantWmtib6W6WbKiw=@vger.kernel.org
X-Gm-Message-State: AFuF++kqzyPtq5GBq9TQbM84XBjV3QxUEmURnuTuSQIOeSWpq54AhR9A
	SsGf6d4UXGpEuIyUzmouxZ0Yj6BbbbnGjnt1ASnKGQvaWzktF4WKJQrUf8KU+uwAQmY=
X-Gm-Gg: AYBFou309XjBrKJl7QtN9SklitmkuPOYierxlcVdILhnhsZ2DgmPKMPvzvltgCQ8Yf5
	D+zljO4ycktWoPPxw1dKsoXjNJwBXNRTZQ3KCuKk+4QLt6TaNEDKkER+vx/tyDcWHSYpIztG8fU
	eaXhypiCQkLU2BN5mmKkGcOz/hQsKTHJUHIp/4+KHjRYqYYshjQF5oR5fwFStbvnGhuRHqKp7Or
	7IUw+vJZZERVy+oVnWO7jwMxPu16dZZLWo9l8FDChvAc2LEV6QoigK4prGI+j+vVzhYjy/bGEdJ
	5fZPGeJ8+bwaJaWgQAXB8BItDFBQIoA9DQaFme0kLa38gmQ0UPoJQ9D7RR0Ua9wTworpTTkakoU
	YybuzxytUudMXbfNB5NwSm0oz2rDTnDkDBmsOtxqiQ/G4jWMpk7R4XJA7CrxHVdtrSDdfr68bFX
	HtwWNJWrRXDAJxe4HYwCc8VVnj1jIBaTpCFT7tSu9n4X56I75ZCw==
X-Received: by 2002:a05:600d:8648:20b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a01b12ec83mr56667755e9.32.1790859765929;
        Thu, 01 Oct 2026 06:02:45 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:44 -0700 (PDT)
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
Subject: [PATCH net v13 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Thu,  1 Oct 2026 16:02:34 +0300
Message-ID: <20261001130236.106059-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130236.106059-1-f@lex.la>
References: <20261001130236.106059-1-f@lex.la>
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

Copy the number into the table entry of the PHY this driver found, and
into no other. With an external PHY phy_mask is 0, so other PHYs on the
bus keep polling. The address is known only after the scan, so the
write to phydev->irq stays.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v13: write only the table entry of the PHY found by the scan, instead
    of every entry before registration. Andrew's Reviewed-by is dropped
    since the code changed.
    
    Compile-tested only; I have no LAN95xx device. No Fixes: tag, for the
    same reason as patch 1.

 drivers/net/usb/smsc95xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..130a460c1f54 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1252,6 +1252,7 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
+	pdata->mdiobus->irq[pdata->phydev->mdio.addr] = phy_irq;
 	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
-- 
2.53.0

