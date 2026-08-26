Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071921ABBB;
	Wed, 26 Aug 2026 03:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713674; cv=fail; b=dj6dpmNodl8e52OEIrf51n2UJL3s7YGEv8kMxl9OmpVkzhl8im554YTuOJcpBtxGdMnAGVDQVc2N073dxviWA8lC+FM1mdqcaP6QVL0N+UB0AlAMOmvaDQlMh8f9cSNUJ2mWmsBJwJNlgxNvaGXvAinuA+kv6HNgL6JD/2WQd3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713674; c=relaxed/simple;
	bh=sPlSOydSfaOmxDaN9nGuAiGC/F+P+nmDKeypd2BXKgQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Limw7mOssKAlNBfX7kQgkKPB7+tPvXclm2y4PJrdv7PxKobB9zIe3vg/MPjzyhgQpv9wDCbcvqXtmXEEcC5k4iLyZ3ufM1Kz6BCHjKaJj9CIRgY9XKF51MuagU+6cmheK/791dcWaUx5wkXe+B0/mYJlBDh1oegcVnMFkRHnhnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=XrjkNoYV; arc=fail smtp.client-ip=52.101.85.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="XrjkNoYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3mcUd9voCsZUQbknQFgt+lY4u05wXOJnwE+JD1+F/7ZO0JVxqrpspuIn/FZsQN9oF4+xDPN7Z2nqCkRE9jVye4sHM7HdDwl2Fy55BScOYrn02qbyPnYYN1uIzD+oaghRPpeg2I6GLF3JVzKutEBSEY4PdrNgZS0U39k71WDp7pl6vNWlxFnUewNeZMvs4zk2g6WeVq89ZEtZQeF/lOnkHVpgRlEVVZQOzJ75vN6azZ2FLrTir1Y+wU82ztWAES0Zvz6EJMwDTd8AzRqvZv8juYv5ob2guQP+2gp2A0SNNhAijlRGnL3h2atBveE8JIJu8eMEeL+o+3XN0kDY3zi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPlSOydSfaOmxDaN9nGuAiGC/F+P+nmDKeypd2BXKgQ=;
 b=EPOMngwNOqoDQPepq3/cSx8lDkWddsJ+XjgBiqeCuE+CmTZKD5IvdltDnbhUPLgy3fLvwrNMEuz8CZjkjwNkvD1eeM+fzRB3uKdmAU7LC5Lkv4UOrjxvN7i0T7sQpdFy1toVp6aQsLivawBA+IHKuK+sNLdIzmZJcf5Yr1ddvAs4GRhvoXI7XEf/LL1Z4LWPnbv+6S7tjo9OeVtCYoc/8xw3Ta1v2pmdStOc0dBmh0q6oqXvChQAuEHP3y2pU2/gB53PkKgMXFev6cJ7yqdIIvrwHBOlxdhbIcdpbLs2Oe4odnN5T0LFcmkP9J9rP71idWwD9Fyq4jTIF+ahjea76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPlSOydSfaOmxDaN9nGuAiGC/F+P+nmDKeypd2BXKgQ=;
 b=XrjkNoYV7mN8/5/7zDwQ8LlpqgZO1ImVrS+t2XwDl4npgNssxUtCcKFCavgEp3OHVrbaq6by3z33FSUlkjqIcwZec2pdSEYHdFTUk1xFCVf7Ic/bmLRDDLHe4zQ0GzUgelZNAULP1oOHsbNpPQTkuF/lNRRC/TNdsLF8m4IDRmi6t+fisiPcIVIf5foyJ5GpHd+J0oipflshfrnPV/9AKqHy3TDeuLScnfNv0t+LN6uJB6KzEzP+ky7zsN7CP0dAwsshFMu89M+nz3hOZ1PlbtXhBFdup62Keq7NXOI0y562uNk09MdBd/YRvHF7n25uSxfEKOKCEAjJpHHFJjwxAQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CH8PR03MB8225.namprd03.prod.outlook.com (2603:10b6:610:2c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 03:07:50 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 03:07:50 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH] usb: dwc2: handle OTG HNP SetFeature requests
Thread-Topic: [PATCH] usb: dwc2: handle OTG HNP SetFeature requests
Thread-Index: AQHdLh5rUJcunRNxZEW8c3xnXSrT17avs+mA
Date: Wed, 26 Aug 2026 03:07:50 +0000
Message-ID: <e541e9d0-f6d8-43cc-a2bc-5f1c6a139486@altera.com>
References:
 <e1f4718cadf28c4348bcf6ebb025f71732416538.1786950594.git.tze.yee.ng@altera.com>
In-Reply-To:
 <e1f4718cadf28c4348bcf6ebb025f71732416538.1786950594.git.tze.yee.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CH8PR03MB8225:EE_
x-ms-office365-filtering-correlation-id: acade3b8-e63f-4e5c-380c-08df031f3682
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|55112099003|5023799004|11063799006|38070700021;
x-microsoft-antispam-message-info:
 QC0CNzuoE9nh7uSeN7Bd6q+gBRBvRw5P34qoKik8LOWGSpvg5/x80zSXTVgTpwLrMEUtFYFlydm/flaxufKMsXqVBopUntNv0wq2e1276cyHx6c2FJ9IcPiKdudwGe6P0f70groN35mP0uV32wtiH3JZwkvmETxHjz/2gVLBErb67UbnGb1ajRHPwGuA4R1h5O5MV72KwIT0tsJmm2xodHX3ip+nnKTit8EdfpoOQ4Lzpep0SJYbyLvX2hrqOJWA3xNHd9P28DXo4LciZWbQiOoZ8h3fDoYHqENLYQ2iHjtBw/0X5prLulqY5XeOshLVYkxw2aHKsn5dULgYWZdvmUHZQwXc34clPEfHcpBUx33d2rRmXF+whKEZofdB+P6OxwRKjZkecq5bqUKc/wI3amWpZ9O0sz7/utCe1ZNki/9v+1lP9NNoYoP9mYmrGfreKl8Tpom5NHVNgSxNcq4dH5xQiMvPKsZ0ZulGFKm/YgNCdoxAFBNppSanZ1xdugBPwSrNH723Vz9eoWF9bytgXQV+poX7ZBPgwEDtkG3+FICKwR6MpjCqJ89cXqez13QMcdSBekpZg3P4+b540IeZ3c5rnA9braWJHTnbS16XrPVEsrzDPU4mtInMhGyxDGvWqc7XQ1xVeaMFxlIww+6WmRlfZbXeOnP+JMRYZ7oBY/O/WOxfsHc4hx/WlpbFwBseumElC3/AthElPhDbKONLAz6+Er5ddzhDc+xYN8z4sGQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(55112099003)(5023799004)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFVydjNYRVBzZGtpV3FEUGVoamI0NSsvVW1UcnlvQldhWWcydXhEbWlBQTl6?=
 =?utf-8?B?cDAzamZlOGMwYTFTK3pUUjVNVVd4YS95MXJQNFZsYTZCdzdnZ0xCSzBpOUZC?=
 =?utf-8?B?a3BrOWRyWEtNb3lQZTB4KzhCWThZTWF0UGhYeTJ4dUtCNHoyUEUzWXF0ZFAv?=
 =?utf-8?B?dWt3WkkrZ29NUUhOTjZUUmtwL0M2bWpyZXhtckJoK3BaOXQ1eGtUcFpCYUM3?=
 =?utf-8?B?bHp4RE9rNVY1TWFvQjVTRGY0OWtaQTBIb1lrU2lCZ0JqZjlOY3hlWERFR2ps?=
 =?utf-8?B?aXN0RTdqNGhRSENEK0h2MVpGdUtyRVVqSWtLY04zdnk3UGExODBWTng4blYr?=
 =?utf-8?B?S2ZjeVNzcmhMajdRVVk5VFlLdlRNdnNDU2svSDdjcHpadUNQQUVPQ0V1TEw4?=
 =?utf-8?B?L0ZKUEpYellkbVNxL3NhZFRTZ1VJNDlWSGJ1UlJXcDVia3Z2RjNVWnBHSWpL?=
 =?utf-8?B?a21QWC9vSnJxUlBJK09kQmtnTTdkWEE4bTdOU2dxRTkyV210U29DRlUrbzY1?=
 =?utf-8?B?eDBxaUtwbHZyQ3Nrc3RieFlwUERBaWMxQW1KTTJyTDJoNWFXSXdkMElIZXdn?=
 =?utf-8?B?UDU3NDVLUmFFQTJTWU1LNE8xKzRqenQyNzJoaTE1TGFQWmhneGROOHRPWjgz?=
 =?utf-8?B?eUpFK1hqcmlVVGQ2SGQvL2lmWXpmYmplL0pRYmh4eHdzb2h5WHB1N3J6RkFp?=
 =?utf-8?B?U0wvblZKQWQ3cVN3cXRtNjhmV2dta2NYb2VDUHlXRUczRmI5U2tSdGxyTXZa?=
 =?utf-8?B?YWJ3RWZmanZBMGY2YUowQlJpOUFLOG9seUR4a3NwYnVESzVVL0kxME5ZRGdT?=
 =?utf-8?B?alhXd3F1b294aUNVRUZpc1lML2lJTHFVejdkTEFiMFcraG9yMExFQmh5WXFF?=
 =?utf-8?B?emdnVmcyOERZMitXZkZhZnlXN3pXZ05xZExNajhsQ29VSUJlVnFLMVlDeEhy?=
 =?utf-8?B?Q0RpTU0wWUJjQU9FeHpLSFZhMlZpdUgwU0JZdTFvY2RQcnNEbWJyZlRqcTcx?=
 =?utf-8?B?THlPa2lxc0dUa2pJTlRqekdLQUptVDNQb0hieFJmWmI2TlV5dFRWb3lZZTBk?=
 =?utf-8?B?S2RmYjMwN0VxZDYwSXN4Rm13SmY3OFZHY1RFVmxwMDZGNnpBN21FVGRheWha?=
 =?utf-8?B?V3UwK1E2eVpPNkk4SWhFOXVJZnVUNWtzLzMrZzFwUW12cTNqWEhJT3AxTlJs?=
 =?utf-8?B?TTFZY0JhSVM4TXBDQnpMSUk5aEpxbk8wQlhQeGFTWWU2cUZTT3ljOHBHTUtP?=
 =?utf-8?B?TUxNVkw2a00xdnVzaENSUEdXdkNwOWFaWDRKYTF3bWFpcVRHVWZjUlpneThD?=
 =?utf-8?B?Y3ZLSFpUa0RNdkVHTC9LQmlkYSs1eFRjQklmbmNVTXhLWUdKdlo0SHRYK0ZE?=
 =?utf-8?B?NnlwdURnRDRpdmw5UFpqYlhXMWZCUXE5TCtwQUhBbGRMeDBoUHJrVThuc1o0?=
 =?utf-8?B?Sm9JeC9iMnJNd2NOTHlmYlhhMVg5UmNGSkZ5TWZocENTSFJCL2FOVFpKZXF5?=
 =?utf-8?B?RnR6THptRlNWOVNoR1QzZzBEZUp6Q0dQMGZPSytIcnJqZlh2dXBpZTVnWjM4?=
 =?utf-8?B?QmtadGgzSWZzWVdEck1RbXdWS1ZzOWY2L3h5OTBZU3VCUXBnZFRreUxrNEc2?=
 =?utf-8?B?WGF5OWJZOFl4bUZzbG9VYUVqM2dwdzhVWWlhY0loOHMybWk2SzB2OHlSNE14?=
 =?utf-8?B?WFlrZEQrSHl0TlB0SXRUaUN0c1V4SzZLRVZMZkN0WnFlVWN3ZksycW16aE5z?=
 =?utf-8?B?OXpxeTJPRzk2cW5uS1J4QUdySFVWZW1salpuY1lKQUVZMi9sbGd5MFMzWkNr?=
 =?utf-8?B?dlZudGFMOHhWYW9FQkgzTFdyMTBPU2dXRGQzWmw5R3FVMGtMdkgyZ3NMVjBn?=
 =?utf-8?B?WnJzWWF4anlSNHZYdCt6R2hLTlBsei91KytHUjVCOVczaENkaWZFNHZad1U2?=
 =?utf-8?B?UCt4TkNwdGxuQnZZeVhPdUtsOGZ0SHV5WTBMbDYxZlFTaTlyM0xoRlZTeDRw?=
 =?utf-8?B?ZXBMN3l3Sy9saDN5ODZHNUJaTlcxUmNiWFBlQVN5bG9wUXZpUUhNRXg3NFla?=
 =?utf-8?B?clFDWmRXM0JFNlovMFcyTGozTFNJT0dhSnBWTmd4RWFGeFl2dUZ4Q2tOVzdK?=
 =?utf-8?B?eW1ydWtFS0szN2VESzBPVHdrQWVVdFg1UGhsdmlIWFArZmZiVmJPTDc5SzhD?=
 =?utf-8?B?NjVHUE9YUHc4elp2aGhOZjVLUkNpRTlTTVJDc1lSdzlTdTNMWjRkRTFxRklS?=
 =?utf-8?B?MHNkVS9pTXdDVVB2RnNBenlTdm9EckczRVdXd282YXVEb3lJanIydmU2elY5?=
 =?utf-8?B?Zi90bGIvM09nWm9yZ1diY2R0M3FKQStPbGlwWFFHRktxZWFVMzJUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42BD9C5706435F489AB6AAB7D141AABB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acade3b8-e63f-4e5c-380c-08df031f3682
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 03:07:50.2661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmosf6Jn+Ujenauw7Uv/KzArS0YsEm9oTwAKzTvQa4yigOiRznwaVKYVawKwYDMm3juLOK/uGMTkXDOec6f7JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8225

T24gMTcvOC8yMDI2IDQ6MDAgcG0sIE5HLCBUWkUgWUVFIHdyb3RlOg0KPiBGcm9tOiBBZHJpYW4g
TmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+DQo+IA0KPiBXaXRob3V0IGhh
bmRsaW5nIGZvciBiX2hucF9lbmFibGUsIGFfaG5wX3N1cHBvcnQsIGFuZCBhX2FsdF9obnBfc3Vw
cG9ydCwNCj4gSE5QIGNhbm5vdCBiZSBlbmFibGVkIHdoZW4gdHdvIE9URyBjb250cm9sbGVycyBh
cmUgY29ubmVjdGVkLg0KPiANCj4gSGFuZGxlIFNldEZlYXR1cmUgZm9yIHRoZXNlIE9URyBzZWxl
Y3RvcnMsIGdhdGVkIG9uIG90Z19jYXBzLmhucF9zdXBwb3J0Lg0KPiBUaGUgT1RHIHNwZWNpZmlj
YXRpb24gb25seSBkZWZpbmVzIFNldEZlYXR1cmUgZm9yIHRoZW0sIHNvIHJlamVjdA0KPiBDbGVh
ckZlYXR1cmUgd2l0aCAtRUlOVkFMIGluc3RlYWQgb2Ygc2lsZW50bHkgYWNjZXB0aW5nIGl0LiBV
c2UgZGV2X2RiZw0KPiBmb3Igc3RhdHVzIHVwZGF0ZXMgdG8gYXZvaWQgbm9pc3kgbG9ncy4NCj4g
DQo+IEFkdmVydGlzZSB0aGUgY29yZSdzIEhOUC9TUlAgY2FwYWJpbGl0eSBkdXJpbmcgZ2FkZ2V0
IGluaXQgYnkgcmVzdG9yaW5nDQo+IEdVU0JDRkdfSE5QQ0FQL1NSUENBUCBmcm9tIG90Z19jYXBz
LCBtaXJyb3JpbmcgZHdjMl9ndXNiY2ZnX2luaXQoKSBvbiB0aGUNCj4gaG9zdCBzaWRlLCBpbnN0
ZWFkIG9mIGNsZWFyaW5nIHRoZW0gdW5jb25kaXRpb25hbGx5Lg0KPiANCj4gQ2xlYXIgdGhlIEhO
UCBmbGFncyBhbmQgR09UR0NUTF9ERVZITlBFTiBvbiBkaXNjb25uZWN0L3Jlc2V0IHNvIE9URyBz
dGF0ZQ0KPiBkb2VzIG5vdCBsZWFrIGFjcm9zcyBzZXNzaW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnllZS5uZ0BhbHRlcmEuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQu
YyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4gaW5kZXggYzhiMDJjMjdkMjdkLi40ZDkw
NTk4OWMwOWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiBAQCAtMTc4MCw2ICsxNzgwLDcgQEAgc3Rh
dGljIGludCBkd2MyX2hzb3RnX3Byb2Nlc3NfcmVxX2ZlYXR1cmUoc3RydWN0IGR3YzJfaHNvdGcg
Kmhzb3RnLA0KPiAgIAlzdHJ1Y3QgZHdjMl9oc290Z19lcCAqZXA7DQo+ICAgCWludCByZXQ7DQo+
ICAgCWJvb2wgaGFsdGVkOw0KPiArCXUzMiBvdGdjdGw7DQo+ICAgCXUzMiByZWNpcDsNCj4gICAJ
dTMyIHdWYWx1ZTsNCj4gICAJdTMyIHdJbmRleDsNCj4gQEAgLTE4MDksNiArMTgxMCwzNiBAQCBz
dGF0aWMgaW50IGR3YzJfaHNvdGdfcHJvY2Vzc19yZXFfZmVhdHVyZShzdHJ1Y3QgZHdjMl9oc290
ZyAqaHNvdGcsDQo+ICAgDQo+ICAgCQkJaHNvdGctPnRlc3RfbW9kZSA9IHdJbmRleCA+PiA4Ow0K
PiAgIAkJCWJyZWFrOw0KPiArCQljYXNlIFVTQl9ERVZJQ0VfQl9ITlBfRU5BQkxFOg0KPiArCQkJ
aWYgKCFoc290Zy0+cGFyYW1zLm90Z19jYXBzLmhucF9zdXBwb3J0KQ0KPiArCQkJCXJldHVybiAt
RU5PRU5UOw0KPiArCQkJaWYgKCFzZXQpDQo+ICsJCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4g
KwkJCW90Z2N0bCA9IGR3YzJfcmVhZGwoaHNvdGcsIEdPVEdDVEwpOw0KPiArCQkJb3RnY3RsIHw9
IEdPVEdDVExfREVWSE5QRU47DQo+ICsJCQlkd2MyX3dyaXRlbChoc290Zywgb3RnY3RsLCBHT1RH
Q1RMKTsNCj4gKwkJCWhzb3RnLT5nYWRnZXQuYl9obnBfZW5hYmxlID0gMTsNCj4gKwkJCWRldl9k
YmcoaHNvdGctPmRldiwgIkhOUCBlbmFibGVkXG4iKTsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNl
IFVTQl9ERVZJQ0VfQV9ITlBfU1VQUE9SVDoNCj4gKwkJCWlmICghaHNvdGctPnBhcmFtcy5vdGdf
Y2Fwcy5obnBfc3VwcG9ydCkNCj4gKwkJCQlyZXR1cm4gLUVOT0VOVDsNCj4gKwkJCWlmICghc2V0
KQ0KPiArCQkJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJCQloc290Zy0+Z2FkZ2V0LmFfaG5w
X3N1cHBvcnQgPSAxOw0KPiArCQkJZGV2X2RiZyhoc290Zy0+ZGV2LCAiYV9obnBfc3VwcG9ydCBz
ZXRcbiIpOw0KPiArCQkJYnJlYWs7DQo+ICsJCWNhc2UgVVNCX0RFVklDRV9BX0FMVF9ITlBfU1VQ
UE9SVDoNCj4gKwkJCWlmICghaHNvdGctPnBhcmFtcy5vdGdfY2Fwcy5obnBfc3VwcG9ydCkNCj4g
KwkJCQlyZXR1cm4gLUVOT0VOVDsNCj4gKwkJCWlmICghc2V0KQ0KPiArCQkJCXJldHVybiAtRUlO
VkFMOw0KPiArDQo+ICsJCQloc290Zy0+Z2FkZ2V0LmFfYWx0X2hucF9zdXBwb3J0ID0gMTsNCj4g
KwkJCWRldl9kYmcoaHNvdGctPmRldiwgImFfYWx0X2hucF9zdXBwb3J0IHNldFxuIik7DQo+ICsJ
CQlicmVhazsNCj4gICAJCWRlZmF1bHQ6DQo+ICAgCQkJcmV0dXJuIC1FTk9FTlQ7DQo+ICAgCQl9
DQo+IEBAIC0zMzIyLDYgKzMzNTMsMTMgQEAgdm9pZCBkd2MyX2hzb3RnX2Rpc2Nvbm5lY3Qoc3Ry
dWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgIAloc290Zy0+Y29ubmVjdGVkID0gMDsNCj4gICAJ
aHNvdGctPnRlc3RfbW9kZSA9IDA7DQo+ICAgDQo+ICsJaWYgKGhzb3RnLT5wYXJhbXMub3RnX2Nh
cHMuaG5wX3N1cHBvcnQpIHsNCj4gKwkJaHNvdGctPmdhZGdldC5iX2hucF9lbmFibGUgPSAwOw0K
PiArCQloc290Zy0+Z2FkZ2V0LmFfaG5wX3N1cHBvcnQgPSAwOw0KPiArCQloc290Zy0+Z2FkZ2V0
LmFfYWx0X2hucF9zdXBwb3J0ID0gMDsNCj4gKwkJZHdjMl9jbGVhcl9iaXQoaHNvdGcsIEdPVEdD
VEwsIEdPVEdDVExfREVWSE5QRU4pOw0KPiArCX0NCj4gKw0KPiAgIAkvKiBhbGwgZW5kcG9pbnRz
IHNob3VsZCBiZSBzaHV0ZG93biAqLw0KPiAgIAlmb3IgKGVwID0gMDsgZXAgPCBoc290Zy0+bnVt
X29mX2VwczsgZXArKykgew0KPiAgIAkJaWYgKGhzb3RnLT5lcHNfaW5bZXBdKQ0KPiBAQCAtMzQx
Niw5ICszNDU0LDE4IEBAIHZvaWQgZHdjMl9oc290Z19jb3JlX2luaXRfZGlzY29ubmVjdGVkKHN0
cnVjdCBkd2MyX2hzb3RnICpoc290ZywNCj4gICAJdXNiY2ZnICY9IH5HVVNCQ0ZHX1RPVVRDQUxf
TUFTSzsNCj4gICAJdXNiY2ZnIHw9IEdVU0JDRkdfVE9VVENBTCg3KTsNCj4gICANCj4gLQkvKiBy
ZW1vdmUgdGhlIEhOUC9TUlAgYW5kIHNldCB0aGUgUEhZICovDQo+ICsJLyoNCj4gKwkgKiBDb25m
aWd1cmUgSE5QL1NSUCBjYXBhYmlsaXR5IGZyb20gcGFyYW1zIChzYW1lIGlkZWEgYXMNCj4gKwkg
KiBkd2MyX2d1c2JjZmdfaW5pdCgpIGZvciBob3N0KS4gVW5jb25kaXRpb25hbGx5IGNsZWFyaW5n
IHRoZXNlDQo+ICsJICogYml0cyBsZWF2ZXMgYW4gSE5QLWNhcGFibGUgT1RHIGdhZGdldCB1bmFi
bGUgdG8gbmVnb3RpYXRlLg0KPiArCSAqLw0KPiAgIAl1c2JjZmcgJj0gfihHVVNCQ0ZHX1NSUENB
UCB8IEdVU0JDRkdfSE5QQ0FQKTsNCj4gLSAgICAgICAgZHdjMl93cml0ZWwoaHNvdGcsIHVzYmNm
ZywgR1VTQkNGRyk7DQo+ICsJaWYgKGhzb3RnLT5wYXJhbXMub3RnX2NhcHMuaG5wX3N1cHBvcnQg
JiYNCj4gKwkgICAgaHNvdGctPnBhcmFtcy5vdGdfY2Fwcy5zcnBfc3VwcG9ydCkNCj4gKwkJdXNi
Y2ZnIHw9IEdVU0JDRkdfSE5QQ0FQOw0KPiArCWlmIChoc290Zy0+cGFyYW1zLm90Z19jYXBzLnNy
cF9zdXBwb3J0KQ0KPiArCQl1c2JjZmcgfD0gR1VTQkNGR19TUlBDQVA7DQo+ICsJZHdjMl93cml0
ZWwoaHNvdGcsIHVzYmNmZywgR1VTQkNGRyk7DQo+ICAgDQo+ICAgCWR3YzJfcGh5X2luaXQoaHNv
dGcsIHRydWUpOw0KPg0KDQpIaSwNCg0KR2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4gSXQgaGFz
IGJlZW4gb3ZlciBhIHdlZWsgd2l0aCBubyBmZWVkYmFjay4NCg0KSGFwcHkgdG8gYWRkcmVzcyBh
bnkgcmV2aWV3IGNvbW1lbnRzIG9yIHByb3ZpZGUgbW9yZSB0ZXN0aW5nIGRldGFpbHMuDQoNClRo
YW5rcywNClR6ZSBZZWUNCg0KDQo=
