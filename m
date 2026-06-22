Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DD39E6C6;
	Mon, 22 Jun 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122936; cv=none; b=K4S0HOMZKzMl2B+he+5uFH1ct9/2qkpmfF+3gDOdoo1Sd6FgE2eKbt6y14WsgJfCDgoolG09fWoEytI44W8sW+HPk0Jliu9kxQTv5y+dlylJDU2qjrR0sPDS2Cks+6Q8daAwROuxVjMgKu6S8ECQy1Lt7StKrSYzKFfaqVYk4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122936; c=relaxed/simple;
	bh=lDZVfttKuYkbnwwk4z6/FZ7fyeKeCXh8yBiGF1xTCOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQtRedTxC8OzCWY/W2YqUgzEiqNOcp2zGPcBwzP9nBQ6do05MXGWO200tzjruKWacB/DuZ2T1b6MQyqkMvHsE/LVeJyYlC1Ie4dad+TCSl+FSzddfMKOCIW+cPBvfPwV6QxcP/1fc4CHHCLLX8+kLEa4VaQoNZqxStPDIz9hE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nodh2rDX; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nodh2rDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782122903;
	bh=i70+xIL/DtBiw+dF2oEozBVlvC+ogvh1ECzwhRdiBFs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nodh2rDXPhXgpHC4cKlupDUIWJn9CFQ/dNCRPXofBVe4YYD9HK/ovcQ3tgICr/7F5
	 BbO7HUGa6V4WPA//l2d3gb2sVvtcZ7qvAtmU6f8fTmuLKGazPJ5Zqatr1ekU+uwljz
	 e9mbKTC1s7+1f314DnwpWeG2RaEw94/cn8YHeqqM=
X-QQ-mid: esmtpgz10t1782122886tc1481bd8
X-QQ-Originating-IP: fkyFuLvxTHcD2o4SaaebJWxVYnqe3VDF4m6rF41e7Gc=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Jun 2026 18:08:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3257998836231342700
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usbip: tools: support SuperSpeed Plus devices
Date: Mon, 22 Jun 2026 18:08:02 +0800
Message-ID: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NvjhxCSDgXICZuUYhqeWsHmQGrKcNwVP++/xpElNsbISaaBqppQF0zE2
	SqFsnARLOdZ+m3ALPFtrn8ObASNt8pcQTfyTRwaC9YaE+bbltXvVyfEW172qOZWRLgJPIOg
	+bUDjEr6cH01RcZ75bguFCO04+u7dhbtyHZ3jVme9x/tymrBDramzzdIyFdk+aHEgfBFoCt
	9ruaBdKwC3TSLbWQceRtCoNJ2MnPeNQGcxz7qOwvAcjEvwHl/nzRzHqvN1RexWPeBw2QBj0
	rl3srqevSIDCBO1naACiZaUEe1Pwepos93Xi3oY3VtLcAlwwLc0eI7Teytn3R7jrp022JJu
	iv5cA3b7sqQtF9tOapfi4NdRj2GVTFoAFM7xz6azo9pRrz0dUQGw25y6P2nLK7j246nwQ5k
	0UkRffo6EJ5IV/LrHz80C37r0kQAcR6k1aPWLlyZ6P/pA2Tz7zycs16c1yVn48wpqRbpo7f
	iYpW7ipnv9DoZ1RDFqBAcBETN9AoSrnQm1ePTa9eSse38f50ODjLXWiTBppdi4aT2wSEt6e
	/VhMnFoEgb39a+WGJBrcbyDkQ/WXwRGppI5M+cTo0JEVlW3IcSWWaDTXgVFjLgrz8/dPSpe
	0Kh+pfFeOpfLZyyblPDr/sGADu/E7fgJlEFXJfnMtUnZuw1ijXHPPOe6GAISlbCesUWoakC
	+1EDZSiHmXVXpNL8DU9vERSHCQimH+IvEpIeNTr8FTmdiebr+7YhwrT0lNWO5rgCT79f12x
	0HOwaEAP07tTXrhBjwoGlvGR9V7bRoZself/+ijb3KWJ++SaHBflfkidzu3NJiMm8OUjHcM
	o7DDgmUkBs3Q06hlVU8kE3ohVXPufss7iLMPmGTauiV0oHKVrgrTbz2u48BUa2IpKjsEoUH
	gcL7tp2JJI+aR9MLk6Yr4ylAoiwsnLGUDIT4/Jc8XJ7YUOQ9DiJdwNiHOf1yJ2/YRg7S+5l
	suw968b44safatLn5aejgWtjRBjlBcwOIaW3iIDFu2STUGV2elZ4qm1yiA8JEQjqnyteJXP
	UnA3T/2N09UynM0ZJTmPLjW9Ux7sVuNnrUkMTnnbq6uQB67U5QOscJreYNGFw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

USB/IP reads a remote device's speed from the server-side sysfs
"speed" attribute. read_attr_speed() converts the string to
enum usb_device_speed before the value is sent to the client.

The conversion table only recognizes 5000 Mbps. Devices reporting
10000 or 20000 Mbps are therefore sent as USB_SPEED_UNKNOWN. The
client then selects a USB 2.0 VHCI port, and the kernel rejects the
attach request because USB_SPEED_UNKNOWN is not a supported speed.

Map both SuperSpeed Plus sysfs values to USB_SPEED_SUPER_PLUS and
select the SuperSpeed VHCI hub for that speed.

The issue was reproduced with the following server hardware:

  xHCI controller: Intel 8086:a0ed, revision 20
  Subsystem:       Lenovo 17aa:382a
  USB device:      Silicon Motion 090c:2320 mass storage
  sysfs speed:     10000 Mbps

Before the change:

  $ usbip attach -r 10.20.12.170 -b 2-2
  usbip: error: import device

After the change, the device attaches and uses usb-storage:

  $ usbip port
  Port 08: <Port in Use> at Super Speed(5000Mbps)
    8-1 -> usbip://10.20.12.170:3240/2-2

VHCI currently exposes the imported device as SuperSpeed, so the
client reports 5000 Mbps instead of 10000 Mbps. This is a separate
speed-reporting limitation and does not prevent attachment or I/O.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 tools/usb/usbip/libsrc/usbip_common.c | 2 ++
 tools/usb/usbip/libsrc/vhci_driver.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
index b8d7d480595a..d91872a425f5 100644
--- a/tools/usb/usbip/libsrc/usbip_common.c
+++ b/tools/usb/usbip/libsrc/usbip_common.c
@@ -29,6 +29,8 @@ static const struct speed_string speed_strings[] = {
 	{ USB_SPEED_HIGH, "480", "High Speed(480Mbps)" },
 	{ USB_SPEED_WIRELESS, "53.3-480", "Wireless"},
 	{ USB_SPEED_SUPER, "5000", "Super Speed(5000Mbps)" },
+	{ USB_SPEED_SUPER_PLUS, "10000", "SuperSpeed Plus" },
+	{ USB_SPEED_SUPER_PLUS, "20000", "SuperSpeed Plus" },
 	{ 0, NULL, NULL }
 };

diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
index 8159fd98680b..4ca3783ee5b7 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.c
+++ b/tools/usb/usbip/libsrc/vhci_driver.c
@@ -338,6 +338,7 @@ int usbip_vhci_get_free_port(uint32_t speed)

 		switch (speed) {
 		case	USB_SPEED_SUPER:
+		case	USB_SPEED_SUPER_PLUS:
 			if (vhci_driver->idev[i].hub != HUB_SPEED_SUPER)
 				continue;
 		break;
--
2.50.1

