Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010023.outbound.protection.outlook.com [52.103.13.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D12264DB
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396776; cv=fail; b=jKTXBiQHVHiRV8d3zMk9eR1nEYxDstL/ClHYKZKGmjwhEVboBVK1KoGFcywaIFjP4Nuu9GSCqfpMdhdzIGUS9UB9inmejdL2EuZ0zTy1lKTpr/LL3OVAGva7DkbLeJ6kgcCTWyQW5aj6HKo3bLXKfvnSmf5zC7/RSqfBgC6SApQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396776; c=relaxed/simple;
	bh=ARLx3HlVOW9liQwHD/tyTTpDT6d6Qb311PbsZ1ILkPE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IITIwCZfbDfZ45FRipFL7+3AWSSyR7a9Z2Y1gHJ0j28QxzVUV9HTHF42NQlZ5+67/jrMC6faT/uZytkT5h83VGaEnMAMJHpQ6wfDbZ4DSub98QjsHPo7gbe27UAsCfgwukufP3vmeRFKGbDR7x4VsMPSRbF1UiyQqdopw+1y1ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VhNquFG1; arc=fail smtp.client-ip=52.103.13.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VhNquFG1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwBb7QfPAltfJDBHjD6JHghdejs/RJY8VTh00KyQ3S2MNgoenrbuhl4XBHIJgwCbFaqtxe7PdEMFFseYrLOdXBJby1L9MpsY+cPzWLlHeeDe/fCfG+2gUaW+7MsvLBucgcL31H55FCCnAIkNwd+a0kjWTZFmn2UJ4huFetTNayhO28mxv7VwFIX5KTATTo96aP01NBMEkFq4QfKlKXfzI60lAGrUzqoOvxpmRKzs8QaqZ/2DuzWPo9sj/UuB7hZpmEb3XALq922o4MJ1lbCIeBaAVYZsm2twykDxLhP7HDisNkNt2Xf14h/AQBqs1pe1opMGn1TlexzT9Krtn7Dk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARLx3HlVOW9liQwHD/tyTTpDT6d6Qb311PbsZ1ILkPE=;
 b=LnjrgeolhDQA6kSHpsWSQ9EaOeIE1WlJBDof/bP69cU8a6jye2JC6sdM18CORVR60V2JIgMO8x9NVCyFlBtaBh0v+kfT557YQuqjdjYMdjzEE0x6eg5ckriMTaVqxC3imHO9zYxLYj6qww+EXmphvukE46KSft7oqiHb+eoTDEPBPCtjg3jIdBF4Vtx419DYgEEyqimOg378AOB/y1HgnzfT0N13NJ1ixrpTQN4krP+vX11/JHkaiGHorbjI13FsLe+x8gDZt/3lBRUKolOgPk/jS907ejJnuOYNPChDe7kjTIhvAppKI+dBqYMtuuUTdVaCWPchHAfkEIJFeayYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARLx3HlVOW9liQwHD/tyTTpDT6d6Qb311PbsZ1ILkPE=;
 b=VhNquFG1/2/wZ7ZjX1gEIg8qN1fvlDmfwlQc3vJXdTMMXifp2znNwJM8ik2FLXE7Uv1n8AFgeytjp53i1GqRZo5V1s1U9VZe5BxxbgZPeeqbnOvWs7bB9OKG9xIABNUWLVdHtaIXSo4rKVspLTjmrkhwfJZhGeBAnOutfyvGOxqOGHw4sC1nEbIyoud8xhzXqtXOvqBlVMDA1FhyJpNjIoXAWDtHvAaGvaH/LO2VHOo6/Dz/FH0EBasoDb/q2YyAfaKdSTUCOIyNUjw8BF7nferoVsszwU5U2bO8POb4iYt6VTChu8NRXuMlqtHmavSbpFcGRYHe1ZBeb5CC/om67w==
Received: from PH7PR22MB3431.namprd22.prod.outlook.com (2603:10b6:510:15b::15)
 by PH7PR22MB3915.namprd22.prod.outlook.com (2603:10b6:510:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Sat, 26 Sep
 2026 04:26:02 +0000
Received: from PH7PR22MB3431.namprd22.prod.outlook.com
 ([fe80::3dac:caa3:5b3f:a42b]) by PH7PR22MB3431.namprd22.prod.outlook.com
 ([fe80::3dac:caa3:5b3f:a42b%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 04:26:02 +0000
From: Avyaan Fowler <avyaanfowlervnyd@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: bzbfxaauwtssihkxcrx
Thread-Topic: bzbfxaauwtssihkxcrx
Thread-Index: AQHdTW8jn4WNjHqhFkug0irQEUIUUA==
Date: Sat, 26 Sep 2026 04:26:02 +0000
Message-ID:
 <PH7PR22MB3431CA42B4F47B50240AE003DC8F2@PH7PR22MB3431.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR22MB3431:EE_|PH7PR22MB3915:EE_
x-ms-office365-filtering-correlation-id: c02495bb-5d36-42bc-18e2-08df1b864601
x-ms-exchange-slblob-mailprops:
 QyUpsVPvcqnxluPWxW3wvGwFPk1IZU9NvQ1WmCH8/1d01AzOpLzp7hBqCnRxrlwvTPdjbw8Gr5QgsfsT/Z9npo+9WwavU6eFMysUYP2ZvX27mewQpXwppJxx95d4//tuEOVz69ZFcAteoB1KPcV9sw7yCUcaspiTE8/wtPFP2ay8n6DEm0OLXJzkcW8PlmK71/Xm3bUhMoVyagvgkAlTlUylIc1bIBQ5n+vwY0Bx+SZ7qqBUsgNGE6Q+hvwIUyBBTGbq5XelCVGQ3UyhEfoX11j6N4drlfroGE4vdOGrzjn12YVDb1GgKlODaLsWC9770QBFdUOqB0EoUshLAj1PvtZ7qZM4vRY1G8LZyBoDDegaZwhuCIRlBMWfNRKQGLXEamIZnswAVy1gJevOpKMd+9XOK53lFe7iOun2WzUOxHhm+eq1tppc3020xqSjDuesrLshqebwIxKK7DtTIcS3stt3vzROe1RFu90+y/M15nVk//uAifV8Rj1d10WK/7FJvhRvLsjU+I3NbQDJohl4eSRj/EykLExDie1FMYWNcXgBJzY3bEPhdRA/Q1P4BTkkzdZu7mCcm0JfsStdAGxC/0+1ul4KUdYGfPhhCMev0F7NhUyfMgJOB0lW6/mOPcW/hx5joC1Lx7q0A2+P0nuDaSBdI5SFxmXGCK4VhAmpJF5JpAm63SGZLCTXu37+AUXO
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|6050399003|4140399003|9112599006|19110799012|24071999003|38102599003|8040799003|2604031081799003|20031999006|22081999006|39105399006|31061999003|40105399003|11120399003|3430499035|2607281247196008|16045399007|3420499032|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Xov+HHK3ipxLCvnd1sKssT353XhNDCC7J9mhXCUGQliWQJFhe8RvqvvHZrnV?=
 =?us-ascii?Q?EWX+OjDPp+mbqSOW1Bylk8ZyghT4TDN1MMESOook8eS98g1ihAx1MjSH+eHb?=
 =?us-ascii?Q?Qa5STk7UR522bnIyCo65kPC9LS2y8EbTiQt2W6tO8mw60szdkVGdLe//Qwme?=
 =?us-ascii?Q?TFeGVdkB4iKipl5hUCC+quJmxl5SgpfdNK3OpJPp4txZcQWVK0H6D94Gu7fG?=
 =?us-ascii?Q?cMlAXUb3cdoK1nTg66clUf3mDVc/rGv8IyRrGByU3fAVGzIxsgtJsu+hfMN3?=
 =?us-ascii?Q?M5DNMr7B1cL4vYB7IhEuFOJ11aUCUl+z28qWb2OwsJqGQ1Z9AZg/6KPQbnRE?=
 =?us-ascii?Q?N4taqvQzx5ZSWUZjBc5vVGWN1tbloK0IZy2X98Q+7NNa/tDPZxI9exqU4Tl3?=
 =?us-ascii?Q?jajgW4U3AQspaBSuD8KAHVuoazA2WZDGdANd8B5V8qfS/bsEBTPImpFJj6I8?=
 =?us-ascii?Q?O4gN9yUl+3YaAPIoMy8aPNjCcfaRfTE2cKAr4hCubcADabEklMJAIYVmIvQl?=
 =?us-ascii?Q?Pb/kNf5+J1Yr3+9iQE+1WJIzErk3zaCOy28nwnwOjo3kx9fgJRTL8OOkhAGI?=
 =?us-ascii?Q?pm02kwt/AUS8T8zZIThLjJom+mVtSXLI7HC9TmVQJggQUx5rNJHXpci4XGMj?=
 =?us-ascii?Q?FLA60ArYFrq1N1onrptBQZ2m4PDGLxmaDXMOPsmyh4KRnwd94o/YdyrcX4Zl?=
 =?us-ascii?Q?oIV1x1IlSrE5mOCZ21gPfE+ga0fhLdYQPpRJdMyso0i66pf1D0Rn7baltiU/?=
 =?us-ascii?Q?eONUvHYHidbUayPmCGVYy/4Be1ZSVoj0+H12qfiRI7Pe4Cd/lpZ99Rz+F7yQ?=
 =?us-ascii?Q?wMBlOZ0J4py3eAg0b/0MBwXXPOCrtfv6d8IbhBin8oSug99cChYI+bagr71O?=
 =?us-ascii?Q?Ej3psVaV3Cy23IYciVAlGEgHG5dOjFgF9gR4EeJaAslK9Eychg5KP2jGMRCn?=
 =?us-ascii?Q?vQQ1PLfkMhPRTcS2cqCpmtQGKictmfIA1R4arhDamdTHRWI2z3SlZIcQAn59?=
 =?us-ascii?Q?e9noCgXCT7Lcz+Na/lOxZvOj4McjC7VfRzTnn9iDyhkNbmRGCY227TdhHCZK?=
 =?us-ascii?Q?mplLQy82SHSSC/4kbNLzZUMte5UibWSriWpnLREX8KJ43Ro4sWhz+hgrs65Y?=
 =?us-ascii?Q?InHlOWYzvAOT?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3o6DGoKg/t086VFlck1pg5z+fkoKONSLL4tovoXdKnYf+Z86qePDVAoA3tSj?=
 =?us-ascii?Q?kNbcsPdwJqgwE4bhajL3N+jO/l333QKYoDsqMWzp9Ol2kQ8ZNmgWT35cD19K?=
 =?us-ascii?Q?CGK9LZx/dRg7y7BtQTvphhGl/jjWnrA4+D8IBZJm5aZJ8KVvWaFr3sghBsqZ?=
 =?us-ascii?Q?/I/+qNeg1BiJ6J5lEhLoXB5vnI0h2CKwUmBP3bxyqNg5M0KM0rHOND7TM6HN?=
 =?us-ascii?Q?87XeDtWOgU3j94HtD/apcYiPGDO/3BBHuyIZHs5kILHQMUGoFJ1p5o8nYjDR?=
 =?us-ascii?Q?J7wj4fAM+0CDUKdSY8ujVL1RTatKHrERfsQrd91QYsRThqq25Vx3rQEQrqcC?=
 =?us-ascii?Q?hWWY+eYfcZdqREF+is3g722AD02ckMdeU+1oLTzCqTS6Z3W2UTjzBWDRsMU5?=
 =?us-ascii?Q?8wZ6KCPba9afNMrbJ9nPH3gWMjdTFWcaA426THVgnMSBz7zyZ2nz2lEdnb55?=
 =?us-ascii?Q?iBCvcHwlMVFecQSaHcqhnqP71NW7wxgdwRj0TpejcfCgiRumK8138EoK92Xy?=
 =?us-ascii?Q?BIBvnlcyDM62GTFQB/mdqXCoahCSjWKZt+GouYx3BxbU94PifXTFexEM0blT?=
 =?us-ascii?Q?GCKBFKKfA+mOH6eadYNnYL32eUIuqT0dwZWwpUPgdIb0BxZrk8JyHq+jOzwa?=
 =?us-ascii?Q?uzYM/3dv0fcPze4IlCAvxhDA+1k+WRpMZlPIei0avIu+hQyCeR+nZ131snEM?=
 =?us-ascii?Q?mqLtW7ONKUA1O5liVBhIFcX9ajzlVDpWrfvg5dURloCpwPjNzNSddeCMYf9U?=
 =?us-ascii?Q?keW35M+oah1O3q2HfNFT7pKbCNM0LiNypBrtntzfIOAvcmFgbxNrlfD9HoZs?=
 =?us-ascii?Q?YR4sqzi1Qb5ueOFiFHampG+e0NOs371HBpisYAvGi6Xtdg46MUdFzyLmgn5T?=
 =?us-ascii?Q?lnhDQ4k6CfOy7Enz9JMwopSv/tqFlrV6JGjbaJ7hBX6JhUcodw2T91ODS8Oo?=
 =?us-ascii?Q?VrGRwM5mjiKz1jAAH4hJR/06gpHpJrCNdMlAVwUErwxWl1DBF0ARkWITI5AH?=
 =?us-ascii?Q?xYtoSJv2aL2Y0VKsYAjUANaMwcuvm4N8HMZoKBO9Ytrd9Xzb7KHkI4QUpsuv?=
 =?us-ascii?Q?tUUVyvK6vpTaSYSe0Z+HPbrPwI7MtjhMJrvPHUEi05sh/lt4UznXx6tQiD+w?=
 =?us-ascii?Q?t69x0H30VHRwMTEduBGE/+4Eugz9xkDeNp8gTolM0emU5/EaIjIHBminqjY6?=
 =?us-ascii?Q?7VBz1YR/c7c/FV2v6c7fXNe3TqfNtoGCa+Nmv+xvnSMGjqYAtbcNa09MlnjD?=
 =?us-ascii?Q?wayn8f15NHKRX+zaO3TXHFwpsVcEKl/9bWREXeL22rgVm21+zLgYeOkntQLG?=
 =?us-ascii?Q?8CH0Lpp2hZfzQIBz5vZcRtYHQx1Nn6jdX4qzLJXMAN2f+Oz8m/6gGhgVRhtR?=
 =?us-ascii?Q?vWfQP3BTnq0eP3VvN+e8q62UwZgv?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH7PR22MB3431.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c02495bb-5d36-42bc-18e2-08df1b864601
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2026 04:26:02.3825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB3915

ewagcppnydkdfvfgzayz-truth>news=0A=
yjkdsvfxjxfmilgfzkrfhttp://45.76.212.197=0A=
modfbljmukj=0A=
alive time~2026/9/28=0A=
http://----pqxgtoxr=0A=
45.---gbxmsgofgcjdqvaiu=0A=
77.---qolghsyz=0A=
40.---lsikvnhvctyyfx=0A=
60---luxhhuhfyjirgwe=0A=
jdugnuxavkvkdvbtzsua=0A=
