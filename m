Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793602423;
	b=BeQ98pxziLpmLUOEQoVhuDvpRIrC4nSNk22mhi+Aqt1AXT2d0mErp85UJ5TfsE+H4lrt
	 7v4cJUlYwpr3ypTmKCMXMCtAvZLDuQ0CcLBhOe/Tuld4pnQWlJqVS9RrGQaLpNKsOqw4n
	 DCbJTgEaS1ueTpbT4SEF2t/h0sJo0gun2bBVKrg5L/blJb/BX8X2Brddfh5bCThjpzuM7
	 DL3h9HLqFgqOtZqC9DHGR1KJw0IsMHKctaY2duXo23TrKmHBPX5xN7+ok9xvG9i7267+r
	 yyLIykoBQ5P6u3A839n2CPCkK6Fl8fGawQ2n3AeVYz66qoIj0HMj6pD+YNS0jTYsJKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602423;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KHQbzr0I9Q/uvcTBapfbOmC6+Eeu/1tFY89re+YY7eI=;
	b=1itAtK2lsQ6bhkKUzPx1lHkhVFwPaps039GGgho+EhsAt7mQNOISJmF4B4VuK38HMDB8
	 8vfEygA1QJ3PQwxiBqaqAGAcxYrYi26jFErYVq3Bfz0SLGA26Kv99d2eQmE4c+dGDUhes
	 oSou9VSO1sMRONDWL9zBKsY9nueokpQD40Q6y5yUEE13SIvjcIl0oStySTgjR+vZLUrV8
	 zeaR14aWs1bgB7KMODo7uYsx+RXOg4wmOmsyYPRrwHk6e79LoXe/3UzI1X1oN6mxXcSFM
	 2HZ3BufcVazwIP35xdtjidPt3yyTw7rFefbWmudpJ2mfWf5BqjB/fpV4dY5J43qrVbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=mJgo8Sf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.23
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012023.outbound.protection.outlook.com [52.103.10.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DD3606A329
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 06:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DD3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=mJgo8Sf7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU7R1R+OH/MfY8E2wQNrJXvdDowUjIuRY7hQ2jnTYSQqgUUUfyzpsiHiFaCHS2o4XAS+mBi6CoKcae9OobKXDEQv5luU+aJtn2HguVezl8fetojOT617VCC70fqHLLDwtE9w0e/dN9AlI8egQhhJKbnli9CdGygAZd8GuaChQ7tka+mKFABNnp279v65glUwzw7xnO1q4EgPR0V/mPQVbDvS8dLWbLLsezoByvYICsno1Kcr7VmIK4l1QG25bJ6QNXcy4nVckve1Wa5lg8LwKpDlN66WXzQbUNkPA+PTtfch69Md41c5eiTnsy+uGzVlvrHq2FwiRXLl6h+T6V64aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHQbzr0I9Q/uvcTBapfbOmC6+Eeu/1tFY89re+YY7eI=;
 b=wP86kZ5uNmhOGQ0FEk0WaZlRAofdyDK+rwZNruPl6hUYn0KUrI4SiQd4XaW9W8OqET2/VJu4Nj9C27EqArUaZ5bvfdvACamdOx/6mjOw8hdzDUYHScA+PMdh3gXTVX09lCANhNp0Z4PdJ4fYYcmIk9fXMruB48VXV5TQwSr6xDXzIPmpm9Mgmz80tt75graqgIq9ATeIzxQllWJD697vxI678wz5HlPS6t6M09VSFGPqBJUn564ZjljM4dOaDWH7ji2jwRRSKfnByJdAUgnyofgmS3NNkfE6i2IdbGvhkN9KbNM8+5Ig+k4rHqLzmByZo4B3LbOtuFZbL2I+c4XbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHQbzr0I9Q/uvcTBapfbOmC6+Eeu/1tFY89re+YY7eI=;
 b=mJgo8Sf7TY0kb6Pp09SzwmIVdv3k+YKf3YjTeO0dDI2viAji2Ezv5UrdJLJSDCnJD23t48s/WndKI1ptsYtcP3mkT0nLBwHyLvn9WSHFkbgqJzv6mcKgWMEKteDCkKljW7bH8h/V+obCAGIjyVBNja783hhf1J9N1GD74FbVCXjF1U5tIh45+2Y/RwWewELAqIDYHj+fpinc+1TLtVIbEWo3fDm4IBmP8D+sSAKODS/l7GRmo0O9JKskpE2WykZjOQEUZcYFY97Saw4XtJCdf1rgzylftsU3owuUOHqnz+OBPk5eRvH245P1jpxwsVv6I8uJgRllmrzjFY4b8tG8PQ==
Received: from LV8PR17MB7183.namprd17.prod.outlook.com (2603:10b6:408:185::20)
 by IA4PR17MB156034.namprd17.prod.outlook.com (2603:10b6:207:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 06:53:41 +0000
Received: from LV8PR17MB7183.namprd17.prod.outlook.com
 ([fe80::9135:13ed:6c43:7899]) by LV8PR17MB7183.namprd17.prod.outlook.com
 ([fe80::9135:13ed:6c43:7899%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 06:53:41 +0000
From: Josiah Gaines <josiahgainesuvlm@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: ndrvlhgqzmlqoxwfz
Thread-Topic: ndrvlhgqzmlqoxwfz
Thread-Index: AQHdapblblAFbcqhl0G86QC0VrCDEQ==
Date: Mon, 2 Nov 2026 06:53:41 +0000
Message-ID:
 <LV8PR17MB7183A9697F359D1944B2E229DF6A2@LV8PR17MB7183.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR17MB7183:EE_|IA4PR17MB156034:EE_
x-ms-office365-filtering-correlation-id: d16b1508-0821-4e3c-92e7-08df38ae07d6
x-microsoft-antispam:
 BCL:0;ARA:14566002|22081999006|20031999006|9112599006|6050399003|4140399003|8062599012|8060799015|19110799012|2604031081799003|24071999003|38102599003|31061999003|8040799003|39105399006|14065499006|10035399007|40105399003|261005200801699003|11120399003|3430499035|16045399007|3420499032|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Udhg5Deuqf9zWheE6JJ89VfYZU0+vJqK2sCZ7K071CXmq6w20QtN5VH97pxb?=
 =?us-ascii?Q?soOERkVkVKLwt122ry4qv46zl8p+/vdyFVvbhVVdKeWDDLAi/SSkd7m1IX/+?=
 =?us-ascii?Q?+xLm5Cz/nxljRPitPSwYNbS9e8BI3Dwn/z0epQrF6W9cxgydU6XY7oYSfR2y?=
 =?us-ascii?Q?muD19ZJVItP6JEYOy0H+MAxd5JjsPio3HMufsxnnLt/aynKR6Et7zGNyS+w4?=
 =?us-ascii?Q?qIt/9o2AsaS/A5bgI7gRb4g54lyAe4ieLArylQX8xYv4bnMdOs3iv0O9sxcU?=
 =?us-ascii?Q?VajvCQxxxrlOrV7mxhqS6piPg6I08HeuZNzWC5XwUSpHa2CIm3RnaCVSUFP6?=
 =?us-ascii?Q?Mfn5nqtxS5ArqoLWn8beB2BVjT3PsFV/aX4CVNnGkP37Kf/jEiRkrres5sra?=
 =?us-ascii?Q?wFjy5aIkWwwFGLvKpYKdYbYry5IJBqGWjEjd7BVQsrGwkVT9+U/XlVC+cZBW?=
 =?us-ascii?Q?5HwvIKkmsU9FGDYiYIiUd9A0dx7hIE5IW4dGcNcvpoKlHCQeVv/8yx5d/yVX?=
 =?us-ascii?Q?f7vt8yq+gZptRABxtmfcwZAi3EMr3iqmSDZ+s2j25/yTkIcsLjMO48hBLzlu?=
 =?us-ascii?Q?mNE2gStPxG3OyJZWM6e8XgJGKTRt4AyIwM7IhGP8gDnQFBlJoEfFAUXkYSxY?=
 =?us-ascii?Q?zH1p9tbzYNy9ylzTqB4h55d3bEEuDT4ublCWUR3ZD8ytvJKu5mp8yDf1Wvq9?=
 =?us-ascii?Q?zYTcQQxy1pkxxz04/IsmcbrsvOWbT+mLNfRtythCHCGyVKsp5EVEnqnPstBf?=
 =?us-ascii?Q?0wSk9YQVBIwsomUtlnIH21iJAsWsKaGqLEsTMLq3z0kXnkJc9TQPT1wqiS1P?=
 =?us-ascii?Q?ElV1qOOcq0AI8aAjcsI5NiUMi9B6ib3bh59vZJ7T1nJLzduM/Igwdp4stLV8?=
 =?us-ascii?Q?QRNFt09VlqEdHIXECXl9IAWep7cj1hr1qkhtfgoii3obdTKGjB48NKUheZ/G?=
 =?us-ascii?Q?1m2KEi/nDKJqlIxDd0EZLjuoA1qw9RevlErPXHirqBBeka290tJWp6i4ITOe?=
 =?us-ascii?Q?7cGtzn9WbJrsFwpqupTr2ablTa5Nu0EU5VXcat5k2obsgeI9WMd8qEa6FMs+?=
 =?us-ascii?Q?wumCZ1H9RY/Jb5b9+opdp8qBSqAIYbbWaNcjvoM0eUHMDumMBQmeK4vN4IT9?=
 =?us-ascii?Q?+J4crK1V+H7fhxqXyPX7LSmQy3MP0Ok7yxPAYJ1rO/ohth/wtrhL4ALkeT9i?=
 =?us-ascii?Q?PVC4Ft6IBnJvthJ0?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZdEhLpARycDnRMgI31/Y1KeiMMuZ2/5806wCEBv4g0xq8GBm6uE/YZ/4Xts3?=
 =?us-ascii?Q?DsC4iBzlr8K1s3eWKpP+6UNmpv29Fr1xtenFyVs5GGVsaeFqERt2NI7kyzfy?=
 =?us-ascii?Q?k7kfwaNLPfWx8aleiXjGC+04WMJyHIBpXJ23QPLA14onqyb4v3SYs/YpppUV?=
 =?us-ascii?Q?f12guIwYiSwO3U/oid84xD1E7ekvhNSSeFJQxmKf4G5RPfwfhYHo89H9ZAdn?=
 =?us-ascii?Q?a4e04BmOqcgapVoRSko75+BR8Xof7ASNRSQ8tPN9DxMLT4e6+wTWd17KXQfR?=
 =?us-ascii?Q?wzM/nyWhzQT22/6P3ltSl0mLY6qOtYkbOXmbty8Unm7hNSq64Du8vlSz+dh8?=
 =?us-ascii?Q?6Wns3wbGbFKjsAfeA4ZBKKpp3gSjIGug6pNm/plE7f+CTHHzHEZdUGtKizzl?=
 =?us-ascii?Q?heLjxoxdTeCrEwckBI9Huyn1UwcgxKVHmrYmzZVdQdo7UiD1Pye+ssZ2yKDV?=
 =?us-ascii?Q?t/U4lT+M0MZk48oYmKXOKpI/DPrN0Twx0Ynd/OTHy/8s6HUSq37fcx/W/XZx?=
 =?us-ascii?Q?uEQoZ7C89UWnp356XZPSUl0jmh6LCQ037xsyR2L9ditevPa1BA7gVwLHeqnB?=
 =?us-ascii?Q?KVJAbTtPejVkoxg0m/EllSvJvc2w6ptQ4EH8WK11ZHWQrlaD+fmD3u64egcp?=
 =?us-ascii?Q?zaMpUULGD7I6qMKaKWhuExUDFGSGLOzjCidjwuPM0aJ6UqzTWci+C3qFTVHH?=
 =?us-ascii?Q?0Elm7pLBEmgZ5wE+thtAgJeniHfy+0AQNb8iWQlUMgnP9Hi7FmNeGaXBGXlb?=
 =?us-ascii?Q?y6GAVQF3oa2KSPRL1PD9xxQgTBryJPKLieWsm55pmiKSL2NVJAOF3bpMu37a?=
 =?us-ascii?Q?BSPbcSGXekCc2snbkF0yuNkiLDprvE9eRlyLy3gRcOTYmbZv9FHMLwuBy3B5?=
 =?us-ascii?Q?iho7gfygsIFzjMqevTtoQ3G8ecL9juAXedk3c0Vfm2veOQzeCAM1NfI6PbKe?=
 =?us-ascii?Q?vQtU6GtpNl9OC25wtov8KunQh6EaESmti0AcTrTuboI1oHKZSZxDaKAlKKpx?=
 =?us-ascii?Q?MRL6ktxVBL4EeCTVHq+wn1Zaak7nbMLzE525eKZ6lqXLaZ1F3GkswU79z2dk?=
 =?us-ascii?Q?yl9nvtLRSnk7YfWdhA/SJqEOR5HTtPknSQfkbMH3xuuM8PDq7SrdRXPscpfF?=
 =?us-ascii?Q?ntNSTfDtj4r6sg1InV4HRC+q3UbAGqN0Qv3aEf7O1IfeV0M5KAOINw5TsrG8?=
 =?us-ascii?Q?k8p7ZRndG/l41Nrto26f6GjRYaBQrgouiAFubJXfKqCpZdrUqDeSkFRBB04O?=
 =?us-ascii?Q?RD51dLI5Uk3etPfcIdzIaD0nN2dHudcQ7Tz7UeZ2oCKb25srXEmjapZjKWWS?=
 =?us-ascii?Q?RPoKQzrT3m1UHnwsjPdnQP9ZoM2Y5Psj6KfR4ygc2wrvMq3Hc7GlFD5irPre?=
 =?us-ascii?Q?H7zDZU7g5/Xxd7CbzBBF3vHzlZ2P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR17MB7183.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d16b1508-0821-4e3c-92e7-08df38ae07d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 06:53:41.6607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR17MB156034

hsgmxpjwekdgrgfzid----truth>>news=0A=
http://45.77.15.155=0A=
iezqyjxqtgdmwju=0A=
2026/11/2~2026/11/9=0A=
----xxdvtbuwrzirpfnprs=0A=
45.---lpzhpooxps=0A=
77.---vsyyhnudnh=0A=
40.---vswgzwzirtayfygjpwy=0A=
60---awamn=0A=
oanenifxzxmxvjy=0A=
