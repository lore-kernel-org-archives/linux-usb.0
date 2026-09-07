Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1B435ABA
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818087; cv=none; b=Yg+DXERoriEFHay9cVeHhH1prf7ZxLRFBSHz5j6W3z4/kqz3eoELmkeHUAmMecIsbKg22KoSfK7dTzcbAvjHiSfUNx32DDoql5a2oRhDRiMylw0UoMFamhpPapqLnHmLgHk4azMYoIMWdAXXkT2pEjRnNceTFCgpUQvusRKoNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818087; c=relaxed/simple;
	bh=6gD9cPa3rk6w/IUG4LaLFS0hBqCw0Ni+w/H83jcmfzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWXcxhsacS8IbsnbEf3bvZ/RT/ulowkCCY6BIonPQ/cOx3VTFARl+9SL6g6w4o5qO7j6NRwtF3xiWUSfxnEnOGjo9Rs0qk+ZbyXUfMMhCV89mvPbFGLaP0qnCAWrdzi9/cLnoLRPEHuZ7KbDnMxt835Wd3NXxPCBw1v91FPPUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIWTHAT9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIWTHAT9"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-857ff9fef54so34841507b3.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818083; x=1789422883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUuTL8RKq8zctKFBGR36Xkq0F1NHQ5YoR0hZaul99pw=;
        b=qIWTHAT9quXqA0t6iOtNO/cWrRcxjeYDvz09E+AkWcxyxnjPeDjjAYX78vwb5lm3ed
         8Jq6R2tRFlC0+brur2FptO9TJ4RYZxlh0tXE240RPv0oIRRDZ6kIc3wCWbNSd36cwts4
         cGBX9t39xKhAa08SIDlg7kqyrbHFGKFlb3gu8RUOEKxvTv7umHvATMb6yCp50fQ2fVu/
         s136vjKD8FxjBwYh0YiP4jIGtwc5dcZLoyC6oZ2d5miiiZEtjnV6q9VPZZa0+R/diJQe
         WCZKrIZiN1CQXJB50VNU6NxPzc2LW58HahHyF7zntN4TzdACIAwoWOqnDBTonFyqjqML
         0rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818083; x=1789422883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUuTL8RKq8zctKFBGR36Xkq0F1NHQ5YoR0hZaul99pw=;
        b=XgUxM3gNS/O8zxug0aio1lFkRNwHrazdX5Zz3NL0m+sfh3/BxLygqqhMqPBdd6npd1
         Lpqq1HB9bW9SRtaoVmJPzeRy2ozaXfp2do5JD+Zd2Yom/bR/Zb29bADoWhdUklhwiUIK
         4rNaPfSdbCi0nqsdI4I/U0zkB5t/8LwrZWmk72cbeshC9aGxVEn9r/IsbQVs3MqIjdM5
         jE2Iyf96JxDn7YnRrUm9cNSlnoBGhkkgkqrdjqWqtFRAii3ITg91vu7pBZt9EHbEwUlH
         KXM3Dp9HNlIii/2vSQAZLcr/USeQWN4kkm42QU5soGcSXpjiKl3KXnJOKfFnjV3dpcYE
         2xqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVR3Wd5FqR/tTbr263aLGS8xTHHwVmUYcUviX2YuikOT5Vq1APG6OdJfx4F4IcqF36DmC2B+fzmys=@vger.kernel.org
X-Gm-Message-State: AFuF++m974jrU6jQpmEoI1rzwdt2zVmH/sRjMhewRjO9sMPbUzr5Dv/c
	L4BSozIDG5fkvJx8B2aDRkhd7Cp6RLmr98/zaq1JpLfgjaiMKEy37wHu
X-Gm-Gg: AYBFou3d9By+7H5tnh++ly3GuuzwTc++YH23g4sHXR6Ip/MpgsA3JZ79G9Ke7Zqm7ZY
	cC4FSJCe1QRiurJoxm0XS7vB95x1GCb2qAcVAp5nlT/EJjdBiHf3dPDVkBAAL880HzONf3pAuud
	5rQcRKoXG3UT+nxth1fSFzGyAH6aQPs1eB4H6fbn5fJvfXexVk8VMW9D5XpXqEldsRfqQSIzhDe
	/oxlGNPsBHQHl9G104W8mAUwTRqQhxb25mGmPo03xT9pGcxNQ+Tfp54RP9x7SLKUC+OfwLcU1r/
	JwkFm+trdpNfgSYihlq0Z0jSANQKfHV4M3w+XBQ+Ifv9PufbXA5WTRkrNAicHCMTAFhXKDXjdcE
	y00y40gMNLq0PsySjPesKS8R80rcnZQi0bNrkT/9jsNZikFhhBjTqVg/hw58vPDCkWsHPxm9FAf
	lZFLa7Lww7hGbdU0EKkT5NOl9H6mAUlelvytmo444u3TVlo+qf3kb4KBh+ptyHlmK/lIqk/iOgx
	c+pAjOafIlQvO+oCw==
X-Received: by 2002:a05:690c:7685:b0:873:5bb2:6c08 with SMTP id 00721157ae682-8735bb26eb3mr43482417b3.50.1788818083523;
        Mon, 07 Sep 2026 14:54:43 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315162sm78079637b3.12.2026.09.07.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:43 -0700 (PDT)
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
Subject: [PATCH 2/9] linkmode: make linkmode_and() return boolean
Date: Mon,  7 Sep 2026 17:54:31 -0400
Message-ID: <20260907215439.409858-3-ynorov@nvidia.com>
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

bitmap_and() returns true if the resulting bitmap is not empty.
Propagate that return value through linkmode_and() so callers can use
it where applicable.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/linkmode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..c08632c10c3d 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -20,10 +20,10 @@ static inline void linkmode_copy(unsigned long *dst, const unsigned long *src)
 	bitmap_copy(dst, src, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
-static inline void linkmode_and(unsigned long *dst, const unsigned long *a,
+static inline bool linkmode_and(unsigned long *dst, const unsigned long *a,
 				const unsigned long *b)
 {
-	bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+	return bitmap_and(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
 static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
-- 
2.53.0

