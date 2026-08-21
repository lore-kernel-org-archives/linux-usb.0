Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A134D2EFC;
	Fri, 21 Aug 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329424; cv=fail; b=DfL0tvSS/AQQqRLzf0gX/1iWFDCj2MoSRyiGaVauwFITWAvCgDKUY4fPeKMRe9yIhG8Xm/XiJ1r4nZTQExQfLMJqmyKIjTqniyWt5RzcN5FCubmkscHx4dz6FTB4TmH9l9f4zUJy6VXopGf9ZvCyKBQ9SnVRiPaXNBSoDbAkucM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329424; c=relaxed/simple;
	bh=Q8oOF7SNNv19Het2w25XWe2NvvZAb/iedut/HX4t6NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WfgFh+fhVaW/A9VEI4AtF8eabr82E3UwJNIony49NwwAxXC2yL4/UZ3nGI0r2BuSOKuSrWxHxjpIEPWtYaOF6dFb2pkwO/QUd6pR6Pfksr48wE1LmLHlO7sl0gA8sUhEnVClnu8XZ0hY+cCdy9g0ZUhXma22CtqXIGq8OaYNzk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CvdLTvSX; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CvdLTvSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO6MPeFi7SgZ+oxA116j4CZMUbUD5y5D/nUpmP8TBTL0SCXF9O+GC3Ie2J/WgiRs+Nej0H8rr+VLhONtqJSGtJxzDqXJjdHjbfP8PQb32ni+zKH2vwNEtoG2MGC5hF+X1uCYH+sLqCvGeEz3zyfDziMjGwZbmt453Qb0T/hmOIWRFTl1iyUfC9fI/4sM6e6alFNEJ+pf0MZPCfF0I/oCFJa68WgOgiGjFbX5mZS6r2gUpvDQX/lB343C97INYG8V2F+xbY7wMM4Bah5DP/vyzzfIryuJtsAn6r0srpA3o7C7zldGRQ44j4MkLc5ZD5Mr26o4+/6VS7bUOyQLsZHc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MU8GM1wsNJfE8HrvUQ/mh7Wq67SibJX7NyjBKMAqrE=;
 b=lTE+K7IGecszpKi0WJFMjquBYLslr3b0nFNA7MtetxuMlZcF9zqEuuzEitCwuuz67RC64bGh6tL65A8WZ7wjyUzUhJRU6Cxs9Z/sZ7TsoGg/mNv3X/Ype+IxK/0dYpBwfOk6E6AJaCaaMdaj7XZbfyOMHsne6aZiRRO2dyRkheiCB7grYHURhakScVbykl0JWlPjiDAaARMA6cnyBqk+42/eb808EjjhF9YQt4RzvvA/XCpvLWISeLGUCWYfIweAQ9hpn3P3Zvz14qGwVe7IDekq2l0tSwdAHN/CMIXf1KMhsZ0BPuvTW0hxEvH9RQz3NUBZJXTebkIqYqlUtXK6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MU8GM1wsNJfE8HrvUQ/mh7Wq67SibJX7NyjBKMAqrE=;
 b=CvdLTvSXYUuS4h9ByOgLKNBdBMFX9r0PZq+u3cgtWK+ii+scifcEP4a55HeWvNAYDrhGEQBGgdeKF1g+cP0mxL4FrqUwun0B5ZWAxyBYVfkxx9wkzzUa1ZlD2W3OOAUlCm7xiPIROxQzzsrdm/mU3nWcJuOt+ErzzmDmEdyCosBVHszLoAlpRxFAenz66mcjLiJNplj4A04YMb4/xtMPZrdWrtEX+dfgmNqf02r0OIcFb7hLbO8bYzAIJcfG9IqP/8Bu8uvWPdMhTVpcW7+bYgQmGQKBskygcFFqZXw6PZBFw0s97ojUE2yASLspFc0ZuWZmDX1MHK4xhZNi54MujQ==
Received: from AM0PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::17)
 by PA4PR10MB7964.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:272::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:23:35 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::59) by AM0PR10CA0007.outlook.office365.com
 (2603:10a6:208:17c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:10 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:34 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:24 +0200
Subject: [PATCH 13/16] dt-bindings: arm: stm32mp2: allow child nodes since
 simple-mfd transition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-13-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000193:EE_|PA4PR10MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: e4900913-24d9-4dc1-ed2a-08deffa08cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|18002099003|56012099006|13003099007|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	YHDbeaYOd4SbJ8JmbNuhiO/pUKSpUuKsoWFjSdXDbGaB0QG7FWEPqdx1alX0zPJ5Yr4adRRT5LrW8oZzPHeLw6Yy/9eLgSzXprzRPMFhevpH8+AdcS1c8/SoAu2LKofzgYraKwepQSynPcrIsOxIDSCXucQGXZxplxnrKbkjj9JPQsoz2bZ625MrpSV0eXBVNDP07GG1OS0baGPhrSLqaEjD+kuiB/zT23hsn7FtcVM3D4RuB4SFJF61MCG7qqdT1wPYAHOYAoTPTLdYkhQdfpaDWs3Cp2bBHV6OspXaAGmxorxeAKBPAK+cnaAt1C1i95guKl+lM7kAjG5flVHl93gZP4pwg2XO3wN9iuTt9vSP4EI7mR9Gze+7Yzc0gIpQdXx4AjLkN6EF/61Futv9GgHa5DK6HD+oZDgPINfORV5+u6BOCVhwKD52oYxEwLBBy/d07q/nXezYznOomj3JZ6jMrJdM53V2c3RbW6FYwVkocUjjij99o1hN3WUgpHQoZPLHy5iKVJH8CojZaKx3sDqBnJg/RJ43eQKEWxNdN7WwGjIlqe+cdNr2gnrEc61vIIFmUeMeKNludj70w9Ysf/DYGADtbmQ9a6swdg5mtGlCWljhyfF4dqhaMP3fI3pXlgQNjlYpEqfXIgn+tBp8JId+P5MdDp7wQa9xlRgBB71q9hM6eqgYFBTsYi7/5OJODaWk9g+PWs8nat5wZ4Zt3wz+D4dnJY1eQdIWM8D2YPPOgJVTVZq3voCNT3oMDwi1
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(13003099007)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ReBNezAASiMmYMvmc8YDmTi8c7z89BE2RI8HTYJarIsXnyfBTUIf+k5+03MAyeT0aj1rAmsiOCSYLPrU9SiqAmjb685bugjuNQlhKWslMxlz4WF9L84iweZBJC/YlhHaXhCSNi9aLODtszLiWQG105VDQPsMqvd0AXTFFmZP4WvO0tz/LloZyvWirhOfraEf1lC4rksgkukgPypZ8RrCSRxWXldpmwYhDMNaXlz9Rs49qM/GyzFxOe6ye+Nz0TJxlCiU3ibXL4jnsLx5fueGUSPdLl/oNlnIb7++CGa6k/Jdrp9jG4ZURzXyj5Jioy67MgegUpXhgaqdFLhliN/AWB+ATC+8O0zZDyUA/70oE/Q1mqE6hYIzj+h+bvtTn2eL0I46Twvdv8PZYcIa0XQJWzweRcoviDal+F6YbVm4yvgyJFVclAsbN0xYbIkm+0ZF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:35.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4900913-24d9-4dc1-ed2a-08deffa08cdc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB7964

Adapt stm32-syscon on stm32mp2, since transition to simple-mfd, to support
usb2phy child nodes, that has a unit address.
This is a temporary update, as it depends on Marek's series [1]. This
should be dropped in later series revision.
It's a precursor to validate further DT addition on USB and Type-C.

[1] https://lore.kernel.org/linux-phy/20260816213849.1044073-8-marex@nabladev.com/

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index ef640443dd23..964e1a5a43a3 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -40,6 +40,16 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+
 required:
   - compatible
   - reg

-- 
2.43.0

