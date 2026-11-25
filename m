Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624379;
	b=nPoNS1Cu0H3bcLuYx3/OVbBVHvmi/Pyrn5HNneA0YT9rh/RefbnlkKylpPKPePtfqOXN
	 M21xlW9mSzFV2+KDhhI7BCU6ThNPQt9iAq6UM4ih7Y0Pku9aF66AfLfTdoWT7Xle/DeKj
	 HgghyZiHGrqvViY1R2zKT8dZpOHJZyTuhoagI3E7v+VBU38mB0mwbweWF1ywGpAZ/W1SW
	 FgahmCbvuJMU920wZgKrwYKnpQKcaZbYIPbIuvRsGE7fctYZlTSeU0vsRbxqW4BtI0pRK
	 N4c6M48sqS74IfP6zGTK0eDLgU8+qQtWGztqarNP5g3gikNo/+tdI3J2OnrIzVjwnNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624379;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NFLX4rRbcAiEZGMbKsjxTtjQvEFW3sSPQNu2+MARLW8=;
	b=m1pNPy5ADWheQEPcokRNATnA0JmBDblAzZw4/e8ebGE5CF3EdHsxH+Sg/AhRXj2qb/ie
	 Ex/aaHgngVyKwgrAfiqsWDxylgijatwf1ar5SoG5Y96RZh02AguMziYSb5XMZHDYeMgcF
	 bptFkZ3Dkt3HalhCjqw82PxoZ0cCjRU1G5FBergRDJ/aqhfF2hiAlBhSx7kWIZ36HhYxN
	 B8VykbrbSY6SrxkwKQTtsFBol44Z5IMrFVbjgWhiit93FYXEpzwVwcQcbzoUSajQdsDOm
	 0tSkzdprr/RuPcPFsVC6QvHbdkAo8MGaBw4QQK6bHtblMV7Q2KmjsSeAePFbOoYAJpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mgdmi9v3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.16
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94E606A6B6;
	Wed, 25 Nov 2026 16:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA94E606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mgdmi9v3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAJSBrE5Cky5FfXjUayWTbIKkmOV4hO+4gHO/Qtj2p+C2vWTwrs1hyH6wY4r69UuoohRmzLjW9x7zcEa55dvRNrNFKyvCm7Tl1h5IiVbSYlcctnNBqvUpz6SHJtcEprtnu7zb56hVO4h2xUBa65El8CamkdGnRLYyiiY0zkzO9BO7DqnrNOG7kZ4jwDIGwXGJTVQoXS61SmVnZxqmSP2Nbt3+WGjkQP8VNKRMqBeIoJZJ8cRfJNwJ2ZN1OzP6+nXRsQiIsm06SY5ZGRTROB6GLEbWYmTI04CcUe8hLzGfrPS560xa8dip4P5l42kLftvg00ceAKodox0ACao8vUAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFLX4rRbcAiEZGMbKsjxTtjQvEFW3sSPQNu2+MARLW8=;
 b=agyD61EyOlUeEI8bcBV2zEn8AciWEBTkivedDfjgkkqYfnU+qgyJxKNDgI2SQJqaDe5Iem1w2h1M+ixWkohsoyKx1EPAuPlCrGQspCHboPBWlWSD4tCvHpcTEr70oGHDuUTDK/JLE0l3tpPnSLWRIqMsMix0cpzgVjtVKegRt2us1/JMgVTK+GMg/9aZJQK0yPsPwy5Lu5mhHmfk0lKcLlsY/g9bHZoPeHyIfwO0x5/VR+rAyUY5kSDco6eWG08kOdqkExZ+PFquvwOcgTmypsTM9Zdri/kKxR3/euQVabfnXFX0gTP9iiQ6FpDcqy2S0VXwGE33VIFx9gAuiqU6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFLX4rRbcAiEZGMbKsjxTtjQvEFW3sSPQNu2+MARLW8=;
 b=mgdmi9v3pxar8Dh63uATSGj8cdvoxC2Wre4bGGiZ6eNKr61cyalcE8JJSEeApBlq770z7Zai4uYcjRpilLUOs0T46vALaAwwB1ow8Rv7unvs8+G2rD33HM+RtQVb08IPP3VjxCG2DqV7LlbQYvjKx+uCGdHog1MVaknxy845RE5EsQ3mcMRQqsKr67S1tS2hJ46DdHFxAJvoPWg2kN8bMQ5xpxdIArgAD7Qdgu4Vt684xwkAH9DIUiUd0qsqWiqKTi+FfbqnvvmTDiryB88syIwSNiqgnV19F5Mcf26eHC3DkQCcbQgmu5pqgufqMC078PoA2DCy8JfXc/AXoOGvbw==
Received: from GV2PEPF0004812D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1fa) by GV2PR10MB9873.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:340::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Wed, 25 Nov
 2026 16:32:52 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV2PEPF0004812D.outlook.office365.com (2603:10a6:158:400::1fa) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.615.10 via Frontend Transport; Wed, 25 Nov 2026 16:32:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 16:32:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 25 Nov
 2026 17:33:40 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 25 Nov
 2026 17:32:50 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 25 Nov 2026 17:32:12 +0100
Subject: [PATCH v6 11/11] usb: dwc2: drop redundant ll_hw_enabled checks in
 suspend/resume
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261125-dwc2-low-power-fixes-stm32-v6-11-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Douglas Anderson <dianders@chromium.org>,
	Stefan Wahren <wahrenst@gmx.net>, Artur Petrosyan
	<Arthur.Petrosyan@synopsys.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jisheng Zhang <jszhang@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|GV2PR10MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3225d8af-93be-4580-61a3-08df4b11c09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|1800799024|36860700016|18002099003|6133799003|22082099003|56012099006|261021123027099003|11063799006|261102123227099003|261022075727099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Btg+7p8/ssmBMBvjJ61eA+2oDQp8GP6H5xTBGLN2Lf6ebvyzGnAxKfZDNXKoikpm78Rm+0/HBNpAbxZT+ZHg5yRaM1aj8xDI2xny5aYDvl0IPG67oWf1RWKxhxmbmKQH1Lo0G6tmTI0H7DduKXFCJKkJFQZemZbUEgGhLAJaBmp1yTCB0YXO7/+mnUgHoanHgMJLyqDZB5gzVABEQV4T8dCZpEQnR/a8Cc3+dx4k17X7rilSJU8ZkI1gVpUkXNY/tvF5wkEOfK8SskrXmtuIdLHtbLj92mvW82A5ePRUU0IA3ZvEv6AjQoOUZk8h/i7N/XyV98TioOa4Vro74mGKtTS51jDEmjEr0TEitgxK72e/WbzER31ZFoXDYhbBcVd1h4ybHHlTZC4c3p9khWL/myZKwN/bupi8GgiEA8TZauTwRX9chvBUzwBB1Qdg9MUpBK8qDYxFMdA4PmynRPgzzn8qOr1gCsram72qPn0J7zktD2attJpmKWRWIbftmtHUVzETRnOVcovfudnPSYmQkkI9aLZJyc5LomSAcPfqt4HuKP+49S9rDfLTB2OGJiGlXYPdia7fF7P6fkjYyE1t8HoT9vWrMl5/NPP/ojvKfAb4+8X+RY8OYkLv98QYFfwwR9z2zjTA1DivipmHbCcKLtUATavpWhTSNsh/4GdTuh6QSQSpxeOIrCUZgDNKoZ4E6fdXd1J66l78fvSgUFTQzQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(6133799003)(22082099003)(56012099006)(261021123027099003)(11063799006)(261102123227099003)(261022075727099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q693JMu6zzsS7WCgn8c0SQBfzr0sAKGcQrsgPOqAu7FzW6AFQDSIu41YH3Rl1Kpytoi6bG2o2nc2NY49RBIn5hFR7x37iO18c6tcHBmFwoTIMw9hrnROKrZBEc2T8q+ng0bVhHp6/e376ERgmgggassYMXHCGQ7EjBoU2pKg+pmquFe4KFFXVxvtrPi0ZCFdiH3Bhu3SSf0b9n3FUegHCd8Ev+t0r9LhIAz5ii+D2lqQHYd/sbXFC60TfgyRF89DlgbT8xJarT/hm0sWuDYJmPFteZd+/XINwTJXmyOeA90fBUEh+71/96t3+7MIRf9BKQFKARkuD3mdzGz11l7ZjcW7OXBmT8w/aHktT/ReGA65XoFqCOZW4YgKXvVDYrTksW+Lu2MASXEJSSk8kY6lMstA4bgCkQ5/eeItO6f6nb1WW0c60L3nZ18VbKej2qu6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:32:52.6848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3225d8af-93be-4580-61a3-08df4b11c09d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9873

Since commit 2b94b054ac49 ("usb: dwc2: fix hang during suspend if set as
peripheral"), dwc2_suspend() and dwc2_resume() return early when
ll_hw_enabled is false. The later ll_hw_enabled checks in both functions
are therefore always true. Remove them.

No functional change.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/dwc2/platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c1f5e03c0d03..733b05191dd7 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -781,8 +781,7 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (dwc2->ll_hw_enabled &&
-	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
+	if (is_device_mode || dwc2_host_can_poweroff_phy(dwc2)) {
 		ret = __dwc2_lowlevel_hw_disable(dwc2);
 		dwc2->phy_off_for_suspend = true;
 	}
@@ -818,7 +817,7 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 	if (!dwc2->ll_hw_enabled)
 		return 0;
 
-	if (dwc2->phy_off_for_suspend && dwc2->ll_hw_enabled) {
+	if (dwc2->phy_off_for_suspend) {
 		ret = __dwc2_lowlevel_hw_enable(dwc2);
 		if (ret)
 			return ret;

-- 
2.43.0

