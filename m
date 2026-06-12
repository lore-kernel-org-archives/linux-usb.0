Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013051.outbound.protection.outlook.com [40.107.44.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CFC2E2EF9;
	Fri, 12 Jun 2026 02:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230483; cv=fail; b=uKyURkQd9hUkxFQIawK61EC8M5gUR9ARpV/hL4x063DUqPweKbYkuuO7mmY7gjJkt/rjIC1/RHfdgzPWIPjFAF9xLkKTmGpxkJ4hB5B24Ai4p2cohv6OL2yHRcorlRdQpKn0SdbBLZqvqFhhvPegZ0FqCJM6cYUWUaIdXQvZH/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230483; c=relaxed/simple;
	bh=RqpF/rBfSiZgOBOJUvdJ4vb8+zz/CFbbkxggmPo4cQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n1HZjPyZoyjtgs2lowmn4CIFGxdSzzFS3WZlGPtIT0G9642QHoQ4JqTRNapKuXqPy2b9QzgqTq1L9Eqx4qQVL9dNNSyjVxZkNteNx1FJzY2YtLllnfrFrcs7bMWIJRTjQg4ZFuk3Njm84FUceqz0BpjFFV9Tag54ZmZlJIbYBug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Wl23i1/x; arc=fail smtp.client-ip=40.107.44.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Wl23i1/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adWBNucMXumOBqghZmMQsw5nHgV39oWbZB1ws+AHA684nNqe75Olke40tFaQeA8Y4v2GxQje/3HU31SqCl6Msuu5KtyTtn9fKc4LxQY874T+egU7AqSJSgTiczaZ1iREC5o4KyRcidbVZU47vzDZT8yRgFHGSzj4CJF2V60imrHgtzdk+dFeUyEPUCKjaiLuZBlh0aYwFwkmqc+TEUDDRBFzprMCxoPXj0q4lHBnerVuDKLQ6cDIMXjrnQ3HLenhDc/tBmDjJvBmBojtFr77MSgDNopFdUZrhkJ5tLvlZz0irKANnOpeGU4zxzEnIrjzlJqa06Yv+32XJyDGLcJgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqpF/rBfSiZgOBOJUvdJ4vb8+zz/CFbbkxggmPo4cQk=;
 b=bn7exVLNBV2QZuvG8xJuSHeZBnWu73YX+cAB63KP00ubTvfdE/nLzrcrXRPS/y+clJt24Q0rdWC7LXHdnhn0uoS1/y+cE1pyLKHtYYSlPSvOdViVleq9yzTgOqMZ1CpJgYwciQg8+S83uyd8OvBUk/CY937jozbVsZe+rE+qT2FEz8m+otX6v1t1hdSSAg/acbeXRl37uUpz54UWaBVqkdv7KhsfpF5gjOKJDOMLsTwpFKB/5ZeNYZ/Fh0cn2CXI8aRn83LzFO1WfUNC/Clt4yaZo9iJg43XW1XxKU4a+ogBtwMd6YstoTEmuY42FGj+lv78gPu1JLfPEFft8eM4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqpF/rBfSiZgOBOJUvdJ4vb8+zz/CFbbkxggmPo4cQk=;
 b=Wl23i1/xHVHtnSIlKP1ogDWX9WB2rXFErkh1dyKaDobi7Z53EhVSG3hmRGckzG0l1r9RLmEcrj+nmgP4flIpr/rCtDZaKBLaVekI5vwhL9CDHh77/NJkBAsymjzyIdoHDlRpZOyNTIWpvJBOpZkQC1uS0wIml5U1P3G+8LohHSkfCDgfYbAUaAG0uH2zWjiRGEcfFjeJq0Y8Aon6aV4fwNLHePv06AWAXfiOASqRt26Ny14Yi8hotuExzJMtta8YF45RhUQjhBVYY/PPi427628gWVUQ2nGKv0WPjeck+i5ij8jljlOtypmjfLmTQeHBdg/c66GTagvjhWghIi+9Mw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SE3PR06MB8430.apcprd06.prod.outlook.com (2603:1096:101:328::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 02:14:36 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 02:14:36 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio
	<michal.pecio@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gdXNiOiB4aGNpOiBGaXggc2xlZXAg?=
 =?utf-8?B?aW4gYXRvbWljIGNvbnRleHQgaW4geGhjaV9mcmVlX3N0cmVhbXMoKQ==?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHVzYjogeGhjaTogRml4IHNsZWVwIGluIGF0b21p?=
 =?utf-8?B?YyBjb250ZXh0IGluIHhoY2lfZnJlZV9zdHJlYW1zKCk=?=
Thread-Index: Adz5bL4JO2Aqie56TjeTYrhhycmoBgACYYoAAABbn/AAFOJpAAAQzkvg
Date: Fri, 12 Jun 2026 02:14:35 +0000
Message-ID:
 <TYUPR06MB621768BDEC2511CCC7071931D2182@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260611094526.2f5ddbba.michal.pecio@gmail.com>
 <TYUPR06MB62176F41E25F9A5C5FA5AD52D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <10322326-6b5a-4f6e-8c8b-e915363137ee@linux.intel.com>
In-Reply-To: <10322326-6b5a-4f6e-8c8b-e915363137ee@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SE3PR06MB8430:EE_
x-ms-office365-filtering-correlation-id: 902f14a9-f979-4d9c-8499-08dec828597f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|23010399003|376014|366016|38070700021|22082099003|18002099003|4143699003|3023799007|5023799004|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 HpepLJlav7eDqboKHgz+3EUO8RYDARC+LL1Q0SRehDOKDI+dLlR+9/HdKVNzcJtpi6civ0c3RjuBiNfz7nHmk4nNhkwB0SEzu1jzT3GKNRLOpv+bTyoO3WUUIt1NOetTNWgXf8YYITkJ62S3TXT7CasFBVHFmdecOYmQ9VS9v6olB8lyGPeJMl0rzjRYbcux1RSGAlP0nVxgreRBtJxq5fmvsjMDpks1ZlzImWOlTxX/U+BHc0tN0T4BrlBT5yQoXulSNkRz4CEFv7QLnsrbcbmmmkSvRtxuZEdqQnCBVeDrtXzBhL719molVW+rlbA5eg8gXy0jmRGwYal+EJAIHrSe8IzFWrKK1RZZ2c1SfZJ8Dk2H2cbdfLFle+WGvGuptSxWVXB0tQQV2QdgKv8fNbP42SKUHm9e+hTWVZdBKmHq4S7tsP6QVIJCTqA5TuAtrjIGRi+P6brSq9/CWhbesDDEBUCJRuWKlj/s6wLlZf8BVI8UQHYC2ozIzBnTp8A/bdXdIuuzB58d+v2Hj6hl2GU9MsDaxFacuCFkid03Ffu0aJ/yj2tC3L+UJUZeP3nPAMjCcBqHUeluud80hTno2Xasp19a28DT30UpAcGHqGVNmHwAF54kVPNLlY2mCyPfqLs+PC91mXDoN+i9a0gaH/ISdae2KO++lB769n3yMOLSGbOmDKHm9jECuf9DzbmmFiBiKn0Ov1bC+qAvQwgzIJu6g6ixF/j1Uh9+7ewh4JInWKk/Uck4ce26OQiw8Vzv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(23010399003)(376014)(366016)(38070700021)(22082099003)(18002099003)(4143699003)(3023799007)(5023799004)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVk5Ly9nTDhQNXI0ZUVDVFZVV2RnZ0RscGFncldPb2JRUHJXRkxuZ3BJNmhL?=
 =?utf-8?B?eTVveVYxc01BMGNGQU5xbHBuWm5VV1JmVXRkdFRRbnpmRmpxTHI3b3JDelUw?=
 =?utf-8?B?NXhDZVRLQmxOdFBhVHlBbm5mWkNtMVVSQzR3NkV5bDU3Y0tFTGF3am1Nbm9T?=
 =?utf-8?B?a3lSVHNBKzJacXExdkNRcUNRdzBxNHpVeXY4YlMwK3UrNXdEL25zdVNoUUE5?=
 =?utf-8?B?WVFJV2ZiWU1ZVnQyaE5Da1FQZmRhcW5tT0RUUlQvS1BZSm02aHpvd2pEQnRh?=
 =?utf-8?B?MTdjWEtvaWo5aHNJdStXb0RTcHlSWU1TNnY5bUxwdlBrbmNDdWk2bjRHUlV6?=
 =?utf-8?B?NkJYek94TXVWTmJrOS9ubGZJWHp4akdibTBnMVdkMndMWGV0WkxYRnZLQTEv?=
 =?utf-8?B?WFVPdk1kTXlJSldsc2dybUpZc1BRQkgvQ1R2cytqYkVXaWhvbnB0aWE4VFQy?=
 =?utf-8?B?ZlB2Z1dYNFo4bTdoNE9CNDZEczVmYmNqdjBNd3hFUUNKbnNlQW12bDh5M1V2?=
 =?utf-8?B?V1BzRlgyd3haV0o0cUJjR09keWpZZ09EQk9TUVVRNlVrV0N0ajJLVzlOWFpS?=
 =?utf-8?B?WitXQ2JKLy9WYXl3Q1laQk5pamhmOGs2YnJxTUJYRlZ3bDdDZG13R3NGbVo5?=
 =?utf-8?B?dW1nS08vUVAyYXRzTXUzQk05MDFvYUltbHRaV1hsNW9RdlVtaXpJamRvbUJy?=
 =?utf-8?B?cU9OVk90VUk0UzNuMnNibVFKbUVPVnRFbkVRV2cvakdaTzVybkVrVUgxSVU2?=
 =?utf-8?B?eEVVQ3hHSndhR0d2TmYyTGtDejloMytzVklodDl4NXU4RjZ6UWRUMndZZFNy?=
 =?utf-8?B?MENVWGJYM0poei9HZ0hldVBhLzkxd2wzNnlwMk9wcHRZRitBdExzajUxeXdj?=
 =?utf-8?B?SGplSjgxZy8veVRQTGI5bHJHbVFGanRqUGxBeVk0dlk0ZzFvTk45WE45eHZ2?=
 =?utf-8?B?SjR6REo2bW9mblBPdHZncUlnai9LcDZ5a1IrR2pud0NNbUtWRytSRFBuRWoz?=
 =?utf-8?B?YWxhVlBEU3hSM1V5V0tnMGc2NlUxYkQ3Q0ZMTzVKZy9GekFqZng1TE15M3dR?=
 =?utf-8?B?ajJzYjc0SlZtc2o5cEp1SFp3cWl0bkRwK05UYVJPMThvNXMzbnQ1ZyttSC85?=
 =?utf-8?B?dmRvK3ZDTi9SeEMyZVdCQXdTYTVYanZ5djYwV1hJWGpISWlvUXhYdEdxb2wv?=
 =?utf-8?B?K3pNaHoxS0oyYjlSeGkyNC9MNlNNaGMvSTc5RE5sL3J2Rlk0ZVhtS3FYRXRv?=
 =?utf-8?B?TXA3R1N1ZGNNOGZXWEQzSmQyRUVwakxlU012MGdXWWRiV09BRXlkcG43L3FO?=
 =?utf-8?B?YUxLa0ErUHFYOWFwWHR3Y0FnY2tXSi9SNzRnL3dvTzdlK3F6OWVpSVVLcFNy?=
 =?utf-8?B?WGRXTEhEM1VrTGd3UGx1MlB3SUVlT0VZVE4rbEtkMzlvUWIya0dQYjEySHZ1?=
 =?utf-8?B?OUNRRi80RVhGcjdGMCtOazI3Smd6cVNXMFRIOVN6b00vZ1pJOCtsZ3Uyd3o3?=
 =?utf-8?B?ZXd0Z1ZjKzU3WmtLVmV0UXBrQk5jZEthZmtIUit5MnhKU20rbmtwTCt6dzln?=
 =?utf-8?B?SnFsS0FYenl5Nk03RFpFa29xQ1ZURlFDZzlMWmxFeUtzUEo2dFFqMENkMVZr?=
 =?utf-8?B?WXM2OEhYNVR1dTNIeGxBUmFQRlVPNkxtdDBINEFKOHZiZjdLNTZlbjc5bTlj?=
 =?utf-8?B?MXJ3N21FcHhKeGtkMmtrSEFIbFc5ZGRmdld1TWhtNWRDNEpnWVVVTzhRUWls?=
 =?utf-8?B?K2JJeWQzT0NiclFoS3hNb3c3b3ROTUNiYm1DOVZNNldEOHVTNGFCVk9md29V?=
 =?utf-8?B?SzNBQ2l1ZFlNd0JWNm5SLzNKS00zUVJpNStKRm5JakswQ2hLMGlOWGxyL1Bo?=
 =?utf-8?B?VXFrVnJjZEswVEptR0kwQTlDaHdLSGU2RUFaZU96R2E2K3lqRGxYRklTamgw?=
 =?utf-8?B?eU4zUWNkS3ljWVlXbnVIcEI2SklhNlNUc091VG9BNEhGeUZ2cDBZbHNuV1VE?=
 =?utf-8?B?QTNFWFZGNzNZS0YycEh1NVpkSlhXdGQxN0NhRUxnaHBOUW1rdkdEYmhVSTc5?=
 =?utf-8?B?UXdmelBkd2ZnUGpncDF3UURyUlMrU1o4eW9GUGlwWTVLS0NKZC9WVWEvcUhK?=
 =?utf-8?B?Y01wdEYyanp1NEYwYWZUbzJ3UnUxVlBhSU9jQ1JOQm5yNDdlb2R6ejB1KzRn?=
 =?utf-8?B?VW1Meit6Mi95amFtamhCR2RYRUQ2TXFsc1djenhNUmVFUFlLYVdrQkN2YkJk?=
 =?utf-8?B?bk9PSERQSkFURWU2REYyVWNEWUdOQ1E2UkNKY1VyMFZwL1dCZlNzYjdKSXBU?=
 =?utf-8?Q?juyVd8qWj0ydph/cXy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902f14a9-f979-4d9c-8499-08dec828597f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 02:14:35.8555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56JVc5vGRgkCckUV3OgPTyRHUU6tp2+I+AV9UXsKwarNvwpAqtWiWnHcVaa5B3pra2ZqqdUiFUFogJt+jrs8IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8430

SGkgTWF0aGlhcywgTWljaGENCg0KPiA+Pj4gV2hlbiBhIFVTQiBkZXZpY2Ugd2l0aCBhY3RpdmUg
c3RyZWFtIGVuZHBvaW50cyBpcyBkaXNjb25uZWN0ZWQsDQo+ID4+PiB4aGNpX2ZyZWVfc3RyZWFt
cygpIGlzIGNhbGxlZCBmcm9tIHRoZSBodWJfZXZlbnQgd29ya3F1ZXVlIHRvDQo+ID4+PiBmcmVl
IHRoZSBzdHJlYW0gcmVzb3VyY2VzIHdoaWxlIGhvbGRpbmcgeGhjaS0+bG9jayB3aXRoIGlycXMN
Cj4gPj4+IGRpc2FibGVkLg0KPiA+Pg0KPiA+PiBQZWRhbnRyeTogaXQgKGN1cnJlbnRseSkgaG9s
ZHMgdGhlIGxvY2sgd2hpbGUgZnJlZWluZywgYnV0IGl0IGlzbid0DQo+ID4+IGNhbGxlZCB3aXRo
IHRoZSBsb2NrIGhlbGQsIG5vciBmb3IgdGhlIGV4cGxpY2l0IHB1cnBvc2Ugb2YgZnJlZWluZw0K
PiA+PiB0aGluZ3Mgd2l0aCB0aGUgbG9jayBoZWxkLiBOb3Qgc3VyZSBob3cgdG8gcGFyc2UgdGhp
cyBzZW50ZW5jZT8NCj4gPg0KPiA+IFRoZSBhYm92ZSBkZXNjcmlwdGlvbiBoYXMgYSBwcm9ibGVt
OyBwbGVhc2UgdXBkYXRlIHRoZSBkZXNjcmlwdGlvbiBpbmZvcm1hdGlvbjoNCj4gPiBXaGVuIGEg
VVNCIGRldmljZSB3aXRoIGFjdGl2ZSBzdHJlYW0gZW5kcG9pbnRzIGlzIGRpc2Nvbm5lY3RlZCwN
Cj4gPiB4aGNpX2ZyZWVfc3RyZWFtcygpIGlzIGNhbGxlZCBmcm9tIHRoZSBodWJfZXZlbnQgd29y
a3F1ZXVlIHRvDQo+ID4gZnJlZSB0aGUgc3RyZWFtIHJlc291cmNlcy4gIEl0IGFjcXVpcmVzIHho
Y2ktPmxvY2sgd2l0aCBpcnFzDQo+ID4gZGlzYWJsZWQsIGJ1dCB0aGVuIGNhbGxzIHhoY2lfZnJl
ZV9zdHJlYW1faW5mbygpIHVuZGVyIHRoZSBsb2NrLg0KPiA+DQo+ID4+PiBJdCBjYWxscyB4aGNp
X2ZyZWVfc3RyZWFtX2luZm8oKSwgd2hpY2ggaW52b2tlcw0KPiA+Pj4geGhjaV9mcmVlX3N0cmVh
bV9jdHgoKSwgd2hpY2ggaW4gdHVybiBjYWxscyBkbWFfZnJlZV9jb2hlcmVudCgpDQo+ID4+PiBm
b3IgbGFyZ2Ugc3RyZWFtIGNvbnRleHQgYXJyYXlzLg0KPiA+Pj4NCj4gPj4+IGRtYV9mcmVlX2Nv
aGVyZW50KCkgY2FuIHNsZWVwIChlLmcuIHZpYSB2dW5tYXApLCB0cmlnZ2VyaW5nDQo+ID4+PiBh
IEJVRyB3aGVuIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0Lg0KPiA+Pj4NCj4gPj4+IENhbGwg
dHJhY2U6DQo+ID4+PiAgIGRtYV9mcmVlX2F0dHJzKzB4MTc0LzB4MjIwDQo+ID4+PiAgIHhoY2lf
ZnJlZV9zdHJlYW1faW5mbysweGQwLzB4MTFjDQo+ID4+PiAgIHhoY2lfZnJlZV9zdHJlYW1zKzB4
Mjc4LzB4MzdjDQo+ID4+PiAgIHVzYl9mcmVlX3N0cmVhbXMrMHg5OC8weGMwDQo+ID4+PiAgIHVz
Yl91bmJpbmRfaW50ZXJmYWNlKzB4MWI4LzB4MmY4DQo+ID4+PiAgIGRldmljZV9yZWxlYXNlX2Ry
aXZlcl9pbnRlcm5hbCsweDFkNC8weDJjYw0KPiA+Pj4gICBkZXZpY2VfcmVsZWFzZV9kcml2ZXIr
MHgxOC8weDI4DQo+ID4+PiAgIGJ1c19yZW1vdmVfZGV2aWNlKzB4MTYwLzB4MWE0DQo+ID4+PiAg
IGRldmljZV9kZWwrMHgxZWMvMHgzNTANCj4gPj4+ICAgdXNiX2Rpc2FibGVfZGV2aWNlKzB4OTgv
MHgyMTQNCj4gPj4+ICAgdXNiX2Rpc2Nvbm5lY3QrMHhmMC8weDM1Yw0KPiA+Pj4gICBodWJfZXZl
bnQrMHhhYjQvMHgxOWVjDQo+ID4+PiAgIHByb2Nlc3Nfb25lX3dvcmsrMHgyNzgvMHg2M2MNCj4g
Pj4+DQo+ID4+PiBGaXggdGhpcyBieSBzYXZpbmcgdGhlIHN0cmVhbV9pbmZvIHBvaW50ZXJzIGFu
ZCBjbGVhcmluZyB0aGUNCj4gPj4+IGVwIHJlZmVyZW5jZXMgdW5kZXIgdGhlIGxvY2ssIHRoZW4g
Y2FsbGluZyB4aGNpX2ZyZWVfc3RyZWFtX2luZm8oKQ0KPiA+Pj4gb3V0c2lkZSB0aGUgbG9jayB3
aGVyZSBzbGVlcGluZyBpcyBhbGxvd2VkLg0KPiA+Pg0KPiA+PiBJIHdvbmRlciBpZiB0aGlzIGNv
cHkgaXMgbmVjZXNzYXJ5IG9yIGlmIGl0IHdvdWxkIHN1ZmZpY2UgdG8gc3RhcnQgd2l0aA0KPiA+
PiBjYWxsaW5nIHhoY2lfZnJlZV9zdHJlYW1faW5mbygpIHVubG9ja2VkIChFUF9HRVRUSU5HX05P
X1NUUkVBTVMgc2hvdWxkDQo+ID4+IGVuc3VyZSB0aGF0IG5vYm9keSBzdWJtaXRzIG5ldyBVUkJz
IGFuZCBob3BlZnVsbHkgY29yZSB3b24ndCBhdHRlbXB0IHRvDQo+ID4+IHJlLWVuYWJsZSBzdHJl
YW1zIGNvbmN1cnJlbnRseSkgYW5kIHRoZW4gZ3JhYiB0aGUgbG9jayBvbmx5IHRvIHVwZGF0ZQ0K
PiA+PiB2ZGV2LT5lcHMgc3RyZWFtX2luZm8gYW5kIGVwX3N0YXRlIGZpZWxkcy4NCj4gPg0KPiA+
IEkgY29uc2lkZXJlZCB0aGlzIGFwcHJvYWNoLCBidXQgdGhlcmUgaXMNCj4gPiBhIHVzZS1hZnRl
ci1mcmVlIHdpbmRvdyBiZXR3ZWVuIGZyZWVpbmcgc3RyZWFtX2luZm8gYW5kIGNsZWFyaW5nDQo+
ID4gdGhlIHBvaW50ZXIuDQo+ID4gVGhlIHhIQ0kgaW50ZXJydXB0IGhhbmRsZXIgKHhoY2lfaXJx
KCkpIGhvbGRzIHhoY2ktPmxvY2sgd2hpbGUNCj4gPiBwcm9jZXNzaW5nIGV2ZW50cywgYW5kIHNl
dmVyYWwgZXZlbnQgaGFuZGxlcnMgYWNjZXNzDQo+ID4gZXAtPnN0cmVhbV9pbmZvIHVuZGVyIHRo
ZSBsb2NrIOKAlCBlLmcuDQo+ID4gcmluZ19kb29yYmVsbF9mb3JfYWN0aXZlX3JpbmdzKCkgaXRl
cmF0ZXMNCj4gPiBzdHJlYW1faW5mby0+c3RyZWFtX3JpbmdzW10sIGFuZCB4aGNpX2hhbmRsZV9j
bWRfc2V0X2RlcSgpDQo+ID4gYWNjZXNzZXMgc3RyZWFtX2luZm8tPnN0cmVhbV9jdHhfYXJyYXlb
XS4NCj4gPiBJZiB3ZSBmcmVlIHN0cmVhbV9pbmZvIGZpcnN0IChvdXRzaWRlIHRoZSBsb2NrKSwg
dGhlbiBhY3F1aXJlIHRoZQ0KPiA+IGxvY2sgdG8gY2xlYXIgdGhlIHBvaW50ZXIsIHRoZXJlIGlz
IGEgd2luZG93IHdoZXJlIHRoZSBpbnRlcnJ1cHQNCj4gPiBoYW5kbGVyIGNhbiBzdGlsbCBzZWUg
dGhlIG9sZCAoZGFuZ2xpbmcpIHBvaW50ZXIgYW5kIGRlcmVmZXJlbmNlDQo+ID4gZnJlZWQgbWVt
b3J5LiBTbyB3ZSBuZWVkIHRvIGNsZWFyIHRoZSByZWZlcmVuY2UgdW5kZXIgdGhlIGxvY2sgZmly
c3QsDQo+ID4gdGhlbiBmcmVlIHRoZSBtZW1vcnkgb3V0c2lkZS4NCj4gDQo+IEdvb2QgcG9pbnQs
IGJ1dCB0aGUgbmVlZCBmb3IgdGhpcyByZXZlYWxzIGFub3RoZXIgYnVnLg0KPiANCj4gVGhpcyBt
ZWFucyB4aGNpX2ZyZWVfc3RyZWFtcygpIGNhbiBxdWV1ZSBhIGNvbmZpZ3VyZSBlbmRwb2ludCBj
b21tYW5kDQo+IHRvIHJlbW92ZSBzdHJlYW1zLCBhbmQgeGhjaV9pcnEoKSBjYW4gcmluZyB0aGUg
ZG9vcmJlbGwgb2YgYSBzdHJlYW0gYXQgdGhlDQo+IHNhbWUgdGltZSB4SEMgY29udHJvbGxlciBp
cyBwcm9jZXNzaW5nIHRoZSBjb21tYW5kIHRvIHJlbW92ZSB0aGUgc3RyZWFtDQo+IA0KPiANCj4g
Q1BVMAkJCQlDUFUxCQkJCXhIQyBjb250cm9sbGVyDQo+IA0KPiB4aGNpX2ZyZWVfc3RyZWFtcygp
DQo+IHNwaW5fbG9jaygpDQo+IHN0YXRlfD0gRVBfR0VUVElOR19OT19TVFJFQU1TOwkJCQkJcHJv
Y2VzcyBvbGQgY21kL3hmZXINCj4gc3Bpbl91bmxvY2sJCQkJCQkJd3JpdGUgb2xkIGV2ZW50DQo+
IHhoY2lfY29uZmlndXJlX2VuZHBvaW50KCkJCQkJCXRyaWdnZXIgaW50ZXJydXB0DQo+IAkJCQl4
aGNpX2lycSgpDQo+IAkJCQlzcGluX2xvY2soKQ0KPiAJCQkJaGFuZGxpbmcgb2xkIGV2ZW50DQo+
IAkJCQlyaW5nX2RiX2Zvcl9hY3RpdmVfcmluZ3MoKQlwcm9jZXNzIGNvbmZpZ3VyZV9lbmRwb2lu
dCBjbWQNCj4gDQo+IExvb2tzIGxpa2Ugd2UgYXNzdW1lIHN0cmVhbXMgYXJlIGZ1bmN0aW9uYWwg
YnkgY2hlY2tpbmcgaWYgZXAtPnN0cmVhbV9pbmZvDQo+IGV4aXN0cyBpbiBtYW55IHBsYWNlcyB3
aGVyZSB3ZSBzaG91bGQgY2hlY2sgZXBfc3RhdGUgc3RyZWFtIGZsYWdzIGluc3RlYWQuDQo+IA0K
PiBXZSBzaG91bGQgZm9yIGV4YW1wbGUgcHJldmVudCByaW5naW5nIHN0cmVhbSBkb29yYmVsbCBp
ZiBlcF9zdGF0ZSBoYXMNCj4gRVBfR0VUVElOR19OT19TVFJFQU0gZmxhZyBzZXQuDQo+IA0KPiBT
byBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIHRhcmdldGVkIHBhdGNoIGZvciB0aGlzIHNwZWNpZmlj
IGlzc3VlLg0KPiBXZSBzaG91bGQgc3RhcnQgZml4aW5nIHRoZSBvdGhlciBpc3N1ZXMgYW5kIGhv
cGVmdWxseSBlbmQgdXAgd2hlcmUNCj4gTWljaGFsIHN1Z2dlc3RlZC4NCg0KVGhhbmtzIGZvciB0
aGUgcmV2aWV3IGFuZCB0aGUgaW5zaWdodCBhYm91dCB0aGUgZGVlcGVyIGlzc3VlLg0KSSBhZ3Jl
ZSB0aGF0IG1hbnkgcGxhY2VzIGNoZWNrIGVwLT5zdHJlYW1faW5mbyBpbnN0ZWFkIG9mDQplcF9z
dGF0ZSBzdHJlYW0gZmxhZ3MsIHdoaWNoIGNvdWxkIGxlYWQgdG8gdGhlIHJhY2UgeW91DQpkZXNj
cmliZWQuDQoNCkknbGwgbW9kaWZ5IHRoZSBwYXRjaCBkZXNjcmlwdGlvbiBmb3IgdGhpcyBwYXRj
aCBhbmQgcmVsZWFzZSB2ZXJzaW9uIHYyIGxhdGVyLg0KDQpUaGFua3MNCkxpYW5xaW4NCg==
