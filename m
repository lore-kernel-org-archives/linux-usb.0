Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F42E7389;
	Tue, 23 Jun 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209166; cv=none; b=koktqkgLwCp4eLO/yFaC6A6LqQHLGmPcUPDLDjLFas8/UYx3Dc+PT6DOpui+gfFL8e1rur2b3F4D96DOQd7C828am3gyVM5Of6NhH9gUlFmIxXT3UQQQeyZnFPSx4fsA7VDXosHthhaluAPcTn8pG39Kf0SIuanICnAdu8ut3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209166; c=relaxed/simple;
	bh=VMMQGUQOZsxFsPH0kDU9aRA7NjutrnKD6HBO7inc058=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I+R+qiQOshzaZMTCKT41pLZEAs3Jb5HHxEk0LE5bgOZFg1hN+NVm2XKG54kWv5nlGZSORTTo/JF7lbp6rHWwfkySra1JjZtKH3R+6gLVgqfAxwN7fKPC1WmTWldHZ+rRR5JzBfd+uUM6L2PrxajRGuK+XpOrT5BwkAYMS98eudo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=ylsiPimP; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="ylsiPimP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=U8DX8ABQ7qEn6eMBhQWfrDMVdr4PIabaB9tSDvLMkrc=; b=ylsiPimPOwKJiT
	5+gyQXzXVnqJ+2A9S9ECUPFMMs8HKRkw2Duw0HC3kcY5CNFVu5mOzakJ/FQUBN6gZAMPyvASbVqRG
	mSbz/6DPDZgxnTQlKmdu8cQ8m08whyKT7QkI4gMBKHGiPLPU8oZ++jLCuo8CROrwlkRlDMND/0W5g
	uPXhL+BfVAeQM2iILdEFfW/Ekio1hvyXqQdVJ8R6JtIKFObIIOdDTaKIuBMMI1ZQYOIlTbAAiHlo2
	0iJSW2mII1oof7pjYZdxTqMlbYtDA8KeF+i791o5KQcPmS9GSNXCWakw9AZADhArS3z3DWVZlRTTY
	xgZETfszf1ufcqDYmHeg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby0x-00FsUA-9N; Tue, 23 Jun 2026 11:05:55 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wby0w-000000035EL-47kk;
	Tue, 23 Jun 2026 11:05:54 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp
Date: Tue, 23 Jun 2026 11:05:54 +0100
Message-Id: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The dwc3_imx_glue_ops is not used outside this file, and technically this
is the dwc3-imx8mp driver so whilst making this static to avoid the
following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
the other driver which also has dwc3_imx_glue_ops.

Fixes:
drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1cf96540b66e..bc61a89b66b1 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 		pm_runtime_use_autosuspend(dwc->dev);
 }
 
-struct dwc3_glue_ops dwc3_imx_glue_ops = {
-	.pre_set_role   = dwc3_imx_pre_set_role,
+statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
+	.pre_set_role   = dwc3_imx8mp_pre_set_role,
 };
 
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
@@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto put_dwc3;
 	}
 
-	dwc3->glue_ops = &dwc3_imx_glue_ops;
+	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
 
 	if (dwc3->dr_mode == USB_DR_MODE_HOST)
 		pm_runtime_dont_use_autosuspend(dwc3->dev);
-- 
2.37.2.352.g3c44437643

