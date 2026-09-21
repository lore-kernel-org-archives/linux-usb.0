Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010007.outbound.protection.outlook.com [52.103.32.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D264D17A0
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 21:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027473; cv=fail; b=ARUOS9ix8BpCogbIX5hg6k8hCn0aTzeyfSmjrobZ5BoAAdxiMwHcZJzJggfX1pkRUFeM7QouXkWFniz/te2NnMsGK6lMX9RLdK1x/2fDOWIh0cisyg51GWdPp7sZufxBXSwE4KgwUCUW3xzQ+gr/h40Qe1RaySMQiBTduAjMKT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027473; c=relaxed/simple;
	bh=DPxzWoXA0M6I1VjKAAyI7JzSuIEnNrHwI+bZfY5r+1o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uybnJe07n2SFDN4zlOvuBO0hZlYt8SpEGTwmpSLU95qLwiO5zAfRs9IrooEs89AoB28jLv/sOwnBY7nFEJlZa1HDg0aQDTM2CECax2XmONpjNEWVXgLoEJbDmr+23ZiJsNLurJ+8sJyXCH4teXAm48av8P8I5JhBtqGbxuKwh3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mZZ9yTAC; arc=fail smtp.client-ip=52.103.32.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mZZ9yTAC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYe3x/4aXW1v2QL84/BKm4T6Io9uRz1QBYM7VBzmY39oKGaITJdDATJQ99VHWNwTeffILvYfKsTBRq5tj9WPnYmWAGvYEBFs1Pm1yz1g+YHMHcAaXpbTgF8DOvoZvy3RV5q7t84cgGaZEkJS47tUmtRYRuNH0aAf2wMd7J58eSAqXFWFFtrtsG/3ASuBWSTCQQ3Bh+n4CV5A3SAPuF1EHKatmn01V9DNaJhUbw8Mj07UT1ImMdvRtA/REvqL+ZNUV2cI+5gYabHL07bsc+xunxAKkjJHgNdm9lgz+inhht6njn7pqqfUPD2o2Q4LFzyARvDn5+u00k11o2bio+gPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPxzWoXA0M6I1VjKAAyI7JzSuIEnNrHwI+bZfY5r+1o=;
 b=Sbgtp4HcPaR5zHg7QSr6SiuOhTTWtoM1TTMtnqE/l/8EkPaSGKCFtNJoAakiD3qNF2JL2EW5oXnTWNap/ej48urWuk6w/7yDalA5eMf2R7qnje3lrKz0t7wLmOKMcKBoh3dLf23mvkeUHEEfOFUkDKKmh7vIjbK8Bl1K5tgIJCVyGRYHq+FDJ6ni7hZNFMTOEhU5/HqtyIH6gdozKMhXxWU258QsCKDlj1u0ramviR8Vbf/MzFthRPp1wk2VzCOe2IPR8uO1GJZSE46sZuU7079FRfN9EjmfZ+z7xoydySzhNwYqjlrCTbUrt3yHJfH7ZtdMht1I8pV7Ib8ElIYtbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPxzWoXA0M6I1VjKAAyI7JzSuIEnNrHwI+bZfY5r+1o=;
 b=mZZ9yTACjSz9KCwoGk+AO9U8mUfmG3OKJl0zSLsVXA3WXRkZltYcOTdQ219WAe/VzW/BY476n13XoKKQDih7ipexdLTA593wTxmFTMeBTnlAuTx/h3uYehQg8WWyf97MJv4LwmREdPiRgUQeqqQun1RaFuAKTlVaPPVdBy/vWsdu/OwOr26YAfflMmnSrcKWehkipbx92j17Gqv1PA/QrA8hiCfX7IZqHAS4feEN7oyxzn4CZQacxVbNjwkW0vVAn5be43Xl5A4Pr6MXxh5uqKMiElUqm5y0+OOtah1BrlnUbGqponZVGTgudKM/0RKt/fjceRdP/qWszyz+WPqZOw==
Received: from AM9P192MB0885.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1ff::16)
 by MRWP192MB3070.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 21:51:08 +0000
Received: from AM9P192MB0885.EURP192.PROD.OUTLOOK.COM
 ([fe80::10e5:5728:e110:cab6]) by AM9P192MB0885.EURP192.PROD.OUTLOOK.COM
 ([fe80::10e5:5728:e110:cab6%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 21:51:08 +0000
From: Nash Stark <nashstarkqedc@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: fygpvcyumymeziqxa
Thread-Topic: fygpvcyumymeziqxa
Thread-Index: AQHdShNPvD/81GVISE2OCCB7nSw9xQ==
Date: Mon, 21 Sep 2026 21:51:08 +0000
Message-ID:
 <AM9P192MB08857CC0A3AC8497FAC6D6EAA4842@AM9P192MB0885.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P192MB0885:EE_|MRWP192MB3070:EE_
x-ms-office365-filtering-correlation-id: d13c7d42-b7aa-4e12-48a8-08df182a71b9
x-ms-exchange-slblob-mailprops:
 ZRuQdVKRmYvr6DCYPAVbnIMNHPE4mjxtbpSNuJddsmPc2nyuw1+Qr79tWCJ8+OTljvjec5QK1gxUimpa3bwnU0O8oQk5C3Z4pcMfQkEBsP5hfBdKLSQFSkpQFBLHiaviz668IwTW/Ye7HGq6sY6ThJlJht8BaE/PtrIlSpZZ188bJdrpR7ZE2foUIdwCj6sImlotid3Vw81wQlTDR5fkUz+gl2pb3XasA6bN2umh2etPmACNzGuuMDp5ps9E9USy/x2HUL3LV2OuE5EFKF5eZVy6uvupDlJCkled90Zhfd0hzWuebd/SY6Th4eB0US5cWxQHlUPwzXvD4TO2EM7oL8Q63lUaaRvcCSnbjPe/a7ndLoQiJvv6iKqK4ERZ0u3c320JMWErsjwCEtQRKhyBMHx6clCIeJqeTfL7b5mbClHwu7PQbwNj8Zv29l1k+43/eLtbYVzX1rRDmQtkNauzvJKr3+fHuvR95xiY5EiRIJoMOOC2ou7OvJ6KHuN3XZ++ev78nHHKHE3SppW2eIWZxWZDoN4YxD7dLmzZPt0Cn04ls5K+Py5wDcZQoMw1UxLurK4KkSffStyN9Y3xaucdAsbqPXrXwSE9cVr/T/BshStdkhHlbE5EQPCDnlv1+hZR2j89c0Ga7jDwwKaBlalccRHEcoCLFPZF1GW70FglQkvL0mWtdmzkoZ9Seuw1hEFk1Ngk7+0YjR6RiBFuHNCqMy4sbAy9Cndt
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|38102599003|4140399003|6050399003|20031999006|22081999006|31061999003|2604031081799003|8040799003|24071999003|8062599012|8060799015|39105399006|19110799012|40105399003|10035399007|2607281247196008|11120399003|3430499035|14065499006|3420499032|102099032|16045399007|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xVCK7jrekvp+g/5gREnUdodGuNxpnTJ0yHj4nXS67nI45qN/yTBtYvpjVS1o?=
 =?us-ascii?Q?T4UdcB+EFemV4BgC9/6zNTBMXjZbSWd4r+iNjn5DFiJb7s1bp0Ufr186Wut+?=
 =?us-ascii?Q?ShFqNNQL0CEwUJUi7xcKBknGaWEHUSZeX7LPn7radGF/eVt4wfWrPW66gsra?=
 =?us-ascii?Q?iKe0YWDoIHmK7/ryfku9JdL6SAWcwH1VCcG5JaoWL2XEHmDo0ZNwAT5jYBR7?=
 =?us-ascii?Q?j6X/4Eifr5r4ytVbBCfpApWWlM5FY3PaoP6PXVVYzF1mnYYKxWRnnngrBuUy?=
 =?us-ascii?Q?hnDIJi6thqNB1ihiaLKNWMc/C08wDqE7wXXK5SK8iTUMN6ABxV+W/KhhOV2w?=
 =?us-ascii?Q?DA0dzX5I/82tPS10gR1n1f8f2SQeu5TKYs0GbmNZ5nhJOrxkfxAGYt1TmqLL?=
 =?us-ascii?Q?CNOQi/EN20Twny6GySumTi7K3sMoCNvd1XeiQc/kIDH2Mewcbi5oQ3rM6PgN?=
 =?us-ascii?Q?GMrzCD19Uv7gla8nMfVGr7W0K/vdzzVsiAueZahDje+VQHywY8Ig37r4EBSu?=
 =?us-ascii?Q?Gp3b0dO4fzNZ/zpj7rnLNnrgL1UzyNqbj9r+orEmm1jDy/z0iKs5+luOoR/j?=
 =?us-ascii?Q?CnQzz0IY1jDttAwi3nWMK/0HwxqqPHrJLw9++LkU/8KEIDuDuSZscKUHxgYM?=
 =?us-ascii?Q?J6PZAie+KmNMbal0w3NnNbmevKc3aYb1zZ8R+8QiV2J6qhXsBqj+KvvrQvcD?=
 =?us-ascii?Q?Tm8KSFnKsI/fvU0jl1apniXxKeDR/ndzQsX2o5vKUFHgU9e0QpRz1KixmXSB?=
 =?us-ascii?Q?IMIbDQQdONj1zhbUKRWhwhprpwaPP0U0EnivfY9ILrSD2MaHFtXZZkPJpJ3n?=
 =?us-ascii?Q?3P9XSgQQBJDWWHFsx2yKFnzg+ImOTnpfJGFcqpl3wlnYGHNSWdEP0xwp2Tdy?=
 =?us-ascii?Q?YfnkR4WyycJWUOFnGqbLv49nHHGIvgZfsONvlvYUo9vPYw5IN5PWFwIseJpw?=
 =?us-ascii?Q?Dc9E9GvZOxaWU/qJAlMVNcGjMCjc0Ln0ZINiVZmvOI/SgDAaT3mEFQRxUOMR?=
 =?us-ascii?Q?HNCh46THpkVxzZV0iawYTYqq5OYnDmQI7I5UrFjujZqtPF+RtigR6kzv9DcF?=
 =?us-ascii?Q?LP/a9SK+98N9f4PqWy2C5zqXIyuHTqofNbQbknk9qjA6Aw9azi7izFQNVo2f?=
 =?us-ascii?Q?CLnXTYxwwncljuUwdj1sLXHR3FjX3/Ww1g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OdTurJbi5B6/19FddvE92TSMAdOeuyWPlYeYOfbJTzGa8pXgrmif4ZaZJL43?=
 =?us-ascii?Q?EEsyAhbkRurKUA+Es/JbhI+6KPULF2ajLh42yA2TcWLK3edlcHQfdVqXMkhr?=
 =?us-ascii?Q?OcgbRxTF2uk36KtuuTkfLMy5kL8GInGfEgA4/5eUjZZxiAIwW/kW0vZ+7C59?=
 =?us-ascii?Q?YSh5MPu0xzOgYokvqQKTKZrStOA5iAdpxONZp3mdnZ0qDXYlT88U4/O90dVG?=
 =?us-ascii?Q?/z0bm80CntulMvKLZQeO0t+rEX1fwfSLxRUuTNdGYGmk/VOXgHGzcNGDDRxs?=
 =?us-ascii?Q?Vm6nlnVsGVYg3VqOZ7OOPEeI8Qe41UrNxD8c+v6gFmYRahEDx8uhdPDi8u9u?=
 =?us-ascii?Q?S6XqOwGF/Vh6K6BX0rFR1ERp7VKY8nmYjKvVx7JMg2uPTMnJRt1H+Oc3RLv7?=
 =?us-ascii?Q?oZD2o8Evfy7XojlLOmSVOIxbpeQ6nrloe9mm2nZtqdj2/s96jhCiOEd/Uyh2?=
 =?us-ascii?Q?RaMFOJl32zmRb0FEJIsjb4g1KxgxvIHiq3/DRdYlZhtsw2NGw8r6QMd+Iysn?=
 =?us-ascii?Q?Psjt680scWH1y/+viArsXwt3XTYCgoqKzz530y35CP3kBzqADjUupg/4Ld7K?=
 =?us-ascii?Q?brqhYVlz1I+O5CTR11QPPAmGjCdhGeSvGyyqnlpeZ1Uw/8FYprl7TaomgdBz?=
 =?us-ascii?Q?mNwrLEQfy24E2soOobTXf1gYUsS2bcQKQQPz+77lnxFc3qjeiwKrK6KfhN4V?=
 =?us-ascii?Q?LrGuA8YzSEkYO18AbTTZ26MgnIWwMfnPee+5AQ8vY5SmiAHf2aZ2WdGikscs?=
 =?us-ascii?Q?zluZHRViJpdVLnXevfpd8osZ9IJsGDEOKCFwojqPYtlpNCDCjwD/c95cVFV1?=
 =?us-ascii?Q?XnXYG7G5XMoepsB0Zc0mJcw/+5gDwk771b8c/Ig/O4457C+Lls8e0v0jZOrH?=
 =?us-ascii?Q?5cdRneaijyTLPF6zm7c1R5SQhIicZSML7DMwY7Mmxkw2k1+YYW/6OHX5//IP?=
 =?us-ascii?Q?vFVgNB+892/3OnXSwd51ghJBDSZWJ7zVjoXsJ9gETwIJgF8nNhP4yX48nwXQ?=
 =?us-ascii?Q?TaHa7QmXmFCC0w2VOlYQpZkS2zRqjRkJW/pbeecW2lxEiZTTbhbejfssvzXA?=
 =?us-ascii?Q?neE+juFydKMBYJjBeFkaLMvt2sd2vpIBGmWV5+b9a/vqFmimECeL6S46wRct?=
 =?us-ascii?Q?JE9b81dt0ub0GRCe0e7ToLBTj2aLb+hOB94kS165PQkIlzjb4b3A0O6aYO7g?=
 =?us-ascii?Q?dDrxb6c9avn/sAAaVpmjWdsZ+FKfGLpWWxe5hr7qfDvbLPMIkRCxvql84Kib?=
 =?us-ascii?Q?arFlOvVXlyueRlbTDYyEGE6AZZUBzAf5YrlWI2xRIONDtF1Ru3X8vx9zia2v?=
 =?us-ascii?Q?/t/AiH+VpMC31hb+305SaActmTQx0HHgRlc4i1s4KdNavPpyJp8feFp0BLr+?=
 =?us-ascii?Q?j/5rFrB4CA6HZssDv2Mqgx8Z9I4G?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0885.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d13c7d42-b7aa-4e12-48a8-08df182a71b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 21:51:08.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWP192MB3070

cgdcvjtuauxjz-truth>news=0A=
zkuxzsnhttp://45.76.212.197=0A=
cslydubjukggc=0A=
alive time~2026/9/28=0A=
http://----tgrlvsjcmh=0A=
45.---faxmarjumoq=0A=
77.---fnyxeivdhaiqadcyrxc=0A=
40.---unlbebprsacvqr=0A=
60---jhcyu=0A=
ubanj=0A=
