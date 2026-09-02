Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA422D47E9;
	Wed,  2 Sep 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788316184; cv=fail; b=Rt9tDItdatl8Jr4fZkMX2dO41pt0NtXbATUk+3FpxG60CPqp3gsXX7aTW29S5SZsBdBXIAO1xDIhE6QkIfszifQShW6jHUKX/B1wgnE3X3G0xXKa7oBsSQ26uef2jy7g78Hq4aShkJDQaxjIGf7wEBHAT4AqzFXPwpJ/AnHoKhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788316184; c=relaxed/simple;
	bh=VyDN1D72HnW0X34E3YlSE50dK/Iu3nOuJPD7VsuCO0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tZZeyE8YPynUBCgQdpGB+Ir1zbMU84PBPvgWT8E+Uas4AnKROmfzv4R8vdri9n0o6vz8rBz+3kqdd5sfhbC/8LjuQowVzIeA4tKfaeVCtL/4K5NN4qSI63en+OCRBK5cBmgs+DKUK0LkOKwPOlyx6tOpieVJkz9Fiw7xT99F0uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uBSYp9xN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X72YSCgy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pd1MDIyq reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uBSYp9xN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X72YSCgy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pd1MDIyq"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681Le98d3242961;
	Tue, 1 Sep 2026 19:29:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VyDN1D72HnW0X34E3YlSE50dK/Iu3nOuJPD7VsuCO0w=; b=
	uBSYp9xNpE+11DnQ2Eft/dtx6bXWDmzMjhTKJA16bErk86cwS+LObNVbg8J7z2Qx
	FNDC6hlzr2ehBW0hmO+Ja5vBi74jbYfBhAlh6Bwdbu+15jIbNXRixOJ+Fm/2jIiv
	uoy+421ibXhpomKXV5avVcJBCmGVm9jxfDD6XubB4EKmbD+DHFA3kBf+u2C2wYmx
	CGU6W11LHQvS6ZXE0hQ/Bx7bi1OEiVMtC5AgNfjDWg2vKfRf6UTGxpSqScBZ9g2L
	MEWRetgeNvHw5d1dshsJBgWHBLeJIsDj/8KCQci4DcUYhFBcIrr0CM/CWInxDtJv
	Dt23R2S6MaIA8Gx35OX0oA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gdrdwhk4d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788316158; bh=VyDN1D72HnW0X34E3YlSE50dK/Iu3nOuJPD7VsuCO0w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=X72YSCgyvF7xlfTgVNARFzfKLg/sdIEi0eVcSRQa2ZVTus5AxD6UqoBKPdqTe+LBX
	 DNJChbO5W/Ep6X0vSFXetrfkxhYcQO+jdwev58oSMnU2Aby0+pfIUegwopachZZKfJ
	 zyKwck6OusWwLyjdnlIQOQnjy37gfYWn7Ure9QZy5LmKK1rEuxLp1Ppm9FFgtC8u8z
	 R5dK70xeMUgHkEiCWM7C5IAEZwWjqlZI2HIg7vPdlkWBd92t02Ki1rxc83qN4Cwy0O
	 xxyp7OS/KgJlHuet53+dU/xE3GJCG6ynlIjwiGoLoT0HIWwUkrZSwhk3Q0Lxze/cgU
	 Mx38wadnSkKMg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E7C540518;
	Wed,  2 Sep 2026 02:29:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1D861A0075;
	Wed,  2 Sep 2026 02:29:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pd1MDIyq;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00603.outbound.protection.outlook.com [40.93.23.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69BA12200D6;
	Wed,  2 Sep 2026 02:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btkajpRgqzpCkzIKwNdWTc8qq5yah9H7K8WC1mS1jZL8RokYe+s1qXflNIgSSjRy/N4lieCpZlPw51BcldPdrUAcOMCoU361lfXpH97rlCWk7c8mqzHHppulVjvCOjJ1XMbxACWLxHNevmvr/8pYBq36BcVXJ1JG50ivNuTtWTNNQ82TqWJQhCMy9gzn/9qkCZXALhiWdDGbjuiriqG63LFYvIu4pCcPkNzIwq5kujeGY+0/+JPhUXZQihzbCftW5X83Tv7Agbq83j/UYxxSdr8sUxEnAk+vmjrW4fLavt7SO9ooqSWY7NAsmTOhul9h6uBdDLUKSVCOUVBjfzxBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyDN1D72HnW0X34E3YlSE50dK/Iu3nOuJPD7VsuCO0w=;
 b=NZDEf7XQ8FSNnK1OkGtlhB0KLSPBAkmc18HTkV+yOWZFM/0ICcWQVdu49SlIwRddwOlWn/Uja2Si7GBFN3pnzPchAqddKEr9vsHTtPIdoa7cjMRqRmM7Htu+xJf0aurOAnLGcKfsjj1qqfPIGitxO88CUVjVuHY8u4UIjpnjUMUHeZRkU0H3R7kcS9Y/XedX7TFSh1T2WqqGe0iTs8BKTM/VMUetnj0ZD8J5IEcOV3zUeq7SfLurBrKRMlpXfonpNZmJtg72/2l0liB0Zc9lJs5aeKI/tnTbjcm+LwqNfIEheBVJDX7ZE5sm3U4XRJ8CP2PUaSAHLqiXyIF4MbTOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyDN1D72HnW0X34E3YlSE50dK/Iu3nOuJPD7VsuCO0w=;
 b=pd1MDIyqBlupwQPoBlXLhgHa1JNy8xfbMQf9CvBgZUUpQHwAE5/6yG3zaDbS3+YF4mbS57btQ6GyjsXFdjPCWElyMBJGyp7ktGsnPkb6ckwVeDkh1H31GRx/Tbs+WqXKi3nHOlyKf0NvghxOzb4TC+wwfBMrNRN9lhVUTYJ1C1M=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:29:08 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:29:08 +0000
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
Thread-Index:
 AQHdNxp9NdtCDifOw02utC0RS08PD7azyilkgABD/YCAAEiogIAEmlcAgAANcwCAAZjaAA==
Date: Wed, 2 Sep 2026 02:29:08 +0000
Message-ID: <apeGv2_pFzqxP_2j@vbox>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org> <apIGMJ6wveRRRMCv@vbox>
 <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org> <apYmMt_vK5fbjBUJ@vbox>
 <2634d23f-42de-48f3-b10b-92158e86fdf7@mailbox.org>
In-Reply-To: <2634d23f-42de-48f3-b10b-92158e86fdf7@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH8PR12MB7230:EE_
x-ms-office365-filtering-correlation-id: 26cee243-54eb-4954-2335-08df0899f76a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|5023799004|56012099006|4143699003|11063799006|6133799003|18002099003|38070700021|22082099003;
x-microsoft-antispam-message-info:
 V2MhwommBIsgkKm5J1HNVNnvd95mo4pOkE0900Yz7kV7AxEgdGqLcfwBPkRwPNDBlyARLljez/+L2YiPjeOugKawdQ/msyfT5iraEH/uRDx/Obnbs0mi3qd75nAP8m/GX7oAQmEHus7HIRAmWQEKbOH8M5ZXFGRux6mJEALKwXdLKr/ALCHfzafMgvZt6HayrJQVHfqsXtsjHWDv0tMPrVvCRVayMqw9xOkiJ0rV0+0U+q7qYjwFGxy9QbfABwJ8MpEXXNUNe5/pYaw3sM+2XqqiWA3qqgsync1FAJTIFjJzYUaVFiWZbEWeZgaYGHSuAthwjCnOU02cuNaRXxOwWeKZOSPtH95oXTZC9lHABreOhHEENtD1R0LDkmlH/JjyATh+mNaUHQHIpk63bMq9wgvst4UVOVSYOgqb7U4VQNOuoyrAUclZDXsrdem3CJl25a+yLIl9sRa2EEVIiYWvTARge2fhAtuXa4W1pqRCoKUJb3MiXvw5mKIxETuWhPwOv5ANG4+Bh20Q6nZq92A7us4pf8l6jC5753dclpLwizJ7eqrrmkYZZQBGwdxF/ahBRh42fIINHW4OCk0cJY0k45RNaifaLYW3EAWSuqk6P4vnrCax/P++YPEAMkCtBHZqpZMiyRlNKeLdEj9e6MqxOLLDUi67Q8aziw/Ty3Pm2hfRJJhLYaP41dbEOL4wT891IA7OlItZCQuldYOI2hLXdoR1gFD1VFfwsPmWIz84iwk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU82dkdRSndLejBIZDhhT2JMR0pBUmhOdXFVbHdhUW0vcTlDZVhlSDV3Ulp1?=
 =?utf-8?B?Q2pubWhld1dCbHM0MXdjZjFTNFNwQUNQd1BhcUlWVnlCRE5YeVI4VzNqWVpv?=
 =?utf-8?B?azEzSHdNMEU3Q3dlQ0s3WktrUjNLTjBJUVBqOGVBaXk2ckxqVHhUTmM4dTNY?=
 =?utf-8?B?ZHk2YklPUTI0Z3VYVmlZMEhTNnBxWktXaGhtUWFEczJXZlFLQWQwUWc1UUY2?=
 =?utf-8?B?WHVndFdyTkJraUVudFNlSkNNdkJydkk1RzZrK2NWQ2ora1IwNGQ1c2s5L1Z6?=
 =?utf-8?B?VEpvZDZuUFE0R1N5VWxvaXR5bTBZdW9iZllUalc5VGtlOEZYYlJMN01WTm5U?=
 =?utf-8?B?L0VDS0J6U3NuMFNwOTVFSjhyU3FCSHlNL2J5cTU3cWRvbDk0TGJwRU4vVW02?=
 =?utf-8?B?SzlEaDlyNUZFRkI1RWU5WGNvdEZSbE5CaE5NdTRLZUJJaEZ0NW9Mc1hsc1VI?=
 =?utf-8?B?elVhSldZRmZOdUF2dk1HQ0Nib3BDYzZKTnZ6RHR1ZkJ3SUFIb3lERWU0dGdh?=
 =?utf-8?B?d2tuMVlLZGJBcEhtdllhZ3doTW16UkVEaW5GMnNjemxvSGMraVhZRThpUXJU?=
 =?utf-8?B?Y0k4RzhhSGFmOGZTYmFHYktSK1NkM01WK2JJVjVaR1lOUXQ3eUxnS0JSTlFx?=
 =?utf-8?B?cks1Ykp4SHNDcFZBTTYrQ0pJdHFHMUppL1RrdWhSaVlLR0VodG9zQk9XazZq?=
 =?utf-8?B?ODJwU1d3OVJHQmYxVndNNnMyek9JMkpUZHk3TTlqM2tPc09iTmgrNWU4c3VP?=
 =?utf-8?B?UjJkeFkwVmNaVW5vUm1kRHBPOXNQWmZWNTJJUVBaK1lzdlljOGFLSlFDOUow?=
 =?utf-8?B?UGNhQmx5Mlp3QndnYXJFTUtpeVFBU3RFNzRBMXA2bTc3YitYcWsrZHBWVHdD?=
 =?utf-8?B?ak05bHFjbytkTXg0b2dvejBFOFZnd0ZNUWJyUFN0UUI3WDByN3k3b2laZXBu?=
 =?utf-8?B?RG9sR1FNZG9oNHoxRlpsVDJqRzlIY1JPdjUzU0RIbHpISWQ5ZHhyZ0RCUkVL?=
 =?utf-8?B?YTVnYkJnRDVlUDNSWGZaU045RUhrRWprUXZGKzNQZEtBK1kxQjhMczRGT0dw?=
 =?utf-8?B?d1lsYktCS3pVdkw1UmlwVWkxRGlKYjlQMWVuVHBJZ090aGZUYTVVQUxFckU2?=
 =?utf-8?B?R0owQ0lBVWRxeTVXZkppNGx5TFFjcDNFdGlnMElSS1pPRHNNWHNKY0JNMWZZ?=
 =?utf-8?B?ZFJwa2RubDgvSmJSVVhwSElhNGVGWFZwV1llRXRRdmdBTHRVOUtmT0hwTk91?=
 =?utf-8?B?V2c2MmxTQVhwSVpBcVdLUVRBY1hpMlkzM3EyL3FXZkxGZ0JFZCttaHMxL3Nt?=
 =?utf-8?B?elgwbklPdWNyeWt1c3V1RmNCbFdoZk53UFVuT2NNclhEVVl0Mi9NU3BIcVdP?=
 =?utf-8?B?aTdYRWZ6MGZRNFhZSzJja1hTR3MwQWNxVEU1cUx4eFlpMEhSd3VKbEx5eU9I?=
 =?utf-8?B?anJWdVNpd3FyY2hSS3JzR1BZWjJFREIxSE04VDczZmZ6Nm1VSGpUQkZuRlhL?=
 =?utf-8?B?d2JleXZxUFZCRHhmK2VoYkNwVjNtUlQ5MlNuK2ZDV2NPVFRtSG5uV2R3ck5h?=
 =?utf-8?B?Qkh3Z2ltWEZ5MmtQRHRNZWZNY0I4QiswelQweGV3VU5HUTgySmtJTWRWR0FO?=
 =?utf-8?B?b3NVVTVoTjhKZDlocXVFVUJraXlFMERPOWN6ODBHR2FZUXFUS3p3d2VrTFQr?=
 =?utf-8?B?M0tDQXNqWCtaQUNWWFA4TUpyZ1RyOG83dEphV24wMlkzOHl6emNBaFpGYklR?=
 =?utf-8?B?UU4zYlpieU4yRUkwMnNuU3EzaW8zQlp5YTQwZzF2WklqdUJ6TjVTR1ZYelpR?=
 =?utf-8?B?UE11TkZNejNST3ppSWhCeHBuRkpzcGZqM3g5WUhJb0ExNnBnNkpuODNzQ203?=
 =?utf-8?B?akY3SE10VlpDS0lUeUdiMFhsaGR2Yk5YZ3dZNnJhYWZMTmZLaGJVZkJlWHBh?=
 =?utf-8?B?WlNOdUFDd0NXR2NJZGNEYnVXVWN6REtwOW5BNkN6QWFQZGFFNzRlalg2VGxi?=
 =?utf-8?B?VUd6cGdmZnA1QzZDMU1WalRTL1JKSDRXUy95c0UydDI5ejQxOUtBR0NSRml4?=
 =?utf-8?B?NnNzeWZNczlFUjlnRVhPUENxUVhHNnVMNmIzWXdObHhtdHEwTkV0Q2J1R3Br?=
 =?utf-8?B?NUVnalJ5TzZCNFNWc2YyYnRTNlVpazJKOVZZVCtzRG1uTGlBdDNqQmMyTXk1?=
 =?utf-8?B?THJCbmVaQ0hvbnowN0F6b3p0eHZUY1FIekdJY3FjaUsxcTJmR214RFpId2xv?=
 =?utf-8?B?ak1XRHhQc0UyeVladVBieWJyVktHKzlpZnBSaytWOExzbVJUOElNaVVrdmhk?=
 =?utf-8?B?YUZ2YXJjSXRxVzhyV3BTbmpNUTBENmM4UEFJbDFxL1dteitTNGZqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C991A52A1CEC0749AFBC021A5AE3C14F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	eC9m+HQslrNRFQ36jeg+UHydWTnxcTUWkRd1Dus2oHHddZ9KY+qStCu/A2v4H0CgdAHBG8E1r6dR6JrxpzvrbaBsKpHX6OOt14i/NcPFPb7zR8+ebJG7RJezWrDOr3ntV+46JzfiZc/kpOhuGM2Q1IGPYvrrbiXL+3YHhIEd3PI1KQGa1AxupWg/erVeJeA33KMhbWbrDOlIp1iT6DQeUwTB1rfXH7hpRDFznjddijUc3EB2qEU42sZlYkqUMN4VauPW0lL6vw0sVZyB612Z5G7Z8Lc0dbwBgy8CeZ4PJvhoF+WYOGVIDkKxDokzKZbOE/ALcl4VY1RxTZznbqcXzA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FRAC2fusdnKYvvzx037ZsHvoPI8mMMEoZLa8LXZksXvXWxzHg1X14rc/2ySv7W0UOxzd9wKuFSk1M/bNdZw2wESgt6kzeBs0T4PUrF4nZfZBPFz4jZdP8uUmjJGN3EzqIjRqrviXu8nFPCt8TEmT2xZ5ukPulWkcqaPhyXsWQlcQdcuhmS8te2DZT95wOGGr9uwUhWuPlBGYQRaHxtbGn0OPVeCKkI4h2UXh2NlHYBfNnw2GBd+tbAoNYDaox199PxS+93oPd5mRj2irVyDyJH9AWUQPlgyYeDz7bJOxWeyCbcKR9RaZ/0ekowElbrgpbet143NjC2AVeHt+HTm0kXUT0QdsyU7Q+5x38wSS8jtH6GgLytSTzxCi1MwzPmDuUa52Fw7toD4sxu0w7bmhlo3E2ABaF5KhwQH/LlYUpn0fnvgKFotLYQR5zobe0SA/Qea7oJNZwG9HkKirJFehcZTpK4vtwRSNdOLRmvF73GuGAo1l9DFzuUVt2DNhS/QLEEblXPWGivPotY1DRjVka5s36hykWuDXDqcxxGPJTyQwfQ86aatxFxqHUq+JOGg5EX76PSWu6/tzkhv4vZtmQ7P1LZY8eLC7TcPkNxmbDd2ipRjUybzhlXPEzII+uklkVjVMTwpsqqaYTpka+N0pbg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cee243-54eb-4954-2335-08df0899f76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 02:29:08.3479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nW0UEnwnzv3x87WQurBHr7FGsaSXt3QYefxyZkDy1K8urcclEsZRdQYxIvha8eiKPc7CqwNrFN46tuDhgedmQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxOSBTYWx0ZWRfX0uQrkP1Vtmfa
 OocSlkL3MyywcMiFb0VVodgXUog/9fzhbwaSA3Hcwudvjt/uGmoo0SQaStC5wT7FgqaqKXfCc7B
 I+zl56FXazZF+xlTEAeVFWoBgxm3izI=
X-Proofpoint-GUID: W4W6q_PcefLRH_w-lYXNPUCsQBh1bNSf
X-Proofpoint-ORIG-GUID: W4W6q_PcefLRH_w-lYXNPUCsQBh1bNSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxOSBTYWx0ZWRfXyhsbZ2HrAefU
 Q+GOp32r+6+8X5KAglkMVZYeI22kNNEmDQinXoN/eeo8pt2a8O3QyXjIuVaNl+xMNml9hynsRFr
 Ujoe0VEoYdn0buMHwysW3PKhtG2358O9kksw+1znX4fd9fCEGRtUJu5qmVevDviJw5oSYEowFrC
 041iyG4qq+A9zlrfcMgkd/BqoAvLqyx6aGGJXn6dvzgU54868o/VNsnCjpIdti2AlG3JziqslKX
 qZJ2jT/PyVV+pKM87ieDPz/BaYpcNqwlQWGov2fh+HWODdYsrvVKBZucS5sHMHsE9a+oD91n1ts
 bra+LSvr7clINAw4skqLQDMkZ5+TGlbRG5dOW9sDC3Oo4wMZjoYGu4G8yvKRJRSpui7ezOY6Yfw
 hl34E396GvyiLYt4mlmw/Cs/50dQM1zSDTOI620ATChxm/Eum7mxIBzA0NtHNWKhLnI6GDvmMIS
 IzUJq7inL+08Ca3F73Q==
X-Authority-Analysis: v=2.4 cv=UaphjqSN c=1 sm=1 tr=0 ts=6a9789fe cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=BMRAjIMOqrj9kOmCA7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609020019

T24gVHVlLCBTZXAgMDEsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiA5LzEvMjYgMzox
NyBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gSGVsbG8gVGhpbmgsDQo+IA0KPiA+ID4g
PiAsIGJ1dCBwbGVhc2UgZHJvcCB0aGUgc3BlZWQgPT0gVVNCX1NQRUVEX1dJUkVMRVNTIGNoZWNr
LiBUaGlzIHNhbml0eQ0KPiA+ID4gPiBjaGVjayBpcyBub3QgbmVjZXNzYXJ5IGFuZCB3b3VsZCBi
ZSBmbGFnZ2VkIGJ5IGR3YzMgY29yZSBpZiBzZXQgYW55d2F5Lg0KPiA+ID4gQ291bGQgeW91IHBs
ZWFzZSBwb2ludCBtZSB0byB0aGUgY29kZSB3aGljaCBmaWx0ZXJzIHRoZSBXSVJFTEVTUyBVU0Ig
b3V0ID8gSQ0KPiA+ID4gY2FuJ3Qgc2VlbSB0byBmaW5kIGl0IGluIGVpdGhlciBEV0MzIGNvcmUg
b3IgVVNCIGNvcmUsIGJ1dCBtYXliZSBJIGFtIG5vdA0KPiA+ID4gbG9va2luZyBmb3IgdGhlIHJp
Z2h0IHRoaW5nLg0KPiA+ID4gDQo+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgaGVscCAhDQo+ID4g
DQo+ID4gWW91IGNhbiBmaW5kIHRoaXMgaW4gX19kd2MzX2dhZGdldF9zZXRfc3BlZWQoKS4gVGhl
IHN3aXRjaCBzdGF0ZW1lbnQNCj4gPiBleHBsaWNpdGx5IGhhbmRsZXMgdW5zdXBwb3J0ZWQgc3Bl
ZWRzLCBhbmQgc2V0dGluZyB0aGUgc3BlZWQgdG8NCj4gPiBVU0JfU1BFRURfTE9XIG9yIFVTQl9T
UEVFRF9XSVJFTEVTUyB3aWxsIHRyaWdnZXIgYSBjb21wbGFpbnQgdGhlcmUuDQo+IA0KPiBCdXQg
dGhpcyBpcyBvbmx5IGZvciB0aGUgZ2FkZ2V0L3BlcmlwaGVyYWwgbW9kZSwgY29ycmVjdD8gVGhl
IGNvbnRyb2xsZXIgaW4NCg0KWWVzLg0KDQo+IFItQ2FyIFg1SCBpcyBjYXBhYmxlIG9mIGJvdGgg
aG9zdCBhbmQgcGVyaXBoZXJhbCBtb2RlIChEUkQpLCBzbyBzaG91bGRuJ3QNCj4gdGhlIGNoZWNr
IGJlIGtlcHQgaW4gaGVyZSBpbiBjYXNlIHRoZSBjb250cm9sbGVyIGlzIHVzZWQgaW4gaG9zdCBt
b2RlID8NCg0KRm9yIGhvc3QsIHdlIGRvbid0IHJlYWxseSBsaW1pdCBiYXNlZCBvbiB0aGUgbWF4
aW11bS1zcGVlZCAod2l0aCB0aGUNCmV4Y2VwdGlvbiBvZiAzLjEgY29udHJvbGxlciB3aGljaCBh
bGxvd3MgbGltaXRpbmcgZG93biB0byBTdXBlclNwZWVkKQ0KDQo+IA0KPiBUaGFuayB5b3UgZm9y
IHlvdXIgaGVscCAhDQo+IA0KDQpXZSBkb24ndCBhZGQgc2FuaXR5IGNoZWNrIGZvciBldmVyeSBw
b3NzaWJsZSB1c2VyIGlucHV0LCB0aGF0J3Mgbm90IHRoZQ0KcGF0dGVybiBkd2MzIGRyaXZlcnMg
KG9yIG90aGVycykgZm9sbG93LiBPdGhlcndpc2Ugd2UnZCBlbmQgdXAgd2l0aA0KZW5kbGVzcyBy
ZWR1bmRhbnQgY2hlY2tzLg0KDQpCUiwNClRoaW5o
