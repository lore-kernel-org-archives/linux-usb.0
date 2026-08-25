Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843819005E;
	Tue, 25 Aug 2026 03:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629318; cv=none; b=XKnq05n2PxJGBd0/qL/h3P+zCjvZLttd/CzZNW4jDi3fGxOzBUOO8ftRFQvVM59fY0kN4lhr0EMQQTpbkfwmuk34jo2b2JFBmGStOc6cOu/E6xOFbQygZB2QWP1BPkYkKIdKiE5jmx1X7QIZL7lKlH+BVQe6WkjSkIWEUL2PHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629318; c=relaxed/simple;
	bh=lvNcprgtoEyFvkvtsEk6zMAcxEcLXH+Cxv0yPL0JFo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urhKp/xyZI1RKsbPI+YFFSPycIXQVvY8N6EDVxcgKO564Imj1A80bsJHUAojYOkIqc+ffCW1D1PszqpbOJpO40ocONRZhYoBiLz7C5L5vEAUWEqP7nzTc4Op4otk8hwAyOer9uX/wG2KELK42rpnuDqKvF1pbbBhuJ2NzN95o50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edatec.cn; spf=pass smtp.mailfrom=edatec.cn; arc=none smtp.client-ip=115.124.28.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edatec.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edatec.cn
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1008376|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0131748-0.00323387-0.983591;FP=4178284299310312108|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037031241;MF=zjzhao@edatec.cn;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.iwTm3Io_1787628984;
Received: from LAPTOP-VQRD5F43.hs.edatec.cn(mailfrom:zjzhao@edatec.cn fp:SMTPD_---.iwTm3Io_1787628984 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 25 Aug 2026 11:36:25 +0800
From: zjzhao@edatec.cn
To: linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	zjzhao-eda <zjzhao@edatec.cn>
Subject: [PATCH] usbip: host: ignore number_of_packets for non-isoc URBs
Date: Tue, 25 Aug 2026 11:36:23 +0800
Message-ID: <20260825033623.332537-1-zjzhao@edatec.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zjzhao-eda <zjzhao@edatec.cn>

number_of_packets is only meaningful for isochronous URBs.  The USB/IP
stub currently copies the value from the CMD_SUBMIT PDU into the local
URB verbatim for all endpoint types.

Some clients (e.g. usbip-win) leave number_of_packets uninitialized for
non-isoc URBs, so a garbage/huge value reaches usb_submit_urb().  Host
controllers that size per-URB allocations by this field (e.g. dwc2's
dwc2_hcd_urb_alloc(), which always sizes the iso descriptor array by
urb->number_of_packets) then attempt a multi-gigabyte allocation that
fails with -ENOMEM, making usbip-host reset the device in an endless
loop (older dwc_otg crashes outright instead).

Sanitize number_of_packets to 0 for non-isochronous endpoints in the
stub.  This is a strict no-op for well-behaved clients (Linux vhci
already sends 0 for non-isoc URBs) and fixes the dwc2/dwc_otg failures.

Signed-off-by: zjzhao-eda <zjzhao@edatec.cn>
---
 drivers/usb/usbip/stub_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d..ec9ecbf432f5 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -481,6 +481,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 
 	if (pipe == -1)
 		return;
+	if (!usb_pipeisoc(pipe))
+		pdu->u.cmd_submit.number_of_packets = 0;
 
 	/*
 	 * Smatch reported the error case where use_sg is true and buf_len is 0.
-- 
2.43.0

