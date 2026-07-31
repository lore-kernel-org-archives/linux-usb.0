Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A651351C06;
	Fri, 31 Jul 2026 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470124; cv=fail; b=LX8aABLlNLbimstpV1MwEWJNBimKBQZ3S7qCE5Dd0InrYb1Ot/e7ztQ5x7tZjcc+rIIrUdJyIUH5h8R3b824eCYrI1Fh1eEtwPAZclNtWhBhaOunQgB3Goj9lOVhBFJMrMfNVx3Uw7bGG/Epm6LoPzmAwJrwQl389cOz5cHT+qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470124; c=relaxed/simple;
	bh=F+fmqfmB24oiQLFnpnoN7Z4odnRYTz2d9mecAMwtExI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPmluNK3AVqvIvzDmKu+0eo9Fa+pMy7FqDUDrQ1SQvrybHBVD6WmOBkYgYICch7wu6/OIDe5iHEnQK3OKHE0/ufWVbSRSTOTncfbA3vOmT8vzKdzM3ZbSEgslEVeMGgIyTYbbCUE+ANV692+DCCz8FN7Qov3lukaSTuBTLbrN+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=oPJ85n/c; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="oPJ85n/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voV6VQDjMk/2F3EsHjniPzT1N1CMGphmB/NvYBiIeRe3whlfaa5Jv4FfURSDGA4W3oybRJekiLfVFQBcHMDJlPkhIxd7kPViYrpHgdaEFkZ5RIgXlklBtqgGFn9pAxVxiqMcM/amkijMy2g+fHUqXb+qgf+kro0exhCKZjIOb1hoIk8Ls+gnU8XIup7I4EvaLci1UXOUACW1VZebo4Hsz+5gRiyQscuKYe04/1JrxNJBM6PpXquNPgaVzOWwwDmwE7jzxWN45D2nQyJmKNIjsnhkgmjmCvErItfgjXUT4oSnm3qBcHeDLKQpH6p9m/Uuwf12XLJpTlkCtKlN8l+SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/PRpwonGD7Sts59xOiX1Na7dFWHO7sVtM5QJFU44ws=;
 b=Mt783MMxJMCrmxrg5k6uoNVIAZPIyexP88xNBg9Uk3vQ1UIJpWqs15ktQmLA6WbRM0obMgq1pSrmujsbcw9rWMcXNi2yusTLgBm4inrWbPUXnGFTCJrgFwP2SfNn/Ja4YZF3kTHSxvRainOIwMFqGTSoN0tf16qUTXEhkf+S7hjU+9qimfviGhZYiuQvHPbWmT/qvVNIoP5C32FMaqhXu7txoOFLBosqK/G3hIACfendhw+E0mOegUjFI+1wCOGUxHAObgy+irIK40k9aypmjnPwbGpp6emZrgojMOIVZ20Oyk16l8nZtjQY1ejME4lrS78il+0z017CeFUcpZ7QgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/PRpwonGD7Sts59xOiX1Na7dFWHO7sVtM5QJFU44ws=;
 b=oPJ85n/c9J2GurW9kuzI2Q5gKY8Zw5OdbUB0JHtKffsvIJV60zrXlghYta1atehpKxwZWMuuhgg5cmo2seC+nESetSTE7yCBNV3CJIq8qLI/w0h0Ymq3gQ+I29o9duZKm/la3W5F4SCywbLzhCxBRf2yyI6CdqenoJXDRn3fAzqxcZTn6ZtnhOlFFMAL/0l3ZxaqqzAFh7LLzrw/p9O0ctrF+0LMsalBtG42/BCu8t/g8kcGI62OiK3yX4iuHcvrU6RjGEq6tfQIPAvrxFilsyLGlpCLQDCSwc78wD1CKyivP3cagS6SlhylPrGyM+xlpIDjDd+KgX7tw1fjml46fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:18 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:18 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 02/11] usb: common: usb-conn-gpio: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:36 +0800
Message-Id: <20260731035448.252289-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 850c29ee-59fa-44ed-4a04-08deeeb788ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v+2HCnKYc3L0l62DETcn4gM/MjzXCsgRRWVIbqwSeFdI76x3uF+PNrouOcuxMKmtTME0SzQkR+iPm7W7TbuFgIOz/dojY9igLvZIfHN2yutcBT9co5t4BHNvV0gkjNHf00AQk7TGmnJ5AgkwZAcCek1AuIKGGhzaOfKAqhJKMHCK3NwQidC57yFObBtRkvi4rwPJKVqaHEionKVf+ChwSsTpnuEKXfTu+SOS7h8xp2zAR2GUunI8dl8UI6AXGoTklWwiJshzox02LCCb+/fcNth4Ra3D2Bm3KpVn8u+WgCJjCGvlBDW9Q1RpcrqAp5CnpSU6vxvVTYjjK66Ns2XjOrrX+xsqe1CAjUBbBZstp7BW296ItxIFM7Dhtz4oMvypaAb/GRIJm6EkprapscoasZmqdn+JMKy6XMlXsa8dKjvA/isa2C6Fccs/kQ08PTMUzTv0gEOPrw4Xg3xhOUv5rYCUR0gQqFvbfpXlxv0gs9ntmc5mJMTwA2A9/STxYdLGZkBsRx/j10BzicxRCiiBWSUuMU8VE3ZVkayzA6FiD10jlmoyxkQA9xYXLJ6y86QwXeUho9GeIj13z3hv20l0Mydm6aPQajhCFbipIE318nXo3P5QbtTg108+18SAGIODTDi7UPy3/MSjTqIwyWKMGXByw2mM8f47+kv7+22i2vDW0VEz5Er2ov0/9APlY1+NEFYt7NJGJGgXaUxn1RfyQyweGDX3RXhFOqWt++ArUa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6M0vHSyxWf4NFT1w2n2oozMLlgLS2lgBefO7gyyZQE6tAPr/vy9miXI1ZtBg?=
 =?us-ascii?Q?c2VR1Sui08AQPwz/ZlS8HkRwY7H5H7ktJJhIp/XS5M7B7Wma0VStwYVaVGJm?=
 =?us-ascii?Q?BOD3TbRCAf1QiCRRjNKFtU/LsW6nux4ptCXU+5EErHmUxrjLl9khUfYuVh+r?=
 =?us-ascii?Q?FW5ymJ/SrFAAkrbR8J7gHD7Cl5lu7B8R/3Nx8fS0GqCuSDxLPRRNrDvONbEy?=
 =?us-ascii?Q?uneNMVIZS2cgRzpjYyirRAvOIDly8Ud2KUJMj6SG1jrCZbst5iOdVtb2bjBr?=
 =?us-ascii?Q?rHJisY2QtEnohrPixuQ64GMDpU6B+Q5NU3si9X69AmZExglU8BfKJ2OWYxTh?=
 =?us-ascii?Q?mlxU/SKXK9Z4uqYJLez2Zh+7SaDr4+fHALOOHrWJD8nrHFadiy9F8wolrvl/?=
 =?us-ascii?Q?CWmG/eV9s8vv3kqE+AieXrrbzjE9MedEBVopV0LWx+0M6dDU9OKKwA9C05nP?=
 =?us-ascii?Q?2GqAKYs8uL31LCwonNS9YLGeNlmYcrPvgHBPtd+cbQHlRt0OvzWiJ8Ah3S5Y?=
 =?us-ascii?Q?xwTTpJjjO/YJYF7YREbih97UjX+a7Lb0hKaFHUPZ7IEOmQBb87fHPcBBvUxa?=
 =?us-ascii?Q?nrjSzAw1130vZdhFZcmzIBFKHGIKxmqruloVhiQMdjexguOCLt36CQRG5Cx0?=
 =?us-ascii?Q?3ToEgj3JhII7gb0PnhbI6g7gRAF2oH2n42b5a/op6Mjlz2KPpJf4o1kY9m4z?=
 =?us-ascii?Q?hso66+JOFXmkjqGnIY0/g2iNsWkFWLcOo5zpG2ju3X3AMtJINcOM6fZeC9N2?=
 =?us-ascii?Q?zttxTuHl8VSDgUhg20dyl3zXm35QGfK8p8AqUTWT755ao8uehcYoIDQTe1xg?=
 =?us-ascii?Q?Ff8AP1oGZ2p+XtYe3i4fb4MMqdQpdQ/ozy/xitsHYVDjuDi6F33/VDM+Vtjl?=
 =?us-ascii?Q?VBZunB5v+vDGpH1X9luLShSFBEUYQCJXXp3xXNgG95tBpUjD35D4H6JztzPn?=
 =?us-ascii?Q?c9AvszcphW+uaJW6blFy0OhYYXXRoA/Gncou2wInLR/QAL6P929oa2ioR9Au?=
 =?us-ascii?Q?KwH2c3kKiWvOR6OgGDV15FRdekgRahoR7XHYYkNaLtBPJvvd07ePWpmWNCZr?=
 =?us-ascii?Q?9omQtJ6DBEBgP+bwc1cbO++K2lXYyrfSJtdgoL19lgeEWjq5rNkY+RAT3WLf?=
 =?us-ascii?Q?0niyIOCQyJ2FdnDziV3eVcjE4YDI3cboR201jb4qiSiTIY3IAnT8mR40cwNw?=
 =?us-ascii?Q?toartH9faHEEkZAU1ze7KC0zlR1Zy/7DonJgE3Zmp2/1ztbAVcVN5/0Rz6uM?=
 =?us-ascii?Q?hFTsL1y+TIl5OZugje+bzlrnH3Fp17Nvx5Wz8Aff6pJrmSBxzaI3Mezvc0vf?=
 =?us-ascii?Q?76jJp494ZtYYnQudbyxXJMg0dl23UoHOVUPNSsQp/JnrttNom+mfvhRY5DoI?=
 =?us-ascii?Q?dIh5y/S3IIq8OISU2WGsNgEapKyNZxbvZnCR2Ex3Oi7n/U4kcWDem1bxRTyy?=
 =?us-ascii?Q?gCUyqMDxfz3sD6VPdd8W17YaGp0GMv/pXdm3j61tkK4NYLdXEhG9CjQ+S2/U?=
 =?us-ascii?Q?2KeM/hWnsOJob1a7uWMmcFy8lIct5y53L5BVSHAfi00mXCNSu815mQLGLwuw?=
 =?us-ascii?Q?25QomJHDvRcFewFuPLsRKSqriADhx/jF5mrKgqfLhMvO/52SUQo0dn75uhMu?=
 =?us-ascii?Q?zjGeDHvTZ83itH2lRhVmuUJ6MVhQvV5JOqAkGau8KWFTtnJK7LtOiichONZd?=
 =?us-ascii?Q?0ovMgy4rEF7xKB38j5RfX7W7ijekx4t5THD7Zblber4AMq1FIwl60kqT1xvn?=
 =?us-ascii?Q?UpVFnFbvhg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850c29ee-59fa-44ed-4a04-08deeeb788ed
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:17.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+zrl1Qvp2QYpa70IM76HGxL/6eHP1hg/P3ondMzBZMCNmJkfgeuA91BySt8eNPFzVWlJ0rWWjL+R1xB0c/kWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/common/usb-conn-gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 421c3af38e06..f6db03d89efd 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -251,10 +251,8 @@ static int usb_conn_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
 						usb_conn_isr, USB_CONN_IRQF,
 						pdev->name, info);
-		if (ret < 0) {
-			dev_err(dev, "failed to request ID IRQ\n");
+		if (ret < 0)
 			goto put_role_sw;
-		}
 	}
 
 	if (info->vbus_gpiod) {
@@ -268,10 +266,8 @@ static int usb_conn_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
 						usb_conn_isr, USB_CONN_IRQF,
 						pdev->name, info);
-		if (ret < 0) {
-			dev_err(dev, "failed to request VBUS IRQ\n");
+		if (ret < 0)
 			goto put_role_sw;
-		}
 	}
 
 	platform_set_drvdata(pdev, info);
-- 
2.34.1

