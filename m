Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED31A683D;
	Wed,  5 Aug 2026 00:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785890936; cv=fail; b=TNJnGnlj3hedzZizYPPGEsoTEGo1g/jyBXvILtOLuqugAWRShH5dChxDyfpQHDQuK++IpDFq8SKNwHs3NgZ8UXNdZoXm6RXCd7h4doEjCHKZE1U0aMoWoupe+vCvq8eyghIYibYMZC1Ju2HCeugHeRHWRgryB0qoU8iFW08Indc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785890936; c=relaxed/simple;
	bh=wxA1kfKHIxyUdUPDf6BXO/u28wjOfwnuWGlx+aNT9zc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nMTola79aiYOoFY8JhCSPu2Z57RorQLq6V6rnhk3AJbvzIANwlgdon8umf1IX+89nM0I165s+BIceZQnUuXDVAj+y8RLPfdjUSqCKPQBeM36hGjFSDhVHGmm1VYpR0IbNx0YqJAS7Bs6zMiXiG0HFHJvobLB3oC/qoBg2BoTJGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=m9HX/V3R; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lTgV/7DU; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nT1dIcM+ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m9HX/V3R";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lTgV/7DU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nT1dIcM+"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NIp7i2111591;
	Tue, 4 Aug 2026 17:48:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wxA1kfKHIxyUdUPDf6BXO/u28wjOfwnuWGlx+aNT9zc=; b=
	m9HX/V3RhgJgb5ljaeu0XIj6wq0EOpEixHbNvEnFuXXqJeK/oaXwTmMDBaP1CH8+
	FeW8ir58tflqo1zRtsCztacpChco+ysb5Ppros3GwhBzgYLHi8CU/4vRlpazT0Jv
	r1N5iRDINNNcVV7MoUl9SLpYB36y1dWZTYCHjkGXzFnUc3poDJGARIotb0aCj9Fe
	XWqGrC8zsw96XS2FifB6vkureU6jSzd8tMO21UZVknA9O7wNIMdqqz2e7YUojYkZ
	fyNN8ExqBtnTZ9z4e9vxI1tbVGCWT87DouZqjcb1/Bsg5damXtVBLCb0khxMcZIw
	4/7LecW9MW76OX+3aVKxgQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fug0k6dvj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 17:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785890910; bh=wxA1kfKHIxyUdUPDf6BXO/u28wjOfwnuWGlx+aNT9zc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lTgV/7DU/MF+EHCH/2z+oEj0VAwlvwwYwbcXNeuBlhZcwV2lkMeXOB8C1LqW68ToA
	 ZDJPdI34B5oXD+GBQP8DnxXS+oO4cNuFlN1QNt93tvHee0ZXsQrEHZPh9fLyazmfIN
	 rvD5HPKM57AsDYNLku4kd2dHUaJNWWZg5toVEPyQgIm7y6n5CjhFkovDC90/oXzpgU
	 YbRcEsKTP5ZX9j0Pfz7O7JooGd2ykNr2WDwE3tUWeUhY3fxePv6mA6Jl/D+6p8GcKE
	 TAWOBiL/gWrbWHlR/anPUX9p/KaXsftCxYEMqqBX0hNeSvq6TciZ0vFdjHgDcUuutZ
	 0PqVcoiNTueRQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C6BD403AE;
	Wed,  5 Aug 2026 00:48:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BC033A0EB3;
	Wed,  5 Aug 2026 00:48:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nT1dIcM+;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00307.outbound.protection.outlook.com [40.93.13.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C27304011A;
	Wed,  5 Aug 2026 00:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8x0kfx7ZFD/txPTVR5pDUyFPBPP9h18STBDGP50TSQJfCmaIgLjY7ON7eAteCHa9LeX+DI7aHSL06R/xt6ycD/AVCJXY5c5jhYG+cgAZMQUk+gRA4ivJXB+c30Uhd9ISz6KXMwyFngh9M+Ox4vv6XEZEP5suoHCVZ1KHzHJqJ6q+bCQOS/hqzwq35IGpjU8TB3u0K++Dj+jhRJaaJXBb6uwffL1nwH2cOj5NJgW6KDqvQKAKmAIxmAw8wk3iwi1fFllZygEqSftqHZobXtbvWWLvrL/JmMcuD/QUcwxpfTywnQxOgButDlmgmAZu+VoU6pALKoq33+iGcJ+GwJHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxA1kfKHIxyUdUPDf6BXO/u28wjOfwnuWGlx+aNT9zc=;
 b=u0BuIWLxdsE5NGI1KHoCt2RrC9XBwLSMrlwZ51noHW42WjrrwJLacEKbsZkj/3IfrYcF5xM2lVzZWSC0WIS/de1axMIUcpPfYt8pE1HoQMBCZeBVoHNjmwwB9sPasFeJHR28GPoyw1uH6hvx5bF0/Sg7P2ejX74zG+CvhgN18oso6mZBOlu0MONX1B2kR3oobD4GO1QaTqnep7wues1i0q8CdccHbDsvworn90VJP6Tg5p/fUdGhazhRryF2mPggQHjc6GcYL4VytM4jVICID0AAQrPqfKmpRYpJibYVPwt79onMljPHh8GAb061QavXykBtOSyo6pnuyjXgEYEAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxA1kfKHIxyUdUPDf6BXO/u28wjOfwnuWGlx+aNT9zc=;
 b=nT1dIcM+LK9JZjGPYXJpXE5P7NLOIubBWlbdtzRypfTDEOR1dgSavqI8YxdF4N6yVEgamZoC1uJA0YogocSaj/fyaJydRqnu4uLbXJLOAcsz6dwIBkUTgVaL8Ydy5oI2KCJiDWMa91ZejymkdREAYLR8lSJLF1YaUHIbA2ho9F8=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH1PPFB21296325.namprd12.prod.outlook.com (2603:10b6:61f:fc00::620) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 00:48:22 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 00:48:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
Thread-Topic: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
Thread-Index: AQHdHi7a3ggsNoqD806vEwYeGGrqQbaOq9yA
Date: Wed, 5 Aug 2026 00:48:22 +0000
Message-ID: <anJ6HkPgDb7I4xeL@vbox>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH1PPFB21296325:EE_
x-ms-office365-filtering-correlation-id: bc9d47a8-6ce9-420d-d348-08def28b401f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|10067099003|6133799003;
x-microsoft-antispam-message-info:
 1kJm/9bUAkD9PpA+aS/GqrPuRy4HLi9ZokqKD4wTfFifuonp3QWVDXIBpiEM8Lp6pCeppcD2OXeNAaxqs+C/EcbLvT6xE/289+so48xM7mSegicxJcjNDT+OdxjSpdJ+O6f/E+q7OO2+sguax6itUjQfD+TMn08UN61wxfTygM49Fg6J5U5bB7dnaXvTNeYZas2KixW15yl2w1ChctznUnHnzlhP9lYlC+SBeMwms8bbCRKYEGh5egxg1BwQw21XEqlvEe9Mh7A7hFdRqbR16/3K9EQ+12kH7kW4037r3337BdBfIukIMidNSNrkAGzJwEXYe/DjKkxT+E4SDzpzx8RHbu+sfekk7LRE2SJzeLJN0DxgUP5YTIPA9ZJD2C4hlbR6wCXNDtjY+ASrR9+j5fnYqkiFjC1TQ1MLqhM5T8IZdiKviJN0hBQIAKs03TIY7/+YqgI6XeWAduVz5SqRViE1ioolUbtTfXQkT/mAhc5m4/7z3UhraUfLVykHP8LbAv845PwIzt8cbNZUhX8LasvC4SxChstXW8MQzoqppCoTDkVr2XsV7vnRjHNplw3ImuMfgf9OKSGw+VvAST/CGrV9WaqWVJ/sl3IVEVVM80FL0nnq4FCo15SydezcjHiXWUEDybpm6+Kkoi1+ImDd9IIupOF5jqozcXFqN/Wht4eGgP8xESxpiAOJlXv4kO6/0iKk343XsJ0+IEyyqewzNNXpb4UVBV5EGKU/WQSsqxE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGo3Rk5EeXhQY20rWmIvd0dTSWtSTHQwS0Y0MlM5SzZxTXJXVjBYZnpxaVkx?=
 =?utf-8?B?VUlHQjRaWGdhWndYNlUwUDFUTWJiYUpXWTJaSlc1b2RVc2c0R0lGY0IyRTF4?=
 =?utf-8?B?ak83Vlpndyt0VCtNZmV2WUQ0NUhMQkFydUNDbS8zTHB2K0V2SGl1aGpsUTlv?=
 =?utf-8?B?OENveksrTi81VTFFaWhaRVFLRDM4bkVGaG1Bckwwd3pnZ3p4SG5OdHkwYmhW?=
 =?utf-8?B?bjRYWHpXTFBSUUJwT0R4SG9xU0dwUmhZeFQxWlhmZlNWam9xRk9vQWxjeUpw?=
 =?utf-8?B?ZHRuUUFCZkE0Q0FvcHVqcS9iTU1XUkpuWHpYb09kRWhVM0VoOFN6UmJjc3JO?=
 =?utf-8?B?Z0MwL2xYNlpJcGswcll2M0REQTl6OG52M2dwVkdTNEdYWWZYdW9xMGRxcFcr?=
 =?utf-8?B?QVV6d3VUanR4S0JEVm9Kc0xQajNYSHRWd3JxenhpemhTZk1JZnBhSzhKeG5s?=
 =?utf-8?B?Y3QzL3lVcEFHbmZHamJhYXZVcjZ0MmVJektVeDJIdjRycjNXb05mWHFQYjNi?=
 =?utf-8?B?OVFsR1lmSU5lbWJ2NkJiZW1QcTVSdzloS24vRXRwRkFjSUl1bnNOZ08rdDFk?=
 =?utf-8?B?MmtReEZDZEs2YWNxQ0ZEc2tUVTVXMTIwbXhoS2R4MDk2U2JiaUV5TUF4YTQ5?=
 =?utf-8?B?OWZvallvODBlRzlpRVZsQ0VDNHVBWHYyMnZ4em9jT2pOT2crM1h2a05udjNr?=
 =?utf-8?B?ekhQMytjZ1JHVjdWOVh0ZTBGZExWYVBMUXdUZ0VGUklwSUN3MWwzN0R1dGh0?=
 =?utf-8?B?NHE2OE1MWmQwVjFTcHBDd3lJN2IvVjNPRUtOTHBqclpselg3aCt2aUJROGJ4?=
 =?utf-8?B?NmkycFFnalcxMmRaUTlQVldwcXJ0UVpaRUhWbHVNVnBuNEpYZ1Q0Wmp3Y3FN?=
 =?utf-8?B?N0xweEpGdFgwaHMybnlSQ0JUTzNNN0hROTBwVE5IbFRrWFdNSnA2ck5EQmpu?=
 =?utf-8?B?SDdXU2JrUDhsSWlEejY5TnVFM3dvb09vM1VZR3owWE5NOWpiMnMxbnZnQzEr?=
 =?utf-8?B?b0taZWliZDBaSE9KaVpBL1NqdDk3djJubTVMWXlKRnBHOU9Hd0JtcVF0UEFE?=
 =?utf-8?B?cHJqaEVna0svZXhFcnJyRy9DRVpaWnZ2M21JYUJESVJkVnNKU21ybER0Q1pi?=
 =?utf-8?B?UE90QnM1b0lJbjg1MjhacTVYOWdyQkhxODdVTDEzNkJ6ZHV5ejJzWFN1REQ3?=
 =?utf-8?B?dVlMN2ZNOHNvbnY3eFNrcWthd2hNc0cxaGlOWTV6bmtCdmM5R1ArVFlhd3Ni?=
 =?utf-8?B?UTljVzBRUm1FMFFCQllqRnRvN0xQV3J6VlQ3bTBNTUNwMjdFMU1HdzFxQ3N6?=
 =?utf-8?B?VmhBTWs0NVJiRHZwdTJxTUxmRVkwNkd1RHdwL3hEY1REUlBCWnNLazBJclNk?=
 =?utf-8?B?TTBqR1NhZXVieXR3TmZtdUhTL2p3a2g0TDNkTHhCWDk4QWtrVGFEMTIzVUtH?=
 =?utf-8?B?OWVIeEhQczR5bWVNZUMva2ViZ1l2Rkpxblh6c1FnVUw0elBIcW1mUWVXZzYv?=
 =?utf-8?B?UTFLOGpZNVlFeDVUNjdFNHNmeHBsZm81cFBjNjFJdmUzQnAyY25GM1pFVC9R?=
 =?utf-8?B?Rlk5bzBWcDJIelhTT2xsbk9VL3Q0VUxZcm51NC9uTWNzZDBCTi9rOG83Rk1F?=
 =?utf-8?B?VXErRi9MZDRQSmtwR21NV2dhWS9ocC9Ndm55bXIxSjlYWjRjQzg0WG96Nk5C?=
 =?utf-8?B?L2gxT1RjMDdNZC9CNHZDN1BhUmZlMHFjR01ON1UyVERtbGVOOXBhUVR4REFi?=
 =?utf-8?B?M0tVbE12ZDcwMTlycUQxdHBlQmlDRlRwVlJ3MlVPTWttSzlKNlpLVm1PRmxz?=
 =?utf-8?B?eUViM3NmN2RGNHZidmp6Znl1M21VSDY4amw5bDFYRG9EdUhBRGdGWTNVY0R4?=
 =?utf-8?B?NitsMWNUb2Y2SnVlSWV3ajVmN2VMa3JlN1ZYWEtQc05MSHJFbGo2S01YRzQ1?=
 =?utf-8?B?VGRkWG5ZVFdvbDFBYlNTV1dpU1FrZXFWeWZoRkFEdHVTT2krSUFkUjVHU1lw?=
 =?utf-8?B?Y1UyNEVZelBqOU4yVEM5c3lQMytDL3JhQkc3cjB1VW9ab0EzS3F4c2hMZm1j?=
 =?utf-8?B?N0hNT2ZGWWxQa09TSm5iLzE1MXZTajJ4NkZERTJ3NnNxcXVkcUJmZ2pwaytq?=
 =?utf-8?B?cHczYjYvcHFxRGRYZ25Dd2Y0RkxxbjBLcnYzWDd3SEFTWExkMHZPT0xlSG5I?=
 =?utf-8?B?YU9EaFNwei90a3h4bTZxdVFIZUMwcDBLakMrMWJmQW50K211aHllbXpIZU9r?=
 =?utf-8?B?VTdYSXlGS2l1cUhhVC95VGZrYW8zalpTUEdBcTQ2NXpsT0xMWFVxVnpRY0hL?=
 =?utf-8?B?bVZzbEg1NVBLYjhqZmpRWW82eHd3czV1THJEV0J6dGtySXhSLy9Bdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D880F8926242AA4D87D0041D5A1CDD25@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	HGEsKfVVT/YrQwuJucNX+Sdowp7kCHuQ837zV0pbi+RKofLpfk8SYedrNTqZl9kZFe3VDnqloI1v1hSsBP3F+M3L8hUm0B4FLnZfD+54tuHVoxPwKvlD+NSqkEyUlRYEKSLTGu4anC0LHQYK5VsF5Wo570LvJ0oPh2bGX3kLUAuKaVFITrW4cSLgYbotFdouLZKUIvUWYFe0e6H+YNeOLvs5kBC2fBZid0h19upN7V6qyfXEURX3+aE5ANqZWP1zWdByfijVa4vGyw1lbk3ihRVY6iUh0zk0N3WhnyhjryMAvm2mFmwwxwZwvfTB1NCsOvBgiqc8ptTGFQRSh+qZeA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yTIkywb2iZ6Tieq6uhv1aCq1edi1QQ7OhV2F1losqy3rpMyMfA0WLUSVlBVwL5kCYdVL9fJd3L3KMWa1cZV0zl9AW1kDwHMm4L7o7qQPG1lWmbYnXHP7l6b9Rp7xRdC2gyPsuUEdm2SRcEe340HBJI8pD0NEyYEU0ip/5vKTMx6xIPDr3oD5KqDY8SB+8WJEQyD6oLYrc5YNjV1EdQiXO6rQ+rfk6PQvokzWEjkBGYJW8i7usmehTNnRAZUbXj+Cq/g7ttI5qw/sthDKyhNinELo2KdxIl1xu6pkse7Yg5/NJAMqvwSx6cRHlQB46IQfyLbOmg0+2hLL022v/4InXEVhp1H9TqXarDrDCHKzFV28qo+/FjJcxeeg/kiyhw3c4hG0aK9nfUVfO2WSaYCxzIBk92/+d9a6eKl0y88vg9RCEQ5WeowhFOXZUEghzbViE8XiP2tOyRa8FT2FoKC0orrDITgcj/yQNxCGr0YCib7gGaJgwblbL/fRU8xvBSTrC2F4VjdAGN3lrddpXCethmgAgOA0Ct+NZH0FijZjs4CRBXD32C21mhjLG4/Fa7fo17pfCG1mwRxJ93N8Qt47VBx9HqpQfuUcxr1u4EVaNqB0XQngexzj679EboNzpxQiZY4LIRbXCnJLbvXcHHKRmg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9d47a8-6ce9-420d-d348-08def28b401f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 00:48:22.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02O4FGPwEU5pMk4rBVU+TKcniQH3VosiWFOrVJTL5oaomwkX9j629LqbhgSvGAkYN/0tE1KOlAaKCmWL4kSqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFB21296325
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX3OiTZuksJM6Z
 PDlJpbGf7vwT3u1ur8iJNATNzozDQID2+3//uRpDO2tEMNqHe0vX6GzUS3ec8swSKDwCqFnqGl7
 udqqwHZhg+wl3LrAxZZq2L9VH3++eaE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfXyFMXROQMgnEF
 Rt+u8Wif6GKe4TtYJx3LiVUbv06T2pH6krzxS6k8mc1bIx5XPQGwlwIWz2+mmDY1qzXTUMSaoFq
 5KoH/A8C13r+JMXSylaFUsVemsuTimt/0IgbIHMV9SsGS+SVEahLshQ/B1GALqLEFirFDqrWiee
 l/v44PxP95TPgvY9pZuzDs4e+qyGlIzf9JrzrX402VQ1gXEGWrruKRwZhB4MNYmj+8mSFojARUm
 Wu4UZcivkvHD9IyQvMXNJBSrWcM4US3SIwLYQWJUlhmqWmEbBUcJFS97fAyqfTN/Y7HcdGEKizu
 IJfPU9auwJMk0eMKa4nD8NczFHS/eJ8ENFWjxWChiqfgOmq6fOFADp4b3cg3Efv5tnri1xyzsKb
 zo7UyPO/fcbJ40M5piJFR9zxG2X8f3gt39dF5PLutK1dCn9DRdkLNOLA5UjCgeECvxlCnjiGMjb
 X6zy9Ofyz3PmvKYMPmA==
X-Authority-Analysis: v=2.4 cv=DtdmPm/+ c=1 sm=1 tr=0 ts=6a72885f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=jIQo8A4GAAAA:8 a=OsZbx8p9G0NDEntgn44A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: OVh-Bp8DJh9X_ybrz_ntA2p9i9KGAG6F
X-Proofpoint-GUID: OVh-Bp8DJh9X_ybrz_ntA2p9i9KGAG6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050003

T24gVHVlLCBKdWwgMjgsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBGcm9tOiBUaGFuaCBR
dWFuIDx0aGFuaC5xdWFuLnhuQHJlbmVzYXMuY29tPg0KPiANCj4gVGhlIFJlbmVzYXMgUi1DYXIg
R2VuNSBTb0MgY29udGFpbnMgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIERXQzMgVVNCDQo+IGNvbnRy
b2xsZXIgd2l0aCBnbHVlIGxvZ2ljIHdyYXBwZXIgYXJvdW5kIHRoZW0uIEFkZCBkcml2ZXIgZm9y
IHRoZQ0KPiBnbHVlIGxvZ2ljIGFyb3VuZCB0aGUgRFdDMyBVU0IgY29udHJvbGxlciBjb3JlLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogVGhhbmggUXVhbiA8dGhhbmgucXVhbi54bkByZW5lc2FzLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFp
bGJveC5vcmc+DQo+IC0tLQ0KPiBDYzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3Jn
Pg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4g
Q2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IENj
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIu
a2VybmVsLm9yZw0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvS2NvbmZpZyAgICAgICAgICB8ICAxMCArKw0KPiAgZHJpdmVycy91c2Iv
ZHdjMy9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1y
Y2FyLWdlbjUuYyB8IDE1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMTYxIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcmNhci1nZW41LmMNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL0tjb25maWcgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gaW5kZXggMTgx
Njk3MjdhNDEzZS4uN2Q4ZWUxOTJiMTI0MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdj
My9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBAQCAtMjM0LDQg
KzIzNCwxNCBAQCBjb25maWcgVVNCX0RXQzNfR09PR0xFDQo+ICAJICBUbyBjb21waWxlIHRoaXMg
ZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4gIAkgIG1vZHVsZSB3aWxs
IGJlIGNhbGxlZCBkd2MzLWdvb2dsZS5rby4NCj4gIA0KPiArY29uZmlnIFVTQl9EV0MzX1JDQVJf
R0VONQ0KPiArCXRyaXN0YXRlICJSZW5lc2FzIFItQ2FyIEdlbjUgRFdDMyBQbGF0Zm9ybSBEcml2
ZXIiDQo+ICsJZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUDQo+ICsJZGVm
YXVsdCBVU0JfRFdDMw0KPiArCWhlbHANCj4gKwkgIFN1cHBvcnQgdGhlIERlc2lnbldhcmUgQ29y
ZSBVU0IzIElQIGZvdW5kIG9uIFJlbmVzYXMgUi1DYXIgR2VuNQ0KPiArCSAgU29DLiBUaGlzIGRy
aXZlciBwcm92aWRlcyB0aGUgZ2x1ZSBsYXllciBmb3IgdGhlIFVTQiBjb250cm9sbGVyDQo+ICsJ
ICBvbiBSZW5lc2FzIFItQ2FyIEdlbjUgcGxhdGZvcm0uDQo+ICsJICBTYXkgJ1knIG9yICdNJyBp
ZiB5b3UgaGF2ZSBzdWNoIGRldmljZS4NCj4gKw0KPiAgZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+IGlu
ZGV4IGYzNzk3MTE5NzIwM2UuLjk5YmJkMTQ3ZjBiNWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiBA
QCAtNjEsMyArNjEsNCBAQCBvYmotJChDT05GSUdfVVNCX0RXQzNfT0NURU9OKQkJKz0gZHdjMy1v
Y3Rlb24ubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1JUSykJCSs9IGR3YzMtcnRrLm8NCj4g
IG9iai0kKENPTkZJR19VU0JfRFdDM19HRU5FUklDX1BMQVQpCSs9IGR3YzMtZ2VuZXJpYy1wbGF0
Lm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19HT09HTEUpCQkrPSBkd2MzLWdvb2dsZS5vDQo+
ICtvYmotJChDT05GSUdfVVNCX0RXQzNfUkNBUl9HRU41KQkrPSBkd2MzLXJjYXItZ2VuNS5vDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcmNhci1nZW41LmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcmNhci1nZW41LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwMC4uMzQ0ZDA4NTE1NTlmNQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yY2FyLWdlbjUuYw0KPiBAQCAtMCwwICsxLDE1MCBAQA0K
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiArLyoNCj4gKyAq
IFJlbmVzYXMgVVNCIGRldmljZSBkcml2ZXIgd2l0aCBEV0MzIGludGVncmF0aW9uDQo+ICsgKg0K
PiArICogQ29weXJpZ2h0IChDKSAyMDI1LTIwMjYgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3Jwb3Jh
dGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L2lvLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVkZSA8
bGludXgvb2ZfcGxhdGZvcm0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
cmVzZXQuaD4NCj4gKw0KPiArc3RydWN0IGR3YzNfcmNhcl9nZW41X3ByaXYgew0KPiArCXZvaWQg
X19pb21lbQkJKmJhc2U7DQo+ICsJc3RydWN0IGNsawkJKmNsazsNCj4gKwlib29sCQkJdXNlX3Vz
YjNfZmxvdzsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHdjM19yY2FyX2dlbjVfaW5pdChz
dHJ1Y3QgZHdjM19yY2FyX2dlbjVfcHJpdiAqcHJpdikNCj4gK3sNCj4gKwkvKg0KPiArCSAqIFRo
ZSBkYXRhc2hlZXQgZGVzY3JpYmVzIGluaXRpYWxpemF0aW9uIHByb2NlZHVyZSB3aXRob3V0IGZ1
bGwNCj4gKwkgKiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVnaXN0ZXJzLiBUaGVyZWZvcmUsIHRo
ZSBzb3VyY2UgY29kZSBpcw0KPiArCSAqIGJhc2VkIG9uIHRoZSBiYXJlIG1ldGFsIGNvZGUgc2hh
cmVkIGJ5IHRoZSBib2FyZCB0ZWFtLg0KPiArCSAqLw0KPiArCXdyaXRldygweDIxMSwgcHJpdi0+
YmFzZSArIDB4MjYpOw0KPiArDQo+ICsJLyogVVNCMyBkb2VzIG5vdCBuZWVkIGFkZGl0aW9uYWwg
cmVnaXN0ZXIgcHJvZ3JhbW1pbmcuICovDQo+ICsJaWYgKHByaXYtPnVzZV91c2IzX2Zsb3cpDQo+
ICsJCXJldHVybiAwOw0KPiArDQo+ICsJd3JpdGV3KDB4MTEsIHByaXYtPmJhc2UgKyAweDgxYyk7
DQo+ICsJd3JpdGV3KDB4MCwgcHJpdi0+YmFzZSArIDB4ODFhKTsNCj4gKwl3cml0ZXcoMHgxLCBw
cml2LT5iYXNlICsgMHg4MDIpOw0KPiArDQo+ICsJdXNsZWVwX3JhbmdlKDEwMDAwLCAyMDAwMCk7
DQo+ICsNCj4gKwl3cml0ZXcoMHgwLCBwcml2LT5iYXNlICsgMHg4MDIpOw0KPiArCXdyaXRldygw
eDEsIHByaXYtPmJhc2UgKyAweDJhKTsNCj4gKwl3cml0ZXcoMHgxLCBwcml2LT5iYXNlICsgMHg4
MWEpOw0KDQpVc2UgbWFjcm9zIGZvciB0aGVzZSBtYWdpYyBudW1iZXJzLg0KDQo+ICsNCj4gKwl1
c2xlZXBfcmFuZ2UoMTAwMDAsIDIwMDAwKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgaW50IGR3YzNfcmNhcl9nZW41X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4g
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnN1Ym5vZGU7DQo+ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wg
KnJlc2V0Ow0KPiArCWNvbnN0IGNoYXIgKm1heGltdW1fc3BlZWQ7DQo+ICsJc3RydWN0IGR3YzNf
cmNhcl9nZW41X3ByaXYgKnByaXY7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCXByaXYgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXByaXYp
DQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRl
diwgcHJpdik7DQo+ICsNCj4gKwlwcml2LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlKHBkZXYsIDApOw0KPiArCWlmIChJU19FUlIocHJpdi0+YmFzZSkpDQo+ICsJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwcml2LT5iYXNlKSwgIkZhaWxlZCB0byBtYXAg
cmVnaXN0ZXJzXG4iKTsNCj4gKw0KPiArCXJlc2V0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldChk
ZXYsIE5VTEwpOw0KDQpXaGVyZSBpcyB0aGUgInJlc2V0IiBiZWluZyB1c2VkPyBIb3cgaXMgdGhp
cyByZXNldCBhc3NlcnRlZC9kZWFzc2VydGVkPw0KDQo+ICsJaWYgKElTX0VSUihyZXNldCkpDQo+
ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyZXNldCksICJGYWlsZWQgdG8g
Z2V0IHJlc2V0IGNvbnRyb2xcbiIpOw0KPiArDQo+ICsJcHJpdi0+Y2xrID0gZGV2bV9jbGtfZ2V0
KGRldiwgTlVMTCk7DQo+ICsJaWYgKElTX0VSUihwcml2LT5jbGspKQ0KPiArCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+Y2xrKSwgIkZhaWxlZCB0byBnZXQgY2xvY2sg
Y29udHJvbFxuIik7DQo+ICsNCj4gKwlzdWJub2RlID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQo
ZGV2LT5vZl9ub2RlLCAic3lub3BzeXMsZHdjMyIpOw0KPiArCWlmICghc3Vibm9kZSkNCj4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLCAiRmFpbGVkIHRvIGZpbmQgRFdDMyBz
dWJub2RlIG5vZGVcbiIpOw0KPiArDQo+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmco
c3Vibm9kZSwgIm1heGltdW0tc3BlZWQiLCAmbWF4aW11bV9zcGVlZCk7DQo+ICsJb2Zfbm9kZV9w
dXQoc3Vibm9kZSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCAtRU5PREVWLCAiRmFpbGVkIHRvIGRldGVybWluZSBtYXhpbXVtIHNwZWVkXG4iKTsNCg0KV2h5
IGlzIG1heGltdW0tc3BlZWQgYSBoYXJkIHJlcXVpcmVtZW50PyBJdCBzaG91bGQgYmUgb3B0aW9u
YWwuDQoNCj4gKw0KPiArCXByaXYtPnVzZV91c2IzX2Zsb3cgPSAhc3RyY21wKG1heGltdW1fc3Bl
ZWQsICJzdXBlci1zcGVlZC1wbHVzIikgfHwNCj4gKwkJCSAgICAgICFzdHJjbXAobWF4aW11bV9z
cGVlZCwgInN1cGVyLXNwZWVkIik7DQo+ICsNCj4gKwlyZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5h
YmxlKGRldik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBy
ZXQsICJGYWlsZWQgdG8gZW5hYmxlIHJ1bnRpbWUgUE1cbiIpOw0KDQpEbyB5b3UgcmVhbGx5IHdh
bnQgdGhpcyB0byBiZSBhIGhhcmQgZXJyb3I/DQoNCj4gKw0KPiArCXJldCA9IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byByZXN1bWUgcnVudGltZSBQTVxuIik7DQoNClNhbWUg
cXVlc3Rpb24gaGVyZS4NCg0KPiArDQo+ICsJcmV0dXJuIGRldm1fb2ZfcGxhdGZvcm1fcG9wdWxh
dGUoZGV2KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd2MzX3Jj
YXJfZ2VuNV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCg0KQXZvaWQgdXNpbmcgX19tYXli
ZV91bnVzZWQuIElmIGl0J3Mgbm90IHVzZWQsIHJlbW92ZSBpdC4NCg0KPiArew0KPiArCXN0cnVj
dCBkd2MzX3JjYXJfZ2VuNV9wcml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsN
Cj4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xrKTsNCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfcmNhcl9nZW41
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfcmNhcl9n
ZW41X3ByaXYgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmNsayk7DQo+ICsJaWYgKHJldCkg
ew0KPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBlbmFibGUgY2xvY2sgb24gcmVzdW1lOiAl
ZFxuIiwgcmV0KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwl1c2xlZXBfcmFu
Z2UoMTAwMDAsIDIwMDAwKTsNCj4gKw0KPiArCXJldHVybiBkd2MzX3JjYXJfZ2VuNV9pbml0KHBy
aXYpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgREVGSU5FX1JVTlRJTUVfREVWX1BNX09QUyhkd2Mz
X3JjYXJfZ2VuNV9wbV9vcHMsDQo+ICsJCQkJIGR3YzNfcmNhcl9nZW41X3N1c3BlbmQsDQo+ICsJ
CQkJIGR3YzNfcmNhcl9nZW41X3Jlc3VtZSwgTlVMTCk7DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfcmNhcl9nZW41X29mX21hdGNoW10gPSB7DQo+ICsJeyAu
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuNS11c2IiIH0sDQo+ICsJeyAvKiBzZW50aW5l
bCAqLyB9DQo+ICt9Ow0KPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19yY2FyX2dlbjVf
b2ZfbWF0Y2gpOw0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX3Jj
YXJfZ2VuNV9kcml2ZXIgPSB7DQo+ICsJLnByb2JlCQk9IGR3YzNfcmNhcl9nZW41X3Byb2JlLA0K
PiArCS5kcml2ZXIJCT0gew0KPiArCQkubmFtZQk9ICJyZW5lc2FzLXJjYXItZ2VuNS11c2IiLA0K
PiArCQkub2ZfbWF0Y2hfdGFibGUgPSBkd2MzX3JjYXJfZ2VuNV9vZl9tYXRjaCwNCj4gKwkJLnBt
CT0gJmR3YzNfcmNhcl9nZW41X3BtX29wcywNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiArbW9kdWxl
X3BsYXRmb3JtX2RyaXZlcihkd2MzX3JjYXJfZ2VuNV9kcml2ZXIpOw0KPiArDQo+ICtNT0RVTEVf
QVVUSE9SKCJUaGFuaCBRdWFuIik7DQo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIlJlbmVzYXMgUi1D
YXIgWDVIIFVTQiBHbHVlIExheWVyIERyaXZlciIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
Ow0KPiAtLSANCj4gMi41My4wDQoNClBsZWFzZSB1c2UgdGhlIG5ldyBmbGF0dGVuIGdsdWUgbW9k
ZWwuIFRoZSBsb2dpYyBmb3IgdGhpcyBnbHVlIGxvb2tzDQpzaW1wbGUuIENhbiB5b3UgcmV2aWV3
IGFuZCBldmFsdWF0ZSBpZiB3ZSBjYW4gZW5oYW5jZSBhbmQgd2hldGhlciB3ZQ0Kc2hvdWxkIHVz
ZSB0aGUgZHdjMy1nZW5lcmljLXBsYXQgZ2x1ZSBkcml2ZXIgZm9yIHRoaXM/DQoNCkJSLA0KVGhp
bmg=
