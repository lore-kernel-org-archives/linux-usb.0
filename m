Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D1443308
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818098; cv=none; b=X24OVec1ctHaDFoqCjA6huuaqePwJspQ+QrgpQhh0k+0nIgLo0QNz5DElTmg/O0uG00LQG+MlNfqXozqJgnGXCulkAjU6670zZA/RysryFf1LmZPdPyo31bXGmd2zAaYRfWhZfu2sJazdP+R7pGsZs9QKb4e/xv7fmVcRyamXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818098; c=relaxed/simple;
	bh=E+Mq+ULNyxirXwXDZ7xaGocuqj9Hq20RZCcXQzzR7B0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sytFBk8Z9yTH+axcc23Q/N0rqAb5JHJQLG/kaU4aSb8+o9hWy1/BpEj1Vo1188sOTmfWx6SFOwGw0MH0ygvMmotn7laKjKpKVopf5xLtbYTgvHUW6f/RoArjaVYOEyGN/5SWXFAnb72yaSKUIKI4iylgDN1R8mGmedSHvIrs42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEDdWO+g; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEDdWO+g"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66fdf2a9aacso1525235d50.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818088; x=1789422888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8WIjdrmzAfceuartpDLM7+z5YZ8GSTaR8aMPWb/Pj4=;
        b=VEDdWO+gXRQbdBFam2f7xu+H+0Xhbkbd6nexacBnHSMcYOGt0pA5LU5DDOoD5aBSY+
         YjSAlyBGMMceD6vueqTFXroFmsEC7rODL1//xRjKn0n2bBGhJ0PnnqnY/5UpClbSCqSW
         r9lQzPgItl3MwdyKqXq3JLX3aA/s8eZuYRw2fAnOczvQ+KyJLWF/7Org8I1yqXSLmDa3
         pGXGvBi7JsYN6gO36svL4pMY+seFwswycoakZPNUoxmbJNSExaI0ZcS0tH27HTRIgHJ9
         wiVXoATfts+xBVqSJ5CBjq8YtA+hyoSB0VIAXuV32Z8+DmWaq51U3wzmsdctAG3grCOw
         hlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818088; x=1789422888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8WIjdrmzAfceuartpDLM7+z5YZ8GSTaR8aMPWb/Pj4=;
        b=TKWXJ/OSyiE7qtD5YVIUjM8eMbqO0BaB2CppojUnBiaopADtN1S+Y8JdGtrOHdDQUl
         9MifssTIpTtRxPSL32+ryCYy0pL4VDC16vuy0Cync5G19MqKWwbfboj3oXdCyyMUwo64
         6hyxx0eGpbBdgLjUkopLGIiLE/BUngPQoQam0uWh+7POD4+a3cythasyWtlMSPKJq5Hk
         fV8So8rZD+8DKuhXk1OdMqFqsfqrN4zClKK5G3QgrI59k+Vw0Z5KiPfKB9FfVrCnZuFN
         ND6EF2efBwtaAG1LwRzzFwoc5GhhG18VntBTIThLdjp/FKeevGcaCE+U0gTax6fiM3Lh
         VD8g==
X-Forwarded-Encrypted: i=1; AKwUvBxE4H/Evi5DIN7nAoMhOUyzkgJCPbeiLOO/P/LD5Y4EcjzNNZirYjvTqipmpa8J7Vt48CLK5LMu+24=@vger.kernel.org
X-Gm-Message-State: AFuF++kgmDi0kSMeXSso/EZvOISJui/EyyeOW5lrx4lYmoRQrkbdOnTl
	h3mSneeaXG7w/kT7uGxRwdGKh85kJ6pA4baHsj0mBV2BL0vgL+zL6DFp
X-Gm-Gg: AYBFou0+4R3sVliQ8RprjLCzl6X2vQh1JB5btcORZq60HDNgmiHUtdSQnyheT/qifiO
	UD+NOXa/oR+N46gkw+T05venThjOtq+h3pL38lRdoV7klmAwms9CJ477AIn3wCTSPOVIlcb7dos
	tlp/5Ttk9dPeYn0xpdGlXX8/wzoTG7QtrSNBVtcp3CFqZobQ1nlAlFP8JvX8Bq8MZ8zNfbglB0u
	e4yPR71ov5YgQv4JNg+9ljueN6pUax2tzRzzvyILz6OFTOtWTx32dNYWYOzqVGA2STkw3STAxBI
	fuy9vfj72N39tVft/ycnCPyRGSTtMvbb+7aG9XYZQhisSKaHv2sj/YhXafmatQyY5nr6/XBiUQd
	FupiZPtjTU1nVR1AIH/T205CtxhWCyFWR3ipR0f6VCcebUhtwHDE32Vl4ZcZj6bUSIw6LrF9PZz
	t/bhJKFlmMBzbcT7pt2lWaiTxDP9iCfGVnZBaBM8frB5V29VyhPOOIwAgdYwmQhGqttM+V0OPKz
	vifN1X3lLFb1PGax/sGqbVu/b3O
X-Received: by 2002:a53:d751:0:b0:66f:c1be:84f3 with SMTP id 956f58d0204a3-66fc1be873emr4452634d50.97.1788818087837;
        Mon, 07 Sep 2026 14:54:47 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a87ead5sm77758477b3.28.2026.09.07.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:47 -0700 (PDT)
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
Subject: [PATCH 7/9] net: phy: use linkmode operation return values in phy_device.c
Date: Mon,  7 Sep 2026 17:54:36 -0400
Message-ID: <20260907215439.409858-8-ynorov@nvidia.com>
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

Use the return value of linkmode_and() where the resulting mask was
previously scanned for emptiness. In phy_probe(), combine the AND and
AND-NOT operations and use the return value of linkmode_and_andnot().

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/phy/phy_device.c | 14 ++++++--------
 include/linux/linkmode.h     |  9 +++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..3430605695c5 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1565,8 +1565,7 @@ static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 	caps = sfp_get_module_caps(phydev->sfp_bus);
 
-	linkmode_and(sfp_support, port->supported, caps->link_modes);
-	if (linkmode_empty(sfp_support)) {
+	if (!linkmode_and(sfp_support, port->supported, caps->link_modes)) {
 		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
 		return -EINVAL;
 	}
@@ -3761,15 +3760,14 @@ static int phy_probe(struct device *dev)
 	/* Some PHYs may advertise, by default, not support EEE modes. So,
 	 * we need to clean them. In addition remove all disabled EEE modes.
 	 */
-	linkmode_and(phydev->advertising_eee, phydev->supported_eee,
-		     phydev->advertising_eee);
-	linkmode_andnot(phydev->advertising_eee, phydev->advertising_eee,
-			phydev->eee_disabled_modes);
-
 	/* There is no "enabled" flag. If PHY is advertising, assume it is
 	 * kind of enabled.
 	 */
-	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
+	phydev->eee_cfg.eee_enabled =
+		linkmode_and_andnot(phydev->advertising_eee,
+				    phydev->advertising_eee,
+				    phydev->supported_eee,
+				    phydev->eee_disabled_modes);
 
 	/* Get master/slave strap overrides */
 	of_set_phy_timing_role(phydev);
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index c08632c10c3d..49587a2e0f69 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -26,6 +26,15 @@ static inline bool linkmode_and(unsigned long *dst, const unsigned long *a,
 	return bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline bool linkmode_and_andnot(unsigned long *dst,
+				       const unsigned long *a,
+				       const unsigned long *b,
+				       const unsigned long *c)
+{
+	return bitmap_and_andnot(dst, a, b, c,
+				 __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 				const unsigned long *b)
 {
-- 
2.53.0

