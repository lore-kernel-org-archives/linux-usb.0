Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012033.outbound.protection.outlook.com [40.107.75.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4F331EAF;
	Thu, 11 Jun 2026 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160260; cv=fail; b=b5OreRSVhlqyQgv6OmwCKYiqg39fj+OetDD5AEreTk6pdjWcPjJmdFtBtSZdd82/sMDr3Oy1miRPmRhAuWaKR36wI63X8nNz6nAqzPg3ZxdMCbnFQpt7xl1l/1F4/Dcl+w++L56eSBeO3Ch+cMUuLifZrGti7DuQQTtGlaFmVLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160260; c=relaxed/simple;
	bh=BvO7MRgnoRskaUJjrPa1rLHSaYzOahOZ4+iyGa+j83k=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MY7ZYDebSgTfIoPStRd68PIfKiI8357Azr6oCu0pjhX30Eh8I4WoD4qT+MsZTh60qzUOuSiKNDtmzIj3o/RiiL8pSHmRrSOEWiDoKEZVHCsO/08+ZlOqxYaPI/njcg6j+oO70HDmKhVjYpWKxK8HhHy7LZqVfo0PECn9nUhZUJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HYigqRql; arc=fail smtp.client-ip=40.107.75.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HYigqRql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7AqNMWl0JLNtU6hTjSOAdzl71WCHhiz804qoEpSVqIzJ7n21RI8OOBcwm09Sp+Y0WU3103W+ScO3AghE8skwu0ifNJdqikieIXzIUqhWH6175ErSZPOAVDA76t3KBtcjnW8p05R41yjYSAtivj25P84+LQNzfdOMX9vrdC2mKgU+vFetUEkA7PPhvOYB3ZdM9RVOU2u0m4UyMgg3WsnC8IYajRF64qmet8EmOT4sONpd6H5G5EMrfZnPKpAVJJFQiWymc4kOd+keY9eR4C3qdDB40j+p1rHWMXyQbgVfIP/GKVaMS4zS/BVKz5vYsxw/NkI7vdZIkSRECrTh6aQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvO7MRgnoRskaUJjrPa1rLHSaYzOahOZ4+iyGa+j83k=;
 b=Jh8ec5Leqgz2YCoSpUYY8jWyExIWWREl8ylDBqiyHfil5DKXB1437ARuVxUDBX9TaNr97/7PqcXuYt47tkoMKwXEnTj36DpIQXpp9xoSHTlHyQKiep/BO56t8aTvWRgb4edhkkauvn4OkK/avQ8T4sNOCjq9fkKk6JjkmH29EsH2e2G5Q5WG5fDylS4FXtCqzhtKqZbwj9TyAIVCVw0QpUzR8MUiTkftFfIwPMXM3Ad4oJTNmn6YFr2OvgK/7nDwlH2DVYVmLhCNPeZ7L3Ga/wnUTv6m/3JaCfRJ6aEZ+4WzYVBZvZp95pjAlg0hIu0BxpJ3ly3/0YuOsYkjofX0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvO7MRgnoRskaUJjrPa1rLHSaYzOahOZ4+iyGa+j83k=;
 b=HYigqRqlriypUYdDCXaRZ20M90fLr2F0jm5Qj0rEY8TDp0OarTTctu2jHjVyZ36ya7Y4yr5u20BBzrhY2PxzS/+S7QwfpepFr50DGabNWh+A0F4sxzg4N5XSK+r7pF/LMbIntAMHcwj2SiWrVVD4iz9Clo50Wy1XzMcQ4n67y4rJT4Jv5Y/wmMPO3Pkx8EEsQ6T9+lkTIEAt/VOY8DHbJtMEX2zS73MarnGpd3eSELf9FoND5uitU6FIWdi3JMYlNwi8IT2dSWik/x78CNbpgdebpidnIFAfcsWMNvkuqGL7z/2k199q2az7k2m0HXLC9P4NiR6P2Nj9CAXmL9bZvg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB5416.apcprd06.prod.outlook.com (2603:1096:101:67::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 06:44:15 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 06:44:14 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "sarah.a.sharp@linux.intel.com"
	<sarah.a.sharp@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] usb: xhci: Fix sleep in atomic context in xhci_free_streams()
Thread-Topic: [PATCH] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
Thread-Index: Adz5bL4JO2Aqie56TjeTYrhhycmoBg==
Date: Thu, 11 Jun 2026 06:44:14 +0000
Message-ID:
 <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB5416:EE_
x-ms-office365-filtering-correlation-id: 8b163a30-f671-4330-c0e4-08dec784da4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|23010399003|38070700021|18002099003|11063799006|5023799004|6133799003|56012099006;
x-microsoft-antispam-message-info:
 6MfdUOSVFwoRoesOaLwpYTf/THpH2wT5bSGCga5EB0YDUS6QFlSmkd3jzpgDqZ0XyPCL6aypy70s+uyw8UTsIRLV5r544+99fX0clRrQAprp+PprsoaomEm6PTIGsuUg2oe+QOHFXdE5RVT772sqmfSN/5xxJncuKi/ZowjF/CGaVQWxCLn8iI5Ku6vlx3eT25YE2s9IDTY4gOVdf5ExYHzwgCgLhxkWrNEnmPyfq+XQCHNhOv/fxcxrPHV4jNRZBmzt0GhmHACZGF6Feol9LSI07J1Rf9X7IK00V+vAmbWoOkMTuHa1l2JlB0fR5DxJZvkHf2GNDUNA/wmz7GmJV3qeuK5XTQH4MOMU93ihHlyvNQj3bS6jBEXUQdh6nwp8uTmDkm/NBQ/hL/z0NtElYUP6mb3WddHJI9Q6PV6PHp3N8c8m6gq1x7yYMBEWpsEls3jTKN/woVGYvtnDSEBpYrGzrObTL/OllnVCkl3jwD5T6lnUixeJpjEqLiKH+86yV6kuiVXI0agYwnacWq333mak/9miUuN0YdF35FlnoQEu5DhCSqNxRj7w49Ct12baro3/ysEaPCAcLqDFTL0O9nDGBilrG1hUqDHlK9JQnihIgSzfjN5BnKCCvx7qVLXthhyb1pJTs/3tXLZ8KEgufcu0F9LOWfwBhQrZbK+myVMIDuo2D1FUbjbMgtDR1Uno23LWLui+f0KYXCpWbOwhVimQminiKDAr1addDm9/DnTFwQ9bUFxNmahF0IxxnN4D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(23010399003)(38070700021)(18002099003)(11063799006)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Nk1XVGFqY05USnVLbGhIbnBTWTFNQ2h5OHhFNjcvYmVibTNIZDRMTDY3WTFU?=
 =?gb2312?B?b1B2Vk1ya1REUWlMTUF6Qml1elA2THJ3TFFsZWNHNWVjY3pmNFlzZWlwZnNB?=
 =?gb2312?B?UUUyZHBqMjJpYzhXUXAxaFQzTU45SCtHL2EzN0JKdHFWcnFLSFRLUXRDblEx?=
 =?gb2312?B?K3RLa1NnNVQ1aThIQURqazQ5M1M5ejM2MVF4aEZVUlllbVVQVjd4R21GR3ZF?=
 =?gb2312?B?SXkyekZTK3VnZm1RNk16QnNnTlprRWtxdnJvdGd6SGFYTG4xZ2tQeFI2RjlP?=
 =?gb2312?B?eGJEbitsZE8xb1YrUEtRTldVbkp1UXE0a0RNZkhSY2V4WVhFNWRhc3N1Tit5?=
 =?gb2312?B?UVQ5NjI0VVVCVE5MR25VcENVRm1PckJtYklJaURRaG5nd3VaVjM3MllmbUc3?=
 =?gb2312?B?Z3V1Tit2RWxjQU5nQVYyQXR1eW13ZU4vWG9TeEhRMVZkSkp3YW9RYkZsWGFF?=
 =?gb2312?B?QkNoaDloZC93UHRXbTduNTBHRnBvbUQ0L0RqRzJSZS9tVzgyV1V6Qk0yWk9y?=
 =?gb2312?B?Snhocmt5QjU4M01BRkdNM1FuVWN6QTUwUHAxL2lIbmZuS1lTelRTTk9SbjNk?=
 =?gb2312?B?NWcxQ1hsVmZ3emdneWdIYkxtTW5wMXVNTjZBaTUvYUgyY3JteENBS203UjRC?=
 =?gb2312?B?b21WOWh1SXV5L21vVXZta3h4ekdPdEUrL0xlaHZZUDdzYm1IR0wzMFBMQk5V?=
 =?gb2312?B?S3Q3ZWRnYWh6c1FETW5RT0ZZUVAwQk05b3pBWlFzRU5oZTlCeVBqa05iNjNJ?=
 =?gb2312?B?QUEwNDdpU3p3N3RPWklxKzNOSXNvRVdLczYxSzlDanBqVlM3Nkw0OGNpZW1G?=
 =?gb2312?B?Y1pTZ0JzT3hWci9VZkpxQ09UME02aXpYeEwwdDQ1WGlTaUFhMGhqLzE0YlVJ?=
 =?gb2312?B?UWxiMUdCN1hWUWlKMEdQNzFudDF6ekVQU2c4NkxNZm1TaDJjbnlHbVQyOGh3?=
 =?gb2312?B?Yi9LbnVockFpdlAwUmx2aXdxQWV1OU4zTUFWV0VQamcvb3VvRXBuTjV3YTVS?=
 =?gb2312?B?Njlqb09qVHJYK003cVV1WDM1UjhqT2R2RHNFUVh5QmVTVnhWZXBWV3ZyaHZq?=
 =?gb2312?B?RUxCVjg0KzQ2M3h4ckdUNCs3MTBYQTVITVdxZEdMSWk5NXBxa0s4R01qV3Fh?=
 =?gb2312?B?Uy91a1EvZlZLWUtZZC83dzIzY1E5R1d3VGJhYytMNUJVdWtuM2tsV1V5dG5u?=
 =?gb2312?B?SkVwWjlYNXZuVVVWVjJuajZiMWtocVZNN1Q5ME42VHFmZmd5RUg2d29YM2R3?=
 =?gb2312?B?cU1iK0lCaWNZd0dkSzgvN1d4SXZ2SysvOW1Mb1ZJbEhJMXgycnluV2h1S2oz?=
 =?gb2312?B?Q1pwanl3RUUyUXNDbTU1Y1c4ak1KY21qZXBjeWNIaXZiYWUrOEFYcUl5SzdQ?=
 =?gb2312?B?c3pOT2xwTWk0akhKSW1Cd2ZuQWtTZ3F6Q1pYV29RWklCZVY4Q1BiMHVZQlQx?=
 =?gb2312?B?SjRzOUlNUy9TOUovRjBxQTFNMXJIdUx6TW83VjlUaTVITStFM050WHczYW54?=
 =?gb2312?B?Y2srRHp5WjI2OHdwbGExTVp4VWFpR2dTelJhUUNYeXNCalRqTGtoemRtcXl6?=
 =?gb2312?B?bXFLMmptWE4vaUhseko2cGFDS0pBSjdXRE1qaUxOQ1Mvc0g2LytIbmh2aTNq?=
 =?gb2312?B?dVhJWUNqcmNtTUEzcWlZQmRrNEpmd0tvVmNzMzZQcldIZTBOd2svSWFqODlL?=
 =?gb2312?B?T0cwWHVzc1VSOGZtcTdVQlhhTFpUMFFHSUJDTERJTHdmeWc1RmRrRWdrZWtV?=
 =?gb2312?B?TXltOGp2Q2JyVUszTzhobXB3LzRRdjI5NFhwdkl2UUU1R3M3cFhFVStaR1RC?=
 =?gb2312?B?bjgrZ2phSkNmWWwxcnU5RXBpZkh0cWFJbVkzTGRqaXBiRjFzRW5lcnJwZWJx?=
 =?gb2312?B?MmhrYXhoQzBveGpJMGMrcnZkbnF4ZUhzS2hoSUVBY3h1TXBEcUxyYjI0MXky?=
 =?gb2312?B?N0ZiZGN6QXZ1RHkrb2cxM3hwOERjcHAzVGZ6Y05JUTRLVk9TeFZVOHJYUjBQ?=
 =?gb2312?B?cGFSVjd5bGVrWVFodUNySm0xdlhSem9FVFhFNkU2dlpsanpmM1dRRGJKNlN5?=
 =?gb2312?B?aWp4akNzdVVtUXlFZDJHZ2wreGd4SExiVGxVVjJJMkNsVWJzV1pVOUswWGdO?=
 =?gb2312?B?Wk5vbmUyeDdCQisyK1J3QXczMDNyRWVXd1ZrT2J0SFpXYjVPNGE0N0ExVUdX?=
 =?gb2312?B?bmRpZ3N4Q1VMYlRHSXJONGdKYlNlY1dWbDl1d3l4UFMyY2piYjVhS3FxbkFW?=
 =?gb2312?Q?C8fzYBfnP1XX07QY8QrYXh38dmskI/gSmOnbDVIPt8=3D?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b163a30-f671-4330-c0e4-08dec784da4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 06:44:14.4677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BD4EPlcYOFFT1dIMAZWSxggWKYURrBaIqNCQ82dBEdF/cGUE5gadNLcbsENdHtS4OFgNjjbxW3OKsgedeEeFiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5416

V2hlbiBhIFVTQiBkZXZpY2Ugd2l0aCBhY3RpdmUgc3RyZWFtIGVuZHBvaW50cyBpcyBkaXNjb25u
ZWN0ZWQsDQp4aGNpX2ZyZWVfc3RyZWFtcygpIGlzIGNhbGxlZCBmcm9tIHRoZSBodWJfZXZlbnQg
d29ya3F1ZXVlIHRvDQpmcmVlIHRoZSBzdHJlYW0gcmVzb3VyY2VzIHdoaWxlIGhvbGRpbmcgeGhj
aS0+bG9jayB3aXRoIGlycXMNCmRpc2FibGVkLg0KDQpJdCBjYWxscyB4aGNpX2ZyZWVfc3RyZWFt
X2luZm8oKSwgd2hpY2ggaW52b2tlcw0KeGhjaV9mcmVlX3N0cmVhbV9jdHgoKSwgd2hpY2ggaW4g
dHVybiBjYWxscyBkbWFfZnJlZV9jb2hlcmVudCgpDQpmb3IgbGFyZ2Ugc3RyZWFtIGNvbnRleHQg
YXJyYXlzLg0KDQpkbWFfZnJlZV9jb2hlcmVudCgpIGNhbiBzbGVlcCAoZS5nLiB2aWEgdnVubWFw
KSwgdHJpZ2dlcmluZw0KYSBCVUcgd2hlbiBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dC4NCg0K
Q2FsbCB0cmFjZToNCiBkbWFfZnJlZV9hdHRycysweDE3NC8weDIyMA0KIHhoY2lfZnJlZV9zdHJl
YW1faW5mbysweGQwLzB4MTFjDQogeGhjaV9mcmVlX3N0cmVhbXMrMHgyNzgvMHgzN2MNCiB1c2Jf
ZnJlZV9zdHJlYW1zKzB4OTgvMHhjMA0KIHVzYl91bmJpbmRfaW50ZXJmYWNlKzB4MWI4LzB4MmY4
DQogZGV2aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MWQ0LzB4MmNjDQogZGV2aWNlX3Jl
bGVhc2VfZHJpdmVyKzB4MTgvMHgyOA0KIGJ1c19yZW1vdmVfZGV2aWNlKzB4MTYwLzB4MWE0DQog
ZGV2aWNlX2RlbCsweDFlYy8weDM1MA0KIHVzYl9kaXNhYmxlX2RldmljZSsweDk4LzB4MjE0DQog
dXNiX2Rpc2Nvbm5lY3QrMHhmMC8weDM1Yw0KIGh1Yl9ldmVudCsweGFiNC8weDE5ZWMNCiBwcm9j
ZXNzX29uZV93b3JrKzB4Mjc4LzB4NjNjDQoNCkZpeCB0aGlzIGJ5IHNhdmluZyB0aGUgc3RyZWFt
X2luZm8gcG9pbnRlcnMgYW5kIGNsZWFyaW5nIHRoZQ0KZXAgcmVmZXJlbmNlcyB1bmRlciB0aGUg
bG9jaywgdGhlbiBjYWxsaW5nIHhoY2lfZnJlZV9zdHJlYW1faW5mbygpDQpvdXRzaWRlIHRoZSBs
b2NrIHdoZXJlIHNsZWVwaW5nIGlzIGFsbG93ZWQuDQoNCkZpeGVzOiA4ZGY3NWY0MmY4ZTYgKCJV
U0I6IHhoY2k6IEFkZCBtZW1vcnkgYWxsb2NhdGlvbiBmb3IgVVNCMyBidWxrIHN0cmVhbXMuIikN
CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxo
dWxpYW5xaW5Adml2by5jb20+DQotLS0NCiBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyB8IDEwICsr
KysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS5jDQppbmRleCBhNTRmNWI1N2YyMDUuLmM5YWY1MDhlZGNiOSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQorKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYw0K
QEAgLTM3ODgsNiArMzc4OCw3IEBAIHN0YXRpYyBpbnQgeGhjaV9mcmVlX3N0cmVhbXMoc3RydWN0
IHVzYl9oY2QgKmhjZCwgc3RydWN0IHVzYl9kZXZpY2UgKnVkZXYsDQogCXN0cnVjdCB4aGNpX3Zp
cnRfZGV2aWNlICp2ZGV2Ow0KIAlzdHJ1Y3QgeGhjaV9jb21tYW5kICpjb21tYW5kOw0KIAlzdHJ1
Y3QgeGhjaV9pbnB1dF9jb250cm9sX2N0eCAqY3RybF9jdHg7DQorCXN0cnVjdCB4aGNpX3N0cmVh
bV9pbmZvICpzdHJlYW1faW5mb1tFUF9DVFhfUEVSX0RFVl07DQogCXVuc2lnbmVkIGludCBlcF9p
bmRleDsNCiAJdW5zaWduZWQgbG9uZyBmbGFnczsNCiAJdTMyIGNoYW5nZWRfZXBfYml0bWFzazsN
CkBAIC0zODQ4LDEwICszODQ5LDE0IEBAIHN0YXRpYyBpbnQgeGhjaV9mcmVlX3N0cmVhbXMoc3Ry
dWN0IHVzYl9oY2QgKmhjZCwgc3RydWN0IHVzYl9kZXZpY2UgKnVkZXYsDQogCWlmIChyZXQgPCAw
KQ0KIAkJcmV0dXJuIHJldDsNCiANCisJLyogZG1hX2ZyZWVfY29oZXJlbnQoKSBjYWxsZWQgYnkg
eGhjaV9mcmVlX3N0cmVhbV9pbmZvKCkgbWF5IHNsZWVwLA0KKwkgKiBzbyBzYXZlIHN0cmVhbV9p
bmZvIHBvaW50ZXJzIGFuZCBjbGVhciByZWZlcmVuY2VzIHVuZGVyIGxvY2ssDQorCSAqIHRoZW4g
ZnJlZSB0aGUgbWVtb3J5IG91dHNpZGUgbG9jay4NCisJICovDQogCXNwaW5fbG9ja19pcnFzYXZl
KCZ4aGNpLT5sb2NrLCBmbGFncyk7DQogCWZvciAoaSA9IDA7IGkgPCBudW1fZXBzOyBpKyspIHsN
CiAJCWVwX2luZGV4ID0geGhjaV9nZXRfZW5kcG9pbnRfaW5kZXgoJmVwc1tpXS0+ZGVzYyk7DQot
CQl4aGNpX2ZyZWVfc3RyZWFtX2luZm8oeGhjaSwgdmRldi0+ZXBzW2VwX2luZGV4XS5zdHJlYW1f
aW5mbyk7DQorCQlzdHJlYW1faW5mb1tpXSA9IHZkZXYtPmVwc1tlcF9pbmRleF0uc3RyZWFtX2lu
Zm87DQogCQl2ZGV2LT5lcHNbZXBfaW5kZXhdLnN0cmVhbV9pbmZvID0gTlVMTDsNCiAJCS8qIEZJ
WE1FIFVuc2V0IG1heFBzdHJlYW1zIGluIGVuZHBvaW50IGNvbnRleHQgYW5kDQogCQkgKiB1cGRh
dGUgZGVxIHB0ciB0byBwb2ludCB0byBub3JtYWwgc3RyaW5nIHJpbmcuDQpAQCAtMzg2MSw2ICsz
ODY2LDkgQEAgc3RhdGljIGludCB4aGNpX2ZyZWVfc3RyZWFtcyhzdHJ1Y3QgdXNiX2hjZCAqaGNk
LCBzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCiAJfQ0KIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZ4aGNpLT5sb2NrLCBmbGFncyk7DQogDQorCWZvciAoaSA9IDA7IGkgPCBudW1fZXBzOyBpKysp
DQorCQl4aGNpX2ZyZWVfc3RyZWFtX2luZm8oeGhjaSwgc3RyZWFtX2luZm9baV0pOw0KKw0KIAly
ZXR1cm4gMDsNCiB9DQogDQotLSANCjIuNDguMQ0KDQo=
