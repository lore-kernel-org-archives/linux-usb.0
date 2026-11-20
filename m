Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162598;
	b=32BSjI83yozcwWghSHyEtRXrk4KJOuKkZx0bpKB5eU4YZwsAcQLFa04iPjDWQg0dAxXe
	 BXnGpEICFZCIJRVDgUq/slZjEXgh3TJGG60yZBlwDe/ijNt2Ae/ZdInlYuwuL9aI1iSuG
	 qt1lMf+/A7GoBE9008w2z9BGY2mD7D00mt2ddqeaSTlPR9QgEQFE/8i/IyA5FZUn4eoon
	 H1HFT/m8WjUOtrj259cE3yPp67bLo6Q+COb0qGM7+a5cuIbpifXgcEYwy4DxT6HFynaQQ
	 8nIn82V9agipHyfeEP7WxycIXoeUKHLaaMZSROfMumXJ1NNyw3Zjz2BA7TAp8mnoYqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162598;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
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
	bh=5CZDBe7MptMIT3eTs1kiBmBjU8PKjOzS+qziCpoEicA=;
	b=zGRH1FexWxGtAQULbKloNqYgT04siXHqRoCeAF1qN6iQ5NdfiaQj173TEZVb/IWEAvdx
	 XCtEVW1D/NG5hlmqpzpRAGWhPyyocHgAHMXuOp24E/BMe88sjLwgMJ7rtjP5BiUmbIxj0
	 fSq6WeVNrn2TPXgv5b4rxSYEyV9NJxNCz29Zt9xeXFm0bZEu1wnHjpIdL9FVBDYM5omZp
	 6VEsB/mns4nAr+q1fDTC1OO6FXj+anRIGwVcrAB4mFz8n0+nlKko6id3iZ4SqwFlPGb02
	 7tdojIhIMKV5nQcwnQdzkHcyqoMdqIeztLPhB1uk2G/pKfnc39MHtSsjZlcVwe6CLGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=teKUo7p6;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=RRd68Hud;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB9606A335;
	Fri, 20 Nov 2026 08:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FB9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=teKUo7p6;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=RRd68Hud
X-UUID: b189b748e4ba11f18dc8c9802ae25ab1-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5CZDBe7MptMIT3eTs1kiBmBjU8PKjOzS+qziCpoEicA=;
	b=teKUo7p61lsPsBYg/hhWjQyLpOK60ysvzVs5MfQ1L598so/9Ntw5LVKSB+j+qGtPhrpV1V6XAv7jWZaZXK27Vj7DHrV4Q/jDT9HBu6tRNZmt8hOsA3pg4p8G/CgrVjo5FL/BI2T9cLZtKktTbYVP36+jdsMrbL9HKNb/vKxPL9Q=;
X-CID-CACHE: Type:Local,Time:202611201616+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f233c173-c5d8-4ac5-bc6c-a1056bbba015,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5d4bd519-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b189b748e4ba11f18dc8c9802ae25ab1-20261120
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 357238683; Fri, 20 Nov 2026 16:16:31 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Nov 2026 16:16:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Nov 2026 16:16:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Xe7K/pwGyOgoVXxleF1DMhMcB3uyQ9CL2pbfKCioV9gMcfWFS9j1uZ2yRNvQGbLfP1WBMU6KNlvy3aDcY96bIQ6eqEoHFF8Ll6ea6ecgBJ5Bzbvneo+i69QIA7BwrKSfA7QES5ub849KizXR/K/q2x7qDuv1X0rJYD/nG6yiFxsHv3v6fYrZqftGvBC87cdvFHw5qAS4pYe89Rsbp0JihU1QoY5VFXazjgxsBicPbOzqB6Q0ssjc/r7pUQd+aGQsuCnbfFLbCRUvAU2/xQ74KPH0rnvQqHRK9JLT8rhOqxOWvoz7Erlt/aUUxrP7stiKwGcOrmDsRNonEqSB2qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CZDBe7MptMIT3eTs1kiBmBjU8PKjOzS+qziCpoEicA=;
 b=TxhQdKA5tQ15mCDEvesJF9vFVynWhvPHpr1pGDlslfX0Opqyr+9H+xAQJUK3wJnpfjRvFXVvCPA/n0Sh6B+Ob4AhcZ9TYHM7NVJCtNV0yRydsPnUpOfcZYZrU33+MnDuq98l2Q1KMMkoCiflS/7p9vpeflGOL0gdQJI8J9ckbPaH4C7YurBkofnFEEdBBCH9mu5sfYhMXDpuGlV7A76HWUrTpuZhBfquAP5AbxsOo2oW8czAUxYL9fzOROfD/qjT6ss/qrWrcztge635/eT5Ncn1lra8fcukwR0sY8/XBkCLgdX4F2ixR6rfGw/yxxRLnpJwWthWCz6Je+3KVzOS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CZDBe7MptMIT3eTs1kiBmBjU8PKjOzS+qziCpoEicA=;
 b=RRd68Hud62AyWuBcZLFqgDmJ2FQ7nb77i8g4e8+UYvwBIISeDa5IS9DItyNDySv2T9NZfHzYM5zR3M0Ptif53ffnxtSrUXFP/yCWcoL5WTLLsQ+TNIzEUtTzTjpZ1tQ+KkYu7rXaJEofhsJA/lmyKbWqg995jz5+ZdZ0DCmXvvw=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by TYZPR03MB6494.apcprd03.prod.outlook.com (2603:1096:400:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:16:27 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 08:16:27 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"westeri@kernel.org" <westeri@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Topic: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Index: AQHdcQmVpPqBwBYaX0OmA8rjtdaWS7cnYBUAgArYOgCAAAqtgIAEac+A
Date: Fri, 20 Nov 2026 08:16:27 +0000
Message-ID: <39fed6e12d60f439e0f07f3012d675f1c85d2b84.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
	 <20261110143758.GC259790@black.igk.intel.com>
	 <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
	 <20261117125241.GA259790@black.igk.intel.com>
In-Reply-To: <20261117125241.GA259790@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|TYZPR03MB6494:EE_
x-ms-office365-filtering-correlation-id: 231bb5dc-089a-4711-432a-08df46de9316
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|261022105027099003|10067099003|261022075727099003|4143699003|5023799004|11063799006|56012099006|261009223027099003|261102123227099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info: TzDcWr5rdxshA2FwoblOci4B4m1p83Jdz+cP5EksR9WSn2C28eastc9UMtCSe94U5kM3UcgKWCE0bvkALatDNTrvydv2hCtcLCF4vufuR/0qWG1Djr6uVD0DRIJ+G7Wq3a002L9JxxphjWsyHKVj7cafTOWWHbNc8jtqtoPjxB0I+VdJzJdWRyoo2/szKNy7k+uzF0jgp1oTWvmrN+/yO1SEKB2JE7Z+QXc05hUzE/P1k0RSAg5mphRpCNYGKawcmhQWpXonk0q/Ca8SgTQXXnYg9DKi41pcXgCfpsHXlFA7YJdsqhMlPlX5Bc2zxBFkWWfoIogmpPNzWiLqQ6Xaeh9AXiRlNpOmQ4ZcG0k2b47jXEU7aLD+q9My+LJ2f7rMBZLyluXErqIztHwKjHnadWmD/CclylFCFAH1bMmKYpzX0RG8oWOsVONU9oJ11QPBKI/u99PsyadBtSh7xuYo3N2myBdcEnSCVYqHnDlAUnb2Tiwogw6IMFSr2lwZCTHqjtyaluKiU7HfReXoWaBd5hAPeurO7nzeVDWU6Lcj1US2JpyOT6ffcN2IDuwY2Zn7UVF/VOoyDRhKgrpCxVbDTECRNwSMcB0xYwbY9VuNDZdMu3ZsLSt88SA9khDanWyla/NGNLp9F8oz/DUvQENu+gBwghY1K4Qr/2mxEZHp3lUOegbRv9qCkYhcZN3MtR5o4+ymbV1Jka2A2ESY9Y3ZLYyMjsUMMZTs7FgTaY/DQQU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(261022105027099003)(10067099003)(261022075727099003)(4143699003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVh3NWpSZnZnaktGNGNUc2ZyZmhSRjhLY0RyTmZKdFQ3dWJBS2x6Tjc1cHpu?=
 =?utf-8?B?UjFxREo3Y25Sbk9Vd2hRSU5ISytvbEdJeDQrMmpDVlozM01wYlY5U1dGQjZq?=
 =?utf-8?B?eU5tUVhlaExrVWNFZzBqOHFCUzNpbE56QXZmc2JsT3JEMys3VER6VTBBbnRO?=
 =?utf-8?B?MURIZndUYlQ5VDV2SnAxSVY4RGMwRFYvelY5ZmZqNHljSmI0MFpUSmlQcHJp?=
 =?utf-8?B?UVNPd3d1VC9ERS9DL3NkaE5RRWVJcVNaQWhpVzFISmJjZ0h2V3Brc1RTYTFW?=
 =?utf-8?B?Wi8vQzVKbEdUaDRaeVBQZG5leno3QkRSR0hUUkxwSG5TcHM4SWlTaWEySUFq?=
 =?utf-8?B?QjM0Uld4QkUxL3hxSmdNUUxyb05sSlZiSHFDWDRHemJLalRlNGl6T3Y2M0lG?=
 =?utf-8?B?UHNOMEhnQXEvcTFDWTdJbW91ZGVlYm1RL2JiR3V6TzZQcUo1NkxtYWw3OGhr?=
 =?utf-8?B?YnpXU1duVEV6Uk1nSFo3TytKZEdwNGFDNXhqUmFpaFRQWVZwZVd6czNnQi9n?=
 =?utf-8?B?cVZUNVFlMkQrRStRSjBMQ21CVlBZRlBPeWx2UHRaN3NsQmZXSTAxOWtYNURG?=
 =?utf-8?B?azNuMlUrNDNja0lLZEtXWFlxLytSRGFVWHJFUUlLZWRyT2YwSGptQjdoME9N?=
 =?utf-8?B?c2FRWTNXd3FxOXZTazFodDJKQkx5MlJ0L0wvdUEyNk1TQjVUcUFBSUdBT2tI?=
 =?utf-8?B?MTU1cXZOVTBGNEorZDY4LzNPbDQ0NHdIS2hTNU40RGxYT2tTVytRWkV6a0tU?=
 =?utf-8?B?cmx0QldZZHZrOG95aVo0TzhqVUVtZzgyaHJkNXpGbXl5YVJyYkxJNGwrdkFO?=
 =?utf-8?B?Ui9Cb2s3YzNhR3ZabDV1MFcvbGpBeTVHeTBvVXBYNFZGVDNkZVVtSzRKRk5L?=
 =?utf-8?B?bnJvYVlTcEFpcnVsY2liTVE3WEtpRWlIVW5HWENrZTMrazZHZ0dwR1BSMnRK?=
 =?utf-8?B?dG5JNnpVZzhYTm1kSlRNTmdaWjUybkpGWnkvNlFCVlpWbjZLbWpPMTdNZmN6?=
 =?utf-8?B?ZXZTS3lHTEQwL2FjVWZucXF5VlRXYzlueTV4dDVLdlEwZFNJcy8wOWdWdTFy?=
 =?utf-8?B?ajdvbDVSYUs3TFdyZStURU1aQ0RZQ0hOL3E4OFFyWDdtSGsvajh2dSsxL1JY?=
 =?utf-8?B?bXdib3cxSjNBN283L3FXMW1LU0FrQmlyV3NBeFNUWVBha3dOMWJBVW51K2JH?=
 =?utf-8?B?RnViam1XWGNGWG10WVRjV0haT3FjOGl1WGhVZHNzeEhpcnphMlRYZEZuSnJ1?=
 =?utf-8?B?cVFMdTB1d2Rlb1VkcHNWMThqTUFWKzdPV3ZPMlBBVnIwdEFhOXJxS3R6Tk5o?=
 =?utf-8?B?SVdISHJLcjJoVUUveDhvZ3V4aHRzZmNxRGlLR2V1Z0Y4YnhMNkJwclVYVzUv?=
 =?utf-8?B?cS8vaVY4NXEzdnp4VnV3VitUcmVuUGVpazFqbzQ4QmdRQjBVYmVDcGUycE5m?=
 =?utf-8?B?SE83MEJVSXNkbGE2K3JFYXBQcjZyMXE1alZUbVRObUFnQmhDSzZ0TGVpZUx1?=
 =?utf-8?B?ODlqWFhBbWJmU2I3M0tDdGtiTm41YVpYMDNoMVBhWjRlblFGbXBaNnVmQkVI?=
 =?utf-8?B?UWpxTTJhS3VaWCtaZkRRNFYrN0RqSUMvcHhVOFNvbW5MUTdka3EydTVuclpm?=
 =?utf-8?B?KzB6SWVkWGoycFJteWd1UlEvTWdkbEt2a2pSdDQ3bHlVbFkwbThYNUZwQnFM?=
 =?utf-8?B?dlliMWJwMklXRXNnUTRkdkFjcDZCeTV4dXNKNjFHb0tSeU0xanlQSmN3TlhH?=
 =?utf-8?B?M2RtT1JBdDA3a09NRHJnaWN2eGxZaGREMEFTZnA4V2NMYUQrRUVTWkNaaFFr?=
 =?utf-8?B?ZXc3Q3ZhVGZIelllRmZLekJ4ZWl2ajdmaVhJQ0MvdzAwUE43UVg3U291cUJJ?=
 =?utf-8?B?YlNRak5EajZ5TVo2a0dHQ3BITlB1aWhndnZFSmVlMmZBZEllRWc1SnZxU0tO?=
 =?utf-8?B?clpJdHBzU2xNKzd5UW9SdXZxbEkrcjUzektrVUVlekF5YzFmbG9oSkpNNktu?=
 =?utf-8?B?cnJCaStnRkNQL1R4cEdpZVBXKytMVlZ3WEgxWlgzeDRGK05tQzg5dXUwcFRx?=
 =?utf-8?B?ZHRWQ0FwSjFjd0FWRHVXUFNmTHNKemF4cGZSTmZsNzdwWWpYUXNIa09mMDJD?=
 =?utf-8?B?M2FJL0lCQmxPZVU2UXl4WDFCUnh1MUNNN2pEbHg2ZnQyWm40Sm1zK1FGZktP?=
 =?utf-8?B?akhRK3AzeGdodDFyOGp1bE5UUFNmVEhLRmNlL3h1NEUvbURVVUhndVRRbkxI?=
 =?utf-8?B?UVo5YzZMdFpldW1oTXlyTDV3K1BOMUJ5cXNDa3MzWXJJSVVLT1I4WU52Y1U0?=
 =?utf-8?B?VkJqUnlqVTZKM3JoU0IramQrRG9kZXF2Q3dsc1Q1enZtZHhpTDBKSGZWa3ZH?=
 =?utf-8?Q?bhtEqRAzE1rxtDQw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C16B04D598A54AA80D4414BB247C18@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: dx4umQJi9TctsjasQY54wHutxTEG8cuNgRnUO76/SLTK5JKIaHfb+kPP15FEATG75CoW+LzMZbzAuDmyW1lb4FLsGd1wgs968nwV/XAKXtUe0wpBk8eE7UcXl31HN1q/FqPOapwH8MHJTEF0AF0hOb/fB7j8oIpNSdOM02vsNcqpveDLkROGMIPGWHGShpUGNQLNySV3gw06uAvsavieDNi3AYyKK12id3DRDB+tgaejDq9UcxdDWeBsaS6WpX1WtIzMbLP36qgg4hc3m3rwIReIfhI/t2QOY6rzDKeOpGh2HN2UgFCQNUDoVWWeanl5Y/zI9dwr+JTNiTZggiF3hw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231bb5dc-089a-4711-432a-08df46de9316
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:16:27.4176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVTrdgTrjIvYIwjn+4yOcHscNGXb0Gl2Z/nfUZeC1Wfe5wrnTvglmww4exWevl2Pdf/A8V6jVcSyJChAlyPfoBZUPy1h01lQWmzpxSuKzVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6494
X-MTK: N

T24g5LqMLCAyMDI2LTExLTE3IGF0IDEzOjUyICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIFR1ZSwgTm92IDE3LCAyMDI2IGF0IDEy
OjE0OjI5UE0gKzAwMDAsIENodW5mZW5nIFl1biAo5LqR5pil5bOwKSB3cm90ZToNCj4gPiBPbiDk
uowsIDIwMjYtMTEtMTAgYXQgMTU6MzcgKzAxMDAsIE1pa2EgV2VzdGVyYmVyZyB3cm90ZToNCj4g
PiA+IE9uIFR1ZSwgTm92IDEwLCAyMDI2IGF0IDA3OjQ4OjUyUE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiA+ID4gwqANCj4gPiA+ID4gLXZvaWQgbmhpX2VuYWJsZV9pbnRfdGhyb3R0
bGluZyhzdHJ1Y3QgdGJfbmhpICpuaGkpOw0KPiA+ID4gPiDCoHZvaWQgbmhpX2Rpc2FibGVfaW50
ZXJydXB0cyhzdHJ1Y3QgdGJfbmhpICpuaGkpOw0KPiA+ID4gPiDCoGlycXJldHVybl90IHRiX25o
aV9pc3IoaW50IGlycSwgdm9pZCAqZGF0YSk7DQo+ID4gPiA+IMKgaXJxcmV0dXJuX3QgdGJfcmlu
Z19tc2l4KGludCBpcnEsIHZvaWQgKmRhdGEpOw0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90aHVuZGVyYm9sdC9wY2kuYw0KPiA+ID4gPiBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvcGNpLmMN
Cj4gPiA+ID4gaW5kZXggOTM3OWM1OThhMjIxLi42OThmNDdlYzYzZGEgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvcGNpLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy90
aHVuZGVyYm9sdC9wY2kuYw0KPiA+ID4gPiBAQCAtNzM2LDQgKzczNiw1IEBAIHN0YXRpYyBzdHJ1
Y3QgcGNpX2RyaXZlciBuaGlfZHJpdmVyID0gew0KPiA+ID4gPiDCoAkuc2h1dGRvd24gPSBuaGlf
cGNpX3NodXRkb3duLA0KPiA+ID4gPiDCoAkuZHJpdmVyLnBtID0gJnRiX25oaV9wbV9vcHMsDQo+
ID4gPiA+IMKgfTsNCj4gPiA+ID4gKw0KPiA+ID4gDQo+ID4gPiBJIGd1ZXNzIHRoaXMgaXMgdW5p
bnRlbnRlZCBjaGFuZ2U/DQo+ID4gPiANCj4gPiB3aWxsIGRyb3AgaXQNCj4gPiANCj4gPiA+ID4g
wqBtb2R1bGVfcGNpX2RyaXZlcihuaGlfZHJpdmVyKTsNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdGh1bmRlcmJvbHQvcGxhdGZvcm0uYw0KPiA+ID4gPiBiL2RyaXZlcnMvdGh1bmRlcmJv
bHQvcGxhdGZvcm0uYw0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjM1NjJiNmM3ZWE3ZA0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvcGxhdGZvcm0uYw0KPiA+ID4gPiBAQCAtMCww
ICsxLDE3MiBAQA0KPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQ0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIFRodW5kZXJib2x0IGRyaXZlciAtIE5ISSBk
cml2ZXIgKFBsYXRmb3JtIGJ1cyBzcGVjaWZpYw0KPiA+ID4gPiBpbXBsZW1lbnRhdGlvbikNCj4g
PiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBBdXRob3I6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVu
QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArDQo+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvYWNwaS5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0K
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGlu
dXgvb2YuaD4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4g
PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8
bGludXgvcG1fd2FrZWlycS5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4g
PiA+ID4gKw0KPiA+ID4gPiArI2luY2x1ZGUgIm5oaS5oIg0KPiA+ID4gPiArI2luY2x1ZGUgInRi
LmgiDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBpbnQgbmhpX3BsYXRmb3JtX2luaXQoc3Ry
dWN0IHRiX25oaSAqbmhpKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCS8qIGF2b2lkIGRldmljZSBs
aW5rIGZhaWwgZm9yIHBjaWUgdHVubmVsICovDQo+ID4gPiANCj4gPiA+IERvIHlvdSBoYXZlIHRo
ZSBBQ1BJIF9EU0QgdGhlcmUgaW4gcGxhY2U/wqANCj4gPiBZZXMsIHdlIHVzZSB0aGUgc2FtZSB1
ZWZpIGFzIFdvQSB3aGljaCBwYXNzIFdpbmRvd3MgSExLIGFuZCB1c2ItaWYNCj4gPiBjZXJ0aXRm
aWNhdGlvbg0KPiA+IA0KPiA+ID4gVGhlbiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkDQo+ID4gPiB0
aGVzZS4gQW5kICJwY2llIiAtPiAiUENJZSIgZXZlcnl3aGVyZSAoZXhjZXB0IGluIGNvZGUpLg0K
PiA+IEFDSw0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+ICsJcG1fcnVudGltZV9zZXRfYWN0aXZlKG5o
aS0+ZGV2KTsNCj4gPiA+ID4gKwlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZShuaGktPmRldik7DQo+
ID4gPiA+ICsJcG1fcnVudGltZV9lbmFibGUobmhpLT5kZXYpOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJZGV2aWNlX3NldF93YWtldXBfY2FwYWJsZShuaGktPmRldiwgdHJ1ZSk7DQo+ID4gPiA+ICsJ
ZGV2aWNlX2VuYWJsZV9hc3luY19zdXNwZW5kKG5oaS0+ZGV2KTsNCj4gPiA+IA0KPiA+ID4gSSBh
bHNvIHN1Z2dlc3Qgbm90IHRvIGVuYWJsZSBhbGwgdGhlIGZhbmN5IHBvd2VyIG1hbmFnZW1lbnQg
dW50aWwNCj4gPiA+IHlvdQ0KPiA+ID4gaGF2ZQ0KPiA+ID4gdGhlIGJhc2ljIHN0dWZmIGxpa2Ug
dHVubmVsaW5nIGZ1bGx5IGZ1bmN0aW9uYWwuDQo+ID4gSSdtIG5vdCBzdXJlIHVuZGVyc3RhbmQg
d2hhdCB5b3UgbWVhbi4NCj4gPiANCj4gPiBpZiB5b3UgbWVhbiB0aGUgZnVuY3Rpb24gdGVzdDoN
Cj4gPiBJIGFscmVhZHkgdGVzdCB1c2I0bmV0LCB1c2IzIHR1bm5lbCwgUENJZSB0dW5uZWwgYW5k
IGRwIHR1bm5lbCBkYXRhDQo+ID4gdHJhbnNmZXJzLCBhbmQgYWxzbyBydW50aW1lIHN1c3BlbmQv
cmVzdW1lIGFuZCBzeXN0ZW0NCj4gPiBzdXNwZW5kL3Jlc3VtZS4NCj4gPiANCj4gPiBpZiB5b3Ug
bWVhbiB3aGVuIHRvIGVuYWJsZSBwbToNCj4gPiBkbyB5b3UgbWVhbiBlbmFibGUgcG0gYXQgdGhl
IGVuYWJsZSBvZiB0Yl9uaGlfcHJvYmUoKT8NCj4gPiANCj4gPiArCXBtX3J1bnRpbWVfc2V0X2Fj
dGl2ZShuaGktPmRldik7DQo+ID4gKwlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZShuaGktPmRldik7
DQo+ID4gKwlwbV9ydW50aW1lX2VuYWJsZShuaGktPmRldik7DQo+ID4gDQo+ID4gdGhlc2UgdGhy
ZWUgbGluZSBzaGFsbCBiZSBwdXQgYmVmb3JlIG5oaV9zZWxlY3RfY20oKSwgb3RoZXJ3aXNlLCBp
dA0KPiA+IGZhaWwgdG8gbGluayBQQ0llIGRldmljZXMsIGFuZCBJIHdpbGwgY2hlY2sgaXQgYWdh
aW4uDQo+ID4gDQo+ID4gKwlkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxlKG5oaS0+ZGV2LCB0cnVl
KTsNCj4gPiArCWRldmljZV9lbmFibGVfYXN5bmNfc3VzcGVuZChuaGktPmRldik7DQo+ID4gDQo+
ID4gdGhlc2UgdHdvIGxpbmUgY2FuIGJlIHB1dCBhdCB0aGUgZW5kIG9mIHByb2JlLg0KPiANCj4g
SSBtZWFudCBkZXZpY2VfZW5hYmxlX2FzeW5jX3N1c3BlbmQoKSBpdCdzIG5vdCBzdHJpY2x5IHJl
cXVpcmVkIGFuZA0KPiB3ZQ0KPiBkb24ndCBkbyBpdCBlbHNld2hlcmUgc28gSSB3b3VsZCBsZWF2
ZSBpdCBvdXQgbm93IGFuZCB0aGVuIGFkZCBpdA0KPiBldmVyeXdoZXJlIGxhdGVyLg0KDQpJIGxv
b2sgYXQgdGhlIFBDSSBjb3JlIGNvZGUsIHNlZW1zIGl0IGFscmVhZHkgZW5hYmxlcyBhc3luYyBz
dXNwZW5kIGZvcg0KZXZlcnkgUENJIGRldmljZSBkdXJpbmcgZGV2aWNlIGVudW1lcmF0aW9uIGJ5
IGRlZmF1bHQuDQoNCiBzZWU6IHBjaV9wbV9pbml0KCkgKGRyaXZlcnMvcGNpL3BjaS5jKQ0KDQpV
bmxpa2UgdGhlIFBDSSBidXMsIHRoZSBwbGF0Zm9ybSBidXMgZG9lcyBub3QgYXV0b21hdGljYWxs
eSBlbmFibGUgaXQNCmZvciBwbGF0Zm9ybSBkZXZpY2VzLCBidXQgZm9yIHVzYiBkZXZpY2VzLCB1
c3VhbGx5IGVuYWJsZSBpdCBiZWNhdXNlDQp0aGUgc3RhbmRhcmRpemVkIHRyZWUgdG9wb2xvZ3kg
d2l0aCB3ZWxsLWRlZmluZWQgZGVwZW5kZW5jaWVzLg0KDQpEdWUgdG8gd2UgZXhwbGljaXRseSBj
cmVhdGUgZGV2LWxpbmsgd2l0aCB4SENJL1BDSWUgY29udHJvbGxlciBkZXZpY2VzLA0KaXQgaXMg
c2FmZSB0byBlbmFibGUgaXQsIHRoZW4ga2VlcCB0aGUgc2FtZSB3YXkgYXMgdGh1bmRlcmJvbHQv
cGNpLmMNCmRvZXMuDQoNClRoYW5rcw0KPiANCj4gPiANCj4gPiBpZiB5b3UgaGF2ZSBhbnkgc3Vn
Z2VzdGlvbnMsIHBsZWFzZSBkZXNjcmliZSBtb3JlIGRldGFpbHMsIEkgd2lsbA0KPiA+IHRyeQ0K
PiA+IGl0Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQoNCg==
