Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013087.outbound.protection.outlook.com [52.103.46.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8B3DAAC8
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684343; cv=fail; b=Rkp1UBVBfXhVmNx/dMV8SzmJCL6FX2rvjNJPyYZczXlbHCBDstRzxF8WZOXSTbyb3A4B1puEvUhh7nJz9UrAHimIStXIJc4ihbMnSVjzGlNf5wBoeQl3KB6GA7NEKUAjSdPdr7esEI4lm0BwKE3bkK/RWC8qyve7c6gVkIxTku8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684343; c=relaxed/simple;
	bh=oZ1bzC4EGDcRRKQxIsXp4YgYOUtABiXtywRq7Fsf03k=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bJApAXDEW4PPollps6RKfNWMj+H/4JLRpebzingQRDTYCVx3EL5wwQ1UeJB4VG3ID762nC98f4bKktgnvB4y3gzGxIrKnn+6M+1K+dGRX6FpindW097KBp/FJRPYYnPt5O/mhBDJkHUIpvO7gTw8AGhDV/8TZAZxxQ6zdwd3uh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fljohqx5; arc=fail smtp.client-ip=52.103.46.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fljohqx5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtwdYs6FMMorb+1Q6xjON9cEpoWzv+5/rahbvW2hG2mSQiB4AyVpsGp+4dQYGljRMOaNjIOUBtGm4H+qmCcDT3PWrgl++rynKHTfiEOtXQYRIiaCuELWzfQiX1T7Ez31igpLUh3Mgt45En94SIqaN/tmBqMaiKlUdedP8SJmqAzxwJ3Sy0TuaD6hfzrySeKjhqKQuKbyz3LiAIK/SFm6oleIKJg5SI007q3Ky5rUlciZICRCmmGcV6WbNlQ5ok+8bg6xVaW4G8YW3Hu7Wek37DVKnX4aSCSkAneAOirVwNf9lG9fFOHxjtvboRgQHZuAF93dUSJ9DR0Wk4L68syYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ1bzC4EGDcRRKQxIsXp4YgYOUtABiXtywRq7Fsf03k=;
 b=g5olBxs4DdYMsWGABfZB0W/Yq+rgz+bmpuuou9B+kZ7LKKuz61yXOznzBL5qKwiEcgCHXsA7m9uYfIKmjSATfO2f2HBwI7s1ObZiZPpPbqNUJxM9XHZd4QunP2ToCDlXlS8PqlceD6hKHTLwdmoAJskdIzJixXgKVgOgkMO17DqLjV7NjnQJvTZuWFPQxKI1VZQMorgq5rj2XIytWkusvs1HCW5VELmysGKsKcfF2XOypzkPHc1ZNOJSW3D/OacUha00AMO7g5bb1uAWwhGkUn4hkFKw138m0YpYfdU1/enH6BgheFjozjiHMh/dw/DngbqXE9eJGciEZP11fR32MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ1bzC4EGDcRRKQxIsXp4YgYOUtABiXtywRq7Fsf03k=;
 b=fljohqx5iau99uzNS9Wv11R3VltezENrw2qEcIiSGco5Srql7zgoRHFeeDbDtbFEqc6ryPGJdaM+33sXE84EQ/SYRC/6cYowX+oOdTZEcIsUTMFbTdShR+EXyKz3edRMq1nOAxfwZ8lsETR4JSv/8JMop5w5rvmNxBRAzYfEB4mZitY7zN+1YCH9HV3fwuIYSeGsg01YfksmvVruJbkWzi9PRPDInXYm3GJMeZ+vDxdc/a1bfAQ9dtPgaEFtmo4tUh2u3XkDhcNi0oEyj8PTWOBOH2oVo8biVYXvTt5vTRMWk5STwC/8by+15yhM9FcDTFD8P0ug7ptrxLvcmdcxVQ==
Received: from DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:495::20)
 by PR3PR10MB4110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 17 Sep
 2026 22:32:19 +0000
Received: from DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::db1:75ed:6167:77d]) by DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::db1:75ed:6167:77d%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 22:32:19 +0000
From: Otto Abbott <ottoabbottagqb@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: sjlwvywufu
Thread-Topic: sjlwvywufu
Thread-Index: AQHdRvRmLW9OnEM10Eu8+2JKcwFB0Q==
Date: Thu, 17 Sep 2026 22:32:19 +0000
Message-ID:
 <DU2PR10MB767909E0CD71A434BA5CB325C7B82@DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR10MB7679:EE_|PR3PR10MB4110:EE_
x-ms-office365-filtering-correlation-id: aa543464-d740-4dbd-c8ff-08df150b88d7
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799015|39105399006|4140399003|2604031081799003|24071999003|8040799003|19110799012|6050399003|8062599012|31061999003|9112599006|38102599003|22081999006|20031999006|16045399007|14065499006|440099028|3412199025|3420499032|102099032|40105399003|2607281247196008|11120399003|3430499035|10035399007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fgeQjv/7dVDPna2UZ5X9Mrr9QNutTUK/KQ7Y4/qbZHD3elENI+pbmKoGz0Nt?=
 =?us-ascii?Q?99cihK6S9dtDJFeiNKNmcUPN3GXMB1nLMVhPabB9iKoUeBtU3U5bqkUILvzi?=
 =?us-ascii?Q?uB+Op+Nn80rAgpG/5qQe6PNVtAi4pQsI8++mYTK1GeW2Y6DflRjGtR8t16Kk?=
 =?us-ascii?Q?7BJwyvPpmENDaJptcFFADt+CdJd6tSU8+CuJPyiyJ68H4KNHfgCHNPf1DnsZ?=
 =?us-ascii?Q?iDW3jSkq6INzIyoEiBAbngCEhxoRgtVzIF2b+H3ktD6FLtjfIU20aHaBT+Hv?=
 =?us-ascii?Q?WGoatQKVd2TGbckkDTk+LzjTF0YfotvCKPuC4PcmNSIURtm/BdgbbChj/u6O?=
 =?us-ascii?Q?n9EfMmU7nd45nb6/k/w9pUzVGAqsCsaz2IgTt3KgKPchK9J33VksYSIht+O2?=
 =?us-ascii?Q?HQAWu/hKckQUSuKLp1MNfHWKxZYaAMNdZXJKMN7RirT/DZZXOmZaHgFumXVj?=
 =?us-ascii?Q?YSzx5ZHVkW00ry0ZIN1/BBJOCBK4dtvNOPqUq2Cjzruj8AiDS1k5L7XPWCyD?=
 =?us-ascii?Q?on2k9hJZUm155eXCXBF1aNuxBGWVs4quLZY/hf+sYvArHwx7M5mSYqWiC+Fr?=
 =?us-ascii?Q?VQFc9iCvTnBsOlOnlkwpt0w2YURHQTif5SixV2waZmUjvqUeNIL1Zukj1KTr?=
 =?us-ascii?Q?/i7u7XYOKjKNcwdfgVx0QhE+1WcthicTy64sPD6NCQEX2wVG6mmdF8snHCG6?=
 =?us-ascii?Q?ap8/OGKp7S17UBXLww+TRBrFx/KvuxEDupJPNY+XIo2qGbqJM3xxm7ouuC6z?=
 =?us-ascii?Q?dL4DrojL0u32WWXlEmYa9ehhxL0R+1q0g+azRZ2DL7HnysuRywxcjZvS/BWD?=
 =?us-ascii?Q?HbNnfdtpZbALSKFYn+dXnF+HJmCMBDQeSloE5nMFnlIvvjA3dLPbS/CsY2p4?=
 =?us-ascii?Q?9kzEsEUxEDRrhLd5XPOw7rmEr/cmWeKGEwjL4XNijmMLAgIx5WCx4ruNHhn/?=
 =?us-ascii?Q?KzbVZnB5oyr228MPWeA8fXINn6G061txBH1Rl1SDQQyfrqmZ57A3voJIGpLM?=
 =?us-ascii?Q?d+EXoKbgNnBot7zsGfW4ikwLYnpKrcRib2sDJGJPEo6+isPhuhIu93PesGpu?=
 =?us-ascii?Q?7cM/dB3t48st6REjdgKc0Ufg46PTwWgdU9a4cYl20xsF9AbHJ0mFwB5CqH4Z?=
 =?us-ascii?Q?bvxIf08pZLJj0hgEAwU+VbFnDZ17mUZdZA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?guy0hYnQSZZ03R47NyrYURTAIpNqubakTd+anW885gzj+rUcUV0qcePj+pLr?=
 =?us-ascii?Q?6C9dljhblsfllJaTCJwSD06jOgL/m7q2lf1AOKuDOYNIMvEJuz6BOeMo65GV?=
 =?us-ascii?Q?IVaQNuD1l0vbRWN1PL8CbAfzNoyWHE9aMz2/u/YAZfQPd9smJWMUu8eIPTzK?=
 =?us-ascii?Q?Cp+vq+iua94V6GeIuURjSom/hw697OQsIKt2JQG39TQbdckdJxn8o/lPrQuj?=
 =?us-ascii?Q?d1WziRWFrKcGMgXFe6Hp4zr3wzcu1zkrZmo/t3XOyFHaVinYIPg2F04UXxxD?=
 =?us-ascii?Q?RBlDpIg0CZEENjPq9K2hU7lshG+cbNm/61FXfazYd8B9ItSt0oVCqv3Oc4/T?=
 =?us-ascii?Q?9nfU74X40P5SK9qqdOCHF/A++M0B1EfaqGE4wPqrKwNmoHy2AYigJUvWkFT5?=
 =?us-ascii?Q?8OcA/NpIUAoedaq72qhN45C8zcn9tVrBd7GTEQODWFDAxipLdAWY1fFX5bZZ?=
 =?us-ascii?Q?ZbnXx23Rjjvr82P6HikPb1m/RVax2tUIvAqG2P7R9dXyu4pUNQrSG/u9QFXE?=
 =?us-ascii?Q?VBO1NALz160Yfh2hMvmWsDGezpzMMJsQqpKC6YIpRjEOybLYe/DJdkGNO9Qr?=
 =?us-ascii?Q?SSGRWL9Q85RXtYUtZM5QmWy5+vWxuzp1Ar3LumVcyYZV0wKpefyRhpWOp7fa?=
 =?us-ascii?Q?pSvlzRGXpK8LUw3L1l1frzuu05aBptBFdxUgqzB7vf7U+2KKO0HmDCw70euv?=
 =?us-ascii?Q?pUlI0FHblTriNJCpizyUpLKfzMxryV6IQ06qqzXW+DzfYXO9Ld9WGuoWcUAL?=
 =?us-ascii?Q?UhKivfzK8S1WtF90mjFiB77jQycZotFuDBz5OmkuYgIX/P394xqChiAiGX5m?=
 =?us-ascii?Q?LWWDtZb2CRx7ekUGbhpt3zjSRsU5iAMT7exkGxjbRaOPATwLh+RZqLt3CUvM?=
 =?us-ascii?Q?h/LwJm4bouybsZL3Wdsk/gSpf5PlgQGmZ+M5ke91zPcOpFFRqAdKzirf7c88?=
 =?us-ascii?Q?so+aoPJsb5j0Ka9aDUAvOKvs51i/TnDYJ1kXToKkpyMCNwkAqUJhiazFNpBg?=
 =?us-ascii?Q?v8tKEFWASLZaYhdet/metlVNyBtLk8FM21RXFzkyMOphm+sM5u9zKV/xzpkR?=
 =?us-ascii?Q?UeIBWdcNoVz6/RWKPMFB5X2es8EfttYH2KWbCVayECEwVQSSMPtAwiV8bPrd?=
 =?us-ascii?Q?w30rMabjt3+tNwuWuGX0RB9GbfdJVyJmw3G19EtfrXDOMj8WVOz5jjjks5z0?=
 =?us-ascii?Q?KwgTgMXj1JNOHbfYgRv+mBm6BkKx07ut7VBPUuWorfpPtICikbby3HK4x5FP?=
 =?us-ascii?Q?/fFuJ4+L0KqYnCjxYvsPYJbCv6C2je6G0n4XTNntWSbNnoj2krzPYFe0+r/Q?=
 =?us-ascii?Q?qqxPUnilaRWy8aY0G6qdJbxy8WVRzLS9eFrcgM+SjlMmEzNBuM/Qg25xQj20?=
 =?us-ascii?Q?RAKc3D20nPFjDVcm6nu8iZ1onNw3?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR10MB7679.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aa543464-d740-4dbd-c8ff-08df150b88d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 22:32:19.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4110

jajanmvmuppbh-truth>news=0A=
mhysaryyhttp://45.32.36.91=0A=
osthxirigkvprc=0A=
alive time~2026/9/22=0A=
http://----mspkv=0A=
45.---hxfsoiclea=0A=
77.---dusdlnwwaislugdivzy=0A=
40.---aixfbkgx=0A=
60---vwrtrarljsmufbqo=0A=
xyomhhazibefdhr=0A=
