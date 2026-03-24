Received: from zebra.wilibox.com (zebra.wilibox.com [62.77.155.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A638318EDF;
	Tue, 24 Mar 2026 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.77.155.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350531; cv=none; b=TQ1b7Z4iPpqVf5lIQf+r8ZV3+mCMMQe4foSeGM2O/Ap3wFcE0cGq8Tn9aGK5mkSTpnTusdI2wV4dhUdUCTNK3iEwFePA2koKnWQBqYuPKNUJTL7WjAmWcwTsrBJbdCjuX1QjbQpQUv73JaagSXf7zy8RAb55snVsYVOjiOLMHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350531; c=relaxed/simple;
	bh=ymDDcUWqCDL+dQWZGFAk2hWRU2rBH2uLgJDe7dAJY4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F04apt+/bUqpI1koYHPR36Pt4nsIUx2h6iIrWanIuNmaUqjLFner3H8UOhgHqqnv9XEvmr8sn0wtpvdyLTaHF/QlUrtG+MuDgAdBwmwyRF700XYih9lOoCThno2KuNTXEIto0zAmJ7kw/3boyEVvsP8YW2JFIDEseeEfT0J0EFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iconn-networks.com; spf=pass smtp.mailfrom=iconn-networks.com; dkim=pass (2048-bit key) header.d=iconn-networks.com header.i=@iconn-networks.com header.b=W0zDpcuc; arc=none smtp.client-ip=62.77.155.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iconn-networks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iconn-networks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iconn-networks.com header.i=@iconn-networks.com header.b="W0zDpcuc"
Received: from debian (unknown [81.7.79.211])
	(Authenticated sender: ernestas.k@iconn-networks.com)
	by zebra.wilibox.com (Postfix) with ESMTPSA id C9BE1173643;
	Tue, 24 Mar 2026 13:08:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iconn-networks.com;
	s=default; t=1774350526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqD98U35N4SigI8+FGazdZl8JLGxqVSdvyMhBqPpICg=;
	b=W0zDpcucWHmYPOWeQmtia+Kf28XdGY2LKy5+aO/REbYG8k0Ea+V5TvXLklcVIpIQDbg/fu
	8zL++2vkyhqb4hyB4YfuA9s7w6+hcF/UIp9yPFNxSwSEwI9k5IkapNR84A843BMxz/I0gf
	zKMtPqSrpkflRhsM8wdriWVXk9s6/zIfnSLe/G2GWDqVdgFr+L28D6tTDA5BhMnxGyhuoi
	7YIPIhvq7lFvMlW10egq/rlzlA+EL3XhxDhYYY/jQyURJlSpFAICXxiuDZZq5gqBaJeWbu
	TCO+xSnFHlRB4yYEZexcd9tkfRIX042YhPI2/KHI7RNXREBMPfo+3dDFoQVHkQ==
Authentication-Results: zebra.wilibox.com;
	auth=pass smtp.auth=ernestas.k@iconn-networks.com smtp.mailfrom=ernestas.k@iconn-networks.com
From: Ernestas Kulik <ernestas.k@iconn-networks.com>
To: johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernestas Kulik <ernestas.k@iconn-networks.com>
Subject: [PATCH v2] USB: serial: option: Add MeiG Smart SRM825WN
Date: Tue, 24 Mar 2026 13:07:16 +0200
Message-ID: <20260324110716.970023-1-ernestas.k@iconn-networks.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
References: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for the SDX62-based MeiG Smart SRM825WN module.

If#= 0: RNDIS
If#= 1: RNDIS
If#= 2: Diag
If#= 3: AT
If#= 4: AT
If#= 5: NMEA

T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#= 19 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2dee ProdID=4d38 Rev= 5.04
S:  Manufacturer=MEIG
S:  Product=LTE-A Module
S:  SerialNumber=da47a175
C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
I:* If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

v2: Use SRM825WN instead of SRT853, which is based on it.

Signed-off-by: Ernestas Kulik <ernestas.k@iconn-networks.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e349ed66d2ac..a578d6f07d55 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2439,10 +2439,13 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x02) },	/* MeiG Smart SLM828 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x03) },	/* MeiG Smart SLM828 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM815 and SRM825L */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825L */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825L */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM825WN (Diag) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825WN (AT) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825WN (NMEA) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
 	{ USB_DEVICE(0x33f8, 0x0104),						/* Rolling RW101-GL (laptop RMNET) */
-- 
2.53.0

