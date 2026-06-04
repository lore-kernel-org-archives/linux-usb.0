Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FFC305679;
	Thu,  4 Jun 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569013; cv=none; b=Sw/xdPk1Wpihb8C9S09bBH2BVNIGIBsVkd/RKfRWkIqzZIOh2qCsvXzp3FTm3R64qpl9DdcxBGU9Ci5NV7NWEVFiRpWIOuet5fpvwvxTvixUf4x0D8F+gdlzQtHRaveN32youHn4k7rxmOF4fogRYB134P/xL9l4LXZEbAyk3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569013; c=relaxed/simple;
	bh=OovWyzlYvdgYRt+ee0Bqn71sDJ7mgK2dTimdxndpHxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aD1EyeLGItmp712h7gLarlFL9zx/Lxp2MK+tMSSrOSzZv++id+vCfFmsOAYBE+O2ur9lbVu2/5lD0bnsyeY8pTOQvAc5PiSDQvLOw1zeSQCI7xZK1myqfjKOlyBorrkxt1qnYZQTxB6uvoyi236gKPEHb/fHFZfMvQwZl4xqxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8DTJQIl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8DTJQIl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0920C2BCB8;
	Thu,  4 Jun 2026 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780569012;
	bh=OovWyzlYvdgYRt+ee0Bqn71sDJ7mgK2dTimdxndpHxE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O8DTJQIliC9PLRuh+8UR0/sHph7t/5Fb4zvM2D4rvnpGemtlid6YYuzpAiWh/37f0
	 5nsKe8B8Q+TtIwRHdUtwELJujGniqkwg6PPe908QXMKSMbUBbPE588MpTOYEP+j3sd
	 Mkt5F6x9IR4nw0qGiZ5bnZI5jRU9+TPCYF+nh72l5DQYjhna8ppfMZqFkW2+3GykCW
	 8u51vXvBZ+ajlEzIQMui+WejYIkJV+4XySuiNnkv9w8o6R0nJ/ASCtANGcQ6qckFjj
	 h/iTWko9/oITeWj8MdbykRaUR8V8ep+nNjkWJsX12tX9Ky/Pq/y90UFDCEGTPocr0O
	 o/8asmM5XJJlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DC6CD6E6B;
	Thu,  4 Jun 2026 10:30:12 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Thu, 04 Jun 2026 18:30:10 +0800
Subject: [PATCH v3] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dw5826e-option-driver-v3-1-413a2af11eee@compal.com>
X-B4-Tracking: v=1; b=H4sIALFTIWoC/4WNwQ7CIBAFf6XhLAaoYOvJ/zAegC4Wo4VARU3Tf
 xfqRQ/G02aS2XkTihAsRLSrJhQg2WjdkKFeVUj3cjgBtl1mxAgTRBCKuztvmADs/JhV3AWbIGB
 oldSkboApjvKvD2DsY+kejm+ON3UGPZZYMXobRxeey3Cixfu3kSimGIgkcsu0Aar22l29vKzzQ
 WUksc/M5leG5QzJQmsEN1zCV2ae5xecQIF1FAEAAA==
X-Change-ID: 20260601-dw5826e-option-driver-e9bac038e2b5
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jack Wu <jackbb_wu@compal.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780569011; l=3732;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=yqMnz7bupA1tjFKERJw+7zlC3k49WdIKuJIy3QiQMZA=;
 b=w7wI5k8SE6CqWMEy1s+/1J0HKp+Ifz4QFanNmlNFpxzDgH6pRpFsIRwpteznm03Aep+pmudDg
 HIyqUwLzznVBy4nx7/cEacbU76G+Fch6aj9t2LaagsSgn90GJ0TC99C
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com

From: Jack Wu <jackbb_wu@compal.com>

Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea

T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 15 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=81ea Rev= 5.04
S:  Manufacturer=DELL
S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=358988870177734
C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
- Link to v1: https://patch.msgid.link/20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com

To: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
- Link to v2: https://patch.msgid.link/20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com

To: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
v3:
 - Blacklist interface #4 (ADB) using RSVD(4)
 - Change DELL_PRODUCT_DW5826E_ESIM to DELL_PRODUCT_5826E_ESIM
v2:
 - Blacklist interface #1 (ADB) using RSVD(1)
---
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 48ae0188f2e9..541c4e26c45f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
 #define DELL_PRODUCT_5829E_ESIM			0x81e4
 #define DELL_PRODUCT_5829E			0x81e6
 
+#define DELL_PRODUCT_5826E_ESIM		0x81ea
+
 #define DELL_PRODUCT_FM101R_ESIM		0x8213
 #define DELL_PRODUCT_FM101R			0x8215
 
@@ -1125,6 +1127,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
+	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_5826E_ESIM, 0xff),
+	  .driver_info = RSVD(1) | RSVD(4) },
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-dw5826e-option-driver-e9bac038e2b5

Best regards,
--  
Jack Wu <jackbb_wu@compal.com>


