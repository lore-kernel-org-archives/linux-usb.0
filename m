Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF71A6832
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555932; cv=none; b=FqxoFXJ0bq5qLx2kqrnbtqGOVUp4rnhHHWtzImDn18/jsVGsUY0qbTITJwVCr/fUBGicEzQ2f+x1C9ymOoQN2SD1hV8vJvRcUy5CGHWSqypnXIe3PcBBOVtAs2UFQivc5MINIQ5LqA8ECmAG1hTEvlrt7CeNHqydRiYoR4ftBoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555932; c=relaxed/simple;
	bh=v6dK+JZ2GEKrTtPvk1s8IMseTc+yhOKrJq0IH48PNik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdTm+TL9VKDRImYWRXTuaqbpXpJnyHBA9bbJGOUkqboAGms/TnSj/xyO5G7fr+3ewqXpnA2d0g/Hyt4pmbFeNBq8y8AtxfS5e5CoqVDKRIjkPIJsbxCaUf74kdpuFnoDjgCYYHBmQrmyK236IcMYDpvEjKrTPTcxYKh6M5aUQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Gcdf4dpn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Gcdf4dpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778555902;
	bh=NFmjNjf9RGaeP5fkbjtUWx6Soc9qTfkMjWAO4UUlKgc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Gcdf4dpn9cyL6PfQlBitfgX1CqBZGtapMKj8yuGOkIg3oDtJ2PnX0XgJYE4MK7GDn
	 blDIxlPHCzrMCMVNvhuK9gFK0Dkzdv/pO9/qavlLNpUub5VHF0tPpyybh+heCQaYsJ
	 MMnHdUvySxjgNskIUXNzY4n4rKnR52iNyFh8wmtU=
X-QQ-mid: zesmtpip4t1778555886t2e64c7cb
X-QQ-Originating-IP: XiGJyjes0easuIrLBh8Z53gzqy6SDh3B15lOP5bTjfo=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 11:18:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7080304305869387863
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH v2 1/4] usb: xhci: store xhci pointer in xhci_interrupter
Date: Tue, 12 May 2026 11:18:03 +0800
Message-ID: <435AE791322F0CA2+20260512031803.3895760-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <4EB0C0803AAAF502+20260512031454.3892011-1-raoxu@uniontech.com>
References: <4EB0C0803AAAF502+20260512031454.3892011-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ET5H/R20ph7EsEwcirDX5UR9n4CuPS2Q26gLcJ8D+lWspJ
	PNnVB0jEmxTQ9RryQsXr4+JzZ1D/5ALsmJkZzypRQZ23vKTviWcVGgaEx45yJ9VkLXAGk4e
	oanOElC9enxAn/+Z4oQ3QzVStxZhtn4/7qG2LogNqcyCVDuHoYVLKGiRNUit6QTtiv2bQGz
	+BMptA5YPcuAj4P5lpCFWioLDhPtHytdiUXDC+WpPzkrABzSayg1wIzzja+XZU+nDiAxNW4
	/T2ecz7qSPIb+etpq1KAqh+OUFyV9F4ibAlCGx6OGnMXDO3966Bd6awpdbGrUPyCTsbcJ4L
	ktMpQCJ15PS4mlco6lIXis302Oqtk7lb/rSoYy8rlEpN4z75GJoko6vd2e+M4CYOvl/9uGN
	itNKGu7396DVdulbAgme6kj10WpZ6VCFVOCR8fzbfKeeubjgi6NWln2XO1vM15c0rlP15eF
	yEF/BYf0J3mLiYA5IvkV2o7aAB70Z2321n9yM960yohaFdNRzRsd19CDgU3rCsqeHmIsy7g
	NXLp7a2igpge3lK9DE0XFV+lHeeuV7e45RmMkJSeTaygum/GB/YCHzoxn6pod+Gj1r1lYHy
	867lJX0493p5wfWEYOAgkRTGxmnhY+g2Yca9xCkwDAf77wrQTGDgvhsEagNSjNIX9uhlx83
	PJR7iHOX8OY0c6uJ9BP3kwQLMEJU6FFQUSqt2JsCa4DjmNIMC4zdjiBGhlsaTo2Uk7VVwH3
	UVLK55pNpwwGXCR//qtygVwn5uqOta52ULItOSeUZwWwofI9tjxXwQnSjQArvwM9S1nsMU8
	d48g6xqUkaDmaN+X7wBEjeTiCkWr74U4eDkw+7pQo9LZJ4b9zni5ho6Sq2tcuWYoYLcw2Ea
	/IUJmV5RGfaknQ72Ulp69vvlTUlO7twXIk5EN3zxTlK6dYxVxi2IJCIBhBkEoCJa1MfK1Up
	9ziAiXF+NPBUZ9rEteAgxAiF6h8NL8rU9GB2gXeE6ilPvAAChdkQZIQJ1ToGz8bmmF6o=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Secondary interrupters keep event ring state in
struct xhci_interrupter, but the MSI path needs the owning
host controller as well.

Store the xhci_hcd pointer when an interrupter is initialized.
This prepares the interrupt path to use interrupter context
directly.

No functional change.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-mem.c | 1 +
 drivers/usb/host/xhci.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..73be00cdd98f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2331,6 +2331,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 	u32 erst_size;
 
 	ir = xhci->interrupters[intr_num];
+	ir->xhci = xhci;
 	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..96cd3e751067 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1445,6 +1445,7 @@ struct xhci_bus_state {
 };
 
 struct xhci_interrupter {
+	struct xhci_hcd		*xhci;
 	struct xhci_ring	*event_ring;
 	struct xhci_erst	erst;
 	struct xhci_intr_reg __iomem *ir_set;
--
2.50.1
