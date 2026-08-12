Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4726402442;
	Wed, 12 Aug 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526966; cv=none; b=g9yyfy88XznHERrPihKTtcladBANr28lgpuHEbVfT4mi2hysqR0YUGGXFfAHcY0PO0cYbDcxQ9aFPLz3xzPOE6As4c4nVgUAztmBfUX/UMspX3bz4MJf/VWXtxLRmLGQAGtIAaM7TGkQOBKyAGmT06Zz/74rRcVbFlX+vuLzULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526966; c=relaxed/simple;
	bh=UQz59mzCFYhASTHfMCyfR+jc8zUC34Tialb7tVy5PHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HltzxuMlfJ/q+BTRv7yToRh0FSZHu2GaM5xqTXhKzorbQ77yklD0G97gN+knAj8NmDYsHAjw0kP+4OX2QNkPU+bDJ+GijHLMlhiAiu7pohQOOpyugFNF0EDOm+uXM7OU9v6FLU4OXEL53Bs1KG4AUstQtN0xo8oI+hV/OCG6ZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LlwLKW29; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LlwLKW29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526891;
	bh=iwJkcIbymuQYJD7rhHDuiKkfunQrOQpFsOK1YVaDm3M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=LlwLKW29LdMbAwPi0uDRCHsyPrg/8IP51WQc0NBQ7Uv0I3RrIjA8bZTIiZuE5dDIh
	 osw2d5rf3y44HpUCxqcF3ERq30t6hvd6tSO3qweZ5Nmcy3SDH1gHCGzTvGUKJEHBxM
	 ghHG2if1pbXRGFHHQGagIvJBZSgh5xWUT05e4ugs=
X-QQ-mid: esmtpsz19t1786526883t6c187f47
X-QQ-Originating-IP: 3RzQdLCRU5p0GmW2+jGuVB0GaofzRGEs2A5UfRvBlfc=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 746446844975873123
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:13 +0800
Subject: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1318;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=UQz59mzCFYhASTHfMCyfR+jc8zUC34Tialb7tVy5PHg=;
 b=mDCO71bPXe78vc5f9+0j6NxwE2K+XEHP/xCLSnQNJ3qhU9UaccAHo9fQLVBb1ruFR3AGBKMCU
 z2CfM+6l8xHBjApVrkY4JUGEK2ARuyNlcArvK9VHupdEdBiBaWARaOE
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OLPPkukr/NyPcKSMeuB8XXTxtlxJXtwfTVmwhSOAFvBHnkQ/KbBeiENw
	OfIoTZTcFKGin/1GM+ZkKGzR8W/n1Cd2C3co4fvlPbinOol79rzmgggGdXRf7mItvdSE1G0
	LNIHzncdi+gjsbo0xNny0no5eAnOTDdXzZZPXoQjCFI/08cdj3zbpFuPdLCa1mUMBgGJRJz
	STUPtWl2BeGl2J3MUVaqbdE5fYPDxX5jySQG5WKI3rzT9m9MkBbJYKVy5VQrKIjc6Lpyeca
	//sdG9NOSsywV7SjyQfyoeWlBaymE9FJWlUvU1U5uEmjoIOFlZcNDbOTOlprK7StOI5pIhn
	GmzgiswMeAv3nZaTbGw+M2UZ/rpN6lPOFjtED68lPqZ2XjWx0OqPedbC/Rj+DZzZN69zBuk
	QC1XFBRirUqOaJSqYbtcCL2TY+zuklKUZndEc7fHQhwM9H481LYQdgD7EAZ4xKGpmbyJRex
	hTFlOWGKxRv592aEQtUtCOPNN2ejbN8bS49dD77v7LjnKtUg2Hj+pgKYSCTuUvimofyTLAG
	2WBKIUYQNo5B/eHVG2YmnFPzp728d3dUB/eubnwufCvCwMC9jz/FB5/kCVcrvqAOFnJdwaf
	qrcf9zq/a+OT+puN3PNeggiXJ4mge1ATPGh051Qn/nHp+a+v2V2Pk6T0if3/5O0ANFWPRPP
	Ry9rBoDI3dA7Mjv+/d7ZBgBRA3L4/R2afIOD1YG0i+n8nvauAbXvRqmPn2nQ2aQSnzsyspC
	7CcO67WjMFSNXHTfxLFKdHTDJFrGHkSoHGxbfdOfgKSSI2LhvuAQiWcT8IDMBX1+mBi5KW0
	0j0OHpzHl/W0tcEA0oJbk2wn3vdEiSSC+ji16dSYNXSFbd+VRzsKfi0K+bzskWH/g+ZX6gu
	ubPxIPoOuOLa1iIumDW1bKSvW7QaW8O71O/kSh2Hs3gDPC7dOt6SmX/3C2QMWe2Em9enblE
	nxo4F9DsI3RQkCGbXi3eW4xprvWrv7ZVVbIs3QAebFzmuyHEA2VHTA8/98JnNYGoUweWSAL
	uBjOESnsI89PwSfgrquH3HBQZfVCQd9BLq0npWqghEV5nPAL8u+aQ+rJECK/aXAlSz5fxat
	nV/jwYd5NdjCkK0Rl2uj0fLCszsn9cfdRUo5dSSqI/NEStZ7bf2dfKm15U11bUCTw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 8ffa1e95d8e8..00d575cd2955 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -21,6 +22,7 @@
 struct ci_hdrc_usb2_priv {
 	struct platform_device	*ci_pdev;
 	struct clk		*clk;
+	struct reset_control	*reset;
 };
 
 static const struct ci_hdrc_platform_data ci_default_pdata = {
@@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	priv->reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(priv->reset)) {
+		ret = PTR_ERR(priv->reset);
+		goto clk_err;
+	}
+
 	ci_pdata->name = dev_name(dev);
 
 	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1

