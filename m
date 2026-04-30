Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9737703A
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531390; cv=none; b=nRQr3xRcT24xdud62yu7pBOEgUigqOX+Grt+RRAFg39zoFzlS3LsahNq+BssMqL/8JczX5D1XCCvf3EQPVz+4yghoQm1sWVj9A74oXdgj9n5Ru+vYWKinqGUetDLL0ZiJu3bXd5mbREF6000XEUVs5u71NlJYI30ve6shzOASrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531390; c=relaxed/simple;
	bh=g7bKt7PhVSvTMoAP9wpSwuOvT89SCeDHcPkeESAJTys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eT5+BnzbDO03CGbECfKTv6dGorCuix+/wYATyF71/HGYn7i062wgLJZry1cQZcDQjyAXFcjvjDX3vzMOFXap4CcziUVPbZkgOmlVOR9n08p4dCJDPReGnbhBsE+lfUN8dF40hNs7ZzMeXdgpEDmZLRtXICJUT/zhakh2jzbNmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GX6ynWms; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GX6ynWms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777531360;
	bh=vBoqPwSEQuZYk/7JXo+z4RevebHs1hzAssmOmj90Cq4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GX6ynWmsJbf4TGBdpJig+t68rMPH0pLAw2d3akUcVPLsj8ksvqjgn9WD0kThuf5sr
	 ED3jJnvjh5kfeXjb8NLOHHIHIKsJr165JX+bx63aoAHs4LcJLYbFsoisJvWGQf20SF
	 jEU1/rxrrbZaJ6cr+uHEXEDm9U6k+LpZPwiWmECw=
X-QQ-mid: zesmtpip4t1777531345t14d1a13e
X-QQ-Originating-IP: MdEjlzEl+ZhogHH0C/ic+w17fH1HIeGSOC0AFo2TtDs=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 14:42:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13287847018310372430
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH 4/4] usb: xhci: clear USBSTS EINT only for interrupter 0
Date: Thu, 30 Apr 2026 14:42:22 +0800
Message-ID: <BC2C0FE6CE3B3341+20260430064222.1725498-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
References: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NEaes6yu2o+m4hl3AypsviVVEHJF5RoEHaP+5g+OAuYaTIy9rKXii41L
	omRbK0q1pZx4PRMhWbGJL5K3PWWHUYIhrhDwrb6VQ0OfLOhfl+W0NSAx5JrsdbTbQ3MvsN/
	kJ+oW+QWtVIUzrdWTSp5DzM3mAlAuOPq6DKe/+QfiZ8g14PbWmjbU9K+bcUO9dFBIj9XEE6
	Tcxs0vm0BicajNtQ3wx441W+3NCahScCiPjuxostI2k5aQVeLBczoS2iCGsIFM90jOH5mek
	WghGFtEziWqyZ0ST7u1yAWBli17fO5zGx78ujA2fP0Iarml0Syl4cTZ4345Jm0A4rIDOo4c
	4cwppc5OADy3njahh53Bw/HdOqyjFXrJgm3eIoNB923y0ijhgtmoFsTn5Ss/FrEHWdwYQYy
	IHbvRTKkzf61ncTQTTLVYijNJgOWGKkGRBdGft/SUdFitnDfusX22d5bg/3MRIWkLo1qESB
	i/aX9dLcfbueQNeKstvrdn8bXlNy8XPDLz9t0Ck+VbeUpeA8HYzw0tNz75XzUGHwKfEecCZ
	Gy9JdWmwyOPFVv7o+Qo8tLGARwQma1Ba3GHHR7+Z7KrXpd74x7A2fEMkqbW6tCm9+HLAEF/
	Ka12cMY07MMYppaLuRyHoyT08eFPq+AbF9g3BKoqZPXhueLoDzb/Fc0jOeGbX9yy2/0GCj6
	OM/YnAHNf86XC1ljN0XlIQdws6PJ0jJyd3tBEqzACq2YsYH/shpsMiO63SCPwbPA6IJ7K+v
	n08aWXpneJehk64TsAJDFe2zrNvqfb0TvGWjJM3L+MDVuxb4oIBaDxC2v9qzwtJ8F08zPPY
	j+I+CJ4cB3N2IpPC69J203EFEpXcciynWjfisnu0+5jtfT25visJ/bl8msWjRLB1+MlZi/5
	K1iuPym8mHf1hnWL7KGUrhWy5t56W/Plv3Zi84txew9twM70J3I8HCuh/cylIfO4GeQZEaf
	9Dj3Gp+sbltE1sLhPNfNDvoWTIdz+v96L7g1VwFFY1mVeVCrky27VVfMqmRhDPJ9Nqg7LlL
	uKPl6mfkt3mIHScmv70SeuJZcDI5QvTcN3ELxxU/dxdw6i4a1t
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

USBSTS.EINT is controller-wide, while IMAN.IP is tracked per
interrupter.

If primary interrupter 0 and secondary interrupter 1 both
have pending events, xHC can set USBSTS.EINT, IR0.IMAN.IP,
and IR1.IMAN.IP at the same time. If the secondary handler
clears USBSTS.EINT first, the primary handler can return
IRQ_NONE without servicing the primary event ring.

Limit the USBSTS.EINT test and clear to interrupter 0. Only
interrupter 0 has an IRQ today, so this does not change the
current primary interrupt path.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 63b97c393153..9aa5cd63febb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3188,7 +3188,7 @@ static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 		goto out;
 	}

-	if (!(status & STS_EINT)) {
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3209,8 +3209,10 @@ static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 	 * Clear the op reg interrupt status first,
 	 * so we can receive interrupts from other MSI-X interrupters.
 	 * USBSTS bits are write 1 to clear.
+	 * USBSTS.EINT is controller-wide, so only interrupter 0 clears it.
 	 */
-	writel(STS_EINT, &xhci->op_regs->status);
+	if (ir->intr_num == 0)
+		writel(STS_EINT, &xhci->op_regs->status);

 	xhci_handle_events(xhci, ir, false);
 out:
--
2.50.1

