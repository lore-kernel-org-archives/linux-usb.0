Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E93F5BF1
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961637; cv=none; b=H/vqVFPxui8gSvIbmYgb7J0TVGwqOM9gx0uXED3DnM+uq7rNYY8KGp4OJFcXzHTSJD4PzyC70FE4CwDphHHtojbevuTs3HeW/ohnuZSDzCoesl0afrLHCzLRWhiDWOuWba5xMY2HS9xHHQmMWuOwG1FDMqzZb4J2CJ9LCQEcDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961637; c=relaxed/simple;
	bh=Oef+XjVHvVzkVc9uWEzYYiNH9Z5rup6G0lv7jvqHv/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljMGp5OixkRQvZmGtzgpAjl/+AAFM2/FUr8KIhvx7ocaaJZJo62ypY0ja7Bej/uCjQNbzShwFHnHLhyZWY8AISJ6Vq5E7eKc7ZcxOt9+yk1iGH9o3QhisZBGF73aD7xCDEgT0hAr7GTr5ZsVMOouCM27BnG43sJxntt+PeBfyYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLYutAtH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLYutAtH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2162803a91.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786961636; x=1787566436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4G2eR48d0fvH9jQm2XGVMJmsLdvNh6shGaTXK3zI+0k=;
        b=SLYutAtHn/xLjaoNXdGFOi6JqYtfU43n0SNikyGTyN9jdyWvKC07CJcF88axggB9DE
         d0EjwOdhFMc1A4nFnN9t/IdkkvEIeFxitqtpGsJVVwYZAHTre+mAdszfqFhPSNUSDhRH
         I2MFO4RYX9pIYMxU8acFvyEnuEUSHcoGo7C9yFHTV4eMT7Ml2+cHRHdy0NAUbrhpQRbu
         o044NisUWreF0bq7AH4PMgArwtgGJDQpqtkJRiwytvfBgRXtmKbXaU8hvfgDONTN/QQ2
         m0cXBvXvopOjbbfB/Wd2RnEozMw0/4oNKxaXj755eYM8sFp+Djzcckbith+LGrjVDfGG
         I0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961636; x=1787566436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4G2eR48d0fvH9jQm2XGVMJmsLdvNh6shGaTXK3zI+0k=;
        b=q00pnC0B16BEYwL2PJp1tT/UJpgpdn1y4tksToTwL544VnkKVUWYZ831Y6Wcvny5Ac
         ZVcV41PnnhFSKJH1fLlJsKrhiDZA+3SqSma3IkSw27ElRIxrBq8YtVPq0CcuVXMRMHMr
         68kXrJv8h8WrA9yj9AxVClUXTSZdlOqQE4ERYXk9o+UA0e0M0ltFHVyjC6YPwDFJj2ls
         zvbzTW7THggMf4Asqwm/pkhyfzRoTEp3L5tEIZUmS3cfoQmETh41TUB20soyHp3bjBfe
         uS/iZ2Ce8YMpKkakfxcjWMYDW8zV5p+OsR5GQg25FUeZ1i3OW0gRM8NVs3urTZp3VEK/
         tagA==
X-Forwarded-Encrypted: i=1; AHgh+RoRfyPW1CFaKTYf2l4B3JUDE4HBP6Zl8Hu8VDPbrSfcaZErENm8NNCYmirFRotGcedz0wmbYDXyVfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRNF/Bc/s0kbWBbCcm68BtYvIqffh3VraQOM8zQVXvEF7MnHQ
	3d6ztnT0DLTHvZxm492l7a++psigtgJHQMQrzjv+AQYF7ltFdk3l3RA=
X-Gm-Gg: AR+sD12fMDjbEFS6zY7zXLvXMRfX7EW7oojlDf8KprFox6mar11e10+hIjzY37SdJg6
	BtWkO8uwLuL11JnSbdA7Bp/Oa1J0NsfGGWjx60hY9XKp2hYxueI/VwXQW/Na34OHqvgRoShkGK5
	ki9orqqYXVnvikcnrhhiMINVQkmzHnZTVPNhSmXp8B/fWGZnGTS8rfnGWRKDHMmB0vXdruV/BUf
	Z+ADqVdPGL4Y8Q96AWrFLE9RpZsNq4qlKCD8RMsuZrHH49S/RxZnklgS2zn8WWr1Y7/Dsz5vMvb
	AI0977EljBJWwqMzp19L05mliXi+LCamEOZYSLaW0TId8zInTkPCN/VAapibtwDvLbUcZc6Umrr
	6bPXGS+Jl2GfOwpbmKxzaAKJFgzewWzyvFOqWv02R5HQk7VSeyc2wcWDuyKjXLrh160m2zWnl4o
	10i1Hp/n7bwjnal6VSkE95RfzT2g0RK2bktAM7GN6lFSus4PI1OfwMQp2ea9hvGrY2eIKee3dX3
	wRDHkL2g62lEGJQed788Q==
X-Received: by 2002:a17:90b:1b43:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3933af8b5d7mr16818604a91.5.1786961635998;
        Mon, 17 Aug 2026 03:13:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.59.94.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326761d3539sm4864117eec.0.2026.08.17.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:13:55 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/3] thunderbolt: Add device links for Apple machines with Titan Ridge
Date: Mon, 17 Aug 2026 06:13:23 -0400
Message-ID: <20260817101329.1517-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
References: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device links for Apple machines with the
Titan Ridge thunderbolt controller.

To add device links on Titan ridge, the discrete method is used.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/thunderbolt/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index c3d5a36ab..af3a7a9ba 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -511,6 +511,8 @@ bool tb_pci_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		return tb_pci_add_links_discrete(nhi_pdev);
 	default:
 		return false;
-- 
2.43.0

