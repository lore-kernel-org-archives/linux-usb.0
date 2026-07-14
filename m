Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD83033E6;
	Tue, 14 Jul 2026 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009922; cv=fail; b=nR/J0Ke+OwYk5xP0Pw1YpIyx0mwJk4X1KVX+I2cJ08St4F5ORQnLQ2Y75qWSUY60dwIrZU7ThUb8jZB9yLmWQM86Xwp3CbZ+kzwCPOZrqr1zL2Wq8o46cjPfWUjPH5nRVaeQ8SJNjvTjixlRDrVZeNoZOl5bK1u+2LKwAMGl7hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009922; c=relaxed/simple;
	bh=by0wTHB1mDYTmFeUEcBX+OU5mVCnjCIV8IoU6d0wiAs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JwVUFVzy1FuNuuE5cffoU8zXv4H8Dx54qT3PadI8sbSwzV2OEbdB3YXnP+GcmVphlMEv5rKOEpvMrSr5s1lj0LFrRVFA6OhpXJjMUfdlO4pBkWHySvVJcBsIkMLObunZmBhtkBl947zBxaQygH0V5ut5aIqeQZ+UCqDicKrhjD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PpDRQ3N7; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PpDRQ3N7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1fdr2NEAs8m+rCWdECab+uLthxwx8giGX1SX37Da45KSKL5EJLTZXLyKrWg4s10ziQ6pnLc3dZMFp1JTErWLHgf/eEaEW9EP0WRwUss/mS4mIxMZ5KE4zlhgPO0RiawmNksuOqmhHDG6mJD4pP/T/0M86m/xz3fWLxP8eGMV82WGZ1tzNQle+B02LeN8iL4zbl65q8iZWfNDXPaxKdbxmQQFeXz7rqVoq4LmJFGw6cLfcr/onUNAZfelbCFonEiXVzhP6IJot9gK5gqWvLaW4GAkoLpFLxYt10GX32qEYAho20F1/jjr6vpikNnL5ch9vOffQYtxn/Nxo/k7ZDJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8ws3YTM9XmewxppKZPIQuWCn0DktxWWNrOxC4H44hk=;
 b=dPBVnwDtIP2KjpAUQaEHvCXNfvtKV+buW3KQpOQlrJx+zMNQbL80zAHR6ysRtmFj+ysh5CM5b8udnK8xe5rHbsUSHSturWzzsMKXv37+F1lTTzTMlHwsE+slJAS/fw1Rv9YkvvYs3UNBAByEY6Y3dNKDJmVDUu62z5CrGtVaNLr1h0YZ7yf/UGlxjXO5hxZl+1N046HOiR+Bn1ME0bXUtEHapTFimTl260rz+OTlqYUFwQ+nnu0eNbUQipWVBOk/19WNdbM/BHJMb2R/ZkYxqPcUxjg19+GMYWH61GFRGpM+7jHnJ/1iDTqC0eePMlh3iLqfh9kJabE0NzC+qVscFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8ws3YTM9XmewxppKZPIQuWCn0DktxWWNrOxC4H44hk=;
 b=PpDRQ3N79HVgOW8g7vUkS9z4LqNErxO3qDrDvpdxuwG5GVwkSfAqewcYVewqZita+cqC5qRnrB6N2ExC2ad4+hbi0ntqk3HVCTRS5JkfpySc7t/iVCNIipfLB6MeFZ6CBAkG41qHeTGLhPloe67kp9wF6dceC0eAjqCxOJb0ozQ=
Received: from BLAP220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::29)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 06:18:36 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::2f) by BLAP220CA0024.outlook.office365.com
 (2603:10b6:208:32c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 06:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 06:18:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 01:18:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 01:18:35 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 01:18:32 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/3] usb: typec: tipd: add TPS66993 support
Date: Tue, 14 Jul 2026 11:48:16 +0530
Message-ID: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 4daad441-c230-41f1-71a9-08dee16fbd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Rx8AtOncVeTf5X56pGMhFWMn/a3HVsfnMGfRLuMS1Y+egKybSDO8Zl79lDblyFS/rBx+KXMtApHy9WVjyQQ0rFkxAopFi1R813kOaGbYbomdYKTK8cR10opNxCmGa7y10w6zYIvG8Sd+b5sXYY1VOE4b76bi0lc9rLl/7o2lptE893GaGBDuaY8db9yf0O6eKOOW37ObcjRGUUA5QNBLdpLi37vWsitQNQo90qplkO9sWpeXzofVjE0v6C5sUUNgfF3EkgWg2E+VoxZkSsXV8idicjuVRwqaaJN4A21v3xlbMWHDtHF/OtrmYljFa5UeBpV2vGYCtwAxfH56Mb1Tosctqr++fwEy30FtwB1/JBtsNeVfQt5dVpHZZG7Rpl8bFIpHdZzMEomkd7jXyZpfKXJxACE3njqiyzeR/Sm89hgC2f0dx6GxkOgjfcKgQRf/6XY2INQrqbRFM1vKxNX088SlFdt995w/OgfoxOwcJc8CJqz5tkQm24fNhGPn/FkK4+ZYyqoBT1I5RacjXB5nN7tllh3xWaPpntGiv/77lrP4j1t7iKOz+hlAyRdPe0I8eBXFlEGXwLAmhJXlA3XTyqTBPsymHkaPyJOEfC7JeGffRUqluE82zCvsEn2MI5fcT94OCWD31hWNXpZxstKLY8yaB7T61Ly0WjceAYOzU4DPw3hLfr6/eJoGWNZMnzOVUdoIl5jCgi2TUn1lbvf/Pg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9OoCP0qN6WFYT4Z/il0Q1thsrO+G7xQGABNTuCuFB37i5nw0DXcF9lOxECFdpBMwwET54GM5oyqL/1JG1yMpy5OlMULoOqILAzFoWZgo6G36ltI1saEe0wqye/CcdjXF/65O0iSpGGBufRfbH9VfZXYxOW7euVdfB4Or5Ktk54/8/5NfMFbC0z/mxApoBkkLkhbF51OPV1jY38t/N9ZQ0jsuG6S/OrTxe0JxY5eFSQ8sjJR/PfyCYbiM7ILvpKPU1pq5xSttVLgsf2sFOpkVFgbxJI8apITMxaE+x0AMZDgGH0xo42P0EDXkQsey9+SlgyATlP0yfQcIuAEusxrJS+IoJhcL7N2X674eeCuhMQeyOJ9xcW5G5AZWyDmwnQr32YZ/Xr6DCijxoWPTM8yuPGLFiygBKlrxg5iGf4KME1HNtyBTi9/zuqErNJc5uBAp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:18:36.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daad441-c230-41f1-71a9-08dee16fbd56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333

This series adds support for the Texas Instruments TPS66993 USB
Type-C / USB PD controller to the tipd driver.

The TPS66993 is used on the AMD Versal AI Edge Gen 2 VEK385
Evaluation Kit as the USB PD DRP controller for the MMI USB
interface, handling CC signaling, connection detection, PD
negotiation, and power/data role swapping. Although the register
interface is largely shared with TPS6598x, the device is not
host-interface compatible and therefore needs its own
"ti,tps66993" compatible.

Changes in v3 series:
- Add Krzysztof and Heikki reviewed-by tag in 1/3 and 2/3 patch.
- Remove the unnecessary if (tps->data->trace_power_status) guard and
  call the trace callback unconditionally, since every tipd_data entry
  always provides it.
 
Changes in v2 series:
- Document the "ti,tps66993" compatible in the existing
  ti,tps6598x binding.
- Introduce a read_power_status() callback in tipd_data so
  variants can override how power status is obtained without
  changing TPS6598x, CD321x, or TPS25750 behavior.
- Add TPS66993 support.

Radhey Shyam Pandey (3):
  dt-bindings: usb: ti,tps6598x: add TPS66993 compatible
  usb: typec: tipd: add read_power_status callback to tipd_data
  usb: typec: tipd: add TPS66993 support

 .../devicetree/bindings/usb/ti,tps6598x.yaml  |  6 +-
 drivers/usb/typec/tipd/core.c                 | 76 +++++++++++++++++--
 2 files changed, 74 insertions(+), 8 deletions(-)


base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
-- 
2.49.1

