Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE843A783A
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939688; cv=none; b=AUJ8SWm6a/tmYv2u8othljkSDxRlRe+kOhfOeXtTJ2yBK5kZBhBCy2OO+bBTKFDJsiYTxM3igvTKp2Hs4Tnh65llm7rLuN2EARG77bHI3dGfO4qDyXyfyQlmWMQSgsNCkNABkgmqcZTSq5oXiBZL4WO/x371T7x5dpdOf8bQoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939688; c=relaxed/simple;
	bh=ruynx7Fm6vHeQECMahipIQdtTrgD5C5jyfxQBK1r1Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BHjIMcu/BOnTuSWkOVwFko0KJOHca3V0EhJGUBRVuTdIfTvnXISO/Ss3rEp14YXkR6JmYl2RGzhQ56hafvaTtBs4PN5hwLnfRl7rlDPOz7QQ23RmzSnZ2s8jp6zB90wXwKGWbwAypb7WDvAlqH+sxD7E5Dk3FiZUwLRtubG6GPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JWd1fV4C; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JWd1fV4C"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-40444c41a70so2925050fac.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939684; x=1769544484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xguDCeFtlZRf90K3LbKC2UX9kSbpACBGQdqJf2Th68=;
        b=tTM4BkbUFabPrQ1M/b7JbIiFc49i+y9kf/ZwGmoLGEdnXkKwKgJZzKajpmKSRIrP84
         zj/geAtA5hM+Vhrsa31mneoOvB9pTKwEHTgoeROXDRG15IxgPHX58j3zaWOZCZXoCeYI
         ywSI98VvZtso7qxhkzpS4x+NXlwJke9RsvpdW7uW7Xsfos3CYYatbo6bd9uOzEyft/or
         gMUSaStnBgA+UkEQHuZJUyW+olDr3o1tuv3DokXpzMmp1gvC95VL3FZyrfuXGqmXK2an
         W5+YpY1fj5Jv0cGWLmT6d2H/ZUEMINNwdIVp+NHbezyAsXuD2rDA3MsTEE3y7kpIvx3E
         8htw==
X-Gm-Message-State: AOJu0YzG1A6JaAWRBY11n7cxpbpzFlY1NBhvR+JdhVRt4fysj7JALr2a
	zpkCE/O90CVj6wJTAj6DuVVJ+gbGUN8MReP3Uf2iGDxlcizdXSeOsYJilJ/wSWOBwvrAoPtICHq
	tKHgg0+XaHXC7tRizgU3BQ23QtAk8acxR5NlIRocSdPkciA8FRGCrtrw/xIjVOOSmE8NIATd4T1
	bOQDUyNWImOh18qlgCdeyayftSHGOXQ/iqJ67pGAMJpC99AEH6PY6c2eGgRrYwR5sW6nKTOtRXL
	hszXwXE0XCw0g==
X-Gm-Gg: AY/fxX6IyBt4sDsR8ze+9bfjloyzSuS+QXOG8c2fU8O0IQcD1KumSwUAEk93YY1Hp3d
	r73Tg9e7EzpPR+MLc8NO+ZUTQ0X1z+eUa0JxIzaplFKE6D7d6W8MVE5G0KXrkRvqc9g6Cq4q2dJ
	oC7bqC0blPv6fcwOW8ttMZHrjdXCbRL+xWGCp0EDrKSEHWyCHSZW74wOXDTZTBRX9JxBDAGMMoV
	G1GEpOFn4TEhyLzbawMYqLC4NSWqMVuGyw1p+0F+RPueMLhFxE31vBPll8B1LqQY/yWV3Lu6ZcS
	zfWoyA5LQHHeny68H+5a9+wxHrX2avU1cJH2g1txFsLyrnBRpW9b3RYdz0DQedk0FpINUgyEfqE
	iWVdZNHxFW0JSNbl699h7dtv5BHkuiAeTePKkY1RilFhtm4SRRt1HB1balxY6DPZToN+zKt3sew
	+v9IZN1L3MOl3hPoQZ584b65ItG8z//X3JeVy0Vf1JYvA=
X-Received: by 2002:a05:6870:d182:b0:404:4166:ff59 with SMTP id 586e51a60fabf-4044c4f8d96mr6795121fac.43.1768939684058;
        Tue, 20 Jan 2026 12:08:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4044bb0a667sm1534050fac.1.2026.01.20.12.08.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Jan 2026 12:08:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5013c19b92dso155481151cf.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768939683; x=1769544483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xguDCeFtlZRf90K3LbKC2UX9kSbpACBGQdqJf2Th68=;
        b=JWd1fV4C/vP2yr+i6mVXSwl7kdFq+bAJ9DcqpyO8vzIUuW0mcsvq6JyN8/pRm/GQK4
         VZd9NzVcLqN5D1yAutz1paFE6xJjGHLkAiJ54RscENMmCwvW5c9sSahjJ3EuRlCj4g3v
         0KnnE3Zn1MJUhE2D9vpSEXuSpFtftMlWtUrwM=
X-Received: by 2002:a05:622a:243:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-502a17c706amr234245591cf.76.1768939682659;
        Tue, 20 Jan 2026 12:08:02 -0800 (PST)
X-Received: by 2002:a05:622a:243:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-502a17c706amr234245151cf.76.1768939681965;
        Tue, 20 Jan 2026 12:08:01 -0800 (PST)
Received: from stbsdo-bld-1.sdg.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d6e67csm96221571cf.7.2026.01.20.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:08:01 -0800 (PST)
From: Justin Chen <justin.chen@broadcom.com>
To: linux-usb@vger.kernel.org
Cc: swboyd@chromium.org,
	chunfeng.yun@mediatek.com,
	f.fainelli@gmail.com,
	balbi@kernel.org,
	gregkh@linuxfoundation.org,
	bcm-kernel-feedback-list@broadcom.com,
	alcooperx@gmail.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH] usb: bdc: fix sleep during atomic
Date: Tue, 20 Jan 2026 12:07:54 -0800
Message-Id: <20260120200754.2488765-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

bdc_run() can be ran during atomic context leading to a sleep during
atomic warning. Fix this by replacing read_poll_timeout() with
read_poll_timeout_atomic().

Fixes: 75ae051efc9b ("usb: gadget: bdc: use readl_poll_timeout() to simplify code")
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 5c3d8b64c0e7..f47aac078f6b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -35,8 +35,8 @@ static int poll_oip(struct bdc *bdc, u32 usec)
 	u32 status;
 	int ret;
 
-	ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
-				 (BDC_CSTS(status) != BDC_OIP), 10, usec);
+	ret = readl_poll_timeout_atomic(bdc->regs + BDC_BDCSC, status,
+					(BDC_CSTS(status) != BDC_OIP), 10, usec);
 	if (ret)
 		dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
 	else
-- 
2.34.1

