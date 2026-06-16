Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4162423A72;
	Tue, 16 Jun 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603833; cv=none; b=Mu7I6C0Z+B64Kp9NigfnPlH58wrqEbIBH5n9cNZ3M+TuSkudNBUKfQ0WFKaUXom3K04MFZ/3x/7gB33y1oV1JI5eUHgMCvOmEgSiZ8docpWlGPIdnVuQZ4XJBSWZbrEqwtCtIANk91ZBp/5Agh5at5oonTHq7xDusULavERIpZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603833; c=relaxed/simple;
	bh=9bwReZnbt1A7Xunpsw3imp2UDj8t/iTGwaFyTkTwKbs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=OyBWGCLc6eKX+CXqlVA6N2AXf88xctHqi/DRAAURJGWOpS7LXLDQObFI00Vb6f6mcwwAimLyu17ZkHJ/jUBrYZ2rirqAQbFjwU2xphXQoxNNharxn3enunIeMwyPwbiL271+CVUZGIiW9Hdg6JZoQj6uHOI6l+o0efOOYFRZ/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IHFUHCpP; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IHFUHCpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=+IRkQrjrT5dTayI
	L4/WxwbX3iLRkY+PMnmFgJSkqlHU=; b=IHFUHCpPp48jMO6QeTp3Ltwc58C5eNn
	iN7Mjl/f51V0H2rmkFXtB+mx9O9zItEoNO3RYx9w9MZW2UoAKWGx/2xoF9UIF1zd
	RWGlcz7dQJUiwAmUp2jpBTTYjq4zJsnITz1wqhaIrVBVT+BFdgQFryVeCaQ1cMzZ
	2TGzljfkrGu8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wA3_5nYHTFqv+58Dw--.16014S2;
	Tue, 16 Jun 2026 17:56:42 +0800 (CST)
From: yangsizhe <18392868223@163.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangsizhe@meigsmart.com
Cc: yangsizhe <18392868223@163.com>
Subject: [PATCH] usb: serial: option: add multiple VID/PID
Date: Tue, 16 Jun 2026 17:56:31 +0800
Message-Id: <20260616095631.7424-1-18392868223@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wA3_5nYHTFqv+58Dw--.16014S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDWFW5GF4rAF15XryfXrb_yoW8AryDpF
	1rKryYvrZ3XFWfWr1xAFs7ZF95CanYkFyakw43Kw4agr4xJw4YgwnrArW3t34rGr45X3sF
	vwnYyrWUGr1rJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR6nmiUUUUU=
X-CM-SenderInfo: zpryjmasywmjist6il2tof0z/xtbC5hpkPGoxHdq+hAAA3C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Add the PID and VID to facilitate the binding of our company's module

Signed-off-by: yangsizhe <18392868223@163.com>
---
 drivers/usb/serial/option.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a34e79cfd5b6..e7025e0fa3b0 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2458,6 +2458,24 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
+	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
+	.driver_info = RSVD(4) | RSVD(5) },
+	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
+	.driver_info = RSVD(4) },
+	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
+	.driver_info = RSVD(0) },
+	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
+	.driver_info = RSVD(0) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
+	.driver_info = RSVD(0) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
+	.driver_info = RSVD(0) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
+	.driver_info = RSVD(0) },
+	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
+	.driver_info = RSVD(0) },
+	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
+	.driver_info = RSVD(5) },
 
 	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
-- 
2.17.1

