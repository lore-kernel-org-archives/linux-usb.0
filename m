Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CCA472061
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248960; cv=none; b=GF0WuBlOtwS6YEwRedRMNvcPE9JpyWsvh7hEDZ4cwYQKDe40h6OQlVnyB87QP564usYbARx0AMtiIvOhAyuyvJbvpXzQksMsIfkwbQTbzzohWPJNNuev48DWHdGzMHZrwkKUOKZiO0Uu25FKSFtB9pz0dVY8M/XhcCzwAo8UUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248960; c=relaxed/simple;
	bh=F4dCyYi/FtwgrncQW5XSrTpQkmCQZWz0zvM6wVNpeuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCviMCDesxWIugSBFRhUWDy6bCzY2hSNK6k2qcajPOTyNG29V/Ak+4h0d0d5SnDCG/psY1gsuaJqPAyl7K8dNhl4LJ97TMXhNaeNhyYl9xYG05DMfJcD+BFw0vs7VeBrkzmzGfNOX7dFJ6vvFcSol8jsXm40eBXjh19JNwDwKIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoICp6+2; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoICp6+2"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so988034a12.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248957; x=1790853757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=BoICp6+2Htcn1v4h7jMTQLOQxkwaxGgojRYX9MpASz0tTZ3iVCWnmrKPYqQVG7omzD
         jBmkDQPEbSVrSEhJkmPSNFvCFtJAZUQIWaFUQY+tNuW9ZEcfKniXfzBydIdSFdSXxKj2
         KhPiPdIkY2fiEq3wPG3oWy8mQuR5D7nVOHOm+nmAVkrqbhcs6p1v72/ADSS93rDLmVZk
         KZC2/oLkJrKheLXJ8wjNBJk72OPH3HHsGFkWVmLSakA0hHqT1zCIEW+bLmzz5DK/ZBpG
         rIDWirZhtAoenid6+YFCGPq7joCWm4QaRSyV5bu+cHCjNoMgviQU0/iUIla1M+S8wsxz
         j2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248957; x=1790853757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=pPVXnLHlBVq54mDUbsbnxZwRvg2uKsuqlNzBsUFXDSDBh16+l8aQHitxNzpygKIsQ0
         FIw1IVxfLwi99D4hNIz850c93d/mUeAxGvxhnya6n2Cp1zG5OLMJymjHljevubyPgBFd
         Wzkmdei45ArvVe4wbkh8Q1QNBLAwYfaym1AmdPWDSnjnENgZDLAg9boQlUOBv2zQ/gCw
         qrGBcmYUFWHLSM5D4pp6RB3EGtdmNUDcdWFYoAWYUXYwDBQZs3pzZWlmTomMyvXmkO8O
         08Xmv75gtrCDibleteLvfUjT/H9I83D9rO2Lcp1+DlJQbdWNIpg18FLDZyuMkVoIfHrx
         VTXA==
X-Gm-Message-State: AFuF++kl3E+uJtn3wrS14kDqkGrpN7F1JQhRNRbvvTZZKvPtJfchxqLL
	+vS5UimpV80+DZDnHzDcC0iv65QgvFkn7EpeiXgVVUi1yOOkyAUx5ZFU
X-Gm-Gg: AYBFou20vI19XgzlcyD6NOkW9jrDpxQTjG1B6LmS4AQmAnrYz3Gs/JEuYSnNcNDjRaL
	IaP91YlnR6QNSYN9mKXlH1RtUX1Le0xtuO4S4HaeUcg37b4+D3cpVaqE4Bv4yvWI4UpJZXKy/e8
	tX6COr/uAKn/73+QJH2M4K1vwft+qZZ9gykUevm2AuNIVwnZjacVTgn07VD7MIqqYhSJGQgUBz+
	0nmq1JALNHi0NY0vIVdjAuJUtzrLUguQ2x67J9IQF4ekIsC6uuNeMr3mSPywK58fqgbS9VbOOrH
	kYpx1I+r+aSTGFTtV7vNMRuRNFuUGfDQwaoQonk3XpgOz0u/gdrD6E4QphiiAMYOgoZckVRR1ML
	kRgO8ElFvZHHVwIrQ/0vnigs6wV7gHjSmphaJgmjveU2MA7hMPScxaxFPRkWu4LyBBSy8vongix
	7Pzoeu4qs1n8UqOAIWqpYfuZANw/oo15aAgnvPO+yZvU/IWx9vBfwCa3HKYwIfO2Nm
X-Received: by 2002:a05:6a20:2450:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3de0e6fde8fmr2226919637.2.1790248957445;
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 3/3] usb: max3421: Free transfer buffers on remove
Date: Thu, 24 Sep 2026 19:21:56 +0800
Message-ID: <20260924112156.1564208-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max3421_probe() allocates max3421_hcd->tx and max3421_hcd->rx, but
max3421_remove() does not perform the matching kfree() calls after a
successful probe. The probe error path already releases both buffers.

Free the TX and RX buffers in max3421_remove() after stopping the SPI
thread and releasing the IRQ, before dropping the HCD reference.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/max3421-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..994e8a07538d 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1950,6 +1950,8 @@ max3421_remove(struct spi_device *spi)
 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
 
 	free_irq(spi->irq, hcd);
+	kfree(max3421_hcd->tx);
+	kfree(max3421_hcd->rx);
 
 	usb_put_hcd(hcd);
 }
-- 
2.43.0

