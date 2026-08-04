Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92598394E80;
	Tue,  4 Aug 2026 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886738; cv=fail; b=NHkAvggZvzCI6s739hTeYBho+Wb52jQvBqZ+Xo0fbjFYooUs8VpVjoDEdhXWJdka8xJ7jjARUP+7jmXFFqMkFz+zcrqXLbiSrmGxFx6f+jc6YCbPFscBmYTSv65SYFrrAzdnlS3vb/i0ctDwa37wG4Tg4zGA5gVssyPz6E/1qUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886738; c=relaxed/simple;
	bh=pXJjfmH4ADEsRL1P239aRQh2mEYKaDD3hmXiv04L14A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WwY0b6K8Z+LFrMbsYZiwLzQBX5T27Gpnp4OWUvu/fBcN6XvkYVLqOd+DcguaO59pl7E7TePFHjvhqeMYVBsXs/2ROQcaVkD7xnaIR6QkFkrAzQHKvpy6s90hde/DepAI79+UGmUKX6EDq9+XKWym3TsyaWt8FFS9KUF0Sc5sEMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nar0gd2n; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=D06Oi1kh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kzYOnDDA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nar0gd2n";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D06Oi1kh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kzYOnDDA"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NIWfa2111319;
	Tue, 4 Aug 2026 16:38:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=pXJjfmH4ADEsRL1P239aRQh2mEYKaDD3hmXiv04L14A=; b=
	nar0gd2nA/+65DJsWGEM4FblhRIubqIUm2qfoiKZr0+v18G9W229PvYzJtKo/dmD
	nU2kOXN2ERAcj8KliQI3YIjzRNtuL+R9glg09th+X3rLg8+VRdIIYtAH3ZHlgOCt
	tzj0bNY4jgUogygcIwjxWpMZwvZmmiADbfjVeejIHQpoN/Dk7cUXsZZ4p1xhP5QG
	9o2rx/+WF8TMFEDLm0cmtEIFDjNvVvKWGX9+r53JxYLcReZsumr8fIbyd60tcdN8
	hn52X1YCONrzO/dhoWBj7HodG24VAa0/p36TtuVugRYKno57GmGDX2VdK2YS9o/I
	hKo1PPS23IIaQmaQcVlmlQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fug0k5uhs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785886731; bh=pXJjfmH4ADEsRL1P239aRQh2mEYKaDD3hmXiv04L14A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=D06Oi1kh8A1iB/GAvp7OaGsVRCYylGd7NXABn8Qp0BndfhCEYkCi02e+z4BaRk7hZ
	 DzSvT934xJVCHnKSYg9d1MIrIVBA8pp3J6jgggFRAmQILBYNeFon+nV2CssbgbqjA+
	 LVnz9BxSWHCSaTRG3zfEaVoD+h4h0ZUuJdnTGMbVnD+AYfO7NbRZLs4+LJc34Uj2zM
	 lQbHnWYWzvwNVCxM5cgIcYbRQn3Kl9e9Trgz4l7SblEOTc+z1tlXU6HoVMbVucIAZR
	 kfhXxWLlbFcCXRRqxPT6NTmrQhIIshkQvu54iJwLb5Ee4n/jovJUFqxot3nbZnDVKv
	 qS6TQGMLPS6/Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5D944012F;
	Tue,  4 Aug 2026 23:38:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 93E7AA00B0;
	Tue,  4 Aug 2026 23:38:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kzYOnDDA;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00400.outbound.protection.outlook.com [40.93.13.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 491D82201E5;
	Tue,  4 Aug 2026 23:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZjFl6aR0HEdbPeDmvPZPM4TC6uubTukw8LFhMQY11kEnnq/r9l1Ly1AaARf8tU9Z69jmJVOazeKd5MhqQB9lTbZhAUlK3vFiySLYXnrQhNEKI4MmsNl6ydiKqO1lBR/bvxLYjH2J1AH9rQU8OtrA18ZWAjouCfpF7qKJMowj/2yBK36Q+wnudbdJ9SASrLuIYTDoIoyMwxd6PEsnK7ZLc4AtXRX4JdaIhZ5BGXN9onjxkv6WW1Bf3nrlAeY64eOCJZfE4uyiknO6YKswHAK8Ob5zako58tGKyY4nxIwRXLCWTeiCcxRIAp0jyFn1W5c3J0UjxBNFpB3nKM3vXVYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXJjfmH4ADEsRL1P239aRQh2mEYKaDD3hmXiv04L14A=;
 b=FJKm1B64YgDhG470D3CPJPN/XzgwK8xXET/Hiwty1fEEOXDVHIoTyvV303gPvQAPtnpOgVzSrL/Xfq9iaL7TF2xaT5ZgMONpjUToyeV31a2TatfCagLu7MJciN5o8Uskbb2iO/mJ5H424wky47nsj5y/mAK0GqqAVSI/MWuQDpjRCSNkS9h4jwkF+P9XX6sL+DviZpe/kNkhqEz/rB5IOKj9WtfkElrc4I2sGwIcGzMTzcxTpCiOBIGEzxXMBIac4Y4hfUppNQCrPTtbJ69iJoKyx4xhWBpVm/qEvgEkYhcc/9aOZq5ek+TzLsiuIANFZBJv79FWidXG0S1q7R1TFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXJjfmH4ADEsRL1P239aRQh2mEYKaDD3hmXiv04L14A=;
 b=kzYOnDDAKbXd+tqZ82uShAHJjdx8OFfSmAePyxMF3uoNV/32OYD3bFfS2M7XleNNwX/L261A0fdkhgJbuYPQMJmXTYpyHCYIyL6bihjIlO/n2c9rzZN3TvbmaSPM8JuCWgG1+lw5alxeBFjb1Ln4rXLH2Lflgvqa18XbV/V+mew=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB8123.namprd12.prod.outlook.com (2603:10b6:510:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 23:38:42 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 23:38:42 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Topic: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
Thread-Index: AQHdGpHAjzhCxwn6H02A5arN0FHY6raOn5+A
Date: Tue, 4 Aug 2026 23:38:41 +0000
Message-ID: <anJ3JVHWB11b7waE@vbox>
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
In-Reply-To:
 <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB8123:EE_
x-ms-office365-filtering-correlation-id: 8780f8a4-35ee-48af-e0d9-08def2818474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|4133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 NIXzX2iQUVENaxf8ToYE2Zjv2W8wds5G6ib/dn7tOnPjAIq35bMkzv+Ez+sIacyk+4klXZi9oU0AHo5lOSPFKI4+Nf22bDX3i8zHzQcTQ9nFoGsjt3xalqypONRCJAzNaLbKr8U3L52qWoji0CdDQIY+UUJvO5jWadAeGeQeHS1SEI0ZS7vC/nyoiZBHLw1CkABPh2+X0Ra/hWoAXn8xnnzIeW6+uInN5MRMkcTfaGQjP92Wjnp4+AxtfKX04q/M2qCKAYdFqkVMJ8po2FEUncQNTBy4isx1cBloRlss9ONoBfWW0Chx7VE0oNBzcGLFgTkjkH6Swd7M6qPGCS1hKYD5bVAdqWLwSj5iIvdDPboQVSg7vp2eiOK7XU9jkBjxQCvFxOWYHqwTQBXxkLJ20xgAVo2nqlPAPaMc7MoJ/5DzMIu9P6U5QtiStR+VKx6yBp/Q6vICT6XuLHsF6aMRVF5fb6lRcgb1mv4GyTziuM3T/bAewI0SE09slf6aKd1hNiJJ31BZ4r1gwLcctE6WX4+22L8O3N2p/Euciscc7CinQUZCcIl7k7gNEMPOXefwBfaRSKPXXVD/rSfWDM8QVUH1e4de89ewAqw/4snXy/AAMsWBd+9n75ZzSBsONvJTBxIuzhci/0DnTWS9yRJTOUhXzmkOBPhoAc2MmpDHdZiCO8GgTj0eQ1SZcMir2uA2dKI76H/eT1my5GpTG6mjX5IaEUTCsZHrUvCjhXuDO50=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1VRcjRvL2paaWVJZDdBMGJsbk9BdVhIWnV2MlltQWNzbExPWnZOeExtY0V2?=
 =?utf-8?B?eVM3Ni85bHdETHUvUWZXa0pDN0xnVThxTXFzSEpwMzNncW95S0s3QXBiYjl4?=
 =?utf-8?B?Wm9pUXlNeHBkVkVWbHNQNHh6QWxiS051bUJ2cXNBYnhxWlFSYkk5ZkEzb0J4?=
 =?utf-8?B?bmEzR3RQL0pFRVdLTkZTTW51bTJtYmVsVFAxWVBZeG95VlliVlZwZmUrSSti?=
 =?utf-8?B?TUd2VWwrVUNmSkRQN1JYT3c3bElSTDNkUVRTZWk2S2U5RkcxYU1PcGpzejNw?=
 =?utf-8?B?WUtCc0x6Z1M0K3JwVEpNWmtINnZVMWRFcmdqNzhTN01nSUdId09ySnUxNUdt?=
 =?utf-8?B?NU03eVBnMUJMYUc0N2tHRzlSSDd5eUV5U2pLaWx6M2VMNHBWS3lZbTBOZ1Rm?=
 =?utf-8?B?VEZtM2ZIbE5mNXhGakhDOUxHRE1aWkZ1TElnb3pnWEllRnRTRE5VTnE1WWpO?=
 =?utf-8?B?YURKQUdiUjFPUlc1c3FpM1h2c29RNHVRdG5Jdk5MVjVKQ1E2aFUvSzlLVlB6?=
 =?utf-8?B?NHRwLzJibkZrTUhEYndNRTc5SnBTeVBqYVU0RTYwVk96RGR1MjhuN2NLMU9r?=
 =?utf-8?B?YXRTNkdkYWZWTnhDMlE1RTFSRGZGenpNS2Q5ck92cFBOYmFoOTg3cDBrYnlW?=
 =?utf-8?B?VURYL0Z5WTNZOENiOVo3b3NVY3VhN09rK2cwM29vSkJqWUJPL2w5c2V3SjUv?=
 =?utf-8?B?QmpVQXFMNHI0dTFsNHJ5UTRTVHZPdVM0cisvREF4SW9DQnJrYVplbndrUjRT?=
 =?utf-8?B?ek5oa1hBYno2a2kzT3VtS2lEM0I1N1U5V0RBM3pyeUEyekhyLzRrTFRnUkdo?=
 =?utf-8?B?UnQ5T1ZkbjcvNFZ4NVJjejV4OWhMYmlvbDE4TWRnMVZobVdRL3g3VWdkVGY5?=
 =?utf-8?B?V2VvTG9GZFlKcGVscVl5aTZ4TmtBeDI4SHN6ODBwSk8yS2V1aVFYMDJka2F4?=
 =?utf-8?B?b0ZPRnNzQmdEbC9CMXVpMjdwc1JWakhieElGRG5VeGdCOXAzTlg2WEtjRUdI?=
 =?utf-8?B?UnhwUjY5bEYvRU5JTGZvL2dueFQ4WURTSmxRODRrMTRoY0M5K1ZWRE9jV1N2?=
 =?utf-8?B?TFJNRk44b3dLVGs0YUprcWE2WHNlNjNuL05SVGt3NU9GdE4venlpRERtYmZ4?=
 =?utf-8?B?elhOYjlQaFNRc0Q3VW9kaHdvY3QvUE43THYrSTZ5K2l4eXh0VkZwYVFFZzBs?=
 =?utf-8?B?dUEveGg3WGdHTm1hZmN4cjgzeGdDQmdxOWQrRlFVdDhSS1VFQ2MreGZDZ1k1?=
 =?utf-8?B?d0dYa1M1VllZWnZ1Z0ZHVVgzYTdPenlBUXF3eDkrckY5aHJXVjdVK2VnYXV4?=
 =?utf-8?B?Vk5QWEh6YXpYdmZtdDlvUjJVTVVjaEVFOFhWd21YdmlUeHJ5UmtSb1BpUk9K?=
 =?utf-8?B?cThrbjZyR0VnTmpVWWRLVnR1cU4veldjTlllN01hOGYyai9hS2kxTlQ1eWln?=
 =?utf-8?B?SmhRRzU2UHhmL0ZPUEhXMmdXWlNaSFJUQndDS3BMb0Vtb2NkeWhxVUw3ZWtQ?=
 =?utf-8?B?Yy81dUxidE40bGdjclhhcUxwWU05RVJMc1QzLy94eVFEcDAzdXd0amFHbmor?=
 =?utf-8?B?dW5yeGgxam5EUGZ1UTJIR0h5NUxuN2ZML1p5K01iTVVHVE91ZmlBbjN1VXdq?=
 =?utf-8?B?cTlxczBhYll2a1BqWmJhRjRhUCtMYXlwTkxlNDJhWFBnYVUwc3Y3MTNyZ0pC?=
 =?utf-8?B?aE1KaXdrZnZ1Q2hibmR0bUJvbFJCaDd1a0VFTE1BMUlhS2R4ejVoRnRuaEVL?=
 =?utf-8?B?dlVjVlVNUVIxbW9TNEZ1c05hNG42OUpCRnRydGtqL3VsYlVISGVUVVN6RUU4?=
 =?utf-8?B?TmtVd2k3VFJ2cnF4SWIwcnZXYzRoWWsxL3RsK2w0d20zQ1dWZW5aWTJLTVR3?=
 =?utf-8?B?V2wvRU1nY2xKT1JPMHJPOWorRnlXZmQwMUJqQlhjNCtMbnRBdnJjQm9XZ2Q5?=
 =?utf-8?B?ZCtCeGt1REViK0tvTytoRmg4VHBGcDRRc1VHcStGS1V3NkdxUGFvMVJQc2g0?=
 =?utf-8?B?MlhoeUVQQitrR2d2RkVpNGJ0SW9yZXAxdnZxd0lFRnFrU3pERkVESEJ6TTJC?=
 =?utf-8?B?ZXA1UTM1ZVM4ZmNLZVlUbndyZW83RWR6Rit6VmpOWTFrZEJEaVAwYTh4VUJZ?=
 =?utf-8?B?Q3puR0JBZk1zaVpkRmZEU0s1Wjh1aDRmRjFrdzhwRUovTGFnNFFYOVBBNCti?=
 =?utf-8?B?RGhuc3pZUVpienpQMWZjd2NWTk1Ta1R1Y2xTSThmWjViVTVKbzF0dkxzV0FV?=
 =?utf-8?B?ajVKbWJIYWZmNS9STHA3UmM3K01zYlh6dHBEd0t5a0MrSGl4UHBBUjQzcFZx?=
 =?utf-8?B?RHhMZWNKcDlZM21wSzhlMzJEUjRqMkV0ZmVmazhkOFpSemZPa0p2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <875FB41ACB3A52419C4CB8CE5F747193@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	DHbpG7FqQPmkgomLYAkHPmH/afBh79LfSZmPODWszgZHw6nC9pGVo2QdX+yg25nttmpblO2sGo8GIPNUoUa+bTVGtutVHNgE45zg/j2djR8IUV4qSBe6sj76jk/LQR8CR+ISXLimQCzPYNs65c3Gh1UNeaKRK8bvdXjkykhOkdO3KG2FSF+EzwrLr2l3oCCyNpKXs1o8NFCYfPBuZRlRTddakMT1lfUDOpaBbRlO242rFIOwUwIk/zJ6YQUF/PALYtzWHeaRj3uiSaBUIn+SUVasvnyqYzFHgIMhde0KzHCB4be4JY0zp+xd51RpbqK3GTPmHBma6HD2aoMzV2yGpw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/3HmOlKxcir/e376Sup7VWxOzYC/5iXpXzubzhZ6pESUCtI+Dcrct5RxOz1O2zwtYhLfaYNgix0/mvn1p1oNMrMqkx8oo8I9Xo6BByjyLUOa6PNS98MGhbf90p/gwyCi8yZ7Izx8kK4SxIbUrpcvLEChEgY/saCQMDpP2gCihKAuRmTjZRr+KsgsAshz7YqtcOtUetUj3H848NuSHQqNkIGamp4r8qCFLxL9+TDSpLOC4h3Td6sRWvRcqubACpswo/uFKuWaMA0hwxJhKKBbob6ywzC8gomRDhoorC+hSdVVHyhwzNPAAENzdd7UDnhD4XW/isXygowyOvjHOzHPuqMKuSPupfDZoGQhUVKFwPcxkg8NOQyK0lW3EUoO1xZaZqYSTt7KbNk/WtqmSXqSW4hr34gAkLH7N4HwAlgatixw32SDHLLlWNMA+6gvnKsDvmN6ZZAg1sKHheSi3bmaaGyriBKgqzDWF2W481J63O2LGbCWxBjZ2GUpA+AD9Wt+Vpbz6qFNcB0yRpS1hy5rzKiQoMLpl0ndjLe7rfg8sj+uw9jpGmonF7XInbfa91JSYtXe1UHuTgz6xFrbnbrdiFaX9VtVVOfG0EcsaqWCiWfCInGDeCdV3N8Pinoluv+FjYQsPZbcSJzhtIMiZqO18Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8780f8a4-35ee-48af-e0d9-08def2818474
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 23:38:41.9768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3Rb5ThD0N7XoWenZMCJT/SjHXW+DaKwTV6toD4RIMZ567phBsn/QOLZXc5/KMXM3Qcql7tJTR9KBu5GISTirA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8123
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX1K37as9G3y8D
 RRF7FmLQRQotUjIpBUv+dJ/QwEctsSe2zUEf24u9UN/f31sP6y9BRM9hmr+VA9Oavf/jXS4Ds+E
 2DUycByYYgVpYX5qoC0NDzQG8Q1k7Pw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX+LST5+Gfh64d
 dRoWdpgvSofiQePctCRj0PzJc4GdzPm2eGgjtFduCyw2krPA9IdScGioaB8MrsqcLkr8iKmrh/Y
 BoveD+li6uokLygiqJHdGopp73vL04ewJ+dGRSSfBT8vrbOx3R8fL73ZksUr4lHvRWwWB6OI4se
 eLceUMXXbp7u88V4zy7zx40FVBsFBB2GxbRNtu5SOHXtpKP067HogdF6YOEWojRvrDRx0xJgPtO
 WOs6mvYrog1OSkWSgHX7vrq3KPVhZ+7kqt3/WZIhItSYBhxgpfH1f39OgZTqHAA5PnKWOBAMDfy
 p/Bbbvh4VVW8HkFBmNRSnB503neF/cj94ia1XP2gT53GBQnfx0rmfj3k4taGgtXBl919qD/0kWJ
 lp+UihHkcdX5R8WgP9KqlQByNVzC4RWSLvER4MJGPJISLQcAGsnQE9ial4n2OEAKtYBr/Yv9Oq4
 QPAKQ2WwP6MkpbzFzlQ==
X-Authority-Analysis: v=2.4 cv=DtdmPm/+ c=1 sm=1 tr=0 ts=6a72780d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8
 a=z09CogVrvC61QmIvLwwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7f2gdeWW2pyrvFEBJi2bfjI7H9o0SIbP
X-Proofpoint-GUID: 7f2gdeWW2pyrvFEBJi2bfjI7H9o0SIbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040192

T24gVGh1LCBKdWwgMjMsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IERXQzMgZHJp
dmVyIGRvZXMgbWFuYWdlIHBoeXMgaXRzZWxmIHN1ZmZpY2llbnRseSBmb3IgUXVhbGNvbW0gcGxh
dGZvcm1zLg0KPiBJZiB4aGNpLXNraXAtcGh5LWluaXQgaXMgbm90IHNldCwgdGhlIEhDRCBjb3Jl
IGRvZXMgYSBwaHlfaW5pdCBhbmQgcGh5Xw0KPiBleGl0IGlzIGRvbmUgb25seSB3aGVuIHJvb3Ro
dWIgaXMgYmVpbmcgZGVzdHJveWVkLiBEdWUgdG8gdGhpcywgZHVyaW5nDQo+IHN5c3RlbSBzdXNw
ZW5kIGluIGhvc3QgbW9kZSwgYWx0aG91Z2ggcGh5X2V4aXQgaXMgZG9uZSBieSBEV0MzIGNvcmUs
IHRoZQ0KPiBpbml0X2NvdW50IG9uIHBoeSBpcyBuZXZlciBkb3duIHRvIHplcm8gc2luY2UgSENE
IGNvcmUgYWxzbyBkaWQgYW4gaW5pdC4NCj4gY29uc2VxdWVudGx5IGNhdXNpbmcgcGh5J3MgZXhp
dCByb3V0aW5lIHRvIG5vdCBiZSBjYWxsZWQuIEhlbmNlLCBhZGQNCj4gc3VwcG9ydCB0byBza2lw
IHBoeSBtYW5hZ2VtZW50IGJ5IFVTQiBjb3JlLg0KPiANCj4gU29tZSBFeHlub3MgcGxhdGZvcm1z
IHN0aWxsIGRvIHJlbHkgb24gVVNCIGNvcmUgZm9yIHBoeV9jYWxpYnJhdGUgY2FsbHMsDQo+IGhl
bmNlIGRpc2FibGUgVVNCIGNvcmUgbWFuYWdlbWVudCBmb3IgUXVhbGNvbW0gcGxhdGZvcm1zIG9u
bHkuDQoNClNvIHRoaXMgaXMgYSBmaXggYXBwbGljYWJsZSB0byBhbGwgcWNvbSBwbGF0Zm9ybXMg
cmlnaHQ/IERvIHdlIG5lZWQgdG8NCmFkZCBGaXhlcyB0YWcgYW5kIGJhY2twb3J0IHRoaXMgY2hh
bmdlPw0KDQpSZWdhcmRsZXNzLA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20+DQo+
IC0tLQ0KPiBMaW5rIHRvIFBIWSBjYWxpYnJhdGUgaGFuZGxpbmcgZm9yIEV4eW5vcyBwbGF0Zm9y
bXM6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAxOTA4MjkwNTMwMjguMzI0MzgtMS1tLnN6eXByb3dza2lAc2Ftc3VuZy5jb20vX187
ISFBNEYyUjlHX3BnIWFQMDM3R2VONFdzc2ZZMk5QUnd3RnNQTllMdG5nOVRDbXpCRnU4YW9HbVlX
ekx6RDd2eE0tTXQxc093ZnY2S1VCZTdHc3Z5UmJ1a3R6b3Q5ZE04akVjWVRXU2RubWhNa2pISjNy
USQgDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDE1ICsrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXFjb20uYw0KPiBpbmRleCBhYzY4YjQyMThiNTYuLmJhMjZlNjFkZjkxNSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcWNvbS5jDQo+IEBAIC0xOSw2ICsxOSw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgv
aW9wb2xsLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvdXNiL2hjZC5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L3VzYi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+ICAjaW5jbHVkZSAi
Y29yZS5oIg0KPiAgI2luY2x1ZGUgImdsdWUuaCINCj4gIA0KPiBAQCAtNDE5LDYgKzQyMCwxNiBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcWNvbV9kd2MzX3Jlc3VtZV9pcnEoaW50IGlycSwgdm9pZCAq
ZGF0YSkNCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQg
ZHdjM19xY29tX3NldF9zd25vZGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCWNvbnN0
IHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBwcm9wc1tdID0gew0KPiArCQlQUk9QRVJUWV9FTlRSWV9C
T09MKCJ4aGNpLXNraXAtcGh5LWluaXQtcXVpcmsiKSwNCj4gKwkJe30NCj4gKwl9Ow0KPiArDQo+
ICsJcmV0dXJuIGRldmljZV9jcmVhdGVfbWFuYWdlZF9zb2Z0d2FyZV9ub2RlKGRldiwgcHJvcHMs
IE5VTEwpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fc2VsZWN0X3V0bWlf
Y2xrKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20pDQo+ICB7DQo+ICAJLyogQ29uZmlndXJlIGR3YzMg
dG8gdXNlIFVUTUkgY2xvY2sgYXMgUElQRSBjbG9jayBub3QgcHJlc2VudCAqLw0KPiBAQCAtNjgz
LDYgKzY5NCwxMCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChpZ25vcmVfcGlwZV9jbGspDQo+ICAJCWR3YzNfcWNvbV9z
ZWxlY3RfdXRtaV9jbGsocWNvbSk7DQo+ICANCj4gKwlyZXQgPSBkd2MzX3Fjb21fc2V0X3N3bm9k
ZShkZXYpOw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8gY2xrX2Rpc2FibGU7DQo+ICsNCj4gIAlx
Y29tLT5tb2RlID0gdXNiX2dldF9kcl9tb2RlKGRldik7DQo+ICANCj4gIAlpZiAocWNvbS0+bW9k
ZSA9PSBVU0JfRFJfTU9ERV9IT1NUKSB7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDgwNTc0
YzQwNTk4YWVkYmMxNzUxYzUyOGU0MTRkN2UyMjRiYzYzMTMNCj4gY2hhbmdlLWlkOiAyMDI2MDcy
MC1kd2MzLXNraXAtaW5pdC1xdWlyay1jMTEwZWFlMDY4YWMNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gLS0gIA0KPiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29t
bS5jb20+DQo+IA==
