Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55C401A00;
	Sat,  8 Aug 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195188; cv=fail; b=B9TWPEbwMv85UFAoBVSWAIw1Ua4gYYIHCxsYRjL6Nkq+DXbvv87JFtSUbklwDy4bqHh7xSbzV3nmN41BKFu1Rq5hj5rOV6pM7KPodqPZwMJk7YTF1oI0ZKQi8rT8sm2QW05Wg8MaeSQjSIu1ug/Rqf/C5Ipo6rE6PAVyIuB93Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195188; c=relaxed/simple;
	bh=tDlaGr9PQtOGwg0fEnltfiea1385Zztdv/N6tMUuPy4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tw+D289/6yIa1xJIy8EGmeQ/Wqa0d1gKT3AYsgVNMVhdUI88pEIZcHrBSRIsoPY0oVI+c2zUaKOshQgcqSyCQr6o+Rr5/iGmJC5xVIkNNaVCSNEZ+AN6v12UHnAO9e1l1/Wj1FZkR+bCn0ax6o5kBtdLjgjMkRlky+Fe03eK2GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tkId7L/w; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tkId7L/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIPqsswa87r6rWrZTddboLPAXnEkg5SIi/xqE9w92bmHlfa48J/InUqbnBCS+0vA4aom8HgcGUoMYLJsx5HawWtwmNpNlLD8V2oXpPYbF7wzVJ9swf9JpypfmQ5ukzyXSKct/cyfZgpY9fdD2njMKmHGiE7jvAJ0EbAO2eQduLo5XuQQ2PiFRQ3yJSEYirmXtyim9F94jqHDqbkzpY/Z9qvsrUwbHX+NBvIeaFoehYIQkcFi/jRWPzXV4er7MLbv85qFXyP2JH6Kv+UVp8NyFZhV2otKYib1y3zLQtCR3RxfW9SemXv5D4iw2QTCG586ZM8Z17BiypqUH/xfgEVdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/C64rMW2aKwpRxqgVL33ekn09QOtLQsJLs1Vn4KZCk=;
 b=UMStPpfD56D74fkdQkeN8LPbmhjad0QhSjtISzNfjhFjSrTaohdK88UuT3acfHubAZIPJvg1NFL9ELuiTdWeIduzI3TrR58KV3jsgZn77O0ZE4rWS1IgSPmz8rESmZ0r37O52U9WOa3U6sWN1/Sp8yWrRvII2HWzkV7U7yo1ZCdfbwibXAC62nrlgllTV44gwEw5MzUdZCWYHrYY8oQ8WsiPcquEALP/Eir4m70/DMiPHv1sB6dU9P2dXnbI1UXCr3h3SHsov2q3THdpjzYJqYEIcMYdyYb76QVj5bwwEHUsOcghD/wrjN5KsfH+iDHVyFYAHVC7SRqHyyboo7MIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=bestguesspass action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/C64rMW2aKwpRxqgVL33ekn09QOtLQsJLs1Vn4KZCk=;
 b=tkId7L/woMY7sKOWSHxCHqtNgh8RofLqW7w7Af94g6uLBPORnO2PxC8a0DSkYsnnkGbt9FkI53UGXqkasSqTrmthYEmCsaR8MZ2OUWHspKzy6sOvs/6JHBF2EkSRlUVFx+URq9MDwHld0CNNHv3iKqZmsjqeYuwrr/ArNnAUUrg=
Received: from MW4PR04CA0240.namprd04.prod.outlook.com (2603:10b6:303:87::35)
 by SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 13:19:38 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::27) by MW4PR04CA0240.outlook.office365.com
 (2603:10b6:303:87::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sat, 8
 Aug 2026 13:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Sat, 8 Aug 2026 13:19:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 8 Aug
 2026 08:19:37 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 8 Aug 2026 08:19:34 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <jiashengjiangcool@gmail.com>,
	<Thinh.Nguyen@synopsys.com>, <zzzccc427@gmail.com>, <kees@kernel.org>,
	<christophe.jaillet@wanadoo.fr>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/2] usb: gadget: f_tcm: validate command length before parsing
Date: Sat, 8 Aug 2026 18:49:25 +0530
Message-ID: <20260808131927.214132-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 803558fe-2a41-480f-6188-08def54fb289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|6133799003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6BzKfAoSQUg6GNUKujWxceZGNLpHZy0aLEEHtrjv4Mpa8nd8ib7tPouUQPVFyZyJZI36/MCSBLh3l16etiPZkXK4/7RUbZZI+oBtmOaTJH5e9X2j4C9VEd7NjjM9JhgzWufOeLLuc/H9Tx4sv/prf0beWZ4A0e8XoHw1Dxrc3KiGi/YTknO+kMLvZPTJh1tzoftRwySS2WiYbR5+QD5vvHhuS/c73mus94ClM1zgTumL3wLkp99lwwrwgsiLeHgJajN0qgoOfZjOSNdZU0s6S6+A/O9fepSoQ1CTUXr6CC7LVc2iFtTEyTu8ilGLI+scrtUO4sUDaAk+xxLK9aHSmu8Egxx1Lykt9Dk4ao3iyrVAxKw2jpViZkcdbpRBKb/BRKIKq7iTQLN2XbtvcaST5aQkgIz/PNpnUrGMyhesxKWAlLGq8dnYwa3ZVrwEefBXrtAUBBzghSHw2J0aDVuFNQ+RirrkEy6H/BIxUDkiIdsu063Uxz56idDlZ9tlV3V9uGgLtOyVS7JM5CvQsLFoLYAXgN7qiTAmUSabwlMLOgKbzfQo7beQDPmzV0KQ/5CKfyOvfQ2/uUmbFdyrySIs6OMhmKy3mHc7onB9wg1Qw32UHXsi3K/Wv644LPb+zd0YOznltCEMa+Ls709nRkm0N67aC8j/7LacEleRV+XOfkoolwQSubnK+JmJ1ML2yBG/ywYGgKXgzxtxK35dNZgvuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K0lTfxCYdtkNdsvW9931MbkvRxso3Q5RbPy1j9T1dDs/ft99csUHXIM6gQtzuzPSh0o0RFnHA9GoLDx2FWikiz6lAhHLKn/JWZnPKz1E5JA733GqzBpk7lu6nV+sv8zMrPwWsBUKwAYIpbyvtv5JTbBIn7ndLE3whtAtgEFoEikKQ5BpfmN9JlbEDZN0KMeGav+zpdPFRWfUO6qfK1NCNB1b8cHXLVQNXl1hoKxS/UqiX3/4Gdp0QRfbHCKIbFjIBRDKJjonUcDOHVtysAGLy0f8CwbAVKh9m4Y1dbdlVrPls+v0B6R4B+tE18gxt8EdBksIQVdf5Qnprg78win/1dYrSTjnPVdoy7eB/rCDywMeDhia7VWsOALYU4ofNSLGjdTpqhX9jclRqAdVffBe9or+BLaL8T4FF6U2POTWk/JHl65j7RsgVLb3yaWp0qcU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 13:19:37.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 803558fe-2a41-480f-6188-08def54fb289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082

f_tcm exposes a USB mass-storage target through configfs with two
alternate settings: Bulk-Only Transport (BOT, alt=0) and USB Attached
SCSI (UAS, alt=1).  In both paths the driver parses command buffers
received from the host without first ensuring that req->actual covers
every field read or copied.

This series validates the received length before parsing in each path.

Patch 1 (BOT): bot_submit_command() checked US_BULK_CB_WRAP_LEN only
after reading cbw->Signature.  A short host OUT transfer could read past
the received CBW buffer.  Check the length before accessing CBW
fields, matching f_mass_storage.c.

Patch 2 (UAS): usbg_submit_command() parsed Command and Task Management
IUs from a buffer sized to ep_cmd->maxpacket without checking
req->actual.  A host could supply a short IU or an inflated
cmd_iu->len and trigger an out-of-bounds read when copying the CDB.
Validate the received length before parsing and re-queue the command
endpoint request when validation fails.


Radhey Shyam Pandey (2):
  usb: gadget: f_tcm: validate CBW length before parsing
  usb: gadget: f_tcm: validate UAS command IU length before parsing

 drivers/usb/gadget/function/f_tcm.c | 42 ++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 12 deletions(-)


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.44.4

