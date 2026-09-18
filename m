Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3E3CC9E9
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699699; cv=none; b=teOk4WWXA3SGv5HuXR9TByWyhTRanYnmOlCrsq6GhcowE6Fs+hv4DQXlq+4QEZJpeWRx0NZhHqmXgTtQoQsIAINWb2bjCCS99DzkqDRl/AS9/BElLLoiQBZMEbRlTQh3nA8aUZ6QcNkyAJrPHWtQ8ZtjvzSnXmN9c/i8zKXAfyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699699; c=relaxed/simple;
	bh=tgi1xbq6UBAfkXM53SyPE3HTTHTlS+0NLDmIG7Q1NA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNGDyjpJJLYTs8H37SLHGRWQYYrjjWAj2aEI+HknuAIBOggpTDW3VfsZ+wkGvwXA9GXEq9qYnKHvmsQq0so2XmrTTU7DmtBaUHPRlcaI4wNumUeGivf34Q1wUMD8Zks3uyocUdloExUmiFB14L+7q0g1lHtNrGjTO2ng1t0Ado0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6hUv8fr; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6hUv8fr"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so122593a91.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699689; x=1790304489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUG1tjzf/CFfdHEdMDStehP7wbXF+04MwLXpL4o0ne0=;
        b=R6hUv8frpcQukeDeMxt6v+mMeFWFyHqL4DnIBQGjgfv92u7jlPOv27Qs9KLtiLk73O
         6rXPKBc9u29dKbNUsd+n+ca92/CPBytnGyKemonZVbUuoCGWxsalkFpn8RAlaR72vHca
         2Q307UZy/tfgdN+28TeDYGc3eOWJuqX5u2V0S5EebsHzUx3iQ+ZZj/67gSTnwVoie8Pd
         cUM6Y8D67uJjqOAnUra0RR6bq8ndctWyuehU+uI37P3Hs+4gPwcqvq+wyA6g6II0Zull
         NNCtP5WbQ19kqhO5a698WVpj/Y//4qhAzzg+Zv6/O8Lh+ImAmIt3KhIIh3wnOM+wInVZ
         uWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699689; x=1790304489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUG1tjzf/CFfdHEdMDStehP7wbXF+04MwLXpL4o0ne0=;
        b=dKSkRMuBVBM3vqhpl2x/g0hWFFi++sWry+ZMJCvUZ+ioXKLOr7K6iI5gJzWnhpIT4u
         bftPcuX2P5BQfwkGpdAmoX6kMzTvZL04tb15TRtWjzXUYYu40mT5AFU/90FUvo9O2WO7
         XE7xilFTWmg1X+o7FsX3MA3TgVsue13u+DWACtz6pmFB0rm6JX+WcvPKlt/8xq1xLZw6
         whvC1mw25lCm0Fj1miabMRlMYrkw0IuF6gG63ZsyyajqynaqYP95MEZ1Bjao1n/qh888
         lM3d3iGrbdeBaeQj6O64zKnVO/vMfSH0e9U7ts3tVdpeChPmavy1z/4PX8NrA3E0VcK5
         wO4w==
X-Gm-Message-State: AFuF++lIQk35rXb2DVnzrtfeZBtPYwerSj/muE7TOro1CEn4TFKvBpMG
	xygQtun1ryMC/K5r0G9IikH3Z53yMP3UpPUrXJGqBdm04l1SNzuIUCPqQHFD/bgIpnk=
X-Gm-Gg: AYBFou1zMklDe47MPMzGbc3wcgOvcOQ+18u2NAONIu2Dk5Ph9PEpskpEVkeAa0WBU2D
	THcg0Gma/E2/ji6HbmWDGiaxDH2diCZnMxvBLsFpiEfOlw3JYWo16kEwoyib2IXqk8Autn745vo
	prXmcBMOBFl8TL2aMNj4R9O4x9Ksi+Jte18eotQSzdR3mwBf1RTf/amXQIKh2+7guxB5dr8VCRe
	VZnZthQMvvwOoCMZ5co64pSRFj1RdpnCReBZv+umiUtoh/Q42rkPYyvy3JSFkK5pwdvwox/AALV
	m1mvQxC5EUz0+e8usQBnTJMHhuou+qfNshaQSbntaJ63d2glkjgu2oHBp+TLfyaKe9FT2mEzT7x
	f3lBkO9Vu4DVF0PI+vVsbmb4+UN8BwZLzWJpRlsngj1vz+0hRFNumUXm2KJvTlgXDhzuE06AtWf
	fd4XJN31pQz1tkfaoEEVslPI7GKYzTYWAatR/LeBrKXfzRqarlqUliit6ql+Fa7genJxsnQFw6e
	3DQBRqXfAb6bPi7loA5WIpCMZA8krAENdNlEn2H+p00nZJMPJRdSWm0duD/Xh3JKSxgpSIMTuhA
	zXRffDEzY8VMJ7PfYrFQ6pqP9MC8CZZIUmyRPr1fV0Yr3CaH3A26vilpEBmrVxYbGbF/l4kHFQF
	5
X-Received: by 2002:a05:6a20:9149:b0:3dd:85a8:cacb with SMTP id adf61e73a8af0-3dd8c47d1d1mr1851708637.34.1789699688975;
        Thu, 17 Sep 2026 19:48:08 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2874bb0csm399689eec.16.2026.09.17.19.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:48:08 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: phy: remove unused phy-mv-usb.h header
Date: Thu, 17 Sep 2026 19:47:51 -0700
Message-ID: <20260918024758.359928-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mv-usb PHY driver was removed in commit 1d73df245b19 ("usb: Remove
orphaned UDC drivers"), but its header was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/usb/phy/phy-mv-usb.h | 160 -----------------------------------
 1 file changed, 160 deletions(-)
 delete mode 100644 drivers/usb/phy/phy-mv-usb.h

diff --git a/drivers/usb/phy/phy-mv-usb.h b/drivers/usb/phy/phy-mv-usb.h
deleted file mode 100644
index 5d5c0abb0c3a..000000000000
--- a/drivers/usb/phy/phy-mv-usb.h
+++ /dev/null
@@ -1,160 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (C) 2011 Marvell International Ltd. All rights reserved.
- */
-
-#ifndef	__MV_USB_OTG_CONTROLLER__
-#define	__MV_USB_OTG_CONTROLLER__
-
-#include <linux/types.h>
-
-/* Command Register Bit Masks */
-#define USBCMD_RUN_STOP			(0x00000001)
-#define USBCMD_CTRL_RESET		(0x00000002)
-
-/* otgsc Register Bit Masks */
-#define OTGSC_CTRL_VUSB_DISCHARGE		0x00000001
-#define OTGSC_CTRL_VUSB_CHARGE			0x00000002
-#define OTGSC_CTRL_OTG_TERM			0x00000008
-#define OTGSC_CTRL_DATA_PULSING			0x00000010
-#define OTGSC_STS_USB_ID			0x00000100
-#define OTGSC_STS_A_VBUS_VALID			0x00000200
-#define OTGSC_STS_A_SESSION_VALID		0x00000400
-#define OTGSC_STS_B_SESSION_VALID		0x00000800
-#define OTGSC_STS_B_SESSION_END			0x00001000
-#define OTGSC_STS_1MS_TOGGLE			0x00002000
-#define OTGSC_STS_DATA_PULSING			0x00004000
-#define OTGSC_INTSTS_USB_ID			0x00010000
-#define OTGSC_INTSTS_A_VBUS_VALID		0x00020000
-#define OTGSC_INTSTS_A_SESSION_VALID		0x00040000
-#define OTGSC_INTSTS_B_SESSION_VALID		0x00080000
-#define OTGSC_INTSTS_B_SESSION_END		0x00100000
-#define OTGSC_INTSTS_1MS			0x00200000
-#define OTGSC_INTSTS_DATA_PULSING		0x00400000
-#define OTGSC_INTR_USB_ID			0x01000000
-#define OTGSC_INTR_A_VBUS_VALID			0x02000000
-#define OTGSC_INTR_A_SESSION_VALID		0x04000000
-#define OTGSC_INTR_B_SESSION_VALID		0x08000000
-#define OTGSC_INTR_B_SESSION_END		0x10000000
-#define OTGSC_INTR_1MS_TIMER			0x20000000
-#define OTGSC_INTR_DATA_PULSING			0x40000000
-
-#define CAPLENGTH_MASK		(0xff)
-
-/* Timer's interval, unit 10ms */
-#define T_A_WAIT_VRISE		100
-#define T_A_WAIT_BCON		2000
-#define T_A_AIDL_BDIS		100
-#define T_A_BIDL_ADIS		20
-#define T_B_ASE0_BRST		400
-#define T_B_SE0_SRP		300
-#define T_B_SRP_FAIL		2000
-#define T_B_DATA_PLS		10
-#define T_B_SRP_INIT		100
-#define T_A_SRP_RSPNS		10
-#define T_A_DRV_RSM		5
-
-enum otg_function {
-	OTG_B_DEVICE = 0,
-	OTG_A_DEVICE
-};
-
-enum mv_otg_timer {
-	A_WAIT_BCON_TIMER = 0,
-	OTG_TIMER_NUM
-};
-
-/* PXA OTG state machine */
-struct mv_otg_ctrl {
-	/* internal variables */
-	u8 a_set_b_hnp_en;	/* A-Device set b_hnp_en */
-	u8 b_srp_done;
-	u8 b_hnp_en;
-
-	/* OTG inputs */
-	u8 a_bus_drop;
-	u8 a_bus_req;
-	u8 a_clr_err;
-	u8 a_bus_resume;
-	u8 a_bus_suspend;
-	u8 a_conn;
-	u8 a_sess_vld;
-	u8 a_srp_det;
-	u8 a_vbus_vld;
-	u8 b_bus_req;		/* B-Device Require Bus */
-	u8 b_bus_resume;
-	u8 b_bus_suspend;
-	u8 b_conn;
-	u8 b_se0_srp;
-	u8 b_sess_end;
-	u8 b_sess_vld;
-	u8 id;
-	u8 a_suspend_req;
-
-	/*Timer event */
-	u8 a_aidl_bdis_timeout;
-	u8 b_ase0_brst_timeout;
-	u8 a_bidl_adis_timeout;
-	u8 a_wait_bcon_timeout;
-
-	struct timer_list timer[OTG_TIMER_NUM];
-};
-
-#define VUSBHS_MAX_PORTS	8
-
-struct mv_otg_regs {
-	u32 usbcmd;		/* Command register */
-	u32 usbsts;		/* Status register */
-	u32 usbintr;		/* Interrupt enable */
-	u32 frindex;		/* Frame index */
-	u32 reserved1[1];
-	u32 deviceaddr;		/* Device Address */
-	u32 eplistaddr;		/* Endpoint List Address */
-	u32 ttctrl;		/* HOST TT status and control */
-	u32 burstsize;		/* Programmable Burst Size */
-	u32 txfilltuning;	/* Host Transmit Pre-Buffer Packet Tuning */
-	u32 reserved[4];
-	u32 epnak;		/* Endpoint NAK */
-	u32 epnaken;		/* Endpoint NAK Enable */
-	u32 configflag;		/* Configured Flag register */
-	u32 portsc[VUSBHS_MAX_PORTS];	/* Port Status/Control x, x = 1..8 */
-	u32 otgsc;
-	u32 usbmode;		/* USB Host/Device mode */
-	u32 epsetupstat;	/* Endpoint Setup Status */
-	u32 epprime;		/* Endpoint Initialize */
-	u32 epflush;		/* Endpoint De-initialize */
-	u32 epstatus;		/* Endpoint Status */
-	u32 epcomplete;		/* Endpoint Interrupt On Complete */
-	u32 epctrlx[16];	/* Endpoint Control, where x = 0.. 15 */
-	u32 mcr;		/* Mux Control */
-	u32 isr;		/* Interrupt Status */
-	u32 ier;		/* Interrupt Enable */
-};
-
-struct mv_otg {
-	struct usb_phy phy;
-	struct mv_otg_ctrl otg_ctrl;
-
-	/* base address */
-	void __iomem *phy_regs;
-	void __iomem *cap_regs;
-	struct mv_otg_regs __iomem *op_regs;
-
-	struct platform_device *pdev;
-	int irq;
-	u32 irq_status;
-	u32 irq_en;
-
-	struct delayed_work work;
-	struct workqueue_struct *qwork;
-
-	spinlock_t wq_lock;
-
-	struct mv_usb_platform_data *pdata;
-
-	unsigned int active;
-	unsigned int clock_gating;
-	struct clk *clk;
-};
-
-#endif
-- 
2.43.0

