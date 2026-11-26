Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795679921;
	b=VIKjuiJ50unlVwGg6nkV2738OMMlfinLZTdMXdqqyLjr8ypuMSx0YlkwahlZwZa1MSzW
	 OD16UpkcHZJZnnu4H1I/ZDrut1cQbqyulGCiCxQBuVbWgjTjZdbrmsLbXSENI0E870Rkp
	 JFUiYXJ4l6d1zrx9zmqc2vdDL4Ki5eIZiWe9EtrvxOm+3vM8oAWrFtZX3zLnLw5oBP3DV
	 A2PKnPDsKHKHC3tBXw1IdUMqofxvCHeWqwEDkfnMGNPxERinNs2BK+Qm3K6x96WTAjsDt
	 +Y6UsOZNN/aT9mv+yUyGSQzr5LF1GbQoYTukdF4SRGslhHata/Qhx3569aY5maumkeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679921;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ld-processed:x-ms-exchange-senderadcheck:
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
	bh=eR8/L1QW9BPCmm5lH1AcziIdtYkQ5eHfcU6Aq4qbS5Q=;
	b=0Az1r+Nct9r+oahiM+YPxcH9baPJzY9fyIDJujw3Xi50met38LCw2dSLefSaeUjoujp2
	 9EYTtVq1xRjJYn59aW5PjQksHajcpkxKbWE9WPPXJwlKdtI4DjCY2Qbj79DWMuL1up2LG
	 lRkfp3QLa5+LP9pG5rWAwLqR3F+V45vQTSu/H0o69r40gL6CwYau5KSHsOWjRRdAucw9B
	 BvU2wwBRRFquwUVhmFz9kEhiWgA6kL/arcyb34NI+Ix8rWaHhDAFhmppncVp31umVk1i+
	 NXv0v/FGxCfkA6b5jrVO76/oKVuxAjYJbsTboh8F78/JzbH8ILQTsNO5I4xKbnJtskA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ODRUoEPK;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=Egc3N85j;
	arc=fail smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68DB606A33D;
	Thu, 26 Nov 2026 07:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68DB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ODRUoEPK;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=Egc3N85j
X-UUID: 2950b16ae96f11f1b9cf3d4034dccee2-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=eR8/L1QW9BPCmm5lH1AcziIdtYkQ5eHfcU6Aq4qbS5Q=;
	b=ODRUoEPKNWZxGaOVjEhgDfAlB5fTnwMW5K7d60Y14AldYS2bos4B9Trt5QHK/EJBcpaQWw6QQ/7aGLwn13BorENiJh0NSh7WEcyj6heJJRBneySD/D1tKmFsYEBIOjF7LSi2w9Yog6F/DAFjrfKcmfZdaYj48JHF35MYvAVFGhk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f4f5a098-5541-4655-b6ce-ae54f9b3efe9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3325c8b9-1223-45a0-a100-6c23332bfbeb,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2950b16ae96f11f1b9cf3d4034dccee2-20261126
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1813013039; Thu, 26 Nov 2026 15:58:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 15:58:26 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 15:58:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtgMU2yzRDErcdj3+otng+zwoP9qZZIiFSV6oRJDBVSW7fKMnf7s/X2m/fqS09VSIgHkTva925EUyjD5/oN9lfHjm8jmMER6pmgieZcIrFfCJN9JvAskCTxsYkwStqi9ZSDcYuglavoxf8l9poCqHtpUWvLUpOWVG3bCHP0lZ6D2nPL0R0KHwVHpgUZoaGYVTU6Cov0MDd8H9L4altEqFJ4H7bYaR9RCFCXKU4IFRX510AwKuohAWXVCU3i/vX8UIdrdCMsnXQlV8JHBroNokA6dAE0KmlqNu4Xo7VNAN6PC+mQxiZ/FDdt9Pw6Ux0fm+DyMt1Rtxv29W9Ng3QHUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR8/L1QW9BPCmm5lH1AcziIdtYkQ5eHfcU6Aq4qbS5Q=;
 b=YN25Jr5gy3qj+1blxbGJwhOUK4bvNbxLU+He4tNH3Vtb+/rIskUHLvdd6torz/DY6KNrnbdvcAI4RZArZtWTJ7JYofLn/1okLBr9quJQm1EjbIaj16ASym3wvLsFnVXCY9DOLW3jazfw/3swxeiAjUhY2ErQi4UPDeE+ZctJRQVP8jkdUSo4Yu4yd9BIfEFe/Rs0qKq3UjH2/sIfe3ARCY7jtx1A2/BkH3xAER+vCiHUyU84NplC/YKBXEd6gXzV45++/FfrxwG2rU7zx5+Vq4j2gxrCJeC9f650bariZQFAX2rur6akPe/VyC0ZCPLnXqDJK+AVYeK4u65ygbfoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR8/L1QW9BPCmm5lH1AcziIdtYkQ5eHfcU6Aq4qbS5Q=;
 b=Egc3N85jZhj1rQLstlQTMIk8dz62z/pB3uUt863fWARmvAO+/OA1ekpfdnHw9EMsJyGIq5fh/3mrychiNxQRGujP97R5FOEhHxnjdYczpTGwF5aO08D4nqne4W9WBAFQ8TkRONAbkrpjTQMdeu+p7pDchz697GsWfIn458voycI=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by TYZPR03MB7081.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 07:58:22 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:58:21 +0000
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
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Topic: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Index: AQHdez8Xc5+nR59GnEuIPvdl9swLYrc9ZpKAgADziICAAAg2AIAAUSaAgAFN2QA=
Date: Thu, 26 Nov 2026 07:58:21 +0000
Message-ID: <6980c740e619f1818c2e3a27cf0f3ab3026f9ceb.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
	 <20261124161159.GT229695@black.igk.intel.com>
	 <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
	 <20261125071300.GA191152@black.igk.intel.com>
	 <20261125120327.GD191152@black.igk.intel.com>
In-Reply-To: <20261125120327.GD191152@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|TYZPR03MB7081:EE_
x-ms-publictraffictype: Email
client-request-id: 4bf9831b-4b0b-49e7-836c-32701844cf58
request-id: 0dc12c6e-a454-4916-0003-08df4b930a43
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|261022075727099003|261102123227099003|10067099003|4143699003|11063799006|56012099006|261102130727099003|261026121527099003|261021121427099003;
x-microsoft-antispam-message-info: XJJ95v8smraoNIO7h2TsBCK79mNY/4ZJFRIvW6IqfZ4bp/ifg3WzZbzYabRqg3QOknjU71cAyy4czmhyE9csyu//ZvkElK4dfSbJdl4nKim/a1JN1jcB5TxM4B0c5ObsWzKvpJX7g7C9SCISQhCSR1NtMj1dEvfiz3SbBgnOp7hX7/s2wDKFlzui2tHVrni0YJnBRUy3ZX9Ayfyzrw9UxY9ZyNFG81tGE5Hsad6kLWTejbHH8hZKmHYr5Pet04sr+HC7VLADxYmciBf/TH5KyTLHbzO95TWwXBWxsjOVV3pEnUf06A5j99/xolMHPWBaf+e6G8uJ4Tb0zzhzDRqU+EWjocQXzIpI9lYdV9GnO0cOUClEiJfdQ4GTlOB+ptaCiqE9O5axcBpgGVxWDEqKLfOENfNQfyvo20VBT2hseWnK49YRI8tZMiiUH9rvvMD2nekOeHK4UeARn9AexIthC1UCwsg62PlzyG6SqTSRtw5KbzUjKNJMtBU7csDlDNiC7NflxxypZkZ+jW/xz1ybdvRebeC3UwCD9PM2Xmt1MaxoQI5i5+EVplPPHtGbq9SU2xzowD3ZOrS6/9Qp1OwJiY/4/7xPxYTGLoHfv5x4Ap8rZ+ODRC4KVPf6w6zFYOla89EjlJ/FigYqVjKBaQc4EOiUm1gqlKOtOM4xHDBcV+8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(261022075727099003)(261102123227099003)(10067099003)(4143699003)(11063799006)(56012099006)(261102130727099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDlhT0hFTjEzYUVRdnVERFY1NjA2SFNoczYwL054VUprbmdqWnBvZHVEdnJ5?=
 =?utf-8?B?QzNISlVraFpFZkpnYnVwOHNWdzdJSXNwOW1rK3pEbkNnem45Skp2c2cxbnBY?=
 =?utf-8?B?K21LMGJBVWRGcm1ySGYvL21PRDdFWkVZWE1BL0NVaXdJOE1JbXdpeCtWK3Vl?=
 =?utf-8?B?aTh5SmVFdmF1OERqSENCSmJhalpkRmJCcUJSWERLRWpEVHJ1RnFoOFhOa096?=
 =?utf-8?B?TE5pUzdDYStHSVRrMTJZS3k1ZmREUlQ3ajBmVUZ1azQvS2ZZWVdUT2hIUDFG?=
 =?utf-8?B?T2tocmkvZE91dkdlZ21vbDhxS21KWTdaYkFDenVIM2o2bjRYdlFwMG1PVVNE?=
 =?utf-8?B?Y2ZUeTZndEJPT00zUEVWam1uTktCR3NsNlpZdEVsQ2ZXRGpuMjZOay9QdVM5?=
 =?utf-8?B?Q1NWbllNc0JQTENUdTV1Sk4wZ2xkWThmdjRDVGpQckN5ZXArT2J3WXI3WTEw?=
 =?utf-8?B?NGxzQzNyUU9kKzFVQWFxUGkydG8zK2Z5WkV1RjR1eUpZSDhzUmMreG03MCts?=
 =?utf-8?B?czIvMlVnMUV5V25GSEVpbmRNMWpIczBQSytYVFVFOXpiMmxzbFdva0UzZDdu?=
 =?utf-8?B?VHgwWFB0N0RmSHgyNzU5K3luanpwL0EwNk10ZXBlbkNTM2hET3BPbHY3bmhq?=
 =?utf-8?B?QTFlNno0S2NsK3NmOFA1Wnp0Q2lkSlREWjBXNkFPR3REY01PM2lsODA1WTkw?=
 =?utf-8?B?MHBXT3ZvRHYyNHM0RUNUL1F2TkVqcUIvWmRQTFg1b2t1ZzlLaFNKMnp3eUNu?=
 =?utf-8?B?U2NJVGxxSzVadytXMU1zS0Mycjl1TGQrbENmT3kvWWdBYnI1TkJvZm1abGw2?=
 =?utf-8?B?N0VJc1ZMeG1RM0tiRElmcml0T2ozMDVjdlJObG5PQk96R3Q5UVlMNUd4VEtl?=
 =?utf-8?B?d1VsMzhqVVgwcG5ZNXVOY3c3TmVabHNuYWdVVUdDZmRPeHJ2NEpEQUIybkhS?=
 =?utf-8?B?Q0g1b3FpM0tQRnlWdHcxcmRnaHNHMko1aWY0UVplaHZDS2tMWG5EVFBzTEJ2?=
 =?utf-8?B?SE1IUXFhRVhmclJHd3FURUJVcXdGazZhRTljeGRKVURWUnNqRWdjclJaa2JF?=
 =?utf-8?B?TzZ0QU9hMm9maUwyakM0RVBiQXJSd3hhRFJuNUVPTUFpRE1nUHNDMlpydmFM?=
 =?utf-8?B?Qi9tQzc3UUNkUTNGakRYQmxhTGQ5OTlscmdJOVRUaEEzVmkydDhlSGpiZUdR?=
 =?utf-8?B?OE9YeERFUm9rNVl3OXE1RUZ1bFVGNTZRa0FtVis1RDFoQ2haZDl0Slc3VUMy?=
 =?utf-8?B?cHVKVHRBQnN0NnUzUkJJUVlRYkRHOXY0NWdyV0tqSC90VmE4WnIxVDFZbHI3?=
 =?utf-8?B?dWJnYVppa0daUnNIK2xtOW9uUmJYalYrSVhiWFhTSHZ2VU9lT2UxNmRYbUJR?=
 =?utf-8?B?YWRUb3Z5R3VERkM3bWJQSUJBcWJSek9WQTJZVjJkQUNHT3ZLUjYyc29MaGtO?=
 =?utf-8?B?RDF2UU9mT3NJVTlVNmdhM045dWl5Z2xHckF5ZkJhUnE5anBLS1JJcDNrazFZ?=
 =?utf-8?B?S1NkdUVFNzgzMzlleVlsM3hTY2JOYzRZczFtMFpwNXZsNHZSb09GMitKVVBa?=
 =?utf-8?B?bU1EWWxqcDUzTE5VVHlPdXBQRXFmUnpIVjltQTRvNEZ0bHRyZEpDdm1waTE2?=
 =?utf-8?B?VjVEWVRjNk1XUDRZSXJQMW9pdk1vL0hGSWNrRjN5Y3ZDNmRmZG8zUlk4R2RG?=
 =?utf-8?B?cmRsSmZacDZrd21jdzZBZ3ZnK25EdUVpOFpEMnpaeWNIVGNTR01zeXJXOHZk?=
 =?utf-8?B?SFAyODJZWm12K2dLaStIUDU5ZDBJanFZUlRrRDZHWWtsYkJmcVR0NkR5NlA1?=
 =?utf-8?B?N3VhUWprRG9XR0JRcjRydDhmUWVwQzMxSWJhaXhoNTdnOUpTTUo2ckxUSTdS?=
 =?utf-8?B?S3ZmeS9sOFBIRmZMZnYvLzJPSTZod09JekFTREVHUG0zNC9BRkxpMGZRTXZa?=
 =?utf-8?B?S1dLdnRlY0dnZkpBOW5SZ3NPMWhqVjVKcWkyV084WTRvS0wyRnpkaCtqT0po?=
 =?utf-8?B?d1ZrRmpvVUliSDMyL0UxMnUzMTFqdDRqS1dkK1AybkxEWUVmQUlKa0dreEli?=
 =?utf-8?B?aTc5eWk0OVN1YzlHU1hFSXQvT1d2SWRjL1FIL25VZVI4bFo5MXJRM0MzaUJJ?=
 =?utf-8?B?SmhWdkFNdUNIa2x0NUUvR1lnK0pUSXV1aUVBRk1WZFlCN1Y4U0tWSjh2a3lq?=
 =?utf-8?B?OGVGaWxPT05PeHREZUYvS0VGRjZhWm9mQVRPcUxma2RqZTRsUkdDbTlWR2hM?=
 =?utf-8?B?aEpabldVemN1aTlGT2Q1RDJjWGY1ZnhRNlgyVHhsblRvdVhydnNNVFRRVmFM?=
 =?utf-8?B?SjZRQjQvMVd2VlpYKzVoQXdGTzRYL0hISUxlV05IVitTSFllRUdFbExIWkFl?=
 =?utf-8?Q?c8YY05+zoXH0aHhY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD91BD73AA68BB45B14239202ACFA98F@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: MFOeI2kZeeUagK3b4bOmP+DvroY4pJ2B/AgTd1313YiosqK/M24sgRcQcXxg3CRUW2sWEe0wfbHaE9vzkRYOyVP6Hx3QQn2ugIls+pVYtSczqDjJNGVYK8OVOejP2UbcWeiA5NGCmdAQ3znQjYZQqBaWxSNAsoP3ILmuOAdtPUPp28DuWeOvcTwmkmpZzWYRvKHtDFwJrWynhC4ucvM2dg/N8rlslqtysrulxWpoqEBIFWYm4kc/LJhNM1L1bxe/metBR4PjyfDQVHZcPaJwNSz8yfas9Q32n6IOuWBmHY2GjuZKVy+z1p5xUMnM4wICo5jc2eBfxRcTN+h3jD/5KA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc12c6e-a454-4916-0003-08df4b930a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 07:58:21.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/BlmlEmlTIcGG1J9kQMfMACL/fKrKO9chD78Xi5Abnq11bxIDztq8zdcCxilQoxepz5/+9P4ueKQjh8+ByCVX65BSbsihxIcDgN5+7AvV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7081
X-MTK: N

T24g5LiJLCAyMDI2LTExLTI1IGF0IDEzOjAzICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tIHdyb3RlOg0KPiBPbiBXZWQsIE5vdiAyNSwgMjAyNiBhdCAwODoxMzowMEFNICsw
MTAwLA0KPiBtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29twqB3cm90ZToNCj4gPiBPbiBX
ZWQsIE5vdiAyNSwgMjAyNiBhdCAwNjo0MzozOEFNICswMDAwLCBDaHVuZmVuZyBZdW4gKOS6keaY
peWzsCkgd3JvdGU6DQo+ID4gPiBPbiDkuowsIDIwMjYtMTEtMjQgYXQgMTc6MTEgKzAxMDAsIE1p
a2EgV2VzdGVyYmVyZyB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMDc6
MzY6NDhQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdyb3RlOg0KPiA+ID4gPiA+IEluIHByZXBhcmF0
aW9uIGZvciBtb2R1bGFyaXppbmcgUENJZSBOSEkgc3VwcG9ydCBhbmQgYWxsb3dpbmcNCj4gPiA+
ID4gPiBQQ0llDQo+ID4gPiA+ID4gYW5kIHBsYXRmb3JtIE5ISSBkcml2ZXJzIHRvIGJlIGJ1aWx0
IGFzIHNlcGFyYXRlIG1vZHVsZXMgYXRvcA0KPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IFRodW5k
ZXJib2x0IGNvcmUgZnJhbWV3b3JrLCBzZXZlcmFsIE5ISSBmdW5jdGlvbnMgYW5kDQo+ID4gPiA+
ID4gc3RydWN0dXJlcw0KPiA+ID4gPiA+IHdpbGwNCj4gPiA+ID4gPiBuZWVkIHRvIGJlIGV4cG9y
dGVkLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEN1cnJlbnRseSwgc2V2ZXJhbCBvZiB0aGVzZSBm
dW5jdGlvbnMgbGFjayBzdGFuZGFyZCBzdWJzeXN0ZW0NCj4gPiA+ID4gPiBwcmVmaXhlcywNCj4g
PiA+ID4gPiByaXNraW5nIG5hbWVzcGFjZSBwb2xsdXRpb24gb3IgY29sbGlzaW9ucyBhY3Jvc3Mg
dGhlIGZsYXQNCj4gPiA+ID4gPiBrZXJuZWwNCj4gPiA+ID4gPiBzeW1ib2wNCj4gPiA+ID4gPiBu
YW1lc3BhY2U6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gLSByaW5nX21zaXgoKSBsYWNrcyBhbnkg
c3Vic3lzdGVtIHByZWZpeCBhbmQgZGl2ZXJnZXMgZnJvbQ0KPiA+ID4gPiA+IGFsbA0KPiA+ID4g
PiA+IG90aGVyDQo+ID4gPiA+ID4gwqAgZXhwb3J0ZWQgcmluZyBmdW5jdGlvbnMgaW4gdGhlIGRy
aXZlciwgd2hpY2ggdXNlIHRoZQ0KPiA+ID4gPiA+ICJ0Yl9yaW5nXyINCj4gPiA+ID4gPiBwcmVm
aXguDQo+ID4gPiA+ID4gLSBuaGlfcHJvYmUoKSwgbmhpX3NodXRkb3duKCksIGFuZCBuaGlfcG1f
b3BzIGxhY2sgdGhlDQo+ID4gPiA+ID4gc3RhbmRhcmQNCj4gPiA+ID4gPiAidGJfIg0KPiA+ID4g
PiA+IMKgIHByZWZpeCB1c2VkIGFjcm9zcyB0aGUgVGh1bmRlcmJvbHQgcHVibGljIGludGVyZmFj
ZSAoc3VjaA0KPiA+ID4gPiA+IGFzDQo+ID4gPiA+ID4gc3RydWN0DQo+ID4gPiA+ID4gwqAgdGJf
bmhpIGFuZCBzdHJ1Y3QgdGJfbmhpX29wcykuDQo+ID4gPiA+ID4gLSBuaGlfbXNpKCkgaXMgbmFt
ZWQgYWZ0ZXIgUENJIE1TSSwgZXZlbiB0aG91Z2ggdGhlIElTUg0KPiA+ID4gPiA+IHNpbXBseQ0K
PiA+ID4gPiA+IHNjaGVkdWxlcw0KPiA+ID4gPiA+IMKgIHRoZSBpbnRlcnJ1cHQgd29yayBhbmQg
Y2FuIHNlcnZlIGFzIGEgZ2VuZXJpYyBJU1IgZm9yIG5vbi0NCj4gPiA+ID4gPiBQQ0llDQo+ID4g
PiA+ID4gcGxhdGZvcm0NCj4gPiA+ID4gPiDCoCBjb250cm9sbGVycyBhcyB3ZWxsLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFJlbmFtZSB0aGVzZSBmdW5jdGlvbnMgYW5kIHN5bWJvbHMgdG8gY29u
Zm9ybSB0byBUaHVuZGVyYm9sdA0KPiA+ID4gPiA+IHN1YnN5c3RlbQ0KPiA+ID4gPiA+IG5hbWlu
ZyBjb252ZW50aW9ucyBiZWZvcmUgZXhwb3J0aW5nIHRoZW06DQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gLSByaW5nX21zaXjCoMKgwqDCoMKgwqAgLT4gdGJfcmluZ19tc2l4DQo+ID4gPiA+IA0KPiA+
ID4gPiBJIHRoaW5rIHdlIGNhbiBtb3ZlIE1TSS1YIGNvbXBsZXRlbHkgdG8gcGNpLmMuIEFzIGZh
ciBhcyBJIGNhbg0KPiA+ID4gPiB0ZWxsDQo+ID4gPiA+IEFSTQ0KPiA+ID4gPiBzdHVmZiBpcyBu
b3QgZ29pbmcgdG8gbmVlZCB0aGF0LiBXaGlsZSB0aGVyZSB3ZSBjYW4gZHJvcCBNU0ksDQo+ID4g
PiA+IHRoYXQNCj4gPiA+ID4gaGFzIGJlZW4NCj4gPiA+ID4gbmV2ZXIgdXNlZCAoTVNJLVggd2Fz
IHN1cHBvcnRlZCBmcm9tIGRheSAwIGJ5IHRoZSBIVykuDQo+ID4gPiBJZiBtb3ZlIE1TSS1YIGNv
bXBsZXRlbHkgdG8gcGNpLmMsIHRoZW4gd2lsbCByZW5hbWUgYW5kIGV4cG9ydA0KPiA+ID4gYW5v
dGhlcg0KPiA+ID4gdHdvIGZ1bmN0aW9uczoNCj4gPiA+IF9fcmluZ19pbnRlcnJ1cHQoKQ0KPiA+
ID4gcmluZ19pbnRlcnJ1cHRfaW5kZXgoKQ0KPiA+ID4gDQo+ID4gPiBpcyBpdCBmaW5lIGZvciB5
b3U/DQo+ID4gDQo+ID4gTm8gdGhhdCdzIGV2ZW4gd29yc2UgOiggQnV0IEkgd2FzIHRoaW5raW5n
IHRoYXQgd2UgY2FuIGRvIHRoZSBzYW1lDQo+ID4gZm9yIE1TSVgNCj4gPiBhcyBmb3IgcmVndWxh
ciBpbnRlcnJ1cHQgaW4gbmhpLmM6DQo+ID4gDQo+ID4gwqAgbmhpLT5pcnEgc2V0IC0+IHJlcXVl
c3RfaXJxKCkgZm9yIHRoYXQNCj4gPiDCoCByaW5nLT5pcnEgc2V0IC0+IHJlcXVlc3RfaXJxKCkg
Zm9yIHRoYXQNCj4gPiANCj4gPiBUaGlzIHdvdWxkIGhvcGVmdWxseSBsaW1pdCB0aGUgbnVtYmVy
IG9mIGZ1bmN0aW9ucyB3ZSBuZWVkIHRvDQo+ID4gZXhwb3J0LiBNYXliZQ0KPiA+IGl0IGFsbG93
cyB1cyB0byBnZXQgcmlkIG9mIHRoZSAucmVxdWVzdF9yaW5nX2lycSBhbmQgdGhlIGxpa2UgaW4N
Cj4gPiB0aGUNCj4gPiB0Yl9uaGlfb3BzPw0KPiANCj4gSSByZWFsaXplZCB3ZSBjYW5ub3QgZG8g
dGhpcyBmb3IgTVNJWCBiZWNhdXNlIHdlIGFsbG9jYXRlIHRoZW0gb24tDQo+IGRlbWFuZCBzbw0K
PiB0aGUgY2FsbGJhY2tzIG5lZWQgdG8gc3RheS7CoA0KWWVzLCB0Yl9yaW5nX2FsbG9jKCkgbWF5
IHVzZSBpdA0KDQo+IEhvd2V2ZXIsIHdlIGNhbiBhdm9pZCBleHBvcnRpbmcgcmluZ19tc2l4IGlm
IHdlDQo+IG1ha2UgLT5yaW5nX3JlcXVlc3RfbXNpeCgpIHJldHVybiB0aGUgaW50ZXJydXB0IG51
bWJlci4NClN1cmUsIHdpbGwgZG8gaXQgZm9yIHNpbmdsZSBpbnRlcnJ1cHQNCg0KVGhhbmtzDQoN
Cg==
