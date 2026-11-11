Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399446;
	b=jorrPvZDtM2q/d89vICiW72vRhjJ/vx8gq6aSSLPSxs58cYFet22mRn9w8VK+Xjs8W8E
	 SDKVI6avNkawfpOkIru3gLEZ543mCu9VjdT4lVNTFjE86hwe8vc+K/C1bNIqq5gPvYUo4
	 nS13hryXi4X/wPeg7bKBEiSIUUM65Mz7r4eKd0t29Yuu59xibbWXVZSOsm/tkzuNB4AGU
	 JQRzKUJZ5Fdet8wCI1+JC5DrC7AhB/RxHDVqDcOu1tC7R2k48u6jcbKSKtLdaaBeHjNUL
	 +dolGf+O4HPjHvyzHU0kSqaufe3AhCHGpwjTGlZyWWC0Zhx0aeOoKltE/T/46sB+QYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399446;
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
	bh=6dsF3A0uCzkyH7zEMpvxjofglWeHnkvPN9JkqAw2HBs=;
	b=rhWs8o6EC7Xch2lFaUTh2q9R6a9D5r+3cdFBIt5tzZgCr9CZ4pMO+7GaL8AHnLpNFMrt
	 9pVBZeAo/w4uPniUVPIbZu/F1T7lOKKs9mB8D2J9Dalt29nZWcwn07Mr0Mu5u7tK+Hvh2
	 kBTVHYgC/WzXc5tcn15SLcYxbZTiIq65KU9nLnZIMbf8BKLpEQcElhh2wx9dLBCj2DD1N
	 sFvooDk7qurOFSvOpVnWXRN6L8n2nC0eVK/uUNjqNqwXC3kbBT1AD3/HQnNneUNN9AdQ0
	 IfoQTsbVW7qLlIoQLTZ57sss9dpVEY75HoWFvgk/5ec7/um4h9OPfQQRQ2YC5x5ZoWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Zg7x14xL;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=Tvi2NZH7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B666B606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B666B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Zg7x14xL;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=Tvi2NZH7
X-UUID: d7751184ddc911f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6dsF3A0uCzkyH7zEMpvxjofglWeHnkvPN9JkqAw2HBs=;
	b=Zg7x14xLIhccBDUrnu+aCRYd/+SLLkG5nRks1lhd7iiBQ03Rd1vySo2YeEri7t8QtEhbwwAtpBGP+S5pi/MaqEUEL5c0SALF3K/XC9tUYPxVmm2yBXDB6Ix9uknfSpHLS8cZDnmZPSlbWobV0+FAsKY7Lp5kY67fQ7dOMOT8xAY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:949b0228-02da-4c5a-910a-7cd637a7ad5a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9a4cb530-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|51|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7751184ddc911f18dc8c9802ae25ab1-20261111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1427179278; Wed, 11 Nov 2026 20:17:19 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 20:17:18 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 20:17:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRCj51awxgHL6VES/HFrlO18lCfdSOKz3tuNzufEcxYiXjd3ObMrUf2ky+NWGeifCP4GEA06+A5OhpQhKWOJcyX44Q1PCnTehdZ0++bsU9JcURUkxICRS1i3dVnFY1SmUzk7J/HuxqEy/iE6euKlZAEEJVSCFjXEMKcAFqX1Mt/TiTqC93gUID+avVXGDsWnS8GGFRLKfDlodlcxXUoTloutHYkiyF54vphZ4HPTV2Ms1XguqsbN+C8kuVzWMbQ0n3BRwtx+oLXcV47rB/HhUFyb1pznR0Jith6gA+ysacyo2/8MaiO96ZrPn7iZNi7Xe6+yuNSqaLpLPZMU2nZY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dsF3A0uCzkyH7zEMpvxjofglWeHnkvPN9JkqAw2HBs=;
 b=rctkLQBlibg9w711jo+h4KJOq3cwfnAv/2gmPPVVvaEldXWKRgoRmChboqZP6mwG6EZ/kMOaB19UmUbVFRiF0e2KoJ9Lc0HVF2omIrF0gQQ8TaVmfzVoz1Os88vIY2J/8vMgufd7FBKJPa58PF9bsHX1LewpBDfGVReukGZc1Riz5lpalllqG9n19wMoBkT8OFxjrgDUoQX85c78FPzhwHL3vewgZcqdEGBB6eUk4nmOdo8jjh19d33dmoE0vwZ5AZwHoCxRUkFvXBr9Dkcbz0nqD1zN6XFs0MHV76NmSZHNOnlqVtPy7+eP7Zg8RjALjeDVCAQo34vVpo8NFatTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dsF3A0uCzkyH7zEMpvxjofglWeHnkvPN9JkqAw2HBs=;
 b=Tvi2NZH7Km/bFiqMldw8emeUDuGyxQhbYTxtnR5BmEN9E8xJ0DFGCRjS0iVOEsF520nylKCJGef3fKKRV5dSCXKqbVUMT701CQ/iWKyEf6oSP9VHC40HkuphRZHSTxSzPP2AlHyHvVU2/5BrqtwQEUhir17IlHu4KbpUcB5awsc=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB9535.apcprd03.prod.outlook.com (2603:1096:101:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 12:17:13 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 12:17:13 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] thunderbolt: Make PCIe NHI support opt-in
Thread-Topic: [PATCH v2 3/7] thunderbolt: Make PCIe NHI support opt-in
Thread-Index: AQHdcQmg7wcG6vPnSEK5IRq9QbmoibcnNrWAgAGUYAA=
Date: Wed, 11 Nov 2026 12:17:13 +0000
Message-ID: <8dc387648466eab17a6cff55013d95a7cfd7d9b2.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-4-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-206987@kernel.org>
In-Reply-To: <sashiko-outbox-206987@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB9535:EE_
x-ms-office365-filtering-correlation-id: 9686c836-710a-4f25-91a5-08df3fedb7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: 0B6QmIGXMRUVoUqM1/cYJhrzEmCr/L2aMuxf3gCuJR0C5Yd9NKS+heeUXT92uX0hYU4qJqMeK5v7eTHBRODam5BZclPY37u2WgmDpmnsHnRORGvOcnuEOPvi88AQ/XmgHvVmh+kCHTnG1H5UTvP/1IoH0TCLjl8FjUlEGVPs8U5zN+dLcB1mLdbPreKUNFjqbxhI1P6m91DbbtQSxT6Xcq4HBWQhlvZ4fkGl9PTdOnYCDn52Jd+Wb+163gCQvWT93wYX/fetqtOdoUd7Hk+8LMQFcXYjplV8eZFSA/F1RkaECGYcyGO5HAdIxQQnO6KP4ZNcGQkbbsYLd9afn1XzTJlKiPjumEAP+F2djzs5aurx3+9WKWouITZJc71wZVwVNJ0j+OcY12Nsar25icTT9bFkWgISjdM78MvcfVO+mtqaPVuBV1kkQRDGTa7cd4EtKkcSOOHWbIiIXWxYC4f676Rj+LIXJ7rsgbpJwt2mpS/MXm7Dys8mZUj7DcrUuL/5xG+fRqoBE6kO1aJ180osycS05rdZEOrO7sM/lb9jq8vnclF+h38aXaVWr/J9R9jRITa8vOo8JIlUzex9vRgCZe6uW3KUFGMoO80swS0lwgqWOIbRwuXxDCVrvy0QQxxE4yMHShZ2g368y6sTfQuoBJo5lWezHEHz3zSckCU0UUbkW3bj/Rv7WGfpiQdse8BHRbaFl62Dqo5QDp3GD4b9m8hM/cBEwL+NBxAySiS60IU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cldKcnc2TlZVdFp6YkI2OERwbzRCRFpBSlo3dlVSbTY5dUFPMFZVN0Zzb092?=
 =?utf-8?B?TndDTmZIRS9DbzE0cVpNVGtJWWpVeFF5Qm5RWHdXL3RUeFNmN1o1dVlueGhz?=
 =?utf-8?B?Ui9aTnBPY0IyYUNtYVdPWVZZWFNCV3cwRENjMk5IWHMwZndTb3VtV1ZIRk94?=
 =?utf-8?B?Vi8weVNKaDZnSWdVZDhWL0RWWSs5cWxjT1RkdnIya1BtVDFhdjMvWnVnQjRQ?=
 =?utf-8?B?djF5K09LU0RUQ3ViR3NYbmU1a1Z2Zmc5bWpIR0d0MHNjU1NJV1NIWWlWZTRi?=
 =?utf-8?B?NTRHK1FVYWhnbmRFYkhaY3VTTEg3SUJ5dWNBRWpGTUpFWm5SWTg2STRlUEdm?=
 =?utf-8?B?YXlIU3BqOHE2SE13WEJCWjg3WjZKWDhSMzd0em1oaWliR0pFaDRRSm9qc1Ro?=
 =?utf-8?B?bXdibHFJTXpQYXpUYkxEOTFpT2cvOUd2TEhiVHk1T3gvZmRnN0pDQ1dwU0th?=
 =?utf-8?B?Rkx5aWh0UUtHWGxtT3pjZ0R6OG4zL0pEa1BkYW1vWjJWSHJPU3lsYXBobWNN?=
 =?utf-8?B?N2M5T3I4VE5xZG1pZlpzTjl5a29CWlBwUVh0SnJhTml5VUdxTnJ1aXFEYlhk?=
 =?utf-8?B?YlFDblRqSGtCU3BPSkErZElFdS9sd1RWem9ybXFyaHdXYTlZNTEwUEV3Nyti?=
 =?utf-8?B?cWdmdVhVVnhyRStvSHoxaGNWNjYxcmYzNTNRUE5kVUhXQzQwZVJ0VjExQU5z?=
 =?utf-8?B?eTZuS295TmFZczVFNnBkdDlQcEJCQUhyeldQN1hMaFVnVUJnajlCR0ZYZ3J1?=
 =?utf-8?B?SUp6QU8vdy9FQklEKzZDR1ozbThldmhnZXlWNjNORXBTNlZQbU5oT1pRVDM5?=
 =?utf-8?B?S0RHSGZSWUhISUhtYXlwZVJFWXhjb1BBR3M3aXJRelRnek92cko2SnA2NmVk?=
 =?utf-8?B?R2RrYVFOaDlwWXozemZzcmdJcFhEanhjUlNtRGMvbDV1YzlOSzhTYUJCMUZz?=
 =?utf-8?B?RmFwRzRUOUxXL1NKYTRIU2ZlaHMxbHZPRi9iRVI1YlFaczY4VCtRc3R6OFda?=
 =?utf-8?B?eWh5Y0tsWmk5ekJDUW9RUm92TEl6Y05FZEZ6VG9kcHNOVlIrV1BEMVdSc0w4?=
 =?utf-8?B?cmhIZHoyU21Ib1o0VFZUc0lZT01NZVluckI1dm91Mkp0am5Xem5OZWRFdm04?=
 =?utf-8?B?VDZ2TTdXb0FDTXNLOGgva2lScUlJQVZFUldaMlRmNmU3a1NjUUZqVEJ2eU45?=
 =?utf-8?B?ODZMYzVPS2ZqcGJQYisxRm9GdE9Vb2hFNUJaUlFVOFFDM2d1NDU1eXBlN051?=
 =?utf-8?B?MDN2aG44N1VHMGN1TXY2L0o2NnJhcEY3YWU0ODlQRWxROFcvVjhrak9pS1lM?=
 =?utf-8?B?cEFjdDI2eFkzdmJxYS9wVDc5eEc4dVZ5Yk01bzB5S2ZYSURGSGFhUWhjaVRH?=
 =?utf-8?B?alB6dUdLakhSWXJua2dOOGNkUi9pQWR2d2lpZm9LSEptS2lFZHVSRkZLK2VD?=
 =?utf-8?B?c2Zzc3dhb0JQT05taVVmbEd4S3RwSGpmTzdVWDk5dUVZT1VIVFN2N2ZiZ25I?=
 =?utf-8?B?Sy9tMGpxRTZKSjllRlRuRTJ3emxrSyt1Q204YkZXSS94bzl3ZW9CZFNsK0JP?=
 =?utf-8?B?YnRQeUo0M0xGZ3FxNS8ramlhUjEwRUdsYzZpZTBRU0swc2laaTJ3Y1MveExv?=
 =?utf-8?B?bU5VdzZsNmhBTVNEQ3NHUmNkTUQrTWRxaWQ1TGVvVjZIeGlnbklzV0YxcmNS?=
 =?utf-8?B?L3ZOV1NjSERDY2dnK1BpNXhsZGN0eWhsbnFzSFlEYm03cVpJQzF3Ri9lSGVF?=
 =?utf-8?B?dHFDWXl5VmdRTEtiMEhBWTROTVRSTk1BSkJhKzdsZU42LytOb2ZTTXpiR0kx?=
 =?utf-8?B?U21nRHBJT2EzSzBZN2ErdFR4NThWSVludVNZTjE5QzVDTlM1ampFM25IbVE0?=
 =?utf-8?B?K1dsVXM4d05PQnhzRW8zR0I2VzZCdGNKeXFZVUwwNmRkTzRjVTd2VmlCQWZh?=
 =?utf-8?B?RFU0L2FGdDlLTEVMQW5UeCtXT3ZLb0c3QStyWW1LdmtEM2c5VnhMOFZYcnI2?=
 =?utf-8?B?WlJIa0xZVHZrU05qYTBxN0FST1Y1MStwN2gzaFlUTUYrSTJyQ29SRnIxVzFL?=
 =?utf-8?B?OTVhc2RpMlNxYjMzQ3JCSlRnVHdZREFYOWVuS3VKMmJCaXNXVldEaFI1SVRZ?=
 =?utf-8?B?eDFpaFFVNk50cXlSR0NvQnJjNk1qWktDWFBqTisycVZoU0VQMm4vTXdUL3Yy?=
 =?utf-8?B?cklnVUlaZ1F4QUwyZU1Qd0tJUWJ6Qm1DSEF2VmVCM1pRSWw2QVc1a2Rhc1g3?=
 =?utf-8?B?L1FJbWtyL2NYT2hVTHY3VzVLNmRiTk4wd1FaeFlTejBhMDlmSmV5QTRPQk83?=
 =?utf-8?B?SzBVUTlSdnkrTXFpaXh0S2RxMm4rL0VSOENRd1JTajQ0UVhvMTR1aTJwZk1s?=
 =?utf-8?Q?yEf6vJDUHeX9uzDM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F6F55E4DF943A45933391B4EE1A743F@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: TXyHboQkWhMvc03RDkWcheVvZNEQOm+M6mh6sPMbOM2urPdKzndVJpHJ2PuruDS8rJyXFJHNamX0xngzDSseizMMt3sGzoSe6qEtryiJbBxeQbuLoI3aXNaJr2b3qd8q8CDvSffUXduBeNQpeVTw5sxpypiqqtyVyZW9flRMGITgNtcQwgXm05QYta1FX1x/R/JVX5Q4x4KRB5R2MwvB1aJT5TAzCgya0HgoR4OllmND8s/ypVRDakSgx8VtftcnjBEhB50riNqRc5sfBl/ud8bp1B2lWoZ4QE5f+PD7+Cyv13bZI1ZW9s6Ni56iUC+aKvRXqQfKiPLwKn2pv0y5rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686c836-710a-4f25-91a5-08df3fedb7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 12:17:13.4189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DB9Q8p0l3nDRHyTqmeVDV0/Qo4qWugw15uvONZvxo+bApjDeE3MIo2FocNdLBDbFKBzqj0J6gflmJSsQ+vVOWv+lxvk2EZBw8uUuAZA6raQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9535
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDEyOjA5ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbA0KPiBpc3N1ZXMgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hd
IHRodW5kZXJib2x0OiBtaXNzaW5nIGRlZmF1bHQgVVNCNCBvbiBDT05GSUdfVVNCNF9QQ0kgYnJl
YWtzDQo+IMKgIGV4aXN0aW5nIGNvbmZpZ3MNCj4gLSBbTG93XSB0aHVuZGVyYm9sdDogbWlzcGxh
Y2VkIEVYUE9SVF9TWU1CT0xfR1BMKHRiX3hkb21haW5fcmVtb3ZlKQ0KPiBpbg0KPiDCoCB4ZG9t
YWluLmMNCj4gLS0NCj4gDQo+IGNvbW1pdCAyMGJjOGNmYjZhNDM4NDQwYmMxNDQ3ZDBiNjc2YmYw
M2IxY2RiNjkxDQo+IEF1dGhvcjogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVh
bGNvbW0uY29tPg0KPiANCj4gdGh1bmRlcmJvbHQ6IE1ha2UgUENJZSBOSEkgc3VwcG9ydCBvcHQt
aW4NCj4gDQo+IFRoaXMgY29tbWl0IGRlY291cGxlcyBQQ0llIE5ISSBhbmQgSUNNIHN1cHBvcnQg
ZnJvbSB0aGUgY29yZQ0KPiBVU0I0L1RodW5kZXJib2x0DQo+IGZyYW1ld29yayBpbnRvIGEgc2Vw
YXJhdGUgdGh1bmRlcmJvbHRfcGNpIG1vZHVsZSBjb250cm9sbGVkIGJ5DQo+IENPTkZJR19VU0I0
X1BDSS4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvS2NvbmZpZw0K
PiA+IGIvZHJpdmVycy90aHVuZGVyYm9sdC9LY29uZmlnDQo+ID4gaW5kZXggMjk0YjMyMjdhNTQ1
OC4uNjA1YWY0NDA0NTdhMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3RodW5kZXJib2x0L0tj
b25maWcNCj4gPiArKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L0tjb25maWcNCj4gPiBAQCAtMSw3
ICsxLDYgQEANCj4gPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiA+IMKgbWVudWNvbmZpZyBVU0I0DQo+ID4gwqAJdHJpc3RhdGUgIlVuaWZpZWQgc3VwcG9ydCBm
b3IgVVNCNCBhbmQgVGh1bmRlcmJvbHQiDQo+ID4gLQlkZXBlbmRzIG9uIFBDSQ0KPiA+IMKgCXNl
bGVjdCBBUFBMRV9QUk9QRVJUSUVTIGlmIEVGSV9TVFVCICYmIFg4Ng0KPiA+IMKgCXNlbGVjdCBD
UkMzMg0KPiA+IMKgCXNlbGVjdCBDUllQVE9fTElCX1NIQTI1Ng0KPiA+IEBAIC0xOCw2ICsxNywx
NiBAQCBtZW51Y29uZmlnIFVTQjQNCj4gPiDCoA0KPiA+IMKgaWYgVVNCNA0KPiA+IMKgDQo+ID4g
K2NvbmZpZyBVU0I0X1BDSQ0KPiA+ICsJZGVwZW5kcyBvbiBQQ0kNCj4gPiArCXRyaXN0YXRlICJT
dXBwb3J0IGZvciBQQ0llLWF0dGFjaGVkIFVTQjQgYW5kIFRodW5kZXJib2x0DQo+ID4gY29udHJv
bGxlcnMiDQo+ID4gKwloZWxwDQo+ID4gKwnCoCBTYXkgWSBoZXJlIHRvIGFkZCBzdXBwb3J0IGZv
ciB0aGUgVVNCNCBhbmQgVGh1bmRlcmJvbHQNCj4gPiBob3N0DQo+ID4gKwnCoCByb3V0ZXJzIGF0
dGFjaGVkIG92ZXIgdGhlIFBDSWUgYnVzLCBjb21tb25seSBmb3VuZCBvbg0KPiA+IHg4NiBQQ3Mu
DQo+ID4gKw0KPiA+ICsJwqAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhIG1vZHVsZSwgY2hvb3Nl
IE0gaGVyZS4gVGhlDQo+ID4gbW9kdWxlIHdpbGwgYmUNCj4gPiArCcKgIGNhbGxlZCB0aHVuZGVy
Ym9sdF9wY2kuDQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFNob3VsZCBVU0I0X1BDSSBkZWZh
dWx0IHRvIFVTQjQ/DQo+IA0KPiBXaXRob3V0IGEgZGVmYXVsdCwgbWFrZSBvbGRkZWZjb25maWcg
b24gZXhpc3RpbmcgY29uZmlncyB3aXRoDQo+IENPTkZJR19VU0I0DQo+IGVuYWJsZWQgKGFzIHdl
bGwgYXMgaW4tdHJlZSBkZWZjb25maWdzIHN1Y2ggYXMgbG9vbmdzb242NF9kZWZjb25maWcpDQo+
IHdpbGwgc2V0DQo+IENPTkZJR19VU0I0X1BDST1uIGFuZCBkcm9wIFBDSWUgY29udHJvbGxlciBz
dXBwb3J0LsKgIE9uIEFDUEkgc3lzdGVtcw0KPiB3aXRoIGENCj4gUENJZSBob3N0IHJvdXRlciwg
aGF2aW5nIENPTkZJR19VU0I0IGVuYWJsZWQgd2hpbGUgQ09ORklHX1VTQjRfUENJIGlzDQo+IGRp
c2FibGVkDQo+IHN0aWxsIGNhdXNlcyBhY3BpX2J1c19vc2NfbmVnb3RpYXRlX3BsYXRmb3JtX2Nv
bnRyb2woKSB0byBjbGFpbQ0KPiBuYXRpdmUgT1MNCj4gVVNCNCBjb250cm9sIHZpYSBfT1NDIChk
aXNhYmxpbmcgdGhlIGZpcm13YXJlIENvbm5lY3Rpb24gTWFuYWdlcikNCj4gd2l0aCBubyBPUw0K
PiBOSEkgZHJpdmVyIGJvdW5kLCBhbmQgY2F1c2VzIHR5cGVjX2hhc191c2I0X2hvc3RfaW50ZXJm
YWNlKCkgdG8gd2FpdA0KPiBmb3IgYQ0KPiB1c2I0X3BvcnQgY29tcG9uZW50IHRoYXQgaXMgbmV2
ZXIgcmVnaXN0ZXJlZC4NCk1ha2Ugc2Vuc2UsIHdpbGwgZml4IGl0DQo+IA0KPiBbIC4uLiBdDQo+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L3hkb21haW4uYw0KPiA+IGIv
ZHJpdmVycy90aHVuZGVyYm9sdC94ZG9tYWluLmMNCj4gPiBpbmRleCAxNmU4MThjMWFmMWMwLi5k
MmRkNmRlYzViNDc0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQveGRvbWFp
bi5jDQo+ID4gKysrIGIvZHJpdmVycy90aHVuZGVyYm9sdC94ZG9tYWluLmMNCj4gDQo+IFsgLi4u
IF0NCj4gDQo+ID4gQEAgLTIyNzAsNiArMjI3Myw3IEBAIHZvaWQgdGJfeGRvbWFpbl91bnJlZ2lz
dGVyKHN0cnVjdCB0Yl94ZG9tYWluDQo+ID4gKnhkKQ0KPiA+IMKgCWRldl9pbmZvKCZ4ZC0+ZGV2
LCAiaG9zdCBkaXNjb25uZWN0ZWRcbiIpOw0KPiA+IMKgCWRldmljZV91bnJlZ2lzdGVyKCZ4ZC0+
ZGV2KTsNCj4gPiDCoH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwodGJfeGRvbWFpbl9yZW1vdmUp
Ow0KPiANCj4gW1NldmVyaXR5OiBMb3ddDQo+IEVYUE9SVF9TWU1CT0xfR1BMKHRiX3hkb21haW5f
cmVtb3ZlKSBpcyBwbGFjZWQgYWZ0ZXINCj4gdGJfeGRvbWFpbl91bnJlZ2lzdGVyKCkNCj4gaW5z
dGVhZCBvZiBpbW1lZGlhdGVseSBhZnRlciB0Yl94ZG9tYWluX3JlbW92ZSgpLg0KTXkgYmFkLCB3
aWxsIGZpeCBpdA0KDQpUaGFua3MNCj4gDQoNCg==
