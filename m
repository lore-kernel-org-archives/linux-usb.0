Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB49227B94
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782663960; cv=none; b=M1qcFB7NapYn8othHr98wgG3v13CJ9aRTQrgZyvwLevFgE6LABy35A6ZkeifperxgwmwC4Ph2CCSj19VOvVNE3nQhcBgmaOHQOx36IMBXAPLKJUu9McMQtyGkJ1YtkZVDa7E47B8H2dJBhkEpu0+aSwGuElK3H2A6dhxX/4SnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782663960; c=relaxed/simple;
	bh=g2UA5Nh4NURnQU5YTpPXu2g0qAmphQXzC4iKtTM9Trg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHgQX+NtL8sUKvikZiIi1QGFRFcw+FQeiVIVtAuKtCR1DXSAmBFb/iqgABdaU3r4qdbw5uMfPSOoPMiYMl5Ej/qipYGIB4np6iGy0joZ9yCKK39TGOoQF7cf4KaiLn47X4LpwTknfKlxIRQuGaRsIvkxWAskCpFAvt5/o1sLPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKL0oaxE; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKL0oaxE"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80bb578d58bso19969287b3.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663958; x=1783268758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7van/FF1WCavCF+DOAc6ZN9nL2beTOurDM/vGTwpdMI=;
        b=JKL0oaxEiINbu1DR3+UgnHxBeii6/FkKYzrTKvU22+fk/ChTSA9jy4eXhj4jc7Gpg2
         w8iShpVkpWTw+VJMXd0bvzw1dac5s7uJYNjwhJR+yvxqbkEyzYHPLZcoX1vIyHvL0qM5
         Zeqz+0XIHZNyMZA/4gNAJx/ufqauTdTSGhhqWaVmEyjCoazpVp6NYmlgdlN2N7egKt12
         Bz6kccKKyd7hXyyOiMlBPGb5hSfPRnYntMwytSBFoXanRyeFCutJJyep1DeqmHIS45St
         MHvDrxjk5Qox3p+bJl9ydS8yzcYjbQZs7sVmlLS0vuZoiB32n6o196YZ2/3IxHWBjoQX
         itrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663958; x=1783268758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7van/FF1WCavCF+DOAc6ZN9nL2beTOurDM/vGTwpdMI=;
        b=NjSE+TFvlhWuuEXBLl4769reh4MDaBtzkxwTD7ufSSr6w000RBFuBuE0IQLQFZUg5I
         LxsPUkNENd23uwtBD6XQ+I3nkOgx3h3RPkj815CBmlG1Ul1BromesNhu36KXh941lisx
         cTMxTDgknM8450/lxc10tJs2k05FFx1vohxxbM2yfuzC0NvSQxn0qXluov0hpSlafjaG
         g/hAFY0hljmlUEs1c2M7rl7eaAsSN+T1DYzvPcGPjrz/X/fl0nruPeCAnsVUs2GyE7eT
         tvWj7uUWEg0EgUk3R307AdYZKvFrmqJRkuG4D2KxRFArvgfoI9jtWfyqOdQ0Az2FO3R6
         yjIQ==
X-Gm-Message-State: AOJu0Ywk+iwKX7imZcAqG05d7HGY4jnPSY+i2+QbBY2AR4iA9d9Rz49W
	IddGgnywBENNa+TJULtcZB3iJnicY6GhnLfyxYcAJCr7LKdPz+TsHN/v
X-Gm-Gg: AfdE7cmGDEB9FbCY4EABjfZy80tD6cvbeZQLNmQzAOV0hC74i+34H4rgDCUADiUUjOS
	xOLn8ifRZnYMpd4CwteLq/CWHCV6pMlsIdqmgdpaVoyE4TJMqiNvGFx2MGF2ynbNJhmKcgCcWUW
	ducWcT14KDHVJr0WPpON0ziZC+xdDnd0yrPNqvlbSLH+uWd114+HshKoLmIbqzmA3sdMaDS9B+X
	R2np9mjP8MEZIUGBfjhRKRBnmvcai7jYk1WOoe3iSlI0L7fy/4TOpWqzpPq0chzrQdwz+OOJ9uR
	9JtRNzU/ElzHIbjjZfMAV3lYsuleuGAGza52bVQTM68UYTY8emIFP8XrG0PyDJU6vJ6EHiwtckg
	t0cQj8FTuxnp6FHgK0fxhPvIrVzeDhrbXTK2vXEVTi7OXXfnvKDI9NAfgiJPxz/5uPOGZBlQ5l7
	T28ICLl7Nte/ZJhbhq47GpjvDK1Q==
X-Received: by 2002:a05:690c:6185:b0:80c:85b6:764a with SMTP id 00721157ae682-80c85b69188mr75232687b3.63.1782663958305;
        Sun, 28 Jun 2026 09:25:58 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm106446247b3.0.2026.06.28.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:25:57 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2] net: usb: rtl8150: handle link status read failures
Date: Sun, 28 Jun 2026 18:25:28 +0200
Message-ID: <20260628162528.8273-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628151835.GC14404@carbon.k.g>
References: <20260628151835.GC14404@carbon.k.g>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_carrier() ignores the result of the USB control transfer and tests
the stack variable supplied as its receive buffer. If the device rejects
or aborts the request, that variable remains uninitialized and the driver
chooses an arbitrary carrier state.

Leave the existing carrier state unchanged when the link status cannot be
read. A transient USB error should not be treated as link loss.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9db6c624635564ad813c
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/net/usb/rtl8150.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index c880c95c41a5..d51e43170e03 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -732,7 +732,9 @@ static void set_carrier(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	short tmp;
 
-	get_registers(dev, CSCR, 2, &tmp);
+	if (get_registers(dev, CSCR, 2, &tmp))
+		return;
+
 	if (tmp & CSCR_LINK_STATUS)
 		netif_carrier_on(netdev);
 	else
-- 
2.54.0

