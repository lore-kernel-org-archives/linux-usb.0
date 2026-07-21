Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D167379C55
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599806; cv=none; b=ImjrX8j+5Oui+7nVO4+g9ZEp+Vt5ZwbD/jypKfbBJowtehA/kBwdUga/CCU0ib/5SVYQJWsnYqSJpEBOfXfNdLrPIlqJkzj2BrPIqTBKPFLF7jHHCDQ6gV+hRfN6EzuvSlussDm/GAwir24PJEMC82v5HMCv9dQ1KhK5NxenxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599806; c=relaxed/simple;
	bh=b9keBwY75KD4whpUDiVPVBFYgKwqnAEZ7FuGOAmsfNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cU1D86ZRbCUIGgG3WdUicJanBRuE1kUp/4nBsoiL1XyX+v1hQnevCnROCgfWjJbBnGJUZWoJqpr7GIxVt9ALiRqPAHRtEhOXS24E7f5mZRvEbuqBLiKHSMWh3Cvh8b29hJL/a47PQgEKsJGfiSHnewSyE5cLfeJxtrCdW7LQUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0yflE1d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0yflE1d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so73314725ad.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 19:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784599805; x=1785204605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAFX1wgrLmxJ0ufup6UpGR0fxVvA7mN4bo/T5H3tU4A=;
        b=J0yflE1dSXNGrxwfu3qynRQHdOn7IqejFjVq+ak4iP7wSPrBffNeSvtXXCvzkh0UPL
         W2hvfZogPolXHoJjnkn01w4cG9XLgP3iWLJZevnH4M5idTZ/l2vRWoA6xloe/xDLZEqE
         NTr3ZeVuqaPEUIw6pgrSjnRb2RgDu3/R0pYD/Y81IeScxcYvtbD2ffze4TT+RgAxBn03
         x+vchUgzJS+uWau9GcqpuzDbKiUpmMDQBKrY/P7/0VNe+mlxauMOmfoSqbgnq4j0M/F9
         hZfE2a2cr5Qa76UfLpeXn7jm7YAC/GfjWVNX3dl841BAEqd7MwhQl/urClUXoYzIJzHI
         Ahog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784599805; x=1785204605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAFX1wgrLmxJ0ufup6UpGR0fxVvA7mN4bo/T5H3tU4A=;
        b=e2LoA9re9QrNPsVWt+y4utmzWO0qe7LBK+sZS5W/B3SV52GxjtEVJwlif3+wT8Vq7M
         3u7SmGdAja1ov5Rw0pMNkK6PkGG9oW2ZMs/+BwCAF30sQMoklSMZ5NbXgerC9bmjVzjJ
         k0RN3qbpUF2n/ir5nMP+onX/qlcCLeQSzOos26I7TTj5lgYbZDmMgzoVq99stqAaSc3T
         wej9atKqJPzNAc5/rIsngPcLiwfvsqjL4Zhlt8vLrF0c1qufZxR1w1qzG8VkFbQ5rTZB
         9GEeB1mg6E0ZMDgRKe69gU6QA661zHBJM7wgwesHpvtsKkUJJzPM127GfUfvFl7YXgFl
         gkNA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/O+Z8oFi1plKI1mKhoFfsvnJP/Fmb+ceTRE3LUoStev2bl8MLIKql7dDHVzp91gwbo+WM9AljDrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuzr7xpiCXhBhDPCvtBJH6XD0p+W37j1lWaGirhzK59W4sqEb2
	tDfp0Vqf1xsgUV57DUPQ5G4A4hvDadwev+JFJOhRLI2hUxD/4oecDMdY
X-Gm-Gg: AR+sD11ODTGclfD7vqGPNFqcA3JpGyCqzN5sPDYSlR+RsxlgjS4n4wNnIjWjiADUV1+
	lBgr9RGgvOjJbHnbTxS1wub9wUMHWyg7neGudbiTp5x3nqH+RnXuYcNSrkjqjCXtNyVO3ObROgm
	GSscF53RXrR+UHK33WT1VRbagMft2+YopUYXyOb0Ukmfk9vFierW2mw3cr/ZP0l69yNUDmcAEy1
	QKMV9c3dL53Iv2QiLYHEkvhOxICkxZ4ARWEW7VriiP3Y64hkk4ygS29WVsTdEDp8eFwX3ppr9Hc
	fPX/wwb6Ug0C99IRjVz0CYVezKZGGZBE8Zrjigmgd31Du8hgPrYcXwufXGGsX2xhnPbYbH0mqeL
	+yrW04YNkFvoZDX2i1Ig4g+KuwyvcJBrwUNgXl3c9HmYg68tqpTh8CpE72+9/RMsuSsqF/P3QIK
	88b7eUpNWXr73sjg06Fpj9x7lOCFWDUGG6Jz9N3o3Qgt6fyaXbkg==
X-Received: by 2002:a17:903:1aeb:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2cf3486ef6emr199723905ad.16.1784599804746;
        Mon, 20 Jul 2026 19:10:04 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:2dbd:5df3:bcf7:deda])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm42017845eec.3.2026.07.20.19.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:10:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: gadget: f_mass_storage: Remove obsolete version log
Date: Mon, 20 Jul 2026 23:09:57 -0300
Message-ID: <20260721020957.81956-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mass-storage function prints the following message whenever a
function instance is allocated:

Mass Storage Function, version: 2009/09/11

The hard-coded date does not identify the running kernel or provide
useful diagnostic information.

Remove the message and the unused version definition.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index b7b06cb79ff5..a50743caf083 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -203,7 +203,6 @@
 /*------------------------------------------------------------------------*/
 
 #define FSG_DRIVER_DESC		"Mass Storage Function"
-#define FSG_DRIVER_VERSION	"2009/09/11"
 
 static const char fsg_string_interface[] = "Mass Storage";
 
@@ -3513,8 +3512,6 @@ static struct usb_function_instance *fsg_alloc_inst(void)
 	if (rc)
 		goto release_common;
 
-	pr_info(FSG_DRIVER_DESC ", version: " FSG_DRIVER_VERSION "\n");
-
 	memset(&config, 0, sizeof(config));
 	config.removable = true;
 	rc = fsg_common_create_lun(opts->common, &config, 0, "lun.0",
-- 
2.43.0

