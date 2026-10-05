Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1D4CDA39
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215971; cv=none; b=eqaya8fGSb9zFbtn8SQrD2RB/Y+72lcfLD/v0k6Q8ruRvggToDnpFDkp2jnRCTJdZPyj8cnibLZXQb8h8B0UqQ1vZW4aDMlV/CLhmsd39cclexkPxLHYeInVGNmT9TaGdaU9g6iVssUX8iel6B1nn8EsI5fF+GWOtpXOKGAJkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215971; c=relaxed/simple;
	bh=c3qxAorHfh38vflfMPUBH0Ur8Gz0Oqq0Sn71Zrw4KYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvZmlZ+ADpX/QImAphn4OpHrlvNzOz9vEYW5K42YfjXGPoi5OMGD6IF07ImqhSJOPEvZnurOcJSML64lOZ18DQ6LCgEp8rIQYrqJVj4NwxTNYCFFCquwU+pisng+ckkboSTGQYLhBEyrFw4hMGMjyF8XfK7GpSlMlaH5mM5Uyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDWMIqrP; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDWMIqrP"
Received: by mail-yx2-f0.google.com with SMTP id 00721157ae682-8ae7b865b4bso6466367b3.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791215968; x=1791820768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ee5rySe2ispQ9mLUw+vla1nzkwDJ4O9A8IBEsYRC2hk=;
        b=MDWMIqrP33x78/GSVamq/u6qrR1gspN1BSGu15mQgrgvleWyfyJzpuD30+UjywurMU
         KZzWX/8eIaLnCFAEctNMmi30L1uKhmnIVVNOw1NFUGMfjXu5y7KoZL+T6zFPE6EadCXu
         oHQq++I8LA5g2SfHc2vojxFeNne5hmZKNMV6BVLquAn28EzCNsiAoo14A+wcjSsWf7C3
         9vae331YSZZ2mq8XzoA04J256uju/B0w6yIB/QGUQax9wYu7kPKki0kGfUenG9DTedKQ
         qX+8+lPy4aQx9Le1tTSJt4Z2QAaFzT8hS5It9DxPRoMOVNvSF41BYEH1mRgmRod85uOt
         d3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215968; x=1791820768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ee5rySe2ispQ9mLUw+vla1nzkwDJ4O9A8IBEsYRC2hk=;
        b=JgT1giDZ4c+RqqzK33+dcXlKdfAnnF9Y5ymK4sI4rI8fjDQ2HaIWylZKAnHUUt17Qy
         31pkvqh1AXXysBxG0lPnXSks+PEkmQjoOrv8uTQXKZ/EryjGJeb1C2dJLEQSTt6sNvkz
         DddWkX3bO7rCO8gx48rW+hcX+JCrF4DRRG2ENiOE3WO+WJHHXL/EpqPbqeES7tg1CR/x
         dsozckDFzwFVLVBS+26beQlF8CDhSS5QkcnDI0aNW6U7/PWXpS5s+4SF2IiYq4gIaMu/
         5db5PifZogcep0IDPXkDVlChj1lnV6/XR2b1TvCH5t745i4BCcIDX1j8hRb1/oUlUoSI
         xisw==
X-Gm-Message-State: AFq9FYLP2yQvDiaZzWRx4ACGDxQkZiq3jXEj24jKKPREFKqz8wVaVIwU
	TgR3yLOXsJBHjzkTvPJg6l7IPLZO2nnlKYRPXGeZ1EJ2VbHolbIWIb1u7IWWaPdyT7F4Hg==
X-Gm-Gg: AYBFou2RhXzbyoqAMplOuXrDIbhFlfhkOAxJX29FykGMfR2S+nMuwezB3T+Z6FDPp+D
	XvLkAiY6fv9Cd/0B2OTFuw8nb528QpKvZ71e1QfV1T676OTULZIWS3NXxJIUhCpdQyl7S5z9Odf
	/GxIGIwU6XfJj+cI2TJgfOsnJdInnE40JHuF+SV3it7mBCwPvJQiO76cwouQr4biydHWREPk/9w
	1BSPrgaS4B4gkVAT5O+UzD7xzyCA+xubhfG07RwpGiCSVFsHff6dtnpyYc0FMoXy1WHzUwocXhF
	9BS7p7/1SQzO0mUHoVzlNh8l6BUuEo1VK5VtfNsiwnVcLLa4kDpnOBc17eFTyBVyl4+sHNpS14C
	pxw305aZH0jkZ1wd91+KwcdXAsGDKq9tB+ChXS7ijAPbH/nzxtpFRmr7EN6OL+8Ueo9LCYt6tR+
	z14kIm1QiGH9F6DlM2rBZ/bxr364CAMiAJXWoVaBjxiTcfJwZnCSKAlH/6lJcweHYYWrfF9nj9j
	1kqwxRHNyT6a29Z2j/PQ1l1vzv+t8jjzb5IvsOfxc+4SPOu6szw
X-Received: by 2002:a05:690c:113:b0:8ac:42c5:a7b7 with SMTP id 00721157ae682-8ae39bd9f85mr47899477b3.39.1791215968309;
        Mon, 05 Oct 2026 08:59:28 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:edd1:61d6:442f:e3ff])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae8a2d41easm33779167b3.45.2026.10.05.08.59.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 08:59:28 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	rfiler@sierrawireless.com,
	epasheva@sierrawireless.com
Subject: [PATCH net] net: usb: sierra_net: reject short firmware attribute reads
Date: Mon,  5 Oct 2026 11:59:20 -0400
Message-ID: <20261005155920.27735-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sierra_net_get_fw_attr() only checks usbnet_read_cmd() for negative
return values before converting attrdata and storing it in *datap.
A zero-length or one-byte response leaves attrdata wholly or partially
uninitialized.

Although sierra_net_bind() rejects responses of unexpected length, its
dev_dbg() call uses fwattr before that check. When the debug message is
enabled, the incomplete value may therefore be used in the debug output.

Require the return value to equal sizeof(attrdata) before accessing the
buffer. Return -EIO for short reads, retaining the existing handling of
negative errors and leaving the output parameter untouched on failure.

Found by manual code inspection with LLM assistance. The issue has not
been reproduced at runtime.

Fixes: eb4fd8cd355c ("net/usb: add sierra_net.c driver")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/sierra_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index 4d3ed642b3e7..95668a5ccd5f 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -637,7 +637,7 @@ static int sierra_net_get_fw_attr(struct usbnet *dev, u16 *datap)
 				sizeof(attrdata)	/* __u16 size */
 				);
 
-	if (result < 0)
+	if (result != sizeof(attrdata))
 		return -EIO;
 
 	*datap = le16_to_cpu(attrdata);

base-commit: 8b4e7209c842d8cb9516f1f5ef0a88aa2d8831a6
-- 
2.54.0 (Apple Git-157)

