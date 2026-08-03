Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A153955CF
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770127; cv=none; b=HdYdpyJt46kdB+nNM8MQFXQdx2KNaK19YTQDx93PhAC9DVwBKQqWE6n6b1B6oaxkFLm3f8GE47vabuVm9YD3KYCtzK0XYkOHWi0B7iUiP7HoPiiqUDK39GFakAbWECgjnm1V35eje12/ALUxb0B8rpwujeTrp3Jol6WC50LRgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770127; c=relaxed/simple;
	bh=q2P2nGTjEvaZz0ScRAMPdDMBI1PiH11cZ1Bj3+0m2VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V6Ow/9o3quR6y1qfH7HJ+XCwFDvtm0QKoYGoJqHsB5wUEPwlElPXUvZSUrxc0hGZIBU6JZenQJCiEKd/GiaKsdndFtNhi/fSwsaEad0XbCvGDfwSqzuLGl1jREuZP6qFfc6g3iwppEMHlpGbH7O/MgZYSEeVxBcblgG10FMJzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8YNWc2j; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8YNWc2j"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cedda2ce6fso29176255ad.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785770124; x=1786374924; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Eps+N2PR4CPFEjqvLBuCWridjCN1eWTyFT6MEhu/JA=;
        b=H8YNWc2jnGOCPWuKGKhbL/FO5kyOuVlbUEIW/aueKHW+ELUpqEcPrm3SBzb0eQtO3w
         TqrHtPT5H5JXLzujwGKOiAa0Spz/+/0c3X0eEglKawYF+VvqwbQruIzVzPYicsHBN6FC
         ZQnwIEbArMxNPzplceArRdMat3gyYz0RVDaUYYQ0EhZuxxAysJPwPoH5m+uVbeTnInqa
         m4GfrJaTtkNtHtys7XglP76Xf+sdxHGMLG0QowUxodOxja8irBTefwXsISHlhFIiQql8
         IGOJyEYpAXYzM4OpVVvpt0COnPHpb8OlK5K3Oxo76OErMJtVWFHxgf4P+jXIeYdvufk1
         Aj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770124; x=1786374924;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Eps+N2PR4CPFEjqvLBuCWridjCN1eWTyFT6MEhu/JA=;
        b=BNIK9ve/zRGUuZYybSbmWVrWzy0Yd+0QynqqhU5C/RCLFsUbEYZSKQbPWQ1kvi9vYL
         gmBOMTPIuGYTnx1zDwR2qpnTEOE2VzVr7eF70aGOmB3oBwg/RQBtBWm7ZRuSifd7RS+G
         NAwS5ezJIB9ZBHk+jrqVXZ5AqZ3KO8h0bK8SBJ92wo86vyz+c+weN1aPU5V85sMSsJ3a
         INYMfmXr0YrePRRJZQVWg79HlTMnxu+kVvLpWf6Lr6w+CnDy3q9vYzJhbFM/NVF3F+lY
         ueB48zmSo3QNKawHY8Sg1Z1ahXbsmezrDq+ZnsO48iPkNHRL/BGoqYO7Yb8KkXJP/1RN
         75QA==
X-Gm-Message-State: AOJu0YyFzch5XdTCKOP/YWQZnIzFVhvFYSgUF2tL6L1nR13wEgRfPVkN
	aW8xqHD6Up2Z6GkTLJ33uVMglb8bh0g2ygUb4xisNloDB+5j2vGsksry
X-Gm-Gg: AR+sD10Nrz80yeu8yR8uLpGRF29gMaQee7dc0Remd7jc657nqtkKjj4W+k/zonaKXiV
	0RWKr5qGL+L8KMgMMvWLcaXiFjag5/UTmLc0U2f6K/XymscLeA5/Dzu2OOqMS8N5LNvGFZrnswo
	01f9vgfkth3x9fN6/UF3WcB5nzvjtTduzWprYr43vaWhGXzVFcbSpnA5UMSUfkckwtA3Phj90nM
	gI/on5g8HxXuxkpGzbVoMvTvanqhOdJlrhauiqUMWQVbAGG/89zIxcOLPnVvRcDaTWxhKf+xEgQ
	T4Fz3a9wHlO8oKbElxGCtDGoUgujWLR/jrLCDRt+vh2geS2n46blJg4nX7DgDL4mtPib8A1KZvg
	3tApw8PYhlxLPE2vSvKPCRdsaZfb5uGT6RVun+G58nM6D/vJOhziujjjQ5S9fF+GICrEpUq6SEu
	SHxI9v0nyxJsIJ5p/pA3jyzAgOUsuqQyCi2qalDlCT0p0X9FR6PbkiMxeoLo0p3syvSPFafejHg
	SztfT/xxWL8bABE87nHUJEYGH+51vLE71/s7UWRBZVqbXau
X-Received: by 2002:a17:902:dac4:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d05221d386mr103265235ad.13.1785770123331;
        Mon, 03 Aug 2026 08:15:23 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b121751sm39677075ad.65.2026.08.03.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:15:23 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 03 Aug 2026 23:15:17 +0800
Subject: [PATCH] phy: sunplus: fix error handling in sp_uphy_init()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-sunplus-usb3-v1-1-5a562524c869@gmail.com>
X-B4-Tracking: v=1; b=H4sIAISwcGoC/yXMQQ5AMBBA0avIrDWpNmlwFbHQGoxISUdFIu6uW
 L7F/xcwBkKGOrsg4EFMq08o8gzc1PkRBfXJoKQyspRacPTbEllEtlrYzrhSVdZJoyElW8CBzm/
 XtL852hnd/j7gvh/ZgCExcAAAAA==
X-Change-ID: 20260803-sunplus-usb3-ba6c829bc063
To: Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785770120; l=1561;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=q2P2nGTjEvaZz0ScRAMPdDMBI1PiH11cZ1Bj3+0m2VI=;
 b=AeZDXra40SfMUAO59TNEMxSl7MEfI1UmdAMw1LyTOdyACWEEB56d/gnUitmndOCWt4Zbct1eX
 E0Z+EnkepARAUonL/Y/TbrNhwcdgEUcrb7UoUlxX5uwXtzdr593RByc
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Fix the error paths of sp_uphy_init() to undo exactly what each stage
did: return directly if clk_prepare_enable() fails, release only the clock
if reset_control_deassert() fails, and jump to err_reset if
update_disc_vol() fails so the clock and reset are not leaked.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..0ad4c7160d17 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -116,11 +116,11 @@ static int sp_uphy_init(struct phy *phy)
 
 	ret = clk_prepare_enable(usbphy->phy_clk);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	ret = reset_control_deassert(usbphy->rstc);
 	if (ret)
-		goto err_reset;
+		goto err_clk;
 
 	/* Default value modification */
 	writel(HIGH_MASK_BITS | 0x4002, usbphy->moon4_regs + UPHY_CONTROL0);
@@ -129,7 +129,7 @@ static int sp_uphy_init(struct phy *phy)
 	/* disconnect voltage */
 	ret = update_disc_vol(usbphy);
 	if (ret < 0)
-		return ret;
+		goto err_reset;
 
 	/* board uphy 0 internal register modification for tid certification */
 	val = readl(usbphy->phy_regs + CONFIG9);

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-sunplus-usb3-ba6c829bc063

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

