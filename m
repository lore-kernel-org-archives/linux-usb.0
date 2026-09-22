Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAC556BBE
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083212; cv=none; b=Vev5KbtAFJ3Ayp3ipFFLrHaFppj2s5dCxlaUqk5TdY7D1EUEBuNngJK7am4sMeK0KZOrTRz3PiBGDvWIuiNYWQ1mI3Bp744+7pAKNqIpiWoFUofkvas0EWXf7ruIAdgUFE/uhIJ384FWwP9OtqKxE+9k52K5lLkORUyR6x04Gnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083212; c=relaxed/simple;
	bh=cjPhgMl06Gz4v8vlPzDnw8UWAHAvj1+3h2RWkeYhBNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dr2iJ0lHdB+edPKFQhmREozPKeWOqRFF/RJQsOOnIG5bgQZXI9bc9eW6a+e/uxTKFUMOiXywtmr7bPabILrK6JscKEby15JlPuU8m95Z6n1Y3fePIb7IOPdblrd1LhERt/LSTnvbGE/oSnH3icm9WXlYg9E81wVrgmNPxtc9j7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=jxeVxoQn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="jxeVxoQn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso31079595e9.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790083208; x=1790688008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2+N1IorirZjTQOoiJkqviwvBkdqoi6Ht3FnwQDKUlk=;
        b=jxeVxoQnN97jz2Y3bX+UCGGnaBUeg5PDqUFpdv4ZHfdlx5wLHSHsX3B25M7KhRCpm+
         zEFWPpmLvBaH94JJ37bJjy/4FWEuPioAeR3rBmaQDdjp0DPAizGyfWiB7z0gLyjNJJBI
         KzwGVKpRkhmJiXaJiptQakHFlyDp1bmYxwqyunhgGjmSHYTj4dljl+6ZzQnLlOFcvBcu
         IZqUy4s14SlnTQpmK1QhSQvwzmpXUjkPb6IXgtsyZWx/D5lKyqSjH7O4NsTbhi3HpGhu
         xfD/OFNHV3GzbANJ0zPcqa4es2wfq7p80PLyjc2xv4PyReef6xA/7V6+3XgHEBbD5Gpw
         4CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083208; x=1790688008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2+N1IorirZjTQOoiJkqviwvBkdqoi6Ht3FnwQDKUlk=;
        b=kc4L06odl5fvPXlCA1YoJoY12qs+9l2zGvjhC29RfosbkWuZDEzRKc2Lo1sirm8G0p
         qRFQJA4ikuP0pBzuWvo5lwk39sFysQ97Ck3H0S+O109i6d8AV7CNcAGs8t5X+f4+sDt+
         4BNFmtUYUxY1ZSozYxcv6e5sdCX2r7IVLLSIcjuQZ2DXVoDrehHnuG3TW91RYEGpc6VU
         /PAtG3GDimh/M39pD3hMWd4GzrNEv7MCsT8i41DjXWvtnSmgaxQm3lJb0Yc7tDP7MXU4
         erXLoPiZuVL8T+rqJtYoIzgS42SFKiv19PadfBWh2eMiXnI8KVflT9kj5kaOvjNoSIoj
         TSfw==
X-Forwarded-Encrypted: i=1; AKwUvBxldfOQFL15z1fpH9c2mXFg8iT4m2XSmUj1dsX9gTNssrm62VzFcmPbpeIOLRk957bvpTqcrLNCFZw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzC9rl7rFbypKni2GL67N9XdInR7yRF/WTloc7gCzu1ByYMPsl
	x8+jWGfwjG1AF2lIk7VtkfEAeEJf2357e6XG9Cczl0R5nTLkUIH5MlgAy7bHiDzM+Ak=
X-Gm-Gg: AYBFou1rjgI8lCryHC30b8Vgnz3vENwFTLbCDtz11JhHEMekPBO9DFw8lDZ0+moOzdz
	H0AtMAMvwrnzudbeG7srlgiKowpAiIYoNHQwY+eaceT/CA/7onkCdwC+Fau8Fc5UT1vBibIQEl6
	w2PAAxlBK/Fab02rPRgDsBIEsKwySNoXVGsB77AI5U86UPOG1suzUvfRel7zYy5iHmMC95OSPWP
	Zu1EvVIA+LKl2bM37ewUFTE+cE1/wVRobHFXlPYVMn9kYh+qX52v1aKJ0ec+I2M1ibLZUf3ry9z
	SBo/WyawVhQ1IcFRPtRMUR5/6jQhr1h9i2C3hW0UBBb9P3KiHv4M39PwzQ/QhHo1UQ8cQJ2ka5K
	fFhPieSut8uCulOa9RUmCRSuk7lDEslV6XnDbN4wYgA8wII+EmGCRM6ARp1KMk3A3+E+MgNqlay
	4Mv3orYWjbEx1rnbnoRiYoELqQ+QtSh/JrGbRXRmgAayyd5jJmwv4=
X-Received: by 2002:a05:600c:35c9:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-49fc5736229mr230926025e9.24.1790083207537;
        Tue, 22 Sep 2026 06:20:07 -0700 (PDT)
Received: from remote-01 ([84.17.55.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4085220f8f.35.2026.09.22.06.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:20:06 -0700 (PDT)
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
Subject: [PATCH net v10 4/4] net: phy: restore the interrupt when the generic bind cycle fails
Date: Tue, 22 Sep 2026 16:19:55 +0300
Message-ID: <20260922131955.4175785-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922131955.4175785-1-f@lex.la>
References: <20260922131955.4175785-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() binds the generic driver by hand, and the probe it
calls is phy_probe(), which replaces phydev->irq with PHY_POLL before
either of the points it can fail at. That failure unwinds on a label of
its own, which does not go through phy_detach(), so the substitution
outlives a bind cycle that never completed and a later attach finds a
PHY that can only be polled. Found while placing the restore of the
previous patch, as the other exit of the same bind cycle.

Take the number back on that label as well, before it clears d->driver.
That store is what reopens the device to the driver core: until it runs,
the core turns a probe away with -EBUSY. That is ordering, not
exclusion - this bind and its unwind run without the device lock
device_bind_driver() asks its callers to hold.

Fixes: 6d9f66ac7fec ("net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Both points the hand-bind can fail at are reachable. phy_probe() reaches
    genphy_read_abilities() through genphy_driver's .get_features, and that
    returns the error from phy_read(phydev, MII_BMSR); device_bind_driver()
    returns whatever driver_sysfs_add() got, from either of its two
    sysfs_create_link() calls or from the coredump attribute.
    
    A failed genphy bind leaves the device with no driver bound at all, so the
    next driver to arrive binds directly and never goes through phy_detach().
    That is why patch 3 cannot cover this path, and why the Fixes: tag here is
    6d9f66ac7fec rather than the one patch 3 carries. That commit did not
    introduce the lost number - the substitution is far older - it created this
    second exit from the bind cycle, splitting the failure off the label that
    calls phy_detach(). Before it, patch 3 alone would have covered this, so
    that is where the backport range for this one starts.
    
    Exercised on the board described in patch 3, with a debug-only module
    parameter that fails the hand-bound generic probe once for one MDIO
    address. The connect then ends in -EIO rather than the -EINVAL of the
    validation path, so the unwind takes the label this patch touches.
    phydev->irq afterwards reads -1 with patch 3 alone and 15 with this one.
    
    One difference between the injector and a real failure, since it does not
    affect what was measured but should not be implied away: a genuine error
    inside phy_probe() leaves through its out: label, which re-asserts the PHY
    reset before returning, while the injector returns earlier than that.
    Neither path touches phydev->irq.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a9c71a286118..06161a73fe3f 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1896,6 +1896,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	/* The NULL below lets phy_probe() write this field. */
+	phydev->irq = bus->irq[phydev->mdio.addr];
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
-- 
2.53.0

