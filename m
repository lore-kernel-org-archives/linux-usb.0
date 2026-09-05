Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BAF2931F7
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567318; cv=fail; b=QPeT7lHrGvTy6ZeWtinDdJHvgNDaK8hwHN4mOuIsrWXrGtTNs4WtvG5b/OQQjSFGsvMyuRFW5nOJS4ulGfvkO61BiFcDI0MLyR3VCF4TGi/3SxgHnk6/yel3apCDZBW7xbR1SLZFiw0lI2DdIQlNXMlfiGNgzUGyKZcWi+YAY/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567318; c=relaxed/simple;
	bh=mxqiVBgcN3PKaVJkG7Ny7yYlxzVRfdCFn8q5L4Y1gEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7zRslFxuez+aUnv5berL/rQ3KCYXPHwf/9/xkU8xUB4D943B9I2u/G53FccNVQ+K3W9Si6nKOfTP7V/d74j6skyVOlvPHtZNrG2QCFMvyJEJDLEIEdekcxQtPd3MG0m0qlmPFD2dZ/2OUN4g11Ie5BhRlaCMhynCzxSd6/IuBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iFblbFDS; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y+wZmZc/; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fkwdv2q7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iFblbFDS";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y+wZmZc/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fkwdv2q7"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kcxua1143365;
	Fri, 4 Sep 2026 17:15:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mxqiVBgcN3PKaVJkG7Ny7yYlxzVRfdCFn8q5L4Y1gEs=; b=
	iFblbFDSrCQSLfkTjelPQ5t+tixpO5bYVg+3HAdZhn07ZcWCiDtvHLzLUvUxiHvs
	xdMjxIHOG77Mt3E2fSLjue3BLLjOW848xDxC/ApgYGNzekq9IRgzsvZFuT2Gb5lJ
	gvN0iOgjVMg434tEwukrISyIFDKKk/3Gac9h+KQEtA2QHCAC3+FjUJCeqhXMjffX
	vMLHYg/XKbhFrJkG6o1aK11YEMDCWpbFLFXLxgK+h7rVw+SEym+T9y2Nc27b5IUD
	OhSLv43vlLTufrTYUvKyNwuGnV65S9B+ET8cz2g3/LZ/E+Z64wGzEQdjCFkhZLY1
	tGL6LNBo3a3AU6X2fvkc4Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1b0xs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788567311; bh=mxqiVBgcN3PKaVJkG7Ny7yYlxzVRfdCFn8q5L4Y1gEs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Y+wZmZc/yVMNUKrZC5sfb8Iujfi/CLxUgVQxSRi/uHrwzelDwMvUCoRSu3zcbeZCB
	 PUTYwBWpvvOY3aw2lTi8b5BsXZRaBAyB51tdfAAcblY+BwXh2oc5sKOBPNHChJn5mu
	 nReN4eYKmROJnKmIY7pcYrjDmrFNhVU2OAzsmopFmaiDjvWUfDuJ7COw7shN3PsTYY
	 pRmpHwW8ZqvQxrFPEjAYW95QXG0wox+iNePhgu2suAsBGsDnQdaLQjHKwicz3LauKx
	 ZrHHH/1gjzmP1f+h++3V6mI5veHk6Qe9WVJUZ2A8HOFbL8+b3UeJz41j9tPFn9CtvU
	 5qTKBm5kykH6Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 46C80401B7;
	Sat,  5 Sep 2026 00:15:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F2EA6A033D;
	Sat,  5 Sep 2026 00:15:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fkwdv2q7;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 522534011E;
	Sat,  5 Sep 2026 00:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUOL6v9H7jcjUaKYYxOiKs/a2vhOqW620tC30tIzT9rhYObei5bvLb/OXp3O9mlhVAk0NjVjKqeTZctTxD6nMFsrHGqJl73vTBN+MCM82LRnqIEl4A+4+4kCqni9xMIEOWm0H/ZUxe2E4zh1JLVJUcZBKJpnzkFhwEPiiPUUFB8WCxXQwfxUC4kjVcBOYDuryJ6IFc5FevSSTLMA9uSMBIBOONiLy6n8Q6Qun80IpauKCP8xpKbtRjBZMCT43CD6RjC8sT/R4AVMnI5C++6bjjSoiAOD2jaXc86ALcWrCZA56Cb6YNyYvYzW2NXDKaSZEGha5ucpf7zv6Wpdz+4ATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxqiVBgcN3PKaVJkG7Ny7yYlxzVRfdCFn8q5L4Y1gEs=;
 b=aGANi4SOp+es7y7pnphB76RUCeUNR1ES5t9qTBFZWG8HJioDKAnfQxWX5JX1TJ0fZsF4Qo5yt6ytrrSDmPbE7zVepgJ+fQzmqDYP5XzKKcJv4vtWqX2tr+3GzkixWSOm/SZQGtQZLhdBoYBE/jH4gIpVF7u+lIlacFGgun9RI/jEd4FjSxK14brqr/V11usHAIuefrXY3EWEfa/GQ/UDbwNmJHiFxvuXWmPJW3/TDBikmzYY0pqA2NzYIUUWr4cUYPCx5HattqAe9EEeKiq1ltCFk8YW6k+SgEa0eO3XSpS5N0OKFhbexYg+RBqiX6Jtww6hd0+VXW0Ut3ufbarqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxqiVBgcN3PKaVJkG7Ny7yYlxzVRfdCFn8q5L4Y1gEs=;
 b=fkwdv2q7EX5+fMkjrlktWwuJJ4P6Zfn1MWp2DxZH7PzYccNhpXO8oyWdEv7BjtMdW8qYBGolPNz92rwCKOfbn8lLwAqRGwn9p02lHL8d5DeUX85ohmJq3Xfyc7C+821xCgj66s1j9/mQA+pOQfwr+rC1u0Vdx4ZrF5+9kvLIsu4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 00:15:06 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:15:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Saranya R <saranya.r@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Fix spurious suspend event during HS
 link training
Thread-Topic: [PATCH] usb: dwc3: gadget: Fix spurious suspend event during HS
 link training
Thread-Index: AQHdO5TEk0RH6F6XwkGhCu0pIITQbra/IAkA
Date: Sat, 5 Sep 2026 00:15:04 +0000
Message-ID: <aptd3QkiW51rdJug@vbox>
References: <20260903110947.2761354-1-saranya.r@oss.qualcomm.com>
In-Reply-To: <20260903110947.2761354-1-saranya.r@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB7632:EE_
x-ms-office365-filtering-correlation-id: 16df9117-daf4-4ee5-8230-08df0ae2bc57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|10067099003|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 BCPyoJTG/QnUW4blzDDA7+fCiXRas2EvuSDGH1DsgGvy/P1Xf74pWfAyCgXalYJmkiB0n06KJ96iyknbuvkHUCuzoWA0qgVJVpm6B2RVF0NtPBoLgmFx7Dl8aLZd9lVBDh+J4Wuo0zEPC/omjarU/+tL5ifKnXsF6LPG5TSJ7dkyMT6gYYiOjRgsJY5QswIKoHYAfBBqvdB/4qxgPXLGQ2+t9xed4kP4JbwInF6OcErB3l+68hdxKDu2Aw7xm4r1Ryz8O7G3bLOR11lHq0bNA2r6+ji7OxL9Qh+fwD031Zhume1QII/tF6WvPoM34P+iWuHG7MX6dqmdH8qrYh9JkWnLCzPi71t+SlzYOlgI0ECdfyjKZrgudc0DiorL2UP6n19/WGT4sGUEaI2boh3o9HbTbpGeFsotfG98QVlmSyxJ0jYb8UaJ7JBEoRhpSV9xjP1X8nQy1DlsJ2Evxi4safs59yoXfDFlhyh5LqYhjFgCxty1TgsXnGcdjhQf8XdmLSJPK9RV5xVBeDD8eZjvwD9sr6Qe6ZTC9PBzktrjlsCHzOhWGUOLG2zoNOsIiwlC3vjYHEc3BhZUGGeDDhCrF4oxqBfIKAQCnwwUnbhbHyDPFiVJbGlcMMWcoX3dBRfFpNra5DMGciM2a/yzM80FiMUsf5o+Ahidbi6IUuUPrQXc9nFkk2gT/ak23OHEciYUU//7AqjfCLWy79/OCx2LtrWSHSvoAewU8Vfjv+4WoY0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmsrM0pXdnRldWJVOGJ3MXNQa3pybjVtL0RBeElJcVhRZFd1dGM0OHJOSXdZ?=
 =?utf-8?B?VnRUbTVscU41MkdMdkUycmMzYlduR1lwU2UyT1ArbmxTTmFhRWlDLzIzZVlp?=
 =?utf-8?B?aWo4Mk1tZ2N5YlVwU0J3N1RuczRkOUxLOVBOdldHNUx1UEFVTTNEOTkxK1VZ?=
 =?utf-8?B?U0dvcjhHa0VxM3ZzMjhxenV6MnhVOUQ0TFprTGM5bXR2MU80QkNvbDNRQmE4?=
 =?utf-8?B?UUVSYkhzVEozYmthdUlaQUxDOTFUS09RbWhaT1R5MEtxRWRuVHMvVWltOVlL?=
 =?utf-8?B?SnpmNGZWUFhQNHFZN2wzYllmTSt3K2VGT1pVTGRMcnpEb1hHRmF4amYxbFZZ?=
 =?utf-8?B?ay9aVTgzUWRRcG1CT281RU1Bdk10dG9XSjRUTlRTL2tDMXlLd082S2liR3A3?=
 =?utf-8?B?MzQyRW1GZGpSQXdtelM1b3pIWjV3bFQ1K1liSGs0WW01cjZQUWRKN3NraWJo?=
 =?utf-8?B?OTl1OFR1MmdzQ1BZQXFLeHhsc2hJdFVKcFhQYmZIdDNNSllTT1dxTEVvYW9C?=
 =?utf-8?B?dStaaHFiNkVjSUJnaHZxaFloQnZBMGRFQU9xVy95bGY5eWdqVDBXaFpZbWdB?=
 =?utf-8?B?NUgybFo3TTQzc0RkOVp6NlNqdnZnajNTVDkxR2lHNGJCcFZlaDNoNTB3QVBI?=
 =?utf-8?B?R01uL2dPYVlUU3ZBMW5ERFZiVFc5OThmLzZ0cWZSYzdBc0liR0N4NnpIV003?=
 =?utf-8?B?RnUrQW9PTlVxUUFpb25RdjBtelEySFM5cGtOczFHb0phbUdiRk5ZTnNBbk96?=
 =?utf-8?B?RnUwZFRGbWtsT2xLdkViOStjL2Q3SjhyekYwb044R28zOGRlMGtIOG13cDR1?=
 =?utf-8?B?ZVR4VWNCcC9jOG1qdTdYY1hiRWhKRnJOOW5BQWJkTENWU1NuNi9ndU5Wb3hD?=
 =?utf-8?B?ZHZ0c2IxeWEyK0wrdEFSV2ViQzhMbW5VUDNCNnJwamdMR20xTm9UUGhWeS9W?=
 =?utf-8?B?TXlxK2E2ZTZteGwrb1VyME5WRmFweXZPUlZ1ZmRWc1NoQ3pVR3RhV2pxcHZP?=
 =?utf-8?B?TTJQZWc1cFNJM3ErcnAwQ1Y5LzNqbldMWk9TME8yRmVSeWVKdGsxWGt3bXBq?=
 =?utf-8?B?WlBHQldyYlhXTDdFWEtQMHhuUnR0amUrZWpQM0M4YWJBQkJRelJuZ253M2xG?=
 =?utf-8?B?amNyN1RkdUdrcVdZQTNLWU5EbzFLaWM5c3RDTks5VXJlRmtIanpzZUJGTEQ1?=
 =?utf-8?B?Z0pyeGdEOVhwTnF6RHQ3UmhiVGpDT3VWSXZ6UXdmUjF2VnhJcDR4SzBScEFa?=
 =?utf-8?B?eUpBZWRIQVRUdUEwNVlPWEhiRVV4VjFtNFNHRjdkNDB3RG0yclJhUmI0YmM0?=
 =?utf-8?B?dy8wV01jbVdOWGJ3QmtPdFJ1a2Z0VkdFTGZ0bmZBOTVpWUNJaWlQRCtScm1S?=
 =?utf-8?B?c2Zkdm5kaHRsUU9kVHQ3NExTUUxOMTZFeXNkZHVLeXVGbkpRc1J3aXhTVzFw?=
 =?utf-8?B?dkRsQTZ6L0hmbm0xY296dldaZEttNnVnS29zZjVZb2FxckJKdmsvRzM2cjkz?=
 =?utf-8?B?bXoyYVVQU2JmekVER2t4VUJqS0xtTTlyZ0dmYjF4eHZjbGdpYTJFN21GQXVZ?=
 =?utf-8?B?ZjEydDBTZ3RlRjI0QWFHc1ZOcjZhZXNjOHd1K0FpRGpVL2oyWGhYUGtGbzBN?=
 =?utf-8?B?SXNYUUlWTW01YktIZ2NQRldSUXNGMVVLQnk4bjIvRHRJcjNKaWFVdmJKTjhK?=
 =?utf-8?B?aG5IVjN1ZjhyWmR2bTlFVklLTVh3UmFDcDZ2QVRCamhHZUhRSkphd0JsdjBy?=
 =?utf-8?B?emJsaTArVjNZV2hZbHN0eFVrMTNZNGR1OFQyZjdLSngxOTVYYnZtOFNNejg4?=
 =?utf-8?B?UjhHVUJ5QXRTd3MyQkU1Zm9QcTVkSDBTcWl3NTMxcXY4clo0WmU5bkZ2Mkxl?=
 =?utf-8?B?bjZYNlRCRmdDMklqbi9FWGFsSDVGNll0YUJENHc0Vmd2OUtaUFl6VEJyMHV3?=
 =?utf-8?B?bHVEbnROVGRRK1BnZjBzOXgrQnU4V0taaVRZRVlXVVhVdDBWTUhPT0pCdm9T?=
 =?utf-8?B?S0JPZEI1N1RiVVdFQmsxNkluZmNUWHQ2UUVBS0ZwRVgvVDA4UGJoaHdEK1RT?=
 =?utf-8?B?OG54b0ZRSnVRdEQyd24yUmJ0VTJJU1JxMVFpTXE1cUlwbTJlK2VHRS9kUUpp?=
 =?utf-8?B?SW9FbVRkWXo3VDJQM2M3cmdnK2QvbHRRdEU0ZlpQUmlRMVU1eE9sZTZjSVh3?=
 =?utf-8?B?c2wzNHVuTlhhZHNwZVZGNHZrc3J1ZUsrMkdXbTcyanp5cVV4MllvVWUrV2U5?=
 =?utf-8?B?a0xQN1d6ZnluaFpvVGVCL21EdHNZa0E4N3k0dnB1YmI3U2wwWUlOeWdJU3FD?=
 =?utf-8?B?QkxmUGJLNUVxclFsYnBpcGc4ZW5kMjJPMXRRSmVtWE5ZdGY5bXdiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C8D5486255BEE48AE532BC4185FE90D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TC6bRoNwbGRI7fekM30hZL1WXULz7GukYVs+/DgaP1S+o9RjqVPamXsnrL7DiZcVbyd1jEn6guoKRDQ/ratkzavC1uPSCSmcelJjGGQsly4cbpHwIcGbVr6pxfRc9CsogSwtxsiubMcS4WscRdsxsY9DPYuUTDIuCMnZpphIoi1wIkuJ1JyzHfnSGkEHPyErw/yYJ0l4OfOm/87QIFDEsB24fv3angNetpqDt3Ow+cNGEDUSSS6tqeYhidDv+3yk/htQo76m+0bcTXgOibyw0NkFcjEov5ADO0YEcvWYsxGj95IUZvGUALwliiQqKfD/fCmOMua4LpQq/2k1XzrXLQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QcX8ubpwOvTJWxdVo28akNLgOD1+6EC182XBugh3TgmKpcGRaa+2mrzXKR5S5403ocqwu+NJS58BtGQLriZgWAoGah0UBAua2dBP0INmNv73oTokeEVlnzbu/gbkgcNrRUKOFUkz9DjftknhMAzYIWrGlGGsnCNJiGTw/1BnJGl7bmBC8LfCozjXVb8dqoxZsXp2yfr42NZOLMnQ+nmJwUUFob8ayY2Ox5lfF95Uk8qV0ivLBnTo2qWEy7saIcfU9tXwTVk/WfIY49qJxJQrpDlzsRObWPFnzla2zxHnKoQr7Ax8F3RZ5XmF+mpzB6Wnq8J33/3gLd74aKwwXySsILpwBVU6Ss0e8O9B15ZTP3hRIMvLish4NYqK6MgWjW+7MH8OiOAqcm1yaQ7zQCLSmUGvhKeHhlYQhEH9hKe5DWj3OUqrcLNAQ1yzTItJXUuFNJSqlDjtDHcFpmeD4elT+mhSlUzKVpwiruNA1o5jP9UAW5lSVz9hllaNPfSZwVeQdavaNk81COQPxVW4LVAo5mKEsQOQc2Mq0RAZPI3vyKAIA9VVdhtxOcNXbzx8nT+2bWrgbmjmA8TeEATGX4zr0wY6dtL7RuLPppIuF0QTSYnl7k1uebTTn1rzJuhe2rbbHuJr7tCkMKYB/Ha4KcuWgA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16df9117-daf4-4ee5-8230-08df0ae2bc57
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:15:04.8609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ve8fM7DIvWUK9Tt1YjSGR5ok02u9x9VglNIoApDWpvaNysx2dzzmdZXdGv8YRlFfbvAEEdqYnDM968kKLnB5rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
X-Proofpoint-ORIG-GUID: o0zd5tWFKSvWVsSop3pqL6jLhksNi7j2
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b5f10 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=DOypaSJddHch3ODEwdUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: o0zd5tWFKSvWVsSop3pqL6jLhksNi7j2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMCBTYWx0ZWRfXy/VSjySSL+si
 vT9Y94s/9B916uWkFts0MBYjifaQkTN2wH7JfRMlqAIqdMcEYttdATr0Vf+lgXAfrxbssKQE61Z
 n1VQEZW4PLUiL8R8llMvDYZ7Xw4ZgRg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMCBTYWx0ZWRfX8MCGhH04Jnhu
 ZUhkH0K1HIUnHiNCsD8k20QN0o8FN1FaUQCF00xFK20lRNoKJHlhlQ4V9cSXM1QQbKMo6RYYgTN
 nrD5riiNAc+cZ8PAEmxDvbItNKay56zZV1cnLMkvpRae/hxTV44aDQgUK22OSjZnn924EtQw05C
 HLff3g0nAyEOBcI69hBrmf6lHVpaOkL8puJq3/X0bPzVw7aS05yQFag7R9b4GDbr+VJZ04AFh8W
 4diVV9WdkJHsWfp9LH5yBlQzt6DoFCLwStMda5CQ0M78D2aAid/43jkmeCT4r1tYL8D6twy2lTj
 C1dTHRoZ2c6VGnZeb3XjuNXdT2VwwXiOsqLaudJmpK1YNaZz5jBuZ7fpu1qcL4rvIgBxuPG9Ug/
 ADVwKnGJFSKEeddv59paBp6oxBQWLPM/ClN0rh9th/FbbESoXBvaz7fcCW1+k1trDPgzUJuhK2a
 t5eJW3noHs2VbI15RfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050000

T24gVGh1LCBTZXAgMDMsIDIwMjYsIFNhcmFueWEgUiB3cm90ZToNCj4gRHVyaW5nIEhTIGxpbmsg
dHJhaW5pbmcsIGEgc3B1cmlvdXMgRFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORCBjYXJyeWluZw0K
PiBsaW5rIHN0YXRlIFUzIGlzIGZpcmVkIGJlZm9yZSBDT05ORUNUX0RPTkUgY29tcGxldGVzIGVu
dW1lcmF0aW9uLiBBdA0KPiB0aGlzIHBvaW50IGdhZGdldC0+c3BlZWQgaXMgVVNCX1NQRUVEX1VO
S05PV04gc2luY2UgQ09OTkVDVF9ET05FIGhhcw0KPiBub3QgeWV0IHJ1bi4gQ2FsbGluZyBkd2Mz
X2dhZGdldF9zdXNwZW5kX2ludGVycnVwdCgpIGhlcmUgdHJpZ2dlcnMgYW4NCj4gdW53YW50ZWQg
Y29tcG9zaXRlX3N1c3BlbmQsIGNhdXNpbmcgdGhlIGNoYXJnZXIgZnJhbWV3b3JrIHRvIGRyb3AN
Cj4gY3VycmVudCB0byAybUEgYW5kIHRoZW4gcmFtcCBiYWNrIHRvIDUwMG1BIG9uIGV2ZXJ5IFVT
QiBjb25uZWN0aW9uLg0KPiANCj4gRml4IHRoaXMgYnkgc2tpcHBpbmcgc3VzcGVuZCBldmVudCBw
cm9jZXNzaW5nIHdoZW4gZ2FkZ2V0LT5zcGVlZCBpcw0KPiBVU0JfU1BFRURfVU5LTk9XTi4gVGhp
cyBwcmVjaXNlbHkgdGFyZ2V0cyB0aGUgcHJlLWVudW1lcmF0aW9uIHdpbmRvdw0KPiB3aXRob3V0
IGFmZmVjdGluZyBnZW51aW5lIHN1c3BlbmQgZXZlbnRzOiBhIHJlYWwgc3VzcGVuZCBhdCBBRERS
RVNTDQo+IHN0YXRlIChyZXF1aXJlZCBmb3IgQkMxLjIgY29tcGxpYW5jZSkgb25seSBhcnJpdmVz
IGFmdGVyIENPTk5FQ1RfRE9ORQ0KPiBzZXRzIGdhZGdldC0+c3BlZWQgdG8gdGhlIG5lZ290aWF0
ZWQgc3BlZWQsIHNvIGdhZGdldC0+c3BlZWQgaXMgbm8NCj4gbG9uZ2VyIFVOS05PV04gYXQgdGhh
dCBwb2ludC4NCj4gDQo+IEZpeGVzOiA0ZGVjZjQwNjBlY2YgKCJ1c2I6IGR3YzM6IGdhZGdldDog
Q2hhbmdlIGNvbmRpdGlvbiBmb3IgcHJvY2Vzc2luZyBzdXNwZW5kIGV2ZW50IikNCg0KVGhpcyBp
cyBhIGhhcmR3YXJlIGlzc3VlLiBUaGUgY29tbWl0IHJlZmVyZW5jZWQgaW4gdGhlIEZpeGVzIHRh
ZyBpcw0KdW5yZWxhdGVkLiBZb3UgY2FuIGFkZCBhIENjIHN0YWJsZSBhbmQgaW5kaWNhdGUgaG93
IGZhciBiYWNrIHRoaXMgc2hvdWxkDQpiZSBiYWNrcG9ydGVkLCBidXQgSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgaGF2ZSB0aGUgZml4ZXMgdGFnIGhlcmUuDQoNClRoYW5rcywNClRoaW5oDQoNCj4g
U2lnbmVkLW9mZi1ieTogU2FyYW55YSBSIDxzYXJhbnlhLnJAb3NzLnF1YWxjb21tLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTQgKysrKysrKysrKysrLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+IGluZGV4IGJmYjIwYzNhYzM5Mi4uN2QwZDI0YjZjMDRkIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gQEAgLTQ0NjUsOCArNDQ2NSwxOCBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdl
dF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0Mz
X0RFVklDRV9FVkVOVF9TVVNQRU5EOg0KPiAgCQkvKiBJdCBjaGFuZ2VkIHRvIGJlIHN1c3BlbmQg
ZXZlbnQgZm9yIHZlcnNpb24gMi4zMGEgYW5kIGFib3ZlICovDQo+IC0JCWlmICghRFdDM19WRVJf
SVNfUFJJT1IoRFdDMywgMjMwQSkpDQo+IC0JCQlkd2MzX2dhZGdldF9zdXNwZW5kX2ludGVycnVw
dChkd2MsIGV2ZW50LT5ldmVudF9pbmZvKTsNCj4gKwkJaWYgKCFEV0MzX1ZFUl9JU19QUklPUihE
V0MzLCAyMzBBKSkgew0KPiArCQkJLyoNCj4gKwkJCSAqIEEgc3B1cmlvdXMgVTMgc3VzcGVuZCBl
dmVudCBpcyBmaXJlZCBkdXJpbmcgSFMgbGluaw0KPiArCQkJICogdHJhaW5pbmcgYmVmb3JlIENP
Tk5FQ1RfRE9ORSBzZXRzIHRoZSBnYWRnZXQgc3BlZWQuDQo+ICsJCQkgKiBJZ25vcmUgaXQgYXQg
dGhhdCBwb2ludCB0byBhdm9pZCB0cmlnZ2VyaW5nIGFuIHVud2FudGVkDQo+ICsJCQkgKiBjb21w
b3NpdGVfc3VzcGVuZC4gQSBnZW51aW5lIHN1c3BlbmQgYXQgQUREUkVTUyBzdGF0ZQ0KPiArCQkJ
ICogKHJlcXVpcmVkIGZvciBCQzEuMiBjb21wbGlhbmNlKSBvbmx5IGFycml2ZXMgYWZ0ZXINCj4g
KwkJCSAqIENPTk5FQ1RfRE9ORSwgc28gZ2FkZ2V0LT5zcGVlZCBpcyBubyBsb25nZXIgVU5LTk9X
TiB0aGVuLg0KPiArCQkJICovDQo+ICsJCQlpZiAoZHdjLT5nYWRnZXQtPnNwZWVkICE9IFVTQl9T
UEVFRF9VTktOT1dOKQ0KPiArCQkJCWR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KGR3Yywg
ZXZlbnQtPmV2ZW50X2luZm8pOw0KPiArCQl9DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFdDM19E
RVZJQ0VfRVZFTlRfU09GOg0KPiAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfRVJSQVRJQ19FUlJP
UjoNCj4gLS0gDQo+IDIuMzQuMQ0KPiA=
