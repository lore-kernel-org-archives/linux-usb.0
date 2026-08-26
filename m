Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502BF40681A;
	Wed, 26 Aug 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738011; cv=fail; b=symVw9Wwi4o0erDenGOYqbhfmxDZDcbvUU5fzcJP9L7JkvGoWyf8zHixQWE1JxWQf+X/fu1dDcnH3APEn850wDIwmkgjenSmupegDkDA2x0SOecDncQc3SLmx9bhw+lulTSKOYquX9HvCVPOficFreL5iS8l2FCbHvPBMyUkhuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738011; c=relaxed/simple;
	bh=TZK++mmqodgZAXGtqFFDJu1E09kYPk7jBX28pslehVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hNwvGcQkufeTOkmTH8zqydM2D6iZ5JUiO5G7dr3/hCMkAuA42BGd/9/vqMYtSat2BiGTeL6zkKy1hHogZIAMUEVhY+by2KuEiLOxlhxkAOXEeXbm6+aVmlT404WntVqUj79+CF9rL0TK7ipPoY3xtgg/9k3VcAXBhJNBdusoI7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PntvUC3C; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PntvUC3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUmdG1NjNJXShYWGwK85dq/lBDMJpAh85DWL/d7qB3J1QHrmVWOldw4tK73tSr4b/ye9uPkbmqQKdUISG/Nm+aXkdDxNwfIEDXamc+xC54tIn+kSXNvCn2xTvefaauzM57TLLpyU7fVpxYt7zMVDwQDPlqjnheO1xm6J+jsjxhuR9DXKFM/UFnqH+CcBGl2BcRj1WVftATiAo9tk3uJOCI+d+7/am+nrXstqONbCzrKnWTKz8jexd9Y1/pjgt+jyl12OQjmNFGLS/g1s7UfLMm6qumOD6h7pTg6OFREYxUP7F6Uv5lRBqm7Kx6gad15y2FF6EMXBB6HTzhgHc0cTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwDI9vNnklp08M6popwu3Mt4+lnTeEPq8PaJ55hoTPw=;
 b=XxyZOw9RoahFYFA/kOHUa0vIzxKtxkzSCvWodkVK1wDQyLKqi3T1M6e4UYBcOz/eEzs9C766yXoSQ2m+cYPb7O8CQvrnBv5OZjBoGEgwhvky6HrPq3Ed86wFe7pcRzui32Nhc5yOhfgHl0drA4XH28puEV9LZ1zQmW/ZWq8Hur84KolUFknsb7Cv21x7dGo0yeMa6rDEsP4ZBOzQlb4sBdB8y/fUxHT33mWYhI1ecntpHAuKZ47Ftiulrz4tsPrU/D1enwhdS5mSUDt6mfQ98uDILsMIm82DAFLWKT3ndg+Z5XUFQ5iq+o+/eUX7/1DLLc7eQexYGSCR3XHg/nmElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwDI9vNnklp08M6popwu3Mt4+lnTeEPq8PaJ55hoTPw=;
 b=PntvUC3Cd1iZchtJhtvL7xChUwrH8PuNnx9vStPPbcTpU+2k7U079q9VWPodj5CJh3w4s9eC8eLBJdv89FmtYxd81fDFNjQtkiq0UqJTKKVZ6thNBZ0MRAwxqBwRD8MRpeWTqeabWf2mssflvU//et2ZqYKq7IzBleA+5C7BU1JpPoeLp5vH+at9hSKS5MJsINBpSAnDNil58L6CWi4LJs0UDrCKh+mjslc6j8api3FBcNxvBwL79C5iu4YTNhWV9KEuv0uRaZLQ56F0fm0nmazAw/Kib8oRqYR5a14Tx8gqgNB1r1JHynls9Z8zeIM0GrJEXORti0u8fcreBB2Q0g==
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by AS8PR10MB7451.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ab::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 09:53:25 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::4e) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 09:53:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 26 Aug 2026 09:53:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:58:43 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:53:23 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 26 Aug 2026 11:53:14 +0200
Subject: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260826-usb-fusb340-v1-v2-2-994a03c9ae45@foss.st.com>
References: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
In-Reply-To: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AS8PR10MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 746ad98f-07fc-4631-4176-08df0357deb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dzTBJk1nD1Z+QHhxqI9xqz81uA9VtGsb+GjBcFd1xI13BFG+q/qPw2VBUaNbAc1bu+BJI4IODAf4vgO3k/XR99Hqy8y2Tr6QNnsezpjAIpTnegid3buPNjoKiNNBuEHFrPKAmfPqiO2lzk4SKHI/0PoF01kjog7nuxWYVPBHH8HpK/v1F68H0bxcDLYdC/T78fUTyl5UYYlxj95vWyaN9G3RsbsQMPXWZiMs13xRFYmeFaVZGC4/1QKi3ddazKZz65CKH5vu5WU+cx7+Lm407fb4VINUoBnlzYMryRARpqQbqfrK2Asvgr+XixEc2vFgmnyeB0pOSQZxtzO600iyUDMURt70x0jds0+sCzqkMDA+lvnmrqR/fTGY5UNcoDKeS5CI91JbJ52Auz4rHvH8pJJ6YhykhtZar4LrYC7ErOzq6Flotre3BeLbFerrfL5LiE26m144kp0W6axDwudrNyUIDaTz/d+gR18Ch9E8hNT9tiVUT5Fulygj05VmJVxz1LImSiIlb8pqdmAGawoZG93sXRHYz2NYBDRifYvedh417TIF/biKuAkCfmx795Cp+le/VNsBC5oTLLuZKpH9KG9PDxmE4Qqf2xGk1F8gofWAGedzLBfpv1yMxBW+Hl6CTen+3ma+1p4DKGaEtF/CRCY6yNR04iB+xTwgwZnZ3oMYrWIWqbTpHkgEAIYOV94KNlSsn7z19uuNjdLgtEXXwQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LUDavp5npY7G+S4pZ+T7w0q8Zt0G1fF9VdITNt3xG5wB+/v9D/h5pFyQQTtj0UDboyej1Wkj+GbRlV/RUs5GmHHj6p0v0v2CLayrU7BCQqmruXoUlzFfOTH/0/nOJMaar5eoUZvQOLGkAmnEH9ieI72e7TAfk6gOs7FvzVNunTTketodrpKStLeM4pSrThTNWHuCRA2D8F+a9sIVncyXy3QidNj0hE0qGiK1wnsc6jpBf12HMgOuBmlcYi2Oym+DdSKA1kL+GR+2r2+P8+pwGPe5W1EgTdWHv08X++HqYRxEGUFLlSQr8VGM+WqtC/Yv3DX9fmwhfV/USj01scxRkKxS4Xs17HasqSvwKqt2YQIabg+YRwh75YlV4Pde8i7szB7wH3Qh+gz28JUoU894ciKSP78+PKGF9/sAtFVtDA+WBzITqF09IQb7pch2T83u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:53:24.1756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746ad98f-07fc-4631-4176-08df0357deb0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7451

When used as orientation-switch only (no mode-switch, e.g. no altmode),
the optional enable gpio remains disabled.
Enable it from the switch_set() routine, in this case, when the
orientation is set and the enable-gpios property has been provided.
Move enable GPIO configuration after the swapped configuration has
been done, to avoid possible glitches in case both signals are changed.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2
- fix issues reported by Sashiko: probe mode-switch property before
  registering Type-C switch, to avoid possible race. Configure enable
  GPIO after swapp GPIO has been configured, in case both transition.
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 1834f1a2dd9d..120f1ab5dbcb 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -17,6 +17,7 @@ struct gpio_sbu_mux {
 
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool mode_switch;
 
 	struct mutex lock; /* protect enabled and swapped */
 	bool enabled;
@@ -40,19 +41,24 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
 		enabled = false;
 		break;
 	case TYPEC_ORIENTATION_NORMAL:
+		if (!sbu_mux->mode_switch)
+			enabled = true;
 		swapped = false;
 		break;
 	case TYPEC_ORIENTATION_REVERSE:
+		if (!sbu_mux->mode_switch)
+			enabled = true;
 		swapped = true;
 		break;
 	}
 
-	if (enabled != sbu_mux->enabled)
-		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
-
 	if (swapped != sbu_mux->swapped)
 		gpiod_set_value_cansleep(sbu_mux->select_gpio, swapped);
 
+	/* If both enabled and swapped transition, set enable GPIO after to avoid glitches */
+	if (enabled != sbu_mux->enabled)
+		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
+
 	sbu_mux->enabled = enabled;
 	sbu_mux->swapped = swapped;
 
@@ -125,6 +131,8 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
 				     "failed to register typec switch\n");
 
+	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
+
 	mux_desc.drvdata = sbu_mux;
 	mux_desc.fwnode = dev_fwnode(dev);
 	mux_desc.set = gpio_sbu_mux_set;

-- 
2.43.0

