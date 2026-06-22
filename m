Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022138.outbound.protection.outlook.com [40.107.75.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925C39D6D9;
	Mon, 22 Jun 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121414; cv=fail; b=R2FmBxWd1RCcrIWPb9FmzDdrtPTkyhcPZoF+dPLcV2pbgjfTVPbFzFSOwRQFCVdHWs7ebxBcwqnou2I1aTu80hh28mpjeYrIFgj139+LVT65470msz2O/SKIsTy9sOkviIDm/WiKUmykHxA/uQaZAcHaw2ZgGpDTJjUg5FxQ/MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121414; c=relaxed/simple;
	bh=Jy8hZfzi2DMZPhdLSS8N4bOM9lUs2JRVLX1R9d2w7yw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=InjnjPb9D4cCE2txV1OMZvpXR8camsz0cV6l4uDRET2QW5NsDDdoVYO41mlAjayISeg3qwOtr/cSPpUt95T70cMx1flqlGCjU79py9VYPR4IPSbIWJkFTgnd19PRyw8yGzrgzCj2QwIi3firkQs0L3zYIF/sTMHBDOnV0YiJQOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=s9fMmpgf; arc=fail smtp.client-ip=40.107.75.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="s9fMmpgf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFQBiqLAp8kecvaAQeIXdEPtQDRweKBEIFO7yOeQFpwkDfMXDsG1VZwTa3HT+2yxbIluaEgkchGEvAz5oHNTyLT5l8UR+DZpUXjV3Dxc6inaGwW3yiBIVBuOF61nbo+sYrzB4cA9jlKzuGghScvxr4z17+CJ9JQLoXA3JeiNDpdybxxvEFm/Z6zTtnB7DQQ4ic5jQrw0Z2fyu/E12RGpTHryIRlk8k4TpPCtD+3nhhrncKQEmP9mVEKVSA3GrIuIcqyRyTXNrfAuMLPI9gi+kZrZYmamvffCVgU+igFSYvM/Vo8xyvYijKpE9PRzLcAQ5EptSBFfP5PpQ8No8yNrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uapX2mLfFiIKbWGjxM0rwnJObbZwU+9I/cqncQkTkcQ=;
 b=XTgvxf80UfOPrLF96AaTV+z3Rcd6r6CIdWAs0K6Njs4fhtTtW+nL7nPmA3spdfncLxjWo4A3KWaSeQuNjLZ+VAoXgh/81TgXTe9drnw/uVhziVHlTiD+AJCX0/Y4cQ+OV6JTM+zdT279C79QnEiZehiQXlny0vlnFh5Muj1PARhRPywUhBCOIEM5o0M3YCWj4f2pbCOxds0a9JkR9mu+ojyq0nqICzVmsRCfCo6hM5+uKJgJswaXUZTSdyP8sPOA8vhr+c6q41Unm2vq34DqTO5J3/hskrw9TkiSi9+k9NfyHyoH5iOiijTqVzEcQi1O/uv9ov3LD9JKCPBYpkg/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uapX2mLfFiIKbWGjxM0rwnJObbZwU+9I/cqncQkTkcQ=;
 b=s9fMmpgfc/DBhJwqMYlEdei5a1ncNoJ1yPOcav6rAmcp2EvPq9YN9DT17kIOT7/rUtC460LdL2Q/aySwwFzpC8iwAwTiQyOdFk7lruAzSGM6C0DqTdHyfhxUX9lgilT+0M8ZYKmWks8sV6pwyKXqpaYCUV7jfOsLKSDQg2/VGcMRVcKreBMOID1UF4ixnUg7+W5/KcdidQsbFy1Pm/X1X4ngCbAk7vO6HXsf5acZfEV/DsJcXyJt13spimQOF/ILs213zrJn/Uc9/0V9p+inZvKYQJ8ysYySpvutcyOPdtWt2aW0sj3VuIPQ688/90KCrYOXyO0lO0ZJabWgkjIrBQ==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SI4PR01MB8053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:29c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:43:28 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:43:28 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Arun Pappan (FTDI-SG)"
	<arun.pappan@ftdichip.com>
Subject: RE: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Thread-Topic: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Thread-Index: AQHdAhlPSBjjJ1ZFjUmtnEU1RKl6+bZKRKkAgAACk/CAAAdZgIAABDxw
Date: Mon, 22 Jun 2026 09:43:27 +0000
Message-ID:
 <SG2PPFE985372F0FF0AD8346E95771A0452EFEF2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
 <2026062250-sassy-hamper-025b@gregkh>
 <SG2PPFE985372F0DEC3C668B0C138E0684BEFEF2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
 <2026062229-pesky-wasabi-ae9b@gregkh>
In-Reply-To: <2026062229-pesky-wasabi-ae9b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|SI4PR01MB8053:EE_
x-ms-office365-filtering-correlation-id: 7c47f53f-23d1-497d-6b14-08ded042b669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|3023799007|5023799004|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 WeIVMbyGEjPuvLHb1UPNYWkLglgMGqvVZETWwoRQcUqJT6gb6APTwtFmSihsYlRVTMO95tvgFN6ejACBIdbMlrUcAaVUJSe2FDSkrGhCpuqdGme3p1htLFVmozwDM9Mfj5CjTPTxlDPGcr9Nkv5lqoHZ6FraqYa4DQcJmyx7usVbR/ZHeJbKPHt7aD4JGgR9f6iAJ1hcW2dYiZB6tpj/0NGgI1DowoDShgtMK7M91RtGbo3kgzNyT8AmjTxsbVVdYAi57/eQu1JPegTi819V4PVa05yPVlonFWQ/XOlFdA8repUadU3VQ7/5bCQBNkYnWlPR0WgMGb3Ygsik9BPbACf5qa0OFK+YE8yUVYM6I3uF5E18Cp1DH52ddNlqwHI3vpm+E9nyrTKbCIrkrpl4zPo804FfxSX+iuZtFeYJvc7RCmIRx1o5uQ2z+v6jAVY9LP+fobyPmTpwQh4aio5dhae+JXihEgT88GlcMt4/6ZahnEUoFO32qijm1fEqHnx1KO4m3cX46DvyI4vHKpOZQZFb1F4kipRQNLJyusmzYHWI4BiYg4LxxWni1/UzdhV/GIVJZADZuZQP9PMeqfslmWaca2rzXBQziwXTdMyu9g1VamwdUb40I0h2iVVPd//i5vaKSdEe/o5Fe35+8KgH9MMbDJVcGmTdJnqQusnwuX1czhHWwnTGjdSxbYSsJF6s2lBVA0o163PHDcrsSGYpBwX36KiDQlmp8HhARNz0zg4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(3023799007)(5023799004)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UgVbDK9plHVuBYHOoyJyQlbespg6Ny4M+NDPr+EEWF/MNGUIk1segsoMbxV8?=
 =?us-ascii?Q?R5aBCY+vNi+zfB9yrS1Q9pY53WfgZevK1aK3dUAofX+0RcI+U8EMYNvP5PY6?=
 =?us-ascii?Q?sWHgpT0gbPg1M6CzxFyORqCNBAZCnH2RiNufY2kPevIpOMAdNVZEqlHDTy8I?=
 =?us-ascii?Q?ynXlIDG1vYRHjW4FkzKcK/60XwKqHBsOedSy4p6U45gvitTreKSa0GKwZBEI?=
 =?us-ascii?Q?CFvUTa7ct7xhDcUTTv5ML8zo7PvJPwG93XeoJQ/wK4G4f1qoB/Z2NtvnpoW0?=
 =?us-ascii?Q?YPsOtUK9mrZZb1BEeWi2RZ+A33QPCEO8cFw6vI1FQdrmN9hS+Ca402paPUgS?=
 =?us-ascii?Q?D64QqzaNMXtjsHfhsBeRpZ2FLS/UQYlYIb6+WdTa2DEhiyO/0L53IzbMkHZp?=
 =?us-ascii?Q?EjQHpxsLF2igZTctlOqcKtCUQuaZZPjaDRX5hoa7PDlE9PB/44VV+zRYnezY?=
 =?us-ascii?Q?n+GOL4UnLlQ/DOKfzgNyY84ka0k9Rp1v+/5QZV78W7y4atFRW+nRpV9GFWjU?=
 =?us-ascii?Q?Tq+IMRfO/TjLnQDCEZ/Pujo+Ozsfmj44s/iFekkX90ekMDdiPnKJ7xNHPtAC?=
 =?us-ascii?Q?ZIv0pqGsYWNYW9tZQbW9aeMV6mVYeJSPkVhT88Ur4hqlD3WXSFVLyryfFHNH?=
 =?us-ascii?Q?EeGXPIMagd6Zd3ovtYaZtpQh/W4FnjbSqJx6SXYFxFrYNXsPuHXMFJlyDXTX?=
 =?us-ascii?Q?0c9Vux8QaXL+6SjbyVsWcGGxpDj4Ds3taPUiNC0wSjvnJmQaW4uDYYlMct/j?=
 =?us-ascii?Q?e0YrfQkj5xJAXUWYw3KjwCmQZRStiSwX2rWN13wT1QCrnZBPVFVPM3kZLfO8?=
 =?us-ascii?Q?WeF9d+dzSp6oz5jz5ETK0lE+yUMulMqeh1RVvpHtbw4aSWf/g05zsZxb/QBx?=
 =?us-ascii?Q?p5ZjjWOK7069GJMQzNdCqh/AwcqB2r9L+hJJIkxw8K4C1+Sn04bd86bK3RUc?=
 =?us-ascii?Q?GnjY6DLXSIOmw7/OX/hNdSOoechQxkyDd0o3Y3hvfxRWZOeVhL0hAh9e4/Dm?=
 =?us-ascii?Q?zAOnQNgSe2Pl3vPr7Kim7js/uUAYKsfRc99wvmRMh9HEQ3VTHNdnF/alopES?=
 =?us-ascii?Q?izs64/2vvfi+zvDjCwIXDz1hQ94V6QmqmOcWNvvDj3Q391/5GNkmBD8BwA8n?=
 =?us-ascii?Q?AObICWwzcH7IHPnKIjTWfkjDWctpHaBreMfp1PQX87g7nsPvnBPwPl0lfI//?=
 =?us-ascii?Q?Pw5Dr0qtJ+LJGGnVJxcLzkL9BRQemZ/E1Dq6Kk8svLSv+ikEKHtP/xRXiksA?=
 =?us-ascii?Q?ZV+3Y8kaodyN875bSS3nEYdCApSX/pTPhJJmQmTFswViWVv0umhgs0FLoadB?=
 =?us-ascii?Q?8aTwVvB95BXn7qXqXMS7a/3FT5V2tpwcRR3Jv/rTiNQhNdsRarb1cDRAn1ju?=
 =?us-ascii?Q?juxNEnQEaTKEOg8eI0MhMprT3PHPn1voElxbRMv0m3kaBp58WlI3lgy7FB12?=
 =?us-ascii?Q?VF0KagL0v55HlpH3NhlFDzscyOGMyUhc32HslB1sOlFLStw+9a8iyUqv6GRq?=
 =?us-ascii?Q?kWt1E6DTBhxrtgibkVJZlsXueBhm2b1FEEvbRrNUVnTaqSzYn+Thskc7fGl9?=
 =?us-ascii?Q?YnBrzDh/nkhoWBWjOZHPe0aw0c1coqg2HwyZZ9zF6ffzO9joLJSlx8V+VRbI?=
 =?us-ascii?Q?QsI3T5dWbl5/kvRltlOSub1gcuAmBM0ZLitFfsRt6Dzn7hnUsALd5BL0YL1l?=
 =?us-ascii?Q?FoA+Vrxa5cvwNnblg3JmTmayeAPsP5Ke3eVU35E5EDsLYBHXnetbq7Oja6ZG?=
 =?us-ascii?Q?0hFFmme69A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c47f53f-23d1-497d-6b14-08ded042b669
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 09:43:27.9676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4Sey37OTH+cnAZgQRjQF4O8PNDgFuDiVujA4ghXJhTDR2Jtqeimt/RVVxj1DErPk49ZeKQOtQplUDj+J1m/xc/LkPUG47Hc1llGb+JVdPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR01MB8053

Hi Greg,

On Mon, Jun 22, 2026 at 05:28:00PM +0000, Greg Kroah-Hartman wrote:
> As this is an out-of-tree issue, there's nothing we can do in our
> in-tree drivers for that.

Understood, thanks Greg. I will drop the urb_defer_timer_ns patch and
the low_latency patches that depended on it, and take the host
controller starvation issue to the Raspberry Pi / BCM2835 USB folks
separately.

I will shortly post a v2 with just the two standalone ftdi_sio fixes
(transient control-transfer retry, and making an explicit latency_timer
sysfs write authoritative), which are independent of the host
controller issue.

Thanks,
Naveen

-----Original Message-----
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>=20
Sent: Monday, 22 June 2026 5:28 pm
To: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) <naveen.reddy@ftdichip.c=
om>
Cc: Johan Hovold <johan@kernel.org>; linux-usb@vger.kernel.org; linux-kerne=
l@vger.kernel.org; Arun Pappan (FTDI-SG) <arun.pappan@ftdichip.com>
Subject: Re: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batc=
h defer for read URBs

On Mon, Jun 22, 2026 at 09:05:53AM +0000, Chinna Mopurigari Naveen Kumar Re=
ddy (FTDI-SG) wrote:
> Hi Greg,
>=20
> On Mon, Jun 22, 2026 at 04:52:00PM +0000, Greg Kroah-Hartman wrote:
> > This is not the 1990's, module parameters should not be used anymore...
> > Why not just fix this at the root of the problem?
>=20
> Thank you for the review, Greg.
>=20
> You are right on both points.
>=20
> On the module parameter: I will switch to sysfs if the per-driver=20
> approach is accepted, or drop it entirely.
>=20
> On the location: your core point is well-taken. The DMA channel=20
> starvation is a BCM2835 DWC_OTG host controller deficiency, and the=20
> correct fix belongs in the host controller driver, not in each USB device=
 driver.
> I will investigate fixing it there instead. If that is not feasible=20
> (the
> BCM2835 DWC_OTG is a vendor tree that Broadcom/RPi maintain outside=20
> mainline), I will report back before proposing any per-driver workaround.

As this is an out-of-tree issue, there's nothing we can do in our in-tree d=
rivers for that.  Please work with that team to either get their code merge=
d properly upstream with us, where we can all work on the issue together, o=
r just work with them out-of-tree.

thanks,

greg k-h
