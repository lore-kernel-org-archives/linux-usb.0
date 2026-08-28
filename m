Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C643A6B89
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905629; cv=none; b=mnczYIZFpZd9z/vvJYbXlMessCjj23Zw+ct/05DGJcQS0dP9owmD/GmNJ2pAX3W6t4zC9IHrjqIPQL8TcRdXRPdjiGXAx/OB5SVobxd6gz3za6HWvQnwPiF8nXddYsIaCMQMEu1S0O/W8S0otxc+yHJmw4Kp8mO5YxyaleQNW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905629; c=relaxed/simple;
	bh=5hEvnLDNcTGoaqofp1S+4NAECFlyfDmkOkI6CNlGqy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7tK16dmCL7Xmog4Tjt4p30pPYDy61ajuyJ6XdSMDC6tif1M1zR6dXP2v5g9E4IRXF6PcUN5glc11RzPq1SjoPmQxzITENoFaSUVHzUsnKyOfiJOGh2pomIpASRNsmh5pVLq6eB75HvId0uuvvo+Dckg8Rw3f5UZXMt+YgOTdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1d35dkG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1d35dkG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e27035206so659635b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905628; x=1788510428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBtdkO99POWoOXgQruRlbYMJZ092vG9oZUJO+zx1F24=;
        b=f1d35dkGfhnAIZ8XxgxYTGXMM7qfZ4vn7wMUY/4rJsFBYeXUOhdv8MNWQ7jtrf+gqp
         HSl+Uoxygss3K4Ik6UWhjy4YgOO5wu1tivW7phh18fnz5G/JR4IyBPGI6tP6lKdYpYxx
         sqTZNpON3qxJROkZRX/7cFM0a0sqKRihqdmbBjZY4yUsgxcuuMLCOeHzWUjdIcvC5s8E
         ExEPIAvgEZeHW8ECS0RZdKjKV7U/bwqILcCVihmTfXyiRG9I2D5Ab76gxEtojsFmAmu6
         ObfZ05S6gHwbk0l6PoiCQ+w+/tlk9zYvdsrJ3IYidlbdATIbFluPCKLrZdSgkJPdpyBR
         tpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905628; x=1788510428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBtdkO99POWoOXgQruRlbYMJZ092vG9oZUJO+zx1F24=;
        b=rJ/N2ara6CY6i74p8WLMdZJHMuFTY2BoPo+IJ8aDpVFlW+NEcWtrRfteM0HSlmnNci
         DRE7vky8X8nywwu49jq1r3EIvu97tZ7jpLk5RGNxSUd6j6g3u5d6RgOrVbEQ5Csl3/Ex
         xu+KOlPYEWyOs4kQH4gVGA59aZvmRItiFaqCQHMMjLYtmIpUCk81Pmyw4K5SHDwjFvEJ
         gb3dT6xhhhYnDq7Out1zF45pBR81IheQjfUIU7ir4dbgvZr7Rd2GcEISbqFxB7fTkA12
         +sEoh9t3xzc5dW9E8VP6d7/3mHVJohH6WQ/C/wCmLjvbpzgVYM00zNvPCqxT6sQhz1Y1
         940Q==
X-Gm-Message-State: AFuF++kdbx/rHRJxSsvoGMuQAoye6KLBE02WL95q+jBrB476IVH33+d5
	D8ryaSGQ2n1jOIkxqL6NUJzxxqE78CyfYJGLtuO79rEOiMBYb1G/Vnov
X-Gm-Gg: AR+sD13oPkE0J9vyz4pdZUjTQMUPln3g3dfZyOo538Q/Af64HYXmR/OpZUAZzP3rM5B
	ExCgDYgsN3alc+hgwXd1Qyi2g3ZAz4hJ8TZ3K1oMexKCoNnc8LvM4fxAnGXAWAGywa6zX3TDmZs
	abA1xW9v48eaaXzT9dp+k300f8bncnuJW3PQlfvhSo2ucjta7VBB1D9gwwGOwN9mXXt9DpEg/DD
	rXxqTL7UIT26xSXSW6b9TfbkfYZCFg+TxpJmlUdmFOIrhLJLCcnAQohSNId114Ru64Gft3rlHyV
	x7hyU0OrPGkdAV2+4IKc7+YpFYvz8obfgMAt+JFp2sVMChgwJEdsUxAyjOBFNPAOgYiL9EDNfS7
	v3eRYTglQ4ye4mdiBCZwdhLie0GkAXbUP4OGbQmpXf5gE0BglBq1cfBPMUWGjPSjdsxldKapHTH
	O2nfK4ZE06I+CgciBczBnyCCeEDhSse/DJguyf1mibARdZpXOriAwaOsoO2vOWGgBVgJATOWSx9
	aEfrU3nwlC9ZgJTSZ63QyziA1orHrOp7dp6tmKDr6D36TU4mmF3UZrjdbL2qxNHp3JVwGk1
X-Received: by 2002:a05:6a00:1daa:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85627dc169bmr10564110b3a.4.1787905627482;
        Fri, 28 Aug 2026 01:27:07 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. (59-124-157-10.hinet-ip.hinet.net. [59.124.157.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm350364b3a.24.2026.08.28.01.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:27:06 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH v2] USB: serial: option: add Compal EXM-G1x support
Date: Fri, 28 Aug 2026 16:26:45 +0800
Message-ID: <20260828082645.13018-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828075644.6228-1-jisayme@gmail.com>
References: <20260828075644.6228-1-jisayme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
its vendor-specific serial interfaces with protocols 0x30, 0x40, and
0x60.

Relevant output from usb-devices:

T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
P:  Vendor=04b7 ProdID=8217 Rev=05.04
S:  Manufacturer=COMPAL
S:  Product=EXM-G1x
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan

Tested on a Compal EXM-G1x modem.

Signed-off-by: Ian Lin <jisayme@gmail.com>
---
Changes in v2:
- Split the USB serial change into a standalone patch.
- Document the Qualcomm SDX12 chipset and include usb-devices output.
- Sort the VID/PID entries and add a product-name comment.

 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e4ad14375..e4d9f2e70 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2542,6 +2542,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, UNISOC_PRODUCT_UIS7720, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x30) },	/* Compal EXM-G1x */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x60) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
-- 
2.43.0
