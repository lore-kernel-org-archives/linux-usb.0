Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020076.outbound.protection.outlook.com [52.101.61.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494434EEEE;
	Thu,  6 Aug 2026 05:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785992994; cv=fail; b=UhECh/RV6TayWK3ehmV00qPD6+XTg1qJ+81dqoY/n3iQjSQrWXwIn9pFkYATXYPj2DP2jYGxtm0/G04K+HKzCeRyovyNMsJQjGyC0Do2Nfd6GCtfzJ4tQKr9ICFuIanW4Jl3EgI8D6FhfJnxDgFn2QmI2/eq1IJbdcXSc+j8rZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785992994; c=relaxed/simple;
	bh=xh9mVZTirfkBH1mmzl+86aTjjSQJx6yu2bV/f/9HJkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ocdc/0N2UKir0IBNVLOaFTxh9b7DFXoKrQY5Oucwmv/pAKnZ2CDcaTX5fop6Ec8pLExRqxC17fs7NaJnlokkzYzvSppkXm6GvgGK/7ZXncqIpAMuekOuDctX9p6eYKzw662xs30HQahWmgeMzMSRFBEwPYs5d8h7IWSIYGgNZpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=vq7Db0zr; arc=fail smtp.client-ip=52.101.61.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="vq7Db0zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBJAkHowXCy2TYrwLYwcVerSYzU1XSxFgdBGAPmzCaQE6Gif2486gUavrJ877x+Nf+Ohsn1ZjA4wb/fl0hUcLrzL0wVly2EB72Mry27+x1dyjzQLcoQW2u5iar23eWmsa9OLH0FV5fjTVXnTjibfX0CggadntgpKIpcU7E+C8t36K2bagM5KoP9TKFRuLRMq20gfUTMLVXwKI4DLvg+nyb0SZiH1CtvOKpT8NuJUbsaEJH8WXUsPBTQr+TdmMSH8/OQVYWmb0/0uZH45KbqiBz6BjYjMZgtDy57taMJONJmaD45pMR68Kkpr+fNeQbqDSyUmRqQhz+GZZQeUGahaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqeVkNdtqPHbw6dIOYBZIbQxBCBcE4g7PNc84vbvb14=;
 b=hqa8W8bk9cjFxDvRuo5U0veQYhDsHyjYuG/aGM8VWaWlfvLUMqTXWKlOHadHAfyGuoHOqZDjPawuDElqtMXcvUNn86VH6mEkhmzDtUu6krJNnXx/3kWn3/aUydnOnE7gfocjkW6CmnJrcENv3YPg85QjOjkzfSIDCF/3sxcVFzv6UdI5KC6XU2fkkwWwWvKgs7jJZ9x90XWEd8iekC5q+2vXClcPBE0QWdxNYZ/XD8AxomDUTTCat36HwhLLM4rOho036oMcISIaCbiMH6M9FeWPocSNZdcPv3ZB2zCdyP+BpLvmYbLHTOEIGq7QLTodIp2H03DgZS7r/H5M6a97/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqeVkNdtqPHbw6dIOYBZIbQxBCBcE4g7PNc84vbvb14=;
 b=vq7Db0zryo5O7e2jXPoIaWd5YM2qQTKv+UdphJJ/vAvUpZRCXS1ZleqQd34W96LPWMYjzw+tdPTD0+TtIsVkYKBIMJUILiqQA4CUmuHK2Tq6salMrFiweIBtBqKJA0m5fUZq0OYgGgHatYXqtQBscsPrbi7or+hXxuCmnOe4rFRd9KuSC0Ue4tUPY3XDoQZyEPKV8xzbORLDZl5B95sFuA3MgGqMPsziKapHVgy+0ReyMR9H4mVgRJo3D1QoP4yy6HwOgY7/toOA+I8OEELAFb1C0dQAywWUNoHKltcdde+3ZX0sqd8P4VOry7omAH54/USXiyRvrqMN6TYc4KYf5A==
Received: from CH5P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::6)
 by MN2PR18MB3527.namprd18.prod.outlook.com (2603:10b6:208:267::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 05:09:48 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::85) by CH5P220CA0011.outlook.office365.com
 (2603:10b6:610:1ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 05:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 05:09:48 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 8E6DC4157BE1;
	Wed,  5 Aug 2026 22:09:47 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 05 Aug 2026 22:09:33 -0700
Subject: [PATCH v4] dt-bindings: usb: generic-xhci: add Axiado AX3005 xHCI
 variant
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>
X-B4-Tracking: v=1; b=H4sIAAwXdGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3dKC4pKi1ETdxApjAxC3OEm3zETXwMTE2DzRyNLSINFYCai3oCg
 1LbMCbG50bG0tABoQ9aJnAAAA
X-Change-ID: 20260805-upstrea-ax3005-usb-v4-04437a2990a3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655; i=syang@axiado.com;
 h=from:subject:message-id; bh=xh9mVZTirfkBH1mmzl+86aTjjSQJx6yu2bV/f/9HJkQ=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqwScSnftQ6lh7uLGdY2cu2R5C1IXJnad+sE78WOwzmJ4
 XmeE5s6SlkYxDgYZMUUWb7qfMs/mat9r3PvylKYOaxMIEMYuDgFYCI30hgZFre+evaO25vzuGXo
 JN7Ihf9XN8w3nVPOeiDk+eYJ4keNHzEy/GNN2CPOIM/o88jWrSTmVFuHmITDLe/s1xvvu/vWLor
 hAAA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MN2PR18MB3527:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ec4833-5674-4f92-ffcf-08def378f018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	olcEINyzzlAi5Gg51hX3edU8gh2XpfYi3hTWFZfoAj6dr4OntXHCxx4ylnYeTDAATXWBBgdLxxl/FSJvPqCpE+/NnB95ohBVf616Tb5S2GJDpHNrVQ7FNaZLRClDOlv9WKLIgzulMIfNeYE4nmYBiwemZ7mLrKZO2KCYDKBv9kFHzVSOT5M9epxVtd4JVslRtiq+YchZknbijiB3PfCLQehWffIP8JkFV0ea8nWVwrLhQyaHvJRI1FF9mr3yIKQL6s3oCOPhLtOEhgDaGU+P6diAD8J2vyduYhoIWvxc1payNTzoMGXm8B6FU+QfgITq7MeYMPeB7k96W5APxU8oyeqBfcKF0y1tAEbNhtqMwvYGRvEYSfKQ7HDll5x4ZNe5OlUXRL5rCMZJbZR/VMnYYk/wnPioUlodBoZt5MWHsEF7wZU3VG8A7j3wvXgxZiTPJc0Kq8OpMB3NFE80E2hRcRvbMpxor1egITp2HIVpzOnPCAt3hWoXFQF8aM3jBlqauOmoLca4B8yPnthf+3V7CeurBql6bqI1XlZAfU7L940ISkmtKjcg6/zc0wOmtJ4LUMpQcZ7wbW5IKfhkr3beiNV4xIYKK072Xgx0rz/nXoUfeFj4dZnWKiitVcylp7JJcZyf3HLFXsvwJnfw3I++HfzvisckwX3slEm7PLOw86ZIyp1n774SBgqA+bBc8BmDvUndDMjl0PGceD8+fII3vw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CPgBdmZZ+vekT7ANzj/1KUdbP634CRK3wGdcthCE/DLG1nh4oPS75w0UyBrbvXNld1qmEqtWrh+Me63vhedbwG8ZIwrXBmFuAdG3pP1MGxZal/rJRow4fZadA2TqD37wL9WrqpCflSpmrjW8RT2XR38NP7m0yv9ti7GbM/6ewhZnWhpEn+TLCkZk70GvzQpA/ZWcrW7WG1lf57eX+GJqg9hIY5B0olrPakc5/LRmNZsv5dFq8uuwx5s5jAgWedKE9QJr1VeRle5xgYJUW+LnpCsYo3oSWD4u6hKc78tYy7f7q39BHL6OFcG9CwPaZXj2ICNEbRuTPLnDAtsPNxZofhiweLHOEwbwnuY0/62gA0QEXbal7aOtw4gVv59XNyi5bT+KdcXNK+xX3DJtwJJiFolAqCH351/ppaXOvg44gBD5Jc31sR57VmXT9Qat23V5
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 05:09:48.1601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ec4833-5674-4f92-ffcf-08def378f018
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3527

The Axiado AX3005 xHCI controller is software-compatible with the
generic xHCI programming interface and uses "generic-xhci" as its
fallback, as do the Marvell Armada 37xx/8k controllers.

Add "axiado,ax3005-xhci" to the existing compatible enum instead of
adding a separate schema entry. Since the enum no longer covers only
Armada parts, drop the "Armada 37xx/8k SoCs" description rather than
leave it inaccurate.

Signed-off-by: Swark Yang <syang@axiado.com>
---
This xHCI binding was previously submitted as patch 7/8 of the AX3005
v3 multi-subsystem series.

Following maintainer feedback, the binding updates are now submitted
separately to their respective subsystem maintainers, as there are no
cross-subsystem dependencies requiring them to be submitted together.

This submission contains only the AX3005 xHCI binding update. The
corresponding xHCI controller nodes remain in the separate AX3005 arm64
Devicetree series.

Changes in v4:

- Submit the xHCI binding separately from the previous multi-subsystem
  AX3005 series.
- Add "axiado,ax3005-xhci" to the existing enum for controllers using
  "generic-xhci" as their fallback, instead of adding a separate
  schema entry.
- Drop the "Armada 37xx/8k SoCs" description because the enum now
  also contains the Axiado AX3005 compatible.
- Expand the commit message to explain the relationship between the
  AX3005 controller and the generic xHCI programming interface.

Previously submitted as:

[PATCH v3 7/8] dt-bindings: usb: generic-xhci:
add Axiado AX3005 xHCI controller

https://lore.kernel.org/all/20260716-upstream-axiado-ax3005-upstream-v3-7-c429095143ec@axiado.com/
---
 Documentation/devicetree/bindings/usb/generic-xhci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
index 62678abd74b5..9af6d0172e56 100644
--- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -19,9 +19,9 @@ properties:
           - enum:
               - marvell,armada-375-xhci
               - marvell,armada-380-xhci
-      - description: Armada 37xx/8k SoCs
-        items:
+      - items:
           - enum:
+              - axiado,ax3005-xhci
               - marvell,armada3700-xhci
               - marvell,armada-8k-xhci
           - const: generic-xhci

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260805-upstrea-ax3005-usb-v4-04437a2990a3

Best regards,
-- 
Swark Yang <syang@axiado.com>

