Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022091.outbound.protection.outlook.com [40.107.75.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EC5D531;
	Tue, 23 Jun 2026 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174012; cv=fail; b=rlxy8rSdl8pHNYJ9Wnb5EstuQ/fBRaPy18yJ6qZeDQNHHyZVrdmP5psvwJEZ2AOnRODagU57kpwujqNrRv1YkdoP+C0j9X+cXt4wQzVEByqXqwxgUBGTFCRVKq1n3Upc6nyzUhII2rPsrReBDF7DXKlMVUOmMGHXUnn1+1xVkXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174012; c=relaxed/simple;
	bh=keHc77XWeOC12GwQUa6MbV7lEwf4piqsS9iO17x36RU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JHM4nrIqKdGui8uUUJh+o7wMis3T2sXtMcO3YUa0YxxHMUrqgcanaPaDramofpD9wQRQsL7ppCbBCKUlz2BqQfNPe7wWpnSda9CggdhVMHGaGf598CgZnf3QqmhcJWKEZVwMJSPHAxIBAXl5niuiDqvy5LHllHZvKRlymQkKzJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=cZMVkKz7; arc=fail smtp.client-ip=40.107.75.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="cZMVkKz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9CM+chtKxwA+QgwPL5TReelIEQGyTFj2keTyV8BkBgYujL8YgV4q3yvRmstF5QvaAW3g7hn9Oyiqki1B2YHxwbxTvlAnAQ3YYex9KV6pEruKfHgP6IXks7HXxxm9Xes3XghyehzJLF6OcpVxKZtr7thV/8NC/jUXTtjR9/FLrdiKcU+OXBSS1Bc10z3QI0KOfC4Bx/VOYVOBomb4zQyEu1cETcEbs9Kk2BtPpAYJvDl79TtzC6sd9SYqCYEEkCJJyzuWbEQWaEqY+GnzKQSZwWzsQ1rSz36hO6m0vfVCWr2PHHTxJn3bLmVVjlzxNIKa3rDdm6ZeinDFANmQcq0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPfwphlNYNarVC4ASvr03WRxAoFpTtCI1wYZk5scrOU=;
 b=hEWEo/7g+GwkNGIxMEGlZ9A+jx2YHQKOY0gQLL9f+THtkidwqjUpZvMjEQbUiF1nbeZUaSyQpO+xKRNPfC3z0KurrFjOmiF2EkIi/4ZlGC8aSSjLEaiBthP5PrEbpnojwZULrMce8I/VPiYdUA/tkw95t53mjUjElaxSm72QOcCYVKSy+KCg+bzGX3ABxJSiq0OPpfKAQSuM2eg82wHOtYGXhgAk5gWeaSwk4+Sj2S8CfM21JbTTMrBZMZTUN7hQPQZspjEBuAiqfVu3ayL2HS/k63SqRSrk4BL5UfP3v9k4g+hsA6wIZkRlvGIINzek4AnEpkug9KlINf+GaRKETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPfwphlNYNarVC4ASvr03WRxAoFpTtCI1wYZk5scrOU=;
 b=cZMVkKz7Qw4C+mfBya4UZ3VE35ErsPyOGkxLdGn+/wi/dDtuoCXM9DjLFlfc9avj5VF1QR+ObBMusUwmXN2oQUYz1gNcfB9kRqQsS4+ZRxF9ka3EI0EfbwoTEHsgHfFwMT50RpBNp8noZOWKAwXflsPkN9YD0KCAcUbroVBNkV/4wVir1ZPzn8rvNXXUk+khjL8xoB2XMUsb75khsBZvyo1+/Nx2F0mCJQpbxgsoFGeEdnwCe2OZBFiorJaFTGH2ULy0p6tmbjOyUVTEGsCW7LJPgTJ54dzikhVcq4Bgt3il4zmiXQ2HZuCPW29IxienWIPtvfllUN/Pv5/G44/Xzw==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SEZPR01MB4599.apcprd01.prod.exchangelabs.com
 (2603:1096:101:92::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 00:20:06 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 00:20:06 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Arun Pappan (FTDI-SG)"
	<arun.pappan@ftdichip.com>
Subject: RE: [PATCH v2 2/2] USB: serial: ftdi_sio: make explicit latency_timer
 sysfs write authoritative
Thread-Topic: [PATCH v2 2/2] USB: serial: ftdi_sio: make explicit
 latency_timer sysfs write authoritative
Thread-Index: AQHdAiuqWLRFVkjGsE6QX51PzBMR6bZKXNuAgADqyUA=
Date: Tue, 23 Jun 2026 00:20:05 +0000
Message-ID:
 <SG2PPFE985372F0B2BDBB8AC5756F96433CEFEE2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <180003edbd4fb3f6ef2b87551499698927b1191d.1782121274.git.naveen.reddy@ftdichip.com>
 <2026062200-tamer-gallows-b8ad@gregkh>
In-Reply-To: <2026062200-tamer-gallows-b8ad@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|SEZPR01MB4599:EE_
x-ms-office365-filtering-correlation-id: fa62d7d2-1a08-4d64-99a8-08ded0bd2d66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|6133799003|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 cygRXPl08wVCOMkxhFqX+sYeC4xrulMJEX2kbK3SejfCSj/K8YZKzoteG0uZO24w8sgbYpZk4TQxs47wLkjtPxyDu+2Q/lWOOePnwuyL/AG1Y7f2HRbCL8aKg2TbkKv+UOrRyvMBcxdJT7qHbYgSeAu3yOxLUNPNLt76KjlOfTExZrkgBnDo7sM365l2fNRtFZq8XUNkWjEwx9+5MJwcsBZEPmQNdMZXtMKAHa7eh+O1iQE+M9wjUIoZuwPHWj99LwaktEumvZsKxZl4mbkKq5p5Iqqlg+VhxNyCHHccEzzrNCvJV3Ng4VusJOloqCkm94YwgScmNEN2Saivp08DrjNkn1nt6xEAZ++glDQrXezKKHpB0Vtv3z0qXVCVFmI4mNw83QjT3iHea4PqdrZuOsVpeByUf0gbY2Fxy9gbFwMZCO86yzm9Do0hrREPkTH1NudFMLUp8ramOnnUwjrvdvr3LfhoaNo/Uzs4KeQzWIr3uGuC4JbZTZzxnIGz4/dfwQVBbP9xmATWFMc28Rcu+JANmpJOiuwBb0VnQeUYD6fvzRQfbPHpJ8pi2NbF74i5aOoz6oUH//DckFl25ZB9MxlAx6SFwbjqy95A0PkaCJDc3yOTSWjj2FzstRNRPWy9MSLpC/yQLEevcLY2iGVVrsXnurKt4XlIwqMmcnr/I3fw1xpVTLjIwPIV5VxhHlQx6i/MTc4GxvaDOTlk/FVtl2Ldf45IoAunE49wvw5HKko=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NgaSMf5viSuE1x988cRNprhENKn3XUUTDrvrlhb7+JE+5KFEUcT7u59Z+rEj?=
 =?us-ascii?Q?jWKNEU+rJRwRDaR1MN/pZeKFBTUQeRQ2+8Gx8ovNyJrGk+eI6p4kBKsSwzIj?=
 =?us-ascii?Q?HIubP6wURqBF9lcjT2PQFXQan8Q8ZJatkVEUONlL+l5ZscC3TFqoZzEsR+6G?=
 =?us-ascii?Q?CiJecWTsM+81nKdLtAjVa1NZpRK85a9YuBE2GYm4dwJIDBLIn2iNz15TVznf?=
 =?us-ascii?Q?EgJilp+u1gyBAFLD/Q8Iz/BkmVVqf68YdVwm7JZkAtTBznDjRAENsSb7CUxy?=
 =?us-ascii?Q?fv75AdcQdHeJfNKYIQ53d7AHDsRSKYbUJGlfXjLSPyKL2yuda/seGSHgQ9QK?=
 =?us-ascii?Q?PXe5MJjLbe963LWzjDbebmVLDstQpT/XCIlmo3lFc3+RQZnE64AvLgi1UYxp?=
 =?us-ascii?Q?AY6UmtBb/nGmLI1OVLNmce8uCXBXPQxbN/JCYRMw5gqvx+HzquSxFOqk1lHA?=
 =?us-ascii?Q?pCHwmLovOmId4Xng9TYLLOCoHuNUOvEfEONv4IVZ+chixFcUUKHqzlq9FPKY?=
 =?us-ascii?Q?QDYle/VVoaHauYWGVk+ubKNd6jAQOykWPRuYrpaefCGkFi3hRS4eM+kRoBds?=
 =?us-ascii?Q?2W8W05GVBgJOSGLVUNvNJB9q6zaMC4JoIyinmA3REkw0L0vt3qKsgf6XWDRd?=
 =?us-ascii?Q?k0y/EqHISdNfKIjvCIotCDu8gJ3OZyX5vuc5d7AeDGjI86Ma5E7kMLLQbmH1?=
 =?us-ascii?Q?1wlrY5dS5xU2VOXis8gm16b41Oy+3KWtTnbjrV8/psZ4Xs38SB6JUVI6A5Kq?=
 =?us-ascii?Q?KXcBtg4SLrsn5wlH21VDKtew7WQ+8wLSQfXIuyHkGEEMoNbRYkyrN8lVk+0g?=
 =?us-ascii?Q?eak23JY0b7j4tDER/jmGfyiapA96bLHzwJbJRJmxupYvbMejie8JmC0cBkEq?=
 =?us-ascii?Q?pdTI210k7h7E8jyepU5XpxMtYJR3Q6H61IUKfVI8ambAPLKEzuj3UANAIiZf?=
 =?us-ascii?Q?ovi7aIXgGY4eNzO0Mtafv40nYir3Zfn8VQTut3xYAfJz7ei/HI5JWAKtBKD9?=
 =?us-ascii?Q?SE+E33FdB5oJyK/bIWOqn9eYV6Khp7gq6mmWWrqDqmo3ALlcgOEHFjLKpmTz?=
 =?us-ascii?Q?zXPm97Z2VDRW591HgjAiSPdnqi06HN4UhmjEl2NmBSbrekEzoImOYgA2Nuqy?=
 =?us-ascii?Q?ylyGcN5HGSZZMsLsbIgc1Mqc6AN0r7ky3+vPvtb9ozVIba9rnkKgxqZAIAGs?=
 =?us-ascii?Q?IIpLkZPnututxqQwzLpyVEfI8k9/V6C7IVvFn0UbWvoI/VGsA1KJnrdDgj2f?=
 =?us-ascii?Q?VfE/Avl5ZaRW8NKoEpXhRGDaULMWlHgzSuB11szcOgeEBDinwFluvqpve2yT?=
 =?us-ascii?Q?cnX7fcLrpGoJgbJTHNEbEVGOoyna7SAOdmQK6/QEmwaBtqon7QkxeOFmsj3G?=
 =?us-ascii?Q?Twu7DY/UMy4+DxRw0IGYnUV7952FsHCoUXLkgpuY4s2eAWBC8N4MrqhYwe/B?=
 =?us-ascii?Q?dinX+AaySbABR6MWSnJyy7lsP+yIEv9RBJEd7vL2/rKsa+kXC8DyUA6IZykL?=
 =?us-ascii?Q?d4Gppu6LPBCZyQGEXHIPVyzI6HqsBSdiEJZv5sYBOKuyutv9Tc9xNomu2/9V?=
 =?us-ascii?Q?7yTFqINhg28B9iW/p0EER0wHuxQJ+4qr3qDLvTX2xDSERP4nfED3apRRAiEp?=
 =?us-ascii?Q?ax+PUeZy8/WyelEF0fljmlMrTLkmFYx9gZk3HIFwMqqrGrMTdYTq/cuD4HFM?=
 =?us-ascii?Q?IrUaA2Naa7oulOfwcbY95hNJAdPP6HQYj4SaWBkvialn13iME/MMseqZO2pw?=
 =?us-ascii?Q?zCrHfa9egQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa62d7d2-1a08-4d64-99a8-08ded0bd2d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 00:20:06.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3T7p9is/5mXhdOjlZWiqXqMGuqg5yGQrGMoxqt7bPOddEH0zJu4yIx9wGW4PGHA3QZ3m0RBTOvy+LK/SB2jibdFK/9B/orBNVakBEHkTbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4599

Hi Greg,=20
On Mon, Jun 22, 2026 at 04:xx:xxPM +0000, Greg Kroah-Hartman wrote:
> When drivers work properly, they are quiet.  Make this a debugging
> message at the most please.

Will do, thanks. I'll change it to dev_dbg() in v3.

I'll hold the respin for a day or so to collect any further review
comments (including on patch 1/2) and address them together.

Thanks,
Naveen

-----Original Message-----
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>=20
Sent: Monday, 22 June 2026 6:19 pm
To: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) <naveen.reddy@ftdichip.c=
om>
Cc: Johan Hovold <johan@kernel.org>; linux-usb@vger.kernel.org; linux-kerne=
l@vger.kernel.org; Arun Pappan (FTDI-SG) <arun.pappan@ftdichip.com>
Subject: Re: [PATCH v2 2/2] USB: serial: ftdi_sio: make explicit latency_ti=
mer sysfs write authoritative

On Mon, Jun 22, 2026 at 05:43:40PM +0800, Chinna Mopurigari Naveen Kumar Re=
ddy wrote:
> write_latency_timer() clamps the value programmed into the FT chip's=20
> per-channel latency_timer register to 1 whenever ASYNC_LOW_LATENCY is=20
> set in priv->flags.  ASYNC_LOW_LATENCY is set by userspace via=20
> TIOCSSERIAL, used by setserial(8), libftdi and certain tcsetattr=20
> paths.  The interaction with the existing sysfs latency_timer=20
> attribute is surprising: once any of those tools has set the flag, a=20
> later write of "16" (or any other value) to=20
> /sys/bus/usb-serial/devices/ttyUSBx/latency_timer is silently clamped=20
> to 1 and never reaches the chip.
>=20
> The store path is the most explicit way userspace can ask for a=20
> particular latency_timer value; treat it as authoritative.  On an=20
> explicit sysfs write, clear ASYNC_LOW_LATENCY before calling
> write_latency_timer() so the requested value is what the chip register=20
> actually receives.  Emit a dev_info() so the override is visible.
>=20
> Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any=20
> userspace that previously inspected the attribute to confirm=20
> low-latency mode keeps working until it does its own explicit write.
>=20
> Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy=20
> <naveen.reddy@ftdichip.com>
> ---
>  drivers/usb/serial/ftdi_sio.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/usb/serial/ftdi_sio.c=20
> b/drivers/usb/serial/ftdi_sio.c index 7aaa7fc1be71..e7f13eca7ae6=20
> 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1683,6 +1683,23 @@ static ssize_t latency_timer_store(struct device *=
dev,
>  	if (kstrtou8(valbuf, 10, &v))
>  		return -EINVAL;
> =20
> +	/*
> +	 * An explicit sysfs write wins over the legacy ASYNC_LOW_LATENCY
> +	 * tty-flag override.  Without this, if any userspace tool
> +	 * (setserial(8), libftdi, certain tcsetattr paths) had set
> +	 * ASYNC_LOW_LATENCY via TIOCSSERIAL, write_latency_timer() would
> +	 * silently clamp the chip register to 1 regardless of what was
> +	 * written to sysfs.  Clearing the flag here makes sysfs the
> +	 * authoritative source so the next chip-side write uses exactly
> +	 * the value the caller asked for.
> +	 */
> +	if (priv->flags & ASYNC_LOW_LATENCY) {
> +		dev_info(&port->dev,
> +			 "explicit latency_timer=3D%u clears ASYNC_LOW_LATENCY flag\n",
> +			 v);

When drivers work properly, they are quiet.  Make this a debugging message =
at the most please.

thanks,

greg k-h
