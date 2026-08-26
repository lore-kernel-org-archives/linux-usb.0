Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA540B103;
	Wed, 26 Aug 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738013; cv=fail; b=gfeV3910ZXotw5ocK8yLbYNkEF/DAdsbKyxe5jSN3aKanzurrvNqaUIejg7avu4uOY+agSl8PU5MEV6qma87rsbgpYuS17UPcprxhOnM7vZxj8WgLGjIifDjDr7GPqfRwAEGxGawi4odbhRwLPB8aKBPGuNcKG2UQwmPrEAdw6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738013; c=relaxed/simple;
	bh=vDKHkXe1oBg2YZWHr65P67l5V3lJR2g18kei2QM2dcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cBFfJBXJ2kogR+ZMoo1oYzYdmrR1FamlPCIWcgOvIX2vpHOlTHEDnEIT2VTnej/z7Mn0KbneKwfC0AdIUcO1520eDRaRsNMFy27gFtCQ8MEZczSnpzt9UGTr7iTwU+KPUaXbkhOC9r5ZnjKBtB5BMEnd0PNPVayFY1UM5Rzv2BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gjgw6v3B; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gjgw6v3B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHqgkn1LWq99WS/ntsyOfzsOE0Bow5b6nFP+EZK66HKGdnksWlKZEp12ecx7h2b1+UnBfqhWY/mCNrEDtXPzM8QmQFw9hN1qH3VahnbjdNaTug2XAaAy1179Nj5igYdDwoav2gn5p9GoVPCJlRfMlFew51X1FbjfbJ2WEBRkThgTuuKdRkEQxjCjCPvEQTPNmwMtYpoI3YSvTT1SzBb8Siv3f3JgxK/kUyxXw7AqNVbWFjtNAR6/0mQbBuOpJsNIbUgrxEF03W7y+XFvcJMS6ZuXr2ztqBAeGrXahXW+anu/Imfd309lnV1v440hSW+0cOuMhmHj4KYtcKlNKa+Z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGpnKBBYO3gmiL2t3vu52Gn4AT4WKoggTVZpo9F8Vak=;
 b=G6MMjMX9TbYjAKwtjo6/PRGODT7w4w3irIDO3tyqzIG6MGxEp78cDdFsTttDcpCVl8qztZpzjCOv81T0iBqPf60281zfaP/eG1+K4nj3G4WP2aAo6euYDNLXeipZ5PYIMuDBqfUaGZpe9oWWgwbKjNtaddyYntz88HsVxSsacbhpxEq8dFku0VNr8iy9FxU9LtjUYl0OklPsNnxoFtQqoRU9QLSLpRbv/9Pgyy21/Tv98OXP97r7s7wpGodf04Q3Aubis8rueycKjHidZ6s/FDAapPRG9uaQVTjrIv2ZjHibkRRi1t3jNj4lp+jrb0HHsS9H3a2pSUfUkBhS/hMjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGpnKBBYO3gmiL2t3vu52Gn4AT4WKoggTVZpo9F8Vak=;
 b=gjgw6v3B7rr12rJ4H5Hob7S4OzkSqK48pXe7Q94k/QInMl/IddikONzWNkmMN0EY5KtLuzUmomQS60bpwf/WkfxZW94eOFbDe+X/ZijX2HGZ4EyVukcUvEt59LgEWW4uAynjxQvffpKIDTeCRkhsiLM6uSmnLN9rhyRoCNfycRvrfkaLSvC+xa3FCBm42PVJq1bDBezKY6KHGgrhguIhT8hd06/noMpiI1iQWFq+iOE/6e5leX9pE2L8JYiYAeUvQ83s5SA74n49XBbJiKqItn29w1imAzBgQ+MnhEZXnanFg11VlgBVSwpZhVZZU1oyoOkng7sO4WnrS/yNFe0ZcA==
Received: from DU7P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::23)
 by AS2PR10MB6544.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 09:53:23 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::16) by DU7P251CA0021.outlook.office365.com
 (2603:10a6:10:551::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 09:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 09:53:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:59:17 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:53:22 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 26 Aug 2026 11:53:13 +0200
Subject: [PATCH v2 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible for
 FUSB340
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260826-usb-fusb340-v1-v2-1-994a03c9ae45@foss.st.com>
References: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
In-Reply-To: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor.dooley@microchip.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|AS2PR10MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: df68a0fe-25c6-4639-ca4a-08df0357de47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SmnscG0teOcF0GKRsISCE6IluwS3qPL5vLJqbwTT1urNKflq+1GvGuCfHUgl2Rg9VF6oVXTb1y97xAFZlIY/LNZ3QOorp4LRDNwtkYacTYqTtXCrTNQXl7fLkBsRLnr3ABLu5k5jcgJvLFz9UfpLGDbgWKCo20sG000hr231JDzuwB+RjqMyPBik80ASIJZrn4aaV9Ahh7ONo9wU2q9OMiSrqgD7RKMBJs+lZLkVOvUPdn6r26HgwVESKWBss1d2NL70nS/gkl4374bsZqzUH4i0dbT+sB4c00e2y/bFfXvEDuqmaeK7Yu7ZnpTVaMC/YnRbDoIKy0JtOiIUfRmkzK6HmvdYX3iHTk0fAq63cVrLj8+wopM93JBMS0gZkWPgiIUHKouVEwfdj+9KsdYRWlMIPaNcikBVxoifqDTT6F4eVIDEt3JMtHM9JikJDaR31P5O/CMZ80d/LwucvlX+hYOggsBaxE5RE6oYyl5NRkEsQZT9pria08b+3FboibfP5ESoHFM4FN4VfvVIeLQFEVm35aLmytHaOlAfqk2JxYLrWvaBCX5PaiuLqzkGKgoYa41a/mJASyRHA7XJZFugPUJ2C5+ZRVdCpQukgitr88Fqa5AN04sxFTbBwghvMCU4mf6L9gCyjMBLZ6//xH6h2uAnzAxAq8/Eef0w2BBDfmhTUGNAM7nmo3ZheBlilipAG24Gq/ZFLk/ZJq9XQrizNA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wHhhIF9T7pc6nEKMHGGA0BymTO7jLmdDPBvwDzxr7lX+cXaGq0sU8sSPXvw2p4r+O6CUcI9i/uHsl9XtSiykMHZO6vhyD3fP+PGoZWZ18xYzUKPk+swX9eAvECv32+bRiNTcdRWQ15dWOJRDrobeJJ11vmzFmwOOt3sdvm6X2NvcrYxqNzRSQBrzOE30HWdbS+lVkjOJ6H921P9LC1Yi6hoxVZ59GoEdkdNE1/UeY/XbyL0ER4HuaCmKnDkcHxa1vFUxWWeBTVlsWTJsVao5DbxjyTcSUfiWw3W/I0OvlSDccrcntq9XCUaYS7DOdsDFrYnjGgFO+mt5lKotM/R8ugbnHJr5k5IdmCaqrepO12dzCckqCFtK+ARW2CL4n9WcIbvaG7Gda7Wn4gNBmwkNkeTWm9y0YOSLhMhujnA1/zgF3YuzmApRVCPLQaHjSB3H
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:53:23.5031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df68a0fe-25c6-4639-ca4a-08df0357de47
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6544

Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
with enable-gpios and select-gpios controls. The switch can be used
in Type-C applications where a reversible cable requires a switch.

Suggested-by: Marek Vasut <marex@nabladev.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 793662f6f3bf..c0e60848d8ab 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -22,6 +22,7 @@ properties:
           - nxp,cbdtu02043
           - onnn,fsusb42
           - onnn,fsusb43l10x
+          - onnn,fusb340
           - pericom,pi3usb102
           - ti,tmuxhs4212
       - const: gpio-sbu-mux

-- 
2.43.0

