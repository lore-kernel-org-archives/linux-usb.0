Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2475367F3A
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785086086; cv=none; b=KPoPiHmgNDH5+P7vKYetq2gbPGSA09pu4uD+6OSwvapUe/AHlRItUuYWl8KEW+I1dPioM1SDO26XD/AK1Z1k5WeASIi96NL5Wv9KeGVoZP75Yo//JIIotZA3nczMciNO1J3StksKMQYTytDQnCMHPqfdbvSeIQfp5QmLR6MqQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785086086; c=relaxed/simple;
	bh=3iB/wiWx302Pz2e+TlnlNVa92FYYzUWfDtPeOSl3bes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCjPi6kzB6D1SBX74/ooznkUS2C8rQWFkmUvedtc1RV02dxtlq+8QnCcq8WIEr65uSiqFSc6SRgyetDSRnruf6K8iFCwjTL7D9BEbTH2ryFny2f4RqDYqrru8eVO+qA6dVoO9Y9dNbGYfu7p2t8dDRERNFNC4tHsY3FpjSxSPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuIitDlm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuIitDlm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cea3004256so20757435ad.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785086084; x=1785690884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVAoIYveQgWDpiOCKRI7Wu/YCHlEipvBEmODi7bFYE4=;
        b=SuIitDlm41OtwS+nsI2wgrmosS0a0ckeFQex2FsJCOEn/G6tBSbTiH87L5J56H6RDh
         wr/xtC75YEdGxKVKlYs+8Ybw/Ler7nDKFM6Wwyy/npL5VUTstpIrIQYlbaECnXKdHJjB
         k3tM61z8GJ/L2ur4SM4scch295Dbp81VWopcQF6QkXHz6OPXxRIDjJxkFXce0Jdec2H7
         sGX/IIZO2S0oo8Zad8/93oBDBkh/dt4tZJoVZLH7+TP2L+0/ibdhSR3DKp8FvTXC/YBk
         t6VGfLgR3HHtgZzZKlVE4Wsc7WxlwTKShyoQYvMlRogU9viSw7DoVZf0vqMdv9RPJZJP
         ptoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785086084; x=1785690884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVAoIYveQgWDpiOCKRI7Wu/YCHlEipvBEmODi7bFYE4=;
        b=boNbkNRYZeQfwmnQR1raAmrAiHTKJRgiWQjaP0FgfTHJxVwQ63pFRESlkoY3EjPjtV
         kac4PMjc2j9KIzR4twk6E9HHzVLWQw8Nk0kFhsWw0TrEtu9Gr3vTMQuCbztcZ3amasaC
         Vhcho/E6CttBR2bXJ+v/nAkh9pVzE/ocV19BoFdffU0iPTGTlWnReA1yqnLu1SiB5Fo5
         wy2fYVamxGThBFgep6cZnDUI3qkKSlKI0ry4t8vy2xlbGZFsO3HPDU9WvEu6wHnhaDk7
         ojwouQD8rPg+AyRHButl1sBPb/2srBeyLnPHDgWSBBXY0udAHHkVfr4WvikQuv+SBvbd
         +r5A==
X-Gm-Message-State: AOJu0Yxp/EV/2nWgVuMgFovyqDXHU0iqqdXjTEmUwaKTxDuHfBJXYew9
	X5aWD+0F4SSxiF907PSfPo668ma+bPxa7RDgc8ytZCkkUc2FQcoRdj0/fQyBl5ktVMs=
X-Gm-Gg: AR+sD11fMQ3IPPXrhyzHFl8FIwLJuxc7WFqxiuLjl6XN/OVc6nUbvk4k/ygXEEtNg5/
	WnmRQNYyGSWPXsH5GziRqc+Qge+HupHcRVSPcGXOPKwluP1zQ7UwLBQ2Zh2GDTJdrzZkQbMeFgQ
	dKk46sj9g2z+RBfLivsJbbOSFx3cHYRNEP3TDZA1Cfjr1JzX+4xstKrihX6rRumHggiTCyWH10y
	oYcrT7HhZrWSWZZTQfVAKRVlEUm/De1XEoyisVszcc733vuD9imuY/n2Io221uKo8QFWxrDf9ve
	jEEX9f2wc5oNgkpHyv0p9LQZWhkP77iUi2RUkXZC/N5r5wJBfUXBjbl+ePd3ZKQlEIqp66s+f8I
	sFvJOXPN4DA24zg2Zt060KbdcRbp9hQmR0ee8Yvk0OenbmQsBHhdFslWSCYBLmC8eOcofJwCyLn
	rcp2w16NWJX+gh+IEO4miSdEpN
X-Received: by 2002:a05:6a20:4305:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c67df12a1dmr5158104637.42.1785086084205;
        Sun, 26 Jul 2026 10:14:44 -0700 (PDT)
Received: from Linux.bbrouter ([115.96.218.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d6ba579c3sm17823450c88.8.2026.07.26.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:14:43 -0700 (PDT)
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nikhilsolanke5@gmail.com,
	Ishaan Dandekar <ishaan.dandekar@gmail.com>
Subject: [PATCH v2 2/2] usb: quirks: Add ShanWan gamepad to quirk list
Date: Sun, 26 Jul 2026 22:44:23 +0530
Message-Id: <20260726171423.42850-3-ishaan.dandekar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
References: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
EPROTO error during standard enumeration because it expects a 255-byte
initial configuration request. Add this device to the quirk list to
use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.

Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index f5a60ccf2..b5b577f0b 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -593,6 +593,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 
 	{ USB_DEVICE(0x2386, 0x350e), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* ShanWan Wireless Gamepad */
+	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+
 	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
 
-- 
2.34.1

