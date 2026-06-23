Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023091.outbound.protection.outlook.com [40.107.44.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D643C9426;
	Tue, 23 Jun 2026 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201825; cv=fail; b=QqrUlTJ5DgDmkhoR7qWZxctFrE0b2xEcFRz2yfVI7PqRZw994pNoq5A+m6YofRIx1986I5IgYZqfsDhEXtPilm8Ha7EnlgtCTO5ph5o66T2Mxdsdwd/msw1pEXKGrl1AZ4OPryVq7D5J1pp1a2svHkPW59yxRGPKXTYmB2b4NtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201825; c=relaxed/simple;
	bh=GappumOquWXl4GjF7arwFwYyA4cDhcOeVayGO4eahCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fczwzxXgHalTRCB8kealkKILcRxHMNdcDRyREQZSBUdtdfje1Iwfhjk+Ufc3cL33jmEawCbOvmsRa0eFv+ogOym8zJrHbVNq2ZqjfiubeP9NKs+m0gbjWk81oWxKXvx/Weu+IK/lv136lW08SPGzR7ag9qQX+se2mz8ydZg7eEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=ZPPvF7fm; arc=fail smtp.client-ip=40.107.44.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="ZPPvF7fm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvZh4zZUmNPJKBNGO2+gJjQPooajFcp4yDloc5mgHR95smGbe7kDmBu8tn8SDZ62z9yx6WWnt+JpE0PQM3Oq4KYSwCy8qE7y2nvBLW8yecF/uWtIwM/R314aRobe2cxkv+z8979rA4t6abUUOBG6NN90Pb0jSthRAMACzZb+1xG1NKjf7MqG4EqUhKfZvnuxK9ogPh68AwEC9+rUHYhME3UJ0HjyR+1unj1cGakVwceiyw9k/tB3/o2eO/ODfWMPeFMzLj3/8/jcKZwCzRm6ZY8v2rt/lnMSnErjCMmGEDjWTpHliq0dBaK1oC17kxzV7lUE2QkDU++F9dIU3nMg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssuino5CcXrrt5gHymG8e8ur8qW9kjngKleA7qs8lLo=;
 b=PY4CBK4OkIUCXpSKhN6q5oXG9RxmyfuIVtwW7dlPAkgkKF/S2u4cDe5wQX0pGaQiZxXp1fkcMUixPonGfGLCScXi3O3v9GiatnQjEm2Ck7UofNR8cvLy2WRrlqdpCX2PJpDpxNZjMzESFHYgSofU2CUm/TYxz0NWC4OoGffTdfOAArZAzlI2lo6ctOKeB2xGnoCnq3U2ykirAguftATa4Hr6EgV3E7eVhtIQsRgv9F6sqICir+EpSJgIbds/c3Fx9xYaYlUTJhxfBCWfSOTNPgs7nnW/oZszkRmq4nFsk7jNJrptqwTEyB1RzQMQDT3iCeNPyJHDYi50KMmkvZ9UvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssuino5CcXrrt5gHymG8e8ur8qW9kjngKleA7qs8lLo=;
 b=ZPPvF7fmk8Jo9LoYSs8BShSH1eaj1cGGd6SsivyNjjc7Odz8zPgqUQLZz1f8IC/wt9K7JbKzLB/RqaTaC2t9xZk07HLV24yg3PuZZuxM5j+WumywgRAin3xnKxBiujX0D/VwVOs3c7eJaR0NFC1FWSdQdDdb82UxygwbG/TQSgqh4zT3ABVCdpUCHnpqxo6TCIp8k554SG4x2DcgIJ0sQ/Ju5zzyFMkagGwuNQrh2NCg90GroQtP/HHGtg//Xxh0pRUTuXHb3511NsVQFks83QNcgo7gx490wDAAlcUWsGcfq0KZ8gvH6S7Mv+IqzHlJsfhSPPu8xsAiyHNEgLQ7iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by OSNPR01MB7296.apcprd01.prod.exchangelabs.com
 (2603:1096:604:318::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:03:37 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:03:37 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v3 2/2] USB: serial: ftdi_sio: make explicit latency_timer sysfs write authoritative
Date: Tue, 23 Jun 2026 16:03:21 +0800
Message-ID: <c1956d7641cd96f75cf2534b65fe9a83d0941e50.1782201674.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782201674.git.naveen.reddy@ftdichip.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com> <cover.1782201674.git.naveen.reddy@ftdichip.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9dfbe16f-bc15-4e57-4f51-08ded0fdedcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|18002099003|22082099003|38350700014|4143699003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aSOqnfezwh+5QW4ZIW6D/QKgKHOvtIT/a7eXt5zNrAKrOJ7gOCRyjXwhGTfVfg1jdkZWFNB5x9dzkBuc9TmQzfp8LMhFDe8+zDB0gl7d55rvzYK+r/Y0hubC6O1iw34cr0bjTIy6/Ky9P8uEune+DdX/X7pI/L6JrZLMihdCV+6OXzRujVzPb3YIsJtkRCB91HLS2KFAEvMao7jQ8dQDy06Djpm4AD/2my6n0p4IyIhtSRoE5IA9Aqiuoilys/zJko97UED0lMbELswFSx03n1f8R/QOO7w/eq5uYyAmtoaGjOzwK5ojmOfBtSJDUG+s46W/THzdzHp1zZtT0tIJ16DEU99WKKBMhu5RpofGg0g8ykPSqO143ty8fsMRuefnA1B0/TyKrlvbL4bY6d6gAuhEtz9W5x0UqcKW9/4htuw0O0ffO9ZJp4j4uAvswQ6rkpwA9NG1HQkG4lfHckvOSBh4Z1B6QGUjKEwJAZXT3/f1ZhXSQRWIG+dCXkMjzMes20orxJYbV0Jw/Hvl5cPV6kiWfPVo0O6CFUAkXo+sGIzttt1O74S9d7EQ9PV4MO+wYV3EKo+dflrmvUArev1LxpTicXxQso5Rbiwn6GU/oUQo3JXkNhfgDllwbsCIGKS78LZfXa3O2w+9i+KZNCPO3CHpkyBz2Qn52CJnJaU9J/o9tEoarWvRAX4Ixk3Y4AktQiLYn+Eukm5AY31R0bHuTe+ZhElzxm+T9uHcqqIaQuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(18002099003)(22082099003)(38350700014)(4143699003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5QK/UUwrAFMeLLgmLjxOKuXkZ5j+P9JekvVD/NOje5gEA5mYcZ+TbN5Qi91h?=
 =?us-ascii?Q?bmw3g6C7bAuSmKRRcoNRXC8HAFMR0EtdT98Oc27j2qeRwSeBH124ETCq83Zs?=
 =?us-ascii?Q?Q6tgEx3idTaRGHxJiLnUcT3Vik5tCl+rzuH+eOzRhT/by0xKGuOjO7dSBfEh?=
 =?us-ascii?Q?6hSEWipchy9bbYQ3CvYVKXm+ILzAr+XjxNYFwxCz3p2+9zsBniZgX0XAaoKP?=
 =?us-ascii?Q?SsL+Q5b993rJzlSNnGhJ4+yiUJORsELbRXrTZE19Ju1nvaVKBWMdwWqiGGSA?=
 =?us-ascii?Q?2Ou/AHVJZdQrg4YfzKPxMYjeSBo6ayBlssuNK/mYUCxECgs7RJ7naSnHw+m6?=
 =?us-ascii?Q?dvdXwlDaWIy72Rk/OKGxZXK5vJWTlnaqRX9P7CEfUT1RqoP73xiJcm//bRGo?=
 =?us-ascii?Q?uGJE68abwBdKz+JleN3UMc81bFn3Ihhdhsqpz+qe/MCdzjy0q1g6qdbYL3Ss?=
 =?us-ascii?Q?z6PG/w0RX4tz7KuePRLSVirNMRRm43U0ffOIGAFuWY1AgU0iX/Gn39TNaDO+?=
 =?us-ascii?Q?UrcXwazfUmq6dj9TyLfEUXU5W0//bSFOfrDZ4Alg0KXuRdeNE8URn/Pb4CAR?=
 =?us-ascii?Q?T4cGAC5bRUNQ17DY6xPB6/yOvJD2fXbvkfHxiTJxx2ouk+jFrFyNR4ZRepfp?=
 =?us-ascii?Q?HjBFHow+L5cQbQAU7pXVXqUvf9eM9cBjdfFGzuRGBlJ9WJDHdHy+q8LMwEol?=
 =?us-ascii?Q?AobB5F9A1y15dCBYeHFtSZrWOziG3REXLSUAC3KbIidlSUGmTH8LWq44WOJ9?=
 =?us-ascii?Q?YUhxnm9beLEyF8zFlmgKTY1c/jYm9zZ7PSrZGiJ4xjz52/+5f5qxlHtbK3dt?=
 =?us-ascii?Q?1FhQKwi+9iCiXloaSdF7vaVqNoiT6JlgVaoae4tCE85HwpxohyaID5jiBhdl?=
 =?us-ascii?Q?TxeSDq+YTWbeWvHifNnM+BcQ+pUL/u0fkBsuxdydyGTAsgPLpkFWDnWGxlc4?=
 =?us-ascii?Q?ae4GcpwmTClEjcvXjW4mbNf7UKfebkPdxoVmdRQLjVRnYZY7+y1FZQR171H7?=
 =?us-ascii?Q?ZEGKJD0ctTmTsh3qFDSAWNM/eeYnvi5XJSZ5TfVIQ4d/VArkfH5O2BR50Vuy?=
 =?us-ascii?Q?68AzcwoMNpfDZ0+Qn7mZNUjsN0bXtkMXv64zxTZZe/CO/jB9Uw1ZJTwj8caq?=
 =?us-ascii?Q?UOGIt4YuTA7yik5d2Rhvi9BRPMTOuqHCD2F7c0w5KDtCz/fXotLYd7wRiKmg?=
 =?us-ascii?Q?HN8BdHNPJoS+pTWwo6vVb45CaiO4kaM/jR6p146xIRDqicmrMtwwfGjt7C1j?=
 =?us-ascii?Q?+IaFxHaa5Djgwkd2aZYJ8o/2ar3WPy3qzfBiTY810r+9OmjgH8DEciUB/zHL?=
 =?us-ascii?Q?fXjN08AUjIBZsL4vYvaMgLPI/vbxJ4VJ+QH8XAkwUSs8FxtK5oot41rHs51S?=
 =?us-ascii?Q?pt4ZxxUXph198p5/xJErD1BUbzap3p9MAftstPFph80AKadHx8mEcgjkRsNy?=
 =?us-ascii?Q?OOxGJG1zurLCUtmExe9LxSzBO+EyyDNL3DGvJlxsX8xSFtkVZP6OBKxw+lJ7?=
 =?us-ascii?Q?c3Dw0VKQkKb2tXkbQHa5MsNS9IVSWVmAVNHgrPuxq313yANnQwhavIB6n6q6?=
 =?us-ascii?Q?YN85kZHIW7wDrfysNFhq93ZKWxCxsedRwQK9Ll1C40BcCEDLl/5q1ns+znS2?=
 =?us-ascii?Q?/JkgQ3Xoz0LRe95/ejpCVxCyjWJun0+Q7xW6cyjEYrp8cUODFBUgg3PkYZrv?=
 =?us-ascii?Q?edwwnJMFDGEKndfy+FP85hw2HuWgOwrEZhY6TqNEkdzcpo8XDX1RX1Is4CFV?=
 =?us-ascii?Q?GHIohdfiWgi+2P3+rHubSGrRqmzRo2M=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfbe16f-bc15-4e57-4f51-08ded0fdedcb
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:03:37.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBBoDE/m2QjJXnAQ30jY9QxLGVhpx9PA6KTgLxvabKnQlIL6eb5oCPI3/sVLLmYUpW5z1OkJmwHHZ3PHNIbRD9RsfDhlClWcpALD22hMZwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7296

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
register actually receives.  The override is logged at debug level
(dev_dbg) for diagnostics only.

Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any
userspace that previously inspected the attribute to confirm
low-latency mode keeps working until it does its own explicit write.

Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
---
 drivers/usb/serial/ftdi_sio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 7aaa7fc1be71..d2547ad76423 100644
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
+		dev_dbg(&port->dev,
+			"explicit latency_timer=%u clears ASYNC_LOW_LATENCY flag\n",
+			v);
+		priv->flags &= ~ASYNC_LOW_LATENCY;
+	}
+
 	priv->latency = v;
 	rv = write_latency_timer(port);
 	if (rv < 0)
-- 
2.43.0

