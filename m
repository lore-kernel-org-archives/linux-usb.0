Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46852367B86;
	Tue, 23 Jun 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208313; cv=none; b=hY+/7BT0yqDWQqsMmfFFvEwlj7fkHqHduDR2jD8slSYerKZxwAhE5nRk+Fmv3PP0pUVBNs/KfuJ/Vy13s47vRoTfhjCuQHVIEcma3KlAZWxNVzUBSxZOd3dijGquHwZLnA5eqW6TMdvvHyIrdpVsZrFVf2P0X1tqkn0Mw5x5Bw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208313; c=relaxed/simple;
	bh=Ca6qU6A0v55ZdRPA8JhByTvAtRcw672Iequ9HoE/WJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j6WHW2yL9475Ouoj3u46dHbT21KmT//1HoJH0Whr4Om19zGBap9lWXvCg29kl6D/3d4EOdEvvZkg57rY26au1fc2OPgFHEppHraThVyoruFmAHaTygL8z4rQSH4MXb8AYp9gz/U4LnBFHM9bWcCnmEqr2Zklm4A/fGXigCqgKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=4raKP6SR; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="4raKP6SR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=RoE4eYmRODk52hJ5kdokJ5YZUg9z6BkVJxmlt3joLIw=; b=4raKP6SRh7FdAR
	A8Vn1ZzI9T1R7C6/jvajIxBQddr1lZ36YbdbungleoPZUccIrbOCOBJLQbv0Hi1HqXu4pB9lriB48
	rKiuPZD7ABAab6tLALmpKTtrRNh403WHgPJkf+Pqp5jSqD7Xck3AlzA3w9GPeuhpOQCCjNIkJ4nPq
	ByW+B5fiWrtR0XMCYyfu65f/sqEwNlx/BaBxCHq7xlHloXWZaDxQ5EuhXF8ioMpl4AI5Sat7lxnwe
	aFtqFyzkIx/wGpt0CpU5+hpRqVWDx8E5H6WHXZLtrrIAcJU15uyp9Bo7urAiKBGRWF46XSUf+b6OR
	rCKxevTAXERcDvZLbmuw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbxnI-006iqL-PU; Tue, 23 Jun 2026 10:51:48 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbxnI-00000002w7i-21Zh;
	Tue, 23 Jun 2026 10:51:48 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()
Date: Tue, 23 Jun 2026 10:51:47 +0100
Message-Id: <20260623095147.700020-1-ben.dooks@codethink.co.uk>
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
index 517aa7f1486d..f5e60fb1a5cc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -789,9 +789,9 @@ static void dwc3_ulpi_setup(struct dwc3 *dwc)
 
 	if (dwc->enable_usb2_transceiver_delay) {
 		for (index = 0; index < dwc->num_usb2_ports; index++) {
-			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
+			reg = dwc3_readl(dwcs, DWC3_GUSB2PHYCFG(index));
 			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
-			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
 		}
 	}
 }
-- 
2.37.2.352.g3c44437643

