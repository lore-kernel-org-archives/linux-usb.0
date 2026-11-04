Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793834143;
	b=exkFfZw/YpINYWcsJkYmSF1AbV98qXGwCiVFa0ERd1pu9LFKrQJpw5eMj+DTpQQumtMo
	 YxYzEzPeX0Qr6/615vmV2UpJ1q8NnezVf5uqEPlG96vve5bTy8eev86wMEtTnI9pGXn1W
	 wKRpEypLxgY4wfbhqP8xEe0QVbKeiRdkUUOXZ/MqZUP5vaCmU1yXFVt+2rKohQY+iRsTx
	 JrA6SFmD6iNPLpd7TYckW9gZb7AsmVcu3uwst7zx+rrJJZKH0cdUB0ShY2YWZQDLUNojH
	 VBXJUdrM+HlaWCMJzAzO5O9+GITX2MOQQXTkfZUFLX/yssd1rAGq+rfqyQm+f6gyvVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834143;
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
	bh=j34kQQUCHsfiE7SBuHRdWHxvMCL08ftMJUiBP5Ir+Rc=;
	b=tai0AjU9Jj9OJ5ja8H4uuhGsls202rzrEZZAq8RmNanFS/JPZEZoFltHyQz03FUNy2B7
	 BcYsIFNJDWuOybWkCPnkgT8aC58FfTit16DngCYJbKk0+UXkX7AfgT273t5L6Yc69UvrN
	 PGb/CYyM//CfIiYfC2Ffxcwv4ljJy9RJN3m2rXygZYujnhAwmiUxE//aH6zRwC07RmQsU
	 AShkPQ+HyBvsEgDPGMBlzvTpef6sdEf42227VjQiokbewnuJ/UIvC1Kl3K/Bj+/oxNUPF
	 5rQOkDY0cxLIhDJ+/AerYiWYTXjwFbKAaCGuV2YLH48W5dZOgThbH6mYOLmndNf7t+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ddHSL9RT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.83
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013083.outbound.protection.outlook.com [52.103.7.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25421606A330
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 23:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25421606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ddHSL9RT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4UKQxxqnvwDwjh91cKiBK71dA5xa2OG7cLYaPtY2pwOctnvzBgqP100mu9OTxiHhv07y+UwxpSjN4ieV4auiUcyvwfjNMHTFOrdq3tx6eL9F5jaTYyM+sOASjJVs3GMJP1go6u33IgfDOo5YFaC+uFJTouHyH5dfblR7dkZzhuc+YNULa5EWvuBce3GXRaEYJjiDehUyqjWzji9Z7cKHMzMrcpifb6XiBmo5J93osasNMZrHnP8xvN9b8tYuLs9tDH2Sivdc2L6sLt88UFPAghUIwVAJcxCqOBhd2uWiwfYo7gsbOP4er6cq8cm4XZgJQBLCv5FnlMRE4fCBTDcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j34kQQUCHsfiE7SBuHRdWHxvMCL08ftMJUiBP5Ir+Rc=;
 b=EvhozCuNhyXDAgjlAP3QSwZtaj7/DL+6pfRuXc/0kPo7rZHPBZh8W0ueyWL8mdxOBz1zNHJHwKWhzhGQv44VJ1U6JUkuMdOF5/PJl9biT86FNnmbLvaGp2xQLPrbk2C66Xt/LRg42tNhmt0SyKc27zmP3rWs9+8UEx+JQpP9pYU7VAbUMfpJJibFrqjziAEsE+IRX7qSam1G7Gj2+Xr5VjTqcD0zxw86E/8TDjVl2O9wgkG8X+G8rHlYxEEUXDi1xILwh8E9meIh4tduY11V5JbxXNqqq6sVJlbdDsnmFMPSL0Fv3WQjUAPlSE/LF59isyr2MrvJQKrhQ0Zxm64OYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j34kQQUCHsfiE7SBuHRdWHxvMCL08ftMJUiBP5Ir+Rc=;
 b=ddHSL9RTsnH88Dh1i+cTLEUNnqAB2pnMafaKLXkDEI6dy1Z59c1VsbV75T03KuEMgdZWCmCTqY+F4hrPc2J3KWWWhFmAK3iLT8t2CIATcR0gRFQf2eS/m4EOmJFeadtHnewqZ/bxL8i1Xd8LtzQ0pWGi6p8bmFu6btg1mJCIk/nAkiqJV7cas/NTUpXok1sQJKRKRxWPo5tzR8hwjUF3xINizfr0pQ1wj5bP99ehCCs+JGgtLC/TKjgDWnvTODmJIdJ5YfoTp3eBGLTAmz9Ny2bd5X5aN26T56i560Qf+Nt4ebDPcd81oYr1RNwlg5VQfm4ty9eg7JSOM0x9zuz/fQ==
Received: from SA2PR16MB4235.namprd16.prod.outlook.com (2603:10b6:806:14e::10)
 by CH3PR16MB5349.namprd16.prod.outlook.com (2603:10b6:610:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 23:15:40 +0000
Received: from SA2PR16MB4235.namprd16.prod.outlook.com
 ([fe80::3228:7f0f:c0d5:e968]) by SA2PR16MB4235.namprd16.prod.outlook.com
 ([fe80::3228:7f0f:c0d5:e968%7]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 23:15:40 +0000
From: Jax Shaffer <jaxshafferffcf@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: mhubpmzslklnovxeawj
Thread-Topic: mhubpmzslklnovxeawj
Thread-Index: AQHdbLJoAkUTqbz4iEy0Q+jz8USx2w==
Date: Wed, 4 Nov 2026 23:15:40 +0000
Message-ID:
 <SA2PR16MB42352A452C1C03468F38787CC7682@SA2PR16MB4235.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR16MB4235:EE_|CH3PR16MB5349:EE_
x-ms-office365-filtering-correlation-id: 86f767d0-f297-4395-92d4-08df3ac98ae5
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|20031999006|38102599003|4140399003|22081999006|8040799003|6050399003|8060799015|31061999003|19110799012|24071999003|8062599012|39105399006|2604031081799003|261005200801699003|440099028|3412199025|102099032|11120399003|3430499035|16045399007|3420499032|10035399007|40105399003|14065499006;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0VjQ6QhCmIJEwPOJaMIuF5LUVayX0ACy0DZY4WLQW8BAnHd5Ei88KFM/4zvk?=
 =?us-ascii?Q?Uw+TNxnj9Lkz+8G+BumACJUVooMGdda91Pp07QjmCrZYa8YuMbbG5sgruDNv?=
 =?us-ascii?Q?z2bx6oqeiEmOzWP2EkkqOXztyb/QUL4s6u+BcBpA4vK/m8VR2DQZuBZe1ERC?=
 =?us-ascii?Q?nc2xSV03M1FRUfbVrGX+TQcTLHb0LtBE6N1YNS1iDhlZ2uep8rQ8QpriFp6D?=
 =?us-ascii?Q?rB52aA5WdrBUIaioh/skWdjHqVxegxBlNmKUleuUbxUtcRorc7SPlZFwCqO7?=
 =?us-ascii?Q?8ZukfL9HsgROlnCxw+i+IQ8ffoZrjI/+etH46fPprTYNquzb9Mh9UMTIJjkW?=
 =?us-ascii?Q?6OHaEP2FQRGisrfBT8fZp25ABbHcu7grPGXizbP+GuFkAbRjN1JOqfRjgIsm?=
 =?us-ascii?Q?kxcuApU3D89lFFVL+X+cZ8LvoLEgWE7Aaeqhe8mCglZJ4lpvPs3VqHqIiVfs?=
 =?us-ascii?Q?DfM3x7ebF3VUcNIN/OVHLuxoCiC6hA0YBXUzIRzwVy1CxvK09zzvjjrBFLXi?=
 =?us-ascii?Q?DaQ6RUGvxl2FNubuIkxGjUnFMPANav1d4gn9jLt6BGbaRmJ/ymdLIj0QZ98k?=
 =?us-ascii?Q?Lj0kRIL6qSrpyyWbxHqQ316wG2dR3JK2yAKjKFTDXWPDvDtbqm2xqvc3rI5H?=
 =?us-ascii?Q?5C3xhTqSOFaIzfr6oSteaEG8qmmleowctHzCu1/7MQlQUbWBLvYxAm4nMdz2?=
 =?us-ascii?Q?KTNoe3IffjfnrY0HLpCBAqDfSNUiWNaQVwdiK1zgLZuHWIFw+hzpINFFmJQG?=
 =?us-ascii?Q?SjUw0ob4ZzkF6d6DyaIZvH/CYTAUUB0rrA7b4hNGI+eTkOGyDbqAPPjkcYWx?=
 =?us-ascii?Q?NQM/0kYihZ45Tih5/DJHLTzsRtjH60knF2Sm2aHM0PzzjtK68w5cUrm2Wjik?=
 =?us-ascii?Q?X0XPbKG2zMx/jLp2XAP4qSV3RFQnNuMR3XARdHSkt5gGGXT67oc7APUaXlk0?=
 =?us-ascii?Q?IWo7lI7tau3yfqnYRddJWRe8Aq1Tb/leA44fX5kC3SqfWg7vapHhq8S4YYka?=
 =?us-ascii?Q?vTvvB3V24h3e011Q2UhGjhxJ8EcWXh6vX3vMTuBEEwtNMjjRrunAnRhqm5eA?=
 =?us-ascii?Q?bBIdmyQhJs6HmD1UgYAtq9RXVM24oxSfAxMDtL5LvhqQHlKukhaYUuPGKDmD?=
 =?us-ascii?Q?S0na9GURcDw1ue4SjWlNcn2eYI4k171OuF+3DeXFUVXt1I/09iIdhjU/5QHI?=
 =?us-ascii?Q?VkKzcKYqCGj6vP4v?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I2YRNib8kxdfv1DDt9bp7wI+qBTD1utus4XdFgTfjRAg16Mpj7zWrFixEamI?=
 =?us-ascii?Q?Qx+krsGluTaNzZuN7iNxwpPHtd/k2iVpYg72cmCit7tgYJR929QrFDE+qET7?=
 =?us-ascii?Q?vOz8BgPKEF55+bmyauUq6o113hPJmU8Lp+pdGVDhGsaiJx0qOd2Sg4/2d0T8?=
 =?us-ascii?Q?kreY+j0LjNJiJtvmi44y/cGM1X4Vuh/xFXoSJIM6UOnocWhYgPMOXUdrF58W?=
 =?us-ascii?Q?PUJez3W6jhwkSjIAzjxSaU8w/Q9QsEPl3DTuUtz4S/XvaD8YxsJaFNYS+3EF?=
 =?us-ascii?Q?1w6dikjSOPbSNsYSTaAesLJBirsV7iUOHWa0khK8i/GyM8QteBqEMuAEcC8U?=
 =?us-ascii?Q?Um6IJqXBnzUIzREVxq/dgUmSCVyZqFdAZ5itr/3vmXxsocAG/MlepO5UQANc?=
 =?us-ascii?Q?1RTr27ujMJyo6Dh9U2i1e6lZWwvDWD0TWf+eciqAi+DCIRfYyjb1u/oyyr35?=
 =?us-ascii?Q?FGwWRmXL6fKSZ7d68FHYkbqFMpk3oxuLzWi3WUGocOkDhha6RDMzQfaDDJ24?=
 =?us-ascii?Q?7I2pM405KEGjv6iPWy6v/QPF3eZlOMLGAjgxQOfXfrIfveGBiHt+XWjnmElA?=
 =?us-ascii?Q?D7FUL1Sel7l5hDr69hcFb25LLMpMSnevYrmP8RxvYTHFD+gaqpZp/HfAAEt4?=
 =?us-ascii?Q?h3gfgMsry13j+cuKm0j9AFLxoUYeCyVW+Q2wT3/MxGDd/7Qxq4ZQPOHz1sYn?=
 =?us-ascii?Q?pbiG7zMclArg0spbx9x1klAID6xu3fPumkp6allb6xt/EqkMLVHhlIbh29Os?=
 =?us-ascii?Q?9zCV2SHFnDi+ROo6jSfAlq8RZDlMLsSUGhVlUCaep+BMz3Bzhl+jQbzAwjvh?=
 =?us-ascii?Q?DME8waEa0nNQ3JLduIu0mn/rPIFwHbrYb03f4oW7jbX0FrC3lbvyYye8BayZ?=
 =?us-ascii?Q?CC7Xuwu0clxLkHY3uREymH+U8k8WRhfDVYXjiK13Al2ROmf1SJ9WHkbXBMHU?=
 =?us-ascii?Q?aaNpugCzn1QQI5ciCfjHOrubuKwZ1PkZ1q5XI11TA+hiKHZoLvrz3AjBtJly?=
 =?us-ascii?Q?BL+5iXyuQ3b3k8X08bzE47QkSgVwJVsP8r9wcYtePflVWT7gM1HNtN95hdHi?=
 =?us-ascii?Q?lpCPVFemnhI+HKHRSgSj/wU6umQHy/Hl30KyEywJVJdn4qXPeGrbd1U3roxi?=
 =?us-ascii?Q?ERsfiw6TBVjvOJSOesE42fVUXYKHa63Sk1TSL1rRddg9fJwdvWE2BOmJVgnM?=
 =?us-ascii?Q?PX+Y4Z+JED5+wUt3u5zAu+3pG4tu4r2d7EjPIxxuL31J01T2sy77MG8zD6I5?=
 =?us-ascii?Q?oy7y/a0SDRcJG70oZ/vDgbrhXqRfT/4+eTFHGEcC+UVdaY2ao84uWkk2KfY1?=
 =?us-ascii?Q?pGpJNfQ/Rx4T+4ckpNGt8KqiJqYGvahZPyrfEPaST+mC1/BcBH9BweD39bCi?=
 =?us-ascii?Q?Oc/SFSpnZEUun/lq69/RQD8HykjV?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA2PR16MB4235.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f767d0-f297-4395-92d4-08df3ac98ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 23:15:40.2998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB5349

ccctbom---real~~news=0A=
usrhfzohttp://158.247.201.178=0A=
gjpdqknql=0A=
2026/11/5~2026/11/12=0A=
----wlejpyc=0A=
45.---fwaqwhvuue=0A=
77.---ugnavqurtlttnwo=0A=
40.---gmcvrz=0A=
60---ynmqghq=0A=
uvxcxirnfd=0A=
