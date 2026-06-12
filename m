Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012043.outbound.protection.outlook.com [40.107.75.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034503A7F4F;
	Fri, 12 Jun 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245801; cv=fail; b=rIeFPHftWSJvUY1EKkoPj2Vl/AF0hzIkxAXfU1njlHXrFHtC/JDtlwHGX86PG4CQy2ONxWj53VTNaXAt5B7jkxTzUm5yNqZ4PBJ2hS0A0ABUXpLOfUkLvZBzIATsLlijri6y4/d9CPySr9Mcu7sgj4nYe0BlmQ83vKaq2rjPoUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245801; c=relaxed/simple;
	bh=jGQt+CIUf1uk5yXQC4DmXZcUjyykZpSU3+Evu81g7wA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hX4z8acJ+rciUoOkFJAEBu7f+Xydg3YCYNp1EdAss0MVQTSBp0cAFbukYAW+uKNkDa950FrgHaxF5bsTyx8uBZx2BjnVnNaIoEpw+z/cjDhEg250+VeK5qT3q3B4UJfsBMMPh4o4zwyeMyAl6vxtWmw+sX+6/TxHjvRMo5V7CHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fqgmBm2I; arc=fail smtp.client-ip=40.107.75.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fqgmBm2I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRB8vr839bCgEyZ4LusR/XGIQeWvjvRqfhpL8wS6ogwjsW/boAdPStncW7WBmvWXhqPZQ5gU1ZU3cxLOArFPBrkAC/yr3MtDwRByGQLfDwFl2rqttkBgxgxlAdsI05Vii4+g34GxwRW5vDsjDAPwnu7CLLLH+KFkrjtmYwOScPUPsaweYwQRsOEszvaDLBsbU69bgnNGUath3Z7IBkzFTD4Xp4Jmp+2tikidiVhnrE4NSwGNIPCMlEwFftB5/ttjF0bebUdY27ic4vVyYZt+lNnubuW5Nms6Nq+wogA3513uT08r7cCTWXRdPJb/ZGnJteiErB6yqlY+sZQqVbyNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGQt+CIUf1uk5yXQC4DmXZcUjyykZpSU3+Evu81g7wA=;
 b=g6vSjoMpg0A3GGNEGoLlFEpKvUs5HGtWCdobMgl3RBMYE3KKWPlCVPAU6nUvJVDEUYL8RyTATLkPEoiLFf8L/4zeAPO0lvx01ma2MUF68/MX9iv/p1L1R3zO2dAsxJegkOy0MnblE5MCA2XW/e/igfTG5xeWje9eIj2j9HlW7XFt/pAu8gDvsox6qfDFg7SS2CffSp9wsAvelbl+5PmG+jzUvVIljKxm2pUveAr0HlPrKE9TrU3+mACzNKQTv3I2I1CBBcvhBrbTr1Q5sdONvxYuRZWToPgKUuFv2FvBeeFeX2EfuB1902OxFPYm8Eb+ZZU6xzT9iKKKGX/vz2E3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGQt+CIUf1uk5yXQC4DmXZcUjyykZpSU3+Evu81g7wA=;
 b=fqgmBm2IJBSpCuwsLhl+OUP2nVcTo6oKlrw08KfCd47uPGATWeTpLvGeMF5sfq41NOLOrdZA5clt1TEnzj58ziqD4t9zFctF99zQyiwgNQ5OIju4q05+GJNZ+RJ+bkI+Bh7/mQ2GZ8QJHuEZWTLrrBSL6Tn5hEK+KStuQ/GoMPmdl2qaCHrAjqzo/pgw8yuNeIEYCOd6D30tD8zawEmnWJ7ER5VMxPpSWIpyzgNkqvmz8q3mQ9qFwLVkQHj5yGTYaq5bAM565AHQiG7MPKydaboGbuZRDuz+J1JNkKQ0Q0ABnj6sX2RL3METOnVk8EZTHHWHUNQtgYMBOmew3P05Nw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SI6PR06MB7271.apcprd06.prod.outlook.com (2603:1096:4:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 06:29:53 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:29:53 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Michal Pecio <michal.pecio@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH v2] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
Thread-Topic: [PATCH v2] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
Thread-Index: Adz6NKxSR+u0OQqJSe+uiRHONUqGHQ==
Date: Fri, 12 Jun 2026 06:29:52 +0000
Message-ID:
 <TYUPR06MB621752A5E7444AC7818D9F71D2182@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SI6PR06MB7271:EE_
x-ms-office365-filtering-correlation-id: 491256fd-f63d-484a-9afb-08dec84c0345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|42112799006|1800799024|366016|11063799006|5023799004|18002099003|56012099006|38070700021|6133799003;
x-microsoft-antispam-message-info:
 oCvSJS2FqQ18I60VMoBcT3g1JapWzzgM6tWREUuo+uWvJPmJlm++xAJoMkL/Pnhj0T+IOKu7POw6m4TrSj2cNz7OnBuN3BhmD4Vj1oQY+dFL3nNI5K49Az5A4RglCBXwIeeLixJqeLmXpNjKjeTTJy1ikPkn5IJBUGodlfNBtc3I1uOfT11Em19jdjEEykTu/imM9omQ+cJNKFgr96VZTa9rUwaXiAXbUBmeXqNbsDrMyIrFwdx45Ak5+rqfhwZH9nDhEKv2Ubt0rEPKVXw9jda42NhIUQYHplH/Y1vVb8j48qeXzj52Iwf1yie1QOfI/Awohy6VuM2dJR8poW4Pxx2klwwA7KvvC5ilYux1zTghqtJci7AHqYs43breUkzVf/04XpmK6fTHgi5Qexl9TwghrVB0JcOb0w5/A3p4faI5xnMYqviZ8QuU79W1cy0rpc0rr+TiN8uXUOTefU8Oer8tWX9q6o4sJrlNJ69Wm4WYLXEqww4J19PAmpSckhFrOEd4k45t9csPU43LjKJss6+vv80uQuTTbkHxgbTkAd1aNTNRvcVIP6ltagiGTL9Ac9Wj4TK+uQQcEJO+/T7zde/+9/LTVikU/QjMzpyUBG/KV10uESwvcMumd/EDk1A1KEPxXTjQncsuEzMAAhfm4XaKjVvHBSGhUAqRB6cNGu78e67wHON3z4SRCmZz0z+z/t2b+kE9SLEJI16Smm+avhlBOnlQT50UZtgN6RmtKE5UQEgBYbdaIaXPwyx5Q6vm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(42112799006)(1800799024)(366016)(11063799006)(5023799004)(18002099003)(56012099006)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cUdBcGZBRHptYkxWbzdMeVE0RW1oeFREazU3b2tjaWp5WkdoUlg1OFNiRzcr?=
 =?gb2312?B?WmVldU5LcHpCV1QzMTBxb01xVS9oVU5GV0ZQeVJWTmpwSzZYaEc5b0ZLeGVT?=
 =?gb2312?B?cjIwdTcyVStPU3hWa1N5aDBacjduRWxmMThNTkVGa0hrTmtnRWhVS3NOVFJ3?=
 =?gb2312?B?Mm9rMlJaemlBNmxOL3JVM0FuSFJZcTI0Z0tqZGQ3OXNQZmhZdkJrZ2M4Z082?=
 =?gb2312?B?RWlRQ255aTBuTGFqY0l2K3J1Slc1WVRDbjF0eG82VEJhTzdvMjJLV3VkYmtV?=
 =?gb2312?B?Yjd0cVNZU2EvYTAxd2UxUm9OcElmdXNxaFJ3QSt3Y05rcWREVVpBRWtZbGtI?=
 =?gb2312?B?YXUzUEY0QXBIM0VYWnBXTk5hLzFoRVZlU1BEeXlrZEg5bWpSeGF0VlBkSUZx?=
 =?gb2312?B?N3h2bTZOR2Fma2JYZzFMdjAzWkFmZXBpUlVrNGpQaEliRmxQYkl4aFpjQTV5?=
 =?gb2312?B?V256VERVODVqMlRwdno3RFpVa0ovQWNSMGk3UTM4alBzMFBiWDFWT0dBZUJF?=
 =?gb2312?B?WE01a3VHajJldXlUaGEvSHpTaUs1RFVCSlRYSFFoNGtmRUovS0pTNWJyWXhu?=
 =?gb2312?B?b2RaYk4vdHV5VGJnUncxVGFGdnh6SVhGalk3Y2pWNUtOeDBOdGdvQlMxQ25x?=
 =?gb2312?B?K3pCU3JpV1ZaWHVMbFZIeGxWNUZxMGtpbUQvOHE0eGNGNEhOVFh5ZXR0VldH?=
 =?gb2312?B?dk9uVExnbnZWbkl3UkZqQi9ONVZmcHE3Vmx0TFRQTFp4a2tUenNVanFWQm9y?=
 =?gb2312?B?WnA1MElCUmhWb3d3WlVFM3B6TjQ1R3RjeGpoeEgvbldERnUxYmpPR0NzSEk2?=
 =?gb2312?B?d3hpUDliY29jdmVaanhub21xRXdOM3ZrM05tM3NXdHZIZkVGSHlBbXkzY0tD?=
 =?gb2312?B?dVdRUGJSanhkR0lsMDhMbEhsL1BKUmR6d2FOck50amc2dUYyVDFoRy9uTVZ0?=
 =?gb2312?B?VUo3U2ptSm9nR053MGVEN3JQMyt6eEtpaytaQmdQazhQVGZCcFh2TkVZMVds?=
 =?gb2312?B?dlhsdDA0eURNdG5mRHB3WmVlTzl6ZmNuV0EwMVhyQy91bUJZMXJlbmVVZldP?=
 =?gb2312?B?VzFWYVhlb00vVU82VXpZTlFsUUdydTcxQm9zU0hiNHZuQnU2MzZYQ0RuZFg3?=
 =?gb2312?B?VFM2ckh2U1N5dFdzMTMyQmdkZm5MZ255V1VLZjA4NFlGZ3BTVVFUN2Y1bUkr?=
 =?gb2312?B?ZzY2QnhrVEYvMXNwcEZJd29ibUI5azNYSUZUSHRWSzZxUVNjMEovdzJnVlpz?=
 =?gb2312?B?SHZva0FIa0dJZEZKTXdwY2laLzNHMndRSTl3OERQNnNGOXMxTXdZTXo5ZTMz?=
 =?gb2312?B?OUE0dmRTK05ZWjc5UmxGQ29palBQUThGMmlmWWkySmM1T2Y1OWtFZHliUFpy?=
 =?gb2312?B?MHpFY3pnejNneWdHbVJvRXM0QTk3ZlBBSEExQlErS3V3SlpKei8yRmdHUndP?=
 =?gb2312?B?VUFyT2Y1bmhyK3NhM0RITW5zN3ZhNlJsR08vUFg1dGJzZ0FBcGRtVHlKT1FE?=
 =?gb2312?B?Zkd3a2dVUHFzeC9yeHpOem5IRG9odFU5UnNlUjBkYWdpSzNOZGNBTVo1MDFF?=
 =?gb2312?B?MDBmb2pqR2JPZU1zMmhSRkZPODRuZll4SGxidXRkMmdzcTZ2SldUdFJyWC8r?=
 =?gb2312?B?QVlaSlBiK2tVT3hlVmNyQ21MMWVsajdQVWo4VGs3VGpicUxJRjRUVXczWEdi?=
 =?gb2312?B?NUNsalg0M0xHbnhiYlEwR3F5YmZDMzRkNGRFM250T1IvaGRqd0F2L1JqUTZF?=
 =?gb2312?B?bTl5eHNqRDNDYjJFQ0xKZHVldHgweE9qTWlySkJteHFoL2NwTkptc2puQ0t0?=
 =?gb2312?B?UVBqRXNGU3MxcVZydnE0MjNMckc1emNDVHRXYVEyeitsVDRPS05HU1lvSkVu?=
 =?gb2312?B?eGlhZVVIeGFLSTVDNnVEMWViY2lRdUczSWtVM0J6QWhpV3dhaVdsK1BTUGtn?=
 =?gb2312?B?YXpGQTdPSmdveWRCbGpUcWhsenFwbnFaNnFESFF6dWhZQXlUR25ZbVN6SWYz?=
 =?gb2312?B?TkRsYThFSFA2dlVwemNWTzU5OW1nQzRXS0NQUWl1YmpIWjU0VHRteE55NEcx?=
 =?gb2312?B?SkpPVDNGWUZCcjRwYWlXRkRXMnJjWUZPemd2M2MrUDYwZVFja2dNQ2xxT2k5?=
 =?gb2312?B?VGs3M2RVUTNabjhEUENmNWxGRDJWTlhGNXJVME1ZTFpWVCtWWmRRODAraUwv?=
 =?gb2312?B?VVJzSklwbWl6TGdreHVmM2F6V25RWVMwVEJ2dDMycUxMaUpSRzFIZkZ2NVFU?=
 =?gb2312?B?QmdrbUs5ZFYyREE5UytxeGJ2WjErN0VtU2NNenZIL0ZYNXFhR2pyNlJxZjdO?=
 =?gb2312?Q?r6rJAISCoh4sZtsj+Y?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 491256fd-f63d-484a-9afb-08dec84c0345
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 06:29:53.0605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cXPrabvcHyuaEc+gmaee+eCIMvujGp0oqS+aCWNZ1YjXikLAwrVzZ0xdmLn6XQXnrvQ9d/ki6Mhk1XjeT6I2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7271

V2hlbiBhIFVTQiBkZXZpY2Ugd2l0aCBhY3RpdmUgc3RyZWFtIGVuZHBvaW50cyBpcyBkaXNjb25u
ZWN0ZWQsDQp4aGNpX2ZyZWVfc3RyZWFtcygpIGlzIGNhbGxlZCBmcm9tIHRoZSBodWJfZXZlbnQg
d29ya3F1ZXVlIHRvDQpmcmVlIHRoZSBzdHJlYW0gcmVzb3VyY2VzLiAgSXQgY2FsbHMgeGhjaV9m
cmVlX3N0cmVhbV9pbmZvKCkNCndoaWxlIGhvbGRpbmcgeGhjaS0+bG9jayB3aXRoIGlycXMgZGlz
YWJsZWQuDQoNCnhoY2lfZnJlZV9zdHJlYW1faW5mbygpIGludm9rZXMgeGhjaV9mcmVlX3N0cmVh
bV9jdHgoKSwgd2hpY2gNCmNhbGxzIGRtYV9mcmVlX2NvaGVyZW50KCkgZm9yIGxhcmdlIHN0cmVh
bSBjb250ZXh0IGFycmF5cy4NCg0KZG1hX2ZyZWVfY29oZXJlbnQoKSBjYW4gc2xlZXAgKGUuZy4g
dmlhIHZ1bm1hcCksIHRyaWdnZXJpbmcNCmEgQlVHIHdoZW4gY2FsbGVkIGZyb20gYXRvbWljIGNv
bnRleHQuDQoNCkNhbGwgdHJhY2U6DQogZG1hX2ZyZWVfYXR0cnMrMHgxNzQvMHgyMjANCiB4aGNp
X2ZyZWVfc3RyZWFtX2luZm8rMHhkMC8weDExYw0KIHhoY2lfZnJlZV9zdHJlYW1zKzB4Mjc4LzB4
MzdjDQogdXNiX2ZyZWVfc3RyZWFtcysweDk4LzB4YzANCiB1c2JfdW5iaW5kX2ludGVyZmFjZSsw
eDFiOC8weDJmOA0KIGRldmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweDFkNC8weDJjYw0K
IGRldmljZV9yZWxlYXNlX2RyaXZlcisweDE4LzB4MjgNCiBidXNfcmVtb3ZlX2RldmljZSsweDE2
MC8weDFhNA0KIGRldmljZV9kZWwrMHgxZWMvMHgzNTANCiB1c2JfZGlzYWJsZV9kZXZpY2UrMHg5
OC8weDIxNA0KIHVzYl9kaXNjb25uZWN0KzB4ZjAvMHgzNWMNCiBodWJfZXZlbnQrMHhhYjQvMHgx
OWVjDQogcHJvY2Vzc19vbmVfd29yaysweDI3OC8weDYzYw0KDQpGaXggdGhpcyBieSBzYXZpbmcg
dGhlIHN0cmVhbV9pbmZvIHBvaW50ZXJzIGFuZCBjbGVhcmluZyB0aGUNCmVwIHJlZmVyZW5jZXMg
dW5kZXIgdGhlIGxvY2ssIHRoZW4gY2FsbGluZyB4aGNpX2ZyZWVfc3RyZWFtX2luZm8oKQ0Kb3V0
c2lkZSB0aGUgbG9jayB3aGVyZSBzbGVlcGluZyBpcyBhbGxvd2VkLg0KDQpGaXhlczogOGRmNzVm
NDJmOGU2ICgiVVNCOiB4aGNpOiBBZGQgbWVtb3J5IGFsbG9jYXRpb24gZm9yIFVTQjMgYnVsayBz
dHJlYW1zLiIpDQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KU2lnbmVkLW9mZi1ieTogTGlh
bnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjI6DQogLSBV
cGRhdGUgc3VibWlzc2lvbiBkZXNjcmlwdGlvbiBpbmZvcm1hdGlvbg0KIC0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1RZVVBSMDZNQjYyMTcxNTNGQzdGQzk3NTc4NzFE
NTAxRUQyMUIyQFRZVVBSMDZNQjYyMTcuYXBjcHJkMDYucHJvZC5vdXRsb29rLmNvbS8NCg0KIGRy
aXZlcnMvdXNiL2hvc3QveGhjaS5jIHwgMTAgKysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2hvc3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCmluZGV4IGE1NGY1YjU3ZjIw
NS4uYzlhZjUwOGVkY2I5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCisr
KyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQpAQCAtMzc4OCw2ICszNzg4LDcgQEAgc3RhdGlj
IGludCB4aGNpX2ZyZWVfc3RyZWFtcyhzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXNiX2Rl
dmljZSAqdWRldiwNCiAJc3RydWN0IHhoY2lfdmlydF9kZXZpY2UgKnZkZXY7DQogCXN0cnVjdCB4
aGNpX2NvbW1hbmQgKmNvbW1hbmQ7DQogCXN0cnVjdCB4aGNpX2lucHV0X2NvbnRyb2xfY3R4ICpj
dHJsX2N0eDsNCisJc3RydWN0IHhoY2lfc3RyZWFtX2luZm8gKnN0cmVhbV9pbmZvW0VQX0NUWF9Q
RVJfREVWXTsNCiAJdW5zaWduZWQgaW50IGVwX2luZGV4Ow0KIAl1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KIAl1MzIgY2hhbmdlZF9lcF9iaXRtYXNrOw0KQEAgLTM4NDgsMTAgKzM4NDksMTQgQEAgc3Rh
dGljIGludCB4aGNpX2ZyZWVfc3RyZWFtcyhzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXNi
X2RldmljZSAqdWRldiwNCiAJaWYgKHJldCA8IDApDQogCQlyZXR1cm4gcmV0Ow0KIA0KKwkvKiBk
bWFfZnJlZV9jb2hlcmVudCgpIGNhbGxlZCBieSB4aGNpX2ZyZWVfc3RyZWFtX2luZm8oKSBtYXkg
c2xlZXAsDQorCSAqIHNvIHNhdmUgc3RyZWFtX2luZm8gcG9pbnRlcnMgYW5kIGNsZWFyIHJlZmVy
ZW5jZXMgdW5kZXIgbG9jaywNCisJICogdGhlbiBmcmVlIHRoZSBtZW1vcnkgb3V0c2lkZSBsb2Nr
Lg0KKwkgKi8NCiAJc3Bpbl9sb2NrX2lycXNhdmUoJnhoY2ktPmxvY2ssIGZsYWdzKTsNCiAJZm9y
IChpID0gMDsgaSA8IG51bV9lcHM7IGkrKykgew0KIAkJZXBfaW5kZXggPSB4aGNpX2dldF9lbmRw
b2ludF9pbmRleCgmZXBzW2ldLT5kZXNjKTsNCi0JCXhoY2lfZnJlZV9zdHJlYW1faW5mbyh4aGNp
LCB2ZGV2LT5lcHNbZXBfaW5kZXhdLnN0cmVhbV9pbmZvKTsNCisJCXN0cmVhbV9pbmZvW2ldID0g
dmRldi0+ZXBzW2VwX2luZGV4XS5zdHJlYW1faW5mbzsNCiAJCXZkZXYtPmVwc1tlcF9pbmRleF0u
c3RyZWFtX2luZm8gPSBOVUxMOw0KIAkJLyogRklYTUUgVW5zZXQgbWF4UHN0cmVhbXMgaW4gZW5k
cG9pbnQgY29udGV4dCBhbmQNCiAJCSAqIHVwZGF0ZSBkZXEgcHRyIHRvIHBvaW50IHRvIG5vcm1h
bCBzdHJpbmcgcmluZy4NCkBAIC0zODYxLDYgKzM4NjYsOSBAQCBzdGF0aWMgaW50IHhoY2lfZnJl
ZV9zdHJlYW1zKHN0cnVjdCB1c2JfaGNkICpoY2QsIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0K
IAl9DQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnhoY2ktPmxvY2ssIGZsYWdzKTsNCiANCisJ
Zm9yIChpID0gMDsgaSA8IG51bV9lcHM7IGkrKykNCisJCXhoY2lfZnJlZV9zdHJlYW1faW5mbyh4
aGNpLCBzdHJlYW1faW5mb1tpXSk7DQorDQogCXJldHVybiAwOw0KIH0NCiANCi0tIA0KMi40OC4x
DQoNCg==
