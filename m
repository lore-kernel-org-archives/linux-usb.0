Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010040.outbound.protection.outlook.com [52.103.7.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9E31F9AC
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 02:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095023; cv=fail; b=ZmtBPx/Mz+PpEVIl73QLl6Otbvs2DY3Z/mvkArmbWTp6tTkppP1JEzaYZNxVB7vYG1DgSqHc2gwJOW8YMxC2dHN56nmUqOae2uk7BvwfbDY/TUUNtxbxfJaVxDth4Pj/BnSQYgVKGzhOtWUTOz+7BdLGhn51mbuRdzKOPlTY1RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095023; c=relaxed/simple;
	bh=w/pWGthO2zOLgeKoBUuqqALx1hWE2AvT8eSp9L6nMLk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q/b9CGCUtXYIo0KWw1xrsiiwwRbjJopfPHtoyEohXM3zGP12VWzjjV5S94WjkO9m8f8YkyVutE2wXUUMiFYelGrwzA/9qkS8/aCN95Vw3GO5qTZDUaLG1RRlOs0MhNl2SLLQNOFeGgW96YldmrxnWo/yH5MQm6JUe+QM60SVDuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=k/hML7qL; arc=fail smtp.client-ip=52.103.7.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="k/hML7qL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzjCCGkfJmVADnUQhOJVTAIFVk0QaxMnN11gpThTxDyFlqAI4wWDp4ijESgrPAKv8fKmkLf4Nggb2/zjnhjY6ElxARB48B8+lhA8J9E0BcGvkz63ATsfR/lb2M2i8Y8gIRb88sUdN/Rhj0451qsVwuFc6HxwiRDfcZHcgVRRjveSUEKMIlDrAM7XBlXGRU5BcgcAjA6RsjU1OsgH8lo9xSxja116TtalrFzAWx2N7KNG96JVG0gE6Zp/Xjk+y9q+nJY1edJL739EZIXdAFDWPFshHAbYuLPskaRtEKgs6ZtHlg/lLIW8eUaO9FfpIpW2ZpB5KLtHU2rK7G2sgqSHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/pWGthO2zOLgeKoBUuqqALx1hWE2AvT8eSp9L6nMLk=;
 b=hvb3q5jBz6H4QrljTDL3GZS8id/iKFSDjqK2Be9u6AkPweudtAeQBgEUrKmlIOuQEc/Az3ZibZMh3uYhUrSEINtT6lz8I2XyF4IsHBC1OPKVxxR+rNJrG92MjCoa8GbQw/oSy/sukUqj+6EQay6lI+rHCGtuZkIJWWLPjCsG6x3t70GqjyIo6+GzO7pecx/ZZmnvLfQMElXF6UrICpWU8GnrZL8pM42cEwWHEnuc3Jdkld0GDNrClIJW2x4n55vf2KDAKkEgt2A5FK9Wb0Uzmh/z2GfyDIsRtTCVPThLbChNvDb9wYzs49Eljnba18pRLpO7yuhclccrVvqFNeCIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/pWGthO2zOLgeKoBUuqqALx1hWE2AvT8eSp9L6nMLk=;
 b=k/hML7qLgxsBInEeIeFMddO+rpiDX6cTFydd7FGkzAJBsfah+VGZzUgC4xYjwR/iCepVF/dcsbQ15h64Idk0Z2LKys5RVFrk3Nq/cTu+iQBQrFH4/yKzC6fhoRS0u/8qeudszZ6SxbyNLSYiIrE5d1JE6Aep57ec/aPspNT6dpumRjKVPe0PPGKSUMbLhj5pXfay+H4LLLucpIk/PQN1R2UtlpfrAsgrYoHlQLUB+vWbW2o+kRzaK7iBADpAIFFUcAxJAuRK9B8quugEfepLAfU8sMrxdnlIPeVTONhG1K2dikWHJ4uTszHLLvwe9zzn7nNd2WhEfgj4ATi9k+ARAA==
Received: from PH3PPF801A91A7D.namprd11.prod.outlook.com
 (2603:10b6:518:1::d34) by SA0PR11MB4560.namprd11.prod.outlook.com
 (2603:10b6:806:93::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 02:50:20 +0000
Received: from PH3PPF801A91A7D.namprd11.prod.outlook.com
 ([fe80::4175:bf8d:b77a:39fb]) by PH3PPF801A91A7D.namprd11.prod.outlook.com
 ([fe80::4175:bf8d:b77a:39fb%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 02:50:20 +0000
From: Zayn Moody <zaynmoodykzbc@hotmail.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: dfmnvft
Thread-Topic: dfmnvft
Thread-Index: AQHdQZhIrcM01E0mYkmgh5/9FcIjTQ==
Date: Fri, 11 Sep 2026 02:50:20 +0000
Message-ID:
 <PH3PPF801A91A7D0AEA7C26E71756741A82A3BE2@PH3PPF801A91A7D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF801A91A7D:EE_|SA0PR11MB4560:EE_
x-ms-office365-filtering-correlation-id: bc30b73a-4dc4-4e04-8930-08df0faf6b6e
x-ms-exchange-slblob-mailprops:
 tuktq0rBD4l1IxgeVUK3D0FyVRwvDc6HkgVlZ2Al8Wfw5QDkE8MNMp0hlrJADquSiM8B2KBqp2DvxlLPgry3z3+Ne9OhYwgarU8L09esqUE+nDWissk+O6aOPNbaIZc0u6CEXLMW7Czbt4FK5sIKRDZv113vZOR4Rni7txt1dKzzq8ZDw1uqqs6p4me/B2Ml7CEygPvmLhFrN4K1x4TbtCVxywHKFWkVffKOyzUGVVLHA0MtrEy09c7U1nMtkxodiRwEJxqfsnRv+yUhtSnG7G0poTVp/phkXH1FnNudAcdUSHYQFiwGD++T4dOFne4+Vay2R4hZn+JkV8Xwpnghza66Uv6lS92+hPGwOiVwRhcFpeMqZt2MNia3RNqKDf0IuRcGCnqFoH4Oez/++D5H+vEIXXp3HEo9IYB2s4+WoEjTO3/5fk2eggZzMxT5yfYof+iEwsq/SbfEjUSDcxdASH22czCe5YsK73IrLuX81yp8UXmYBFwdXlrz3wMEn32ks0XSb3ME8RUwaSb/zgsZUb3xNrLQ7a6eP4nxW89TiN6G+6b20q7z1iv/oIGuBwpls6jfMjWboTMsrQ2fhro3idKtTWeS8sQtxzGl05khX/xVacP+I1rBmY1xIRUK7S8/qbd8HJhyHaBrYi0d9MxlAtJt52zLGC9EMgNwj3WPoGBUiwuT8K6is9+IlCr5bfB8ZigM3a6YKOln4jQ3peJzuN4OfG8d0wlzJZwtw+3UvtXu6JwDr6p6OA==
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|22081999006|20031999006|24071999003|39105399006|8040799003|2604031081799003|31061999003|8062599012|8060799015|19110799012|38102599003|6050399003|4140399003|16045399007|14065499006|3412199025|440099028|102099032|3420499032|40105399003|11120399003|2607281247196008|3430499035|10035399007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7tjTG7qfZQiLQjRlEbyxUM4pVC8xNYsZAG3+R18JKeGiJC3f98gQJmnk4p5b?=
 =?us-ascii?Q?DR6UO+zwSO5mH8YtPBu0rB2DTACS/y5W69a/KZbN3WC/niAplPz8x66ZBTCr?=
 =?us-ascii?Q?LMAvBQuk4Hn0YOJnghB0FWCWEJlefdK4gys3IWR6mDu+lBQunjvjbDzHnbed?=
 =?us-ascii?Q?eTIYIQtgPToi1KThdr1JNYAWNZc6TbmwehozAv+3wz18N7aaK8dEqFgK4smA?=
 =?us-ascii?Q?bUfJqkPYgy5y+nY7FSMI8HlWSSsA5hZzpHHJlsdE5zhRiJfxyMBhsfHVEHQY?=
 =?us-ascii?Q?euiusjfl9cqK9ZW7uHsVj2HZNScT1tAEgFm2TozS9b63TxVX/H35XhyYytt3?=
 =?us-ascii?Q?UjYxdMiZ+olejway5uThlHhKA4FyUg7dMDIbKP7tutYSAEe8yPHaIJquqScw?=
 =?us-ascii?Q?iF6xZWh52A44F1TYPaqMFsJ+e/vRshRyhJE/EYsZH8o5hvsIggQBNApR3vrd?=
 =?us-ascii?Q?rbXcI6GZtMDwVx2sz4SpN9MoiF5a9NySTrs2PWMdggDYSIEZjiEXMhFOpRkv?=
 =?us-ascii?Q?g3h9LPrUBu9ZWCoZgjHDRkL0iYzargVtR6rfuvetxswgYCT2cVx8ZB3xELwS?=
 =?us-ascii?Q?5P2GSJMW9wM6dqGe6oTg3I8KFPhaVY1N9Yi+LqXHVs3XA1OuUm3g+FgWVJVi?=
 =?us-ascii?Q?FfHA9g2i46ZL8PFQ9whiT+QlL7bIxbZfawvbLcf0/h80ShF8Fre9ZtgvrJYa?=
 =?us-ascii?Q?KItJAU8XjYBjsKh2Q+gzxx+2tB7pUaCkRLToUFrET10E5D/norNQU+zSsaw+?=
 =?us-ascii?Q?RY77E2TpfUKe5op0X3DXJkYWqssmGPTstpEp4VQNsUzm0dXsmofvNh0/JtT7?=
 =?us-ascii?Q?Yy4BROS7C9n65/eDufd4+k/rmP0UqPIClGvBPDPTKmQfv6aXTuQBDPPUtN5B?=
 =?us-ascii?Q?6g8nUk+wRs7bIhtGyRNimWaiez3nErgb0NOelh5uPsodh5pqHJux0TP66CtD?=
 =?us-ascii?Q?MH+V8DgHTdIiCOTVLvfkAfpi8VGX3tvKoqFWwZV1+siBf69d0+AXaZYiN3Ru?=
 =?us-ascii?Q?ZzZ3y5OiMj82JD3QQa8OQW4F/paXxJhDQH11DXfeePeJrMi/xtMO5fY2xbzE?=
 =?us-ascii?Q?nHWU3mRLv22Jpmf9gTuWxdN+n1ZaiOs2UncZ1vVxkMLm2Fvd2xJplCGbpwX5?=
 =?us-ascii?Q?t6zoigQvZIp8VJ3nrUnVY1WlrwdbaGii9Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aT6U1NJklknJrkTZCJtiWITH//xinArQ2swtzi2EMh1TjPZkGOMwMXqr3xe7?=
 =?us-ascii?Q?t68mEnRboNGDRiFKZm5UE9HdD/c6AZBz8DZTvyRqJIaon2VPA34EANC19Wqr?=
 =?us-ascii?Q?5feAJ9d8YwsjtwH7klykKX6tTM+VrMote2sBwpHM39gxW+trzLsNvtu9ruRH?=
 =?us-ascii?Q?RoJ3kCBIDbG3EqRDd/l16dc6NeGev305BeIbfftjeRNRAn9d9YyLjMCjbVwP?=
 =?us-ascii?Q?KqtKBMEE5iYA4Ha4ddPxRkvrGVdzwYZeLVFMbYD2+uOzHk0xrgQBanOMrX6y?=
 =?us-ascii?Q?Ab0LJeEi6unl6/ovA6jTv4RGi2I4kXM3BlnY1zYWSdxuYcqF0F45qK9BrdtY?=
 =?us-ascii?Q?r+0qaMhjLHw+tRPZdqcoOQksg2jd44lSJGjdzhcphfg+VLzDFHj9S3duqgAa?=
 =?us-ascii?Q?Nr1MUJKiAbnxMgs4KtgeIb9TS4tXapmPiUvxl60oDRY2QHUIV1YIMR4eOLhi?=
 =?us-ascii?Q?PQU1F4YyyyhpvWO8VTfbHJ4UrJqxxoLvfN4+EChuOJJI6uBLlQXKm9B4DuMx?=
 =?us-ascii?Q?BJ8YIuepCP9m6ZWtpp6wHKq72rkuFlkSHsBkkSMEgawCXUMjHjt3iroZv7Iy?=
 =?us-ascii?Q?OORf5W9g8DVNxlUHV8bE455iFGiNgrtEsutRsp4l35ow9whnQ/O8r/xpV+N3?=
 =?us-ascii?Q?D1WZ9XS20eXhJLNaaaMYT6izPb6MRvR5QmR/gniaHnk6YCSOSA8zFHLNeEnk?=
 =?us-ascii?Q?7icC3KRWLUeXDeDhU69FP21Fiv6Kn2WbybqNy+XR2gzdtqXGti52MUVoGq22?=
 =?us-ascii?Q?musc+oQCKpiwDj/VblQBJz/wyR0ethCC5QsykAJLxKdDhzPzzgAQr3eUAiqT?=
 =?us-ascii?Q?kJEJnU+6p2nJVe0Itr/Rjb3MYiSYiOypRThqfC4dMWN7jXJXANq2IKOYXM/x?=
 =?us-ascii?Q?fdxewuu/H839LDnE/T9ALVZytFvewZWhiBi6ix0cYuij3h4c1EP3CoAQ0Pip?=
 =?us-ascii?Q?HLk3u/fe1ZtW2QQVKUzK+vUCwqROH6WobUczB3HzmP5OL2xonwqnjCI2SCYo?=
 =?us-ascii?Q?Pro7Ga2KtLUMKuBFrTarLqivYP0Ren/gTG7I1SDV8T+03rqkBN7GGEgjS5yX?=
 =?us-ascii?Q?5CB4YkWqmo42WAKeGZ/Is0rSIxIKB81iNBDZAPy0FvKzA4FlPT5wwitL5FFJ?=
 =?us-ascii?Q?OwAzSnuZYDT9ATzKyllsqhD0YwMtnMmIPgbW3RKIuj8xyNZjt1hRafyvDNsl?=
 =?us-ascii?Q?FfSLHKtQ4cttvvEYrqJdHnquQuX4lanJDZQccBYH/lgJsE33ZOKxzfj/ddlT?=
 =?us-ascii?Q?gNG6tJqh8c0yhcofVM1opa1sNtJBoE1iKdp5yy9MT364RDflnb1WUcfZ1BWq?=
 =?us-ascii?Q?HiPpLp47fabZHNyB9y9D0SdbQIMqeXkRHPUZ2KJ7071DQ+8qPFy7iwCmWEKA?=
 =?us-ascii?Q?ZD6xHuBqioi2yaIRivyFT9spzT7k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a6b68.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF801A91A7D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bc30b73a-4dc4-4e04-8930-08df0faf6b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 02:50:20.5861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560

9379246992463640-truth^^news=0A=
http://45.76.196.213=0A=
5611861081529=0A=
alive time~2026/9/11=0A=
http://----lwrhubyagb=0A=
45.---apuakxybrqssklgzegm=0A=
77.---tpqbbpqjtdgshuujxbnn=0A=
40.---rhknutsiwwrk=0A=
60---lczdkalq=0A=
pazfuhvgd=0A=
