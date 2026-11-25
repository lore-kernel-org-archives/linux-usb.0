Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595878;
	b=amFbwi+7PfD8vJdAKIpDLCdAUL7MO/mLeh7SxTXs6yzsIAEAV8f2pqInSh1LwULckzCK
	 lPXtRJ2Bs2ASVfyVNw0KM1ioff2ByPLKF+4t11mekg76splAj3sLoon//xqHxMuoKEjJb
	 uBEaxZRjBQTSotN87xXSIfJQq9E57BVqpbzYlzMhZTcPK3jN5+mefJYEmQhWNkglUXn7Y
	 fbpN4NeTPD8QR6YYJD7nY2/rP2KIDYDCi9Ckd7yodAtatYvJhytC+IMizFhteaqAVqapb
	 52ayisCt/JLgPjx9Zdj8wcrNEKiK79VlAefi4Futy8I4B4R6ZK2KGwmA2LkJCFTvxMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595878;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TgyK8/WwaIV8dbDDtUy6IboYpvr6MrS3dspzunLfEDE=;
	b=Rh4/vlYP5TqfePc7hCtnS8sZMhLKgMhBffA7pnpOPoctxx4JGSbK4JeKK+oIWh+Ka3J2
	 1SxMjdkjDKll8/VViThMSvtYyonAJw/XZJXkng6C3o3yyBw8M8LPzz4VR9rGv4KNfOpJx
	 s0A9oR6Fuu8lorR3ffsOjU0Dz9nYvGPPepLXXfM8wUNw8Q4haSRAnJrOGlhqLVz8xMPFH
	 TMBkagh8m8YJaXPBt2a7RVHhxfkLo3kL4Lm/FQZUBPAdu9hWWjqaLHHIii3UgHMqMrqXw
	 fg4ATxUl/bCJxTqsyFRzPnb3HPma2eeKiO7MeKLvUPYLn02Gr3KOqx1q1uAPX2ySo/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC7606A33D;
	Wed, 25 Nov 2026 08:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDC7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv/yNL17lbVfrBdBNCS3qGKbKjiOHr6LuLJG6tqOAlEHhLXV5IeBHfQbtjbVqouLQxKEErIKJmQXC7rn1tuBOmiEH06S+m3uNDTFma4Ob6o08WyZsIMwL1XlYULtHjQnSkHC6EDgjmI6dx8KstBhjLAKnRKGMZmVwAAAPgv6mFY2gtOLiiYjWIYUllLJxbY6bGQKuq+WGZ4i2HifbTc0zsUajnaaTCrK4fzmD6bsyIqsAkxXisdd5ylqWG+Jw8PW6ZDgWW/GbNYZXRnDkG4J2//rz2aBN7mjtOpB2rPt/UfliY4uPwxg0nOJUdn4P/rvsMq/t8lU1Dy3taUJAkFJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgyK8/WwaIV8dbDDtUy6IboYpvr6MrS3dspzunLfEDE=;
 b=d73IjYWitOK9gf5lDXTbK8tnHX4I9skO/TWzGVQQNO0bOPgcg41EoE3ylbLuVTzJYlLtqv1RXafc5YV9LSDcrTIcmWb/CpadxZ0WSqcBI08cJ1XDWKvQ8jWZPjKA3fxPkclJjGocrDlSM87SGE+P9oTO5yNDeLfaWAks2eR8/UPoLNPRKbRMAfEdpvgFqdFFuZsnVdt2ZlZdm56HZ3Yhf9D4ud4OfR5r9kHJ/FY4jHz7dsbdO/W3rIvpaoVhleh2Dvcoxa3zjEfBVumuSYgsnkTKnDuOFA0hoNiy7+/QMTBVd9n8Yy6l/SkQag6Xgj6Ixdt1G+svoLbeNtNDhzPmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 08:37:47 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%4])
 with mapi id 15.21.0639.012; Wed, 25 Nov 2026 08:37:47 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v3 3/3] usb: dwc3: starfive: Add JHB100 USB device adapter port enable quirk
Date: Wed, 25 Nov 2026 16:37:36 +0800
Message-Id: <20261125083736.50606-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261125083736.50606-1-minda.chen@starfivetech.com>
References: <20261125083736.50606-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::14) To ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1048:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd3b6ec-bc1d-4a21-b78f-08df4acf61d0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|56012099006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102130727099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+rV+exvGAIIIl1S4XwhsfrTxzE3zrasASbR/Fu7FqE02uyGyvcQY876h69emV0KyaTXk8rWZ5HN23sOosdc3/c6VzxdPFG+7PG2J0GYFN3DX25mhqNoFgpxfLW2GT8nN3qlmuuKl3txe7yxAPhrCMmA+bCpO2KGP9atEB8a9Z2TNTx/YNE39LFbsh8jXPzfXODi3OqQPsYUkke0RnvdPbid+xcJlSo+zRgDOxGnfwn+bDNsN06ozRZkNt0TIMl4ph0J4Aimekt/CCIGWhI40oKK3XDeOdbxc7hZyTdpK37In5tPE3lersOW/IevZQp6O0X7D6AmiTGjRfxpxZZVomUm8UdPUVTGM3VzN52JCAACgUQO1svfaZcCKfzfhx+JWTKwwICV049pRC70S6gyuekAuwKNkjijw2pbputo3/Fr3yc5z8hWg0Ii5qbGvC1tARIgbMzSybyScnJLUVJk+JmE6TTHRnaIkhhJCk+nKKEpNToNbKjOmOAEYOwmrBcm6iAloiTQUdDiRMFAD3N3SdR1h9pG7ttJzFbL4VaW2B23liY0TtfiZ9HxPmh64EgrN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NELQgr5hgW1PS0lz369QdyArcf5GGkNp5dY2LXLt4x+3IpQ6+9mMvsuhPPD6?=
 =?us-ascii?Q?9gsnR4SIsW30XHaYzozT8X2sIWmCrQ9oI0l9hAymbLu7SIyvo28DLJ0o1gzu?=
 =?us-ascii?Q?tejBWXeMq3p1G2f8YUiFwxBlW0LtPBBHYaw/Yyq/Gtir/jcQos1AqiMDpAb8?=
 =?us-ascii?Q?YZFFzJOq7+9PJUX/WUwCGts1Fjqb3lHDNGlOt+RJLmKb3amJSqNRUTJB+Q9J?=
 =?us-ascii?Q?wX0hEsDOUQ6uDKO+T/4mG1YTmNN0m+/h4h9NVGEFsxuMjH/pSpuXJXWbXu7m?=
 =?us-ascii?Q?ncMHwpqTxlKbkZaBEAUVZS9wIBiYMuUF0MC00yfEP0+HtVAncyVo2KVvsJ0h?=
 =?us-ascii?Q?3YRZiKXD1BfzNR1zDGjSAb3gvjbb4rYYu23e6W4NlfQkdybMK90qWjv/6fHw?=
 =?us-ascii?Q?62EvSkSNZwXJjmkEdCefZuR8rga4Gtj0FwByrLygK2RMcOhjD1YjsnQO7b3c?=
 =?us-ascii?Q?PdWR9diILBOMRPT8qm8T6SLM40g9m7tOaMK7pZRd+edNfCh+0PmG7jCwfP3f?=
 =?us-ascii?Q?wZAyrH9qWhKsHTl8dMOcbIoFtKuNs52+ySpWBwaFNkGykYJ86G4PrP0faaQI?=
 =?us-ascii?Q?UIp0bM61KQcqqhVG0QHG3dJMp/TFNwVtQDeavPPvvei3VBEbIqwLYjJdnDgt?=
 =?us-ascii?Q?k7eo1ALb1MEbwTzkWpqB1XOGA0nAew4zNBMOd4nc0gpNNd91gpydLN6esdgw?=
 =?us-ascii?Q?ITg81+dh4XY4YWxZatB5Yu6WqpfNdK/sMYv8OolHqbJvF5JAUjqMLKOwSDYb?=
 =?us-ascii?Q?02azzuhaQ3pJEILN41Sustk6XspiNOFFg0sABkjG0c0ysLgwyB18cBUYpYVn?=
 =?us-ascii?Q?i7Aw657NA/jUuLe97POuYqNU3rjgoHWlnD4TVsKTLgAd4XwqwwtIL0SAC1uj?=
 =?us-ascii?Q?oiuzghvC/gFAJrcZsjfieWA3TDCfAQhqPVD1Ja49tmAVXzBap8uFt2/AT+3+?=
 =?us-ascii?Q?nmOmhAJjth421O4AD9Z5MGTgy2/mFrsBblYhMXtvWqZ70lJjA1mcnT1YywiR?=
 =?us-ascii?Q?ylPnb69DupCv9RbNfFhkx+1+tW7/HqnDN7Zsnz8vadB7evoJlpTMImZbNhMS?=
 =?us-ascii?Q?U/7Q9bVQf/0F4dFLzD6+Sp9HGPBRAf6RLBg6AjSt9LC+t5uUN6wRhqzO9NRO?=
 =?us-ascii?Q?G2nydluyb6eCTdqYUJPOJPPCUUoKu2vC5XWfP7McaslEkTony0taWHbaTgl/?=
 =?us-ascii?Q?lzLJUWP9hSJa5f5lJ77eSdMJOTMDzm5gXe2aRTrSXmmESUK33Uh1kxvFqwEu?=
 =?us-ascii?Q?dVsfJq3ZBtroaEqIC0f24s6fYG+4s/tu79EO7G0Bou/172k551q3HCcY0/jn?=
 =?us-ascii?Q?WfeOigakSHjqoqASurxL3KLzBFw3zS/LTA7UAeJIeB43U81sBPWDkDm0ai1f?=
 =?us-ascii?Q?7qg9Oh3H6gD3J3diRIJTOG61aXcuJZHbp8hcT8HJVU/V5H7qK+EM4Z8+lCxu?=
 =?us-ascii?Q?uP77nSKuwzFqWn2YtlDwGlIc5TV5YqDFpcMbqceTCFZ7++xQ2HKju01LVHk2?=
 =?us-ascii?Q?x0qrMtkQ2KdScC9loeeC1S188JmRuxSYGmV5b5PVkFzll8jrWP5OC3qEOzrA?=
 =?us-ascii?Q?441hkQzgOozrDSUMPaWZZ5Py2Gw/1ppHegUa1/uDf3sw9FbrK0wivjV0paTu?=
 =?us-ascii?Q?qxntP04tSJZTx2OuD/L1ap5MAsga2cbnpwZ8hWhN7qGPNU14QTPaQB1T0UdV?=
 =?us-ascii?Q?7oVxM7UV2r5mmN+NgW45AIAnitlEHMLEgjRR4GR+LMfROw4/+xuMEPVnzS/X?=
 =?us-ascii?Q?/BixondawVqT8oc5A+NhKG3y3Qi5+QM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd3b6ec-bc1d-4a21-b78f-08df4acf61d0
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:37:47.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pygoILM+CG1U/2yY0Z1KvR2IQ7O+bPdfolvkFuWDUffXodhpqPCaoPMbUcOdyN8UbsNxjMIe0M/RZWgbPqpa1WCp6wXpT43MtbFKlmRxUMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048

On the JHB100 BMC SoC, each DWC3 device controller is connected to a
port of the xHCI controller that is exported to the server host over
PCIe, through a PHY adapter. Setting the adapter USB 2.0 port enable
bit asserts the connect status in the xHCI PORTSC register, so it must
only be set once the gadget is ready to be enumerated, otherwise the
host fails to enumerate the device.

Map the optional "adapter" register region from the JHB100 init
callback, and set or clear the port enable bit from the pre_run_stop
glue callback.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..ebcd43442fc4 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -22,12 +22,15 @@
 #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
 #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
 
+#define STARFIVE_JHB100_ADAPTER_PORT_EN		BIT(20)
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
 	struct clk_bulk_data	*clks;
 	int			num_clocks;
 	struct reset_control	*resets;
+	void __iomem		*regs;
 };
 
 struct dwc3_generic_config {
@@ -42,6 +45,44 @@ static void dwc3_generic_reset_control_assert(void *data)
 	reset_control_assert(data);
 }
 
+static void dwc3_starfive_jhb100_pre_run_stop(struct dwc3 *dwc3, bool start)
+{
+	struct dwc3_generic *data = to_dwc3_generic(dwc3);
+	u32	val;
+
+	val = readl(data->regs);
+
+	if (start)
+		val |= STARFIVE_JHB100_ADAPTER_PORT_EN;
+	else
+		val &= ~STARFIVE_JHB100_ADAPTER_PORT_EN;
+
+	writel(val, data->regs);
+}
+
+static const struct dwc3_glue_ops starfive_jhb100_glue_ops = {
+	.pre_run_stop = dwc3_starfive_jhb100_pre_run_stop,
+};
+
+static int starfive_dwc3_jhb100_init(struct dwc3_generic *dwc3g)
+{
+	struct platform_device *pdev = to_platform_device(dwc3g->dev);
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "adapter");
+	if (res) {
+		/* usb device controller with adapter */
+		dwc3g->regs = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dwc3g->regs))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dwc3g->regs),
+					     "failed to get adapter regs\n");
+
+		dwc3g->dwc.glue_ops = &starfive_jhb100_glue_ops;
+	}
+
+	return 0;
+}
+
 static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
@@ -231,12 +272,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config starfive_jhb100_dwc3 =  {
+	.init = starfive_dwc3_jhb100_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
-	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "starfive,jhb100-dwc3", &starfive_jhb100_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1

