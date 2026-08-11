Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0441F7FD;
	Tue, 11 Aug 2026 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439337; cv=none; b=hMgUaVwpegXMBqVb6VKhLwUqKE3AEOmiT10klVlQJ4fk2YF+F1/mXJ2GkTIOlGTtqnN5b92qCIvtP0IgxOFv9PqP4BMsuvHfOohCto/9bSKK+VOCFEvYF00dxeOqhT86iNs3tHkr047ZT1hHP0utnahIwMrCVnupPWPzdK+1RHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439337; c=relaxed/simple;
	bh=T9Hcp5ru0JjNvcERwUiH+S8mJJ9PcssBj5Onv1+dsWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SNx8m9AkWyKa/tzoq20dED1PbFwVeHigbtBav1HS4mLUBcicUykAkgm/3PdI/pJe0O4AVXgIQYeFqH3Av8hKNiCh0W3udB96fRIICuvYYUtfztgYkIge4w5dcMNJYvnk4Zakl5polgXB0mGsqgTGowm2uL62bAqU1yfgRKcnrfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=F+ygK6Mq; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="F+ygK6Mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786439305;
	bh=vajpKwz9mmlb4a7LFKx5forjQ8ETSpXDNUDEeyZx2Z0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=F+ygK6MqVZMPD+u38xkJM/lpKD4a6IPgDc4up4GrWCrm9+RS25nV/3RqS2qjLlqcz
	 gPtZN30UMif6VMfEfLAuMXYK/olBqK3udfpZ56ZvA7Yk0JI6+VmEG+T82uVl8ORYGt
	 myYxLkQTq8jEKCYxPuL4n7v74+tCFt9jTTfbhXGI=
X-QQ-mid: zesmtpsz9t1786439300t99f4b4ba
X-QQ-Originating-IP: yiDwvkgk/p1MCoIm7wYCpX/i5n0GZSno7aDN5plSQy8=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 17:08:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4559435952495275185
EX-QQ-RecipientCnt: 6
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	troy.mitchell@linux.spacemit.com,
	peixin.xie@linux.spacemit.com
Subject: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume in host mode
Date: Tue, 11 Aug 2026 17:08:17 +0800
Message-Id: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MHnXMSYug7f9JhL9U7UaIOr07/AfehafwAUm170NRMyZoOZ4ltIHNvdS
	xLqfgxyeN6ToiV2araRFYsZc+poGNkCiuyY5cdgAUAARyQO3F45Dg2FCVc4GEG/tCZiY7Ng
	2pL9X65JDWLlqwFUnHpVKjX661zlO4ZroqC/7p369DpFomg2yh/Axl/8o+EYTRZxd/cLzln
	P8LVAZqXt0zL1CUf6CrghexNa2TAIPwt2G+VY7vZYkfWqwj/O66hbTB1FqKF51pB6r/V6MK
	RD13PSiVe7OYYKMCwTOupM/VoezAtXQ96Cam0I28k9J+50KOkto+O1IgyVmyKXFtsqUGHOd
	3kpagRz+DVWZ9rkGcNwQcosfQv0Je5Ot4HSoPrZpFij3Kpv1r8G2bty9jOr7Qxq/FlIcwyo
	LoyvA+dVPb02AIvbPrLyAdjXlZMp5Jfvxhw7X9aU7TsOecotrjz3JNHQuSBjoq7FESpZ1nr
	Iykd0uJzAEJHibDFYlOku5xHdrXKWHsgZoX2n5yU15Pat8miBtERHACvoJluFPa0iw/thqk
	UiRqHhfH+Yy/djYFJrRjGQckQtojRwyO4V3NMaXq3WqKBcV0u+B9yYwF5rbHWCBJQfStbTw
	FI0KZ0kr0KtPcI9fU10RNZ++WeOknrLJ/I6HMIJS4cTnd0yrFLIXxDU9VdFZeeK7HdITTNB
	iTx8CFuguF9EKQjwACBpgFB9abKjvjNkSvJ7W15nssWC7nOHg055AmGdoIsfPayY8LXMdM2
	uja2ReHou9p/pHlWNd1BXJmkxynw7NPYdMMgrQhmJrii6V9J/bZ4RL9rLdX+YGxrT/hJVT/
	tWxLT/wO29UTv1LCNxGpyufVfamrpBCmGbR7Fu2Rt9dp2/zxFuLI3lSNtOfpnyY0RQV/fJv
	CJ+/AysOXv1TNZVx9rXTYi4TrL+Hvcsc+C0XyTsoNc75dP2cdLtXxKg/zHYwvTQh04WGMRz
	uvNhcIj+Em0XoulDtHcakldX7rxE41vrMPdfSFwz904TEYE5bnfHjw2BNFxk4JU60T54zha
	2V8Le85XDdWNnbm52orFlKCyC/WHQzUB+ZmTo0hDU5xrpeEuW6kI6PaWtAthuRyyjMSc1wq
	o7nKfR2K+wCwr3LoyweeiGiyhvrUsVtCPX7iUA+Xx/bBr6/x+BMilo=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

USB controller runtime suspend halts the controller on disconnection.
It relies on platforms with custom connection notification to start
the controller again.

The host branch of dwc3_runtime_resume() does nothing currently. There
are two paths that can trigger a runtime resume of the dwc3 core in
host mode:

(a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
    A platform wakeup IRQ fires and the glue handler calls
    pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
    the dwc3 parent first, then resumes xHCI. Both wake correctly.

(b) Wake lands on the dwc3 parent (ACPI platforms)
    When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
    parent device -- for example via a Generic Event Device on a
    hardware-reduced platform where dwc3 is enumerated as an ACPI
    device without a glue driver -- the ACPI core turns this into
    pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
    downward, so the xHCI child stays suspended. Root hub polling is
    never re-armed, and a device plugged in while suspended is silently
    dropped.

This patch fills in the host branch to cover case (b) by requesting an
async resume of the xHCI child so xhci_resume() can restore the port
state machine and re-arm root hub polling. Async is required to avoid
deadlocking on the parent's own rpm_resume() re-entry.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ceb49f2f8004..bce56765ad90 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2668,6 +2668,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
 		}
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
+		/*
+		 * Only the xHCI child's resume re-arms root hub polling, which
+		 * is what rediscovers a device plugged in while suspended.
+		 * Runtime PM never resumes children on its own, so request it
+		 * here. This has to be asynchronous: resuming the child
+		 * synchronously would deadlock because rpm_resume() tries to
+		 * resume the parent before the child, and here the parent's
+		 * own callback has not returned yet.
+		 */
+		if (dwc->xhci)
+			pm_request_resume(&dwc->xhci->dev);
+		break;
 	default:
 		/* do nothing */
 		break;
--
2.25.1

