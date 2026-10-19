Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438598;
	b=zcljsRRbJ/aoZVLW5WB4nDUsoWzqmXw4gTbk2LVT6ywPs4IbgwTs1u9fJqqAOCwtMilz
	 Jlku695fjHTnhOYyqKSwC/H1ajdP3Nmu/rkeV5MSQMIL7tu4eS0+E/W7Q7RIzbGurEg6s
	 v/sUqY/YQYgdjLpO49gK7LplZixSV9Tg2ByrtUgjZPL29BCvxXm3mFpbqDaDkBqgeTzX0
	 1SsCJiJgOd6t7F2hxxDRfe9AU6RjijZh9YM1G/pVMoZP8MA3fPJbGrdrEgUcaHg1eIWn1
	 Zf7PdtSEx26EUQut8lAWku6AFIsYst/aV+J9e7yD7Pr2+z5tRC/MDgy5tvYrZAVayBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lf4sMTZrdesRxg1xBJVdHHtuRLabPGu8I9i65QyzjrY=;
	b=EpgUwXe40ujCk2tS8HApUr1g8FSstaq7Cjv3G+IzsRgcWKV6p3RiF/JRINZRVU5Za4rp
	 giG6m1tZcPgleXxPFCYHr9qbufvJ5U+NxgnsghLicOtopE047Udn7nPGrdFPkJXeqlvhx
	 +BAZhqC4O7NRNVyd0OEHYYdCj7n8sdOq3pqT88F+ZoLhIARBjDhNQr28X0mp3yrTF0heY
	 UMb/HZmEyB1Jtu3cAA9f6BbgfoWAr0nVGmB9HRWaSVSBzRq6jredkiT0CCLM9uVGc1tjK
	 Ssm0b9mauytBAtqx078U7e6xzwTEyEoSxlcnvTMEy/7+3YpcBZDe2ShjLxujoDoidvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="U/HBN0Bv";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB124606A31D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB124606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U/HBN0Bv
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so4611921c88.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792438597; x=1793043397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lf4sMTZrdesRxg1xBJVdHHtuRLabPGu8I9i65QyzjrY=;
        b=U/HBN0BvWaU1F04M4ZB7fuHGeLstE3cH6i0i5Aff7kz0wTWGyy5VcjCxVeN+FcVwY/
         0a9Uoum5pqXCy3XtG25YcaRgjpn4mgzCfrAglTlaaw7Pd2Dt7Mwxz4FXuhiFnO3S9rZz
         SJiCOuxfJSKtYvUw7VgdGfuLJnENtR4Rtw4pDs4XRbiiUBEgcggE7tnK+TAOx7xiZM6n
         40nyE2ib7dk5POoxMsllDkb1JTihXAYzaHEMv941n8uLrsLkMuM+lWDq49eRUvkfGKrJ
         vAvp7fkVntt2Ds1JE67qoPTdV2HtZPWKsUi7m3fqQVueaDo4fLxqQ4l6dTpK/0keyFHT
         PMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438597; x=1793043397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf4sMTZrdesRxg1xBJVdHHtuRLabPGu8I9i65QyzjrY=;
        b=m5mlWq8JI/CUhlKqu+KPowIKrFMDI5m9BYvg9Zqev3MGgmBH0RA4WWvCDE+oV2aggR
         3A0EkePR1MTgZy96v5MsUWJ5nB+pE3KjwgisUyTZQ0blVbwcmWQgRAvLpypPXci+cn2x
         rdUYQoSyVzDQH8tIxyRZ0UJ68gm6UGa2fRi8mkMYJ7HVeDQfDiZrQTDCXCn0//St1JpZ
         P7ktv8OErDbTMbKVxtkMITD8VCqfJyoRHuKNucyoVQyq6Li1wycLdMn6OyAo15FSQIUs
         4UaZfBLuSfqQ2+7SwUKDWAfoQvLq86OtioIGzKX4le3meCjWcIUzIJnbxlWtlk7/G48N
         ONVg==
X-Forwarded-Encrypted: i=1; AKwUvBz/zBxAbUkJOY2siDRxVuqjl5hK0qSOkfP6ECoZES/jhAvnrO/0CYtvI2PtRTbjjkhxBUVQAsdqMIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfmC5SvCuJU7nw5ha5ZJmi+bUKi1VzUT9+sGVlxJ7p46fEBrAm
	el/KOZiTfyILa+BaRCqvqvFnfOfX4pxgqoMbHnYPis0PELMs8i0Hz0kt
X-Gm-Gg: AYBFou1091IJvusMGtNgaVGJ/dbNRSOuMcv/9nwfEirVNCN4WhDYntSW1PUb0xkbfcF
	xw0wgkq1YPgqNJsxjOECxnMmBvW5WSPadMdG4Wma5nJ2k7vf5d7JllnLiqpf1iA846vZy/ehOpO
	iKbPiEYCjgrD+wX06u+cZlRt4DN7RQA5nJJv+c0EB55xqiXsXCFTdcfwckMH3gQKc8XbalklStg
	nnfAOTt2GufTTN68cH3UbxmdZV4a48qxefriXe14cUQMG4C4uon/hWWb5XNWHxv09khAkhCnSoQ
	rv3cuWcssH0W43zgomSeTDI9w54Dl8e+f1sDDN8wKguTuu6Js/85kJ0n/KYMZjz9KMd76QjjhyN
	S4bkhY9U9K3jIOs9HLnQf0xn5Fc2YHN7RndoWWQcHhtwgVESX+3pEgdPiqXfCCzEGfh+Cx9E0TR
	kEve5ZfaCqbQ4tX9CVDqrStRpCQ7XiMUWi10SokLeKPG9w/cqoy4xJShPkSTkQDlU5GHTbNjQAb
	a/5p6xaDWgAnQRVBQf+e2Y=
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr13380836c88.47.1792438596542;
        Mon, 19 Oct 2026 12:36:36 -0700 (PDT)
Received: from arch.localdomain ([2401:4900:add5:70b2:7032:342a:ce70:6aba])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm47260509c88.11.2026.10.19.12.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:36:35 -0700 (PDT)
From: Prashant Sengar <prashantsengar25031@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	linux-usb@vger.kernel.org
Subject: [PATCH net v2] net: usb: lan78xx: avoid NULL PHY dereference in WoL setup
Date: Tue, 20 Oct 2026 01:01:48 +0530
Message-ID: <20261019193148.1381545-1-prashantsengar25031@gmail.com>
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

Use phylink_expects_phy() to skip PHY WoL configuration for fixed
links, and use phylink_ethtool_set_wol() for configurations that
expect a PHY. This avoids the NULL dereference while keeping PHY
operations within the phylink API.

The issue was reproduced using USB Raw Gadget and dummy_hcd in QEMU.
An ETHTOOL_SWOL ioctl triggered a kernel Oops with the original
driver. With this change, the same request completes successfully.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>
---
v2:
  - Use phylink_expects_phy() to avoid PHY WoL operations for
    fixed-link configurations.
  - Use phylink_ethtool_set_wol() instead of the direct PHY
    helper, addressing Andrew Lunn's review.
  - Preserve the existing controller WoL configuration order.
v1: https://lore.kernel.org/netdev/20261018151830.643511-1-prashantsengar25031@gmail.com/
 drivers/net/usb/lan78xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..1702f633d42e 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1805,7 +1805,9 @@ static int lan78xx_set_wol(struct net_device *netdev,
 	if (ret < 0)
 		goto exit_pm_put;
 
-	ret = phy_ethtool_set_wol(netdev->phydev, wol);
+	if (phylink_expects_phy(dev->phylink))
+		ret = phylink_ethtool_set_wol(dev->phylink, wol);
+
 
 exit_pm_put:
 	usb_autopm_put_interface(dev->intf);
-- 
2.55.0

