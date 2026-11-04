Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829929;
	b=kv2oevM+4vU5V/zCqp84HrCGen80yUSuy416EM7kQ9pIPSdWC5XtlHu1AlWNakKjGPOB
	 tGGa0Er0uJtrdTveLBZz+WVmNjj1w/dcAQR1hh1SF2MG+9bJrpQqVdWCRPMmKzLWU3Vd0
	 ALYl/gnGfWm63yQJI/ow8TdPxA8oSXah6fhkJpJ1tuf9NFKpFEaf6myJxILmr9fLyPCPN
	 2lLSk7Kk6P9TgQWZboHn9j8tmgvGRecm/9NX6hw5KA0uIT8OG6qSMzljpEpi813gVMUgq
	 yyc8XJasgli11cXkzCp7QL7zMCS50GxP87YUI/WVB04Xk/ANS+GggMTeTsf4wDQIIiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829929;
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
	bh=FVvQJypz3ELMzYUjjxXdZUO4cmxLUtZUx/Q8ouhAlQ0=;
	b=VH1nqY5AeT4Mafj5IHMtnOjtKinm7nJCyTv2bTe+kONbUEIBW+k7bN3AjrkKxFcPs7hA
	 tR8FY9HpmOjS3HqBF63rJhmsiadNE5W2bzc39qy4lBGDWehZur9SgUFzQpeofiT37JKWH
	 IJ6fDEEQZsmRVcO1DNB1fW3CXVg3GWJIZFLlXwW2QaZDkyvRhlV3gzM986SX2YMlX9oGv
	 7KgSvnS7nvoEDSp2Q8bcyc2lodsEjUc3gT1TP8QIKxYmreDsAk7Q+XVBinRAYhaqffDwn
	 cKRq1E5BrlXqW7hVzzDZIRM0VVJUMLgHxvqhlLanfS2XZp/e4y8KanAMTVtYT0DqCuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=pki2lCmA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.66
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011066.outbound.protection.outlook.com [52.103.23.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A46606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 22:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=pki2lCmA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdafUg06kWm+lBT01Uwe51PM8eZp1LharT921IQ0xjNR5rIvDbFwcYB4xdV+UfPvKjk1ioU91LrT0/tbExW8ligcRfSLUyHrwUqWYw1evfaifkehLnmHOkU/rnkdONS4amzRrQLZ5tQe/jsf3dhO9euDSIzR+AXyEvtGs/OHucPaT6Sz1ehw860NoOMV1uUwbmB69QYLoIU1TZycR2XejPLPG8VigTjRZuh6c4lvB7EF8er8GBUi1ft48vD1YUj46YQO3poqJUczghyQWnB6WnDtwuVxSR42nNBkSiBYrS/d/K5GRW/39R1zU0DzSassqK4I26p123sB0kMyKJvODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVvQJypz3ELMzYUjjxXdZUO4cmxLUtZUx/Q8ouhAlQ0=;
 b=WEMAjS7tk4kCTp9V/59VuPWtZ4nBFmweb95VyG0lbyo3PNWmU7j3i2CSRB9qKAQZOlRI6UEY59bEK/Dz/5GT1b49GGbmnL16Xp5CdQtM2u6hSJS0lAXcazAOPKBKlwC9CTMejUJ6RhRK21xrxV0qjDlRquOApgR5k+DehJjhaTszU0XcgeSzDZsxMK0kXGyCirE6LKuGX8cLLkguGyG3UsGarYbXyrvoX2tPrQVDuwf82NP1V7AyFhDrRI2Dta8DMUcMIu00w2FOAVBD2IjSvNAtldrUExWlMaCT5xhCFSyRKxvCc6G3/PbxX1jJOEEhdALQeIE8MccUqiKNJQmfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVvQJypz3ELMzYUjjxXdZUO4cmxLUtZUx/Q8ouhAlQ0=;
 b=pki2lCmAhywmOtiNr3pB2Y11KLJly38P4VDuw21E5M3FGQXWewXMpcSDz7y6iBatj+JaDo9m6+FHh0mhjLMV1t68LcFacA135bfZD0G3LwNxCwEvEDgiWwEDEMqXa5grM8RllHb3v/A5N0JXZcdgio1uYUsHzdNAI3FTTmARYOBERuQ4vE5W4WOtm4z8EA6w2ppcaX0WtbuSDNXPV8lhzyGdQ6U0e6hOA81gzQd9o2jDYIz3Fsi4cd64Q6a9eG+h+W3dCfhsZWOlAgBipE4OydaSlQ159rmeBIQnp3lrPU7DpAETeiB0Om5HrNcdDGqXhHR5hLZ6CL2jn7g64uQzow==
Received: from SA1PR10MB997604.namprd10.prod.outlook.com
 (2603:10b6:806:4b6::8) by SJ2PR10MB7736.namprd10.prod.outlook.com
 (2603:10b6:a03:574::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:05:26 +0000
Received: from SA1PR10MB997604.namprd10.prod.outlook.com
 ([fe80::c737:982a:14f2:b889]) by SA1PR10MB997604.namprd10.prod.outlook.com
 ([fe80::c737:982a:14f2:b889%2]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:05:26 +0000
From: Leonel Rice <leonelricedvnd@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: 88643271468585
Thread-Topic: 88643271468585
Thread-Index: AQHdbKiY+eTgXiz2+k6CuP18B22wfg==
Date: Wed, 4 Nov 2026 22:05:26 +0000
Message-ID:
 <SA1PR10MB9976041850A5277BA011E64D2CD8682@SA1PR10MB997604.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR10MB997604:EE_|SJ2PR10MB7736:EE_
x-ms-office365-filtering-correlation-id: 941976f0-16fb-4708-2d82-08df3abfbb0f
x-microsoft-antispam:
 BCL:0;ARA:14566002|22081999006|9112599006|20031999006|38102599003|6050399003|4140399003|8062599012|8060799015|19110799012|2604031081799003|8040799003|24071999003|31061999003|55001999006|39105399006|14065499006|10035399007|40105399003|261005200801699003|11120399003|3430499035|102099032|26105399003|3420499032|16045399007|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uqvQR7o2wnGlrEXoRlrA0DJGRRr5DSXUa+51dyDhW+eljyr3On1A+bTJdwPu?=
 =?us-ascii?Q?b0bbhU3h8exmIvbF74ynAYgS6vku1WQ62vb6I6dnrR76Xf7NIA7LkMDW6z5q?=
 =?us-ascii?Q?6lABCX9CQKgctitwUBzzikyBGYqOwitBpiPdKenbDEKCwMH9+m6Y+JZg6dLd?=
 =?us-ascii?Q?m7tuGPRnPiYLmBNtl6UfUe3TH7lFA2HyQYzcSol4wwOAPCRURzzJjD3kT/0Q?=
 =?us-ascii?Q?/YrfhErUlbyNjKOkWnMhkEA02VoldP0B73uvBQUqdhj+b6GYiKM1CyCuTVIy?=
 =?us-ascii?Q?zXoeNZxnO8svj8ITrNU7sTba/ytI4O7E5g2qRpUjoNHeu63Z1DhakYr6ywd0?=
 =?us-ascii?Q?O02A5iGO8QfOIR9cxyXL0RhuyVhIvsA/qUiZvE/BzaJ8ZhiGZ4fVWuvztVjM?=
 =?us-ascii?Q?RXqT7zcU5R5fdnmnfqU1V8QiOmauja9BE4MPw1MgqozGy3gYEji6kGf8hOZ4?=
 =?us-ascii?Q?LY4m1w69XCvunRV8zlyxO2d6cVCDZI475L5QRS3aQsIwSMwCKsUayFmIk/6l?=
 =?us-ascii?Q?X6Rqlud7T+C87U5Gunb/gTNo/VDcbIvwvPaB6CJ/TicgTWTn9Li3wYKYsMWH?=
 =?us-ascii?Q?mpKoP6eePXzvOpn84krTl229Bq7pCazCi4pnuyGry4bs2cOG2O36W981dhAL?=
 =?us-ascii?Q?oPgmsmPGmV3GB0t+MvD2cuPg6dSKmt6ce3CzwkZzKZ0bMwOagrldScdiYHfw?=
 =?us-ascii?Q?XqEeTRXfe0tS/aOuk/45WGDB1+uyx9FdXZYScNosptB06O+bqMiBitHfO9gK?=
 =?us-ascii?Q?J3XwX9SoJfNrIRtI3IX1HFMUg9LIQLYM1WvIhcoI/NDl1IkPsOVVisCA9haG?=
 =?us-ascii?Q?hhKNCsaPmidcvp0O1/+fZ/SrVGM83/yENgKRyT+IlV3kY42Ce8uPLKSnHl8h?=
 =?us-ascii?Q?FklOr8xn/iCSSk+tcx/HYphElWCnaf4aaU/Gjej6ltiAHUQVxAf5qcrbJzFw?=
 =?us-ascii?Q?/ePf+QeqaL5zYikrdtHjrR7cjWbiIc8URjx1mBpPgIQJQ/9tEhzVCYvj3xEi?=
 =?us-ascii?Q?oWmGubi5n3qIiV4XYUxOzpKK8YgVcTMg3EhCHGwaX0shsPkYIZSP715xtZdv?=
 =?us-ascii?Q?K+77R5EUYqivptKpJkZ5Dc48oiD8UT2RlPzp9NIrEQzeA+hPGeMNz8E7ZUIl?=
 =?us-ascii?Q?GRNHfVLtIw3oR+09/W4UXMqKDuu+2ItAgdpHVYk2kVT2jt3m4wzOAIUdD3GT?=
 =?us-ascii?Q?QiKF5Tttk8vAJk0VVzN1mvyLpvXPOLYgTkv8Fvfl1YmHsjtOpNYPSXZULDqi?=
 =?us-ascii?Q?sabA/ZY6kYS+Tr/pjeT0?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1NC74dLNV8w2qLgtbzGwC8gMUhs2SEq4zQntgAzz5R3LPZbjuPJ9fTJQfbc5?=
 =?us-ascii?Q?34fGhess/dZ/N8WXJFO/9CB4fZy45coBmRSbY0xMVobyzB4bl24SrbeHm1+O?=
 =?us-ascii?Q?45YMj31Y6FWnBCq2D8/U25ruSYEJQHUKuhkR9LMEEo/E3L+UvbdRhIqZ9kfK?=
 =?us-ascii?Q?LFud1+UaCkChjaq/HGVv9aRrT7w5fjmTb94Xe9hlEpceelwM/1M1ULb23cFr?=
 =?us-ascii?Q?9BkTy2b3a08soksNl0crgtgKoGTgbWZQhy4ck2abFNBpoYmBKqOT2fo3SEL+?=
 =?us-ascii?Q?W/q5Acb4SJGpXk4WOJdJvIrK9t4rPr5amispzD/EOx1GZD6i8/qYi7ucMkBj?=
 =?us-ascii?Q?qTEyHZ4DKnvLB6ZyAUtnWhGze8X3VG8Dxmr2s5fphn9J3eetcytYfmFcy+wt?=
 =?us-ascii?Q?neDJzHlvt9vpmZcr7ljxT8iOWIXP/JD75v5DumiQzcG8gWYUo1e5YfpJvuAb?=
 =?us-ascii?Q?YStkqJENQ/XFmmqnybI7M9RCxNE63lBnG39qad3sns+i5eAGVlOXqSv87ZL2?=
 =?us-ascii?Q?ezH0bveriID97xD+qY3lH159fZhJFFkExegIMiKENuwRBKaESEaJTwx1Tgha?=
 =?us-ascii?Q?r8sG7VqXSp2b5I5Ejvjvr18dLMS34Lj+qo0tM0610Z8E/kHOcQi2+RaM0Qz8?=
 =?us-ascii?Q?UK0PNjr0AyQkJy3XFEI5/KdMga8ppzsVM0mIGhfnAbfGlpYmKC8tZArPbE3f?=
 =?us-ascii?Q?EUFuwgmLkoh1hoBSTiMfPzEJOqYPRdaKqryeVpFutgKF+TmDfZUismb0BGm5?=
 =?us-ascii?Q?T8VK2Z+p5WeQ7gFIJgfX4ppc/uW7IY+q0GaSB9B2XU5jzXMc7IEx2tB/BEHy?=
 =?us-ascii?Q?AnRAQ2CCtfgEl3oJV6B8EevEzB9N+cG1Ey1U+jE/XlkItZvEAW9fHlzQaqRw?=
 =?us-ascii?Q?uhgXkKkdeF2rw1AZECyioh/X36ZWyn+yb0kVsZMNUvMUq3L2XoUj2k5IIgMA?=
 =?us-ascii?Q?FA3Gvy8UGqlTP8wQpuxk5BJkQ3m/txPl2VUO09KnSWuAsIWdiWYUcDTEBV3p?=
 =?us-ascii?Q?Jq5jTDfXWF7U2xR9aeGpnhQsy6cSnuvP2KwHWjlJxZi8QmFq6o8Yp55qO2fe?=
 =?us-ascii?Q?CKHzd1IVYhPwEXQfimFz3gdZDv6dVwfyKk2q++SQnIa58o8R16c523RGkYF0?=
 =?us-ascii?Q?4NtBOUhSGFs/GCFaaHLl8Q5/hwuq/xsM9fjtZYgT9lxwH9TNYhDbB5DMWPu/?=
 =?us-ascii?Q?E25a4fvT+3wcp55VWCkBY5lrLfMlr8F40k1VZk4E8d2OMob2C1SJfgvC/5gu?=
 =?us-ascii?Q?51GrgSoTJGN44T7r7taxakpqTz7MxRzTFZjcFG7eIvqk8I3cASiLi+yGlL2U?=
 =?us-ascii?Q?WfK5yn5POb6bAyXDde3GjFiqdXbMYSOxSEEJ9VqQE8nmo7/Joll6/Fkr60ky?=
 =?us-ascii?Q?0sY2T0ayAqq8Pd1iDjMyy0r16jMS?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB997604.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 941976f0-16fb-4708-2d82-08df3abfbb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 22:05:26.1360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7736

95219804931389----real*news=0A=
http://45.32.111.135=0A=
546023608173049066=0A=
2026/11/2~2026/11/9=0A=
----rxugzgltlvxf=0A=
45.---zgpnhhwtrc=0A=
77.---qttbjbarlhonub=0A=
40.---xxnzpvierhkifc=0A=
60---qurutnrnhp=0A=
jpdjghfnzwjl=0A=
