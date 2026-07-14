Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AECB3D9557;
	Tue, 14 Jul 2026 06:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009927; cv=fail; b=E249Gk9JAZPExvQBloNL97BcJ7zPT5FuSQlEo+hobp5bNbt16VgdJrzpA/VIo2rgo7y++YDB0IGi7RHv74tsdkpbXd3Py/zXmAbyk5P6bYTTjjeeRgKb0FE7rNp9pk4PJXLCgjkbuWTMoBcuc5x+IBGKunLLLjziA05J3d7E9rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009927; c=relaxed/simple;
	bh=kyKenwSPiSBSRqJEWM8D92x3H2OJUXHaFJ3b8vbKHRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2QRR2kaFoKSJylcYa90XLEZvsTo+k8zCf/PaobXlPDjjcVTCImlbzUPwmAhHdopbIQTwi6dW3Sq793B8joTG8BVn9YpQ8iuGdEpTiYdz5CNrA9FTMhp5WJn2y+0G8ggpocR2XGETV3MeBrvkFFYATOLjmGTUG8umfxNiPWzaUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gb3e2bDw; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gb3e2bDw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmsINXnd9D8Ozj/qwqiPAyQx5lxexmNV7f5gHXGniBT6LT6McDq7Z0CsjqVpkGE3XQIrjoOzZWirU+XF9pzOaBnz/rdOulfWIx4GgDm2TL4c5KXivQe4B14K0Vwqep14Kzyg5PXIwM3HYol2WEv2aXnW1+w8rLkFdjzya1R2reAGoJbmT5cDCQ9AOW2H3ow8tBAW+qUQOncswNf7ECLDR2zd14UOOU/4snLL92d2XCLBuZH+x0fgkFPsR1eMj1tZbRVeYniE57cp7FjFHNsmHTOTBnmeEPYHZVK4dlfcb95gp5r5hpMX0bqrhWgU4+1+emnqyu8I3dqe/7xLlbkhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MttvbKYn3cGDyaU6G5ssvCuX7ABU7NSNQbJWOMl/lLI=;
 b=n8k0ZDMjaZ+4jOZDvNHtvc94W7st6iWd0KMHe3ieYY7yEdkliDJpSHSGX1pG5PE0r5sGTTbFsfQNuPj/I23r9vrwuW5a8Fa0+Yx4ja94JoEIF5Lt18QgjKY733dyuu511UWctan+35DVlEQM1M70DsmGHiGILfh8BvSMiBEo5ejTH061wRTe7INxxRXCNMhnQo+tJ+PL4J6APMPIW5jSPdS6m4e+Ixll6q6B5qk56yXePIIXHkss3cg+enJm+hnoeVi7LgEMQQijLZrs6SXnjAsXNqE5Jb0TP/iwf8UVsRkYHW2RWC7SdjrCTKS15jXfVba7eyRgd7hQiZ+BLNDNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MttvbKYn3cGDyaU6G5ssvCuX7ABU7NSNQbJWOMl/lLI=;
 b=gb3e2bDw1mn63sg8iQydcjZD9Rb484/vbBMim2Dz8wSkq7V1hgfjcvP8JYZeXaiXWFFcSgeUhO2Ga2Q1hyFZnkrif3FMN0117QBn1V/K4bIfdAlaEPrPjJ6hNsJdxWJJ0qd49Ew1FwaST253SS7uwql+Z4NxV0iI11UumHVykUw=
Received: from BN9PR03CA0313.namprd03.prod.outlook.com (2603:10b6:408:112::18)
 by MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:18:42 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:112:cafe::23) by BN9PR03CA0313.outlook.office365.com
 (2603:10b6:408:112::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 06:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 06:18:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 01:18:38 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 01:18:36 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: usb: ti,tps6598x: add TPS66993 compatible
Date: Tue, 14 Jul 2026 11:48:17 +0530
Message-ID: <20260714061820.537792-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
References: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|MW6PR12MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f38024-99f5-458e-6205-08dee16fbfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|3023799007|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	6ZmrqkGSiwehHiK1fQv0riLUA6heCnrOSmps7tjkJpu/EmUy9v4IKlee4F8mDFOOw1OuhpptKHA0CIjZhFiwkiV50IhPEMBdVDRXtoE+dV3HCpctIGAl/t6KgumiZRl0P9Tm8Rv0CHzc7g+yXvFaVoD59DiovlLDegLUlmiM9TMHVGKuyA9jd5CqSIGWJWD04/0Zn7jI0uvhOeoNY6JlMppsyJja5mEoN+1eO8as+9dlDPBzWhKhrQAhrgKv1ygP0Eufta4y1BlWYH36C3Uyp+6C4tEANfqhMegtI71P/PuwtsUf0m8dY/yBNLrZDJ/FUIDztn27YZ/jmjUt1D0WHCNJsGUiy4iwagPTEAnodHOmB6JmVVVt6TRbh/76UTO2qFfRzvJDZfF31tFi/eQEekejH1AscEYHgVAY+KfjjPTwE1YsitJ+vQGT0gcNBY6kfvEnW0lTL5PZQo2Z2MLIBRxyiIn7FiT1ySq20gjM/nPEN7OytGh51gDL2FbeYzSel5qIu3RMzCP6zH3iyn6CMDe/N98oQ7wHebbnCk2l5N8wxNKbqerL/SNLjjojKtAp46ZgLMBbV7RbaX0hKjhaDZSKKsxsg0r3PfaKxsykw1M+XKvY6cJoGzRaf+rOB1LWzM8Bz/9c15XS3txKzAC/1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	14T/1wu9s960ViGidq+g3MF07NpzB7PhCY07Eq6FTNhS15M88f7gzBJ0N5xN5nOK0JdUJFkFBdss8f6a+boI2wRPzuKPOaBQOtwRAoGXU4r7q/eTowY1pRyq7w2lWBKscZwcUvDubhepG5arNzckCLEsLzzJeWRX8BniIPnTbn3ual06yArBtsngT26U3dqwoRHjS0tjAhjHeBU8cYAP7wEd0uyzzaUFO8T0mOn9tNEvLlxA6o6ej437XBqmakbsZNYCWGG+DVs2/70HXVf8SazDPjXzjB3a5s8E52MDc0xzVu3HMQKxaJn+zJgOorQrri6IOtTsRwr1UoVecs4nHJNvfI2TY1eOSm1a7vCWOhAqbCUf0FgeCd4aZtHqMO2ZBlu/2Vr/E9vBYim8Ij+IgABbqDkkUn2CuX6LTSPPArrQLzaYIwGoZQdV8g6PD1QW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:18:41.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f38024-99f5-458e-6205-08dee16fbfef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757

Add a ti,tps66993 compatible to explicitly identify TPS66993 devices.
The TPS66993 is not host-interface compatible with TPS6598x, so a distinct
compatible is required.

On the AMD/Xilinx VEK385 Evaluation Board, the Texas Instruments TPS66993
acts as the USB Type-C/USB PD DRP controller for the MMI USB interface,
handling CC signaling, connection detection, PD negotiation and power/data
role swapping.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Add Krzysztof acked-by tag.

Changes for v2:
- Rename the compatible to match the exact device (ti,tps66993) and in
  commit mention the usage of TPS66993 chip on VEK385 Evaluation Board.
---
 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
index 1745e28b3110..2c589e9e712e 100644
--- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
@@ -4,13 +4,14 @@
 $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
+title: Texas Instruments Type-C port switch and USB Power Delivery controllers
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 
 description: |
-  Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
+  Texas Instruments 6598x and 66993 Type-C Port Switch and Power Delivery
+  controller.
 
   A variant of this controller known as Apple CD321x or Apple ACE is also
   present on hardware with Apple SoCs such as the M1.
@@ -19,6 +20,7 @@ properties:
   compatible:
     enum:
       - ti,tps6598x
+      - ti,tps66993
       - apple,cd321x
       - ti,tps25750
 
-- 
2.49.1

