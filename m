Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB53FBA7;
	Tue, 23 Jun 2026 02:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782182485; cv=none; b=K0BZ49lC3oedIfq6dyn9rkJgcMY2wnWbtzrxDD/dh28YwEuIApKTNRsBj1WvBW5lEiirsGr7c9Q4arO0zm17q1lx6hj2vY9sVTqNd84wEyx/sMlzQHFSjT58J2Nwp89H7GgzJCN+Z0KlyXFoLF81kCPjwrmzFjQpCJ75IzEjvM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782182485; c=relaxed/simple;
	bh=LxjaS0wNrigGbwspXJcP2PnjKlI9bn/qbU2Ii7CRxOg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MTD1N1haZNqcSAMadDsQ0uWCSXXuYXXvVPLYXPjLZmE0F3ZgCsOPZ9fv57dnw/LRQJ1tJ8ICIvIJ8WZ16x+KGNs79bGNxCFsv5Vihmja4YoB3ReTDANr8LHv5Si+Z5Zx2FC1iIiGE6IQ1GeFv/onQ34gFTsSedZwkF/X76PUul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o+oIF7tA; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o+oIF7tA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=qWdrIUwbeyIlPra
	kwEFPDZA3TxT0GpnsJNd4Z0A9qic=; b=o+oIF7tAFRXG4EUgxX8FfoSDVyBt2Ct
	uzEWcXHFOsR9o+6c6szUoNSesBdruRiICXmVAL0zryt9klBB6ZBmibmC7duzyQhz
	dWBPp02xElzYXlzsj8SOg2ztlGOo5ezohXXmTNCmxJ7WXQVrmsWqtlMbY9mRurPg
	woL73tGAlRA4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3fw4+8jlq4NWWDw--.6654S2;
	Tue, 23 Jun 2026 10:41:03 +0800 (CST)
From: yangsizhe <18392868223@163.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangsizhe@meigsmart.com
Cc: yangsizhe <18392868223@163.com>
Subject: [PATCH v3] usb: serial: option: add multiple VID/PID
Date: Tue, 23 Jun 2026 10:41:08 +0800
Message-Id: <20260623024108.2400-1-18392868223@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:PigvCgD3fw4+8jlq4NWWDw--.6654S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17XFyDZF45CF4DXw1fWFg_yoW8Zw1UpF
	18KryY9rZ3XayfWr4fJF4vvF95CanYkryakw43Gw4agr4xJw4Y934ayry3tw1rGr45X3sF
	vasYyrWUGr1rJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRvzuXUUUUU=
X-CM-SenderInfo: zpryjmasywmjist6il2tof0z/xtbDAR+0jGo58j9bswAA3Q
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Add the PID and VID to facilitate the binding of our company's module

Real name:MeiG Smart Technology Co., Ltd

Signed-off-by: yangsizhe <18392868223@163.com>

---

Changes from v2:
1. Adjust reserved interface mask, avoid conflicts with the RNDIS driver.

Changes from v1:
1. Add Real name into commit changelog description for device identification.
---
 drivers/usb/serial/option.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a34e79cfd5b6..580e2a621d18 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2458,6 +2458,24 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
+	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
+	.driver_info = RSVD(4) | RSVD(5) | RDVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
+	.driver_info = RSVD(4) },
+	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
+	.driver_info = RSVD(5) },
 
 	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
-- 
2.17.1

