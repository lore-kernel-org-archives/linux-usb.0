Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.11.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793005039;
	b=pf/smPVKsu1aeMqrmaQWrIWxtTjYQDDRA2iKs0GOgAo4wY00gpjmP8MbbJgX7UUKS5SS
	 EeGgYAwB6uz4yODoIjq1v2JtSpGM5IRhavBPXpUNolumt04NBcof7wyzrw4NaayqHqaZ2
	 iwiryljeI+8kNBvZSCawbRKubXRusaOL6e0BuRaqRmS+xNXAHLXNH4Bxv5GklYzrg3jnR
	 W4Wlm/bm6YV2SQJiro6ynimywkTqGXp5lS3K3quQ7pLQK2c0+qazfXvJ3HG7ZDFw47BJ+
	 gEAOYVh3kwXbWSHZGYLZg/g+qFN/JrYnKERr4Hs3MvvWrPtds+9tgd0a3l/Ta7C/QHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005039;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
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
	bh=n8r9bX+5sJbcU8eBeWW2tEUIAOfW59nktWUt9N6NTpc=;
	b=DXU/EWDwjOUTM/pLXcdkZ78oJDB3vOUldpDWmk5QAzzqD1BPA+Ia8rHw7oQU96n2rhKH
	 O4z8P95GOeOEn+dIqJ6W6V42X375OkRKljyts+dI7FpXAkXilWz5VnxzRQ1CidNuqerK/
	 9wzkoBVjw7qHfsR2h9UFau/hDowEqeusb4zV91ab35813n0+3FMwGdu6yUCFhdbCg96Tb
	 PqdsKm46uMMsn7ZVyCAK1xE6JZLxRBAiGYIFJmWFAXSG/gmIPlaPyO0Rdb/E1NPGWGdEo
	 iUyj2QTf+ivwvsfkieEsUp8dgJbPtagR/tf5WeiQWLUulGsgsa6z3uUzBOKi9+o014w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=T2Gg7EYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.11.79
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012079.outbound.protection.outlook.com [52.103.11.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C513606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 08:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C513606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=T2Gg7EYJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO/uAmkhIEJRrZL7B40CtcYphNfoXxfumVZGQT034egNBVayy5qZCPApOIl8WOo1Mf0Xk9+K//tUH3VEem3nZZ1bIprVBDPFDY6HNHIpRkF6k2NfLe5HzqLLimaS4DRIhHmICPAVM2PtwgoJsJFpAT9fvgITW7OT2aKLA6ztuNZpJHoE09+OFXxFOLtRZcswQPsYnDHg8fOgee/2m0SkvKIm1yxML5DTpcZPWbpk9U4TFGe9P6elab7qVC6J7UuzGulQLBY7Y0jH5eunipn17cwU4qtRplB1mIO0XvZjAdDAXnwXuCswbv1vJM1oRtaSDsdcb+N06SDNqsiDOiZgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8r9bX+5sJbcU8eBeWW2tEUIAOfW59nktWUt9N6NTpc=;
 b=uVxITlkLLJ9N+CkmcUcB6+2085a0ysUdB8joNnZ2GU3P0y8Vj35at81QSQ3H/BuOBF5pboT1ZsW8n4YTyz4ilW1rmIt5rUEv3n4YaN1zMbB/bgz4LZNLiurpynz/LPABVEIa1XJ6bDY54dzWBEsDUeLGNcikAd2uFWUvhqcx7e8jYL9HUakO5rQOconW7zGeg2GTUtqPgA7D17F8ucka1QgYs5rbpcmaNGmHhk0blC6LovM7J6Tc2YhaezzGnB64KmfL9+1Y6rvF2i+12X9yi9DIZqd1ldCv6tPUqJZ/E88b9iBvFnuPOj7hWcIaK3DRD4lxf2Bwq7z2iQpbSKpVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8r9bX+5sJbcU8eBeWW2tEUIAOfW59nktWUt9N6NTpc=;
 b=T2Gg7EYJFTyeJuKr9j767GRvm1mjxmRkvEMhxbXshdWP0ahsBDx3IGXq1jiZkuMConvSJznmuXoEJeM/XkxOC6J1ySyEerS7nVWlgR4G8aiMPAlavZ6Hhwj8HlHT1623QytT111gUEc8VdiB/72nd1bINHckANY78kRK+lWo3UAnEgueuNTHIAgwfOIJoVChyw6kvQ7K1r+q9JD/k25T1COXdRbCHpxYs1ct+94mER5lSInzvUwEdfkPi2yvntg8tKNsxdhiO42KGOVzBH3vIy+h/QgaApttROV0nIeybYFEJa+OmRl86A6cF1UOqbmnWD3NPr4GYOkbWWgVi7aKpg==
Received: from SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18)
 by BL1PR12MB5947.namprd12.prod.outlook.com (2603:10b6:208:39a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Mon, 26 Oct
 2026 08:57:16 +0000
Received: from SN7PR12MB7227.namprd12.prod.outlook.com
 ([fe80::c0ee:902d:346d:3a]) by SN7PR12MB7227.namprd12.prod.outlook.com
 ([fe80::c0ee:902d:346d:3a%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 08:57:16 +0000
From: Zechariah Parks <zechariahparksdmnx@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: fgfkrkf
Thread-Topic: fgfkrkf
Thread-Index: AQHdZSf/9+dgxd5bp0W5AlTGuv8D1A==
Date: Mon, 26 Oct 2026 08:57:16 +0000
Message-ID:
 <SN7PR12MB72272883680B914683BBD64BDF612@SN7PR12MB7227.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7227:EE_|BL1PR12MB5947:EE_
x-ms-office365-filtering-correlation-id: 7cb65bf0-e7c8-4e7a-1264-08df333f225c
x-ms-exchange-slblob-mailprops:
 ldIvs8YOYsJV0MS4wWlLlg9U0DHFhdIYRbUiaMM/l6fG4detEbv2G9/7dFk0r/n0G0tuqQ2LG901ggSRmgiWI+rWPQFKZYKAZdB2wx1Jr3ndOsOp0Z3rJ0kGSKxWkiVkVSqmhQ2NUoYjg7UPdeVBo8X3pZ4p4g+3qFBVivTl4H6+gksVzUlOvF8jkNcRfpEnGmxkWMrYInfhJCb+CkWtH5k0ITpRDAIW5RUa8kSKzpuLlWzvSPfzm/HHY0xoOtryvvXDWWa/nRAiCPZhs9qE3muvzMA8wsfJ5YuvinGImk4FWCkZxj53LF4x8zYa63ExrluTMNEY9invJDi33raKv+d6gW6aKScZLXqYLOTZnjc889uW6zCcFEPePHdKW4+W74AqvnYpj5HIBBWGexgPzYJqB9kklmZQBznK8JXuNRjfz6T3UqcmND++eUE7OslBWM6bDlHPL05oRo/0rzEDx8NcokIZ2dQ1jcOIU1EB7ZLgq3s1le8V4fo+a9fmQ+2V7xLJuUOlZ8I16m1evV4MsHkVZQAD/JKamcOYF0CknugjIgjdFiaFCztiLp5o/UC5SOOwx/2GuWvI7v3RcyIDbg==
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|24071999003|39105399006|8060799015|19110799012|8062599012|22081999006|8040799003|20031999006|38102599003|31061999003|2604031081799003|6050399003|4140399003|102099032|3420499032|16045399007|3412199025|440099028|14065499006|261005200801699003|3430499035|11120399003|40105399003|10035399007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wEznAtTrKM5xzNlvj4PhyrzoFN4mTSiWh9ZF70Bp9t7amC9jt3FQ1n6HtRMP?=
 =?us-ascii?Q?+Ejw5OSx8MKdt0LbD0btZ6+hMnsM5VflquYa1fQgJl62NG5AlYITXKquTSB5?=
 =?us-ascii?Q?5H5Z+cpGDaNe8Z7KLkDLMTqribp1WnbdLDg13G2BQ3WL75q/BposI2qc4dnc?=
 =?us-ascii?Q?xNnaQE5G2AIBrM/YgT/v3OwVQvnWn4TAyfbyvY/7ORPrcrqKTAcxcRXH4sU3?=
 =?us-ascii?Q?HGQeTav09bYDnPEdddZ8CsxIiAiekz6oR5jMGCOR/cFkFP0krYv22jKNdWsQ?=
 =?us-ascii?Q?rmz6lC8YSi0hBTWs6FBVn5QG6UKRvKS/49u5S38CmKG6lLL9y9I3IyB/YC+e?=
 =?us-ascii?Q?vOIUnnDIX2nJuL8SoBFa39sFi7S3MvQa4Jb0+5JqRbzkHYlX7uiWBOuv3mtD?=
 =?us-ascii?Q?kerQ7zL1iwHmCZXgmwAQ+Th+y2J70lKQxqm59LnscwEKAQwI3rpyiRJ6M2BJ?=
 =?us-ascii?Q?ek2OgQgOnqeS16tKCPDK/1uw2iX7no0Qbkzqch5Il9Ei3jAXBl73ez8jCBNY?=
 =?us-ascii?Q?GzfZ1djEqT6T17xfJqRMJJANn1h/t/4ooC/g9WPELEIpqzgg29TkvyPSsXKo?=
 =?us-ascii?Q?T8a65+M95x5mYqM72yPPAuJMxGO+zAYKhG6GLkfVUAR5jSH2XL3azXiG5sal?=
 =?us-ascii?Q?9H+soWtQ64Kz8YKCbEdjLQfa3DjsRwpo1RiqTNtmbrIDMUYdcmbrK/BFAjj5?=
 =?us-ascii?Q?ftja7t70xtzmoQioe7UQpa7Of8jtawgLUYnL7yDz8IiimYxPbZElAcMNxgWb?=
 =?us-ascii?Q?iaQ3X+DbVGEv6Bp3pXLdnlVKvCF9H6CrMk82ZJxnGbFs09FgwLB5V5nxkG3K?=
 =?us-ascii?Q?gsa5tpUMnFgHzQFHtxZ9swhmvKgSqOGDZbmSnvvSl2ATpb5VRyPRu6GisP9i?=
 =?us-ascii?Q?Fbd4KW51cOR4nbeT4EEgePiriRZjCIiq5XrOWAxq14zR2NbdwVQkUy+Aom38?=
 =?us-ascii?Q?S3hDiadW1PZwpYB8if4zRRbky9LBm37H6FW2TwZUo6uwL7MMYN7QiLHQLb4E?=
 =?us-ascii?Q?3jICvUmvWkTlP4a+fTe4rtlmWhwchDOFoodW+xSPBjBqBJdGqmlCx9Nkezkc?=
 =?us-ascii?Q?Ei6qzFG2LJpEnGBFVg3GFSzlbTT1eqqczWJ++GmgphKnyRZZFBrXzDHPQRVb?=
 =?us-ascii?Q?oqqcmZZPFbKiDFB75ZlnknPHXcDCzjdCILnjBWwYNUjgFY0O99JHayOBZ2TL?=
 =?us-ascii?Q?CsmkX0Gyfezt1SYW?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TBB1vNkaDYnFA5G30pZN7OK0Nuozy39HrORSpdKYjDwkvOMEU6pfPFC9f4wt?=
 =?us-ascii?Q?I12R9VMXVjBoQ5GhysFpJ2mjjLZ0FEg6oe746lcNzNZ+QxQFI0Cm1KpiLqMv?=
 =?us-ascii?Q?HNqnQdRbGzAv5KStFnq7z7oQ22/Ggzscgv2H/WXGNNHBkxfFRVMVJFOWNhBM?=
 =?us-ascii?Q?pxPSCZ9KThg9GvAvPhfWMKInke3Y5LQKSCgZbV/YrAclB6+5J98sB78SIMNz?=
 =?us-ascii?Q?pkD+akmfJTZjmZR1bCmiIvk5Hda5a6Q3BfRtnp26xDUKPjIBvOgexs1FtqIJ?=
 =?us-ascii?Q?nQTVSV6SjKH13z1MQ90Z80f5mb5ZNPG+MWPEwnbTOh48hocRJJtG705mhCbG?=
 =?us-ascii?Q?V5qFH3ajtGY5yiu334bAHsLdeQ4Oa5JZObhDteAVTvz/PLfipEpvd0O3pgnO?=
 =?us-ascii?Q?rKA2bQ9Efje3nXVovoIgRdgAtQvC8QcsHppuQKeunKD2qLoAdRz30MSx4fpH?=
 =?us-ascii?Q?qf5JeRGlblfpWwLDcbVuTGb8E6ve4EZqt2/3TYX6dmPI9ZZNjmtCX/FEcw56?=
 =?us-ascii?Q?Wnnpd2QCoYs55m86RS1GMmKnWrEwIRYFP9PfPLzGqjJ3yxYrZpVPSoQWu399?=
 =?us-ascii?Q?/aklAbyS1Zj3ExZoZQ3ABy89sfE8lYU0TbBLfMMfZzGwFed5yNqtWPttq/8i?=
 =?us-ascii?Q?7ct9WWGPRbyjkzalq3/O+M7i1Pa2UCXRslbKtHGfRseANOTfopWWxSEepJlK?=
 =?us-ascii?Q?2V54uj9uld893Ki2mQMvTttotmW4l8bf7MIUh2n6MoDHxz8mjLHjYMxtz+mW?=
 =?us-ascii?Q?uEfKTR1s2z3jEgsxXYGknOlVy7o4o0aJ9Ebqa+/DPfOAx7T89Kt9Z9XYbcRv?=
 =?us-ascii?Q?zwsT+PXoA45SooZkCYnALxGhj1fO2tflGw/5iIm9Nomn4AWc776wUjI2fU3k?=
 =?us-ascii?Q?5KBrA/QRtDXeWVS8KPPtSN2VK41cs4c24KsRt7+im8ZzBWrNzOFjb3PApdgZ?=
 =?us-ascii?Q?svfqnQePmr2LJTjBoEPV2JYDiaUBe9ZdE5kt2MRQ/cfpHFtFi6uNkBLrz+HI?=
 =?us-ascii?Q?ugEb0cU12YiF2trixe9H4sD2L0BRzpZBAR8N604VdkxGQBtDHbHxa/+hlD1b?=
 =?us-ascii?Q?lxxEvhL4GCq+Kw2Ssc4hrbc5q1/apAyNuyhIMD5FkfnwZAzYNvKYZEVTiaMQ?=
 =?us-ascii?Q?XP+o09/0/5NV46qDG0WOL8HIo1Zj8uTO1T574TuApmOB3jAEU8FQwqjG3a2A?=
 =?us-ascii?Q?Vu8wzvnTjpg2y/eBB0LIc2taPIJiwYSyHDao4Y34m6IvvCSSrkPplBwpDqU7?=
 =?us-ascii?Q?0kXY0XgCnkdoudmwNU3xpwCm3tGQRs84stK1yLin/aHLmiFqMNsT2KiBMz5X?=
 =?us-ascii?Q?pIUkFZtho39AsOzRwoWttD0Xy0uVgfTJzYdVAqQ00OT2F4/bYgVlEsSWmI+M?=
 =?us-ascii?Q?mE4exuBp8ZZkOsC/n/Z7jDuusdB0?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7227.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb65bf0-e7c8-4e7a-1264-08df333f225c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 08:57:16.1833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5947

cdfmjfgcrsu---real^^^news=0A=
rlxaefmotujyubcwyshttp://45.32.19.190=0A=
onudjxfgksjx=0A=
2026/10/26~11/2=0A=
----faxydoxpaxkqgop=0A=
45.---nfcvtiewdlfbm=0A=
77.---slxfdmz=0A=
40.---uobbiti=0A=
60---ybjduup=0A=
qbvxucv=0A=
