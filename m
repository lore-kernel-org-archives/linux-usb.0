Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83023BD05;
	Thu, 18 Jun 2026 01:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747392; cv=none; b=Pm1Le6fLqPnvHGShIlqTEnSMwlt1fYsfkmlnnHLkyH+QSYLEkKblB/uvmUyJpr4ZMqpSJiIAJlpTCAJYD8i7iMdT6dKwI+VbRGhhnyFZrVOlW19n8fiInjE+3awbVtk/HoHnuSQGgBk3CdUG4UwYDMKShRW+AryidPcKEbLsUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747392; c=relaxed/simple;
	bh=iDBWGl90AtxrYFFDxYuCHf2caEyIsLL1KDcMwPUipgE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PAdXcxXFXnXCsR8CgnUAVlN6xdvWoMnQ/iNc7Ks3ZzLuplqxTU62tv0m7H4W1jJQmXgdhZDSN50DU/21Gs9lW2VDGLjz9QstTzZ7himDX+Q2VelD55qZkLRwM9b2wcVcJ2z2IjfSTrtOqhvMpaCFHFw2tWRuDG8zT5/aZlLS+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AGcE4QTb; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AGcE4QTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=1gDclstGlZXC0L5
	RluzmQDzcBHifAHzHZtlDSW7rskc=; b=AGcE4QTbfgyhETSzLpgcSSWyKFykTKZ
	DOKbZPOYLNtjdUyEeT/+A0euGTVIuEtaTMLph9nY/tIYmM2fXvd1rHYsBUoVgYs9
	3yLwBs+wBVMRmOTN+JMabB8QB3iDdsDx/g70+OGKgX01X3UER4p0i21CV/NbUISA
	k3RA1qS2/nRk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDX9guhTjNqsKJ3EQ--.1079S2;
	Thu, 18 Jun 2026 09:49:22 +0800 (CST)
From: yangsizhe <18392868223@163.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yangsizhe <18392868223@163.com>
Subject: [PATCH] usb: serial: option: add multiple VID/PID
Date: Thu, 18 Jun 2026 09:49:17 +0800
Message-Id: <20260618014917.11383-1-18392868223@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDX9guhTjNqsKJ3EQ--.1079S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17XFyDZFyUXrWUuF1DGFg_yoW8AFyrpF
	1rKryYvrZ3XFWfWr1xAFs7ZF95CanYkFyakw43Kw4agr4xJw4YgwnrArW3t34rGr45X3sF
	vwnYyrWUGrn5JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRdwIgUUUUU=
X-CM-SenderInfo: zpryjmasywmjist6il2tof0z/xtbDAgIj+mozTqJ8vAAA3s
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Add the PID and VID to facilitate the binding of our company's module

Real name:MeiG Smart Technology Co., Ltd

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

