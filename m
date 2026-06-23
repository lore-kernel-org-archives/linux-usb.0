Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023091.outbound.protection.outlook.com [40.107.44.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BDF3B3BF7;
	Tue, 23 Jun 2026 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201820; cv=fail; b=BFR0nIkwhQxRynS3C028pkqap8q0UQ+lB01gwdKnGvB3e8IcVyp3x9j8m0f5mR0glPWAK/FIYmVHW2rHzcuMlC8w5vAUZvR+EGneY7v7WdUXv8f/HbDncsfs4IdzHfuqsw5/ZvnjH5dRDM9FO/NrlCFvhpvm3RMlkYROQycKUT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201820; c=relaxed/simple;
	bh=CK0m5Av0y1HSeczIc0YPicdq716xMdYlxzLP9mrwg5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFTeaBl+U/3hjyUPY7+HWDo0xPOw1EuzSogaQeky3VPu6N6RqKibbvvHDSticyx1Cx0oUc1wAI10cKSWJ6wp0oujRd7IV5HYZcgAmfEV8HfUgOW5N1PpdocHhsFWnXa3Bd3iR8KMvh3IBqhwJ3ntUXqMyLN8zN1BBH84lnDveps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=jzD0Z1t+; arc=fail smtp.client-ip=40.107.44.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="jzD0Z1t+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKUwW6B1OeSj7cXkHXEIybC9obkZxCI7Hx6MZ/uQuXoE1DChUIM+cncZbmCuV36rl7FfxLakrYblzIu/WioDjISF596R8ZeJ2F7WewkLkL8fIo4lQYoCCmsfHav0DsVsbrXBFzwPunz5ry/Z2qgx3hxP9MQ63PolD5c7EjCk1RjTZXUGyxzpLm+ZL/Wgbwd7onyQh8ofmXBHw7/fht2zzjBIM20S8NlhzhfwvWV60AtivKsUP5FVqScIoZZQflXE0HvUYqdgWwKTPV7RMbMsVdHRbU5x5Ja4mCY4Te26chhccTwfibg7qAO9KGI7cCNL7OoFO54NpD3uvRswEQ2qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEdjkCHKO6zQ2i5y/HTi7PVmJcsiHf/IXcvD39bAxqw=;
 b=nhSVFezXiDX7810BE9c8KkyRXJXhQXaO9gXzAEURlpVF6Hu6RZ5OIJ46ONUAqy9H9w/mTznWUccrrEBNCq/uDL+9skqoesktk90jim2DGjfm9qjHEqQBSx8d09RFAVUHKX1qa4EkoUGiWHmz0to5cZE3J8ZBjAFd22POxwefvxItq9U1fNS4qm5ULrVU2ULXV2Ud6PQrGazgroPxlKfCMzSAbwKNoQREJVduZZE4WsT0R/SQzl6UNg1cT2KdvHcaQEUp2aRRNVRSDAr6zSwhwLppa6Aa3sOkwv23h0w3/5MF7CLd9XQrtU8EqL+nHUP5PiRROPCb7Jm5XSVgACFMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEdjkCHKO6zQ2i5y/HTi7PVmJcsiHf/IXcvD39bAxqw=;
 b=jzD0Z1t+ApFYSBv1hp2C3wqgrrQ1S1u8N1YdTHJ8wV7QBNmAx0jAESzU9hibBDqgRs2fQTEw1Yq/W+OujCIVvQzkFZmDp6JQzbhYuv5LCLE9prTqV8Fy74fYb6uFwxR73FsbI+U1WR1TrfqSLKOgLdt3CkEy9xPvalAVCeUzBNT5Jskeq38KB1PqM+a+ZQro67gLaozbeIXMx4v4ksUcCIzphYCJbNbPvdpxKFfbcjpKSO4VeEinxXpuGHlXFfBsSu5BTmPfvOJ5u5hSY3Jx7BN5LYyvbremD/6x/yH1MHAd0KbOj77VDrBxyTLURgJoKXojYfXI/MrzONZS51+jaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by OSNPR01MB7296.apcprd01.prod.exchangelabs.com
 (2603:1096:604:318::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:03:35 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:03:34 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v3 0/2] USB: serial: ftdi_sio: latency_timer reliability fixes
Date: Tue, 23 Jun 2026 16:03:19 +0800
Message-ID: <cover.1782201674.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782121274.git.naveen.reddy@ftdichip.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0016.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::20) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|OSNPR01MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: beba80f6-cc92-4070-7ae3-08ded0fdec40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|18002099003|22082099003|38350700014|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9z7rQQLXYNffoIrUxJOpsDUXWbPsKEZgwsC9upPnj0KU61cdnxwDvD5iboddHRmSs93jx2adRecQtSE/efraRElLlUZeUhV7SvP+eUeCbmb7ISPgirEmoqNT2/W2Zg+/P5/zsLY/4sJweVVyyc4B76cNy9uZOuCBdvGABcBrQyThIm0iVAWNYx8TFVYwPmRIGYVn4FkTXRmyWMBzPjgGHoGpPJT7fUKOgCQU6ghcyhMWS8UgOtttJkpXEilCSIE+Yoy/eD2IiNR8aeYbbXJ3L3yS72/jBhTR3/mWy4a84qzYqJUxt+DLmJIaq1s2FMlu20785jR/vFfvL75TcCG7vfjbyR4dDsbm6aFJofKwNaL/Cu0so53oL77daIE3p3jjjA3ixUNKzBStyB0tjkiD6kDIK7zabbkmxMhdvz/7+OLJ38ZcWeKHDYE4nirpu8sRl0Yx/D0YNWjyfSHE2uBFN84c1p665vHxLZrDvvPoGL3UDlMmXcrrNdfsPaPX+vNhj0Wnrku4C4EGb95YEhh/g87mpjNC0SGnHd5SXPy76HxjRMDdColOLIoA7V3Z95PaZTMoSsbglmrk0NIFwUak6ikKGUSTfkbt/l6xtFLUaa1+4TNXNhsZP0Bfk1sRGnKhOURjGlZMLvOfDTv63ytldVRltmyJPLvXBhtPIvs/XtBqPpSsvLLf91gnLRDMCKTn99j1IYsNpvsuCnZ8iJt4HIUIyAQaHPBd+v4ciMSQDyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(18002099003)(22082099003)(38350700014)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ecfmE/k4mJYU6u4qdwG+94Hi8w8Bk1MIWBwJcLmxynw6e1FLj9HJKO3b4inM?=
 =?us-ascii?Q?KbHiicB622KckvqH5hAETYWMs5w9t0NxOKJ7p0BXSCED/u6Ml63DPBkzdt4g?=
 =?us-ascii?Q?9A83ChDmmVUFrY4U3DCpgUEPST7VtCCnVBKLWY8qsXCIYelhjZrx4Al5b7nX?=
 =?us-ascii?Q?N/oxbF6I9ua5TnxAYdJ3RfRnu4m+SGILFBFZF28OA6dzPd4w6PKz2kTYsd0T?=
 =?us-ascii?Q?L9Tj+wAMrBUd54aKGsmNgmLfqrUQMWloLtqg+q2Uu5q2CcU4L3fX2efCDpzt?=
 =?us-ascii?Q?GtvN6wVvqpqcO36r5oeNR7CuUJlx4tADGlsHxWPN7DcSWxkw8HYHIM137f4l?=
 =?us-ascii?Q?uSGONw+BpzmFW3HUiPLXghMkjMSpLfIFKzg4AVy4pv7CK3GDl6M24z1uMjo7?=
 =?us-ascii?Q?I4e08ITvHzrIvnkctqpTeOHwqkVEjrKcdi0yF3G30O5LawA0OvSrintZ5OFs?=
 =?us-ascii?Q?mKUDrZK84LynecFiXDL/4Yqsd2UK2CDeJCrMBSWsQ61gKSY9o7sFQ5LgT4dQ?=
 =?us-ascii?Q?zu6JT7BDY3mYZgL+3zv7j7ACVviKZPcLG2fyWEW7soXghBBj/EUqlzgGyzJN?=
 =?us-ascii?Q?mPY+kQPEUZpI9EZUw+T06uH9yUpdE9cD6MnKo+yZ9EsQhTitYak1H71N6SQD?=
 =?us-ascii?Q?FDfDWcWrv0mfHGe6RKE31DKsu2xoLn3Z5W6K1xyaoZHlvB1KCDIAo5WIIoGM?=
 =?us-ascii?Q?ACyWYsURnCNrqdur02DiGyN6Tgvc03jVRxNAf6yxcRPGcsbM3Tuj/E15WSJ9?=
 =?us-ascii?Q?GNYUll4rjKGUlw5gqyMoHJHXSANZLAwYp2SWiGuonBZXUERSb1fs1fiH+GSv?=
 =?us-ascii?Q?oaqyVCESO9DiFN4xTzC1+Etb98eO4MofoVW7aw7mGh+DM0moy1Q+RNtKwFG2?=
 =?us-ascii?Q?CSJKSFRdi0oSoHDJdharanetd+TbYCNNwMi362l0c0ZjraCR3viBroO9YLjz?=
 =?us-ascii?Q?S1fz8K6uYIc20GYr2IM3JwjTVz2P6Nd2eZZelyvO/KzmO/2pa6b2S5GkYKwP?=
 =?us-ascii?Q?tB8ZigQI2pfKKqLN6lAb17BiH/L0u6SkZP46OhuqZqOHIt2ti9ku5AuM2kXA?=
 =?us-ascii?Q?Yeq+HZB1gl1cnpbVb01NqYd42mtY/a1xVBnbOhDFP3zREenvii7txqp85lmp?=
 =?us-ascii?Q?1WPFKjxbzkEn5U74kC+BhIDLp/ujLeBV53zZ2XMJQuQhkUCaSNhcBwEKcSUf?=
 =?us-ascii?Q?+RhriR18a9DlbQoWFNWVzxCLDK9/bHOAQKyplsIJDt4wGkzTUCGZz9S4ywTc?=
 =?us-ascii?Q?3Y0Qz7HwFi45JOzofaIGh7p9+7kuWTdioMPKQhQtkurQDxzo6D7XJy+cRxCV?=
 =?us-ascii?Q?5gcyGLUqwQHHOdBsMkc4BcVSwvY9YfW76lJopGqJ/6nUkhQNQzjEe10ll5a8?=
 =?us-ascii?Q?owviszU4FrzrNvf6RauH8CIyvQQdnrCaWG8H0j4JvKwYGIs+Wxw72jewWjRG?=
 =?us-ascii?Q?zw4AAZrMn0eza4rosR5y1n0X0KigKw7jCm85VpMJDD2auQqEqlmn01jlvT+q?=
 =?us-ascii?Q?AzM8ZUYP0BzFXnH7zRHusxFjU6tz+0XChcAFamTNEFVlRT+nCXmJb7HNfZVl?=
 =?us-ascii?Q?3zQZqi2BGxDPoDsfGpl6NPNAvhc5bUBDSrUFAxnNojji5i2ge6jjYLqOrxUd?=
 =?us-ascii?Q?oKtarhIoJuGtoD2kCvJfCckPTC95jCGwlioZhrzQhrl6vAza/hfVhTa7nU9N?=
 =?us-ascii?Q?w2pb/02mkJ8fz8PiRiCsPQfYGfjfc9ifpvSOZNJ1ttWy7bGyIIWuahbgMby0?=
 =?us-ascii?Q?Jvwnt27Fx38AbjA+2KkedVj6hHy8p1w=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beba80f6-cc92-4070-7ae3-08ded0fdec40
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:03:34.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXMPhnqgqXJhpMiW7Eg1TnkGM6IcgMHIVwVK+SHTye2O6xDQjv8Ov4zk6Pnl+wj3R0CcM7Pok35TPA/wchVziRXJuAYGS7mgerpixqtq6j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7296

Two independent correctness fixes for ftdi_sio:

  1. Retry transient errors (-ETIMEDOUT / -EPIPE / -EPROTO) on
     chip-side control transfers so that a single transient USB hiccup
     under bus load does not fail an otherwise-healthy one-shot
     configuration (e.g. a latency_timer sysfs write) back to
     userspace as -EIO.

  2. Make an explicit sysfs write to latency_timer authoritative so
     that a userspace write is not silently clamped to 1 by the
     ASYNC_LOW_LATENCY tty flag left set by an earlier TIOCSSERIAL
     (setserial(8), libftdi, certain tcsetattr paths).

Changes since v2:
  - patch 2/2: lower the override notice from dev_info() to dev_dbg()
    so the driver stays quiet in normal operation (Greg Kroah-Hartman).

Changes since v1:
  - Dropped the urb_defer_timer_ns and low_latency_defer_ns
    module-parameter patches, which addressed DMA-channel starvation on
    a host controller that does not enforce DMA-channel fairness.  As
    Greg Kroah-Hartman noted, that belongs in the host controller
    driver, not as a per-driver workaround in ftdi_sio.
  - Dropped the per-port low_latency sysfs attribute and its
    serialisation fix, which depended on the hrtimer infrastructure
    introduced by the dropped patch and have no standalone purpose
    without it.

Earlier postings:
  [v1] https://lore.kernel.org/linux-usb/cover.1781744946.git.naveen.reddy@ftdichip.com/
  [v2] https://lore.kernel.org/linux-usb/cover.1782121274.git.naveen.reddy@ftdichip.com/

Chinna Mopurigari Naveen Kumar Reddy (2):
  USB: serial: ftdi_sio: retry transient errors on chip-side control
    transfers
  USB: serial: ftdi_sio: make explicit latency_timer sysfs write
    authoritative

 drivers/usb/serial/ftdi_sio.c | 65 +++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 7 deletions(-)


base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
-- 
2.43.0

