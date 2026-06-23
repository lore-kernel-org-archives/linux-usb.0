Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013019.outbound.protection.outlook.com [52.101.127.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6EE3C8719;
	Tue, 23 Jun 2026 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201871; cv=fail; b=YfCyV7mFlydiLMzDCjbZ6dVoQqual2GCFZdxNnhymNjMmleDIfbHKqOGaUSPMUTmnPuX9d6iPhx0c7elXbDZmL/omJqwjDEuak4Cu4+rhfbcTCit23w/eRAE4DiJXnL4t+Y0vAqHthwQejhwWBL9aE5EgR2Cq4YHR1hQ5t9Jr7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201871; c=relaxed/simple;
	bh=bhEa2fnLPp1+p8p/gfCCEBJGgE8ErbCVg5ahscYzJl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdPFkNij0F+3NTyFvFQ54DumyyXUCvJQLYvOfiRHylNFAPqVG3DoelM5rYz4cng4I6f5spXrBWlqWG0VRk7WVI6CqSKwMhkO5Qv3KAvlbA14buGfb4MiQsIsbb7wDAqTmjF6Vj6I2vKpI0z94xVA9V7aknx3w7hM5YDOxIR6K8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=fltL3jiu; arc=fail smtp.client-ip=52.101.127.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="fltL3jiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjPiYzsxUYaXptXOQVtrpVH3/lQkaRskLQoutmBHp8kWZ3JXvDltO53ZvosEZhGQ5adCLd/W3d63u2qPfPU6wdGaalpkobLCIoJAEWju0VILtPYnlHFZk2bqL/glGm7uRBolzdpe/Ts8Ww+CCrgnEAtHzOKFz0YX5QQmzomiDZxJlUtvCMl3Ad7SOA8ulaR5ZDtarQvra42fqdeu8HRJYM/636y9yaQXh2akOBhnkLoxc88LtMF0I2vo6XRbJ4XkkLhxC7a0GZGdzYljwsynD75ByiI+iUZMy9RWpYeP3UI2Z/zJ18wr6VAIRX5VgaaDcLwjoqn1ZAf5FvnzQbR5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g69bSJw3YjXRpqr/GKi/ZP+bXo47DoAkGzVwxt5pb8=;
 b=RY0y0DtwGKsuQawQUcWc6w/1GPwzYC5r0Cs7TX4+RWiA1nHhIDdKL3+k2MbGeyat4P5kdylFnCm/+iPQtCAqHT+oAORGcqw21fpT3L+wjiPJq2O5ItT9fnBocgHrKqHdu8I9CJUL5NvxbRHMB6DUFPbCgUtmW/qDYlpRAJ7KxrEhZWTg/8RnaQnbhCDYaD6Q+6Wt+jzRYK/WLCvvs4xfYd870EY8fhyVWekz2jeUjYCPwLaJT3xJ4oFw23Wifgy8j2OSTSxJJwjJriCFwMQJhO3LqPwIrzEefZqERt53l/eNlTqdQ3M1hZ1+dHk4qsGOCpYwNKwyKlAgXq6gvCANQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g69bSJw3YjXRpqr/GKi/ZP+bXo47DoAkGzVwxt5pb8=;
 b=fltL3jiuKiP7niXGkZ9tPmY3W0m1wKFSDEPWDL9Q5RWPU8LouXnVjYhpPa8Ij88rNu5tlDjHXRE2y8VZ43f9RXGfjdbLm2Ruunh6Jh2BuYeXTcnEH0WZSymkhsANfP4f/5/dTKQiuTuYO1al1NkzJI00baJldJl93xGZI90OycA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5306.apcprd01.prod.exchangelabs.com
 (2603:1096:400:359::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:04:24 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:04:24 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v2 4/4] USB: serial: mxuport: support RS485 mode configuration
Date: Tue, 23 Jun 2026 16:01:39 +0800
Message-ID: <20260623080138.166398-6-crescentcy.hsieh@moxa.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9355a4fe-e870-4b1b-4360-08ded0fe09d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xj196mUhNKkY8L8MgV2w4P8vR+L11tdxNJnbVqLFUq532ifqG8jly2LHRguLxjttuIZeYGIyVFcwr0o2cci7Jg2GoncZebdrSpvqrlvvx3swFfX6QvZm1XoWmuuIv+nW93ND6ZnuzUuqDfd8bstxxkoZ5pfGLoYgG1PZMI76pzfwwrEiNTLAKO+uz9FPbBlGhwQY/zFTh0OrsCLGmAX4v10lCNCdodl+OrJYnEG0vdh+UZFLx6Wz44pWJx/0wWK3SxcLEU418pFMoIGrOm8x+gAXcOIw7nbMn1A6YOfshDaGPSn/pYaCTNCo36RhU40wnEV/Bugl0gxpXQs8Y8/i2n9GPKjEq7caOc2Ey/fwBjcJ+FOkKAK073TcXeXGJwfAiog1TrP/dPROmIKro2u8UhcnBo2g9ozImZrE7ciBB0ShDtr2XN96AZUql5n2xz1VN8gQIPbj1JfDXkTKoJ7KaVgsmhCrt9cMQ/K4Sh2S7dTVH1CpgXbGHYLz1MDPHVTuVf33JewLlZSoqHLvPSGkdZGarZgq6RXe9C++djK4Z7tPBAO3uZPlSbMb8+VAq72hoUwfg0uF0zXIt9aiu8MHOC3au0wJnLoajH1OB4XBwEtuM/KFD/0MwHidF+uYdO1sj6FiGBKSm+SsIRxDnstxC8IevWCyojSXaFh+Ya3PalYXvM9z+F1b/TFxwutRuMA9lPSamOxRvFDDkZto86cctiL6epEcl0mvcI4VL77EDh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LEcCvE6e3OcLnAOsO5WBnP2IA4HfPrRAyeMHpwvZY3F4YuNXhS4Ze59euWhV?=
 =?us-ascii?Q?Sp+lPc54niOwUZXj+JGt/2Fr9/iBJp73fvUYm9m9lMVKC8xuAYX3ZHUnh/yW?=
 =?us-ascii?Q?yE3cmFS3TEB2BR/Ae3BV9SmiO78VDKlEZeG2Xow5ohbXvWKt3udYnSWryamn?=
 =?us-ascii?Q?bQUoqlFLbNmL0PXcvVqxi2OeAnP5ZcGhM/wp/Cignx66CurofZlHnLuVIHry?=
 =?us-ascii?Q?YdLzMIq08CluAjYWiPrWitthsLfJX0dWrOw3qHLjwC2jZ/rTdjZiRoJ1aFA3?=
 =?us-ascii?Q?LPRbpE4iwn/3vV/hAgP0FjovaSoUE9qtUSrz0OV6l+WO0zs+4096PZ0CH5z8?=
 =?us-ascii?Q?kw7YN2Q3MbN07lVeBf1ZUwl1cIKvQ9WiUTVlAjuEWPIa2s15NIdqT3FuMEgJ?=
 =?us-ascii?Q?swim9wDjIRAvctbgfYeNDA/VPCCljG1VgZ/xQt5QADq79QYPV+9RYTp5aRwz?=
 =?us-ascii?Q?zOohuhrAN/jUZCGbXcRQCU0TVr0byj3y0QctmgGtkvloy4FZKx2iiXfkJLqa?=
 =?us-ascii?Q?Hz+CyO5Iz034WjpqZ2j1Rcu0NoxdVhhCbHX1MiMdWbvU1oiRf0MZ3YLE2Q9M?=
 =?us-ascii?Q?hc8twa/Xyz7/9iO3cVcpp1giMhZM9Y8b68SwUc8ufNTQY9ZbYQCT5Id1iYxz?=
 =?us-ascii?Q?wooPM4h2kv6XDPyZF2ib28pN2xw7sXfPMeEwwh9I/HzhkUAyXASqGqMLcyIy?=
 =?us-ascii?Q?fT9wih4MmHd1cQ0tXVHrVIDqgyBdn27rZ0Hamt0YtToBEaV5W8zSGCEmqex/?=
 =?us-ascii?Q?SmWSuPo3w4Jf6QF7xLWHN2iUJYPm/xEm5HJhawah1VrSEi1ydSlOInlTjsxa?=
 =?us-ascii?Q?E9ARypZmEqEOGdx67i+3I9FL6WL+NKw7hJ0zcNugiAPePyKimBBjMVHW1UJ3?=
 =?us-ascii?Q?FEBu6yPhZgv2wpklnyd+5w8JSX4J8gNOH8RTFcD6KISLGt1FCu6Drdmnpilk?=
 =?us-ascii?Q?nRLtu6NHqu5P7tmd0aWMfgwr6iuWhsTdmnXRnO2Tud6d19p8+8ienODN4J8H?=
 =?us-ascii?Q?BHfznWHIxUAiKUsULRUp7LKPvX2QIuZZUIcZkz8bjChQAZ0cQj/aFNUvWgUg?=
 =?us-ascii?Q?HhiFddByWqX25ikto2dt/wT0XU7DSNzCPw+kWMrSdLpVpCT8IOjmpT48Vlxw?=
 =?us-ascii?Q?oG5bh0Si84vwZFOGkQEnFMR4xnngs75cDjQ9HXIEtKdKG5cnYs2N3wwsHx0I?=
 =?us-ascii?Q?gmtP+X9U4nAsIk81Mi64r4xYrpvYx0htC9cScwM0Y2UkgQgYu7xSRVgtQlgb?=
 =?us-ascii?Q?llg4Ulcvvp4b2jjxkZJFrr7cNW5MAXaL89VSpZMfKTvy+6TqCRGoe3TVaWoE?=
 =?us-ascii?Q?DOrg4avGlUPK9+DI8Q+hS0SsM4AYARvhw7XYa+447Vb0bdK/7umSkMphD094?=
 =?us-ascii?Q?rmbkXw/oX9a4+zmBsCg6PRGRl9jYtjqWimafNvX3/vFE+D0zkrMchDy3apnb?=
 =?us-ascii?Q?7S55sq2oxsReNEEzr7iQH8Hbx07OuE9ro1DN1HNPSEfoDtcPZ+byPgK2sMeK?=
 =?us-ascii?Q?gafH4j6hEmfwtHpgvvQVPpgdMcxH1h/4LbEhO0gDQhftrVX8N60w4IpI1/Ec?=
 =?us-ascii?Q?84QzJCGmoDkmpHWENbo/h4MRbG10n5LfNNAMM3KH6s8MmBZpFrA2P9gSlofW?=
 =?us-ascii?Q?ZMzORRFXAs2RRV8C0eawr/7xHACr4+zWzyZuACNk1rvfLQx3XS9oc1GXKja9?=
 =?us-ascii?Q?EaEJYLsJL9NYjntByvU3vioQC9+ohspFfFsQDCy2fIGMe+L4BO6nsJuyhwhP?=
 =?us-ascii?Q?ia1dvb2t4adwNksDkjIx8gfDBW70cSc=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9355a4fe-e870-4b1b-4360-08ded0fe09d2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:04:23.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qemyh6VK84XVv1RlvF1yq2wTySmEJO3/7XUgGPitp+tFUVtssvWD8HvsaVt4zw+Ej+OPkHyesIdutTbOmouxp853jF90szZX1bfhchK3v3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5306

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
index f3be2b3bd95b..79085595345c 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -199,7 +199,8 @@ struct mxuport_port {
 	u8 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
-	struct mutex mutex;	/* Protects mcr_state */
+	struct serial_rs485 rs485;
+	struct mutex mutex;	/* Protects per-port control state */
 	spinlock_t spinlock;	/* Protects msr_state */
 };
 
@@ -983,6 +984,100 @@ static int mxuport_tiocmget(struct tty_struct *tty)
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
@@ -1625,6 +1720,7 @@ static struct usb_serial_driver mxuport_device = {
 	.tx_empty		= mxuport_tx_empty,
 	.write			= mxuport_write,
 	.write_bulk_callback	= mxuport_write_bulk_callback,
+	.ioctl			= mxuport_ioctl,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
 	.throttle		= mxuport_throttle,
-- 
2.43.0

