Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013085.outbound.protection.outlook.com [52.103.14.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E6365A19
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 05:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967428; cv=fail; b=AaPlxirMafjAqBa6i3VstvlCtCQjyYA9tp0BYu1ID5tTgHzFfUNydv87BIFbIi9Bi4kD0j8hvZ/4tXQJURq0q3VL+qspsp09ne+AfSRnt6NGkxPx7ewISW4FpqbpSEyvgkgYBSgTGkf9zuPT7+3s8JorryfUpM/7IKVLKIOjd2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967428; c=relaxed/simple;
	bh=dVgeNfVxd5p3CsqEjQZSgvpSYVPmxnPLtc6V4uj0WeE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SXXXgejYuTdtbYksKyJG1PsLM6K6sXxVPgqFTRosWOJ+ejqxZ3edDoLS8KaVkWs+9AMc62ZS1rM9NXH1Y+WdCeck05DxEo3emMnvFh3HAJDbjsfpzjeWow40LBaZKOBJ7KqAWkIbwAhziYnptx1jr1p2GF635rpJDjBIuk2V0GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Gf9GauOW; arc=fail smtp.client-ip=52.103.14.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Gf9GauOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUEAACd8nCPzHw9wIld7DKW2zMFAiNCYMEqfGL9LWsDCc5HdWxd7JkeUTNhpoFn9QDSxcxgxyFFKPwQxSTRq4OgWpezmBlOGNy/4edMAM1q3pdSpdbiSGygifE+Fvr6tiuLAYQJDeczWoD/j3j1VxtbNbAPN3EcM4aIsAsTk4pvLUTZUSqC8mn5hvsNerD3cgj40ot227vkOsWm8QDYjSNyPYQW1ry+UzvEofNLYy3t4j3VBhMz+SwMqyY0voEWmgeydMeNGTVybnR7GEIlwqFej8rqm9aj7RI2cxSiLQ9GEGPhfi6Y6zY2qYBo/OM0MIbVE2zyy8pwI/Ws6qzjwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVgeNfVxd5p3CsqEjQZSgvpSYVPmxnPLtc6V4uj0WeE=;
 b=FGYhu1MbFr9y8xd4uwDyz2JB1DIST1rAS4c6u2Efk2wQy3QsqXw6ndnEw8M60d+DSoke9Gez8M8iVr7DHS1oMKJ9L2pTFL6oYFhMBXZ3NNVVh83/HHHTvKo6dSNgwQFD4w4M8snxIrx2kudxQmWqcz+zwT2ClpykvZmN1hmD8UNtQ5dwpy+LOMexhCvhtwZMXIEPl0LIZp3KGdOuwVvb6XCgo6YAk++FMwCDc3QY/DHPXCK0Vcym2cBsEyR7Hq90Gc+bT2bWvLWFilskuRMX4M08KRHnNe8ZpYeN8jO7JPwxz7Hi6pzgQzOjL9mbAj9oxrL+JTo64soSQA5shmdUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVgeNfVxd5p3CsqEjQZSgvpSYVPmxnPLtc6V4uj0WeE=;
 b=Gf9GauOWZ0fPj3OwpfWbplwwySpt+J3QUZ8oY05ChKIYqyF1K0TvFgsppGDu43F/bpRIHc2yxiE71fqTvKfDKLjvQMaKOufXcEUAl0poox+IoQ0rF0MhrkG4qEzD+zuklQurich/SrSdxzMuhE9TAT8CeCMKFuBynEBsZxl5gr69Y1V00A+Ny9xU+vwHak3L08ME5aMVKdIAwpMqRQ6/77cJmPegLMPLU5hcsfkbr8LFtZuMPajRbpKYn7j4xGsRps/Y3rpJc17J6P66PGr4XJGlngsUnOpZEw3qFzAWw+PaNphH05Bdz2KDz4FfPnYvdOS0SAc/7ziFgoMJYGkE1g==
Received: from CH4PR13MB188464.namprd13.prod.outlook.com
 (2603:10b6:610:50a::6) by MWHPR13MB7008.namprd13.prod.outlook.com
 (2603:10b6:303:288::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:10:24 +0000
Received: from CH4PR13MB188464.namprd13.prod.outlook.com
 ([fe80::2377:eb0e:5ee5:ab8c]) by CH4PR13MB188464.namprd13.prod.outlook.com
 ([fe80::2377:eb0e:5ee5:ab8c%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:10:24 +0000
From: Avi Wiley <aviwileylhpg@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: vfcxtjhnjktfdtkd
Thread-Topic: vfcxtjhnjktfdtkd
Thread-Index: AQHdSYeCyTkjEm9vT0+Xwu2x5+bu4g==
Date: Mon, 21 Sep 2026 05:10:24 +0000
Message-ID:
 <CH4PR13MB1884642548DD666CAF574DC8B7DF842@CH4PR13MB188464.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH4PR13MB188464:EE_|MWHPR13MB7008:EE_
x-ms-office365-filtering-correlation-id: ec7139ee-f6f7-42a8-bb1b-08df179ea4d0
x-microsoft-antispam:
 BCL:0;ARA:14566002|4140399003|38102599003|6050399003|9112599006|20031999006|39105399006|22081999006|2604031081799003|8040799003|8062599012|19110799012|8060799015|31061999003|24071999003|14065499006|40105399003|10035399007|3430499035|11120399003|2607281247196008|16045399007|3420499032|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bzzyggR8/nsKs8fWiAwu/L2K3nFN+oYQeKrQR4aXaLXDKGsoZNf65TrhsnFf?=
 =?us-ascii?Q?9uWA+WbMF29rZeB0lGqXphWzcE7OMvu1NOSlFh/h7HWSTkYdzsovDjFSHaIl?=
 =?us-ascii?Q?zovTcB0X4rUePSpAHyAtoIGhSYL+iJf9iskIWLSk4nKmYCl2HB6Rs9MteE8H?=
 =?us-ascii?Q?OY3LWrXiaEftv/SoXW8zMgb/UIEwPdoNickcz41bnsBXtjWRAa7KXBEBefjF?=
 =?us-ascii?Q?y8ZoM/O7vKp4ufMa/3NCW/YA4nVB11Uj3iN986q6MRbw/oUiJJcoMcD0KngU?=
 =?us-ascii?Q?an7rkvr98IoaOkwK6g//xZSuelKY73YrnNFIhVvCvR94egwfpc9lH/FrqOV5?=
 =?us-ascii?Q?AdWbAYsAwqcdGQrTxwVJKdl5007XdDF2u/z6LT+XWXhPsoL1jX0RlfW6N2b7?=
 =?us-ascii?Q?d5uamFgVuziWiI4vC7BhE5eWfTJ8wQLLbxc+LOpE/OHUnXFvppUb7uPl7s3E?=
 =?us-ascii?Q?NGVccGevJU0kckHoq8xB+SXK6HCFe1fZz5ET/J3I8lUGNc0+21YKyfcnGre3?=
 =?us-ascii?Q?MErS9QILKXOaFV/hhuuBqgThb3C6ozwjHrzHvg29YcaKkH/Sv94fWXU8SeTn?=
 =?us-ascii?Q?c4EYO4PkPyal5PYgDn7mtSZaxlUmU+cCmYD6f1/hEWgy3OmiqNd8CmYuE/Y+?=
 =?us-ascii?Q?VY14Jx9GjirDxDTIhzaamZI/I712/N/iGTpoMBbqDetWX9QH/aIQPbZImisS?=
 =?us-ascii?Q?gup6W8a78xlwpBV0EiTCGigT+wRNidN28kqtIj73z3fYlwyp+x+qhRPCFRee?=
 =?us-ascii?Q?AlSrUwD+7IVpNATeq6oD/3ko7BYrpqbnBl8GkTJoVg50B+3uFK19aHldFVcs?=
 =?us-ascii?Q?/4q9ofv8/0Rpy26sthfA2gXIdYWqBG99QOKUWPArY3T6HxYR2jSkO++YgCFZ?=
 =?us-ascii?Q?LcY2VtHve07cUjsAjcXafRAJNnDsn/hcRPVrM7Chr8BvROsoezKsBUY76int?=
 =?us-ascii?Q?weVdfykH5zR3vThTLD3zR1gqjWmoVM/+aVoADZoGDurJjlD97fOo+UdJlDhn?=
 =?us-ascii?Q?aNLVXXeQ/xP6xZIYCqsqsy1X2JTiCxBQzkFeVc4c9yG9wcpdt/e6bul7Ix0g?=
 =?us-ascii?Q?JTgItdKTre0YgAXy5BQlarm4GCjHH3RBsqXI9DJ6Msq+v5cOjiVG6jQSFydP?=
 =?us-ascii?Q?Gzeq5RU1dDSY4Bt0WOHe7mL7US6kG1RObQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N2kl+OqrfgwcRQopqF/fa9W2SzdG7tvILiCv9N4bXxKKrDMVQ1YmHZWJoaZA?=
 =?us-ascii?Q?rBJQcT1Dx+pl3RDjmBIMEAlQkrILquNiSae4Ctk63Plaoa1ApjPF8dHU4vfU?=
 =?us-ascii?Q?kVsIUvPSCSxljh+Tn7lefww1eJqkcqmWatA+yC2I3Yd7Dtg4FPXlojJe12e2?=
 =?us-ascii?Q?s6fzcZLCT1XVoSuX5LMINtqp8YtfAcVSg/Q0CQtVZA4f1H4AA+FGxNwIIyjH?=
 =?us-ascii?Q?4pyefo/egaBzcOyCnevH8nlZQPgdn7RKBuMacOgzQVxhiWKsAdUttzZDK8LD?=
 =?us-ascii?Q?UYQypAcyC2c9OOZXM2YKG/VkGbP+mZPYbkrt5mnTvCIFhTQras4mID7iRrzj?=
 =?us-ascii?Q?9IdU4/RLM4txoz2iyQeoem2dhhsfKu0dnunEXy2Fu22cLzTKqdzainevz5J2?=
 =?us-ascii?Q?kIGBQiLayUazbWNNclKrkWBiG+uw0BpeFJqE+n0W/krQtyumnTuraCnFl8og?=
 =?us-ascii?Q?1LQCYq+6fRJZiObASjDciISWwEmxK7jTbOpmnHMVM8m3Adhq/kNnYfRUsEvI?=
 =?us-ascii?Q?jneddU8Ne1hgmCJvaKFbfegE5Z9mgodR4+CHm6YI6jXpONwXIrdYgps8Sd8y?=
 =?us-ascii?Q?u+zL7m2QOexxewlPrGGLDhKFUuZ+AqOGAYO86af/94E/t4dSuX+2PcxR6FxC?=
 =?us-ascii?Q?eRzztfLPnsy0Ufo8d7k1crk4l8t249RtGjkYVYhcR4XCmTE4orI/ZBYNzsVq?=
 =?us-ascii?Q?5sF+xPpPPDdNzTd50FsC4Nmk1h7Y1G9nE9794C4a5PbFBFA8ILGw/FAVP6lk?=
 =?us-ascii?Q?p1Wg8BrYCy3lb+F3tdVyFgsq3dcODCitfzxemsB5FSwHUWQoRFaKrcLRJBTU?=
 =?us-ascii?Q?cgPTnLFV5tloIk0lV3q5fkpPQeJJH0VBLPSyx8/EIlwb6BR/HVKWC0tbxXYO?=
 =?us-ascii?Q?mlWgIGRwCTydbUFPJ6Y//GWw7jLuGXtBS5/KmmYL7fUoyqTEKLNKXcMD1Ff+?=
 =?us-ascii?Q?3d19AKE8ExFtfUy0mYAcP+IZLUUCpVsIZFDKoIsNM19IwgdZ5c7pX798dmv5?=
 =?us-ascii?Q?j0UU40OqGSa0RBtK9Edox9FwHFJYjbwSNwSAS1GNbPClCFhPnVAq86kAtnOA?=
 =?us-ascii?Q?PZT4PeP7VqeNN1NZsJ3ZRWOi9+1aR0o0u+ArpiWgCMLr3N6IB8Mfsgst6Mxf?=
 =?us-ascii?Q?jgypg+xI91lGLuAVcj+xlaAtkrQdSh0pF53UCnOplK2PsySh/N1dlhm4Ef1K?=
 =?us-ascii?Q?lcgdWmfJGsLOPL0Hhu2XWoxg/K87sZkJupJjvIuJTe1gwSF+8+GxizDSVStX?=
 =?us-ascii?Q?63nin4pf4bV8rBVLYRS53xXOvc1DfnAfSRIctGswBMMduTj4M6Fk5kEnYfQR?=
 =?us-ascii?Q?ZmtRBKqFu2AVCNs7bI2W0EHHO4Gn7SsTTFrFFSLlQwFLqaO2GSMypr5IK8xW?=
 =?us-ascii?Q?pHrd/xgbY9O0wflJEc7rhsHTQciN?=
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
X-MS-Exchange-CrossTenant-AuthSource: CH4PR13MB188464.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7139ee-f6f7-42a8-bb1b-08df179ea4d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 05:10:24.6886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB7008

8081960738450011-truth^^news=0A=
http://45.32.36.91=0A=
45651749700947490324=0A=
alive time~2026/9/22=0A=
http://----gqkommttaer=0A=
45.---zvkdrec=0A=
77.---crvybsaqi=0A=
40.---iovjpqntglniduhyha=0A=
60---uzhpqzylwysyhlir=0A=
sfeuaukk=0A=
