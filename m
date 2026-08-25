Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0214028C4;
	Tue, 25 Aug 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662778; cv=fail; b=otsnhBLbI6YK1GU/pdOjtVJUemJXXprBnFyOV6+ukryTnLvTSQjHhhgDFDSWhmw4nK8N8lFvZRScisZKjhEv9eqbusiCioZ73E1uxBQ8KZd7hRek6fTkzVBAGLbF/PqrqByT765axTLdEPuH7VklodLaLcuwBS9syk99sH6LPvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662778; c=relaxed/simple;
	bh=Cr17i2ES0G4f990Qfo1cdyir6WXjf5c3rm3vVtqkAvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HITKqm0FwPqRgLk/U8iqLBwxqSAGr0FfIwRxvEs0Oe0E0wBepyoa6nN4T9vRBXsdYUcxSfnGGkLwYzVWm0qG+rfqGav92H7DwitlXiR1koXXtO2jhY3Ju1zAc83/G+69V96jnFYppGjnelfTO6FWmIduuWlKzuw9R+aYxwdFQwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fs5bE7iS; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fs5bE7iS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGAz/MYRCI/csRt0J0Lu1BUn7BW4RPCEWE/UIk+hp5aS9Tie+tKV6ZAVmy5smWK9vurKZiLwTm4zJDPQ/QLfey4wE0meYgP2mt205wZ+Mowozak1xXBPB6bTKed/x+7AQv5iWVI5vkmzZzm+dz05htaQWFEjNDLLwbjO72mM5cFgsZhmtdkxidAI3RYK62ivJS3rstSKrVZ8XdqQ/vRke+C4lkyMRDZF5Nryd9w2TGpspX69xZghHX1XqCg+ECHnNl3pUg4Z91IICpbsdAf6/nGKWMYbXrsxYICI0U3Szg/8Kwo7AqDLRggu2aVwdHIBoUtOYFz3znF3nmHJnn/fHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYoQg8burNl1O92tFboaxLqVAK/jKKaeomv38237lpU=;
 b=RUxVSo4XrLIp0fpstQrNnyGM/nZHz9/818wintIGsLyuOj2KXKJvCsmHYkqiz1B0BFovhj4o0j6DCxLHeLjgxadfddjoaJr7EJIOMwj78CPpZfpkP0EYFisQKHb8Dbyc39lh1g/CPinJ/NFP/D/YOUKhRziHS8CtwFWjx06eaPp/catlavRBfq4gRqqIFaOr5GKQJ79uXFkqJwF8NPA1rweVijA5ZkvAoBRbWkzFk4kX/xijyBYftZ6bqLwgAB1alIxO12PAxXFNl8EF2XqMRHSiWqfoAh7WqFbwE59fB/ALwWdnIVvRxkH+mio/0vTIVjHjTgFJPnoMDb2lUNMRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYoQg8burNl1O92tFboaxLqVAK/jKKaeomv38237lpU=;
 b=fs5bE7iSL8zhX2Wm6yHRP9fTWhTPvpUJ731RhwruamzX8busuISgi+X+4JTMS9rKlsZ5TGlYL1SJCxN2NmY3HYbovLuWKXm/lFGE0lQ6gEe8en8YPX72AY5qT8f973fsZZLpgwpcHo1Y3AnuzkKFishkcRjJVuyFKMeAdS0b1Tt73kRg/c1w1FxL87HvfIpKDR2CYdhcpZ4hG6HXxmkKSXfVBVAZSMvJsHJP28ohpbQYiHye0HW8RaUjdppZwACHoAznTztBgOU00QRjos4wkKoMHQH7KAcsT7LCZcCP2IaFfO3XG0WUCGGxLsdKyxaHMoMdCXq4/4I4AV1UQKupRA==
Received: from AS4P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::11)
 by AS8PR10MB6102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:570::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 12:59:30 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:20b:5da:cafe::4b) by AS4P192CA0005.outlook.office365.com
 (2603:10a6:20b:5da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 12:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 12:59:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 15:04:48 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 14:59:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 25 Aug 2026 14:54:24 +0200
Subject: [PATCH 2/2] usb: typec: mux: gpio-sbu: enable when only used for
 orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260825-usb-fusb340-v1-v1-2-2191179b0661@foss.st.com>
References: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
In-Reply-To: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|AS8PR10MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fe2939-5b35-4c9f-20d9-08df02a8b3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Ss7M32VDIpht4/uwrBLBbIqul24VgeJHGyOuQjSLyEBUHPNKlw5MFHmjKP+U3B4lIAdPJ937nFdS9aacRtlCkUANmPjijti0ZF6H/W7xRA7YNKKsK/MJlt+QI2kbGrffvpI9c2ES3VlYj86oiAqdg62U90/0NC3QwhoHQ3s9X8LrGQ411mP+Umb52DZyds/ZaEalKiqyltjADShJcI5L9kPuzF+xeU4yFhua7ps6To3L5nxd1sFsSTLVUZU2V28vuL/VgWql/PDJ/YlFgx7lX2cLsL+Z8vq9hVuMBzg6O/0bD0eyPKR2Aa2fyPWbbk1EeoK0eaYmA2FOy/OuvbL5CipeEJK2MeW1Y0R0d+LjqZiBjlXuMngs6TYX+ghYuL5SF/DOL+fTStfQ3yv9f/gE1NLfcFsEy8e00PeBypMGC1AK1zBcUCt095L8twir3OM658H65KBdA8ziZfzXukRra+mptpSs5i0sJ2p+bXrQblM6dtLJe4GMGCL5rnw0zUS4AkO6uKGkWnI7ndhOwYEr1CRFnlmued2v1k3K4yRtLm/uotWsSv8HlHcBWGixsStZF6TNvch2IYh8vAQJA2+SJdxLDzVpIe/iN7/60QLEr3Wu8DtzMpSLWsDN6g6X7mxIr48egyokqA+N6TCSorFhF9v2Ah1vORXW0UwcXOj7eogyVFwDcUOmI0HrllO8a1D7p5lIB3TSq16FV4d6WIrRQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5aCkkJUg4GOUmJBZfYOjq+2Px65Foicn43u3mg9JyscE67z0pWcm30fPqeRxbhTC1hxBf7mCtV+XL+LWCZYOvBmsV/V/lEIdLijc//4umEQgEjqoPiGJuFgCeHEFRL4/jKZuD5jhv+P+8TcS2WMpW8wO+lVQnrEAp/s4lDw2GZFAaRqmnjF7GhAJwVxLmSHPfFSsFXSLZDBXxObXPHFxUHQ37PWzOVEJO7J7Hsnnz+0n7ZK7OMr9bVrJraRwCyQN3VycDYgQD8QFGKsRja50q5H6SW+kJs7NZfRZ8Ku9lPk8aMZAphAlYjoGwYF8sOlv9mNb3lMxJ4PB7SjKnnwaKh1qh3jWXxhaFhr+/hEy0ZR5Ul6A9mOpIIVqzT2Zm4b6Nk1+4d4+WIi7TMSDU5lLqJU+lHeZhGSuv21wV5c0zVVFxEsQILzgwJ9BinH2jPgO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:59:30.0597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fe2939-5b35-4c9f-20d9-08df02a8b3a7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6102

When used as orientation-switch only (no mode-switch, e.g. no altmode),
the optional enable gpio remains disabled.
Enable it from the switch_set() routine, in this case, when the
orientation is set and the enable-gpios property has been provided.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 1834f1a2dd9d..4151d78e3b8d 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -17,6 +17,7 @@ struct gpio_sbu_mux {
 
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool mode_switch;
 
 	struct mutex lock; /* protect enabled and swapped */
 	bool enabled;
@@ -40,9 +41,13 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
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
@@ -125,6 +130,8 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
 				     "failed to register typec switch\n");
 
+	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
+
 	mux_desc.drvdata = sbu_mux;
 	mux_desc.fwnode = dev_fwnode(dev);
 	mux_desc.set = gpio_sbu_mux_set;

-- 
2.43.0

