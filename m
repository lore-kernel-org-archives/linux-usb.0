Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E54D991D;
	Fri, 21 Aug 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329421; cv=fail; b=KzMX7VO0syny1cu337ZlYSO1f4u6Py+GxhkGUcO/TmCTVy+GUFBs13cPyRqC6y6oP6RW5q/7t5GrXhYJVc+IDu23O5q0x0pVH7WtCJeiVSNIU7yKmQDLZR9WsbRmeBOiMRbWXwudm1fXmCXwquFVuakc6fuutg/VhacFFRU89lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329421; c=relaxed/simple;
	bh=IJGIv26UXk8g1Hg88br9BHr+pxRyRPAhGm71DJ9X+jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DVu1qkoGKay68fAEykzWlIa+Ncu11K+/+fyTEVoe7sD8I8jIgllocGQAd6/TBKU1IVBLUHlYaul0cQE1spOIqqXmWTgqH+oNuadnuFW5FPC+2ocuTVFx9zr++PnX2HJymeHR0Yt1ABeY6PCTBXlB57n7j7p9jrsGu4cwT2G4x8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lx0HOFwg; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lx0HOFwg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXm8xwo9/TwjV1m7e/2KOfQIAwcFe+EkS+rXkNT3nY1Ukeujrxy0doQ8g8bPRwVkcrYpR7zVPytGJfdFGwltLI+cJEBBSijgWBWylfSdeuxfe/Y9nUZN2EQ5gWyAH497gXmvtU0VPWOFzfwXXzXb2Vc2HOHzqC1D/amS/nznbkkgrqXgbIal8VZGvvEWHVPgjq0E26T/ejjdztBXHXU0Vsc6HWm/lmGVtzYBabBewKiD/fcONkFvtqzRyYnhjQFzD8ssPHSRIm2EWaI/kyuKzguWj//YLyku6/4ShxBKUCDa4euX6jAkwL/tXlEtB231G1tk4opr64ZWa/6NIPP7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu8it0TD2v7Ji7C6YAX/nz2wYtFjHHKK0TXZxQ0olB0=;
 b=e256d/cl0/WeDVe7Unb2sr3vwcT4CKSXSiEvYg/LF2o0nmC55tQdACj1zN0gfE8R49Sbn2dvjZlnVdRvtguvJmKQRLDa/ak1+zvy175wOEqtFHRyUvQQwO+skNKeyXDbaOY6kDjKGs+UIaRLoPnJpHdk0vetOhAxTPbJLOzbJXR7nKQ3hjGLljntqDd8dUNckZH43KRG2ysPIGlSfBGVvriJCMM97L0tjr2aPOZvTwhQPvD4/iseywL/js/+D0Kwmd7ZRFfEGiFSFvjBkGuf634QhcFtfGjeukYznEbDWN4QYsKjvgC/a7xpcM/q9qzIO8yeMW3sNAX/e4BgAiR9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu8it0TD2v7Ji7C6YAX/nz2wYtFjHHKK0TXZxQ0olB0=;
 b=lx0HOFwgK0eKjDK9kWs6HEn93RvcKCVvU8AR1jRXiRHAd3e63HZbwZVFaJayyZQcJRqweVf7y1FAWT61dwabBumk3hePTu0Shpul5HNv+OuiMFxf1t+hzNs7rppfTwQJvMP41Qbc5ypRNB+9Jq3T+iWcXPJ82hjbhZf972+ur2AEozG2XVl1mT71QuA7um7ce3/UDx27zrIfeeqq8OxMHsX0WuY3cfCvN60DmMG/QnvS07UeBLf9u2yXrZO4rum/qjYNWHYUMCbAdoXvIVzbKtxpLlL3mlgzqvK72Qa7ARpHEBVkg3jS1q9Qyo/99AcsH1mmgqlJCjgsiCQXAKyXeQ==
Received: from AS4P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::14)
 by AS8PR10MB5927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:529::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:23:33 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::9) by AS4P190CA0008.outlook.office365.com
 (2603:10a6:20b:5de::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:09 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:32 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:22 +0200
Subject: [PATCH 11/16] dt-bindings: usb: dwc3: stm32: refer to dwc3-common
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-11-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|AS8PR10MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b52bd11-4b44-4cf3-ad05-08deffa08bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	8407csrIuotfheYxyomqe27lNYyN9pP7VyXIlzTRhVPR3pqCFwiIsdQyLXqf2f8pj4nmhrj+TU54rxSAqPN4+2MQJYCXrYDNlF7GLSpy7Ty8E5hFMUru/zkM7hmkp+Qgt1Ytu95s1jv29DtsChxJoVB8ibweku6AQN6H4U3M5ged7Y/yU8xFMXDguiaJPSrlNspafjc5d96xStvzqIRvw7jpF0sK+cBeW8D5Rl7SdaggVCPLzBC62Yn1DE9P/KjArQKedqmYZB4hzSOJyAb8Ybt+bCp/mX557HqtqmQwUaD6F1Csm3jON32/HahNHqjZnYzqcFDxfWEi8J67uJ9BtXXEPty7sNsA0YUSdsP+mbZRbZNSu+tlaLK+sTMeEOPS9enTl46JOh1whHwOBwl2+lvmuCrgVwwT9X1FjwsrP698Vs2ZnwJdwXH9Kxu6SQKLAEof2OdPZ6Q97ZTf7vFI2ztzKSdZhVJcFRVCUL2zJu++CJxZ9idllnxDbpHdwz5oPJk16iuGTnuodSC3tXDqLPpdgDMR2L8m9AqwGpV8vvR23Cl7QRv2IwlZFpU7aXmZrrcgSq8Bn0lq81BiY+zImrauSZVTQGJdgi0tCxdrl22IdDCXxruGfWfMAAY4ag77fltplCcsjEl5ZOMNklmHx2sYfEG2aJ3V49fKpw18qaKYYvSqE6XEjZwT/CRy3pChxrhd+RoGlz6z4zdtJSUFMaEyhHOS/C8t72iQIi6qYY3prBjZUNmwtNqQTlHf9TtZ
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rt6hekd3gPsI9upO6a+hkB8sa1a35yl+m4xEQylau2bzhmFg0F78lmLZjs0bDE7JulVQoJZPZQcOPFGVmcKbiHiG9ysFvEgN2tBz1Uubjy4heYnqmIjemwq8LwrMuzhG4i9KywmsQotdTVF7LhZK0B7XQ1keMpgtgvIRILACIxT2wo0wSBcJR+uys19nEqIj35i+grK3RkOOW19Ipf3bF5eZp7l1GxJ9w+SScK8TzbfofewMDLNHhFBB6EWgeX2wqf3lys9Vp/6uKms3qVdwSw1PVDL9HkHTM0h2D6UIaqgJxmxH3CMh5xEq9yy4JjkXNWX9QPBCEORbzB6e5nnpFt6E8UpVsDDGnP6sUz9EH97dnx420KayZIPCq5oq79MfG3n7z1xNQR0xv8wUk3PI0vw5PEzhbdS4oG0y9QVl7VyxzCSk/QtwHJdScDMU24bH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:33.6533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b52bd11-4b44-4cf3-ad05-08deffa08bbb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5927

Add reference to the dwc3-common bindings, used on stm32mp25.
This is a temporary update, as it depends on Marek's series [1]. This
should be dropped in later series revision.
It's a precursor to validate further DT addition on USB and Type-C, with
usb-role-switch properties.

[1] https://lore.kernel.org/linux-phy/20260816213849.1044073-6-marex@nabladev.com/

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
index e377efef4350..161c5c287925 100644
--- a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
@@ -14,6 +14,9 @@ maintainers:
   - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
   - Marek Vasut <marex@nabladev.com>
 
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
 properties:
   compatible:
     const: st,stm32mp25-dwc3

-- 
2.43.0

