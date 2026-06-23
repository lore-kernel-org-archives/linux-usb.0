Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619A36BCDA;
	Tue, 23 Jun 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209453; cv=none; b=sfcKfGqmD0hM9qQ64IcpmPnk15UnmqUjQMjIeVPa/+RtbH+UaYplENcbpckqE6vSxD3zsvZGBJ9QRf/Szj5fWaFTrqOsO2Xci0OHhWwcTgJoCwU4rlMjJ95U4Mb9bY7fpSu/cC6KiJ+S9DYyniPB2o5wDaYNwNMbwoJsRT9DPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209453; c=relaxed/simple;
	bh=otbG/uEz4bxaWcGa/eylmFcwWIqpkRYcuU+QI+gsznE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iJgK5eLzWuHFDj7Oh+ty9JpaNB/sEdR0AfrTswb4Kl+LSIeVRJBQK35LnoHNUHqT3HedKnP/mkyvMJ0GAgGkHH/BkzXn4fmwLBbN9VwC/DFMhU8/Da4Ckk//gfavvIH8qvQH1XdKQqm0zFePoWfMf7zZPgAiATyKPo39cVeqVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=pq+Qf6d/; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="pq+Qf6d/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=zOV3EIEbUv2wKwHT0vmcNIiUJ7ImPmUSNiXHIKwPiIg=; b=pq+Qf6d/YRl/Lg
	vkzL7k5Z5iP7T4Dvw5CAZCJPEHzoXgAljXh6DkuG5m8TwTT13ZnMvYUIBAcVoBloUJP5cfNMthw6+
	6IV9wFbLdxX6p5qMMIdIiC5ShpcSaMHZnVjhbEe10S04rIlLmKdaV4h6c9o4qxcwj7BhtkB4+0hCE
	PRk2XQHfq0kOienM6/JqkJZasfDt82aFmvq0yv43qmP9XDVxqk69xaHX5GmYSzaU0cGp2uz2i9RQd
	XbsjIBt/12Kf6TxQdL395FFUSP5YLyjDHh9gB+6sLtwQ2WBsM93Jiooq1Kbbyv+zGF+YpKFlohLSv
	BBXUtADRzSRBrhnSJo2g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby5c-006mWx-9g; Tue, 23 Jun 2026 11:10:44 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wby5c-000000038gW-0Esy;
	Tue, 23 Jun 2026 11:10:44 +0100
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
Subject: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp
Date: Tue, 23 Jun 2026 11:10:43 +0100
Message-Id: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
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
 drivers/usb/dwc3/dwc3-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1cf96540b66e..de8c17bc940d 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -158,7 +158,7 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+static void dwc3_imx8mp_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 {
 	if (role == USB_ROLE_HOST)
 		/*
@@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 		pm_runtime_use_autosuspend(dwc->dev);
 }
 
-struct dwc3_glue_ops dwc3_imx_glue_ops = {
-	.pre_set_role   = dwc3_imx_pre_set_role,
+static struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
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

