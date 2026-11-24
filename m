Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795502268;
	b=C79E5HffNOl4q7ywlHyF3kt98CW1EU0cq9RSckb3YAUIpFkVTTR+X1jrZaw/EsgaGiNW
	 Wm3CKXIGA6TRZSs9NRX2hZ1z4Kshyhwf1RtjndmVisi8k0JopDSU+xp6nwzXqHPA9e3n3
	 uy0J9lWIWOToRDMpRv7/+YYqTwe8CLBSMBEFwH9tVmC93Kjq7tIX/aTMQr8tRtwgqG/yr
	 7uokVsNjk/88rscBH3TnkdltIajpwSkGdFRvRHm1SddZmMWAra4TayD5fq5rUGQ/NfeI2
	 9lNY/vk459BnOElwijx+ZRa5i3HxH7ffJ+eKPSqrCand+VfplulqJLCqSc8IQnAlq6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502268;
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
	bh=tADYHhl4BPvuoY5n4V07H05eVkXblo8rQljp6GmVuaE=;
	b=1Ef+YoMGdzCDfSTPxOBxLg5DZgBr6GlI0zW8npfS++DoOW6zNiZNhyMTsrvuYzsuCh6g
	 VNC30N5/O6ZeSJ9nE2vCSdqPWd1rA6zIUEH5X5M1EzkvbhfqbJFVPb7UKpBmas8LWRk5M
	 FMJlR9MgW7+sL/u2Ylaxja7Oh1RU6Tbb6/wGmEp1T//JKgW8K7hOcAtvuNibsC5u748Vw
	 eLZ2Pq/5WXBs8udISUJ/8+Ro+sph7oxfPkUTs9mYmcJnJ7B0OMTIfSdCNcstynBcfOqlX
	 UeMWKMiSq4rpIQm/2SSKZcTd8pUCXV+nzL/MM1b+CBqMiiEnPllCItUTzCvnVNxLjLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fkwfz94K;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=dg0fNGHv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C25606A336
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 06:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C25606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fkwfz94K;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=dg0fNGHv
X-UUID: 8d5a68bce7d111f18dc8c9802ae25ab1-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tADYHhl4BPvuoY5n4V07H05eVkXblo8rQljp6GmVuaE=;
	b=fkwfz94KB0q9f5+92cUkrw/A0QkWFKaAXJmxjrWhMjF29DY8tftgYN1wHs0IR6bV30Lli/PjaAiMTmIMXmOe2ixtOtKCXI3VbjYgpDftVniG2u9vGNr498j0vNbejqZbY+OcAQlY1WQcPtr2Kx4165GHHNF+9TBeQnB4Gqic4Ic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2cd64da0-990c-4a8d-ad7b-9ba8b9e98866,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b2114531-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d5a68bce7d111f18dc8c9802ae25ab1-20261124
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 447426395; Tue, 24 Nov 2026 14:37:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 14:37:41 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Tue, 24 Nov 2026 14:37:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVanj9h2UcJJxK7SVIKCu/xXXgCz/XiEXI/esvswyJGziR+FRaFkmZkSs+Blvn5hUkNI1u5ZhInAfdTNuPxZz4VUGPKYdwLYZchcGETprUxvdhMEj3JmnrzfPak8WIR53VO8ggbFpBPLk0YdCklKioShCwZQJHGeFXdOOMIuOs/xg7ELWW9Q4E1xWsJ/HhDXlk78XywYNDfsTDhYxFDWL7Bs4CaziA06grUdueJbqRN/h5IgeitCVXqAYwy2YaVNDibMnSpCZiwbQktY9n/c1CR5KAhj5c9aIpTEi8TAy7R+AYHqZXVBv/XHRboLhtyibyLmBqXVuCfN+tT+dF/vJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tADYHhl4BPvuoY5n4V07H05eVkXblo8rQljp6GmVuaE=;
 b=qG+pH+TEDINix0gGH+/EI3W+oDK0Irx86cHnu4yqTCAD63xEJ83NHnNnKXImYquiv2CJXEOCjHD7akLrHCvJrjbNuzIqkfd0BeTdfMvNx5/vTefXHvpfqiuUsIE6Um3BzcfVA3H0vZRWINyIE3raRzre1Vn3EGU2Nv6gEQvyLtE9k5ncVaNoXXcbCoLXjzl2nd9UM4HHNOC8ij/oAhmFPwyKxsjMSzvCB/XTN1ofKz5gvIrdJYqsLjeKO6VjUYAIwaGxYAZ9rv86i4iYD7PTsiPsL8mGzUMPbXQCp6M2FP6vVQEEDFgJCfGdjmQbKN6BhsNDACOpKqNZDY/PjtEUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tADYHhl4BPvuoY5n4V07H05eVkXblo8rQljp6GmVuaE=;
 b=dg0fNGHvXU4hp/8+Tvo9uX5MI/r8CfFbgtD6IS0NJQrDMtMhYbi7n3dIakqpnZvsXv7xAoiIQSzPbHCU4SizM+SLiK2Ttf5Mc+eN6gQUxNQWS30GHAOTxvbK+7mCP94YHIqe+Mx6DAg6Yt8BTgV2ADY92+4yJelRztPoG3jC1GU=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SE3PR03MB10062.apcprd03.prod.outlook.com (2603:1096:101:332::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:37:40 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:37:40 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"westeri@kernel.org" <westeri@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Thread-Topic: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Thread-Index: AQHdez8NNNxH4o5A+kCbrUsU3oyW3Lc7jE0AgAE5zoA=
Date: Tue, 24 Nov 2026 06:37:40 +0000
Message-ID: <059072e15558d6aa74eb046e4d9b260baae09200.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-229175@kernel.org>
In-Reply-To: <sashiko-outbox-229175@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SE3PR03MB10062:EE_
x-ms-office365-filtering-correlation-id: 4aed097b-3b6e-41f4-323a-08df49f56fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003|261028144727099003|261009223027099003|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: Svg3iSh4dhRi5QWQNvh3+t7d7fYRA71kfDKM6jWI6jsI1R/6NEOmM9sCRPAwLBCWn5D59AduB5mj6Nmncpvgxil5PSIKRIzPy8K1OWsHSWRbWUeVMsfYc2QCEOa0GDBigWy0j16VZCac4dGR1VHkoEYkkzG+ieW9WtRlO6K96S04qnbQQV1NGUuJQlAmXRFSsW+AoFoVi8VvmjdSY0UBIYHHn15m4VdS0Ts0kHllscNw6Kcb96SisrOKS16Zd2TnnMyjIqHCqEj90Rda7E2PtEbO9ACLGR3HDfOrMI1MLbfE4svh8xwnwkByYRzj+9zv3Djk27r+tLnhTsB/c9pb3fYOYFgeGzjWH4z2jyruEe77nm5wQ2FQZsQLt2KBgilq8WlzsdVqw95hx0+TTAMKtMTDAg8nb8ALYR2iAO8Bzg8jBbiDV36R1Iia/vk4G4Orlkf9zQ8jnWrOCB+UqEqqHK9cBdwiUdMuiaMddkBs/BGSwZP4WPcB86OHNhvStcBWYVhnwWjzADlc3tj/RzuB1OmAkCo54UTK5WGVfOZozfqLcg/MJL0QMjYA9VnfPA2NCWzAaoojC0CRVZrZrjAYF65pFeD+gPnVtz+rh1M/MRlNpt+oX5bMhDlnVtbBYYpRm4lpS2Lerqz0dPdW0MIB5vmTlDkEFub5DD8OjHVNThHDodp5n5QquW/KrzYzLFAvM0SCWIVx/BzMVoiv0BdSVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003)(261028144727099003)(261009223027099003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UithR21QRytlSUltaC96eXZRdU40SFFQcVlPUzkwM2dGck5ndHczOTVacDRt?=
 =?utf-8?B?SXUwMU56MTBiS0JTYXQvN1pBdlBmZ0wvVTRlVy81TitXTkoyaFBXZnI2ekh5?=
 =?utf-8?B?R3JVaDlpL3ZnZitNbkdMVStEMFptdVVUMklWaTlyWGNqSDhWbjRmWFJ4SGRs?=
 =?utf-8?B?djljSXh1ckMzUWpkMVhTK0U1dzF5TWVaaUlUWkE5ZDJhMjd4eElXTFBCa0w0?=
 =?utf-8?B?ek9zZ3ozRWorMVRWSU1tZWlUeTlaSjZiNWhzT0d3eDYvSGxMblJmOFZKd04r?=
 =?utf-8?B?WE8zZ1FmdDZBUGFUNG9xN2JmMkZDRnYxc1cxbjBrNTdObUR5RVZYVHMvR1N1?=
 =?utf-8?B?b0pkVFBrSEdkK0ZLSVcwcUxSaGpnNlhleFJLWjdyOVBwVVEyWTdRemp0RFQ1?=
 =?utf-8?B?SWRpY0NER2dyK3JQcjR5c3N6dDE1VmIzUW1WMlVJeDl1ZXdwWk83ZWpOR3d3?=
 =?utf-8?B?bUZZMTlkd3RDQWc0eFg0R2xReTNsZk9oN1UraUk1Vy94QkJQbU1Cb0dVWjVT?=
 =?utf-8?B?S0JzNTVOM0EyRmhod1JkZFZLWXBxdlF1TlRXTDhmMlJVd0tsZ1JJUGw5YlRz?=
 =?utf-8?B?enFYbEYrZWlRcDBSVUNUTnlqY2RYSmgvWDNJaU1ha1hCTWVVNEYrdDQ0ZWlY?=
 =?utf-8?B?MEx0TDFpQjlBemJUdUoxZHplL3V1elZxNjB2NjF6NlMyZFpRMlFFZktqczJI?=
 =?utf-8?B?R2t3eG5tSVltekszZzk5clM2RCtKL0t1Z3I3aDh4ZDg2U3pPZUV3cXU4aEhu?=
 =?utf-8?B?b2ZYWFdQQ1VRN1J2SlJSeGJWUHVhSmp2WDZVNW5sVDdVaWt6TXlwT1BySXVs?=
 =?utf-8?B?ODYyY3ljWUEySkRwOXBqN2xRQTNPZVo2MU5RZTlmelFDaW85RmZTRUIrREQ5?=
 =?utf-8?B?TzhEcTdqcWVmNjBDSlhKWjk4WGd0ZWRYNTFueWFJclpRdmtISmkzdTd6bkc1?=
 =?utf-8?B?Qk9mTHFqV2FIYlNDS2kxVnp5azlhc0JFTUhZVzhyYXM0T2o1bmxhdU5udjNL?=
 =?utf-8?B?ZmFZVkxCTXBGbXl1alBMbHdac3RsanZTR1M4K3g4Q1M5eXhMMURxdzhpOWJX?=
 =?utf-8?B?QzBHdkp5UTcyRTV4cCswQWlqV3d3R3JMejY5SmV2MlZQZ09kSi96NzNpWGlQ?=
 =?utf-8?B?S1RTZ0t2RGUrZHlZWWUvemgwbVdQMTIxRUVPU3RDZ2hqYXJOSDUrYjBuQTc4?=
 =?utf-8?B?QWZsSk9lVFdLQjQyTkFMTU5WdW5QbU9SWjZ0QUtjZml2dzV4V1B4ZmxoanZm?=
 =?utf-8?B?cDJoV1k3U2R2RjFFR2t1YXMrbzUvdlh2Unh0Q29DN1phdDV3RFpVOTAyYU55?=
 =?utf-8?B?VmhvNW0zRnF4VFFmekN5VkFFOFlvS1pOMWlhM2RXZzJYdXVPaFZTNFliTWhW?=
 =?utf-8?B?aFFBWGcrSG1jZ01zQUJ6akpJbmxkSXFmYzdxSWVGQzNZZExLVlZDR1psQURB?=
 =?utf-8?B?L1pFZmNLemdWOEJISUdqRUZWcDVuL0N3TVpob05lNDN2ZWQwY1JaN0hNMFln?=
 =?utf-8?B?WmlXeUx2YWtjWWh2VjUvY0dObHZVWFpNZmVMc1g1SkNPL2ZwdGZZRkJ6Yi9i?=
 =?utf-8?B?OE1Ka245MmhZZVFiMnpBbXRvYy9JSkN3L0VZZXVheTljdDdDc01FMUJvZ3dE?=
 =?utf-8?B?NEhXdGYzd1hHNFAzc3ZIaklNeEFST3V5UnNXTXREWGFwdWFzV0ZxMW5QSWNL?=
 =?utf-8?B?V2xHcytKbXVoWUhoNWp2cjcvWkZWY2JxR0xYdzZEYnVGUmpVZGdQSUZYZmhn?=
 =?utf-8?B?bmo3SVFZcUo5RCtrN3Nua3V2cjIyOHVRVDJvcmFLQlhYUmVQUEJjdmhSU1BD?=
 =?utf-8?B?ZG12K2paSEdUQUJKR1FILzZONDZiM2lBSXBKUmx1eGJuaXM3MjQ4RDd4VFNK?=
 =?utf-8?B?Qi8xbVlmcVdjMVF5Ni9wcXQ2OUh1c2JwdmR4d2ZYcXdiOExTTGwwTlo2cUpx?=
 =?utf-8?B?blZnRmpacHczMzJRYjhUZ0o2b3cvU1B0Q1d6NDR1K2w3NFA0WEk3TmY4MFpl?=
 =?utf-8?B?MmtyNkwrSHF6c3lsRUZjK2dmYk8waGN3ckpad1dkWFBUTC9EaW9nWGNpZ3Fo?=
 =?utf-8?B?SEZ2aGNtVXlGelF1VjJzdEdNVEtFSkVDOU9zT2xDZXcySlFRSUZvcmttZ1Va?=
 =?utf-8?B?aGRYQVgraDhodzl1S04xQ1MzTlBzV21vdC90cCtzVUZBUWpXNEdsUVNXVEo3?=
 =?utf-8?B?cy9jNXlXbnYvd1FxWi8wWTZGSWwrM2hSU2lvcUE1TFBXaWUzTForUVB0c1VT?=
 =?utf-8?B?dkpRVFpkWHR2SURabm54d1d4bG1rSElyRUZGYTZnbjRIU1JJaWtNUkEwdHps?=
 =?utf-8?B?OWNhTVYzeWRycE14dVYrbUFzblpDTzlqc0txRDhDdjFBNUsvZ1pZQWRueEpI?=
 =?utf-8?Q?wrtK/8awu9zcTjfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79ED8AEF3E953947B0BA8AC2C961FA62@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: n2wTrJt89Q4rhRnJ/Dcig8LYZpYeH1QM6GOwqoWjLfuGBo2hV4plROpxqDzhjgdmW+bZuTMR4S8OwmLvN2GEyCRU1iwfYCf3zWa0uc8KwNsd6kskOM/a6fE8nrVDwKjI11ZenjHCTwaiL6j1oqN1rRZpbgXiYmlNatU5liK/C5UTMkNt67aA+knoET+1/o5rxPKnTtXX2OxYdOfRAlLNUnI7YnqF65r6paLYT/WMSM3EeZdFrsSECd62COyvA5R1xmVTachPx9DMo7yuYyfXR6wvZUjtIzgMA2jTc4zsOd9MsPnbsy44k6QNsjhNpIOgiWBIp9d+j9XZQuQPreao9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aed097b-3b6e-41f4-323a-08df49f56fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 06:37:40.0702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41FTjMWuHTZiwSInCDomISf6bonYq15u53AOqw1zaTZ5uvcqvNatObtsvmdfNdT+uOSfwcOk0uSW7+FSdui7cEcTHTjWM1dnFBX/4/asuJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10062
X-MTK: N

T24g5LiALCAyMDI2LTExLTIzIGF0IDExOjU0ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSB0
aHVuZGVyYm9sdDogaW52YWxpZCBTUERYIGxpY2Vuc2UgaWRlbnRpZmllciBHUEwgaW4NCj4gcGxh
dGZvcm0uYw0KPiAtLQ0KPiANCj4gY29tbWl0IDY5ZTA3ZDczN2YzY2NhYTA4YzAzMzJlNDZjYjM2
MTRhYjUxZjI5YmUNCj4gQXV0aG9yOiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+DQo+IA0KPiB0aHVuZGVyYm9sdDogQWRkIHBsYXRmb3JtIE5ISSBkcml2ZXINCj4gDQo+
IFRoaXMgY29tbWl0IGFkZHMgYSBwbGF0Zm9ybSBkcml2ZXIgZm9yIFRodW5kZXJib2x0L1VTQjQg
TmF0aXZlIEhvc3QNCj4gSW50ZXJmYWNlIGNvbnRyb2xsZXJzIGVudW1lcmF0ZWQgdmlhIEFDUEkg
KEFDUEkwMDE1KSwgYWxvbmcgd2l0aA0KPiBzdXBwb3J0DQo+IGZvciBhbiBvcHRpb25hbCBkZWRp
Y2F0ZWQgd2FrZXVwIGludGVycnVwdC4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGh1
bmRlcmJvbHQvcGxhdGZvcm0uYw0KPiA+IGIvZHJpdmVycy90aHVuZGVyYm9sdC9wbGF0Zm9ybS5j
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4wNWRk
ODU4YWM4MzQyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJv
bHQvcGxhdGZvcm0uYw0KPiA+IEBAIC0wLDAgKzEsMTcwIEBADQo+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgdGhpcyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllciBiZSBHUEwtMi4wLW9ubHkgKG9yIEdQTC0yLjApDQo+IGlu
c3RlYWQNCj4gb2YgR1BMP8KgIEJhcmUgIkdQTCIgaXMgYSBNT0RVTEVfTElDRU5TRSgpIHN0cmlu
ZyByYXRoZXIgdGhhbiBhIHZhbGlkDQo+IFNQRFgNCj4gbGljZW5zZSBpZGVudGlmaWVyIGluIExJ
Q0VOU0VTL3ByZWZlcnJlZC9HUEwtMi4wLCBzbw0KPiBzY3JpcHRzL3NwZHhjaGVjay5weQ0KPiBh
bmQgc2NyaXB0cy9jaGVja3BhdGNoLnBsIHdpbGwgcmVqZWN0IGl0Lg0KPiANCkhpIE1pa2EswqAN
Cg0KZG8geW91IHByZWZlciB0byB1c2Ugd2hpY2ggb25lPyB0aGUgY2hlY2twYXRjaC5wbCBwcmVm
ZXIgR1BMIGFjY29yZGluZw0KdG8gdGhlIHBhdGNoOg0KYmY3ZmJlZWFlNmRiIG1vZHVsZTogQ3Vy
ZSB0aGUgTU9EVUxFX0xJQ0VOU0UgIkdQTCIgdnMuICJHUEwgdjIiDQpib2dvc2l0eQ0KDQpUaGFu
a3MNCg0KDQo=
