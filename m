Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B53BA225;
	Mon, 17 Aug 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953613; cv=fail; b=hfoz4IjYn27JLyw6yCg5CwNK77wQIjey1VTe3UDGXV/8SBd9WWc1XG+QO3vkf7FCHB46DCftWW1qPRSUie7X4jipMw9nzDYaAwpzlmtfxZlmenp+Uy7s5TPMi9MqbYeoxVT12V/uOJUN+FMrnSERBRHkL2PzdoGrnELGOfGHMTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953613; c=relaxed/simple;
	bh=XBHenBoAHd+yNmstMsIu4tRtindX3YDJldMagbFcXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SNOPk+4TsUt5cPaTCgURqQ99+a5WCq/waHAhzzUisRCpabEBahVrmxE2QYRlxFMSYtdOGduLBUB5jUVZUo1dJ41tz1m7BUStuMPeDr/7MaouFK4IMyrMjQnw6OhQsi0Xfrce8qOevklyANp5ZfiuOrNWhHjZKTuad1VB6o4dM3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SsRCFgdP; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SsRCFgdP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWD3bn7rhBUXBue+5tDbD5AwfMzxVakAXsP6GPm708V6u/F+e9E7JSdFKbj12py/QiUzH3qcSm9yPJFYOjUjhzE5D2LWuAuwJjeD0Uv5YeVdErgI8KqdPVL6mEx9UOEyn1S3ePVipDX3mGpvISGmrPIEYA9OyAUcSobdQg0xZBvuvnoMWgG141AfySjRw47Ojqxy+pE2KogVCin2AsemcXhT5jzX+JqHGMFg9xzs3KyCR1r3J/brEgQ+9GTUbswKA/srZhT/WXBd4OTuOKGAvjIdEfELiKVBNq4yHGwrGyeyqEGT6bymOa2IcXtsy7+qu+/ojZa05m3vfm75L0NaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OAWvQVQvobo6QBuocpvPs5UmNAEpNLnrP/Sme8aslg=;
 b=MW8ENGFsqPKSDn6aGzwfTLDjOziRAjvJ8nJdhMpawzTgkLQtjZFi1mfpuI5co0ukjjj8lDJymAhAhH7LCEi4Y2EgZLoP8DHJAgf4kLPOW3dD1O2LVTEaJvZ/4sBISR504roxbPnmFe64mCusgI44ehDCtWZFJ6GF/o/N1q/uIKJPhPfCHbiLUQjWsU5ZqlIXlunL62wnb9g3hTzKEmocpgxQVB6P8aeGoOGG5UHVr/8By1CZJNTR7NU4f959IdZBTjjVHW4GOesy76WzQYUZhi1BCbvA34koK+oCR3uNbW4J+50G6m372/LdeIz0n13Rs8m5UkEtOjDXxHnEa5onTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OAWvQVQvobo6QBuocpvPs5UmNAEpNLnrP/Sme8aslg=;
 b=SsRCFgdPSC6wC8tk/cKCCSfrvakyWv3n7HyZrcMZ7gUBRJRLrCD6A8lUO03HJFcr3J2KG/xnAl6cQdEqh+PSTgjdggVeZckLeVsEaegMiFP+mzpCpBsyOWwb1P2PL+xR/q2CAcuMtYW3YjGbWLt3Ota7AE5BUFc76cXSU6QRQcJQRArzdxdLaqsu5njYh8MGJf7QRWN3sabNrY3nQ8G/alSq4PHX6ZveCwikXgegmSPBZ63CqxrzOzJP7GdNYVY9vPuVVoSakQH2vQGKPAbK69lCESAEG/6oEm+Q5pHTPxmG+CY3EZ/u+w7flGJObkkJbAtfONudtyIu1qz2s8EEMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA3PR03MB7491.namprd03.prod.outlook.com (2603:10b6:806:3a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 08:00:08 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 08:00:08 +0000
From: tze.yee.ng@altera.com
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrian.ho.yin.ng@altera.com
Subject: [PATCH] usb: dwc2: handle OTG HNP SetFeature requests
Date: Mon, 17 Aug 2026 01:00:05 -0700
Message-ID: <e1f4718cadf28c4348bcf6ebb025f71732416538.1786950594.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA3PR03MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 475fda7e-03b0-4c59-466d-08defc358df5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	4DQx9oHOL0PQxzRn3Xg6hJZdU8Gvl9JHEd6gKB7OlpnPLfuT6LuZ6Xx73GzkkBbJVtlQ6oCsdzSkaKz3vxxm1s1tUBlWOkt0sHKye40L09R3XKPpaqXS5qK+x065vTDJcpWgRZrqweE1woZ4QTeAL7Cn6m2u6iftLVMmDz/PvgWztXSvn0d8FCyEZI2BWxaJCPQFiygCXJyz9rugVVmvVTM8EJkqEiHu7+IusWA2arOyHahIHETdoRe0OY8bHd97KEQgQeFEpTXOEZZ3RPfu+ZitRzFNP+lpMLOPa3k5D8DFMLf7+0LauQHA9viu0SFvXB0yyaXENu4HOCO/mx1t7gXAF3iH8Yjj21XpU3BrUIHjzH8OwqOkUhyZiR+cKl4sg0fxU1D7Cw57vDhaaEo0ECoyi9uS9CTAPpDeGfzqplfbVNzzIdAbvz6EhYJ2jIKJ7Ct5JuppMXVTqLXb5MbDvukZQdkbsyFIA0gB5aO5g4U/SRRGcdVRaFHAAtMJiikn1y8LrONs0xJaMjGG7RIhzmkBR79siBEtJgULtYm+1MgI/a1q286YCtXFGaWRQotPx4Pi5P/oB6YCLPHPdB+X4+qPrikaV84zKRYHgoYRUycOfkT+lgPjuAqlD630OzQZhlRq0bUP+ZnwFkGahxF4mLwIeUBLLI2wPEBxcOgZzgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DL5B7YzfUfPpCvZGXhaAaqABAHo+EeLb9Rof+5ulHc9ezw2Ta9rg9woufvm4?=
 =?us-ascii?Q?RzU/945B5Mywf+7XqlOlY7HwnwMhXwaty+eYl5jkRextQlg9KUOJNlaDLNcd?=
 =?us-ascii?Q?LySHwLI0GMYJwhJZ8sYFz+TfUGg8iG2Gw99eHeN2dfDJ5z9zwxP8ZnW8YJl3?=
 =?us-ascii?Q?ekgzJ3t91J2/a+geHaieHGotnJOdE6myhdoK7YGyak6SD7Kt0ueJkof65lm0?=
 =?us-ascii?Q?LNOjykbFOPXXNjU5NOVuqx4p6f3pDcuwsbFS/2RnlaFjKpKqpvTLGx5YXs6F?=
 =?us-ascii?Q?BoyBD7l9aN+rJ4aZTZrVv1yLjUxX03XJA8GGct5HTXkC0RgCezDGS/UQs09b?=
 =?us-ascii?Q?kfgUi3DQevbQ5CGQ+jUb6xCbsiVmE6Gt4UQ4YsiW0LELJdrm1wxkD1HVlJlq?=
 =?us-ascii?Q?m3Y0TQ0hZZdKO4bdeFezCGi3jVvFpXGIB78H9jxYIhHP0G4teNfVZ3xNjDmh?=
 =?us-ascii?Q?NOk/vLeMAIKqKTasFVzWlJUTsiEDUHaCDtp8wpHxOrek8o4YWx3ihx3cGHS/?=
 =?us-ascii?Q?jvj5xO0w9n6BTr15DYwRkiFAqnNgKLlOjYBuJZac9Oz3zL212UFAoPNf/icV?=
 =?us-ascii?Q?O+LBkuo6ScH2hTpkXw9lJ0pStkUJz8I+2GyMd+HEH5wFH4X3dxgqH4BhqbtK?=
 =?us-ascii?Q?Zw6h/cMf0xxFfLwwKppF4bzHxi82kDIQRpKBYevJDcTK1XOYUhGtdGxJO2NV?=
 =?us-ascii?Q?OrJOC9b3Owm1hhJlEwahsKEdez94VJZOi6sguVEOeCOGEcF3kT3/DrOw8K8o?=
 =?us-ascii?Q?N4j8fSOoc/3/bfJN5IrAzLaqmt1PdyDpvJOObhxM9bd1G0VxWdtX84JVg9c1?=
 =?us-ascii?Q?hul8uZBsrO52QqHUqoc8hkrfqJGnprk++wuv+a1CDAGcydn5Ri+bsR/kxxz2?=
 =?us-ascii?Q?sYaSgNaFwHs6TlBEgh+uyt4wmE/GIPWRuKGNp7HNbel7QenGmqLVGPiwshaE?=
 =?us-ascii?Q?cSMnO7eQcxxaT20el74js4MZ9K7FcP2GEksk60WbiIogb2fAokpYuTdnLQG7?=
 =?us-ascii?Q?/BEP8Hhxtc7ZLbI1X8KyAUmmI4HrY1Mf2bLPXr0k+85fiEZ9WPHj5VQbDvaZ?=
 =?us-ascii?Q?ZYoq/xbWVkXiDpmUi2pU5crf/l5yPhLhocjuuD2QDeQucgcuWWpeMI2vS9JR?=
 =?us-ascii?Q?ORs+yeUjxznKkQ8vkGi16asqNPv7mokyBO1fU89Mno2AJ03+7PN6k6c4uLZ8?=
 =?us-ascii?Q?Speq/Dhj4y7DVoSYtKMXfMLAjnh0RiYCfoKgezQorm6Y9FtvAk1r8i9M0rr5?=
 =?us-ascii?Q?Wmo5dGOb8vQFZTd9AudCF0fbafQFB6Gb2yLLkiQ2uL43Hc0sGK7nTcuHSIaT?=
 =?us-ascii?Q?95c+FAK4wHIxBMc6FlNg1wKqFwqIORrW2DZcAiUnsNqHalFeD+OrrKgCPDcK?=
 =?us-ascii?Q?3VHKz7nyPWQL6vJrLjHBWl/lknopoBvfkHk+ofmA54se5kqoYZp2huS4luW+?=
 =?us-ascii?Q?EolujbsL1rGXcKc4Wdr9KhrvZCtginMnjE0YI9lPjl+e8fVCfmeeRYOcN/+l?=
 =?us-ascii?Q?56j8KKSh3Nsua44GpH3gFyCWqvplcjXXHE1GgAQPpv+HA5ElznQK+zpmkaxf?=
 =?us-ascii?Q?SYrY9rMMhABxWjWxBepy89P9+FolT+7jD+Q0CHdZeC7Wt8wwynZOrLtj3g+1?=
 =?us-ascii?Q?9ZF9Mwkmweg6T3QwS5FOYO809DwQEvd8nyvEhO42Gn3Ja2X4CByJnIb+zx+/?=
 =?us-ascii?Q?jeqS9f6to8G/NLE0UdrO8GY6u3oiyT8M6Qa9WZ6R18Rsyu6jqMq5XM9WDiLj?=
 =?us-ascii?Q?RgOOPcel4Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475fda7e-03b0-4c59-466d-08defc358df5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 08:00:07.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sytk2vCgZEK9vaQQJnGxxQ0nCfkhSx1NiOR7BEmkQikMcEd5OU5W5RgYZOBv0tdUa5A1endJ7EKM6jmrdZqIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7491

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Without handling for b_hnp_enable, a_hnp_support, and a_alt_hnp_support,
HNP cannot be enabled when two OTG controllers are connected.

Handle SetFeature for these OTG selectors, gated on otg_caps.hnp_support.
The OTG specification only defines SetFeature for them, so reject
ClearFeature with -EINVAL instead of silently accepting it. Use dev_dbg
for status updates to avoid noisy logs.

Advertise the core's HNP/SRP capability during gadget init by restoring
GUSBCFG_HNPCAP/SRPCAP from otg_caps, mirroring dwc2_gusbcfg_init() on the
host side, instead of clearing them unconditionally.

Clear the HNP flags and GOTGCTL_DEVHNPEN on disconnect/reset so OTG state
does not leak across sessions.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/usb/dwc2/gadget.c | 51 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c8b02c27d27d..4d905989c09f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1780,6 +1780,7 @@ static int dwc2_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
 	struct dwc2_hsotg_ep *ep;
 	int ret;
 	bool halted;
+	u32 otgctl;
 	u32 recip;
 	u32 wValue;
 	u32 wIndex;
@@ -1809,6 +1810,36 @@ static int dwc2_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
 
 			hsotg->test_mode = wIndex >> 8;
 			break;
+		case USB_DEVICE_B_HNP_ENABLE:
+			if (!hsotg->params.otg_caps.hnp_support)
+				return -ENOENT;
+			if (!set)
+				return -EINVAL;
+
+			otgctl = dwc2_readl(hsotg, GOTGCTL);
+			otgctl |= GOTGCTL_DEVHNPEN;
+			dwc2_writel(hsotg, otgctl, GOTGCTL);
+			hsotg->gadget.b_hnp_enable = 1;
+			dev_dbg(hsotg->dev, "HNP enabled\n");
+			break;
+		case USB_DEVICE_A_HNP_SUPPORT:
+			if (!hsotg->params.otg_caps.hnp_support)
+				return -ENOENT;
+			if (!set)
+				return -EINVAL;
+
+			hsotg->gadget.a_hnp_support = 1;
+			dev_dbg(hsotg->dev, "a_hnp_support set\n");
+			break;
+		case USB_DEVICE_A_ALT_HNP_SUPPORT:
+			if (!hsotg->params.otg_caps.hnp_support)
+				return -ENOENT;
+			if (!set)
+				return -EINVAL;
+
+			hsotg->gadget.a_alt_hnp_support = 1;
+			dev_dbg(hsotg->dev, "a_alt_hnp_support set\n");
+			break;
 		default:
 			return -ENOENT;
 		}
@@ -3322,6 +3353,13 @@ void dwc2_hsotg_disconnect(struct dwc2_hsotg *hsotg)
 	hsotg->connected = 0;
 	hsotg->test_mode = 0;
 
+	if (hsotg->params.otg_caps.hnp_support) {
+		hsotg->gadget.b_hnp_enable = 0;
+		hsotg->gadget.a_hnp_support = 0;
+		hsotg->gadget.a_alt_hnp_support = 0;
+		dwc2_clear_bit(hsotg, GOTGCTL, GOTGCTL_DEVHNPEN);
+	}
+
 	/* all endpoints should be shutdown */
 	for (ep = 0; ep < hsotg->num_of_eps; ep++) {
 		if (hsotg->eps_in[ep])
@@ -3416,9 +3454,18 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *hsotg,
 	usbcfg &= ~GUSBCFG_TOUTCAL_MASK;
 	usbcfg |= GUSBCFG_TOUTCAL(7);
 
-	/* remove the HNP/SRP and set the PHY */
+	/*
+	 * Configure HNP/SRP capability from params (same idea as
+	 * dwc2_gusbcfg_init() for host). Unconditionally clearing these
+	 * bits leaves an HNP-capable OTG gadget unable to negotiate.
+	 */
 	usbcfg &= ~(GUSBCFG_SRPCAP | GUSBCFG_HNPCAP);
-        dwc2_writel(hsotg, usbcfg, GUSBCFG);
+	if (hsotg->params.otg_caps.hnp_support &&
+	    hsotg->params.otg_caps.srp_support)
+		usbcfg |= GUSBCFG_HNPCAP;
+	if (hsotg->params.otg_caps.srp_support)
+		usbcfg |= GUSBCFG_SRPCAP;
+	dwc2_writel(hsotg, usbcfg, GUSBCFG);
 
 	dwc2_phy_init(hsotg, true);
 
-- 
2.43.7

