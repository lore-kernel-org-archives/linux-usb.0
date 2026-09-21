Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F634582C9
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980692; cv=none; b=slSjn5/i3XDy9blxxXg+uEUG9xR6+3Z6FfenZ2Eq/RSOGvx13GazPBLPKyK9cl1qp79EIAP8st4poP2A8fnwnBn9gHmdViFp+NFoRBIr0sRrDfoStLhc32RGztxHm85IcTG9e04gpzhSxezY9kbQJrRrxeE1gjnn1N3ZRHtUQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980692; c=relaxed/simple;
	bh=orjsntkymHdV3HHrZ7aB0glGaCIs99TYSc2OtuWjMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eyStlDuk6ceIVj5x56GJhhFgp2og6ibRi5bXtbNtYWUCLYLwvav+F/2llfQT9IfJZjTAg3PgTxLDBgENOHTeLkwWXXRzOiUgMSCVqh5nPPgGt8SxZduvYa/0lvwDYWLj+S+BV+jpGJFMOf67sc+rimjZ3hg+vYIHCaIVXx9+Q2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQGKrGSV; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQGKrGSV"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso2189407a12.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980689; x=1790585489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=FQGKrGSVM7VsPwrsPYfK17HQgBx6ihQ/rB+Sm09lelgilJ4WmHJRaWj3FjgYYje+w8
         41dq70CW/q+ymkgQLdYEyuA9WJyk8JZvypqp951/nozjk+nqWgnYRLoLkC01hhF4b7At
         cSeJdfYBcJ5GSvs2w/U0vW1P+FVruyyChbuBNVW0rXKz/O5pW6sBE1wIu7eX514A6pFr
         eF31RSNFjFIGgg6Bh3977W3OVuo68uxHt5kLpw8hZn2TD+ptZLot2t8VNJPH2JcdE/rh
         YD8yQ2m/1pthi7LriUryv5lsQngP5ouRfqAJWRClNBBY578vixrCIvfh8riwDzOnzIds
         iGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980689; x=1790585489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=FgL/2EZN5VEIigpGhfUfkpLuoSZPRKZ5xqzpTB9CZ6UILNYK03igwF9Ad4jRutWisq
         80orRpEqyoNGNaz/2RigSxz11qUPugXMqfT0msioVPR7ymcDvAp9Ymd1zFlyfD4NpIdB
         K93vVqaoIziJ/Rx3s/LybO+cQgx9e9qE+7ve/klyPf9ldsXbfsdZtqycH4JieHOxo4vS
         4nsSrnFGa2fxcB5JTgUq9OIWEt+xF9dEt7gxDDSqgOhA83u3m4t3+kvcpUiJF1VfBzrU
         KVSyaub9W7YPSSXspBLtKaumwtYRNuODY0BvCW0WKX+U8EEFzELrbBuhib7DVTKR9xd1
         4TrA==
X-Forwarded-Encrypted: i=1; AKwUvByqYbTkK94xqCCW0Rs7dE8LaaK4NFVIUYIseVH6b8oYMhpN29dKnRbZdJlweQYeH6ZlvtE9DJySGWo=@vger.kernel.org
X-Gm-Message-State: AFuF++mWKNpPGeVtqUFTg4La28QhNio19xkwPwfE2jkUbMZ3uJf7hNjH
	9k4lpvQrbFhHKGvmzhju4V9osQbw469qG6+0igEA4av26qlREP5ymSZ3
X-Gm-Gg: AYBFou3auZfUHji+ARYekfYYlCqKUKrsrq14QDa7Zi+NImEDmj365DAFJnrgeiYqu3e
	dImqC5153JyivUQBlqeTVBJwbaDdvUZVPArS5+QwhUmnj1gg7AOt9toY0KOR7gfAaL/j/eLn4gh
	Y/MF+QB6g08zGJ4GCd4UsSPi8foEMHTi2Jpzn/3p4YWhH32n1O+jtbcFbZwE1zIFpb5Jf5I6YO3
	a9iQ0C4Yxv/wLNFI6bkVn8lMXAzJHAkgx1/oXZVaG8nDnbQc7uIQjotnvNLC788HPV/AIUZnCcJ
	5XjaPUx3YrcWSuwVAWIKbufgib4aJnnGbM6eU6+OBx/AunTi8hgiyHMX9hDvIT0HR3ErDh3Q29e
	QSe0TJXo/fYEg7MM06WkZFJTLzqbP37HXMbju/c+gcyV8PQWDol5Dc+wKSrUJ5/7EQZnGVSml26
	244I+9rsOYPzCXZEGG+a/z9lzyJkg/4S/7OucslgrkMqGgttrOQIcaDw==
X-Received: by 2002:a17:90b:1b0c:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e54bbc32fmr15958386a91.9.1789980689350;
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm7853716a91.1.2026.09.21.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yonglong Wu <yonglong.wu@mediatek.com>,
	Min Guo <min.guo@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: fix child device leak
Date: Mon, 21 Sep 2026 16:51:19 +0800
Message-ID: <20260921085119.308981-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_musb_probe() populates child platform devices using
of_platform_populate(), but neither the probe error paths nor the
driver remove path depopulate them.

If any initialization step after of_platform_populate() fails, the
probe returns without unregistering the populated child devices.
Likewise, the children remain registered when the driver is later
unbound.

Use devm_of_platform_populate() so the populated child devices are
automatically depopulated when probe fails or the driver is unbound.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index c6cbe718b1da..3aff0add2faf 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -415,7 +415,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				"failed to create child devices at %p\n", np);
-- 
2.43.0

