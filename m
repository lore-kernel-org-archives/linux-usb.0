Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9FB4DD6E6;
	Thu,  2 Jul 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001831; cv=none; b=ktNTpW+rqiDVmmS/Hcc6+H/OkOc00Cf347N2dSkmXqlv8MWOQWkYTr6Y0/XSZuoV/T0T6U2H5LnRX9ELvotdEP9uvOLNiLsIVygff3tfxN+VPDrOHJKz8FsvVgH/vmRhcW9l7JzGC2CkjvMay7honNifqgVVdxtBhljCuOgzRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001831; c=relaxed/simple;
	bh=YZc2SAI67r0yFQlz995oDb5lt5cOd4UQUxF/RlWMSRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mk27bs3f2gTDWD54LlJvHZRAxn5equ1Oa/Q+2zsbr9GBTkEQ7T8iOy72BF5OffOOyg+ZbzE93NlP4T+bFqcj24a9bWJUVZeJWLPWoQLF1u6Wghp94VIi/XViMEF51pSyAh8n/HvHFdRNy0RSGtNi4IYGZ+e3cTKajHwtx4LWbXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcnIg6r9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcnIg6r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4FD1F000E9;
	Thu,  2 Jul 2026 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001819;
	bh=D569KK1k+vwe0LucYx055Nn+h/2uD0UB6Se0i4m2/UE=;
	h=From:To:Cc:Subject:Date;
	b=XcnIg6r9dnI5q1pmf7DHQqIOAARNCEZ5J5cQ4p7UWLfqRoz1S9FIm8B8GhAEngjxB
	 L3NizsYxbgr/uNTX4y1Z0Hb+XQ7NE8v+xHhfcvr1ZVDbgxtwkevL86JmLYQTpYCIp2
	 Bqfh9EbKq/5y1Dl1GdjoeDUjYqPVo2deWBl7PQ9dEObuQTRGmqPdELInrGbMuVCCqy
	 0dpXgWv+frUrXStI8CimuyYDiCqMcHE2WqDh0BSKt8d2OFhXoTUxznGf4YcuHkf1Ln
	 h03i9gaqqzdUnx770rHK0RTOdvQGhkVDRfTb/qEW31tKvHlT6PcbxJs0GTxLT5poBp
	 C/f/py2eId9og==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfIDp-00000000Nfz-0KR8;
	Thu, 02 Jul 2026 16:16:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: gadget: fsl-udc: enable compile testing
Date: Thu,  2 Jul 2026 16:16:51 +0200
Message-ID: <20260702141651.91003-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing seems to prevent this driver from being compile tested so enable
that for wider build coverage.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/gadget/udc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 26460340fbc9..7ddbc2606686 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
 
 config USB_FSL_USB2
 	tristate "Freescale Highspeed USB DR Peripheral Controller"
-	depends on FSL_SOC
+	depends on FSL_SOC || COMPILE_TEST
 	help
 	   Some of Freescale PowerPC and i.MX processors have a High Speed
 	   Dual-Role(DR) USB controller, which supports device mode.
-- 
2.53.0

