Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C4175A6E;
	Thu,  4 Jun 2026 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538684; cv=none; b=GAkwJVAGDcsliTXL1/CcK0E0666i9TuyQ8LRL8bPfpGDk8h9PckbgSsJprwVtRsPB2SY9OjjbrBSsqtaTfafGFYOiv0O+bDzhj//SdIZCcvMkGnkU9+fawUcGERg/S7UwTMO9M4Qnl4E+IcKEl1Ju4SzvUeer5kUR9XTwNlhElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538684; c=relaxed/simple;
	bh=BAf58TWjM+8QuRdW72gutPtu0VLuyCCG2AGq3RPZ4zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O457YW4cSMuf+O8izZf8rKMoFfW7TnGDzYJqK+hZv7mTHMxK3ejnYuaHYNPEBrc4HuOL325eRjpZP5dUD3JU2fDxGznkDN9fdK5QQDOZuchnoFXGA9+KB2CRdNvbCgpo25wsFdlnqsF8gl6JJ5DMFPdPGKET+JBq+CqjUFA2Zls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbyR1fn5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbyR1fn5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6573FC2BCB9;
	Thu,  4 Jun 2026 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780538684;
	bh=BAf58TWjM+8QuRdW72gutPtu0VLuyCCG2AGq3RPZ4zE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EbyR1fn5I6jz9LyWsW1O+a3Fpa9NgpO/NgR59Oo7utzOsVwJEhxwbqfMK1vGZzS3e
	 tziYvHB+rbhIQHhCUJldfju4DQ/EcnN9ec/VI6WvcXXF3OaeLybMgXoZlNh6oc8XXy
	 LgIaUXcEDLVUddl/LEawjvNBUcmfdxT1/kBKaZvEX7H0p1um8V1dTQpGh6SvnMv367
	 4US/vRTZCIdhXfj7BfAjWZoGsTIOLqeUOmxQpEfBHoSJQHYar0KC+PRO9sbkzEIcwc
	 7L0gXcTPb99tSmUQ35GkDPL6Ontzpj7WuCnmHqFT8xDNXPfVL9rG4rppOvK7k8pAXH
	 nfKvP5QTXfVCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603CBCD6E55;
	Thu,  4 Jun 2026 02:04:44 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Thu, 04 Jun 2026 10:04:40 +0800
Subject: [PATCH v2] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
X-B4-Tracking: v=1; b=H4sIADfdIGoC/4WNQQ6CMBBFr0Jm7Zi2BkRX3MOwaMsgY5Q2LVYN4
 e4WPICrn5e8//8MkQJThHMxQ6DEkd2YQe0KsIMer4TcZQYlVCUqIbF7lbWqCJ2fsopd4EQB6WS
 0FYealCkhd32gnt/b7qX9cXyaG9lpHVuNgePkwmc7TnL1/n0kiRJJaKGPyvYkTWPdw+v7Pge0y
 7J8AfdxCtbNAAAA
X-Change-ID: 20260601-dw5826e-option-driver-e9bac038e2b5
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jack Wu <jackbb_wu@compal.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780538683; l=3346;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=mNxktV602maJJ6fxarOy1fUXtCX74FRUuu0/VykdVZQ=;
 b=UQqPLU2E5ce/2vC3jhJs10G34jmKOAyPgBi2rjTJ/u7r9u2jysq1OKUjbHNbifdM8CsQ3kkrN
 q6/5LCMzqsgD2AXpXPjLTjb9j6AscOa+lKaNXcV/VAScCJdjZvWxo3/
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com

From: Jack Wu <jackbb_wu@compal.com>

Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea

T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
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
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
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
v2:
 - Blacklist interface #1 (ADB) using RSVD(1)
---
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 48ae0188f2e9..070e0c553d7a 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
 #define DELL_PRODUCT_5829E_ESIM			0x81e4
 #define DELL_PRODUCT_5829E			0x81e6
 
+#define DELL_PRODUCT_DW5826E_ESIM	0x81ea
+
 #define DELL_PRODUCT_FM101R_ESIM		0x8213
 #define DELL_PRODUCT_FM101R			0x8215
 
@@ -1125,6 +1127,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
+	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_DW5826E_ESIM, 0xff),
+	  .driver_info = RSVD(1) }
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-dw5826e-option-driver-e9bac038e2b5

Best regards,
--  
Jack Wu <jackbb_wu@compal.com>


