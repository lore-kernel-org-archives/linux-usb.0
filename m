Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794468473;
	b=Za8h6vKinnHMNt53HN4m3kMpwB/xk7fXySpbJBHR2Ya8FUKw5KnMO5rFnhdqDYDWrTfh
	 /lqKo7uRK9dYVKN0ff04ubB/EB6BWCqnP6LJF+R0MtOQBdJts6lVnNk+d1k0/u65cJ8Ur
	 Wr3OqfsU+MXfESd7K9657UQYCXwD4N6xRvD8ZUJwxcXka98Wk71/bxAi7/6LCaYS8haFZ
	 t1ctIbDIaH1my2It+veG4sIk9oLo23jb0DV9Z6Cbi2mVcBnpat+DWYV+Kj0xyNzsO5OH3
	 +GVq+d9E05zQxYqTS1Moz/pIeMPUWZpnNrHV0r1IXJi9q8NCV/4D08Ghu3hzCgXpB5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468473;
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
	bh=BeAloLU+EwOOtfjwoAoxEbiYDmTUWBs7CeAdf7IXYSs=;
	b=ZawtgrftmsAAKw6o7m2mtFfSZGmRILtI0JmXtWz9utTs4lX5UtolRQDGJzizmt3x+/Jr
	 K4EVpUCQA2volghTw9ARFEHermTKd6G+8tJEcXpKD87/6iWUBwQRYhaZ61fmUH9FIVGUE
	 gnuGnqKnyMiq+5mO6Gor6uQaaIQ+cLpAtiZS5BsB/ruPu3A4IzVRF/H5LVIj/tDTOuXmd
	 xTNufoenKG7fHGT3Vx3tBLyFY+jQDBLSrQPl5WS48m1ht+lpKOQUFjKkWYNSsDuA++Mfq
	 A7hRrjnnGDZLrym8h3runthUvLHRvghE1EH8T13XsxTQGAZup5qHS1xSLeEEAM5cHWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=QRkbsYKJ;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=b+RNvx1l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA0606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 07:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=QRkbsYKJ;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=b+RNvx1l
X-UUID: 8f328b12de6a11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BeAloLU+EwOOtfjwoAoxEbiYDmTUWBs7CeAdf7IXYSs=;
	b=QRkbsYKJ+uA8q4ZgzY8R8CAiSAcdfoD9EbJiGfnzbja2ssoIDXMJqsnMd4BcxHTM/GuRW8qMXupGLhzAXOBPxDBMXgfsvTvcyGShIn+ktaI0yrHpgDnSiQCY54s3isKdIzI71FAk3aPQRTOfHHo7nhKKzog5QsoWohBMOxVnbbo=;
X-CID-CACHE: Type:Local,Time:202611121524+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ba4902ac-2f37-4a3d-8957-a31127272c02,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:feb13066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f328b12de6a11f1b1788b6acf885367-20261112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1388320133; Thu, 12 Nov 2026 15:27:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:27:46 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:27:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIlWwvI2Qse/N8kEMtfWL8TaYB7dMrXwjX5b6YOU03aQCm5PsR7te+MFRuCjbrVZf9rx8TglAy71AZM9qua7v0dCEtSmRwl1v1f5cqMolzwT25SHgfm+99MQYiEvjM7eUv49JsriA2x6+FBsznm8cYs9FgTp7EezKBy+jb48gOgfsFHtNk3KgEjTHNSPsGCZPBWWyu+aeIlWHgXi+c2DApFCqzeTvforpLVW7IeePI6zwOO4/3HAq3kgudYk11Fh+eGeKe7QpRHy5vaLoL3fE8knB52x6iS6zmN8indgwMhnmHvslUTSwOXJGELxdw1Kd35sAvWchJLUtVwPAQRCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeAloLU+EwOOtfjwoAoxEbiYDmTUWBs7CeAdf7IXYSs=;
 b=fXBK2vcdnbXcNlVhBWL0fOLEV/Xbw0lrvyVdMGAp5c/ZuomP+wprgtIsImUx0lLQcABlY9LlMIr6Vu0AyKWhS+G3hzoyhnGuyOjaSwTflyWfxMqbY1LUTOI8Y3vJFckldYNQIz75zDBjxxqa0D3ZLkP8+gFXL8N52Mt1TxQutQRRvEOyHq63/h6aZ+/Zmq/UleFE6pGCCLE/34KZDM/bx692387xZsubDcHzYn0RWClhXzuU6nHbyWZ7DUnbHq5y6NEwdip9vn0Afxc5y9GrgeSGYNtT5gRCMMf8jigL+A/TbuEY18aYO1Sb44W9inDoVfQG68vYtNeCmWv8yHdxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeAloLU+EwOOtfjwoAoxEbiYDmTUWBs7CeAdf7IXYSs=;
 b=b+RNvx1lwsv3w0O+ZrnPD7WDpBziOBwv8+7VOOctaXRQi7u+xj3RhjKhUY1uBR8wMoT2NgOJIys17QaGNdcydGUIVerCodtsc2Z/bMdOT+zWTtJ83QD/ph9XvdUyehjmh9StKXfLZqLsuzikPryweUtI27jgNS1dLyTOHoUfAAM=
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com (2603:1096:d10:5b::5)
 by KUXPR03MB9931.apcprd03.prod.outlook.com (2603:1096:d10:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 07:27:42 +0000
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea]) by KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 07:27:42 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Thread-Topic: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Thread-Index: AQHdcQmeP7m5Fr2tyUeh+E2qDSEwvLcnMr8AgALZx4A=
Date: Thu, 12 Nov 2026 07:27:42 +0000
Message-ID: <fd8752558669e6a58d70b45155573e13b9be52bc.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-6-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-206964@kernel.org>
In-Reply-To: <sashiko-outbox-206964@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUXPR03MB9665:EE_|KUXPR03MB9931:EE_
x-ms-office365-filtering-correlation-id: 57783ec3-54d3-4ffa-40a4-08df408e7056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: D8pELrLTJKvnlcxrRQHPfOxJIlr0vpkLS7zhQAQuIq4jq/mNg9xJdtC2GauZ7kDDBxlXdS12rpxXxphikCkENGd+M2Q5S1xH4wnKrKdamqhcxOOQ0iK3Ddony/MOLBvdDJ+K9gKkk0zOSAKqsLxhXWSHbnYILntO+xNzGLbbn169HvNiFQuWsrWehQBgTWVDDEc36TJMXg36v/n9fYAHW+6JNk5/eVPokbSSNPOECM/Ia2XOIqO/3RI2q4uLFGp2c0yHIQeOJSbBfNuouJOrVADBxHZBWWMwvN1gMWddD8Pcu5cJwkAXuFOKTNwqr3zZPnoXorDlzhcTt5NHnj9WLQa+UX/7xz4viPOGlaLjQFspYFDC7Ba+8nAZ3jhSrCXAmh1ZKVdFR/ZV1iZip5RPW9xpeALcxdgx8sst5uXsV7bXm63EoiyaWQ4pV1TA++1ukwwQv3oJljAmgm28twnMl+LC1t6SyeN/dWzu4nLtunQFGk9E96PI/MdTqnZjNIHKX6vDSvwXoSXv/nzvi8MzFKNdDAT8nPWbPcbU1n2t4DHIANqKOplozpRapZ84k8Sj0UsrBIK5S6uAokJfVZh302xgAEjDoj7nZSHHeSac8JbYNMZbJlTL+IywBtFBJ/b2UKE6QjQ1yV7pT+iZ3wH6A6NpNiBudDW2ht+Hb+gbZ7oiozwtxXv4qwrJyv8Npnx04RJzEJr+NQ/uqch6PWmrsxvo1fIzK6gcN6LMvrssbYs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB9665.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVFRcWJaRXNSVXNPbndUTE5ESEZCT1dicUpPSkRFWGxTTTB5TXhFS1lJbzhR?=
 =?utf-8?B?d2QwUjYwVlNXdDNFTUtxaGlPOFljcTVZY21xQ2pWU3duSzZvblFDaVlJNWdt?=
 =?utf-8?B?ZStlQkIrcGdaaTIzWEZGNE53MlltNE15NzZ5VnkvMXdSa2RkV2JHdUxSQkFH?=
 =?utf-8?B?aEdVU0NtWklRNkx5MjBlZkVjUDVmaDBtQmFoamFnaFNVank4ZHZ5b0liVllh?=
 =?utf-8?B?U3F5WGx6czhSWDl0WEZ6Snd0V2ZmNkFxOG1sdE1pMFFwQ3NCQU9VOWdyekFn?=
 =?utf-8?B?L2E5S0oxaS9zU1hvc0tZY2J5d0NaN2E3R29DT1ZjR2t3RDByeU5QUEd1RE5U?=
 =?utf-8?B?ZjlydUs4Vk9mNnBDZ0oyWlNxZklxYTdrakYxWFRlNytRTmZVWXVHMHZ2VnND?=
 =?utf-8?B?c0wwQ3BFeVl5aERyc0pjd1I2Wk10ekpqcUd4OEtRR1BEQzluUVBMeEtFWWJT?=
 =?utf-8?B?eXh0QW5xM25MRnZEOWRZYndxWEVYMHlIM2pDVU1vdmt6cVp3ZytzTUlBL3NH?=
 =?utf-8?B?V2g0YTNzZmhRR05LTUY4ODhjRXJicDRYQU5RVGN0MC9YdWtxV3FFclVNWWh2?=
 =?utf-8?B?TWFGUDNJNkxtMTZUM0xjVEVYT09SMEhMb3d5U2dqMEhMbjV5ME1wTzVMaExN?=
 =?utf-8?B?STUwZFVUTFFna0RqcERFMjlGQ2FKeXRsV3d3WG9GbDlaQVlWcXRDTlR6Yzlk?=
 =?utf-8?B?OW5XSElXeWdOTWVSLzVRUHNRM3dPZFhrbnh4NFpOdHJQTmhENjlKWWdpcit5?=
 =?utf-8?B?OUVSbjdBYW9teVBDZVlScWJDOENzbmphRkJ3WEpDcE5hRE0xLzJZdjBjd3d0?=
 =?utf-8?B?WlpjL2VmRUZITkk2Vk1wZGFBVXByNGhSZDAxU3VUSnh6Mno5RE1Sdi95cVBy?=
 =?utf-8?B?UnVjYjVaWjNndUt0cUR1NXE3VHRHNHRzTlJtaXBLSGhIdlpqVWhnUHZRWU9Z?=
 =?utf-8?B?QVVWM3JzUTdqYlJBNzV2R09WaUIvRUtRd1lRZWpPYUR1ZmFIeEZtRWhjUmUy?=
 =?utf-8?B?OXA3RnMxTllXMG1BT0JlQlZmTUVPc3NCSE43Z01uRlo3dkYzS3hsMVZGazFm?=
 =?utf-8?B?RSttOHZpY0FZK2xWNStDMGtHN0lzcE9ZaElnVm5FTGl0UzZCOTZub1lPV0dL?=
 =?utf-8?B?bU5NZ3dUZnhpeUJnWHVubVNiZ05tU0VlRlJETkxTNThLeVBSOWhkcldldnZ2?=
 =?utf-8?B?dUltTS9OWFJwWHJOR1NGTTc1SHcwajF4VyswOVIzandQbkhnSWpLNmN6ZTc3?=
 =?utf-8?B?cEdkb09ReEZJM251MS91ZWk5MGxMaWNPaE4wdHFiRUlLdmovSmJrZVByYk1v?=
 =?utf-8?B?YmxqLzBIS3JMSmU5VjRBS3VqWGZkTlpBU0dXYzk1WHVEUzRDMTVONEcrUG9I?=
 =?utf-8?B?SWR0QzlMb0RUSkk4TllHRUo2cm1rTUlFRnpkUXZLUy85RlMwSUhuRU1pMzNl?=
 =?utf-8?B?Y2Z0TUdJMW9YUytXVHdYTi9IS3BmaldtVjc2MS9vMTB2a0NGNU1HZjc1V3Zn?=
 =?utf-8?B?aThpVE5DL1hHNks2QldwZ3BzNjZHSGhCakRwckxkR01yTWVTU2F4MWxxVUxZ?=
 =?utf-8?B?d0h2Wm1PM2FTejZsbkNpYzB2S0FVVVU1S3BMcXRRVFNaei9qTVlMemI0UHVW?=
 =?utf-8?B?ZDNCcGNDeUVqZTk5bm9QdWtTOE11WnR0QkdQZ2F4NWkxNFhZS1dwMDhYb3RD?=
 =?utf-8?B?TjVhc3hSd3FPZTloZ3huZ3U0cmc3OGdabFcwWDllem13TXZsZjhPaVFCU3lk?=
 =?utf-8?B?NWdPcEE4WjVjUktpMFlnNjI2UENGTnZmRUhXS1NDS0NzTUEvemxmVW01dE03?=
 =?utf-8?B?S3FJRlkrK25IeFFleUJFd2hxMWs5L2pETVBHM3BjNnBUQnZTWnp3aTZPU0Jk?=
 =?utf-8?B?VkpzNE05ZU9tZTR5R3lCNVAxZmxNQlpjTGw3M1IxckhDUEJHSllVa2UwVENv?=
 =?utf-8?B?eTlsMzdNeWhNMDlHTDVBdlpuQ1loQnBTZE52dUwzaGdXVVc3M0Niaml4MWVL?=
 =?utf-8?B?M2xHYk00ZUxTVjdlWEZqOFdBTHpXTXhTMnZvbmZlUWtZeXUzS2VyY1UxSWpw?=
 =?utf-8?B?TzFnTStJM01TcDdGU25ZTGFuS0NjQnFDR3ZyazZrWGV3azBSeEpzekFHcWZI?=
 =?utf-8?B?VVJpdjNHbjIyTC93Y09pODlmdmJxNE5QQ1FUZkJVbkFiUXBUOGU2Mmo5Yit1?=
 =?utf-8?B?N0JyelFDNTdGZGlzN2F2SVM2elZwaWJ1SVZYTHR4dDJ4VXIvV1Z4MWxrSk1L?=
 =?utf-8?B?VnZsa0Rmd2JrcC9GM2dmdzQwQk5iRW9pYWp6aVZLamtJY09ZdHZISUZCN1Bs?=
 =?utf-8?B?dFFmQU54dVZXNEhHZlkwdGRhcWszNGcwL280QTliLzduSFJrbVgxRFFpQmJW?=
 =?utf-8?Q?Plh1XoypqJaBLKwA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9533A7A5C5C5D04CB3D37C6519CE8E06@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: mHMxV/f3M2vveWETTAN4lbDukPBhNvqwtkDvpI+XYhUA19YlM/PUQi25TylN0hkVZbdfeOYuTRvopn5JxyQwHZvaclofcE5Uqa+aThXtqoPu8WXwg63FagI1nwGpU3BTbk94xjAJSo3I8YiQCwnK+Xp+0KIyHcnofRJuMjyoM18aka4kgjhruRxQu6tV9aaASefCSwvnWEshVdChQyM3RLQm8f1ZLTtGySWW1Z4tCip9avVcvIhNma5y5eBLdFNDMEYGiHcRzitVRmDcowgywpnZKpI/Q7tEBmKl3o0gFdA2JMsHbpyIEI4RIqtgBj5fPwmn9xN13vPSwCui52dAnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB9665.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57783ec3-54d3-4ffa-40a4-08df408e7056
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 07:27:42.4098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEzEs5s0HyRD969wnm9egAveJG04GOkQFzA5m3OdKH7vIHxBeQJhXWjNA47TipsaM0l0h3/FC7a1mmUemM8q7c4E2Xs0cs0ctgvKlXIDv+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9931
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDExOjU1ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSB0
aHVuZGVyYm9sdDogc3RhbGUgdGltZW91dCBpbiB0Yl93YWl0X2Zvcl9wb3J0KCkgUmV0dXJuDQo+
IMKgIGtlcm5lbC1kb2MNCj4gLS0NCj4gDQo+IGNvbW1pdCAxMjljNWI1MDQ4MTkyMWY5MDk0MzU2
YjBkZTg4MzY5M2ExNWU5MzdlDQo+IEF1dGhvcjogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5A
bWVkaWF0ZWsuY29tPg0KPiANCj4gdGh1bmRlcmJvbHQ6IGluY3JlYXNlIHRoZSBsYW5lIGFkYXB0
ZXIgbGluay11cCB0aW1lb3V0IHZhbHVlDQo+IA0KPiBUaGlzIGNvbW1pdCBpbmNyZWFzZXMgdGhl
IHJldHJ5IGNvdW50IGluIHRiX3dhaXRfZm9yX3BvcnQoKSBmcm9tIDEwDQo+IHRvIDIwLA0KPiBl
eHRlbmRpbmcgdGhlIHRpbWVvdXQgZm9yIGEgcG9ydCB0byByZWFjaCBUQl9QT1JUX1VQIGZyb20g
MSBzZWNvbmQgdG8NCj4gMiBzZWNvbmRzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90
aHVuZGVyYm9sdC9zd2l0Y2guYw0KPiA+IGIvZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0Y2guYw0K
PiA+IGluZGV4IDdmZjNkYTc5ZGE3NjMuLjdkYWVlODNjN2VkODAgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0Y2guYw0KPiA+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJv
bHQvc3dpdGNoLmMNCj4gPiBAQCAtNDg2LDcgKzQ4Niw3IEBAIGludCB0Yl9wb3J0X3N0YXRlKHN0
cnVjdCB0Yl9wb3J0ICpwb3J0KQ0KPiA+IMKgICogQHBvcnQ6IFBvcnQgdG8gd2FpdA0KPiA+IMKg
ICogQHdhaXRfaWZfdW5wbHVnZ2VkOiBXYWl0IGFsc28gd2hlbiBwb3J0IGlzIHVucGx1Z2dlZA0K
PiA+IMKgICoNCj4gPiAtICogV2FpdCB1cCB0byAxIHNlY29uZCBmb3IgYSBwb3J0IHRvIHJlYWNo
IHN0YXRlIFRCX1BPUlRfVVAuIElmDQo+ID4gKyAqIFdhaXQgdXAgdG8gMiBzZWNvbmRzIGZvciBh
IHBvcnQgdG8gcmVhY2ggc3RhdGUgVEJfUE9SVF9VUC4gSWYNCj4gPiDCoCAqIHdhaXRfaWZfdW5w
bHVnZ2VkIGlzIHNldCB0aGVuIHdlIGFsc28gd2FpdCBpZiB0aGUgcG9ydCBpcyBpbg0KPiA+IHN0
YXRlDQo+ID4gwqAgKiBUQl9QT1JUX1VOUExVR0dFRCAoaXQgdGFrZXMgYSB3aGlsZSBmb3IgdGhl
IGRldmljZSB0byBiZQ0KPiA+IHJlZ2lzdGVyZWQgYWZ0ZXINCj4gPiDCoCAqIHN3aXRjaCByZXN1
bWUpLiBPdGhlcndpc2Ugd2Ugb25seSB3YWl0IGlmIGEgZGV2aWNlIGlzDQo+ID4gcmVnaXN0ZXJl
ZCBidXQgdGhlIGxpbmsNCj4gPiBAQCAtNTAwLDcgKzUwMCw3IEBAIGludCB0Yl9wb3J0X3N0YXRl
KHN0cnVjdCB0Yl9wb3J0ICpwb3J0KQ0KPiA+IMKgICovDQo+ID4gwqBpbnQgdGJfd2FpdF9mb3Jf
cG9ydChzdHJ1Y3QgdGJfcG9ydCAqcG9ydCwgYm9vbCB3YWl0X2lmX3VucGx1Z2dlZCkNCj4gPiDC
oHsNCj4gPiAtCWludCByZXRyaWVzID0gMTA7DQo+ID4gKwlpbnQgcmV0cmllcyA9IDIwOw0KPiA+
IMKgCWludCBzdGF0ZTsNCj4gPiDCoAlpZiAoIXBvcnQtPmNhcF9waHkpIHsNCj4gPiDCoAkJdGJf
cG9ydF9XQVJOKHBvcnQsICJkb2VzIG5vdCBoYXZlIFBIWVxuIik7DQo+IA0KPiBbU2V2ZXJpdHk6
IExvd10NCj4gU2hvdWxkIHRoZSBSZXR1cm4gc2VjdGlvbiBvZiB0aGUgdGJfd2FpdF9mb3JfcG9y
dCgpIGtlcm5lbC1kb2MNCj4gY29tbWVudCBhbHNvDQo+IGJlIHVwZGF0ZWQgZnJvbSAid2l0aGlu
IG9uZSBzZWNvbmQiIHRvIHR3byBzZWNvbmRzPw0KU3VyZSwgd2lsbCBtb2RpZnkgaXQNCg0KPiAN
Cj4gZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0Y2guYzoNCj4gwqAqIFJldHVybjoNCj4gwqAqICog
JTAgLSBJZiB0aGUgcG9ydCBpcyBub3QgY29ubmVjdGVkIG9yIGZhaWxlZCB0byByZWFjaA0KPiDC
oCrCoMKgIHN0YXRlICVUQl9QT1JUX1VQIHdpdGhpbiBvbmUgc2Vjb25kLg0KPiANCg0K
