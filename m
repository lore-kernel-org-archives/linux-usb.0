Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023130.outbound.protection.outlook.com [40.107.44.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D32DF12F;
	Wed, 22 Jul 2026 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698170; cv=fail; b=LQDQvwvz1VAWvqTI4d0ErNe5OcN5v7w3P8IWb518T5xJy21vuxsT6l+Vqon8KshzteorVbelFQlF5RUsTZOwjxZ6649kXfjoP7I/LLpuBv5IxbXazQrRdjUdf67WyXy2SoNCFs6/0/YeJBMDKISIujwxYKhPSzSjmai5VY1khTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698170; c=relaxed/simple;
	bh=Vr28epzMbf/UVXT0Twqu+1fj4WfCmbcqHh34DpJ6pb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YTtpdsMHU19oyEwba/xlcY6dC3awftW7jUQGi6LCat3U0TNNg4bwc/4l2U5FnJKlSThR8O6UMKAY2G0JqZhwsztGoVwGYfVI1ksmW5UTRu/Bg2YkGRguafhf23XRMjyi+j1Yym1+FeSo8Ag1ci0eKU/A5FxWnWmv+uwp3PJJSCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=vGVMLfTm; arc=fail smtp.client-ip=40.107.44.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="vGVMLfTm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af3puBeeN7pMgFbOxyn7Ycz+/k0d+91XRu8dFH50zc4Rgh77sRJnl4fuIsvUZdHWhQtqeZ1h68QWOMmBcjBDilC08vyjjyw9m8vdqRsHdy4KI6vMHmuQtS9fHgYLCS48q4KtZzpipNZlbNJjVtb9fpozX9U15EpQWAjdVHkRLUnXTmEvghZ7jLy6JkJuWwH+rDkXCpIsPqRpMRmJVR9Lx7CSFrn+Ecdo7ReRupHl3Wkcx8dy4Hra1/0mCQ+j0FbLvzKSCt7X3Gp39ePwPozbV0ETgkDUgSbmcxmc9x3HqxEhcfn8QUVENtR2iw1rEMcv75IV4Pc+3AQbDUnexoShuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V1r8CANH5lkAr29qk6Ws0Wv7OjDGu08PuEAj1WZJ6U=;
 b=PfGs5lepn6l70x7RmmxgHulj/vxHeALQ5/rMUs2bXLGxhsGkrE/05r/JxhKMArnI/GTxO8lMIA8PxFGnTOYBMj6ksxxAN3WQ4QfvZdbrN78TKKoV9AkG4wnWlCm7ZO0Kt8a2Cs/cHuR9F+0F1sB6OmbtPmY9V290K0K+BCOB34jiYAQ/dZZEUgzUgg1BBHH39i0FPG8fbgi0omvT33TYj+oZjAmEPhUoPD2x5hyKYbpgEM3PjySZIgiyZfWoGbhegaen/NCvH1gK8HeYdQUBGjKMkJANEg9uObLTPjHCmwtRNTgWOrZtcNsjgC8IWyWi/TY6QN+cd4Ze04jlzk4qHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V1r8CANH5lkAr29qk6Ws0Wv7OjDGu08PuEAj1WZJ6U=;
 b=vGVMLfTmcGkyS6phKjqVcSG5Fpv5iWffDAk/9g63RICUNDeigPsS8fjbdgyWr2tWjrlNmSKD0dExxkbSsIOpSKyDKNxIGiB4sGkZV/tre4KQkPnKH7ITw1g3hHCc30la+EF5z2IwN8HdmHtLqoorb2D0ricHY7Swr0xyWCcaBQO2UaYK2PH267FEKMnRAxl+YaFiH6XOIc6OzsImInyxsvV8YK83x5oXwT99Mkbr7MUojvrA5hb0d0Dxoo7qRZgats1Hbji0wDrYTT+oYf5XNED2L/Nn9LFo3pnZZ1aPIQRLtXxWq7IW8htpGsZHg980RTCfd9eoaDrpKAJH3yNG1w==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SEZPR01MB4678.apcprd01.prod.exchangelabs.com
 (2603:1096:101:9a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 05:29:24 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 05:29:24 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arun Pappan
 (FTDI-SG)" <arun.pappan@ftdichip.com>
Subject: RE: [PATCH v3 2/2] USB: serial: ftdi_sio: make explicit latency_timer
 sysfs write authoritative
Thread-Topic: [PATCH v3 2/2] USB: serial: ftdi_sio: make explicit
 latency_timer sysfs write authoritative
Thread-Index: AQHdAubL9SRM8b67oUun/JMB2AUHa7Z3yQ6AgAFnFsA=
Date: Wed, 22 Jul 2026 05:29:23 +0000
Message-ID:
 <SG2PPFE985372F0D5E43A57ABDE29B412A7EFC12@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <cover.1782201674.git.naveen.reddy@ftdichip.com>
 <c1956d7641cd96f75cf2534b65fe9a83d0941e50.1782201674.git.naveen.reddy@ftdichip.com>
 <al8n17rIPduwjphv@hovoldconsulting.com>
In-Reply-To: <al8n17rIPduwjphv@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|SEZPR01MB4678:EE_
x-ms-office365-filtering-correlation-id: 49876fcf-118e-4871-f839-08dee7b230ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|5023799004|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 Up8UvyDovUkVghfbYmClitvAUOCdQtDB18+apeUp5TDJqlw3d4XZGv9aY0hrSKe9xvqB1Qxjka8Ai4/Oi+HciT8LaHJsbLC92+18MndkVdF7AZp1wpIrX894Uvo+ZTLr1YtLN68PeaCqRsV70aWjBU57cgA77V01umzpP6hC40qYP7YZPTdSNAORziqOcYegFD5yf6oUX/xrflTIFJ7WvrfgibEvWKh105JMniw5zSRyfxn/EUHiGgpMRQ/422y2V0Npc6g3qSjW+zoZmfKicnaR9tmy5nSo7VysJ+QO5rO3Pgk4d3wetznulZfB/95/56t7gdpsw2urzxEx4Zk8MhCIZNgFszDYfNG+sk87ugF72JtHxxNi2uxRzuBayK/mn/A/jWFE7WTRXw3ElkFm9Q7wEgLOg7I2hgk9mVIpLzFiz1BpgruFoiRR1rWdjXYKr6zf4m02+Eqa5MyGbcYRHFENRmIOf1G5D3Q5TVIVtj6FQ7pu6YUxTGLA6D97lzjkgdnT/OZq53FJp1H0cZNW6Zf7gFC+bxmYPBL3i/Nf9wc+RMEkF13sCxdpADn03urIZBoqZrCLTN12O5O3lxS/KAKqAcjZ8r+oVNHjAgluNgeBpSgM3EWEAWY6jXRj328Y+TiLGgyYK8LOYoWZRQ1taJlkgBgsm9vTf4YcVsL6MyNZWSyjqVq36tMU4GrgZZ1yXLjCeXVAuA+OqRLjBxI2RA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Xvm7kCTTv5uS35NrK3JBZc6b0Tg99ekV1xHmWB4LD3s6a1OojPXOn/6gzRLZ?=
 =?us-ascii?Q?oi16rTHmeQ1ceWD49bUzIZrzixV0F2C2zjWyzunOE2G3pbDLmt6w0BTmFjXk?=
 =?us-ascii?Q?LURdElM/3oE+HxJEO49srRFicH6VhgdnyqFtzlzyMN8lLX4JiRlZN8Uo+gui?=
 =?us-ascii?Q?jG9UvtC3yrtm0+n3NydtgU9tVrjjeHq2hJ4DdYldqMrkVQzvMY9MTols1Z5v?=
 =?us-ascii?Q?XPKeCvK2KG9x2+zdv2vCZe1Xdnnnwc5jJldDpAuBZxahNfWYKdnTPPI4Jlj4?=
 =?us-ascii?Q?hlL6igsnzfqmOtKCnKAid2iv89wS7IkXNVkdeQ770XWRbCQJHEsaU6Axuw7P?=
 =?us-ascii?Q?H2ApCrqxdcDUtPXm2/wCw4bSap/1zAyknAOQACQDMoySpxqisJQzND/FsffI?=
 =?us-ascii?Q?79P2LC3bCDY1uZCkUQfPbtRPsHsqvHYh/Foc7avVicd0t4+U+QVBEbK9AH94?=
 =?us-ascii?Q?ly6FSE8XH3jbhz2yRZGAPJ5+aKFrMeDCf3NjiXtN6BuscRBDeiMCij/u1q6o?=
 =?us-ascii?Q?KjdJBguYbsAC+EKDEBA6ST+10YsXoVmKZqcRjzi+QhhCuCSjU3U56V1VMoDx?=
 =?us-ascii?Q?0lvMByftmbhvPEvQB/4lp0ibK6owttFSiQYDwWCQMxK77gWrKct1vUFwW5vH?=
 =?us-ascii?Q?Qha/ThylCI+EO4vQoF3aoN+2YSrd8jim76Yu9a1jiamI1wZH2URvrQAGMOwC?=
 =?us-ascii?Q?hJFsA0Nzw2N6cQUavt/PtyEgPb8oI8AZkWy7ByxvAchEiwQN/G3+UM1EYwXw?=
 =?us-ascii?Q?QxQOn9Aay2wU4qZ0UiNgWC2JAHR2fSHZyHjYg2kC5CtgTEzxIMbQiyxaeiYh?=
 =?us-ascii?Q?GWiLL4UAlQX9FGJ/n8RR+3qgSC7gsIFwuxY6bSRt0z8VUzEi295ZscAlZDbr?=
 =?us-ascii?Q?VUokIjSsheOrh61GHp/1CWTbRK4iNZagGxdDV0705pyhJUe/t2CQ1JnPk1HA?=
 =?us-ascii?Q?f1BLcmMZc5FggPqKzfs8XXgijTwfQ90Stex5Wa5t3BJQuXd+LbHtfdhMtNVN?=
 =?us-ascii?Q?QQB+idkMCwbS4uBnA7guBzYnK/SpHwpEUUFEVUdGPlmVVVcpBCzg/07mDIZi?=
 =?us-ascii?Q?jMbzaIvBKcWdHAPxeQD+aecZOmFswk0bq193XEJOijaxSmiV1p425JJ5XhXz?=
 =?us-ascii?Q?GE7aMYlRqYK9yIgqa6LWx0eLX03I8YnXNnlqUUfDdk9W3/O71SeeZPm5HV5a?=
 =?us-ascii?Q?ycUO72opGrquzhbFIVfy7R7nRMkAYZaWbOmridpYKPZXPo4hHPiA6jXw4D3f?=
 =?us-ascii?Q?RZO6blfpwY/rp0QxExh/mUQVQcVBHRq54hcVih7nRLv3hKUyQiyGFB610N8A?=
 =?us-ascii?Q?17HVStvhFAm7bBqW/GpdaPoHC+B0jMn662zi+lJMTg5gzdiCXWHmX4G/TZSK?=
 =?us-ascii?Q?UTwJGuKrKa04NVJKdyGr9agLUFfnqQ6Yrch14Ui5CtV44cg9cRTTCZHdSKvw?=
 =?us-ascii?Q?NLOml4VC0rjr/BfCRw5drxLebNcs9xByCd5DNqfgzbLBYikewyhJOl4PNSXh?=
 =?us-ascii?Q?KQJqDcjnl/xUsjnbsBeARHb9hC7Be9FWLiPRPgx8FsmquJ4r0f83UlDPLyBX?=
 =?us-ascii?Q?kseALptHwetrxtMa4CRUj9Kal1EtvZT8n5E+vorqfZlYp33CUka6jon3+Ze/?=
 =?us-ascii?Q?e1eeXiONcg0S60uzoVPu+T//VqDhXwZhhgOfXUwXSQHJO9IoeJZBaJjrS3Dl?=
 =?us-ascii?Q?PCSTWF43IOsZLPaDDekDThJq3mmFvrtQgQqcQtmczvpJooNK9w0VTFLekBq4?=
 =?us-ascii?Q?WBLs8jlKmQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49876fcf-118e-4871-f839-08dee7b230ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 05:29:23.9431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzYrHOeULOSb8lfFf8aIYoLvp5iMD3oPqDG7b1OnvSdQkASCPoMLD0eEv525f5/swvsocoNfB6IqKRxn3spclg6Q8XBi1zbYJlL9RXQb8Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4678

Hi Johan,

Thanks for the clarification. I'll drop this and leave the existing precede=
nce unchanged - I checked, and nothing on our side was actually setting ASY=
NC_LOW_LATENCY.

Regards,
Naveen

-----Original Message-----
From: Johan Hovold <johan@kernel.org>=20
Sent: Tuesday, 21 July 2026 4:04 pm
To: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) <naveen.reddy@ftdichip.c=
om>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.=
org; linux-kernel@vger.kernel.org; Arun Pappan (FTDI-SG) <arun.pappan@ftdic=
hip.com>
Subject: Re: [PATCH v3 2/2] USB: serial: ftdi_sio: make explicit latency_ti=
mer sysfs write authoritative

On Tue, Jun 23, 2026 at 04:03:21PM +0800, Chinna Mopurigari Naveen Kumar Re=
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
> actually receives.  The override is logged at debug level
> (dev_dbg) for diagnostics only.
>=20
> Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any=20
> userspace that previously inspected the attribute to confirm=20
> low-latency mode keeps working until it does its own explicit write.

No, I don't think we should be changing this now.

The driver has behaved this way since 2009 and commit 557aaa7ffab6
("ft232: support the ASYNC_LOW_LATENCY flag") which explicitly let the stan=
dard setserial interface override the "obscure chip specific"
interface.

Also note that the value written to sysfs does take effect once the low-lat=
ency flag is cleared so we can't really return an error like -EBUSY either.

I don't know how libftdi uses the flag, but it generally would not even be =
set unless you explicitly set it using setserial.

Perhaps you can send a fix to libftdi so that it uses the sysfs interface d=
irectly and leaves the flag alone if that's the library that's causing the =
flag to unknowingly be left set.

Johan
