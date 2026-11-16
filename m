Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834008;
	b=xWvMK1stPCssbrXCT4YM1bedRZG70kKSDFY+a+w/1fr+PGH6XwOFPyLq6dkNbCnoCems
	 /OCLJwNFSRwhPIUhqdXoOuBop2xM99RaCnSNx7iZiootkZUn1nGTdFUbg0q1vOFdHNSNu
	 qO4aaNFccUrXpc14AKrj4+SjrCuWLDggKGmXo0L1PzEJO8ZHj3bk5NvnlhWLlYvzJk7kJ
	 ljSFLnhceOa9x8i01s7ov8IvhSPWlA/JXRf0WHPs5f11NACeQhf/SKrhx4jHrBL4P5uII
	 lOiN8KYPGf9Tq00wGw+3mhre9nxaxAatw/g+8Z3I4zARcHILcdui0GEC8R90TUeLJOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834008;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:Content-Transfer-Encoding:MIME-Version:X-CMS-RootMailID:
	 References;
	bh=cwjy6PsFjKhadlM83IrAOfhjuE/Eo22fd3cBhQMRQ4U=;
	b=Rbd3HsBmD56cO35rb2UKZsz7hV54Z6XPKDcxL+eHy4q3fDyyzBrPESimJBZUrglZLbMa
	 ZmbAHgLd2T0cpdFjjkscVa32xOF/eNAx8yWmsqk5t2YePS9C47dphlPRD0GcMGukrU6YB
	 T0Ad5nC/q1NoKZ4w4XP8dazixflToJA8d30GRMVThFiheHcCVl4l965uS0xOVfrC76mqu
	 JMEFwit680l1dvB7LIvzIqFuFPkK7dSYghDXp9d2DFaxggo8qZ7NxAaSxIoRS8TyfKgLM
	 9YlcyzPHUnKt5KnAvDXzOP9tw85Vv6nlL8sxQfRWa0+N0yRHBIXUXHFsXfOQZLxyWAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=slhHjm68;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D31606A33A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D31606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=slhHjm68
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261116130004epoutp038b645348c48cf171843e0c8cbf5e6749~oiAR55oSh1850218502epoutp03P
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:00:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261116130004epoutp038b645348c48cf171843e0c8cbf5e6749~oiAR55oSh1850218502epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794834004;
	bh=cwjy6PsFjKhadlM83IrAOfhjuE/Eo22fd3cBhQMRQ4U=;
	h=From:To:Cc:Subject:Date:References:From;
	b=slhHjm68ewQWUVm6bRFUckzalB0fbQtsFeYR5SoNtLh2oIS5FJZpddqHoo4k1a6Lo
	 qGgI4kxoNuiy1Wiyk1dMlr9BjTj31Iy4jNxRtO279sC0iLwH48rFh1hUMKkuA2TaRr
	 LM25SJP5fkuNC37tIkq8mQkUiLCGX0vKZVyz9hu0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261116130003epcas5p41505962cdb85baef807da63df4a4bdd6~oiARTemrZ1581715817epcas5p4X;
	Mon, 16 Nov 2026 13:00:03 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jSnyW4VT6z2SSKd; Mon, 16 Nov
	2026 13:00:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261116125643epcas5p17e73b0fa50f1cb7609b1d90d62c5e3f6~oh9XF0EaC2880528805epcas5p1u;
	Mon, 16 Nov 2026 12:56:43 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261116125640epsmtip193698527cb698dd83aee2b514325cf77~oh9UdOLNZ1010810108epsmtip1O;
	Mon, 16 Nov 2026 12:56:40 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, shashank.mahadasyam@sony.com,
	rahul.bukte@sony.com, hadess@hadess.net, dakr@kernel.org, gary@garyguo.net,
	guanyulin@google.com, rafael.j.wysocki@intel.com,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, alim.akhtar@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com, cpgs@samsung.com, Selvarasu
	Ganesan <selvarasu.g@samsung.com>, stable@vger.kernel.org
Subject: [PATCH] usb: core: don't skip system resume for an already
 suspended device
Date: Mon, 16 Nov 2026 18:26:25 +0530
Message-Id: <973576304.21794834003625.JavaMail.epsvc@epcpadp1new>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261116125643epcas5p17e73b0fa50f1cb7609b1d90d62c5e3f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CMS-RootMailID: 20261116125643epcas5p17e73b0fa50f1cb7609b1d90d62c5e3f6
References: <CGME20261116125643epcas5p17e73b0fa50f1cb7609b1d90d62c5e3f6@epcas5p1.samsung.com>

When offload is active on a USB device, usb_suspend_both() skips
suspending it during system suspend so that the port is not pushed
into its deep low power state.

The commit bd3d245b0fef ("usb: core: use dedicated spinlock for offload
state") made the resume path skip resuming the device whenever offload
is active at resume time, instead of only when the corresponding suspend
was skipped. That is wrong when the device was already suspended:

  1. Streaming is running with offload active and the AP side stops
     using the device, the user pauses streaming, or the USB interface
     simply becomes idle.
  2. The device auto-suspends.  The auto-suspend path
     (PMSG_AUTO_SUSPEND) does not carry the PM_EVENT_SUSPEND event, so
     the offload state is not consulted.  The port goes into its deep
     low-power state and the device enters USB_STATE_SUSPENDED.
  3. The system enters PM suspend.  The device is already suspended,
     so usb_suspend_both() returns early and the offload skip never
     takes effect for this sleep.
  4. On system resume, usb_resume_both() re-checks usb_offload_check(),
     which is still true because the offload reference is held.  The
     device resume is skipped even though the device is suspended, so
     the connected USB device is never resumed and fails to function
     after the AP resumes.

Skipping the resume is only correct when the suspend was actually
skipped, i.e. when the device was not already suspended.  Check the
device state so that an already suspended device always goes through a
normal resume, as before bd3d245b0fef.

Fixes: bd3d245b0fef ("usb: core: use dedicated spinlock for offload state")
Cc: stable@vger.kernel.org
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/core/driver.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f21b1e4f9c09..48addbd1a69a 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1552,7 +1552,15 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 		goto done;
 	}
 	udev->can_submit = 1;
-	if (msg.event == PM_EVENT_RESUME)
+	/*
+	 * Offload is only relevant if the device was kept active during the
+	 * corresponding suspend.  A device that is already suspended (for
+	 * example auto-suspended during an idle gap) must go through a
+	 * normal resume, otherwise the port would be left in its deep
+	 * low-power state after system resume.
+	 */
+	if (msg.event == PM_EVENT_RESUME &&
+	    udev->state != USB_STATE_SUSPENDED)
 		offload_active = usb_offload_check(udev);
 
 	/* Resume the device */
-- 
2.17.1


