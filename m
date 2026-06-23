Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012003.outbound.protection.outlook.com [52.101.126.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4D3C8C68;
	Tue, 23 Jun 2026 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201850; cv=fail; b=Sd1KE2AXEtgPTtT95g+zxHXVZNNMYMH6BQVyYnDzn7FCtDk5b+5vDyZ7Q1iuxLPWfsBS3o9hA62UAQi261punvQoHaJAVWGjYHqhYeLaVm2QTeyuZmxCzNu+W2rZ+ipCpJ0IzVRDmIYaGRrkYmb9Bj/3qpsBWpF9fxPg8FD/k00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201850; c=relaxed/simple;
	bh=HH+LVQv3tQsFTPVcK8LUiQJeB7+zUwJ5RyVXRUXKh2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k/YH/DEhJwHQ6f1KHczA/4ctxpWgp4NnMkDpGoPcLCeoHu2l6103I1yXY2znqyobzZPvuOuj6XEKZNDfFuz3aKrxuGA5z37jjGBI/VfcC+E1RTh+scvkbfjVTshCkGfICuIyr0nis1Re7eJw8neOCJuJ2oh8Ox4jXBU6xUeM//A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=ElU4SNuR; arc=fail smtp.client-ip=52.101.126.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="ElU4SNuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tyudx0HPDgFpytzt6DF6927QZwePwwWpxiDlp0mZVQsqhJGI2dEFSfQzsnVrao6ZKA/0RhK26PASu9d7ZqoVLAEYB3OwBCgq8L+6R82mubyQ2ji24BewUTKKOrb98kGjuFDfcflCoL/JyUHF2xu1v8LlErL3CCvdP6IeRgQBwbNAFQ/XbSPJrI3zn1d5ly+NLfVcZZxieD81VxaDMSTIpi0HKsnf4mCPgfYgiNaf/m9QoYmIKU4s8LzieawsC/h4lp6zKrgkmUnOIUD+uv8e+VrlBXBsu58liks6+2mKD9PseCSiElOetUF72NtWs1nfK8fgf/RpWpSNgkEBPXZvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEXbpMGy6mF41Eq4UbnEjdIcyuZC1pnp6og/UU/BeF8=;
 b=HBz297BdTCV3Chaci5jwimARm8AKi4jOHfKnrLqW+dOVb7BNVoflpmPW60P3s9PMphtBIYeV+P/ytu5tUhqM6UWsoSKp4pJvman1TrnbkYTzwMfQSvv5JrspaxTDrJOJ8U3292dAtxVNIGPGwzfGilrejiLR5zbfhEojHr+to71o70VDmM/rNOO7Nvb3wFm9OxFTgeXtGRAZLjXFvEi/zki9hvPbxky9ZFO6/Q257+1ZrjYIOjgKmA5wIZTn5qxTxx3pB3ysIDNhnW62oG6WXAFOxWtCCaEYpG7YQ3kL7j5USVRJ9rh1x9VGA96DgVb3KAbu/zOq7gwSeujgFsowxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEXbpMGy6mF41Eq4UbnEjdIcyuZC1pnp6og/UU/BeF8=;
 b=ElU4SNuRaKpMR/TgKLK/zlvni7ERND5NbQ9+Gdo3q+JsCRgrxXHDT0TMWYy+t3HAjY2RHQOm/Hga5WnTHwemFjkHbGEgYcG4kj/1kFqL2IiH9W+JIIDZcUTpDk0f/nAYTpp9b1JMjF7WZt/iUhg5wJ6F6E6piVlPt9RCUXZPUOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5306.apcprd01.prod.exchangelabs.com
 (2603:1096:400:359::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:04:05 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:04:05 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v2 1/4] USB: serial: mxuport: clean up firmware version handling
Date: Tue, 23 Jun 2026 16:01:36 +0800
Message-ID: <20260623080138.166398-3-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: a7407c19-f67b-469e-e4a0-08ded0fdfe59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jtNNZmqvsJCac3Q0YJnL1+the6+yHXvv2QwT5MEgpJqLqF4QCY+R8S0VFTcrvG1T6maxWzuWvHDy1mjlSNG2JhGc7DWVyJVc7GBTJ1kAlsRUWSBVlvkET71Bdxyy4w/ezT6CuOka4q8MAn+sSDYvtAS8jYq1A2uqd0gy2oT8DYVfXIExtdzMq1HkTXv9k415wmwSX4JBE/IAcenSHaLU3yE3ZqyF8Il/btZnSZ5uY2NB+cM5HOqf92JavxcaPjEIttA+87tyf/sxnF6gQbC8q2UFQ31yjFvfjhISxEBllOIdxmcbbgFMSmlVacN5PBzsd3eObUJmJbYb/RgQMj1eTgt9vGPdPUpS0PJCTkW/dTGSPMpKG0KTRJtuz5I8v8fnjDQloWK4XtA13F3aQr7ylyRjMhm0c8Uj2DCFAUhDpb95LeOSekJYrTr3rKZ74bT1ujLmpi2dpAeycPrhQPUKva6+hhCyu1PK2K8RGmmhFtYxD7cABT1zusOBDsqnLh9sXK41hFaFTR4B0PRl4e7PruAFPgUSdLKFKDhf2yS2XEA3/d/meJqm0swpF6Tav9Cj1yzN5nI8Qt0hjQoMm0ciU5IYkrmjtwVyeKeMLUeWhXjQXt6HRN2XZMxF1206HuWpn2Q3b4489/yTdzrWIlwFrYVeJw4QctG10sWCLV9qJAj8w0ef3fiDjhgVXMJzsLnxYKkaNyt91vmsqlgmCtolCtDvIheuDNAPyjTl5PhdiKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KwttL9eThmbNyt19PDZ/lgR2SoMMB0RFwQVK73Nk4aiFOmCEoC1CqmWVdYHe?=
 =?us-ascii?Q?T3IpqxszvOHNElUCGTkRdqO97xBLIzbZl4XHq676w69pt8xbtDKj1SS/Lu0V?=
 =?us-ascii?Q?bLjh2UY7AIPNmK20C1dC0HYr/H0pcuYw8brPBZFDue6U+S1/qAORjbcGSQ/Q?=
 =?us-ascii?Q?3eFC8pEHyi2pOQrqq1/LGWxRQcac5nnVcJV6leQmWFFROUq/7n+G0Hc3Nv/n?=
 =?us-ascii?Q?OffHZxeBzuEW2FlQhMfn3cadyjIfUu2g9VSu1qD32UwEgqJvvkgfAnHLK3up?=
 =?us-ascii?Q?TK0E4XGQcLLXW1OywjDkVp8A3fPHGW5knIfgjq7OxFZDzW4Np75UGk3mFwCc?=
 =?us-ascii?Q?rm0jgc8z5zxE2RIUNFyRVWnropQFfJSFPG0vL/btvnvsRCYBVYtnWc71CALt?=
 =?us-ascii?Q?jLt5whbMOvau6CtTHusQQLZa41ESKTEpCxkZbNBW3cjblz88ymWiy+ew4YzY?=
 =?us-ascii?Q?uUo2v4lqO8pG39c3zKj1RtskpcLzmWNqwiKrCVCOlLjYkgql1a4hdRGlZ9dx?=
 =?us-ascii?Q?BjWjK6iTlowBUV+rsMoh6y9rQ72NVuML17C7qOWRZPpKbDu2AbERVL/WEQg7?=
 =?us-ascii?Q?odWOGB8HwHtfUxutm7DX0TVIxUF+fD6kOzq4F+hjB1/rI9BrtKgD5tdXwEbq?=
 =?us-ascii?Q?mP8MKgUoQ+zy1mAWpazVtX4kbCzQr2AfxCW94GJDWTfPJhI9ygYPFfTijIuO?=
 =?us-ascii?Q?8r5mmHU9gnPypzMFLN+sX/zxgfUTccvzDbzmA6B8KeOPS9zL+ptPJCIhyLWm?=
 =?us-ascii?Q?M/nCPxJYCXuF+ZNu2DfFmGx2GOsDojvkL/lZrd8ZhKk0+B5WzhgJXxSA/i4A?=
 =?us-ascii?Q?SxEbjddHDkqTMnXQJW/zZcyFCVKK8cXMr4pL9yUCWrA1tImuNN3nQXLOcxVI?=
 =?us-ascii?Q?Il9aD1o6PaXPrsxFWoV2/eqtWQyzNI+ghgLF7nyjmskUaGDQydMtNa1d/rkN?=
 =?us-ascii?Q?WQBEIbbqqFtrYhxLFmHUOKBmpkDforLjZvYnhkn1FfmESVx71EqPWcYi7Epm?=
 =?us-ascii?Q?Ej1NzoS6NwPt/IQYJXxvp1RYRG8kTfl11gJbOXmwJuXy5apUMAFSAFz0PS0H?=
 =?us-ascii?Q?E8qX1+HGeKk48iyETVZvdzLeps/PK2+ywoN/lQ4aH3GqCrf2DEI0SbwSwPWE?=
 =?us-ascii?Q?eHUvrLzrNGx3GdErUMy749jScx966RJ8m3TuS65sQsjH0iw+yoDT12NyI4Eh?=
 =?us-ascii?Q?HZdAk1mLGu/ZSkWK1mlve7r/QGPI8wSk6ptzhMqWa5j8wBwDtY/4VZOlyAY8?=
 =?us-ascii?Q?vxhoABO5IDG0dvnJCHfc4VgtBW+Ly2+GmxaJHR5clLyYYbyqS8ffeJWw5aWI?=
 =?us-ascii?Q?xfEUJVRpN8bNGrReSMRcGMNXVjTt1snrSdvNxtwf1Vlur9FkJGGiT3Cas7fU?=
 =?us-ascii?Q?GvH3+2XULHFRJNrABYIf+1HQdS8O3vFwk3H3yyBqDzr1fhEV8sZbYwNT1tdt?=
 =?us-ascii?Q?F+9kJSUyX2vZv1AhyiNB/VfQQh2rf1f2T1uq+jvsckHyveZGoN/8OWxbiyeO?=
 =?us-ascii?Q?f5lb1TBRbC9U69s2EPm0B2e7tPKUf8QuNL7I3f77tMr6pSZQ8/xj0HemCsUS?=
 =?us-ascii?Q?SyOt0q50YSyeRnfP3Gjm/qoOp9JnZuEfMpJKaSo3B/cekMRSutmSlffS+xYY?=
 =?us-ascii?Q?GFjvEz0VGoZU8O7uCDUg9QLGM3zRETIJvh2N5naTy1E97hqx1ldMzgH1/BIF?=
 =?us-ascii?Q?KsmNJasVhOCwniEPEEJxMZtvfihVdxlA6iz3jKdmmPke/IdzDV7MmpND1cPB?=
 =?us-ascii?Q?dbcVG8b8LagtelHj+qA6S8w4I+SHmdo=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7407c19-f67b-469e-e4a0-08ded0fdfe59
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:04:04.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdLgvQGJqJWKlGJxbUToBSPzRqGNtcRJbOnDKPcIKkkmiWEcgluX17za+YizExcqL7xmGFM6b6MN6zZURPfnuMi+ACE9p6mwJb7kn108Vy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5306

Add a small helper for parsing firmware versions and use it for the
bundled firmware image. This avoids open-coded firmware image offsets
in probe() and validates the image size before reading the version
bytes.

Keep the existing version comparison policy unchanged, but store the
version components explicitly so that the version can be printed
without unpacking a raw integer.

Print the firmware version fields in decimal, as these fields represent
readable version components rather than hexadecimal values.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 81 +++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index e3c5a1b97542..5a9dd251ceff 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -43,9 +43,22 @@
 #define DOWN_BLOCK_SIZE		64
 
 /* Definitions for firmware info */
-#define VER_ADDR_1		0x20
-#define VER_ADDR_2		0x24
-#define VER_ADDR_3		0x28
+#define MX_FW_VER_BYTE1_OFF		0x20
+#define MX_FW_VER_BYTE2_OFF		0x24
+#define MX_FW_VER_BYTE3_OFF		0x28
+
+struct mxuport_fw_version {
+	u8 major;
+	u8 minor;
+	u8 build;
+	u32 value;
+};
+
+static const u16 mxuport_fw_ver_offsets[] = {
+	MX_FW_VER_BYTE1_OFF,
+	MX_FW_VER_BYTE2_OFF,
+	MX_FW_VER_BYTE3_OFF,
+};
 
 /* Definitions for USB vendor request */
 #define RQ_VENDOR_NONE			0x00
@@ -82,7 +95,6 @@
 
 #define RQ_VENDOR_RESET_DEVICE		0x23 /* Try to reset the device */
 #define RQ_VENDOR_QUERY_FW_CONFIG	0x24
-
 #define RQ_VENDOR_GET_VERSION		0x81 /* Get firmware version */
 #define RQ_VENDOR_GET_PAGE		0x82 /* Read flash page */
 #define RQ_VENDOR_GET_ROM_PROC		0x83 /* Get ROM process state */
@@ -970,8 +982,32 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
 	return num_ports;
 }
 
+static void mxuport_set_fw_version(struct mxuport_fw_version *version,
+				   u8 major, u8 minor, u8 build)
+{
+	version->major = major;
+	version->minor = minor;
+	version->build = build;
+	version->value = (major << 16) | (minor << 8) | build;
+}
+
+static int mxuport_parse_fw_version(const struct firmware *fw,
+				    const u16 *offsets,
+				    struct mxuport_fw_version *version)
+{
+	if (fw->size <= offsets[0] || fw->size <= offsets[1] ||
+	    fw->size <= offsets[2])
+		return -EINVAL;
+
+	mxuport_set_fw_version(version, fw->data[offsets[0]],
+			       fw->data[offsets[1]], fw->data[offsets[2]]);
+
+	return 0;
+}
+
 /* Get the version of the firmware currently running. */
-static int mxuport_get_fw_version(struct usb_serial *serial, u32 *version)
+static int mxuport_get_fw_version(struct usb_serial *serial,
+				  struct mxuport_fw_version *version)
 {
 	u8 *ver_buf;
 	int err;
@@ -988,7 +1024,7 @@ static int mxuport_get_fw_version(struct usb_serial *serial, u32 *version)
 		goto out;
 	}
 
-	*version = (ver_buf[0] << 16) | (ver_buf[1] << 8) | ver_buf[2];
+	mxuport_set_fw_version(version, ver_buf[0], ver_buf[1], ver_buf[2]);
 	err = 0;
 out:
 	kfree(ver_buf);
@@ -1049,8 +1085,7 @@ static int mxuport_probe(struct usb_serial *serial,
 {
 	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
 	const struct firmware *fw_p = NULL;
-	u32 version;
-	int local_ver;
+	struct mxuport_fw_version version, local_ver;
 	char buf[32];
 	int err;
 
@@ -1065,10 +1100,8 @@ static int mxuport_probe(struct usb_serial *serial,
 	if (err < 0)
 		return err;
 
-	dev_dbg(&serial->interface->dev, "Device firmware version v%x.%x.%x\n",
-		(version & 0xff0000) >> 16,
-		(version & 0xff00) >> 8,
-		(version & 0xff));
+	dev_dbg(&serial->interface->dev, "Device firmware version v%u.%u.%u\n",
+		version.major, version.minor, version.build);
 
 	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
 
@@ -1080,28 +1113,28 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
-		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
-			     (fw_p->data[VER_ADDR_2] << 8) |
-			     fw_p->data[VER_ADDR_3]);
+		err = mxuport_parse_fw_version(fw_p, mxuport_fw_ver_offsets,
+					       &local_ver);
+		if (err)
+			goto out;
+
 		dev_dbg(&serial->interface->dev,
-			"Available firmware version v%x.%x.%x\n",
-			fw_p->data[VER_ADDR_1], fw_p->data[VER_ADDR_2],
-			fw_p->data[VER_ADDR_3]);
-		if (local_ver > version) {
+			"Available firmware version v%u.%u.%u\n",
+			local_ver.major, local_ver.minor, local_ver.build);
+
+		if (local_ver.value > version.value) {
 			err = mxuport_download_fw(serial, fw_p);
 			if (err)
 				goto out;
-			err  = mxuport_get_fw_version(serial, &version);
+			err = mxuport_get_fw_version(serial, &version);
 			if (err < 0)
 				goto out;
 		}
 	}
 
 	dev_info(&serial->interface->dev,
-		 "Using device firmware version v%x.%x.%x\n",
-		 (version & 0xff0000) >> 16,
-		 (version & 0xff00) >> 8,
-		 (version & 0xff));
+		 "Using device firmware version v%u.%u.%u\n",
+		 version.major, version.minor, version.build);
 
 	/*
 	 * Contains the features of this hardware. Store away for
-- 
2.43.0

