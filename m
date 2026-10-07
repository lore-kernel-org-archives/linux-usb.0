Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013077.outbound.protection.outlook.com [52.103.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BBF3F7AAB
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354435; cv=fail; b=OwznPzN4bq5PAER1lcDtQ8CnRNxG+EehoUQAypwPnjvC1vT5gB11TJXUKPR/ZKUGn1WusBY8j7ngttgMxKt8LPNqjBqYF9pJZhEsWAGJbguEdZZ4dOlw+SnOa7ISP1BupbhKXPr+49qaKyh9G4aT88OE3W4KtHbMooD3Xyed61U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354435; c=relaxed/simple;
	bh=lgXMvjCdKa8W7PYOGoOMuPNe1b7Qqy5Dn3gibOyuM3s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N0OI3g8Ld4u26zOzERlJdlGqAgB9hKAs8uhI8W5SUmPg4oZWGZFFO9kfewbcBEAdrOcrFURUoMvQ26jsE0WumdTDv0vCK8eIvPNL7f+NaXFSOG9Kp2ElNxyi3ZJYxkiVwjRaXoT/jL2w8MwbYTxZX3OiHugPnOdPIo/+yoy7Av0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=U1xctDSG; arc=fail smtp.client-ip=52.103.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="U1xctDSG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkWbMZzZgV079XX4ox1j15y7S841t68IP+0eX+r3kUqVfOTpmxL15n3VucHAMWuoKSBGrNazsy/SztzFKx+1CTnSz/i513ra+dN45SaKYJpNcbIEFa00rcgz3HiN6DXl0avgLq3O17QJNDg3t417vDUOzREINocFXtHiq0I+0M1L5QHqVEf/Kj/SHlmxVmbQ8UGtv76Bvdd2ZmRsmDyncAoc+XCoWc98Hs5+A/F90lFgfYTmqutk/7L9KXfT35v2/Aq9juqttiMsOH4XBOQuD35zssuJ/Lo6v9E/T1PcDrx6GBEyNfWSzQYx5ct7Aw0qVsz+4iG6YRmjVz8XD4lvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgXMvjCdKa8W7PYOGoOMuPNe1b7Qqy5Dn3gibOyuM3s=;
 b=cwaWyIZoDX9/6wOFhYrFzvE9g7zQnkgA6+pS5hDZh8mSZv9HS7irjYfYcEuZvFgQD+WiI8ftcGc4BkR7I+rkYniiSRoOXY8xybo2C1QN0kOTROsDcSpPl76F5qEKnZNNN4z6XeTvoOjp8RGroaQ+byVUzgOFO/RSYI5Cckt53IJiHqZtmLiS4B/3Vadlxd5bIQypgQ0OCye9MAJvA0hmdu+vaFfIGmSgunh45NvnodCOcDvff/eGK2A+LmCRgiBuV5oUMA70VvvMLxArOXxOlOd2S0t7XtNGWcAh3MN5s+YSlF1FGccobDQHJATOS4Ic+gqCsLXGf3u+R5PWFaTn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgXMvjCdKa8W7PYOGoOMuPNe1b7Qqy5Dn3gibOyuM3s=;
 b=U1xctDSGkKE4asD8ai8jb+DHHjmCzkiKOT8TJxgC5ClgcIsefPZiAkv7/Uw9KXdVdJhSVZcyjm8G3fowF2U5PVlwS7t0szdEJnqzNT3HeVL3JOzO+814uDNrYrlCtuTZVL720uofiIf7oRiL8or9GX75Z7n+AA4XGyXInwFUcj/XZczXNHIXyIrID2feci1fCGjckhWqe9x9m1yZ8TwbV4cEk/mYAkES7lor/r5vLl5MCDSgInhBzvQJlElURLN+VT17gWn7Vm4oiY6LtVhRq9kZAyoa9Y0C+bV/DEbSOa2FmqAzLobm5/5B39vKbMv89COQDx4bWLRpK+uhAdzUIg==
Received: from AM9P193MB0807.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1f8::6)
 by PAXP193MB1405.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:13f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 7 Oct
 2026 06:27:09 +0000
Received: from AM9P193MB0807.EURP193.PROD.OUTLOOK.COM
 ([fe80::e50b:c9b3:c155:f22c]) by AM9P193MB0807.EURP193.PROD.OUTLOOK.COM
 ([fe80::e50b:c9b3:c155:f22c%2]) with mapi id 15.21.0451.014; Wed, 7 Oct 2026
 06:27:08 +0000
From: Jaxon Wilkerson <jaxonwilkersontqne@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: 607777759018185138
Thread-Topic: 607777759018185138
Thread-Index: AQHdViThzIcIQs9q4kyq5Sx5g8na3g==
Date: Wed, 7 Oct 2026 06:27:08 +0000
Message-ID:
 <AM9P193MB08077F5D063928D302757614DC942@AM9P193MB0807.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P193MB0807:EE_|PAXP193MB1405:EE_
x-ms-office365-filtering-correlation-id: 3d841ea2-e020-4789-ae43-08df243c039c
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|8040799003|6050399003|9112599006|24071999003|4140399003|20031999006|22081999006|2604031081799003|38102599003|31061999003|8062599012|19110799012|8060799015|2607281247196008|3412199025|440099028|11120399003|3430499035|102099032|3420499032|261005200801699003|16045399007|10035399007|40105399003|14065499006;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TnpRWtSmDDM9ASv0nZfwvESs44S3zm8/1ufwU2+RxZZ6UEuIjcrEfYppXCbV?=
 =?us-ascii?Q?b6SUDlEEdKBlYBbwFrK+hu9kRTOVTnVMmXLotZRYA/SC0uMxu2REc4HeCwYN?=
 =?us-ascii?Q?Sci48HAx5hzCpcp2ZMpQBkklZayKUpvNHRbqE61CxpaLS30aCf+wpP8lKq24?=
 =?us-ascii?Q?SN4BZnjDKetH8qBz+7SoehjNM+G7cvNySCJSqMhm7BRlO4a97q1TJpnxdikK?=
 =?us-ascii?Q?DTHq65GmUu0qnSENVJAU72Bm3K7jRT8fmFJgRYYjbqvoGAK4ovyvkSitRjwM?=
 =?us-ascii?Q?c+UWSpsC6qtJDteMs0PCAGpsWmy3M4hx/isZo+8U5lJzMh/+okyw6OjLjgon?=
 =?us-ascii?Q?a/mAtr09vwChfbxPwnM33ZvWQyjVQRqCYTUCc0Wnua1Si4YSbp4pILMs+ZeI?=
 =?us-ascii?Q?Hl0OfZo6LE538aOIwFZAYCH3Qj7/PQab6yCIbFY6gKv5I+c3Vh7k2qaXNgdz?=
 =?us-ascii?Q?27Mv7LvDTCzGfPjwSuGy+U/b7ZAaJEcm1C5aOOt+KKhH4Viiwdm2WM1/Bv0l?=
 =?us-ascii?Q?818wptfcavu7A+Oe/2hiQqd3Wi/xt5IX6MOCmsJ1dMXJffWKjEp6xW4gsNu0?=
 =?us-ascii?Q?eYMrFqfMi/2PFMXEfCWhKmLpcIw893Jmk5jKLptikLiDXEoQ9v08QshL0cNm?=
 =?us-ascii?Q?/ojziWsVp9igr8nRpmVLOqpVxyH3h7DeoHRUA+7bV6ip/8Z96Y3xtVp8IOPh?=
 =?us-ascii?Q?tyVVaPZ1jZ+MpWbcZ93Bj0onhEXniKofRIQmULbCHEvjdJh2BMa83+DHPH8f?=
 =?us-ascii?Q?mklUOseoJOyb6gb5LuYojigaf/FoCTJ1TMm9A+kyuHc1t0N22o+lpLmf85vo?=
 =?us-ascii?Q?lC7iUxuFFfSqQ9bkxuuBC1khGpoeN9jLCEVd4nK0BPBmpy+XWhcs/CSYlR5g?=
 =?us-ascii?Q?K59cvYXi2Zz29WI9kd/7I143wi8dCv4Vkqe1P9L6GQvUol1JoTuxHIfg1R6X?=
 =?us-ascii?Q?bJMtLoD/tSvRxeLYWIaC2FZWhCj+c1GHUaN+tF85SJcaiKPZHT8wgqT5mqq6?=
 =?us-ascii?Q?HEDMTg9BieAAZRyhHrmi8D49sxinGZNu0FtsG/yIYblzqFci06pEX2CwxrV6?=
 =?us-ascii?Q?u3hOpWQAX/8Qka53O30+4ogtbScnRHKlhasRqH2Q1h0UIB+WXHWeTrXc1N1l?=
 =?us-ascii?Q?gUUKb/NwkcQIWT89gFPIRrmM4vdzP3qsaQ2FFr7R/oLmtu+roN40tYfytz5w?=
 =?us-ascii?Q?7HfSERIQqu0xAtam?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jTNT3w8nyZFd+znBXq9KxqR6e8OKdAkluNCAfP+XmX9OrrUEd13+lK6R1Tzw?=
 =?us-ascii?Q?y6s5gY+9lFUGvtTe3ud7uaalO8EvZTi09re1TME3bxHF3huWVA+d8RxRkuqu?=
 =?us-ascii?Q?DfesJaQlpcQygHFRlCJ1ou8Qv1vm1nLrJQnAamtlm3gLNg5FizP8kBD2DCQ8?=
 =?us-ascii?Q?TS62Pfe3TUrcu9LFIxhMLaPCakTNkZyFxEOQ/Kk56zEKn2ngNCs7O7GF+RBC?=
 =?us-ascii?Q?O4oWsDGCYlonubvWiM6/fKJUJ4g8IugCuI20tiftaI+fHYtCfd9CA7ENS+d3?=
 =?us-ascii?Q?K2ycS5ucBgz8fJNEe2XO4kmnnzjHNTsQjZBh631U0SJy2G1BEtb4KWOIFGHL?=
 =?us-ascii?Q?KFDut6YPE80pbbAO7HtvW0cul4vo/DqshAaSnGpomfylFGck1DrEjoTrajwL?=
 =?us-ascii?Q?iGi2JXwcFceo2vEKuv/QTUofWuXW6jlw6cX3yCTFrPS4wYof6BVrrBlA2UDm?=
 =?us-ascii?Q?5MS0Hbj1bZWkJvsrgXCpxCQASmRWC7fgJIF9z6pau0rFjLK53pjc21lS87Dx?=
 =?us-ascii?Q?n15MLy7BfB2AJGF777l+ycb3lTpYhZ49jXYaDaB6HWamgZ3Ca+QZVnmMbUcD?=
 =?us-ascii?Q?zt3HeaCFhIOtFbIe1gblf1UW11OgCCLVhLf0z6IZd8nHnf8HxOXt9gn26Jlt?=
 =?us-ascii?Q?136XejDHqH73MRgp7XCe6ttPZEi14NxqTO7LhE9Dpd3GWyUM0B7RPznDr8xE?=
 =?us-ascii?Q?WEiyuCsSt+M00KaRoh2KbErzvn0hiI4ZLLLs8vsptvThMepNAUlGKNum9lLE?=
 =?us-ascii?Q?/l4Ue9rneN/8ucnE15NX5+Fry3ahr9d+aO+Nb1uCLoO2gnU4RXGD/u3CiFp9?=
 =?us-ascii?Q?KQasE7RPUbTvXOeWGoK8wkR1wy4gqjKyqbNRJMx8sDBQNL7RfKlYcJdSqYnJ?=
 =?us-ascii?Q?ftcWZJEmCfMGdFlmrwyqPbrHbVj2WU4WT71Erd9siQsa2mZjquFc5tY3V7d8?=
 =?us-ascii?Q?L5yn7rp4Deu48SY/IdOVUEwr+sIENNJ2tfZIGVcqkapmyQy89/lmiCmbCvZN?=
 =?us-ascii?Q?9EtFRKONuX8MSXZPgtt58IZdYMHpdRSLbejFs9e49nx3GG/R7X+3D1FVqvHj?=
 =?us-ascii?Q?BuOZ1xyEj5GcTlXWqRXB7FKySoluksbpXtZAV8UOcFH/5UVltRnklsLSXN0b?=
 =?us-ascii?Q?SuZgRCZZiaQ4aA47anR3svqUo+x3xu7VO6kkUTSCYLemcHF1kuWLZO946Tox?=
 =?us-ascii?Q?Gb0ozwqLT3XvlMBlg4BUdMqb0wEXBizhGWcDatSMejAtXMc/Q98b1KZS6y49?=
 =?us-ascii?Q?ffjmC9N2ad3bP+db1RZ2yfDbFs8vuEmaj5Bgb/hrumSlGtbLhRpwdtNYXWh5?=
 =?us-ascii?Q?P9iE6QXxZ5RZuBQQcan3IbT5bSoTJAcmGi7LphJSoG5lE9swQ3VNWuNnwt75?=
 =?us-ascii?Q?ahZoiB2v/4aXkTvPNG+v1+sM9KWLR63W4WmNTR+sgvNrOCIu7w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0807.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d841ea2-e020-4789-ae43-08df243c039c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 06:27:08.6246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1405

957877733804356598----real=3Dnews=0A=
http://45.76.221.93=0A=
124165097927056=0A=
2026/10/6~2026/10/13=0A=
----ohrskmp=0A=
45.---xalyvxlzmbuu=0A=
77.---yrxksesiwephcdn=0A=
40.---gpyhttscesrhrosgd=0A=
60---ojqcmwvbibbogwh=0A=
formvuo=0A=
