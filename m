Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD247A892
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818096; cv=none; b=bXHT2/vgqRRJTzmZkHrbVDAQqx8KvC3zd2Z0Xy1trRnJAmkiMnmE2+9JNl3TmYBkEoEEwgLOUszgUlNlmkqpp2XvCA3CKVqglRvE7Hew9gBLcGEmRLHAIxsbxz/pnd/ed+/WEIhWtt3wpz+kXoP21BCxAPFpeUpOgAof8G+Wf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818096; c=relaxed/simple;
	bh=DU6aX0Z0p+fdTWqaCesdEJ1etwt1QeLalmsiq/Dz8xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plmJ8xgJrmERKvOH5DKisRmbHwu8/Fh+2w4qoF66P/Mcz1OyIxguKedzJtNhRAI7by+5HwoAmhU5P9V2kZkAExiYPW4wVpRueqWPN+hT743SosRlf86owXH1q1UT0yxHL1lGBucD3XSZ6pjMXdd4PUCZ58zfk6lhUT4HDqYpQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbzJCkHV; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbzJCkHV"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-86cba60d4f2so27681597b3.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818086; x=1789422886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMBKloH328hYHvt9A91TOoJByZqoZnKZvzZqMuRPjLA=;
        b=fbzJCkHVmw+kYHLOmVkyZ0CBUGz5bRWVGiqy+nOetZyljJTzHh6G5jgDBdwrkpHebX
         cWWT8Fi5RXOqj5jNhumOQOxYLsV4d1MSesKt/jwJ/kT1CYQMjQzT5uVG32yOxfcpqVXx
         B1p38RjyQHSpMIismV6VD5gG7HnSjbzqRXXVb9QxTpQO3NRw9Af//ICUsCZAkXzssjdR
         0PYHNFi/hPN+lRP4E0SVZIAlSTBY9g3e1IRxwNOcD+qyDFbktUXW2rj5Q80QhcPUFjzG
         V1CFKNnfxl/VcPPhAxr8g8RFixQeAam9GP6z4AKivMfS97XmCtQybQi8EWaQ2+X4J3Gm
         oNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818086; x=1789422886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMBKloH328hYHvt9A91TOoJByZqoZnKZvzZqMuRPjLA=;
        b=kib4G8NQlIiE8Wx6Bi2BmO0Pkvj/Hah9MagTdeGBICEVphyNwC1JsGBddYRn23gfKy
         UFRMNuKF8HAITN7/9XuKGLY2eRtje97o1/NiuPAtaBaDEPmmQuDX1HTJxI9kGi21Gm4w
         dDp3vPCUHFxW0wjnVjPZXZfHYVoT9xAuIWKM6YhAqDQUAa5GBHhGXKq8mjNnAos1XALQ
         BQ0ei1hkPf2hnhDZ5pnVa5OAbgmUhwO2dgNKMKDUxz77hr87n3j5oJPQ8NazW8XZEsq4
         0B6y7w2FaSnDS9pAr9pPa5+VeU2JOSxK/FGCJTxZ3DddFgkPEG/OStEo5SgDrnCgHP6a
         EQcg==
X-Forwarded-Encrypted: i=1; AKwUvBy5knJFCVjyqE7qYjhNwfEzZp7FVnbjeRjJkxKosBJib7LjC0rH9GXV38Rr5RItCqggH2i0a0Eog9c=@vger.kernel.org
X-Gm-Message-State: AFuF++kyd0gLe/GlF7X1eVRauX0XKw+vEAZOb7kwiCpPKUWQRu2K0I62
	M3jddjjoSWzSeeXthPpGxIQ7pQPgCr8gwjsnLlqJa6c236G/J1eW/R7c
X-Gm-Gg: AYBFou2nTdwQwbwlGTfnDC6umkF1UghjLpqt9fyNmKRewS/SWoHa2ccGln7Q4TOq8Mf
	AA/OX3ZmIj+rQCKAK4xDQLAYtgfmBUqqC6vAlJbTNu/BPEOQ4si+6dXQF4BvehgfGmCOMnlWXPT
	z4+5ntpS75d/bpLbFOBVnuaq83cjCrkffNGRc+gOfbJhdwWdfVgMIwlYBefhbWxwDCvI9+hg/Ls
	fsyMz1TwNNIGU9Hjox7dGVnr/MH4ti6m4ULxl6RWHu8+enuX49mdP8GQ413PjTb3wR17UFTgUvl
	IL5FoyGvUwWCSNN6UE/mzmImxJT4ItfQtBXVJJfszV9w1yc3zgf26ACfV1g9VUu7u+OIjGe6rNU
	PKAmIZcjE/e16g+uvO8aGWX9tkQLDHH5v6Tpvr/cuYO7sQ6S4/w0/CxSeBHIq3LxU5WPsI3hjDE
	YgwqCIRkwOV6B56PWeius14FF+G2tU7wIlf6K1V9RT9U1SzFOaR6BYnAJCxY9zlnfXRL9PR83wo
	v/0jGAbGWPlKNwYVw==
X-Received: by 2002:a05:690c:88:b0:864:6f4d:ef7f with SMTP id 00721157ae682-87121acbbc5mr98578937b3.7.1788818086189;
        Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316356sm77902237b3.9.2026.09.07.14.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
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
Subject: [PATCH 5/9] net: phy: use linkmode_and() return value in genphy_c45_eee_is_active()
Date: Mon,  7 Sep 2026 17:54:34 -0400
Message-ID: <20260907215439.409858-6-ynorov@nvidia.com>
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

Use the return value of linkmode_and() to detect an empty set of
common EEE modes and get rid of a separate linkmode_empty() call.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/phy/phy-c45.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 870920311f9a..27da1b9ddbc5 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -1623,8 +1623,7 @@ int genphy_c45_eee_is_active(struct phy_device *phydev, unsigned long *lp)
 	if (lp)
 		linkmode_copy(lp, tmp_lp);
 
-	linkmode_and(common, phydev->advertising_eee, tmp_lp);
-	if (linkmode_empty(common))
+	if (!linkmode_and(common, phydev->advertising_eee, tmp_lp))
 		return 0;
 
 	return phy_check_valid(phydev->speed, phydev->duplex, common);
-- 
2.53.0

