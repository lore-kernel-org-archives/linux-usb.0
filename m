Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9002147E5;
	Fri,  7 Aug 2026 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062016; cv=fail; b=RBlimSpsa0NV6QV5AxMqPr83gG29w8q504oQ7bpuzYGtDTtjmWtuxUSvA04Aijp1jDb298WQ7OQinPfsBO0BeltvLAYqriYBxPQws3xnMNHJg00gcGhWgY4OIwHq8EpVGijSB2lI+JXp9tucMKGoXYtNS9W0lzpOHH0smV2aAlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062016; c=relaxed/simple;
	bh=fboIlB9Vg1Lvpbura1TL/F43vJwD2pne9uiYh/DmZZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cKzHBMnA8/+4wqyNsJBE6RpQSSCYnPyMjQIe6tvgKoIlvieoD9NOwTvFvFvlqP5pXMnIhCoMYXJ968CiTA63FzNIoQftw+nWdzMQfvmy4gZqbjL7OwlPAhZtdJhWCe3B+YeR0q+PrVfyMxYNRT2ARMq3pruCikwbgzcX+QOVhiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r66WGQJa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FoRLJ6MT; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eRpVy7+E reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r66WGQJa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FoRLJ6MT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eRpVy7+E"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770InC83760129;
	Thu, 6 Aug 2026 17:20:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fboIlB9Vg1Lvpbura1TL/F43vJwD2pne9uiYh/DmZZA=; b=
	r66WGQJaszGssXU3foJH2du/n18jNBBBuiiP46ob3v9og65DpSzB98/yA4ooow4C
	bzMBSy/lwkGyEkOL5r2XTh7+BOIgHO2wmmI75vv81hPDs9oNswWXLDvl3kI1F8c2
	aY/IT3OqDO/pavSXFcGSvHeKg3bpxN+g8gciEu9CfpCGSvVSOXudDereM0WEWFcT
	dY1+lJImWE1KzzVkyPy+clZTju1ZVE/Ye5l1B35PnuDFKdyEAYeYAIka0gREGp+Y
	p9VK+6bdhyEvqb8TSvjoLfC8DzEf8VA7m9LCxbBemR65u+FBBs67X3iPjDsJw1hc
	huf+uBS3ehqM/5kZ/wow/g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fvy9utvkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 17:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1786062005; bh=fboIlB9Vg1Lvpbura1TL/F43vJwD2pne9uiYh/DmZZA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FoRLJ6MToV9NZKt/+cNaW4vCta/mU7zWqiMPwq7mDlilMW2Sqdzci1iDiOjdn7ElA
	 qyby+OL/UjJFIbQoe8TqaOV2bS6IaF9SHbcHUqtn1IhIUhrlQiAD5mxZu9aWhsEwkw
	 nTMHyBkmnRNFt74dhFGQ3Zmlkp4cFi+fGPUSIxBvVOZEkYGcrgSw4yCwLCYlmBP89r
	 pbwpg15aI8tB5BXUdzn2DFjAuYCCNFanJNdBiepQHAuzeAd02yRD83fVFzjBPea0Sw
	 fonGZWyXPQRv63x8T6WqHG/DX2ejAe1WIPAe7ztPpxoE4BJaY3pt3gVhpkUsCdAk80
	 tu9t2ezApsh+g==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 55EB740515;
	Fri,  7 Aug 2026 00:20:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E3043A0FA8;
	Fri,  7 Aug 2026 00:20:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eRpVy7+E;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00307.outbound.protection.outlook.com [40.93.13.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3382840580;
	Fri,  7 Aug 2026 00:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj3WihQgneNuXssd13z1/7HXqsvq6GR0Jtktebk3lnsJiMGMIYAScU8EAR21rhMtvdlQUF6NmSitsYwf+d6Wzcg3E/0Y+8U3guCuUta/cwHyKWJtJVZ+uO68hjH08iVCQrsDS6yRqbrHySGC9RDJYa2IGoH48qL/wydA3xjhTTnHZ1iHwzRj1ITDVwOx6GDe7TzmcZyaGNwaGsK3NGjycS4JYJBzsB9CJtbh9mjS7l0JfzVpkAobHlILO8jjuy+wTFPTTtfL07xqEzhvbIfXtnyqGCfqaPzjQwGKkzUkiIZuECNvvrFAEQOJ33rQocoY/9e+22A5XTeBJWxML5SDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fboIlB9Vg1Lvpbura1TL/F43vJwD2pne9uiYh/DmZZA=;
 b=ZofpdknNgxaTXjiwsuMeEoR5q4yAhyQ3sbS6gQMmZYF0xo/+GSRnHN2+IkTtLVIDMEpMbsrTMHZoSlosyuxM3LS2ZfyEaNuGxx7S51sMqD2OdujmvywSEcWa6stbjQ7YKYI2JlUqleV+CJGl4uQAzN5Dq6HQDa8Y8Uce1CILwQhcE62Hj/CEiWRP4iIouwacqHNJeiXHNhCP/U9dKvEX89Nsn+Cx9MKhvp6341YPBsEsl3q4qWgkJ9hG8I0oqtQSnWvNfeo6AFH1Xg9n+s3D8amVm2/51SgI9fA4LARLR/9stKvkPr9ybMFk5D8FBnpG2S1jhck4idgQWbqsGdmSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fboIlB9Vg1Lvpbura1TL/F43vJwD2pne9uiYh/DmZZA=;
 b=eRpVy7+EMxpyzOh7WcNYXjDD0omNYSPvHnmNJokG3em7gvWBZOdzJ2o8kGQXVFZG6c6n+J56VSI4JB6SUZl/BwZ3KgGHIZ/1BUbS+1PZBmAQF0LtHv+aqDf7LTI5PLQM457qT+rahAkhzd0YhnhZR19s9gFXy/CfvVzL4mkJnTU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 00:19:54 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 00:19:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] Add version check for setting ForceRM
Thread-Topic: [PATCH 0/1] Add version check for setting ForceRM
Thread-Index: AQHdJf0B0bmOV+flT0CvRD45cw315LaRuPQA
Date: Fri, 7 Aug 2026 00:19:53 +0000
Message-ID: <anUevdJ3ZNaYyB61@vbox>
References: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SA1PR12MB7152:EE_
x-ms-office365-filtering-correlation-id: 77441f51-aeea-4b90-1da7-08def4199a91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|38070700021|10067099003|56012099006|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 fnPoNHL1Ht0oUCilWgjPlXF57FCRihYHZ25vrKXNYnSGEvaCdJAoOxjc7Ude2egbLEqHSbyhednArQKaVg2MXvqjFxSdo10BmrpJqugRKTXmg42/Rw+vhNaaS0Jx7O1JUGgtJfRM2o8x3L64c6V+n6fpVtrvQtJ03BCbSXbLq2RH+U8YcVNjtZPZmzlzLxQwhgy0Hw8E1+AsS6AhlcYqwu/88crMdtkHUltD7aM9IHYOcFdP0ciLsiGiJ746jHGz3DqJ2AiuQJlQYiX9Md1Na+fLVixtcLqmK7u2a3MUE2sInT72SBunGQALsF8NdnYMYaIW8volye1t6GtEtyf4i4GMR1cse98YUdyPrT98DYdPfmFSXxP40sq7TJy5qF6WHAtCV7ilfjvRLnQWc8kykeXHzkwSvLjJoHYYtRn45gsSUB1++08ESwrbkZyiVprTH57pfyg/zb655Akj7nUHHDzj+7MxQRdZsUkRLuKu1r/OvAF2kQcIn4xOF15uZnqKbIvy2RBnDc2pGEl9qJ7UuyO6nijO7zvNhBcMAid9OiV/ezqaDaGkhowFuJbjl93pY4RGKQZAMUVCENKR1iI9rrARlAoeWMJd7vW/nn7D7ocKEH2HoeIncvbTFBtrBhtwJHZ1i8kkwyf4A9igHDy+2IkCWnmzviIFHem99g9O0GMywx+4vcwqD2IliGISnBxHCMfGcJhUK6RjVxc90NFDXwfRgEUW/tgKrQ7fnj5xGno=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(38070700021)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qk1VQktJRmFhWGxXcmNXNmMrcGVFdFVWSDE4ZFJ3V1ZWcytDNG9aTk9OczJa?=
 =?utf-8?B?Q01KZkdNZzhXeHFTM2Joa1RkM2d5bWhTSGwreHBOQnZQL21UZ2lhdWJRVnMw?=
 =?utf-8?B?M2cydDhxM0FYTE5SbVAwckUyYjU1WTRjK3VibGRQNlVEaXJzdG9WZWorNXUz?=
 =?utf-8?B?ZGdTRW9RaWFLTFpUSkZMaFZjNkZPcXZpcXkwTmZya3p0ZEc4Ukl4UmR5RjQ0?=
 =?utf-8?B?M0Z6aTJlTDBWQzRpc1hadGdxRTc3VkFxM3ZicHh2dkt5Yzc3MVFxWTVwb28r?=
 =?utf-8?B?bHN6eE1MMkVCTW5uZ0Y5eFU2bHNZMU5NVlpNcFdJYUgzOUZOS1lJQ1ZURTFL?=
 =?utf-8?B?MEIxcnN3d0JnakRNcDNpc2lkODlEd1cyZXJUR2xSSFR5bVY1aEhKOTVKSG5F?=
 =?utf-8?B?anZZRXE1L0VKa3lneG5ET2tmUGFKY29DYjMvUVFtNDIwRTA5ejJBeDdtS3Bk?=
 =?utf-8?B?YW5xeFhlR1cwVldKT2NSeDRNaDRqRkR2ck9EWHp3MlJVY3JXZzdsbTlqcTJ3?=
 =?utf-8?B?R2xpUTZSMFAyMnZYbVBNeFJoMXZ6QUFIbGtraCs1K2JJbkpvRkxZbm1pWHFO?=
 =?utf-8?B?ZkhSOGo4N1hSNjN3R0FIT2wyUDVQZWppTjJteDB6Rlg0c3lObnlNcTY4QWFG?=
 =?utf-8?B?SUhPK1lyaXQ3L204Smd0WWQ4NmZZNENWczZwRTJSQzFGZlpmM09RRU9wVUwz?=
 =?utf-8?B?RXZIMVFxaGNlWlVkTHhZUDA3Yjc0RkVoUHlyVVJ5VFJaM1BBRFpWS2Jucncx?=
 =?utf-8?B?SVpwU1Z5RnVQRmdJaEZkaGFVOVI0WWFiZnZseWxKTWVoVnQ5NXJkRlNRdy9K?=
 =?utf-8?B?NHBoZjhYQ3lLcGFuR0FyY2h5dVFxRlBwQk9WcTgvdFcxRTlUQnVEZGdrZEgr?=
 =?utf-8?B?cEh5QThHU05qcFA5TlZrWXZFQkMrWmhjenA3SzVnVkJodFIyVUErNUJTY3ow?=
 =?utf-8?B?L29pMllXeXVYNDAzWm5vRjlwOVBFWlFXeHhSN0llNmo5ZHF1NWhiZGtDS2Mw?=
 =?utf-8?B?Z0lQWGJoa0Y5Ymc5LzZveFh3blZFSHYyQjRSYUZXby81Y3pidGhvZ01CZGRK?=
 =?utf-8?B?M3BmbCt3MWhCU1M0ckxMd1M4S0NwL3Z1Vy9xL0RobjdTQzNlR3AxMXJWcWcw?=
 =?utf-8?B?TVh1RlpWU0ZFa3gyUEh0OVRMWmVzQjd1SmF0OUJId0MxYWk4cGNISk1qaFNs?=
 =?utf-8?B?dzBxTmZXaWNQOWc4eExpQXc5QUpHYU5Xa0NIOFBBSkE3WFo5TzM0aitGckZj?=
 =?utf-8?B?NUdEZERUSG5tZ3RKd2dhTUE4WDNlQjZZQkk4UFNWeUUzN1RNdW1RS0tTSE1Q?=
 =?utf-8?B?eW9uZ2ZvYmkxQ1Q5bU9MY0RNN2pTTzM4SUFyajZucE5FL3hqSHozTDhvRE11?=
 =?utf-8?B?T0pvaENCRk0zUVVuYVEwOTZEZlI0aU91Uy9hZ3JvRGhHUW83YXpjNGpNQVhj?=
 =?utf-8?B?MndjZmVtbHVxVEdOTC95Qnh0S0kvSDdhV2tqb3Y1MEY4YSt1TldzMVNrN3NI?=
 =?utf-8?B?YUF4bGszSENEMG5OM0tjb0xDN1kxUWN5azdBVVdxV0J1TDNKSktNcFNzWExQ?=
 =?utf-8?B?K3ZHdk9UNUVVaDE3RWx1NzBTalNGd0ExVkhVZWI4UjNCR2xtbmg0SS9qTFlM?=
 =?utf-8?B?bVVTTUZCc0RiN2hJQU9HUkNKL3NDVzQwNmU2ZE92SkVPbUl0M21aV3VLVHpj?=
 =?utf-8?B?dUJpczlKd3JnaVYwZFpsY1lNWk9NRWxER0ZDa1YxUzJBR3lKT1hNL1dpYjRN?=
 =?utf-8?B?Z3A4LzVZWjRKaWRadElibi9uTU9ZQzRWdGtGTHFOM0tvMEJqOXowUkI0VXAv?=
 =?utf-8?B?Um9qdWlDQ2xRS0JYQWVNRThSUkErZkVZVWVYbW4wZnlBZ2RxZVZSQXlKZHVO?=
 =?utf-8?B?emExR29FK0xGL3RSWjZqT2FGRGs4bCtlNkNaN2Zydmk0U0FzMGYzYXFGeERM?=
 =?utf-8?B?MTFVbnBBSGtwTituUkZjZmpkcmVPZG0zSHV1cW05T1FWMUxlVGRTYUhoK1hr?=
 =?utf-8?B?NjdzcnFWbEY4ZFBrTVk3d3Vycnd2NFB6dEhUdStzSSs4c0pUV210N3JPWW56?=
 =?utf-8?B?ZTViTWtDaktpTmd6WE1tT3VmRGJhU2gzS3NNdWRrVmhiNVAwUzhPdW50dHJo?=
 =?utf-8?B?UEdMMENiTXZYekcxTVlUN2JFa0hKcmFGaG1ndUNaajFhTFBTbDRHYjQwN2VN?=
 =?utf-8?B?Y0Mxb1lOZ2JzbkowdzVUTTVDcytHMWp3TVVLeFFCNU9aOG9VMFJJNk5ZbmI1?=
 =?utf-8?B?bXV4UWwxNzBGWHVmWFhHWXQ5dC9yUWRLZlJ6bW1vTTErdTFJYk8zeGk0OVdL?=
 =?utf-8?B?TTRBTjFwUzV1MWFQOVB3NVRlYXZ6RWI3MlV1UURxQnNNOEQ1UDMxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6544B30C1B6F34FAB0E4F642F2198A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sFxgsgDZ1ldz6V8ma0qiqT2gAMmqO8+d3fRu5HPnPjAj5zVjV+KUTPHwp3gMj525uDoA81z/Z6m/4ZNHxN9ncNXMoOvUlwD1HpuayMwzG6ocgreobIeTm3VBVGqp4gV208wC7/BOjBLKlK7IkQ6bEZXao+H/fz+BpF8oqvwv5VCIrxW+FqCNRMIck8n6KVhz55yX7RA3niU4PtD0U36omdk98ji/4RDifIRDn/wE0zdEDN/rKjO7srIEv01dYuZHrk8/VG3DiduqPlocUjqYNVaslWhesvT+aAthO/T1tzswfzhTAyWzp5kJpnnumWopEIH9HItz2Fdcz7rBz06nUw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B1rvUrM6BrzHIHCp5FeRXF635NHM/QQfmPnJThNm7S9G1Pqpx0FS2/BrL8yqreayy9i9DvJTpcPXv1eV1lCK6XBSRKZWiGvqIWu9b8frDIMjHUh2XW5nbfd12UJ5RgNe5/0yYvUshhA6/AygU2Kq5vsvj+cEXFmE1fWJZ83cg9L959BD3DqurzyNateN2/7mhxm4aOoimc8ejlzUsJLkpvj6mwq1mlpQKeNy+eXjFZguw/hUPBJx/4W+F+lNCn6PxKErA5JElqrDhCgPqHeHlK9OYhcWOkPXwjhRM05saXbWOAEylNX/rHIz1d/08Dc3LiAkRUp2JC6jpfBXUg2lSfmENevu42M2TZQ8JyES7zxQ4zRtd1NBqDuu1cBWYiBqZC5lBtTBcRUK6p0+iuuL5ZBW12Q2yoFqbuvNxev4AmXMK3vRAQDiSkoTjNlfCzhxFjnLkMlNJGr1i5z8THaoefOOsvDTYjFtTeMuUqEIU6pyF5+0zpJZZTpOeUoFbAQZk7r2HB/6Wt1j8e4NhMs2k772npXbL6HuGT7Yi3t1+LyZrbjyKmv0Hs0UQane8McXz4ktPbT/tRkkbHOqG6ujn2YWeatx5X9N3oR/tYcDCHrXzwyJxwsyZbRyvfKChKq5J6K4VR4chtsgLIYSE5ickA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77441f51-aeea-4b90-1da7-08def4199a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 00:19:53.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByZmKbvdWlLHZeiqkqBVDz7/606uGdBxZUN41X3Xeuje7uOg/dpkXLtEYGF8/z6+mykikwK0EkFd/pE/gK5PyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAwMCBTYWx0ZWRfXw+xgwKcRzamL
 YwxWG1GUoSulnnGqYJxGoW4JKOsP/GUEVDnv6DaplyLeVm2hj3fKK+HRW7Dy+IqcIvSTDlHHiVb
 1YHTA1igYxWHdJRDalNZXP1z1pDel7fO0fttC5N489mjc2ok0WvxHlUs8uA9nR+Vhar8r/eHs2r
 CyXGnaJq3IzXZJK6fLVo8BOR33M4mPyd5D8SodKj4lM2Jb5SjcvQHBTYtrbY6ezhwVbZYQ7fFtp
 kWSgiGDckLrrnFk1uDLvw+6/rufcn8kke2kEOA7Cp3uauhTXalmRgvPDO9ejKg1SUyWZQvVIVwi
 iDx+a3EXhztlNWKKupy+IVO24JZdZ1L5GBR7R9FcspyzGRTlzpSBQijU0TXclzv6qw0fCtqoRyn
 y2gH2B2XTYijTBUM/KRqd0wUBRTjjoomNSQrcx3Y8ITcR22wZuVrYl/WPJDJcH626eJOhetYWxN
 1OkzhnQU8vBXiUXJOpg==
X-Proofpoint-GUID: 5s929u8sFIH787o5-UMRLghQHNjeGOVQ
X-Proofpoint-ORIG-GUID: 5s929u8sFIH787o5-UMRLghQHNjeGOVQ
X-Authority-Analysis: v=2.4 cv=Eu7iaycA c=1 sm=1 tr=0 ts=6a7524b5 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=NT_xgBQzcKnR2urc0S8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAwMCBTYWx0ZWRfX8tV7vDvpIk3+
 uxNo6w/1QBe0mrnioWdjMZPDSFjIRBhpJnkMGa9P2LWtKigzGrhFPxCBwXxCHS9210DbbZKAZUK
 xI0s3SQB9ofEaVNltc2K1XRNr/oxbaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608070000

T24gVGh1LCBBdWcgMDYsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gSGkgVGhpbmgsDQo+
IMKgDQo+IFdlIGFyZSBvYnNlcnZpbmcgYW4gaXNzdWUgb24gRFdDX3VzYjMxIHYyLjAwYSBhbmQg
djIuMTBhIGNvbnRyb2xsZXJzIHdoZXJlDQo+IGEgdHJhbnNmZXIgYWJvcnRlZCB0aHJvdWdoIHRo
ZSBlcF9kZXF1ZXVlKCkgcGF0aCBjb250aW51ZXMgdG8gZ2VuZXJhdGUNCj4gd3JpdGVzIGV2ZW4g
YWZ0ZXIgRW5kVHJhbnNmZXIgaGFzIGNvbXBsZXRlZC4gSW4gb3VyIHRlc3RpbmcsIHRoZSBpc3N1
ZSB3YXMNCj4gcmVwcm9kdWNlZCBvbiBhbiBPVVQgYnVsayBlbmRwb2ludC4NCj4gwqANCj4gVGhl
IHN0YWxlIHdyaXRlcyBhcmUgbm90IG9ic2VydmVkIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBFbmRU
cmFuc2Zlci4NCj4gSW5zdGVhZCwgdGhleSBhcmUgdHJpZ2dlcmVkIHdoZW4gYSBzdWJzZXF1ZW50
IFN0YXJ0VHJhbnNmZXIgaXMgaXNzdWVkIG9uDQo+IHRoZSBzYW1lIGVuZHBvaW50LiBTaW5jZSB0
aGUgdHJhbnNmZXIgYnVmZmVyIGlzIGZyZWVkIGFzIHBhcnQgb2YgdGhlDQo+IEVuZFRyYW5zZmVy
IGNvbW1hbmQtY29tcGxldGlvbiBjbGVhbnVwLCB0aGVzZSBkZWxheWVkIHdyaXRlcyByZXN1bHQg
aW4gYW4NCj4gU01NVSBmYXVsdCB3aGVuIHRoZSBjb250cm9sbGVyIGFjY2Vzc2VzIHRoZSBhbHJl
YWR5LXVubWFwcGVkIGJ1ZmZlci4NCj4gwqANCj4gV2UgZm91bmQgdGhhdCBpc3N1aW5nIEVuZFRy
YW5zZmVyIHdpdGggRm9yY2VSTT0wIGVsaW1pbmF0ZXMgdGhlIGlzc3VlLg0KPiDCoA0KPiBXaGls
ZSBpbnZlc3RpZ2F0aW5nIHRoZSBpc3N1ZSwgSSByZXZpZXdlZCB0aGUgRFdDX3VzYjMxIHByb2dy
YW1taW5nIGd1aWRlcy4NCj4gU3RhcnRpbmcgd2l0aCB2ZXJzaW9uIDIuMDBhLCBzZWN0aW9uIDMu
Mi4yLjcgKEVuZCBUcmFuc2Zlcikgc3BlY2lmaWVzIHRoYXQNCj4gRW5kVHJhbnNmZXIgc2hvdWxk
IGJlIGlzc3VlZCB3aXRoIEZvcmNlUk0gY2xlYXJlZCwgd2hlcmVhcyBvbGRlciByZXZpc2lvbnMN
Cj4gc3BlY2lmaWVkIEZvcmNlUk09MS4NCj4gwqANCj4gVGhpcyBhcHBlYXJzIHRvIGFsaWduIHdp
dGggb3VyIG9ic2VydmF0aW9ucywgd2hlcmUgdXNpbmcgRm9yY2VSTT0wDQo+IHByZXZlbnRzIHRo
ZSBzdGFsZSB3cml0ZXMgb2JzZXJ2ZWQgYWZ0ZXIgYSB0cmFuc2ZlciBoYXMgYmVlbiBhYm9ydGVk
DQo+IHRocm91Z2ggdGhlIGRlcXVldWUgcGF0aC4NCj4gwqANCj4gQmFzZWQgb24gdGhpcyBndWlk
YW5jZSwgdGhlIHBhdGNoIGNsZWFycyBGb3JjZVJNIGZvciBEV0NfdXNiMzEgY29udHJvbGxlcnMN
Cj4gc3RhcnRpbmcgZnJvbSB2ZXJzaW9uIDIuMDBhLCB3aGlsZSByZXRhaW5pbmcgdGhlIGV4aXN0
aW5nIGJlaGF2aW9yIGZvcg0KPiBvbGRlciByZXZpc2lvbnMgd2hlcmUgdGhlIHByb2dyYW1taW5n
IGd1aWRlIHNwZWNpZmllZCBGb3JjZVJNPTEuDQo+IMKgDQo+IFNpbmNlIEkgb25seSBoYXZlIGFj
Y2VzcyB0byB0aGUgRFdDX3VzYjMxIHByb2dyYW1taW5nIGd1aWRlcywgSSBoYXZlDQo+IGN1cnJl
bnRseSByZXN0cmljdGVkIHRoZSBjaGFuZ2UgdG8gRFdDX3VzYjMxIElQIHJldmlzaW9ucy4gUGxl
YXNlIGxldCBtZQ0KPiBrbm93IGlmIHRoaXMgaXMgbm90IHRoZSByaWdodCBhcHByb2FjaCBvciBp
ZiB0aGUgY2hhbmdlIHNob3VsZCBhbHNvIGJlDQo+IGV4dGVuZGVkIHRvIG90aGVyIERXQzMgSVBz
LCBhbmQgSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggYWNjb3JkaW5nbHkuDQo+IMKgDQo+IFRoYW5r
cywNCj4gRWxzb24NCj4gDQo+IEVsc29uIFNlcnJhbyAoMSk6DQo+ICAgdXNiOiBkd2MzOiBnYWRn
ZXQ6IGFkZCB2ZXJzaW9uIGNoZWNrIGZvciBzZXR0aW5nIEZvcmNlUk0NCj4gDQo+ICBkcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspDQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpIaSBFbHNvbiwNCg0KVGhhbmtz
IGZvciB0aGUgcGF0Y2guDQoNClRoaXMgbmV3IHJlY29tbWVuZGF0aW9uIGFwcGxpZXMgdG8gYWxs
IDMuMiBjb250cm9sbGVycyBhbHNvLg0KDQpJIGRvbid0IHJlY2FsbCBmb3JjZVJNPTAgY2F1c2lu
ZyBhbnkgaXNzdWUgdG8gcHJldmlvdXMgdmVyc2lvbnMuDQoNCkkgd291bGQgc3VnZ2VzdCBhcHBs
eWluZyB0aGlzIGNoYW5nZSBhY3Jvc3MgYWxsIElQcyBhbmQgSVAgdmVyc2lvbnMgdG8NCmtlZXAg
Y29uc2lzdGVudCBiZWhhdmlvciB3aGVuIGVuZGluZyB0cmFuc2ZlcnMgc2luY2UgVFJCcyBhcmUg
dXBkYXRlZCBvbg0KY29tcGxldGlvbi4gU2luY2Ugb2xkZXIgSVAgZGF0YWJvb2tzIHJlY29tbWVu
ZGVkIHNldHRpbmcgZm9yY2VSTT0xLCBjYW4NCnlvdSBhbHNvIGFkZCBhIG5vdGUgaW4gdGhlIGNv
ZGUgaW5kaWNhdGluZyBuZXdlciBwcm9ncmFtbWluZyBndWlkZWxpbmUNCnJldmlzaW9ucyBub3cg
cmVjb21tZW5kIGZvcmNlUk09MD8NCg0KVGhhbmtzLA0KVGhpbmg=
