Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFF409613;
	Thu, 16 Jul 2026 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198282; cv=fail; b=oz8YHylX8zlE8o38dtVQmf6ORnHVeRHzmC7mNUm6nvpccFBEaKNDIoxzuNLpLEFGIpxeh3QoiLGcM0EQz2aXTHaFRZyHS3fdgQ79OHrrtJYr05Ri7r6GYqFzhNySpUX6WKe9hJVJGYQFpbOHL+6WKluOpXpeRnJuCn2uJaCUW5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198282; c=relaxed/simple;
	bh=Q27L5o52u2wlYnkQvR4Ig5qzAQqcjLu131mtIkUnk4s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H7GhA2JTAVEnoSJrXl6Ya7PJOwbOmWut+PjYNGwb3/MEnvfW+FuBJS6BefDO8aAw1ups6VP6UM5aeIkXfz+3Iant4qsMhbI8jE/D8UNpeJuEq6HLit82SxSVXip+ctX4jHfnNKd9yMZ6gapOBkdG56+JMi6awF3CGZEWNnsl1G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NbSIs2vW; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NbSIs2vW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjnz5gAWAK3QoXHYVuUzRw/+166LHUQHctqEMXtLkfte6CkNsDlh09KrYVbjg8JyMz60bRDxPoJgpwk8Oze5DQ2F0Ji2wM+/TN+WhBRvNS0B1xKj/XEnBqcvA2dloaqqycjboXZ/gT8wUPBdSsNBtnH8AMndr2wUf96gl+tsepbtntnSqmyjgzUn41/zOhatOw+lyKu0wLIGXZA4uOCJioSWWOPfPtjrffO6C8zvHoRozIRv+rxhrnW4sF1FtcmooDf5Fo3Rr/3MG5FgQce9vuTKfosn3bmkq4p+IX2qgkK/Xf8bNMGeLZbgY5eWf0oQj6sCpG8KFvreZGNPTyjo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zag423CWt0Yv1/uW5EicCumxKw7yityq8c0crZ1g5GY=;
 b=jl+E203DWjWJOSfPqkdcFhjwB/YlmPuAMia5XqVdkPszj+Bv3C4zX2sNG4VSHLWD/dcWNdyZEimEXG51MOgCXfeRw6mJ9KUcn6pSyqaNGy1J1pfvYd0yTPQW/WWk0QDADWQtju7O8c6aQT7mf2t8cO1wjmcJmJizF00e13omxkt4a9XjGtZw97X1Jm56jC2z2h6dSRSQEvAqutKBSVfPLyyPMVfXW/sPP8R8FfXQzmmzpEGARdwbRElfQU2n04Tn5VzM8ITtMhbOzgcrXXEyP12aQPQPPV4Arrvf171BYOmkAmVgbn47bhQHK8xZ5bvPI6UttSVOD+JH5PxyfpBthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zag423CWt0Yv1/uW5EicCumxKw7yityq8c0crZ1g5GY=;
 b=NbSIs2vWGAT2TqqoXE0kR7fSlk7JtOUj4glQvZtduhY0e99fFz1ZHw6BZElnVRaYu6EPVGs4sQyQrmwMAkVjdOIE8UliXaWX/3s9zDveOZ3EJVpI0Uwff6ZCM+tO72BN4bDLU2oNBRe5Pz0J87qAaqFfeBJgzKTpyY5NEt0S+xsflNOLlZCYL0aDp0L3ETBVi0HeLPoHhl1zwfSyto8NYUpZKlr54Gf8nFHSInfvUmAkx0vQKkEB0yMwH0NZtw9zY8lIH3Xxmo4k2j48NF5wG+UqDyqmhylLmV74J5gHS8tww1EaUGdL09rD0kRjj9f9D6smVq+tdg77qpD0jiCNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA1PR04MB11036.eurprd04.prod.outlook.com (2603:10a6:102:48b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:37:54 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:37:54 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: fix usage_count leak when autosuspend_delay is negative
Date: Thu, 16 Jul 2026 18:41:26 +0800
Message-Id: <20260716104126.2763454-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA1PR04MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: c31b3a80-b2aa-4aad-d426-08dee3264ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ttXk5dbjG4sq2lQ7xVbXopcuLlPba1O2QisAhPbdGELgMPiZxeHmVvgNragkYmGXuMWzaPwBltxoLGL7qCSzcza30XRcm+AMlcKTZP7FLaLKH/t0py82Iif9dZEiN6kt30ChnYJAWNQLypzI8EpKf2ozXl0bNeQTo8S9JcNfgDKJf0de9ELgIoTVVXKVUrDECDbzvSX5CkYu9SgXAdjmX8BteZJg4kKKFQsAyHfA6cToW1+Bk7Q8ww6bh2uARUOHjML23EpkIxf5AuuamBsKPsnfAByq03yVO71Sqw/9DOKH+RvK1b1LbP46DqrQWNbija4GDO9ANFEOm8MSt1SXS1Lk0NMGG6BWB+MHm/P8WiwLIMAoQ4eH/F593aiPljrXE/3JSED1yr4uXYuY0lInE8PsSoPF0yK/PXYouFVMZlzDt+btEaPNLXP6y32qg5TeYRleqdnUyT2/aZZKKI33G9b6Au8vr1jmTpOxoRkMnkDbFJCdi2pLYB9fdTy0QGx6I28SbTvrTiVvF+iGvL+WxTckmkbBav77WauWGMPx4HRztaqusa7/UXCvJKvy5rf0pG3vOOwCN7ORORAb8qgep1FHYEHqSKnEzyLy/gchj1IfWraSmpiPcgP7+FYrGgbmJUfL0xoHuH9yox6Gk/uU8T3zScFqt8GYQIjWVNyb9xM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FKtEG2xDjXbQU09sM4Zg9YeNNfYi+G7xWUO0KKvf7B8OUQx2mnBhurGw8Cy?=
 =?us-ascii?Q?6f8yKaXUTxwDuwVg8o5svTp8IB/+fs/BGpeyOwKQ2+5JvguUXBfA/4op1uAQ?=
 =?us-ascii?Q?kDQHBornP43SKWOP8grdiW6BK2kDQp1ZX4oB5O6dE7cHKPTzKXNJVoDLRlMb?=
 =?us-ascii?Q?HLugsLUb9k+MUym9x9lQkNDYj+N1+RUR3mocP0xmrhlBdENXA/ufotiivZeh?=
 =?us-ascii?Q?T4AUL5nB8Bwie1T10cUmEnSd8zYCNbVe2VNwxrVCiEHLLbxZIXG8DGgX5eod?=
 =?us-ascii?Q?ny5U93ksYXvOdVHlxy0kZWYmpFrNKhfUAkcZDxo4tzLMMcheVCKThSLGg9BM?=
 =?us-ascii?Q?dPkv+RNwvlCRLU6/KpQsovzVhQcIjqg+JejLW4zX3KGqH244yUsbPt9HaNA2?=
 =?us-ascii?Q?0qK03fYHzPvzlpBzoTLctgyh/TZqSHjGOB0ryysEJ4/4/eP8hviQq7Tm7lrC?=
 =?us-ascii?Q?e8K0qEmr9YdUQ7SERIzQ4GTP8PnGUEzm/Ka1dsu5JlVthF5GHIaP1FAG+k9I?=
 =?us-ascii?Q?9D6+s0VPEOxFf3L4F4cI/ZQV/Xt7HeMB38pL8s7wfgwgKnMWPyve5Hgru64Q?=
 =?us-ascii?Q?g3/HxmP42RHfewJS2PBK01YkwlJStt1ixiTb7ziH9kbOOhcfg5eP2bU6wgd5?=
 =?us-ascii?Q?i41DgbhQ1uKBqSz9Qb9wDMSNVXXKZa6y01INDJbdvw11slsIDrNtsyAQsSgS?=
 =?us-ascii?Q?hz17lnBYo+EjP7ndmAMq1wnSsWB+M6bHFsWRZOZEP41/C+Yv0iymW5oYhelu?=
 =?us-ascii?Q?VOkZ+FwSvIELvzY2Nd1DCQDinsvZRKGfNjBVrlnWv0qoVpSh//TBTSl+nQ/6?=
 =?us-ascii?Q?qpq5YOdzadnxhTnLxCCIYbmsCI7iYWAcferyYwggH1XnDG3sP9G5/kvgYZlh?=
 =?us-ascii?Q?eWbnZzpxWYHFTf+7CN0M67W3RxinFzSfERvQZ9eSWfA5pwDPKmtv0LDSO0QP?=
 =?us-ascii?Q?eAaIpg0TBv8xT2jY/ForTL2g4Be0nkW8LQgJEMcqNdrmdPkpA+svYHVbYCxE?=
 =?us-ascii?Q?lo9dDATm+76dSmGJTgevW42OpPZAp+9q+g5W+iCA6olbppFUcNahk/A7z3GX?=
 =?us-ascii?Q?yYzSLOBd0E/lOsk8wTaeCoOcOAZWjuw4VGO5Uhspob8VQHoyuv4zUZA3ID98?=
 =?us-ascii?Q?2MD+2FcBJ22wbtYac5rZhQeVSN/7lcysGjsBVZsNoDvohdF/livvPDX60i2c?=
 =?us-ascii?Q?U+Y+Xya3+SlDMGKStoFz6BIylc6roMO3wp+MyyjkZ+6TNglEfdGxhu8eNQrH?=
 =?us-ascii?Q?79N0q6GJCd9RajPZ85rg2RtP8JqfhMHU4J4GCgzhW9ALk59AF9qfNsY8f1P7?=
 =?us-ascii?Q?+xq8jHYX4noj3xo8a1ZlmRIfGBjMBsBJ1U6f5iz+QZq4xz3xKcdHFJuyGEVL?=
 =?us-ascii?Q?Hrm2ciceO5kHRWLAlmukeGEawPYlm4tYK6/FxeFx8K8uzgoVlcpbRDyBqbUK?=
 =?us-ascii?Q?LKUDiS3sHFtypf40EeHUGLC4lobOM49daeMcpXaeU5uR3H8OFqL0wLyefuWT?=
 =?us-ascii?Q?YmkRIcIFIDd64sFDq7Q4mB8t38bdkGROjdo8EE6gWocGlkglz5BKRQZNvHlK?=
 =?us-ascii?Q?Mugu0in1I+JUmaaUiqpWKGnGyXJBxerLiU+aX/4W8AtMeOLB1RHhKw1SopqD?=
 =?us-ascii?Q?BjDVb03vlz4s4k6yx2BG/Jj+WQgRS451N1bTwUHSSlmGsAscPuNppENjnfJA?=
 =?us-ascii?Q?pCqB/sBSw9BPuE+k8p67CenIjF8QoZyVCPjZieFfyyCillwxALVqTyVQ9Obc?=
 =?us-ascii?Q?yCfieEObpIZBr0RN19so39bzvT3w31pyM4Qnm4LH+8GIX72IHSaL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31b3a80-b2aa-4aad-d426-08dee3264ab8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:37:54.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9Wab2OvBhBgRJBz4erlX7X6Kobjf/L0WgEKuj/NjJeleReRnC/UHkpELwU/D7XnA5KE4sd43+qhFHB5ppBTN7KOW4HeMT1Mz3DSjvpyYfBQPoe/sl3nkW9JAirYJwzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11036

From: Xu Yang <xu.yang_2@nxp.com>

The probe() calls pm_runtime_use_autosuspend(), but remove() does not call
pm_runtime_dont_use_autosuspend(). This can lead to a usage_count leak if
autosuspend_delay is set to a negative value.

The pm_runtime_use_autosuspend() also notes that it's important to undo
this with pm_runtime_dont_use_autosuspend() at driver exit time.

Fixes: 1f874edcb731 ("usb: chipidea: add runtime power management support")
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7edc512cc37d..3461dd763a6e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1250,6 +1250,7 @@ static void ci_hdrc_remove(struct platform_device *pdev)
 		usb_role_switch_unregister(ci->role_switch);
 
 	if (ci->supports_runtime_pm) {
+		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		pm_runtime_get_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-- 
2.34.1

