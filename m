Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F03B0AFA
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354302; cv=none; b=D46a+2GHVOJwxvIB/i4gS0F6B761Ph3t6VYDIpxoGBmvUT+MuCJyDg0mogvne5VUx/1x7sjTVO0z0Ut00o/7E1Dobl40l029gXAS2CN4ZyGJZ/RubRkHyQZetaDWJgll6iMjS2/luMCkUbtaTpxvcuFqdARTUZaXIrKoEpCcNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354302; c=relaxed/simple;
	bh=CbsVB1hXJyUjEccFMknjHswWvr3OXNG4BroPSztxlZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlIY+IlioFWd2I1oUmBHJ9iHdoCdP99eV8YSrf9Rm4lWrWWFMpJ/7K1Z38JCo+o+pV+BZx7AfIn76aSAzoWaXqosaCKl75SP9RTzant5CsIxk+mYcfbf+YhBS7zqz5VxMm+JfF3p7AGXEFRoRE9cl5xpEFXe3p+iPzcNKzwfyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwWB8H49; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwWB8H49"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1487645b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354301; x=1786959101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=PwWB8H49EmAfUF/hb71PepDRtg98AlFzdOERIs5w2S5BNCmNV3eugkqoHKNJQjOXR+
         0XPI000PjVCp/PPFlKLPRMHzPkLT2tETRX3yrkgu5oFDK6rt3IEIEiYcvFheFJamVG1u
         QKGOdjQHvLYK38GQj13FSDg3wFqHXwp0WZNRtld+RQHu3Kmy4pBm7kDGNPD/sb1cI37c
         nVwgkYCDKK1pfG0zsMtZLjfhmTEWevvZd9YBhr0VKdqe7XrkbEBU4FKBLm7X5FB3Fdde
         S/4LLfbPlayVcn8rW9/DPSXdgsjnnxDavSkumeUYvLmlElvjrSTFxK0sX4AX4fDeJDOX
         X3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354301; x=1786959101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=RoM1myyYsi2qvpqINqatQ/rnfI5EHdoQLgslz2RZiw+M6865exDUWIfLmvonvM2kGN
         E9OrM2x3w5lihZ9o1YsX7Cg5ZFIppn7XR5FC2+qzXS73GNkJCkLArnre2cCrUPr+bDKX
         rwC9NArRiXhPNy9osJb9/S/mUoP86LNqh6d53415BIstdNFkv2LOuRi+XwsDe9cnXFsD
         ldk5qhH64ka52y3vlA2JI6TMbC3WELXsD95v9UUp0YCZ59b/PR//2WCxNqCkFFHoX9I5
         r8dBM/55Bw6X5GbBfWHqOh6lfRG3dtGl7kd65rr+kpiQiWjq7vG9TpE6obk3zrTK5Zd0
         BJoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRivWqBZBlk5Qw7hQpb07B1MgZJf8dKU8xszWXZjx1Ujy3cvwmvL8maOOsveUeyVSOVgd/sRba9WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0B7eA7C59ClYVCTrApsCrx+POT9kno7z//iPSMTTswKrpWR9
	6GXqRSpnYarqv4Z/NcfPHXBxDUChktPP/iXuqKQ0B4q7WCgX6edBCXL2
X-Gm-Gg: AR+sD13tQcKZ+S6+Cfy8pnFXRbG9zWnCv1XJUlKGF7IH/cpQkIPxEFsbYJAfimXxYkx
	gsoKaPZZZFx97MOwlk7pyt12bs5fUHUiOg4HI6cFbiBv1nnDRNF7CBqFcI8vxe96akbNK+7ACsK
	XyRpUqkPtDT0izH53Gjn4QN34R9IYTUUn4L9iMWeEv0vzARfG9ktGJpCRUQaG38QyqU+4SgEBvs
	fWknjWcodrsPrUADk/7flzjLm1PgE38vYCJaN8cyjEfEv90Je9ooBqptA40gmEy4++887Mf/U44
	pUL/AjoKPwUcCMLxJi3zCSUtaSJXoE6AtnRfOQxrLTR4RMrm7qa6nMmkKSkq+faHzRuhAJLmBHj
	mMWCk01zpUPM+FLG2UwKsjk5vmIteT95sOT7z78a3UFBykIGYTJE9a6P/YuJedBBIv48SqE76R8
	XZfAdM+9qBZTSg+pSlWQSSfJRvKP6zVbm+6Ig6u2Ta4Qm+UuQSu4IehGqaOEBm/Q25hngGlssC2
	Y/4tJMTgkwsSBU/G0bK3pX1HAkBy03kgbTDteTGjrkl5fnLhTbhEPBfIhpa38BEmX9kre7wg27f
	XN5l
X-Received: by 2002:a05:6a00:3d0a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f6b7ef419mr18218663b3a.9.1786354300606;
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 16:31:11 +0700
Message-ID: <20260810093112.47807-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-1-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..9e529398c607 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto phy_shutdown;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0

