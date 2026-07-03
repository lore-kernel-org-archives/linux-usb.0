Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8400C30566B;
	Fri,  3 Jul 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095649; cv=none; b=CzVnD3fIktOdqDY/VAtpk0IuWkgLVWBc9qaw7c+6aC+VTPFonpG66KKNTjA4PFo/FtburTrU+JbL1olsSIcuOG1HO6wZhBsd+nuwAmwFq5QIaLfUePsL16qsFpmaEhDsBfOfB12C/H4K7phluC88UecKOvHdf8Ze37xkKOxFT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095649; c=relaxed/simple;
	bh=5Ig7x9QjI4E0g0IAN+5+HQ1qq2uftffRoOtxlMzoGro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cLwq2khKdRpr7Kq/g8Y0IFPBTvnVdv1X8qekGSmACusqrDXKSdrkLMhKgqZAt1DfvuNh2OLVMGiSH9B1XcwI+XK32VYBZaA6dj4LTLFd+HjAZEZA4dJkXj8eWyzIc1p1Vz19/9lzbCTP4W8wRIkABH/xwJdTfvLUoTOi7Ue4yMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=4UaWB/Qa; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="4UaWB/Qa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=FqqNgpG8o9iNHH/2qyTihbTjyulck/NgMRLDkQ1mc1Q=; b=4UaWB/Qa+Ba4Z4
	VZ8VUkK3s0tReK9UBLtTnbEh7ozRhMT7qlkn0VCCsEO6xF644BvIa/ludwA+1aEtJvuyx7K3J/vYW
	aTl6u95a9in4k54W8831jNFOF8uW9FlER5ln9IHVWp9BNAOXAP65kBS1BhnqwQgvaCtvtp9DKzSSe
	voYCBaERp6sF0kVzxuTxhW1HrpYW1Ce/jr18jXV3X5dwCYzclU9lozOGfEU2LFb/eSF5wjxJ2OxBI
	g7GnNBPwXN95EqQxqUUSCJ+Vhp12AD/YD8P9CyUpJr7I//p/SPohy+Lp3qbEnl0VdOEvUD+N5vhIR
	nTjP6FML3I0aHMbkr9fw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wfgd1-00Af4t-3K; Fri, 03 Jul 2026 17:20:35 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wfgd0-0000000BwnE-3OUy;
	Fri, 03 Jul 2026 17:20:34 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	stable@kernel.org
Subject: [PATCH v3] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()
Date: Fri,  3 Jul 2026 17:20:33 +0100
Message-Id: <20260703162033.2847599-1-ben.dooks@codethink.co.uk>
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

Cc: stable@kernel.org
Fixes: 9accc68b1cf0 ("usb: dwc3: Add dwc pointer to dwc3_readl/writel")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  add fixes and cc to stable
v3:
  fixed the fixes: tag to point to correct commit
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

