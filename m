Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362220;
	b=i2isEBlY7ZiNXsmJCP+GVWf8q9BenWqGdDbt1vpKMEDpOGsUg19xoCMjx/Pi5nuIHNyO
	 kKtYFN9zCHZRcP67D3HbSpng7GmdJXRtxZsjTJY8uT5RYvs/llZnG8ocERUkedElaQRUk
	 69WtqbxsTK/aQcjzPefE8iql4LAXTAwGI4HYmN/RC6HLImSp2E0p3SI30aOTovi4QeAY9
	 AOy6/gCLYRtVMRnjQgZqVny53OOECqpzYDrB9TrKTUlxTz8UZMXko+DQJefsHmV3yhKyW
	 YGpKRQTLCMp6iOQA0KIzytsQh4vAwDBQv6nLNwRG3+uDJZLWDGonoPY3TP4BJ6v8dYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vmNJr9P+yc+qEVKa8j98PyVAXzeSDWR0XTfB6I2kKGI=;
	b=3YEfeF55nnTX3d0+HBYLCygyCnaWiSCvAqHyW+aeSMeQdCAdcHYB5MF8odqeE6yvIxqu
	 veVBwd9VoxOYpWVKWL8J8GmSybnkpDW5lTqWfu6XOsVsubGXEZ+qYkOR+bwzNlhqfYm0Y
	 hAqPuoTOxgFMhiSaNu+SV8liYEy1Ajk1oSfqsWlBV3DPDu5nEpR5NyiqylWUzOTxWFCQ8
	 p3mnhgula2aNu+lm3Yzl2OgimCSdrlFTu9uoJjW2GtcC9UQhCGcBy8uPSLl+z1wRT5QRD
	 w8612q7e6IxIIRQuWKs5Ke/LsAkHufuu22vWcRpPBmAxIUD1jqFcyxa/YPhmsyrgtnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBKMFrf7;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715C606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 15:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3715C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBKMFrf7
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a07078200fso1263170b3a.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362219; x=1795967019; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vmNJr9P+yc+qEVKa8j98PyVAXzeSDWR0XTfB6I2kKGI=;
        b=qBKMFrf7Q65lqRQPAUqHcyyk+in81/Q62/FRIfhvXLNxKnV6dFV+mfe9aFR1SvPpZ1
         KFqv6Lx3XE71MtzGKVAzJlJU2USyvA072uSpJXRDa8FpJT3bEcyx8iXS9b9ebz29liQx
         KYFyCIFy6wIpPgxRX4iBEa5RxAqfAQCZB3GJMdqoqqko92RCULLw4UoXJA9j0P4MegCu
         WpSO1c1lX0BW6B6YYu8sIsrRWA9FUb2okP6YPuxp8G1a0e9ayRfw/agDlWdf7FV/yNBm
         yFi7QOHapXwvp2/f3yQBYbEsImDwKK2MzqNJLdyct79tYYSKdbQa9iH72pb8g7O8Rsi7
         twDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362219; x=1795967019;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vmNJr9P+yc+qEVKa8j98PyVAXzeSDWR0XTfB6I2kKGI=;
        b=jYnCzILkAHFRVHeTbS8u7gKrpM1Gkaly1+IaaFKULF1AmukZwv6OUKBctJi9fWZp5c
         o02q7v91tgzlX/TtJor5DZwmoQeLzwpK63ukq0LwmlU5a6pTDaUeMElf31Ul4oztZ9f1
         jeIy/nGE2ZC5sfn+P7sl4+vzeq+Uucrvo4NZrkt5BVYGVRZJyFe84B0sR2TARVRu2hId
         pjDe1QovHtq7C2ja3F1L17a3zmeI/f2xpXpAENzPSwW36vfDSJsTSyrnTQpjTborZLRc
         nAeJxDIlFqd4lotMThQqKJdgKPNj7hoy4PRkvsy2O/pB9saE3D6GzWvf1wMz5b7NfpgB
         yh5w==
X-Gm-Message-State: APuU4Z/be2gjmtPivenAywkRrV6sVlQfBMNblaHrpTCDfdLbIpQx/U29
	7+iH7C3IA8nMWgsaknupzxG2uKFP08wUrrLzQZiUOwNkg2sZszL5+oFm
X-Gm-Gg: AZFdTZctOH0ZtwrkWDXxZi3xg6PLPfeLCHA4eeCno/pQ5YfqiMzOhdAvU5XzcVAQFlZ
	ANEMD8c3vKe7BFW1mvfqIdiw/44ficHf6b/hxq1DPRoqtWqptQC3E1MfkZKQ1Sv9r0lqnuxQMwt
	bo7YAVhZ4ZUmWyWm6EXT5zZFvuO9j+qZF+fMNTXSX/mon7nPXhE0IkI6/0YlGRyREgjrqhllD5s
	03lAieU5v78dTIA/1jguGgXqh/OZ7WMokPmtvDN8pNEM0nihF2YrpsoWHLHeu9dsG56sElPGjWE
	pBZ21pCwYOhZ74bYuRmdroG9hrhdtkgyL3bQ812Uh6QyrPrLDkoQNRFKoZC5a0imfn7yx0QaupK
	2Si71fAgUkr4h32+X6wcg+RzunaEHuTfD9v8qWjKHaY8tg5EoIk7v07mmgeP2NwnlzcbyywdKmz
	cnc+yBgtrP5lVDkOh/Pak9HomWL5hEsbWmSIkPWtWV+FCVbQkgyfL5Y5BmB3d+OoTm4QwcVUTgl
	Z62hY/+OxVp8C43JDxvVO5cjyt+YNcutx7xmmkr5BGEFVSitlQRQvoGcYYpBByCJZJv2oY10Utv
	F+A4+xKPcmgrqmscPoqa2uYpd/e2QnhX6j0UwfSAzNSUrneK4eEk01O3067LPe0yCUq2NlTSX6z
	549AAjOZC1oZbvuUaO3PewTCK
X-Received: by 2002:a05:6372:a713:b0:3e0:c955:cd5a with SMTP id adf61e73a8af0-4014e74d42fmr8396234637.68.1795362219416;
        Sun, 22 Nov 2026 07:43:39 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2:6c04:212:db3a:1bad])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm4087116b3a.27.2026.11.22.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:39 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 22 Nov 2026 23:43:20 +0800
Subject: [PATCH] usb: dwc3: keystone: Fix missing child after rebind
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-keystone-1-v1-1-5cf9bb522f65@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMj3ezUyuKS/LxUXUNdE2NjI/M041RDUwtTJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaADc5gVBuAAAA
X-Change-ID: 20261122-keystone-1-43327f3e1585
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 WingMan Kwok <w-kwok2@ti.com>, Felipe Balbi <balbi@ti.com>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: linux-usb@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795362213; l=1511;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=Uwpq+Wfr03blg+zC3QEVNBz6VPuYbcnuWQ4beNhTSGQ=;
 b=oevt5pNte4r/Bzvb2+GUaVvBMo3TeoWIcO3helR/SHPG0DiljaVS6QlnaHnX5PNaSyyU1eWM0
 R4ExPlQwIltBxR6Tdf3wkvBnZZNWcuYDTVylbJGAw9cZMGVpBPKKA7e
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Directly unregistering the DWC3 child leaves OF_POPULATED set,
preventing its recreation on rebind. Use of_platform_depopulate()
to clear the population flags during removal.

Fixes: 943befc314ae ("usb: dwc3: add Keystone specific glue layer")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/dwc3/dwc3-keystone.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 7a5fc8545d4b..ee3da7945c87 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -170,15 +170,6 @@ static int kdwc3_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int kdwc3_remove_core(struct device *dev, void *c)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
-
 static void kdwc3_remove(struct platform_device *pdev)
 {
 	struct dwc3_keystone *kdwc = platform_get_drvdata(pdev);
@@ -187,7 +178,7 @@ static void kdwc3_remove(struct platform_device *pdev)
 	if (!of_device_is_compatible(node, "ti,am654-dwc3"))
 		kdwc3_disable_irqs(kdwc);
 
-	device_for_each_child(&pdev->dev, NULL, kdwc3_remove_core);
+	of_platform_depopulate(&pdev->dev);
 	pm_runtime_put_sync(kdwc->dev);
 	pm_runtime_disable(kdwc->dev);
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261122-keystone-1-43327f3e1585

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

