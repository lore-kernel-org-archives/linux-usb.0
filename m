Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793694995;
	b=c8h19XR0lzp9Pp695CEGxDLaICe+K3pKLlTfZyMLqFrAPTYFVAPLIHVnLQ5n4vMAZi6k
	 mUyjekkNIxts6i5yUpfVdhXG/nhwuXDahNbvsdbMhVA8wGrGnwGJD5xx/a7Rn6UE4NEwv
	 ww1e1bzI4b1q3JCKvuUhY/pSIEae0i5Y2/QeMV1k86DjMpZEBmhkpXNIjvZ0eOhpUYzta
	 mRftcpPgOC/MV4QPzTnxDA3YMH1SNWGslKC75nL/mQjNCO6thuOdboh6s7bGFiJU+NeCv
	 a66K4J3pZ9JHZKafDdc3LoncjpmEghdtaQqopcwC2OTh9QdREGT5MEXClBvujLgtnUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694995;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=3/TZUpUKxgvxjPTRtW26iiS15/+Zzn/RmKdaAL9+4NQ=;
	b=5MGNt1BNPDN+tNZuzgAd3JHWb5k4tc3bnivM+1Vw746LejdV+q9QOvqe498SIHNiN0oL
	 tiKOcgto1xXqhU1q4YUwg2+NJHxoKepC8TwoIcTIo3BXjGoLcLafa6m1yBhkOcdwtaA4K
	 Lpkm/ZRWfScgjKfqQBkfwSKbuurGGJ+9Ei5eu0fUE+rDso18kOhqKdYBhulp6p6WKooSW
	 P7Glix1BQLe4ftwBe3ig54dXJx+34VVsDFygS9INOBL9mpEo2TvB5vICUoyL0OQhu0ILE
	 nPxUKeOh9IYVdFJgEUaYay3MRfdXdmWGTrT1VC+YgzEE4C27NCuduhqSfjN/dfpZkOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=N3lD8rTD;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=PlkXSzyw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80C606A335
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE80C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=N3lD8rTD;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=PlkXSzyw
X-UUID: ab5abec8d76111f18dc8c9802ae25ab1-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3/TZUpUKxgvxjPTRtW26iiS15/+Zzn/RmKdaAL9+4NQ=;
	b=N3lD8rTDvCVYsxs2lxuuYhAoDt4F2wikyGXiF51vQkNEhS7w7+ecfvbl0FOSwwTTzS0jdCqlsbRKVVgLpIqZUYAVe73HFFtcuYl5uiW7JMpraGsN5ayJnCk9uf77Xd3MXrMQrxa/KKD5X4XEnJGzsPhroroGP0cqZUTScwLPE7k=;
X-CID-CACHE: Type:Local,Time:202611031613+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ba508e1e-d8a1-4f71-a79d-49de462aa1cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a0150cee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab5abec8d76111f18dc8c9802ae25ab1-20261103
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152176344; Tue, 03 Nov 2026 16:36:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 16:36:29 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 16:36:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bba7m7KWh93LNuBn9sJHhmIaRPxsVtiRF5KtBvIn3xB5a2ZCCgpFzNFN3t7CFxVxOboH2pRgI3wOggqbBlCzGkdr7a71HBd3n92JR+ZSk3UfMHbtPvnCRV0ZmMl/YMo66GxcB7MeLWOOSluVJW0XKijFCreIXWbA7u1cQWTFngX0LDIM3CLXYVWoIdZ+OC4C3Huabv1GKT7kmriw2NMJ7Z2Wwp51xoBJ5wYkmEQib1zgxApUzLj/4rRtYlvPx7OpXbR4Uxe3vtGqM2gsIYof+Cejt5N4JBx4skKjOJUSDEUpbB61qz6oa9BY//mriDXBKS1vHI5jDLWkHn1oqGhkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/TZUpUKxgvxjPTRtW26iiS15/+Zzn/RmKdaAL9+4NQ=;
 b=QkNQ7VZrbLQzHQxs6GS4Y/xs56BC0a31q1jsFc5jIGZmgcVyCI6VeF3q54ofqMaMB3YAreZIfsHkvjKeEyfggAQ2U3BigIOLUKZ19yYgyOPrRTJBp7BMXoGtiMcLEuHTU5ZTERBfc7W+W8BlNsm7BedkJf5lr7maLmTDDiHlNZEl/hSyZLx1ZzpBQ0ZOUT6xPlQVTU8fUuUtHR5rTZNr4Y5tMS+A05TTg8BIE+eWJmMP2+nhrsJAd6s0UYZR8ITvamHztOfwLSbBvF8m2+L4Qfh1M9mKKXKq9OF0I5bi9mOuJlTZGoHzBbhwtKyjdSSSauUI3cHaCaQDtZBmplmP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/TZUpUKxgvxjPTRtW26iiS15/+Zzn/RmKdaAL9+4NQ=;
 b=PlkXSzyw/4ZPTLdIQBuqTQz6pA06P1ld/RJJDee8cksHJ/NcYRHbOxqtr/BVRuIFMbgiO6RNsyFLCobD5xG6BZv/jeLn3MuR/W1cQ4/hWq32rEByOsjN11/byKjCKUBrzrtPr/8zhEMxnBViJKUeCxuJiJY1pjGW9gtWJGtfRxs=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB7012.apcprd03.prod.outlook.com (2603:1096:101:b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:36:27 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:36:26 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Thread-Topic: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Thread-Index: AQHdaEhK0ddQHI/Ay0WjaabTK8WForcVyBCAgAZEMoA=
Date: Tue, 3 Nov 2026 08:36:26 +0000
Message-ID: <3eb3c087f132290d71e212ca5bb9a1fb37a0267b.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-190720@kernel.org>
In-Reply-To: <sashiko-outbox-190720@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB7012:EE_
x-ms-office365-filtering-correlation-id: 1ac9627f-646f-4d8a-1808-08df39858d05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|261021123027099003|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007;
x-microsoft-antispam-message-info: 1Hi0PwcXMkBTMJDVMpaLNKYFlMf7Xk880C0iAY2rbon8JMhzUSZUF5Vl7FXreye8m3nWEobLe/itlhNAEAMcX7w2y+5ue4ya8SyVMn5/+Vt6RPBKBJ53h12Tl0Y+bqTm79tIzioMqXzzAHRu0w6CupblzvsMFJ/DTfOFp+AF6RQK6YOlCo1Pata7pEzk6ZjnX/TIEeIJ2VhtkM6Bc7TNQtNiBBqN1tHi/FXEu2BMKx79XY8rnaACuWP7Rye+sxrgrN30NYwlEyt9ATIIIZUJ/UcRtz1tB+vk3khBgZmeiXryWc+dXEIL8NLMz+zKDMTJq+OVPUBie0ahkFPFjrccwy1xBdslgZXUD7f6OzYh7wThSyBtQ5MOq+K3TxYb0fhUtRFIChh5yj8PvjjngDmn0cB0HOwC7hNbBA7hiytOzG7ehwgVKN/1FCorjGzU+MICsXK/FNRyGppj5vvXtEydgUvOhQChXZgTuapEAY2Lw9BwqaC10wSuA/8Qj9tSht8pzAjcRS2FwFs5cFDeS326qHTbGjSgA4iF9fO8RC+MpX85denPHXVEXNErM/U2pPdpoK8S/xQL4Lvt5qoU65OCGa35OMrGTKfDZZtSLmao8rPKKHZTYj57PPwvj535jDp7Fjt3/7EqpgtIwK0lFW2LAVDpMk5puOVmzDfO59/VdKlDJzHSuIbYJMopZFKJETEKV40v4b+kvQR9kB8fgU8S9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(261021123027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVErcWJvbG1MR2hnNkw3MDBqbS9oWitQRXhaWnhpRmNpU2FaQWY2SUNnSTJj?=
 =?utf-8?B?YjNYbmNGS09MVExhWUNZSE5rWjJya1d4T0VtU3pUckt5OTB3eVBjaDlJd1RW?=
 =?utf-8?B?RUVXeWM1WWNPbXpUY09xZjdYVC9uOE9pN0VyTmJZMVlSNFI0YVZZRWFDZGo0?=
 =?utf-8?B?VnBISGtBMjYyVTJXc21ZSmZ1amthTnJYbm5WeUNCUmpocXpWM1hhcjFKWEJs?=
 =?utf-8?B?Z1pTTm9JRlhlNkFJd2ZuQmNRUEhhN3A3bHZnYUhvSDRsTU9EYlE1blNtTk5k?=
 =?utf-8?B?NU1sb1dXa0hpMWlQN2x4VFlZc3VBakl6MzlpWEdxN3BpOEUrVUsrVzhZRFVh?=
 =?utf-8?B?VXJQbVRVT2xnZDVPMUw3UmptZWkzVm1JMTNBZXlJOTNORWVDUlI5WGlidmtx?=
 =?utf-8?B?Q2VydDFvcFc2Wkp2djNJb0ZiR0lMd0JnUGNvWllQelh0QmdYOWFlcEZTOHRG?=
 =?utf-8?B?ZkNoN1ZBbUdrcGRGaFpQVW1IL1QrNzNhRVVKb0QvZWUzRWg3N2E1ZEU2KzJV?=
 =?utf-8?B?YVFvdlN2dTdmVUdlblZlNm53UEVLTnZEQjFSK2NWZk9DTjRyeFFNM2pmU2tG?=
 =?utf-8?B?bjEvSGJXdkMwcm1BS2hveWc0bDNwU3F2amZHWHcvOGxhRWtOTWFidFUxcnFQ?=
 =?utf-8?B?ZjJWZEVCZTdsM01jS1A0Rkxad1FGTmVDNkU4OUU0N2RkdUpYRS9NcWRTZnc3?=
 =?utf-8?B?VW1lWlhWazFFV0pQL0RJUkpjWDh3TThsS01rblQ2TGRnL1dTbWNXeWYwTEda?=
 =?utf-8?B?OWRiTXJuUUIrZDc0aCt5enByOGtOcGhadUI3N21nWnZCa3hkd3JpTHlCQ3RN?=
 =?utf-8?B?akliWXdBTmYwWFp3QXdsTEVlWEZaeUR1ZEpSOGVISmVhWFRXZlc0bVM3ZU1B?=
 =?utf-8?B?MiswQWVlRlVLYncyRGM5QlppSUltZkdjeE5URUoyanhQNXJNVlBpQjFPWnhn?=
 =?utf-8?B?cTY2eFI4eEllYXg5bDA5WTZDUzBMNC9Dd0k4UXd4RERIQXY0WmpzVUtzdTl0?=
 =?utf-8?B?bDd2TFIzUjJIbXVNWVdxRVdhMW05R1ZFMmovRkpQRUJUMElaTEc3a0hlWDBZ?=
 =?utf-8?B?akh6TGxxQTliZ3h6dXU3b2t4RExkTmY5eTUyNm1ZallNV0MwaTFEVW1LV3lC?=
 =?utf-8?B?QXl3VjM5V3IwTVN4TTZhM2tRTlh3ci8zRWswSzloRHBLcGhrZW5WclB3R1NV?=
 =?utf-8?B?K1hVM3puR0NEMnprUzl0TjYrQzFYbmNJQlRkMXlEdUh0Ri9oR1BvWUs0RitJ?=
 =?utf-8?B?aUp6NnFJOUJUM0xkUHU2eFRscDFPek5XeVlJcFNKMjlJUXlCOXJzRG5qVGtQ?=
 =?utf-8?B?Z2dIbW8vRmtFTy92ck1BcHg0N3hUVXhUWG9aSCszeTh3V1Y4dXQ4aVdyN3lG?=
 =?utf-8?B?U1ZzdS9KVFg4UmF6RGthbkVkcTY2OG03aUs3MFlKaEFHa1o4Q21uWDRMUWhl?=
 =?utf-8?B?dFNvZkdPL1VxbGZyT3YxaGFsTVZPZmt1SkEyWnFKUnRQTHdCTUZMMlV3dngx?=
 =?utf-8?B?SWJrZlJGQ1AwbWxNc2JXS2FkRzE0MXlJYVkxVjZlS25hQjJTTFhTZlkrbkFj?=
 =?utf-8?B?Uzh4T0lQdzljY2pJenoralNFQ1RTY1lTMVdTTUV5MmJ6TGtWdVFaTmZ5aXJp?=
 =?utf-8?B?aCtPVU82a2FQL0E0V3dGLzZZM2dwTTQwMktlUWNkQVZ0L2c0dlk4blNpRFBB?=
 =?utf-8?B?OFRlSi92OTBEYkZGb3FIUzQwcDE0ZE4wZUwvZ1lyL2YvazUySVJydzgvZW1w?=
 =?utf-8?B?MWQ4bUlXZlRvaUluWW52dEdScmRBa29pTTZtMlNaQkhhLzFzdENXQkFWWVgx?=
 =?utf-8?B?NUEyc2EwbUEzVWhlT2lBR2E5S3NZQmVMR0d3b2ZhSUFVQXNtYnpkRjF2TXJK?=
 =?utf-8?B?NW1ndlVyRlp3Ti8rcDRYQ0JJMzRZV21QZHZuYWs1T0p2VE9vZFFHejMyTGhC?=
 =?utf-8?B?cGQ0L3B6SG9jR3YxVENnZlU5WlpYOTNtSnJoUWNaZWtwMVNvQkxwaGZBd0x0?=
 =?utf-8?B?VFFaSVVITzQrZ2JmV3ZaWFhNL2RWYmhlOVNvMTVESVVGY3FMcUt1SldNK2gx?=
 =?utf-8?B?cGdlNGJPaW9GSFQ2S0h2c3NNVGZnVnBTdHBYOGhGMHV6UTk1cWV5ZXExbDNZ?=
 =?utf-8?B?NmlTQVVON0pZRDNPamRCdUZ4blExKy9SZjB5cytqK3lyb2lvdFViR2tWdFBk?=
 =?utf-8?B?OFFsTCtFUElQMXBsczB6a2VkcXJXZlY2M2gvUE5nUWZHZVloNE0wbEZOT1lQ?=
 =?utf-8?B?Q0EyeUw5blJJa0ErazFtQkZiYTB2ZnNINldCQnRPa01kMVkxSDFZTmtJWjBP?=
 =?utf-8?B?YXhnZWRrc1RDV2ltRWFJZ0o0ZXFrWjZCdWY3YkRaM2dDRENWR1BQQ0hjV21D?=
 =?utf-8?Q?3THehq6xDFiEWL9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B88AC7BD14C70040A313FA3520C4774C@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: pPn75M6eZ38DkIXHoBVD2nxt8akxqKbj/sGburojori4W6hVJyWXCeX3Id82ekdiXympKHGy7nm0NviHLQoF3g5QVk/PyEdybYRXX9AGJbmDLHSsK/wIVcy2KI0idBwPlBoBTbiFsQM1H1bJE/yEv/aHJPTAKG98j31xuJoPz1wABgqzJyj0/fAHrPHUq+IVFTrz3xPn+i7NdtijvRJPAKKyDDQDgGmkvdnyMGTYQx5dqoJmNbmw1o3/Q0ORP/nPpEeZRxjDssFTdvAB+Egcmd8Ce7xIE/3W13F/jO5Ws0wCz9r7NZ9Lm7QAmX32qhlJLd/+FHebXQS2ruH8FKszlQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac9627f-646f-4d8a-1808-08df39858d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 08:36:26.8726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjOe/OmZVBryjFTcVfGCxDpi3afDGuVasHaYQNiBjUWcSfXkbsd6TY5fl8UyiIWT5IBEWQ6brii00b/ZPJch5KObTRcfKEdsENtpZjDwVVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7012
X-MTK: N

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDA4OjU0ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTG93
XSB0aHVuZGVyYm9sdDogc3RhbGUgMS1zZWNvbmQgdGltZW91dCBpbiB0Yl93YWl0X2Zvcl9wb3J0
KCkNCj4ga2VybmVsLWRvYw0KPiAtIFtMb3ddIHRodW5kZXJib2x0OiBjb21taXQgbWVzc2FnZSBt
aXNpZGVudGlmaWVzIGxhbmUgYWRhcHRlcg0KPiB0aW1lb3V0IGFzIFVTQjMNCj4gLS0NCj4gDQo+
IGNvbW1pdCBiYzY3OTQ2ZjUwZDA2OTliOTdiOGFjYjUzNWVlNTliMWQwNDE0M2FiDQo+IEF1dGhv
cjogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiANCj4gdGh1bmRl
cmJvbHQ6IGltcHJvdmUgdXNiMyBhZGFwdGVyIGxpbmsgdXAgdGltZW91dCB2YWx1ZQ0KPiANCj4g
VGhpcyBjb21taXQgaW5jcmVhc2VzIHRoZSByZXRyeSBjb3VudCBpbiB0Yl93YWl0X2Zvcl9wb3J0
KCkgZnJvbSAxMA0KPiB0byAyNQ0KPiAocmFpc2luZyB0aGUgdGltZW91dCBmcm9tIDEgc2Vjb25k
IHRvIDIuNSBzZWNvbmRzKSBzbyB0aGF0IHBvcnRzIHdpdGgNCj4gc2xvdw0KPiBsaW5rIHRyYWlu
aW5nIGRvIG5vdCB0aW1lIG91dCBhbmQgZGlzY29ubmVjdCBkdXJpbmcgcmVzdW1lLg0KPiANCj4g
PiDCoMKgwqAgdGh1bmRlcmJvbHQ6IGltcHJvdmUgdXNiMyBhZGFwdGVyIGxpbmsgdXAgdGltZW91
dCB2YWx1ZQ0KPiA+IMKgwqDCoCANCj4gPiDCoMKgwqAgd2hlbiBwbHVnIGludG8gYSB1c2IzIGRl
dmljZSBpbnRvIHVzYjQgaHViJ3MgREZQIHRvIHRyaWdnZXINCj4gPiB1c2I0DQo+ID4gwqDCoMKg
IGRyaXZlciB3YWtldXAsIGVuY291bnRlciB1c2IzIGxpbmsgdXAgdGltZW91dCBpc3N1ZSwgdGhl
biBjYXVzZQ0KPiA+IMKgwqDCoCB1c2IzIGh1YiBkaXNjb25uZWN0Og0KPiA+IMKgwqDCoCANCj4g
PiDCoMKgwqAgdXNiNF9oaSBOVkRBODEwMDowMDogMDoxOiBmYWlsZWQgdG8gcmVhY2ggc3RhdGUg
VEJfUE9SVF9VUC4NCj4gPiBJZ25vcmluZyBwb3J0Li4uDQo+ID4gwqDCoMKgIHVzYjRfaGkgTlZE
QTgxMDA6MDA6IDA6MTogbG9zdCBkdXJpbmcgc3VzcGVuZCwgZGlzY29ubmVjdGluZw0KPiA+IMKg
wqDCoCB1c2I0X2hpIE5WREE4MTAwOjAwOiAwOjQgPC0+IDE6MjAgKFVTQjMpOiBkZWFjdGl2YXRp
bmcNCj4gPiDCoMKgwqAgdXNiNF9oaSBOVkRBODEwMDowMDogZGVhY3RpdmF0aW5nIFVTQjMgRG93
biBwYXRoIGZyb20gMDo0IHRvDQo+ID4gMToyMA0KPiA+IMKgwqDCoCB1c2I0X2hpIE5WREE4MTAw
OjAwOiBkZWFjdGl2YXRpbmcgVVNCMyBVcCBwYXRoIGZyb20gMToyMCB0byAwOjQNCj4gPiDCoMKg
wqAgLi4uDQo+ID4gwqDCoMKgIHRodW5kZXJib2x0IDAtMTogZGV2aWNlIGRpc2Nvbm5lY3RlZA0K
PiA+IMKgwqDCoCB1c2IgMi0xOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAxMA0KPiA+
IMKgwqDCoCANCj4gPiDCoMKgwqAgQ29tcGxldGVzIGxpbmsgdHJhaW5pbmcgYXQgfjEuNDhzIGFu
ZCB0cmFuc2l0aW9ucyB0byBUQl9QT1JUX1VQDQo+ID4gYWZ0ZXINCj4gPiDCoMKgwqAgY2hhbmdl
IHRoZSB0aW1lb3V0IHRvIDIuNXM6DQo+ID4gwqDCoMKgIA0KPiA+IMKgwqDCoCBJbiB0aGUgVVNC
NCBzcGVjLCBQaGFzZSA1IChMaW5rIEVxdWFsaXphdGlvbikgYWxvbmUgaXMgYWxsb3dlZA0KPiA+
IHVwIHRvDQo+ID4gwqDCoMKgIDEwMDAgbXMuIFdoZW4gYWRkIHRQaGFzZTMgKDEwMCBtcyksIHRQ
aGFzZTQgKDEwMCBtcyksIGFuZA0KPiA+IHJldGltZXINCj4gPiDCoMKgwqAgdHJhbnNhY3Rpb24g
ZGVsYXlzICh0Q21kUmVzcG9uc2UgPSA1MCBtcyksIHRoZSBwaHlzaWNhbCBsaW5rIGlzDQo+ID4g
wqDCoMKgIGFsbG93ZWQgYnkgc3BlYyB0byB0YWtlIDEyMDAgbXMgdG8gMTUwMCBtcysgdG8gY29t
cGxldGUNCj4gPiBpbml0aWFsaXphdGlvbi4NCj4gPiDCoMKgwqAgDQo+ID4gwqDCoMKgIGhlcmUg
YXJlIHR3byByZXRpbWVycyBpbiB0aGUgbGluaywgaWYgbW9yZSByZXRpbWVycyBhZGQgaXQsDQo+
ID4gbmVlZCBtb3JlDQo+ID4gwqDCoMKgIHRpbWUNCj4gPiDCoMKgwqAgDQo+ID4gwqDCoMKgIFNp
Z25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4g
DQo+IFtTZXZlcml0eTogTG93XQ0KPiBUaGlzIGlzbid0IGEgYnVnIGluIHRoZSBjb2RlLCBidXQg
aXMgdGhlIGNvbW1pdCBzdWJqZWN0IGFuZA0KPiBkZXNjcmlwdGlvbg0KPiBhY2N1cmF0ZSBpbiBy
ZWZlcnJpbmcgdG8gYSBVU0IzIGFkYXB0ZXIgbGluay11cCB0aW1lb3V0Pw0KPiANCj4gTG9va2lu
ZyBhdCB0Yl93YWl0X2Zvcl9wb3J0KCkgaW4gZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0Y2guYywg
aXQNCj4gcmVxdWlyZXMNCj4gcG9ydC0+Y2FwX3BoeSBhbmQgcG9sbHMgdGJfcG9ydF9zdGF0ZSgp
IGZvciBUQl9QT1JUX1VQIChDTDApLiBJbg0KPiB0Yl9zd2l0Y2hfcmVzdW1lKCksIHRiX3dhaXRf
Zm9yX3BvcnQoKSBpcyBvbmx5IGNhbGxlZCBvbiBwaHlzaWNhbA0KPiBsYW5lDQo+IGFkYXB0ZXJz
IChjaGVja2VkIHZpYSB0Yl9wb3J0X2lzX251bGwocG9ydCksIHdoaWNoIGNvcnJlc3BvbmRzIHRv
DQo+IHBvcnQgMDoxDQo+IGluIHRoZSBsb2cpOg0KPiANCj4gZHJpdmVycy90aHVuZGVyYm9sdC9z
d2l0Y2guYzp0Yl9zd2l0Y2hfcmVzdW1lKCkgew0KPiAJLi4uDQo+IAl0Yl9zd2l0Y2hfZm9yX2Vh
Y2hfcG9ydChzdywgcG9ydCkgew0KPiAJCWlmICghdGJfcG9ydF9pc19udWxsKHBvcnQpKQ0KPiAJ
CQljb250aW51ZTsNCj4gDQo+IAkJaWYgKCF0Yl9wb3J0X3Jlc3VtZShwb3J0KSkNCj4gCQkJY29u
dGludWU7DQo+IA0KPiAJCWlmICh0Yl93YWl0X2Zvcl9wb3J0KHBvcnQsIHRydWUpIDw9IDApIHsN
Cj4gCS4uLg0KPiB9DQo+IA0KPiBVU0IzIHByb3RvY29sIGFkYXB0ZXJzIChwb3J0cyAwOjQgYW5k
IDE6MjAgaW4gdGhlIGxvZykgZG8gbm90IGhhdmUNCj4gY2FwX3BoeQ0KPiBhbmQgd2VyZSBvbmx5
IGRlYWN0aXZhdGVkIGFzIGEgZG93bnN0cmVhbSBjb25zZXF1ZW5jZSBhZnRlciBsYW5lDQo+IGFk
YXB0ZXIgMDoxDQo+IHRpbWVkIG91dCBhbmQgdGhlIGRvd25zdHJlYW0gcm91dGVyIHdhcyBtYXJr
ZWQgdW5wbHVnZ2VkLiBJbg0KPiBhZGRpdGlvbiwNCj4gY2hhbmdpbmcgcmV0cmllcyBpbiB0Yl93
YWl0X2Zvcl9wb3J0KCkgYWZmZWN0cyBhbGwgbGFuZSBhZGFwdGVyDQo+IHJlYWRpbmVzcw0KPiB3
YWl0cyBhY3Jvc3MgdGJfc2Nhbl9wb3J0KCksIHRiX3N3aXRjaF9sYW5lX2JvbmRpbmdfZW5hYmxl
KCksIGFuZA0KPiB0Yl94ZG9tYWluX2xhbmVfYm9uZGluZ19lbmFibGUoKS4NCj4gDQo+IENvdWxk
IHRoZSBjb21taXQgdGl0bGUgYW5kIG1lc3NhZ2UgYmUgdXBkYXRlZCB0byBjbGFyaWZ5IHRoYXQg
dGhpcw0KPiBpbmNyZWFzZXMNCj4gdGhlIHBoeXNpY2FsIGxhbmUgYWRhcHRlciBsaW5rLXVwIHRp
bWVvdXQgcmF0aGVyIHRoYW4gYSBVU0IzIGFkYXB0ZXINCj4gdGltZW91dD8NCndpbGwgbW9kaWZ5
IGl0DQoNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMN
Cj4gPiBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMNCj4gPiBpbmRleCBkMjJkOGRiOGY4
OTA2Li5lN2VlOTYzOWM1NGNkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQv
c3dpdGNoLmMNCj4gPiArKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5jDQo+ID4gQEAg
LTUwMCw4ICs1MDAsOSBAQCBpbnQgdGJfcG9ydF9zdGF0ZShzdHJ1Y3QgdGJfcG9ydCAqcG9ydCkN
Cj4gPiDCoCAqLw0KPiA+IMKgaW50IHRiX3dhaXRfZm9yX3BvcnQoc3RydWN0IHRiX3BvcnQgKnBv
cnQsIGJvb2wgd2FpdF9pZl91bnBsdWdnZWQpDQo+ID4gwqB7DQo+ID4gLQlpbnQgcmV0cmllcyA9
IDEwOw0KPiA+ICsJaW50IHJldHJpZXMgPSAyNTsNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBU
aGlzIGlzbid0IGEgYnVnLCBidXQgd2l0aCByZXRyaWVzIGluY3JlYXNlZCB0byAyNSAoMi41IHNl
Y29uZHMgYXQNCj4gMTAwIG1zIHBlcg0KPiByZXRyeSksIHNob3VsZCB0aGUga2VybmVsLWRvYyBj
b21tZW50IGltbWVkaWF0ZWx5IGFib3ZlDQo+IHRiX3dhaXRfZm9yX3BvcnQoKSBpbg0KPiBkcml2
ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5jIGFsc28gYmUgdXBkYXRlZCB3aGVyZSBpdCBzdGlsbCBz
dGF0ZXMgYQ0KPiAxLXNlY29uZA0KPiB0aW1lb3V0Pw0KPiANCj4gZHJpdmVycy90aHVuZGVyYm9s
dC9zd2l0Y2guYzoNCj4gLyoqDQo+IMKgKiB0Yl93YWl0X2Zvcl9wb3J0KCkgLSB3YWl0IGZvciBh
IHBvcnQgdG8gYmVjb21lIHJlYWR5DQo+IMKgKiBAcG9ydDogUG9ydCB0byB3YWl0DQo+IMKgKiBA
d2FpdF9pZl91bnBsdWdnZWQ6IFdhaXQgYWxzbyB3aGVuIHBvcnQgaXMgdW5wbHVnZ2VkDQo+IMKg
Kg0KPiDCoCogV2FpdCB1cCB0byAxIHNlY29uZCBmb3IgYSBwb3J0IHRvIHJlYWNoIHN0YXRlIFRC
X1BPUlRfVVAuIElmDQo+IMKgLi4uDQo+IMKgKiBSZXR1cm46DQo+IMKgKiAqICUwIC0gSWYgdGhl
IHBvcnQgaXMgbm90IGNvbm5lY3RlZCBvciBmYWlsZWQgdG8gcmVhY2gNCj4gwqAqwqDCoCBzdGF0
ZSAlVEJfUE9SVF9VUCB3aXRoaW4gb25lIHNlY29uZC4NCndpbGwgZml4IGl0DQoNCj4gDQoNCg==
