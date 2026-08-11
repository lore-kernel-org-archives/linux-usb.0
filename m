Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013020.outbound.protection.outlook.com [40.107.44.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B8386C3D;
	Tue, 11 Aug 2026 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428367; cv=fail; b=VdgUUTO5FwxflP/7TJ05W1dGDkwvPgzNTXnV25f6XTVhcVaKoWh4qwz7xfVIdOR8v3yMIM53rQIotP4R7SvUv+/PiCmpoM4aGj9rP0MkaH8q4yNd2M/pJorWTKQsK/zGhqW7kZkpCLus23IY7xkQYvqX5wQrueLnf7DmD2Bt5nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428367; c=relaxed/simple;
	bh=1AHSHfOBIVwDmpP0WCtWg0Hw3BP04K8d92iF5J2w7wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=the0FhO0MwG7Hlt2BO7ew3CNX8/yy6bJqItqntvz7bd8qUXRb4IhfxiA06igKfyRa6u6SwBPeeQGM9pHOc3SnlJYHE8iBhQQAb4N0eDUnfVeAuwZwxIAJGUCWNoZGYp6uBoMe8wit3HheehZZK4E6pyV/fBPllAqWNm9BE7VTM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=QitRcE2Q; arc=fail smtp.client-ip=40.107.44.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="QitRcE2Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDnl81AzgWlpSdn7mszIXOmLMro+Rz30XfRddIxN6qYavIq91B+YZY0X5huTKbcd7fqqWA0it0rEB7zI56PGFdKzH2UhiIe8o5LrNAVw2+rAB9VLhqgCCEhZziI07Bc9lR4WrWMCwVwjtBzk79AeREkc/Y9bw/aP8Mxn8bAtJho3bv8hPX4i2tPtXh0b+6tgqoTKEigWZvgjr873DhdZTWi+mm8b7sn2kt14xI3YAsYS6GNtYA/rY6KJl7RyAc6VNWfPLKSC16uHJW77rV+v0n2DK4zGngA/biSR5GlAkN8mKC63wUcocS7hrj6FgGTrX6Q+ALCqcpVqQNz6m1BZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlNtxF99FYcqlEX41oLFrtnLsX9+S3tbKnxMEY8Lyhg=;
 b=cSLBIQbQOvfGmoCUg0YQBxSWfTUmAB/V/eXcKwE59Sd1NkC9dvdjmfTZkf4FwB8KAJ7XOtmw26zn/w9Vy98qo+3Cdw741aYtcy+vFpIIM0x2Cb8SjTALlVKLOCygO5J+xO7AP6vNJxazj2ZWNQGaWFdc3jae8CZTN0wA7MGx4wJE6kJIilQrmI3a2jm5iujGU2hp/I29i/KMoKA+WdL7l2qGA/ESh3XkYEUuzk2qv9q7bRSqIjs/BAgYPPW2JA+OtrZFuAhHoBz/xhALDyw5A6/mepyYdXKipqIncQzxUthok2njTWyNW9bynU5HjIC3YDoqd1Rb1PlpQ3b/Q13IPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlNtxF99FYcqlEX41oLFrtnLsX9+S3tbKnxMEY8Lyhg=;
 b=QitRcE2QcBLnhUYG4bKQu5SGAf2U5bg0DiRNshOqpcZEzSVAMRINDtYyovBWGr8KLWdLAT57RdUVf/Qs/jyAZWyM5cyDaxwE3lhKzpR0oNzgI8RTWkWC9Ln4Q1MZQC7hnaJJnSJYLPAMZl/oKsjHn/DbkyCSFN3BgkjOWG/1GX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:05:56 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:56 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 2/6] USB: serial: mxuport: clean up firmware version handling
Date: Tue, 11 Aug 2026 14:04:57 +0800
Message-ID: <20260811060501.2307836-3-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb34eb45-5f93-4d12-d9b2-08def76e9bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yl0EWSitbQ8jk1zxREJm1xn0+uyG9aa38J/wI0hVxc9wdlq7MZCO5Obl3jOrdW++bC6/B02wuxkonAyZ7+/+Q/hbPqNv7XXA2nkhoSjWVhpndICeAm6P8m8fdjUhuVDpfT+t+YYsin+eedQa6Km7JfbCiB0ereHi2nZaDUZ7phM/Ai6SBJcja/Ov7XNUGUNS0bnFTt5zuHbdHGDSRbZtBLKvjIgD16kdjhtJrAxZDEi/cQ5R885k5StDpppCGyt75C38Z/7q0wKeIPbm3l0BOEfNqFVPBqgLbcaBMPUQ0DULiw+lOPwVba1P4UikoUy670ro6ZkMe5woCKfrW2a4Y6poVEkZqGpqaXbEoy+Sl7qxSWiEbYgI9xgiEGyKZqg/8BHGGVu/lbOP9h5IkO3CwXZ8XhugizqrbWaTa8zL+n0TECj+JHuYqsjl2Cn7T1pn3UhBVI1JUaiFffU4isuesQTEfUGCnTtvMQ4LB1w3R9Wzf8BSLDFCu6uhLlK6lJP0oM4kJA6lpLG6L3/pI51QB6hjbaDz8NSDAghbzfqcqiXpXGzYt/BVl+DvV74oAytH5tcxIh/0Y4otOd6hFo5v9c7DKEgyoLCDYv+k5sZoTayeX6AVPrmlum9zLrsRSVi7Dxej9aDUkpo6Y0bDAgxvpxash+HGkn76UG7dFDxF7D7HSMwnR5Jl4KqzMtTKyOOyUWOY+Q1fqFjIadvE4Nzn3iCzDq16mYqZQ/mbe/dT+YQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ExBAbl7/rkWUSsBh5rgdm1SgYOqvTk3vqHKsQyx2KqIPO+8rAk5IDepVJTqs?=
 =?us-ascii?Q?wLrOYgam1B1DEIotSWXHmcBjVuTU9au6M9Q7rlW7n7lm5wKTekcvM3VxXRFA?=
 =?us-ascii?Q?dLDxrTLtVzgBR0ABiJnaLd85UTBmZdFXwewLeVwZ7oVM6d2AaqK8SNjPEzek?=
 =?us-ascii?Q?g8T8IDv81zeBEmVK8Daq43E2ia9P9auwe8C6hoy5iAwTV80E7pLsZJLauyGR?=
 =?us-ascii?Q?Rz8qv8qmy6+GFdFriuutwwE353naFTjy5hxJH9BzjpoSTgbrcD6Oke4G2fXc?=
 =?us-ascii?Q?7OVGp5ZuHD5JabcRNL2IG9q12vFA07BUzWmf5oH9mQ3H4FcHDbhMw9lv9Rqb?=
 =?us-ascii?Q?bi0bOUxKmvt7cPBce7sMoRf4CueyCCFdqsNemfRcJ71Xi6/Jb23sHYY28ucx?=
 =?us-ascii?Q?5KrpbVL7vjZM34NsZ3ASrbobiEUELqaE4D4jp9bcw2R0TT+viu0+bm7BALwa?=
 =?us-ascii?Q?Ou1974mKEHpkGi/5/xLMN98VEJ27IMbg4Sl3j8cUqQIoFQoBzS3goSKDhY0G?=
 =?us-ascii?Q?LY/ZxDcB3Sdg1GmOJ/68vBNS/tKoWX7Ul6v++l8ZBwWB/JcbBHpIwxsCezgk?=
 =?us-ascii?Q?Cf009/WqkG5CSZykgR+uCl0DoahUkVyQeOOLM3aUa56DSwRxIES5WAQK9upv?=
 =?us-ascii?Q?JnLCE6h09ed1TW57Rst+RvSZPyPGrrUDjz/JshtJrwMZ7x2SZrW//Wu6FyOM?=
 =?us-ascii?Q?nAcJmq7EwF1ivbX4S0y4vDWGnXaVSjjYcFgq9rJOROELg7sPLzYyZC23Y0Yv?=
 =?us-ascii?Q?IC4f8iHbdSFKfwjoXtxKJQI2/h6erLkb85SLPGDJeUvTmBZgzLjpBaZ+ZJTw?=
 =?us-ascii?Q?orAmQ7FcYMmSxrMB3PsVrqiALEnYHih/CcbT2tlLRyEWbMjp1b4jMTGtuES/?=
 =?us-ascii?Q?qwHb5p+gUO2smaqKlBYU6nqEiNlHLXwqIRsvUqTvFEkRbMi196CRnWfczpcv?=
 =?us-ascii?Q?9Jw2yQIkmKVnor2wRbKdbwGtWvDT5Zo1CueCbfnmTtgPIuP+6dY/MoPDSjoc?=
 =?us-ascii?Q?gOftwLAr2mt0157Rw7jWL39+7nV1Op5NI4CcBFiU0FWiKDuNYvm1gTOwFZr3?=
 =?us-ascii?Q?m81GTys7K+gAATf8s3XY4r7NPpl/2K8G/Dn50UV73P5XHfSlx8aeijUhuf2D?=
 =?us-ascii?Q?vUhdKfJ8CDU693pm4traBn7co69R0rIHSkSBvvQQRBcchM6ODV7rG/IH8X98?=
 =?us-ascii?Q?9IaoWgsXPr8+0p7pN/w2aJk369lvNrD9luo3JjDomTi9EYGK/tO/rmv8gm8J?=
 =?us-ascii?Q?rqE2siZ9wDr9EDQlOiycywS/MpXCc9JeZlL+givt2t4APJMRy/vl1k0c1dah?=
 =?us-ascii?Q?J5X/AlcAVGppwbbx6RarbA6KrPQcqhb4nlqBNVohDm3432zCGYggqX9TSwMg?=
 =?us-ascii?Q?AbfsY5nEJ5eRPX4BdpNfye9mUDBHher4DaJcyegif3+wymkCmkfXqHBWQ8lX?=
 =?us-ascii?Q?ozVS6d3+hpPQK9uvNOadHP2YRR18Mj2dAsjN/zThbajcTQCywxmkjyv8QkyI?=
 =?us-ascii?Q?5NPcrqj33CjE98v6HpoRTab+tFf3BOMAOV7qFZfwWukXNNOya6u2zeBstWbb?=
 =?us-ascii?Q?x7hOH2jCQjUCNJ3KthTW9a2nO+LKF5aEceBYZ6rc+8MHCE/gov7euCbL6CgM?=
 =?us-ascii?Q?fnA1wlWCq2SyP8jkBrK6hMo4r8YfcexsN+vZ836U4FETb0I8+6bNz8SYA0Lq?=
 =?us-ascii?Q?lcUB4mu1OYrtgq5GwjmzMr+4pUl2YlYqDP953NONuo5hMCPRK7jTzmkBujiv?=
 =?us-ascii?Q?H0ChuF+DbjarOBnZ4Y7y6r710Lepv3E=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb34eb45-5f93-4d12-d9b2-08def76e9bd2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:56.7965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26AyjrNm1rUBGe+Bd3UjSjjSgS68muPAf0nS+nE0zrtcY3s6LM3c/LzsjsusX/zWvTyPl91o3kT/EMSPFhOmEo5c6NyVS9zyw3bzTJ0m+c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

Add a small helper for parsing firmware versions and use it for the
firmware image. This avoids open-coded firmware image offsets in
probe() and retains the existing image-size validation before reading
the version bytes.

Keep the existing version comparison policy unchanged, but store the
version components explicitly so that the version can be printed
without unpacking a raw integer.

Print the firmware version fields in decimal, as these fields represent
readable version components rather than hexadecimal values.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 78 ++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index a4e0467171c6..61d4c6e1a9ce 100644
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
@@ -965,8 +978,31 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
 	return num_ports;
 }
 
+static void mxuport_compose_fw_version(struct mxuport_fw_version *version,
+				       u8 major, u8 minor, u8 build)
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
+	if (fw->size <= offsets[2])
+		return -EINVAL;
+
+	mxuport_compose_fw_version(version, fw->data[offsets[0]],
+				   fw->data[offsets[1]], fw->data[offsets[2]]);
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
@@ -983,7 +1019,7 @@ static int mxuport_get_fw_version(struct usb_serial *serial, u32 *version)
 		goto out;
 	}
 
-	*version = (ver_buf[0] << 16) | (ver_buf[1] << 8) | ver_buf[2];
+	mxuport_compose_fw_version(version, ver_buf[0], ver_buf[1], ver_buf[2]);
 	err = 0;
 out:
 	kfree(ver_buf);
@@ -1043,9 +1079,8 @@ static int mxuport_probe(struct usb_serial *serial,
 			 const struct usb_device_id *id)
 {
 	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
+	struct mxuport_fw_version version, local_ver;
 	const struct firmware *fw_p = NULL;
-	u32 version;
-	int local_ver;
 	char buf[32];
 	int err;
 
@@ -1060,10 +1095,8 @@ static int mxuport_probe(struct usb_serial *serial,
 	if (err < 0)
 		return err;
 
-	dev_dbg(&serial->interface->dev, "Device firmware version v%x.%x.%x\n",
-		(version & 0xff0000) >> 16,
-		(version & 0xff00) >> 8,
-		(version & 0xff));
+	dev_dbg(&serial->interface->dev, "Device firmware version v%u.%u.%u\n",
+		version.major, version.minor, version.build);
 
 	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
 
@@ -1075,35 +1108,30 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
-		if (fw_p->size <= VER_ADDR_3) {
+		err = mxuport_parse_fw_version(fw_p, mxuport_fw_ver_offsets, &local_ver);
+		if (err) {
 			dev_err(&serial->interface->dev,
 				"Firmware %s is too short\n", buf);
-			err = -EINVAL;
 			goto out;
 		}
 
-		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
-			     (fw_p->data[VER_ADDR_2] << 8) |
-			     fw_p->data[VER_ADDR_3]);
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
2.53.0

