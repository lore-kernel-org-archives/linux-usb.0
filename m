Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292A3590A9
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 05:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103467; cv=none; b=R39HCBWRgMk9jA1iSe5qvcWQ0uWGqyabIYvDw2ST7PNv1jt05HL7p8Ew7hQPpPeCRkhL57AwwjjBLJPlne3FM6zhnMeZbgQdq0k2gRspgZBRTE5+DIhjYYqZ0isn39S0Hp96h9jQBJp7cABlMdcOgnR0ZUUs9F/HRUaYX6X0gDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103467; c=relaxed/simple;
	bh=op8zp3xtqZK1y+5EYbArVhH3q3yVDjwvN7ve9EQ2nqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2U5sJe7zvPrg7m2SNc2tKfn6marI3m5xOi3AibFTj7XoLdGZtz2nxNlPVaru/OvCKgAE1V6DuuIl1UIZgABfYD17bJN8Lr6YyNZOh+rBeMsTS4QhiRGIIcOZdUgGuMB5fAK3I0+9NsNJBUfDgIep16jHzkTzditRXnjsbwt6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXFGsnZo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXFGsnZo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db858d60e0so4779055ad.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 22:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103465; x=1789708265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=mXFGsnZoJ0WTGKnPFuk31otCAjD/QZ4ATK6pZmuH03BBWYSE8ukDhIoKI+pxcsM7jo
         yuA0KBDO+v23vqA2NQ6+83tjF1apnGZJSaJzxqMGmgi+aGxa6/42jOEjIzZgba60uY9C
         9PCZdnegjcGp3Fy9hEG9BMXyKoIIUootyUf9d6YXvfusoWg6sD1cePqnO8Ltmcrx3o01
         OA6H+oJVm6z9d/yzprDglOsQadYIovrKVuivaGkfqH4gZmPSlKEyQtlPWInTVIoLhVWg
         Zcy3Wgk+XxYSBeleHMHlvHQ+qOBgNaDbj3drGXNIu21LIO8r+6drSmvoY7R6FyLLEP0o
         l4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103465; x=1789708265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=RbaHPc2rUEhcoHmZ03EPRtynQP1VEyyFU5iugIxrFhbB7DUc9Hj2X262cOUEOjafsN
         9pMq8aSqwu3G+t40dqfRrpBxKptcwTZ99Qt8f2rVTTNR2U2x2fy/AwGtg637pEkeaQ4Q
         MG3zx/C8bjaULZ8NWb5aSmTuQsW5ApCK0AiIuY+w9ndeKw1yb7a85tw1NdYkylfj83Zy
         Pd3XxuwupmAUlPn37f6BUSZDFF19roL8TSTpjPx+bZmRBf9VJ7VEMgpnJpmh6t8T9ppG
         CaPT3zvvV7ARGPgERhB+YFbh1IVshw2OzTNrQm9K7Dv3twMy3DYyLlfFxli5FY3gv0C7
         Fftw==
X-Forwarded-Encrypted: i=1; AKwUvByVi6tGt+MV0I2J3oNWzp6WTNrXZkBaIHyR6G4M89ufMOwDp3EqBBivBlCfWdXQMzlH2mr8Oqd1e5I=@vger.kernel.org
X-Gm-Message-State: AFuF++nk8q+o0DEoPnFu4YXXw2ATmszpHsonpHLjn3C/ZfZ0af/SVjAs
	bd8KDi8mqQGU5BbkT2rBZdJ94stK1MvpmiUIP9FBCIV2n9H/wZL/tsKxJ9hhVQ==
X-Gm-Gg: AYBFou0t+R6OeET3v4C4ACqW+Ttk07Ttb0TKmw9+gyX5//Oeh66TdR0mKEabZzsiV0f
	5kyYGqPJMZdyMZCM61h2rAuaIJSVf4AY37mIJ6DKziDsYP4/pNQ4NrngmQZYlh9OuNgqzmSf/M5
	0FUUW1src6EWvK6SJsMl7Y71tw+uc+qmPecvC4szM1IL1x0KqoDDBrY1jqZn3LAqVM+B7nuejk6
	X8dxJszFWBi99wA5VFL17r2zd1CbVmaZsFacV+rBLAnMnKfn3/17bfCkXR7eqadKOICdbe5cs+U
	amfxRlzB5/mMqdciKS27438WtG0sWJ/0bmC5t+ef1pDXupY9tVqqbFu1Q9a2tuN3NgKYiG8NiFY
	74p6VivVbvQphWmcbnXf3v1JEiOvR6spmqJ+SV14B+VLFeP5AEsXR8A9ZvWAmnpZLdhwk8X4PFO
	ui3Jw7bA/IPbNqG5SNNp8NcgKSR3DB2cMcQknMybwLXHjiphxbjesDQW45ne2oGa60NdN+AYD3o
	e2CksKOdqlvE4KSY5Th7Pln/mTeFd5azYwCnjdhnUeq+YTMbNAAZ3/avqjgdfed2KngFw8emDK1
	mOC8Xdx5GmcA9xA=
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr4011103a91.22.1789103465343;
        Thu, 10 Sep 2026 22:11:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm2512810a91.17.2026.09.10.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:11:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v4] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri, 11 Sep 2026 12:10:43 +0700
Message-ID: <20260911051043.15962-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. In this
case, the probe error path should shut down the PHY before returning.

Use the phy_shutdown error path instead of err_clk so that the PHY is
properly shut down when creating the IRQ name or requesting the wakeup
IRQ fails.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2:
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Link v3:
https://lore.kernel.org/all/20260810093112.47807-2-phucduc.bui@gmail.com/

Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by
   Sashiko's review.
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.
Changes in v4:
 - Rebased on top of gregkh/usb-testing.
 - The ret assignment for dev_err_probe() is already handled by
   1db5c6b0b983 ("usb: chipidea: imx: fix missing ret assignment for
   dev_err_probe").
 - Keep this patch focused on the phy_shutdown error path.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 6a17b22047b3..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -533,7 +533,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
 			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0

