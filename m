Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795574965;
	b=yr+rVXGf3VuIklIezVqm1BT4RIatCIuOlDd940V3ViL6WIyOyJ+BXEzhme6uoDxgd/g9
	 hfa+tMufXXpvpMGR2RG5wAyXOADShHJT0RjtG7DvMdHaL8KBDSBBxZxiYxah+Wo4gvpXN
	 ugcoXWcOLkSYKV4m/MM/aL/JLAIhan7bxXzCngUlIwfSpMw8ANjxYE/rz90aL5r5DCJJh
	 B+hdxNM47Eu1S4dtuLiv6MGmNrAlP61OfNVV3+JAdgGIB0r8HTqcbkg4fCgI1x4sCuH9R
	 /agwSQbNi9gNsJPX11bQZjix1M3OsfTXmf1Vs0o/cNuiGPXSBXsWOGKf4CjZsZPCRyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h5SJ7rZgfU9BfeXKuiuYCcn8JMDigN+S5yRTAtVY/Ak=;
	b=2au86uLdBUCiZf3IzVI4v2ciRSpkfTwOk6BVI749kUQSeJZJ4+EmPNanavpytUleaA5k
	 gNvcJ/xlAl/ngz7m1fTusgIOb5tc66YFEsJoGvbQwRpQv09ctKYljx1Z/7ZFjQ4oATZeL
	 Sbe6IvLG6dswQjogawXnsk1sN9LRslmcGoRUCoI01bniVmvfHgOqXkILQyuL6Sa5nQnMa
	 e+4Au+9s7KNlNLbQjY4YSoZkrokp3reYNF66OBRSir+g9qMyXM6BAQ4Oc3BpJy//waXKC
	 HYT8cdivfGfyIRlDH2veoO6LpTxO2dhrGfvcAnRqM9TlWlX78h3xOLOvz/4v6OOyQzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Gx4CYy4s;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=h8rdly61;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CS3pP9h6;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7528606A31E;
	Wed, 25 Nov 2026 02:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7528606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Gx4CYy4s;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=h8rdly61;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CS3pP9h6
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP29XAG239962;
	Tue, 24 Nov 2026 18:49:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=h5SJ7rZgfU9BfeXKuiuYCcn8JMDigN+S5yRTAtVY/Ak=; b=
	Gx4CYy4scsqxVR1Kl3MaCATU797IyVNhA3z1yWj4cjILi6llrKgzigABzbBs2gDT
	4wDBNFkXLKl1r00kBNC/yZCmBK9xN3e/jEfQpYhK2o9u3t7y+9t3mI6QOiySg6Vt
	lnhrT0gh+mmxzkJGGASAw4pdaMsXrMdMHD8uCENQ+eEKiys51hGQ68sVryjjfXje
	mPnKjbq8ZshI4HXfqjLWRobswXYBGFZkA2uPvpqQpsSOMVmGqWEcyqy80Tvzfxxb
	zsppYzgFNZuIsxF0Uc0RuMcCTAbQ0/gfXnwmelkjjSODd1QsgOc3LeyWyOQ3RKYt
	zKahmwSHZnLJqQZ95aTJiQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j5dr141ce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795574956; bh=h5SJ7rZgfU9BfeXKuiuYCcn8JMDigN+S5yRTAtVY/Ak=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=h8rdly61j6kCLMqybjSygrWTzJIbtlixh0PGROm002w/L0Z/M58YL/65N0BhP2rnz
	 A+pZE1ML9XmP3UKVE5Chw5wKCQ0vrjc2FVK4NLoLRhMyxaZDzIXmMv8ryaL2In4n8R
	 yr+bvjMwNdCkUifgeKhLzF81/vopDZ30+5pUFXf0ieKrrKSPdFFacjlNt/2dtrdxrP
	 JejXpSLbLGSCI/gpKyCfYUgaINkWEOaBMzC8Mp+/P9mrXDqKEuogsHHdbG/KkEpk03
	 AAkHr+DOnc3hgLUt3GGu7+HPVlcN7Yh/nlZK5NWgICKSIq3GAkkhK97BmQuWdruv5h
	 3BB502RBhefAg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E54A40520;
	Wed, 25 Nov 2026 02:49:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2686AA07A5;
	Wed, 25 Nov 2026 02:49:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=CS3pP9h6;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00604.outbound.protection.outlook.com [40.93.23.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C718B404D1;
	Wed, 25 Nov 2026 02:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD8PS67Y+LMo3PqBTTxAphIDmE6krj4Mot8Jq3V13TpmclgXm/4LFCjwfhb2mN0SiGDGnsij/XcKpxOBSv1QGTHzeaueRsHc2lU+t86f9vL5n7SLZ0HHXMBRR1FTsbJtIA0aG6eRttVjMzcQ2NAFu75BaFYQBQB6kLl9363dEkTE9uFd3Y4sJFaVN30KW7+D3GRNhOOLd6VZM7p0j5pVs6T12LyQUXwsu8QZGpsfJrPHYcG8wsKMq19kAmfiVHdfWUi1gzIJq45Mep1FArPSqPzb+IAwifRC/jS1Pt3HmmPFqLES3wv0E61lg/BPxMtb2aNEHpkL5U/sZAf0wPIQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5SJ7rZgfU9BfeXKuiuYCcn8JMDigN+S5yRTAtVY/Ak=;
 b=STiOWNsypyvXoHyw4yltnmEYLcBgG4WkkJHRkesHWUPAZGrsApV4E/p3MUwI+k38u+7PQpTQJ0NNinajUKL7Vctc+Hung30KGXOwsBiAWW3Z7Nt2DEH5NiGnYkBnBmwVI4Cc7cz0fBkT2GV+U3fZkMk7Mo2omw+evyyHCMbxarG2dez0WrrvntCIsHVW24b3y6n1ooB+6VfUfst67Hmga7htPBUOAEgUEHYzKtqhBDXzWdB/HJqo5e6YwhupxfEHmcZRqduLnME4lBsh399YRX4q7N3X/b/SkyNWPYYU5VrKmjbFmqP637b7Ch2dB2bJpcojwjPnUo0uN4ZVZyFTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5SJ7rZgfU9BfeXKuiuYCcn8JMDigN+S5yRTAtVY/Ak=;
 b=CS3pP9h6LvGftV3FphqpkX8mID5urRBHIi8DH8ZcVZwY3LnxuUvAVRbhzZbv47dqLX6zb4iYtDQueY/eRxpgEhHvaR9N/EFWfBYNv4t5wJpQ/HWtkHAOiaiudOHViZjc2twqAPoGt3MTl8ukpINEqwXL2Z2Uv9x17pCyEVRjk7M=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by DS0PR12MB8200.namprd12.prod.outlook.com (2603:10b6:8:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 02:49:09 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 02:49:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH] usb: dwc3: skip extcon lookup for fixed-role mode
Thread-Topic: [PATCH] usb: dwc3: skip extcon lookup for fixed-role mode
Thread-Index: AQHddcoJi9Dex9bEPEuv6mDqLvB977c+I4EA
Date: Wed, 25 Nov 2026 02:49:09 +0000
Message-ID: <awZKeWuFsccOiJCC@vbox>
References: <20261116125705.323670-1-radhey.shyam.pandey@amd.com>
In-Reply-To: <20261116125705.323670-1-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|DS0PR12MB8200:EE_
x-ms-office365-filtering-correlation-id: b6253bb1-7f64-4d78-c1ab-08df4a9eae21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|38070700021|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261026121527099003|10067099003|261026140227099003|261022105027099003|261022075727099003;
x-microsoft-antispam-message-info:
 AoEAK4MSIzYF8jfdBh6uohTG+4y4ULBZrZJxJXveXfI9PD7e8RprP4jYAD4ub8QBWtPpzMVWZ7w3wUF2i/YTMVZViRbJxWMkDoJW91LbO1M6aOjeLPORcXrZhCoLPGVS9Z5Nycntq0z8bvxDS4PeSZl+AiPF1Z0GvXPlmBW9adZF455dyGZ+1wsTOI3+UXrh2drrco6es1mwB/fhLYFEwQOmlE9Bn6A3Bt6z4MtyrXhGt9iWeB7zsJ37WNZKO3rO3M+Ok5274ECfFYFxvDXfKdICyI1v0D2fJlobIOS2QK2zmOZ8bS30waZaK6COSog3JLSwBdHbhaS+w9yO89afPY0EaPSNRTfM55E3o7Pmj9mzuec+IpFr2IZrkL2ls0e8tTREjPD7+I9NjpfiJLX/8wAkJjD3aSwOhrqVrl5yUZt4xXKjdMn/LZLLaxmCnmU0JIkZnOgCe0yYNAMIWft8CrCItQkqaFkUoGANHuA35TxkUfm3UUFWYJ2O1FkAEzddme0m7IVDj8CBgBBnr0MTp0/JI6+W/KMdsfnj/sFpI2lZ7nJOVgFbtPcPuPl+SPSLf5h4g/c9cSAj6ZGeufO2RR0bZkg5F61vSCPXQm3B/oXIQB5GCh+t7kXM587NKUbKSdwFeoC72iecdLf+U/MZpd7xOWLTl0SZAxceYVxgRNFRv0sZJlLIseQmYi//Acdl4toIQfYVOf9MIyX1e2ZSv4N6PXG9gLtDGZ4Ar072kbo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026121527099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UG5tMnd0Z0NDR0VpSUhWU3VleW9id3BuV0cvMEZGdnNNOUVCT1Z2cVdWS290?=
 =?utf-8?B?U0t2d21ZRnNjNnBlQTM5djBURi9jcEI5MmhSVk9iUGVmUFg1YStrQitpYWRu?=
 =?utf-8?B?R1Qxa251WHpIU3JIZ2hLZ1UxaGZpVGVLbjJ6dVpiTm1UN2RxcFNCcDVoK0VL?=
 =?utf-8?B?bEp2Z1ZMdFN4d0Z2RTQ4czhYSS9TT2UybUczVjU2NHdrSGt1WUdHWWw4UTlw?=
 =?utf-8?B?S0JEUWppbUllRGlGMFN5Z1cwVTJBZmZzU3RUbXRETUtyc1Z4dmZVeE81RGlY?=
 =?utf-8?B?WnBYZEFiVWtOdzR1alEwa2grREwrKy9xa3VWTVZZcXh6anAySjE1Mmd5OUNj?=
 =?utf-8?B?OU1Bb3RqaHFBZVk4VlRYTk9TV1lmYVFrOHpDeVFENU9oOFpuLytkN2lUbWpS?=
 =?utf-8?B?czY1NEp3UVJrR3BRd2xxcnQvZTF0L0hZYzFXZEdJc0w1V2l3UHZ0N3JhQUcx?=
 =?utf-8?B?bjcycEl1c0VOVmk2NWJtWGFTSVlRd2NGcXdpaGs2NU8xU3dKWGdEZWdwSHFr?=
 =?utf-8?B?cjRjQmxmWC95QjcvenVpV0pGcEdMK3pRTmQyYjh3bS9ZbW9rMDluekZ1SzJT?=
 =?utf-8?B?bnphNFdoRDI2MDZ1NkUrNGFZMmd6NFdiUnBPcGtCa0xucHpELzA0UERoZldy?=
 =?utf-8?B?ZmwwTjE5MXRHcWNJWlN0MXY2dUZwNFI3TVREeTNLRlgycUVmZTkyZHdnT2JG?=
 =?utf-8?B?bXFmalF6MWUxOEpHMzlPTk1iYy9UV09qbGRDbXpjR05JaFRiWDlvZmlueTMr?=
 =?utf-8?B?SUFTelIwNWJrd0VMaVZ1YkkxekVabDNGVWhmbGEwK000RnE5SG1saGl3ODZW?=
 =?utf-8?B?aGpTcndOUkk0UTc4OVl1ZFJQZDRTRVl3eTJxN0hjNXlZRXNkWFRITXVQam9l?=
 =?utf-8?B?Um42V29jbEdaZ1owU0EwaXl6VjJoOEkwZTZkeEo5aDBiWEY3cUFjaHJ1aVlB?=
 =?utf-8?B?c0hFWFFNVkMwYzlrWDk1L3ZkMUhzdzhNdUtjY1ZRZFc5TVBFNnhsa0lHeTRV?=
 =?utf-8?B?N28xeFVIRzNLSllYZ2E3OUliY3JGSjllV2w2WS8veGFUYkdLT08rOTVuT3Av?=
 =?utf-8?B?RkpVWVFFRmNuSENNWitIUEVFZDVrNmt2cGp0SU44WldRS0RTM1ovK3NMNG5w?=
 =?utf-8?B?bkhTWjlHNFVsYjRvcmtjWkRlQjVJVkZiRUxDWWt0bFk4YThlSFZxd1R1U3lR?=
 =?utf-8?B?R2d0TGZiUzJvTUdCZnk2eEk2LzB5RVpnUEQ2WjhERHNreEhPc3UyZzhWNFhX?=
 =?utf-8?B?UFlXSXJyblJUVExQUVVQUHFmQ1VFWnlYODNaWmpmekVVZUg3eDNSdEFjZXZj?=
 =?utf-8?B?YlcweGxMUlphZTcwbDlQNmhYVVpzS2pNUDVqbVVOTGlnVXFyaXZ4c2N5WU00?=
 =?utf-8?B?ZlU2Wlc0b01WbnN0VDNOdU5iS1NuYjN1Y3FxMGowNXNycWltOW9ndGtZT0Z6?=
 =?utf-8?B?SWtUVmFHZklxYUgyaHdFcGZsbE5FUFRBc2xNdGltQXA3aUVybEtJMlZCcnVF?=
 =?utf-8?B?VFZ3SE11Y1RUeWJvOHhuVWllMHBlT2ViaE9SQnpKMnFrSWIxTDQySVhOdW9h?=
 =?utf-8?B?eFowK1hwUEVDamhid3FiNmpTZEg2S0VEZjZRTUpZOUVoR2VKRy96NXQrRXls?=
 =?utf-8?B?d2ZuQ3pEN1BFeW8yQTJkeElpNGtCUTRSNTVDZlBmRmNTWUdLWEk4RzFTS0Nz?=
 =?utf-8?B?U0ZqMTVEWVpuMnhUaGh6YzFVQTQwdW5QZHN2MHlibXc3cWlwaENZUWtDMkhR?=
 =?utf-8?B?dUpudjY1WXZNbk0vcVM2Yzg5eGdDWEVUWE5rUWNKMi9QVFhMMHkrVmJRZnNr?=
 =?utf-8?B?dkQ0QjlUdnpGZGV0cHBwQWE4cGE5Nk40bnFOTHN4K2ZUTzBhK3FKY00yZkh3?=
 =?utf-8?B?UXZBcWhhZGk1UWpPRmxjd0pBQnlBQ0QrUXBFNXhvSmhlRHRhNlpZVVJwblhN?=
 =?utf-8?B?emhVUjI5MkNkQk13RDg3L1hkenlRWFU3VDUvU0tjSWRYMzV4d1pwMmI4YWxU?=
 =?utf-8?B?cWpWUWdGVWRTajJOUUdWNU5BS1VYbytsR1VyQ28zQUhQbmVGUlpKTmNsY00v?=
 =?utf-8?B?Vkk5cGQvdFVlT0lRSlU5K2VjZmhLTlV0c3oxNS8wZHB4ZWlpZnZOd0pOdmFX?=
 =?utf-8?B?RUI3MEVIOC85Qzc0ajhKSDEvUUNOUlA4bEhhallHT3hsdHRxUkZwWS9GMlN0?=
 =?utf-8?B?b3A5blNyZWhFT1pVbTIvd1BnTXoveGlDcFhoVW9ITW15dHM1WmprS1JrY1k0?=
 =?utf-8?B?ZllBR2VMbmdQY281YSsxZHNNLzFmc1NzZFRrcDJVRkhZOEhZR1RiSW9HQU4y?=
 =?utf-8?B?ajVXVHhnb1RiQnZMYnp6Y0h2dkFGdXZLbWVpMHYrWjQzNklNYytqUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CCC616B2CEFB84EBFE573CC939AC7F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	RPzel8tM1z2Zj2PVpggyho8C2U8tvfbXbyWar+xYq1Vj9qOd0r8Jupo/aO8DS2s3J2/bbalCOHgJg50ZAf9megxnjtXt093vZUlLNIhIe/W1UXo9Tjew52MjLXn9T0DAQo2U/Yjn90wsA6IGGrcP8U6WJOh9dvo4f+HMoWxTXU8pKpsvn61hjMk4fjdx7UJIb6Wbr8AhsDNyMmj+KBLySUA74xZ0ONecgX4Z1geCbvBmTblQ+cT1N+i+UrPmSWHAFWV7v6No7+/7Zl6k356xtJ47KHU31x9ac5O5mtTfLQJkaTTYalBbf2tDHGJcKUEAxiWKUv8IrCjNgUZTjGEB4A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6irw9tPXGdC7Bz9Oq1/dujIMrtnN+sPJ7TO/rTjMIt8j1X66Ag1U6SR0wbv68s8cKJKyVabPlq8jS3VdGAcffoWRCvWQgTBJLnrMAJUznFwW+g1dtV1aK1ur5YPxxCb9zg4d+ThevLwGh88bqrii6PNv3u+r5JSIq/3cv6jLd1NKu12QP7oj9ymU0Gg+6jH1mSs0zSmru+7em/5ox9CfxGi+i9S8sfo1rOtIVRFZMLz5OVbZdZflcg+1++M6plvpv6q0F6g+nethTjslaeTkyHO5CPxopXtr0SHstm71BDyuKEeI3mM05xYD+Dka6uTA8vgGP9c2/JhmKvpuaNqIhUup2i9X4/FcxAixIq4L1RWJMDS7ymy2AuMtpQksm9S66vHe8D+f7gtPwDwIizYG1lDvExgHr+0Jm/fZa6GshId1FU51WeZOZb+71NoPNShh3JEVaUrgmBwLrd9XPReCx2ANkFWw5cZ4r6aw7y04P1nddOLqIk2jqAYIQT3oeQmKvKFAxUPJul6BDX8g6mwwWy6qs/QGE+FoExj0upfXuOiv9qY8S7/V2TqKhhd+P1+IK0brYA7vKqIY4ucTAdwaFpOD9jFy5O6tUklXhzbbBvmfwkzYmG2Hq3bZ7JSin4AvhOnfgoFYrwrvhNxt9HnpNg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6253bb1-7f64-4d78-c1ab-08df4a9eae21
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 02:49:09.6201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r++eV5LlL/EUo4LaHYSxF5+UhBh73oPnshGmWRyfgIB7svplcW3JAHxaNcpSDe14+ww24f2Gd899GBdHZY9B3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8200
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfX7BJa+nClPZON
 +3HY982PmzErA0ENXk+nMO/OAMRA4ipYZ5V9Ws5yQdnTDjC91kkOFzV9dAIoljH7vzMOUl6HNL+
 GdIqi81Dus0XaHKHQ6a0SPB/eFQorWNzfi5FyVDfRp8SIRZRVhti04xbhg/SZcsAhhIqoqoDqLu
 QyA4SHjI77r+rCVcbiTWDceuk+CtEhyrwAbOGeX3GFke0wOM1hKD+13HQpL7OdBSDsJ2kv1yMIM
 pUFqj9WECTLSl8lOR0kZKwHF9WmXk1+Y6BCXk6ArB2NqAJWa311LdgxZQTXaNwS+1iDyx/ZXvO2
 Cw4haYe3RZ9+hQ2H24wSK3TnzZHjoWBsHe8PwSlx2tPUAHffoQjmKmKnZruBEfmkkm+Fm1vKmgX
 99jEOvI4F7fNxJQuejPow2BYun0RWkdbHJkovpkVyAa+YzlxWK6Qr1MlmN/Bwu0pZFtkXvcjI1Z
 e1lBu0LoO5t/cblNs/w==
X-Proofpoint-ORIG-GUID: V0FdvKbJrEXP3PwBBP9JVQ6UpP6zXDij
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfX5eD0zWmUt7kx
 73uHsQd5vzp+UxXhPpm8R8bDKdlV4aDKOqKMhk4KlpBOlTLNKuquZskB9qw3+NZMRG2vSwzoNwL
 fP+CG3KBt9tSBUIEtz7eaY199gct6Wg=
X-Authority-Analysis: v=2.4 cv=NoxE4MdJ c=1 sm=1 tr=0 ts=6b064cad cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=zd2uoN0lAAAA:8 a=TEAxXhXuOo8sEvWXkEIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: V0FdvKbJrEXP3PwBBP9JVQ6UpP6zXDij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611250010

T24gTW9uLCBOb3YgMTYsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IEFzIGEg
bGFzdCByZXNvcnQgZHdjM19nZXRfZXh0Y29uKCkgd2Fsa3MgdGhlIE9GIGdyYXBoIGZyb20gdGhl
ICJwaHlzIg0KPiBwaGFuZGxlIGFuZCBhc2tzIGV4dGNvbiBmb3IgYSBkZXZpY2UgYm91bmQgdG8g
dGhlIHJlbW90ZSBub2RlLiAgQSBQSFkNCj4gInBvcnQiIG5vZGUgbm8gbG9uZ2VyIGltcGxpZXMg
YW4gZXh0Y29uIHByb3ZpZGVyIHRob3VnaDogaXQgbWF5IGxpbmsNCj4gdG8gYSBUeXBlLUMgY29u
dHJvbGxlciBmb3Igb3JpZW50YXRpb24gc3dpdGNoaW5nLiAgVGhlcmUNCj4gZXh0Y29uX2ZpbmRf
ZWRldl9ieV9ub2RlKCkgcmV0dXJucyAtRVBST0JFX0RFRkVSLCB0aGUgc2FtZSB2YWx1ZSBpdA0K
PiB1c2VzIGZvciAibm90IHJlZ2lzdGVyZWQgeWV0Iiwgc28gdGhlIHByb2JlIGRlZmVycyBmb3Jl
dmVyLg0KPiANCj4gQW4gZXh0Y29uIGlzIG9ubHkgY29uc3VsdGVkIGZvciByb2xlIHN3aXRjaGlu
ZyBpbiBPVEcgbW9kZSwgc28gc2tpcA0KPiB0aGUgZ3JhcGggd2FsayBmb3IgYSBmaXhlZCByb2xl
LiAgZHdjLT5kcl9tb2RlIGlzIHN0aWxsIHRoZSByYXcgZGV2aWNlDQo+IHRyZWUgdmFsdWUgaGVy
ZSwgYXMgZHdjM19nZXRfZHJfbW9kZSgpIHJ1bnMgYWZ0ZXIgdGhlIGxvb2t1cCwgc28gYWxzbw0K
PiBkZXJpdmUgdGhlIGZpeGVkIGNhc2VzIGl0IHdvdWxkIGZvcmNlIGZyb20gR0hXUEFSQU1TMCBh
bmQgZnJvbSB0aGUNCj4gS2NvbmZpZyByb2xlIHNlbGVjdGlvbi4gIEl0cyByZW1haW5pbmcgT1RH
IHRvIHBlcmlwaGVyYWwgZG93bmdyYWRlDQo+IGNhbm5vdCBiZSBjb3ZlcmVkIGJlY2F1c2UgaXQg
Y29uc3VtZXMgZHdjLT5lZGV2LCBidXQgaXQgaXMgb25seQ0KPiByZWFjaGVkIG9uY2UgdGhlIGxv
b2t1cCBoYXMgYWxyZWFkeSByZXR1cm5lZCBOVUxMLg0KPiANCj4gVGhlIGNoZWNrIHN0YXlzIGJl
bG93IHRoZSBleHBsaWNpdCAiZXh0Y29uIiBhbmQgImxpbnV4LGV4dGNvbi1uYW1lIg0KPiBsb29r
dXBzIHNvIHRob3NlIGtlZXAgd29ya2luZyBmb3IgYSBmaXhlZCByb2xlLg0KPiANCj4gRml4ZXM6
IGQxODJjMmUxYmM5MiAoInVzYjogZHdjMzogRG9uJ3Qgc3dpdGNoIE9URyAtPiBwZXJpcGhlcmFs
IGlmIGV4dGNvbiBpcyBwcmVzZW50IikNCg0KQ2FuIHdlIENjIHN0YWJsZT8NCg0KPiBTaWduZWQt
b2ZmLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5QGFtZC5jb20+
DQo+IC0tLQ0KPiANCj4gVHJhY2Ugc2VxdWVuY2UgYmVmb3JlIHRoaXMgY2hhbmdlOg0KPiBkd2Mz
LXhpbGlueCBlZGVjMDAwMC51c2I6IGV4dGNvbi1kYmc6IGVudGVyLCByYXcgZHJfbW9kZT0xIG5v
ZGU9L2F4aS91c2JAZWRlYzAwMDANCj4gZHdjMy14aWxpbnggZWRlYzAwMDAudXNiOiBleHRjb24t
ZGJnOiBwaHlzWzBdPS9heGkvcGh5QGVkZWI4MDAwIGdyYXBoX3ByZXNlbnQ9MQ0KPiBkd2MzLXhp
bGlueCBlZGVjMDAwMC51c2I6IGV4dGNvbi1kYmc6IGdyYXBoIHJlbW90ZSBub2RlPS9heGkvaTJj
QGYxMDAwMDAwL3VzYi1wZEAyMi9jb25uZWN0b3INCj4gZHdjMy14aWxpbnggZWRlYzAwMDAudXNi
OiBleHRjb24tZGJnOiBISVQgLSBubyBleHRjb24gYm91bmQgdG8gL2F4aS9pMmNAZjEwMDAwMDAv
dXNiLXBkQDIyL2Nvbm5lY3RvciwNCj4gcmV0dXJuaW5nIC1FUFJPQkVfREVGRVINCj4gLS0tDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBp
bmRleCAzNzI3MzdmNDc1MGIuLmE3MGNmYTllMWRmMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIw
MDMsNiArMjAwMywyNiBAQCBzdGF0aWMgdm9pZCBkd2MzX2NoZWNrX3BhcmFtcyhzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiAgCX0NCj4gIH0NCj4gIA0KPiArLyoNCj4gKyAqIGR3YzNfZ2V0X2RyX21vZGUo
KSBjYW4gZm9yY2UgYSBmaXhlZCByb2xlIGZyb20gR0hXUEFSQU1TMCBvciBmcm9tIHRoZQ0KPiAr
ICogS2NvbmZpZyByb2xlIHNlbGVjdGlvbiwgYnV0IGl0IHJ1bnMgYWZ0ZXIgdGhlIGV4dGNvbiBs
b29rdXAgYW5kIGNvbnN1bWVzDQo+ICsgKiBkd2MtPmVkZXYsIHNvIHJlcGxpY2F0ZSB0aGUgcGFy
dHMgb2YgdGhhdCBkZWNpc2lvbiB3aGljaCBkbyBub3QuDQoNClRoaXMgY29tbWVudCBiZWxvbmdz
IGluIHRoZSBjb21taXQgbWVzc2FnZS4gQ2FuIHdlIGRyb3AgdGhpcz8NCg0KPiArICovDQo+ICtz
dGF0aWMgYm9vbCBkd2MzX3JvbGVfaXNfZml4ZWQoc3RydWN0IGR3YzMgKmR3YykNCg0KVGhpcyBk
dXBsaWNhdGVzIHBhcnQgb2YgZHdjM19nZXRfZHJfbW9kZSgpLiBDYW4gd2UgZmFjdG9yIG91dCB0
aGUNCmh3X21vZGUgYW5kIEtjb25maWcgY2hlY2tzIGludG8gYSBjb21tb24gaGVscGVyIGluc3Rl
YWQ/DQoNCj4gK3sNCj4gKwl1bnNpZ25lZCBpbnQgaHdfbW9kZSA9IERXQzNfR0hXUEFSQU1TMF9N
T0RFKGR3Yy0+aHdwYXJhbXMuaHdwYXJhbXMwKTsNCj4gKw0KPiArCWlmIChkd2MtPmRyX21vZGUg
PT0gVVNCX0RSX01PREVfSE9TVCB8fA0KPiArCSAgICBkd2MtPmRyX21vZGUgPT0gVVNCX0RSX01P
REVfUEVSSVBIRVJBTCkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gKwlpZiAoaHdfbW9kZSA9
PSBEV0MzX0dIV1BBUkFNUzBfTU9ERV9IT1NUIHx8DQo+ICsJICAgIGh3X21vZGUgPT0gRFdDM19H
SFdQQVJBTVMwX01PREVfR0FER0VUKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKw0KPiArCXJldHVy
biAhSVNfRU5BQkxFRChDT05GSUdfVVNCX0RXQzNfRFVBTF9ST0xFKTsNCj4gK30NCj4gKw0KPiAg
c3RhdGljIHN0cnVjdCBleHRjb25fZGV2ICpkd2MzX2dldF9leHRjb24oc3RydWN0IGR3YzMgKmR3
YykNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkd2MtPmRldjsNCj4gQEAgLTIwMzIs
NiArMjA1MiwxNCBAQCBzdGF0aWMgc3RydWN0IGV4dGNvbl9kZXYgKmR3YzNfZ2V0X2V4dGNvbihz
dHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCSAgICBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwg
InVzYi1yb2xlLXN3aXRjaCIpKQ0KPiAgCQlyZXR1cm4gTlVMTDsNCj4gIA0KPiArCS8qDQo+ICsJ
ICogQW4gZXh0Y29uIGlzIG9ubHkgdXNlZCBmb3Igcm9sZSBzd2l0Y2hpbmcgaW4gT1RHIG1vZGUs
IGFuZCB0aGUNCj4gKwkgKiBncmFwaCB3YWxrIGJlbG93IGNhbm5vdCB0ZWxsICJubyBleHRjb24i
IGZyb20gIm5vdCByZWdpc3RlcmVkDQo+ICsJICogeWV0Iiwgc28gZm9yIGEgZml4ZWQgcm9sZSBp
dCB3b3VsZCBkZWZlciB0aGUgcHJvYmUgZm9yZXZlci4NCj4gKwkgKi8NCg0KSWYgd2UgbmVlZCB0
byBoYXZlIGEgY29tbWVudCwgd2UgY2FuIGp1c3Qga2VlcCB0aGUgZmlyc3QgcGFydCBvZiB0aGUN
CmFib3ZlOg0KDQoJLyogQW4gZXh0Y29uIGlzIG9ubHkgdXNlZCBmb3Igcm9sZSBzd2l0Y2hpbmcg
aW4gT1RHIG1vZGUgKi8NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiArCWlmIChkd2MzX3JvbGVfaXNf
Zml4ZWQoZHdjKSkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gIAkvKg0KPiAgCSAqIFRyeSB0
byBnZXQgYW4gZXh0Y29uIGRldmljZSBmcm9tIHRoZSBVU0IgUEhZIGNvbnRyb2xsZXIncyAicG9y
dCINCj4gIAkgKiBub2RlLiBDaGVjayBpZiBpdCBoYXMgdGhlICJwb3J0IiBub2RlIGZpcnN0LCB0
byBhdm9pZCBwcmludGluZyB0aGUNCj4gDQo+IGJhc2UtY29tbWl0OiBhZWJiNzI3NDQ3NjQwMzA0
MGQ1ODJjNjE0NzhkZjhmNGE3YmY5Y2QzDQo+IC0tIA0KPiAyLjQ0LjQNCj4g
