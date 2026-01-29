Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBC19ABC6;
	Thu, 29 Jan 2026 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769654036; cv=none; b=mdho+pqpswdtnmVtZ+MXtOxVTw7aDpy68crnb0paSlqNVOM/EUbulsS7+FACapLcyuK82ZjWtmIP4btvOBrDRkDLTc/KntGh9RQanDo/g+qCK/sShZSmIyND71ngVOqNvpLvHU+keYhuC5yrzFsR8OtYIgkJWW12DMtACtGNC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769654036; c=relaxed/simple;
	bh=SIc7XRBLkfAt+XPo1xAojfylka2MdDR/Sk+djMPqAmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ps+2yC+WPrbQRtw1I976xI/L6zRl+xYTxhRoaf0X0cS6hCHDqE+4BrHSElVR0/B+HKS7/K/+zrvVSx3SJnElcIUMY7JzsclGHSUIanUdqxHwBWxeoCbB4Ukhn4FHsw+kkaFdHQdaAZuKoy54ysu1Mpnup5OVg5hM8uvbZEYBSN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDrRHkfd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDrRHkfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115E2C4CEF1;
	Thu, 29 Jan 2026 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654036;
	bh=SIc7XRBLkfAt+XPo1xAojfylka2MdDR/Sk+djMPqAmk=;
	h=From:To:Cc:Subject:Date:From;
	b=CDrRHkfdP+mCwR4nvWDPmqIaFQk4G1YjCIDcRmBnnit3p4V/EHXJ/x2xaOQI0s3ia
	 Mpvhj8G7T5slc52lhDM1w+WdtdU0XRPi0fX11mO2QzE5vjgxot9M5Jz3uKLNwzcJrO
	 r5VQsju1w6XbctIQFw0A6ZCaQTt2T79z7qaSM94ytr4P7B525QnNZSu1aR+ZFl/Xlm
	 HCMrPDL3XwSx4KJd8HgkYB+51qUYShHVDOFdGLD0zrVtiHYZvTKb4T+ums2t6QHjP8
	 4RFqQxv0lvk6fDUWOhcEN+MjLUBylzYKlk+kGyBTaefsHHE9H0F3IfiPKmVMyL2jQi
	 1VdT9dxmdX21w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc2: fix resume failure if dr_mode is host
Date: Thu, 29 Jan 2026 10:15:34 +0800
Message-ID: <20260129021534.10411-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 13b1f8e25bfd1 ("usb: dwc2: Force mode optimizations") removed the
dwc2_force_mode(hsotg, true) in dwc2_force_dr_mode() if dr_mode is host.

But this brings a bug: the controller fails to resume back as host,
further debugging shows that the controller is resumed as peripheral.
The reason is dwc2_force_dr_mode() missed the host mode forcing, and
when resuming from s2ram, GINTSTS is 0 by default, dwc2_is_device_mode
in dwc2_resume() misreads this as the controller is in peripheral mode.

Fix the resume failure by adding back the dwc2_force_mode(hsotg, true).

Then an obvious question is: why this bug hasn't been observed and fixed
for about six years? There are two resons: most dwc2 platforms set the
dr_mode as otg; Some platforms don't have suspend & resume support yet.

Fixes: 13b1f8e25bfd1 ("usb: dwc2: Force mode optimizations")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/dwc2/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index c3d24312db0f..f375c5185bfe 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -578,6 +578,7 @@ void dwc2_force_dr_mode(struct dwc2_hsotg *hsotg)
 {
 	switch (hsotg->dr_mode) {
 	case USB_DR_MODE_HOST:
+		dwc2_force_mode(hsotg, true);
 		/*
 		 * NOTE: This is required for some rockchip soc based
 		 * platforms on their host-only dwc2.
-- 
2.51.0

