Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AC381B01;
	Tue, 11 Aug 2026 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428369; cv=fail; b=T80YuP1OEjDbVUKfm40GNnK/BLYsHVJOO8JJgi16lNBx7bYXMKahYO67Ff+lwgkqhRxSmox9j7VS4v2KYuEWbNWzFjTH7pV5sDwqtvyFvc7dEacZyZGmw9bT8cRBV5L9FcNiOtMqkv/bzquixzPR3ksy0MA9JBwJntsg5mAjZYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428369; c=relaxed/simple;
	bh=aMZAJbY5saOrGosMx7I+t0nEQyOVHtG80YEX14Rdh9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JJrE9G6HhkududqzWV7NwfWHOnfZ6nqX7eVRdCU4B9txzUAYCEFNoChhetyWenjWSeRn+SrYF+72UK59umNzGarNaA0y9Hq90S9q/ej6TypoqM2gGWSlaN0qa6md1Oax5eO5MLBl0l93UyG7lE52HJip/CzDuZ2ud1cR8PVLgKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=URIwTZ8S; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="URIwTZ8S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUKwyOHv2uTCFX82CDnGcmcEHvho1s/XjfJa2coewW1jgzQlH0ceTgF8bsd+3nZ2XCfNeOuMD9SOQRXbgH6pvUsPHwsQM+C7B82HMuQl2YexeM4Vi/Wq7kjqZJioBc1hPWQDYaZcUhzehVbJ0UnupUJnAlYH1MnVFBroMH5SCVnA9G4V8Q3hzneWlXFabAtxl5JOzmGU5/wSbnRaGXCKt2yvtIalqkCQNL9dR9aGvAP+9CAHZ31ecGf0J0sgjYS7vdW8l2ynI7v6zC8MiaWpb9Gwg22KpIzeBfcivETW17535Rc+02RqgPLZLRtAUUuSzrH7jzjlLKIm7FanavY5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYComLqmOmmjy43m1n2x0BIar+Qcpslfx8LgCvbNB6U=;
 b=jdBz8cU/VblCEG57rOzGs9PKMnlcLtzMVyM8hYjsvVTjjnI37Vo+zJSicMXSdIT8g9tXyNfC1USI94jlaRALPr/3UExuOFHa5YRzK8KaUi6QWE7W+6swVxuAqL1B4L7wAGvNXFfLHwQ1O5aYVmvlAB8CIOmzk5N8856jqpcV4O7K7GimAa4b5APtlTPB78T84aS1M6k6lxCZ+G2ev/mvgLWQjfVT6XqGejVuCEkpCt75oxrwkSlV2qyjr4U3cJFcrgIuPtwNk6kSiuvvyAk9ePSPg9W/Q9YY6raHMQHrmJmCKn7l596So+JFGILHsB/kGXf+BYFloCYrCmIeBjFS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYComLqmOmmjy43m1n2x0BIar+Qcpslfx8LgCvbNB6U=;
 b=URIwTZ8STqHhvwloY8OvFDYE+ab8FUFxhQTQ4/mtO8sMEqX5/su7FXKdWQfqMQW8101+SaKHcTof9921+Wm1xQHBUrpd1fiY3oR7qxX750YS2PegOZdoUgGTgdrnrTR9Ai7lE928NsPOK0OxDymSqq3wH+o+mMIcajB3F0O3F2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:06:01 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:06:01 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 6/6] USB: serial: mxuport: support RS485 mode configuration
Date: Tue, 11 Aug 2026 14:05:01 +0800
Message-ID: <20260811060501.2307836-7-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: 09610100-f68c-4a2f-9bed-08def76e9dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LOEofcqTPrukA/4CrkXHfYTGH/DWZy8nA4ybEmw6mIqICDH3h0gaNh1g2gizXANBDqL+Do6+XDwhGXvtAv5gpfJG8pOA3LjAtKf7qYY7dfA+3DuO1DFgdKIHM6nnodUgHPyDFxwVvpfd5FZJGv6+y8dDFiAM75ZTgGBXWAs0CY2lh4W+MF5UXwSxhebAWl5hSnN0pMbT9uFtscGie22mRLTJvAlKn7IUmFXasanoIzu9lgyMJ0qTBNYsboIqS3yXbUFVSTtLPf5WCdhRnzsSjPMZJ9P7md2ZeOTdJ2Cfem46cgIzJbRm7Zjd4/MbONKQ5ItJg0xMuU3I/UXtrsSV9U0VaVWmqK3yNyBGkbxQ79tfr0DvBMuA2m7h7Q5ffZNleofIfILuyANgKxlj/wHp8qyUXdPBi8mfrFrEz47vIB+aN/wxLchUmLLO1DS7nMi/dNsTOyTo7J1X9/HqTp9lAZOYCPLBzn2ht4txw5yxbzp/vjyYpW4jWHDlWsuKNN0piZaBZhI5exX3Jm/DvvhznxtpYuB73RV7XBhNUN/9VhjfuYy1IQT25pPwnZOCvcgx/V8jquEyBkxBlbAd6me8pMAVeIFGLuMZ7fmE0CsGPT/LUIQq6On/Xp2p0jHppaAO1Msp3F1/En/Ow/kXgUQvz8b+163jZH9JjOtrKIl3DWSNFLCC9vTWJ3Rqlgcr9EgqmdX0lMV87sCYaai0ZmDdQ4BixaVcXSoHJSwe1t/UgAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hk2nHuE+IwYnpIiFPaCpC7YKwbyT09AQZfea7bj78SAzGjO+PiUAcgV2geoF?=
 =?us-ascii?Q?GJ24+GyUWyNsvsgj5wGqxA54aoCgAE4YWxmAOJewuHOBROjg570Dy6KvhADy?=
 =?us-ascii?Q?YDVKd+wsPS+kr0xFw+CgBlBaFs5pLtDIiyICQiAvvYuDilaIea+iKyPePmLU?=
 =?us-ascii?Q?B5C9aPVAcm0nCC8IgX9eXRO/J4uiCQ+ciDWeik3y6eGfYKo0E3t6G9D1S7XO?=
 =?us-ascii?Q?pt/HKnezErtQDpyfU/CGykSMIY887Dyk7vditcRRmY2Zyw+Y/Y0kyFgHkTwA?=
 =?us-ascii?Q?nAAUL8GmbTamEKXa1dHUBOtgQlpenfj+ZAG5oB3ZNktZWIQn+YACSwHc2ItW?=
 =?us-ascii?Q?Ifhua6nejETQtOYafkG6G8TfV3eIQy3+e3sxG5MlcULWtpFRrR3Dj2/PJLyI?=
 =?us-ascii?Q?XXHWLGQyPTISsz8xTDLZ78yQ+DzQhzGyIUZ11Y/251cp3P5ezWXGQlOxDB6p?=
 =?us-ascii?Q?nXFLILydnVpYhT+oO0R+2TE2P2ZQVaHGQRaGgeLtIReCWnKpqAldtscjTsrX?=
 =?us-ascii?Q?f1gkExvpV/w310OgQm9sMidMirZY5M4M2NgKv7Sz1RziPHKDH32dwjrCd2NA?=
 =?us-ascii?Q?rW+jTI9nFPUyQHNG9wkytQmcM4jUnmYMEaSPOcrDrgJJQriKIbjG3PQC1tL9?=
 =?us-ascii?Q?VGGqlf2QpKyKVx0R5vOUZ5fw+KGq9EDVjCBI3CcLsLWpzRtbW0JbnJsUYeU9?=
 =?us-ascii?Q?AHuWZmg8U5kszqVnqGpAFG47tYVc60SgEY0nmJAVRSdyhXJKjYzCnFVafiGf?=
 =?us-ascii?Q?FQKmtf0ItjFUKncyeL0xRxXxcGuPmKolTWVsd6lomVtyE/KGwEdMtRhYZjmc?=
 =?us-ascii?Q?86BQpxeoz2DvZiFLSEZ6rg0f6g5SdGhQn3PnqalQ2LaEIRGsRJCSfAAoN9R4?=
 =?us-ascii?Q?/5ThjCGOJaJ19qTCWgX8dlmg5ZqwOsX95/BHmj7mN95b9oZiQQ6YD2KvDoGw?=
 =?us-ascii?Q?kaGnd+wZL79kDshP7CIc+KUY4K6p6+bkTOWbzmxEy7nt6ES1Ums7XxybHHcl?=
 =?us-ascii?Q?fxoKIrjVNcwTXymDWuHaThaAMgS20uu0JNEFN4wutYSCEKMpAdJFdAySPR9b?=
 =?us-ascii?Q?x5Vs8eC0lg16EHLfqnJDw4d6oYdal5JF2nQMNlAy7tSfKahXGOVtumRGTzoB?=
 =?us-ascii?Q?4M71oc8D3pH20t8JqR8DShiEl7lI3KFifGFMFynQSLFWXM5VecTr/V2xp5xH?=
 =?us-ascii?Q?CNL79lhnlld5BWp/MHbP6d2r73rkX1xdfOfS0O+HU2BJPH2709eJfOD2p4d3?=
 =?us-ascii?Q?fbiEmur6weeBJ2q4PxYolQJrXuoV6ke141kILmg2QIyWenN3NxRexnqIgaUe?=
 =?us-ascii?Q?XjEjvFFjlzMMbEmoY4+oMCX0Jb3u9J29vvw8Pt+LzWt3Rr7zAjkiObl2/5Ks?=
 =?us-ascii?Q?lTZDRrTKhqUggV3E5lhwKjVFmE4k9j7FGHgOEm6tsGWCOfUpY9rm3urQ59HD?=
 =?us-ascii?Q?UfwVpDS2MJdnH74A/VXYFqzwG3Ty6NMX3blkLZiXO8eIRLjS7yPFc9LCeEKJ?=
 =?us-ascii?Q?701qFvfgRha/4uIFuok8jTHVAOOBsh0uevDVbI4jwi17MZE51y/R3gRN8q3m?=
 =?us-ascii?Q?ba3Klq/+MYsZXPBdV2t3rdNmFrBrIBPzzUbGO4ktP79L8I4S55i3+8HS+/1r?=
 =?us-ascii?Q?DZOuQ0X2YTWO2Dpi3hwKaLAn0yNOJvJnR4lM9L7yuYnobpohG1xEK89ZxpJ9?=
 =?us-ascii?Q?jQQWYuDCi9+qiE3fDSDM3KlXUjUlWKM5g6DlUmoDep+zF5T7ak7PfiSgX+IL?=
 =?us-ascii?Q?0Mla0Vzc6AKEWXO+N7Wb8q894Eu+jeg=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09610100-f68c-4a2f-9bed-08def76e9dd7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:06:00.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhWxwfSMY64CkQfU+0I8FsZrKYzDn3L6QzMUsrqsSuvsFNM5UegeebIRkypIeT/QyIVUDhAF0+uKYK6C56DdMJgAKlPWAFS/0xliVYL3PGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

Add support for TIOCSRS485 and TIOCGRS485 so that userspace can
configure the serial interface mode using struct serial_rs485.

Map the serial_rs485 flags to the device interface modes as follows:

  - RS232                  = no flags set
  - RS422                  = SER_RS485_ENABLED | SER_RS485_MODE_RS422
  - RS485_2W (half-duplex) = SER_RS485_ENABLED
  - RS485_4W (full-duplex) = SER_RS485_ENABLED | SER_RS485_RX_DURING_TX

Unsupported flags and fields are cleared before applying the
configuration. Cache the sanitized per-port configuration and serialize
access with the per-port mutex.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 98 +++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 96dc85defb0b..319704e64528 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -208,7 +208,8 @@ struct mxuport_port {
 	u8 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
-	struct mutex mutex;	/* Protects mcr_state */
+	struct serial_rs485 rs485;
+	struct mutex mutex;	/* Protects per-port control state */
 	spinlock_t spinlock;	/* Protects msr_state */
 };
 
@@ -870,6 +871,100 @@ static int mxuport_tiocmget(struct tty_struct *tty)
 	return result;
 }
 
+static void mxuport_sanitize_serial_rs485(struct serial_rs485 *rs485)
+{
+	if (!(rs485->flags & SER_RS485_ENABLED)) {
+		memset(rs485, 0, sizeof(*rs485));
+		return;
+	}
+
+	if (rs485->flags & SER_RS485_MODE_RS422)
+		rs485->flags &= SER_RS485_ENABLED | SER_RS485_MODE_RS422;
+	else
+		rs485->flags &= SER_RS485_ENABLED | SER_RS485_RX_DURING_TX;
+
+	rs485->delay_rts_before_send = 0;
+	rs485->delay_rts_after_send = 0;
+	memset(rs485->padding, 0, sizeof(rs485->padding));
+}
+
+static int mxuport_rs485_config(struct usb_serial_port *port,
+				const struct serial_rs485 *rs485)
+{
+	struct usb_serial *serial = port->serial;
+	u16 mode = MX_INT_RS232;
+
+	if (rs485->flags & SER_RS485_ENABLED) {
+		if (rs485->flags & SER_RS485_MODE_RS422)
+			mode = MX_INT_RS422;
+		else if (rs485->flags & SER_RS485_RX_DURING_TX)
+			mode = MX_INT_4W_RS485;
+		else
+			mode = MX_INT_2W_RS485;
+	}
+
+	return mxuport_send_ctrl_urb(serial, RQ_VENDOR_SET_INTERFACE, mode,
+				     port->port_number);
+}
+
+static int mxuport_get_rs485_config(struct usb_serial_port *port,
+				    struct serial_rs485 __user *argp)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	struct serial_rs485 rs485;
+
+	mutex_lock(&mxport->mutex);
+	rs485 = mxport->rs485;
+	mutex_unlock(&mxport->mutex);
+
+	if (copy_to_user(argp, &rs485, sizeof(rs485)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int mxuport_set_rs485_config(struct usb_serial_port *port,
+				    struct serial_rs485 __user *argp)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	struct serial_rs485 rs485;
+	int err;
+
+	if (copy_from_user(&rs485, argp, sizeof(rs485)))
+		return -EFAULT;
+
+	mxuport_sanitize_serial_rs485(&rs485);
+
+	mutex_lock(&mxport->mutex);
+	err = mxuport_rs485_config(port, &rs485);
+	if (!err)
+		mxport->rs485 = rs485;
+	mutex_unlock(&mxport->mutex);
+	if (err)
+		return err;
+
+	if (copy_to_user(argp, &rs485, sizeof(rs485)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int mxuport_ioctl(struct tty_struct *tty, unsigned int cmd,
+			 unsigned long arg)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	void __user *argp = (void __user *)arg;
+
+	switch (cmd) {
+	case TIOCGRS485:
+		return mxuport_get_rs485_config(port, argp);
+	case TIOCSRS485:
+		return mxuport_set_rs485_config(port, argp);
+	}
+
+	return -ENOIOCTLCMD;
+}
+
 static int mxuport_set_termios_flow(struct tty_struct *tty,
 				    const struct ktermios *old_termios,
 				    struct usb_serial_port *port,
@@ -1503,6 +1598,7 @@ static struct usb_serial_driver mxuport_device = {
 	.set_termios		= mxuport_set_termios,
 	.break_ctl		= mxuport_break_ctl,
 	.tx_empty		= mxuport_tx_empty,
+	.ioctl			= mxuport_ioctl,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
 	.throttle		= mxuport_throttle,
-- 
2.53.0

