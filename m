Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891772;
	b=pJU3mstzXyP59aL3OF6EmRBmg5Pmbnj3nDGcb23a6KV7OpGLw7pNlymCMXPtElqHPIqL
	 m7poZ+WVuNxSsO9GGXOBkAMG6eJCD91JeLDke5R2pFXKuqp8Mtxv2/XUdWVsfJx99JuuL
	 +MJfL5hNs3mD7Htl/jHhJUSwL7Sz66R6Te94CoPN4g2YYCIAaSplll6uRgaKw5H+nvjA8
	 vumE8pp9AnKiFxRVZIOMyfzd+xdF1tzlNzKaw1Vntk/0PyS85T1955nxLgRIhayEpXK4x
	 vB8MDkpOQUGsw1koxLfRw+H0+nDDFsU6KO0+mE1vFwQGD89zXOApBGUDKaIr1yEjOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NAsafPrldEVIRgNGzNoDoB4C/Fy8zdFsj5OJUG6+wek=;
	b=jRKdTXH1+GeK2YXk/5mJYn29RZ579iru0VHJyuxeBrktUGw6IQJQMLpuK+EOAohkCKZV
	 wbKiAPkyg4KbKqra2qyNLdpWi07Yx7qRfYN/nbzdJ1Fs7IGar1RvKQ54SHkMiT7hmIDOG
	 eLQDh+5IEGbhIsLx1SNprj1Vl3Gz0xtS729UZcZxO/xdZUujtrrgvHvM/XAWVAjo5Rc6M
	 TAGgatdm1B4Pm6hDaNSo5aS3zMx1HMRvTnvwPXbuW4og6riLHRCGHWK6iJs80fKRyo7eS
	 l4KUnxzW8a087aURBQw5toCZjLfTvakQM5fy0mvOj8cYRxFqd28xHs/NJqVp5Qd49Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=touhey.fr;
	spf=pass smtp.mailfrom=touhey.fr;
	dkim=pass header.d=touhey.fr header.i=@touhey.fr header.a=rsa-sha256 header.s=goog header.b=nQxdFb96;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABE606A33F
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ABE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=touhey.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=touhey.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=touhey.fr header.i=@touhey.fr header.a=rsa-sha256 header.s=goog header.b=nQxdFb96
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso563564f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=touhey.fr; s=goog; t=1793891764; x=1794496564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAsafPrldEVIRgNGzNoDoB4C/Fy8zdFsj5OJUG6+wek=;
        b=nQxdFb96x08RLfpk2S1RzGbg4cSIZb/sGSozbm8c02xjpbvYkk5rszmjSHVBqz2hjx
         cqDElKE+HuyuqWZ+Chy0RbQd62nTkC9Dylzq5SR+j1ddiwcpxzFhfrpCOoju7ihIl4O9
         qYrdbGrk5zZNFl6IABvAaWukItCFqg030C51A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891764; x=1794496564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAsafPrldEVIRgNGzNoDoB4C/Fy8zdFsj5OJUG6+wek=;
        b=0Ov9NmTOv34H3Pz8+cT33loIStOkIyvQyHqqxCMzAAfAtBQgO4I/e7w5taDiMxwSoJ
         hJLHU16fHlbCA7s+KdoRJ5efOehe4xASKSpA7iw/T+vSwe365BjSm7NnXkFuhD5VwLS9
         ijVK7tHY4nYq77yq6pa7U4MCxnIDE+063Q8HuSMe7Z64ZekE1CDNDHlz/t2Vgt3az5Ug
         a82WpHYLN1YCpFpSQERl4gcz/maLw5PPNsgZRGRUyMUHfuSs6d2fLN4dDWLRuBfGhHQQ
         Z6GbKD64WG1XXkRCBaDOBUOSjXPsBLk2SBPkjSCjRYrOKf5gam2f69ZqFDwgpqYdi/uY
         gwnA==
X-Gm-Message-State: APuU4Z++3YhGCqhw7D8jjFH2LKF2YB6bXY2485MIpfsVcRmBq+KqpePh
	/41LdjbcU/LYo6SgmwsFxZKRUKeFwLE/LF6dcwVY5ms1hgUsYLfN/3lVP8CvkrdxZdvDy+uILOw
	kZV//noI=
X-Gm-Gg: AYBFou2OdTvALjZfdfXNh7Kr5nQzEnD+jvC7wZENqQPC7Rr/Z/mjtjSisEJU1Lpmugk
	NLlvkmw238H3S9myPPNJ2H6aLMlf9tEhjGpVqqzIN19rXJh9zp2/wUaZ+49ijCZMqXC+sYPVY5J
	Gut8ZM8OQWJmgVFJ+RSUsmAHn4580RIk0bOhyA7EvbzurXbW4qtPIbRvuNTvXCZ6J2cGPrDfLI1
	dYRydaXRc5+f1RmLLinYp63lOtNC78Ovg2fNAKcCYz+FwTyinM5KsOiRQdV/Uj/19YUcHmHjH//
	GhfgYN/1xA3ZloReUJnYHtex3yP+yXTl30Ig6/MUGmA+cUWB4Z9IcBfYbXohRJHLvEIb6ViodyJ
	MxU0bXasaE4Jwm99h0SK2BoWkF9tuJW3p9bva9W6yuHiNDJud6nbq+firmfySwqrfPBuFIttHv4
	h9CuiK9I2cTLFf3ULJxonwysURJq29Cas6bZVkD3qK/1mvmlTc2VeADbK9P+03QIRVSNbrktVo3
	NbXR3ZsXigMvWboS+BNxs1ZPsFynTDaLVxZEbIBAENJSDCiNi2IKKPRXVhgO8L0vvfZ1tev2Lr5
	DBdGzmb1uaeaIGFzuHtK4pWvKGDAazWlfTaY7KNGg/uCvqTFfZoxEDd3vOgUHPMXMiRzz3GdJpi
	gat/RPmdg0FSKT5nHCueyZjSAvl4bD2DYmLJ+psVRrILRFQrDGUKkH+EivyrsLgsyP6E=
X-Received: by 2002:a05:6000:4311:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-48e75a11e48mr34129248f8f.56.1793891763839;
        Thu, 05 Nov 2026 07:16:03 -0800 (PST)
Received: from eightyeight (2a01cb0080c22d004bf1fd0ad5c5992b.ipv6.abo.wanadoo.fr. [2a01:cb00:80c2:2d00:4bf1:fd0a:d5c5:992b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d7f7sm11111570f8f.38.2026.11.05.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:02 -0800 (PST)
From: Thomas Touhey <thomas@touhey.fr>
To: linux-usb@vger.kernel.org
Cc: Thomas Touhey <thomas@touhey.fr>,
	stable <stable@kernel.org>
Subject: [PATCH] usb: storage: add quirks for CASIO calculators
Date: Thu,  5 Nov 2026 16:13:48 +0100
Message-ID: <20261105151348.19009-1-thomas@touhey.fr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CASIO calculators using USB Mass Storage, bearing
product IDs 6102 and 6103, always report non-zero
dCSWDataResidue for requested transfer length
>4096 bytes while bCSWStatus == 0.

Information about an fx-CG50 (OS 3.11):
T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=03 Dev#= 24 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=07cf ProdID=6102 Rev= 1.00
S:  Manufacturer=CASIO MassStorage Device
S:  Product=CASIO MassStorage Device
S:  SerialNumber=0000xdPUBVUq
C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Information about an fx-9750GIII (OS 3.71):
T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=03 Dev#= 25 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=07cf ProdID=6103 Rev= 1.00
S:  Manufacturer=CASIO MassStorage Device
S:  Product=CASIO MassStorage Device
S:  SerialNumber=000000000001
C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Cc: stable <stable@kernel.org>
Signed-off-by: Thomas Touhey <thomas@touhey.fr>
---
 drivers/usb/storage/unusual_devs.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index ac22fa318734..492b5f050f0b 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -1168,6 +1168,25 @@ UNUSUAL_DEV( 0x07cf, 0x1167, 0x0100, 0x0100,
 		"EX-N1 DigitalCamera",
 		USB_SC_8070, USB_PR_DEVICE, NULL, 0),
 
+/*
+ * CASIO calculators using UMS for "USB Key" mode always
+ * reports non-zero residue when the transfer length is larger
+ * than 4096 bytes.
+ *
+ * Reported by Thomas Touhey <thomas@touhey.fr>
+ * and augmented by 0v0katai <0v0katai@gmail.com>
+ */
+UNUSUAL_DEV( 0x07cf, 0x6102, 0x0100, 0x0100,
+	     "Casio",
+	     "fx-CP400",
+	     USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+	     US_FL_IGNORE_RESIDUE ),
+UNUSUAL_DEV( 0x07cf, 0x6103, 0x0100, 0x0100,
+	     "Casio",
+	     "fx-CG50",
+	     USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+	     US_FL_IGNORE_RESIDUE ),
+
 /* Submitted by Hartmut Wahl <hwahl@hwahl.de>*/
 UNUSUAL_DEV( 0x0839, 0x000a, 0x0001, 0x0001,
 		"Samsung",
-- 
2.56.0

