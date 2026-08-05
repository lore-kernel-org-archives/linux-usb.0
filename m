Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0035A18A93F;
	Wed,  5 Aug 2026 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892013; cv=fail; b=r51PP/E+06IqUGosnFKKdt44a1HJJC/VmaFJvY6defI+aMEAajADYgM4WOVOHSaZCatci3YGwaSvXK0Gu4dcMl0yrneepZaq4QrF6luoknGfrDCWa5m0wmXx8EOrDKzZGvNK2fKgQLjAbxP4yml9NWeUKrbJLpQIsQnWpEhs4AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892013; c=relaxed/simple;
	bh=i3NA3T3UGyrfweijHupHkf8uc719mXZgv8TPOL3H7dI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T3AXKc5y2Ra1XMrr6F/fJjBwcZPAO+ba5VglVIUIuEpLWFNGJEVlI3SVbm/c50MBOfTQ0fArpDz5a7C59o1j8tbOqqNIv2F0wzByMrcwtbrleISjz3D2jYTr6Z9CGQnIyPrYN9VEf2YslXrPKqdm6+O/BolekZlElfNS6boi2Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=deFCR/IM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MWdcXYi9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IH0nFVD9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="deFCR/IM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MWdcXYi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IH0nFVD9"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NIUrm1473402;
	Tue, 4 Aug 2026 18:06:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=i3NA3T3UGyrfweijHupHkf8uc719mXZgv8TPOL3H7dI=; b=
	deFCR/IMw53AgX4Phg5ma3z14Ul9MR355OoeIlTxh3ZS5WJ49kP6UxVAw5TfMB28
	LNEykLL0OnRKg3VEHH98gynlUKTOOD8jNgkjHantOcTfM1qGbBK/imC8GjDpb7qG
	S6O11c1ulNM5R/aNa4Ik1WHAsfiwnssuT4uWmLHSEZjum35YPKvw98IquVtVMB8K
	cPTM0vLV6w3buGOAAvQDJiD/LsUtv/d+n/72PApfgekixlz32Bv5Kl8uSCpr74Yt
	1y/Pupw16fpExCjobFN82yK9g1AjGCY9+4oemZj5r3iORQ+4Y/SSu0bCH6ELth6b
	9aPnIiDZqmeGP870o7hc7Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4fudg87m7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785892001; bh=i3NA3T3UGyrfweijHupHkf8uc719mXZgv8TPOL3H7dI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MWdcXYi9Z9+tYYvEnbcQ3CJwY/CFCvLkeC8Zr4lw27iKm4AEy4Gkj6wdpH1hAWZyw
	 92LYXELqVb7RhVv7fCViAaNFbVgIyOp1iFVLnVpZ0QKnokpCcyJM/bmbaQm9FljpRc
	 QulyTEqSObONJbPvSL24gLPjEM5Sa1BkHc6jKkL/F/Q9DReYa3gtezMxrC6a+NHnPL
	 zq5UxwksF52d5e7PKLALrJV6l6flJeCTCeG33s1pvJW1exZ5GG5+grBr7DPXZkQ7b8
	 qiVy0pk97zoUPl36dUnNJbf9iM9Jhgjzv/oLIBfVnp/ryFAmtUHoTErZSBmlBDE3Un
	 1zbsE9I6liJBA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D035E4013E;
	Wed,  5 Aug 2026 01:06:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E7D20A0F24;
	Wed,  5 Aug 2026 01:06:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IH0nFVD9;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 686414011C;
	Wed,  5 Aug 2026 01:06:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dluV493QTHOWfefGC8WJ9BHBp1acCGjSbm0Rtg1Prv2yRpQCXNnFyJIgFCUqRMtoY+cyfDUYEs/ISY2Y0gYBwyzjuUq7sjfiYLWgGZSHn8KUKF79qHuoSrWgXw8AP4goAE2BaEWzbmJPVUi5oSt4PXNbExTCE8SaSopgzp1WKtmAspUFblDpqcOtxOAz2BPtC2hbxkwf7Yieta7l+wVvr9t3sxXW64yvj+fZi1EJUgJBp7H/HOUd9YlPCFOUsrIfQqGvxLbjl4DCVZdx2sTo8PBxmbAvhUS/TmzbYE2589tfB4hgeuQVBmcOTnRfLntjhNa4+3BIDQ8q8EwLhg8uGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3NA3T3UGyrfweijHupHkf8uc719mXZgv8TPOL3H7dI=;
 b=H7Pr5FAfBJiPqCh6AWjcw+q2oSNmVF+evStC5ziEmY13PIm+q6IdL5tkHTmeezanMAPdZP/sG6svUEkLO3CwLLVJwU2xtl2xVRxIS9gIxfhh5tJ0bmoV2sYBpwdsnVTdfq3Ld5tPgl2dDvMlt6Op2/APGA8n/tCu+DjMlZHfZsGnABLGAp9+Yf8DlxMld+O6HsdGvPY/+FcDeuwp3mKEBahwirX/4mYrC9WcpE6kkimi4kxwXm4jyBUPeswseKd6vjMURJr9l+gIqkk6OBuscl6qrp191dMR0qMeUaXloR3bbz1ACUs28qLwQW7a6gF70xxnDjBB9vmNahvLSKvRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3NA3T3UGyrfweijHupHkf8uc719mXZgv8TPOL3H7dI=;
 b=IH0nFVD9iFiJwCGPk0WvnZFzbuy2jpybj/PKgzZHPTtMuVu7qGoSpkg5/K9YVCDhjXa2MB/ePRWOJ2TiFJiAldJZXTlmkEONO8oYH8QBnfJnypud+I1g+P06PPP/CYA3ScJZ+C4d/aW5f0Kgr+t1MsUpHPSfEPoVdjk60AtZZiU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 01:06:34 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:06:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Fix use-after-free in
 dwc3_gadget_free_endpoints due to race condition
Thread-Topic: [PATCH] usb: dwc3: gadget: Fix use-after-free in
 dwc3_gadget_free_endpoints due to race condition
Thread-Index: AQHdI/cS7i6IkgN8UE+I9AFNhXpdAbaOpWGA
Date: Wed, 5 Aug 2026 01:06:34 +0000
Message-ID: <anKMP_9HiQzgp35o@vbox>
References:
 <0ee247a4142f77eb8d38581d0b31beac7621b474.1785837121.git.xiaopei01@kylinos.cn>
In-Reply-To:
 <0ee247a4142f77eb8d38581d0b31beac7621b474.1785837121.git.xiaopei01@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH2PR12MB4197:EE_
x-ms-office365-filtering-correlation-id: 71358d45-34c6-402a-0fb6-08def28dcb45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 6ALI1RkSRj4kdl/esebXLuwWHf1b7gdQc4lH3ToOyqWZMO+mB8bfsniwTD7ti+v+ypXQQoSW/6TFBquBPij04s7mpAZUA8oBZH6K+tjuzy1vXTNQztI+4qafwh7JGVdt1KBcCzn3QUR1KJL/AHWQFwUEfopLGW3J/TaGJDB7gfQtoAQ9wpD69YMIhnaw7rh+bdqhrnNkOkJg5Wt/BBLbWXNELEyaLlnuV2bmssI/v1MF4MZ4I5MGi4UcfavDz5dHw8Djs0ZZRnloofjkGpGpudr8+ZNJy2n16JB1+raJDNc50EWFqwgANH5F2YqzD/ESMtzLw6egM7jUNW1fVhaU6FiE1CgEeM1xZ3PKC5OHYspu4FMjTkCw7QBe6bn/FJrFXFq5ffZbnWy4kQTnXB3qJ6LnLOqt9pkuB83mDu88SGf0fwAGcNyjYddkC+3NN9SZljpavW/KjGwbMwEMsK4wZcbjvBKM8BN99TI4JUy7cIxYHvniJ6qeJzr8jIgA78u4AHUSvf9+GXFWvz3DrGuZKl512q5Bl5+dD5JNFBpTrew9h2qhTBGfpTrzxa3SHv1eS6T7HRFw37JbFLrPg8sfaEqXFsxFMPNeJ6meRx8wrWazm1ClEG47m/wAuTrIOU+XupLpP4TmpkTS+BwAVeYkbKFouAnAzVEny1fqj2j9S6dY9A5iv1V2339vu753ASU6LKuNvhf0irecv3P8tzV0HFyg9Fi2/cdGAD2U9pRDdPU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFhWVkpaY1oyVkl4NEtYMDI1b0RBVmZENGJxbXM1Qit2cDVQYUxISXIwR0Yv?=
 =?utf-8?B?L1ZYRCtrOVFSQkR6dGpCdE5CRnhsQlVMWDlNS0NEUVlRTHVxTElRdjh0UkVM?=
 =?utf-8?B?NTU0Q1N3RjV3NjBRNWdWaWhkQ1pEdFovNXd2eVo0YUhFU0R5WVZqNVB4dTFT?=
 =?utf-8?B?dUtmNTE0U3V6Nm9oSi9WYlJrdkJMcmlrNUNaSm1pOE5EYThMR2FqKzVUWnVJ?=
 =?utf-8?B?aWFDZThkNVhOZ215RTg1TUYrUkJDV2FvUTlCeVA1ZlJacElzSlpjcmVWYUJw?=
 =?utf-8?B?UzRTS0NKaEQxWVpsMGF3OXIxN0F4QmRGdWxqN0RlRHF0bnlKOCt0ZVZlSy9m?=
 =?utf-8?B?VEtiMXk0WE9LN3gwUFp5UGp3eFlBUDU5L1NPNmJzcElUSGVrNXdQR2orc3Bv?=
 =?utf-8?B?cVFWaWI5NFdoRHVLcXV1cVFqd0pObmFLc1EweFdlWHNxMndOWDNUbURRVFU4?=
 =?utf-8?B?VkIzUy84Wm40QzVjQmNYQUdTczlSbkYzZ0l3cWl3UEN6SzZkSXMxL25abHNT?=
 =?utf-8?B?anVSUGZ6MmdWcXUyOE5QS0lWMGVER2U2c0V3QTlPdzhGaTFSclZzMDRQeTFQ?=
 =?utf-8?B?eSs5dytuNVhlaUg0azM3d2F2TCtKS0RXQUZ5T2lPdnBpdEY1amdDOUw5Wk9Z?=
 =?utf-8?B?YzRiY2tqL0JyRGRGNWN4SmUwbUpkUHBmNWR0cGJiSlAyTjlkYVpSNTUydHkz?=
 =?utf-8?B?RFpQeVN6MEZBOTY1bWdrclRVOFpiUVJaRGlFR0lEM245Rzh1YUFjOTVoY1pM?=
 =?utf-8?B?N1ZUQjdneGplY1MrVkJzSHZQOE1CYVFBSXhTNytpOVNweUMvNzJZZldtVTg5?=
 =?utf-8?B?Wi9vY05xY3RXMXpxWE10UXVxWUIxcTFoZ0Q2ajU3cmpxTC80RmtaT0FyRDA5?=
 =?utf-8?B?U3lQMytjOU5LVEo2bWI2VU14VFVJNWRYUm53UG0vT2R6T2RSUFNSTWtqbTNF?=
 =?utf-8?B?M2hCNk9iaG9DYUJKYTFIM0NCZ0pkc1ZXT285TDhiZXVadzQ0UzF4ajRoWDVH?=
 =?utf-8?B?Y3VQNTlXd2tISllFNDkzODMrViszMzlQc0xHMDlVT2R0aHhMVUtDTWp5Umw5?=
 =?utf-8?B?V0tsYXpCTDc3VkFoeXFDUFJIZW9ncXpVNm9DaHJreUVmNS9YcGxndHFLcGk3?=
 =?utf-8?B?WUk5VnBBMFFBNFZrQUFYMTRoYTVmMW5QVnY4bGpPRk40ZU1xVmxxajJYNVpO?=
 =?utf-8?B?NmJvdDNBeHdCWlhuTmJTNUJrN2RKOUsyb0JwVXhHK2tpUXZNSldwQkR0aFA5?=
 =?utf-8?B?YU9PWnp0ZTlUd1hVUHZDYlhjd3dBNXRPQWpyWDlLaEhlWlJlenJqbzBXY1Qz?=
 =?utf-8?B?VEFxK0xkdGlSUkR3Y1ZvbnRQa3I2MnpEMWtyMmdqMXlWTFlWK3FFZStpUUtD?=
 =?utf-8?B?VGoyOXIwZHRzbHAvWm0zN05vQXphYklyTTlHR0U3ZEtMc29BbmhqZCs1c0Y2?=
 =?utf-8?B?ekY2dTd2L1FxNnlpR0ZPRlBPUTB0R3N6OXBlRVorWDNrVGVac21RVmxyQmJI?=
 =?utf-8?B?V3Buc2U1eFcxQmprZmwyME8rMkRwTjFEWk5sL2w3YktkemNNSytPbmRKUmZF?=
 =?utf-8?B?TmZYdXM0U1hOTDI4NGg4OHo1YXJRZlROTFUzeHVleWdXUnZMRmlNb1c2R2xy?=
 =?utf-8?B?cGlLZk14YUVIZzZ1SlVCSGhvZm03aUh2RnBBTXh4dEwyeDUzQ3hoVzBHUjEw?=
 =?utf-8?B?akQyMVlCMi93b21TYjV1b0FMWlBYZlZCZTFjQWhzdDdRdTFsQkh1dnljcWkv?=
 =?utf-8?B?V3k0cDkvckgyQWljU1kxcXl5S3E5WnlYQWhWdVdKcENNVkExenNOaWpLNDhX?=
 =?utf-8?B?azYvMnVtcHBxZHFXYmtFVVhiRlh0Z0YxY29ldWw5azljNnJkalp6SkxDWmRH?=
 =?utf-8?B?b3J2Sm1CaE1aVUI2L3BpWGZIUFBsb1MyMUpLZFBKV2JSWmVyeHQvL2RJdkZx?=
 =?utf-8?B?amNIbmNqMkNjNk1mNmR6MHQvYTRsMlpLWllLTmkybmphQnFFNGYwMHNSV1lp?=
 =?utf-8?B?d05jR011cGlRTVUxa3JKRWZPOTlBR1o5VVpyVmJYaGVtcXlqMGZDR2FodGxI?=
 =?utf-8?B?M3JrVm1BYW80aUc0VHpVYU5GdVVmZml2K3Rob1NCb1Y0WjZXOUFyZWRzNEwv?=
 =?utf-8?B?V2tyVnhnd2gvYlZBZGNYTmY5TVhmbkdjVmJKa3VwRy9kQWh5bnBIc1JEWU9s?=
 =?utf-8?B?bEp5V29DakZuYWNQb25ZSFFwZkpwNjZ2d2dLMWFDTWcvcjhMUksxcmVaSWFB?=
 =?utf-8?B?RTlIVE9KVUJXQmNPVmhqaFBOdTdSWWVqKzVZdFVWczBvcmMxbldheFA1REtm?=
 =?utf-8?B?ZnFRV0FGankwbG1tS0xvdDVPaHg0WGIxdXhmOUsrek55Ynp3cG5mdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FE73248B503E44CA30C7E7E5C45140F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	oXv8BTPtbkvBtc4EVefAFlrXIWCV5+145rnHayW7wgZ3Wbji8YxgnwDuetFPWo1/qy8QFKAsyrEjH9pyBC/nIEV/M26qCWWe2PFXg88cLnCMGRyY6tzKQYCaSjd+/ElJUENr+0C0QA2fCreMEtf0IjvdWiKKtAO4FWdnLfzzr64o/kNUnyWUqmwGMAuW9WPFrrFujNP8aT1cVhiAXtUyXX4FQOzUx+5AoyWXOOsmZJcQHKhhqK2WdFuSaPT18KOdBAfVHvnEsuICDeWNykFxz/n+MVjoWj3ewli4SQmWNTW8M97ZjJ/4kp/OH12fEjFsqjA5dNEVyfQwrI6/M+LgGA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e+bhXfhcMzMNm+IN+Iv4PbKwHA39Tf8XyCNKW5j4GzWHdHRASatT+DfJeP4VFDvYAYN0d8QHy3jChwCZIPVcfePAcsOd0VdAR9GcWjwDlHszuGcdqJ8fkd/P9/MFLRGPHf+QRiWbX20GT+3PZSkHn8Not9dyorie719k9S9qH1bg+9Ym27/OhkNvOvNzzTHzVtJ5gtu9O594nEEM9qp05MY3Ov72lEvTCT8v7dL1ec186eLNSoCks2BRLMIC9o83fVviX6qlV1cwWztLfF9DaCccatiu4AHa6RTZVv+PR58O9hRqbsGDISQviquolxaY9mL8+wNkb6IXCKsVMpRgprI3KlAxvz7u2qXIN+Qc+nuitckCjQqCoSAbM5YWae44JsCi6CPqM7wFb/cHCOuyg4/ynS9WVCydKPRl91/M/AcuLxGeSlFXKMT9esDli56Sc8aq1DThMvg8kTJYmIsUoz7Vh69fUiezzkYNlstXvWA3F/Sn7BqIwbAZqMieaOYQpJvsJLeZnG00737taWTSIABHfee92Xhf6Lz92oj4bWUajRlsM7bOB5QHzS1SVW9WoSYTocLUU7DWoinu0D0DDioIefxdCpYanmthGGA37AGNCIyiMp0SCgmpsgQdsZsSx/NC2pLc3i4YEfBzxDRS6A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71358d45-34c6-402a-0fb6-08def28dcb45
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 01:06:34.7209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGoJhQpCYV0Oobv4HioUOppwMwD8zqfLYB8N2CK3VNv9uI/9mSbZNqto7Xte8CqbJVTt+WaU4eG2ZNPAYNLI7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
X-Proofpoint-ORIG-GUID: a-vL_MBss1M5BbqKnZN29Qq_6lGXEY7O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwNiBTYWx0ZWRfX/aFC7+j+EAdT
 Fq3Yn23v/MfMoWl7oMAYsuZahSogsUba4Cmi+b8gbyr6zOt+/XKAThp7H1c4m06ekxVTaCndWbV
 qzjJyfu4yIpXpsPrUCjenPfhTcZt8Hg=
X-Proofpoint-GUID: a-vL_MBss1M5BbqKnZN29Qq_6lGXEY7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwNiBTYWx0ZWRfX2TTSOI/hMYZM
 wx72Bm7CmTJZl3CgwSFxmiwRlJuwxvvMlkvrlmjPnnmK4/HZJGluPHIlWQ8n91e1KDWcXWA6VLW
 j7gjcZ+e3XkRgwoTID6nip9IjEMWmUwO2P5ZbVNru7C+i6E7J5fH1REFZKaq+gzqp5o18RGnfUd
 Vg1Yn8vC07Wc7sN/1EFVw8o0yHwv7ldihKiHN7hdcsgFNd+GaL1IomWKdf3P61aISDQfxN+PZ8p
 ZxicyjKAhcNKMS3ebcdhV4H0+JP5SjNWuku2eImBQJJfxHaeZP7fCAdBwsxl3yErywHxyVUPj5Y
 U0PwqFIodqzMTnyithjP2uxe9+lJYky5ferKR+dAM2P90K8VRtv8U42gmiJ0L9RU8U1ovye+TPA
 xc3gCe/iunSAaJVa2X+LNEDoWS0bUVR6ejOYcvTAl3tF5SA1nkVO8NJ0fJvRQnOaOeUNYmxyTZv
 0zYW7DBfLYQybbdQ/Tw==
X-Authority-Analysis: v=2.4 cv=PNk/P/qC c=1 sm=1 tr=0 ts=6a728ca2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=7ocSDdfxPD6pPtSjtIIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050006

T24gVHVlLCBBdWcgMDQsIDIwMjYsIFBlaSBYaWFvIHdyb3RlOg0KPiBJbiBkd2MzX2dhZGdldF9p
bml0X2VuZHBvaW50LCAmZGVwLT5ub3N0cmVhbV93b3JrIGlzIGJvdW5kIHdpdGgNCj4gZHdjM19u
b3N0cmVhbV93b3JrLCBhbmQgZHdjM19nYWRnZXRfZW5kcG9pbnRfc3RyZWFtX2V2ZW50IGNhbiBx
dWV1ZQ0KPiB0aGlzIGRlbGF5ZWQgd29yayBvbiBzeXN0ZW1fcGVyY3B1X3dxIHdoZW4gYSBERVBF
VlRfU1RSRUFNX05PU1RSRUFNDQo+IGV2ZW50IGlzIHJlY2VpdmVkLg0KPiANCj4gSWYgd2UgcmVt
b3ZlIHRoZSBnYWRnZXQsIGR3YzNfZ2FkZ2V0X2ZyZWVfZW5kcG9pbnRzIG1ha2VzIGNsZWFudXAg
YW5kDQo+IHRoZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBkZXAgd2l0aCBremFsbG9jKCkgaXMgcmVs
ZWFzZWQgYnkga2ZyZWUoZGVwKSwNCj4gd2hpbGUgdGhlIGRlbGF5ZWQgd29yayBtZW50aW9uZWQg
YWJvdmUgbWF5IHN0aWxsIGJlIHBlbmRpbmcgb3INCj4gcnVubmluZy4gVGhlIHNlcXVlbmNlIG9m
IG9wZXJhdGlvbnMgdGhhdCBtYXkgbGVhZCB0byBhIFVBRiBidWcgaXMgYXMNCj4gZm9sbG93czoN
Cj4gDQo+IENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTENCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgZHdjM190aHJl
YWRfaW50ZXJydXB0DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgZHdjM19lbmRwb2ludF9pbnRlcnJ1cHQNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCBkd2MzX2dhZGdldF9lbmRwb2ludF9zdHJlYW1fZXZlbnQNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBxdWV1ZV9kZWxheWVkX3dv
cmsoc3lzdGVtX3BlcmNwdV93cSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgJmRlcC0+bm9zdHJlYW1fd29yaykNCj4gZHdj
M19nYWRnZXRfZnJlZV9lbmRwb2ludHMgICAgICAgICAgICAgICAgfA0KPiBkd2MzX2ZyZWVfdHJi
X3Bvb2woZGVwKSAgICAgICAgICAgICAgICAgICB8DQo+IGxpc3RfZGVsKCZkZXAtPmVuZHBvaW50
LmVwX2xpc3QpICAgICAgICAgIHwNCj4gZHdjM19kZWJ1Z2ZzX3JlbW92ZV9lbmRwb2ludF9kaXIo
ZGVwKSAgICAgfA0KPiBrZnJlZShkZXApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
DQo+IC8vIGRlcCBpcyBmcmVlZCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBkd2MzX25vc3RyZWFtX3dvcmsN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAvLyB1c2UgZGVw
ICh1c2UtYWZ0ZXItZnJlZSkNCj4gDQo+IEZpeCBpdCBieSBjYW5jZWxpbmcgdGhlIGRlbGF5ZWQg
d29yayBiZWZvcmUga2ZyZWUoZGVwKSBpbg0KPiBkd2MzX2dhZGdldF9mcmVlX2VuZHBvaW50cy4N
Cj4gDQo+IEZpeGVzOiBkY2ZlNDM3NDkyZTIgKCJ1c2I6IGR3YzM6IGdhZGdldDogUmVpbml0aWF0
ZSBzdHJlYW0gZm9yIGFsbCBob3N0IE5vU3RyZWFtIGJlaGF2aW9yIikNCj4gQXNzaXN0ZWQtYnk6
IENvZGV4OmRlZXBzZWVrLXY0LWZsYXNoDQoNClBsZWFzZSBpbmNsdWRlIENjIHRhZyB0byBzdGFi
bGUgYW5kIHRoaXMgYWNrOg0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA0KDQo+IFNpZ25lZC1vZmYtYnk6IFBlaSBY
aWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYw0KPiBpbmRleCBmYTBmMTZmZmFmZWYuLmZhOTQ0ODU2Zjk1NiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jDQo+IEBAIC0zNTA4LDYgKzM1MDgsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9m
cmVlX2VuZHBvaW50cyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQl9DQo+ICANCj4gIAkJZHdjM19k
ZWJ1Z2ZzX3JlbW92ZV9lbmRwb2ludF9kaXIoZGVwKTsNCj4gKwkJY2FuY2VsX2RlbGF5ZWRfd29y
a19zeW5jKCZkZXAtPm5vc3RyZWFtX3dvcmspOw0KPiAgCQlrZnJlZShkZXApOw0KPiAgCX0NCj4g
IH0NCj4gLS0gDQo+IDIuMjUuMQ0KPiA=
