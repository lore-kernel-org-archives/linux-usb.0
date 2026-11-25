Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589614;
	b=M6p6WsiKafgKxmLVI5LPPip67ZcSyy2qGXTdL7zG+rilOD1kbNgjWDDo+aBaY8K1k5cV
	 o3Og09afHXUkjNTmp9MpiHEp81JvjWb8jFczUKvtJZ8Pgktn/+DZfS7FcxjxbEh6A0a90
	 EWHemJZNltVc1z8xFOOgPieX7Fijz6vlEjH7RdCPq/4BjoTWHD2pfvXSEXATyO2S18suC
	 W3NVPQubWh1gMdM9VD7JTzXHfDff4dCpo5PqFvasg3k3I8OtAirJXeP31zokExnq5JyIh
	 pvkIz1daBrV+7psDdKYK6nKAPKbnm7UJCChQd1EvqIVcmHJXOO9wAzCgprWFBZvAJ5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589614;
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
	bh=exKlNRmtebgz3FEm0AsqW4woOpm4WOmnacAhNf3jxOo=;
	b=KF8Dn6v+pmn/Zvho2OImiytVx+9hcAimxphkMsbgMzvL6668h6uTUNdf216Cc2CT/WIp
	 Hfh/KzJDdIisAm5byU482FY6aqe/bKwUKJqB/NhSEsSgtitJDx0z1byPsaKmM7JElGELu
	 +liF3EnYLxKg6bDU/yjSMEBCaA1h0St55pCx0IR9Zu7NR9wqqxYKe47Cdmd3eAiURUnJj
	 MCUlxdD6x/Ax3Q9TVBesr4Yaylz8APr9AoDMU+JSYYHWfawJhb7h4XlGkqJ8GgBL8rP+6
	 1mw/zhRuCJBFuEu4aUaSpbyPPm5i/a+7nxu6B8lK9fZ/OwLhZrx4DuZgsKP+QufheOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rcQpPtoz;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=waH6m1z3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6C606A321;
	Wed, 25 Nov 2026 06:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rcQpPtoz;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=waH6m1z3
X-UUID: e9c4f876e89c11f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=exKlNRmtebgz3FEm0AsqW4woOpm4WOmnacAhNf3jxOo=;
	b=rcQpPtozmh2qkWa7d24yMRyk0cm0CM07KFQ4QGiAzymINV1Fua9MXNHa867SU6eramYA3jnXDtboqIPq/MNW2NVe7Y75gnRt23fDSKTh5EMnDqTQIZkZ+JdjT3Cew8VRWkWhmmDpeKSRPpcscXTsxLYL03V/2T48Sdf8VUL9otk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:af61fbb6-4d87-43cc-b0eb-79dc388c5dcd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e3715131-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|51|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e9c4f876e89c11f1b1788b6acf885367-20261125
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 851979609; Wed, 25 Nov 2026 14:53:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:53:24 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:53:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxseXt+apH0uf1ome8U+9q6C+KpCpTluXTaRxusfq5vGG7GkyLCYiYz/aHx6wWAOrPw+mfWQHdTG2SvvUOyRFAVupia5647wXQ8yudPnzH5gUS9mpBalJxd9UlcG9+//FGZcI6OknTcU7Ih/m+dLjwlRvOiXQfcH8WpuuztB/LT7N6MMgZczEjT6d74nszhinxC76dyF8D4gWH2870wDktXpSh0VtUA1nJjRdYLTlFsmPCM8ab706a+ksn8YLIbMjIuFRHnYxhfPdnffIWLchJbTgIB0KuuPrhwUtHKb+dFeDxldjnH5d4Ga/VlAIUynKUHkgOcxQLk0yPUfZAav1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exKlNRmtebgz3FEm0AsqW4woOpm4WOmnacAhNf3jxOo=;
 b=OOLkSlqE+KdmVEgGhbYw7OYc+kI8fvl06VxsE1/fRX0aM6rVab/5YPJ+WRAymeRD/IWuIKpB62xlIZkR3NOug8TZDEEEZUZQNT+Xveilnrlw9Bs8CSl+yjEewTAw0PFTzG5JRThXBNM9lIn/LvEMmRc9O3apifb/x63KECV1NQUNpsycPFCU+9QGPEANHInQj6Dueg/ThypPQHMMNsE+aWbDoS6Q4Jkawg6FFPCFskicECnLVoUdkyU/q/EXJlw0DVZRPyGlXTn1UINPlbX7DOm04Dwk5MknJMDngGTXi50un1vi2CwHLLABJrkwrxp7dc7L7kmaRevzk8LnPpNkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exKlNRmtebgz3FEm0AsqW4woOpm4WOmnacAhNf3jxOo=;
 b=waH6m1z3zxpzFpwR+VhwlxLqhSz17ghKA/LJk+/YAnZONV/YpNR3yR8FQv7Gw97iCm2VWoBjOx29PYKzHKBpxIJrsI91xOiSB9/i9CpY/TVEIbf3xm6pqksUXv1DtUWl1ChXN4rXoM6XwMrouIhRizb2/utvjcNMTKQ2xKbfBlQ=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEZPR03MB6809.apcprd03.prod.outlook.com with HTTP via P2P; Wed, 25 Nov
 2026 06:53:21 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:53:21 +0000
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
Subject: Re: [PATCH v3 3/8] thunderbolt: Make PCIe NHI support opt-in
Thread-Topic: [PATCH v3 3/8] thunderbolt: Make PCIe NHI support opt-in
Thread-Index: AQHdez8QYYsfdiOFMECLvPmtSMfTarc9ZPaAgAD32wA=
Date: Wed, 25 Nov 2026 06:53:21 +0000
Message-ID: <6b07ca9aca59e0e1fd94eef53f2f6fe06c2bc62d.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-4-chunfeng.yun@mediatek.com>
	 <20261124160613.GS229695@black.igk.intel.com>
In-Reply-To: <20261124160613.GS229695@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEZPR03MB6809:EE_
x-ms-publictraffictype: Email
client-request-id: 7d716d5d-becc-4bf5-9641-aff383ff5626
request-id: 8089491c-82b2-4539-dc5d-08df4ac0cb4b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|6133799003|261009223027099003|18002099003|22082099003|261026130827099003|261026121527099003|261022113327099003|56012099006|261028144727099003|261102130727099003|261022105027099003|261021123027099003|261022075727099003|261021135927099003|261021121427099003|261102123227099003|261021130227099003|261022115727099003|10067099003|261026140227099003|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info: oQQ8ZwcxOoEyIKlry5Ej+v+MLC0qfwRZl8mcrNTM5SV2mJy88ZC4ApC29Ip6lgRsAJ8QD9FEe/X26bxGSmq+lX+ALwITqHY1Y/hA+xIN7XzPlQ9coGvvwiuUKrenIPUcwxeknEr+CN4u3zZWiwzejk8nFKQRXCI93O9CNh+3zsgSuK3m9Dp0U3C186iGXfhxDefOv7kdIPmxMCB1GkXSYEK26BgeRajETaG6jtS23tZfZgtf7ew4ySfERxRO/uWOzfH+LEzKX6m4Trj70K2Lz+MvR8I+/u3Q9O6M2CFN3aaXu29Sa0e28zpaE2XqLz5M72hzh1Jj7y+fv6ox3XQBIDOqvSE3ANw72M1vzdPvHSHLTHFT7/slI6AWWDLk4+b61CGBWGhTYhE+z/n3nkOwFBUESzsdufWAj9L5g8/yclT6ZOujrf1HkLrTeH3xIt6kc1Kv5Fe/E7uYu/2BvEjInNnw4nUChdZiWVUy+Tv8VPtAyLK2tKuIsr5Zb8IP8PkJvtIfM1xwwhNLU5AyCWCa0O0fCUr9pP1TRnTzhpUyv4kM1KhjWD9CSo0pjXWB/sarug4zF4TFjEnmy4vHQX+BcUbjf2YiSpSIUYnSiEbR9R3RkpENdhFIlWRuMtzowPk+cpd4uzI6klbxv615sBK/wXY75IF08QTnw92QqY+zMvA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(6133799003)(261009223027099003)(18002099003)(22082099003)(261026130827099003)(261026121527099003)(261022113327099003)(56012099006)(261028144727099003)(261102130727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021135927099003)(261021121427099003)(261102123227099003)(261021130227099003)(261022115727099003)(10067099003)(261026140227099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3UxTWwwZ3grV3plOGZLelhRNjh1Snp3bHgzQVR3WVh2NjVKZ3YxaWtGSmJz?=
 =?utf-8?B?U2RDY2x5WE9UazJSOHMvNHkzUEJZNDhTQmIzcks5enJPeTBvQjVpUk9HT0dV?=
 =?utf-8?B?SzJXcmxNSzNTUmlpVFpySWlWdjZzazYzSk55dEErbEduYjN5ZGpGd1ZUMitl?=
 =?utf-8?B?VTkzME5EQm5CWDlOeHdxUlgxSG1KOVFGK1dQMGpNVVZicWdVOGErNzBqS1pN?=
 =?utf-8?B?eWVoSG5XaWE4UDM1SFArajIvQ1NZdGxNU2xQekxDRVorU1p1bkZyK05URzI0?=
 =?utf-8?B?ZEtybDFPOUt3c05rRzI0ak1sV1hvR2RCM1c5Nm9rNlBMeHZIcUNUMGkyMkZL?=
 =?utf-8?B?bXpzNVRnTGY0OVp0cGhVL2pZV0pIUUVPbFNON0JqN01mZzF4bjJWUjQyRlVZ?=
 =?utf-8?B?WmIwYUQ5VWVab1pScFJ3UHdYUmJNelZEbkpPUlR5bkZtMk5OeG9ycFlueXZo?=
 =?utf-8?B?QnRlN1RFTWpOUDJsUnQzaERUSWMwb3pSWFZqcU1yUEhreXRTQkFxNUNwQTBl?=
 =?utf-8?B?clJTR1h4WjFudTV2RmtvOURWMnUzazA5d0IxS0M4QlFDdGdkYWwxUXhuV0hu?=
 =?utf-8?B?eDFjb25MclczTGZ6Qm51ZUl1ZUZYMEVJbm9CTGY2d3k0SVh6K2hucUxhV1dx?=
 =?utf-8?B?NEdxRlZJOHlVeFhxL215NDdST1BCVk0vNjFrYXdkSWhlQktxWHJGeVVMTDVZ?=
 =?utf-8?B?bzdKUktiU0xLNGxUYjFSOERBSDFJWXRyUUQxV01iUTdqNUVRTktNaUlKZHcx?=
 =?utf-8?B?cDJVVVEvTzhicmpEUnlCTUZaZHovcWRZWjlnL3l1eERhSFN3OEVHVUo4Q0JB?=
 =?utf-8?B?SkVYK0lab0piRFRVdTZadUZkUUErdXFBUFJHd0ZUeFBOeXN5Nm9zWjZCcWhX?=
 =?utf-8?B?Y0E4VnhVWG80ZlFKczdVSFFMamZISHZDZURKQ055VjNuMW4xSnhZTTJKMlZy?=
 =?utf-8?B?VUNGd2k5M3ZpdnJ3VkhRTjFrYnc0OVNmSGZua09tbXYyYWtERytkZFZkOXJX?=
 =?utf-8?B?NlVCV0dhYWlZZ1huR0phUi90WGFUcTNieXkzNzhmUmVicVZxbjVYWDI0TXd3?=
 =?utf-8?B?NGczRFVCTmtxSVZyK2hWM2RlZWFMcGJVemVuTnFNZ1dZYUdIMHNyUFRvaU11?=
 =?utf-8?B?VFpmVVRpNHBYWm1ybFZSRjdMZFVWQjE0RDhPdHd6MnhDNXNEVzRZN0s3elZT?=
 =?utf-8?B?OE9sL2FiaUZFclJHVUZkRUQ5QzhEZXNtZWdZWk1HY1VHcC9ld0FzWW9xZSty?=
 =?utf-8?B?OXlINE5rTjhERjFaT2FXUyt5Y3R0YXM2UkpBaDhMRk81M1JiTUhlNU16RUZj?=
 =?utf-8?B?NkxLL0xSSk81MnlKSXJnQ1FxLzBNSkgyWW5FVDRWTXhiNDZKYWJlS2E2YVpX?=
 =?utf-8?B?R3gyMGpZRkJTRWNxWXFzZitEeVE1SzJJd29IMDlJWFdsclBOSXBPTVh0ZGtL?=
 =?utf-8?B?bTdJRGRmTzhlTGhTUHlCRElud3ZVWndkTWQxNFBydmQ4WDBFVmM2MnJBU1BI?=
 =?utf-8?B?cU94K0dLbG5URE5oTVJPaFBJVE1kbCs3MUNRWWpFTHhJRTRIM3c4dWZEY1Z3?=
 =?utf-8?B?SnVzbEtKK0NvTng2YW9SRTRVS0xVa2hQRTJaT3BuMWJDeGxrclQ2Nk9hZkJ2?=
 =?utf-8?B?N2ttQWI0Ny9yTjcxeDZzV29nUXZ0MkxzeGVCRHhSVmJtQXBqWWoyOUZDVk5l?=
 =?utf-8?B?OUtZNUdiWlY2VHRHak1KcjM4WEZPaGdFRXAvNm9udS9QdUluYmU5Z2VGTW4r?=
 =?utf-8?B?aHN0L1U2WlZzS1k4eXNBbTBSUXY1bmdCVUVJNXpvc3B0NE1kelcvZkJWbXRF?=
 =?utf-8?B?QnFDTlRFK1J5dHpmeGFmbGJKdFJKTWRySnl0SzRsLzF1aGwyYkNoNDZpWnc2?=
 =?utf-8?B?R1RtWllUU0Rra09OUjZlbDNCMlNPU1J0SkVDdWVZOXYxbEZiNlRaZTQ5U1pW?=
 =?utf-8?B?eXVPeXJVRTFQOE9BMldPd0VWcEp0SzNqNFRlQ1MvTDl5WEVmblMzUnVhSkJO?=
 =?utf-8?B?MzFxVVI4anVHV2FnY2tvV2VtSGd3RUlGeWVhNHIwMEFkbU1mQ1loaWRucnUy?=
 =?utf-8?B?L2hZS25FcFl6c2VhZWU2OTl4Mkd6MTVEc2JCVEt4bzlkK2h2NHNBMW96UlZt?=
 =?utf-8?B?RVBhYjlEZmZkeEZOUHJSWmxsZk9mSVlIek9EcTNSNjcwTmk1cFRxbGVKNTMy?=
 =?utf-8?B?UjkzUzJhODNaaTV6Y3Z4NVY1MExFN2FjOUl2RVBaWkg2Kzc1WGlma1gzZVpy?=
 =?utf-8?B?bDk0d2pBRG5JVzFRN2VsOEhVZXQ5dkcrSzZtSCs3UjRXK05iKzljZ01JSGN6?=
 =?utf-8?B?VGc0NDhpemxpaERYa1ljZ1JpZk9KWDlqUWlOSXpLN2VYZXVGL1h4NFVSdGZ0?=
 =?utf-8?Q?hHNVhhkOuvhQCCJA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18D47C051C466D48B46FD268C06BD69B@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: HEfqvfymXAa5SHv7yUzAJPTWdCog+f9EQ25Zk16gKn7EJbsR2uqFXtHc8p6gYzxb92F7gfnaFUUBU9ouAPS+KqpQ5v7EghAAj7ITCl/IVFnYi6NZu1RZum9lrJji31xbB+RoetnNvo2Z0XnI3mn+02nu1Y/CzqO6TcbiDUhZH/ah2Y04pMU6rPU8E0GpqxCrryiQ/1xutelZhc4q8KykSA3hQ0kkJvus1HtGDpsOiPHBgXcX6ff2CGwTOwHPyIswJl1xdCH+j126IOLWDENk0E53IQ/47WzTx5ZJCEaqskx5vrH+dF7ZhL9jIKSKUiRSfv5tqdwyVcoYMTL9SnygZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8089491c-82b2-4539-dc5d-08df4ac0cb4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:53:21.4452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7FfAz/L3ibD42hFgBssIcV/g7bXQw3JAp4T9VodZKGpih9jni99MbHCWNAkPJMPYWceHPkkxtJ2t3lkSDuj48IhbEMZGrSkzoY+L+zTz3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6809
X-MTK: N

T24g5LqMLCAyMDI2LTExLTI0IGF0IDE3OjA2ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIzLCAyMDI2IGF0IDA3OjM2OjUwUE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFs
Y29tbS5jb20+DQo+ID4gDQo+ID4gQ3VycmVudGx5LCB0aGUgVVNCNC9UaHVuZGVyYm9sdCBzdWJz
eXN0ZW0gZGlyZWN0bHkgZGVwZW5kcyBvbiBQQ0ksDQo+ID4gdGlnaHRseSBidW5kbGluZyB0aGUg
Y29yZSBmcmFtZXdvcmsgd2l0aCB0aGUgUENJZS1hdHRhY2hlZCBOYXRpdmUNCj4gPiBIb3N0DQo+
ID4gSW50ZXJmYWNlIChOSEkpIGRyaXZlciAocGNpLmMpIGFuZCB0aGUgSW50ZWwgQ29ubmVjdGlv
biBNYW5hZ2VyDQo+ID4gKGljbS5jKQ0KPiA+IGludG8gYSBzaW5nbGUgbW9kdWxlICh0aHVuZGVy
Ym9sdC5vKS4NCj4gPiANCj4gPiBXaXRoIHN1cHBvcnQgZm9yIHBsYXRmb3JtL1NvQy1hdHRhY2hl
ZCBVU0I0IGhvc3QgY29udHJvbGxlcnMgY29taW5nDQo+ID4gaW4NCj4gPiAoc3VjaCBhcyBvbiBB
Uk02NCBzeXN0ZW1zKSwgdGhlIGNvcmUgVVNCNCBmcmFtZXdvcmsgc2hvdWxkIG5vDQo+ID4gbG9u
Z2VyDQo+ID4gaGF2ZSBhIGhhcmQgZGVwZW5kZW5jeSBvbiBQQ0kuIEZ1cnRoZXJtb3JlLCBlbWJl
ZGRlZCBvciBTb0Mgc3lzdGVtcw0KPiA+IHdpdGhvdXQgUENJZS1hdHRhY2hlZCBob3N0IHJvdXRl
cnMgc2hvdWxkIGJlIGFibGUgdG8gb21pdCBQQ0llIE5ISQ0KPiA+IHN1cHBvcnQgdG8gcmVkdWNl
IGtlcm5lbCBmb290cHJpbnQuDQo+ID4gDQo+ID4gRGVjb3VwbGUgdGhlIFBDSWUgTkhJIGFuZCBJ
Q00gZHJpdmVycyBmcm9tIHRoZSBjb3JlIGZyYW1ld29yazoNCj4gPiANCj4gPiAxLiBLY29uZmln
ICYgTWFrZWZpbGU6DQo+ID4gwqDCoCAtIFJlbW92ZSAiZGVwZW5kcyBvbiBQQ0kiIGZyb20gQ09O
RklHX1VTQjQuDQo+ID4gwqDCoCAtIEludHJvZHVjZSBDT05GSUdfVVNCNF9QQ0kgdG8gYnVpbGQg
UENJZSBOSEkgYW5kIElDTSBzdXBwb3J0IGFzDQo+ID4gwqDCoMKgwqAgYSBzZXBhcmF0ZSBtb2R1
bGUgKHRodW5kZXJib2x0X3BjaS5rbykuDQo+ID4gDQo+ID4gMi4gRHJpdmVyIFJlZ2lzdHJhdGlv
bjoNCj4gPiDCoMKgIC0gTWFrZSB0aGUgY29yZSB0aHVuZGVyYm9sdCBtb2R1bGUgc3RhbmRhbG9u
ZSBieSBjb252ZXJ0aW5nDQo+ID4gwqDCoMKgwqAgdGJfZG9tYWluX2luaXQvZXhpdCgpIHRvIHBv
c3Rjb3JlX2luaXRjYWxsKCkgYW5kDQo+ID4gbW9kdWxlX2V4aXQoKS4NCj4gPiDCoMKgIC0gUmVn
aXN0ZXIgdGhlIFBDSWUgZHJpdmVyIGluIHRodW5kZXJib2x0X3BjaSB2aWENCj4gPiBtb2R1bGVf
cGNpX2RyaXZlcigpLg0KPiA+IA0KPiA+IDMuIENvbm5lY3Rpb24gTWFuYWdlciBTZWxlY3Rpb246
DQo+ID4gwqDCoCAtIEFkZCBhbiBvcHRpb25hbCAuc2VsZWN0X2NtKCkgaG9vayB0byBzdHJ1Y3Qg
dGJfbmhpX29wcyBzbyB0aGF0DQo+ID4gdGhlDQo+ID4gwqDCoMKgwqAgUENJZSBkcml2ZXIgY2Fu
IGludm9rZSBpY21fcHJvYmUoKSBmb3IgbGVnYWN5L2Zpcm13YXJlLUNNDQo+ID4gY29udHJvbGxl
cnMNCj4gPiDCoMKgwqDCoCB3aXRob3V0IGhhcmRjb2RpbmcgSUNNIGNhbGxzIGludG8gdGhlIGNv
cmUgbmhpLmMuDQo+ID4gDQo+ID4gNC4gU3ltYm9sIEV4cG9ydHM6DQo+ID4gwqDCoCAtIEV4cG9y
dCBuZWNlc3NhcnkgQVBJcyByZXF1aXJlZCBieSBwY2kgYW5kIHBsYXRmb3JtIGRyaXZlcnMuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3Mu
cXVhbGNvbW0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcu
eXVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2MzoNCj4gPiBBZGRlZCAnZGVmYXVsdCBV
U0I0JyB0byBDT05GSUdfVVNCNF9QQ0kgaW4gS2NvbmZpZzsNCj4gPiBFeHBvcnRlZCB0Yl94ZG9t
YWluX3JlbW92ZSBzeW1ib2wgaW1tZWRpYXRlbHkgYWZ0ZXIgaXRzIGRlZmluaXRpb247DQo+ID4g
DQo+ID4gdjI6DQo+ID4gY2hlcnJ5LXBpY2sgdGhlIHBhdGNoIG9mIEtvbnJhZCB0byBmaXggdGhl
IGlzc3VlcyBvZiB0aGlzIHNlcmllcywNCj4gPiBhbmQNCj4gPiBhbHNvIGRvIHNvbWUgY2hhbmdl
czoNCj4gPiANCj4gPiAqIFJlbmFtZWQgQ09ORklHX1VTQjRfUENJRSBhbmQgdGh1bmRlcmJvbHRf
cGNpZS5rbyB0bw0KPiA+IENPTkZJR19VU0I0X1BDSQ0KPiA+IMKgIGFuZCB0aHVuZGVyYm9sdF9w
Y2kua28uDQo+ID4gKiBVcGRhdGVkIGV4cG9ydGVkIE5ISSBzeW1ib2xzIHRvIHN0YW5kYXJkIHRi
XyAvIHRiX3JpbmdfIHByZWZpeGVzDQo+ID4gwqAgKGUuZy4sIHJpbmdfbXNpeCDihpIgdGJfcmlu
Z19tc2l4LCBuaGlfbXNpIOKGkiB0Yl9uaGlfaXNyKS4NCj4gPiAqIEVsaW1pbmF0ZWQgZXhwb3J0
cyBmb3IgbmhpX21haWxib3hfKiBhbmQgbmhpX2ludGVycnVwdF93b3JrIGJ5DQo+ID4gwqAga2Vl
cGluZyB0aGVtIGludGVybmFsL3N0YXRpYyAoaGFuZGxlZCBieSBwcmVwYXJhdG9yeSBwYXRjaGVz
IGluDQo+ID4gdjIpLg0KPiA+ICogQWRkZWQgbWlzc2luZyB0cmFpbGluZyBzZW1pY29sb24gdG8N
Cj4gPiBtb2R1bGVfcGNpX2RyaXZlcihuaGlfZHJpdmVyKTsuDQo+ID4gKiBFeHBhbmRlZCB0aGUg
Y29tbWl0IG1lc3NhZ2U7DQo+ID4gKiBGaXggY2hlcnJ5LXBpY2sgY29uZmxpY3QgY2F1c2VkIGJ5
IC5yZXNldF9pbnRlcmZhY2UoKTsNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQv
S2NvbmZpZ8KgwqAgfCAxMiArKysrKysrKysrLQ0KPiA+IMKgZHJpdmVycy90aHVuZGVyYm9sdC9N
YWtlZmlsZcKgIHzCoCA3ICsrKysrLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQvY3RsLmPC
oMKgwqDCoCB8wqAgNiArKysrKy0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQvZG9tYWluLmPC
oCB8IDE0ICsrKysrKysrKysrLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQvbmhpLmPCoMKg
wqDCoCB8IDE0ICsrKysrKy0tLS0tLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQvbmhpLmjC
oMKgwqDCoCB8wqAgMiArKw0KPiA+IMKgZHJpdmVycy90aHVuZGVyYm9sdC9wY2kuY8KgwqDCoMKg
IHwgMzkgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0NCj4gPiDCoGRy
aXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmPCoCB8wqAgOSArKysrKysrKw0KPiA+IMKgZHJpdmVy
cy90aHVuZGVyYm9sdC90Yi5owqDCoMKgwqDCoCB8wqAgMiAtLQ0KPiA+IMKgZHJpdmVycy90aHVu
ZGVyYm9sdC90dW5uZWwuY8KgIHzCoCAxICsNCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJvbHQveGRv
bWFpbi5jIHzCoCA1ICsrKysrDQo+ID4gwqAxMSBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25z
KCspLCA0MCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aHVu
ZGVyYm9sdC9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3RodW5kZXJib2x0L0tjb25maWcNCj4gPiBp
bmRleCAyOTRiMzIyN2E1NDUuLjgwOTYwNTU1YTM2NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3RodW5kZXJib2x0L0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L0tjb25m
aWcNCj4gPiBAQCAtMSw3ICsxLDYgQEANCj4gPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQ0KPiA+IMKgbWVudWNvbmZpZyBVU0I0DQo+ID4gwqAJdHJpc3RhdGUgIlVu
aWZpZWQgc3VwcG9ydCBmb3IgVVNCNCBhbmQgVGh1bmRlcmJvbHQiDQo+ID4gLQlkZXBlbmRzIG9u
IFBDSQ0KPiA+IMKgCXNlbGVjdCBBUFBMRV9QUk9QRVJUSUVTIGlmIEVGSV9TVFVCICYmIFg4Ng0K
PiA+IMKgCXNlbGVjdCBDUkMzMg0KPiA+IMKgCXNlbGVjdCBDUllQVE9fTElCX1NIQTI1Ng0KPiA+
IEBAIC0xOCw2ICsxNywxNyBAQCBtZW51Y29uZmlnIFVTQjQNCj4gPiDCoA0KPiA+IMKgaWYgVVNC
NA0KPiA+IMKgDQo+ID4gK2NvbmZpZyBVU0I0X1BDSQ0KPiA+ICsJdHJpc3RhdGUgIlN1cHBvcnQg
Zm9yIFBDSWUtYXR0YWNoZWQgVVNCNCBhbmQgVGh1bmRlcmJvbHQNCj4gPiBjb250cm9sbGVycyIN
Cj4gPiArCWRlcGVuZHMgb24gUENJDQo+ID4gKwlkZWZhdWx0IFVTQjQNCj4gPiArCWhlbHANCj4g
PiArCcKgIFNheSBZIGhlcmUgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBVU0I0IGFuZCBUaHVuZGVy
Ym9sdA0KPiA+IGhvc3QNCj4gPiArCcKgIHJvdXRlcnMgYXR0YWNoZWQgb3ZlciB0aGUgUENJZSBi
dXMsIGNvbW1vbmx5IGZvdW5kIG9uDQo+ID4geDg2IFBDcy4NCj4gPiArDQo+ID4gKwnCoCBUbyBj
b21waWxlIHRoaXMgZHJpdmVyIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlLiBUaGUNCj4gPiBtb2R1
bGUgd2lsbCBiZQ0KPiA+ICsJwqAgY2FsbGVkIHRodW5kZXJib2x0X3BjaS4NCj4gPiArDQo+ID4g
wqBjb25maWcgVVNCNF9DT05GSUdGUw0KPiA+IMKgCWRlZl90cmlzdGF0ZSBVU0I0DQo+ID4gwqAJ
ZGVwZW5kcyBvbiBDT05GSUdGU19GUyAmJiAhKFVTQjQ9eSAmJiBDT05GSUdGU19GUz1tKQ0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L01ha2VmaWxlDQo+ID4gYi9kcml2ZXJz
L3RodW5kZXJib2x0L01ha2VmaWxlDQo+ID4gaW5kZXggYmViMDU0YzMxMjZiLi5hNTYzYmYyYjAz
NDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy90aHVuZGVyYm9sdC9NYWtlZmlsZQ0KPiA+ICsr
KyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvTWFrZWZpbGUNCj4gPiBAQCAtMSwxMCArMSwxMyBAQA0K
PiA+IMKgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gwqBjY2Zs
YWdzLXkgOj0gLUkkKHNyYykNCj4gPiDCoG9iai0ke0NPTkZJR19VU0I0fSA6PSB0aHVuZGVyYm9s
dC5vDQo+ID4gLXRodW5kZXJib2x0LW9ianMgOj0gbmhpLm8gY3RsLm8gdGIubyBzd2l0Y2gubyBj
YXAubyBwY2kubyBwYXRoLm8NCj4gPiB0dW5uZWwubyBlZXByb20ubw0KPiA+IC10aHVuZGVyYm9s
dC1vYmpzICs9IGRvbWFpbi5vIGRtYV9wb3J0Lm8gaWNtLm8gcHJvcGVydHkubyB4ZG9tYWluLm8N
Cj4gPiBsYy5vIHRtdS5vIHVzYjQubw0KPiA+ICt0aHVuZGVyYm9sdC1vYmpzIDo9IG5oaS5vIGN0
bC5vIHRiLm8gc3dpdGNoLm8gY2FwLm8gcGF0aC5vDQo+ID4gdHVubmVsLm8gZWVwcm9tLm8NCj4g
PiArdGh1bmRlcmJvbHQtb2JqcyArPSBkb21haW4ubyBkbWFfcG9ydC5vIHByb3BlcnR5Lm8geGRv
bWFpbi5vIGxjLm8NCj4gPiB0bXUubyB1c2I0Lm8NCj4gPiDCoHRodW5kZXJib2x0LW9ianMgKz0g
dXNiNF9wb3J0Lm8gbnZtLm8gcmV0aW1lci5vIHF1aXJrcy5vIGNseC5vDQo+ID4gwqANCj4gPiAr
b2JqLSR7Q09ORklHX1VTQjRfUENJfSArPSB0aHVuZGVyYm9sdF9wY2kubw0KPiA+ICt0aHVuZGVy
Ym9sdF9wY2kteSA6PSBwY2kubyBpY20ubw0KPiA+ICsNCj4gPiDCoHRodW5kZXJib2x0LSR7Q09O
RklHX0FDUEl9ICs9IGFjcGkubw0KPiA+IMKgdGh1bmRlcmJvbHQtJChDT05GSUdfREVCVUdfRlMp
ICs9IGRlYnVnZnMubw0KPiA+IMKgdGh1bmRlcmJvbHQtJChDT05GSUdfVVNCNF9DT05GSUdGUykg
Kz0gY29uZmlnZnMubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L2N0bC5j
IGIvZHJpdmVycy90aHVuZGVyYm9sdC9jdGwuYw0KPiA+IGluZGV4IDk2NTk4OGIxODYwOC4uOTY3
MTdhMGE5NGIxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvY3RsLmMNCj4g
PiArKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L2N0bC5jDQo+ID4gQEAgLTksNyArOSw2IEBADQo+
ID4gwqAjaW5jbHVkZSA8bGludXgvY3JjMzIuaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9kZWxh
eS5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiAtI2luY2x1ZGUgPGxpbnV4
L3BjaS5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2RtYXBvb2wuaD4NCj4gPiDCoCNpbmNsdWRl
IDxsaW51eC93b3JrcXVldWUuaD4NCj4gPiDCoA0KPiA+IEBAIC05Niw2ICs5NSw3IEBAIHN0cnVj
dCB0Yl9jZmdfcmVxdWVzdCAqdGJfY2ZnX3JlcXVlc3RfYWxsb2Modm9pZCkNCj4gPiDCoA0KPiA+
IMKgCXJldHVybiByZXE7DQo+ID4gwqB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHRiX2NmZ19y
ZXF1ZXN0X2FsbG9jKTsNCj4gDQo+IFdoeSB0aGVzZSBuZWVkIHRvIGJlIGV4cG9ydGVkPyBBbGwg
dGhlIGNvbmZpZyBzdHVmZiBoYXBwZW5zIGluc2lkZQ0KPiBVU0I0DQo+IGZhYnJpYyBhbmQgdGhh
dCdzIG5vdCBkZXBlbmRlbnQgb24gaG93IHRoZSBjb250cm9sbGVyIGlzIGNvbm5lY3RlZCB0bw0K
PiB0aGUNCj4gU29DLg0KTXkgYmFkLCB3aWxsIHJlbW92ZSBpdC4NCj4gDQo+IENhbiB3ZSBnZXQg
dGhlIGFic29sdXRlIG1pbmltdW0gdGhhdCBpcyBuZWVkZWQ/wqANClN1cmUsIHdpbGwgZG91Ymxl
IGNoZWNrIGFsbCB0aGUgZXhwb3J0cy4NCg0KVGhhbmtzDQo+IFRoZSBwbGF0Zm9ybS9QQ0kgc2lk
ZXMgcHJldHR5DQo+IG11Y2ggbmVlZCB0byBnZXQgdGhlIHJlc291cmNlcy9pbnRlcnJ1cHRzIGFu
ZCB0aGVuIGNhbGwgdGhlIGNvcmUNCj4gZHJpdmVyLg0KDQo=
