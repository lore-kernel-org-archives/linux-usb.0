Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078BC3D811B;
	Thu, 18 Jun 2026 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768899; cv=fail; b=JmX9c8tXG+ya4DVRxyTNdvx3KzLC/ntmI/xuLMgQu3hCwpNjmlBokV7xA9jVY+t99aKQg/oI20StVE8yCy4xSWjGfC25xP97JANYP3GUIZ/vi32IF1iG2GBneq9fa335De5/q90kurF/gH/iGN2+tyv0o14ekXR9PzdBEcFf0CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768899; c=relaxed/simple;
	bh=LGKnFAdkb6N98ET9DKmAWo54KVVmT5vCd2n4+LYYZl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+vFqtcc3TpQgTLmqe1eLf+sjz4RfqCUJX5bpCK1nrwcngol9JLxhKAVs9GiRMZZgD2FNX8+8tLrAw7YIaIaOy5RdgSgpDXevx2jAMjrUXow93iEW7Bz8bBf5Hd52/OHrHwibZVil4/5Iv9Ozk0PrcczkMb0wm5U5WT8RobqAus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NlLP26SI; arc=fail smtp.client-ip=40.107.209.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NlLP26SI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ce1TfK7zdBepGKolMqWwvvNFRBh6KeefrmNngtRTYifuCdr8qjnM1r3tdHa1M6lU2kwr8h1kS1J7DhyQQlcImaxF+yHRHudVKbAcIA36Ej4AawYGpQ9wxceMc2kikDL3O8TRrxSXlTStkc+WmBYbmax+2CZsGdxIMCWWNIHnZX/Eb+eEjVxmGXS7/357akw9BYSG2UCIlKDmTR81WTOtL3OHhbV27KKOuXJXiNrDhtWTGFU3dsMiuQMyvqXWIHOBsqMXLygdp2FBSWQxsbhMGPwPlucen+MT+oXqC88R69vYdSdyAys2+0qGxly9Uxo/xxkm5aOvNo5v3s3UP8iBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHzPPDV0YSruCMy4c0wKpJ6wRbzMjnXtBWJCH7OCHbA=;
 b=OXIAsqV8+hLUjKS55/A7JvkrfIf5cVUVUkKkjm/dVrhtTpNGDHhwl3GAMXJDVD36EHbPguzHOtY00dh6N9lyh96LR4D3LUQt5RmbOWyuqqpje3Cvn+uX4Kzbd4ng3NVGl/B1UxHFeCmkfFYy4vZv1fbrD4p7irHJCeXgvmWM4OZIYCt2KmGHpPnOjDx6nGhyfv1RDWcs0JcOxg+jIbnOjisgytut8eVisqsyEYlliTykClV9FxK7Fce/pZVIBIL05VRhie9i7qUIKYG7B9NyUOBgCBOJ9dJLAIeNaaeZCDkWQYP7msee6YEATDX5mtEStwkKkITSW4IW4kUUJgKD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHzPPDV0YSruCMy4c0wKpJ6wRbzMjnXtBWJCH7OCHbA=;
 b=NlLP26SIMGGMSaBB7SFefXI82H+eY/TuYV3Li515Kaj8Zftd+B5uXjzcyWrwO39aUOuqSXdFcBOJDfe+X+gQz6Nj8vC9jHZ4TQZ/R0uSOS9agMy8Mu1hAOFAnwFa+Lw4uaxtDY/ZencNaSBAhofjXAuCXxemyrgbH9T7PEPGTtA=
Received: from DS7PR03CA0158.namprd03.prod.outlook.com (2603:10b6:5:3b2::13)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Thu, 18 Jun
 2026 07:48:11 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com (2603:10b6:5:3b2::4)
 by DS7PR03CA0158.outlook.office365.com (2603:10b6:5:3b2::13) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18
 via Frontend Transport; Thu, 18 Jun 2026 07:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:48:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:02 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:48:00 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 1/3] usb: typec: tipd: add error message for vendor ID read failure
Date: Thu, 18 Jun 2026 13:17:42 +0530
Message-ID: <20260618074745.629638-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
References: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a7c6d5-32a7-400d-262a-08decd0df1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hf5om0hDHr6ffBPGefnqZe8OWLRHx+cklNsUyNT1K6EKuGEktWm78gaQWnCB9xqAnb6ajBJpboIlQtPpSrDTG1LqB9n0s48BoUvqtr/P3S12p+DJ9F24gbIkuN+va/qoMDmOTkeLPhr5Lghayg8OPexH0bj8MyyZuPTdA6GF2oshBMmuSznKKIGqqx0iP57MCGbVCT3NFaJVVAn3aHolviqDBmLYhqqks/TlWNoeoF1ZgwDcambYl/qDqUg1NP6VMbbVktzJTgNNcyN8ijH09nCgtlGSZqhroSuUg737sSJERdEZlm4RbPcEGx1dOk5sQMXiW17uz/B6EdrON5+/rGaWTBGu3H31C21KPKMGnFWOXZLT2eogdPvtPH8Azr3SldnoC/vExrH0fWOKtkai6VuukOMPo5JToLeS5IARGhZ4PH+yoP5VJubyTrnEMt4SoagZuLs9Zyzb5OsyKb5XosNikjKKmIP5gsUWdiqBSfHChZ/v/ilJxys/MxJrLGAMiX9tQrm5kSGjFQ1SdCxU8LfYrTZZzxG7mfXDnmw6GH5lFWoleW8MZjPWdz6xaNh2eI2Mr6pWoUi3NWfFTdfh0HhweVa6g19cARQ0C4KK1XCdr9o1kyaf7CDG0yK3CbNubnIjSvxKQYKELN6TMmCE+hg1CdacX3mBrUzkuPzf7jhXKt86BVppUTpuzSjiot2l6OTijPIYX8boTrak4iHcn+XZhFBUfnn/vJDR9Xj+/Ew=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w4H1Kr+v9EfaQkTVL+jXHlaG3aZtl2KIqGDhHnBQWgcL449Txqn5twG5r+mJVN1KLMU3f/KUj0vA85oDwsfELG2mCvucv5HzNaJIXrNYK1zza5jR+2JB3U0nOhBdDcDMjBm4beWooFHVkIB82oBzNI51YPOlz+HmUT82MqkKTTNNBnsDQejAIwHT86lSOVX+cvRWwox0g5MApYtcvPQ6eWEk9BJEfFAp/TXmscVlBgI9G5Wv9LN5pcJ5JceJ+YYrs92cytgo8R5P3eTI2Hf0wHzGRlSiETFVeAtgDTu98+mfEuCUUvl1OO9fl4ksQC+MVCGOi3RxtnOtkR/eOU+0R6mf8MZwiDmwTcR5RYnz6uEp7Kq03Fwg3CQwwwPmKeoBYg/K+7fhg14siwAx1MPSNy2asmxBSdZCWWUDFSLZgjcMnj754rpqgrrpAvqD9csh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:48:10.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a7c6d5-32a7-400d-262a-08decd0df1c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057

Log an error when the vendor ID read fails or returns zero, including
the I2C error code and register value, and initialize the vendor ID
variable to avoid logging an uninitialized value on read failure.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Add Heikki reviewed-by tag.

Changes for v2:
- Extend commit description to justify vid initialization.
---
 drivers/usb/typec/tipd/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index d5ee0af9058b..465788f8490a 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
-	u32 vid;
+	u32 vid = 0;
 	int ret;
 
 	data = i2c_get_match_data(client);
@@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
-		if (ret < 0 || !vid)
+		if (ret < 0 || !vid) {
+			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
+				ret, vid);
 			return -ENODEV;
+		}
 	}
 
 	/*
-- 
2.43.0

