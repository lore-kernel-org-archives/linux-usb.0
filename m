Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB73F4DCA
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859771; cv=none; b=FrEcp4scUTvh3vmCwTxDtxCKw2evABntvjIhiX6fHKER/RQPhhHLfHzq8/TvT5VJNnQ0UlfnUPtCS7xoehzJztWSjiEWp1q+u3h8DOs6+9ks0nlRyW24Hz56FCEdAPeDpV5MIgQnp9cgYYKdIc1zXaj3dv2gZEW8vGN0vW2XW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859771; c=relaxed/simple;
	bh=JY5O9vO2B4VoAM0WdI/InI3BZEF5TWQbgklizYNHjKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6FqjeuotFrQ5gi7/gk9YMqHeDdY3LgkrqnsnJuzLIzKRhBzODN+/6X8sYG2M6ftt0D5yTfPzLkVGHzHtFGSbZvmoRLSbYDBkDhsni42/gKCyHHyhiHkcNS6RJjdRSRgv8rhERji+xHLT5IJi9DUsbLUxowuhcJZ/eMh9T1Ve/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=FRZVCGxo; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="FRZVCGxo"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so3790211f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859768; x=1791464568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mQyLPOZY48s1kRZY5RKIdU0/SMyw14e1a6Wnp+y/C4=;
        b=FRZVCGxoBBmltmx1BOenAQulJ+ia4u98uvtAP/n/Ee4m4rIEtE/XPvKnxNU7gs+v15
         ExpLGMV/Gr353YQMta4xfz3VyF6eQTGC5/767aWqgmTkObEwhrM3xeCEbGPuHZwvJkvr
         hEhN3RSjuIxjcn81mY48yNnIbIPOgRvQf+znb26GoVEM90cWPsUoiTCJcQKYIxk+IMQn
         Gb75Xu4bWs8eB/SaaUy5aP+w/IcGWL95WVLeEzS8i16ihH+pkKX726rHzo+QtgLoN6Pm
         zOHgGOnQTQtPJR4eHaUNZj6nNyg1uGedduWFMukWAQzN+cKjs+enZfFcl+Fue270DPjw
         hA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859768; x=1791464568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mQyLPOZY48s1kRZY5RKIdU0/SMyw14e1a6Wnp+y/C4=;
        b=zpm7P1sGchfxuXLEX7tjyY5RCd4nasrjjmSpvRRuZHCfeHc/mFOeKm0vDBGiyJ7yU6
         ERu7PXMrHM+RmPB2vlnIvDagjsA6F8Gqy31mDqXU6CORCOKPNitkIZ0wfet/k5d6DoQI
         swpJXBOVVfG59hBWbmokus/aZHfVmaw0gbNIlSD6YvqIIobk2OsWfP6IU1EOj68O8rxw
         myDLMy7E5U5deSxYVhHykcdRjJ36qa6frhjqQRkgP47s+vQNmN81iDJy6AX8JVtc50RP
         pC0yvyLNTrJ3OYX06dAL+WKL9a+Jls11b/MW4Ux/pukF2FK+ZH/cHboS2N1GwKqbRGMw
         W0Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwAVuVO8XWtJSQuKIckU6+0K0GQZYRyFUE5DihCI5HUeB4mb79GdLssUT4VCdw2Qc8zdnlBJ5/1aWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lFEmIGRRDdrbRc8q91EetGhlofPCVB//mOEdeC3mgiMK4mtZDn
	Jxmk2YOK1EZQvgCPfd4CiFgEUSTa6jUDos1RtF+7pCDkGxC8bsIzFZhUIIIqXSsz37Y=
X-Gm-Gg: AYBFou1+aXPZytHLHcwVYa3tJtWBkRz3fZcZ7KczddLZVRo6yoxeDo6I80mtxhjSH4s
	/CGBH1gCNGg6bg10i488PLvINKTN9euZHhIs/RUvTAcTEnIQcL3XsrrTNmo5VqAb4m2yzoN827n
	4CKvkk6qr5/SyH78ATnI5PxgkM7F1B/HrEBQwjzy2EFqveTWPDT9k3AzMoDoSzJm9sZFCYXS2Mi
	oGX1XvWj03Mm47e1BtFBNhWXGQcd6fEeLzNz4hty8cmVpMwvCRbXGZwbIp3NhYXow2SjcIQnZaV
	yO1FU0yGPEwUaYVbk56FM1I5iBt3/F2hVAXId95IilSV8fA3U3W8Jk5SrsTtrQ0QMnaE/9WEuaB
	Tb4GM7OrO44W1UeCH12CnygUpXhpGY9Fyu8sAu5W9cLxUazmlz4gsgZA9mKs6mNrFa7UL87XDs/
	DqYs1jHBRmZyC0vYPYJ2/0UWUWnHasVatC4ReojpdnQWX6NyslIQ==
X-Received: by 2002:a05:600c:c3db:20b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a01ea147d9mr40523215e9.27.1790859767632;
        Thu, 01 Oct 2026 06:02:47 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:47 -0700 (PDT)
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
Subject: [PATCH net v13 3/4] net: phy: take the interrupt back from the bus on detach
Date: Thu,  1 Oct 2026 16:02:35 +0300
Message-ID: <20261001130236.106059-4-f@lex.la>
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

When a PHY's driver is a module that is not loaded yet when the MAC
connects, the PHY gets the generic driver first. phy_probe() then
replaces phydev->irq with PHY_POLL, because genphy has no interrupt
support. Nothing puts the number back, so after the real driver binds
the PHY is polled for the rest of the uptime.

Seen on a Keenetic KN-1012: the Airoha EN8811H behind an MT7531 port
has its driver on the root filesystem. Its devicetree interrupt maps to
irq 15, and after the real driver binds phydev->irq reads -1.

Restore the number when the PHY detaches. It comes from the bus table,
mdiobus->irq[], where the bus or the MAC driver recorded it. Do it only
when phy_attach_direct() bound the generic driver, since that is the
substitution being undone; otherwise the field belongs to whoever wrote
it. Do it before device_release_driver(), because after the release a
probing driver can write the same field.

The store is ordered before the release rather than locked against it:
device_release_driver() takes the device lock itself. A MAC that sets
phydev->irq before phy_start(), as phy.rst describes, is not affected,
since the restore runs on detach, between connections.

Tested on the KN-1012 with a 6.18 distribution kernel: phydev->irq
reads 15 after the real driver binds, and -1 without this patch.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v13: the commit message no longer says the PHY got the table entry at
    creation; after patches 1 and 2 that is not true for those drivers. No
    code change.
    
    The PHY module was made to load after the root filesystem, and the
    distribution's own late-PHY patch was removed. The value was read with a
    debug-only module parameter; the three switch ports read 79, 80 and 81
    in both runs.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..a9c71a286118 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1965,6 +1965,8 @@ void phy_detach(struct phy_device *phydev)
 	 * real driver could be loaded
 	 */
 	if (phydev->is_genphy_driven) {
+		/* The release below lets phy_probe() write this field. */
+		phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
 		device_release_driver(&phydev->mdio.dev);
 		phydev->is_genphy_driven = 0;
 	}
-- 
2.53.0

