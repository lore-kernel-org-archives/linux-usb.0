Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94839A4D8;
	Fri, 28 Aug 2026 22:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956838; cv=fail; b=hy9fqP8tdsI+V2seEsKBs/LElJryJ+5d5KVSqFPGBVj6vIexJE3BZHZmCwn2zwjsxdXH3Az58m7yFUjEM0Znq06WHAXqRfoCXYpsSsZy6Z2hieQ1siYppedGX5UCcWyyRpL//SUEOjWp6dyyABXaY4S4VfSSfotGqK4VcQbwYDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956838; c=relaxed/simple;
	bh=Q6YJH424kvRnI8EsJphBKpBhO5ZF850FjIcN8B1/1EU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iLSiDIvGU0gc9T3IC/ZdIC8hDvzfxzteKyfOMVmN173SyQoHj8dGOxo6PopEY1JMrThYO6lJQI+xzMZnBazPv+6yAzW6A2ot6Z27wvwmkAetARyv9Z5mdyfdhUoCBIyoooa5oxmigUoZjBCM6X2H83K2Ianx9XgfodhHPSH1L+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=REAE8Dzo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QKuiw0AC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LdfBQBUN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="REAE8Dzo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QKuiw0AC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LdfBQBUN"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SMTskn858243;
	Fri, 28 Aug 2026 15:40:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Q6YJH424kvRnI8EsJphBKpBhO5ZF850FjIcN8B1/1EU=; b=
	REAE8DzoAADcrJt3uUzTqWpguwYAo+vkNQ6nR6vI+tsaC171QyvbxCl15BL/e8Bs
	Tjmijv8C2bYol6D4PbiKGVH6UFarWI6Qebwov8veKB3eRMWu8T+WNFcZs2u7YTf4
	/+H2Bpor3XpCx/Hmp1NKFGhAGNXw1eg3XO3BAZ+VUPOnIbO03tQSwkGQNcPgs3N9
	OwHThsSitf+LibQXPvpa4QghEywpujSMaXM4uHyY5vmmL+wG38KiLiKkILFj6XGG
	y0U+c3KeSNuzblfVUBiTtomo99VGlmAX3Cke5Nj7xEuiSlBv8iuO22zKck82GFCS
	Qka9v11967n9eEGiXGweeg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gb5cp5qqj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 15:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787956823; bh=Q6YJH424kvRnI8EsJphBKpBhO5ZF850FjIcN8B1/1EU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QKuiw0ACKlsRSKESozgIxdd4BCnnTq2Amy+SdjtfBw8HZBE8QpwFbaoX/8w6b3sRT
	 ZYDzlPeRNFr/Z+ioAw9wBwVDn1/pRtWIbSLTpW0IdB7KNNWSNbOnobRkgtmRBiakRO
	 yyHWzvjuP5coxeqIgA5DIymf4HFxC2DmrMkr5EgC1OmTpLKZgdWhF2jZgdFzEeX6fe
	 8FaggE6ZKRlLsacq8YlaOdmFpjwyYWwN5cjh3Q6POe7E7UHc5eGh/NtnmjTejoKaKU
	 0x4qTPnCwRWRnWH41mCM+K3QMkXM+gyfbgBXGBY6MQkWIduLxeYpvDn8nadbTTun/G
	 7UASogNg/PbDA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 71D2040347;
	Fri, 28 Aug 2026 22:40:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 124F2A006F;
	Fri, 28 Aug 2026 22:40:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=LdfBQBUN;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00304.outbound.protection.outlook.com [40.93.1.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AB4112201E3;
	Fri, 28 Aug 2026 22:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+/2iVMvGgcMqDCmdUtM8NtRDbAlWJEM+tukOMIgiic8QkTBwNHe0LvqEa7X2k2P+7KAu279rE20qVmulYkpYFP8Akfe8yu6gzVo4Tcc8M/uNIPq1x+cGZf1tluFMWvrWLLUGV6Q0177Nyj1Qpg4AVZHxossomZ798Wd5uZrcwfLBcwHbq/enay8CIctgzw1PPxb3fk4mTLvH2HEKrTDzpAysf+B062FXNt0l0LQEk5hmUX21NiML/Q1O60enHt88mjq2NREtqXIY6sI0ogeBuZ7gLNYLGvyng47UIPGApeH2FmoZvVACSXBNnY8kCAi5Cm8LCh7N6Z38vM6L+iohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6YJH424kvRnI8EsJphBKpBhO5ZF850FjIcN8B1/1EU=;
 b=dQO8/5Y+JtSR8Wyw/DQHtLDYnyTLk/G6bz4Tbh7SFntQIVCxNhyy1zv285T+tGyypQQ0SdeqWiQw9iX3LT8aW9ImsmpztkkTthQQ0w8uQqFbdm7LP7SH9pBW7V2arJeV4LGPUvbkeEc6ZV3ox/xL6ZRWvw0WB11Od98vOV+VsxOhQ5uf4vb0t95aUNVgoZCFnxCgnz/D08k4Mf+dXCHJ7vIoan/WyN6tcFT6x74J+Tg/bwSPFWvTDtK0jvA9QNb7ATkGL00n/s1q3itsMG/SbFe+1lTJfgD0ZIjMS+kJla14AfUFIDCOuyYvN/T0UQoAj7Vu5pdIgupdJad9KIuB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6YJH424kvRnI8EsJphBKpBhO5ZF850FjIcN8B1/1EU=;
 b=LdfBQBUNu64pgmlduYymBhMoqtW2inauaDo1HpB2S5IjqVllRNwAW8znPB1+Ru3r7v013sK954gx2PjuOPv5y1PiRa4jwacbncoPjM8+jQWeWqylJVnm801DM9LGTZ9rdfINazZmVKLq5M1bKaW+0yCEc6L0kUnru11PBI9oVuM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Fri, 28 Aug
 2026 22:40:16 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 22:40:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdNxp9NdtCDifOw02utC0RS08PD7azyilkgABD/YA=
Date: Fri, 28 Aug 2026 22:40:16 +0000
Message-ID: <apIGMJ6wveRRRMCv@vbox>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org>
In-Reply-To: <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB9422:EE_
x-ms-office365-filtering-correlation-id: bc62e975-a79c-4034-4699-08df055554bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 p2ILIk8kQjQkxN86a31QOUWzULtFtJXTCr8Vm3wit7dKBtjsLD9P6KjwSO42vwsnWKd9fd2NayYNSAoTN6WLXdcOw25CrlPWEP1hoqrQxgBI9nWIneZO9cveB42NRsPTSRTjCfbA6cpXpgzaolfRhJGf+YB4l3EWd6q86y6s0EhauZpkjyyk+Ru1X1+0pMurivprbHIn8zPj99cR9ySKU5Z589zwvyLIvsTjlo0gIbzOVeEXjKmvPFZ0swk22d6UV7Hrtf6kR7jhDUjeW7MtoInH/lh5rfY91jU/mstG/oahRBWIdO2r9Q/EYkKGLwMJhRRNAThdCWPQIY1K4Br7LoXr2yUfuWqpna+nS6tfZE5s+RobyXxwg5MmWWajChBZ4O4zcPoyVkPBPq3na8UmH4+5iHOg8tJLfAmFLW0XK3MxNAKgk1Y6F3GQ+wgIjzRKUrGHel7FQp8faHJ3WfHT9w/H8Inv16AneBXzAlHT384kcwpFt60ajsPBQErAB/8NroEr8KzvSnad+Mmvlfk0lsUGiRVcV/NWn/HV4RvTHGOS1Pieb2paDIwMmk+CpSsQA8IpWHFOx1b3gpvGUMLs/9eTebE2vJ+IuUT68D0RzZPMVcPb49fAMeeddAmi3isCVQ4t2EThNmMq391TQWZF4vN9QtLS/3m07FHGGlrUv2dG611qbfR1O1UVP7KLbuZktPGLXRY+ywg/BihVfxMAfBrEOej0ctzAKagbsvHHWmg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG9IUkVPNWdMY3lFVzI0MmtHaCtWOFdlV3AyWjJNY3BGeUVWUk0vaHVOak9O?=
 =?utf-8?B?Q21uTExxRmpSTVFqcWc5Q2piQXVTVjdHc3NXZVMzNmo2N0g5MndxQU85T1gy?=
 =?utf-8?B?VmVURXhaUXBOOXd1UHBmUDR0bFpLaWVuOUg3T1JYZkZRQkdTc0JjaVhEODdT?=
 =?utf-8?B?dmZPWS9lRU96NDFNM0NPSHVzbHZCalMzQzBzOHpsKzdzNUlEWkxISWRCQ0N3?=
 =?utf-8?B?RjJkYUIzbGI5SDlYdEg3Z3VxSFF4YkpDckxlU1Fnc1N2a0owcmRBMnd2NDB6?=
 =?utf-8?B?OENSNFZYWWpLZDFGaGd0em1DN1BUcUx1SFVQd1BGd2NjK0ViTEx4STlGUWo4?=
 =?utf-8?B?Z29XaXY5RlN4UUU0NkdnM244dEhLcW9QczRDLzhFSHdJSE02SkFleWtlYUhW?=
 =?utf-8?B?R3FWbUFNcU1qK0MvZU5lVGs5WittbTZ6YnZ5L1NrMkhRNk1FRlRQS1N6YjZo?=
 =?utf-8?B?Z1RsbWwyK09XeHBnM0pMb0w0OWJkMld3dTBoem9VZUExa2FEMkFtRlBoTVpC?=
 =?utf-8?B?UEtiLzhCZEdwYk1ESjJHc1RsTnlWam45MitLZzRtSUVDbVRQSzFjdDlXK1l6?=
 =?utf-8?B?dDNrRHFIMXBxdlZWY1FhTjQ4cFRzRlAwampETDMrcXo3ejROTWxiNmJ1d1V6?=
 =?utf-8?B?eCtSRHUvaXViOUJyS3JRbmxyZ04zMkFDOTFSa2ZXKzdnWGdnZ21TMFptWFVi?=
 =?utf-8?B?UjkrUlFENHR1MHFUbTkxVVE0YUpkVnVvNWZic2VKVUhpamowTW9RU3dPdjd2?=
 =?utf-8?B?ZVVqMkFkV2Y3VXlCU09kZHl6ZzdZZU0vRzZLY3VkZGljaVFuZCtmZE5oeElj?=
 =?utf-8?B?ZitseFB1N0ZvbGdlNXF4c0tWU1JFSEpBbTNoYmMwWGxMQzJmMWd3d3lYd1Ns?=
 =?utf-8?B?QmdPalNYMFhtR2pDRmptQnNRYUtqQytKbzd2Nm52RTVnQ2hXc2trVWlkL3Nv?=
 =?utf-8?B?dno0Tm5OaWtub1FpRVdsaUNaY1Jnb1VaWVlicHh0YUI0NVRqaFU5c1hzT0Zt?=
 =?utf-8?B?L2c0Y1VReWhOTmJwT25lcHdxbXBpVjZuZnFtTVBXMjFSRWJVbUFYallKbDZH?=
 =?utf-8?B?aTVaVS9Tb2ZGSFY3aG9LQ3FSUytGVGxRNzlmWC9OZ0UwZFdDeExUY1luemhE?=
 =?utf-8?B?L1I0MFk1RDFIVnRGRmZMOU85bUkvRkFiSmp5c0lsb3Z1alhNaTVVVGZ0cG4w?=
 =?utf-8?B?MVZ4bWVZbkRrLzFBa0RLZDFhY0hiSE9mUU5ybWgxL3N3NmR5V0NSaXlBaC90?=
 =?utf-8?B?T1dXaUtwUFRmYjdpUnB6NGVScDdiTjI5WDhvYjFjaUdIUW5YSGMvNVFrSXhY?=
 =?utf-8?B?NHZhdWNWYVVOYVc3cVYyUUNsUUtLSUFBNE1xeXU5alRlVnZWRWt1b3lLRmdZ?=
 =?utf-8?B?Mm85NXdYU1ZteWsxd1c2VnZzRUtIT3hEQ05qUG1pRkc2WThFeXdaa2FIdnYy?=
 =?utf-8?B?QTNuVS9MRFd5eWJHcit3ZVFoYWZFN2kzWXNqU1k5a3Z1dHhSdjcyeEJKekhK?=
 =?utf-8?B?YWFEWE4zMmJrK2p1SU9vNUpmUnlzajlKMWV4aDVvYUhueXBaVy9QeEVCbnRp?=
 =?utf-8?B?Q3doY0dObWwrVU5PazVvNWhYcUVxWjgya284SVlOZk9yR2tzYU4wcVBtT1NY?=
 =?utf-8?B?eTBWRGRMWFFwYndLd0VIdGFsR0xYVEZHZmxBdDR1NjdzNWxpV0JTUE9SWW01?=
 =?utf-8?B?NnhjcERhV1BxNlkydEJMaHo3UzhXaDNJRkUzT1NrM05neXNTZ0NUUnZTY0Y5?=
 =?utf-8?B?Q1VaMmlEdjR0bUxobi9pcWxENDRHak45UGhWSVA4QlVoL2dBWUxtdmVGVjlp?=
 =?utf-8?B?R243K25GYktXb09rSmhPYUpHd2hRVFBSY21KMDhwTEhVZGhSc1hveUFxTG1F?=
 =?utf-8?B?WVY5OG5UVHF5eE9FUXIvbDRPbXZFeXhxNnlYbmV5dXl4ckp6K2xlbXlRYjBL?=
 =?utf-8?B?djY1THcvL21HY3VFTldxV1FTekh5UVAwTVMvdmRXNFpwRjNtSmdhN1Z1MUVx?=
 =?utf-8?B?NS9MRVR5cXFpMU1tckJpUk5udWlyRUxVU2JoQnpScnVNcXJBOEtTWXRrMFNM?=
 =?utf-8?B?dnNKaDROTFNUMllIekoyUmJLVUxNdWM3NEY0RVN1Y3psa2p4RkRzUHFkWEtr?=
 =?utf-8?B?OThKUnN5Zm9zTk50SHJRN1JVWTJPRG5FUjhlR0ZjcVZNTXhzTm1wQmZZT2t6?=
 =?utf-8?B?dEJpbSt3UGhqakR4ZEZVN0ZWRmRoUi9GWXREbURLcTZ6UjUycVp2RXBISlBR?=
 =?utf-8?B?TWp6NEoxWDNSY0hMNGlBSHhHdThkT0N4V2srM1liVlNFRit3OUlsNmhSd3FH?=
 =?utf-8?B?ZC9RNkMwZjFFcGZjd3ZqQTQ2TjNCRGlOMnhKbFdHa3dyMklET2h0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22A4F3A2D8D9FF4E820C809457FAFF06@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	2v3wkWyugk5ckjomK77aG/c9NHK9fEACUD91NeN1XsH+pgIhLiMuV27/+9BJ7RtSuwbwSlnV3YYTWPAxSj47wPAiSZwt5Zemzr5sbg+9L7YMqextBI7nlK/SkiDKlGk4IoHcDyW/yhDYDaCuU9XlvAxmPomqLEp/DO8BU6UfCPV6N68SSXOkCVWkvz0wOt2ItQ1vGnrGXAt6xeF3B66igBBYtRjwuwrK6WkDs4ICaFGDOniAGQForynfQxN0ZRUmZrMkiNTyFQ9AO0IPt88HvsMAlADaIjAXwiu3U2CYBjfnaTrxEa8YLg9GYg8ub4INfbiGwHROkkXE5hHKWOsLcw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l8aCVEZB/R1wTFgQ+/huhgr45gi7alee1LBlSHKX9XHc5U4XGRO8AKzBxII1JNiwtiyi7AV5TX7wpdmJv/6omIpl9AfQZd/H8q43mN2akS4Rb6Xo7pC0312WYEALXSo/jeEYGqfFQaOrbHfUx5cYJmzj20O3w7d+I4dsrUERu8eYmrWlLaB8P6Rz6SmOgbNZKUUKH/GIMCBFWTDeCWTr+SEyaDyl6u08m7EiLofJEEgpYnUwf5u280bQqhpQLOaXmD9WyJIx6g8dq57RtGzkKMl6WzuibxDJsiDfaoDAgTqJsiN16VJf7fXUW41517O/7oVILs2gwA6OHoeiRJXukwy/RJUXbP3+hdguAVI5QENNgw9GllBTcAtMlSj2kv35vbrkQbHSGXuVDLQcA6wnp2osGT9QmWYEmfyKSDFcW1qWXxag8YNQUP1M++l9RR3ZxgmACixnXosj/FG+W7jJ3rU0Xhk99JlMJvs1MrkluvXd5gjeSpSOWoRn0njjomTKpeLa9zx/rvUwdXB28m/7xrJcM1NoJJ9JJsHGfvQ0xKZWvSk9NeddyooKEn1tZnlFSYREyiWbiuzJxu0NmIfmDgEFyt51B8/kWc3lJMhosP8DIshuLeFfQ/zAizjEvhXnLWBSoJutxzOFmWUk/yhUbg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc62e975-a79c-4034-4699-08df055554bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 22:40:16.1651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vSP/J6r0fXStyKfqg129E76EyRMeZk9wNE3I6MxaKcFns6kzCX76f76cFuXnoE+4sCsKPFU9J2vbPKjIzmODGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422
X-Authority-Analysis: v=2.4 cv=Q9XiJY2a c=1 sm=1 tr=0 ts=6a920e58 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=4VLOKRvs9hIyKeflYAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7kM2xWcdPEyS8DlEXZXWrAu2_ACIXxld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE5NyBTYWx0ZWRfX06tX6LfMSAk/
 JPz/+604UOFxIdAbAHrx0SjdE3hpRh0NBUWGBTIA9QQhgb92/3qViOXKEdA3X60X8sZlKqMHTyy
 z0g5YtIylE4U/14k6Ux7FQ2Sj25I1b8xL7Mg6k8YG6odQvSzOhJ1trlXeX/AI38h1iOBfY7PnKR
 6TjWwDi77ukQDgT9yxA1qQuZOuBJ9AZXW4uRgIY8Ak4WsMbqQu/ixxDEVMGejCWrQsW23+Ya8ff
 YASzJl9rTlNpDwXCFeKiHalsSe5ri/LdxJyjGYs49rSuC7rsPZUzyonR20jX7c1PsKvtQdjw6da
 YuVXfiRoMnQz29w4GUWBQjxeRpmruJYy5V3fnNzqbrOq41Iu49n+5GTq7t5edCirVdFlh1Heu0p
 hoHTjY9MRzx7KUsSPF7ufvUC11WzEQrg4HUNVZSB4OOFscyTKIuwj7jqa0xfdrH7CcoT9lFpcLH
 rLqH4KH463EYJmDbWPw==
X-Proofpoint-GUID: 7kM2xWcdPEyS8DlEXZXWrAu2_ACIXxld
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE5NyBTYWx0ZWRfX3QNn8zHBcVQ3
 TK7ncctLWw04U44h4mr3olUwQbbDVyZBjnTkp9XsjcA4JbKP6Zqnmr81VddkNGC775KG+S5LEjl
 H5okGDgFkfJAOcSYNijeyXoO3OydX/I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608280197

SGkgTWFyZWssDQoNCk9uIEZyaSwgQXVnIDI4LCAyMDI2LCBNYXJlayBWYXN1dCB3cm90ZToNCj4g
T24gOC8yOC8yNiA4OjMwIFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiA+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiA+IC0gW0hpZ2hdIE1pc3NpbmcgJ21h
eGltdW0tc3BlZWQnIERUIHByb3BlcnR5IGluY29ycmVjdGx5IGZvcmNlcyB0aGUgY29udHJvbGxl
ciBpbnRvIFVTQiAyLjAtb25seSBtb2RlLCBvdmVycmlkaW5nIFBIWS1iYXNlZCBkZXRlY3Rpb24u
DQo+ID4gLS0NCj4gPiANCj4gPiBjb21taXQgMDcyN2JiMmNjOWMxNTVlNGQ1NDk3ZGI5NGMzMzdi
YzViMjYwMzQ2NA0KPiA+IEF1dGhvcjogVGhhbmggUXVhbiA8dGhhbmgucXVhbi54bkByZW5lc2Fz
LmNvbT4NCj4gPiB1c2I6IGR3YzM6IGR3YzMtZ2VuZXJpYy1wbGF0OiBBZGQgUmVuZXNhcyBSLUNh
ciBHZW41IERXQzMgeEhDSSBVU0IgY29udHJvbGxlciBnbHVlDQo+ID4gDQo+ID4gVGhpcyBjb21t
aXQgZXh0ZW5kcyB0aGUgZ2VuZXJpYyBEV0MzIHBsYXRmb3JtIGRyaXZlciB3aXRoIGdsdWUgbG9n
aWMgZm9yDQo+ID4gUmVuZXNhcyBSLUNhciBHZW41IFVTQiBjb250cm9sbGVycy4gSXQgaGFuZGxl
cyBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBhbmQNCj4gPiBldmFsdWF0ZXMgUEhZIHByZXNlbmNl
IGFsb25nc2lkZSBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIHRvIGRldGVybWluZSBtYXhpbXVtDQo+
ID4gc3VwcG9ydGVkIFVTQiBzcGVlZHMuDQo+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdl
bmVyaWMtcGxhdC5jDQo+ID4gPiBpbmRleCBjYTY5YWMwZWIwN2NlLi4zOTk0YTZkOTNiOWRlIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+
ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gPiBbIC4u
LiBdDQo+ID4gPiBAQCAtNzEsNiArNzEsNTUgQEAgc3RhdGljIGludCBkd2MzX2VpYzc3MDBfaW5p
dChzdHJ1Y3QgZHdjM19nZW5lcmljICpkd2MzZykNCj4gPiA+ICAgCXJldHVybiAwOw0KPiA+ID4g
ICB9DQo+ID4gPiArc3RhdGljIGludCBkd2MzX3JlbmVzYXNfcmNhcl9nZW41X2luaXQoc3RydWN0
IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBkd2MzZy0+ZGV2Ow0KPiA+ID4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0g
dG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gPiArCWVudW0gdXNiX2RldmljZV9zcGVlZCBz
cGVlZCA9IHVzYl9nZXRfbWF4aW11bV9zcGVlZChkZXYpOw0KPiA+ID4gKwlib29sIHVzYjJvbmx5
ID0gZmFsc2U7DQo+ID4gPiArCXZvaWQgX19pb21lbSAqZ2x1ZTsNCj4gPiA+ICsNCj4gPiA+ICsJ
LyogV2lyZWxlc3MgVVNCIGlzIG5vdCBzdXBwb3J0ZWQgKi8NCj4gPiA+ICsJaWYgKHNwZWVkID09
IFVTQl9TUEVFRF9XSVJFTEVTUykNCj4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
LUVJTlZBTCwgIldpcmVsZXNzIFVTQiBub3Qgc3VwcG9ydGVkXG4iKTsNCj4gPiA+ICsNCj4gPiA+
ICsJLyogTm8gVVNCIDMgUEhZIGluIERUIG1lYW5zIHRoaXMgaXMgc3VyZWx5IFVTQiAyIGNvbnRy
b2xsZXIgKi8NCj4gPiA+ICsJaWYgKGRldmljZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoZGV2LCAi
cGh5LW5hbWVzIiwgInVzYjMtcGh5IikgPCAwKQ0KPiA+ID4gKwkJdXNiMm9ubHkgPSB0cnVlOw0K
PiA+ID4gKw0KPiA+ID4gKwlpZiAoc3BlZWQgPD0gVVNCX1NQRUVEX0hJR0gpDQo+ID4gPiArCQl1
c2Iyb25seSA9IHRydWU7DQo+ID4gDQo+ID4gW1NldmVyaXR5OiBIaWdoXQ0KPiA+IFdpbGwgdGhp
cyBjb25kaXRpb24gaW5hZHZlcnRlbnRseSBmb3JjZSB0aGUgY29udHJvbGxlciBpbnRvIFVTQiAy
LjAgbW9kZSB3aGVuDQo+ID4gdGhlIG1heGltdW0tc3BlZWQgcHJvcGVydHkgaXMgbWlzc2luZyBm
cm9tIHRoZSBkZXZpY2UgdHJlZT8NCj4gPiANCj4gPiBXaGVuIHRoZSBtYXhpbXVtLXNwZWVkIHBy
b3BlcnR5IGlzIGFic2VudCwgdXNiX2dldF9tYXhpbXVtX3NwZWVkKCkgcmV0dXJucw0KPiA+IFVT
Ql9TUEVFRF9VTktOT1dOLCB3aGljaCBldmFsdWF0ZXMgdG8gMC4gU2luY2UgMCBpcyBsZXNzIHRo
YW4gVVNCX1NQRUVEX0hJR0gsDQo+ID4gdGhpcyBjb25kaXRpb24gZXZhbHVhdGVzIHRvIHRydWUg
YW5kIHVuY29uZGl0aW9uYWxseSBzZXRzIHVzYjJvbmx5IHRvIHRydWUuDQoNClJpZ2h0LiBJIG1p
c3NlZCB0aGF0Lg0KDQo+ID4gDQo+ID4gVGhpcyBhcHBlYXJzIHRvIG92ZXJyaWRlIHRoZSBwcmVj
ZWRpbmcgbG9naWMgdGhhdCBjb3JyZWN0bHkgY2hlY2tlZCB0aGUNCj4gPiBwaHktbmFtZXMgcHJv
cGVydHkgdG8gZGV0ZWN0IFVTQiAzIGNhcGFiaWxpdGllcy4gQ291bGQgdGhpcyBjYXVzZSBoYXJk
d2FyZQ0KPiA+IHdpdGggYSBVU0IgMyBQSFkgdG8gYmUgaW1wcm9wZXJseSBkb3duZ3JhZGVkIHRv
IFVTQiAyLjAgbW9kZT8NCj4gDQo+IFRoaW5oLCBtYXliZSBJIHNob3VsZCByZXN0b3JlIHRoZSBW
NCBjb25kaXRpb25hbCBoZXJlID8NCg0KU3VyZSwgYnV0IHBsZWFzZSBkcm9wIHRoZSBzcGVlZCA9
PSBVU0JfU1BFRURfV0lSRUxFU1MgY2hlY2suIFRoaXMgc2FuaXR5DQpjaGVjayBpcyBub3QgbmVj
ZXNzYXJ5IGFuZCB3b3VsZCBiZSBmbGFnZ2VkIGJ5IGR3YzMgY29yZSBpZiBzZXQgYW55d2F5Lg0K
DQpUaGFua3MsDQpUaGluaA==
