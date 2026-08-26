Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E187D175A6D;
	Wed, 26 Aug 2026 00:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787703780; cv=fail; b=qcu+QwxGqNoSZz/l7ZoDHhZPpOy7WSarMijiepAR+qGaTtt0rx+azpyRQb7iBPE+De0JWxIJfaqwka39QFCFi/JBERxPovfRfKDJZoedZ2gSo56L5NKkQ+VQXhAwVklcDTCV6RqbVgb76j3o11c+KacKmbUxPMeVadeA/xezWFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787703780; c=relaxed/simple;
	bh=75k9Vouwa9ZaHnLwzc8Av6tKU5PDm3pM/TTgPYsuKjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R3y/H+qN098P7Bt/RdtNY01LxgJj3epshhcKDcX2Ent2DIwsyH+7xdGhv5uzt0BADEmFB5p+d6fom+nDNCJXUO4F39ktsz5u01dsIO5O7+1eFA/OHOiop8hsd22Lkh/iGY8Q3RgMDRQhNTBsMBAbnba+huaFioAL6UIB7bn/FuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZsLwoHY+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RyTCOZi3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mpIfH5k8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZsLwoHY+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RyTCOZi3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mpIfH5k8"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09Xsa1005104;
	Tue, 25 Aug 2026 17:22:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=75k9Vouwa9ZaHnLwzc8Av6tKU5PDm3pM/TTgPYsuKjc=; b=
	ZsLwoHY+TSCE4vVS4FNSRsmUMw4iBmzZv5dZq1VFSuyANRLl0ttlId3oQDvdNm04
	CchWa4d7akc/p53Pv3gn2ajKtASruDl+q14h/rV0Rn9jTBPiLqrBW04tFh5/FrIL
	+7zw5cuThZ4qtRWrPVQWbJXEPo6W2+T39fNS5//rtE0ivsEyhBpaaKOIt2PtTLl3
	0B6ctqyW9lVVt7NvxGWV0AlYXfRM9rTuAaP7NI5Pzp6CMtAF02UV0korXo6PlNhp
	qq399tk/hlXlAzy8kOT/HVXBVvK3CizjrauKvmptOoZ5xrwZua3vMD89GY8vFVAF
	3hu7tazbqm/k2SQfsuDXVg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9j5m9c0q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787703770; bh=75k9Vouwa9ZaHnLwzc8Av6tKU5PDm3pM/TTgPYsuKjc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RyTCOZi3sU9mq2XKwu+uhtBn3YMQIUqtB0luJMnsxlA/+aeuoR1AV2TjFkt1MksAg
	 HCUrLtLT9JG/DZRJtTKIMkwiqjf3siU473uitJdthJZ6cMPQvwzx3pFm85h6aGRKZe
	 c7tEe9LxmRfFFWRPwp+JCruxb1z4yrIY3Bo2ndGKRgjSqEhF/is0fhovWQoQGRy3ea
	 vhkzHZnT362Mi8mEFH0CE45e+JEMRHk62SUvjYMI71PkAQKsHf3R/Na7kRHDHjjC64
	 vztQRpFwuQfKmgg+1xcij77GcJVXqrR1mlU8eAeMdn+RdNMhgkL/uujgm9neTQ7zxI
	 aTPMdz3b0/xyQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 043484011C;
	Wed, 26 Aug 2026 00:22:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 84D3EA0070;
	Wed, 26 Aug 2026 00:22:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=mpIfH5k8;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00303.outbound.protection.outlook.com [40.93.12.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C6BF922038B;
	Wed, 26 Aug 2026 00:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7hYGX5c82ah2QGhOPhAeIEsCj8jnwhI/zMgeuYfo9a/x81pFYp2ow6eMUqwH6+hnEC5wyUhJKBQSRIiRjcCLQT20kLiNKfR9J9e/U+KNvg6uKcQIi/3ibBLWBJ6Nqdu6loufnsANgkRmmbc+q1kykQll1JLKGPQhcgE+C9p+zU0XhGsG1+nWJdiz4Co4ltcV3HKibWHE5sAi1LLaWadxfFV+4VdKnTxazdJfwuuFr+gTzkRhlNLd5U9mhpzmGgrKWwaZaMNNJP4rtY332ZUN0OIBWEIM1EA1Ija0ZiIrfUGdJ1DnVDtt7GUGv+ZQGMx3wQmuCdbHaimQ0z6B4AD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75k9Vouwa9ZaHnLwzc8Av6tKU5PDm3pM/TTgPYsuKjc=;
 b=beAAqcg0JAw8OVjiro6XxBJbd/klaoj+kT4C1AuGnl7jdjSdkTCsLg19uggjszYYau4VieguyL6V7OWRL1/gi1b3qRW6iYDKCPDmCDIN3rMMHjBwyor6KEp4yihD3pxucLdnYWEiBs/uAy8gxJf885ZvoWkaQpy77jxhGt4MUBP25B0oz6TkBjY7WTUQslKsZjpJCSFT+dQ39zGJXbhdbpboQPi/SjurC6dywu0oexgvNmGqWrZubHsn4lEpcMHAbiMub1TnalHvVA21K6GzKaV1kBkYe2Vt4bpCAvNwV8FKf9A8I5140mmy9iGMT9C9wT2JZamQMLVs8DZ+glPufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75k9Vouwa9ZaHnLwzc8Av6tKU5PDm3pM/TTgPYsuKjc=;
 b=mpIfH5k8EG8VH4/e36nLieXoik+YrcADnIa6HKeGDV1m0ZSs0kueGNeKPZNah1PVJ50Yq8jRivErcreXnohXdtQHkOO/jn6BFlsxDHzGZtAH0cwSIbz+pxuBpTQCEXLuEOz1toix5+oYgiLtkq/EqSJ6vlmnT9pCtN3g9ammQFc=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 00:22:39 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:22:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 0/5] usb: dwc3: xilinx: error handling and teardown fixes
Thread-Topic: [PATCH 0/5] usb: dwc3: xilinx: error handling and teardown fixes
Thread-Index: AQHdKPBoILnQeRvZF0WogbIeccklKLavkB2A
Date: Wed, 26 Aug 2026 00:22:38 +0000
Message-ID: <ao4xQgvplTIFQk7K@vbox>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|LV9PR12MB9832:EE_
x-ms-office365-filtering-correlation-id: 58fbc369-644e-47ac-b856-08df030822e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 z/nrUfOwSp7gz5icY9wBTXZzCqNr0vTMUo9wS3wT8DYSCwbBNnktB2DES1gW0whD52lFlpPwuG4u2DgviUgk+deU/QynvN0BJAAjhiv1vg2R7fVyTy9YSWrrWT9NoG7btEwR6w7E/PXMFfVBtuYgZGOn0qr4K2ZULNgEgqm76QTozNNa8MjnPG5M7Nyfe9yjorkOraQt+rdStSGoKCkGGNiEx+PsBtKw+9WjR16WVO7ukSPjwdK3optYFoB9wiBgmgrVLD8ish93SVWFGW0HkGvhIOxngtkbZvTuf4+TYEq0kP0m7ztl/n+qlwAyWq2ykh1kXfbKTZXFLntjt2+rt7cS+HGJXGOGD37ECz6a1xVbcwFVJgBCKUOjiSojz/jYBU3JtXeUe+4dn9tEgboMItHJs++j/0QDqGCXrbKjDbJpcx1xfZqyTTaIkeutvCZIvc+WuahBKGWjuA1cIXvs91AdVySq452UBBkGYE7UrdG/LWzNrXKZqP2eNEhLP8qOK4TnEhqau07RIKlb8ySmuATxnBmBSVKmuke7igtdaL1uCgI7/DKzcyO16gXfmL+4M8UrzxukElfh0315nJ8LKTJVqxG93lirJgzG36vozzHVXajKhl5pCPKZUURh+/Thej2BeyxhpCGyd0w4Js2fVHrt6ecMU0vL+eTbp0fspGfP/FeIJDyWp2dV2wfK8iqV93itTXUr9UglBl+VG0Gn+OmvDEP2fw5ZkJXicocqhWs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWNYdzFoSXpMc3R2amFRcjZZKzVnQkF4VWRWSk1zVzUxYTh2ektobkxuT1ZO?=
 =?utf-8?B?b3cyMWxQVlNCNGNIVnhtWlQzeG96UTg3aDFJSVhVb3B4WTIrZExIMWtsd043?=
 =?utf-8?B?RnI2NmpIM1Uya3g3cEJ1Z2dWS3hqY1Z3aGdFamIwbGxxWE50WTdaSmJyY3Fo?=
 =?utf-8?B?bzkwSzRkM0dsMjQxU2tnaXpuTDlVTHBnazBmY3R5OFlsUS9Sang3alZ4SEpH?=
 =?utf-8?B?bUZLd3BpQVFRQkN3dkxDK1oxQ0JaTVQ1L2JidUF5eCs2dGZGbjlKeWlwbXNG?=
 =?utf-8?B?KzBRR09IMGJEYllldTZDOGViOEV6eGtEY0xPY0pBS0srLzJXVE9aZWlIYUsy?=
 =?utf-8?B?SjlwWUJPVW1YeU1zZ01hek43emVZME10K0xXOHNoRHk1a3dFVmk1a0pBdTh2?=
 =?utf-8?B?Vm00UHR5cmhHT0ZBZW9POFA4MDl6Yk1HaVlVVG5jUEg0RTdDcm82RUduREc2?=
 =?utf-8?B?S1h4TTQ4UUliRmthb2Z4TFZtYXd2Ry9ObHdPZTdtekJNWHlBNVd5eGJhbVFP?=
 =?utf-8?B?anM0TnJEVENEcUtRdDRQcWpCZ2VoUWF4UVRxUGU3UlNndU9MOXBwSUJlcXpJ?=
 =?utf-8?B?aXBGR0djQW5QbFZBaHkxYVRFWWJCaVhyNmlJUUpPTzVPcEFLTXU5aUQrT0pW?=
 =?utf-8?B?ejhBN2MxeHNlNkFROEtZV1Vjdm5SMms0eTJNeEcrRVRwNXRnL3ZKV05ickNE?=
 =?utf-8?B?Z1hpWExHa09BL3JXSkpVbHJCOWJUWnpnMnlpcE1OVklnMnFZTktSWWUrYWNL?=
 =?utf-8?B?WlNmNG5XcmZ5M0tZSGE0dXc0aG5rL3A3aEFJTzc0TnVOQXUxMXpidlhNT1Fv?=
 =?utf-8?B?M2c2MTk1QkNPbndoZVExRUM4bVo2QWpwbVhEZnd4dlpoeFQ2RU1lcXY2aWpn?=
 =?utf-8?B?ZkU5Z2ZFb3BISEZUNzFxTGkwZjYrZHYrdjM1NFpXaTc3NE9FNE12VU5JOGtj?=
 =?utf-8?B?ZW5obzRRVXFKNFJEWS82Y3FHTWx5ajFRK01xbElLSnRTeE9lQnlYMXorSTF3?=
 =?utf-8?B?MXhueFlWNGp2aFFMSlg3M2p2QlFoZmtKSjNkajhCR3FJWEhaZE14ZWkrSXJj?=
 =?utf-8?B?T3FsN0gwZGtYUnk4RDQ0WStMWjZwM2NtVzQyU3ZUQ2Q1TUxTR01HMVJ0a2xL?=
 =?utf-8?B?Q3Z5T0RNWEdld1ZJbFB3VHVVUGNWVUVrTDBwMmNtSUtCK3BtczFhMmRHa05y?=
 =?utf-8?B?NzZsNzJRSkwrd2hhK3ZZcG9RTzk1Q0RQUk1DQkFscjRBMXBvNnhpSGg3Qjh4?=
 =?utf-8?B?Sk5WckFXclRuY0YreDBoQ0Y4eEpDY2VwWEhzM1A5YkZMSWp2dGV1RS9aUDc4?=
 =?utf-8?B?Y00rb0ZJOVYwcXBUOWZuVHFmSnp6TDBoZnVuNUJUa2hOaFUxU1dzaTc2aTJ6?=
 =?utf-8?B?Y0xXcnVxTVp0ZUdkUGsrT1p2NUtzWE1nVjk4dW0zVndZODRoaCtWbUN3TE1w?=
 =?utf-8?B?VmZjc0NKS2RBYWd4MGlJTXUrZ0N2TzQxWWlXOG1QTTlPUThIQlZ3cjhRRnJT?=
 =?utf-8?B?U0VrdExaUjBUWTIyMG1LL3JrSGg2N1lYYzdnT0xkdFdqNHBtZDRqNVdDMWh6?=
 =?utf-8?B?bGpLTUdwaFQ1UElNVjJrWFVmbENxT1JkZXduaXF2WTAzRkZxaVM4VGllNFVN?=
 =?utf-8?B?OG1qL2tsVm8xQ1FJaURwY2VVdnVncnhkS0pDWDVGT2ZRN1hxelhvandxSVpZ?=
 =?utf-8?B?TkFpTXI2ZTFPbjZiVkJKUXljc1lQS2krd1lSNDBob0V3YlRYcGgwOTFIM1gr?=
 =?utf-8?B?WXRFdzRJYWNQS3lsODhWQktid3pjM0VDRXFzelYwWlZJanB5djdSZHdHNi8r?=
 =?utf-8?B?aGhmdk9CdllrNUJLYTUxYUZ5NHFSM1hQRnRFWmkxRWVxS1liS2pwMlV1Q3ND?=
 =?utf-8?B?OEkxRHowdW51d21MQUZSbXF0S0x6Y1F6Y1czZ0pKenpnYXRRK1ZhVzQwSHdz?=
 =?utf-8?B?U3N1RDY0SXpXY1Bab3dFVDJSSkhRVzlxWS9MQmpJMnU4czBZZXBRSnpZK0JH?=
 =?utf-8?B?NnE2UGdpdUlPSUxmTXZidFZHZU9HeElQaXFlQmY2UFlkRVpXRU9ZaWRiT1Bj?=
 =?utf-8?B?WVhEOHhIZEc2aUVGTU5Xa2RQVWVRb2NuUGQ4REdUTHRGOEtQNHBvc1NLU29I?=
 =?utf-8?B?emc4ckRQdGlDWUhtR2dEKy8zNHF2YlVSMkIyd3N1L2lxb24rRXNNT1UwZW9M?=
 =?utf-8?B?WnFqeHIxZTZib2orUzVaZDQ5K29BcmUrRXVhUWg4QnNqNW5idzBjVXQ1SVRO?=
 =?utf-8?B?L0twVERuWi80NTEzV2o2cmpLcWNlVGt2U3dDbS9vLzNneTFGRXV4blR3WFRV?=
 =?utf-8?B?TkVGUTVCZnNRcWtKM0tjamYxa1Z0aFhtZFVXZmQ1REFyRm5seFNlZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74838B5B6F7C654BA8D25E625ADD6B16@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	xGXxu6g1RS3k9wnmngtSZUHKrszdb1Roq5GwZAYgtraFF5U89K5TkKXT55OlkQ9SpLJrz8CPwFv+fAHdC0FPNQGZnCmEzp5OgzsCwrL0BpB1JSuES+umA/lx9wILCzLpldESrCbpsLWgX8BIsGhT4uJQleb1bzKEzo4wAcg3BSQCldc1z1mXo+cYoaJFL7B7DquA99loB72OXX+B+eMXWIbE2TbBSvAgRg1aJnf6MFaGog+x+7fPaVTI3VeDEF+E0voV+RrNRnzeLNB4vNvLX7OLn/NQ1Voj8q7xXxuC74JNGFXdQHy1Sw970LxN0CzL7zGwDvd2ihUAP7yu4GmZ+Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bshO3rOXa/i7ZMiDeKpxQl+I5VJdJtoWDT6p3OSoJumKs8xvBb1n7MOH6aKI0d6DcjIKClDOxrlZV+/J6ZXxGsHccs1+yQHz1B64oPmwd+iTklz+IW96TDzzUVbDlOrRqbHdrnXUHJG6/CqNbyFfNqBKG7/LeJZyuAyd/XWa07zLC3PXhHIqnwOux9VY71Husq+pB+uD94NWZ4PUO0Ud8LmRaDpLpA9vpYQ0CqYHDH6zp26rxBcTC1xcHKLuwUjCUQO0E0N7nZGvpITc7q4utmJcrgNNcEPdTnCLeB5i3AhyC4CRDuuzzrQ2agEDllYoQkD+jUK+9EaJafNWuwgDruvrwmCPFN00Ia/VYSR3wSsKhjJhwEwzlcPrFCv8UKhyawwXHwieqbbpUdIQbwDQx5ED1ppDvflpTKEnvnTJCnrOjjrdWyV8DJf9vZIheY1e7bIMZyoZkUfI4QyRk9gRDJeDN/JIZrXDwESMOJHnyjPNvEkD4t2g4jUSrAz/QP+OzaV/2m8z4pBeXJ1GZJZFTvlIIUAjHkdnI+Gtdv1JRNVoP7W7nVXepjNTveBwhEYUYcXDzwxgJnYnhVKufLLgJevMhMHWpaQ1jLoYte89NsVDZ5KbD2EqdrXKnQEGiW3m5gDtW7XeC47tQkpcyxfLVw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fbc369-644e-47ac-b856-08df030822e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:22:38.9367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAay5xZxDckklbEKXpn+BMDOQpWIn1TdECLtZgtcLF2wE+B9McSlprgH9F3l/UXbiLsHafIFTb8y+rmVbo8HZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
X-Proofpoint-ORIG-GUID: PfkW5zLh35qd4ucMhR06fQfpM65m5Rh8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAwMSBTYWx0ZWRfX6Q2B0ZLxhmZ2
 N2zynG1pGJdPOj/T76Y2HB37AldQyR06Mtbx6DaEzFkdRQWTD1zqVsHuYS6OsruCv5+7dOVMB8k
 KaDFZT6G+hNrCcmAiTZb0mzBOL1px9Y=
X-Proofpoint-GUID: PfkW5zLh35qd4ucMhR06fQfpM65m5Rh8
X-Authority-Analysis: v=2.4 cv=BpetB4X5 c=1 sm=1 tr=0 ts=6a8e31db cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=dFXFiUOIJlol7g4SmGEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAwMSBTYWx0ZWRfX5BgHSpv5PibZ
 Une8TQthMyaYLRq6lHJZ5yWKfj7HmUpSXAnz0kPM02NlIFgpGXQwjOZaChUxhHxzeRuviRkZvSR
 XoL4OEljSH3D0QoQuy682tSvYtd6Rnz1GGsgTcCMEot84SCa2z9TXz1Fjp+E1xFml2eTljOAuhn
 FNNEOJVo5Y5aUHEGPCU6g3y1nOxq1hyBzDk2CzNnamaPeYkDTlH1UJE1zx+sZhQRCJ9ll1G3mMY
 Y3le7oDYnVX9wNEQe42RAqTMvlAFCfKgofucyzxKizsDAtgDYSQGsZhvJFwNZsSeJ7HEJWsoKo6
 4K/KQ6VvOpt564o9YWWABxcwnx1hJ39qn2+rkOvTo1LdZT3fsh+QsaG1tUOtL+Yb+yPfrylwl8+
 vxS+rkQtFJAiXCqscgxrH/BEWOSG5Y4zfIbmRNUdRj0y0LeWuAzUR0NM6/6ZgIr+oVzEAfQ5A92
 /dnq5S5phECBbghUXAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608260001

T24gTW9uLCBBdWcgMTAsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFRoaXMg
c2VyaWVzIGltcHJvdmVzIGVycm9yIGhhbmRsaW5nLCByZXNvdXJjZSB0ZWFyZG93biwgYW5kIHN5
c3RlbSBzbGVlcA0KPiBQTSByb2J1c3RuZXNzIGluIHRoZSBkd2MzLXhpbGlueCBnbHVlIGRyaXZl
ciBmb3IgWnlucU1QIGFuZCBWZXJzYWwNCj4gcGxhdGZvcm1zLg0KPiANCj4gUGF0Y2ggMSBzd2l0
Y2hlcyBwcm9iZSB0byBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBhbmQgYWRkcyB0aGUgZGlyZWN0
DQo+IHByb3BlcnR5LmggaW5jbHVkZSBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gb2YuaCBmb3IgdGhh
dCBoZWxwZXIuDQo+IA0KPiBQYXRjaCAyIGludHJvZHVjZXMgc3RydWN0IGR3YzNfeGxueF9wbGF0
ZGF0YSBhbmQgbW92ZXMgWnlucU1QIGFuZA0KPiBWZXJzYWwgc2V0dXAgYmVoaW5kIHBsYXQtPmlu
aXQoKS4gVGhlIHN0cnVjdCBhbHNvIGRlZmluZXMgYW4gZXhpdA0KPiBjYWxsYmFjayBzbG90IHVz
ZWQgYnkgdGhlIGxhdGVyIHRlYXJkb3duIHBhdGNoZXMuDQo+IA0KPiBQYXRjaCAzIGZpeGVzIHN5
c3RlbSBzdXNwZW5kIGFuZCByZXN1bWUgUEhZIGhhbmRsaW5nOiBzdXNwZW5kIG5vdw0KPiBwb3dl
cnMgb2ZmIHRoZSBQSFkgYmVmb3JlIHBoeV9leGl0KCkgYW5kIHByb3BhZ2F0ZXMgZXJyb3JzOyBy
ZXN1bWUNCj4gZGlzYWJsZXMgY2xvY2tzIGlmIFBIWSByZWluaXRpYWxpemF0aW9uIGZhaWxzIGFm
dGVyIHRoZXkgd2VyZSBlbmFibGVkLg0KPiANCj4gUGF0Y2ggNCBmaXhlcyBaeW5xTVAgaW5pdCBl
cnJvciBwYXRocy4gUmVzZXQgaGFuZGxlcyBhcmUgc2F2ZWQgaW4NCj4gZHJpdmVyIHByaXZhdGUg
ZGF0YSBhbmQgZmFsbC10aHJvdWdoIGVycm9yIGxhYmVscyByZS1hc3NlcnQgb25seSB0aGUNCj4g
cmVzZXRzIGFscmVhZHkgcmVsZWFzZWQgYmVmb3JlIHVud2luZGluZyB0aGUgUEhZIHdoZW4gaW5p
dCBmYWlscw0KPiBwYXJ0d2F5IHRocm91Z2ggcmVzZXQgZGVhc3NlcnQgb3IgUEhZIHNldHVwLg0K
PiANCj4gUGF0Y2ggNSBhZGRzIGR3YzNfeGxueF9leGl0X3p5bnFtcCgpLCB3aXJlcyBpdCBhcyB0
aGUgWnlucU1QIHBsYXRmb3JtDQo+IGV4aXQgY2FsbGJhY2ssIGFuZCBjYWxscyBwbGF0LT5leGl0
KCkgZnJvbSBwcm9iZSBlcnJvciBwYXRocyBhZnRlciBhDQo+IHN1Y2Nlc3NmdWwgcGxhdC0+aW5p
dCgpIGFuZCBmcm9tIHJlbW92ZSgpL3NodXRkb3duLg0KPiANCj4gUmFkaGV5IFNoeWFtIFBhbmRl
eSAoNSk6DQo+ICAgdXNiOiBkd2MzOiB4aWxpbng6IHVzZSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEo
KSBpbiBwcm9iZQ0KPiAgIHVzYjogZHdjMzogeGlsaW54OiBhZGQgcGxhdGZvcm0gZGF0YSBzdHJ1
Y3Qgd2l0aCBpbml0IGNhbGxiYWNrDQo+ICAgdXNiOiBkd2MzOiB4aWxpbng6IGZpeCBzeXN0ZW0g
c3VzcGVuZCBhbmQgcmVzdW1lIFBIWSBoYW5kbGluZw0KPiAgIHVzYjogZHdjMzogeGlsaW54OiBy
ZS1hc3NlcnQgcmVzZXRzIG9uIFp5bnFNUCBpbml0IGVycm9yIHBhdGhzDQo+ICAgdXNiOiBkd2Mz
OiB4aWxpbng6IHVud2luZCBaeW5xTVAgcGxhdGZvcm0gaW5pdCBvbiBwcm9iZSBmYWlsdXJlIGFu
ZA0KPiAgICAgcmVtb3ZlDQo+IA0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwg
MTMyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEwMCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1p
dDogNmI4YzhhZjUxNGQ3MzlkMDMzNWY1NTc5YjU4NWUwMmJhYmU4YTcyNw0KPiAtLSANCj4gMi40
My4wDQo+IA0KDQpUaGVzZSBwYXRjaGVzIGxvb2sgZ29vZCB0byBtZSwgZG8geW91IHBsYW4gdG8g
YmFja3BvcnQgdGhlIGZpeGVzPyBJZiBzbywNCmNhbiB5b3UgQ2Mgc3RhYmxlIGFuZCByZS1vcmRl
ciB0aGVtIHNvIHRoYXQgdGhlIGZpeGVzIHBhdGNoZXMgZ28gZmlyc3Q/DQpCZXR0ZXIgeWV0LCBr
ZWVwIHRoZSBmaXhlcyBhbmQgbmV3IGNoYW5nZXMgaW4gc2VwYXJhdGUgc2VyaWVzLg0KDQpUaGFu
a3MsDQpUaGluaA==
