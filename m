Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012020.outbound.protection.outlook.com [52.101.126.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191372D7386;
	Thu, 11 Jun 2026 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166811; cv=fail; b=raBNXMGkfGB5HTlq/s7xUglV/kAhiJugEHRkOuhF1YqipdhRHSHHPEXsI0LKwnMAG2wjUgqTCnC7XmIB9bjG0mMffLj9rega2tRrHYvgHn+HnkriIDgMc3Sqf9XuTp64k0MGIb7UsfR0BTBJ2+EJis5tJs+T5cIdFb/T65LTeYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166811; c=relaxed/simple;
	bh=O3Stb4XxaT2t+j8zS9+8zEOHvJREuQcsJa7cUbaHwQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KbwBmpdCK6TEZ65qzVjpEK8qfldgn0boiTcy05Dus75nzxqBL+jEeA6A/ECBw0iXZ4Ez1MAUqciISOL3qOACInfR6ED/QXWyL0jwBOaIRFRPS6yoU5n5wmc5KABeQriSZIg19RibWjYPCraZF9S450qSVTyELKf9YP/mXYeq5Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ncO13eC/; arc=fail smtp.client-ip=52.101.126.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ncO13eC/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET5d1aaDra+4HZM66xKXR4NimbiTX1OZD3B8bnIFK2GqWkn36MGz64ar5J9rIpECI/zKEvj2BsE59caDu5ZHcNRyjfmp+uVXEmyBjQQz+y246FJzwqpjvv5qeZgpLLuay3xz7yr4ZBwyCSgm5DyWHprrEeexR6KLITA+5EchAg0MIDf+mgkGAUSPg+xhXS++o4wS9As4g93BjDUzZwWbvzN9HEJhpkK0nWA1StjMtV042M0N2pE1yq0DceSHnj1kHHcu1E2kpJCuTfRIh9/bt7uw4F7zV+iJJHiROEugsyymsix//6xubaLsNlj15MR4S02QI0CYVf8Z1sKQdJOHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3Stb4XxaT2t+j8zS9+8zEOHvJREuQcsJa7cUbaHwQE=;
 b=kEBXbX1/W66kfizwKZ8M1E5hnZR73CEaNHq0bKF+wFgv3AVkr82h6omavI7v89Zr08vdqYGQxLUMTFc+X9XyA2C0N0BgVf9ZhPvM5XrKb/ttFA1/TrSbNZEFeIFjxr8IbxAjpb/1uRd1O+wq9p6HvEj9WTtLjAQy5o8+F/ZPbTfS72+H6bEBnGhWQ1wIaUf2VnZS4DhXq8hzRWCa20OBhaFx7Icb/HxOUbde/KLAuza0lEEpX7RPh4jYfUrdVQ/aV/C1YTHXHwndR1Lqv8mZP6btEeG9BaaBaFvMx8ScuUr5QL+EDe1IV6tITEutmTIyUoFYZNVbwRToDH/RVha56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3Stb4XxaT2t+j8zS9+8zEOHvJREuQcsJa7cUbaHwQE=;
 b=ncO13eC/I+OiZeMhfR/bHW6IxvPLB53FnBCU9/6+vhXmO/NqR8HmJRdfvAyyGr4qK7wKqdWWk1Wlz1GAiwhjl/AMzZerjND7sRQ+9C9Z/Zn6xvuV/lQ6NWEzqOH0mG7rVPnnHDXe7j+W2yVoNZmiJTNaCWFmjX57Of3QBI1nkjhHXNxc9hQmsE87AOW0L5dKFm3rmyrx184CE4P1n99lyEICwx0zT1VrL59fPCIH8Co3t0rLPfLy8iJUDx+T4t/cgYhHCxJZow3tknKJpYC1v4GdvvIiTuepb3lxOK2qBjOzBS9wUuDJ6/SO//nx65GZPXc+vnYlR1x01niD5GdDWg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB4989.apcprd06.prod.outlook.com (2603:1096:101:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:33:22 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 08:33:22 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "sarah.a.sharp@linux.intel.com"
	<sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHVzYjogeGhjaTogRml4IHNsZWVwIGluIGF0b21p?=
 =?utf-8?B?YyBjb250ZXh0IGluIHhoY2lfZnJlZV9zdHJlYW1zKCk=?=
Thread-Topic: [PATCH] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
Thread-Index: Adz5bL4JO2Aqie56TjeTYrhhycmoBgACYYoAAABbn/A=
Date: Thu, 11 Jun 2026 08:33:22 +0000
Message-ID:
 <TYUPR06MB62176F41E25F9A5C5FA5AD52D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260611094526.2f5ddbba.michal.pecio@gmail.com>
In-Reply-To: <20260611094526.2f5ddbba.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB4989:EE_
x-ms-office365-filtering-correlation-id: 75bd32aa-c925-4dd9-d98b-08dec7941905
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|42112799006|4143699003|6133799003|18002099003|22082099003|5023799004|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 LMNsXSWnEBpYZN4jCDCLErPLt5W4CHOfElgqxqcmZWjDZi5BhBk3Sd8h5wJdUb1DCmS86fVVQilVvC335WfwvTGIkdj4uAYyja3EDzXTlWuF/0xEwsx6K2olrQtF4387lU9/YnCZeX9RT7s//a++WoS6lyuZbkH4be2ZJvCEB73SVbp9KmAZ3tvpoqEqOyitKQvJ0QJuk8Nm6vC0L/GwOh4X1h+mPH2FjfMYURjkvZdSDEW8J8TA2+c43DSiY2hSrs7g34deiQG1Ejo27UwSPzHcwIQpn59LYrK2yAE4sLUywdMNympFlAzIP1sI7hZ9mbmvvX2sueuFVdzO7KNy3c6WMJ1biu3Nm9e6ANcaKXbaGkUYyUHieWXH7vcLiNn78dVlTtVFebmCrHnfOwM1zRuuAt3Ngr9SpU4SiWK1/25AG9IWDw7VejeYQppDdw2UY949a7hbFEv++FcAg/PIcqx/dMpcYTNwiP+mfz+SLf/7JD1WvhU07ZLIxdbje0FgA5Ndw8CmgmrIu4JjWuWLudAM9xHJ0JTIS/juuE+NXML6CR2xe+/3htWBkqnKGGIdO+nKoVatAK0lljtmp437MVwhYFDwjydwXT8SgE5k8mMfD79QpV8/EtzJEP69lgCnTAHWuAWEVT4mm5CGSw5hheFD+PPQuO6Sr0fNJVaSHnFnIsq81C5s/r+zpO32YTucjpn7Qbi7umc0BbsJZQfden9t0uF9J8C9Ci73/DcQQC+8w+mT7fhYsBIXhDOxqtwH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(42112799006)(4143699003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmoraUdxWGU5T0FCclpUK1gxWVQ3WmtOMXJScEZkZmpDd1hqS0t2NDIzdHVP?=
 =?utf-8?B?Wk53YXpVYXRwQWdjQVhvZlNvbjRiZmtyN0IxTVdnUDB4Q3YweGpsU29xOWJs?=
 =?utf-8?B?ZWkyeE5tS2dGN3dObVpNb054WEpjQmplenNLNUdPY3pBRms4NXNWemlLYXMz?=
 =?utf-8?B?ZmdhbXJpY2JldGp4SW0xZjR5Z3hkQldJQUhadmkrcTJlZW5TcWhnaFdWWE1J?=
 =?utf-8?B?djJGUW9IbWFHaDRSdkdXYVhlaHBMSUdsSWExSjErbWEwQ1dnM0ljb1g5aElk?=
 =?utf-8?B?MXVUZmxVbCtIcWxSaXpsekIvMzY4djByVGJQbDgycnpISVpDM1hQMzhvejdj?=
 =?utf-8?B?MjhMSTZsVFBFN0lEZGVhbTB5dnhJNTFOTUdLeCthckJtZG4wOG9hUmRQOFZw?=
 =?utf-8?B?Rm5PZGNoWDY2ck9CM2dGb0x2RXduMm54UUhaTjQyWnJmNUJuOXF4ME51bG5Z?=
 =?utf-8?B?M2F3aEJHM21lUHM5TUdYdG5QczhRbzRQTXNsWG5nK1VMaWFDSGQyeXVhSEQ4?=
 =?utf-8?B?d2VjWHJpT2ZJTGo2cjBLd2s1cU5rdGlLb08xVE5SV0R5ZHl2VkM3WGEzYlNK?=
 =?utf-8?B?OG9TTjBsYm5iK2FKd1c3Q1N2TEJzYUJRcWRXZEQ4K0xzVVZmSUdINklwVTZS?=
 =?utf-8?B?dEpBR1lXWmFycm9wdHVINnRoUDFHYmxWOUdUeFYwdHNYL3grNXdNWXRCVCs5?=
 =?utf-8?B?VUFkUUVDd2xseFpaY0VEaFduNmRXSkovMm10ZjlhMEJaMmt5cnRaWHRvYk5T?=
 =?utf-8?B?dUhabnhNV0FaZzdzOC8reFc0clYzTDNzK1VEOHNINHRkNGtwOTlEVGJnTDJS?=
 =?utf-8?B?SWtZaE5ha2RWMkpOUjJUMklHR092dnk4UUMvZ2M5WjU1bVhjODlwWFBnWUhZ?=
 =?utf-8?B?Mi9GS3VqQ3ppSkJEdHhSVEVBZzlibVU3bTlMUzltNEVLOEVOZjA3Y09yZzZZ?=
 =?utf-8?B?NkI5QUVNN0lwRG9sS0ZOVUcwZGtKTCt1R2pKTnlRSHVVL252U1FzRGNJOUp6?=
 =?utf-8?B?M29xT2FTSHdid2FxaDlXQnl2d2VSc0dGVFVvalZ4cGRod3ZtWDNUZFNjdG55?=
 =?utf-8?B?eEdheTEzejY3TUFhemhRckdyVEJiZTFDMkJjMU5OUko4a1MreER0dW5FRGJO?=
 =?utf-8?B?TzBuMXdSYWhCZ1Jvbk5DaWNuWmc1Q0Vla0U3MnNYNGxHTnlCbWpBdmFROS9k?=
 =?utf-8?B?ek12T2VJL0JQZGVnanJsdFNYMTRCTkNXbWJwNGViSTd6UEs2czZrQ256TlI4?=
 =?utf-8?B?OGd3TnUvVDRNSFppSVZwNjROcE9nbDFZMEtYL1dJdWc5d3lzcjU5VklvVGhu?=
 =?utf-8?B?ZzhleTQ1RlVlUjY2SHZXZzhpUXg3RkhjQ2w0UVh1N045cFBrMnpyY1hsQldh?=
 =?utf-8?B?U2l2OUxGK2FsTE4rdmlBOUlubGRkN0FqMXB1WE9DaG14MUJxMTMxSXlpU21L?=
 =?utf-8?B?K0U4WFdFNEhoY3pldm5FNEUrNVpMbUcyanFrdFJScElWd1M0VlhqaTR0c1I2?=
 =?utf-8?B?QXlYbE9aYnQvYkVTekErMnd2L2dWL1ByTDJTQWhkenExUURRZFl4M0ZlVjhB?=
 =?utf-8?B?M1ZjLzZmanNia2gyQ3JHbmx5dnVLdHBCSXpJaExnbG4rK1NjeVFjVXVyZG9p?=
 =?utf-8?B?d0N5am1KaWJwdDRZTlM0RjBqaTllN21FTTJBNXhVUGJuWldjaE01S0RBZDV1?=
 =?utf-8?B?N2lZWHUrUTZEZGFsbGdXcG9DRzVrNXY0Q3JlOVZHQkFLUlpuWHg4S2hvSnUy?=
 =?utf-8?B?czduTGVzbGNObjZFK1VsQVNraGNYbkJxTm1sd0VqM01DTGZjTTduUDJKV01X?=
 =?utf-8?B?RWtEc1BnTEUyR0plUk1uaktQWVRBbWJyaWFYbHFGNXpKYXpMdmthR0xKQ0xJ?=
 =?utf-8?B?Zkl3UXdZVXZWNGFrRzVOVFhxeGd3cVRRV1BKNjdhZ21tdzJaUTdldVZ0Ylcx?=
 =?utf-8?B?RHpPVmkxa0pCWWxrZE1GZlg0blFISmwzR0FsVGI1dXZLOGpPTDJyZWZmZVNj?=
 =?utf-8?B?K08vcVhjSk1yWVBXTENybEZycDlwZkluRW14THFkc0szWW9RK1dYTGllTmww?=
 =?utf-8?B?dFNOWml5WWpJRVBNQ0lPbXVBZ0V6aWhWcVJiYVBIcFlaUVM0eXNoeUgvamVR?=
 =?utf-8?B?K3Q4Z0lYSmZ4OTcxWFh5alFLSG4zWWFob1FmemFYN1E5ZXpMSG52b1A0NDV3?=
 =?utf-8?B?VUluMzZ3K1BKZnowdDk4YzBqV2RPeFJyZlVSMGowU0V1cTlQR0wxdXRnZ1pM?=
 =?utf-8?B?SmIzNU1HT3NTN3Z1ZDVIL3pQOWthbWU0bHBmaFVEbC9DeDF4SVJ2MFh4WVRh?=
 =?utf-8?Q?bPwleS4hIkAaNLcsDp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bd32aa-c925-4dd9-d98b-08dec7941905
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 08:33:22.1843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkwX9/1C0/sVDalYi8GrE7IV49AGIveVyqcyj3i+HI6fxrhSYGsMFXyFpuKGl8sXIynF/RmLMg4HWOnU+OgJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB4989

SGkgTWljaGFsIFBlY2lvOg0KDQo+ID4gV2hlbiBhIFVTQiBkZXZpY2Ugd2l0aCBhY3RpdmUgc3Ry
ZWFtIGVuZHBvaW50cyBpcyBkaXNjb25uZWN0ZWQsDQo+ID4geGhjaV9mcmVlX3N0cmVhbXMoKSBp
cyBjYWxsZWQgZnJvbSB0aGUgaHViX2V2ZW50IHdvcmtxdWV1ZSB0bw0KPiA+IGZyZWUgdGhlIHN0
cmVhbSByZXNvdXJjZXMgd2hpbGUgaG9sZGluZyB4aGNpLT5sb2NrIHdpdGggaXJxcw0KPiA+IGRp
c2FibGVkLg0KPiANCj4gUGVkYW50cnk6IGl0IChjdXJyZW50bHkpIGhvbGRzIHRoZSBsb2NrIHdo
aWxlIGZyZWVpbmcsIGJ1dCBpdCBpc24ndA0KPiBjYWxsZWQgd2l0aCB0aGUgbG9jayBoZWxkLCBu
b3IgZm9yIHRoZSBleHBsaWNpdCBwdXJwb3NlIG9mIGZyZWVpbmcNCj4gdGhpbmdzIHdpdGggdGhl
IGxvY2sgaGVsZC4gTm90IHN1cmUgaG93IHRvIHBhcnNlIHRoaXMgc2VudGVuY2U/DQoNClRoZSBh
Ym92ZSBkZXNjcmlwdGlvbiBoYXMgYSBwcm9ibGVtOyBwbGVhc2UgdXBkYXRlIHRoZSBkZXNjcmlw
dGlvbiBpbmZvcm1hdGlvbjoNCldoZW4gYSBVU0IgZGV2aWNlIHdpdGggYWN0aXZlIHN0cmVhbSBl
bmRwb2ludHMgaXMgZGlzY29ubmVjdGVkLA0KeGhjaV9mcmVlX3N0cmVhbXMoKSBpcyBjYWxsZWQg
ZnJvbSB0aGUgaHViX2V2ZW50IHdvcmtxdWV1ZSB0bw0KZnJlZSB0aGUgc3RyZWFtIHJlc291cmNl
cy4gIEl0IGFjcXVpcmVzIHhoY2ktPmxvY2sgd2l0aCBpcnFzDQpkaXNhYmxlZCwgYnV0IHRoZW4g
Y2FsbHMgeGhjaV9mcmVlX3N0cmVhbV9pbmZvKCkgdW5kZXIgdGhlIGxvY2suDQoNCj4gPiBJdCBj
YWxscyB4aGNpX2ZyZWVfc3RyZWFtX2luZm8oKSwgd2hpY2ggaW52b2tlcw0KPiA+IHhoY2lfZnJl
ZV9zdHJlYW1fY3R4KCksIHdoaWNoIGluIHR1cm4gY2FsbHMgZG1hX2ZyZWVfY29oZXJlbnQoKQ0K
PiA+IGZvciBsYXJnZSBzdHJlYW0gY29udGV4dCBhcnJheXMuDQo+ID4NCj4gPiBkbWFfZnJlZV9j
b2hlcmVudCgpIGNhbiBzbGVlcCAoZS5nLiB2aWEgdnVubWFwKSwgdHJpZ2dlcmluZw0KPiA+IGEg
QlVHIHdoZW4gY2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQuDQo+ID4NCj4gPiBDYWxsIHRyYWNl
Og0KPiA+ICBkbWFfZnJlZV9hdHRycysweDE3NC8weDIyMA0KPiA+ICB4aGNpX2ZyZWVfc3RyZWFt
X2luZm8rMHhkMC8weDExYw0KPiA+ICB4aGNpX2ZyZWVfc3RyZWFtcysweDI3OC8weDM3Yw0KPiA+
ICB1c2JfZnJlZV9zdHJlYW1zKzB4OTgvMHhjMA0KPiA+ICB1c2JfdW5iaW5kX2ludGVyZmFjZSsw
eDFiOC8weDJmOA0KPiA+ICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgxZDQvMHgy
Y2MNCj4gPiAgZGV2aWNlX3JlbGVhc2VfZHJpdmVyKzB4MTgvMHgyOA0KPiA+ICBidXNfcmVtb3Zl
X2RldmljZSsweDE2MC8weDFhNA0KPiA+ICBkZXZpY2VfZGVsKzB4MWVjLzB4MzUwDQo+ID4gIHVz
Yl9kaXNhYmxlX2RldmljZSsweDk4LzB4MjE0DQo+ID4gIHVzYl9kaXNjb25uZWN0KzB4ZjAvMHgz
NWMNCj4gPiAgaHViX2V2ZW50KzB4YWI0LzB4MTllYw0KPiA+ICBwcm9jZXNzX29uZV93b3JrKzB4
Mjc4LzB4NjNjDQo+ID4NCj4gPiBGaXggdGhpcyBieSBzYXZpbmcgdGhlIHN0cmVhbV9pbmZvIHBv
aW50ZXJzIGFuZCBjbGVhcmluZyB0aGUNCj4gPiBlcCByZWZlcmVuY2VzIHVuZGVyIHRoZSBsb2Nr
LCB0aGVuIGNhbGxpbmcgeGhjaV9mcmVlX3N0cmVhbV9pbmZvKCkNCj4gPiBvdXRzaWRlIHRoZSBs
b2NrIHdoZXJlIHNsZWVwaW5nIGlzIGFsbG93ZWQuDQo+IA0KPiBJIHdvbmRlciBpZiB0aGlzIGNv
cHkgaXMgbmVjZXNzYXJ5IG9yIGlmIGl0IHdvdWxkIHN1ZmZpY2UgdG8gc3RhcnQgd2l0aA0KPiBj
YWxsaW5nIHhoY2lfZnJlZV9zdHJlYW1faW5mbygpIHVubG9ja2VkIChFUF9HRVRUSU5HX05PX1NU
UkVBTVMgc2hvdWxkDQo+IGVuc3VyZSB0aGF0IG5vYm9keSBzdWJtaXRzIG5ldyBVUkJzIGFuZCBo
b3BlZnVsbHkgY29yZSB3b24ndCBhdHRlbXB0IHRvDQo+IHJlLWVuYWJsZSBzdHJlYW1zIGNvbmN1
cnJlbnRseSkgYW5kIHRoZW4gZ3JhYiB0aGUgbG9jayBvbmx5IHRvIHVwZGF0ZQ0KPiB2ZGV2LT5l
cHMgc3RyZWFtX2luZm8gYW5kIGVwX3N0YXRlIGZpZWxkcy4NCg0KSSBjb25zaWRlcmVkIHRoaXMg
YXBwcm9hY2gsIGJ1dCB0aGVyZSBpcw0KYSB1c2UtYWZ0ZXItZnJlZSB3aW5kb3cgYmV0d2VlbiBm
cmVlaW5nIHN0cmVhbV9pbmZvIGFuZCBjbGVhcmluZw0KdGhlIHBvaW50ZXIuDQpUaGUgeEhDSSBp
bnRlcnJ1cHQgaGFuZGxlciAoeGhjaV9pcnEoKSkgaG9sZHMgeGhjaS0+bG9jayB3aGlsZQ0KcHJv
Y2Vzc2luZyBldmVudHMsIGFuZCBzZXZlcmFsIGV2ZW50IGhhbmRsZXJzIGFjY2Vzcw0KZXAtPnN0
cmVhbV9pbmZvIHVuZGVyIHRoZSBsb2NrIOKAlCBlLmcuDQpyaW5nX2Rvb3JiZWxsX2Zvcl9hY3Rp
dmVfcmluZ3MoKSBpdGVyYXRlcw0Kc3RyZWFtX2luZm8tPnN0cmVhbV9yaW5nc1tdLCBhbmQgeGhj
aV9oYW5kbGVfY21kX3NldF9kZXEoKQ0KYWNjZXNzZXMgc3RyZWFtX2luZm8tPnN0cmVhbV9jdHhf
YXJyYXlbXS4NCklmIHdlIGZyZWUgc3RyZWFtX2luZm8gZmlyc3QgKG91dHNpZGUgdGhlIGxvY2sp
LCB0aGVuIGFjcXVpcmUgdGhlDQpsb2NrIHRvIGNsZWFyIHRoZSBwb2ludGVyLCB0aGVyZSBpcyBh
IHdpbmRvdyB3aGVyZSB0aGUgaW50ZXJydXB0DQpoYW5kbGVyIGNhbiBzdGlsbCBzZWUgdGhlIG9s
ZCAoZGFuZ2xpbmcpIHBvaW50ZXIgYW5kIGRlcmVmZXJlbmNlDQpmcmVlZCBtZW1vcnkuIFNvIHdl
IG5lZWQgdG8gY2xlYXIgdGhlIHJlZmVyZW5jZSB1bmRlciB0aGUgbG9jayBmaXJzdCwNCnRoZW4g
ZnJlZSB0aGUgbWVtb3J5IG91dHNpZGUuDQoNCkxpYW5xaW4NCg==
