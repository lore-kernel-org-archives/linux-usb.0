Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7EC3DAAAE
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384169; cv=none; b=UI6cxWtm9fXyry4TqQjP0ghQbfPq4KqPjkqhEMi1jc3lzaeUvQPjmNEPq3Y8iBRe1W26SJpH6aHtM868HBjtNJjLlMO9gVsrT0o6+2vrd+YpjkxX2VpfJwU9Gwx383lw5GBOkFgfnP2gO1fsFDtm4SVNMX4hiJV/u4E8Xgk8Fxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384169; c=relaxed/simple;
	bh=sE0zgNlM0y6pYWyLk97sioy0+Ar99YdHBGm2Onc1q7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I7Q8h6MCLfrKXvUpEFtRld/MY5B8iZ+yYVq/BzrskauSnkLJG/Pgkjejf1edzO2gPTQk8LNGhDKoG1/pQyigod5TgLjdfBs73T60FdtI/IjwPDmu2hsBkRWrVbT4HlM2xq8kbC6AMJguCsWf76XnJ9gBfatUF3PIMYNJJQF41UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ne9vbVCA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ne9vbVCA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so15458815ad.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384167; x=1789988967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=Ne9vbVCAGx5s4ANBTfZl3VTBLDC6viSB2HyqeyNUBgzv2rOafV16bI3M418HQL4AZN
         vsXOATjkV4chZnxCovvq5FYOmGJzSgPpm/dyThLecNmkKMYoqOQEdXrFh9G1VIJdZnnZ
         oRUAqm0PIub/h3921lWaZa0Tc7T6dVT9yebe15RDluy6dGKgRbU1IPVfGKbOTqs1ukh9
         rytq2n1VCsagDOtMDb9cIPt73SabVSje27wMT5FCBxBVTZ5TDV7nJBONnOp5rMffYN+L
         FSezlNW+XFzAGArjZvL3RNvf3ntCxa+84K6mFBERBPTtFf+FK55gRwzz/Dc5lDir8Kxn
         sDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384167; x=1789988967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=BooSuNSZi2pZCZaD/omPb73WDkHNgl/k+GZ3jym6lJb7OCSfF5n9AQg4TdaZnAR3v6
         CMU9+w/hhgRI7Zelf9ZCWbfmUQYP8Dy1VOkX8cOhzH0vG5YCHOcZ22IdrPc4lBooT8St
         aKdIOMwjcIIrGY6dISZi9F6IgzFiDjuYqWZVoL+VadtjHrEpAInz3WvEtA7S4xMJJXXR
         O3E2egSTEbpVaZCMjs3V9skbnloUElQmGcbg6aJF82BTzUBtwPH+aqyVt51Iwc6YdkuN
         1H4WCaddkjQkbkSaiBFPgG8aO4ZOge5n3mvM0mvkjAjhdj9V51SymD8g0Aw9heo8/9bE
         0E+g==
X-Forwarded-Encrypted: i=1; AKwUvBybHdxJVBwyKyvSgrs27t5FNImRI7t796Pu4R7CFZ1NttX994bcEXV9fFQMP04GXNmxQPz4GRo4zto=@vger.kernel.org
X-Gm-Message-State: AFuF++nLtd65GMjt4DQ1RdV8h+A6+LoG/YooqXRzLvvEGHKf03eBhM8p
	WMqxUE7W57GquzI8CfRfZplQh/Hn04tqp0oGRMGOGRFEXj+Lk85wli58
X-Gm-Gg: AYBFou35qhN8FVQTbh4R2ths2CJD0xuTse6a57dq77IO4dxzdWvdGTY4tMQbj7BlJzG
	Vhl+2GcI4v6qoveyvmcYol58MxbaQ6BagPTUkn9aoc4fIXj7DBvdDeFiiIaUkGSK/uyl22oI8O2
	/60tjV4sZMPqOG6YR+PTMFvNdG1TQfkWvT8uUxHCGZpJ0u81q9Dp2/CWmxKXiYPe3/uaA6cyzzS
	Z57TiGh3EAPwnNJt6e0rjgUunMyfcuu4ByqDSXffHaUZ2XaGWSX0HPytPcnnrftkqhcXSjE1ZfA
	UwBEj5Mtug2Od5qkRPt92N6KYHo3EotL2Lfki8TFOSA8qxmuqX0gZSRr9lOx477oPvqvslorfro
	Xhz07sicivxUN6xtPkqKunBtoTYx7Bk7zC/zGwrFXlX8NPvZy8DOaf0CbLo2YAmfOpisO4LMfj8
	9twJqBXkg6dyMFh1Krsg18RGRLNuUrL64gdQOALY1k5kERMjd2/adQzGt0NmoLmdXYT1+WXUTt9
	zEG8CwEU9ZX/N5aS7fdYtbWro++fmFP0AgLPJ0fctI98wv6IjfiMTv2BMoZeKTgWlhU
X-Received: by 2002:a17:90b:3f8d:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39dec145056mr4629476a91.25.1789384167074;
        Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm20313018a91.13.2026.09.14.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:09:26 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 14 Sep 2026 19:09:13 +0800
Subject: [PATCH] usb: musb: mpfs: fix phy unregister in remove()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3dyCtGJdAwuzJPMUI6M0i1RTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAGq2KD1oAAAA
X-Change-ID: 20260914-mpfs-086b7d22f8e5
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789384158; l=1043;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=sE0zgNlM0y6pYWyLk97sioy0+Ar99YdHBGm2Onc1q7U=;
 b=dFW+7gHeBm2AIegMt/TyQI2ujV3ViEUxyFCCwY3IPPOOcqEfdTblaOh6qblg4rZa+MpI2jtNg
 XvLpyYBm+pDAINfYA4TfE0SGjMBNN0bv2nbZdzhrHIb6pQPxkzt4toK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

mpfs_remove() passed the glue platform device instead of the
registered generic PHY to usb_phy_generic_unregister(). This
unregistered the glue device from within its own remove
callback and leaked glue->phy.

Pass glue->phy instead.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/musb/mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..6cc2909b8ae3 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-mpfs-086b7d22f8e5

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

