Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020140.outbound.protection.outlook.com [52.101.61.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B05733E
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406131; cv=fail; b=oT7/8AqqefkQC+rWw6XxqX4hCQ87WgEsLhSQzYQROkT/M01iXLh9UPucGt7mIaTyf+88/XWUV86eZsU9SGYkWFM46p6gkVjUJvoVankl2GOAAbjmWJPfPNtEeG5trLQiZN6YX6cae9kGUkevyNs/RBhpgm6jk/QDiJX5nxQW/bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406131; c=relaxed/simple;
	bh=c3licAXwSnsofFsYe9PiKqSZUiDrRxpM4ccaAVC7sek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QDMCJ0B9HfU9s2mA6Zou7hLXHsZ3saxFhwGGbzYomdQVsH+B9GLIZv9WRA9JF/N21D2a7LU+ay7qmATGmhnR9qIXPsqjhW9qzxi1czwTOeZqh2yA/NYPCHT1zfNVJyBB4yDTpC7GxDJtgwLnHVcpm8T9fZDQeCWOHie1Fwc3yFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=d1IyHFQS; arc=fail smtp.client-ip=52.101.61.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="d1IyHFQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr0GP/3hcGIYVYnnm9Z9JmihmGem4BKUUZlG7FdklImX/zDBnLAycMK19+7Ir6QHUX+vRw3+/bPsNpslZtBYrbHK28ocKRIojqeLpU2nv1znkPHooo5SRSt+06VkoY7G/0j2Nir7S3VIY2Yh0uv4xeyF5OsC5Yln83eTEp/O4VRvqVxnwlzQHTvfHHIvqEfFfDHwUbLGqQVyniWf0Dab8SVWEoQPBc09mB0+W9tEIYXiioxZGgqWXWf5Flt3vo6rPeKH/EgrmIAGqaw3RYbUGO6OWaT5h/jMe9S/RgFRYlqDHSCq2UVoiETWe6H2sWIFYlFdt1aKuGEEOU4NiHWmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3licAXwSnsofFsYe9PiKqSZUiDrRxpM4ccaAVC7sek=;
 b=ZOqgx6ZVR3U3SWMd1bVkmUcug5XOFpq8Q8uDC+Budw/hGCKem6xHGRIsOVaQJPAkIRIsFqlsFTC6EUOO+g1hwiLud+GRNral5BODYuyaUowzWo3qeDBLyyQT1kJxMg5lml7EhabEJN1umRDOvXwwrju7B4Z143s7qmjDaWcI5E2NvP4q0M8IHOZGsZ9oFrkR2HNU/hzeiea1/MWGVATgYl2ksry5Yo2HmVNNqRSMMywUxfzTxEc8Gk/abWHrR8uoHlqJKcHvZhuc3393vMzltXdMQ4x49uSBYBKJv3/uSdE6O5rvOfMdOu6xof239aZRl+RAk/25+WWAWxLUaviKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3licAXwSnsofFsYe9PiKqSZUiDrRxpM4ccaAVC7sek=;
 b=d1IyHFQSu6JrzNQBudz6GqspAJD0zmu5BXES9JlKBVm4ilntXGzJ/ivU4PvLQ0z52XtbrD5Uo9iphG0ogUGjyVYtrdqY0dcQ5QLTHuyHPNiyndcY/mw5IBmBm0zuXaCQL2hclHLbuY5POguVdB7OgHS7bKr7OWAAT3NOY1tO8tu4xZ5w8qFEya7JQjn1gt8oTAH1scCGaWhfu4thvgg4K3L7tFg4tU1MZIZOvgTCFiLdz8oz+LBUf1ajU2RT+Wy5ltrzWVTzAPaK8hfCHI5x6ehO4v1I3jLvvwnDzbpkVvD2phS5WVhItlXAcpqKyxyiop2Zupa4TdFOAURKHliRaA==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by SJ4PPF2C859ACED.namprd15.prod.outlook.com (2603:10b6:a0f:fc02::890) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 07:02:01 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 07:02:01 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Topic: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Index:
 AQHdTB/xumZMHV37HU+Dgj/1DHc0GbbdsEKAgAAJSrWAABd8gIAAmJVSgABT9gCAAbNXBw==
Date: Sat, 26 Sep 2026 07:02:01 +0000
Message-ID:
 <SJ0PR15MB46968FAE6C8D0A6A250C5ACBA38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
References:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260925050124.GT106095@black.igk.intel.com>
In-Reply-To: <20260925050124.GT106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|SJ4PPF2C859ACED:EE_
x-ms-office365-filtering-correlation-id: d5f4ce3e-8beb-402d-219a-08df1b9c103e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|23010399003|376014|366016|38070700021|6133799003|10067099003|3023799007|7055299009|4143699003|56012099006|22082099003|55112099003|18002099003;
x-microsoft-antispam-message-info:
 /e3eWoPBvkdS/Ph6WNeVufh1eK+Qsoqg+jw/StlH5vcFUZihtQaHNPrK53T6ASHfH7u44vIB8M4rAE6NQ8VhUOXtNjoI+6HBjCj36rxccH00SMr0T9WtK8pZyWz8CH8kxxZzZmgIADPJ5Dgzv4soBwhItvfADrX13jzz85e8G0Bylpx1RaVPtKScke+OsCmHcbmhEk+8pFIe7l4MfNlJyJPxkae2xSuhigCxHYA8Xz8Qyt4kAtzKniQkNZFr0KS1JUlSmwipK7TsxDQ8+ayuTdWv8UugPSW1dP7Ln1IHUl64HHUknUpRsdE8t5BbTMj1QKROnVbdxepiV5yo0lFVW6Ul4jYmxDBy1jMKB7CTZI9S33ztuBEIh/F1veCzU8oK3p4/i/wBSwz8Ii45SWS8g9QmPNSHZe4I1LYsVyvADSUHtrRwCT58rfmwjqseIqDwlvvsCAo00ji2rIaE7USA91QvMmnHJ0XZLYs3kgxLzaphPDPEIzSmC6KOIyyuQzQmrOTmFLsO/U6mRiDmoCUpL+f9peyRR19KCHw7077t1AEKOLh5a5fM7IHyre3lWISz1TRX2JfpZXptprOsMsCfWzbd6A3NUYBNrxQxsFSlWCEgqmg3ZJw0Vzf/ZtMtwziUJPhTAtZ2emp6n3cX1b4Q43IS6PKNYnJTZSVjaDOFfGjSa3xiHdxU9wbqGXDiCQvLX5D84Lik6jZngZsRJdh5a1DnXPEqLyCSO5e8N4fW4Qtra5BOrdps0Ab2uMDlWpAv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(376014)(366016)(38070700021)(6133799003)(10067099003)(3023799007)(7055299009)(4143699003)(56012099006)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tBYvdTi4hI9INqOSe/XLANWsHWTmQ2mm5A5+qkPpWSJptFowGR7AwsOY90?=
 =?iso-8859-1?Q?JJc6iUjAu+6kMLsxqsuunW8jErn0GG+d8AIiAPC1Q5yhbgLBb/q5+foZhO?=
 =?iso-8859-1?Q?5PSzsbsLz4GWhiCEzsozghHZ0OLbcZxZznxWrawwUiLURyvrrWVezqYJJW?=
 =?iso-8859-1?Q?D5O1r0tzFt0rWK6YkYT6Iw1AMK37pv/HHDG8w98ltIiDe1Z5Qol2gT43ov?=
 =?iso-8859-1?Q?dqgGHbTy7MNTO+e+smNEX7W6f/wu18SHRzJN4ZuqxatMfsDDskq3BF1a4E?=
 =?iso-8859-1?Q?brvigQCeE8YZJaP7Tlpkt470mgwXyB0S8dMQ9pDnYC0w9reLtyFfaE4afG?=
 =?iso-8859-1?Q?gTYWEZiwZ5IJ/1kck3EG1G1PLC2sO9+LxsyoEs2xnm4eigeWl+G+jmUrkM?=
 =?iso-8859-1?Q?nkTtcZz9zn34fjs2gB+KTs6X9GOUOZq/cBpxqzfmXKHputh6aZI0P1G6Kq?=
 =?iso-8859-1?Q?RxOiaZ1x2uvmhElLwORLbgK9nWlwvDv7h+nuGlOVZQFe8QJqgnT6h7mx2f?=
 =?iso-8859-1?Q?r7opAbXpk3iVRr+yiyQDLmJ4ZXUJcIj0RHxoxow97PO3VUs9gD0p1+gsuf?=
 =?iso-8859-1?Q?Xf1Zk6/LVt9dWISLCmaJF/NFqTI2rWHq7ku9yPTVQX8xsKEMxFfrgQcdrc?=
 =?iso-8859-1?Q?6FrWhr3tp1vkOvncKuVvsH8hU2BicDUNuxNO7asbWZBSvR+b3WAAVwcMNo?=
 =?iso-8859-1?Q?fXOt0CrPBVpnP7yBg/L/QxCxS/6BEcY7DsdaUJedaM3hnmd7cdfPVs+k3w?=
 =?iso-8859-1?Q?lVajppRB6foeOP5kTSXGzOXv4Er06idDewiGchhAO2YM4OWZXstGvxxJeB?=
 =?iso-8859-1?Q?+yOjSWKXHF6fsOnpT+BCdGf5u+t803si3ucqMe3PBJ4NoyKfjjMQsTG4fB?=
 =?iso-8859-1?Q?XjelYOUsHJVRrw0fiyb8c9Z9VXisrVkcPwS6puAqU5TTYKfiuBh9Teb5ja?=
 =?iso-8859-1?Q?rV7qWJa7I6vKrv7i7xNmeXrCa3/0PSzVqE9WXrWIzI/T/AdFyR67W29VvH?=
 =?iso-8859-1?Q?bgE0YWmwBMWIMkfkYuhfD0wrckGZLZECippbVua3N6UkJds1QaBD+NrLb1?=
 =?iso-8859-1?Q?AX/GlV1O02UPuFymW6cQd27XzMjCn/IWc7S9jZMAOX6/NcratOnmYB5Kkb?=
 =?iso-8859-1?Q?NPvjXrxFYgbvj1BBKczjnBAGs7CJd6dftnRxFUAA15SsM1j1W9QmmvLDYH?=
 =?iso-8859-1?Q?zRQkmeEFr5BR5fHlqZzEZKynadJWz36rNP3Nqq6B14/qE58d8oLOpazdr2?=
 =?iso-8859-1?Q?8NZGBrnPW5A7A6zZ3pcZYWwCiaE/4pPzVpnTIjsj98Cdvo5PgFVLojzZa7?=
 =?iso-8859-1?Q?tPfeL93xDKw71g47EUzkgDN8KCRYQTmnzMuo/doIBXOOcdl8JoAQqFAGDU?=
 =?iso-8859-1?Q?CNEbcE2qXvkplMB+Y+BIFMQnNuwTnp9xJZ+y68kxNc4Ws16HhhY+160umx?=
 =?iso-8859-1?Q?xE6c/sah4/uBvDsJpBBHhnIbg2oycP/0f/j8KKLkQuL4crr7fDgol6YjUc?=
 =?iso-8859-1?Q?4e8rhFLrDkh9bUOgsPqESFl9SYYliFjuqKkjK9Lh0DkeCZT/YRt73+WKck?=
 =?iso-8859-1?Q?NjeujK/Qq3qQBrCGuRE2Sk8+BBN5ohXT0IeBmco14i7lgP2ucCXXzp+/ap?=
 =?iso-8859-1?Q?UkWX9kporvm9A45ABdceryCdNvs0xnSpBhLjTRDRbpTggLmua1ExJcKJDN?=
 =?iso-8859-1?Q?mbZAKEkbO3JdGKFM+3kvkcdCyTXxTpqtsBEvPG6U7jqJ9O0X2Oow3BYa9T?=
 =?iso-8859-1?Q?IYcwZc65boJCbadJCrCUPUDO9ljI0oiXC/pLlDLn+oIa8nDa4iVpR8HDHP?=
 =?iso-8859-1?Q?zZBZgi7Hu+6aR2SNuhkzdVybkate7HisBc1aGlt0SvdeHw0fRM30?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lieber.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4696.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f4ce3e-8beb-402d-219a-08df1b9c103e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2026 07:02:01.0887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0A5OoI0s11gODY9hODHN2raOPqpFDWC1NzL135OdDHmxLhgnUwYcCWy/Jy4QbQ2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF2C859ACED

Hello, =0A=
=0A=
On Fri, Sep 25, 2026 at 05:01:36AM +0000, Mika Westerberg wrote:=0A=
> I just tried on my side MTL/PTL + BR Hub and works fine with CL0s/CL1=0A=
> enabled. Also checked release notes of the NVM and there are no mention=
=0A=
> about issues with CLx with the one you are running.=0A=
>=0A=
> There is one more thing that we can check though, can you run:=0A=
>=0A=
> =A0 # tbdump -r 1 -a 1 -vv -N 1 PORT_CS_18=0A=
>=0A=
> and provide the output?=0A=
=0A=
Route 1 is not present on this boot. The dock enumerated behind host=0A=
port 3, so it is route 3. The upstream adapter is still 1. Read with=0A=
the dock authorized and thunderbolt.clx=3D0 (tbtools aa0b1be):=0A=
=0A=
=A0 # tbdump -r 3 -a 1 -vv -N 1 PORT_CS_18=0A=
=A0 0x00d2 0x00f03510 0b00000000 11110000 00110101 00010000 PORT_CS_18=0A=
=A0 =A0 [00:07] =A0 =A0 =A0 0x10 Cable USB4 Version=0A=
=A0 =A0 [08:08] =A0 =A0 =A0 =A00x1 Bonding Enabled (BE)=0A=
=A0 =A0 [09:09] =A0 =A0 =A0 =A00x0 TBT3-Compatible Mode (TCM)=0A=
=A0 =A0 [10:10] =A0 =A0 =A0 =A00x1 CLx Protocol Support (CPS)=0A=
=A0 =A0 [11:11] =A0 =A0 =A0 =A00x0 RS-FEC Enabled (Gen 2) (RE2)=0A=
=A0 =A0 [12:12] =A0 =A0 =A0 =A00x1 RS-FEC Enabled (Gen 3) (RE3)=0A=
=A0 =A0 [13:13] =A0 =A0 =A0 =A00x1 Router Detected (RD)=0A=
=A0 =A0 [16:16] =A0 =A0 =A0 =A00x0 Wake on Connect Status=0A=
=A0 =A0 [17:17] =A0 =A0 =A0 =A00x0 Wake on Disconnect Status=0A=
=A0 =A0 [18:18] =A0 =A0 =A0 =A00x0 Wake on USB4 Wake Status=0A=
=A0 =A0 [19:19] =A0 =A0 =A0 =A00x0 Wake on Inter-Domain Status=0A=
=A0 =A0 [20:20] =A0 =A0 =A0 =A00x1 Cable Gen 3 Support (CG3)=0A=
=A0 =A0 [21:21] =A0 =A0 =A0 =A00x1 Cable Gen 4 Support (CG4)=0A=
=A0 =A0 [22:22] =A0 =A0 =A0 =A00x1 Cable Asymmetric Support (CSA)=0A=
=A0 =A0 [23:23] =A0 =A0 =A0 =A00x1 Cable CLx Support (CSC)=0A=
=A0 =A0 [24:24] =A0 =A0 =A0 =A00x0 AsymmetricTransitionInProgress (TIP)=0A=
=0A=
The host downstream port on the other side of that link:=0A=
=0A=
=A0 # tbdump -r 0 -a 3 -vv -N 1 PORT_CS_18=0A=
=A0 0x00ae 0x00003510 0b00000000 00000000 00110101 00010000 PORT_CS_18=0A=
=A0 =A0 [00:07] =A0 =A0 =A0 0x10 Cable USB4 Version=0A=
=A0 =A0 [08:08] =A0 =A0 =A0 =A00x1 Bonding Enabled (BE)=0A=
=A0 =A0 [09:09] =A0 =A0 =A0 =A00x0 TBT3-Compatible Mode (TCM)=0A=
=A0 =A0 [10:10] =A0 =A0 =A0 =A00x1 CLx Protocol Support (CPS)=0A=
=A0 =A0 [11:11] =A0 =A0 =A0 =A00x0 RS-FEC Enabled (Gen 2) (RE2)=0A=
=A0 =A0 [12:12] =A0 =A0 =A0 =A00x1 RS-FEC Enabled (Gen 3) (RE3)=0A=
=A0 =A0 [13:13] =A0 =A0 =A0 =A00x1 Router Detected (RD)=0A=
=A0 =A0 [16:16] =A0 =A0 =A0 =A00x0 Wake on Connect Status=0A=
=A0 =A0 [17:17] =A0 =A0 =A0 =A00x0 Wake on Disconnect Status=0A=
=A0 =A0 [18:18] =A0 =A0 =A0 =A00x0 Wake on USB4 Wake Status=0A=
=A0 =A0 [19:19] =A0 =A0 =A0 =A00x0 Wake on Inter-Domain Status=0A=
=A0 =A0 [20:20] =A0 =A0 =A0 =A00x0 Cable Gen 3 Support (CG3)=0A=
=A0 =A0 [21:21] =A0 =A0 =A0 =A00x0 Cable Gen 4 Support (CG4)=0A=
=A0 =A0 [22:22] =A0 =A0 =A0 =A00x0 Cable Asymmetric Support (CSA)=0A=
=A0 =A0 [23:23] =A0 =A0 =A0 =A00x0 Cable CLx Support (CSC)=0A=
=A0 =A0 [24:24] =A0 =A0 =A0 =A00x0 AsymmetricTransitionInProgress (TIP)=0A=
=0A=
Kurt=
