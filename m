Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1D493D2C
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859764; cv=none; b=S2CPHw6Dh3y7MroVZzjZdR3IsSS6qY7nMNpiQle77OSHTx6StQ4M0OOXUpw5DHTkRfm4GZT11rO2eW+QQd6hAN23vhmzKFsEUYNfdhN4vU+LU2od5pT5rMXeDYvgIT9GBGpeg57dEJ3fmGE96ykZqlzNvY9x4DqsJfpM4fW4UTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859764; c=relaxed/simple;
	bh=Cr9aXmGdHGi0d2CGE9ICTnF+nGv1yxcvXdUcAGzJ/sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4at23V0Uu5nqeYhCxykL6groredl6rvVl6eRkDZybMGrpOlSBGOXReZNeV5otWTr9Phq7e3Wb4/cWqw2vhChhEjMb9zLkmjAIyBDFB6t33Bb9TQeeAJ4brzyPvxszPv3MMpVyoAIG2KydsBdVvefojaHfDVDiqKTXdtrux7ygA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Egl1gmIz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Egl1gmIz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so42583455e9.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859761; x=1791464561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+v4CXxxuyPIvb+OG8OnbrIijN6oNxBYClvJhgYPdL0=;
        b=Egl1gmIzMJC/NIqtoY2l6MGC2k73x64xcwlj2Xe6O5Q4JzJ2x4ZfL2hPDRpVybIIaq
         8cJ5PwowGK1yzKYg2L0CNT0HvzGykeG2Li5fBD6Kgah0lTYT2A3S0D5wbz1GVtoUL5pc
         8Kj+YD5s3VplaqiwUXljG5m460yffQqAkWrMC9LffkmkUHZONIKnNZmV9qm02jOX5cq4
         18lfPMKwLh+y1ltN2Gv8YcapPUSnKznTAIXuiTy+8f9S7tDrYIo0qtOrxeasAlUlQC61
         HIznAAYWrWwuFwpNn6cLDxIrLAuUTVJf920mhtkEuGLcbAbWMUIQa3XM6Sb8UF8u44gu
         52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859761; x=1791464561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+v4CXxxuyPIvb+OG8OnbrIijN6oNxBYClvJhgYPdL0=;
        b=M7mdo8XPjQ2Bz1wza+PQYKdTVkKYUU4M5L02urZmAhqNNg9tdG0qJaBwE/EcR+oQX0
         4GU2KoDWHPhrDg3igYcPO644KYTlSGVc/j5Et/jqXtSsWQb6/OfjRDoNtoUeFqLEi/01
         euenHn5iXAJCy2UcKeZtQHlA43O0xi8ljrrwGNWArXxKUMvUoXmg4uIf5fbvM3A/9xmh
         l264M15ZLadn05lGaOxMBIYbCKvN7WWn1YECbFduek/3vpKZptcUf9eSHuxEUu2ry5fy
         w3gxnE5Q/LVrjHu9lSUPK5c0Ho4j+lmHcnAldbuTfNOkJervcb1nXiNOD3M03kMyXK4h
         ZSSg==
X-Forwarded-Encrypted: i=1; AKwUvBx5aNlSfE22MymZ6t7NIjk3tB3AHexCG/Xc1kF/3E1YfWl6rGMHj7nF1z8bgotjrxXITOlUbGuWwQw=@vger.kernel.org
X-Gm-Message-State: AFuF++lArS3PRw6eqrrRPEjJexyNHS4JW9WgWXORMrGkzQFzbIeNIu9N
	X9AE7AffWCqAnD14lJluF2qIqtJTOFV5lOEPTJ/MfZezBBhsS7IJ7S1Sjl6lcp7U4fc=
X-Gm-Gg: AYBFou1SbIWuyH+9mO5348P3f1PrXbQExeqpJOayT+IJuKaHixOW5x9MnsLuL4fI0eV
	1w3YHcu7v1nrxoYCeHjGlMEw5cQ9iWoccV/Upu6sDXFmgz83Awz0RrHaPMPCwxq3d3Kn+XSORlJ
	S5HxGaw0ZtBjsx9Z3i9dLUFAuLFBIRh8ym8yT2e7xX38yDMxU8K3O9tvlx8/ksk6Mu2W6jO5Sjc
	0lD2kgxkOTwRdON9V0DTgJtyGVF3LqDi1IP0sx22QfaN8ntUAl0Qxgb1u1k7cYgE6lpee9RkY5X
	6hRMdwZXogO2cCdCWdJ+WnAY1nfiLec+0PnQOBDBE+XuhFcf5k0vVB+ul+APJIWSHi3TCGP65Fa
	+0Xsp54j/Rzh8awJLwXM6JGanGNEPJJbpl1oAENuxSkQw1i+J0oOUhBW1OejkqEd6PfOAmnDJgU
	F6sEgE8c1W5+Mie1Ea4T0oCKkHz+9qxw1LDywEORKpGz4cJxCA7v8=
X-Received: by 2002:a05:600c:4f8e:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a01b00541bmr75269605e9.19.1790859760763;
        Thu, 01 Oct 2026 06:02:40 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:40 -0700 (PDT)
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
Subject: [PATCH net v13 0/4] net: phy: keep a PHY interrupt across a generic bind cycle
Date: Thu,  1 Oct 2026 16:02:32 +0300
Message-ID: <20261001130236.106059-1-f@lex.la>
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
MDIO bus table entry of the PHY each driver uses, so there is a number
to restore for them too. Patch 3 restores the interrupt from that table
in phy_detach(). Patch 4 restores it when the generic bind fails inside
phy_attach_direct().

Not covered: a driver without interrupt support that is bound or
unbound through sysfs still leaves PHY_POLL behind. Removing the
substitution from phy_probe() would fix that too, and belongs in
net-next.

Patches 1 and 2 are compile-tested only; a Tested-by from someone with
a LAN78xx or LAN95xx device would help. Patch 4 touches lines that
patch 2 of the attach guard series [3] also changes, so whichever lands
second needs a trivial rebase.

Other drivers that write phydev->irq outside the bus table, checked
against net/main:
 - ixp4xx_eth, ax88796c and emac-mac force PHY_POLL themselves, and
   none of them attaches again after a detach without forcing it again.
 - stmmac and mlxbf_gige already write mdiobus->irq[] as well.
 - bcmasp for an internal PHY, genet for an internal PHY before v5,
   and tsnep set PHY_MAC_INTERRUPT again after each connect, so a
   restore does not last. icplus sets it on every status read of a
   switch port.
 - sxgbe does it only from probed_phy_irq, which nothing in tree sets.
 - ucc_geth only reads the field.

Changes in v13 (since v12) [1]:
 - Patches 1 and 2 write only the table entry of the PHY the driver
   uses. v12 filled every entry, which gave the one interrupt to every
   PHY on a LAN7801 bus. Andrew's Reviewed-by is dropped from both.
 - Patches 3 and 4 touch only the PHY being detached or attached, and
   keep their code. Patch 4 stays separate: its Fixes: tag differs, and
   with patch 3 alone the failed bind behaves as it did before the
   series.

Older changelogs are in the v12 cover [1] and the v11 cover [2].

[1] https://lore.kernel.org/r/20260927235733.2619081-1-f@lex.la/
[2] https://lore.kernel.org/r/20260926235024.705646-1-f@lex.la/
[3] https://lore.kernel.org/r/20260924215951.2127682-1-f@lex.la/

Aleksei Sviridkin (4):
  net: usb: lan78xx: register the PHY interrupt with the MDIO bus
  net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
  net: phy: take the interrupt back from the bus on detach
  net: phy: restore the interrupt when the generic bind cycle fails

 drivers/net/phy/phy_device.c | 4 ++++
 drivers/net/usb/lan78xx.c    | 1 +
 drivers/net/usb/smsc95xx.c   | 1 +
 3 files changed, 6 insertions(+)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.53.0

