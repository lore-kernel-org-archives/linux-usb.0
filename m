Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE293370AD8;
	Thu,  2 Jul 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019180; cv=fail; b=F7LeXJUdh+oixI6UcN9v2JJm2S6bQ3plSt6o/eTn8pCNklNqAyxp9MjhCwWZtXsOY8v50G8U0oHx8zlnkrIdIb7k5zUXHp9KAf6lcRm8uFio+NEqiTmFEYJFPZKuwMlFL472jx5Lqr/fC4PzZQSZhma//fyruJM2keogkkbwD/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019180; c=relaxed/simple;
	bh=tsMPBo23xxhbKGat4woqCeN1sOQLcJbC/mLY+jq/L2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCIllXs8mMR6VKWyp+xkrIs/TSj5B4B8BmZ0WSt9i/80tINhOZ4vwXMNxiJODnkyv8T89KP6czSGYTwJq9vgvt8A2UVBTbqGF2a31SyGSgy0jKgR5WLNsDoWu+v/V5vOfFWna8xvs/4jBpu+uLAezPO9HCtpzOJIAXQdqv8xE7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q9oHwSWr; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q9oHwSWr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGHh8Xq/ZXcWmwAMpUheMoEaEF+llEffagIeWFcmz0JDIPW3D0C8gprAtT3lxL+AOlSDwVLmLnJz7r2rZV/qQpLE6dE3rTqXkdo41t7WZ9aurVGrMvaWMdD/VjEtHEe2/duwJvQvyuw/2ayg+8EybEFQw/sN9b0/h6KwqZnjfe2Cyel+Z7OJoRd4S0BSu9iI7OWxTqh0w3WjF1kTG3yI9g0837cGDxchQYFOijsrDERssrIjIcH0eQLRpHb4pwHJqqCEbXN6Q6kqE+cMfpOJoGmBMy0gcpYYLoWbvzwy6oj/LLKMMZBouvhfeYLPdnPiYb428ldvx/Wpc2z8jWF3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br/ksa2TbXOT6kH5KyrreROfrIIVvKSKBQ/fkl03N7A=;
 b=D1w9w/HMYaR9g2An/F0zQsgMh+87kUqq4gmM2GzCr5OLsYXVew58ums9yh8u+ogaRWcF4KRKhzKMIXCWazeCQhQ7hfZanj1BhOWDMP6XxMg54yrVBwwuLUD5tWFf+90JhCsVnA8+s5xBgPKkNkoIeorB6aaLZSsbx2UhY7BT7ts2mEzGPLcPBoL52fUJtC4Mu5nhAsM6imQNfVQq2LeGLgvN8lNKDcO1BXoEI/nE6pT7BtN7wn8Z2I4lmE8dlxrNmL7hOSP4/vmxiUwmL46zPVKSVFOTFHQJ9I++n0cuNxTvaX9a7KWgmEt+oJOIvO6y8Io2FH1K25HHwxMoOVFsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br/ksa2TbXOT6kH5KyrreROfrIIVvKSKBQ/fkl03N7A=;
 b=Q9oHwSWrRQs+16lNPWE0mTx1rP1QWuHm5lavE9Wipjj3fQ95nCxmc1NtFspwH569qoAy+pE/zP/OnmGjEF/ENeqaIQ18KWb4z4BFbqoSPpDrmJa2qfTBxkQetmycp7/UDVcfGXNOmThglsA3ABe4tawjso4grFX5//G66TFvKb8=
Received: from SJ0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:a03:3a0::24)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:06:12 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f) by SJ0PR03CA0259.outlook.office365.com
 (2603:10b6:a03:3a0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 19:06:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:06:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 14:06:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 12:06:11 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 2 Jul 2026 14:06:09 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 1/3] dt-bindings: usb: ti,tps6598x: add TPS66993 compatible
Date: Fri, 3 Jul 2026 00:35:25 +0530
Message-ID: <20260702190527.1820671-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d85b53-00f0-4125-6ea0-08ded86cfb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|13003099007|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hAOAGdqCosVoz+NUqLU0SJ6jhrtUbKdSXEx3GH6ptcxVFrv85wQNVhnHgQA8lKh0NMjLW0pmhASM8sBVgWpYYPIwzDRDhFeAe50TdSDDjDXNycqCGei2VqoZjN/0/tZ9jEhVaGvXagLde/sHRocQTNbykOsBJ/guGtC6OP8sD1mev+vA/IoLCG9ga+JxUZ3NItvvLL/yo5YFTldcrv3GLVW8Clyy+kJZ3RvKaIKEs3z02bLPApW7HIsWumFSSjCkrs+mjgXTXla4hiakEYXnle/8Nwuwu1r/dmf03Rwa7USVVvRTJ8sMy20tBMdvmn8Ezm88YUNUz3ZiVC1HTo5nXOJhcmAXOPn57pPHYjJKwN0FUnxULZdDRwxzFgoiPCSTqBfy6iN4mDa3Q3BohiRgZOG2e4uSmqp2J4rwP9WZPad7B038WcRz4cZ/g37p1jSsqEpJSjaY5cI/CR/rtNEwkUqJfjYk4I/uVoNRDoOlQU2NO5p8ecaX8BeFotmLK6d1c4WQTYpPpm+owutAPpEzOc9O9p5UG+jjsNket3h2KEidZXGObixvRQNz69dcvIQFBbzPNLFti+bX8ePSwAsoQitFZdHedUiLkgupKmi4iqWl7cQ6gEv4vEB9l9/JTjStD3zOpMX+GfVuxiM1JsAfSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(13003099007)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XplP5J4z1EOB+9d0gtmQdeRA4bUbLvowhJecPUhhYDmLScM8LUXKgXByb2Sq53JQbTm1Havp4Bwk6tKIechxRwwkI7Ekij9eIwEyj/FONFf/WRXJ5t5tobQSyrolf+8jdgOLLSWAX3CtsJcCN2SsbV8ogycE/b6Zae3+q/66lCo87EejhJDqWPj9ufvEytM/ErFziRLSxeGNrtH6Qsp9X9I8ACSYlEhfy6ZmSLA4MPpfL0/MqasUZbtRxO+CNZMuxok4/K5LPx/rYpSe3FuVPNNE1xgRTz3qQ/4KTUUQ9xHXr3WNBtvPJRkYsLDk6MJ5bZT71JMQ5KkQDOn7q0RjyjDRBWBefYmk8H0scpPnExoWZ2XSEKDRIU4k62PePaX1nKUJ8M/TyzOm9q5QYYoQU8AatWTM/R0isBS2qjiIORv55iqutpmAvXvfd+9+KF4o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:06:12.0285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d85b53-00f0-4125-6ea0-08ded86cfb84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847

Add a ti,tps66993 compatible to explicitly identify TPS66993 devices.
The TPS66993 is not host-interface compatible with TPS6598x, so a distinct
compatible is required.

On the AMD/Xilinx VEK385 Evaluation Board, the Texas Instruments TPS66993
acts as the USB Type-C/USB PD DRP controller for the MMI USB interface,
handling CC signaling, connection detection, PD negotiation and power/data
role swapping.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
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
2.43.0

