Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013080.outbound.protection.outlook.com [52.103.46.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FAE4E9C0C
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 16:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664024; cv=fail; b=beSsvFotqSdbDdsPJkEvtsGVw9G7sIol89Udktp9qLKpoM/XsZf+eNXRpG2lQkWAmsd+M2UeoKebM9XZbvg+2KOe+I2D101cNbN0QSg9I3ZUmPMTFLdvHE+LrX/L7x8mBL0K6L+LswM/PvUxlTaVh2VDccJAAdC8R+RTWyDEpHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664024; c=relaxed/simple;
	bh=XGi0gL3257i+pZNqUTVkwyWfOMb2hpVr5Ybi7eYzxBc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Hyid+JNu6FucYbGsfcQRCJAYrK0gkpoVfnv+sr5WNk86cZxGyzpMBbeRrWarzxF2plJghooG1e2SJp8m+Bjcku6ETAaWLNX9H0qeBA7/QEZtkb+pa0OYuRd7b5NdYJpNQXKbJmKU5BPZ2XGGrfN0A9a3pQXT2vl157i68hmaow4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mRx8wYMe; arc=fail smtp.client-ip=52.103.46.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mRx8wYMe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udAQKNZaqrotTNyOY4tCZP3lKF+uOyNZ3E4EkAO5DXn6UEdqvsqT3kDViiKS8pPC9YlVdoLVZLHMvmf4LLD9nNpvwTOh0bXta8at+ihf8q+vc19sTkMF9rGnzG6tQpLLJbtnsuhq+1hGMxPK2v2xjn0/Oohi5tCLZKaXtfklNf0vtWSQzEsrM+HX0uWONeHxlkrnNQwOZmvdRkqdsOXS2SQv5PzaObaBdVVHLPNSziFKfFnkYcm84tB9YRg/l/3VvRMYdDpqakRzr03BB/WIxK9OBpVjefcfW0S/+meGz6EWqprZdAQLKUQ0tdeuFFpUrqdDFSOSiNgiznofmupk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGi0gL3257i+pZNqUTVkwyWfOMb2hpVr5Ybi7eYzxBc=;
 b=oXr84dfAnFYrbK1d7IGaWHCtARZY8y1Xl/QZfz5a/5XeqWoGIescX4+8DI9SZxfbgS8of+MPELTp6ZYzlykZgbJVFPfRfP14NDi6pCGqAGGJnE6gxnxv79KVNRpuRwNWtdiBX2KZ8X43dBRFw/NvnYEWAt4sW0b79PvUTjJ8ERq90m2wkDxnLGhnDxoghg2GqLsuBAFHMSFmy6G9u8lNVk2DGfc1GTOesnWzt+kocMlcGimq90K7TEDNOncaqzC1WKN0WpDfmDsb4Lesv5EMvKgqovIqE5oK5FCFT3V/kmAAewPvOQuVjKJ1kN1wtiBA1UpKq/iHe0rGyv3rf30X2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGi0gL3257i+pZNqUTVkwyWfOMb2hpVr5Ybi7eYzxBc=;
 b=mRx8wYMeU59hZwR+ht+FLR+1w6SGXU97q4Q+EwdHR7o62HFKmgtTYzBPUjwRlymW2cgkwWspNnN4n+WV4eOwGFDrB2Gbrwz8xH/9kRBmz20Rdu51/hpMQcTIVX/17kcqGAavRv0osdzG8WbA7OO7UEb35G4hJN8ztOAUpxEwYa7Xh3ZVUGF9/quQ9mcU3h1p2xiRJb3dSinowi8EFL/YKhCkVIyS9Y6AgJ1zmGQkZ9dfaSSclQ5P5LdUqY/YgQG+9wMqEN9U1vmA4zkN3f6MNy26j6pS4V4HP901kkbN5ekSo/NtesPkb/iv6RkIyd9wUF5CHFZcADuKDqg3cLvAKQ==
Received: from AMCPR10MB992216.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:783::23) by GV4PR10MB9594.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:2ec::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 16:53:37 +0000
Received: from AMCPR10MB992216.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fae1:c88d:c639:ec9a]) by AMCPR10MB992216.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fae1:c88d:c639:ec9a%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 16:53:34 +0000
From: Bennett Kane <bennettkanedjis@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: merdi
Thread-Topic: merdi
Thread-Index: AQHdRsUTT6WSscIlIE6unqKi1B91Fw==
Date: Thu, 17 Sep 2026 16:53:34 +0000
Message-ID:
 <AMCPR10MB992216D26C8A157DF174EDD37CABB82@AMCPR10MB992216.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMCPR10MB992216:EE_|GV4PR10MB9594:EE_
x-ms-office365-filtering-correlation-id: 6b025e5b-bf56-4dd2-ff9d-08df14dc3633
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|2604031081799003|9112599006|24071999003|38102599003|8062599012|8060799015|19110799012|8040799003|6050399003|4140399003|39105399006|20031999006|22081999006|14065499006|3412199025|440099028|16045399007|102099032|3420499032|40105399003|2607281247196008|11120399003|3430499035|10035399007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1/CRho5b8AsOBKQW+VZeoat8+lRNVdNZ2T128XCzvkLRe0sre3XCuIYpIIAK?=
 =?us-ascii?Q?PIkFudfyi47LycnJ1yuU1xfJkmygb7ohg9qwvyjmnkB2LIlePU6l9XLEVPkn?=
 =?us-ascii?Q?m5osSQfyrh6JlcuP6k/h9YIkg+l34i0Rab7aFTwRy4cLXvcDSBCopcMxqV6B?=
 =?us-ascii?Q?4ikkA5bng6DB2Bdki8zmZdugOsyx95zjfz+9e0goPIQ/LPWkqrauIky3I9U1?=
 =?us-ascii?Q?OuQdTsg2mBBHpCAZXTfKq+olE7UjzZH1DToeruRS9ZZoK+6NeXJEb1lh1RBk?=
 =?us-ascii?Q?3qU6b4cwqh1Lcc4n4IzABLYv1ilePaO7aRF3ZuYr49pEaRcFyK42rVBAaboe?=
 =?us-ascii?Q?KZcZ3wG4n0BMtp2wF0EuJmC30g+FxfMvMVvuuNGnWBTpjauYVWks/VXYk3YW?=
 =?us-ascii?Q?wS59WS0BPfCYv0cSI8R4HDat83nNSMmK13AkSx6LFQSeI9VpMJvlICXH/6KQ?=
 =?us-ascii?Q?0fO2ckYnjNVMLAmeEQHDgv63KivEc1z5nqwZMXtMhqEWaxN6A2Rq97oQ7af6?=
 =?us-ascii?Q?xaH8VbVZ0d8YZwPd3AJiYHBFvWSgWzge1G3wB3t6bjDlCtU2ET/HggecykIA?=
 =?us-ascii?Q?uwJu/EjW6qRjw/wsrIdtuVvFg8meKPTYWmFZb3xEk2UdQx3+YbbvGw+PZ+kM?=
 =?us-ascii?Q?lTFJRcNwEEiGTIaweLU/bB5YoucGpMsH1h2PFNCeqvlXRA7743L33IP75kVW?=
 =?us-ascii?Q?l6fpV/WlzLVaWhKjw1jNXyG/9hT7t08FRFOyDPQY0h2ymzK4tFo0ur6Ukqg4?=
 =?us-ascii?Q?/HQBRZYrLxh/ZTPn/YVoRwnx57vM3Ldktbg+iK68zXrixoP783W76YKGRONa?=
 =?us-ascii?Q?cjkv1alj4YfcnoYdk0u1+dlppkZhwH/m9+CU1xyXHw/Lz+qSZat2bAtFVHPl?=
 =?us-ascii?Q?pwpYSUNKvuWACQv3pd6igqzfEd0ZcSkAdxO1U9WwC5pWbVY4IF3ThlnsemWc?=
 =?us-ascii?Q?EJapqKAsiNITGr2dauoGrEqKv9M2oqC0TN6MwhVev0TA0f9Hik61NW8CRJlx?=
 =?us-ascii?Q?62IlVshglQmWaN+QGJDMdDntJvpiybc3xs2fyVvknWv0gDaNrQj/RjLESFT9?=
 =?us-ascii?Q?C0WGlx2u7ZYYW+eW861+6OuWzJOxx8FejXiIRaW4X1YJPpAms8ejse2e1L6s?=
 =?us-ascii?Q?50e5Ic756TkttH9vRXIc1l621ACEN5ATNQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fQi/bwFgeKPTUw8xjmDr7M7S/j7DgQGfD5Ll/CLpEs/8j7FgsRK0N6SNfAQI?=
 =?us-ascii?Q?LiSfHnxakxZtgDBVehWoF+IjibISNvlnl5BLyszTbsdEiHsv/ICHLt/POJP8?=
 =?us-ascii?Q?Tb40Ndc6gFFNIYABOiZ89k0wPYjnPViOqZl3eWk1CzhClZfUtYYrrhSLrlKW?=
 =?us-ascii?Q?5hbj0FGfn41mmNoCqUtcMwvqFLqqT75E3kMjr+BN7mpUgvHyGql4B6gfd3Ww?=
 =?us-ascii?Q?CaVZjdo5c2OW6RwcGOLUVkASi1co/cAsfwxMub6u/G/CN9xrsX6DYRMEXUIB?=
 =?us-ascii?Q?N0f2SL0Bk8q+R6JVh9J6I2AiUfbKzbsN9uKUTOa2x3/bhPkWo7vSt3pLqUsH?=
 =?us-ascii?Q?yb+YRk3EsGCGMEKC9Z7C93qCX91q2RDXInaxfQyr71p4Mjkr6hLfggBXsE7G?=
 =?us-ascii?Q?QGpD/cqRTP/Vk4HjQ+H4Micnup7LSi8aFU/XldN8v8aYDOt6xIb6Dzl7Qaz/?=
 =?us-ascii?Q?DtE2FgIRUMq1cZSFfdCq2Wtzt7rEHQfkOh8qn5RNUA6bCyCk6atly1cfdBTn?=
 =?us-ascii?Q?5GfnW8ihop0SO0MsKzqKEdFrtmhkg/mbDvsBr5bc81NXEOJAlBc2meqoCSVM?=
 =?us-ascii?Q?pqY+KoSKG7W/pdwzCLhgKrA5AN+yj9KMTCsU3UnDHdJ6bouEYBX1rn4wHQy6?=
 =?us-ascii?Q?vudyJQY0bV+HdRi3NhP6V2hUCuKguNs24X36rH8h2sA9ZBMMcaieKG8YknR6?=
 =?us-ascii?Q?LVlGBz98Oi0rn7EX8wH8eLGoPZK8qZEGZc7PF8F4G4ZRUs1toyfTC3iGQ1tu?=
 =?us-ascii?Q?QlTkamTBfmAWxtSow2ytJf5vI+/WXATsYZGJynp5FmABNzP8cYQFZ/UAPGTi?=
 =?us-ascii?Q?pMV2vircqsrXn3xZX2r6VG1wANjast6NBBqcrRW+nASke489J5u4FBUHTPv3?=
 =?us-ascii?Q?RlOPrtPgGgeRszNRAl8wcnBwsYLttHlfyEr+LRbYlTjzI0HHZ3qseqI5shLm?=
 =?us-ascii?Q?o1DiDmovclHAiIAsEOsqBgKPli3AEr98g/iXBI2JBGPGXhlf/0g2H7fytR6p?=
 =?us-ascii?Q?Kh+xX7o/NRuiHfykx1WXbBTzouuWW3V5p9Y9uR+K4U9vLYJhvCEiixTLH1jM?=
 =?us-ascii?Q?aDzO0KuzhjnpfrCPKMO7iZkVeEIOJEfGimw7t7QaBvJq554Fl5VXaEbNMhic?=
 =?us-ascii?Q?7O3w9iyUH3w0fjdvyFZBQrbTb9dxa8Ceup4ydvCykAsx00+dDJ2k6DgbN3db?=
 =?us-ascii?Q?HnWBA5RlC/9wVslJSwNsSgw1c9VNcHAQk3X1yUSqQUBJA8f+u3poBwh5D6bK?=
 =?us-ascii?Q?RLwnLkKMBZGNhM2aHKJdQu1PNSFKEH02ftdeYq0rewC4+eqIS7UW29q7WcQe?=
 =?us-ascii?Q?Z7Zwz4Z6M0Yn9VigvYne6SBaOqSqH5VESBVIViid5But/3OUETgXgooNUyba?=
 =?us-ascii?Q?WpZVjEF5K8oEIiT9ICOFJy56eZcL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMCPR10MB992216.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b025e5b-bf56-4dd2-ff9d-08df14dc3633
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 16:53:34.4563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR10MB9594

yjheewaepupg---real^^news=0A=
uoekmknswugkhttp://45.77.177.37=0A=
rckgiqozuqciq=0A=
alive time~2026/9/17=0A=
http://----olmuusgeogvris=0A=
45.---roylqiqrnigwnkjmah=0A=
77.---wlswxlcmprbnovxoqj=0A=
40.---ifflykmqwipdnbytsif=0A=
60---kgoygmizslq=0A=
apzksizdffpjibnkgooh=0A=
