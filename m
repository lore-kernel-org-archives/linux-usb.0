Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A33FFD;
	Thu, 16 Jul 2026 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162361; cv=fail; b=OdA7Wy5wekkgKePQDB1TmmziD/KUTxB33Io/1XDRKuj/OZfNvYBC7eHURhBxvwYNxPwFnRN7EkkhA/nf9QNPkaDbwsmLjelNojYLzYFCpyYgZCSJvoKye0R7gEZ9jPTm5dMPeuIFm4cVM6JvGgbcuHfg5onS7HCgM3Xv3IxnNa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162361; c=relaxed/simple;
	bh=I52ybeN3pyBdDPLLwu5TLglFdrNKMCUqBW+ZApG63RE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IAukU+uLp8onN+w+yoHSQ7nRY+IaNnKR/fMyU+PU0S2OiM9cHM+DweHYo1MoH164I59A9iPpY32EEzVJrpzS1YeRE1FN2luSH85K2YIomtftRR7t54mbIp6Ijw1JSwRPcVR3HOXclwG5S7roQMUesFLUX55usSfHhctCmMKqU6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Qji3stj3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EQCIYEOu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u/a26Y1h reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qji3stj3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EQCIYEOu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="u/a26Y1h"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0RfGT3264537;
	Wed, 15 Jul 2026 17:38:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=I52ybeN3pyBdDPLLwu5TLglFdrNKMCUqBW+ZApG63RE=; b=
	Qji3stj3x/NS6VXeDPE0zPoMKsAYT5z1HApmv60BMfT9KKV0omSxfm/NtBIhC8H+
	Dj35+Vyd+jUEop+Y4w6Bm4Dw5rFVbU8Iyi0LUUViGc6Nc3E2m6nGo/XVpa9lchpe
	WzJ86HLT+bLH8yPJIl0rVsiWNVMA+vdzWdwWG6uKruASbujgyY25k+DaaNDZbyy3
	IWRrHyrcxl3vQ09+Ahm6L+3FXpwavux7SCmYwd8x3KLOFzPCJOJLiIksXgkzYmxt
	mi9BodU9s5jCZK4mdakeCNDQdt1LCsqSteUiDxYuxXeYldmEK99kG+C380fOgGAG
	w+N1+Z46Hp6YGRkmLMD5jQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4feddwushq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 17:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784162338; bh=I52ybeN3pyBdDPLLwu5TLglFdrNKMCUqBW+ZApG63RE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EQCIYEOuvxQa1Su6Wifvl9+Os1WnXA4YyaXNHKlYD+4Thly0krAb1sDlGfYmK/rij
	 2Jo4Hb2pe70iRWPSXhWni0fWX2NXOR6sZdv8pjXgiQ5sl6jhOx4FfvQYCGJfdTE/Bb
	 zYSly4/jD0bfXbYm+ENkB8ki9C36mHlkt8MC6exONB0vhtDvFWvURAWe9KLlGk2+ce
	 Ud04MCAauJiC5Tp9guiruoZ71Ydf26rPjUeKNfMLIM4bmwXWtOSvdVeeNpn2g2flm0
	 ssJMscwBMNpjsclutLTFD5uzJlsMSYMFf2vhhgCQ4JUkNalitONt76wz++nN1tW87y
	 UQS0lHbFd4yXQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 268F240351;
	Thu, 16 Jul 2026 00:38:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4FFB5A1095;
	Thu, 16 Jul 2026 00:38:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u/a26Y1h;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00100.outbound.protection.outlook.com [40.93.4.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 406044011C;
	Thu, 16 Jul 2026 00:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as3RKdQE6ft181fiTyvqzZezKtfjzSdX26xUFD7KEaYN1mb64Pw2I02OnW0034rKeoWyJs/GVHa+0O5ygSjJZkC7rYbaBzZouIzMfCH5AHw0quR1X+MeZCkK+clckQS4DMRYIJX/QgGK0tzG7aXlqo/s1pipp73YQt43zic6Z3qzMNXvRsIr4tXVYz2S30wL1hCI4zI2plxOKScqyoseRcV3coVEVcdlqfKUvzhoL0nNKwtcfRGsV24cxCuz5w2VVlKOVl9CAWDlEVtT2pzfIx1L3ey4Bza0Isk9RGEYdDwnOkI1H/QjuaFPne20jQTYjKEqmhkBWTU+8Yl9H59dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I52ybeN3pyBdDPLLwu5TLglFdrNKMCUqBW+ZApG63RE=;
 b=qVXSdViNQIJZHvsJBFAtmeRkGIZ98Z/s4s2Kkpb0KD6C/jCoLbmZnBQV9sbugaB7J/1/49kgWr/6Yj4E322SwU9/b7MqAoyiGv3ueTucvfv9HtcOH0PV6yXnlylWroWuZRmUIR3d6Fvzwd6vvW2ewd3xZ8GP63Dz64oli0+YqP6xzx+eIhxCeLhm3VMO8S2sFcWzpG3z0oLXfJKV1oO2a1OZCsqvLEgzAVrfmLpsMnT7Z6QmVG7eAYlyDYaOn6B9Pi/VPzNmv+y+24aO5PRYotM6HiKFdSpQLurtcYR4/buLFsCSRzc5Yip+96y0Hp0VOnF5tZ7KmVi6qyGX3y89lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I52ybeN3pyBdDPLLwu5TLglFdrNKMCUqBW+ZApG63RE=;
 b=u/a26Y1hT3k6yUDZtZIUcXkmUf0z+wAFs4chPT1WGG8dri/rUXLCK+aes+3CEdnXMZnFX4Ky8aQOyemKbbtKGTumhFONiUOJ4Qei3ONFiLU6s8vlKWWcItUJhxtYXfPCGD8hlfYZuF0o0J1fXOCftK67pOfF1IFF8r9lcrkJAHs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 00:38:40 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 00:38:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Alexey Charkov <alchark@flipper.net>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v13 29/35] usb: dwc3: core: support PHY reset
 notifications
Thread-Topic: [PATCH v13 29/35] usb: dwc3: core: support PHY reset
 notifications
Thread-Index: AQHdE8arRneswr7xUEajxvR7GSrovLZvT1IA
Date: Thu, 16 Jul 2026 00:38:37 +0000
Message-ID: <algnRWVX9g8XranY@vbox>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-29-6cb3e769d4c5@collabora.com>
In-Reply-To:
 <20260714-rockchip-usbdp-cleanup-v13-29-6cb3e769d4c5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CY8PR12MB8196:EE_
x-ms-office365-filtering-correlation-id: 35c22163-986d-4cd9-973b-08dee2d29377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|10067099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 9e8GZ2Yock7UobWKaZAoXcLV1WX9r6aLJ2Ly+xsKQo6XmSGmhTyhKPtUZK9twg8JK4dS41n3PhYVx+6ZyGJvk1ifKkTLwCfwb9scbINJM97aSncsqNMONuYBFZfxbvyPsAw89JSMp398ZEzgyopCS2gRF/EgN5EcdoS7pauZ0a4TQslQ/aRgfFHVztGXUVNxogQRApT6XhLn/kY6e7+jubKJwQErphNVKyJAxK8QCc7X6ZzEO9cG1G8yW+up/FANmOj4IomBi9dJ1DLtqLiCsnV5C689Oafzn7Nj8a0ZvgCXmwYonSlsw5YQevLBp3BBAMmIlhZ4u+9b1PPnUWMD69Cf6m09kT6wU0ZLm7Ef9uzfLGYEJGavt+PiO0TYaJx2r1ptHf1Q4OANyY486qQUe2UAVcJEUv0DgeB7VMYQMBSKVBICEXuminFPBkpTVJ1zcNEl3vXbOsJx3WdFUDGP5vkWWFEatTygbniyRDppe6IfMuHUqvGxv4aaYdxeV3Fha5limtzQGxG1wdb6vorC15od8b/WC8U95t5R1ryV1fZ4zFGgwkKgtDjhXQIGRxvZfv1p3IeEcUFHYDJTwsvW9gq2OJ/pES1GGGEd9FRl5Diff7FMSYmNPCLnp8xNgav7TU3g/irpE3fLBcM4ru0gShM9fRTaB5IX2wQkYoXjqTo4PVcT3cfv9F1RIhQp40uRYHnVQb90k9h0MGUdbR9jPw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(10067099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmdZUDhqU0txR3NpUENIRmpKRTEwQWNsRkRra1dxRUgrOU5kVVFLSVZtYTVD?=
 =?utf-8?B?ekl0NVlzZWFqcWhOaUtVTHNTaktkZjBlZ3h1MmtxL09PTDBUMU1ZNU5HUUZ5?=
 =?utf-8?B?eTVZOTQ2ZHFrZStKZ1BIdkU3NGh0UDh1ckM0WEVRU2RHUFlmQWJna2JsTTl4?=
 =?utf-8?B?Q3dFNGpEMzZOVXZYNVJlNGhZMy9VbTJPV0RXU2xVTlRwM09rL0s0eWcvN2lJ?=
 =?utf-8?B?MXlXUGJLZWMwMUE0U1QwZUFZSm9oRCtleVR1TG01bmZxQmFpaUxTdW5OeDNW?=
 =?utf-8?B?US9vYi9hSlZHTjkvd1QxRFRrZXNLNmN0NEt1TGdKRnlxOTQvQ1VBbkREczBO?=
 =?utf-8?B?MTNMRXJHLzdxVXY2bk1aL2JPaEtkTWNSeG0zZVJGdjRXbjVTeis1cW9yTVAy?=
 =?utf-8?B?blNDcjI0alNpaFU1bWxVUEZVbWdkZ1gwTkxZVkhHVGdZemV6NjJZbjVIL1o1?=
 =?utf-8?B?bVRFZXVKbW1oaUxSS1lCMER0WXpoeGYvK2ZWc1Z0bVJwRi9iVDFWQytYOFYy?=
 =?utf-8?B?enFPcjVrNTN2NVFnK2xsUm11WjQ1Y21rbnVXSmlVdnJLMktQRzRSR0JISWdM?=
 =?utf-8?B?d3RkZWFObmRUVFcvRkw4YlYyWWJabjY2Y3FrNWFuNllwUmt4dWtGT29JNmIv?=
 =?utf-8?B?M1d6VHcvV1pBQTEwV0JUVFdKNlJ2Q21JMU1PYjlEcnBNM3N5dmRFZWRVbTZp?=
 =?utf-8?B?cEMybVZYdWNVME9hYWI0MHhvVmhqdEtHcW92YUhQVmtpQkZYenhYT2xUSEs3?=
 =?utf-8?B?eVNXWWRKeFhPenF2QUVtQ0tVekpIZ09oTXByRW1YY3VZMktmeUNQWDVqM2RN?=
 =?utf-8?B?M3ZiTWVCeUJ6L2NTaXljWWxWU2lJb3MvQW94UnR0eGtFV08yZEMyTjBlYUlz?=
 =?utf-8?B?YzVNdTUvNitYVnQ3dXMwekdpYk8vVThIcWhhNkZNZzNaZThVUDBsSnVmR29n?=
 =?utf-8?B?aDdrK3M0dkIzUjJkb2tVSkRUaW1RYlFMcXpQOFJCTk5nOW1Xa0V0M2g2Y3dm?=
 =?utf-8?B?OEpqWVNhdjZ4dXdYb2l1Q3QxQzV5K2NFOE9BRElwdFM0bGkxRG1pTHlCcFh3?=
 =?utf-8?B?dWIrRHk3OVUwTGh1Q1ZhODRDRm1VSnBlMUcxRkxJVFo4OSszVVRiQ0lIaHBS?=
 =?utf-8?B?OE1LWmxuRHZQcytEajlHUlNyOWhCOEE3QWgrWjdmRzcwRE54blowUXRPWEVV?=
 =?utf-8?B?RXl0dE53QVkwWm1PZkpuaDB4REVqQ0lyc1RvdjNyaW4vZFEzM2xETmhjME5v?=
 =?utf-8?B?MVk5V0xOSnA2S084Y0FYTU1XUWxCQVVVVkY5b3AyNWxqeXhmZVIwaHpPVk5r?=
 =?utf-8?B?QTFrOXhiT3VvY1FlYjcxVlFhalZtUm1ZemRmV2N1dXFBWEVCYUJScjIxSjVY?=
 =?utf-8?B?eDJEWkhBZkNpZ3U3R3lXSkdJc2VocDdPeWsxMWxjYWJJNzNUV2hhbU1mem1M?=
 =?utf-8?B?NVZtcHNmYXlrWktGaVZaT0pXU2pxTVBDclN5MUdhT3dSNisvWDc2SUd6ZUtD?=
 =?utf-8?B?VFBqVndraXFYT2NtSVFVbHR1a1FPUStZc0prYkUyTE5Ed3NJVWpvak4wZXBl?=
 =?utf-8?B?ZSt0MDhnZDBYRXo4TVhQeWtmQ0RUSkV1Yk8ySE5RZmx5L1k4SzBDT2hwaHMy?=
 =?utf-8?B?VmZGTEVwSThvWGNvNGJhK0JjZjczRUdhRXREL2lua0tPRWpxTHlCd09xNDVD?=
 =?utf-8?B?L2ZLeUlWMXArNkd4WVN2bXR0NG5JZFIyT2pwRG5IR0Q2SUFqb2NJZDFGWU91?=
 =?utf-8?B?dXZ3N1pGc3BSRjN4dkRGdkpFQXpkclNZVEdLK3RNaWtmQVk4UFg4R1llMTl1?=
 =?utf-8?B?aUVnK1JxallxRXZwb25PUkVCSUFSbnMxWWZlTU5qL1JGQVhGRkZXYUhYcmlE?=
 =?utf-8?B?OTA1QlB2VlBHa0lxd3IzZ1Q2cWsybTh6aWFTRzIvOHBidUthNi95S2xTRHBn?=
 =?utf-8?B?OFpHRlNqdm1XTVRiRTBLUytmQmE1dmNSSk5pSlEwMWJOVjMvUXl6SGFoTk9h?=
 =?utf-8?B?QXUrOTJRQXJFWW0zcllzTlYrT3FseGFhQW5McldhTlF1ZkhJSllSNHBjdmFv?=
 =?utf-8?B?ZTNEZG9aOXpYaktVekN1UW5JN1dBWDB3L1pEVkcwSjZ2cmZIUjRDWWRzbXZF?=
 =?utf-8?B?N3BrcHVDUVVGMDlxUEJLQ3JWanpGelZhVTM4K3Bhb3lLbXdmQm5iMVVqQW84?=
 =?utf-8?B?ZXpqS1pGTVJXSHNuTDhqSTBNMUZGWXhCd3pSRUQ4c0t6UWF6a0J2NllYVHVs?=
 =?utf-8?B?QUZOQ0dDMzlaZzJFMmZWa1Y4TlJKdmoxUXhlSWlyZWhIOFFSYkdRdEIvaUp4?=
 =?utf-8?B?UTAyMSsrbFFDa1RLZ0pLbEJmdXVCWDNJR2x4YzJDbTFXV1kzZWdSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2447101137758046B50DE7A104BDFCE5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PAIIZqAqdkuCyjinJdsqeJxxb1q+OF/M01RNMUNCfUxcFbzYE+LH1IqOeRkBamGLy5sS0qeTNMlRzBCLLh+XwWib85DOwLC513al4koYVB0UsvyRx4hq1OiYaf01mJQDFf62VSgXhw6kiJX/z7AXoyKX0TnE6oYc/3ICdycA+oloqvRODOblZd/+8FQMFU0lM5wfpVPEzCIbaMnP8PhCXlgDBXIVyJP5fKYS82diWjbmDESJOunz7PL/txGOuieV2/o8eBST8aZ5+t7Crur3Mldql6IebdBvrTdj/u76iUg6ScCTOaDf1f7J69xCCFFzp71eo9stGdJ1nFfQGOeytw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+h8RxahIDrtEpzJJ3CBkz/s3mOxqvJV+gBw7O187adrinNnwuMJzheFDW3GNvB6P2aPQffS5q+i8PYOLK/n+LlxDZQdK9Bd5DX9rNhnu9i9G6FTqRjIsAj52txc+yvlM+iKbvWGWktZP4VLSXvACiGK+UKGUKeMWeaCk7PRnmr9pOvNs7gwoBI+Fpm1rbbeY3s9xLso3OxicOVy2rtrir2l2XerPJ3Gn+Lh59mlI8nRD01tb1liRqGckexh2TbQ+qIMRVa7bZy4eLDyXfT25AjqJaSrf77kKgfjpdkpn9d1dp7GuhBQHzo2P+4lTVfixPIAvyQFaXJvCZ9zX0ZI9YTCPsYBud7QqtJAc4vYqtCOHamkYxMT8+O/RPIid9lTFYERM8/rS2ZaoCHMfiH8c0UkZsBzMK4CCqYb7PsbL9k4thTLRJP+yIVvEmRoV32Yg6a/8ThokFcuoyyWtRYX6OPrbAZBJfvxvQoBTLvLkC6VPIrBNcaPQ4m1eT6HnFYUvpgem4kn/DQrZwkFuDManV9tqZEeSwRAgsP4QMSFwIiSGY4jiy2TqQCmi9C9tVlWGGSb61pS5f/eac9Q33U4/5q4qvAkJQLWzWzhidqnFvdBi+0JWJtM29kkdJv76qyBOdk/WFNl0LDso+fVicN1LAw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c22163-986d-4cd9-973b-08dee2d29377
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 00:38:37.7824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9C12zffRkngooTXDnvzSQwp4pUEYPpgKzcK9Mif+AikIkwJj9m7gpHIZOjY3O0ZS+3qAG9n7K01vxHExCYvQ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAwMiBTYWx0ZWRfX2FvxH3JH4v06
 Ad/ngP8wXdE8ORgUY7KR5aVvtaIO63PSiac4Z6Qm82nFbPC/QIXOFhH06VtISPK9Tu0Y+8+mn11
 O6wm3ee8k/p+kvJ77NoXbpQJO0+tcbNmuYf2tJlfXDz3gP5ACy8gELD+PH/vW7LTwYwm4nU3RH9
 nkVv4Typzp/oME15TvqeGAEniOqZ8OjpIFNP9idMF6rYx1nmVUg6eITyiIcaawzfxKd88IaUi5u
 UnT9tp8W5bCjEH6jPObT/LR5DgsSQkKscM68SDmfR5/DptLf/tvV/J8rIpxSxhNvrt/vZLRpmd7
 ZT4IhtSutAk7YToVq/iF0JMnYaQ5raCsHF1lgvVUlKNljDqeunhgRCAnytN0KcZWBO1xiVbC4qM
 Ufef8LPgh+VBLWcxdsObVUdDVc7sYxoTdMGJTiukExZExrZidxvv2TOu8GBFmJ0eCXQUuXju31j
 wlZ8kbBRqBwOL5AYBNg==
X-Proofpoint-ORIG-GUID: rltciFRxq8JauzK-PM5l1gZFpLhXar63
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAwMiBTYWx0ZWRfX3p63ANGyyivD
 7DCud+pAOra6SOg4MTVXuCL6inNXFXQGA/OnScxP793zVfmT0cpW8p4xXhL+GdoUh6U+SdR+2LU
 I71hHKt4pMH4qahQweVMEVzgj9CE6XE=
X-Proofpoint-GUID: rltciFRxq8JauzK-PM5l1gZFpLhXar63
X-Authority-Analysis: v=2.4 cv=K8oS2SWI c=1 sm=1 tr=0 ts=6a582823 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=QX4gbG5DAAAA:8 a=LmSbGtMdET2yByI-T-0A:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 spamscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607160002

T24gVHVlLCBKdWwgMTQsIDIwMjYsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiBPbiByZWNl
bnQgUm9ja2NoaXAgcGxhdGZvcm1zIChhdCBsZWFzdCBSSzM1ODggJiBSSzM1NzYpLCBEV0MzIElQ
IGlzIHVzZWQNCj4gd2l0aCBhIFVTQkRQIFBIWSBwcm92aWRpbmcgVVNCMyBhbmQgRFAuIFRoaXMg
UEhZIG5lZWRzIHRvIGJlIHJlc2V0IHdoZW4NCj4gdGhlIG1vZGUgY2hhbmdlcywgd2hpY2ggbWF5
IGhhcHBlbiB3aGVuIHBsdWdnaW5nIGluIGRpZmZlcmVudCBVU0ItQw0KPiBkZXZpY2VzLg0KPiAN
Cj4gSWYgdGhlIFVTQkRQIFBIWSByZXNldHMgd2l0aCB0aGUgRFdDMyBJUCBydW5uaW5nLCBpdHMg
aW50ZXJuYWwgc3RhdGUNCj4gY29ycnVwdHMgcmVzdWx0aW5nIGluIHRoZSBVU0JEUCBQSFkgbm90
IGJlaW5nIGFibGUgdG8gbG9jayBzb21lIFBMTA0KPiBjbG9ja3MsIHdoaWNoIGVmZmVjdGl2ZWx5
IHJlbmRlcnMgVVNCMyB1bnVzYWJsZS4NCj4gDQo+IFRvIGZpeCB0aGUgaXNzdWUgdGhpcyBhZGRz
IGhhbmRsaW5nIGZvciB0aGUgbmV3IFBIWSBmcmFtZXdvcmsgcmVzZXQNCj4gbm90aWZpY2F0aW9u
cywgd2hpY2ggd2lsbCBhc3NlcnQgUEhZU09GVFJTVCBiZWZvcmUgdGhlIGFjdHVhbCBQSFkNCj4g
aXMgZGlzYWJsZWQgYW5kIHdpbGwgZGVhc3NlcnQgaXQgb25jZSB0aGUgUEhZIHJldHVybnMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxA
Y29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDEwMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5oIHwgIDE4ICsrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MTkgaW5zZXJ0aW9ucygrKQ0KPiANCg0KVGhlc2UgY2hhbmdlcyBzaG91bGQgbm90IGJlIGluIHRo
ZSBjb3JlLiBUaGlzIGlzIHNwZWNpZmljIHRvIFJvY2tjaGlwDQphbmQgbm90IGV2ZXJ5IHBoeSBu
ZWVkcyB0aGlzLiBQZXJoYXBzIHlvdSBjYW4gY3JlYXRlIGEgbmV3IGdsdWUgZHJpdmVyDQpmb3Ig
dGhpcy4NCg0KVGhhbmtzLA0KVGhpbmg=
