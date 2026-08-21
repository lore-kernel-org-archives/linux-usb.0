Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217D37AA95;
	Fri, 21 Aug 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322805; cv=fail; b=Yj0fT+3lLTGHhYYNgk9BFrgChnJ410Wtlj1z1xHrUbJ79UbxQesXB3TTdLz29Q3xi8O3UT2LPDGxJo0EnKZ1zbV45RTmu+TnXBABelBAuQ+KsorEGMVHmxsiceiXyOSAaDQ1CA+cb6NMZr0t6XKiEi/bQZt/Xt7FUdTStnM0nF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322805; c=relaxed/simple;
	bh=qYUx/wVuwE6nBwuy/GWrW1u9C0Jq7fIPJD4t305fRAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jDuohcam/neTHOM3ST/cje+csrASy2BuY4vq5yUa/jzTZS1T2b91+pR/MWJVdS4Iq0PArNxCfo6bfeFls+7bvxjmrR7MANkzqVkGEEEekLsYx+vQDB9CzU5qgZV+dTFYqkelTMnr75oWuLazb8Ma84ktZx2X+S9w0PZIBUDCndw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JSGy3EmE; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JSGy3EmE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHmmUWV+EcT0/XBCEZRd+z8gfojuDU/Evy8NxEYqWLqgCm5rv0ZmHJRE+8vaqNuvhAQY78W5RSZ1BE9jjPWsZ0Ht/BSQcXWSEyffd5AyzwkdNIhb2b0GiF7cKHLN0L8mSlk7bW9LtJYBgYfkqGiHBoiwGyEMcrc64QYt54ci3kuLGan/cs9mdJCbt3GFPYSlzlUaaSOJNde4UBjC6hfCEjzx1u+AMp4qpxAB4XXUuO2WLwASTHoFEWDBL/L3IEX29nvk40XqsXLVyXKRDOb8VFt8yqoASYeqeZhSD8L7o7yBhpRU6ByFplsYgkSG5GKi1cCyR21icInmXtCMAlwnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlqxPiL2yMPp/uA9p9dcGw/pfMS+LyRWmKmDEVRmwV8=;
 b=MO30/Up64xstNIpvL5pR+K4GFFhF9h1CzOqvG2rzfmbKGJUMSqnGe2WkuV5MEeqymu3PDYqEqA5lL5ztIZwY2bjCW7NeH0HC2MY1cKiO+IoQYHlpWCe+ZTXvLlqX4LwYjsuE8YrQ8tIZ7dGoLnu0GbqNKaHVor6//SVd9MPaaB0qqqQjq7jIMhFVTpTqCfRvES1NNYMenxec5V37H6ETtuiUkCvc12nn5PUVxGcSSgOVJ6WG9B3lEW4BHNFic6NztZNcbKON898MTweT3UKhwMpTFEdIlv9Em1MDz8cFj6z/a8JLa5EHsQqRDSsYZ6kJXHiysUgr8Fhs4SEk970UOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlqxPiL2yMPp/uA9p9dcGw/pfMS+LyRWmKmDEVRmwV8=;
 b=JSGy3EmELIQ8q7a+wyl1rKfnPUakshICCJRVlFWagst0cceWq4F3EAW2bJv7opogFLGmveYy66XGBETYo3LAxEWqmnPXHpUBQu7rpSlt033dCMRpGXw68RYQPMfL/5HAadR3OrMBjtDC4fAki+JhjUIn5Zz/sw9vERa9i/SKneMYUQkdqatdiboev1aejvivMKGaIap9Ogg/K3g9+p1SouvdNOG4RouD00TO00BlIm+hQgOfoX32UrGaU5X/Aw/CdZH0SSQK/tyN0EKxtL1mrcuAclEzMquiBtpitVWj8DOdc4JGqWRMjg02tBSvdiVI5mC/ZPC0ZIBM4shcZK4tXw==
Received: from AS4P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::11)
 by AM0PR10MB3284.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:180::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:33:18 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::3e) by AS4P191CA0016.outlook.office365.com
 (2603:10a6:20b:5d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:33:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:38:17 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:33:17 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:33:14 +0200
Subject: [PATCH] usb: misc: onboard-hub: add support for Microchip USB2422
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb-onboard-hub-2422-v1-v1-1-d1cee9685524@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKlhiGoC/yXMwQrCMAyA4VcZORtoQxnDVxEPa5q57NBKY4cw9
 u5WPX6H/z/ApKoYXIcDquxqWnKHvwzA65wfgpq6gRyNbiKPzSKWHMtcE64tIgUi3D2OTI5dCBy
 XBL1+Vln0/Tvf7n9bi5vw67uD8/wAiScTBXsAAAA=
X-Change-ID: 20260821-usb-onboard-hub-2422-v1-6c20c044cbfd
To: Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Fabrice
 Gasnier" <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|AM0PR10MB3284:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d93627-cbfe-47f3-ae3a-08deff9124aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	zI1pX7j+O7G7T5C4Mh2bFzSEPrxJQaz++4BHDv/flKqb9n4BD6WuoHGc5uOMMkoaOWT5Yk6ho57T8yIIbrepUiOOs/rqCP/VaIyq80kybfB2LgxkasNWqAob64YD86q1mfP+OI4xoCrP1a6VS6KEDXVOuMLrPx5VD9bChNcx1hIcAaPpTuF0FYsfscJMDztQFOafJ/+6+mO6B74YRi18j2C0lIY/9KlXCZHv0GMvZfjbUzOP5Ncg/HYUyNtPfIQrZfG3SumlQdHe/8nHAmS1tCqsUSCYjjs6nmim4qAKsSr1RvYkzx5olVPbvQgJmx9ZVSAlZo8MRU9r3oTPDWVsVuEP9KVpmRClmRk7fYQrwIIv/fViWG3hGR+dIrv3N3hsrsiGM6ssEMjZTu36wWsT6ptrSQEbre9fF8Uf8uaZyoxT9RHrdCNLYVdbd0BPXpcctz/oc1n1+TK1EBgcsADShhVnRUU86YtsCvyC4STFWsSFw8y2Ng0l+gg65Game98Fw+/OoLFas7aISMZWoTWIhpO1cSATHvi11TP5yy85ST09uzaJfTM89dNAe9rMRLEyiR9WXGvu0d4C5wResByc72YfZ9qdeTyTzknDNbLsuS/7WZJrGyuKrmBjz4vDh8RrIT99U30uVgqdBa2xoAlfxSVzQ+8C+aXiYNpoYuWbPUow09aXif2b36Nn3OWiKH8molR83/dwMLMLcH7eGtHBBw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eYyioY3S2AhD2i7K2ulMieb2loZx3ABzTSDM0aWuwwvudlzn+nvRs3fMvsz9dcraFGA5cjgTCMgjV2a9VOfjvo+muLaiF9UhwxOL/HnXSMe7ob3fqZNKsr5pyRw97PI9860aflw7Bmd6RcYmtBi9G2RGTDcWCqsu/D3L9811O85d1sEVwZxiY9AjDxQFbCSqm7TC6gQb3xz4dcopgm+7BfdTZRvWXVE0Vj8ms0WxeGnIeZmWxY86ujHWTfRdjSnsRwOBd+gVWIheZImiwYor5UIkl7obiBRs3enEgtUJZs1PIqjO3Eg+5vEsMjBeZrkRH/eTcB/Ql3ivvx2qxror36mqO/MQb44pXw5Sdyimb+s6QsDBtHxYOra1EL1v7O/S+uO+q8lC8lyO1rmhJK8ydEiDwArQUB5gaokmlNzdFmdsWpPRErRRIp2voEY/dc2P
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:33:18.2802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d93627-cbfe-47f3-ae3a-08deff9124aa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3284

Add support for the Microchip USB2422 USB2.0 Hub. It is similar to
the USB2412. It provides two downstream ports. It is supplied by
a single 3v3 power source, and provides a reset pin. So add the
generic compatible, defined as "usbVID,PID", and reuse existing
usb424_data.
This hub can be found on stm32mp257f-dk board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 11508ed4df25..e226e63146e8 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -667,6 +667,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2422) }, /* USB2422 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a149..e425a94e1175 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -137,6 +137,7 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb-a-connector", .data = &usb_a_conn_data, },
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
+	{ .compatible = "usb424,2422", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2744", .data = &microchip_usb5744_data, },

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260821-usb-onboard-hub-2422-v1-6c20c044cbfd

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

