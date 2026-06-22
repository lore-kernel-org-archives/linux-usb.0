Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022109.outbound.protection.outlook.com [40.107.75.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4046839FCB5;
	Mon, 22 Jun 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121457; cv=fail; b=J58pX600dQIqOmkYFe3ZD0PjzPBNdxAOfzBfNp5XaLtVyVU1LnUMGxswizt0F/ISCHcOnTmoKhjMVec/ddzOY+Vc2r8nVY3BRd+frGyJhukgjIjjy2hDvd/rDSlHp/Uc9stEQtys2eB8XxcfO1HRWeUCVrrCa3lVBWHvvQIOFMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121457; c=relaxed/simple;
	bh=FMlBAPboAELgxYfJ9DsOt2mO5HHh2aNlb3GY+Rw55Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N/4vdK3yIsIsgx12sorCggYomUcerjrrPBlMHQf3UC/ZRPuHwKc0ZxJbx1Hp7EXFnIabK7aERg4/GV07X6sSZUeq4x4wAm/ghiw2dJEIryVi+AJ4BCiM/okewjOS/T1SL7k+C32WOz1IFJ+qxPmDzcNI5CQ4aOOdw+NC78YSfI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=ZcUCwdfS; arc=fail smtp.client-ip=40.107.75.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="ZcUCwdfS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR7YYisRXfXd+TpglHKjBVLq4GyvNQxgomuF4k0ASlUQGrWXrKV7Q0xDOJALuDk0IfVRBgb6Ah7W3RTe4iuO/Rg0opBmLanLBsLZ/OMrqeYJI+/K7nMdizxIOcdeBNQM8piBITpmmkya7vCmTquFWB71sutZAVaHu/jP6wfPFqPPq1sE+aDwTyzH4SeqnhAewjvnESNkvb4CKHQTCQgoAs1l0Ow7+VTzOVoCTEkZPaSZ8ir6xvf7uT4bPtr7daGOwxvd5g9MehNOkwB3BcaXf6Uecem5KKS8a/6Mc97rzm8JtgjUWS4pwqLoiXmu762ilTwRiyfLq0XTEVHg/R9pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3yhfa1jDLC89z8dOXCNb8JXC/IXC58iOh7qxHJGkS0=;
 b=rnI0mjvxKD+Q8ZNk+IC1p+ZmOuDQAxwNuattieL0RAyNJ6DQQce8M3av0avKpuD6pZ5hClVDs/krpC8GMpOjt0+FOTGHmeHMwjvl42ti9Zp2opGCnmCfsz+CZHP4zcX/uP/nqlAZao+uvtKXAXNMnsLMM0qozq7Tb7Tfcr8dLQit4Xan9jXZ6PUwmhhJajHFK6kqDC/6z0YY3mVWDINjDhSsQ3oR9I5aQT3b1gmnzSNW1jfBfO6Nn+OE/iPb/xqj66uSHskqWYEpXcAN2E52pUi8cCk82/mcn/EnfYdzRmCezy0oRblU+K8lMHVUSlsXE3sk9Im+tST9tGq/wzuM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3yhfa1jDLC89z8dOXCNb8JXC/IXC58iOh7qxHJGkS0=;
 b=ZcUCwdfSR4aKJysh3eeVFV0z3h8ks34WC5dfLOWRb3mmf7eIjfwqiFL79NVbAxuHeyrrXsrGISV4iigrWa2aBz7Krw1RfC/oLIKPHSuqLB4dn66dcwAdkKr7eF/QAc1Q3C3Rf/Nsd1maVqWBw8tKJmpZG+vvXBh07W0r46LWEdbYflP/7n+dgl33tADY2iGL2O647lHndCuhtTIeZ47UPgx0JpTIrPlMJxLDM8b0TqX94u9UnhUzq3XXtQVUsl0Tqbkg11Bzv6YaCPMQnAitBRhPzGWcm66YQf6CCKZ0oY3x0iB4MRUeBPsVhrdNEuF58ndh6NLWMlOkOQ8R4ykDBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SI4PR01MB8053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:29c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:44:05 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:44:05 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v2 2/2] USB: serial: ftdi_sio: make explicit latency_timer sysfs write authoritative
Date: Mon, 22 Jun 2026 17:43:40 +0800
Message-ID: <180003edbd4fb3f6ef2b87551499698927b1191d.1782121274.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782121274.git.naveen.reddy@ftdichip.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com> <cover.1782121274.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|SI4PR01MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: c9dc2543-0507-4bf0-df84-08ded042cccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|4143699003|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Llh2LN0fooaNiFU7PM7uqcXEPGuSxB6eSH37TyAAltZeoHld9LuaRb3Idt6U2NHSaedGWcBcj8r5cQTsiSlB7vHaRmf+OfMuAQN1+z8yS4IsRWkRvzWmB8i57+WAyJKWO4w4PCNgwtHW3EEjbPrhBvsgSZvELdWtZaBrZ5n2BNpd8a4qnxw6nyCDQuXpRmgQdCbSc5feGGPGzg6uG61dmIWEc1sFUDv6uyqNM4nqXQp0jxQ6tJ9QOVe9KacWA45vpsaoBPp7Be7NakeLgvypFJJkPywxQ2OyxWpFkZrO9dTpSNtvaSSZnxjdYG9jpVfHlPEqZwM2moVzStvHWiTX4qkBCq1tvLtsknzx6vLfM9TmkTyVY0rVpU8+KGUvFC6wzkrcYT5BmAfkbWN1RLl3K6u0WvUQTezb1pR6n9Lhn0H1YZc3klawjgaXVlsG+5rVthx4I85M44xvUY7LvAj548Gym+ULqIjaEYeDh+LaTG4uLpG5k355qkNvNGLKQWgBUxtPEyCygHy3I0UZ6GFXortHduVVfW+V/vfgDqcG+eLWPS+yxKayyOsXsYfAC6xxpVn+Zc8eJFDg/jEFc2ZLJH+HeEEB5mtqa6zxTDYEGnbkywdbJnL4eiqVQIb4B9XktDocickj/vfmQXZNKaFEMpP6PeW+2SDnw+Vah9Wk8v+i6B/UZ2Lgrwj00OaTU4bv7pmJkB7QVSdcznTM8TKZvkdcRu1JR6K9s07MAeM3qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(4143699003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Hv5L3oLdpSEKDSDtbMi5Bie+yWmskhybtAE7i0UvaPJvEoShKGpZ6NNaeJD?=
 =?us-ascii?Q?m9g3oY7e797Ey3t/x03XeVp6uSoYD8uLgdjntILbm+0NPYAkb/WLVMDNbPlQ?=
 =?us-ascii?Q?yix0vhUoJUzC+My/RWpMrevcm/BZxhxX0tsG//dl/aDet397y8ZjHcpVjGCz?=
 =?us-ascii?Q?M5QQETQBdcjij/WNB47ieQRoWPPDhCoapkbflie1TRQAfUIYFMVZpCWuO3mC?=
 =?us-ascii?Q?IjGhLVVzao6bBD/UZTpyHtOi5V5GcGUSJbGzdxJGi8krqtRuz9GwpHjcmZq5?=
 =?us-ascii?Q?UJfhF7KZqF5+5KUFcApUXevSviLvCf1JrdYROwZXkWX2xQLw8ScrTcLpWZdw?=
 =?us-ascii?Q?DvGSIPNRD4fhgcgfUdNLpv+9i9r4XbZRlSPBZTJNWrM1ivfnhl6Aiyr5QP05?=
 =?us-ascii?Q?fnqyDwEEeJ/B4GBMtZtNRSHxrip6XOFjUpXccRmZM95tZDFxRHh/WruBfkwc?=
 =?us-ascii?Q?hbjSFJ54BHZk/eHQqxEfGYVHHT6CFIyrWyHrtAHoagmCGtcIqX1niXwjLZAm?=
 =?us-ascii?Q?OYCFhJpXmWkGXoFvbWnK6jUxme8fh6OmKq+uekxh3iFPrh8sBYTQ9HSuiVfV?=
 =?us-ascii?Q?3/3M+l9nFz6YEcfHcTwI9ubwJkFh7MPzY+BxXcn+53UZSgjSuDmU/bVh1pZk?=
 =?us-ascii?Q?csuireWbrNmbqil9mUFiJ/gPpysfN/zPiN+lyn0DpuSfGYPy/E3LBTHSPnEj?=
 =?us-ascii?Q?7LQCeq69A4WEdvTWPB3DV71iXwha9jSojjT19AYxKy/ypa/Io77A6WTxo/5E?=
 =?us-ascii?Q?GbSI9+6fe2QWkOCc/187zPl3RoQLvqPIPMFm5007cHwk4y3rcRfzeDURR5zJ?=
 =?us-ascii?Q?emmqv3ciYGjSwWa8xzC9RGqFX1mLQB2ytsADcs/Nvj84rGOPdbDnPbmIeLs9?=
 =?us-ascii?Q?g2NA9PvIHOHu+k1hevpyhnTPxH8WSkMIvp6nL8lHOVOFyvwS8bcQfAIZHlnK?=
 =?us-ascii?Q?J8xrXapCRq5sXp/B8oL7Woa7NM8F6K+D7QwcO2mDWcomBUksuft8kHtaDcC0?=
 =?us-ascii?Q?UbajGYZOFu4TvTP/YM57/YZ2h6xyeolRKSYn4HMBLAKJAHO+Ii5emZEr3Lb/?=
 =?us-ascii?Q?LL/85dhyIiBTh7xJXPIXn9ORfzHrb+59bH/38AWXFK0v5EfQ4q7q/CxeazuQ?=
 =?us-ascii?Q?OrD4ME2QSLoeZb6cX0QMuagOFYLiB/mig/3CMllvbtnZ5JDJsEUoho2A12CK?=
 =?us-ascii?Q?5TBfQfvaQd8fPDt3urkPevth/BhkKs9ukJrgnX1OyHM+c46u+5ltdkIN6xf3?=
 =?us-ascii?Q?/6wIJm9b28t1o2X+jk0Spba7/YK5l5b8yc1VYekoB8uIs0SG/BPJtErEMrTU?=
 =?us-ascii?Q?fZVidizuRAHCYsAOnwXADoyty6+0Ibr7iPmG7SJQmtE/jIevtIpXvtWKpiKk?=
 =?us-ascii?Q?whF5gJ3fWGK897xv2RfqlM+pOmhkcjjV5BBeTDKDOf8/g4huRT76bHuw22hg?=
 =?us-ascii?Q?74IqsX+jcjuBs8Ks3pysaIXswjzvGnIC6iKgEgoob9oe+iFEZXIvoAea4lQy?=
 =?us-ascii?Q?gMpQQtKIx8/oXOAeJ1VBIrXXol5MBWmIltc02OULU0uslt/PtI/2n8xDztc3?=
 =?us-ascii?Q?5wzUD98ewOJudpB4LDzcxU0uBzUHrr3YZ6PbPEB2l+6xbrInsZ082K0Yx3Ma?=
 =?us-ascii?Q?2+Kr4aLGe0retAPRTWOvRUSUishHJ927DV1wOiR3AcETaeTivkD1749IZ0M8?=
 =?us-ascii?Q?7KXCCl9vnvs+DKm8hqMC1+T62CSqRfItrk8+l3o98VTwvGrjdiJ0uFkHv7W+?=
 =?us-ascii?Q?VTJ5LC3U2V89HsTB3Lre0yc02QusIco=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dc2543-0507-4bf0-df84-08ded042cccc
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:44:05.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEPzDQ729Hau8S90HjgQmSzw8Zpqu8JNCLqUa6VAaacAoSMpyNZJzH7PtucxKGMOr1huMMPFoH2jhzO5iXXmdzvl+r00/JExRdZvPhj7azk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR01MB8053

write_latency_timer() clamps the value programmed into the FT chip's
per-channel latency_timer register to 1 whenever ASYNC_LOW_LATENCY is
set in priv->flags.  ASYNC_LOW_LATENCY is set by userspace via
TIOCSSERIAL, used by setserial(8), libftdi and certain tcsetattr
paths.  The interaction with the existing sysfs latency_timer
attribute is surprising: once any of those tools has set the flag, a
later write of "16" (or any other value) to
/sys/bus/usb-serial/devices/ttyUSBx/latency_timer is silently
clamped to 1 and never reaches the chip.

The store path is the most explicit way userspace can ask for a
particular latency_timer value; treat it as authoritative.  On an
explicit sysfs write, clear ASYNC_LOW_LATENCY before calling
write_latency_timer() so the requested value is what the chip
register actually receives.  Emit a dev_info() so the override is
visible.

Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any
userspace that previously inspected the attribute to confirm
low-latency mode keeps working until it does its own explicit write.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 7aaa7fc1be71..e7f13eca7ae6 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1683,6 +1683,23 @@ static ssize_t latency_timer_store(struct device *dev,
 	if (kstrtou8(valbuf, 10, &v))
 		return -EINVAL;
 
+	/*
+	 * An explicit sysfs write wins over the legacy ASYNC_LOW_LATENCY
+	 * tty-flag override.  Without this, if any userspace tool
+	 * (setserial(8), libftdi, certain tcsetattr paths) had set
+	 * ASYNC_LOW_LATENCY via TIOCSSERIAL, write_latency_timer() would
+	 * silently clamp the chip register to 1 regardless of what was
+	 * written to sysfs.  Clearing the flag here makes sysfs the
+	 * authoritative source so the next chip-side write uses exactly
+	 * the value the caller asked for.
+	 */
+	if (priv->flags & ASYNC_LOW_LATENCY) {
+		dev_info(&port->dev,
+			 "explicit latency_timer=%u clears ASYNC_LOW_LATENCY flag\n",
+			 v);
+		priv->flags &= ~ASYNC_LOW_LATENCY;
+	}
+
 	priv->latency = v;
 	rv = write_latency_timer(port);
 	if (rv < 0)
-- 
2.43.0

