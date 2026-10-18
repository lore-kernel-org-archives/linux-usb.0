Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CA379980
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336731; cv=none; b=MtTE1269IjrWPpcPl3iNGu2ZCiJkfCP8gfGgw1HsxjIHYQBTPQlRrmFC/0oibNP9jWONsBPP8qBxz7vsKypTa7wzBBwyJpp9Lqtq5snbwIEbSiawwvjG6zJt5UFTQZNLA+obrjY9n81LuHSdrRTuPfA2kkfByeWHIV92m47mM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336731; c=relaxed/simple;
	bh=qx/4nlszNIOvSXPbFdqTk76/GDOMD94CXfm2Y2LGsRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mDcURFG2YcPbTntNikyPqibL+n/AYzrJAYzJ9WcxWclrA4haIZwMpJw8RJp4l12Q7MjDTF1H1Q7wot2ul0fSPTFrE1fjjkc8QK/eer0Qqfj1Zi/V33c52R3n6gu8q/YzGRAZyVgGODnr94l9e9jDIfdpyycg4oS0UOX1/1M2P8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0Svhqul; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0Svhqul"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so1559080eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336730; x=1792941530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLB6J+RYOkmZpaUfT4tBXxcs2uf2yhVuzsyRosaJUtw=;
        b=U0Svhqul9F8ETvSPTspsXInpDr0KyTkIS6tFpQEfn91qE/qUR3jRzvwL6A1cmZ089B
         hn+PGWIG0aimANuy/jNQw/RGiMh5dIy4EGgBKFY7B+x06Btsj4EbBnXYbOH3PDPhlDW3
         5lE/EyOHHkTJlmrpfNvHXRL1iUa1uqiL7plPUFFEsB87aIg7TPuJWP6EVE2eA3KwwuHv
         1yQKZfX9kLtgPGDBBB6qT6DBERNFivEOEOaiJii6xumzIzWLxepFJxGhzVxaRFhVVjOi
         pkScfWkHstkmf9TCmMhx6ZGSyQY1t5jBuXSvxnuQBP1R7T5u5BIEwaIbsvexV0h1KDIT
         uYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336730; x=1792941530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLB6J+RYOkmZpaUfT4tBXxcs2uf2yhVuzsyRosaJUtw=;
        b=khayqhpgkKFikTXbHYXjEKYTPZZYBd+XcD49YwqrJMe9d/P/NYE3HwPeXLkK31wm/R
         0VlnQhlHrQlAxy2SjsT6ARxKM9cI2f/cOxHO+iYPFd5CyCDXz4/0hoGlsg8hfuHatm4x
         flZPJjRVV9heU2vqe08IjUuA6z6Tu3uhRA0XkyhbbQAT1RihCHi3jmZLOFx5AnMJ/iG5
         Ms+mfaDzhEBMTjUDRr6QrqdMOwC/qt19gknTSxgZfQ4F7EYugvghU+hT8ay03cAvK6DF
         zen0I+KngsW/kVAwsvCgEbkycl9kwP8iU4GEYrVfLY1RLeD4yKE1Lrvb7sBFCPBwoYES
         8fcA==
X-Forwarded-Encrypted: i=1; AKwUvBybaOkP806Tgxj1ZVS+f8mQ9v5tuC5AqFhmGqtx/rVu7zPweDq3ioeHKouLLTyoVb/OhHIKCE7Y8mI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhTF2d0HqnJeqwul37EATniaJhdNOqfXV6Oc4Pgt5LRm6PBftH
	ZxqJr16RJD+Pumg0xgrH8djPjakDhwGfjqfT73LcS/g0uRNKsOkruP2Ujx3mRjlojAI=
X-Gm-Gg: AYBFou374geRcu6g/p/gFssUj8334KNXgNIHLj+BLQavphwQ0UHIkZjAU8e5ZY1Wqrb
	UibKfzSM1E8+5ujNcEg0f4vABDvWkmuJkJgO17t89JW0DPeqZ9SJ9MJ/hAxquYZHHATl3prR3jM
	+GB1po4O2UOoqvzn23izCxiKqwxDYBOTwzRg5iW8cScsLrTckWi55sx+rkwvPdx5WWasWrewzEa
	4GoUWKxFThFjXBRvdDs+jw2N2KxTcyR1pa9/py+H35S+DN8IDat8We+8e33ggDj4Rr1pQCFN0Rc
	hMvEA4x+slAXwbisoqhOS66uMb5VFK9b4ZQbH+To2ChvuFz3j0rtYCXO0NMDuqtwweonn1tZpGT
	bpOtryW/hiRbe8j35hWekOcuOTM3ZyEl25x/pcAppd1T95PlgH8pnhWu2h8welMb5YkjIsdDIs9
	k/yJoKMHmy3Rq8ZREWN7NQbLDKWdTzsLMIMmOrwaQBO76NiEj55EZvPAvoA0xosy1/EvbWR+VUm
	HVI2dHsQgukFfYxKCP90g==
X-Received: by 2002:a05:693c:88d0:10b0:339:7b3b:236d with SMTP id 5a478bee46e88-361a1f5575bmr7760238eec.15.1792336729527;
        Sun, 18 Oct 2026 08:18:49 -0700 (PDT)
Received: from arch.localdomain ([2401:4900:c259:a21:b203:ebb9:615d:d6bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm41698209eec.28.2026.10.18.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:18:48 -0700 (PDT)
From: Prashant Sengar <prashantsengar25031@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	linux-usb@vger.kernel.org
Subject: [PATCH net] net: usb: lan78xx: avoid NULL PHY dereference in WoL setup
Date: Sun, 18 Oct 2026 20:48:30 +0530
Message-ID: <20261018151830.643511-1-prashantsengar25031@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN7801 supports fixed-link configurations without an attached PHY.
However, lan78xx_set_wol() unconditionally passes netdev->phydev
to phy_ethtool_set_wol(), which dereferences the missing PHY.

Only call the PHY Wake-on-LAN helper when a PHY is attached.

The issue was reproduced with USB Raw Gadget and dummy_hcd in QEMU.
The unmodified driver triggered a NULL pointer dereference.
With this change, the same ioctl completes successfully.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")

Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>
---
 drivers/net/usb/lan78xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..0c19a8462352 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1804,8 +1804,8 @@ static int lan78xx_set_wol(struct net_device *netdev,
 	ret = device_set_wakeup_enable(&dev->udev->dev, (bool)wol->wolopts);
 	if (ret < 0)
 		goto exit_pm_put;
-
-	ret = phy_ethtool_set_wol(netdev->phydev, wol);
+	if (netdev->phydev)
+		ret = phy_ethtool_set_wol(netdev->phydev, wol);
 
 exit_pm_put:
 	usb_autopm_put_interface(dev->intf);
-- 
2.55.0

