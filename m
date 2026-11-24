Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795489015;
	b=eq5i4jtyMCTqVcOFYHuYY3YYA5Ze9fx3bsQcgBBln/1dWZKGxpCsYmpav5SawefwphDG
	 rl/9DopNcZyTrNLL1Vuqh0SNY4w0ZpQwFZCH6v9fiBnyd//XDAF9aImoOmjZaGNNap9+x
	 B7hMCzn84HJSkOvW4fTvmHLq62lhEIpn6YIP/Gl6GrK+ldIl1jz+wz6aHj0teYkKSYr3y
	 khkSYvyp+97PyIXYnznTbqk/ipFg+i4aqi3WyhmjuohGpEHsWuOK/Mp8144Zo5XNERCPC
	 eVQbMZ77CMDcGgX7nou8xR8nH2V/Sc+HU4iOJG/x3iAyHtHEE23fcOfIfzP6we6dJpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489015;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SvnoPGCUVfle3xSQUGgSvX7fjWLOepMklg8/MBnktg8=;
	b=n82l+4YWpaC0kvyJykSDAosqGoa1nhJuLUnMxRwNo40vIy6yn3b3FHTyPeaj2lxuRabP
	 gf/c0So/QfOh81uXVmPAC7/cpWaHUkXqzTGrweXtKCwah4MIl6EJYzCTmKmYYBtJNTYyt
	 O4AB5R5bivkkDinG/AVeVW2OQ06ieOp9iDpBhU0XiqfIX8HQadtCa87LIbgEvmGvkw7Xp
	 WEhgRo32koxg/h6bOvaNi7hBd3EFwgHBEPLvvztOsFd5zIKETBxrqeT2LgtKwpltTluMP
	 eyi8AHVJ/6QU9mfc1LV+6FEKqR8NkIoc/S1XnbJWGU+Awcrlp0RyLfLf2y4qBIMrrRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=krm8mHXn;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=GtwwtuUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E0606A31E;
	Tue, 24 Nov 2026 02:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=krm8mHXn;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=GtwwtuUQ
X-UUID: b1265176e7b211f1b1788b6acf885367-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SvnoPGCUVfle3xSQUGgSvX7fjWLOepMklg8/MBnktg8=;
	b=krm8mHXnDudiyjdauVjD5hELWz+ubE/QlEOwVKPcFJR6Y0LhXoP5Ld43jj5AhEAmepXOiLWTR1lqBQXzJwqNzqgQVfBT3TAnE1rDZNQKW23rW5UF6bZYK71Z781M7lo0kcnzbauOIceDCLN6GocSMeYCj5aGHGTigrSMmFL6zCU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c8b867ed-5704-4698-81c4-734267284a51,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2752fe4b-1007-404c-b93f-5a4ed0118439,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b1265176e7b211f1b1788b6acf885367-20261124
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <fangwen.deng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894505781; Tue, 24 Nov 2026 10:56:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:56:47 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Tue, 24 Nov 2026 10:56:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhXCKsq5L5kTkwfBURnEtyKdNQ29xbvEpmO2Siii48KdUQXwdbC/FtlP1FFDQZ5FW9cBIlDfdJVEpyXmlPliKtO8B8v1ICzX8LP5jaaDy9EicMUq50NYyKR8hnEf0vzebV5noXtAoKaArNERO5+SkMejth/+x9Jwd3WqJ6CrLk6JTRRCVqMyhMVVpZN+z3DMmYlbeqVQdP82SPz5FtkTaVUzKqZjIOqPmGdRDyz5y84ps4MjSxbvMOEGFiMCmq2dzzDhDDvgBE+invn9M3HRPN+oWO291NxKXFDuRjZZcelXiAYadXnKY+fOii/SS37fJalUan71p5fUe+LgL54jPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvnoPGCUVfle3xSQUGgSvX7fjWLOepMklg8/MBnktg8=;
 b=dDACGYlK6FxDlv5He446IwEjb0itXxXp9bPM8MBoeKloyCpKJzEQskQRJlZAeexkAHfoKwulfo7u97gBtqp0g+KzQi39qfrkpWeoV8E5oUylHw6dBnGHxKFD1eg74N2iDU4vqPVCEQORRo+sQaNj55zmKvLRh9oJcLEuWy2PN3IzwmqOVlMCsse7etXK5v+Hxz+59x+u3vT96ITm7+cOtufbemyQzprcwBTN3X2GHtqwLAnSEjhP91Xh1hjYR83JGaX4oM6qCy+w7cYtyLblv17MB5wSX10QpCFt0zOFjck81TFpje1xJz+JT8IiIeqVTZC6FsgVMJrOcvCHRpKRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvnoPGCUVfle3xSQUGgSvX7fjWLOepMklg8/MBnktg8=;
 b=GtwwtuUQzm9h/r7oK5B4cF9u5KGLy1KHH0+zimNNXgnz+F2fVB2d4xvdlarNq2ebCIbRnUJ3OpUor4JsCfuxnoA5m+a9y8YucubFvQGpP3XKnr8Vq4wXuuMAkklS3VBFLbxfa2Zf3RXz4hTL0jcH/X7Cx2iPL6KZkzdMljsmb3E=
Received: from SI2PR03MB5482.apcprd03.prod.outlook.com (2603:1096:4:12e::8) by
 SEYPR03MB6484.apcprd03.prod.outlook.com (2603:1096:101:54::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Tue, 24 Nov 2026 02:56:41 +0000
Received: from SI2PR03MB5482.apcprd03.prod.outlook.com
 ([fe80::c46c:854e:dca2:e382]) by SI2PR03MB5482.apcprd03.prod.outlook.com
 ([fe80::c46c:854e:dca2:e382%7]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:56:41 +0000
From: =?utf-8?B?RmFuZ3dlbiBEZW5nICjpgpPmlrnmlocp?= <Fangwen.Deng@mediatek.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: =?utf-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Thread-Topic: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Thread-Index: AQHdbcUWD0OEwsrXKECo4gBokU9dGrc2+WoAgAWp5wA=
Date: Tue, 24 Nov 2026 02:56:41 +0000
Message-ID: <e90c411cc33a6a073db5ba9c81e9ce510eb6fb1e.camel@mediatek.com>
References: <20261106080140.342107-1-fangwen.deng@mediatek.com>
	 <2026112053-curtain-astound-bf4e@gregkh>
In-Reply-To: <2026112053-curtain-astound-bf4e@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5482:EE_|SEYPR03MB6484:EE_
x-ms-office365-filtering-correlation-id: 6bb56eee-0777-4bd6-3241-08df49d690d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|261009223027099003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|261021135927099003|261102123227099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: Wrt8NA8p23BjfWYXsE45alFwV53fVZ9Ey495aZkVrObVEYZAGio35/pKSNwuN4TojNtYdje2dX8u185IBaiTk6G9wc6KpevgJXmNLBPtt9hTdmTEzxUTusvuMSwGk6F9/0LVeRrcGaGs3VHAr6XvNkEFTRoMjdnQb17spJ2BefxKPaZTVUt5qOT9bMKZIycLZsmk/vEd8nOeHWP+Ze1w5C60yuC89pVkYxcPq4At2BNJbf6fdKq/erXUhP6ln3yfPKCVWP/53cr16fza2jAjQCda5v1fkkWTxuTrcxWzEKJyl2NJu9nO8xXLR746pX80m/lSvGxRxvokCNhZp8ICSPuomjq/r4+c1Rj0clHuVkYZ7OkBkz2BRhnRru/D/8lZkBVMxVNCGZSM7c0xjvHXPGFBjvCGVzYiZDLNlvlO42ZyP43ImZc2wdq2KRqUZ9V7NkJZa0PYPY/inKowwKKTgIE2y5psSh0EEty7nuI1m6oCyubJTFCRZQub6CrRBzZD46bLmxffyMyLhDSKBWxaRHUQoBni0kFQZk8joLsO3N9fnya/Suf3FdzX3xofGJojljB/QfcMSW/D0nHQwmDTmv3SqA4LMzTgXllqVHKOZQnhAajzMZQZvHeYXrg/m57VOZ4DQnhpGuZvHscKvnTcRJ92Mb81ukazD8ERHIo2IW7FCNBy3cko5+MCnvMI/DMd6yat1Xu7cNwop68kPKix1Kn77WzschBmLebg2siLTSI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5482.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(261009223027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021135927099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hkVk9ZR2l0RTRadkdiNWxqeVkxS0dRdFF1RWg2SHZRVzJic2V6Qmw3a1px?=
 =?utf-8?B?NDI3d2Q5ai92S1UzK0tQVkhnSUZiSHhmN3pNaEpxeGtGUjUzMjg3YzB6UEw0?=
 =?utf-8?B?ZFpxSWZnazJqbGxGcC9sTGVyRmZvemZrMjY5ajkrYTBhTDBqQ3QrNFpLZ0gv?=
 =?utf-8?B?VTV5eTluMjBldWJlcTltTWNhTmx0ZkpDVDAydCt5TDdLdkFBeDlDTVdFS0Mr?=
 =?utf-8?B?cDRNckwzMGVJQUlaL3FSem9vMDFrcHJ3SGdsdTV5MmhuZmM0eHU4K3VUU1o2?=
 =?utf-8?B?UzB0VFQydHFHVGtxWkhCVmFsNUxaUmhyRTRHTWlLZ0dLd2lnYlRsbHRqejBS?=
 =?utf-8?B?ZzhlQ1RpdGdxTWl5YUZ4R1BZREl5Z04yU3VubDFhcVhwMHl6a2NxMHo3VW4y?=
 =?utf-8?B?SmE1YnJTYmg3VXViYmFYN2YyeEV1eTFRdjFUOGltVTBNcytzNTRxdEp2aUsz?=
 =?utf-8?B?aXJSUi9YZzdXRkIxRHRjOWNZV2FEMlp4SjJnMW1mWWJqZzJxcG9nbWt1ZzEx?=
 =?utf-8?B?NlVKVTlqQU1hdmxVWUhCS3hjelpEOVpyZi9CZjZzOXZjamdUVkVzbDB0NTRI?=
 =?utf-8?B?emdIampiaVdtUU0zbTJoVlVnZzBVWG1VWkw1K25jeGNBaktSRXVnSVFUT1dj?=
 =?utf-8?B?djNIWTN6WFRDcFNtN1JROVFqZVgzS1AvVzc2NC9XQ1k0VXNKb20rMWxXaWg2?=
 =?utf-8?B?cGdUYXlPOFBnUzZJV082U3RyUGdrOWtCZlkxeVRjR29YL3RIWHF3WFptdi9q?=
 =?utf-8?B?aXRCVU5SVGgzLzZjSFpuZnRySFpYR2lUTERMRVppODMySjlVaXVOY1Zud201?=
 =?utf-8?B?bUZVcTJjdkJ5QVJ2QmNXbnN0RzU5R1p1M1FQdEpscVJhWkpOVm9LK0UzUnds?=
 =?utf-8?B?TFNNK1dpNmVzNFM5alFNUEZRdU42UjJyaVVscmIrZTh2OThOaFBJMWFwVnAw?=
 =?utf-8?B?cUZsc2MxUnlFZzVFd1Q0UENVMEIzR2JZcTM0MjhRRDg1dVlMWnljMVQ5bXdl?=
 =?utf-8?B?cTFXQUdoTklsSEx0MUp4dHREdGdBenVrdUgwcTdoRHNFSC9rOEdHUDJjRjVE?=
 =?utf-8?B?UFB3K3BmajRJWmxUMEZlY3FlcXJvV1dWcWpIYWliVG14V3JKNmVjQVhXdExG?=
 =?utf-8?B?R0RxeDRJTXQ4dkFXWHk4ejViUGQyTTBpVHhITkgxZVE2eThNWWlTTk5Vc0Fn?=
 =?utf-8?B?NnRTL0VMOGh5RzAwMkloaTE4NS9BYTNPSXMvQkZkWmF5bkhPNHRRZ2xJYUF0?=
 =?utf-8?B?Yys3ZmovMG8rSDhMbXQ1dWRMeUZaajVCYVljVXIvdUdHT0xnVFJCci9SVTMy?=
 =?utf-8?B?SjZoSmhTNWVsSm1IL09BeXdLK2pNVDREK0ZWb2R6SUgzY2duSFZ1ZkNkMklj?=
 =?utf-8?B?MUNDMWVkQzJZcFdTY3pXTWJjUS9mS3hTbmg3RHVvd3pkcGhJdkI3ekFCMXZt?=
 =?utf-8?B?Mk9FM01hemdodFpRWVhwTTV3ZVFLenBqM29zYTNxdXg0MkN3QzBScWJyaUdQ?=
 =?utf-8?B?aW5DY2x4OUVQTkJPYUc2eG1yQVdNQ2dVWGRsazRVOVdRa2txUGZFTFpibksx?=
 =?utf-8?B?RFQvaDcvY2xWUVB0Vk9UVFpZMkdJcDBsSlFGZmZmNmRSNGNuOUYvbjFGWXlW?=
 =?utf-8?B?VFJJalpTL1VnZ2pVUTE5RnlzVnp4NW5WWDFmTDRyU0pUL0d2RDVBNndhNThJ?=
 =?utf-8?B?NTJmc0orOFBrV1ZOVldXS0RRY3ZFU2ZlakJWWXEzMjBEUWtZYmlqOUpHbE4v?=
 =?utf-8?B?NXRFN0hqNk5DWU5DMGQvRjRaQncxcDZKVTVkTTJLRjFxQ0pGU3JGSHB2eWpa?=
 =?utf-8?B?UTlRaVJjK2l2cEo3bFV1K3RLT0E4bGlQaFBrdERCZkErczRhaFdvaWhKcU5h?=
 =?utf-8?B?UHFOam51cXUvbkR3UHhkemJRM0g1NjdWR0NjRlJIaENUMUZyWEw0Vi82cXBh?=
 =?utf-8?B?cGl1dEt5T3lUeE1XWUIrUy81RnJFWmF0cS9CVkFuNVF1d3Ywc2VKMDJOdXZy?=
 =?utf-8?B?aXYwTW9KbUsrK3NPRG9NR0NrZ1NXNGJiK3U3aktCTXdMM0NNbSsxS3JwMjRq?=
 =?utf-8?B?dGs0c3RQY3JaMitmOENDWG9KbWM5dlBMQnFGYlRNTlhDemJaVnZkWTJ1QjFo?=
 =?utf-8?B?QkxlOHZVV1RuaGpvWkpIb2VmNmlNaHVjNXRTbVVoRE9SWmpLaFdpMElHK0xj?=
 =?utf-8?B?Y2RndXk1YlAwTjhybUtjWjI5NldOQnJtWWgyWlY0b0gxYXBJdXEzTFprSHJH?=
 =?utf-8?B?OGFHam1SWEsvNGhDejJJWnhEZ28vYWQzUFVyK2VnRzMrT25XWmQzZER2YkxB?=
 =?utf-8?B?ZlNSZFhmcFk1NlVtRjlPR0xCYVZpNlhHMGtxcmtNclc0RlhZNjhUTVRzajBr?=
 =?utf-8?Q?0pTs1NvbdaJJuZO8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38E5096DDF7A5B4CBB705F7A8CEA2965@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: CUxl6e4ZbuNFLK/bkzQGQO2ZO6kpBdgTKsp/s7UOUO9OiNMS9vbWkGImRlbw8EZSdvYZLJ3z5kj9tFWta1bvWBSzF/2izL1EnqNsf8lJa6xDUuxE2Tvog+gFfbPPZgMrcNlZ3LxMW7M/denXVBm7aMlQAY2XhokFqHPxSp1vXecMQO+oD5W6REsz1EoTxhmL/5w8r54AILKLUN4tEMqri/n618ksoP7fUBoT6uBoU+ruGJoEWGWTM/3Sfkp/2u0cwjTmq5Km/kzGtgjMPuD7wxYweM2a9WOHBfVDx1s2w8kJ26TRKaJXg1xkZxjPOVuW83RDyhJWm6F1GPUA/9SM4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5482.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb56eee-0777-4bd6-3241-08df49d690d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:56:41.1389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrRlaxOR7udcnvTBEB0WJhA5/zbnifSPpIO35XcCp7myxptb/HIKNskx4Rh7gw9g0pOtSYLcEo+VzlibBEphjSGlNaLE9zZ/0f0hTVXN1Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6484

T24g5LqULCAyMDI2LTExLTIwIGF0IDEzOjI3ICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIEZyaSwgTm92IDA2LCAyMDI2IGF0IDA0OjAwOjU4UE0gKzA4MDAsIEZhbmd3ZW4g
RGVuZyB3cm90ZToNCj4gPiBtdHUzX2VwMF9kZXF1ZXVlKCkgYWx3YXlzIHJldHVybnMgLUVJTlZB
TCBhbmQgbGVhdmVzIHRoZSByZXF1ZXN0IG9uDQo+ID4gbWVwLT5yZXFfbGlzdCB3aXRob3V0IHVu
bGlua2luZyBvciBjb21wbGV0aW5nIGl0LCBzbyBhbiBFUDAgcmVxdWVzdA0KPiA+IGNhbiBuZXZl
ciBiZSBjYW5jZWxsZWQuDQo+ID4gDQo+ID4gRnVuY3Rpb25GUyBhc3NpZ25zIGl0cyB0ZW1wb3Jh
cnkgcmVhZCBidWZmZXIgdG8gZXAwcmVxIGFuZCB3YWl0cyBpbg0KPiA+IF9fZmZzX2VwMF9xdWV1
ZV93YWl0KCkuIFdoZW4gdGhhdCB3YWl0IGlzIGludGVycnVwdGVkIGJ5IGEgc2lnbmFsDQo+ID4g
aXQNCj4gPiBjYWxscyB1c2JfZXBfZGVxdWV1ZSgpLCBkb2VzIG5vdCBjaGVjayB0aGUgcmV0dXJu
IHZhbHVlLCBhbmQgaXRzDQo+ID4gY2FsbGVyIGZmc19lcDBfcmVhZCgpIGZyZWVzIHRoZSBidWZm
ZXIgb24gZXZlcnkgZXhpdCBwYXRoLiBXaXRoDQo+ID4gLUVJTlZBTCByZXR1cm5lZCB0aGUgcmVx
dWVzdCBzdGF5cyBxdWV1ZWQgYW5kIE1UVTMgc3RpbGwgb3ducyBpdC4NCj4gPiBXaGVuIHRoZSBo
b3N0IHRoZW4gc2VuZHMgdGhlIE9VVCBkYXRhIHN0YWdlLCBlcDBfcnhfc3RhdGUoKSB3cml0ZXMN
Cj4gPiB0aGUgcmVjZWl2ZWQgYnl0ZXMgdGhyb3VnaCB0aGUgc3RhbGUgcmVxLT5idWYsIGdpdmlu
ZyB0aGUgaG9zdCBhDQo+ID4gY29udGVudC1jb250cm9sbGVkIHdyaXRlIGludG8gZnJlZWQga2Vy
bmVsIG1lbW9yeS4gVGhhdCBjb3JydXB0cw0KPiA+IHdoaWNoZXZlciBvYmplY3QgcmV1c2VzIHRo
ZSBzbGFiIGFuZCBjYW4gcGFuaWMgdGhlIGtlcm5lbC4NCj4gPiANCj4gPiBJbXBsZW1lbnQgbXR1
M19lcDBfZGVxdWV1ZSgpIGZvbGxvd2luZyBtdHUzX2dhZGdldF9kZXF1ZXVlKCkgYnV0DQo+ID4g
d2l0aG91dCBRTVUgZmx1c2gvc3RhcnQgc2luY2UgRVAwIHVzZXMgUElPOiB2YWxpZGF0ZSB0aGUg
cmVxdWVzdA0KPiA+IHVuZGVyIG10dS0+bG9jaywgdW5saW5rIGl0IG9uY2UgYW5kIGdpdmUgaXQg
YmFjayB3aXRoIC1FQ09OTlJFU0VULA0KPiA+IHNvIG93bmVyc2hpcCBvZiB0aGUgYnVmZmVyIHJl
dHVybnMgdG8gRnVuY3Rpb25GUyBiZWZvcmUgaXQgaXMNCj4gPiBmcmVlZC4NCj4gPiANCj4gPiBD
YW5jZWxsaW5nIHRoZSByZXF1ZXN0IHRoYXQgYmFja2VkIHRoZSBkYXRhIHN0YWdlIGFsc28gbGVh
dmVzIHRoZQ0KPiA+IHRyYW5zZmVyIHVuYWJsZSB0byBmaW5pc2gsIHNvIHJldGlyZSB0aGUgYWJv
cnRlZCB0cmFuc2FjdGlvbiB3aXRoIGENCj4gPiBwcm90b2NvbCBzdGFsbC4gVGhhdCByZXR1cm5z
IGVwMF9zdGF0ZSB0byBTRVRVUCBhbmQgc3RvcHMgYSBsYXRlcg0KPiA+IGVwMF9xdWV1ZSgpIGZy
b20gcmVhZGluZyB0aGlzIHRyYW5zYWN0aW9uJ3MgbGVmdG92ZXIgRklGTyBkYXRhIGludG8NCj4g
PiB0aGUgbmV4dCByZXF1ZXN0J3MgYnVmZmVyLiBUaGUgc3RhbGwgaXMgc2tpcHBlZCB3aGVuIHRo
ZSBjb250cm9sbGVyDQo+ID4gaXMgYWxyZWFkeSBwb3dlcmVkIGRvd24gb3Igbm8gZGF0YSBzdGFn
ZSBpcyBpbiBmbGlnaHQuDQo+ID4gDQo+ID4gVGhlIHNhbWUgc3R1YiBpcyB3aHkgZnVuY3Rpb25m
c191bmJpbmQoKSBjYW5ub3QgY2FuY2VsIGEgcGVuZGluZw0KPiA+IEVQMA0KPiA+IHJlcXVlc3Qs
IHdoaWNoIGRlYWRsb2NrcyBhZ2FpbnN0IHRoZSBGdW5jdGlvbkZTIHRocmVhZCBob2xkaW5nDQo+
ID4gZmZzLT5tdXRleC4NCj4gPiANCj4gPiBGaXhlczogZGYyMDY5YWNiMDA1ICgidXNiOiBBZGQg
TWVkaWFUZWsgVVNCMyBEUkQgZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYW5nd2VuIERl
bmcgPGZhbmd3ZW4uZGVuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL3Vz
Yi9tdHUzL210dTNfZ2FkZ2V0X2VwMC5jIHwgNTUNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfZ2Fk
Z2V0X2VwMC5jDQo+ID4gYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0X2VwMC5jDQo+ID4g
aW5kZXggZTRmZDFiYjE0YTU1Li43M2ExYWY4YjZjNjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy91c2IvbXR1My9tdHUzX2dhZGdldF9lcDAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL210dTMv
bXR1M19nYWRnZXRfZXAwLmMNCj4gPiBAQCAtODU3LDggKzg1Nyw1OSBAQCBzdGF0aWMgaW50IG10
dTNfZXAwX3F1ZXVlKHN0cnVjdCB1c2JfZXAgKmVwLA0KPiA+IMKgDQo+ID4gwqBzdGF0aWMgaW50
IG10dTNfZXAwX2RlcXVldWUoc3RydWN0IHVzYl9lcCAqZXAsIHN0cnVjdCB1c2JfcmVxdWVzdA0K
PiA+ICpyZXEpDQo+ID4gwqB7DQo+ID4gLQkvKiB3ZSBqdXN0IHdvbid0IHN1cHBvcnQgdGhpcyAq
Lw0KPiA+IC0JcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwlzdHJ1Y3QgbXR1M19lcCAqbWVwOw0KPiA+
ICsJc3RydWN0IG10dTNfcmVxdWVzdCAqbXJlcSA9IE5VTEw7DQo+ID4gKwlzdHJ1Y3QgbXR1M19y
ZXF1ZXN0ICpyID0gTlVMTDsNCj4gPiArCXN0cnVjdCBtdHUzICptdHU7DQo+ID4gKwl1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsJaWYgKCFlcCB8
fCAhcmVxKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArCW1lcCA9IHRvX210
dTNfZXAoZXApOw0KPiA+ICsJbXR1ID0gbWVwLT5tdHU7DQo+ID4gKw0KPiA+ICsJc3Bpbl9sb2Nr
X2lycXNhdmUoJm10dS0+bG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArCW1yZXEgPSB0b19tdHUz
X3JlcXVlc3QocmVxKTsNCj4gPiArDQo+ID4gKwlkZXZfZGJnKG10dS0+ZGV2LCAiJXMgOiByZXE9
JXBcbiIsIF9fZnVuY19fLCByZXEpOw0KPiANCj4gRG9uJ3QgYWRkICJ0cmFjZSIgY2FsbHMgbGlr
ZSB0aGlzLsKgIEFuZCBfX2Z1bmNfXyBpcyBORVZFUiBuZWVkZWQgZm9yDQo+IGENCj4gZGV2X2Ri
ZygpIGNhbGwuDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQpUaGFua3MgZm9yIHRo
ZSBmZWVkYmFjay4gSSdsbCByZW1vdmUgdGhpcyBkZXZfZGJnKCkgY2FsbCBpbiB0aGUgbmV4dA0K
dmVyc2lvbi4NCg0KQmVzdCByZWdhcmRzLA0KDQpGYW5nd2VuIERlbmcNCg0K
