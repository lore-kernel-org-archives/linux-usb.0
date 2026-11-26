Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682948;
	b=tDfA3No5Bpq3KtP7/4eR2gJSqogySFDScQhSo8zt6XSIM6D/9FhfnzfqpIQGkaxNl+OV
	 8y5CfQ0UN/8Ez7V0Fo2tYBrEHsHYQHlX3mxT5UdFju/j51vRkHKaJsC02+Rb4heAUvl44
	 yi5PWibatq2saR772NP7ZW6aPNGBs3Wmahl/OCXeze8ESTK6gzvLbBvH08p89gYtmGZTj
	 BpmUFMMJ7Wa4y7OyFMIUQnYzja7+/SWFtMSY1+dk+sNGS3kOukhZGJywpQ0107dVVPwID
	 2Lb7KmEZIHammCCRLRv1PDNUPKqoBA0ygcT4kWslpFSRHgO/RAxoYOkI25wAMscOqOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682948;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-traffictypediagnostic:
	 x-ms-publictraffictype:client-request-id:request-id:x-ld-processed:
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
	bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
	b=3COn5CrI2HEOyE+Oou0x2mf+FBBDtX9tltXRyXMtNWL9Gpt3heEu4ivUFvU4m8Un9h16
	 thY5TCYU3GZSTU4me60fXMrvLcQ97zm+55VEEPRQJX5vtnhxnT8yDdVahUAY+MyU8vkXF
	 2sYtDZoCesRcZmm+pngXHakZ0+Pq56lgsw1V+IC5E/sIqBvurLmXFfoidBf1rltyiSbIW
	 QZ9yrOWXInxcIToMOVOB8tCL2c3Tilp/qgh4tmUOX0tV1j7KD2mSIRfzj0xccP6O0cd2q
	 vjhgb/oLKT2XrK3k42lwIwOZSIFeDespk2f8AM4EFzLfanEEe1PCGg3Hb52799MfKOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AMIhVdFM;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b="IuOnmvp/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F1606A31E;
	Thu, 26 Nov 2026 08:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B37F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AMIhVdFM;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=IuOnmvp/
X-UUID: 3981e548e97611f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
	b=AMIhVdFMGPiDnRaELNvIcge0xTVIL5rHr5qlnkJiSRbpS97UwegyxtRifTs6T4oktwfwGJuAbH0MZbIg6fFqn8hicAMciSRHc+LhdCHqcNjb0ed5LlnTryIh374YXzbz2EUzOpAHp1/oNzf3/IgvQxVQkGC7o+w8VvW3ZY+gQ5E=;
X-CID-CACHE: Type:Local,Time:202611261648+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8bc0f8b6-09b8-4f49-bb4c-cd88acf5c63b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:30215f31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3981e548e97611f1a7aecdb2598be72c-20261126
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1760605466; Thu, 26 Nov 2026 16:49:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 16:48:59 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 16:48:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFsEPzBksNTY7VnYlo9kN+fcwlJOjoDNzl3Pjt5w0xqCmNG3fqrucJY8kcgOa/tph4MNFian1SG4zNod8jrxGCTtckNMRosDTJWOpWgYIFXtb4dhU/1iFx/vTMutU2CCBaGkxdh/8jEH8JagmcMYV+egzHYX+tszzH4RLIa22wMgeolXRVmHRcjEZayVIKevXVk8CTubHs1GqeOnCbdxUaSC8/sVNRP7Z3Pd9OotEQhQAEB0kmUxyNV1kX7MpTmHM537IsAcMSaB6H3+tzYvvVx/pxyxFVQKLdPg8J5FvaPOj6u5nNiIlDjs0jiBI9UbSidHS4ZdY9IGcljgbELLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
 b=vuVr+5j1sN/D6e6d9gD4EBCFiCCqNge1uSnNP4vmZawU0LOzjdvymXBdEUVBNJEKmF5lSKVOC1l5Pxc0RXna7o/D3tx3fkdDd9CnS9dJ7y3VnkxQ/heoVva3iQehWgjWtWLeYlC8jALdH1M/RvqmJdfxR9VMLfC56V9GdxfFF6D4p6eDZmLyRgq9dpHl91vbAhZdxRTOK70WD0OkGAO6Er50V6cK3ZA/+tOdjGW9mQw6Zj4vb3j4F9g7QdLIzcGsm2zunrwGWi+aEoXOvefcd0mBkg/3h1bzvYhr6WBYIclxzvMP7qUsB84fU2sEUadPfcEFLuscioFjqI1s0OwBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
 b=IuOnmvp/ReIpATOrABg1kxUodSuLLh8UTL87cjMNridcuDit0N/b9vDu0SH5H5ngyLtbb7zuU8ztS1L3Kx57vRAlY5/pLHhKa4YIInZEp25Hgm6Z+60Ap+ieNUym2mD7pFCQe1HXfjKZusXulXexfxSqRy5C+DQ8PnRdZM7bmTs=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEZPR03MB7810.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 08:48:54 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:48:54 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Topic: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Index: AQHdez8S+840qKfXnUKIxOccMp4Itbc9Y2YAgAKsCAA=
Date: Thu, 26 Nov 2026 08:48:54 +0000
Message-ID: <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
	 <20261124160038.GR229695@black.igk.intel.com>
In-Reply-To: <20261124160038.GR229695@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEZPR03MB7810:EE_
x-ms-publictraffictype: Email
client-request-id: e390b6a8-9939-431a-b461-71481c7c3318
request-id: b40f6963-4704-40f5-9d01-08df4b9a19df
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|4143699003|10067099003|56012099006|261026140227099003|261021123027099003|261022105027099003|261028144727099003|261102123227099003|11063799006|261021121427099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: ++I8Sx1nOc9hVcmmHe3K8s9Ho4oHC4nd3c2lmoP2FhR7ZmVoVmESbAoIN47EEoM27dG0nO990KBtVOJG6hUugPOe2tBMEcRyr2b6piCCNGNLyEOyEZdEE2r+qerYcplw5XR18E0n0KiGFT213TuMSERC9s93znshjduP9eRjOTXQi1a7afuet5Ajb9NBRFLC2iqdrTQfhhzBUlXfYbDupusPScyh7Yh80PKtz3WkP6sSAvz/O6SUM6OvBoR4Ul7NxTX5uxBIBMzq9uxc5bTED6EHRXbOTVhhYMHMmRHnhp3Ms5JkqJTOiYVzA2IrCkhpGZFR1wzhNdAAfZGVIdTvsjkVQQUCgt9dJ4Pv2Huv3odBjp5vz1vZiV3BKspi7wGRCAsO7Zux3vd+Pjn0XmtyNiKJNhqWl5sZccUaHE3hq8Jj2qUDrnBJKRjgCCnKmiY0PyMGGoLXnz2GxtT5VUa6LP9RgogXfrkEmIzJT0qqQ0fRBPobl8xCDltLjA9B8FL3Swe9Rz1UuhJoJ1Bpc96prbamEmr/Ml8DR3Ht73Khprcp+WYMcHKVfPf4prcjHqcczlVtGZL73/Nv5ZluAB+2fV90MZ7nuD5qSUTvU9oyVjwk36BQGmiwaQLrRWiuHfeZrdpfTmy2U92bT3pWfZozQGGmrycLbkAWxR/kXGB9J0Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4143699003)(10067099003)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261028144727099003)(261102123227099003)(11063799006)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU1wQnk5Q3hPRW0yTjl2bno2bWt6YjFIRUROclFkUGtDMDMxL0dRb01rTWsy?=
 =?utf-8?B?eTVIaEdTM2tvNitieC85N28xK0MvbkowU0NxNXFsS3l4ZTdieDRnRUtmMEs3?=
 =?utf-8?B?R1BGQUVlanhPcjZvVytpaFVpYmRycis5OXA2c1pvdVVSK20rZDFxSzg2YStY?=
 =?utf-8?B?WVJTclhWOEFFRXAzWVk2bG5sU0t2Z296UUpGL3F5Z2UzV0lDaS8zQWpkdTlZ?=
 =?utf-8?B?U3ZCQVY0K1M4aUFJd3ZGY3hHL2xkeWxoNjg5OXcwYmVnKzBIQnk1WUNHMjA2?=
 =?utf-8?B?elQyb0lNNkI5c2RkWlBDVjJWV0RQcVlYTURjK0t2THE3MWVyZHBuejR2Q2o1?=
 =?utf-8?B?MkVpbWdUK1BtTmJwdTRoMEE4RVQ3QjdQUk1KaTBRM05LQ05PTHg4aUdoOW9p?=
 =?utf-8?B?RFI4SWJ0MVhibXZKTXZsNC85S2NzZ1pONWxIMmpxb1RZeUxONGYxOU9rQWdI?=
 =?utf-8?B?VnJLeHZxOWpCaTdxQ2xCbXNjSVFmd3pvWkdMZE0vVjJvNGZPbERMRDBKK1BN?=
 =?utf-8?B?WUYybklFdUJra2MyTEhVQUlEY3JtZU0xVW5Ec1RGZnUvL2hEUTZyVHY5L3ha?=
 =?utf-8?B?S3JBdFdCV1dPZ3ZSZXo5Z2w2ckpCamVra05XRlJEYmJPQkNVOXRlYzQ3SEI1?=
 =?utf-8?B?VitEN1VKVWFMRXhkQ3g2di9hREtpRUY5VFZIaE5pVHJlZkMrdFR4cExLejdn?=
 =?utf-8?B?cVpXSmJNajNybmVYb29rZGxudW1NSUhaY3dDMkI3SGIrYTVTRkNsSGw4a0pD?=
 =?utf-8?B?RkJCVFBwWnBTOEovSHhCTFR6eDdTSE5XYUxwSXlYbFBYdFpqQ2h6UGlUYith?=
 =?utf-8?B?SnRQVVhjSFVSQTdNbGJ1SytKMWgrWlRNa2M2TTVRZDBPZ2lwNkhOT0JmeWJ1?=
 =?utf-8?B?YlBCQzExT0tzYnY1Tkd1WnpnZmhQS21vK1k1N3FEcXdpS2RmdkNRMisyZnlj?=
 =?utf-8?B?Nkk3aXZwMUlNcnVDSks2RlFaRkhmNGpiOUdrWUpSc3BYQlk5N2VJUlFQR2xJ?=
 =?utf-8?B?SzBCK3BXY3o0U3VWcWVEVlFJSThmVVJ6emFIcVcrK3dTMzlrUlRnbmpPUFFZ?=
 =?utf-8?B?cSsybE5NeDRrT3ZHWVZkUmZTckhoQXpkZkRqemt1QzhjWTQzbWY5MkF1WFNl?=
 =?utf-8?B?M1JwTzFJd2h5UFMrNVI3WDFhT0E3bGVSVXA4UlhhaTZFS0tVdzFQNml6dlNT?=
 =?utf-8?B?OE5xaVhyaUE1WjYySFN2Ymd5RVJaRzYrNlZLZitBbE50STB3ZW5oWStjOGE0?=
 =?utf-8?B?b2NKcFdVNTBwWngzNUdIaFUvcFo0YTRnK3VtSzRFODdrUng3ZWM1T2Vjekdk?=
 =?utf-8?B?ZUJLTVBTbi9UK0pCYU41bTdRUGRyS3RZQ0hVWVdkL0ZqT0Q2d3N4eVVjQnNS?=
 =?utf-8?B?YTFHY0g1aithaGhCeWQxYkJpamZxY00rN1JIMDBmUGt2K05nYzR2WGJJNjdU?=
 =?utf-8?B?RDdLK3UrVHcrczBQb0h0OUtQZEk5UitZN2toR2tyQyt4aC9uaDhhcUpDMmhD?=
 =?utf-8?B?dkFIdzFyQnY5akRoa0JaTTRMYVQ5SURHR0dvc21uZmxHN05WZEJQeEo5QkZZ?=
 =?utf-8?B?T3ZYcUR2anRlL2hLSWt3aHFZc3NtNHVHWHo5NEtzS3VTZ2xiZFEzU3ZIdEtu?=
 =?utf-8?B?R20rQXY1SmRmWGdwTk1XZEtkeklLU0FKdjE4TmdQWEY4dXZpUm82VktPZjJn?=
 =?utf-8?B?Rm9SVUgwR0d0eG1zUHEvd1V1dmRSazB5RjJrUUtvbGpVMHFwMUdpVlRJanV6?=
 =?utf-8?B?b1BNK0k5TTRHbTBjT0FjOCtONEwyVktCQ3l2L29nS1lhWEI1UlM1TjBMRjBW?=
 =?utf-8?B?K21JQWdZeHlnZFQxWUJ0VlJ0OUR3KzhSb2pYYWdidVovQmdOS1BEYXRhMzE5?=
 =?utf-8?B?WDFCQ2g5WEh5VDZpdHpBa3BGbkhDbkY3KzNINFhic0hKYm1zdG40Sy9vZW9S?=
 =?utf-8?B?c0J5SkF1OXk1TlpxWjFrd29scERjbDRxeCtwMG1hVjJYSjVJUXhHNmZ1ZmhO?=
 =?utf-8?B?cExjZFRuYklsOHlNZTlTb20yWlM4WHZjZExlWnlKNmVHcmowR2kvcy8va0J6?=
 =?utf-8?B?c0lHVENnai93NDNtVEtTSHFoemJ3bUpsQWFncnBobXJXeDNlVkpHSXFFZmJ0?=
 =?utf-8?B?Zi9FdDFJbXhEbkJxUHcyYmtVb2NtMS9mRVBwY3hUNGFHY0FVMzVybWtVUkVB?=
 =?utf-8?B?VjNVeTVYdUwybkNzaFVwN1F1NVlSNERRU3V5QUFXbjEyVjdrTHFxZnlsTSt1?=
 =?utf-8?B?a3Vlcm5sS0xkU2VTOGNaRmkxOEEwaHRTcFdUMjRXNE41a3pNRWtVVlNZRnNB?=
 =?utf-8?B?TURYZ2o5N0VXOEhCWlBtUVJqL0xGNGFnK1hTSmtCMDRrMFlHV0syMnVEV0hn?=
 =?utf-8?Q?g7SXCaWJ2Owi4tQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F37EFDD2DA0294B9EA2CA5BEAAA69A5@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: k9r1C4QBiTcYFDvMtfFoOq8yK9nMjUmPF0Qh7/rrLMaRHX4oKfKhIcycfvX1Ed2qoU43kyGQPLn2WjcuowbOwX1hRZEl1Vaw94wBQla77biRPuqhxH8qerEkmBXBvxGtYmn9UjGIVJIQe730mKkWTYdgUXtQQKrVOLWh2dB9W58dxvOL14lBmsObgQ/vkyOP058W6PKIUqeP+LDC8Zy7hMKBThIPgIMx9Sb1lkrDZ0fJSbma4/FveuPxdI/c+XR+rjylHQwu1iR4c95swyqmJF1zdatosQC5aV6M7Ink9zi/nx2IlLK4yJGSNQ0RowtEGNstPE7E09IZ/fwJ/49a7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40f6963-4704-40f5-9d01-08df4b9a19df
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:48:54.0461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wh9weYsx7e8P728F3RH1ckANKNZ+1Mv+IBOekfyMft72nL4UivzONR6FgqflSaYygFU8TAJBtdVQrBQPZ0QZJ4+v0pz6K8daBIYENI/LZ9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7810
X-MTK: N

T24g5LqMLCAyMDI2LTExLTI0IGF0IDE3OjAwICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIzLCAyMDI2IGF0IDA3OjM2OjU0UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBXaGVuIFVTQjQgaXMgd29rZSB1cCBieSBkZXZpY2UgZGlzY29ubmVjdCwg
bm8gbmVlZCB3YWl0IGZvciAycywNCj4gPiB1c3VhbGx5IHRoZSBwaGFzZTJ+NCB0YWtlcyBhdCBt
b3N0IGFib3V0IDIwMG1zLCBhbmQgZW50ZXJzIHRvDQo+IA0KPiB1c3VhbGx5IHBoYXNlcyAyLTQg
dGFrZSBhdCBtb3N0Li4NCj4gDQo+IFRoZSAyMDBtcyBpcyBub3QgZnJvbSB0aGUgc3BlYyB0aG91
Z2g/IEl0J3MgZW1waXJpY2FsIHJpZ2h0IG9uIHlvdXINCj4gaGFyZGh3YXJlPw0KDQpZZXMsIHlv
dSBhcmUgcmlnaHQuIFRoZSB+MjAwbXMgaXMgZW1waXJpY2FsIGJhc2VkIG9uIHRlc3Rpbmcgb24g
b3VyDQpoYXJkd2FyZSB3aXRoIHZhcmlvdXMgVVNCNCBkb2NrcyBhbmQgZGV2aWNlcywgcmF0aGVy
IHRoYW4gYSBoYXJkIGxpbWl0DQpmcm9tIHRoZSBzcGVjLg0KDQpJbiB0aGUgVVNCNCBzcGVjLCB0
aGUgbGFuZSBhZGFwdGVyIHN0YXlzIGluIENMZCAoVEJfUE9SVF9VTlBMVUdHRUQpDQp0aHJvdWdo
b3V0IFBoYXNlcyAyLTQgdW50aWwgaXQgc2VuZHMgTFRfUmVzdW1lIGF0IHRoZSBlbmQgb2YgUGhh
c2UgNCB0bw0KZW50ZXIgVHJhaW5pbmcgKFRCX1BPUlRfQ09OTkVDVElORyksIGFuZCB0aGUgc3Bl
YyBkb2VzIG5vdCBkZWZpbmUgYW4NCm92ZXJhbGwgbWF4aW11bSB0aW1lb3V0IGZvciBQaGFzZXMg
Mi00LiBBdCB0aGUgcHJvdG9jb2wgbGV2ZWwsIFBoYXNlIDINCih0Q29ubmVjdFJ4KSwgUGhhc2Ug
MyAoQVQgdHJhbnNhY3Rpb25zKSwgYW5kIFBoYXNlIDQgKHRMVFBoYXNlNCBhbmQNCkJyb2FkY2Fz
dCBSVCB0cmFuc2FjdGlvbnMpIG9ubHkgdGFrZSB0ZW5zIG9mIG1pbGxpc2Vjb25kczsgaW4gcHJh
Y3RpY2UsDQp0aGUgfjEwMC0yMDBtcyBkZWxheSBtYWlubHkgY29tZXMgZnJvbSBwYXJ0bmVyIHJv
dXRlciB3YWtlLXVwLCByZS10aW1lcg0KaW5pdGlhbGl6YXRpb24sIGV0Yy4NCg0KU28gSSBkb3Vi
bGVkIHRoYXQgZW1waXJpY2FsIH4yMDBtcyB0byA0MDBtcyBhcyBhIHNhZmV0eSBtYXJnaW4uDQoN
Ckkgd2lsbCBjbGFyaWZ5IGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHRoaXMgaXMgYW4gZW1w
aXJpY2FsIHZhbHVlIGluDQp2NC4gRG8geW91IHRoaW5rIDQwMG1zIGlzIGZpbmUgaGVyZSwgb3Ig
d291bGQgeW91IHByZWZlciA1MDBtcyB0byBsZWF2ZQ0KYSBiaXQgbW9yZSBtYXJnaW4gZm9yIGFj
dGl2ZSBjYWJsZXMgYW5kIG9sZGVyIFRodW5kZXJib2x0IHN3aXRjaGVzPw0KDQpUaGFua3MNCg0K
PiANCj4gPiBUQl9QT1JUX0NPTk5FQ1RJTkcsIGlmIGl0IGlzIHN0aWxsIGluIFRCX1BPUlRfVU5Q
TFVHR0VEIGFmdGVyDQo+ID4gNDAwbXMsDQo+ID4gdHJlYXQgaXQgYXMgZGlzY29ubmVjdGVkLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlh
dGVrLmNvbT4NCg0K
