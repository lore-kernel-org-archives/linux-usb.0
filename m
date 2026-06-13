Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A6281532;
	Sat, 13 Jun 2026 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781367845; cv=fail; b=IfYy5w4IgEphW4pcZHKdwgBXmejtAnSD5aGPOVGI4QOdSGzugy3DeS5wKVguVUmvvi0sWNsa0sQfcL3mLnLb2Iqnzbvg2UxFBK0Njcmpxz7EDX7Ljbzk6T6yt2CRpngfrI1JUGnO8S6SC47yYutONf7nNPzf2wXRyh6iq9pNB+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781367845; c=relaxed/simple;
	bh=LiaiI20RWICGWDG4TaaP5aUmOF2wTRwKzVjEUaedydM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k+fRTAokwbIXILSgO149pmPVusfHdg/Vh1mGb9nEbe1XXYRAkTZ1oo10YM4WJ+fjAwVP9/9BOVgsW++j+FB9znlbIZQ2dVk77ahB1C7XDJ/vUG68hRlLNDU2JVQbXLskaU++ZuJ7pfRss7JuhT3dj4ijK0a56xTlWZansOGkGfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VEisP4ve; arc=fail smtp.client-ip=40.93.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VEisP4ve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmIb8Lo8dZVDlwI65sc97WxLnR0szb+FVTnnbh+wohrT8qjWU9FmemoxG1witVzn+DwpB+cSuzubSzxd7JvqgzxS5L9QHZdS42y/AcqokaJAmJvWtFfGu02towMIxKJLI/kJMyyVxMQeqpuzUtJhq5rJpEwpy49vajIjnlp29yLRSD/+orwbDX90OMciqwGLSy/2YMNZ9buJQxWf/mSgF5gu2Xz8/zoq1Az5Ytp3FhYMp7rtoMVGbZSVUZ23vljnt4SSnTQhk9HZrJoybCu2kG9zWcQUV0SYObLYEfaf5QDGJCaAEOFCKe4CLRHd62A7Y4cGmRzCAl8QLqegs/gU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POWvknQ9PzvtYpyXPxeS7aZR47Am/wC3B/3ZU155a9g=;
 b=TsxKm9I3iAUJacsUjF9z+mV8aAxBWgENvBH1oJZaHW0hLYUbGyR5PeZcy/dEEYVHK1XyUQvmvE0U1G4QuGQtpiWiuVyQJppb8JraqO1VZ49fFWAHqe+ET8zXbZYc69I9JA51cpEJ3E1LjyPPbpM83c2PKPMta6lWBnJmH6WCpftBThv0bvdxwtvAfbzp4PsGIR/exRHsiO+zIIebweslff7818/owOkKbgCD1LxCqL/VHU8+f+Md55AQjQdaFoGW2d1xY4UAC7As3BVz29qnYMCTAZejUcYMQLa8z+5bwRA5IbXQRiet2l1eyYwNO2LAY4psW9u6O7+VQw4a9+/rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POWvknQ9PzvtYpyXPxeS7aZR47Am/wC3B/3ZU155a9g=;
 b=VEisP4ve5BfyNkeIYLj6qhEhjeTqn1dM89Gctx83mDScUHhoJwtrfvpis1Vp66Rudm1qkH2K0Cb7D4ftg6F9oaSF+DiE1PVids0F7Rej5Z7p81GIf+kXzhUwY8cvJZR5dCNYlAXDEhYbOqRjx+b1nMkGtWH2Gs4K6tcIoJgjF6w=
Received: from CY5PR14CA0002.namprd14.prod.outlook.com (2603:10b6:930:2::12)
 by IA0PR12MB8375.namprd12.prod.outlook.com (2603:10b6:208:3dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sat, 13 Jun
 2026 16:23:59 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::5c) by CY5PR14CA0002.outlook.office365.com
 (2603:10b6:930:2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.16 via Frontend Transport; Sat,
 13 Jun 2026 16:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Sat, 13 Jun 2026 16:23:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 11:23:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 11:23:57 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 13 Jun 2026 11:23:55 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] dt-bindings: usb: ti,tps6598x: add TPS6699x compatible
Date: Sat, 13 Jun 2026 21:53:35 +0530
Message-ID: <20260613162335.1490514-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.49.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4aeb99-c67a-4d19-69e2-08dec9682be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|13003099007|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4j4PhlTyib10nGSC7alPbcf1PZQuvFffJ+5/zh29+zH5lBZ+pGm224BZrCWNfZc6q1NrueGWvxn2R9Esg2hBCefQ044jWwCz4i+uOptIzz25ffcY5yjpZaWq7oimBZOEREzhTr1FPJI2yqokFPmzx1UzwHCbmDip/WTe8c2UrEJaAFig/DwthG+KTWHZfp5cCfUPcdODsn9fLqqS3g1PHssokQvNZJ0YrIb1iew2WKlFDP9r+kPMMXccQOFsgtsN9MOwPxwvDeyYboTjkm1JSEiKWiXyeCJx7qi4ic09S3K1A4tgp2JR1NH5U+33EfEiIbhvIDr2fgechNktBIpKA+i9SdVxaj3fKf1k1w7BDyz96MvlevIjCxF88ZL4cjciH0Hc2e5MImgsGwIe2Bn/Ltf0tme526/5XH6hMpIr+CtaG0jAHYulnx0VdKIjY9nUtxVG/QzlN8gWd5QfRNJ0nHeY6FUYPAzBxGvvQ1mOfKBLN01KCdAPs4tSGL4hCIxdbcQ3ncjp3zfwIO9Gp90C8QMgNqEA7mkVyTjgieqCLxeU0AxljILOCr6bQrWrD460c57ZreQqOd82BHIOt7BkTf+REX+hzAJhGgsn9Xksc+Tqp3uuHbxcel99Z7ibdtXZ/URHr6opvxwmWmYkPrpd188ylLwBddDvdYJ/4QZe/2WOxzoIHP9koLMoDVfGHkBF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dPReQEUxDdEhLnj/ZxU7eLV8DeIMZr/RL/0ADwKpcVbA+pQlL1v9HLtky2++EG7HBOsrb+aIYRahteW5vpH97g9bHXP5W1zBZm5ojWpROkXTwkdH8yqWsOmElJzVFlRca3M7e5lzjRxwQ+5KUBq7hsZplIheylw4B9fis6JmbkJQ8bKan0YymSR2OiA4zEa2aAwbpdEhhGzPYoFDYcaVE1wK3nUIAI9Jb3rUUBgnNjfZHEGTLO2bOYlnL9QTrINNBNsRI24l4tVF2Nhf8SS2MZWWXoSHeOKP7HS2/s3yfK4dpBU9AjFyRGKMYlh6SpkN1gg+7fYQrJwdkrEAW0AmjXiqvKFrzNx888r320P2yZn5HDxrKF/j5ss6qKBGi6CY4RNWp389CT1PlVPlGxHSVPS00aUVJwTBxt7cX+LcspVI4JlolTyYfZwkEtwSwLMp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 16:23:58.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4aeb99-c67a-4d19-69e2-08dec9682be9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375

Add a ti,tps6699x compatible to explicitly identify TPS6699x devices.
The TPS6699x family is not host-interface compatible with TPS6598x, so
a distinct compatible is required.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
index 1745e28b3110..76c9cc392a40 100644
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
+  Texas Instruments devices (6598x/6699x) that combine a USB Type-C port
+  switch and Power Delivery controller.
 
   A variant of this controller known as Apple CD321x or Apple ACE is also
   present on hardware with Apple SoCs such as the M1.
@@ -19,6 +20,7 @@ properties:
   compatible:
     enum:
       - ti,tps6598x
+      - ti,tps6699x
       - apple,cd321x
       - ti,tps25750
 

base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
-- 
2.49.1

