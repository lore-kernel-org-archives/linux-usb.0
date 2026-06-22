Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BBE36E467;
	Mon, 22 Jun 2026 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113964; cv=fail; b=rZQCYX9qcqyzkSJO2HJVFj+VLxG36dKWuw1v29SJfAIEaYLscF0hg4pFpGHWRrwXEDHeAhS8WrOzexCGicCZyj4e3rE3TNKQzihUURLIsY2dBQFx/5/Yb1isPAA4VvqENjAYvdSi1QK9mRKyAuhGZtK9KCjaPvpp4VtuLhsa+GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113964; c=relaxed/simple;
	bh=pGo6IeLLQqY+wTZ35VEz9f9ipEn6kfye/M7/NjjJ2+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UEfvFldDA2wEHecuza2lJYDjc2qCLi/S66y1J/LyNmRlGiKSIIRt37Fxw6uWCZDTkP1jH+FKWByDw13TCpLCSY6tDnG5royzibjHutafiGaScFV8LchUN5WuJ5pUdDNJeCwUi2A4H8+HYxcI7Hqkyk/OTV6zPYwmdMv9wxUg1xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=Nwd3jU3u; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="Nwd3jU3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g55FyprME5fyTdwr7NNybuGbH108n5kLSerNH6rGeFZzMSjIQIKPyJkQ+eex33BUve5krFYmk/cFBzV/P3Q/qjIc4gPcAi4RGlm3jbEm72iI9c/fZJWvs3zyISbp8yDpROMcg1PFeZPk0EiBNZ1MjZJ9DJpNeEfnq2yqU7coSFcpIoorOjwAZ9VeuLn8c3ANU2C7zEGWSqy0oAkHMazVKOkdN5cR4sxZkm0cp8bUrT4FLcZ/UQsoC2PeVKtFcXKPincumABmPAqWa9O7aBXRVumJySnjPzWeALZPFEH7brhSs6mVAw/o4633cowJ+XYeHJ8Oowm8gELHIYvCae+lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi9FQx6LqCQuyU3YtfpBJtxRDZzxtEodEPnKQBTBivM=;
 b=GkucUtAwAbVYtoQfArDvaK8QXNhUIOTyJX3zNhdjZzjlkL5F3kXFf/AWrGbIE2qanrC4qxKHwWhLP8gaXj/Ze2GAfbm7XLBd2JZXGJ7cXp+0PmpAHKAAMsKXwNz7U44TSMgrhWgyoi1DmbJZ45frjK+TM4MzpznCRBBrOuaoGmpXImODuAMHITtzRnIXa1OMOvRwJ/Uwm1+RxKAGciT9fpRtgufvIzFvnedgL/TtOYLjv6MpXhJQKLvrGQY9+NKXa3ZCJf5gV7jOsbcgwaCcZCSO0DiOPPDo7z1qMP3pKmRDcb38UcpiNHg6G0aBkEjmka9SFbweRNlsr0xDfxoh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi9FQx6LqCQuyU3YtfpBJtxRDZzxtEodEPnKQBTBivM=;
 b=Nwd3jU3uuivux8tmTqi+hyNNKazJZYcAmdw7BAJ764L7wJnB4jLA5auatpADj+Jt/MehBXs10hWvQgAYuC9C+uJTa43rTzncx8SwQn8LvBFs163ZAezg/UPGJLBDEVjOmw4o5pIT/fV5BSu0ELew/aAOFVWV4inl1Or5AZB2k5kJ4fj25tSjlpDoFUSr+VICY10S1rOfKj571mr8+8RBxVOT1nfOmpP2lCXzSWCHPHATMLkz/eiGePIX//ffRIuHjHXY9DHvsGwDu1MMraP9k4qka5zCqWofs2l4uP3Volb03rSnGL3n7EuqEscLU/q//I2jZfqrYTlcgBJDelLGqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:10 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:10 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 3/6] USB: serial: ftdi_sio: make explicit latency_timer sysfs write authoritative
Date: Mon, 22 Jun 2026 15:38:36 +0800
Message-ID: <77d0e27269cd78fb0e1288b2ca0f5500217882f6.1781744946.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781744946.git.naveen.reddy@ftdichip.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|TY0PR0101MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: f440e834-5b35-419f-606d-08ded0315913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	m19VIfKt49bqlU3PCDJ6V9ymTzzDYtkQnoA0Nb8w49FBsZ/NYYHH5AUtLTG0CczaSPVIOK23BBUl7YCC32osgd7svpdhxnVqtRLNkGkx8Cvw4zi4838SaLhluDxmEzUkv0w8mybLrdmLAMeFuXb5QXlNjnq6Ron8thpra8F7sHi0S5mGh0lxVB97a2JF6pWM4tP17OUmdrzjj6GDLYSWpBXXrH4MQEqFoJq3RtUH2AJor3rb7vPU8cA+ybNxw1LffFokuya5uijw+cmSnzbtANJCNtqWIZjwCtBMlJbwJTYxOTxxo2mubCtHN4DxYWlopo+3qlP7EbtlePp8/dPET+bYmsw825jfnKRu1j44t5JerV2gACKzo2PQixsNtlLM2ivwju6XpG7VyqZO2GH41scxUYn9X/THlkgZPWjhnlMbvaAkg0yImKvHwrLnpxX7JStFwJwAY0lwDbyUr9SBZWVa85sVHyP29sHPQfcF7ZWt+20CpsZJT6DyREVu3p0hN6mi73lG3shLU5/wQkIHsDQD8f1gI3Pxew0RkQJBvXLwEno30+Kmvhi7C1bNd+YNOLHqB7PJzDHzQnJKU5Sx2qRrTzGNr56eOBYH740BdQEAwnzFvKeA8q+BVdMJnfmHRxdKRNJ58+Sf1m8JeCmwgX14PMsg8p/ADDinWbdgve6gr5SwujSS7cAM0dB0zEriNrOSGohIMEdvYyuMmE6H72YcsXed5CTWjiliYFH3+fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RlY57nl8SpgDmpDC6vD3KnGEPqOQrlrCCDu8qjxPB9ED7g/2USwq0Rutmo8j?=
 =?us-ascii?Q?YMxychXSOoSCWvX+RAeeoVkXQTDa+Ddmod8WOdhwnUUTGPyuRHgIOQ3jUH9e?=
 =?us-ascii?Q?uRjULQl7ipX97lHpAB/krXwjzKNSrZ1bypSS73Gy+Ro6e9/aSpeMnt/0O2ms?=
 =?us-ascii?Q?7LbL0DUrLE9erEhWm+UNI8bH5LZa2Ts3Uu9GPupfFtDAQBEsYBitG4wdc6DS?=
 =?us-ascii?Q?mAh8FdakEVvCIhIfKU9vSE4zLqMqRZcYJKesovV9rTtpSNxsD0v8MrgWSWNL?=
 =?us-ascii?Q?cBnItlVDTN7hcd7+Cuo4gzhUcY+M72B+RY0aElRyDmnSwQoJdm6wWXHTnu4U?=
 =?us-ascii?Q?bT9YHVs/2OlAKLdJtN2bhymSbuWDSxEPmp34VMnfdUvi2iG0WfMGgCaBXEil?=
 =?us-ascii?Q?HLfJSQ0IWKgWbVO9ClrbN1p1+4jaRIpHRYJ404uUGUq7tmFb05H+5eIVvO2z?=
 =?us-ascii?Q?p71dhJBpDYA45Qhbw77tdg5nt48E62Y6Z+3SBz9BlUKkhON+kBlN636f+q+7?=
 =?us-ascii?Q?fhnA71fgJxxGcEQ+whXfdFjLfW36dH6Pyk/gEzT2GyBR06cuMADbpAOzSjD2?=
 =?us-ascii?Q?yDJNQClumBwQst2aSx+R1Rq9ybYMrwjOzjWD7YutOLo7cCQgFOyne10xoG8y?=
 =?us-ascii?Q?dKjexKmBUVQ6Dm65U1zMKdU+WZ+IPImwqNJ9Zg3ZXLl7NRpm+N6EOxm5eqk9?=
 =?us-ascii?Q?bmPzCmZofbVu2akRG+Ob7x8quEewf+Dm/J8L1ZcOFs3HEW2Xey+bTOEKRNmq?=
 =?us-ascii?Q?1fZ+jCu+UNg2Oi3Y3fdMIPWu8+cdpRp9kMs42ICLznu03r5yNHk5+3/76JCM?=
 =?us-ascii?Q?uPORl0Tmf0rdvyvSCBLnMZfOv72RQ0/7W6PE8DeJOGjaeXtSoSgWD7d8Oc1e?=
 =?us-ascii?Q?9FmAWYD/ePqpULl2cGga5JGdfk/QkoQjbAH7pfJigfekSmVVh6YtwTPc3tmD?=
 =?us-ascii?Q?/YigcJB4fAZZnPLgbUMY0HC6eFIphE7TnY55Sh4Je7f7fMglIt10nIvm/z+m?=
 =?us-ascii?Q?uKiOHSacArkSEQOME3bgRsJIBRS8quhnR5m16bBjzYoKYEQW802RhBFqUVfK?=
 =?us-ascii?Q?pfFFCLoc1NrLICP9cyPGzigHaZxAt++Eqb/6L7dY8ftRcko+e9jF9ujHbZqA?=
 =?us-ascii?Q?4qedOEqf1asExDqplIwXJbuf3vEzlpL8Tvp0FO4Ho1jAuaqJy+KjOkvT4T3n?=
 =?us-ascii?Q?8os5HWU5eQ1mCLarCEVPTNscSptzpOkzhX0iZ1XW2MKMUtN7avvqxo4EXq7D?=
 =?us-ascii?Q?Pw0PkYgkXuP3CfWiP7pw4dSbjOGa55vVs54Y/JLCwVXpL7KW0UUwpix/EbpE?=
 =?us-ascii?Q?Ie7jWbSS5rHbtZs6nGXxATP0PRfrXqJjsvxq1+nFAD9XozqrPMYSM1HdjU5p?=
 =?us-ascii?Q?eUnI1f4aKcEyXA9W5DFw2TKePEfUDdpGAuxO0iZI/PMdqYIKjjjTZohG0bbC?=
 =?us-ascii?Q?YtpNLRY1cNElhcfR0WvwSUvbAl9iegwUu4UiizuOhAPndeB6f7WNUQC6kqbR?=
 =?us-ascii?Q?+FztCHuxgW/xKFVhgpT9Laz96ArbBwVLZsHD8ONPu5/OWpTHb77XzCNoIPBg?=
 =?us-ascii?Q?WoGo1bpRnPJ0oYau8PFHc+qEfWG0Zv/8v8BM8fqw8UsNjDg1xB1TGtDgZQh5?=
 =?us-ascii?Q?zNSXq73uEVc8iDJxfQyV9zD05XZbMlLoT8Hg1DknLVMA347El76w7USKZsm+?=
 =?us-ascii?Q?/aIQQ2V93RoRoayS9sdz2J50m6XS+7tIfn2aWMsodVfbwE3e0hfBVCWpBKAq?=
 =?us-ascii?Q?EIuwCANErDGtvj1UMnfyltquMyhGREk=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f440e834-5b35-419f-606d-08ded0315913
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:10.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tB0FHyYwMDrNjzwik8wMBcc/B2Ted1Q7t2WAqGU2nhOMbkr4iCfIwl7WKZBUPnJ6H3+GmnIcA2eYRZlHlXtzW0LCBcBB+u8wd+MDvhL8kI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

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
index ac0951ba74a0..c0cda19f074a 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1703,6 +1703,23 @@ static ssize_t latency_timer_store(struct device *dev,
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

