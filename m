Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322FB43C7A4
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553464; cv=none; b=G0mdKRB1t6TLsLcS/3AEoRzDXtnRY8Amsb1dmRO8RUM86LPR2OTdu561Yu5gsXkyAU5fGqr6EE95kGdniLaJtGAYk3m2ynYD8V2UDM4Smc03ronuWrEZPszycWzVI4xfduEyoX1qZ3odOeQ2J57w/sYdwLcYPYU37yVAoDLDXzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553464; c=relaxed/simple;
	bh=mEHiS5SvMXbrnxlzmCfYyk9kbhmV1UyR7+SzycBCwLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STih8yHSEndrxr3K8jMTf50S1iwTmY9DyxcehSNiAEls8A0YwIWTuMXJskdvDaZZ23grpJDMH4i6vN6uMd0NPDombH8MKWrjCJAI3dxPGeuZsOccN7JezRnkeSw14R/NOgHHL7NLCDE2/9PkmgfK6lMofkwGYptY0M64q6pWetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=MPVY45qv; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="MPVY45qv"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so769594f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553459; x=1791158259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlHPB1uz/oxBV+2XbguSNvsGzmXWhY1StfXAGE9Vfsg=;
        b=MPVY45qvzufiDLmW5msUC77ZTRTCXjMOIUtArXrTjNLUDIp4LfaUjP8pw+LMw0YM6h
         sM9q4shNpnVa2wXo3d0BEKMQDL7X0t4hJn+I69UgtuqYrWC6Cg8drS0Y1Tdr+aBNRaYu
         fY73VngtIc9/MowLpbGbq4iUR8IMiqNjVqPKWPQ2X9icE4bx3MMI9MfYV/bc5GDDa8O5
         c4S5GkGcX+D4J2Es7xObZGJYeaGAubAEh0SCFHKQQjMvrkfzyh27zKn2KjkqQQRd5Xhw
         ennEajIYm8oacA1hY/RVRerejBj1IO9PHBc4X0jPZHsf2GyAtYKv5yW+nxZ03NJJg01+
         WLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553459; x=1791158259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlHPB1uz/oxBV+2XbguSNvsGzmXWhY1StfXAGE9Vfsg=;
        b=J+7y62YMT5kS5VgoPZ/NpNn0JwR846s7DBIB0aXOaGFeokNZBhp+NRg18sHq/9lWCZ
         DU17nm3a3KJmv4ODG/528bPliDsOZo/js9z+Kgc/6gyKdwVLtA/V8rU+N5K7TpKhLjf8
         PeuEAmgMKkKoQmiQMTRHj1lm3oJl8SUi5YIuK3BgrAQ+bav5GCv+Ps2MSYCdGak8/FnE
         qrqEYs9eD0e3AIXibzIcQ01suN1yqEUYpVlgc10mXtSwgpJEdoyA4Ay0ThjEnWPbvf9G
         TmqNj75+M/a+ZSZJzxiUXyQhxqx7JEwtGwz+BDO3Z5P85gFA7vHduFzdOhoMgNVXu9B1
         LIUg==
X-Forwarded-Encrypted: i=1; AKwUvBw5c7n1hEAAyVSayV2tf1FoG9k/RwTdITSPtcLZD2Rbmj5VqrrCa9gXRWsk6A1gbwKTeSlWLaXKXFc=@vger.kernel.org
X-Gm-Message-State: AFuF++khaXottJMISSAzNLqq5MUrgxX+TrqXYULQNF1OVhB3HbMQowU/
	wSbtvvkF9EUU3maY6xpxbakDaHTamZGqAmRMqTFDSeJy0XD52jowqeVN+uYUGGDrU+4=
X-Gm-Gg: AYBFou07H/J56GFuRGD8cGyXRz/Rfyab9s2UtHCREufIwV2q1NXrWRAgnFdTTHj9eGr
	3fC1rdHVwtSZz9djnC1aHjpxnBa6QFNfrITviAGAJ2W2Vw12GejSExW/agl0sJfL77a7zwAhGtP
	aCjJyj85NBGu6DEY2a4+iuhXpFnfKHWrTOgPkbk9TkH65oX9cQsFJiRWBimHQDrT4rVMlh5kV35
	FndeqcfvRdF4/Dww0JhADRtQ/eo0D7QMPjkprFJOKeCQtJjCEir70IU80bcnobXpDKsseycCcgd
	zJLYSZYOjejk1ccj2IdrOppqV5WCXetzXKuCt45douba+rWQjam1S+iG+Maave4VDlMOa1JDhes
	uW5hmeAbT1DF1Q0p06g6DN7xYPcPOsUQ42AHEpkaKuEn6UpStHFMNsSJo5FLFAOS65akf9gLjtk
	0D0AOOxyoT9gp85AN5xgjg6pMBCPAt5z7X7oAa9P81az1pGu+wc5Y=
X-Received: by 2002:a05:600c:4705:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fe66d03b6mr203820505e9.5.1790553459532;
        Sun, 27 Sep 2026 16:57:39 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:39 -0700 (PDT)
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
Subject: [PATCH net v12 0/4] net: phy: keep a PHY interrupt across a generic bind cycle
Date: Mon, 28 Sep 2026 02:57:29 +0300
Message-ID: <20260927235733.2619081-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Keenetic KN-1012 the EN8811H PHY behind lan4 has its driver as a
module on the root filesystem, so it binds to the generic driver first.
phy_probe() replaces its interrupt with PHY_POLL, and nothing puts it
back when the real driver takes over, so the PHY is polled for the rest
of the uptime.

Patches 1 and 2 put the lan78xx and smsc95xx PHY interrupts into the
MDIO bus table, so there is a number to restore for them too. Patch 3
restores the interrupt from that table in phy_detach(). Patch 4
restores it when the generic bind fails inside phy_attach_direct().

Not covered: a driver without interrupt support that is bound or
unbound through sysfs still leaves PHY_POLL behind. Removing the
substitution from phy_probe() would fix that too, and belongs in
net-next.

Patches 1 and 2 are compile-tested only; a Tested-by from someone with
a LAN78xx or LAN95xx device would help. Patch 4 touches lines that
patch 2 of the attach guard series [2] also changes, so whichever lands
second needs a trivial rebase.

Other drivers that write phydev->irq outside the bus table, checked
against net/main:
 - ixp4xx_eth, ax88796c and emac-mac force PHY_POLL themselves, and
   none of them attaches again after a detach without forcing it again.
 - stmmac and mlxbf_gige already write mdiobus->irq[] as well.
 - bcmasp and genet (for an internal PHY) and tsnep set
   PHY_MAC_INTERRUPT again after each connect, so a restore that
   overwrote it does not last. icplus sets it on every status read.
 - ucc_geth only reads the field.

The full changelog up to v11 is in the v11 cover [1].

Changes since v11 [1]:
 - Shorter commit messages for patches 3 and 4, and a shorter cover.
   No code change.
 - Reviewed-by from Andrew on patches 1 and 2.

[1] https://lore.kernel.org/r/20260926235024.705646-1-f@lex.la/
[2] https://lore.kernel.org/r/20260924215951.2127682-1-f@lex.la/

Aleksei Sviridkin (4):
  net: usb: lan78xx: register the PHY interrupt with the MDIO bus
  net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
  net: phy: take the interrupt back from the bus on detach
  net: phy: restore the interrupt when the generic bind cycle fails

 drivers/net/phy/phy_device.c |  4 ++++
 drivers/net/usb/lan78xx.c    | 12 +++++-------
 drivers/net/usb/smsc95xx.c   |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.53.0

