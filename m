Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795501942;
	b=v2eHh8D8nwOMV/fto8c6NMsuqwXCTYiQ70WUjccLIJrhjVtRwob2+5Z/Mj9Pjerg6fVF
	 U9h0Qkj7QHudHjRb3THtpNAGHt9YbRJt04BHNg6U29e/GeS15diJPhdbpnzthBzqTAh+1
	 QS1t4x10Kc+pLZFMAFJt1GSh3032j80t8Mdk0mm9ldG14MgW5kmepRW1N9cJ2WnWqxPVI
	 lkaZ8TRiSedjIdtxqiCllP8SOI7xAAoboMm3d/Sz9+1mMhn96eQlquIkJNbKjiy4+vaEP
	 b9ZwxDC8alszGU3ZMS7oMyXpeG7EObLQRXA+vD+Vs1TpzSY7atwGoI2PpVA/Yx0uWrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501942;
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
	bh=GJ359Kp+ZoUh7zH5+MCY9TRfXOBV9JSSdHrCGKSeNpU=;
	b=s8pSkAAvo6bixVpCxiBQZKkgig7DtXYF3Jjlrmbj5e+wRiYH9CaQ+uW3t3qHF7iDiqkN
	 NbkVAVeoND568Tppm0ZljpxgfrTU5w/jO3D85k7ld9ipmeocn23InOL+O9roIZ6XPJsyP
	 +6uuv7rTtfFnpcwMhOuby8i+tfsPwUbLstSWbYpTjB2ERtzKNNswp4hcEkCYPIte+lsSV
	 s/h240C/WZNVb97PRquJGJML6bufSB7Wo5Vi7ebOHMdX54LMIiUXdaTRN0h2Ada0jIyRp
	 tc9yFbUnxWdV7mwfjywg2FjPOPWn+ucl/UOIGOhUGxwLHZhP9xo+CGi03hj338NmH8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=b3l4oLFz;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=bz9EFSIN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D5606A327
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 06:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7D5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=b3l4oLFz;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=bz9EFSIN
X-UUID: c9c73696e7d011f18dc8c9802ae25ab1-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GJ359Kp+ZoUh7zH5+MCY9TRfXOBV9JSSdHrCGKSeNpU=;
	b=b3l4oLFz/An0VLmr3UCH/wBcbrtr1+lnVSc+Or7sBrWZ6q0qG3FX/3RcbiGKj5oXBgMwLOMDRKkg5+8nwsI4NxgFIkR3H+ZaumbaU3r+Co2m61YhCdkNl43hx3g6Z7FXiWsomfphRlSvXkMgvxuGZjQmncPPLUrDsI44msciJdk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:270351f3-7b34-4543-a7e3-57776057178d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ddab2ec4-463c-4628-987d-7a9605ae5537,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9c73696e7d011f18dc8c9802ae25ab1-20261124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 570178576; Tue, 24 Nov 2026 14:32:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 14:32:14 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Tue, 24 Nov 2026 14:32:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPnyReYaALeL7MnZuuCiQafA7/sahQ/U2j2QQNE1UDlYLOH17Mh0UoCgikchVMnbumWUuVxC0d4YvRYlLfD/xDGLUAViS9d3ZACWd4kUMFmtIej5TKRx1Somqzovat6Ix01f3VXsEW2SWgLETADfLChkpyk2lB1SQO2LFYYCj4DX6fdZyJcA94z1X8m681Pd5O3Csm3jqDBwVnY2ZXjvuEqd8BuCsnzlXAMosfOk9ZcJ9YLiH1gJyzKY1yOzTZWWk/zeyYNEhOx+63vGgjqY/6M7iJLU5gmTo8yDljdTXvrgOyln+HvMKBQdKQP+Xwplx8s8dzCw2SYQdit15HDN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ359Kp+ZoUh7zH5+MCY9TRfXOBV9JSSdHrCGKSeNpU=;
 b=QYcXZWBYme5o3MmePeTZ4lzFELfKAlLziylQ+7e/+xlvSyp0YQXaFAvA0QreqlADq1YqC9pfNx3VjsiAp2MYMr70Gug4pEvYD1S0FhwPiOTk4KP+khVk0d+VUQ5JXxqfuORz/wG16hJWF8zNrt4VV2KaPdauAHLJrU5JK20/MS4VIQj5T3s5IjayaE1oBc2MpbExJR6m4o3kXZDry/5dRySzeDVi/RNKBTyVQY7Mwfn1hgPivNcR6olE8eyQRd1keRq5onJ2tErfdvaASb9l1e8gw+kcMJQWokNihPZiuGQ1xatenElqCa5RzDsMpZ05oSSNVt4bCYZAORBbYdfk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ359Kp+ZoUh7zH5+MCY9TRfXOBV9JSSdHrCGKSeNpU=;
 b=bz9EFSINYj6GAEMMw1oQxWWgXXMTtZ7DJoxO0pRHBIcPyBafORIHbUEZqtwemTUkZ8O1CZz9w+yHrb2HGLZL0ZsD/VIY1GGmnhw/2Th+71erbozG/529i4xZ008/OETaxaQUbLkunmqpVIzjsbZl21xCrGLMa+YskgKfnr+iKfg=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SE3PR03MB10062.apcprd03.prod.outlook.com (2603:1096:101:332::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:32:12 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:32:12 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 8/8] thunderbolt: Drop WARN_ON() in tb_disconnect_pci()
Thread-Topic: [PATCH v3 8/8] thunderbolt: Drop WARN_ON() in
 tb_disconnect_pci()
Thread-Index: AQHdez8RlZgHUNxKW0+e+Q1c3rgP/Lc7iOqAgAE7qoA=
Date: Tue, 24 Nov 2026 06:32:12 +0000
Message-ID: <caeafcf7ab501bb50ff65c320ba0a5877d7f72f5.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-9-chunfeng.yun@mediatek.com>
	 <sashiko-outbox-229158@kernel.org>
In-Reply-To: <sashiko-outbox-229158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SE3PR03MB10062:EE_
x-ms-office365-filtering-correlation-id: 80f3c0f3-05ab-4666-c397-08df49f4ac4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021135927099003|10067099003|261021121427099003|261102123227099003|261028144727099003|261009223027099003|6133799003|22082099003|18002099003|56012099006|4143699003|5023799004|11063799006|38070700021;
x-microsoft-antispam-message-info: BEt3u60M6J2Pwey4ME7x97UMd2Jrn3x+yaxcnuwmFS34Sl5bVaZ1lbsf3a/tERwoairbmjUk771HH7j5zYhuTpVV/kLaUKVPNSNrm0i4If5OxSxDmBJd+bbrYKZbdMoWft77xFVMqv1NHxp9bUsU2rESa3el4LOW7D9Dzf/UipRFZIgAY2XyrpK1I+7mrcu+nIIJJqVMIHv8e7YufhFR2IJyB9QhRDsGNl71YjsASpAwaz9oxi4H8DyswldZ0dcKh2kQZR3N3ASQD6qXBZdHDfIbGcWyH+au4MwR/bG2nIqCHIwI42q2Hdnplbma4/19b35Xodyxrq931g2ZpnnHNqjIGTmeiYYpURU/IiL1Gn7B9Xhz+CKWklw4LpylILoUqJW6tcPE1KkEEyBEhIGuuqdJVMA8E4DDVd5E6OjVnx9av37vuFN/q0eo20V1BDHwmyhex93KSuI4dFppzB2nbLTO629polPw6FsvfumouPUOg6ljqOMEZBMPgjmpeIGG42GAnBa2BJUrkA5e0wOxqqAmU4t8uRLms80fHAV0g/FgFGOP85X8xxcLqXjbRvx/BKAD0JTEXG29B7kLQAhRLioCL2zemlGXbhPNbJMMalRxP0KCfvPZ80Vkd1FZI84uKX2plQSdzE93KJ43AkTKkSzEP349hNniXhI8GuqFkFJ/wZbD23hdA1jhwmcA8w1HF8UbZogmIryb84PzmYz7kbillv6CKaNupk+vejRRaNw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021135927099003)(10067099003)(261021121427099003)(261102123227099003)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(5023799004)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3RsTkNBS1dmN29aK1daRjQwV2l2QnEwUUYyUmh4Q2hIdTFQWDRpQ2xLTTAy?=
 =?utf-8?B?VThaQzMyMzU0QWM3TEgyNlB6NTlMN0ZYSWMyb2NnUmU3MkhNbUh2RGVVemR3?=
 =?utf-8?B?L2l1ODV5dFBOWStaUTFBZVlHcHZ6cklQeWlxRUxaV2pWOUJWTXlCeWdLRnZX?=
 =?utf-8?B?REJkcTdRdTFqMTAvQTBvUW1La3NIcll5QUtrb2ZDaGc3bU5GYkVEeitWeUdv?=
 =?utf-8?B?bS9OalVaVHBBZUJYcmw4eDJITk1ha2Uyc3o0SjRIcWExc21LK0RGQWFkMmM3?=
 =?utf-8?B?YUtsVjAycTVyTHoxRUtvYVBudjRnc1kyZElLTy9WVC9aMkF4ajZ1b096dUxn?=
 =?utf-8?B?R21MdmUrSG5pNzBEUUE5MXhYTklMYWlqTDdMd3FocnJVNzh5UEpqdDYyUkt4?=
 =?utf-8?B?RFRkWHNKMGpiTklkZWRqeU9WMmxFazUrdCtOQ09uYTJxcFQxMys2MUhzRXF6?=
 =?utf-8?B?MjJNVE90b0lzaGlJYlQxWnoybExLTHV6WCtBOGlUT3lyTVdzY3pkQThZcjYr?=
 =?utf-8?B?bVdGQmpMNExxUGx2ZzI0bkVvZVBkWHV0SXdnK1NOOHpBVmU1YUUzWWpEOHNu?=
 =?utf-8?B?c1R5WEY2UmNwb3c3MmNWWk5wRDVVK1hJNVpLSEFMK05TVWN0RVFoekR0MTZh?=
 =?utf-8?B?SFVDRWFxdFI1OHRaTll2ZXhNcWFTWjJORjdxaUsyMVdaSThXaFJoMFBGdFZm?=
 =?utf-8?B?T3RFdXFjSkp4TCt6ZnVmNmdEU3pJY09YR0wzbmZmYkVrZUxWblhXVWpyQWhS?=
 =?utf-8?B?aVB5a0pNNlJYaktXNit6a1pJeVNLakswQ1NvWUEvZ2hieHZ3ZjBzc2FaTDNO?=
 =?utf-8?B?Q0JQT1JFOGFKNlZhMW4yZ1NsSXNmNEtnSlltdFM4RzNENGNYRm9KTW5PZUQ0?=
 =?utf-8?B?Yk1XV2RibXovc1dsTWtXTWxESEdITkw1MENITzZkWnFIcUQ2TTg1T0RCNkhD?=
 =?utf-8?B?L3dBMU03WU90V3dKRmZoSGlHejZYNWw3WE81S0ZWcjROQmw3OUIyanM4V2Ev?=
 =?utf-8?B?dG5uQmxMQXllWTZCZXl6Q0s3NnFPU2ZqU2RRMjVrOUVZblRaamk3R1h6MTlv?=
 =?utf-8?B?M1krVWtXT2RHVEhpNDY4N2NQTEsxSnVZSDRUT3BxclFnaGRKRUFtN1VOV05K?=
 =?utf-8?B?RWlDSGFVMjRXdWhnV2ZLdnZlTzVaQjRUUmpOb2lQWnJ2S2VUaGtMTU1haldK?=
 =?utf-8?B?QVA1ZWJnbnRCTlhBSHMyekJJcS9aWDJEUHB1MGM1dUU0WUEzK2dacHFGbFV1?=
 =?utf-8?B?U1BuZTBiVytsYXBYYWozdFdkZVZSWHI4WU1nTkR3MkhsSlc4Wm8vNUpJUy96?=
 =?utf-8?B?YVB6ZVFFVlRyT01YOU9KSUNhdjBLbnJ2M2h6YThjaGRIYUtUdGlZeml1Rjlm?=
 =?utf-8?B?ait3Uk5BaFJVVkgrVUdQRUNaMVdDWFVGbjlGVFZncDBZUEF0UVpRQjIrTHRq?=
 =?utf-8?B?TzRKU0VVOGdOVEQ4YWFSYmhscHVrbFI5aVZQYzNtKzI2SEFHZHdWVmlzaFZO?=
 =?utf-8?B?a3p1MDVzMms4b09WUzZRdjBqN2hqMUFhdHNlam52azIxcDRoR29nOTd2aThq?=
 =?utf-8?B?Rld3QlZaWVUvVE41ZEp1enpIUW5lbGV1dmo2OEtGZVB0Mjh1QVNDQ2lySGRI?=
 =?utf-8?B?QnZFV0ptakppMkFpc0o1S1FWYXFwczBJdjVFMzlzMFNMMDZMVnROT3lFRFlw?=
 =?utf-8?B?WEZGUUxXa2RQcksvMGVtL1N4c0liWUYwNTV3ZkE4S0NiQnU3emNnQ0lIQzJz?=
 =?utf-8?B?UE9jbnhsTnNXZXR5cjdhTnUrNldOZ0V5TUZtWkFwMlZYMjU3bEVTL3RuYW02?=
 =?utf-8?B?N3NTUkJuUmpJOG1mb2tvYllKQkVUbEEycm1tcFRHYklDajgzczZhSC80U2Zk?=
 =?utf-8?B?a1hZbFZZSHIwRVlCRVZMNHcxRENyQ2ozcFpFTEJSdVU1dkwxMHpjNnVJeTRh?=
 =?utf-8?B?NHdRMWpDSkZUMVg0bDl0eDNZSWJlRks1R3VlU3NkRjM2Rm90aTc0Mm0vSkJa?=
 =?utf-8?B?ODcrakFNc3QvczR1ZldHVXVJT01xdTU5b2NKYmRBWVFMMXNUblpubjEveUQv?=
 =?utf-8?B?bEM0VGd5dkRFZFpnZzNPNHQzMTQrVDZ3Tk5xYjZQMkxoaVJWc3JMU2pmTlNO?=
 =?utf-8?B?V3F2bnRUNlJJZU9YNzhPWVRZOHdiSjVRRW9GRGdOaTFoQ1FoRWpacEVqbUdq?=
 =?utf-8?B?Z3JNYnJlcU9UVXhXKzZjeXoxWmpMRUdlaWNta05WUFhLVCt6R2YzbWdHd0Jl?=
 =?utf-8?B?bW5zTHdFVHUycUozaktuWXY0L2NmRlVSQXJCbktudzA3TmtaVlNLa1hOODNE?=
 =?utf-8?B?a3ptUmY0dVhlcHRjd3U0aldOazR5bTFrV2pxSzNUTU5KajFJVjN3TU1KNVlv?=
 =?utf-8?Q?GSlbeA4mSJSdQ5E8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E973D423DB03B4468786A0D05CC49206@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: FlJ++fFl26Uo3OiVCHIfI0isGqm2X51AwXEg/3qOC1FGtxcyX0BHIjU2eY4HuHURO7RIJgncSEm+MbBNxseai7JIX1dxWVrItzo6vIjG+W3UgBSw8k+3/k8dvEtJ/koSW/9tYgAhcpB4kwHrQgdvUIeAmoI3zWYJlCMmN5Ea+Y2Pcm12+AvGA3dp5XjJLszptnuKIXATdJBqAzpqqWbh3UnVVgl0BsTp5TmwpS6ue7CeOvKFBKOAmayyRcUdSB/J2tB377Pdnn7APfeOKy8FONbucpBcYBa2szr3YBPxPDfqjxzqXmbXtoe/u3Pp/2yf+NGRs1c3yuMbaplijHa9hw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f3c0f3-05ab-4666-c397-08df49f4ac4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 06:32:12.1061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbyszcVFzsL3cZJ4XCukJ925uxREOpWCkm7gVu5iW+Sv2jI0J8QOu59r44/DpG7DZZ35CEjhJu+Aj3mmykLeIwNoU5mb31crQoDszyyE40g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10062
X-MTK: N

T24g5LiALCAyMDI2LTExLTIzIGF0IDExOjQyICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSB0
aHVuZGVyYm9sdDogbWlzc2luZyBGaXhlcyB0cmFpbGVyIGZvciB0Yl9kaXNjb25uZWN0X3BjaSgp
DQo+IMKgIFdBUk5fT04oKSBmaXgNCj4gLS0NCj4gDQo+IGNvbW1pdCBmNmE2ODVmNmQzZjc5MzQz
YzFiYTNjNTdkYjM2MzZhNWFmYzVmNDZlDQo+IEF1dGhvcjogQ2h1bmZlbmcgWXVuIDxjaHVuZmVu
Zy55dW5AbWVkaWF0ZWsuY29tPg0KPiANCj4gPiB0aHVuZGVyYm9sdDogRHJvcCBXQVJOX09OKCkg
aW4gdGJfZGlzY29ubmVjdF9wY2koKQ0KPiA+IA0KPiA+IHRiX2Rpc2Nvbm5lY3RfcGNpKCkgdXNl
cyBXQVJOX09OKCkgaWYgdGhlIHVwc3RyZWFtIFBDSWUgYWRhcHRlcg0KPiA+IHBvcnQNCj4gPiBv
ciB0aGUgYXNzb2NpYXRlZCBQQ0llIHR1bm5lbCBjYW5ub3QgYmUgZm91bmQuIFRoaXMgdHJpZ2dl
cnMgYSBmdWxsDQo+ID4ga2VybmVsIHN0YWNrIHRyYWNlIGluIGRtZXNnLg0KPiA+IA0KPiA+IEhv
d2V2ZXIsIHRiX2Rpc2Nvbm5lY3RfcGNpKCkgaXMgaW52b2tlZCB3aGVuIHVzZXJzcGFjZSBkZWF1
dGhvcml6ZXMNCj4gPiBhIHJvdXRlciB2aWEgc3lzZnMgKHdyaXRpbmcgMCB0byAnYXV0aG9yaXpl
ZCcpLiBVbmRlciBkeW5hbWljDQo+ID4gcnVudGltZQ0KPiA+IGNvbmRpdGlvbnMsIGFuIHVwc3Ry
ZWFtIHBvcnQgb3IgYWN0aXZlIHR1bm5lbCBtYXkgbm90IGV4aXN0Lg0KPiA+IEZvciBleGFtcGxl
Og0KPiA+IC0gSWYgYSBVU0I0IHJvdXRlciBmYWlscyB0byByZXN1bWUgb3IgaXMgdW5wbHVnZ2Vk
IGR1cmluZw0KPiA+IHN5c3RlbS9saW5rDQo+ID4gwqAgc2xlZXAsIHRoZSBkaXNjb25uZWN0IGZs
b3cgbWF5IHRlYXIgZG93biBhbmQgZnJlZSB0aGUgUENJZSB0dW5uZWwNCj4gPiDCoCBiZWZvcmUg
dXNlcnNwYWNlIGRlYXV0aG9yaXphdGlvbiBydW5zLg0KPiA+IC0gSWYgUENJZSB0dW5uZWwgYWN0
aXZhdGlvbiBwcmV2aW91c2x5IGZhaWxlZCAoZS5nLiwgZHVlIHRvIGxpbmsNCj4gPiDCoCB0cmFp
bmluZyBvciBUeXBlLUMgaGFuZHNoYWtlIGhpY2N1cHMpLCB0aGUgdHVubmVsIHdhcyBuZXZlcg0K
PiA+IMKgIGVzdGFibGlzaGVkIGluIHRoZSBmaXJzdCBwbGFjZS4NCj4gPiANCj4gPiBpdCBzZWVt
cyB1bm5lY2Vzc2FyeSBkdWUgdG8gaXQgZG9lcyBub3QgaW5kaWNhdGUgYSBrZXJuZWwgYnVnLg0K
PiA+IEZ1cnRoZXJtb3JlLCBpdCBjYXVzZXMgdW5uZWNlc3Nhcnkga2VybmVsIHBhbmljcyBvbiBz
eXN0ZW1zDQo+ID4gYm9vdGVkIHdpdGggcGFuaWNfb25fd2Fybi4NCj4gPiANCj4gPiBTaW5jZSAt
RU5PREVWIGlzIGFscmVhZHkgcmV0dXJuZWQgdG8gbm90aWZ5IGNhbGxlcnMsIHNpbXBseSBkcm9w
DQo+ID4gdGhlDQo+ID4gV0FSTl9PTigpIGNoZWNrcyB3aGlsZSBrZWVwaW5nIHRoZSAtRU5PREVW
IHJldHVybi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5n
Lnl1bkBtZWRpYXRlay5jb20+DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gVGhpcyBmaXhlcyBz
cHVyaW91cyB3YXJuaW5ncyBpbiB0Yl9kaXNjb25uZWN0X3BjaSgpIHdoZW4NCj4gZGVhdXRob3Jp
emluZw0KPiBhIHJvdXRlciB3aXRob3V0IGFuIHVwc3RyZWFtIFBDSWUgcG9ydCBvciBhY3RpdmUg
dHVubmVsLsKgIFNob3VsZCB0aGlzDQo+IGluY2x1ZGU6DQo+IA0KPiDCoCBGaXhlczogM2RhODhi
ZTI0OTk3ICgidGh1bmRlcmJvbHQ6IEFkZCBzdXBwb3J0IGZvciBkZS1hdXRob3JpemluZw0KPiBk
ZXZpY2VzIikNCj4gDQp3aWxsIGFkZCBpdCBpbiBjb21taXQgbWVzc2FnZQ0KDQpUaGFua3MNCg0K
