Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47044DB55F;
	Thu,  2 Jul 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001772; cv=none; b=kfAWsv/tF1h1M95g+NU/su9EjUe7DV0VeSJ7gKt7dOe5zQ20tmag9vlBpF3/7IY2xsJ56oPou0ROoLBPI6pFLhrIHv5oNEyhKBpDEvZIgasKgDM6drcbyBPCwy034z49Gcj3038Qlj8fiTxZBthUUcnjavq9y6zDDJzWVOKO4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001772; c=relaxed/simple;
	bh=8KA3K9yEp1Gwn5vbdTb+Amxx7xmEl7tb7RfRrLkTWBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9EHyfqKzeVmmVAwBMF+KamWh93mSk9xBvDxhxovNSxp1rnGlAofA84fOO+Y10MFVTBISdBe4kZUaUT6JAKJKZrh8su/QfwuSR7worArf6rzL+vpY1xfHk35xacKTpO1LjpdrCNgsj/tCV+9VLK7BmfzdM3p6mo3BfZHzeyr9qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0F8b928; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0F8b928"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD71F00A3A;
	Thu,  2 Jul 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001769;
	bh=x+2RMOnDAh4jFfXqz7jJxRkO8m0IlFg42sB4S4WrAs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D0F8b9280qiGBZEW8keiQZiyJvXAHQuZpZKM4cioyG+hqF2qtg5AC7Z5DMI8/iFzQ
	 OvR4pBCTpjnyrqmvufFuSMLYCCBpVMRuYDc10GlYYJR6kAMtK/+X+SxU1Y/p+LkAYz
	 AhiOVr9oq2tX1Dhhbis6VD6cqVMXjLMS7U+ljhZZ3NcWgsBW2e5if79jw3yGyteGQZ
	 I0wv1gLj440jhu8Z1cEt5wOTT9rA95wLl3imJFd1MjGeIYPPQyK5DpzuSJQirJT6vI
	 BAC36MHBQfXvgH+DZM5kL8XgP5GFYiVhE+uFoH3545+2N1Q4LgF7hHdNdj0e32+MkR
	 FmFmPJwnlEp5g==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfID0-00000000Neg-2t6T;
	Thu, 02 Jul 2026 16:16:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] USB: gadget: fsl-udc: drop misleading unbind sanity check
Date: Thu,  2 Jul 2026 16:15:36 +0200
Message-ID: <20260702141536.90887-5-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702141536.90887-1-johan@kernel.org>
References: <20260702141536.90887-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UDC pointer is set on successful probe and will never be NULL when
the driver is later unbound so drop the misleading sanity check (and
confused error message).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index c4761933ec86..20392409afb1 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2539,12 +2539,6 @@ static void fsl_udc_remove(struct platform_device *pdev)
 
 	DECLARE_COMPLETION_ONSTACK(done);
 
-	if (!udc_controller) {
-		dev_err(&pdev->dev,
-			"Driver still in use but removing anyhow\n");
-		return;
-	}
-
 	udc_controller->done = &done;
 	usb_del_gadget_udc(&udc_controller->gadget);
 
-- 
2.53.0

