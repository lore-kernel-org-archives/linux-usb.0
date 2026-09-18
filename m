Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C4F3B9DA7
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696251; cv=none; b=ItFmbCGuMiZnVsOOSYYRs2lvjeKCmpMNWKYlHliN+TminQw0bGfo1DSksVeAlSnpwWtAx1AALOXjkdMzfavj55HofmjbKfdDD59YJZWmNLoNu7Xj/by3uBxYkItffk6C8oWTbEUf3VM7xcRUmJ9LItSaJjL68qcWe3msDRcTlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696251; c=relaxed/simple;
	bh=ie+Fks8qvoH2s91CTwbbOujmR4Ipol0/ojc69WvScig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui3e0dMmOzh6J1wB9JFh0ebUvp+eQ8qhyW85ZXhWrb6PYOP5/qUlumph39ymwK+HKYkVKbxjn53xY+Td0AwVPMa7rirnxE2safR85AdrfN2m8OatPsjXIDXK/imVi0IcqhAuv9keLAaSHKhMeRc6jd2x3IYEvSKVPi2kYvPwo2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=JUA9YVX0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="JUA9YVX0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so71754f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 18:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696233; x=1790301033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3EdtN6qtnpTbUr6qyK3WOaZ6BRajWizEp8fE4gWzmw=;
        b=JUA9YVX0ffaOhhQIZVaEAVfFRKBtZ25S6uN5vhPH+sqxcWIWvkANdlYmLEPjXqAK0T
         dNcwODf4aZKX7ntsiXVEgvvhP30pA49uSw3CKPZynNXD8CGjxp2nVyRWV8FU9554IKr4
         TH9/W3dyy0WMG0GRObiS4Kqgm8r2QBiZ5fZ57j/oLJT3qg92PpjgeZ/5JhWNkWRXKsAe
         H1EEma+IJeeChISGc9Y2zgqmdqYi8AINgVJkBp2GB0+33qS84A4ccxtdWcpN/J3XHy4p
         HbIjwyyNG/C460Md8itX/ELDN9ehRotAyeUL+ayp+9hXUxu5kIqI9RmQBypW/64kk+/o
         gBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696233; x=1790301033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3EdtN6qtnpTbUr6qyK3WOaZ6BRajWizEp8fE4gWzmw=;
        b=ciDmUFGLt+Q53KetCZ8kfQGSfIKwXYtGnUuUVWbsEgssGqiu9PfyAXc7rzstOXrWL5
         KZgTgLTJ3rcFA0Jrwu9kLWcNifIR46b1f2paRlazoYQ99WjaqGs+48OxoULbaF87k6Lg
         FK+up6Kx1uswhdzuIKZ3Q1LSKD9Fp0pimZxDCrzYTf7BY/cUO2XKqKTlysIyED7bZA6S
         jXqLp8MivzjCdgAiJ9pSJ9DkpX3rf0rlPPI22hZbfxyEnBA1jaIrhBnOGEeQMR4zIA2F
         OLh/X/z7IwTieJaHb+wHz20IFrmOCRXFuq64aElZLcQB31bwxmEqYOgKpgt5JIFyBeFG
         K19Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3TKz0djqj+ZSggj1D0ypAlllxbM640abvrmUBPbMFOzlBQdkSSMJT58BHKoLLQMC99mkYyi77j5w=@vger.kernel.org
X-Gm-Message-State: AFuF++nGZ+uy1EHEDwAVzU5BP7CMvdRU3nzFtGB70OCM2lTdvBOVHUP+
	T5meAlVLrfER3Tob82yPnmvkOFY+fnw0xvmkfSyLuhSaC+dvALxFx5YD2DZVmizddek=
X-Gm-Gg: AYBFou2N+FIaVk6IRbwzRcqUaj/Yt61hvxeewUJS0uJKryCasfDxLQWIPmRZDLh4cFC
	wPIazd4Gc7dICEfY2Y2fy37SOct6haois+kf7531i3CMRd+FhC68IBDp8kFkQDJJfGOZ5IfDO/V
	SExAc1T51WGb6ky9xLO+fKb3CU4DM23SPKt3KoLYx19Ra6yKW9o1gC67ELCqx4KCWDi0tpCNQLY
	pOE8O1eFYT6oQBB3XtZjdlVXZ9fzddh9sipb4tGEIrcI+eAGqF97yGP5bJhlwMENT5v4IO4BiQZ
	nS2csNMgHZpqatp44FyDinCuYMbQ9QK3KdMckk7AQHvUeEOKrnYP+1J7PiURkbsa3WS/wb7+Roi
	dZz3HaKL988gd9CfpgQ2bBiQAmckpzFnDbAggoFMzDyGDVWvptZtBpD+VrRDZsqcFQV1AS6W/Ea
	IElRz1zoWFxDwBd+OgaOLC4gKHC2Kwucdv6eDdONKzwa3emsMXFA==
X-Received: by 2002:adf:e187:0:b0:486:ed36:b9c with SMTP id ffacd0b85a97d-4871e269f3amr845004f8f.29.1789696233046;
        Thu, 17 Sep 2026 18:50:33 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200745b5sm64224f8f.26.2026.09.17.18.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:32 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v8 1/4] net: usb: lan78xx: register the PHY interrupt with the MDIO bus
Date: Fri, 18 Sep 2026 04:50:26 +0300
Message-ID: <20260918015029.2518425-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015029.2518425-1-f@lex.la>
References: <20260918015029.2518425-1-f@lex.la>
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

Put it where the bus keeps it and take phydev->irq from there. What the
PHY is attached with does not change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Compile-tested only; I have no LAN78xx device.
    
    No Fixes: tag on this one. On its own it fixes nothing - nothing reads the
    bus table back until patch 3 - which is also why it sorts ahead of that
    patch rather than after it.
    
    The else branch that forced PHY_POLL is dropped rather than moved to the
    table, for two reasons. It cannot run: lan78xx_setup_irq_domain() returns
    -EINVAL when it cannot create the mapping, lan78xx_bind() gives up on that
    return, and lan78xx_phy_init() only runs afterwards, so phyirq is always
    positive by the time this code is reached. And if it could run it would be
    wrong in the other direction: this bus is registered with
    of_mdiobus_register(), so the table may already hold an interrupt the
    devicetree described, and forcing PHY_POLL over it would invert what
    patches 3 and 4 are for.
    
    Teardown order keeps the number live for as long as it is read:
    lan78xx_disconnect() detaches the PHY through phylink_disconnect_phy(), and
    lan78xx_unbind() calls lan78xx_remove_irq_domain() only afterwards.

 drivers/net/usb/lan78xx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb782d81d84f..d02e4ffcbbc1 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2892,11 +2892,10 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		return 0;
 	}
 
-	/* if phyirq is not set, use polling mode in phylib */
 	if (dev->domain_data.phyirq > 0)
-		phydev->irq = dev->domain_data.phyirq;
-	else
-		phydev->irq = PHY_POLL;
+		dev->mdiobus->irq[phydev->mdio.addr] = dev->domain_data.phyirq;
+
+	phydev->irq = dev->mdiobus->irq[phydev->mdio.addr];
 	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
 
 	ret = phylink_connect_phy(dev->phylink, phydev);
-- 
2.53.0

