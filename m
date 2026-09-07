Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D046EC7E
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818103; cv=none; b=A9F+6OnbLcRbtZtfzjo0NL2QmHQN5Lqlunt1gGU/6e6hV2/ecqqzBUb4nVBNJzxHfYrrR4dSfKolYWLJmxNBKo7Bxkhey5Klz/yhT4+Hc3qOkwlQq2Kl3XO+Qw9hMyF+ZZfUZuLBzZKneVrlbIIYndmRSdeQHDB1OuRRnJJxvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818103; c=relaxed/simple;
	bh=UueUMpeCwNeGVdy3GJf5lm29xyeCkwc/aGA+P30mwdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cw8+6lgDxrTRstrbg3a4vgTBoQ7mq6/jg4Ws1+/HxzTFQhuqhbJ18YaNZuqUpg4wiJSJgy8ueakvnuaE25jnozBKJ1FVLkDCJVvOGOrRhfZv9UDHGKs9rzVZJqr0lGe9YWekcWshOLhMIlmZOQ7VBkJNwOna9ChwjNwL9nfO5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j73ZnSGr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j73ZnSGr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8726acc5eadso26726097b3.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818089; x=1789422889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dBsS+uIQswAO+1Zq7ZFjEaF0vj6TxYTsi3HHjhGAsc=;
        b=j73ZnSGrWL60KlmfspddoXdvmb153n0+llSPhJJy5CQ5dPoVj7T90b0b0Ifx/3GKQa
         7wbdHTPJ+HpGPwa8scBxlsxEctTL81MSiLHMQ3aD5s5mGxIuRAiNHaIDVSMmfn/G3Y2f
         EulYrEOSlZ4XO+zfRFhYfT54W+pDT0OrUtzOfHukN11SbDrhcs1FLl7kPxZC2aws8v04
         PpUqkZMsm6yfx03LRUUABGR1g7deHfHKierqt3ertUQTVeZwzJFQ66tZ3ByF2VJPHv4z
         +XV8VaiW23XsFrQTGNWmkl/xBGJe5cy6WMVJeX04vwJwgTgT0u5CFLu/LQyWRdECsIjz
         392w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818089; x=1789422889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dBsS+uIQswAO+1Zq7ZFjEaF0vj6TxYTsi3HHjhGAsc=;
        b=ST5kFtoT9IqQZA5xUG+Vm5BeQXXVQllblacaBRczbj5sZnb1vMJbPFS+mI4g2mSf7S
         oxTkEZ/+sBE2Kx+oi8MEvORjD/xmcJ2/B0PnxwPU+aJYHGhowE21Ilsnhv0udN49gMV/
         YU3xDlE96G7gnT5SAOfqf8u57/6b4yqy8qfIVfYPXMjtqVE315h2UkaYr7wkMkX4SuLw
         3PhrBEMzK5GZZAWQHhgme3qqkL60d00kgWGc98uBmYaKnP7hhQvwGqvJnLgmtY4Ts53R
         YThhcF3mVXDrycVkHskyWDOqRDLSQQ7oNMlMvql1lhZncqCoI09nMuQPRO1SM2q6Ui8Z
         EaXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGyZw7S15Mdz82B82qK3ODnHe+TJzbYMB4cI6rtiBYWFN01RKsKfmzH7rk5C2BTr7h07yYmg8ZDxc=@vger.kernel.org
X-Gm-Message-State: AFuF++lFyq5pDIV6+aVsvSxkX9iyHS1jvhtkdFgn9sNE5z1qrYy14HqI
	UayGxelnc5A938Ff4n9nEHdWWDLia+hFQMHBZU1w23VsuhNcxHHGf8ek
X-Gm-Gg: AYBFou3vOHXxuzqr/3TGw3DDD+7bMu6BN5NSySorYatQaWbetKj8rQkUq5iFFEQvMSI
	ZofOw5tz4/xnoTM4hMYmOUDXpAVttrLPHW+tquS/cyono9V4ZpWb2bYxTx+lU4dChi/+HsL22T+
	PQLJ5W8Bi3KVMzHpFJLrQUyxaPw0CYXIisb1y8B/WhsT/VD5RwYkvIS1y7SY8IBUCWuQclvIW2m
	4UrWWR3vg71/imtSHZ3QcsZAGtUFrxGAV5qjEz9v9DcfI6GWlKY3Ny3oCgaNaoj/6va1Msys3be
	mevQohIab0jcV29fKaSkRBHdQrC48Wz51V7JSIZOtbmKVvEa8rbXvYUZz5OpwSHQT9JQjVjKtg5
	/chhrEaOkbnlCB4VkRgbWmCm+p0ay+xzsQkKiSUH1tmSZMp8th3ZDQySGWmeivxvmKjwqOAml7V
	XM0hdk4XRZGovNa7TIRlbrS4y2c3oVt1LJdt8sv5Puayc0rMcsuTxVqbccHB5Oee1aLIZNwvnWw
	VrHP90aDF5YsDhhHBu8Ofz5vsQP
X-Received: by 2002:a05:690c:c4fa:b0:866:e57f:58db with SMTP id 00721157ae682-8711ec239e9mr98053137b3.0.1788818088629;
        Mon, 07 Sep 2026 14:54:48 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c1e1eacsm78453177b3.49.2026.09.07.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:48 -0700 (PDT)
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
Subject: [PATCH 8/9] r8152: use linkmode_and_and() in EEE checks
Date: Mon,  7 Sep 2026 17:54:37 -0400
Message-ID: <20260907215439.409858-9-ynorov@nvidia.com>
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

Combine the three link mode masks in a single operation and use its
return value to determine whether EEE is active.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/usb/r8152.c  | 10 ++++------
 include/linux/linkmode.h |  8 ++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index f61686433031..75f0574fe1d4 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9149,9 +9149,8 @@ static int r8152_get_eee(struct r8152 *tp, struct ethtool_keee *eee)
 	if (speed & _100bps)
 		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, common);
 
-	linkmode_and(common, common, eee->advertised);
-	linkmode_and(common, common, eee->lp_advertised);
-	eee->eee_active = !linkmode_empty(common);
+	eee->eee_active = linkmode_and_and(common, common, eee->advertised,
+					   eee->lp_advertised);
 
 	return 0;
 }
@@ -9222,9 +9221,8 @@ static int r8153_get_eee(struct r8152 *tp, struct ethtool_keee *eee)
 	if (speed & _100bps)
 		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, common);
 
-	linkmode_and(common, common, eee->advertised);
-	linkmode_and(common, common, eee->lp_advertised);
-	eee->eee_active = !linkmode_empty(common);
+	eee->eee_active = linkmode_and_and(common, common, eee->advertised,
+					   eee->lp_advertised);
 
 	return 0;
 }
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 49587a2e0f69..efd392dc62ae 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -26,6 +26,14 @@ static inline bool linkmode_and(unsigned long *dst, const unsigned long *a,
 	return bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline bool linkmode_and_and(unsigned long *dst,
+				    const unsigned long *a,
+				    const unsigned long *b,
+				    const unsigned long *c)
+{
+	return bitmap_and_and(dst, a, b, c, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_and_andnot(unsigned long *dst,
 				       const unsigned long *a,
 				       const unsigned long *b,
-- 
2.53.0

