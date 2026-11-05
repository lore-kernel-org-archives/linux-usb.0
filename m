Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793870177;
	b=oz/oeWoHngQn0vrrKATuBwttSH52FwmWPXeyuDgX0KPMG3kXbGEF8hszJjahz67rQIjn
	 H/G/4e32Ori3tsyuwh+udSR7c2xy/MbKP18zSClgTrpsC75Pg79EFcmuXQDYy4+UvmyNI
	 pnE9IJUhA5hXEao0h5Cfi7RvypPy3ldfjtNfkmYPmmyXBUq4KtO1uSV24QgqlV6CCKzuR
	 mLyRdpo4DwCZx+qlxId5mI+TTTfH6Awdye9smDWTiPD8IA7aGNyf8XNSuu6Tfg5cuo6ch
	 IOGXWt5YAPN10t4xmMZ9kg+hp9uFvt3vU8ehSw0EGiMtrEUgMts1ZGYa2oBc/TBBxow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870177;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=btO1r2cHoCtSOpMR9R2JGws96LDIujIQmm6cEFMY6Os=;
	b=Y2ySaDXdWKd3CQHUPziPBKuPPuAUeM1OeNTF8b26pStA/M84O3MLdyXA4ip8F66ancsw
	 iPaZa9okhIcZEzvasMf09Ygu2USnpJZJ5mgV+MjkjjgImnJ6fZ4O/RQEAQWI2SlvoHcIY
	 hMXt0zdKvfsBVVLZx0z9JvEa0xxWs4UByFonlVwRXxug787Z8z/OnjxtO3cWm/lN6TXDl
	 JYPPTJJFU7bDuk267+Tbt20YjeWzqTLy0HSSaOb3STjA1lxhAkKlHXDB4LQF8u0bthPo7
	 V7OY7w0++4EQCTFGCtUV/4uLiPvm1M/49e0AcJ94zXLj+ejbunam8rP27XWiLQk76Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JBtrB1iu;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=iKH1Obq6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F734606A328
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F734606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JBtrB1iu;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=iKH1Obq6
X-UUID: 8a53dc20d8f911f18dc8c9802ae25ab1-20261105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=btO1r2cHoCtSOpMR9R2JGws96LDIujIQmm6cEFMY6Os=;
	b=JBtrB1iu4ahUprKJkAsWH4uYfyVTlreqTbloPuIO8yUivuaT9oyg8p+Qj16qeOFKYuA3hOSqGtowW+wRhAiUCMTxfoUup1hEw3EGmR5obEBJjlERJh2hEDceD96yDRtVONE6/mC4Fc5/dKdmm2D75wVuonyqQ5o+PxkVlDO+Ygc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9e8748ec-8668-4d0b-a6b9-d12352fc381c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5eecd0ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a53dc20d8f911f18dc8c9802ae25ab1-20261105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1600767066; Thu, 05 Nov 2026 17:16:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Nov 2026 17:16:09 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Nov 2026 17:16:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWFp8PoKLfrPSwxPthb6RWVdhyL8CsNvPq0BuaEAyWSGV/pCGLvltZK7wkag5DUDKoz0qV+a+Rx/j50dRYgclLdsc+ma7urCSl0JaWGHV7p44A7FPMrN5Lhjco6lVQc7oq33F8j9n3+WyiH61TMjirmlv4bsqXtR80YKmHoCJVoZ2jSE+/F+tf3DeBEokVxo9mTrhEK+iXEudxoLJ/7GqYeCZ/MpAl+QH2Or7mQ2oZkUAjkkBA+m5ipsRREaWPC/qYLsrG5JxyYzhTy1wTKg+t7Gbh/+uyYmd3pWURsvhZwerxGk62amOUaTv3gzyAqdTKgsSYKf/jJ/aZK+nyhlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btO1r2cHoCtSOpMR9R2JGws96LDIujIQmm6cEFMY6Os=;
 b=V8ocGKlzcRJJ4WZfJvssV5eW3pf+OnZHgwqqZgE8WVF3qFF2CkUJq+AxdfpGuRtvUn5kI1jtLZ2xK5rKs7smyj1iH3CYOH4OexIDjbpS7ZPbpqd2fmLds8tqpBN64NeF652+jmbb8YA67bZSBxO+QrZM9URmJ8b/6cK4JLX/p/Hn+f2+rPQTXlYzZz56t1YS33+65cGt3rE9SdkfQKQRG6TmRkSMU9zcdL8ZnxD0CmAc3uvunWYk//4f+E2DtYjvRjLMtbKqRr+6Db1VHQOiujSbFE8mGfizN9XQid+tQzBSkDBCatRGl/6iduOFeEG7VErDcIO9hzAg0HDQEfDc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btO1r2cHoCtSOpMR9R2JGws96LDIujIQmm6cEFMY6Os=;
 b=iKH1Obq6fArqyYgngw3ueKrTUl91eMuP6BaYhZFxvM4gu6TZ7WFXuv+4GpOFjwuaQdwLMpBXUjecER4G2ib7cd2dAfBVwUL9/9EsHTSegdVpZgN+yIeqYWfIE4lCr5d0GiaPpv3yUb9MzNrAp56SYD+zXZZAeLwjVcQLo4hB1fw=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB8149.apcprd03.prod.outlook.com (2603:1096:101:174::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 09:16:06 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 09:16:06 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Topic: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Index: AQHdaEhMvwQ7X9y2/U+m6TxIF+UpZrcVxvYAgAl1C4A=
Date: Thu, 5 Nov 2026 09:16:06 +0000
Message-ID: <f45a321173e6a2a8655995624409fe9946ba6730.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-190715@kernel.org>
In-Reply-To: <sashiko-outbox-190715@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB8149:EE_
x-ms-office365-filtering-correlation-id: cfe75591-1c9d-4eb0-e690-08df3b1d6c18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261028144727099003|261021121427099003|261026121527099003|261022075727099003|261026140227099003|261009223027099003|38070700021|261102123227099003|4143699003|11063799006|5023799004|10067099003|56012099006|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 8ihWGCZ33dNoL4IKQroWWwA9MTJYamqN816vU4X7Uki63UWNlUmyBq0HpvPP9aIIYfRKLGU4CH8vTt3CbOcrNHosYpSvhr408f5iO4NmTanMU3dt9TztBDt9cRo+Ar/H5b3gT2IryJm2OjG2tKjiBM2SOUkrYbzTUUZ3seJZdY/0WPpHpsqIxxn9KvpJg9E3FJApZiBKpDaIafNi9sKRsNrNgq91uwygJ6w5GKz9N89BZna1lVT4kTHV0MXEiqr5rhXJwWtxhszzWcyYfoA95t4o1n5EAw+w9WA8CIADJmrzePvwRZHfpFmTEjp0G8+0H8KcAuZKPaw+VZqkmTByhbpp+upV0fNq5ebxBkcufvmLnKlkSeeVYqOu53DVfl6/wDrAxmpkrNEBs12vIH5LR6llAESO80pHaqYGKmWFg/Jpi4op/9Yd2YOhRUVc7AS1IopwvzVcBU3UumMoYBLuXfkv5j9jLumqfwYzlznG3qRxk7/30VAtVnL+ENWy9zJQG/REBzlW9a7B3QvXaGX4HEzy9glwNJnqtCgl6RkoPW5+wP8TuEpltdC8oX4eg5MfTN5KNTTFPqngMuwIG+utyW4tWnDde+aGw/JDnfXWKsqujP/ZS0tLwLJ0RSjMw9tSLJP/taU9PnST0OtkUrk8PkOCBy5MuiZXdzuLmD7X8+/GfuBGeDDbY7qFUYtJFCkrWhCPIXHXY/9pMvxMlexcMaC4G7uSXc73ovCrkEIPXP8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022075727099003)(261026140227099003)(261009223027099003)(38070700021)(261102123227099003)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnVsZDhXOHFuUmtIckIrT0orcUx1VUlUbU1IcW9vdlJuT2kzVlY1RUxmWlVu?=
 =?utf-8?B?ZWRMUVU5SzcxZTUzWFBCVmdDaWVvQmNydGVHa3hibi9qL1FCVG93dm1FM3l2?=
 =?utf-8?B?UkVMa09PT3NtRm1JYUlqTUtUM2UrUUEwWUNOaXAxUk5tdGJiVk11ZjJNeEJ0?=
 =?utf-8?B?aDR4TFRuZVpvc3hPMllDbXhyblBvRmtDMHhtOE9DZndZcHZDdXBCd3lmdmIw?=
 =?utf-8?B?YlhGK2ducEo5SjNJNmJDVnY5akZMamhvYWh2MUJOYkE1M2Z2VlJDZnZJYklh?=
 =?utf-8?B?L2ZqU2VrUTNPRjdaNTNHM1JhREtUQlJ0ZlZBWVUyVFlZNFoweldnUkJkbmNP?=
 =?utf-8?B?cGx2aGU5WWc2aGNTWG1CV0dBSVV1N056blRjTFlFMFVKMk5LMmFTUW96ejQ3?=
 =?utf-8?B?bUtQRzkzYVkrNXBMUU5DVktjZ3BCM1BLTVpUK3k2ZmsvNjhSMnhrL0toMEt0?=
 =?utf-8?B?cDJOMDlKRHBxclJqUFYyeDVHNkpRNnVWdG9GYnFpR1kzcnBwdUVkckIxMVB0?=
 =?utf-8?B?eEZDaFFyVjdMdDVwWU45b2M4eFVIMVJIcDNPSWxXaThzbjVrWnlDTVBFeWZC?=
 =?utf-8?B?cGFMTzJycFE2UUJaTWRhZU5tNmZDdWw4akJtZjJWaFhkSzN3cHlmNHRBMkND?=
 =?utf-8?B?SGJ3MW1qYjZNdWhTZDJLS0IxblF0WGdRUm5nSnhHcm9yb0pmelRwSlNsdElp?=
 =?utf-8?B?aXRNdkZPalg4UXhaUU13VUZMNkdsQzNMczJQSFNLRTZZWEhpNmpXNXRCa0Z1?=
 =?utf-8?B?cVVndHpiMS96MDA0YWJsSER5LzlZZUQvSXZUejBCano2dFhYeVY1QUVMamNR?=
 =?utf-8?B?dnB0MDBwNkhiYlc4L0NFb09nTEcwTnlwR3VYSXI0ZjVubEZCUEJ3WjExcGtL?=
 =?utf-8?B?S1VPQnl0SFh6dmRyZ0VkZll1dHlXL3l5L0FtV3d6ckN4Z2lENmNEK3JsRWRv?=
 =?utf-8?B?YXJ5bzFGeHh4NVQyejM1NCs1MlBhZUM5dlAxL1g3akxyc1JrOFBEVnVkaHgv?=
 =?utf-8?B?VWNSMWxlQ1p1NEhHK0E1OUI3SEpRU3RtS3pzcmZIWDVwUU8yaG1ST3JVRHpS?=
 =?utf-8?B?UHdVZGlpcGlPNlFWV2lqcC82UTNaTkZscGFvQVl1SDN0cjdKbEcyQ3RKWDQ1?=
 =?utf-8?B?cXpmRDcxdTBSWmJCeC9BVWdtOFYxYUdCUlcrV05abHhCUFRDeXNVYW1pT2xJ?=
 =?utf-8?B?NkZ6b2ZORkhXNEN3NS94alRoREkwZmFzeUdYQzkxbk43NzdKS29rL3NEc0dG?=
 =?utf-8?B?UFRyRXZEQmpyLys3WDZOKzBFMDF4eXozWS9LMUNkb1FwcXBWWVpNdzEvbS9Z?=
 =?utf-8?B?b0hEYzBHVDExTkpNcEhWZnVXWVVmUG5GM29Jbk9zc2JYVE0ybmkwOGc5YTFM?=
 =?utf-8?B?bHRaSTI5Z09iWGxDOU5tUUJCd2R6SjEzWHFxYnRYcnBTRWFTZjNLdWZmZTVJ?=
 =?utf-8?B?bGozUStaTWg0N2dCY3NWRDRsZThtQTUrWWNzWFVFMm5PZW9VZlRmQ2g4QjZu?=
 =?utf-8?B?N0dEWUpEcGRTd0ZkczQwNWd0Uitjam1GTGpQUVBPYXRnZXlqZk5MYkx5L0Iv?=
 =?utf-8?B?S0JSeFIwTEUyamkvOVpUQ1dFSE41cGttU01rN0VyeWZsTlNKemtFR0ZxVkJq?=
 =?utf-8?B?bzlsMnVIMGdlWllNei85ckRIRGxzaGd1WUt0aUdFejI5ZXpCbEZMMVBGK1lO?=
 =?utf-8?B?RXRmNXhUSVBKSWc4TU5YMEozZG9RdmZ2RGdpSlRWdVNqaTFVRTlCR0tFL2NL?=
 =?utf-8?B?OHprVEtrTFlBQnNXNW9pcjJWdjBjSXhEdXh5SkxIWHlpL0hYU1hTeFc4V29o?=
 =?utf-8?B?WU52Q1hNWi9jM2tuWnloeFRWSDN2MzVZN3dnQ0RTREkzaUI0WEtsQ3BZd1g2?=
 =?utf-8?B?cFlIUWpYbzZ6N2ZXTTVCTW1DMk9oUmZrMktZSU4rNXg4VzRqdmx5dElKYytx?=
 =?utf-8?B?blR3anFGTzd1ZkIyTGRJQk5VNW4xQlZDZGlvVG1oTW9lanhTSHBUdzdvb2Uv?=
 =?utf-8?B?NkZLbE5ZM2NtQVl0THRyVld0bWdObytZNytkY3FTMEhpNVRGTi9PclNqbzhR?=
 =?utf-8?B?YnFBY1BpTkxiUFVaMW1NL0NmVmdrNGMvQStHNXk4amNjMXc3VnBJWmNqY21k?=
 =?utf-8?B?dGxDZkp2MmZTeVNROFN3MFBoMW1EUVJHdml3ZGtQMWdtTklMQnlGU09DOWtO?=
 =?utf-8?B?VkNTcnd5WlgvQTcxcnplV3RVT08xeTYwbVZvQXZxR08yMit2V1RZNFlCUXVp?=
 =?utf-8?B?NDMvM2JoVmpyWTZ5cUt0UGRxQUg5dVpvMCtMTXBEVEM1OVRNeDJzT1hHejN3?=
 =?utf-8?B?S00xZE5jcWg3SERkZFNFVlJXT2RLajNTNDVESVoyOWxCM0FNZi9HamZESTRT?=
 =?utf-8?Q?Xh9dJ05VIimmH3V4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F1E3D4CAC0CF24C8A4379B5935AFDC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 37nyP0aTFWr4Rj4iJNeh51Wda5uvetMtiNBl67lEKz6su3QYYjfZl2BmIrTc3RhHWauITxOp4kc05FOqkX8kCOHSPSLN5j/56W8XQO49dqPAwAARtgDT/Ufbq9K9oQqUj/AMS/an/FVlozd1mGqppcZqgbDIiXXyeTe/zv5KunX9ApekCr6yTQV4/cEkTmz5GzDomXe0VWfuBjOqbXDbl3Wy0If+9Q/rO8i8OeUTx7EjaA7t3M+Uqnb1u0zYGjaWWCFbxTH0AqY19dHyifgv+SHBd3Saxeks6EPKn9aBLlD+2gtYTppKKHAfbunT/1VGMm4ld4IMPzh23oRTl2Zxkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe75591-1c9d-4eb0-e690-08df3b1d6c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 09:16:06.3202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7e7dtHqg8VltZxsIgiAmB7VyZySCxjuxoZ1/XolPXAHZ9M+nrHYNNZWYjMyk9DYOVcXWo/T55KDJnoS3PEBEwHz8TPsXYbeESTOE+Pr/Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8149
X-MTK: N

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDA4OjUwICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCA0IHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVk
aXVtXSB0aHVuZGVyYm9sdDogd2FrZV9pcnEgbmV2ZXIgYXJtZWQgZm9yIHN1c3BlbmQgZHVlIHRv
IHVuc2V0DQo+IGNhbl93YWtldXANCj4gLSBbTWVkaXVtXSB0aHVuZGVyYm9sdDogd2FrZV9pcnEg
bGVha2VkIG9uIG5oaV9wcm9iZSgpIGVycm9yIGFmdGVyDQo+IG5oaV9wbGF0X2luaXRfaXJxKCkN
Cj4gLSBbTWVkaXVtXSB0aHVuZGVyYm9sdDogbmhpX3BsYXRfcHJvYmUoKSBpZ25vcmVzIC1FUFJP
QkVfREVGRVIgZm9yDQo+IG9wdGlvbmFsIHdha2VfaXJxDQo+IC0gW0xvd10gdGh1bmRlcmJvbHQ6
IG1pc3Npbmcga2VybmVsLWRvYyBlbnRyeSBmb3Igd2FrZV9pcnEgaW4gc3RydWN0DQo+IHRiX25o
aQ0KPiAtLQ0Kd2lsbCBmaXggYWxsIGlzc3Vlcw0KDQo+IA0KPiBjb21taXQgMDAzOWYxN2Y0NjZm
MmExOWJhNWZkNDVlMTljNmRlMjkzNjYyZjU4OA0KPiBBdXRob3I6IENodW5mZW5nIFl1biA8Y2h1
bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IHRodW5kZXJib2x0OiBhZGQgc3VwcG9ydCBv
cHRpb25hbCBkZWRpY2F0ZWQgd2FrZXVwIGlycQ0KPiANCj4gVGhpcyBjb21taXQgYWRkcyBzdXBw
b3J0IGZvciBhbiBvcHRpb25hbCBkZWRpY2F0ZWQgd2FrZXVwIElSUSB0byB0aGUNCj4gcGxhdGZv
cm0gVGh1bmRlcmJvbHQgTkhJIGRyaXZlciBmb3IgTlZJRElBIE4xL04yIFNvQ3MuDQo+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L3BsYXQuYw0KPiA+IGIvZHJpdmVycy90
aHVuZGVyYm9sdC9wbGF0LmMNCj4gPiBpbmRleCA4NWEwMGNkMzkxZDRlLi44ZDgzYjQ4NGQ5NDJj
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvcGxhdC5jDQo+ID4gKysrIGIv
ZHJpdmVycy90aHVuZGVyYm9sdC9wbGF0LmMNCj4gPiBAQCAtMTEsNiArMTEsNyBAQA0KPiA+IMKg
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvcG1fd2FrZWlycS5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4g
PiDCoA0KPiA+IMKgI2luY2x1ZGUgIm5oaS5oIg0KPiA+IEBAIC00Niw2ICs0NywxNSBAQCBzdGF0
aWMgaW50IG5oaV9wbGF0X2luaXRfaXJxKHN0cnVjdCB0Yl9uaGkgKm5oaSkNCj4gPiDCoAlpZiAo
cmV0KQ0KPiA+IMKgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShuaGktPmRldiwgcmV0LCAicmVxdWVz
dCBpcnENCj4gPiBmYWlsZWRcbiIpOw0KPiA+IMKgDQo+ID4gKwlpZiAobmhpLT53YWtlX2lycSkg
ew0KPiA+ICsJCXJldCA9IGRldl9wbV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxKG5oaS0+ZGV2LCBu
aGktDQo+ID4gPndha2VfaXJxKTsNCj4gPiArCQlpZiAocmV0KSB7DQo+ID4gKwkJCWRldl9lcnJf
cHJvYmUobmhpLT5kZXYsIHJldCwgInNldCB3YWtlIGlycQ0KPiA+ICVkIGZhaWxlZFxuIiwgbmhp
LT53YWtlX2lycSk7DQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwkJfQ0KPiA+ICsJCWRldl9p
bmZvKG5oaS0+ZGV2LCAid2FrZSBpcnEgJWRcbiIsIG5oaS0NCj4gPiA+d2FrZV9pcnEpOw0KPiA+
ICsJfQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFdpbGwgbmhpLT53YWtlX2lycSBldmVy
IGJlIGFybWVkIGZvciBzeXN0ZW0gc3VzcGVuZCB3aGVuIGRldi0NCj4gPnBvd2VyLmNhbl93YWtl
dXANCj4gaGFzIG5vdCBiZWVuIHNldCBvbiB0aGUgcGxhdGZvcm0gZGV2aWNlPw0KPiANCj4gSW4g
bmhpX3BsYXRfcHJvYmUoKSAtPiBuaGlfcHJvYmUoKSAtPiBuaGlfcGxhdF9pbml0X2lycSgpLA0K
PiBkZXZfcG1fc2V0X2RlZGljYXRlZF93YWtlX2lycShuaGktPmRldiwgbmhpLT53YWtlX2lycSkg
YXR0YWNoZXMgd2lycQ0KPiB0bw0KPiBkZXYtPnBvd2VyLndha2VpcnEgd2hpbGUgZGV2LT5wb3dl
ci53YWtldXAgaXMgc3RpbGwgTlVMTC4gTGF0ZXIgYXQNCj4gdGhlIGVuZCBvZg0KPiBuaGlfcHJv
YmUoKSBpbiBkcml2ZXJzL3RodW5kZXJib2x0L25oaS5jOg0KPiANCj4gCWRldmljZV93YWtldXBf
ZW5hYmxlKGRldik7DQo+IA0KPiBJbiBkcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZXVwLmMsIGRldmlj
ZV93YWtldXBfZW5hYmxlKCkgY2hlY2tzOg0KPiANCj4gCWlmICghZGV2IHx8ICFkZXYtPnBvd2Vy
LmNhbl93YWtldXApDQo+IAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBVbmxpa2UgUENJIGRldmlj
ZXMgKHdoZXJlIHBjaV9wbV9pbml0KCkgbWFya3MgdGhlIGRldmljZSB3YWtldXAtDQo+IGNhcGFi
bGUpLA0KPiBuZWl0aGVyIHRoZSBwbGF0Zm9ybSBidXMgbm9yIG5oaV9wbGF0X3Byb2JlKCkgLyBu
aGlfcGxhdF9pbml0X2lycSgpDQo+IGNhbGxzDQo+IGRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUo
bmhpLT5kZXYsIHRydWUpIG9yIGRldmljZV9pbml0X3dha2V1cChuaGktDQo+ID5kZXYsDQo+IHRy
dWUpIGZvciBEVCBvciBBQ1BJIHBsYXRmb3JtIGRldmljZXMgd2l0aG91dCBfUFJXLiBBcyBhIHJl
c3VsdCwNCj4gZGV2aWNlX3dha2V1cF9lbmFibGUoKSByZXR1cm5zIC1FSU5WQUwsIGRldi0+cG93
ZXIud2FrZXVwIHJlbWFpbnMNCj4gTlVMTCwNCj4gZGV2aWNlX21heV93YWtldXAoKSByZXR1cm5z
IGZhbHNlIGluIG5oaV9zdXNwZW5kX25vaXJxKCkgYW5kDQo+IG5oaV9wb3dlcm9mZl9ub2lycSgp
LCBhbmQgZGV2aWNlX3dha2V1cF9hcm1fd2FrZV9pcnFzKCkgbmV2ZXIgYXJtcw0KPiBuaGktPndh
a2VfaXJxIGR1cmluZyBzeXN0ZW0gc3VzcGVuZC4NCj4gDQo+IFNob3VsZCBkZXZpY2Vfc2V0X3dh
a2V1cF9jYXBhYmxlKG5oaS0+ZGV2LCB0cnVlKSBiZSBjYWxsZWQgYmVmb3JlDQo+IGRldmljZV93
YWtldXBfZW5hYmxlKGRldikgaXMgaW52b2tlZD8NCkFDSw0KDQo+IA0KPiA+ICsNCj4gPiDCoAly
ZXR1cm4gMDsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IEBAIC01Myw2ICs2Myw3IEBAIHN0YXRpYyB2
b2lkIG5oaV9wbGF0X2V4aXQoc3RydWN0IHRiX25oaSAqbmhpKQ0KPiA+IMKgew0KPiA+IMKgCWRl
dm1fZnJlZV9pcnEobmhpLT5kZXYsIG5oaS0+aXJxLCBuaGkpOw0KPiA+IMKgCWZsdXNoX3dvcmso
Jm5oaS0+aW50ZXJydXB0X3dvcmspOw0KPiA+ICsJZGV2X3BtX2NsZWFyX3dha2VfaXJxKG5oaS0+
ZGV2KTsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMgbGVhayB0aGUgZGVk
aWNhdGVkIHdha2VfaXJxIGlmIG5oaV9wcm9iZSgpIGZhaWxzIGFmdGVyDQo+IG5oaV9wbGF0X2lu
aXRfaXJxKCkgc3VjY2VlZHM/DQo+IA0KPiBVbmxpa2UgZGV2bV9yZXF1ZXN0X2lycSgpIHVzZWQg
Zm9yIG5oaS0+aXJxLA0KPiBkZXZfcG1fc2V0X2RlZGljYXRlZF93YWtlX2lycSgpDQo+IGlzIG5v
dCBkZXZyZXMtbWFuYWdlZDogaXQgYWxsb2NhdGVzIHN0cnVjdCB3YWtlX2lycSwgcmVxdWVzdHMg
YQ0KPiB0aHJlYWRlZCBJUlEsDQo+IGFuZCBzZXRzIGRldi0+cG93ZXIud2FrZWlycS4gSG93ZXZl
ciwgZGV2X3BtX2NsZWFyX3dha2VfaXJxKG5oaS0+ZGV2KQ0KPiBpcyBvbmx5DQo+IGNhbGxlZCBp
biBuaGlfcGxhdF9leGl0KCkgdmlhIG5oaV9zaHV0ZG93bigpLg0KPiANCj4gSW4gZHJpdmVycy90
aHVuZGVyYm9sdC9uaGkuYywgbmhpX3Byb2JlKCkgaGFzIHNldmVyYWwgZXJyb3IgcGF0aHMNCj4g
YWZ0ZXINCj4gbmhpLT5vcHMtPmluaXRfaW50ZXJydXB0cyhuaGkpIHRoYXQgcmV0dXJuIGRpcmVj
dGx5IHdpdGhvdXQgY2FsbGluZw0KPiBuaGlfc2h1dGRvd24oKToNCj4gDQo+IAlyZXMgPSBuaGkt
Pm9wcy0+aW5pdF9pbnRlcnJ1cHRzKG5oaSk7DQo+IAlpZiAocmVzKQ0KPiAJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgcmVzLCAiY2Fubm90IGVuYWJsZQ0KPiBpbnRlcnJ1cHRzLCBhYm9ydGlu
Z1xuIik7DQo+IA0KPiAJc3Bpbl9sb2NrX2luaXQoJm5oaS0+bG9jayk7DQo+IA0KPiAJcmVzID0g
ZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYsIERNQV9CSVRfTUFTSyg2NCkpOw0KPiAJaWYg
KHJlcykNCj4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJlcywgImZhaWxlZCB0byBzZXQg
RE1BDQo+IG1hc2tcbiIpOw0KPiANCj4gCWlmIChuaGktPm9wcy0+aW5pdCkgew0KPiAJCXJlcyA9
IG5oaS0+b3BzLT5pbml0KG5oaSk7DQo+IAkJaWYgKHJlcykNCj4gCQkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCByZXMsICJOSEkgc3BlY2lmaWMNCj4gaW5pdCBmYWlsZWRcbiIpOw0KPiAJfQ0K
PiANCj4gCWluaXRfY29tcGxldGlvbigmbmhpLT5kb21haW5fcmVsZWFzZWQpOw0KPiANCj4gCXRi
ID0gbmhpX3NlbGVjdF9jbShuaGkpOw0KPiAJaWYgKCF0YikNCj4gCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIC1FTk9ERVYsDQo+IAkJCSJmYWlsZWQgdG8gZGV0ZXJtaW5lIGNvbm5lY3Rpb24g
bWFuYWdlciwNCj4gYWJvcnRpbmdcbiIpOw0KPiANCj4gSWYgYW55IG9mIHRob3NlIHN0ZXBzIGZh
aWwsIHRoZSByZXF1ZXN0ZWQgdGhyZWFkZWQgd2FrZSBJUlEgYW5kDQo+IHN0cnVjdA0KPiB3YWtl
X2lycSByZW1haW4gYWxsb2NhdGVkIGFuZCBkZXYtPnBvd2VyLndha2VpcnEgc3RheXMgc2V0LCBj
YXVzaW5nDQo+IGFueSBsYXRlcg0KPiBwcm9iZSBhdHRlbXB0IHRvIGZhaWwgd2l0aCAtRUVYSVNU
IG9yIC1FQlVTWS4gQ291bGQNCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkNCj4gb3IgcHJv
cGVyIGVycm9yIHVud2luZGluZyBiZSB1c2VkIHRvIGVuc3VyZSBkZXZfcG1fY2xlYXJfd2FrZV9p
cnEoKQ0KPiBpcyBjYWxsZWQNCj4gb24gcHJvYmUgZmFpbHVyZT8NCkFDSw0KDQo+IA0KPiA+IMKg
DQo+ID4gwqAJcG1fcnVudGltZV9wdXRfbm9pZGxlKG5oaS0+ZGV2KTsNCj4gPiDCoAlwbV9ydW50
aW1lX2Rpc2FibGUobmhpLT5kZXYpOw0KPiA+IEBAIC04NSw2ICs5NiwxMSBAQCBzdGF0aWMgaW50
IG5oaV9wbGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikNCj4gPiDC
oAlpZiAobmhpLT5pcnEgPCAwKQ0KPiA+IMKgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIG5o
aS0+aXJxLCAiZ2V0IGlycQ0KPiA+IGZhaWxlZFxuIik7DQo+ID4gwqANCj4gPiArCS8qIGlnbm9y
ZSBlcnJvciAqLw0KPiA+ICsJbmhpLT53YWtlX2lycSA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9u
YWwocGRldiwgMSk7DQo+ID4gKwlpZiAobmhpLT53YWtlX2lycSA8IDApDQo+ID4gKwkJbmhpLT53
YWtlX2lycSA9IDA7DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gQ2FuIHRoaXMgc2lsZW50
bHkgZHJvcCAtRVBST0JFX0RFRkVSIHdoZW4gdGhlIG9wdGlvbmFsIHdha2VfaXJxDQo+IHByb3Zp
ZGVyIGlzDQo+IG5vdCByZWFkeSB5ZXQ/DQo+IA0KPiBJbiBuaGlfcGxhdF9wcm9iZSgpLCBwbGF0
Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDEpIHJldHVybnMgLQ0KPiBFTlhJTyB3aGVuDQo+
IHRoZSBvcHRpb25hbCBpbnRlcnJ1cHQgaXMgYWJzZW50LCBidXQgcmV0dXJucyAtRVBST0JFX0RF
RkVSIChvcg0KPiBhbm90aGVyDQo+IG5lZ2F0aXZlIGVycm9yIGNvZGUpIGlmIHRoZSBpbnRlcnJ1
cHQgaXMgc3BlY2lmaWVkIGluIGZpcm13YXJlIGFuZA0KPiBpdHMNCj4gaW50ZXJydXB0IGNvbnRy
b2xsZXIgaGFzIG5vdCBwcm9iZWQgeWV0LiBDbGFtcGluZyBhbGwgbmVnYXRpdmUgdmFsdWVzDQo+
IHRvIDANCj4gY2F1c2VzIHByb2JlIHRvIHByb2NlZWQgd2l0aG91dCB0aGUgd2FrZXVwIElSUSBp
bnN0ZWFkIG9mIGRlZmVycmluZy4NCj4gDQo+IFNob3VsZCB0aGlzIG9ubHkgaWdub3JlIC1FTlhJ
TyBhbmQgcmV0dXJuIGRldl9lcnJfcHJvYmUoKSBvbiBvdGhlcg0KPiBuZWdhdGl2ZQ0KPiBlcnJv
cnM/DQpBQ0sNCg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC90aHVuZGVyYm9s
dC5oDQo+ID4gYi9pbmNsdWRlL2xpbnV4L3RodW5kZXJib2x0LmgNCj4gPiBpbmRleCAyMTJjOGZl
YTY1NzExLi4wNmI5MGQ0NTJlZTI0IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvdGh1
bmRlcmJvbHQuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvdGh1bmRlcmJvbHQuaA0KPiA+IEBA
IC01MzMsNiArNTMzLDcgQEAgc3RydWN0IHRiX25oaSB7DQo+ID4gwqAJYm9vbCBnb2luZ19hd2F5
Ow0KPiA+IMKgCWJvb2wgaW9tbXVfZG1hX3Byb3RlY3Rpb247DQo+ID4gwqAJaW50IGlycTsNCj4g
PiArCWludCB3YWtlX2lycTsNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBUaGlzIGlzbid0IGEg
YnVnLCBidXQgc3RydWN0IHRiX25oaSBpbiBpbmNsdWRlL2xpbnV4L3RodW5kZXJib2x0LmgNCj4g
aGFzIGENCj4ga2VybmVsLWRvYyBjb21tZW50IGJsb2NrIGFib3ZlIGl0OyBzaG91bGQgQHdha2Vf
aXJxIGJlIGRvY3VtZW50ZWQNCj4gdGhlcmUgdG8NCj4gYXZvaWQgYSBrZXJuZWwtZG9jIHdhcm5p
bmcgdW5kZXIgVz0xIGJ1aWxkcz8NCkFDSw0KDQo+IA0KDQo=
