Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AE438237D;
	Mon, 29 Jun 2026 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733073; cv=none; b=s09rjXN4xl8kOe+h25O3zJT+SowSMSksp5p7Cf8JZaWoNwk1lFVJh9W9iUKLaPfkDuPmVaaxeWS7JD/g+5aYkXbY3RQ7Sg4VjGSAs9XmHLMMVA4gncgLLnPI42IQBW2lOw+kgike5QMbROQuJBLtMnjO9MaIYjs+80D8wiiKgiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733073; c=relaxed/simple;
	bh=/FISdUzWa4jhl1iQ3S3a8MCiO8ObQKuQAEGL2GhpF4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YSn+zXy37qHnb8ZM4GXHvIHOsHaHOxntQWFruUVSDARwFWib8zDvFD0cS/JkCQ812HiVIcYH9mSFlrfW896kL6Qke1qDSU7dlzeevuC9sCS9Ty1yKuCDy0kRHyob9vEw9lgwbjb7UHVG0QfCs8nB4IykYfWM5PYnsKg0jC4dpio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=sRl0m9mM; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="sRl0m9mM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=Kk9sUoilZshEHSgLKnKBimRLc1pZNYUGaGCYgPP1URw=; b=sRl0m9mM7aT7Na
	pC1bEyGYbo/5KyzUbxtoKVFWh0hRaTNfWcWYEbTK/XMVMVNIUBU/WbVrDhT8MS9MyYgPT1LbgWYzw
	b6Jh5dMvdJqv3+psb7zwTXvLJp8nXwLfOcMl7cmqQS+oYwCqQLtJgqtbsOxKDS9aVvB3skOtOPp10
	d8tEZ4gTG6y2jL+w8U3TQFZzgbyU2ZCWUHCiCW+Yi5ky1yvxOxqrzVZZrngglX0c1IkRzy4pqej7T
	1iZ7Oxz227am4m8dQlzmynRPYyQ9dhshPWqsXsQkb+MJ3TuVnrNCO89kt8hjlTNnCdeAhv+uvLIPr
	5lnryhpzAvtYFpzfZOHQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1weAJ1-0064Rh-Im; Mon, 29 Jun 2026 12:37:39 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1weAJ1-00000005Ceo-0oc5;
	Mon, 29 Jun 2026 12:37:39 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	stable@kernel.org
Subject: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()
Date: Mon, 29 Jun 2026 12:37:37 +0100
Message-Id: <20260629113737.1240285-1-ben.dooks@codethink.co.uk>
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
Fixes: dcdc3f399e3b ("usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2: add fixes and cc to stable
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

