Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023143.outbound.protection.outlook.com [52.101.127.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141532C924;
	Fri, 17 Jul 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270360; cv=fail; b=Rkfa2at6FB7Q4luCShj2wLv4hCvOMOWd/YJAFw8VcmbB/n76btf55VfGeUeLM6urClWjinf6U3dbLT2+bAiwgkis9HYV7bAwr33BTeABX+JakDj2VqpXOoZX2eVTziHJafFpef3WNwFHD5rPkI8cEwX3dWySvYBt099mUp6ItXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270360; c=relaxed/simple;
	bh=omm1qTW1pslleerv583CLvILFcm/A+lyRom5df0SXT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WGDA9XsoJwhL0KctJ4zJbRPo6yUJqOF8Y3l8WccC2llRgpRPQeFUGXTrFBvf3KkfGZb8f3Z0XypL6n2pn8l+nPOvxEtrv2ovyVAHRt8Ra4ShIvN6r/ybgxWG0rmSLpcMArMJUYkbOF0SzF37CxnGe+GdAJ6YvA4ozHOu0r4fMAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=RTT6+WOR; arc=fail smtp.client-ip=52.101.127.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="RTT6+WOR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwgsSZIBz+0ehUh6zZ1csIG5aXTceilt3SB1QTKSh8U62UPhuJjTMFFi3YizWy/2gc8r0O5ffoTZscJBxHmgoYbypxTJcB5uao59x25eiMGq8YC4MYki8jIISx20yXnvmL5/odEF8WMfYMMbh06spbHFKtBskO6/0do1NwTBg51ZQjlRS8suZSuoLonr2M3ormgU8VoTwjOCaHpDN9HsqLTIBcEXucAkYg17NbJiGT4XnFMxV1sEAaxV7zICMgrpMfFtEu8eAjDhB8TTP9yIWiimiK0jyWQROE+EkIr2T0KSmRmUIl8+fiu7kJJhT/oxKis48YQLTXdNRNHhj5f9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGaGe/yN31skuMk0t86faRbJ1LTYV6L9a5oe3oMtLvQ=;
 b=BQrX4+cpMjUi4sn3SNa58icLNvcWITSsowcGONRiEonAzsOKwFzQm1dpWKPLptoTQrQVn2/eeH6tbRk6gHAWZ48JJmOBiQq8D9WZBS/mRfBQPM1srcFIiVVBXT+73lJ11pFMkxWEYgJQaiaUb4nKCzg60J+E3XZEmBpCQko57X7m+LZdHjeomFFjyWySIf50optxQakhbX8XbzbnMAwkm9zoJU9x4DCU4EFWdOBa0zegI8YWDb6cpKaPb6ttxZlfmz/WFnfTdEIynhikrhKyofT2sFy9I1NnlhJjfZ3ER2MWSLCAUpqyQPOVq5thUkvmwQLfuOeg6KEm8gfih4ghnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGaGe/yN31skuMk0t86faRbJ1LTYV6L9a5oe3oMtLvQ=;
 b=RTT6+WORio0ry6mkQJ+EsQZ7ZGUlHqHJMQFe80mIJxQ4KcbtQMQaOkLrlaQNBbjm8borsbibGG+Yf1qNuorDPEGBkwwEhFpRCVKtA9A3/QfDgZO2TAkQAPjYpu0tOlBRXo5Mh8zDeT5rQKFMLS+F04Pt77nPZ8aVxa2cBVlWcmaYyijzGcn56x+r7QVh6lbM0Ve5mdKv/LYwdTZ9kCmoyDA1xYSLesjj4tqKPFePGIY2Acvi9dS49kVSe0TMLFkEWDXth2fuu1jqRtbLaG4rbl/IPmxK+PmTMOPE9/178SSDeWDa82yE95ZJE9bviNA1gj7lkfUJ5RYVvfkGl+YVEQ==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SG2PPFF5F77FF35.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::461) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 06:39:01 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 06:39:01 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arun Pappan
 (FTDI-SG)" <arun.pappan@ftdichip.com>
Subject: RE: [PATCH v3 0/2] USB: serial: ftdi_sio: latency_timer reliability
 fixes
Thread-Topic: [PATCH v3 0/2] USB: serial: ftdi_sio: latency_timer reliability
 fixes
Thread-Index: AQHdAubJbOU4PdQPDUmk7+vSnQKjMrZxZ1xg
Date: Fri, 17 Jul 2026 06:39:01 +0000
Message-ID:
 <SG2PPFE985372F00C4E87C6D63D98D9B5FFEFC62@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <cover.1782201674.git.naveen.reddy@ftdichip.com>
In-Reply-To: <cover.1782201674.git.naveen.reddy@ftdichip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|SG2PPFF5F77FF35:EE_
x-ms-office365-filtering-correlation-id: 01b38d7c-1f1d-403f-7474-08dee3ce16a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|22082099003|18002099003|38070700021|3023799007|4143699003|56012099006;
x-microsoft-antispam-message-info:
 LnLtHkTbIwibQf+V5tRhRmGHe9oOiPcSdXZpdXqSSeFu5UeT/sGiago+SduaDuNT9Uf4rBFPv2e0KtLwLvrO2yvYEs74empZFRXNLfxuRD13DKfIK6rGfR7iRwIk8EJOa+jk5/h3pogLNWr6JGovE9EiKxvcjP9mqN1v3+Af8KGlawTzJw3qOHEn6Q1pZ9iVnC0x6+4d3EvTymXEuoobHrHhX/UT9PSY1CVWBpmUcVflHXttIV9LhKdhfltlRyE0haUaik4RDagVKkWJmh1137fenWC3gWwpDN/hbzzRj34/Qi5nTHnDUWeq0N0/1QfDyc71SUaeSzIyJyLGFzgKxMghcc3ESurFBlOUqpApFhtZjuWjdObxc3iz6+rTWwBNGZQtkGYGJ1fqFLkjKwaCdwaIkre97OTUX4Lh3j9WhCI8NzOCev9wKXDbqjPJeY39m2tjNsra5Vl171yVQwLUTcL+KgXLveWN3BdbYHOcAVbpOmmSgS5VqtcTn4ZShJ9JOw1Z5Ey2oRmkCDpV/k3BeDMAV5RpKFJVdPNKnMETnX68URHovfy9J5dKTeuq7e5qIvAnXOEIjMjcSvxp3fKy2Lha+aTEpBTDUxot4nmR1T8CYQ8uC6CFmMSGa1rlSa7lFq78NX0IQlottW6lVvLIzQILKNKkxXF+pOJx9QVtu7MAm0nejTqnKDZpFSBkkAiy+PWv785p/n1+kfy46nBB13rNIqm9r6V2meuuOm7/i5g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kUv1fbB9uUwGGOmJQ0cvq9O/whcrUjog46BdMlgMOPxUnIcuqozdvs0f6HOw?=
 =?us-ascii?Q?HvNt3hUIBw4uOrkmjjszTWTSeSZEfCrAnZvS3N+GfyLaa9qm1pH1FsET7gWs?=
 =?us-ascii?Q?8G36ly6tLOD+dOuLQgjNlgIDWU+AbcMNBupJ5+Udfs3UBsl0ojWn25mLKTY3?=
 =?us-ascii?Q?jvfo1UAKXSRFP4Kahg4TkmqPCDCDeSl9CTTkudRp2WFh0kNsAc8zt/KKXqrB?=
 =?us-ascii?Q?27WDrXvpG0dL5iQiPG8x0+RoGnfIRn4aOOBI+i6aTS2O8C6Vye5gHmmrlkFQ?=
 =?us-ascii?Q?iobu4S/rV+WqwBq5e83ws5f9tfkjDhcimYi6+t33yoheIP549mwwRmIZXHCE?=
 =?us-ascii?Q?t59+Ga3TcbmIVOrYunx7JsUi8GuC48E7vw26oEyWCRys1p2kOFhWLNO9ZJpH?=
 =?us-ascii?Q?cVGe0FfCH3iYVO90E0P9+uFwZm+Q0xU3nysuEjhiNxZaY3FgTlVGuuWisNzd?=
 =?us-ascii?Q?5nxk0xRZzi8hYwrK9gDe9vm+Mc3oADr7BgY1AARuOc/EOm9ONsHtQrom1PId?=
 =?us-ascii?Q?iWhLAUrw7TuFq0UTwqK5OxZabuErpwkdqypoxQzAavoCCGI5go7ywhCiadj7?=
 =?us-ascii?Q?FypqCuBf/32seZUyXUlBHMsmSCzlGFSRxxZte5/o7cP50rD3hRTEFg3MaVUC?=
 =?us-ascii?Q?4aVPmDiEoaJ4Caix+92Kwc4c6UJ9vAcdPLJ+hwnKTJOnbnP/jRSE6AUgluPN?=
 =?us-ascii?Q?289QzFuY+7zcX4mnkAYCg0dTjkUxyRabb2lFqHngIKxpJ5dNBLUQNhqrv4kE?=
 =?us-ascii?Q?wSBJt4giwVxzSp4fh3WXjNH38LGqk5/DWG2qlgIi3R9QAiuJ4/4xiylD+18f?=
 =?us-ascii?Q?2bYAmKJjQd02OJcbE1yTpWmAZu0QbVZzesuODPtBXINuSPeQr81rzUcc9/dT?=
 =?us-ascii?Q?k2C9chOxVS1b5JGR7xhlSyJ7IyhYHDvzT/uyHzgX6lVMqfISDrCTC0dhOqkh?=
 =?us-ascii?Q?6oVCbSq72eMvTvVf+YcJCt5GtKAjT9tviHYZusBrWKMw9sSqb8Gz5LoB3Z9y?=
 =?us-ascii?Q?cWMMIfNbStxEKM/TXWeoo75vUW7Su25qRbNMTQex5gcFuvlv9XzrYVDXykSM?=
 =?us-ascii?Q?xM80CpvrWocD3H5HHqMQxMv02nc1L9XC3ESoq7r17rOaMzSTYUfx5O/SJ8X9?=
 =?us-ascii?Q?ebgOo3ZBp1nRTV56x8Vu3uaByllCY6C9D8E4/o5fbSgSP3yEGN4YU/j/9U2p?=
 =?us-ascii?Q?cAEjT+hbRbA4j0UZVrxsK6OB4BUCKaYfOAvD6kHTGnUM0SaO0MIocwPyVugz?=
 =?us-ascii?Q?JxPmaX3PpOlEEqk1/tVqZwiwCOpb1Ms8LhGaUyY8jx7bMIVsK/zS4VQzh+5y?=
 =?us-ascii?Q?60FpiYqI7M3bdB/nJdhmoYdFETNWzpqox8dDeF6gsmfLcvb2/33xO2JkKpDX?=
 =?us-ascii?Q?/hsoE+J5yHSpvk6tlnmt028KW3B2UKm05nFV1ZVeSpxrxUsnpJDPSxhktsGf?=
 =?us-ascii?Q?YQP8sVBMZeOLaUaPKS060KRXzOkMUY39dibS3+uwiymPltdx/XE3WPykLXc9?=
 =?us-ascii?Q?yU+YXgN47Ip0KE9lYuo1Slhl/ZM3ctnsXBTrBRcZiXDO7B9zkbsQzbdlgXRG?=
 =?us-ascii?Q?08RL03ClfGeLqrdwelY53NjTqUm1xWmaqqiK5aJX1hwKiK01H4acE2aQ70Lz?=
 =?us-ascii?Q?UrAzF6aVMOKaH5y5UZ1k2RCnk0Kl/suftXU8cprlGJaNkbzF4BDiwY/NFma5?=
 =?us-ascii?Q?i3Xu2Js3BiA3Cg/dICL25i7YMnwCLe6Z4CVc89VK9SzvyziQFd6Eb3FV8xgE?=
 =?us-ascii?Q?0rjAVP3KSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b38d7c-1f1d-403f-7474-08dee3ce16a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 06:39:01.4996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7DJymq7gjbR0fUVy8g5OvDFculxXJJDOxc8VLOvO1ZvQZ1slnkDkWVABq2C2Kg26pFVqb6RUyPsD89qeRDXjfrsxhUZcMAG0y3cCSZ3PCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PPFF5F77FF35

Hi Johan and Greg,=20

A gentle ping on this v3 series - any feedback would be appreciated. Happy =
to respin if needed.


Thanks and Regards
Naveen=20


-----Original Message-----
From: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)=20
Sent: Tuesday, 23 June 2026 4:04 pm
To: Johan Hovold <johan@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfounda=
tion.org>
Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org; Arun Pappan (F=
TDI-SG) <arun.pappan@ftdichip.com>
Subject: [PATCH v3 0/2] USB: serial: ftdi_sio: latency_timer reliability fi=
xes

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
  [v1] https://lore.kernel.org/linux-usb/cover.1781744946.git.naveen.reddy@=
ftdichip.com/
  [v2] https://lore.kernel.org/linux-usb/cover.1782121274.git.naveen.reddy@=
ftdichip.com/

Chinna Mopurigari Naveen Kumar Reddy (2):
  USB: serial: ftdi_sio: retry transient errors on chip-side control
    transfers
  USB: serial: ftdi_sio: make explicit latency_timer sysfs write
    authoritative

 drivers/usb/serial/ftdi_sio.c | 65 +++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 7 deletions(-)


base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
--=20
2.43.0

