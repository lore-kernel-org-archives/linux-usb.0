Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1F4519B8;
	Mon, 17 Aug 2026 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984292; cv=fail; b=W10W8Pgk4OIPn9Es5cqfOssS//V2j/8Eev74iPIqq9wnAYbPhF9tTY0WSNqtoiuViZ83UD9w4jLqzxGPy6uwD3fOtiMP1FJJU5vb1xg0hPt6LCxLZU7uuzbm+BDIJaabLlXZ6jLKIWDqvOlVCwIwMmwDb6j7ybNhXZZeZMwdZ+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984292; c=relaxed/simple;
	bh=ZNfdal0lwOBeWbaNR2tDvKjKdHpmurvvbdj4Vt5PqHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EK5zVvPUlkhKTC7AnoVoBwyFcIeY92S6qLC7Ifhz9iQfQnz6hFExRaTrtQqO/Q1pv87nIc1w23fYSK8EmU2aKdvZs6C5YQGGya8pTCuNKhnihEmyOFYqoGabpxRDMiklWt5hNRdxEZVMfzygKd9Zj+clKU/EUumSYGqSocE80zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EKNm8EPz; arc=fail smtp.client-ip=52.101.83.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EKNm8EPz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj9vW8zrorEQR8e7QAKuHxTUrh9Dm0U7DA03swYn3NmohZOZxEC5ipMkiDJI4unYNK3aue/H2oMGUgNDr/eAKESOS3TCA4Y8sT4PUWB0x54B5sZaLI4wwMU4URTnR5AlUUFKP0peKpr+KxKnHkQ4GQ0CCN9TcdCJUjeKC60NdA+ldP34mnHnmtVtWz9KVHJRT9Loi7yrEg5Iw+pABtcHMZdzLClyFjUpeyhsiNZQawxkXyceioTOexdsxBZLQgYc36wwrwO69YY0URgjTDr9RfZbgsrlFHoy+9ZDwUvbPxmjvYMEVm7F7TAYHhAnA9SKj46gE+LqTeaSHX9/2RsR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YIPwMqKB2AVLH8t8LkW0/FI2RYilrQW6twisN32VHA=;
 b=xAqQdktL8ZgqnHxIRjbr32VCAYWN78XSE7mkGEV2mSakibXv+RhkKKDPR10mANWTlzwmj0i4wr6zkksIb8CyvEyvdwwNb0wtd1C/8iQ14PdREt6DusT3+MaEsuzH0PtefpfB+47JBVusURJ45SqSs2/nTgH7RF0TVPagzKLQZWcqFhNg3DlgUk+43Kojbr3BkFvfqstdKwxFDznGOhrqgb4ilIlxHvaSEiwR0fihR+NJ3lDRGeM+nd+EkEDr5WgDKbIKDoyVX72er8HDXRWxIYbfSKyuxWq76pIs09G3yQkPQ4CdspPN3BHMxQ99LArrvdDKhgELW1lnSuivxoCCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=synopsys.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YIPwMqKB2AVLH8t8LkW0/FI2RYilrQW6twisN32VHA=;
 b=EKNm8EPzBrG3qmzyh4dNNJEqe5ldguEsYfWkJkvURd24TbT0yIl3Sz4SRfl+oxjTFXc+7raTGnCoogOFEO/CAe1Ko7KhRXo/yKW0cBDBbzbC4vOAQwGcUh2gdYSB+8W1ypaWIHIPEdr7vuu8ZC3bMjk1k+PgM4/sg01d5ZG1yhPfZ6an9RQLaEAFSPf+lwAFkBiLx4hg1sl4FYOXFF3ODt9xin0DRVxrtTNDLSv5m4jxYQCztYDPZn+hrxtJixBsk1Q5j+KAkys6ou5/ALKoU0hcuAsCWXbkO2fN8aYOT5VPM4ONpzg4eKJc6+z8aPXlFA2lHHNDspnWcFeSM3ugWg==
Received: from AS4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::18)
 by DU0PR10MB9363.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:59b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:31:24 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::51) by AS4P190CA0014.outlook.office365.com
 (2603:10a6:20b:5de::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 16:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 16:31:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:36:21 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:31:23 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>, Marek Vasut <marex@nabladev.com>
CC: <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] usb: dwc3: cascade usb-role down to the phys with phy_set_mode_ext
Date: Mon, 17 Aug 2026 18:30:58 +0200
Message-ID: <20260817163101.6203-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|DU0PR10MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4caf94-fda0-4ead-bb65-08defc7cfa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FZ6xfWaH0CDhfkO8/nC51CMN/9SE1cr8k6f5Lad73swkWCEV90n1zvarOMQWW5rJdG1O8nUJEQzPoj0bkl+QyMoYiV9jsG3WvpDww5w5mO4W7fCVwGJKbq/0eavhpTL3eRn/bq/MXMBaeuvgLh4AbUUAFRSGeagI7Sz30vOJ6xsKUbkdOxHaaGVPVnRIvPrnfSPtkqQpdiEKYoAEsacyLoEEo9AkmNUSp51cfy0FWRfgknqC1PevM13gTz2s0Bsj7XJPNQvPTSqkosH2p+/oAHVKw46RVmQ9VYQ7fo0+0/2lWLXIWctNChzzpPh5lRY57W52vp0qNfMf/pGLPbuNq+a2USORFEiQ/sKK2sNmb2pL9Fg04siB99CYgKm9KRLX7BDwaMGEA2cjKqVMds6mDSA1INlsPPifxkLx2QoFp1nXsYMlJX+nUVnRTYN4bgp9h2OgarEBcRLZ70lB8giehJaDL+VivwnBFOiK4VQJJ8H+bHa7S1orlxci98DXMC3MVznGazo7B3SVYn3ybhcHIS97+yIqAEIa4q1UfjUTkvcQ2wgtkc291MYpUeZp8an1qvuel92ooKSYPTj3BMR65TlPip6VzD8W3DhFTL0TrWmNFbU5/rRxgVtHN1Vx1n/GdRjdMxZBqkZJicLYJ1uQjvDreu04zCTjSzSd0dDE6Zn3LQENFY4xMUIUyMaA7ZHeCaaNOLXaeROSFdgIn9b7IQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s20rhzAAtwkQwPBwcB9BI0Fid4bIjauRam7sueppRG+CZqzfIutIFMhwuFScko7oZlcKnl/ztdnoW1NPCCgIA21zBizVHeZWHR8wTgHN2Oztr+t+b4iz9K0NvxMmrPVhIPx8/lrbo8GWQLd/XbNNaFOJvR/FJLcP2I2zl9sJ8pY8uLwCAAKwscmjTgjFBrgc2o7EP8rRZh+27fGeC1ai8koM6lJbv3JXyKh4SN9dDqym6vm8xXyg/xADZ2HR8ujKXp0kpG+DUClMzLnCVUw2NaXNnhq2LLAsI3sPjw22DXkhmggpiFuDvI87tvQhbUPVpj2t8ooQSGNC5Uo9rROIalhOocTRLw7/FHqw4Bi464PQxGbMGXQbseBd+1SyxCstdd8aUdYG9sfYo9v/0M5zUPH06x5SOq5/31IxOM2GPWqELHvXrvhjW+CdqiQtTSUo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:31:23.9289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4caf94-fda0-4ead-bb65-08defc7cfa63
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB9363

From: Pankaj Dev <pankaj.dev@st.com>

dwc3_usb_role_switch_set callback provides usb_role data for
each cable change event, usb_role information needs to be passed
to the phy interface (phy_set_mode), each time the event happens.

Currently usb_role "none" is not used, also the phy_set_mode is only
called when there is a mode change.

Modifications here pass the usb_role to phy_set_mode, also phy_set_mode
is called each time the role switch event happens.

Aim is to support role-switch for stm32mp25, to properly enable/disable
pull-up on D+ and Vbus valid entry of the PHYs depending on usb-role:
USB_ROLE_NONE, USB_ROLE_DEVICE or USB_ROLE_HOST.

Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Tested on top of:
https://lore.kernel.org/linux-phy/20260816213849.1044073-1-marex@nabladev.com/
---
 drivers/usb/dwc3/core.c | 44 +++++++++++++++++++++++++++++++----------
 drivers/usb/dwc3/core.h |  5 ++++-
 drivers/usb/dwc3/drd.c  | 10 ++++++++--
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ceb49f2f8004..82a061e0d5f4 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -184,8 +184,27 @@ static void __dwc3_set_mode(struct work_struct *work)
 	if (!desired_dr_role)
 		goto out;
 
-	if (desired_dr_role == dwc->current_dr_role)
+	if (desired_dr_role == dwc->current_dr_role) {
+		switch (dwc->current_dr_role) {
+		case DWC3_GCTL_PRTCAP_HOST:
+			for (i = 0; i < dwc->num_usb2_ports; i++)
+				phy_set_mode_ext(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST,
+						 dwc->submode);
+			for (i = 0; i < dwc->num_usb3_ports; i++)
+				phy_set_mode_ext(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST,
+						 dwc->submode);
+			break;
+		case DWC3_GCTL_PRTCAP_DEVICE:
+			phy_set_mode_ext(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE,
+					 dwc->submode);
+			phy_set_mode_ext(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE,
+					 dwc->submode);
+			break;
+		default:
+			break;
+		}
 		goto out;
+	}
 
 	if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
 		goto out;
@@ -249,9 +268,11 @@ static void __dwc3_set_mode(struct work_struct *work)
 				otg_set_vbus(dwc->usb2_phy->otg, true);
 
 			for (i = 0; i < dwc->num_usb2_ports; i++)
-				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
+				phy_set_mode_ext(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST,
+						 dwc->submode);
 			for (i = 0; i < dwc->num_usb3_ports; i++)
-				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+				phy_set_mode_ext(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST,
+						 dwc->submode);
 
 			if (dwc->dis_split_quirk) {
 				reg = dwc3_readl(dwc, DWC3_GUCTL3);
@@ -267,8 +288,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
-		phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
-		phy_set_mode(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE);
+		phy_set_mode_ext(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE, dwc->submode);
+		phy_set_mode_ext(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE, dwc->submode);
 
 		ret = dwc3_gadget_init(dwc);
 		if (ret)
@@ -287,7 +308,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_unlock(&dwc->mutex);
 }
 
-void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
+void dwc3_set_mode_ext(struct dwc3 *dwc, u32 mode, int submode)
 {
 	unsigned long flags;
 
@@ -296,6 +317,7 @@ void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->desired_dr_role = mode;
+	dwc->submode = submode;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	queue_work(system_freezable_wq, &dwc->drd_work);
@@ -1628,8 +1650,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
-		phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
-		phy_set_mode(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE);
+		phy_set_mode_ext(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE, USB_ROLE_DEVICE);
+		phy_set_mode_ext(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE, USB_ROLE_DEVICE);
 
 		ret = dwc3_gadget_init(dwc);
 		if (ret)
@@ -1641,9 +1663,11 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, true);
 		for (i = 0; i < dwc->num_usb2_ports; i++)
-			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
+			phy_set_mode_ext(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST,
+					 USB_ROLE_HOST);
 		for (i = 0; i < dwc->num_usb3_ports; i++)
-			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+			phy_set_mode_ext(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST,
+					 USB_ROLE_HOST);
 
 		ret = dwc3_host_init(dwc);
 		if (ret)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..6da52676ba3d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1244,6 +1244,7 @@ struct dwc3 {
 	enum usb_dr_mode	dr_mode;
 	u32			current_dr_role;
 	u32			desired_dr_role;
+	int			submode;
 	struct extcon_dev	*edev;
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
@@ -1589,7 +1590,9 @@ struct dwc3_gadget_ep_cmd_params {
 
 /* prototypes */
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
-void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
+#define dwc3_set_mode(dwc3, mode) \
+	dwc3_set_mode_ext(dwc3, mode, USB_ROLE_NONE)
+void dwc3_set_mode_ext(struct dwc3 *dwc, u32 mode, int submode);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 
 #define DWC3_IP_IS(_ip)							\
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index f3e37d383627..55533b2d2343 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -447,6 +447,7 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 
 #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
 #define ROLE_SWITCH 1
+static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw);
 static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 				    enum usb_role role)
 {
@@ -469,7 +470,8 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 	}
 
 	dwc3_pre_set_role(dwc, role);
-	dwc3_set_mode(dwc, mode);
+	dwc3_set_mode_ext(dwc, mode, role);
+
 	return 0;
 }
 
@@ -505,15 +507,19 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
 	u32 mode;
+	int submode = USB_ROLE_NONE;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
 	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
 		mode = DWC3_GCTL_PRTCAP_HOST;
+		submode = USB_ROLE_HOST;
 	} else {
+		if (dwc->role_switch_default_mode == USB_DR_MODE_PERIPHERAL)
+			submode = USB_ROLE_DEVICE;
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 	}
-	dwc3_set_mode(dwc, mode);
+	dwc3_set_mode_ext(dwc, mode, submode);
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
-- 
2.43.0

