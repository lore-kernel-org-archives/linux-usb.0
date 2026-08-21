Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50030EF9A;
	Fri, 21 Aug 2026 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331782; cv=fail; b=n6hKgSF/mVgBGgFbobJ4gj0Bs9aIjPx1oakUTK1F4JVGrW088jHDoxykwItemmNHC6VkKHvicYcfemt70W3yzzbzGvN7IHWuUSfgYEtAe3yJC3V2O4yAGIeqqgmj86woRhq89ODD2KzfBIY7SACNXdzSKDjXvlW3YayuKlzkJEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331782; c=relaxed/simple;
	bh=61p2GGr1ig3ZyXs5AWxlKks0FS90BWP4d5e8qps9pGM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CgjaSmP1faK4m3zo+Nb6mIuvhMr9P6B2URQZBpDKrkl3swQXBJrrbRIG5Kr3L/Miabu5h1YOZdir5zTonI99Q2PlprejkW2N6YuI/jwkIhKNGdXNJv93b89X6FRKWplwPWBCTCJew3dDrkq9S6rubNUO9nJyQIbPokrSjEwoq90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lSZtTBm4; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lSZtTBm4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YO4b87XmGuwGu8C7fGD9UXYGi80wSXbYdrve3I1PrubIfFIx+ewvulSUOGsIkeU8wlsg2T5mE7Ge6hjBOzltWuBcBV9bw2hq5745yWmxP58OTptuJ1VnaqMD2VfD0xlPfilwdENhe00DG/WdpunawATawtoOe8gwIrfQriewyEBgYlTO5aM/bUEj5xWTGOksdftF+LGt1x8EwkMgeJny1UpJ/q/k2HctVkWyRwxsggupSoLoMdXBO6Inx7bhQbRSsem96iaEPJoKowyqtDHXnzJ6sVPWX7PRS17qne2vYige4sSa83TE8Rre/zQariQGG4sCKy/MbBwZbgP/glzBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61p2GGr1ig3ZyXs5AWxlKks0FS90BWP4d5e8qps9pGM=;
 b=myvnYPIXrLeAJDEXy2ghvilllJC3042yXwZqwizKzp8zBe045eoW0EnAqtAssztToifkW+3rl7GQqMVYTPm0IByvMjYvAtWHArjPKamxrw2BbXlegmMvHBXdO7k7P4qmN9Sbi60Y6uDJLTad3kx1wukfPB2uPRFQtzmoiSEctxvkgqGreSRwPyxtEgeiLqDqnWGanuKL1skytDszB/kPJO0yESrEoNmblzqlEQUgSIwox+0GmelY8j0NeV4s9ov9S1oMPfnrikykRVXrnoJsQhZ0jlhnE8jWX2u5OfymrRCLmzssj6VKW1cPr+tIrR3Ps4ZmX629evHue5ZNTI4AGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61p2GGr1ig3ZyXs5AWxlKks0FS90BWP4d5e8qps9pGM=;
 b=lSZtTBm4VFKTBDTfxo8kZiOz2qDtbHoPQah9W6fOzZMzn2tXWUTVfL5IYV2LjtpCI3RkkYdo8zGWj3l+kQjQNka9oQ8sVf9B7AS6NO2qUZSFbPJ8dZ62lyeFZXMR6gdtg600pA5y7Bj2TBsuf3WzaAa+burBMUB+pr6IooLV3zk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13943.jpnprd01.prod.outlook.com (2603:1096:405:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:02:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 17:02:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexey Charkov <alchark@flipper.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Thread-Topic: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Thread-Index: AQHdMYh/GaePGh3EYke4zncNvw0csbaouXPQ
Date: Fri, 21 Aug 2026 17:02:55 +0000
Message-ID:
 <TY3PR01MB11346E91C25009FE7C45387F986A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
In-Reply-To: <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13943:EE_
x-ms-office365-filtering-correlation-id: 8430e114-4d42-4c27-bf97-08deffa60b67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|38070700021|56012099006|10067099003|5023799004|11063799006|4143699003;
x-microsoft-antispam-message-info:
 dOLONwlstNrEYXzxD7qnPhTSVTUulUgWVy7pchNVN5srEl9XD46XOHxpI5b+2jQhplHU8PHcPI25SMq8Njkgbz90cOH5k2tBRWIibo/Elie/gSErBbFhac+N7dL03ZGLjGC2t21q1yxufULQGAo1WC0d/UEgF2oJ3IQEbvSWq4zyfSkC9pxFDJBQ6pCN9EdiiX0QlveDLzdTluL/kdlfNqg4kv0+Uad+ZW74jDovt4/LQjCgsgDllooQSAQ+/doz/LeXfMzpluaux2FGZ20xdekhHFsQW/7kQxwCB18ZQcqfY8Bp7FfXsMY2t2InUwksaLgLspjZCgrlmu7LtxBcrbKW8S5N5EBwjWHq/xNNdRZUxZtzyQ4qdbMsJyjMCVhWFuGy8aZ6DT+aeD+UDYCMmTEPTPQxq+yjdhWtL9dS4VPkhJgluwyMDdkP5viQ2V2FdWS4iEEt/TO2K1D7WoCfAVsiwfZJ3hxz0r0W3teJhFWDLJN+0HVrXMoaURhsAHZHGqsNXdgx2lV2jXKMaPO9yI5hPKpIqOqjOQ4sfSKRL45tPqAklBdl2/050nRV/90zVH/INukbhpe0bz/76g97Fsy4+bF5r8fcly9WCjRxbtrjbJ0VrojN0dil+lgLHHza4mLinJas8a56zntcS2OXULyizqd9DyWrQwUTOnU9qqU11K+rf7ftiLgvJNwy/xKSSie4aOEXj3DYcyh93djBNe8s9uP+NIi+VNQuefVyZus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SlowVTVOMDhhbTJiU3ROeDZmYVZpMDR4U1RZckJrc08xUURoQ3k5eld1OUda?=
 =?utf-8?B?eVdYdHllYXRDUTFLdVppeWlPT2QrdjNNK3owYmxBbmVUY2NUY216bWJ3UC93?=
 =?utf-8?B?a3pDczVCZVFoem1GZDFUaWR6NkhXME5ocnVuYVRGK1BBSUtJN0V0aktNOHpo?=
 =?utf-8?B?U1lFMVEzZXhGaGRra1BNQnVGRWk0bDUyV21wSk02WWxPMUd2VjBuWURKT0Rp?=
 =?utf-8?B?OVJKRXIrOUh1MlVLWmxPWU5lUnBmMjRoakp2VUVPd0JSeU15djIzTkJkbThr?=
 =?utf-8?B?eDNzTmhxditkTTUrYkU1ZEU1djBqRXppSnNYeGdBKzFMWDg5TGVFckZKc3Fn?=
 =?utf-8?B?TFdobElTMGNnNlRxSDR4UHpWQmc5L1pJZTd0dVpTNEdRVzlCRFBidWloekVx?=
 =?utf-8?B?cTdjb0swaGZnZmhXOWd1RUJ5SThvU1JEVFBndmt4MDRGWFlYN1puT0o4bmpL?=
 =?utf-8?B?YWRFVFZDb1IxMkNna1RnUUtWVmo2c29UeVM4UEhGVEtWd1BvWTE2ODhSMVhG?=
 =?utf-8?B?cTloSFJiRU9DM2xjbkJlSGN2ZEtGamY4Tk5tcGQ4NXFIYi9BenFpMzc3ZVN4?=
 =?utf-8?B?elFrTjBVZjdPY0pOVkVtbURIL0VRUlJUVUhjQmhuY3pOVXFVZXFtTWJZVWhr?=
 =?utf-8?B?dy9manJkKzN3by95MEFOdU9ubEFHMWlYbjJuUUVkZDlrTG5CL0pENy8vTVQ4?=
 =?utf-8?B?d1ZkS1FZOU5wZURBZWxFamR0WFlxTlhaRTVIN2tFRUY4REs2dm0rOEJmV2I2?=
 =?utf-8?B?WUg0WmpaSlRNZ1N5VTEvU0JpNVhWaUFjeGdlOWdKc3VtN3pMYVZ1UStBZTVj?=
 =?utf-8?B?SkFqRlNyYldZNTlWWXJsQzBVZ0g2cEwxbkhYb0xqRWc4RWhNbHBjM2tnRVJ3?=
 =?utf-8?B?d2tIZHRRWHVFd3VPUWNBSVFOV0huc1h3YkNGdStxZ0NveWJFOEgveE0zeTZj?=
 =?utf-8?B?eHdUWkROUTFkNDhPQnlQOHdWdjhqZVZYeGlidnhjQjFUTTBHQk1wU0dTWlln?=
 =?utf-8?B?M0hnTVplTHpVM2NZQmdUbWp3cVhtRDhMb2t2MVJqS0RuWXJGUFFlRnhCbUxR?=
 =?utf-8?B?b1lGVGJIaUNhakxsSXVOejlzZ0Z5blhWVGc3T0x5NG9FTlhUYkJBWHUrVWR0?=
 =?utf-8?B?em5ROVFmZ3ZqWUhjejlZdFd1U2lwNG1kc0JjZHNQNGtGdnhSTk5EdnZnakth?=
 =?utf-8?B?VHA3V1NzMkJUMjFQWU9kWWJnZW1JNm04ek1ESWVEUzRZV1VYT3A2NmtmQlFU?=
 =?utf-8?B?ZzcvcC85eFpJQVlGYllwNURINU9NaTVJZGc1UzVhSVpWSGpnTXJzeUxVR3Z5?=
 =?utf-8?B?THFwU3ZWay9mcGlJK2o4eVo2MllJZjFPcWZweUx5UTlZYkc5VHhESktCWmg0?=
 =?utf-8?B?UmNYejNyemhxTjA1OXMzdmU3Wk4xZkJhUlNNY2NDb1RCMnpTMUR3Qm5HRDNE?=
 =?utf-8?B?OHhGK2tJWURWV0dnSmRCTG9mbTdJN21UVHVHQXhTc3FUKzRXbTJrT2xHQXE0?=
 =?utf-8?B?Z1dIZVR4SnpUYnJsaE1iSUJMb0hOQmMxdFh1VFlvaTNWYjFiWUpMaVpmMlZq?=
 =?utf-8?B?VnkyeVZkemR3Q1B6VlR2K3laRS9mQUdrMkFzQzdQRENvRFZuNzBVazIxRjZW?=
 =?utf-8?B?YXM2RXI3bVg1REtRQlVIcW4vcWFjWGsxZ2tUd2NYZEIwazNMcXNHeHFjNzZI?=
 =?utf-8?B?azczU2wvZkwxS1lpMXFGeE5BMVhHZExNZFJPaWYvZTZrTlppdDVUS24ralhE?=
 =?utf-8?B?ejYvbmxlSmN3Y3lQcysxK1NNd25GK2Y5RVdBdjNQaFhiaDEzM3JLaXhnbnUy?=
 =?utf-8?B?UCtveFRycm1MTVdhcm8vTjZPRWdyR0xSQlZKT0lGSUUxeE5QR2FsQWtGTWFO?=
 =?utf-8?B?eGk3eFUrelk3V2hCTGxHdENYZ216UDZFS0lwZ0Q3Vkdvc1ArSXJpZDVBbjRD?=
 =?utf-8?B?dmhMcnBnTXlkM3E2c3d3V0k2VEJuUSt4eEJZRjFtaDRnSy9lRnB3ek1QbmVF?=
 =?utf-8?B?akZ6dG5IMVVyWDk0dWpCWHdKVGJGZHlWdWtaT3lka1NMY3JWbXZ0WjNVQ2Ny?=
 =?utf-8?B?T0xYYjFnSHFuekNxVEdvWGIyMkVyVjZZOWFuVnViQTFHb1poaWhLR1l1bEZx?=
 =?utf-8?B?bGRxZjNiUEl4SFl1STRRTUx6bzFHZHEraGhlbWZQSHpBakZrNmF1K0M4Vmg4?=
 =?utf-8?B?dmNNVHI5andZYWlZNXZLcmxIZitHUEdZSGZTcHYzZE9vUjllaDJScGtrRnRT?=
 =?utf-8?B?enNTa3laSm9JN0RQSHZ1TVVPNHU2cUFiWGs2WWp1N1hKZEQ2VUYyQ3M1bXdR?=
 =?utf-8?B?ZDZIWlljaFJ5aE5pRHVZci9zYW44RVdJOXBTRFUwZk1MVldpWXpXdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8430e114-4d42-4c27-bf97-08deffa60b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 17:02:55.3614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHFhuJ8lAPwLn/AnsznS+IQvE+70EB8B9eTm3Py/l9ky4hnGnlMpTjuShf8K0Sk5O9FcDGZqXnIucpBTyEKlKjzoWPPMVyXrGdVYJoyCXCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13943

DQpIaSBBbGV4ZXkgQ2hhcmtvdiwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGV5IENoYXJrb3YgPGFsY2hhcmtAZmxp
cHBlci5uZXQ+DQo+IFNlbnQ6IDIxIEF1Z3VzdCAyMDI2IDE3OjE3DQo+IFN1YmplY3Q6IFtQQVRD
SCAyLzJdIHVzYjogdHlwZWM6IGhkM3NzMzIyMDogQWRkIHN1cHBvcnQgZm9yIHN1cHBseSByZWd1
bGF0b3JzDQo+IA0KPiBIRDNTUzMyMjAgcmVxdWlyZXMgVkRENSBpbnB1dCB0byBiZSBwcmVzZW50
IDJtcyBiZWZvcmUgVkNDMzMgaXMgYXBwbGllZCwgb3IgZWxzZSBpdCBnZXRzIGJhY2twb3dlcmVk
IHZpYQ0KPiB0aGUgMy4zViByYWlsIGluIGEgbm9uLWZ1bmN0aW9uYWwgc3RhdGUgYW5kIHdlZGdl
cyB0aGUgSTJDIGJ1cywgYnJpbmdpbmcgZG93biBhbGwgZGV2aWNlcyBvbiBpdC4NCj4gDQo+IEVu
YWJsZSBib3RoIHJlZ3VsYXRvcnMgaW4gdGhlIGRhdGFzaGVldCBwcmVzY3JpYmVkIHNlcXVlbmNl
IGlmIHByb3ZpZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGV5IENoYXJrb3YgPGFsY2hh
cmtAZmxpcHBlci5uZXQ+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvdHlwZWMvaGQzc3MzMjIwLmMg
fCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy9o
ZDNzczMyMjAuYyBiL2RyaXZlcnMvdXNiL3R5cGVjL2hkM3NzMzIyMC5jIGluZGV4DQo+IGQwZGU1
YTI0ODhmOS4uYjUzNDU1YWJjMDQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy9o
ZDNzczMyMjAuYw0KPiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy9oZDNzczMyMjAuYw0KPiBAQCAt
NDksNiArNDksOSBAQA0KPiAgI2RlZmluZSBIRDNTUzMyMjBfUkVHX0dFTl9DVFJMX01PREVfU0VM
RUNUX1VGUAkJQklUKDQpDQo+ICAjZGVmaW5lIEhEM1NTMzIyMF9SRUdfR0VOX0NUUkxfTU9ERV9T
RUxFQ1RfRFJQCQkoQklUKDUpIHwgQklUKDQpKQ0KPiANCj4gKy8qIE1pbmltdW0gdGltZSBWREQ1
IGhhcyB0byBiZSBzdGFibGUgYmVmb3JlIFZDQzMzIHN0YXJ0cyByYW1waW5nIHVwICovDQo+ICsj
ZGVmaW5lIEhEM1NTMzIyMF9UVkRENVZfUEdfVVMJCQkJMjAwMA0KPiArDQo+ICBzdHJ1Y3QgaGQz
c3MzMjIwIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICAJc3RydWN0IHJlZ21hcCAqcmVn
bWFwOw0KPiBAQCAtMzU4LDYgKzM2MSwzMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaGQzc3MzMjIw
X2lkX2lzcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+ICAJcmV0dXJuIElSUV9IQU5ETEVEOw0K
PiAgfQ0KPiANCj4gKy8qDQo+ICsgKiBCcmluZyBib3RoIHN1cHBsaWVzIHVwIGluIHRoZSBvcmRl
ciB0aGUgZGF0YXNoZWV0IGFza3MgZm9yLiBQb3dlcmluZw0KPiArVkNDMzMNCj4gKyAqIGZpcnN0
IGNhbiBiYWNrLXBvd2VyIHRoZSBkZXZpY2UgaW4gYSBub24tZnVuY3Rpb25pbmcgc3RhdGUsIHdo
aWNoDQo+ICtncm91bmRzDQo+ICsgKiB0aGUgSTJDIGJ1cyBhbmQgdGFrZXMgYm90aCB0aGlzIGRl
dmljZSBhbmQgYW55IG90aGVycyBvbiB0aGUgc2FtZQ0KPiArYnVzIGRvd24gICovIHN0YXRpYyBp
bnQgaGQzc3MzMjIwX3Bvd2VyX3VwKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiArCWludCByZXQ7
DQo+ICsNCj4gKwlyZXQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlKGRldiwgInZkZDUiKTsN
Cg0KTWF5YmUgdXNlIG9wdGlvbmFsIEFQSSBhcyBleGlzdGluZyBkdCB1c2VycyBkb24ndCBoYXZl
IHRoaXMgcHJvcGVydHkgZGVmaW5lZCBpbiBEVC4NCg0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGVuYWJsZSBWREQ1XG4iKTsNCj4g
Kw0KPiArCS8qIE5vdGhpbmcgdG8gc3RhZ2dlciBhZ2FpbnN0IHVubGVzcyB0aGUgYm9hcmQgZGVz
Y3JpYmVzIGJvdGggcmFpbHMgKi8NCj4gKwlpZiAoZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoZGV2
LCAidmRkNS1zdXBwbHkiKSAmJg0KPiArCSAgICBkZXZpY2VfcHJvcGVydHlfcHJlc2VudChkZXYs
ICJ2Y2MzMy1zdXBwbHkiKSkNCj4gKwkJZnNsZWVwKEhEM1NTMzIyMF9UVkRENVZfUEdfVVMpOw0K
DQpObyBuZWVkIGZvciBmc2xlZXAgZm9yIHRoZSBjb25zdW1lcnMgdGhhdCBkb2VzIG5vdCBoYXZl
IHZkZDUgYW5kIHZjYzMzLg0KDQo+ICsNCj4gKwlyZXQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5h
YmxlKGRldiwgInZjYzMzIik7DQoNClNhbWUgaGVyZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+ICsJ
aWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8g
ZW5hYmxlIFZDQzMzXG4iKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0
aWMgaW50IGhkM3NzMzIyMF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KSAgew0KPiAg
CXN0cnVjdCB0eXBlY19jYXBhYmlsaXR5IHR5cGVjX2NhcCA9IHsgfTsgQEAgLTM3OSw2ICs0MDcs
MTAgQEAgc3RhdGljIGludCBoZDNzczMyMjBfcHJvYmUoc3RydWN0DQo+IGkyY19jbGllbnQgKmNs
aWVudCkNCj4gIAlpZiAoSVNfRVJSKGhkM3NzMzIyMC0+cmVnbWFwKSkNCj4gIAkJcmV0dXJuIFBU
Ul9FUlIoaGQzc3MzMjIwLT5yZWdtYXApOw0KPiANCj4gKwlyZXQgPSBoZDNzczMyMjBfcG93ZXJf
dXAoaGQzc3MzMjIwLT5kZXYpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsN
Cj4gIAkvKiBGb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBjaGVjayB0aGUgY29ubmVjdG9yIGNo
aWxkIG5vZGUgZmlyc3QgKi8NCj4gIAljb25uZWN0b3IgPSBkZXZpY2VfZ2V0X25hbWVkX2NoaWxk
X25vZGUoaGQzc3MzMjIwLT5kZXYsICJjb25uZWN0b3IiKTsNCj4gIAlpZiAoY29ubmVjdG9yKSB7
DQo+IA0KPiAtLQ0KPiAyLjU0LjANCg0K
