Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012026.outbound.protection.outlook.com [40.107.75.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92B3CA49D;
	Tue, 23 Jun 2026 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201855; cv=fail; b=GHrKY5AJgblmmiOOGcsAXy8k/JIzWELu05aykVDAx66aIcPmkao/7YlhGEOt2JHNSqDz1kG/EPBBw6kPfXJBEcURu79IruyVZJAdxcsVsv0wbXLRA0IJ8+Nfmfqd0s0oOjlorOHK2W/vs+usPJFlK9BLpXqJFwtDRN8PJQtH9TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201855; c=relaxed/simple;
	bh=zWrXI2Cydi63Q7oFI+M0nK4cB0CdHTeeWEr/B78vjoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pneB+9pr7If+DmA7v/SoceRu4YeUpzkyJhBiOW9NdMAiC5hxgn6luy33tz0IYsmwL1OLFg9PDHQpOCkyAwDQR+3+zeN+c1UV0xIIJZQfDvEHOTEoIIGeQmOpZqZnHvH9CPjMEvKkYwZrmC/D3FIy8oL/J3siNQAqUP9qr6jSttI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=iHpheob/; arc=fail smtp.client-ip=40.107.75.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="iHpheob/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrgAYjzp6u1/mRkb3W+BJNoXOD7Czf+Xc3aoofBNPkSt9mXj8E44LcbpSi58oQtAQ6JeMv4XX91pjEQyG/XlJzhvyS3VDWqVHaCCao5nmU64uq3XwISotjE9r2jMcVkcKymBs23CqPgfiON+c1Ns1dcH/93qP48CEb5CzyNM2xRo2oxyvYH8TbOFLUQcU+YzfbC5lxXFX3BkJ7ZJKzu/jtnjpggnPgbpZLWKMRuBJYhke77iKFyR+UKstofQFRGS+F6rNNWnV4edVhfLarU0mGusU/lJv5TWTKj6F8bxdHzRc9DiytCSjXKqZ38v7rtHqOItHXDRSO8ccujBJmGW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+hEgetPsFPAajkFF3Yt7kqRSVAgEvigVPL9fHYxukw=;
 b=lzYgCiVHiUPUiRMgvC4K8Qyj3WTvXDdmFy307wIKwcCQujiqnWL0x+u/t1ZURAmPmroJ2fuAdvjiZoyC8F7Wq38Ip9r8xzWH2v+jsX8lZaAl62om1n4B0E0ctVzU48sfhOrPcylFLCLcEHs4EfR4EwYYxgAbPsZdAOV4d0kwCKhL3r53S17FgolSrkq8qfW/LiSA+YgJia5yRAkAXTvKaEVUizVF6+tGaDKttO/qwE+20AFjF9Dk/5+rYkaiaBgt428pB7O6k8ArYf9UNyzamnaMMI3EOytXeSmBChTsBWkJNRtgV4Ooa6UfpA5glA2fNv4VyzQCtLZ4dwgmVPfDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+hEgetPsFPAajkFF3Yt7kqRSVAgEvigVPL9fHYxukw=;
 b=iHpheob/vTW9nzp7EqE047xTRWTyjFUH94XJ3NfdNv4YAfdNxIZgtwc9BryBJIVJuCyDSakPlTthdKBiFDUdhLtCJcy288sIHG/mcXBUB4NJzG/LRWTlrW0BlLteNst+YjRtlxmYdpM2rJT6fYy5diuNrWhHpWTLyuwKls6XNME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5306.apcprd01.prod.exchangelabs.com
 (2603:1096:400:359::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:04:11 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:04:11 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v2 2/4] USB: serial: mxuport: add MUX50U-based device support
Date: Tue, 23 Jun 2026 16:01:37 +0800
Message-ID: <20260623080138.166398-4-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYUPR01MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac3bcbc-01d2-4c90-6025-08ded0fe0231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AbH5zUILNiCmCQrwathYehS803XIw6MP12W4u136Ad1+TxgEtUoZ1N+NGP290uvtZKQAXw0ReGjK6MFf4baz2sxjv4PaM5QHsfkZfuys5U1UBdp2BBCX+8yiSVRECp3H4CJUyHYPij+iQqdK63kuSjfIMb5VTE7vx+k8EtL8da9C11Tbb2vV6O8SPwqgvthimIiooeO1q34cM/rKSpbFbNgtdAkTZeUgTnHATk4Eh6U6ISgrOjmuw3d4IAbYzazJbYJKOPQcYqvwg9GigwTW/a0tYSCnn0nWk39PIvp7tIy/NrLEGmEtLdEViwOORYix9uvFfK6sCC++p0HCHjtL9I/zJXn50rpL0hn9IP26av/Q/izKfadDID/GQ5C0NUacC6cd5a5I6BlbPMDGlhxyok4e33FhjOireEWHr0jS3DY5LnFHQF5IfpMOiGotasyZW2rHr3Mxu8canc/0BJO2fQnVnXvF0cDiYtfaEHGkGaEmCnlYOd3QWXBKmhtXV6KlTjZmwESht0cpH5NMEQfxA8fHCclvMwkcnLd9UYrFdv+AV808N1XNo50hQZYoY8zq3pEr7RrHcOYKZtrfbpdI7awDpViSnpoNZXRLMg2b6wiMVKjnRYq2qWDpujLkCMp7cLK1nxDWFd5MEPS+tpOpAUJzVeO4r0SoZ+C+VnMPtnfd0sYBSXqb5RMFq6ICJlcOswhWv78bOAsK43N4SijwpMxPOunzYvR69LG4yixfvQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gwXKu+Fbd1Bej9ydYMe+YGxG13FihIdmu1m2HehtWlDL5pmUMwS/nMBavfNL?=
 =?us-ascii?Q?JDLaB3bt0KUwE8SpIKiH4XOACQoYKObcJl1j9zVbYlx6syPwau3U1f2uXUY8?=
 =?us-ascii?Q?L9OVd/U+5ttHld3/yUNNAE69hV4bdjzcNe1d7DJPpz3s9tO07YRw1uMOarbA?=
 =?us-ascii?Q?tEc8UVckA0gpSYtSe5fKbOeNYlK2LAgKIAnLjug56SpbdR7BQOwLHPpYHzUU?=
 =?us-ascii?Q?ZM1jRvoM7MQ7mfsX+ePHAqbfDJeFOFjExE6JfpfNDMl03rkTzZiPLowaji+U?=
 =?us-ascii?Q?0TKziAUI1c6DxDukg859aLEJ2Y73YOVVW+wR57It2C5BCqwd/Nqx2NVMcI+6?=
 =?us-ascii?Q?UJ/I6GdXyuCT6WfCLdtGs6GdQK0zTJI/E8Ti4TTVtZBtyKTuXknzDdfQXJZX?=
 =?us-ascii?Q?4tGg1JBJ/Spm9g34nZxr2rQ4+uMXKljT+kMzSg0yfgwNDfuIV2SYck25XnKn?=
 =?us-ascii?Q?M8gxssWXwCKZ1/yCxoviLEBAL1W323nuaSfZpvHwVmmpzGm3qBY4mp9DGeL6?=
 =?us-ascii?Q?UFrQzXJ35GUc3r3sypciAWOXPTDFk88eTnPAs2pkUwv0RiTL1HhNDiETe5/g?=
 =?us-ascii?Q?zMuccuUiSArj7pSQfQoHsHUEJX0oKnvLyLSWJS1i38ekObSKbvPSTQeyVZQX?=
 =?us-ascii?Q?YCkuwMhYMp9HEPhzz810Ciz9DBjsyprrzeXl5c9rYLYSJ5PIVpFflk/brkwH?=
 =?us-ascii?Q?f0uON73vskQ9PY+mlJgtWUcehyS1jzezQl+uEHTbHETllKA//joPGtHVrOUC?=
 =?us-ascii?Q?9SXVu8cvZguiYIsaObfoy5R4NDv8tN6DlQglaB8beYOLOGRmq91TktkJWQpS?=
 =?us-ascii?Q?ScPcr5GJXnt39FJybSTa9JLzpBzXZnGUWNMNmngyxM7D8BxWEjen1c1CN9+e?=
 =?us-ascii?Q?+uW41kKJ1htWW9Av2ZmiieK6xq1Zm1gqhjxVMmSuJPSWxAUtJZtqNlw+dCjK?=
 =?us-ascii?Q?W4Y8t1OYAuAuRyomrf5DSlz9hquf/FMTCG/aAPi1vos7ovITXV6sCb9gG05g?=
 =?us-ascii?Q?JHqz4FH6xp83RfogbT9qM/+0NBEljvv77RxqD+Jhp/tVP+Ze0mJiPx6Nq6JI?=
 =?us-ascii?Q?MvTcDpN6aLasRX3iLZCILMpB3jeHFp4gMnsMwsedY4Xxtu7X38S5o4MJQyLq?=
 =?us-ascii?Q?AkuOtuvvdDHeBdXy5AtXvBtnxq5GthGLhdOO8CQdO8zCSuRvTXvNmIbRkTjd?=
 =?us-ascii?Q?U0Hyob8q0OACJNlzu4SUekrvO3YCFBmcUHp1lErL3rT7M/MHBhaC9tB/lcaj?=
 =?us-ascii?Q?+fOmzBc4Z44gUqz+uKKy2RE4L0M/GsBCiUSG6IYbrJ/cH964vBRNuEaFeqxK?=
 =?us-ascii?Q?mZAiChaifh6OaevUfWv6zL7F7aJWCcRJquUyNsF2sIFGUxkZlc96/6KjXHjV?=
 =?us-ascii?Q?lwZ+NGUXkRA/5TrBgfbPnPSOf0psDqGQ2ZX3rVtx74sDfP84McBP+SYl5Xf1?=
 =?us-ascii?Q?7Z6Yx0azYH6Bh3yWlITEv2gMYgo16iiXLHWc7syP+nhmC+8BLvJVAg6qNZgU?=
 =?us-ascii?Q?FNfTLv4HLKD2PVQwLmKvKcvX49iPR9CG6XleMxL0yD8uSLlWFZDXosgbOXwT?=
 =?us-ascii?Q?2qShTWsAtzGD9e7KNtfTv6vn+E/MNBAn1rQlM1yCIUHfRQq6eeUpHpxcwZgO?=
 =?us-ascii?Q?bjSt8RWrPHdR1dIKWoOrVdVHXkMr7O2G3ZTOXwPnx6KMekPO0wVu3/mSGAYd?=
 =?us-ascii?Q?EdIQolrHRQ/vY3tMOCJmi8QmlYXR9iT/0XE+RSAamoRerZmKqsdMYFrG2Z7J?=
 =?us-ascii?Q?7zzbQ/rQKti0+vKVRML0MQHAeKLH3nM=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac3bcbc-01d2-4c90-6025-08ded0fe0231
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:04:11.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OItbXPlV3uFP8zZG8yR4/mxWJus/fboktcfsrdcbPGAf5VIpQqtbh7nq9hjg9VWkPKswg0iMqzImn5Vr8K6JTc19tvK6PabljhU85qGU3v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5306

Add support for MUX50U-based UPort G2 devices and Platform UARTs.

Encode the firmware family in the USB device id table so that the table
remains the single source for both the number of ports and the firmware
handling policy.

The MUX50U-based devices use two shared firmware images: UPort G2
devices use the UP firmware image (moxa-up-mux50u.fw), while Platform
UARTs use the PF firmware image (moxa-pf-mux50u.fw). Platform UARTs are
board-level UARTs accessed through the USB bus.

For MUX50U-based devices, the factory firmware reports versions in a
different format from the bundled runtime firmware image, so version
comparison cannot reliably determine whether a firmware download is
needed. The system-register remap state is used instead to check whether
the device has already booted the runtime firmware from SRAM.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 174 ++++++++++++++++++++++++++++++++---
 1 file changed, 162 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 5a9dd251ceff..067c8d9752e0 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -7,8 +7,11 @@
  *
  *	Supports the following Moxa USB to serial converters:
  *	 2 ports : UPort 1250, UPort 1250I
+ *		   UPort 1250 G2, UPort 1250I G2
  *	 4 ports : UPort 1410, UPort 1450, UPort 1450I
+ *		   UPort 1410 G2, UPort 1450 G2, UPort 1450I G2
  *	 8 ports : UPort 1610-8, UPort 1650-8
+ *		   UPort 1610-8 G2, UPort 1650-8 G2
  *	16 ports : UPort 1610-16, UPort 1650-16
  */
 
@@ -37,6 +40,24 @@
 #define MX_UPORT1613_PID	0x1613
 #define MX_UPORT1653_PID	0x1653
 
+#define MX_UPORT1252_PID	0x1252
+#define MX_UPORT1253_PID	0x1253
+#define MX_UPORT1411_PID	0x1411
+#define MX_UPORT1452_PID	0x1452
+#define MX_UPORT1453_PID	0x1453
+#define MX_UPORT1619_PID	0x1619
+#define MX_UPORT1659_PID	0x1659
+#define MX_UPORT165A_PID	0x165a
+#define MX_UPORT165B_PID	0x165b
+
+#define MX_MU250U_PID		0x0250
+#define MX_MU450U_PID		0x0450
+#define MX_MU850U_PID		0x0850
+#define MX_MU850U_6PORT_PID	0x7002
+#define MX_MUX50U_3PORT_PID	0x7003
+#define MX_MU850U_5PORT_PID	0x7004
+#define MX_MU850U_7PORT_PID	0x7005
+
 /* Definitions for USB info */
 #define HEADER_SIZE		4
 #define EVENT_LENGTH		8
@@ -46,6 +67,13 @@
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
@@ -60,6 +88,12 @@ static const u16 mxuport_fw_ver_offsets[] = {
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
@@ -95,6 +129,7 @@ static const u16 mxuport_fw_ver_offsets[] = {
 
 #define RQ_VENDOR_RESET_DEVICE		0x23 /* Try to reset the device */
 #define RQ_VENDOR_QUERY_FW_CONFIG	0x24
+#define RQ_VENDOR_GET_SYS_REG		0x34
 #define RQ_VENDOR_GET_VERSION		0x81 /* Get firmware version */
 #define RQ_VENDOR_GET_PAGE		0x82 /* Read flash page */
 #define RQ_VENDOR_GET_ROM_PROC		0x83 /* Get ROM process state */
@@ -169,26 +204,65 @@ struct mxuport_port {
 #define MX_PORTS_OFFSET			1
 #define MX_PORTS(n)			(((n) - MX_PORTS_OFFSET) & MX_PORTS_MASK)
 
+#define MX_FW_FAMILY_MASK		GENMASK(5, 4)
+#define MX_FW_UPORT_G1			(0 << 4)
+#define MX_FW_UPORT_G2			(1 << 4)
+#define MX_FW_PLATFORM_UART		(2 << 4)
+#define MX_FW_FAMILY(info)		((info) & MX_FW_FAMILY_MASK)
+#define MX_DEVICE_INFO(ports, family)	(MX_PORTS(ports) | (family))
+
 /* Table of devices that work with this driver */
 static const struct usb_device_id mxuport_idtable[] = {
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
-	  .driver_info = MX_PORTS(2) },
+	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
-	  .driver_info = MX_PORTS(2) },
+	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
-	  .driver_info = MX_PORTS(4) },
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
-	  .driver_info = MX_PORTS(4) },
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
-	  .driver_info = MX_PORTS(4) },
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
-	  .driver_info = MX_PORTS(8) },
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
-	  .driver_info = MX_PORTS(8) },
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
-	  .driver_info = MX_PORTS(16) },
+	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
-	  .driver_info = MX_PORTS(16) },
+	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1252_PID),
+	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1253_PID),
+	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1411_PID),
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1452_PID),
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1453_PID),
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1619_PID),
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1659_PID),
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165A_PID),
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165B_PID),
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU250U_PID),
+	  .driver_info = MX_DEVICE_INFO(2, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU450U_PID),
+	  .driver_info = MX_DEVICE_INFO(4, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_PID),
+	  .driver_info = MX_DEVICE_INFO(8, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_6PORT_PID),
+	  .driver_info = MX_DEVICE_INFO(6, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MUX50U_3PORT_PID),
+	  .driver_info = MX_DEVICE_INFO(3, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_5PORT_PID),
+	  .driver_info = MX_DEVICE_INFO(5, MX_FW_PLATFORM_UART) },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_7PORT_PID),
+	  .driver_info = MX_DEVICE_INFO(7, MX_FW_PLATFORM_UART) },
 	{}			/* Terminating entry */
 };
 
@@ -1005,6 +1079,68 @@ static int mxuport_parse_fw_version(const struct firmware *fw,
 	return 0;
 }
 
+static const u16 *mxuport_fw_version_offsets(unsigned long features)
+{
+	switch (MX_FW_FAMILY(features)) {
+	case MX_FW_UPORT_G2:
+	case MX_FW_PLATFORM_UART:
+		return mxuport_mux50u_fw_ver_offsets;
+	default:
+		return mxuport_fw_ver_offsets;
+	}
+}
+
+static void mxuport_get_fw_name(unsigned long features, u16 productid,
+				char *buf, size_t size)
+{
+	switch (MX_FW_FAMILY(features)) {
+	case MX_FW_UPORT_G2:
+		strscpy(buf, "moxa/moxa-up-mux50u.fw", size);
+		break;
+	case MX_FW_PLATFORM_UART:
+		strscpy(buf, "moxa/moxa-pf-mux50u.fw", size);
+		break;
+	default:
+		snprintf(buf, size, "moxa/moxa-%04x.fw", productid);
+		break;
+	}
+}
+
+static bool mxuport_is_mux50u_device(unsigned long features)
+{
+	switch (MX_FW_FAMILY(features)) {
+	case MX_FW_UPORT_G2:
+	case MX_FW_PLATFORM_UART:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int mxuport_fw_running_from_sram(struct usb_serial *serial,
+					bool *from_sram)
+{
+	u8 *buf;
+	u32 reg;
+	int err;
+
+	buf = kzalloc(4, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	err = mxuport_recv_ctrl_urb(serial, RQ_VENDOR_GET_SYS_REG,
+				    MX_SYS_REG_REMAP_OFF, 0, buf, 4);
+	if (err != 4)
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
@@ -1083,9 +1219,12 @@ static int mxuport_download_fw(struct usb_serial *serial,
 static int mxuport_probe(struct usb_serial *serial,
 			 const struct usb_device_id *id)
 {
+	unsigned long features = id->driver_info;
+	const u16 *fw_version_offsets;
 	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
 	const struct firmware *fw_p = NULL;
 	struct mxuport_fw_version version, local_ver;
+	bool download_fw, from_sram;
 	char buf[32];
 	int err;
 
@@ -1103,7 +1242,8 @@ static int mxuport_probe(struct usb_serial *serial,
 	dev_dbg(&serial->interface->dev, "Device firmware version v%u.%u.%u\n",
 		version.major, version.minor, version.build);
 
-	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
+	fw_version_offsets = mxuport_fw_version_offsets(features);
+	mxuport_get_fw_name(features, productid, buf, sizeof(buf));
 
 	err = request_firmware(&fw_p, buf, &serial->interface->dev);
 	if (err) {
@@ -1113,7 +1253,7 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
-		err = mxuport_parse_fw_version(fw_p, mxuport_fw_ver_offsets,
+		err = mxuport_parse_fw_version(fw_p, fw_version_offsets,
 					       &local_ver);
 		if (err)
 			goto out;
@@ -1122,7 +1262,17 @@ static int mxuport_probe(struct usb_serial *serial,
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
2.43.0

