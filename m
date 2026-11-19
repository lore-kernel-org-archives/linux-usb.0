Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102889;
	b=ilravbjK2Ohdb5ZGwqAugkLDyi5a2IDV1DRGWmV5OEYSpyHgvMr5+/COR5vkVFf8S1lq
	 8mUuVhBv/WHOIG0f8ygBJP7SJbO03lvoYS+zyEYJz5GmF0g2xX2v2VULqi1cqemr5zwCs
	 Bz6ivUJQXjp8tDWw1J78129NICqFEcRLctyzVRlF4TEISZo0Mav4AmpbXBssesUbo2yNE
	 4ZGBL6TbHxgwF2leq9S3ztxir9xlfc3z5GIMbFhrdB4Vp5zSrMcQal0bluvGFAkLJjSxb
	 KtejGkXAlZoT2cEUX8KFm7xckcSeC1brriWLmn5BCchSfXXFVwl8lymhOVqp9tXi3Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102889;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=;
	b=DCbfjcAvvn7KcFPRIFnEjMUPHUOSQ+uue8ZqmbwrLja0uXelaPOqBttQI5vGGhytu+LZ
	 PtSSh9nGQAL0nIz4hT9JhZvDYMHt64urNTQzHLu92Dzz2FNq0H6JMkqPiN4+lXvt8UfxE
	 27Of9eT0FN1RrjLo4L9oBvOOsT5Ewmkw97tNtYPi6jjqQLLIy1/wIX7yQ1dWqdRdLSqTI
	 FfUZej4Gvv5OfVTEqIvpv5TzQhsJ1RE1X+6iQzDhVUWloWucjr/KidlUPiHPeY6h5pTlp
	 +AX3J6yJ0ZipJY3fWorTlLLRx0EJZ36KlR14052fNP4go6w2PPwwI6ZSd5msgLCU56Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=owXW9S47;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45F606A65F;
	Thu, 19 Nov 2026 15:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA45F606A65F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=owXW9S47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/8O4AvgzLNZqMi+bknFZDsIPjC9i2s9AZ+fn2Q6rBXrmwZfJHoGUdThSDHf4SMLGSfP1DsBEQI6sPwNw6QJF1xWRp1SwnAaFItWaHotQHNr2DwzctIx97o7qYiqLqqKL9/s5FGf61CSCrndBjd2qrQ1+9AKldwEv37f1GQDw/W+D4o/+fv/otOml6KhaakYBbbKBrE+/uOjdZ51zViqMJVhmZbhs0IMSzbPwX/Wa9lL9T01jD7XJokV4v/eAkcpOLN5+aON4kATOfFTvZmO82JWRFxnzx8fnsB9asJFvga4i+1iAuq4fURhdz3/HrzwnAj2vfYW2ypD+RxyBBI0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=;
 b=GeDhdp8y9O+N/JaQUPQprFaVRLdt+9xpJ+tEwbx97Uq+Cvjz/TAt0bDvAw5ZjRr8YN9yDm+2pRwfQP2XpMcxlwHLnBTBulKAUrvDBNnMfehydv7S7Ulz+6INLU3iq3HNiNYwY3iuk65vvdWrld/1SR5UG7ONO+GztbSurSlpfZXYlHxwT6rKndVtUHBZse/L+jNYXOv+94uDrDbM4PP+6OdM3emGGAOZyAYUC8mS8wWBLSv1QkZzn8Jy5jDSjoSttpL4nBS9M5M8gcVpEP9AHZgseydfirFxNdKGgz55+EMGBN9zZ+dZdCHjuUD7ByNmeHnjz8m1oNVIOPvPMqsKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbALR339RuYD8lhd4cuoPdeHYUc/gniPSnw14Ih6UY8=;
 b=owXW9S47hv604OJyhq/dHenvE+3PpGbr4HCLjj9DmbXIooxr3BEVluuCd2sAbwzveYYP1EtvPWKE9WHq+zW1OIKbnRKMwUxTfUX5zuIv5IEEUpCa3isCf4xHDyO/mo0CqazWXQRH0xjqxXtkXSxO6wTuCH3HMQL668oG0TCflPY=
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:41:23 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::7f) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 15:41:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:41:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:40:57 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:40:57 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Shyam Pandey <radhey.shyam.pandey@amd.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM"
	<linux-usb@vger.kernel.org>
Subject: [PATCH 0/3] arm64: zynqmp: dts: Update USB hub description
Date: Thu, 19 Nov 2026 16:40:41 +0100
Message-ID: <cover.1795102838.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=michal.simek@amd.com; h=from:subject:message-id; bh=o/NSRq1ct3M7O00Pa5DJVYX2tFguRDyP0qAJ6nR48O0=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9l2j28V6a8lM373PyOYE3e9+pOXjs0zB27wp1dz1Y5 XlHLPVQRykLgxgHg6yYIst0Jh2HNd+uLRVbHpkPM4eVCWQIAxenAExkygtGhgepR68aCzoKr7cR 8yxdp3iSe/q7c2dqj+RckJ76K+HThaOMDAtLFuk/DIy9f9cum1mSq3/Pv7K3c7iMlc3c77u22W2 YxgcA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: c60565ab-aacf-4878-eed3-08df46539097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261021123027099003|261022105027099003|261021121427099003|56012099006|10067099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	IqvKoEMBZmvDzOMyEdBaxDkKGpo4eG8FtbDRVaAzv39p7ldWPhDY1gWVyzbP7jbUV89oBYr3JvxJJJrXMN4GJxEvT6Ky1+neq1A5hpejrleIxBpUaY8sR5TLFo3JFzON4iPdrhXEnXf/qMkwuFWM9aXpSGUlCeFPpF0k+YRm2M+fjStGjXqC3oJTrz4P9CZ9lwRCC9uV35QYXEGf4PzDcaCV0NwXvXqtGfF90xqwAIkQZ/wOmhoDiGm7xkzniVmbalq9TUfcK/Dvq6hqC3y384RuYcDXEJSsuoUhsy9AU+w7PH7SzU3fG+bUh2dWbJQ6d/VP0QgzvzH1IMxjveaI2prwDB4rZJdzZ/sXuq0mt1qcEnp5luKrtV9h+3rYQ0v6a4VFjaiELkkIZJCs4piG6dMiwKgfcL51gkvAVcETbFysqlvf6DD5p5WNBrbehOdjJOKg0AwZLQo6z1MyjSTSiD9DO7V2PvpXibFCQ4u6R5Urlu3dDzP6Hdgou9vRu4i0yuKgAdd28MhU4ugWUH+XDdiRlcYHbfTqJPefJxFxrT1zHKix5HFCui8npuWJfkGsD3Zc7LdMC4fd8HGMv9G8kvLWXkWCVPbFPGzKPPgGU3L+0xtDakzEVfuVUathfWag/l3UBtBumqEDBVxNGmN5XD/BTjoRQeDntYg/Mk3YNCmjBX+RhekBz3fNgELjP4dSRacpcjTwHY/+oVjAXyUd/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006)(10067099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xdX3nk4zCv1lL2MOJXJIcYt1UQ53PqImGmBa52RXCOHcAF9Rpk4FXOEFbmwwxj1eKwocemkV2o3Qm8Ocnz8Br6Un2yjimGz66wsGxatzjfR0IkzmfCklRCQdPfQvmlkSOzXehayucYd6G159GYKrEvW+qOGM1RV/wpQgeLvPuw4026zpWTmFg2eqMVv1RAVeZq2KjFpN+bTgIMV+TQdA5k8vjwlL1+cHWqq3yred4Bro4vusmMGUctdk9lqY6zpMyQ091gCHTnXXNjj2XQ29M6ngh1RYjTrS8w+BSw3LYO2MfpgYqjMtgOiF7Q5Zt16NX91hc/PRnR/JZQCq/NzbRdlU4PSUstrnfMXoHsP8CZSSkHCk3z42OU53fPAg/vSvjw/sRjrHD7Sm6wA9TT8YiWx5D1bdJJlqWJp4EoTSSFai2bxowBsY+CStFcwFRZJd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:41:23.1602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60565ab-aacf-4878-eed3-08df46539097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

Hi,

this series update USB hub description available on Kria SOMs but using
gpio-delay driver as reset provider with also defining power regulators.

Thanks,
Michal


Michal Simek (2):
  dt-bindings: usb: microchip,usb5744: Allow post-init-providers
  arm64: zynqmp: dts: Wire gpio-delay driver for USB hub reset

Shaikh Mohammed Suhan (1):
  arm64: zynqmp: dts: Add USB hub supply regulators to SOMs

 .../bindings/usb/microchip,usb5744.yaml       |  3 +-
 .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 34 +++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 43 ++++++++++++++++---
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 41 ++++++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 34 +++++++++++++--
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 34 +++++++++++++--
 6 files changed, 170 insertions(+), 19 deletions(-)

---
-- 
2.43.0

