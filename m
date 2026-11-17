Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917793;
	b=pDGsndmEkAec/2zP+9oOscBmDdjiCiFxPSORWEBlswTXaiHiOtl8bLd2SsNOPRPwAZh9
	 yT5Qan25oDoqWm0sndZ6YAjFSWS3NAUf+qZjkeRyDVcYN6nn4e/zlWrusnQhWJvXcdvph
	 sPv7z7s+J5kabi7pSwuVokwNvAogc1U5CFIVW9O1gkmKe4cOI/rhj4T86gr4hblxbIBNu
	 O6zJ+HOe7m456KtFiw2KOu5LgBckS9rbw6DJ6RybSZ98XBsZ8c6L7Uk1QWZqUfm1pUw+k
	 RHIKfeasr0oPDsXQ186PUfcKdARqtkjNpNA0h0Ss/2E29hlSTCD6UnfxQggV1Df0+cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917793;
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
	bh=dAdWxd5UOXi1KnuruWcizzA1gwJuP7NGLbl9CeXw9e0=;
	b=Ytdal7ezZjCDytOQT/B2x6Vg4N5yNfNpBgpZu7W6A5xxRug6NyowXHEF/OUNjtFaF1gt
	 PUU7NVPlrz0j2p8pad5eMHsQGNALxixmFbgtfe8MjE9Hq9A/APmYvprh+WI3P0pyuvE48
	 0CVYNWZWR/WLYMUUZZ28/3d5xvrLERK1dTi1hulattBOAMQ6N7ZzSuGkYxp0tD5Cij8ws
	 cPJq64Thdd/vtm7N+ZKgTjKpCw8WVyxVYd9cMBIZH0j4woQ9/dly2ebo2Q8T76BFmtfMT
	 V8+te7AQs4UrN7jr22g4L3260+qxfxVSkdjZqR6Yf4/OUcpuTXd6eYRSC6tcTP62alA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G3ecKpKt;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=leo3nlcq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC5606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G3ecKpKt;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=leo3nlcq
X-UUID: b6dc4ef4e28011f1b1788b6acf885367-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dAdWxd5UOXi1KnuruWcizzA1gwJuP7NGLbl9CeXw9e0=;
	b=G3ecKpKtVGW0vC9I2t+20PK90piR2K6GGDTqRB04CAYxzuKrlzHvujlEery7MH/QjpLZLz0mVW/xTORF7VO+wid/GK4Gp3HlTYYltMnXrUrjRncFlXbJSexOLrJ3ZmbrAgGded4KoBChXklRuJGQDyprN5ABd9IhV8eunUDsN5M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7a4ece8f-369d-46b8-96ef-2237b21fdf7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ba06b119-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6dc4ef4e28011f1b1788b6acf885367-20261117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618479281; Tue, 17 Nov 2026 20:16:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 20:16:26 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 20:16:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymEShkXMi2QHRh03Y//bVmb4vds1x0Gevc9Z0kz59yE5gAyh88FAOs2tD2Y6QeRWnSPDdvTLSLa7zSbmMfFCs7cVIdMFkHdXEA4BvSaGZRcDITKnALaB59rlPjo9JPMaGBCRevJqwVfMuO7vHWGY46YoXYKa0NzRnp7owLo3tbmepVnXp0EDEDBQJyWL5joxef6lMW8taGGOklpLk5iI7/+FOSk8IcZoob1Uh805rxQY5VOHTDN/hvye3CP8e7TsV+u3IlQVcw0DIl4JkbTp650gAXynG6SVxNSmzU36j4zUFho8ELoV3LQqoqVzbnJqfYn6orAoTRTmAodWfWNkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAdWxd5UOXi1KnuruWcizzA1gwJuP7NGLbl9CeXw9e0=;
 b=ICC+IVUyAO1qmBgZ/240mXNIv5JtVHxqppaeWahagI5kObRBhzvD0Nee9SxEroVZ/oG89KFxxE4Me0o0vdNsSeZEq8Rnql6Tvf/7OhHcoR+3dU2ix4WTt/WeAKusip3vDXnGyYMOzhft1hnqXKypKFgXP8/u0jYq8ZC1xz9/GKqcMUbnqxAXDILgp7Xx0KVVW3kygdShlUzudbkOEGttIml8N98BNgq4hzANYw5uzEmx6wFjMRg6cQQampHPiXkljIFszWuCocrllOxYeT2kzZ0hB1WP34YLwEYLNAgpQ86QR9XEbvbZc2EdQd34stjsisw8sBxxU7hrb0i0YWBnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAdWxd5UOXi1KnuruWcizzA1gwJuP7NGLbl9CeXw9e0=;
 b=leo3nlcqzT2+mb3XsvS+/3Udkn2NhBmAX1uaNLaCNnGwjTsXKETVNdo3gIJzR2WFU3WJ7f2XSXRcvJgmogFGrwOWkLIb5zI/gMNXKugxfm+LMjUjVTyTSgznije25jU0ruAcKsFka+pBnbUZy4M9MmFq3OrAu5aawivccT7dq24=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by TY1PPFDC458EFE2.apcprd03.prod.outlook.com (2603:1096:408::a6f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:16:23 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:16:23 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Topic: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Index: AQHdcQmVpPqBwBYaX0OmA8rjtdaWS7cnOE+AgAsAiAA=
Date: Tue, 17 Nov 2026 12:16:23 +0000
Message-ID: <6a4ab2d80ffa92e92ace7de0d4f1490dbf9ba07a.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-206992@kernel.org>
In-Reply-To: <sashiko-outbox-206992@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|TY1PPFDC458EFE2:EE_
x-ms-office365-filtering-correlation-id: 4f4159ac-275f-4cc1-b00d-08df44a49863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: en4/JfVuZxLa7Y8Vkr1H5Pz9bulX65mDmww/V1IgDOPYnQH7RzFWVeBusvWlhNntPx1sLf0pkWWGU9hTRJ7Xt4eZOoYmVPBEfLCFYeL0qsKwpSz4XHnbQT6/3JSUA/lax5sp6qFH6pE+NuWJB7GmT29VzL1neOL9ehVH0Ez/EnOKW2a8DrgTXBz5UUHpYsSFf6VypZDdZ2JRePVtSjBY5P3d4UM37PLWIxzVm5tGz+sfEjeSjr0Ij8LAzOz3W/vMpthu9K9hsxdPapdkYHs3KmFHc7anI6LBOB6WG8UBBq7z3+A5ICJ+yHcYy880RbnxnGrIJWgXF7/qYpaqaDgsOmDgxxg255Mst8NggOtILQWxg+RK5y69UY9mpvODO0Kw2SFkGv97fjut+YHq7h78b1PJnWnkhs7HJEgEyuQdg1hfWGXvfCdzbWjKjuSh+jLoffI6tq/cAFOYcuLVcKWU1xdxkCM+VV91mQOuPEATPTbY1H7hJbLHa1vqL/H8E/3wg7X1uKPBa6FxGj701DxjdJ9BXYLaj1b+8/PI8wCoOO6G+g+6+DHkPj9t0KY7LR6DAWLNqubdhImj5ghbG95FbuYG9Sthjntj5b5ajjudrBDmAgvN2OC+3tK4/aIcN0jkdT7ZHhqNsv7XIxwsBhFZj8HUb/fMaHFTCzcarhE6cZlCoilajKTAMxC8LhfxDbdHFKad66TIxvR01OkXyHOr3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3piaTlYZVY0c0FhdnBwemlKcVo4ZUx4ciswV0JRbjU0dXRJRy91TCtPZnVI?=
 =?utf-8?B?eDQ0YWloRjVyMTc0ektabU5Bd1BjeFp3TTRrSTdvc2FYMDJyai9KTThmbm1t?=
 =?utf-8?B?WXRsbHNQN0wvUXc2emx5NisycTVIOGFka1J2WFJtRG5qZEJZMmZUSTcyazNt?=
 =?utf-8?B?UmNDTVk1ZGNUS0pnakFkNXA0MmxpREQwVytia0l0Vk1JMTNQdHpPdFpQZVFO?=
 =?utf-8?B?K3BtZXBrZ0J3UDdXM3YzaVZVaEFDZHVaVWNDbWNJZ0NWNDBFcjRLNmM1SzdE?=
 =?utf-8?B?MWx6VFNUR1gvczJaYkRvMkFiL1BRM3VidVBIN3E4eGVrc1ZIelNnemRQb0Y3?=
 =?utf-8?B?RmhDN3QzWE5TOUZGRWFtTlQ3Sk0yY3hkT3lsQXVRZkxXS2NxWXVERmpTZXFl?=
 =?utf-8?B?blQ0MDdkQ3VMWktPaVVQUVZSR1lvTWJIRGFnWGVJOEl0SXlFN1l6S2pYbWo1?=
 =?utf-8?B?clRYeUFQc0dSUEg1SE9EWmgyUkVpV2M1MWU1dis3RFhKM1VHZi8xTnIxeEJE?=
 =?utf-8?B?Z0tjSEN5SkF3bHF0OE9oL2diRnlNSTVOMTZwU1l1TWtHRTBSV0krcWcvUjNy?=
 =?utf-8?B?a1ZJNERscDRwMUxrSTJObzM3US83YWQ3R1ltVS9HSjMvTWdxTEtBSFRGTnQx?=
 =?utf-8?B?Qk1pNnBNZEx6Wm5QS2hjVS9qaW1JbzV2ZHo0VHJrQlUzVFpUUkgzczNJcmQx?=
 =?utf-8?B?cXB3eHQ0Z3NwR3Q3M0I5dHE0a0RwalRzQUlkSDNsN3YzMUJPbFZPOFBwK2lF?=
 =?utf-8?B?eUZmWWQwazYvZEdXd0ZlcVA2L0h0ZGxaNUIzazJHR2IrLzNlMkE0MS9Iemds?=
 =?utf-8?B?Q0tmdXdSUVByUUh5TzVjb29lY3VTMXhWTU1VSnYrSkw4M05UQlpENUo5RVRt?=
 =?utf-8?B?Y0tYMWJSRjV6SURqeHB6anlOa2UyUGlvdmhBaGFwblJhOXgxY2c5aERMSlFM?=
 =?utf-8?B?aklFRVJWZlhFbzJmSW5kK0hXSWRIOTNEN2svSEVQcXhmYUw3VEc5aFVUZmJO?=
 =?utf-8?B?YjZBa21wdmFLT3BUdWZndFh1RWxoM2xBbUk4UTIxemxIdGQ3TytpUFdxWmFO?=
 =?utf-8?B?R24wTmpkVU40dFZmWjdjODErUkM4MDByRVUvMFhsMElZU29LckRDK1hGY3ZZ?=
 =?utf-8?B?M3RzdTFPZHZXQUtXSzFTZUJFemFHS1pBa3ZTYU9oZlNsc09CeHRwMEJpYmJ3?=
 =?utf-8?B?bmh6aWtENVI1Yko2TytXSnpmWm5BMzF5MlR0b2NLWnFiVmVoMXBDb1ZXQTlj?=
 =?utf-8?B?bHZieFc4Z1phR3BSSlpCbm5WWHp3WVQrKzdxeWtvbEZYRVFaK1dlVExxQmVx?=
 =?utf-8?B?UDgwcVloYzBrZW5tcFlYM0IxRlBmRGNNaFRKZTdoNjI1SlVOZHhidHloOU1m?=
 =?utf-8?B?bzZCNVVoR1ljaEVLY1dPUnRWR1JjK3U4aDkyNGlXTzJ5aHFOQ0xxcHh6TG1l?=
 =?utf-8?B?TFE5U05RZEtnQVhNRDM5S0xiWTk4Y0p0aThEemNkdEdnaUlqNnlzK09FL1Aw?=
 =?utf-8?B?MWI4T3hXZlhGc3daNFNoTWMyM1dTUC8vMnNPRVhGam8vU2daajZlNFRMcmR5?=
 =?utf-8?B?ZG1VK09hbHB6UWtZTXBack5EaUpIS2lEWnh5VUZndkg3elgyNVd0UjB1NHJ6?=
 =?utf-8?B?bEpZdkE5WEhITmx3c1Vld0gva0tBZVRVdENnbi9UM2VLOTBpTkY1bkJ1RTB1?=
 =?utf-8?B?OVpTd0RDR0c2N1ZxL1VZUUtkaFVodk01SDQ1bkNtRXcyQ2NMSnVDZDJYbmNv?=
 =?utf-8?B?RHlaUUs4Qkl3c09WeEZjSjJ5T21MME81ZGlsUjBiYlMyTVdMZzVyLzBZc3lx?=
 =?utf-8?B?RWlnL0dyMW5FM1l6aHdKNGZ3cEhpNHExdDJSeWUwWE9SZnlEdWM4TGNKbFdT?=
 =?utf-8?B?ekk0b3BwWUp5bGM1WnpkTEVVRitRazlhNUE1MCtXSU5rVExSTVlxNHVvaGk2?=
 =?utf-8?B?dWJMVHp0QXdiaTFsOGFlajQ4c25pQnlXSjkwNlpZWXZLMG5QcXRJempMc01B?=
 =?utf-8?B?QXhYa3BXU3JiMU1aN2tmQ0NmaC9rNHo1cjBTVDZOM1NYdDBTaklNMnEreS9x?=
 =?utf-8?B?NGpoNzlmWndPTGN3KytMLzlOVkZuQzhYdlM4Q3NjSEV6eFFUUmU5RUI0Rnpo?=
 =?utf-8?B?S1J6cFhDaS9HNnMxYkF3NEVpR2UvclNmdndXbnEwSmRDNWQvSHp5dlBjZE4w?=
 =?utf-8?B?YzlaSlJUYmxKZGxQb0JId05mL1g1TlRRT3FpekFZVGwrdUhqdU9SNXlTMEY1?=
 =?utf-8?B?K2xYTzBaUHVIVnNHa3pNWjlSWVYzNEc5enRuQ0hkYmMvQUpraFJmYzhNbFRp?=
 =?utf-8?B?U1IzSm5aazQrQVhMRzJWdzcvR242NjBrUS9DUGw3bEFjMnBwaFFPcXk1Uld6?=
 =?utf-8?Q?fF9e2OmJkKlHZdoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AEE4252E7FAE94094FAFF5D40A8DB5D@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: EExrG9xS5ewllJY2JaCRPhPXhORhnQvng1zGh1tGqWcv41RRiEfn+ais0jwXjFONvpAbTZkZXqZTdpyvQh4jPTTBPavtzKdswKWOooT2z1FY2QUhukSU8GIniN8aQhJnpU6BwQPC15XMU/z8EhMX30EWjPkTuQjsrgdjEAD7VhHXjpuVHe4y9McYS2zrj4e2vzMj3qGRBwdfugEwfOF9ii7Jaqc6E4lhdqhWKnsmpiJscysNs8L6KvfBxfSmgQrH4BByyP7xu5ZrnhhUKM6Pn3LOrYSPYgWCNrUSBOQsT0ZaagzuyeEGiq1u/VveCUTar2wvdVpAA5U9cuAddVfe3A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4159ac-275f-4cc1-b00d-08df44a49863
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 12:16:23.1510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+E5mEn+FJWYnEyVYIRONpFe1GK8udBm+HXJ1tkk0DuIUeKfM43EHFF4xkBCDR5/bKvPOHcbvnR0qGB3I4dzJtgC8Z86CPbKG/FQTvryOZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFDC458EFE2
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDEyOjE1ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbA0KPiBpc3N1ZXMgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hd
IHRodW5kZXJib2x0OiBicm9rZW4gc3lzdGVtIFBNIHdoZW4gc2hhcmluZyB0Yl9uaGlfcG1fb3Bz
IG9uDQo+IMKgIHBsYXRmb3JtX2RyaXZlcg0KPiAtIFtNZWRpdW1dIHRodW5kZXJib2x0OiBtaXNz
aW5nIGNsZWFudXAgaW4gbmhpX3BsYXRmb3JtX2luaXRfaXJxKCkNCj4gYW5kDQo+IMKgIHRiX25o
aV9wcm9iZSgpDQo+IC0tDQpXaWxsIGZpeCBpdA0KDQpUaGFua3MNCj4gDQo+IA0K
