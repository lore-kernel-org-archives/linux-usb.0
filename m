Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589031;
	b=ypF4pE4KJE7ZlUqmeNwRtOWdrtg6/6BUvHJHcjVrJiNQsCq1Nj9QV6qo7mmw30wXbBnj
	 F13rtVxc7iKVFJBIyG8a8IwsXMPCmTXs3Yx6Vc8rGtvKEWI+1WOPNh+gfkbYYgOQtly/t
	 cTwlO6nGoUaXk9PxyCZN2rbc9QfQOOMSi0TcEzKxG/AaZkrKkOowdvTteXig71slvxt6A
	 QJW7MenD6mZbCRU80xUxx5NIUgd/OY6Zn14fxPvuhYcMQEIpaf+7DRyuwsS2JY75jEulm
	 mJDKWd+bWyEIZPXb13V2ETc88IIaNW7fLLqXlnAnRkuZpVd8U5FMAmdBxLqlBxeG+sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589031;
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
	bh=LR9dnquwtBTdCI3PK4q6D3IOZo5HGKTCZlMN/ftj3O0=;
	b=hDBUMTQRBRVsUEjm1qz+3OlSzRORSH9V1v4QDayhe4q/Ezol0xaK8Jqf/+5AwNaTcOPD
	 tCmUjYzGqMNedNe1zuk7Jd5Vix+cDk5h+gmDZP3uFH40FV145ebvgwc79e2R9lQS2a5J3
	 4NA3lkCHX9T7vIFiGWIJTrOSBZ0+L+gebmFkS+ldaJXzQyvnXvEZEq/IpTR4hbnNeVfBP
	 nLEgQP7yOF0vH/DnOetfvhC9+T91pqLHjv1HBRHxOZru6L8lk7yRtyWh/ZoCjhR9f3xIj
	 RJKYlVxq6RA9aSw+M/KmDLIXN681n0tIuNiflGt84gQ3c5WzU8h/9JehKGfroJ5ahhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ni9al08a;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=FsDL6x3i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308C606A31E;
	Wed, 25 Nov 2026 06:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7308C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ni9al08a;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=FsDL6x3i
X-UUID: 8effdb78e89b11f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LR9dnquwtBTdCI3PK4q6D3IOZo5HGKTCZlMN/ftj3O0=;
	b=Ni9al08aATnPu6Ujb5gjuRw+bNBrq/GeA54WcPOCoQLrejYpFUFNU2BYzlSm/k8vN/g4oqfcKb+17wnawHTEPa9/l1uJV8zKzq3tTyTTqtXtpHyFtrOYQcoPJz9z27yDYYsAZ5ObqD81YvVbhuvtmEcarTpTnbFxM7dVG1utOLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1b85b682-2876-408d-a49e-c06c7147c552,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:8801091a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8effdb78e89b11f1b1788b6acf885367-20261125
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1693704073; Wed, 25 Nov 2026 14:43:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:43:43 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:43:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyxDL3UN27r5rQuO9N5bSyvtN8bJ7FfJBy7c6FWPYx2X0MUjkZ3Dimwx76e3nSe4XnkavZabeLnZ+lPiz5klz4l8zLT8CRdt0b5++RX7i9ruAUKYTDMsg1KWHibb0wTCDocFsLYEwi2mGNUKtQZuiWv8Aid/RI1p/ZfI7CkYXgo9c1g1N8EzE0b4Yd4nPvWnCAqo7rHhtFEM4TTDtlrc2YxV/mACSflNZzKs5N8kP37W/l6ZuCGF8y0twvrQLRFnOqO/wj1UP9hUiQESuMq6xkMFkRZ/Nk+JPPfShBBND3eFigIVSLYnSFt9QJkXdjz+W1xlKu2DsRCxxGft4QiM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR9dnquwtBTdCI3PK4q6D3IOZo5HGKTCZlMN/ftj3O0=;
 b=pTCnYpneDBYUZ3NUrKSL05Iqve4Yidbg/3oMjU7XBafDQGiBwHCy/aefHezk73q0GZQC1zi0jlkRGprPF5t1Q24qYpISuOLuLP0otSGSyW8EkI6+cViCZD66PianFkYsJp52aVrHP1MUfdY2wMJoGbqx5oBUgYXhkWyZOiQT7CAODfsaiCtd2bmpzuI4rVE8q6NeD/8hNCQ0TxyYB5scycWl0owWyeJtpZZoqTUQn3yLmI5kik3+fMRB1TqiU+q+1IU0QQVMN/1unnGtxoPtH5c3ZOAvlSaKenpeWWQJuEfRX4jJy+QjpPgv3pvrmUkPt1wRFFaZFI5QpiLGKAzNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR9dnquwtBTdCI3PK4q6D3IOZo5HGKTCZlMN/ftj3O0=;
 b=FsDL6x3iocUFlaEmNjU+qTbVzzykSgfy4ch1BhisEBYBquzQTjhEGLXg9Zv6l6dDzLvc0tX0zqLYRe59JrKB1XUSiLFpWUQnwb9Du8PxvVutueoOshUXYVrCtzz9zlC0+DXpNyLMujgHmKzY/vwEOHWJDF8ElEkoTVbC9+Y2mY8=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEZPR03MB8016.apcprd03.prod.outlook.com with HTTP via P2P; Wed, 25 Nov
 2026 06:43:39 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:43:39 +0000
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
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Topic: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Thread-Index: AQHdez8Xc5+nR59GnEuIPvdl9swLYrc9ZpKAgADziIA=
Date: Wed, 25 Nov 2026 06:43:38 +0000
Message-ID: <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
	 <20261124161159.GT229695@black.igk.intel.com>
In-Reply-To: <20261124161159.GT229695@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEZPR03MB8016:EE_
x-ms-publictraffictype: Email
client-request-id: 13905fee-38f2-4a1d-9c9f-72ce941d2073
request-id: 5d1f8bbd-8d60-45b6-9217-08df4abf701b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|261102123227099003|261102130727099003|261026121527099003|261022075727099003|261021121427099003|10067099003;
x-microsoft-antispam-message-info: 0scUwkDYVmYcd+XIMlUaTdpv8fcciBUZ4zjNYYMFno8xZQobVZ3HTl7tPXYJuxXPWS5NzrMEvBcHS6mtr0EEvYWeZO1dTayAEv02KswTHt9TCFSotziiO7KPiSspCQW0GirSJ6eQejk517mdL+sE9Art3fAI9cYKOwZtXd+h8eAxzZdpQJgN/JFtEd4iZKw8Lq5AC/bnKRtnM89/ZKwj2RtnRsbou7svRWE+dKKZ0ZMyXTIFrL1vcLQ4honSvdw4ZMWP3Swbs/MJI65rNQz8tRKiT52246ngQh3GCpv2nxokH/eJSg318+3ey2TGvyf1y8ASNh495zwRCuxeDGjuoRWE+FgsONLyIcUuvpU2KpBnelKlarr5KOqacFICEWTfmHGCjtmwFsdEdBTyTLtLOvnK15N9ZKHeE6VU0hwlsav3R0iRa60UvNkcOvs/n0qbT5dnp6HknIfIH3j3zH1io81mcvHQhrxj6LwzT9x2qn+goQFkmHODG1PRzHExYn8/S3vVqJdjpTSrjxZFe717PSC+2Hbq8vOcjm/wk9Ms90ojYIBM+BFMjluNpP1v9cNzcnUIM4NNBbXButFSaOwCPKTS9mU6aP877c9dRArfGV+oN6J3JUI9BhcmaxJLV3EBIZZtBi4ZFy7PXNBd5E46MnfHBxOtMMSxLavEDsJSXyU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFJSSmYwbXJiYmhOMno5NmJDYXkzbGU4SGh0bmx4UU1JQUM1d3ZUaXlJWlFx?=
 =?utf-8?B?QW5ITGlyV2gvYzdJR003UGNYTkV0R1FEYk5TTnBlbjZkZFBXUjMzR3NSRUNB?=
 =?utf-8?B?NWx2WFByWmI4SllacWdpYnVrS3lvR3ZvbWlIRE1DRU54UEFYdU8xQjZ5b1Bo?=
 =?utf-8?B?SzN2WjQzZU5aU0hzQkcybHlZR2M1K1pMUGUxbkdsck5lWURQZlZnYUs0anJQ?=
 =?utf-8?B?dGQ4TDJBcXdLSHByVjRPM1Z2NFRIMkQ5TC9YeGZabWhiQktIQkt0UzV1NWJG?=
 =?utf-8?B?YnVNNGFqS0ZBbEdzemZXdWNEMG9VUkRKSXd3ZE9PcFlhQWRITGdPRGVaNmxS?=
 =?utf-8?B?WlRZNStJeTdzTElGOTIvbUFkcVo4dDNtUEdvbTdFN1RSRXBoVEZnNXRnVFR0?=
 =?utf-8?B?M0JuTWFpbnp1d2EyUU1TMkVDUVNqcW93WVhHdmJRQVkwZDJEZUo3VHF6dTdB?=
 =?utf-8?B?QVdMdk9GeHJ6M1U0b1Bab0dJOCtzTEYrMWI5eE5lNUg3djlhUVJZbVoyY2hW?=
 =?utf-8?B?T0E2NjRpUjJIVkRaSmpvbGMrZWFsNmJFb2x0M3BuVFJ6NUllQktTMC9xbEsy?=
 =?utf-8?B?OTRJS1Brak5RNW9EK0YxRTI1Q0ZKejR6UmhRV2Q4cVJrNlRyUzV0RjdLMUJH?=
 =?utf-8?B?aGZYMW9VQkdoNHdCWmFFR2VGcjA3QjdhTEdNeEtrVXYzcWVzS2w4SXg4N0J1?=
 =?utf-8?B?aUNVNjF4VGMrVlViNER4eThwbUdGWUNjSm5laklPSVRjME1BR1hMQzlodExw?=
 =?utf-8?B?enFhK0xQaHkwckFwUGZ6dkFKcTBtNUVySHFnR0QxRTZCNFl3REJxSDlYc0V5?=
 =?utf-8?B?MEFUak5NWkQvYk8rNmVmY1cwUU1KRnh6OThjWHhJV0duZGpwdlFyalpjaVRi?=
 =?utf-8?B?Wkp3aGMzZDZwRUdwQWNreTlmODJTQ0Z5MHR1M3p5UWQxTnpKYVlDUFhvRUNx?=
 =?utf-8?B?Nzg5YVhlZGNLZzJRTERodlNPVkpWUFVDeHRvRlhHQzZ3Q0ZucXg5MGR5d0lU?=
 =?utf-8?B?MWFUR3Y3bTM2L0RFZXg1R0ZqMVBwNkttWk1DRkZnbUhiY3ozeFIrQmRIVHJD?=
 =?utf-8?B?eklOZWYrV01BMGQ0L09JTXJZUkFQZGZzNzFqZHNNUVh3KzM2dDhyZVo0UEZs?=
 =?utf-8?B?QVVjZk94Vkljb3dwZ0ZmSG45bGlITFROUEFJQlk1b0hZNEwzV2NXSThYaXp0?=
 =?utf-8?B?YTRlcWV1dURvdkFIVUo4RnhWL3hkQUlVRG1qM04vYW10ZzJXRnhLczBwdFBh?=
 =?utf-8?B?c3FtbllMRy9IZnZjY2xuQkxHdzhNK2dpSDdXQUEyWDhwYjc2b2RsVDhyMFAr?=
 =?utf-8?B?QW5TaG5vTjM4SU5RaEVxOGdPOC84RnRaMkszcHEwZ2NpcWpIdE5OVFQ3MjJ5?=
 =?utf-8?B?cXdnT1YySjl5QjllMmZLbFpiSmk2YnhQZFdNcjh6a2dSS3ZtcFZ2NUxaWFlL?=
 =?utf-8?B?TmdZY0F3RTNTRmVqREk1eDVtUDVCOXBmV1NiVWFpZmZYSjlqcWM3bVRhQkZw?=
 =?utf-8?B?NDloQ2FsbzZUV0N0cUdhVmViS0IvOVNiVU5VSlVrVVlFMjNuMHhGWmpvOTdq?=
 =?utf-8?B?Z1VaSFFnYjVQQmVYMlNMNWhKdC9XREwwV1dhTU14TkkwbzhIRTVSSVhVeGg1?=
 =?utf-8?B?dzFJQVpEdUpGWlZVUWcrMklGUjlxMGR3SGVvTU5wb2J3ZFA0QXBNMHN4eWRl?=
 =?utf-8?B?SURwNG8wdzFTMWtRYTVZOW1ma3NUaFAySEZtdlNacjB4Zk1rZkJOSTV1L3Rv?=
 =?utf-8?B?YjVmdTBQU3FKaGxnYUU3bm9abDFvamtNeGt3UnRIMlJMZnVPMU9hamxZSFcx?=
 =?utf-8?B?RzdCejFjY3p3Rnl4dWxLdGowZUNXdGtiNzJlRUZqSWVGRExpN09McVpUR0xY?=
 =?utf-8?B?dDNEQ3JaeS8wTWxteFBZYlhsWkxObXFBbkpIYnBkd3dJVVJpMXFpQk9WamFp?=
 =?utf-8?B?RFRDYnpYOG5qY2s2V3E5OUJ3cklkY1MwRXJlV3pPQXhuNDRnUmFBWnE4STJE?=
 =?utf-8?B?ZkYxd21nWERlZzVVcm9adzhHZ2R0dk5NOEJEeVVEOEFycndvc2Z6ZXN1c1py?=
 =?utf-8?B?ZXNpUTlYZk9WL1d4VExZcjl0N2kzTkxwODhwK3NrWmFEQkRTZUNjNXp3SkYr?=
 =?utf-8?B?OVNtMXRUZDFVMTJOSmZRbEk4YkJjbUdJeEJLd1NiNnV5QTExeUR6TDIxMExY?=
 =?utf-8?B?UllyMkZtNko4a0VHY1ZBdzJFeUNIOTlJM2VoNUF3dFYyWDF4SldqSjdYOC9I?=
 =?utf-8?B?Qnl2MGt2a0VVdmFydG8yelBKSUttejdxWWVaYWtWWlpyamU0d24rNDVtQlEr?=
 =?utf-8?B?aTZwL1VhQi9GRlJFODRkb3paemxNTEpneUFNZTFmdThMNVdYTEZZeFRPM29V?=
 =?utf-8?Q?nb4JVua+YctCbBxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AD5C296515C7C4AA3358CE44B29FB98@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: cJlqppX3aI1gO4rh+qBewL3GH3rynnnPvLv+/VmWvO15kYpkDtYwlUseXCOdiktqkFEhxlP1/M6AG3NqD6cyGDnt2xdT9BJewfkgzplMconz6Kz97fzNGK6XQ/YNkOx5hKwjPIKNOSYWLTocghNXHOSrLvt+FZKZJF5dUtuOl4zqQk6yKbNz1CGqJqjlPSJ/BoD/86fnD1ueDfOBARhkTpuUVTvWkoV41djvIPQTjBnJbidKJg5/g7Gwci+0a4fVt+bVcpgmIWf+GLokeHkmWclwy16zVV/0dvEnMCxYYq80VVZMXvre5hGqbRlo/u4rdCqQCdolTcsCLZFBmWChoA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1f8bbd-8d60-45b6-9217-08df4abf701b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:43:38.9777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fnc1vtsyXv8zOAGGK4+x2JrNVDjeEKtiqH8keYbIR0/kDW/hFhj8kJ59DODxLHH7twgj9Ahs0ge1FV0O2rlnE/fVuBjW6uV/pckA6K5ButQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8016
X-MTK: N

T24g5LqMLCAyMDI2LTExLTI0IGF0IDE3OjExICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIzLCAyMDI2IGF0IDA3OjM2OjQ4UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgbW9kdWxhcml6aW5nIFBDSWUgTkhJIHN1
cHBvcnQgYW5kIGFsbG93aW5nIFBDSWUNCj4gPiBhbmQgcGxhdGZvcm0gTkhJIGRyaXZlcnMgdG8g
YmUgYnVpbHQgYXMgc2VwYXJhdGUgbW9kdWxlcyBhdG9wIHRoZQ0KPiA+IFRodW5kZXJib2x0IGNv
cmUgZnJhbWV3b3JrLCBzZXZlcmFsIE5ISSBmdW5jdGlvbnMgYW5kIHN0cnVjdHVyZXMNCj4gPiB3
aWxsDQo+ID4gbmVlZCB0byBiZSBleHBvcnRlZC4NCj4gPiANCj4gPiBDdXJyZW50bHksIHNldmVy
YWwgb2YgdGhlc2UgZnVuY3Rpb25zIGxhY2sgc3RhbmRhcmQgc3Vic3lzdGVtDQo+ID4gcHJlZml4
ZXMsDQo+ID4gcmlza2luZyBuYW1lc3BhY2UgcG9sbHV0aW9uIG9yIGNvbGxpc2lvbnMgYWNyb3Nz
IHRoZSBmbGF0IGtlcm5lbA0KPiA+IHN5bWJvbA0KPiA+IG5hbWVzcGFjZToNCj4gPiANCj4gPiAt
IHJpbmdfbXNpeCgpIGxhY2tzIGFueSBzdWJzeXN0ZW0gcHJlZml4IGFuZCBkaXZlcmdlcyBmcm9t
IGFsbA0KPiA+IG90aGVyDQo+ID4gwqAgZXhwb3J0ZWQgcmluZyBmdW5jdGlvbnMgaW4gdGhlIGRy
aXZlciwgd2hpY2ggdXNlIHRoZSAidGJfcmluZ18iDQo+ID4gcHJlZml4Lg0KPiA+IC0gbmhpX3By
b2JlKCksIG5oaV9zaHV0ZG93bigpLCBhbmQgbmhpX3BtX29wcyBsYWNrIHRoZSBzdGFuZGFyZA0K
PiA+ICJ0Yl8iDQo+ID4gwqAgcHJlZml4IHVzZWQgYWNyb3NzIHRoZSBUaHVuZGVyYm9sdCBwdWJs
aWMgaW50ZXJmYWNlIChzdWNoIGFzDQo+ID4gc3RydWN0DQo+ID4gwqAgdGJfbmhpIGFuZCBzdHJ1
Y3QgdGJfbmhpX29wcykuDQo+ID4gLSBuaGlfbXNpKCkgaXMgbmFtZWQgYWZ0ZXIgUENJIE1TSSwg
ZXZlbiB0aG91Z2ggdGhlIElTUiBzaW1wbHkNCj4gPiBzY2hlZHVsZXMNCj4gPiDCoCB0aGUgaW50
ZXJydXB0IHdvcmsgYW5kIGNhbiBzZXJ2ZSBhcyBhIGdlbmVyaWMgSVNSIGZvciBub24tUENJZQ0K
PiA+IHBsYXRmb3JtDQo+ID4gwqAgY29udHJvbGxlcnMgYXMgd2VsbC4NCj4gPiANCj4gPiBSZW5h
bWUgdGhlc2UgZnVuY3Rpb25zIGFuZCBzeW1ib2xzIHRvIGNvbmZvcm0gdG8gVGh1bmRlcmJvbHQN
Cj4gPiBzdWJzeXN0ZW0NCj4gPiBuYW1pbmcgY29udmVudGlvbnMgYmVmb3JlIGV4cG9ydGluZyB0
aGVtOg0KPiA+IA0KPiA+IC0gcmluZ19tc2l4wqDCoMKgwqDCoMKgIC0+IHRiX3JpbmdfbXNpeA0K
PiANCj4gSSB0aGluayB3ZSBjYW4gbW92ZSBNU0ktWCBjb21wbGV0ZWx5IHRvIHBjaS5jLiBBcyBm
YXIgYXMgSSBjYW4gdGVsbA0KPiBBUk0NCj4gc3R1ZmYgaXMgbm90IGdvaW5nIHRvIG5lZWQgdGhh
dC4gV2hpbGUgdGhlcmUgd2UgY2FuIGRyb3AgTVNJLCB0aGF0DQo+IGhhcyBiZWVuDQo+IG5ldmVy
IHVzZWQgKE1TSS1YIHdhcyBzdXBwb3J0ZWQgZnJvbSBkYXkgMCBieSB0aGUgSFcpLg0KSWYgbW92
ZSBNU0ktWCBjb21wbGV0ZWx5IHRvIHBjaS5jLCB0aGVuIHdpbGwgcmVuYW1lIGFuZCBleHBvcnQg
YW5vdGhlcg0KdHdvIGZ1bmN0aW9uczoNCl9fcmluZ19pbnRlcnJ1cHQoKQ0KcmluZ19pbnRlcnJ1
cHRfaW5kZXgoKQ0KDQppcyBpdCBmaW5lIGZvciB5b3U/DQoNCj4gDQo+IFRoZW4gSSB3b3VsZCBq
dXN0IG1ha2UgdGhlIGdsdWUgZHJpdmVyIHRvIHBhc3MgLT5pcnEgdG8gdGhlIGNvcmUNCj4gZHJp
dmVyIGFuZA0KPiBpZiB0aGF0J3Mgc2V0IGl0IGRvZXMgdGhlIHJlcXVlc3RfaXJxKCkgYW5kIHNv
IG9uLiBBbmQgUENJIHNpZGUgZG9lcw0KPiBub3QNCj4gZmlsbCB0aGF0IGJlY2F1c2UgaXQgdXNl
cyBNU0lYIGFsd2F5cy4gVGhlbiB3ZSBkb24ndCBuZWVkIHRvIGV4cG9ydA0KPiB0aGUNCj4gaW50
ZXJydXB0IGhhbmRsZXIgZnVuY3Rpb25zIGVpdGhlci4NClN1cmUuDQoNClRoYW5rcw0KPiANCj4g
PiAtIG5oaV9tc2nCoMKgwqDCoMKgwqDCoMKgIC0+IHRiX25oaV9pc3INCj4gDQo+IA0KPiA+IC0g
bmhpX3Byb2JlwqDCoMKgwqDCoMKgIC0+IHRiX25oaV9wcm9iZQ0KPiA+IC0gbmhpX3NodXRkb3du
wqDCoMKgIC0+IHRiX25oaV9zaHV0ZG93bg0KPiA+IC0gbmhpX3BtX29wc8KgwqDCoMKgwqAgLT4g
dGJfbmhpX3BtX29wcw0KPiANCj4gVGhlc2UgYXJlIGdvb2QuDQoNCg==
