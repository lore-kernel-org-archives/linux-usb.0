Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3345E3C553A;
	Thu,  2 Jul 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979944; cv=none; b=mSlmBMfVLcwto2Np1X/6T4VrjILX/MszIWuQT3jROeIay8JX2CZ5Bl3oScZtNzXyIMx0aWdh/rkgkknSWLqSCFR9Ye1PZ6k0eKgiQeaTnpBzqMPUD0reVDPIr5AeYTa78BIczdIMV7w5oaTz7kPpZYXv/FAynkSAst7nSwm94w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979944; c=relaxed/simple;
	bh=OuLkAgOzVWZLoUYy+KnwcF0bGcfTpUErJJ6son8H9WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gw5txn91Yn4KC//goHcOqik1CLV1Kfzi8ZsWqLlkKeCUhIO1IZ6qB38kd5RZSqsNzHA9HIfpMCZfOO2LJz38x1w0wVkYpAJDQhvO22WGA3qrmlkIP5M5HdZ8+0blOAAPzIEZoT+ZKcBicTpAyBy5bqKU6zeyaHoX58CM3MyVHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WVFTJjjD; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WVFTJjjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782979886;
	bh=D66KTDqRrEGQaiKaSjnamB/sPOV9UiWIVTIl13FpVDI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WVFTJjjDv14YKGf/pbhOaOnUdamRVCwvLqzZI2EmnWM+RPRWauVlojTPM0U0ATZZd
	 OC90u/XZgbZ3ki3u88fw9Ta3Wt0LS39mhZZ2UFPciM3PJqqWve1fzzyIe2qzaOAqag
	 yjNGn+LbghrNde+2sa3Al0j9QSM8Pa8n+8bsE3B0=
X-QQ-mid: esmtpsz20t1782979868t1106f6e3
X-QQ-Originating-IP: Vkzq96dRXC8e9VRsyCtB5Y3LHLZlo0tYB8EwwxnQevM=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 16:11:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 360777937052031360
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com,
	michal.pecio@gmail.com,
	johannes.bruederl@gmail.com,
	kees@kernel.org,
	dengjie03@kylinos.cn,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [RESEND PATCH] usb: core: config: fix SS companion log for interrupt endpoints
Date: Thu,  2 Jul 2026 16:11:04 +0800
Message-ID: <E4E3CED70BF44FF8+20260702081104.2476004-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NrJHW3hvBPkCqRXkG1WFzJwuwlK5JY0r48hQeEUvBbIqNgA826q981gt
	AVv5LcBQWGnMzJ1hc5ZNOcYf3cYHxjPUM6fPOECW7fAWD3d+Ge6diq6/a2kQpXylJCkDEgX
	s5WnB+Vm1BCi7w+kvHVTVEB9yTZQUNaSrNkv2IYQ1Oa6AgfrBDXyKfZkM1ATSY3k9yHkl1A
	V1FgFAeIqVJcO+EDU12rNajTgDjm5lNji6bFdRrI4n5xj7UXr7NtLgEUYPbViN3o8ZN8u3u
	noOUJN3Mo2ZOxLianWQGy9iIxkeVJGFTd3lfG28ItGNEAxHnP6ThbQbHnE2gQyxeWxOmajV
	AnF4Id4g1s4bwRQfAA1DCmjD2fOZO6OSYfyj/Zhk079EYM7ckRBwriVslYwaprWWePm+NG4
	hUqNB4HX+f0rRSYcIiUwnbxoYMO8adh3V0Vp5E3xPGeUBmlML1CP/v1y+eUy3R+XMplPejW
	k7hB8aobuUQg1n4BMpWW8+J9RVbe54ErIeE23gM6QyO6gp6sW0cdxc80kgET3kBU6jRed8R
	kVPeJRXpbUPAHljdGrCJLeszZTKOijNiQt7BNMkInn9RyByn0Y/ZMg/E+J1feNcMBogL16q
	+WHSNpn7GvUaVDlFy1f0aCECR4U9KSvVvv3TXL7GFj3g2npsBZxtoBdgPx2NQnaMGA+GaFm
	zwLzPMl8yT2Cn9wkmoLErvwPTEK7k1akrNqiTk4C74WFNXgA7XFFAuxaGWOHOxx10P7VxMU
	Ny02ziuYhjCqBc/fOnE/Z9A2JsajoehdGZr8v60bJ3LFDhw/VNVvZzHSt5qo6aXYczZZVhr
	lZThO4zNluYWDbYYdql8tH+N4mLreu/Px9e1kbPmCP/BQdLGFJHDhsPkhnhvTKxlRW/0bi1
	ALwCxngK4rMEBDBj6zAiqrhNqWqouzKtJXFw8Eku72AasToIUv0SHo2395ZbjGYy+Xkowop
	tx+n4S5OUmI86M+kULCg02qTUEX6vrbSIiOiQz3A+5kM1cTeABo1QfjgVcClee2hXyA2Ozw
	Ax4YBoy5ctPnPy2CV3jHPBN7Q1DbkbOetZfQPwTOj7soQ3tdE6
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

usb_parse_ss_endpoint_companion() clears bmAttributes when it is
non-zero for control or interrupt endpoints.

The diagnostic message reports Control for control endpoints and Bulk
for the other branch. However, the other branch can only be an
interrupt endpoint because bulk endpoints are handled by the following
else-if branch.

Report the endpoint type as Interrupt instead of Bulk to avoid
misleading descriptor diagnostics.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..cd3231d21090 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -151,7 +151,7 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 			usb_endpoint_xfer_int(&ep->desc)) &&
 				desc->bmAttributes != 0) {
 		dev_notice(ddev, "%s endpoint with bmAttributes = %d in config %d interface %d altsetting %d ep 0x%X: setting to zero\n",
-				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Bulk",
+				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Interrupt",
 				desc->bmAttributes,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 0;
--
2.50.1

