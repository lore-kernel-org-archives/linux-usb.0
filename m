Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7D383339;
	Tue, 11 Aug 2026 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428365; cv=fail; b=sRmzVpOyadG3gTzCVQ9g2Sk3oB2TJlR1UtN86biAP8Na+qpYYBY4CHwMqwScMZoCzonh4+RQlUNSXS+iRKpmNmw1xBtPKQDlOj/rEAU6Byvw4Bt6qOaljw7kWHgDckjrUPJHM4o+epjwsQ46PLdDWOJQiODArZ5asFGviO7QblM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428365; c=relaxed/simple;
	bh=K4OKuc+vPHzpfWVgMsR6IGT+Bm2mGhAzh4//EdEKjtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GPGP2wP+fAf4tFpihz8lS8+DFfBSynmQNnZHmML3KUCz0mTL5pLAE6KlBMsBWFopl/XhwWcHJyDypmmNlOCV3gsV4NO2FjLGVdJrsCROMqs6nuvfMDmGlaanqgJMmmY7R93p7PApyLa2eGRdFtmc5YBMaqviuhnQNhztZUI1etg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=Zav+pkul; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="Zav+pkul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usJr8b60YVogKco3UijPU/AQTVtHdANeGTttAkNvFaVkt+8cpCu7HN2jne++EcNLXCMX+lrjXK96/SqKc63kPETLzNv/oOzOBO6yOCh84zj+iRUSdoraybmdRqG5ghLAo7Qe5qfqJaVXGV27m8mcMp3SjI/dybTCW2UbVViQtXemDqln9GZNtjx3bjklXLnsW+k4O2hDptFI5ETBf+RttSG2bHMoiFhY9FoWEAfCkxpso+dhqnFJ9MK1Ov+uIdXrDCxhC9ev2ef8fq+0b4LmWguAf3L41XpiZTsdWClnLqba7j8HiAXduXcNsx2NCrPdagv6WvHCLANf6+Q3PGd3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es2rNjcCPZh76I+mrlu1G2HAaJeYyhXZNhGYGjYkPuk=;
 b=wPbeWzZhintGc0V1M+EG0VR/xloHAvRrTZaxmqF67K2JlLh5gfGyLBLA2etN6VIhvImf+sk8X0oF85gBkgk7Yb6HBWTU6X5S8sj+sXaTvtX7RvNIgqWhqZzKbM1a+ZoU+IEO6Cgk3JzcpxJdIleBQ3nKqAMiPYYjxWuXaNF4ZGlBoNzYgTFXOEs4BMP/TuEgV0/+SmigzS+wBdTKxaP6ykSfriwAyuBdzKjhouZku4Tf5D7w0RmWeTE7LKKCY3N9jGUeg48ekOpNPgoGGmi27spbj32K45j7XSeCLOTZTF/2XjmPDplgY4pjmo0YBD7Sn1RZA1i2MA4OYJtXV3nntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es2rNjcCPZh76I+mrlu1G2HAaJeYyhXZNhGYGjYkPuk=;
 b=Zav+pkul8azOgNrKJCNIETyiBPDXzO6yikndSd5Bt4jf0O/xx9XGW2ffrjDMjOFqLY60vuQBpNNVtI6Jvkfh9Ais1TDzwSgeB3xNaxFYwZE7eA/jm+hir9fRVQYBbiSJq6nhXupw72vKYDRzlr4Uf9HeXwl2FncXD/8jcaecq5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:05:57 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:57 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 3/6] USB: serial: mxuport: add MUX50U-based device support
Date: Tue, 11 Aug 2026 14:04:58 +0800
Message-ID: <20260811060501.2307836-4-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: d945c7da-2afa-44e9-1954-08def76e9c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	YKTtVDxrp40awUfGHbcb20c729GwwhRLTKmPHLFt+58Xc3qGYFoj8lq+h9LtB66M1UusBKlmRe8b6RwfwWZZdNQHXraARP3600cTmiDqS/DQrnk91G/RThOCeO0gBpa/5fq483UtUiQgDQuhwJyoHFqqzskk15HKa4MKKxbSopVJY20ONAcBdg7VBHH+ywcRkK0f8siLmFIWMr421fA48lg5jLu2AwZ8Gtjbk7w/34BzL5DsaiNDep4yLkz7ubcAMv5iLu5Bp2EqNbpausWI1gVbguSCjKwn8uVDNEIHHUc2sbYW2rpvTMrCn2GXNlC6A33VToRvBAbb4cO+li+21Hx1MrCgyD3Y7FaXooSe9glDe2MvCOVAIP19fHA1iwwrOg6uKvW3L8WIwHkw3FVVlR8NqdmXrZ1Z9PFR+h24LNH1y/E+DsP/i/9Sroeg53CPqkPKINF8ZFbb05Idu+AeaA8hW/uK3I6jx8ix4cVAiYMb+9QDiul6J66VQauWmhTeInvQY6XWQbrVmVvDtgLA1lkTA68Eu3X4sstBIslqPcR/GUsrGlgwrysWXcLzPGRLJRaQaztZSmyP36XVUpcOeSBt/bixNikBQVbrLp+yEzP4dQEgG6iS9K4bOuRHpo3uZI7UESSRh1vkVxuzYmZ92WRngJN3OaAhIXmW39xYc7FxTaKVPw1x3Y/naotvoLSe0dWML88y4c0gk4q7LSl/rX7llhaGQDj6sRGINV1zAeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?96QhCoZZLAqKecmA5GYNyF2rZzvHsO6lpLVR5y/7aT2qN9/Pzd1ePVrGugHr?=
 =?us-ascii?Q?DUc16ILVMGtHqZRlLse8k651ESe5VlWYe0plOUmfNSXWhyC03lEs0TPIasYA?=
 =?us-ascii?Q?aTBu7XtI+fK8e2+GIBVtV/oF/CCdp1IjTHMno0mudZFedXTIz5aEQflmoQr8?=
 =?us-ascii?Q?yIbHDk4RkIMVC1BpSMDe53WK/SCagqPNIIbjuTWKlZj/Y6RiTakoQ3ihf1P7?=
 =?us-ascii?Q?JSEtRy0hRXHzpk6b144uiZ2QNgCIod68GQ6mDoRLpXFtdf2X1AMTCmi04V9O?=
 =?us-ascii?Q?wzELlGdi6WGX7dSL3MXGO5CN22oFn/Ggv4HjP6QJow7uW5zQRiqPLN+me+ZU?=
 =?us-ascii?Q?yTKNhIaAtgddskypWtthlpIflehytWsnlwUvGlMVvOezFAyIyjjxQOBJStvQ?=
 =?us-ascii?Q?r6BCX67odMKLovhAI0hqNIaaKV71zNef6VAvVBN/Z7i8+A/GceP9peMmCFO4?=
 =?us-ascii?Q?mmV4b2Ba7zWiuprou6mwgE+GJ/3w6Ti/xcn8ujJBUT4wjFcFqTtX0WdoJtO4?=
 =?us-ascii?Q?tstxQuIKjDPbvhzA1piRI5ORITqm3OJPR2MSXeVbpBL4pb/1ygoYNEqGsgrn?=
 =?us-ascii?Q?CExBT2QLn5gAWcQAfejyg0OJMrv1uDe/jakSt2eY+fhmfON2eJx6PMX8PJfx?=
 =?us-ascii?Q?8+hdFeLqqYXxLS7eCzGrVfpAxn9P+bMFqf2bUEf9w9gffL8YyuvNol2m3YJO?=
 =?us-ascii?Q?LIoZeSqy9yRiC1mE4VITpamuuJT13VCpCU5gA7Wpfz5xNa63817hETpnlFG7?=
 =?us-ascii?Q?NEcsmJnIlUhA3GmOAfWmNmD3yw/cHn+d5NTSYU7a2cobamZkCVd9CBUZ0cD5?=
 =?us-ascii?Q?rCPLFqCO/YrYyb9j9U06fzyzjDKsS4oCIhie4cg+MFMhbBLMfD+sl8ETtH3H?=
 =?us-ascii?Q?xxlFOlR4urmkQs3swt/Q4HwyWnWDlb5cMpMk8cZ8ITLSHmLS1VwhmwSeLAhJ?=
 =?us-ascii?Q?nqeBsbsHhOuJtKYJ3ZnmMBMoKyIq8CclL8A/NZUcc3paPTm3D7Gp/Wrt9QZT?=
 =?us-ascii?Q?RYsb7otL0+g/9mgCZwajK2xdzAYlw/NBC4qKROwGp8Ht88cbBsJHyDmUAEGk?=
 =?us-ascii?Q?V1CbxPmJQHfAqTSAAFPnTnGZbes5DCG9midL3OXZAjCbZgpsROXKvd4xe0yK?=
 =?us-ascii?Q?ItSRkv6mQIGt4lymxvjJrsalEpL3tnA2UsNJ9PzycJKZ9iJJlE8J6ABe4HeB?=
 =?us-ascii?Q?oR72CchVaeWdzTdqojpoOb1b+NSVbx+WZcRZ5l8/sX0WwHfUPLIK1fqkx7fZ?=
 =?us-ascii?Q?txK62ve9FuRdWD64H/Q9wl6oX/+OFakRBY50Iy2J+VGEz9Pa3dPnRuMADZ6G?=
 =?us-ascii?Q?K/q86QgxFQJBzWT0tyxk10VpIoOoxS8nNzTpfSUeNPg0jSYR66+AECAJ1Yuv?=
 =?us-ascii?Q?b/7S07ZtnBZzoFmerW/BEQR2PHFG1/TIz1Z3PcoXjT8fvMZKLJZX9NhK3iiW?=
 =?us-ascii?Q?p4uElVVenNVZpvGIhZpreSblCmx7AI1nTLp8XwwG89Ht313ZL5rlyjgn/yTz?=
 =?us-ascii?Q?P0a5P+h0QjT+0VdmMpKOXvQi9On5YJZST59OC4TgAzPaG6j4aNgX2+tn+PTL?=
 =?us-ascii?Q?8pqbsU2+a3DA9HQnC1AVunYHUefIAml6wcQef34EosyH0Sw4VZ40m+yOSwk3?=
 =?us-ascii?Q?12qv19uIG/LjC/7Paj0ejnMpn43RJKtTpl73Dn7+UsESVBEd7j/+ng71Hb5i?=
 =?us-ascii?Q?RD4nTOlsuA1/a6fJ6D4HrUeCwbGZwqjPYjmkosu151XbMv+ryWjC0mMxWeAT?=
 =?us-ascii?Q?a6hxgVIuK64q9WJXiHLRXR7kh3QDkRY=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d945c7da-2afa-44e9-1954-08def76e9c52
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:57.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlRmO/HOZAvJFYiCpIYeB8JqhMa5lusKjvES+uhVmbRYzt1/9orD5jjJ6KaCM1muwNeR3FbrJ07LVlcUU50mvxWuWqoh5WlvCHRoDG9CsV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

Add support for MUX50U-based UPort G2 devices and Platform UARTs.
Add their product IDs and list the supported products by family.

Encode the number of ports and device family in each USB device ID
entry. Use the family to select the firmware image and version
offsets, and the method used to determine whether a firmware download
is needed.

UPort G2 devices use the shared UP firmware image
(moxa-up-mux50u.fw), while Platform UARTs use the shared PF firmware
image (moxa-pf-mux50u.fw). Platform UARTs are board-level UARTs
accessed through the USB bus.

The factory firmware on MUX50U-based devices reports its version in a
different format from the runtime firmware image, so version comparison
cannot reliably determine whether a firmware download is needed. Check
the system-register remap state instead to determine whether the device
is already running the runtime firmware from SRAM.

Keep the existing per-product firmware selection and version comparison
for UPort G1 devices.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 170 +++++++++++++++++++++++++++++++----
 1 file changed, 152 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 61d4c6e1a9ce..35123572ca4d 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -6,10 +6,20 @@
  *	Copyright (c) 2013 Andrew Lunn <andrew@lunn.ch>
  *
  *	Supports the following Moxa USB to serial converters:
- *	 2 ports : UPort 1250, UPort 1250I
- *	 4 ports : UPort 1410, UPort 1450, UPort 1450I
- *	 8 ports : UPort 1610-8, UPort 1650-8
- *	16 ports : UPort 1610-16, UPort 1650-16
+ *
+ *	UPort G1:
+ *		UPort 1250, UPort 1250I
+ *		UPort 1410, UPort 1450, UPort 1450I
+ *		UPort 1610-8, UPort 1650-8
+ *		UPort 1610-16, UPort 1650-16
+ *	UPort G2:
+ *		UPort 1250-G2, UPort 1250I-G2
+ *		UPort 1410-G2, UPort 1450-G2, UPort 1450I-G2
+ *		UPort 1610-8-G2, UPort 1650-8-G2
+ *		UPort 1650-8-G2-Hub, UPort 1650I-8-G2
+ *	Platform UART:
+ *		MU250U, MU450U, MU850U
+ *		MUx50U-3, MUx50U-5, MUx50U-6, MUx50U-7
  */
 
 #include <linux/kernel.h>
@@ -37,6 +47,24 @@
 #define MX_UPORT1610_16_PID	0x1613
 #define MX_UPORT1650_16_PID	0x1653
 
+#define MX_UPORT1250_G2_PID		0x1252
+#define MX_UPORT1250I_G2_PID		0x1253
+#define MX_UPORT1410_G2_PID		0x1411
+#define MX_UPORT1450_G2_PID		0x1452
+#define MX_UPORT1450I_G2_PID		0x1453
+#define MX_UPORT1610_8_G2_PID		0x1619
+#define MX_UPORT1650_8_G2_PID		0x1659
+#define MX_UPORT1650_8_G2_HUB_PID	0x165a
+#define MX_UPORT1650I_8_G2_PID		0x165b
+
+#define MX_MU250U_PID		0x0250
+#define MX_MU450U_PID		0x0450
+#define MX_MU850U_PID		0x0850
+#define MX_MUX50U_6_PID		0x7002
+#define MX_MUX50U_3_PID		0x7003
+#define MX_MUX50U_5_PID		0x7004
+#define MX_MUX50U_7_PID		0x7005
+
 /* Definitions for USB info */
 #define HEADER_SIZE		4
 #define EVENT_LENGTH		8
@@ -46,6 +74,13 @@
 #define MX_FW_VER_BYTE1_OFF		0x20
 #define MX_FW_VER_BYTE2_OFF		0x24
 #define MX_FW_VER_BYTE3_OFF		0x28
+#define MX_MUX50U_FW_VER_BYTE1_OFF	0x86
+#define MX_MUX50U_FW_VER_BYTE2_OFF	0x88
+#define MX_MUX50U_FW_VER_BYTE3_OFF	0x8a
+
+#define MX_SYS_REG_REMAP_OFF		0x20
+#define MX_PWR_REMAP_MASK		0x03
+#define MX_REMAP_TO_SRAM		0x02
 
 struct mxuport_fw_version {
 	u8 major;
@@ -60,6 +95,12 @@ static const u16 mxuport_fw_ver_offsets[] = {
 	MX_FW_VER_BYTE3_OFF,
 };
 
+static const u16 mxuport_mux50u_fw_ver_offsets[] = {
+	MX_MUX50U_FW_VER_BYTE1_OFF,
+	MX_MUX50U_FW_VER_BYTE2_OFF,
+	MX_MUX50U_FW_VER_BYTE3_OFF,
+};
+
 /* Definitions for USB vendor request */
 #define RQ_VENDOR_NONE			0x00
 #define RQ_VENDOR_SET_BAUD		0x01 /* Set baud rate */
@@ -96,6 +137,8 @@ static const u16 mxuport_fw_ver_offsets[] = {
 #define RQ_VENDOR_RESET_DEVICE		0x23 /* Try to reset the device */
 #define RQ_VENDOR_QUERY_FW_CONFIG	0x24
 
+#define RQ_VENDOR_GET_SYS_REG		0x34
+
 #define RQ_VENDOR_GET_VERSION		0x81 /* Get firmware version */
 #define RQ_VENDOR_GET_PAGE		0x82 /* Read flash page */
 #define RQ_VENDOR_GET_ROM_PROC		0x83 /* Get ROM process state */
@@ -170,21 +213,44 @@ struct mxuport_port {
 #define MX_PORTS_OFFSET			1
 #define MX_PORTS(n)			(((n) - MX_PORTS_OFFSET) & MX_PORTS_MASK)
 
-#define MX_DEVICE(pid, ports)					\
+#define MX_FAMILY_MASK			GENMASK(5, 4)
+#define MX_UPORT_G1			0
+#define MX_UPORT_G2			BIT(4)
+#define MX_PLATFORM_UART		BIT(5)
+#define MX_FAMILY(info)			((info) & MX_FAMILY_MASK)
+#define MX_DEVICE_INFO(ports, family)	(MX_PORTS(ports) | (family))
+
+#define MX_DEVICE(pid, ports, family)				\
 	{ USB_DEVICE(MX_USBSERIAL_VID, pid),			\
-	  .driver_info = MX_PORTS(ports) }
+	  .driver_info = MX_DEVICE_INFO(ports, family) }
 
 /* Table of devices that work with this driver */
 static const struct usb_device_id mxuport_idtable[] = {
-	MX_DEVICE(MX_UPORT1250_PID,	 2),
-	MX_DEVICE(MX_UPORT1250I_PID,	 2),
-	MX_DEVICE(MX_UPORT1410_PID,	 4),
-	MX_DEVICE(MX_UPORT1450_PID,	 4),
-	MX_DEVICE(MX_UPORT1450I_PID,	 4),
-	MX_DEVICE(MX_UPORT1610_8_PID,	 8),
-	MX_DEVICE(MX_UPORT1650_8_PID,	 8),
-	MX_DEVICE(MX_UPORT1610_16_PID,	16),
-	MX_DEVICE(MX_UPORT1650_16_PID,	16),
+	MX_DEVICE(MX_UPORT1250_PID,	     2, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1250I_PID,	     2, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1410_PID,	     4, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1450_PID,	     4, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1450I_PID,	     4, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1610_8_PID,	     8, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1650_8_PID,	     8, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1610_16_PID,	    16, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1650_16_PID,	    16, MX_UPORT_G1),
+	MX_DEVICE(MX_UPORT1250_G2_PID,	     2, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1250I_G2_PID,	     2, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1410_G2_PID,	     4, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1450_G2_PID,	     4, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1450I_G2_PID,	     4, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1610_8_G2_PID,     8, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1650_8_G2_PID,     8, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1650_8_G2_HUB_PID, 8, MX_UPORT_G2),
+	MX_DEVICE(MX_UPORT1650I_8_G2_PID,    8, MX_UPORT_G2),
+	MX_DEVICE(MX_MU250U_PID,	     2, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MU450U_PID,	     4, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MU850U_PID,	     8, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MUX50U_6_PID,	     6, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MUX50U_3_PID,	     3, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MUX50U_5_PID,	     5, MX_PLATFORM_UART),
+	MX_DEVICE(MX_MUX50U_7_PID,	     7, MX_PLATFORM_UART),
 	{}			/* Terminating entry */
 };
 
@@ -1000,6 +1066,56 @@ static int mxuport_parse_fw_version(const struct firmware *fw,
 	return 0;
 }
 
+static bool mxuport_is_mux50u_device(unsigned long features)
+{
+	switch (MX_FAMILY(features)) {
+	case MX_UPORT_G2:
+	case MX_PLATFORM_UART:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void mxuport_get_fw_name(unsigned long features, u16 productid,
+				char *buf, size_t size)
+{
+	switch (MX_FAMILY(features)) {
+	case MX_UPORT_G2:
+		strscpy(buf, "moxa/moxa-up-mux50u.fw", size);
+		break;
+	case MX_PLATFORM_UART:
+		strscpy(buf, "moxa/moxa-pf-mux50u.fw", size);
+		break;
+	default:
+		snprintf(buf, size, "moxa/moxa-%04x.fw", productid);
+		break;
+	}
+}
+
+static int mxuport_fw_running_from_sram(struct usb_serial *serial, bool *from_sram)
+{
+	int err;
+	u32 reg;
+	u8 *buf;
+
+	buf = kzalloc_objs(*buf, sizeof(reg));
+	if (!buf)
+		return -ENOMEM;
+
+	err = mxuport_recv_ctrl_urb(serial, RQ_VENDOR_GET_SYS_REG,
+				    MX_SYS_REG_REMAP_OFF, 0, buf, sizeof(reg));
+	if (err < 0)
+		goto out;
+
+	reg = get_unaligned_be32(buf);
+	*from_sram = (((reg >> 24) & MX_PWR_REMAP_MASK) == MX_REMAP_TO_SRAM);
+	err = 0;
+out:
+	kfree(buf);
+	return err;
+}
+
 /* Get the version of the firmware currently running. */
 static int mxuport_get_fw_version(struct usb_serial *serial,
 				  struct mxuport_fw_version *version)
@@ -1080,7 +1196,10 @@ static int mxuport_probe(struct usb_serial *serial,
 {
 	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
 	struct mxuport_fw_version version, local_ver;
+	unsigned long features = id->driver_info;
 	const struct firmware *fw_p = NULL;
+	const u16 *fw_version_offsets;
+	bool download_fw, from_sram;
 	char buf[32];
 	int err;
 
@@ -1098,7 +1217,12 @@ static int mxuport_probe(struct usb_serial *serial,
 	dev_dbg(&serial->interface->dev, "Device firmware version v%u.%u.%u\n",
 		version.major, version.minor, version.build);
 
-	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
+	if (mxuport_is_mux50u_device(features))
+		fw_version_offsets = mxuport_mux50u_fw_ver_offsets;
+	else
+		fw_version_offsets = mxuport_fw_ver_offsets;
+
+	mxuport_get_fw_name(features, productid, buf, sizeof(buf));
 
 	err = request_firmware(&fw_p, buf, &serial->interface->dev);
 	if (err) {
@@ -1108,7 +1232,7 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
-		err = mxuport_parse_fw_version(fw_p, mxuport_fw_ver_offsets, &local_ver);
+		err = mxuport_parse_fw_version(fw_p, fw_version_offsets, &local_ver);
 		if (err) {
 			dev_err(&serial->interface->dev,
 				"Firmware %s is too short\n", buf);
@@ -1119,7 +1243,17 @@ static int mxuport_probe(struct usb_serial *serial,
 			"Available firmware version v%u.%u.%u\n",
 			local_ver.major, local_ver.minor, local_ver.build);
 
-		if (local_ver.value > version.value) {
+		if (mxuport_is_mux50u_device(features)) {
+			err = mxuport_fw_running_from_sram(serial, &from_sram);
+			if (err)
+				goto out;
+
+			download_fw = !from_sram;
+		} else {
+			download_fw = local_ver.value > version.value;
+		}
+
+		if (download_fw) {
 			err = mxuport_download_fw(serial, fw_p);
 			if (err)
 				goto out;
-- 
2.53.0

