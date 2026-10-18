Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3233B100A
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304269; cv=none; b=t0UCfUriAtjs+bdbJPj6SlNtUCdgsZ6YAwmY4a+S9g7SKM9Fl3oWl0PbTe6q46aylbjvM9jcYUI3GQZr60p7nqKr8RhYpiF9l5LJfCw1/jQU1UQbZufFb+QFvEAicpXwLKbizy1lohY6wI/syY4t5/rW87Edb1oJ5fhUUphfMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304269; c=relaxed/simple;
	bh=AA4CFCI/T0Ewszphaoo15ML6lrPZ6nLxKoibb0yiWds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN6fzQMSbEPYos1hXe5BS8BY7xWBkeg0v48Ui4F8fXoKXGHSuW1xyEokvPzhtaKSyu6jJq1OhjMzZ5iH56jjrJPcpi487yMqjtEdeuikub5bV7zGTy35zf6mNOT1SZuZ4EdQZL2CprtC8s+yxX09BOoeGC9x6i5XO8rjTYBznrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Dtlfntjz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Dtlfntjz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso887859a91.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304267; x=1792909067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaonELdcVf4OUI2YJCgEvAYKPGQioZd6te9YEzY8XbI=;
        b=DtlfntjzLEdOCfUOgBuomjBZSoGFilba39LXPLFRJm8I29WHiwQbUmdE4K43K3vD9Q
         KWVUOyEcs7MtwE4e4Q63F9wRAxbjq+t33arNw+NWjw4N2ywegiK+AZ4tt0Ak3UibM/xI
         43tacmr5e061Jqy8Cq7nLVd8x0RSPpYreW78U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304267; x=1792909067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaonELdcVf4OUI2YJCgEvAYKPGQioZd6te9YEzY8XbI=;
        b=eX1et9KFYCHPGeN5lzwbKkKlmLobwu+8OqJ6HpdiLRjTn75tqXvXb0ZZfQjYSWPJAX
         yvzYoyIsvG+HbPr6ZSVxXvoD1EqZjP/J66eVnR29+Hq//oLAYoDJMymbtIUGwoAhgl3N
         gYhvRX0Kf2NgrkqpgWp90fc+/yd+NPQtj40YmKNw95/OdNFfPnKDtQO2OuZv/dhqwUlM
         z/HUAmb64kMT0rWW2BlTGtdiU31bra2bX3eahH9q2hYebEH7REp/Hz1xRMEcFdN5/Yqe
         dm8CkVvIC9sSAGM7ZslPYMPFi4fCuL3EGv7Rf6u1cgBPkR/JBjWp1SwZSceZSjcYd6zy
         OBmA==
X-Forwarded-Encrypted: i=1; AKwUvBxumM7vT8AktUsVLY0/FEOrgpDHDQL1L1iaPeW5sDuZazMYGvXplLGRFaMZOoEdiHIFpxnlBn4xMmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0gjueGVD5B7W6176CUvYHDld6i6vwIyso8BJY4ZCAPeqS0tlL
	YcJcHCH8g5xCjKoMnkmAzHsidons8HtZ0prI73jCWegwZnpyp4DbSELnBX/YGj8sEP0=
X-Gm-Gg: AYBFou3u7nvI/LxIeD6/D6zvV6IfR2Ta0dLqA8lUOuthxiOsdQi48kGB1G2a0ar7B5k
	YSLVpboHXEwQVF/kXIpL+1kfdgckg4cNKsJRtUv//V14ff0sFxFBEwghd3G0MaOR9CdXHtIbXci
	HjAZhHPn+tkm6Op5KjM6U5L29Al/yZDopGPp+uWK/gbnzJsiMW+bKaQ+CcNS4qPSjscT481Qq4v
	I/rg97G5WbFs1EoaRiIUdZMl07FttwkuScKDkmLqXjEYOQerysNnflNy0zznMmyCxI0mqY3C7Ut
	sorJhIgWpEPs7FrJ99f+mzBjCpUzebXMSI2PNjLkE1GgwuP+/EXmWRA6Bg/OeNsinZekiw+d5aP
	XXh9M+7RvfbSVUb71r9g9VR2Z9v00MYoE9xDT7/gF9l38XbAMmk+R2J/1zXznSxN3hUQfyRqtGL
	Tt5tQOWReHzk2fsQd1TAzsv4P8wdzzLDIXLM9nzr1XYl/F4NT0UQufIBrnsgp4f1kA7VEbstvvr
	iK2+PzkCVfD5h5N17LG47HraFKid9NtMh71C9c12RkPrlemIysgDjM=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3978010a91.10.1792304267228;
        Sat, 17 Oct 2026 23:17:47 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm11025963a91.3.2026.10.17.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:17:46 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Sun, 18 Oct 2026 14:17:33 +0800
Message-ID: <20261018061734.19488-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

lan78xx_update_stats() reads the hardware counters into an on-stack
struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
rollover check is skipped: the counters are still recomputed from the
uninitialized stack buffer and stored in dev->stats.curr_stat, which is
then reported to user space by ethtool -S.

Keep the previous values when the read fails.

Found by code review with LLM assistance. Tested together with the next
patch, which makes short reads fail: with an emulated device, ethtool -S
then keeps reporting the previous counters.

Fixes: 20ff55655a93 ("lan78xx: handle statistics counter rollover")
Cc: stable@vger.kernel.org
Assisted-by: LLM
---
 drivers/net/usb/lan78xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..cb8204371f5c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -789,11 +789,13 @@ static void lan78xx_update_stats(struct lan78xx_net *dev)
 
 	mutex_lock(&dev->stats.access_lock);
 
-	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0)
+	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0) {
 		lan78xx_check_stat_rollover(dev, &lan78xx_stats);
 
-	for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
-		data[i] = (u64)p[i] + ((u64)count[i] * ((u64)max[i] + 1));
+		for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
+			data[i] = (u64)p[i] +
+				  ((u64)count[i] * ((u64)max[i] + 1));
+	}
 
 	mutex_unlock(&dev->stats.access_lock);
 
-- 
2.43.0

