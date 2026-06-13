Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D541F5821
	for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781381951; cv=none; b=Bb3K7R3JLjfLW76cSoQYoic7nfvugnNx5sx74HnTJRkl+jje73rszwlGrp1vtvZI2U21vnVZ/xXs5R2ZIXUyih2QlchlRFlAyoK1guF/8cAwgFWeI4ZbbcGPLOLQCcetURUoiWdT0ubADqXfzDpQCzmjrY4DEZO1rcSvMPCFiro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781381951; c=relaxed/simple;
	bh=/lLAwCB04viPlzOFwK4tQlglFCwf4KPbJnwB6ud+6hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4HQBaZT3x33u8PJIlCs84yf8+FVaHkY5D7KPMM0A4FD8VNtT926NldRYV7xym98cJrij/ERxHSjuwDgdCGe7oRSxFucOKtYxNUW7e00D145HdwJKQQvwP8HkkxrM47uV3uwkD1CSMJ/jBexdx7bTsS7wmrfApNfJ9ngVQ7AYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMWzPWU9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMWzPWU9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1291091a91.3
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781381950; x=1781986750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8S/FRZaPPC7RlOodUALTRDD+yK09EFYwcSWuYSfBKw=;
        b=dMWzPWU9PuxfAA+iMdcEOkdPWcdoL3SkHP9NDcN2W0nhhINO3NJFzz7pbMOtmiBSQ+
         +oLL2TsfOzymJY88X6fEREie6EVAR2GMVnSxtCX8aaAp1KbsiXWy6931Y7Gf24eg56ZD
         MHJgSLh7TnCnaCL3lwX6ynmXe0HAEtrUWt5Wv2qE/5U75EocJEwjkxf1JMyLA8CWtxAV
         11R5BGiJoPJLNod2ggRPzfjDvNLerfjrSyGTAH/i0YwVvkgBr65GHeSZFlEX73mANguI
         xfYGFVjxFABENF/Qkc1vhMLAoEtm/WcuujTM9ubjKu1Bx0Q0s+ZldVW5q/wvuhoN8qEg
         CWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781381950; x=1781986750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8S/FRZaPPC7RlOodUALTRDD+yK09EFYwcSWuYSfBKw=;
        b=eOYNH9MBe2YycQeiPPHUBGLCkGCGKrevpBv/LrowTcQ/LiWxGbNMuGnkKGQexahT0B
         qFqr5FnWOB/msEkCa8xCmpfEpnTbXmaNle5JDl7qjxXtzPKeoRLbAnwELndh8MuUk9I4
         WRdRMBn++mkTC6AAMZBmbgCY+8/9xUGAWPyFaEhPHwgdVL2hM9qhjs8RHYQZ+tqqrxjz
         1CIFNpvZvXo/5IRWsQtH3paBFL3E05jfHUmi5NTtwPXHhRPamsEzi/3cQIsahYyK5lkv
         24k+iDKAyuL73SZLXJf9MF12tpVqLa+knMSEIywRO+1iqPSSfRmzkp2mjreHmVZZ+m8l
         Z5AA==
X-Gm-Message-State: AOJu0Yx/Yq/PJZMTy7JfNWj1HgwfLf1LCNbP+SkG3bKcY4iMX2CYue/N
	ln8fVNNYzBaIF1onpD30C8igHDPyRAGU99yx/aqPZW1y/O1V9DX7Cy1miXG5Xg==
X-Gm-Gg: Acq92OEexIqDUKnmfdUCGbv63yNVio+06Lo3mgNHrhp7ZOHxE8FSfnQifURQdDkh0eC
	N+IAUhQ6V5xhdBLkMA5+qsaLnGdrkF2RdWw18+ePgdLjZgsB50ejp4ynZr0bVeuSMfZdoQFTduR
	6ZHeahNn3FQonHHTxaICn9dPP6swyPfNjNTr/Q6deBWfC8rlYlss3Hi1EZ2qPcOqDsu9oeMWZBp
	NillfpkOV6L41kKsKUZHjwHHUqUENHH85MaS4KHKfW1CfHF9I6RYL0Bi+mmyd2zblrhseoLR0cZ
	Aucpyk4Cgi3RNRNLsPZvdrlljPV5ejA651RgtGFqlZ61ucFV55f87gMAkgkgG5KsrOxEmNOe4rY
	X/xG/64cCsWVuuoP5ZGsFBfSFH3KQZMZ1TCHZVmAhlpUCZCbJYHQ7k15jCsVDRwCMFSwDt3mbnH
	3egSnsU2mYbdrCZsJT6dTt+frsirL/fkpCTCpOEKaMVDMfIIhaQu+6cjDqb76R5Tx4VHn06RD0N
	D2wmr8VPiTP2KxpGig9Ssq+AcyfC1W/Kcw=
X-Received: by 2002:a17:90b:514f:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-37a0184a3bemr8740341a91.4.1781381950019;
        Sat, 13 Jun 2026 13:19:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:46e3:727c:48bc:b7a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a20dbd301sm5878092a91.10.2026.06.13.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 13:19:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: apple-mfi-fastcharge: Convert to devm resources
Date: Sat, 13 Jun 2026 13:18:51 -0700
Message-ID: <20260613201851.63191-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_kzalloc(), devm_kasprintf(), and devm_power_supply_register()
to let the driver core handle resource cleanup. This allows removing
the mfi_fc_disconnect() function and the error labels in probe.

Also take the opportunity to shrink the private struct and move the
variables in probe as devm doesn't need them in the struct.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 61 ++++++-------------------
 1 file changed, 13 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index af266e19f2fd..c1064f672d6d 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -43,8 +43,6 @@ MODULE_DEVICE_TABLE(usb, mfi_fc_id_table);
 /* Driver-local specific stuff */
 struct mfi_device {
 	struct usb_device *udev;
-	struct power_supply *battery;
-	struct power_supply_desc battery_desc;
 	int charge_type;
 };
 
@@ -177,67 +175,34 @@ static bool mfi_fc_match(struct usb_device *udev)
 static int mfi_fc_probe(struct usb_device *udev)
 {
 	struct power_supply_config battery_cfg = {};
-	struct mfi_device *mfi = NULL;
-	char *battery_name;
-	int err;
-
-	if (!mfi_fc_match(udev))
-		return -ENODEV;
+	struct power_supply_desc battery_desc;
+	struct power_supply *battery;
+	struct mfi_device *mfi;
 
-	mfi = kzalloc_obj(struct mfi_device);
+	mfi = devm_kzalloc(&udev->dev, sizeof(*mfi), GFP_KERNEL);
 	if (!mfi)
 		return -ENOMEM;
 
-	battery_name = kasprintf(GFP_KERNEL, "apple_mfi_fastcharge_%d-%d",
-				 udev->bus->busnum, udev->devnum);
-	if (!battery_name) {
-		err = -ENOMEM;
-		goto err_free_mfi;
-	}
-
-	mfi->battery_desc = apple_mfi_fc_desc;
-	mfi->battery_desc.name = battery_name;
+	battery_desc = apple_mfi_fc_desc;
+	battery_desc.name = devm_kasprintf(&udev->dev, GFP_KERNEL,
+						"apple_mfi_fastcharge_%d-%d",
+						udev->bus->busnum,
+						udev->devnum);
+	if (!battery_desc.name)
+		return -ENOMEM;
 
 	battery_cfg.drv_data = mfi;
 
 	mfi->charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
-	mfi->battery = power_supply_register(&udev->dev,
-						&mfi->battery_desc,
-						&battery_cfg);
-	if (IS_ERR(mfi->battery)) {
-		dev_err(&udev->dev, "Can't register battery\n");
-		err = PTR_ERR(mfi->battery);
-		goto err_free_name;
-	}
-
 	mfi->udev = udev;
-	dev_set_drvdata(&udev->dev, mfi);
-
-	return 0;
-
-err_free_name:
-	kfree(battery_name);
-err_free_mfi:
-	kfree(mfi);
-	return err;
-}
-
-static void mfi_fc_disconnect(struct usb_device *udev)
-{
-	struct mfi_device *mfi;
 
-	mfi = dev_get_drvdata(&udev->dev);
-	if (mfi->battery)
-		power_supply_unregister(mfi->battery);
-	kfree(mfi->battery_desc.name);
-	dev_set_drvdata(&udev->dev, NULL);
-	kfree(mfi);
+	battery = devm_power_supply_register(&udev->dev, &battery_desc, &battery_cfg);
+	return PTR_ERR_OR_ZERO(battery);
 }
 
 static struct usb_device_driver mfi_fc_driver = {
 	.name =		"apple-mfi-fastcharge",
 	.probe =	mfi_fc_probe,
-	.disconnect =	mfi_fc_disconnect,
 	.id_table =	mfi_fc_id_table,
 	.match =	mfi_fc_match,
 	.generic_subclass = 1,
-- 
2.54.0

