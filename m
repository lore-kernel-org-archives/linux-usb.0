Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0847F46985B
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851894; cv=none; b=ec+wqPo3Sx/5mIv83vsFKc6jwEfIgSZ62lvVRRgzwKyY5VWq5Ea1uNibA7n/pQD4JvcpZFBidNBUcCH+gQCUg5MOSHR7+2ROZUTKVniSUbXm1fk048XjePjxGpfKLK7zVoJizTT9IlLfYMclGiPn9oBNHHDKWt943uRS+husiFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851894; c=relaxed/simple;
	bh=fcxHE4069tN1YsR2Y0p8nND9Z2PnmMiBnNC9xxS2rTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CFWWz6KWcHgitXuukRGfRMozG29acOXIFTYVYeQfREZn7oAOHjaaOFNn+zKbECgF40u6hCAFQrTW6d0WtsLzXYhjBfSAwmLV1jqWpPiAgrov2LiMZyJNhdxEE/P+rSsgbXq9R+BoNmWEdBcTmDCNQx0ZPFsx+EvUrTTIXWORUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMrgTSNx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMrgTSNx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2657795a12.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851892; x=1786456692; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIeJjdKUMZPMOtXxfYP3hPyesDpx3ea/m3sZqCZSwEU=;
        b=tMrgTSNxFhXTkVuTBcaH1z4KBtre81u7I9RPx/iGmL0WKQCm3c3qFQtY7AyHGQSJwv
         2sKMdSRMkxfqNAnv5AUrCzQi9hYtUpgWZRAXGny3lNvyJ9Gt5qWSSFmBF6PGUS4FmCEN
         IaUkOLpEX2/lYtZ7fv/ApCzRKt0vhrSbPaAPeiHx6ODq3Udey7yq+0rR19wC1rR9YoI+
         Xfq4nirCi1GpvwVwGmxZ+zXEe+isLyWMtBwgQmsXaDT3VHYnkQmi+gNYH12OlXhLiUeL
         f+XQSQcPwg5xi7cToUt4NoLwR5Hau+RsRt5p3KoPMlZHW2dqslFADJwdr9j38AwVtxw6
         T31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851892; x=1786456692;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIeJjdKUMZPMOtXxfYP3hPyesDpx3ea/m3sZqCZSwEU=;
        b=K4H3RtefdtKahX/oUeITi8bstFraFg13/zeu8ZolY0oOpjcRKO7e8CnTnDdtLnvdZ3
         BDPZAcdiSL7n8RR6OXqE4Z0qRk19T+t1QNIa+xV4oK0K0RhwrtBiGWKEJ5AXTV2GRLq1
         +Iim2rZFkJXDRhgXodKBPPBh4yU2Qza9CivzgCTFmc+/S4cx0lUPjw0EyrN3Nt63nUqW
         HVgs6c3EYcSiL0jTo3kEslnklv06YZdYwiareMnrIuAOcDCJESHem2a8rEMfYocSO7wH
         aLHcBOs4tsunGijqqmWfZS0cqe70k+UU8rVU08ArA1GFa4qtwJQP0D6aaXTSDkZ0hGFM
         ORlw==
X-Gm-Message-State: AOJu0YxPPdEZr0UoXSKDaUMrhG7S+Lv1dml/ResqFuo/u+KuWIRh/UYl
	lCJA9byMAiDuvsqUjrocghaVOOM0sicpLT1OySvmmYPiO6AnR2H3+yPE
X-Gm-Gg: AR+sD13+JH1i/tPTUp5VqkrxHZ5KSXYoCEFZlLSg9/dRd5uvTMt/0E4jk9/caHQ5QyP
	lhHJEKrHA0jKI6f19kK5ivJXARWkrmcAHcO5HyIMgiOCW5OJR0kMII69z17XH70pk/zHBmdFvNI
	lyDlClBkLuV1HNIXn8mjs3OUuIiWvl2x9Bhs/Qtjo2W3PGPpmYrZ3mCLJxIlN7WmNTQDAD1xNpy
	i0pvVIg4COapmNjjYwq4GgjBJyzGmn5ldwIL41c8M96k/fUPuK3EeQ8xnqJBOE/h4cm9IIaHUnh
	xGlZN5T+0+D4pcnuU9hsndMnBqgO3bDVM56TfWaUEPahtIKA5toUZzlVdB148S44PRKVAzVPCjU
	99hUwpyZDABv4MDGylQkgMnpugvMXVyEHFrnY5ZZXjSoO6HAM90X2wwqJGQDzRkTr1yZjvznmXC
	i4jsALRJQo6fcYkU+ngFjxUAWEZiI7A0oA42LcclpIp2NY9ONVWxXtqo2NFY40z0Q/bWmy1pH97
	VpP8H4VUKZY11r1A9ke9HgzsYcX5gRwKJFTNg==
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d051efd46amr142715445ad.0.1785851892093;
        Tue, 04 Aug 2026 06:58:12 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm8893255ad.16.2026.08.04.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:58:11 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 04 Aug 2026 21:58:07 +0800
Subject: [PATCH] phy: sunplus: fix crash when the disc_vol nvmem cell is
 missing
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-sunplus-v1-1-79f52226cb50@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO7vcWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eLSvIKc0mJdU+NE86Qkw6TkFHMjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tANmQHlFrAAAA
X-Change-ID: 20260804-sunplus-53a7bb1bcd72
To: Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785851890; l=1862;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=fcxHE4069tN1YsR2Y0p8nND9Z2PnmMiBnNC9xxS2rTY=;
 b=Cid/GYA75nIzfeE+1i4bBmQ/P5KYsKTwmwbuoViplJHvHw+rygKgovZvvFmnHEVXV88dRlSbL
 QpDeN/5gYrAB7/1cirox7Ybp2kxKsoUlhF1WlOoIJaIbQotic6a8hRO
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

nvmem_cell_get() can fail with errors other than -EPROBE_DEFER, but
update_disc_vol() only handled -EPROBE_DEFER and then called
nvmem_cell_read() with the error pointer, crashing the kernel.

Fall back to the default disconnect voltage on a failed cell lookup,
and free the buffer returned by nvmem_cell_read().

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..94146118e9c2 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -81,12 +81,13 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	char *disc_name = "disc_vol";
 	ssize_t otp_l = 0;
 	char *otp_v;
-	u32 val, set;
+	u32 val, set = OTP_DISC_LEVEL_DEFAULT;
 
 	cell = nvmem_cell_get(usbphy->dev, disc_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		if (PTR_ERR(cell) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
+		goto out;
 	}
 
 	otp_v = nvmem_cell_read(cell, &otp_l);
@@ -96,11 +97,12 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;
 		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+		if (set == 0)
+			set = OTP_DISC_LEVEL_DEFAULT;
+		kfree(otp_v);
 	}
 
-	if (IS_ERR(otp_v) || set == 0)
-		set = OTP_DISC_LEVEL_DEFAULT;
-
+out:
 	val = readl(usbphy->phy_regs + CONFIG7);
 	val = (val & ~J_DISC) | set;
 	writel(val, usbphy->phy_regs + CONFIG7);

---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260804-sunplus-53a7bb1bcd72

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

