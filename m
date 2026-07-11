Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEB175A68;
	Sat, 11 Jul 2026 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783731063; cv=fail; b=lE1RyZjMg5wbeXzIkJ32TLsxd912BRwRs2wt3Kx6GjWsEG93t+8cGNnLpQhSQ5gI73STYSpjjPx+PDjl7Bjc8fguU128TQdWIl6hNbZ/yk2VrE8+NO0gwIx130nA+MIN9n7oKeh0xVBPnR4jxVEtvADLV3rbTWFXHOceH6QFSmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783731063; c=relaxed/simple;
	bh=0rVadhl7kBcvqUjvNxuWg25BRXRfHQY3Te9nAH4a4tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HnUDVWJGOkM/dkCioVHhO4QE21qPbEYBLMf+e+oV0Kx8JruTRJTvNVlGFt5kW0jFnqnccuK4Hp87EIqVSc9mJ2Kb7w8R/MSb4hidgijhc/yhvgmo4XkMNfgzuhdmp2YVJWE1tbRKrA3xZPHUL+bfxz0adpo2Yd3G4cfvOb7MYdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UkS413NQ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d3KSm34g; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ved0qP1w reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UkS413NQ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d3KSm34g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ved0qP1w"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ANHuXJ1918394;
	Fri, 10 Jul 2026 17:50:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0rVadhl7kBcvqUjvNxuWg25BRXRfHQY3Te9nAH4a4tA=; b=
	UkS413NQE/aowgBl/+CmqxZBfdgnvD7bQ/JsaE/19swdCO2b+NBOw0nPClYS8pL+
	Cvz7POWjOaunHWEnOcuwzev2mtqZNI/gw3aO4+OOQpvue1qj3nlfhrP84AbibtRo
	MJgTIQ7Mgm3O7yX190adTF/GtFcY1mDR3lQmgtQlgUVPib1cm92Idqey7b8ZcVEZ
	pgDEaxZWdkYw98JLff+pZFop7s1tD9ABvtyBt9vgqdk38A6trKdMjM7TTG92ZSvZ
	/A444+NgT8sIis9Y5bB1eZ3Bb8HK7T0c+a3N1GedBACBj7WuR4YIsDMIHoAyS2j7
	hVDB81L48ERTz2SgqXaLLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4favwexj3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 17:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1783731054; bh=0rVadhl7kBcvqUjvNxuWg25BRXRfHQY3Te9nAH4a4tA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d3KSm34gHPlPj4oS7wbi80IzJeuhofwzA/Gz58hb9+CFhWJX55yNxLDu0s0jxrySx
	 P0b1F+6BGbhhKgD1LTAYn4IRBELjbVDzhJ7dEiFyr0iesYQVto2G3wywlI1kqLS+Lj
	 c7GN27ZAks9rivcgWgcxyS49uLkENYbUp7q8DX1ZZdYHD4HqhDwYYZhHf+gIVRi8QP
	 lDyXkHY2pyQjowT206FxloE71hAK7cunBuclmFWyoDUZtK9eOqRMrB1mG5DacEXEGS
	 hseC4Y/H854ZzhFolECJXL/jx/L3xdHHyFheeMI2ye//I/yNj0cx3HKqrIZivvnN+Z
	 TRpwovjVvFZ6A==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5428B4011A;
	Sat, 11 Jul 2026 00:50:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BCB94A00B0;
	Sat, 11 Jul 2026 00:50:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ved0qP1w;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00600.outbound.protection.outlook.com [40.93.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BC9D222032E;
	Sat, 11 Jul 2026 00:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2B0gWycQnBp9CgH4NPWIJQf2Pf3P7UTYWNChRRkbA0BfO7rHXqxzUSg8DOHwNgzbK6ii3fAaV4tjWFMUPZZUzrPCd6cw8LXk6huquURWcP8kvN5RWdJb5+7AHPL3q+gUQItebz+kUdRuTYjOnGwfmG9Lc+ccAPUfbs5hveFC0HQTanMq+wg8DGp3n2OTKB4RQVpBZMC8VN/YfGVNcTAR/XeYdaVpAvkqcTzY21Kc6sOV72sGCW9++xZzzOkt4wGckkEWc6Ooqi36ivjEjUiI1kLV1Ms5BdOBid3yqcXXxpJBSKU9dQ5m+hCxNj/ih6f63PdjZ1BhK/AfSZkseJubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rVadhl7kBcvqUjvNxuWg25BRXRfHQY3Te9nAH4a4tA=;
 b=uO8dkkSiiB31r7Vsih7XO2pmExrRLQH9CPH+Jh+Ih99GJkytjmMX3/7MtFPyX8CTyA0+1NcT7EQmawa+CabZWU3HHbhvTEGU2zH57fPWSM2ujOs8WuMnou5jj1kJzUTwQ71ryaiqfBvdNncXUvYaKMHZ4n76/A19oiuKEzL/fxzNgFEIBREiv86ARLH9P6MLD9DK2oFTT3ypZLQxzPIofG5wkEhLSn5lL9Ic9qNO4CjNgGw3KVylJlktTmb9HuwMkR2wYZ9qflxQSxxRRGSNhoLDHCHyPCsPcEOO9AkJeC5f50wYx/ffLDyjaK2sG0basq/OaUfj2SBbB/zRu5Mo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rVadhl7kBcvqUjvNxuWg25BRXRfHQY3Te9nAH4a4tA=;
 b=Ved0qP1wT5jQODsD4QmNwPPrOX9AAUK5etohI0V+FboFfVWFhS290qPBHcL2TxB1HS8geAGWM9eR8vJKJKYM1a+F2A0b5rU1kTQvQs8Ct+k0bh0xXPPbAdhAeOg4hLR7Kzl4sB0/PhgJcMXbMmu7e3pA8Ec6mAjL7i4o9bFXTDk=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Sat, 11 Jul
 2026 00:50:39 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0181.017; Sat, 11 Jul 2026
 00:50:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>,
        Kees Cook <kees@kernel.org>,
        Mike Christie <michael.christie@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: f_tcm: fix remaining nexus NULL
 dereferences
Thread-Topic: [PATCH v2] usb: gadget: f_tcm: fix remaining nexus NULL
 dereferences
Thread-Index: AQHdC7Rff9noDCUvb0Gb4+TOSBfqXbZnhykA
Date: Sat, 11 Jul 2026 00:50:39 +0000
Message-ID: <alGSe4pvHykYT6mG@vbox>
References: <20260704125459.4008712-1-lgs201920130244@gmail.com>
In-Reply-To: <20260704125459.4008712-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH8PR12MB7182:EE_
x-ms-office365-filtering-correlation-id: f8dfb151-c045-4c30-085d-08dedee66d80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|7136999003|22082099003|18002099003|56012099006|11063799006|11062099010|3023799007;
x-microsoft-antispam-message-info:
 MUVROcDT+orbH0HmnbxLdnaZ66Q4udNetThABJCJCxr2v4BH1OIUeIjQkxlH4xOl5YjGe8gzKg2vLeKL94V5cqQu36t+KYwOaaLpqfxaj717HGm4oXXptR115JziKieCuqRKsfraC2MeLgyTpTQJGPcQilGh1liIyTuLKZOjmKoyJOjhr+W2xKmAV+FwN6xPh8FL/28WKDOrmN9y+aaQdKoMNxcC/WSXN3bpIgHRmCg6nCaOb75ZCtTROz3CYIPPeud554IVSjAy4v9svdhVrWGMuq2JVCGxZQdvrxQrZPcL1aymZ+h/xpmnxHNi37xwph/unUhQ/rqxCh0tzrAEdClMMdwXqRZcgeGmutcr2qJmZzvxR75ULy9EhmfK9hDKTZtPcGQEB3gv5Kdgu2lrAAgtBu6DlojtqnUQFX6p+AyV5iRZbBBMVENot7SiwoNmrwpnFBF0OB2XPIXZtfi+TkWp+nQdwpmqbw8ainL2x1BtTmTTxOGtf3IcBiHl0GAlGKrfsHxLQIVK518zbXsuEhVEkqoOrc87CNzYeCK+5JJUj1tbW7vJY9vycnb7l/f11yzxyPEpeSkpCKTYXZUbnsf/gxtWN2hGlHE1XomjnA0f6T8ym7FjMGXvdstUXNJ3VZbGyNlkVEDpa2/6lJR2ZhKB4CKdE7UYi7wdYnRIIuYbSV6hgiH+OV92mGLaR86XmPSfHT7WLMv32PgFHpAHBvq3KUqTUGgd7YMKlbOLDhw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(7136999003)(22082099003)(18002099003)(56012099006)(11063799006)(11062099010)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnJURDVGUXE3ZEUzQVNnQURLekJTa2RWWWpBN3hqaEMzSmc2blU2VlBDRVJS?=
 =?utf-8?B?bmMvelNmSE4zbFZBNzNUUGptRiswQXNkLzQzeFU0dGVnVVlCWHpZdXhLcCs5?=
 =?utf-8?B?bnNMUUQrQ00yTi9TL0szeFcrcEM0UUcvV0hwbkJZVjF3L3VaN2lrdUcxcmpO?=
 =?utf-8?B?bWowYk1YUEJaanZ1NkhpZlZsU1pNaGRxbVE4WHcrK3J4MlBTUzdJaDJBM1o1?=
 =?utf-8?B?RVNsblJTb2FSOGRaYXZqcjNuMzNaQ1BsR1pZTCthUU4rMzdJOTBZNTZ5M0lY?=
 =?utf-8?B?TVY5MmYwaXJoei90dER2MTFLNGhwM1JFajZQcWUrY3VsdWZZVERiSW9XYng0?=
 =?utf-8?B?dDM5cFFJamF4REIrbEs2c2Y3Uno4SzZ3Z3o3OHZUZDk1MjVKZ1BVWVlPaE9L?=
 =?utf-8?B?cHFnSW5acTRiV1JKUS9Xajh5UzkxLzIwVHpuOG5kNHNYbS9GQ1piQzFjNzFX?=
 =?utf-8?B?a2JsV0hCVTMxVkZldkg0enZpWVFuRit6VmxJMko4TnpXSHVYcDYwNUFrdzJF?=
 =?utf-8?B?bUhySFFpMFErK0pDMjFmNzY5MHV3OEdmYlBXamRrSWRIQ0VSamROWkNKVzJN?=
 =?utf-8?B?THdHcG55Y1UzajFHdFFneXNhdjArdzZmYm5kcVdUUGNyRmhnakt0VFRGL25N?=
 =?utf-8?B?Wndla2dOVUp1RzRSNGtXcUU4MTJ3MmRIamJMbmk1VjRabUZ2VzBqbFNUNmNz?=
 =?utf-8?B?K2pVM0Fvd0N0TlBSbk13RHN1Mi9CMGNyemFjNENMOVpTQkg5enQ3YkUxMHJZ?=
 =?utf-8?B?RWQwTDVFTTgzVndNZ3Q5cUp1b2FyWHV1VCtoMkc4YXl3NGdNVXc0Y3JZckRX?=
 =?utf-8?B?WE84VzhCcThUQ2d3dXhPUkViN3lyZG9NOFllWUNnSm5zM1Y4SXI4U0dyVUw0?=
 =?utf-8?B?WjE1UURrZDVLbnQydk1KQ2t0Q015LzZBYUorYkhZWEdWa2VJK3FkSTRIM09B?=
 =?utf-8?B?bkdjL0VQaHZaVU1MdnEveFpjRkpNaXFUYk9JOHcrL3VIMjR6eEV3YlRqN2pz?=
 =?utf-8?B?Rll0bWorWkZ2RDBoQmxHRndmdzE2M1BmZURmL1laV3pqVFZUb1hSRVZSaWk1?=
 =?utf-8?B?ZUtnTHNLc3Y5OW1iN0hPVnhMYzdzNVN5RGJnZ2F0QnhmWFFQWnR5RFFxTnRQ?=
 =?utf-8?B?dkNDaGlXODlYdWJRcVlrRHZKbXp5M0UxcUI5VzcxTkJqTHpZYzdJTU9RdGZt?=
 =?utf-8?B?eDNGL2d0bUUzcURDS0grdFgxSU4yV2hQc08xWjFZZkMzdXpWRFd0N3k0SkFu?=
 =?utf-8?B?Nmd2RU5EWmJjeENVM1BxQW9RVlMrc2E4RUk2Q0pLcVBpNk9PZWZWeU1peUlR?=
 =?utf-8?B?OFJGd3B5L2d5em1ZaHJpWTJaY25sWkc2cUNlajZIdzg5QlBJTmdwOE95elZC?=
 =?utf-8?B?MU1iaVBOSDVFRWtiL2lVWHdzcktpTmhhSngzYUxPSDBVcnRUR2R6aGZrSDRE?=
 =?utf-8?B?dGYyeXRUTGZKK0VzU2ZvdC96Z3NnMGlMWnBEV29nZG4vcEp6VWRhTFlxZGZP?=
 =?utf-8?B?MVpVY2FpdDhyNE5FSWlLUlRRTElHS3ErUjZzOUFKRWhXZFhKUUp5MTY2OG44?=
 =?utf-8?B?TitUUStVUkxSbTBxbXAwNVZPLy96TElqZmlZWmlPREluM01vWkxFcndZQWRs?=
 =?utf-8?B?Z2ZKOXh4c1BVN0VWSVVWTGljM0VlMWNObTRXZDViU0IySnN1SVJaNHNwL0Zl?=
 =?utf-8?B?b3RzY3NsZ2dCVDBJclZTYUk0azEvSzBXcm5paERUU085M05wdGVLZ0tqN0Vq?=
 =?utf-8?B?RXlKd1ljUEViSFlTTVB4TU9DY3NhQ25aWXJYZCs1azIzUjhrNFlMenZOUnpK?=
 =?utf-8?B?Ly9kZjJzT0F6eEtoNjVDbmZ4NCtOeDRCb1JIWVhRbFVqVmlMOGtMN1J2eEVy?=
 =?utf-8?B?eGJOWlM4cmg4ZTdQUzUvR1B5WjR1cWpkOVdiWGF4YVk5WXhxZzhFK2N6cjFn?=
 =?utf-8?B?eXhkdlhrYXBHbWlTWFVmNkhtN0RGeE8xS3pFbzV0eGhSNmo2OE5XWHlsNkJM?=
 =?utf-8?B?c3ROUHAzNjdBR1NkRVRIOXk2VkpjbTdYT0hudWZHU3hRemNJMG5jZ1VCYThi?=
 =?utf-8?B?QW13NmN2cVlFNDc2eCtQaStCN3JLNHVNeHI5emp2KzBXeXZ1dEIwZVUyT1RD?=
 =?utf-8?B?UG81MFBYTDRYM3lTdWcxVDI1WEw4U3VPeFN5Q3ExWUcxbkRxR2lMNHNZaXRV?=
 =?utf-8?B?YzhjUFV6MnNpcFVOYStkc1RIYVlqZmxYc0lzMjROdktnb2VrZSs5eXY5cTdo?=
 =?utf-8?B?Sm1lMFpuS2VaWjJqelRwVSsvZ1FkbGxoVStFeUZ3VEhrOWZsNnNNdVozeTJp?=
 =?utf-8?B?MmgxYXg1QjEyQkhod0gya0FmbWErV1paN0o2ZnZncUhJRmNHMWczQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2AFF3B5CFF44C42834F0404EF0A4F47@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	k6gzsXZJs4YZ6dhWVsVMW0zf35MT2BJTcSTLr1xjkXl7lMQUPcNnlUmeWBbJTP0iSOqmUA409CBgy94mEBDXFNi9vleRbtuH4QJVNIGYT+1REvrJcz/FD6YvRdmI09Spnrg+jnICkH7rYC7eiFYp4+RU9RK35hnJTSxNr179JzOrFFAEKSA3lGnhLRZ7blu0h3pWJFLXml51cywkJHTiY5fYtkGROZrd8dyaG3p+HpYRMtes0uJNaVUn0tCkhcuGl3LfrL1XOO6DS0j5A2SV/TI2pucAgfQ4RRpobBpIO9XQXWgy2y+h7F6IRR9iXf3fA93K5LT+hh+g/rHtaLIIKQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f11S2iBrR4c59th2EAhoiRYvJ7jVW7+21TkPL7pHA5nOcsdYSLb3b5nVcUbb9LJtEXLWmz+n2NxI9QFJdPSPDlW8u9QV0sJ2teo2WTLiF3QpAhNBdTnw0645iabHqlhvIGM/XYetXhBVfr9ZixSCjQoDBxJk9uI3GT+w906rK32yGeen34gFCxQHGqfSXJJuHigQ2OnifSGt1jct2tt16VPSS4y/i0iUy5ma5+owu3h8MrsyhEAtJuf6UwTK3mAHnUdOU4jUJGMCNUy1oI7gyHmlyEq/5/yH+sn3Nyuz7tnTdxi3DZrvdMQzEL2U5/CTmjC1cIOoC7W5T8f2qN0AO5om5UEXYbYHk5mh8Z2OK5w7SZ6ACfUtdhxgcljagZ9fGb/1Kn7zOcZaUEQ/0JJHDO+3wG78g2RvXBOtSYk/Yr2xbeD2Z/mD0qh8A9s0zFz7CTdjC5EMNd+xrmcNDlWSMte3OCC1b+EPvwf1xaj2P6v3m4WEkzXuXXk4AjDUAsJ31Xyj3ewxesZTiDaiyLj8qfc6EEnEPILwn65KxdLYG16xqVMqUePR3UYkiunB4YT8VSqDC4MxjQeH1Wwau/uA65lANWqPHvtZxsmyE67eKYcMCaXKjZnaYajlKgzIgnH80TMa8FJR6UzBqErvLmeasA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dfb151-c045-4c30-085d-08dedee66d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2026 00:50:39.4119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvcdKW4ALoV/7hISt/PjX+MD8Bf/b2ioemjo+45GR7hGKc6GUNxp4aDyG4NMOeMNynNn7MvwulvwjBZUwlSXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAwNSBTYWx0ZWRfXzgSACNPlPtyf
 2ZKFiTPSfwTiW3to+YuoeeMo0DI46uXj6y4JMfUq69lQ2k78QoMG6DOVehHYYvuhmeKOfFXkh12
 2/BZ2d8D8W8F9aSvpfvnNMvyMsx8N9W0eqObcEn80eprUhIQles8Wj6HPo1qBR6V4fqZbl52Wf4
 QYieH+GkLnbJa6yO2x9yak7dMh2UBW1FgEuXK+KMT3hQzQd0oVMmTzpFHYJH5uOd5KEauZO1MbM
 GapOp3xslFZKd+v4cmIVMKJw0u5jDprz9cW7KdOjHlE6gX1k3A9W4RSj0bnxqAhYVISbsd7fzZR
 MGFn6fxXBvMZ5eaMzY1981J6XqXs+FcjvIeUGehv9d3tMcli/ys2WVdhcAhFONqcOjKDCHkBj5V
 q+ZoYvTqCnw6SX8H6CSfcEWBe9lGYpw1YmZ0gN9rsLY0ohEoP/pmioxJTKgpuuHQD3KDtNVcZzY
 g4C6V8kOClFjBBOdf2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAwNSBTYWx0ZWRfX1bZJ0E7FcpQb
 N4yaVNCGHGqQWGTl4PwZwUJaHm22/czvJkUcgSbaT4LmXuGpVoHwt5ea5XiBBiMlTdQPLro3gLb
 iDk1QL1aGVJpuUyfPgPugVwOWg9rmz4=
X-Proofpoint-ORIG-GUID: YoSSIXVz1WlgscRM9DXc5667vAEBOQ7N
X-Proofpoint-GUID: YoSSIXVz1WlgscRM9DXc5667vAEBOQ7N
X-Authority-Analysis: v=2.4 cv=EJ42FVZC c=1 sm=1 tr=0 ts=6a51936f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=8l8i6NpHBBaIO5oKTUMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110005

T24gU2F0LCBKdWwgMDQsIDIwMjYsIEd1YW5nc2h1byBMaSB3cm90ZToNCj4gVGhlIHByZXZpb3Vz
IG5leHVzIE5VTEwtZGVyZWZlcmVuY2UgZml4IGFkZGVkIGNoZWNrcyB0byB0aGUgbm9ybWFsDQo+
IGNvbW1hbmQgc3VibWlzc2lvbiBwYXRocywgYnV0IHR3byBVQVNQIHBhdGhzIHN0aWxsIGRlcmVm
ZXJlbmNlDQo+IHRwZy0+dHBnX25leHVzIHdpdGhvdXQgY2hlY2tpbmcgaXQgZmlyc3QuDQo+IA0K
PiBBIFRBU0sgTUFOQUdFTUVOVCByZXF1ZXN0IHJlYWNoZXMgdXNiZ19zdWJtaXRfdG1yKCksIHdo
aWNoIGZldGNoZXMNCj4gdHZuX3NlX3Nlc3MgZGlyZWN0bHkgZnJvbSB0cGctPnRwZ19uZXh1cy4g
VGhlIFJDX09WRVJMQVBQRURfVEFHIHBhdGggaW4NCj4gdXNiZ19jbWRfd29yaygpIGRvZXMgdGhl
IHNhbWUgYmVmb3JlIHdhbGtpbmcgc2Vzc19jbWRfbWFwIGZvciB0aGUgYWN0aXZlDQo+IGNvbW1h
bmQgd2l0aCB0aGUgc2FtZSB0YWcuDQo+IA0KPiBJZiB1c2Vyc3BhY2UgZHJvcHMgdGhlIG5leHVz
IGFmdGVyIHRoZSBjb21tYW5kIGlzIHF1ZXVlZCwgdGhlc2UgcGF0aHMgY2FuDQo+IG9ic2VydmUg
YSBOVUxMIHRwZ19uZXh1cyBhbmQgY3Jhc2ggYmVmb3JlIHRoZXkgY2FuIGlnbm9yZSB0aGUgY29t
bWFuZCBsaWtlDQo+IHRoZSBhbHJlYWR5LWZpeGVkIGNvbW1hbmQgcGF0aHMgZG8uDQo+IA0KPiBD
b21tYW5kcyB0aGF0IHJlYWNoIHRoZSB3b3JrcXVldWUgaGF2ZSBhbHJlYWR5IGJlZW4gYWxsb2Nh
dGVkIGZyb20gdGhlDQo+IHNlc3Npb24gdGFnIHBvb2wgYnkgdXNiZ19nZXRfY21kKCksIGFuZCBV
QVNQIGNvbW1hbmRzIG1heSBoYXZlIGJlZW4NCj4gaW5zZXJ0ZWQgaW50byB0aGUgc3RyZWFtIGhh
c2guIENsZWFuIHVwIHRob3NlIHJlc291cmNlcyBiZWZvcmUgcmV0dXJuaW5nDQo+IGZyb20gbmV4
dXMtbWlzc2luZyBwYXRocy4NCj4gDQo+IFN0b3JlIHRoZSBzZXNzaW9uIHBvaW50ZXIgaW4gc3Ry
dWN0IHVzYmdfY21kIHNvIHRoZSBjbGVhbnVwIHBhdGggZG9lcyBub3QNCj4gbmVlZCB0byBkZXJl
ZmVyZW5jZSB0cGdfbmV4dXMgYWZ0ZXIgaXQgYmVjb21lcyBOVUxMLg0KPiANCj4gRml4ZXM6IGI5
ZmRlNTA3MzU1MyAoInVzYjogZ2FkZ2V0OiBmX3RjbTogRml4IE5VTEwgcG9pbnRlciBkZXJlZmVy
ZW5jZXMgaW4gbmV4dXMgaGFuZGxpbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBHdWFuZ3NodW8gTGkg
PGxnczIwMTkyMDEzMDI0NEBnbWFpbC5jb20+DQo+IC0tLQ0KPiB2MjoNCj4gICAtIENsZWFuIHVw
IHRoZSBzZXNzaW9uIHRhZyBwb29sIGFuZCBzdHJlYW0gaGFzaCBiZWZvcmUgcmV0dXJuaW5nIGZy
b20NCj4gICAgIG5leHVzLW1pc3NpbmcgcGF0aHMsIGFzIHN1Z2dlc3RlZCBieSBUaGluaC4NCj4g
ICAtIFN0b3JlIHRoZSBzZXNzaW9uIHBvaW50ZXIgaW4gc3RydWN0IHVzYmdfY21kIHNvIHRoZSBj
bGVhbnVwIHBhdGggZG9lcw0KPiAgICAgbm90IG5lZWQgdG8gZGVyZWZlcmVuY2UgdHBnX25leHVz
IGFmdGVyIGl0IGJlY29tZXMgTlVMTC4NCj4gDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rp
b24vZl90Y20uYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBkcml2ZXJz
L3VzYi9nYWRnZXQvZnVuY3Rpb24vdGNtLmggICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQoNClJldmlld2VkLWJ5OiBUaGlu
aCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
