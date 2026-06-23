Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658336BCDA;
	Tue, 23 Jun 2026 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209288; cv=none; b=RQ73YPVU7n56ZRQs2PsC6YoFdknNgYxrTNsjIVbnbP3r5lSqk9UOLuy+wu2FpJ9QzHfr6vCEHc4R2EYbcERpBmc6hr5o7fZmIMZCANm6IYfbcqUaaAUnwuUdzBkVdtyvoESqQUTt/IrFoPFDvjhwqSvbYp3L5gG3tHWyJzfahd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209288; c=relaxed/simple;
	bh=bNua8x80WHSrDFr2xFpLShyUXru9Ye8dINeAfAQoNEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MIMoLeyRLKC3qXU30RwQ3r0o83BVJ9wP28KO9s5znt1qyWA7GOXuJEaEYY5rYPQyQUngX9UmG91TAGyS+kpn7mTZrhT9L2LRYTZNJUTPV5aEc6pg7132DWQhCEfblJs50Zkujh9CxUPx8tcBMUysb9PENMt8eu2hhdAhUI8imzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=IXhVhT6w; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="IXhVhT6w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=rcER2SdUsbe3hZHt9muczEDckAVPeDX1rf049yeCYng=; b=IXhVhT6w5u+mKn
	bFQTw2CzEVqrqQoWCuxqBeJn/SkdFbi2N/JPzkDTFitZx5dxTird44pV8DaWgQjl8wf8r/ZlEgpbQ
	LYPVB5K44ymAuzNj2Nj8EL1LesCk1YzqkwntKxML7DbRXKYEJDjfqOlaeJtIeTXDivnrzGz1e0agV
	goslCdusm0zMMcVF4QTHXN0N7XOLVqqmzmDEf0bOXLxPTcBxQe+2LUt2LZSsMYTpvbGlRpPHkNtAv
	0NyqGJ6V2ejyUdDmyY/AG2/qtVy6jfHx/9g5Pb3xXXvpmOIiSRpssylbPuMogeg733Ad1rOAKlyCX
	s1IeLGbe/El53JqhxpYw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby30-006m3A-Pr; Tue, 23 Jun 2026 11:08:02 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wby30-0000000367m-2N55;
	Tue, 23 Jun 2026 11:08:02 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()
Date: Tue, 23 Jun 2026 11:08:01 +0100
Message-Id: <20260623100801.738517-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The dwc3_ulpi_setup() calls the register read and write calls with
dwc3->regs when both these calls take the dwc3 structure directly.

Chnage these two calls to fix the following sparse warning, and
possibly a nasty bug in the dwc3_ulpi_setup() code:

drivers/usb/dwc3/core.c:796:45: warning: incorrect type in argument 1 (different address spaces)
drivers/usb/dwc3/core.c:796:45:    expected struct dwc3 *dwc
drivers/usb/dwc3/core.c:796:45:    got void [noderef] __iomem *regs
drivers/usb/dwc3/core.c:798:40: warning: incorrect type in argument 1 (different address spaces)
drivers/usb/dwc3/core.c:798:40:    expected struct dwc3 *dwc
drivers/usb/dwc3/core.c:798:40:    got void [noderef] __iomem *regs

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..ceb49f2f8004 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -789,9 +789,9 @@ static void dwc3_ulpi_setup(struct dwc3 *dwc)
 
 	if (dwc->enable_usb2_transceiver_delay) {
 		for (index = 0; index < dwc->num_usb2_ports; index++) {
-			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
+			reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(index));
 			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
-			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
 		}
 	}
 }
-- 
2.37.2.352.g3c44437643

