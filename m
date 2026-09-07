Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2E51FCCF
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818100; cv=none; b=JA6tIQk5H/lRSSp6mYlYuEq0lFGBoKDnKd4aldxj0JQgX3Ior6z2aaoVpRzIew8M1bHTtCuSYqj+UmMmEEQs2sB0se581A0w1nujPMJlUi0Xvlv8wFsBsjokuAC1JYGSEEQ+m73IYFd+mnsyunf5GNBE5JZup8gNIS8Gh3v3YP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818100; c=relaxed/simple;
	bh=cOuGuXTRwRbieXZHpEpUkyizPgeu40kkjKbILhrTpr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRkCs98oQVoDWhihlFNKv4ZQge0m+lOPHgxTNpqTLgQwiFPCz43kjLnCht5Zi7oW09O9NJDFRT5usCwbEF2baPu22utR0X4sJddzQX3bwQtiSJ9ymSgU3hYKBkJoIDB/uwZOp6ycMKTvgb6p+Gcpr7BUpKc0rz8S7kmabE/Z9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmWZmFn2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmWZmFn2"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-866e57f63a3so41614197b3.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818087; x=1789422887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPMvbjF7fIzIRVphdYEwqQYdJVOJV5Z2qbhmmd1p55E=;
        b=YmWZmFn28/CK0tr6SSuPRYdhyC/35acZMQr1WQTNnZ84JBn7jLqG1+yGOAikoLkcLj
         EPnGlTkXXEMLh9/2cPX5BDS9YKntyu24/NvBxKqbjnHT+6Qwb4SjRkSXAKv9yiUzzUe0
         YDXRJZzpS4btQvyfVZbuJr/pwxkXwVIePWgTbLFgZ8mH+dlWf9LUQOagjba2+d0liVvO
         WyW00ba4NGGl/1iNfSnFhoX50mSty659UMQGRFo9Aq2daz1BklMY7qfmmJUWpcMNBgcn
         5OIgdnrH4HPKaKKpXUpvWmIgbRXaj4g92N1eoY20CTLX0Nib9sWqLZX8a80d7r0RfuIA
         6OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818087; x=1789422887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPMvbjF7fIzIRVphdYEwqQYdJVOJV5Z2qbhmmd1p55E=;
        b=buvh0TaS8Tpj2ACNXMVvEOgqz5CdSf83Vp1acRJg0MXlfGGMi/xTaKiFaVBamD3VN3
         7/HgIKQCFRhOoqr7Ll+3HjaSbgpZ6dUmve9TOcW2MLv4zxLwjvV09AJBtae+ygL0vekE
         GCvwSPX0bpJx7pw6t+1Joz4X516UglFMK8XERSW/XGgFOqKNxbSsfxigV9UZpQK/4Sy8
         QBS7E1rPydHiz6vdUZKYli/ZzuiggwnEBKlxijBAEMCjS61sUGiGWaBJ8Y+JsHy76rCA
         JfS2+XNWEJ0UTgocFCfeoVrJuYgS4QgJQoTus4qy6opyVwW66e5IXDmghi3a7EgF6CdA
         VbCw==
X-Forwarded-Encrypted: i=1; AKwUvBzJsiS4bUNAw3eAPr5P4eg7CYkTqcHW/9bOuJ3iS2iBZgSpmBaX1mpcxITk164fAiCG+REEg00X5EI=@vger.kernel.org
X-Gm-Message-State: AFuF++kZMP65jfUrgGLjmqFMEU+ecC+CSuuZMX1Fk34yDJgRaVuxzgPV
	3PhZ9cDdZM49hvy6pN4p277lOzHUIeEaMnGJ0zYb6eYQ7nRRMTWGc5gA
X-Gm-Gg: AYBFou3DULuiRDtWmmWfD5+FBYwHlxu1WbzKkeTkDHDKlLHAQIXF20wUB0E4maGeSVA
	9SQY2h06ogeaOdMrNrwZRIKR2hD3ZPo7tm0d3UoExUFtiOJuRzSovWGNA2hWnmHN7H7UwxMYlT6
	+uHfTyWrAVJxpvkGtTqxMfWbeAi3pJsPHUuip7Sv6pTP2YiYFtOqESS0cFW0A8sL0WYOlJkNbpH
	JTpGZegUVA/wDTQOnpWTRrdQIhbPzxsI0TjR52e4xC3nrKQfPjjUl+Xq22uWzQQ++DyrREwec62
	1t1L7pAvs5MLLL45iKyB411zCSHE29D2ucSxTUCWnjBej4/WYVg5/yOa6P3HcjBa+aOHv4T3mb9
	pYgWkBTHXnSHKDVMg6lFp4bUD/ps47QEGuf3v4QI7KNxKmz4gFAtWuwr3zVUZzOCyw+3mHMoPyJ
	J4ZXIq68PCp3FIpMnQX5Nz/adcjehamgdde3zdfoKP8KnCpGaxQRZWexNS0291nZHEBDeq/8JDv
	6EP195SkO5S1mXkzg==
X-Received: by 2002:a05:690c:e29b:10b0:873:5ddf:d864 with SMTP id 00721157ae682-8735ddfdab5mr46438527b3.47.1788818086989;
        Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b62bc77sm78551997b3.39.2026.09.07.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 6/9] net: avoid copies before linkmode_and()
Date: Mon,  7 Sep 2026 17:54:35 -0400
Message-ID: <20260907215439.409858-7-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid separate linkmode_copy() calls by passing the original source
bitmap directly to linkmode_and().

In phy_ethtool_ksettings_set(), also use the return value of
linkmode_and() when validating that the requested advertisement
contains a supported link mode.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c | 5 ++---
 drivers/net/phy/phy.c                                   | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
index cf881108fa57..5801da6100b8 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
@@ -205,7 +205,6 @@ int hclge_mac_connect_phy(struct hnae3_handle *handle)
 	struct hclge_dev *hdev = vport->back;
 	struct net_device *netdev = hdev->vport[0].nic.netdev;
 	struct phy_device *phydev = hdev->hw.mac.phydev;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 	int ret;
 
 	if (!phydev)
@@ -223,8 +222,8 @@ int hclge_mac_connect_phy(struct hnae3_handle *handle)
 		return ret;
 	}
 
-	linkmode_copy(mask, hdev->hw.mac.supported);
-	linkmode_and(phydev->supported, phydev->supported, mask);
+	linkmode_and(phydev->supported, phydev->supported,
+		     hdev->hw.mac.supported);
 	linkmode_copy(phydev->advertising, phydev->supported);
 
 	/* supported flag is Pause and Asym Pause, but default advertising
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..cd71186cd842 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1160,6 +1160,7 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 			      const struct ethtool_link_ksettings *cmd)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	bool has_advertising;
 	u8 autoneg = cmd->base.autoneg;
 	u8 duplex = cmd->base.duplex;
 	u32 speed = cmd->base.speed;
@@ -1167,17 +1168,15 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 	if (cmd->base.phy_address != phydev->mdio.addr)
 		return -EINVAL;
 
-	linkmode_copy(advertising, cmd->link_modes.advertising);
-
 	/* We make sure that we don't pass unsupported values in to the PHY */
-	linkmode_and(advertising, advertising, phydev->supported);
+	has_advertising = linkmode_and(advertising, cmd->link_modes.advertising, phydev->supported);
 
 	/* Verify the settings we care about. */
 	if (autoneg != AUTONEG_ENABLE && autoneg != AUTONEG_DISABLE)
 		return -EINVAL;
 
 	if (autoneg == AUTONEG_ENABLE &&
-	    (linkmode_empty(advertising) ||
+	    (!has_advertising ||
 	     !linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
 				phydev->supported)))
 		return -EINVAL;
-- 
2.53.0

