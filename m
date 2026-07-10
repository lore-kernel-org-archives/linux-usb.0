Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C550233920;
	Fri, 10 Jul 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697873; cv=fail; b=m7RsVxZax0gJV9jnLH8jJQLCrp+ITCZEGmhFkT93UlOJg3Q2wjUMsSxXXAWZveMWJDnxQ4TENXcY6lJlGnZauKRZJapi2rnw3M+U4JEODjJRj82Nr7WYjI6eSQDWXTNlCSgztWjfEGUcLL/Yvnc0ysQ/XUpnUxL6TtX5i7EPWhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697873; c=relaxed/simple;
	bh=vult6mq6sPTyT8wx7/Qkl9OEFehZmI58epa0C2fUiZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDz9fjfFK3YhKXCTneQ3+/9rByuvPvFnFnKdsi/pRnH5PdanrWGe7fqNYgk3ls3vgQoYY/vBzN9HTJfp9ykE1om99gvjBoQ7NhK3ByYAQV7GImhv9dipsIhTgu/cOXBeUwV0lDm5SM2+zceyszHHcSKosnHXbauTyII/cLkZsOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lx6ZcUuL; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lx6ZcUuL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xqu1DxNjnsu2sdcg2moXRVZSQho5DftQ0CZn+ShAYqxtN+H1MJJjxgA8DiI6ODwWDbkfkuyl5ALrrv4AZDa2MUBNeOXmQUXQ+16GYx8RDwQKkyaH4vbA7ZJOBUoXPpnC/eD5Si5c/6oMDlH7pPzSt3g6jJWX25Dd0oqIaZfYgVeKMKu3c9RhF8lKGcusN/odYkGOJvz0Nn2OShicZN6MeFuvGF20CO0IU0NRWLqZdMR0nmPkWJJyKYBS7+16dAwrITECDxSywmf44YlxNbrkQcxn4IPuQbDjw2S4LtVbLOyv/M8ITZRUC9q13UkugWRtzUKYMkTk1RHJAi7EsOffIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y7Dx2yh6RwigkWKWFVsCaMxGkDoyFfWE2gCmGwhOIU=;
 b=AVWmxbEZ0rPGfaZUrOLCpyLb/xlR5Di1lNJ4hALaPy8oXfh4/HnG7Aj3SIAAIDO8UceHg4lWpNGmxjaDiRhcV2kbdX6fQu9g0nVR16qy3cHQXGPVMqdgI6R5ikf1D/fMCAhqzmytWInLCadqe4UcLwDQpEJyUI9UAcv6wP4a1cYuNnnY7HzS20TmL0fySXbuR6vvKe6WBjKYP62yDdN3O/Zk3CUXodKiHjvnS24xba3e9WVh6ujSh5rNMSHX78A/kmqkunLFZ8/xFO1ES4UZyDQhC+Smm3AQ1AtQQEqcMlXIIivf/c0kASgsqrQCvsrBnOZ5i4FafWo/lImY4aNdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y7Dx2yh6RwigkWKWFVsCaMxGkDoyFfWE2gCmGwhOIU=;
 b=Lx6ZcUuLRLjAw54n38EZBL7ibCGEYF09ND+nLTd/OrZX0HqEHah0P6MICcJfxUjtSY5Ph+5CYS5iagsUAZCZ1Qgy5IdvZNb3CZgtCzVCy8ssFBh2OZKpk3o+upN2U9jEF+E3KfX0dRJRS7hNuAfS28cSAAw+BMnzB4TAMXJ0pgJYzFrTq9j7et7g9p9KpXW9e0llFHoQjq9K3Dk18aqVveY3jsPxqjWP+R1uVDHrvaoHhcxBYKZqdqDmaai3On6+i9fwK3zSYNKZtNEmdCjaj4I3W/cwapPsd9DwTZF7J6qBwiJVx/GZvQMq1oD81afKfaKJfNAnkhag3GwtFKkx6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:37:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 10 Jul 2026
 15:37:49 +0000
Date: Fri, 10 Jul 2026 10:37:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: imx: fix missing ret assignment for
 dev_err_probe
Message-ID: <alERxOPGEM6jr4eL@SMW015318>
References: <20260710070834.2744357-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710070834.2744357-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: SA1PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: de02869b-7c67-4d5d-ad26-08dede99323a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YDxIdgEriOeaLF8P1ZTZMvZSyq/Mc6vcxuhw38lusRNbPItL0xCvePmP1uMs7FU9zwDz4Jmi7NAZ/NLb96faoF0kN6TUMqdyC3waChiFJzJqHcvBPSF2tUMO0K0ZN4zeje3YeeQOwAy/RNw8JvdJKBMOCZs6j7b2b073YeKxl0Hp4iCIqDWd2fJQ/G5DKpM55uzHHvZKjv29NoyHUZjFD0HvC/vRLPS8SkerSv8OSCxElwlQ+6ieUzC4i/W6bJcQBIqax2diG1W/y7CpZEWnzLyV0qzoPpfJ7im+Zta3xjWBl4xUt/NV+uLcM8mbUxG6VmQeg1cDGAXE4+orweaF2djsyw/MjVV+h7xMyG5krlrIvJsRN3E5sQs9wwbiXgnvjR/3P0sH56YBYmAWDZg7FwpgOQLHjxJUclQKctkQwRvuyEY17eICF2LulgJdDfejQyZZQbzxshZuL8cG/uKeHR0DItvNom2GqF/fP/kxLnP+4IV8tjDsvVAQn0pbgr59pbV89INaG5MIhRBx4bmd1TRIELwDttApwnerb2bcK9dekE6IcYvZvWf/QRTQWqjAzsDKZEh6fb03Dy9Mn6KRbcQXJIpoxiChbmZddH/q+6NmA3JhHylT7kV1czkLvC4UQ3cLeeB7RlkqrkyvSLPfoU3PINjddkQKvuXaU4xmHVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zoJiKqPN1NktGwYZiTbWxOPHBGi5/Q2wNBLOjEet2P/jQ7WbRzn7azmNokMZ?=
 =?us-ascii?Q?n+Etn9Xs9+B0Fj7ZmO3KubK8le2A7j+KIvuM+B47JdBKbFa2aw6dZ8mGrdmU?=
 =?us-ascii?Q?BY6y9E5Ox2W9TEjRRDVx/TAbR2Xaq8ljsSTZSrA193WwDL7n2Z32JHtyul9+?=
 =?us-ascii?Q?UrqRStA+jwH7dsoGZAQU5sWCefysbKdkB64KwWq3PKfPllGwntXKuuUk0/sK?=
 =?us-ascii?Q?K1AqGjLJ5bbKJk4EdySyb69eS5r9/0sFV+O8LDrGOmQ+bknPr8MzhlzUFGyo?=
 =?us-ascii?Q?061ZJsXWg17i3SGCrVzE4tspzrUYCS4Y72ukinbL97NmvA8zO/ntlIoZjywa?=
 =?us-ascii?Q?o6rNUPl2sDrgfjAUl/qyiCXrbeHWlRdoTZcioAQU/wWgr/NMs7dXSvNALSaO?=
 =?us-ascii?Q?Nfn59e0yGRAt3p0qFGGpiVOUIvPuUCekOjBQCgpziFcxHj2tIA2dzykstemH?=
 =?us-ascii?Q?eWschr5rbUcPqY0Tx9RYgexFTy4RYt982aZwWxjtWw86v/kRhgZsRytMtcy0?=
 =?us-ascii?Q?7E0u9DWOpulT0maYovdk9tIxxJ3H094KCdM8ouO2OsL9qdKQtmN+d7XEc6ty?=
 =?us-ascii?Q?py3agU7vnfs63rwoEPwD2RPk6h/xrhZ3Yjm58T5qtCPN3rzZGnW+pbkNc94W?=
 =?us-ascii?Q?UBZ42AX0IDmuXilwh9CZ3VK72k+cQ98Im63IH2VKdO3M2vIDedLKFZnnYW3G?=
 =?us-ascii?Q?ye7gkSRNXtSOVsg4X6cR/Gy9SHpA+Us1gdYaTwW9rNcapidvdbfo2+27znsa?=
 =?us-ascii?Q?X1pCbJdQrK0hN7nHQan7Xxa65X8bfZ9/jH5Yj7CE9+n6CrVvfD0itx819DP0?=
 =?us-ascii?Q?hSJ9A141TeN1LzigUDTgaCLGVX+0i79QFzgEYLqIStP+XmuHW52psoq+p4QL?=
 =?us-ascii?Q?LDnotkfYaNqR3ScQ/A8x7Gbzlzokb/uB2r9TvmiPxkqQJcp9sL2r+CPNCpaj?=
 =?us-ascii?Q?ZbRwhfIg+0tL73jV5vBwmhQ6hmsHGHFazcjS67hHy1XLI5glp9x4Dw76DihW?=
 =?us-ascii?Q?Z/g3o6LdLPpU170JZ/MbplExoBbbqXSsTJPsNMSL7cfvncmSfsGo5TNp/uxQ?=
 =?us-ascii?Q?op75bwziMExU8mnMhvpBNaAZ1utncm6urkfZZEb8VKKIAKjqzFYSxlYGxvVD?=
 =?us-ascii?Q?HwO4XydNMf/E0HsGo8TCUMRJyKV9EmBG4TGBFGydOUer4UqbgKHnC2oJlKBn?=
 =?us-ascii?Q?FP1w9HgAEBfph32inVB0n0h0cvahrbCGkvLlnflRCZtYxUxaox7TzAsNk7MV?=
 =?us-ascii?Q?xLGP4hjjJg2z3xF8mZqCtmhwkcTIdDlJ55h86z43IWmQspqm0oC/1vM70m5t?=
 =?us-ascii?Q?ajf6icqcrdIb13UksqBi5UwZbzWCmv7nYdfWBKjClPN10P23t0+X7D4St7bB?=
 =?us-ascii?Q?C6gDEXtSSBd1HdUvfvzoCsCxgmsHXZO8vkDvsS4/f7HllDrH4x7zIXkUz9CM?=
 =?us-ascii?Q?vl5s36YYzXltkgI8C2eS3aM9c5fUE+p+yvplN1tCzw5XaA0leqj5g38GVqbC?=
 =?us-ascii?Q?yx24fhkJKPuIIlpYZZCKFKbGIozYZDUPXQfFac1ywevZyA96EsricNxNuXga?=
 =?us-ascii?Q?rMgf1XvLP1EyywQO2c6PIlkTUdDWi1Dsq6OiHU08wclVfKb6dMNZQX32yROr?=
 =?us-ascii?Q?ave9zw6wJVZdtKgX7XUBiCpBUDB5T4yxNfvr4hD7oqSG6WRrqvClmvfIJyLu?=
 =?us-ascii?Q?ROcPOpZCFpZtziDUOk/ZBClXS5uHJ1FPZSPqJ1piHx+eTtnWeeiNDHazsIjf?=
 =?us-ascii?Q?x9qJyRLaEkrZZHdK5tMndq3HFnYtpBTkJ/2lpKTNP4NmFiwT2oGG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de02869b-7c67-4d5d-ad26-08dede99323a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:37:48.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDoVOuQGhqefP0tNz2unWhVv6xK+SkyQ4l/+FSroU0Da781nUAXsWGb25nIH8Frif/2CCArpCjmpfyJZWLo//uKvVX9/FH+CF1dh6zGR2MWrkgSLPmuhVtCT6sFR7J7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Fri, Jul 10, 2026 at 03:08:34PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Assign the return value of dev_err_probe() to ret so that the correct
> error code is propagated when goto err_clk is taken.
>
> Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..282314eea7fc 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -528,7 +528,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");

Generally, -ENOMEM needn't print message,

	just ret = -ENOMEM;

Frank

>  			goto err_clk;
>  		}
>
> --
> 2.34.1
>
>
