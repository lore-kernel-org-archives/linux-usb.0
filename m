Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4B2BFC60;
	Sat,  8 Aug 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195190; cv=fail; b=EBN955JOXsU+TWUqnR7Qhq/MHbx82kCD939Z5/gjVi8y5Y9plsk5Oc3vOEYZjDNGUfENraSeuOVx6RAW84MktNtQyTwtlUqKFufM8s2dV4+MA8VP8j94u+IVpVFwUptOa0R/QhgwuyNxPlJCMWIl+q/UjdjAojTAwzLfwsVfga8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195190; c=relaxed/simple;
	bh=S6PbBZK6tOOsEAO6zhKfThMtitWseqfr8rXbWRqBbsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXWxhtB3AlDOUITh9M8Dx1/bwMSQaMhgag1ObakkqM1gA+SIeZomdLW015b+OVdIL6kF7/qTlfYjkZ05zC1KFdgO/0FXcuhGYwnivCX7MjdYDVt09s2b1SGt+vlFAS0CEm+TyXEln7oOuwBlep6kVtnMRB4nj1qZZOAwl1zOHMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WYpHRtR4; arc=fail smtp.client-ip=40.93.198.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WYpHRtR4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2LZxvGs8k/rJJrnsWB9ADThXuUiW/mB5LrDM1KtxqUFfZ6UfKtvWhyloi6mNLjG2s6HIA0Rgt0Hjs1Pt1J0s6ATvMvZH6w1KuTdHVpqcBcLKkmXmSQzS+2HuJz46cG+Bi66zNmKQ3zI2Yt0QmTlNiXcyLKVL0uBw6GgbkdJcaiqusP6pjJioYmu3SDVcQmJPPB6Ogc5CnTdH2nQyJmJKUZ+KT4XFVvZqj9JsxM+Q9vwrkI73brwz7KUKSjpA8eVHLeNEOTO/Qf+BQFMFOgdUjgR6gUhedZEZ/gyKnk7e09aTdShud4okj6/qomiygpWBO/hGUn/5S/doHnShV4SDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQbtfUQuaVTnKbi+MTZBSxIbaamq76gw/nfILxeX7VU=;
 b=GmmMPnhta9TyumpIApCVknxUerBO4gF2wZz36wBXHh4SCobV+CxW0MjwDncDPf7T6RIs3p9uqG9gl4pouFm43jfeeXykJLG3qyOmvBna/eU+Q4gCvSk7UdGGnYOwJQyE/Jejr/LEtZgcjX4BGSHn4p+LAmVS9IrNlVdWeQvpf1guGt14PoOiAS5IIHnpi58ZdoEpl6J1Pe57KZF22IuV+1qCfmgRMIfdnQbad3IZIH+OgEQimBjCELzn6HycgB0drEya9AxZjPxIilxKRyPS8uCninZ6W10qjU5rDjP5BJ6IbhE9O8L4OU47VIXWbQL21Rb2LKVdVQCR5uwbR1weRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQbtfUQuaVTnKbi+MTZBSxIbaamq76gw/nfILxeX7VU=;
 b=WYpHRtR49dEzrovY9gWnJxSIHl0oj/bql82WhC/e058HOd2byL9So+EsJrbyb53+BFp04fL4HCIm1d4FBmGYG1bTZewfrD73WzKxjUQ5MnF4RY6j2sTKCRSx1MFw8fp6ddfn72hzu2XvqIfS4nNN8HO4CYrqEQjtz7N6RrTnFjk=
Received: from MW4PR04CA0211.namprd04.prod.outlook.com (2603:10b6:303:87::6)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Sat, 8 Aug
 2026 13:19:40 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::65) by MW4PR04CA0211.outlook.office365.com
 (2603:10b6:303:87::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Sat, 8
 Aug 2026 13:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Sat, 8 Aug 2026 13:19:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 8 Aug
 2026 08:19:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 8 Aug
 2026 08:19:39 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 8 Aug 2026 08:19:37 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <jiashengjiangcool@gmail.com>,
	<Thinh.Nguyen@synopsys.com>, <zzzccc427@gmail.com>, <kees@kernel.org>,
	<christophe.jaillet@wanadoo.fr>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/2] usb: gadget: f_tcm: validate CBW length before parsing
Date: Sat, 8 Aug 2026 18:49:26 +0530
Message-ID: <20260808131927.214132-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260808131927.214132-1-radhey.shyam.pandey@amd.com>
References: <20260808131927.214132-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 848f3f77-aba0-4282-b395-08def54fb43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	13oKr5hz9N3ADTTTG5F5CC4An9DKpqA8N8zxaZtZLz7FdTC6jEQCeOcTbfwsJwTLx67Cs37/IxNIALAoYszz72QgVLQ2dm62FtVibcYVSwQYILbr5D+oSlaPHHB0LBGFubG+HEy09RDPrxBJBri1XF/0bk3XqCJ8buBYsGZK6Kb4yDCtzlgUgkDMlzUoNEMLgS0SY3IfJKUU6tdOXM0oBWQn5KB4R/JAoNaxmY5NnYpma1+7pqltR1gIcfDQE3YXO5qC2FCTXSx2FpJs+9rBQ6tCKdJ8f+Ng+keApW+fAcphj/1i5n/lrGK9Cn2bMYsVswWpntuuEq1kE2gRY/kRRoYzFUCkNsSvY+0fUQE/RCuCjmRkn92JdRWDVf/EuSXPEnj1Pqobt/7gb2Bnk+8F0iqeky3FaSKich5P0RvyqihzIOeIqTGZF3jAeiCRYcoRowE2gnT8Y7Tsk3fhimdNVg9EfKnTyT/ots6m3+3+TJkl/WkawkFFsRnRfH9GQRajuh9104jESco2Uqz98nsMFjpvyypWnkxO4BqViRtEzccNlmgu+DFxtR19bfCToYi2vuCXJbCAW0s5DIyTrEDLWXU014vBz+kR+I6hXh9dhk0dEa2O8FiqGj1W5jWeedfPMPkhSM5JUxiW7dYn5OBo+yjT0ZNVKnk/PVx65q9WHr0DcIcNOFJFCJrV/m4/PE9fvIckB+srZWJclpIlcRD7kA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G8EAtcopDue6CwivHW/4qX/HrCwZDekze7MmHPWzWzkMe/+IBE/yz1Ae32GcsFTAzfz7BrVCaKlVjBDJiq3uzjZsHHvh36yUvFMxXyfFAX9HxDiUqUJJ8ExGopRZQ9c+YoZH4mM/cUnHxvN1Cl0nP+4yD+mxBdOa7FnNdiSia85mQ2Lp3h+CK7w2iu1JgI/PeFkN9ebv4IFdH3bdZGNKbJ6Kg2jEt4rSIPvgx27PsRKcbM6Bkno2HNrttrmSM69gjKt1wxMooUCcVGWj/WPon/0zYskBey/vcKs3R6IteZ8+IjPKrGaSiplzhD0wgtvex0DwMHu2UtbVqcic75GhluTcAvewc24pHtkWAF2FHVLZ1ZjKguTEMyNy67nvZzW7pSeESSWc+ccAqaeEW73hJQflSKROnqJUwNB0HX23eGlR8eK56w51P9h9oAMh/d8N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 13:19:40.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848f3f77-aba0-4282-b395-08def54fb43e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918

bot_submit_command() read the CBW signature before checking the buffer
length passed from req->actual. A short host transfer could read past
the received buffer.

Check US_BULK_CB_WRAP_LEN before accessing CBW fields.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/gadget/function/f_tcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index b3fa5a17fd2d..565ad1934755 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1525,12 +1525,13 @@ static int bot_submit_command(struct f_uas *fu,
 	struct tcm_usbg_nexus *tv_nexus;
 	u32 cmd_len;
 
-	if (cbw->Signature != cpu_to_le32(US_BULK_CB_SIGN)) {
-		pr_err("Wrong signature on CBW\n");
+	if (len != US_BULK_CB_WRAP_LEN) {
+		pr_err("Wrong length for CBW\n");
 		return -EINVAL;
 	}
-	if (len != 31) {
-		pr_err("Wrong length for CBW\n");
+
+	if (cbw->Signature != cpu_to_le32(US_BULK_CB_SIGN)) {
+		pr_err("Wrong signature on CBW\n");
 		return -EINVAL;
 	}
 
-- 
2.44.4

