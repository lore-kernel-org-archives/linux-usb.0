Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589083;
	b=IZmnXvMk0qkSHzpQkvhb9a1QiDiptfLUBiYafkcK20DttCPrzNRp+9mwmHG3GNYPOWeB
	 7pJsI3WJK+BYHjtLlpquKg2ez7Afqm/0AQtGEhBKD0ZqswKlVUXUGOTV9f2Omc+8NWniF
	 NgNS9c7CNqrLI/SM0ZxWV8+hg/jbZh0gmczrhaZFFkhFXB/1jD4V5CG1jtrxezzurfjsG
	 PRXkiHGh52Nva+cn38kyXRMkZcBZAMQF3OPKvpsiuFDTAjzsO560Soa5IUR/4G71jD/In
	 RQ1hQbvLtRn1XCLdbuS1HJQ3KNuTQM4RAosy3rU2Gf1bh2Vx3WFm2IKz/ICQRZJaZuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589083;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
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
	bh=G976bYjjq880EpknVcZQmhCAitmbh/c0vZu7GZACd8k=;
	b=HssGs7HL9tE8nLmRZMoFqDtEETSKymxR23r61ilwB46juetumID6WScXrx4OHXs0bWDR
	 VAXO+Rj13wTGKL5TvUsi9lbi7LfIT7sB784bv26eILtpAvp+MZHNj6PdwV/kFT4V7FdiS
	 R5aon35D7tzuqGQHsyIkuRGu87oLp8ZSSQp2PGjzlINn64FfH4YCtyzPZx8Yn8XHisvrl
	 03+hFRq1wiJPW0OhvC7kUuLmJSzLN9CWOVk1wp0sbO4hSiEWjcXHkY60PcXpnQeajSym3
	 01R3W64VU97va5t1xAgN4BxAlSqfY3oir6xuUInM2bIYezmS6rPgJ1ZeNjUo44CkGvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uUppUBbh;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=IdfFRxaR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A0606A331
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388A0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uUppUBbh;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=IdfFRxaR
X-UUID: aed05dcee89b11f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=G976bYjjq880EpknVcZQmhCAitmbh/c0vZu7GZACd8k=;
	b=uUppUBbhgbkQZKtjh6L1ncNfBEhddK7OjvUPubH89EO9W8vaKjJ+zy2wI0NddnBvwXbM3bfc5xWfm+EvHxXiGLarfQUXLGp6DchmxpkJ1H/2ZP2qbOIok9pGH5sBFxrLZAQwCffbA6bvP7LKw84wshm/fQyujIRZn08FSIVOMxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b219a125-f1cd-4b44-9728-4688e4704773,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b4579110-962c-48d9-a341-1147f185838e,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aed05dcee89b11f1b1788b6acf885367-20261125
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 251706017; Wed, 25 Nov 2026 14:44:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:44:36 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:44:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsGiXNTdOyTBsFBgNKbzlahaI4bmdCErYvqLqwOYhq2huQ7s5P4uWXCHYCvAN/WF4ZQOI1MuXEuzledv2bLTI+mZ6Z1XkwDgUlprnFPxS8LhjvS6mLRUkWvGIljcHUlvgXEUV47zU2dS6R7VeVPxd53ZHhITGGWELN26pKPjvC5dgZxuuwkHENSlUGQTwX6FSDwzrXzpgFHaRgQ/iR2naXCyfQiLDckOVMdPFdO6v4cPouKaz8rJJIUqu5xkLIUUaF+JzpqXFlzwkhqgagMdja3UbTq2zZutiYRWGTnC14/+R/IFoi8EOO9VxD3y4Iwz0X0vZzEDYhRBbFWynhHyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G976bYjjq880EpknVcZQmhCAitmbh/c0vZu7GZACd8k=;
 b=k02XTJU8GEBgRV4H+Z2XKOeUpkO68pdZbR4ifPti134EZhO0FiRSVhajFJRc1ewlAuljV8j19E77WEIJ6JW8WF2CdMWXxE7EoCk2SmKcfadN9VPfRFtbNXx8l0q8woyRj+c50QwYyrSAzSW2OfQumMXYNjO3CqVeVEktTNRKukloXUERcrabX8mshI45qkyyum42OeIJtLg0dMwV91Ofh1a+HIbmfXXIzmh1LBtutCEKxdSUokCmoyfB0/oZtd40gadxYi85650ZRwissnS56qfD9ZIgwTChLMbQQRQu1LjwE1uQdIWNBPXsh8DFxukdqbmxL4Vlt+nySUlzUOo0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G976bYjjq880EpknVcZQmhCAitmbh/c0vZu7GZACd8k=;
 b=IdfFRxaRtaZyxK0RpDbQwOvzwAgN37JW9AKIIxhEef3qu5SQLOrSYyEI6aPzz2C1Zd8Cr79XdttpZezCGKZjLaGJkQGpnM+xy0/Qy4plg5l2Rmqo8Qjg/jw64aA4oh/XI/WmXmmVsgk37v/wxwiaM6Z3elRLGNGkMK52Vk4wXNU=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SI2PR03MB6437.apcprd03.prod.outlook.com with HTTP via P2P; Wed, 25 Nov
 2026 06:44:34 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:44:34 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "westeri@kernel.org" <westeri@kernel.org>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Thread-Topic: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Thread-Index: AQHdez8NNNxH4o5A+kCbrUsU3oyW3Lc7jE0AgAE5zoCAAAqbgIABiaYA
Date: Wed, 25 Nov 2026 06:44:33 +0000
Message-ID: <b6371710f899dad71c85a0163cf0208473aa501e.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-229175@kernel.org>
	 <059072e15558d6aa74eb046e4d9b260baae09200.camel@mediatek.com>
	 <20261124071537.GB953598@thinkpad>
In-Reply-To: <20261124071537.GB953598@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SI2PR03MB6437:EE_
x-ms-publictraffictype: Email
client-request-id: 019e1d91-63d4-4526-91e5-7c889cc761ab
request-id: b0d0d772-7ebe-448b-7668-08df4abf90df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261022105027099003|4143699003|261022075727099003|261028144727099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: aHj8r0eH/grQWbq1pGNVGJiQV/3nAyPA2VHKUq+fwPhHzn4UJpUFwU9nKzWwEGBttqhg9zFfYwJw5fKMLjhCrOzH9DuMO2IC9eCQ3xOfPdZ1fzg97T3MnK/dPnWWRr1QIcPrWDNQOSU3vUS8LVeCz1p3h6Pg/XfJl/FnXIrsrhI3zN4ZjXTnjE1oShC8U4pb01Otv6c/SPiSsJzSkzN/OrKYeVKvVjpqN/PZUyLvtV0kjJyvpzfkrIsLN4oeOYT1so8yAwSgjZ2+XJ83CNA6YvN1/09Sa+uraPYmy579AZO7SeACERFaiaG6xwKsdINh9KdW5qqYN3GKoZruDMT6HpoteVOweEkvClNo8roIgaBMSpMOsXF/q8eeJqnagFpxWrdeahOq/lzWoCuuiNeoDkJJvQTCK8NXHEeoeqxUvwloHNdxDjzv47N5JkKZw4j5J4rnNMCrkVm2x8JE1wRSjepH4HeX2hilAQweBzj8N0biHTn0v8DpUB8Ft0p84Ty7CvIe72KcIb6EvPPOShF0h5nVt9W1sGai0V5DbXNXlcHfW43vM/zZp8xiT2KUMQK0RrDM16wI+GxiVINBAZ4UL630TtxXCh8xVeIPBpttJuvxiUwSaBtGI/WsGXTH874Dk1ySlcLRiJvv7ns+CJRRw8mk2VGzgon1tSTJemJcLc4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(4143699003)(261022075727099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjF3dFVpcjBXUk5HR1RJZmJYM1FGbFU5SmRXbitvQXU5QlVqSDQydHBJMU1L?=
 =?utf-8?B?b1gzRU96S0h2ZlE3QmVNcTNuR1ptMWVncjBtVllQeTUwTUtlL0k1cFlySVdC?=
 =?utf-8?B?dXVBMGhpd3lUNU5LZzhwMDFrQ3dJbno2SmR0NG1NaVVKQ3VXY0QzNGt1ZVdx?=
 =?utf-8?B?ZkJsalVHK0FoRmwzK1kyTVp1S3hNbmxnenhsMTF6VlY5QUs3WU9SSGtjdVZm?=
 =?utf-8?B?NmR0ZmpFS2MwODJrSjZRM254REhJMzJ1ckx3SDhuZ2p3VitnL0ppNy9lRDRk?=
 =?utf-8?B?NlBHZnYxeVRuUHB2SUFhTThnMjBoSlBqZVVMc1JZWDBjK2luanRHalVENjVa?=
 =?utf-8?B?QVJUbXovNE1GTTZQYUxhb3ZoS3IvV1VwbGdtQ0ZuQ1N5RzhmdWpJYTlyYlZa?=
 =?utf-8?B?SUxWaGZiTXNrbGtJc3JISzM4LzA0RnpBZDBoeVQvU254OTUzUUttb243a3M3?=
 =?utf-8?B?dkZ5MVZwL0ZMMWJJc3FvS2FiYlBmcHNOc1FUQThpSS9mWnlKUExwa3pucVNB?=
 =?utf-8?B?aFZMNDhBQ2RENEwwUkx3TUpqUkhOQlVSdlZxSGZYeUw4UlVWNWhrZnh2NTJ3?=
 =?utf-8?B?ZUxmT1BJejBYU1NVclIyYzFTU0pLK0NxUzZLR2tlMnE4dzFQdndxWWVqcGhG?=
 =?utf-8?B?cnUrdFpCZ3Rmb1M1TlI0dVFENU82ekdEcEpYRFNjWWhGWWtLemp2aFhjVWRO?=
 =?utf-8?B?NWYvZWI2aEVpRkFxM0F1amNoUUd5T2hyajE3WWoyOThySE8vVjYxZWJTbVR1?=
 =?utf-8?B?RWZ6Z0pjMFZ5VXgrVXJpOWRQRGVMNE5OM1ptUjVCNmpwV2psZXNKb29WUm1L?=
 =?utf-8?B?QXFBZU1YRWx5bE56V0lrSkRtTUtGbUJLcDdkWGpmT3JzMTRSUmlZVlF1Tm5L?=
 =?utf-8?B?L0FpakZvdlhhQzRSYW9vMHI1UXlnUDE3aWdtczNEVkN1c0lDZnZjYSs0OEtD?=
 =?utf-8?B?b2pTb1dKUEdnWEdoSXFxNzRkbC83VHJ1c2szVlJTV3BCRmVXSmFBalcxM2VH?=
 =?utf-8?B?VXp6ZlhSalRhaWlqbEoxeEEweGtFVzNEb2NRZmNWQ0s2SGk4T1N2WDRhVnh4?=
 =?utf-8?B?R3h6QzM0VXU3ekNreitPMTBKUkRFNS9hMkNGQkFPNUwyUzJsSHVqVG1OZlpj?=
 =?utf-8?B?MWx0bkYyNGIzcGxINDRIallJcUQzWlprelQxZDZFa1RadlNDOVZ4cWRoM1h6?=
 =?utf-8?B?N2NuemVOMkk5dllCR25kRVIzOXNrdTN6aTBWbk13T05hZ212d0pGczkxTjVs?=
 =?utf-8?B?U1JudVdQSHlhNXRqWnhBUU1hMVIxQWxNVHl1eFUvUjdSV1lyTEpoYmh2V2Vu?=
 =?utf-8?B?QkYrakJOcVNCS1ZCMDJ3NHRRTFZFOEhzWk5hS3FnOW1CbzRRd0dLN1p1Y0F2?=
 =?utf-8?B?K0RMbmorWmpGL1NOTG9mc2dlaXFnR0s2YStaakgvNk5CTG1USGV4ZUhrRHVX?=
 =?utf-8?B?ekFHYjY2Sy9IRzlEQlpweDlLT3B2Zml2Vy9aTkU4bW05QWwrdytRRmFYbXdM?=
 =?utf-8?B?SG5MeXFubnY1N25PVFpNYU9tbUx3OXFhVFpTK1RSUlUxZ2NLb0JQMlYrMTBx?=
 =?utf-8?B?RjhabWM2SmlVQTV0dzZ4TTVkZUpLVE5HVHlHdEZjbk1tdVo5WWhxMTFCMjdw?=
 =?utf-8?B?MGEwMjdqL2FlVXBoYkt5Q3lOMGJSdU9vTXhqcStpT3lSWCsrUlhsZTJMUWRG?=
 =?utf-8?B?blJPK0IyWWJyQVdDaU1zd2hHR0ZURGt6dkwxVHFERGozRFNoRWtrWXBJdTBW?=
 =?utf-8?B?SHJJR1R1VFZWNUN6cTRiR0dPUTkzN0tldWFHbXlxbmY0Nmc1eWdiWFQxYm5w?=
 =?utf-8?B?VytIU3hDelhEZm96djNuOEtGSm9mQ0ljNUNCZjJMODk0QXhTQy9ocFg5Q0t2?=
 =?utf-8?B?enZXU2hlekxjRVNIa3R4c1I4bVB6N3BrdjJyWnBzbGxxZHV2OWZVV3hqMEkv?=
 =?utf-8?B?ZHpJV0hhWnBVSXhLYUQvZENZbzNtRWNrOTBEaHhyRHQxZyt4Uk44bWlsYU5Y?=
 =?utf-8?B?ME9LcWxkMjRLRmk4ZGlHRlNCZjRTSzhDOHJESWxjbVkvZFdnc3ErOFBPbFZU?=
 =?utf-8?B?RFhqOEdIK2s2ZEVkVEdld0ZLamd6Tm93Z1k1L2JOMkZSbGorRFpLOXJacG1X?=
 =?utf-8?B?NkxWaWVyTEhXK1ZLR3YwenMwb09IRDdYNU4vbGdWT2xUcFNEQS85RFNOd3E3?=
 =?utf-8?B?b1ZoWnFjaGtSUExPdFF5MEZLVkF3bXIvckhJbGtsWkYvV3ZlM2FIMVVWZ3Vr?=
 =?utf-8?B?YURESVV5SVBmRFNSdmdOaDRJbnJRVjJwU2N5enVGc1B0TXlNQUZJY0pCNnZK?=
 =?utf-8?B?blprOW9QYjhJdHZDTitiUmVRbmd1RFFKaERWMHU2dm1Ea3owNHAyd1ZYd2dN?=
 =?utf-8?Q?CUhyBxRoZBb6p6ks=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A40A13D22AAA148956816A5B6B9DCB6@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: ntopML4QadKrVkdxp8FIFdGrVIeXkPcksvFVEP8avhK+4GhBEL7VkwP0YnuSRGxd4ihFlv1HVFSCJ/gNt1olC739B5o+D1KnqCHilalkt/e82z0l3xG7mBenSrkJL+jkSfpIVijQj0T0TMyFqrTtWOl3swKoLqjvBqrvNltH/6SBm960xBQt2L2gaUHzv1VzzW8MzNdmUzvu5Ixr5fAuiw3F1g1rHv2K2nnR79S6EXWSknWFD+s//JgMnQWlHRmvpS8AKEibsk/tioj3zWxQUkWF7pHzdEdQSfaGeXdbe72sKcsdi8K+eyqbjSns3CIqgBQLMvexEAZVDgAkEjVUmg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d0d772-7ebe-448b-7668-08df4abf90df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:44:33.9170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30ZJbZq4vM0IDvSOj/qFeyCqz8rW5a8D6RUeNVkcjUc5RDqBbSZb8YuvgyQIykZtTUbero0m96QOMx357rMeDMPgfRhpHJ42PFUjaxVoCJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6437
X-MTK: N

T24g5LqMLCAyMDI2LTExLTI0IGF0IDA5OjE1ICswMjAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IEhpLA0KPiANCj4gT24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgMDY6Mzc6NDBBTSArMDAwMCwg
Q2h1bmZlbmcgWXVuICjkupHmmKXls7ApIHdyb3RlOg0KPiA+IE9uIOS4gCwgMjAyNi0xMS0yMyBh
dCAxMTo1NCArMDAwMCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZ8Kgd3JvdGU6DQo+ID4gPiBUaGFu
ayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxDQo+
ID4gPiBwb3RlbnRpYWwNCj4gPiA+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiA+ID4gLSBbTG93XSB0
aHVuZGVyYm9sdDogaW52YWxpZCBTUERYIGxpY2Vuc2UgaWRlbnRpZmllciBHUEwgaW4NCj4gPiA+
IHBsYXRmb3JtLmMNCj4gPiA+IC0tDQo+ID4gPiANCj4gPiA+IGNvbW1pdCA2OWUwN2Q3MzdmM2Nj
YWEwOGMwMzMyZTQ2Y2IzNjE0YWI1MWYyOWJlDQo+ID4gPiBBdXRob3I6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gPiA+IA0KPiA+ID4gdGh1bmRlcmJvbHQ6IEFk
ZCBwbGF0Zm9ybSBOSEkgZHJpdmVyDQo+ID4gPiANCj4gPiA+IFRoaXMgY29tbWl0IGFkZHMgYSBw
bGF0Zm9ybSBkcml2ZXIgZm9yIFRodW5kZXJib2x0L1VTQjQgTmF0aXZlDQo+ID4gPiBIb3N0DQo+
ID4gPiBJbnRlcmZhY2UgY29udHJvbGxlcnMgZW51bWVyYXRlZCB2aWEgQUNQSSAoQUNQSTAwMTUp
LCBhbG9uZyB3aXRoDQo+ID4gPiBzdXBwb3J0DQo+ID4gPiBmb3IgYW4gb3B0aW9uYWwgZGVkaWNh
dGVkIHdha2V1cCBpbnRlcnJ1cHQuDQo+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdGh1bmRlcmJvbHQvcGxhdGZvcm0uYw0KPiA+ID4gPiBiL2RyaXZlcnMvdGh1bmRlcmJvbHQv
cGxhdGZvcm0uYw0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAw
MDAwMDAwMDAwMDAwLi4wNWRkODU4YWM4MzQyDQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+
ID4gKysrIGIvZHJpdmVycy90aHVuZGVyYm9sdC9wbGF0Zm9ybS5jDQo+ID4gPiA+IEBAIC0wLDAg
KzEsMTcwIEBADQo+ID4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMDQo+ID4g
PiANCj4gPiA+IFtTZXZlcml0eTogTG93XQ0KPiA+ID4gU2hvdWxkIHRoaXMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXIgYmUgR1BMLTIuMC1vbmx5IChvciBHUEwtMi4wKQ0KPiA+ID4gaW5zdGVhZA0K
PiA+ID4gb2YgR1BMP8KgIEJhcmUgIkdQTCIgaXMgYSBNT0RVTEVfTElDRU5TRSgpIHN0cmluZyBy
YXRoZXIgdGhhbiBhDQo+ID4gPiB2YWxpZA0KPiA+ID4gU1BEWA0KPiA+ID4gbGljZW5zZSBpZGVu
dGlmaWVyIGluIExJQ0VOU0VTL3ByZWZlcnJlZC9HUEwtMi4wLCBzbw0KPiA+ID4gc2NyaXB0cy9z
cGR4Y2hlY2sucHkNCj4gPiA+IGFuZCBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgd2lsbCByZWplY3Qg
aXQuDQo+ID4gPiANCj4gPiBIaSBNaWthLMKgDQo+ID4gDQo+ID4gZG8geW91IHByZWZlciB0byB1
c2Ugd2hpY2ggb25lPyB0aGUgY2hlY2twYXRjaC5wbCBwcmVmZXIgR1BMDQo+ID4gYWNjb3JkaW5n
DQo+ID4gdG8gdGhlIHBhdGNoOg0KPiA+IGJmN2ZiZWVhZTZkYiBtb2R1bGU6IEN1cmUgdGhlIE1P
RFVMRV9MSUNFTlNFICJHUEwiIHZzLiAiR1BMIHYyIg0KPiA+IGJvZ29zaXR5DQo+IA0KPiBJIHBy
ZWZlciB3aGF0IHdlIGhhdmUgbm93Og0KPiANCj4gLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCj4gDQpHb3QgaXQuDQoNClRoYW5rcw0KDQo=
