Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795569180;
	b=EkeyFjkAXUj/8bUkXGeVr8RFH5rx9Y4G15Vwu8RIHxyx3m09db+gGmcOCDVjWrOCBDHg
	 V77FqC0mc8v9Z58kJmjhu2K0CwQSxhbWmr6UUJB+ji4KA/2+ZptiUfx4sN77eQFXnv8fh
	 900VODxpVvy0VNzll7BqByvBYjBLW90PRQRL6Un9dbBG6t2FLiUQFk0TNxf+i1geqLXw2
	 MufNFZTtPJEw2UnbvAlc9eZdBWb18npqFXtqhcbhrs1NfTvmwMuCl7EOnvVE9YVm/a9GB
	 7ZVVcVL+VKtXwB7RseovlCxABTS6kChXWHmDy1/8LICzSpcTMBjnk1NZGa9QAjKnJxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569180;
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
	bh=P17Dr0a4sfEvUYLNwcO/VZCsR3Q1FJOt66N6opma5Dg=;
	b=0UMAY6MmTJmr4FYu8o80CvAtxEhJmRXaHFT74aLGVmevpgwBu+P6q24YBc+DMewrMvKH
	 ij0HOy72RFdR6Jhg47dw2lDEg2HmDPcSMvw+vDoBvqAWSwayagMCcB47QL6YAWQSSuB8G
	 rMrYzzLr3wBOLrBPHFdcm9nHSIHfxsWu77hKEKfJSQw7SV2fPkayXH1coBj+NzH01N/ss
	 3tZf3UUJkzeSp+g1nUFSMfLnf/z0BlWZev4fDDc5G+Resg5oyM6MnNc+d0zuMlSUjZJzf
	 t9jwXdUwhsfo/RdgEzgqV/fF7UAGFxq+bcWiM3yooseQWhthZSgeIHMZga5lm1yP4mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=qVfnB3He;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=JSmu1pC2;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b="c/izqShX";
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D110606A31E;
	Wed, 25 Nov 2026 01:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D110606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=qVfnB3He;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=JSmu1pC2;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=c/izqShX
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMYNLh4028942;
	Tue, 24 Nov 2026 17:12:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=P17Dr0a4sfEvUYLNwcO/VZCsR3Q1FJOt66N6opma5Dg=; b=
	qVfnB3Hef7STkeU0XIYsHD3527b1CLUM2P7MyQnlGCTnM9NEQlo0QWGXvxY4qPEz
	e4BRVxDY/hoMKb9hFdKydrhy5caFJ9M0b+eT8IbziUfeSBtIl9qS0e66SzJcxfVf
	gla9RGr7hFF1rAPt2Ib3QqyxzXjZvqCX7agfrt3CqCym+oSSIEu3l+QDZixUGgvf
	c71m8ry9AZblcFH/bCvDvgaAc+DZ5wnoUz596XNM+PoagafVPKcubQDBWQQH/vK4
	XrxPRuQP+ishL+U7jFjvKvzF1YtQwgyJ5MC6121tmUYrk1W5KcKmCSuYRPoAZcTC
	k798T9bRFHROMjrADAxfgw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j5dr13mef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 17:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795569168; bh=P17Dr0a4sfEvUYLNwcO/VZCsR3Q1FJOt66N6opma5Dg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JSmu1pC2Yt1NSlxNZwpTg8n5O44lEv9Umje61BcD6kNxptu+XtDrng0kUpyhWDlDR
	 w2JbHVzCfIuCJNMvGtZXrDl2oBfFPMNqSL86appKiJtS379qq1ltBZ7UJc7H1qMdmA
	 dohK9aT7TwyicdmFoeUTXdFhxTueev6dHwHU6NaAgz5zHufORXafzMFGdVqxIwBsH6
	 R83xIdnyBZ3xhqEbBGEOEQJkKbf12RNzWLVdOlD0Ex8IAgQhzBEZhuzhpygygrWPq5
	 nKESFIdwBnydAb5dLaVhNZc3j/k7dCf9+su4zK8RjDjd4nEpgt7SkOM9PqaMx//CKM
	 eD+y3bz/62rkA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0DE1840158;
	Wed, 25 Nov 2026 01:12:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AECA7A0804;
	Wed, 25 Nov 2026 01:12:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=c/izqShX;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00104.outbound.protection.outlook.com [40.93.13.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4DBD740226;
	Wed, 25 Nov 2026 01:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6YBUAJ3IzNO7hMrQz3BuZ01+an98ot8neLiTYFRg3xsv6PdMxBC2T4/tF2IyirTwec0HVSw0oczJ6Woj/KTp5cnFimzN705PVdExft/Bnj90Zx9dY0L21woNWhIUnuNewo+6tINDp9/MkpN22ZNIExX6PVUJechxGOqDhB6mkeGV867fquOYkJEiLZWO/TEywV5HahzdgRf6STQnlK2nvzIZxf55R1rvpgxyymIEdGp4GHc+bWdj7sSvExr/g9w6n5QZoamC7qdqwXxcE/l+gQJAWGe2cjHfumGvrLWOSJpBlS42RppjCCh371UsjZjcDJ8zt3tNBPAvWS93wuvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P17Dr0a4sfEvUYLNwcO/VZCsR3Q1FJOt66N6opma5Dg=;
 b=buinCqo85c4DxsFq5XPcbDqcr8F3BtJUms+F9Bl/hacnipkBS+y+emdgWX6Ww37eE1Ozegsv8jjBcP9pItCta1Uz0KoRK8/LljiQTyWVDQ0wD0YI+VWTtiI8K2Gezxn7ETBv/5d0yBwHpixijriV/nEOiqtGGHiUp9LJ76sTgckvR/BaapEziqYeefblYfqBW6N4EMY3Qo8z7lZwopDAVLqnqv9D1wXSjK0vYsEXSlOvJcIcy/VZttk0zZqxM7a/L4AZJRpXPTX575iZ8NfaiQJpdNf4CseJ2PhXIXWLJdAiTQQuRNcveMOlWREjF0ZERfmXeLZh2MVV1Ddixp8hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P17Dr0a4sfEvUYLNwcO/VZCsR3Q1FJOt66N6opma5Dg=;
 b=c/izqShXe1ROh7vVnfUopXNUfB537SAlAlelpZRl20CjNEFYji0ai6xa8sJ+ZEk6QZR3RVucq8Cs9CY7Z5kzYGZp5PNJ0xbOvmZ1ipNmwk0TcQ2RYhFG1pKeAve56acB+d/w7PZUKfIYzW98hgp243cUe8yr5of7qI21ndRFLOc=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 01:12:23 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 01:12:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Joshua Crofts <crofts@kernel.org>
CC: Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Bin Liu <b-liu@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] usb: dwc3: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Thread-Topic: [PATCH 3/3] usb: dwc3: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Thread-Index: AQHdbfRYOGnLP/LfcUuO6jQv7DOZH7c+GCMA
Date: Wed, 25 Nov 2026 01:12:22 +0000
Message-ID: <awY0rh3t_bK2N7Vh@vbox>
References: <20261106133933.1577-1-crofts@kernel.org>
 <20261106133933.1577-4-crofts@kernel.org>
In-Reply-To: <20261106133933.1577-4-crofts@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|CYYPR12MB8872:EE_
x-ms-office365-filtering-correlation-id: f87cd805-6d2c-416a-d13b-08df4a91290d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|261026121527099003|261009220027099003|261022075727099003|261009223027099003|261021123027099003|261009221727099003|261009221227099003|261009223327099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 QXrqSzt6e8PrM1dVuUpCxVdi+Z5noONZs59TOfBOOU43fm0NMljmrwc52WxZewYBVvFte4RE3t5HWFLOZb3X5IdaezP0ALS0sspkO9VyxLxSO9wsDe57PogUd0pscoqC0FlyJvR920LyukFxXcrbvuSjavwtl8hPaHiQOyD73/JMLlKMuA83AevsFC82dFslfDvVEbGUozgdrtYjz/xKurXqdiKa7j0l+b0Qog23ULPTAecCAhizadH1O4uJNYt6t55uCD/ifP7nCW+XG44+k1HYPuwgAVWUscEbOqQmjPaF+0AHtEuIIpVQ1sxOghYjb3+Vh/+WSeqpjTAFmYKmikTjVbIKUszZSzMGFl3YnIDGM3p6jdV0yKm8cGaerTuL8B0Oga/SbRJctPfTGos83EIYtfnZgR5KV6tC/3Yt//Prnj0q76UDmfG56xuDvkqBkfSKbSIokNQxulgYNZ6081Bpd4zI7EZepkfcdSu5klhEccnZ6Q3bs5qTcUK0kFLymSjJtd8UVG8BzObFyV97uHxbxMVAONjjj7wek/Q1WCg8wMATlcKt58gye4g1dqyWi3ua0RxikEr3HMkvtS07jahDPImUwdYCzEI6NZVc8vpY9ilF72wq3VaAk5p1FcdrKGwiEqHbYbeMuiIhFLqWsCMOuRn1smMh8+673j5z4WVsI7r43ViDrpjp1qGvgWwYqo0KbruYlr+zmFkn4R2CbC4TkOYDChhtkwyheDRHkBQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261009220027099003)(261022075727099003)(261009223027099003)(261021123027099003)(261009221727099003)(261009221227099003)(261009223327099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1FpR0dWRno4dm9sbWtKdVhWREdqM0x4U00rWWtxYUZVMDBzZit0ZVg0TVlS?=
 =?utf-8?B?cGIzdXd5dndkNFJka2NTV0JSc3UxcmN1SmNRWklXZnR6L0haNHBRM0N6MjFX?=
 =?utf-8?B?Qzd0a2YraFBJZFZ3QjNub3NKN3hPQUxza1RDSXQwaXM2cSsrQ1hSVUpRM3NR?=
 =?utf-8?B?ZFdYdUFxMldWck9nS0NsTEE1Tm5GUUtoZXpKQ2MzbDk0YXNDWGoyWTJZN1lF?=
 =?utf-8?B?cWdZeENmUnBneUxBdE55Mk01bityN0t0UEx4amNWUEZWaEJMODk4amJQYjUv?=
 =?utf-8?B?aENKRitUZ25PSU03YzlFSHJyRTYrTnVnWjBteE5WU1NRVjdhTGRvUSs4aUl5?=
 =?utf-8?B?SEtYY1NHak5KcTFJUEFkb1JVTlVuQ3NuT2t3V1o2eVY3SjEycEgzZzROUGRp?=
 =?utf-8?B?bjltU1FFd0g0Znd5Zjl6dXlDME80UXRLYVFWdzRMcC9oaGhieGkwVjB5bmpY?=
 =?utf-8?B?Q29jSE9iQWE1MmhnS1ZnREs4ZTFOQURlRXZPcTZNcjJLRjMveVQvVmthNUpi?=
 =?utf-8?B?RW1vL2d2TDlOTjdYWVlDajZzZEdTK0RJTURIa0RlWXpveGhpZEo4TWthR1ZW?=
 =?utf-8?B?aHpjdEVnY0xvcFFGUFRWUzZCSmMxZ1JrWmdpa0JERHV2dXJrczhvL3IvcHls?=
 =?utf-8?B?bDYwNzdtMnNGME82SlRiNzUwenQ2ZDJVNS9ZTHZ3Y0E1U2QvSEhtQVBid3I1?=
 =?utf-8?B?MElaaHBjSS9vNkk1ZDhUWUZpZE9Nbk1icHdkaVVsWlFuL1M2aFJYdW5XeVI5?=
 =?utf-8?B?cjlTdHEwK2FFZGFoWllRWWJCc1k2Mi9qd2Nia0hac1pkMDMrQmNBNElvSVhV?=
 =?utf-8?B?MVZsZjFwcjl5WUJLeEliRXQydmcxVkUxTjdnR2t0TnR2WEQydGc1cHh1QWxD?=
 =?utf-8?B?SkMreVF5Z2xWVkZISkxROFNTR3laMG45WmFCSXc2WjVoSkxmUDRITHRKM1hv?=
 =?utf-8?B?MEdCbGo2ZmZnVXBjb2R5WnJsUDhYOXhFQ2Q4NHVHdGVwdmtObFdQWGZUSnVr?=
 =?utf-8?B?REJWbFVyNEdrK3ptN2o0QkFnbTBKWHhrSmxSY1hJdWJ5SHJuWTRkZTQ2bENQ?=
 =?utf-8?B?YzcwUEVJTmVUK1dTYkdzQlJZNGRIZnQxNWZramFoMXhWMlR0Ym8yNmlMS0xR?=
 =?utf-8?B?bzJmUVpEdmc0YnFOQjB1aktjUGttTUVWVHRxNFdmK0RJc3kySGhjYm4zNTlY?=
 =?utf-8?B?Um5ydnVrSmNiRWo2TmtUdjUxeU1Kazc2ZEZ3Z2FaY2Q0VUxLWThBUnAwbHYz?=
 =?utf-8?B?ZWV3Y1hUeER5V1dkUFRISUxHNFdEVEM4RDMyMGZPUVV0ZHhBZ0xoUHp3cG8r?=
 =?utf-8?B?RkE4QnZLUzJpeXVXMThNeWtNU3RFOVBuaUpHWTNzTnN3NVpKKy83bFk5azhZ?=
 =?utf-8?B?Y2JGcERjSkpBQzNlM1Y3UWhvbk4wRTFCeTdKMUZwOUdRcWNMeVFQTVlIM3ps?=
 =?utf-8?B?ZGY3akM2MVk0Z05BL21MK0R3OFh1S3ZGK0dqTW10N0xBU2lEa3l0Mi9yS0wx?=
 =?utf-8?B?WEtINDEyVXplQ2JnaUZQeGYrR3Z4SEpObVZQRDY4NUxDaTFjc3dBbVcyZFhV?=
 =?utf-8?B?VGMzSUJrUmtSdkZTVGswYllBNGtnb0V3QkN4SWprK2d1RnM2Y1NNODZUTHAr?=
 =?utf-8?B?MllXSUhBRTRrWVhaazl0dHNwdmlIZnpPREdSdlNlWHZBN0RDN2RWR1RyL0w0?=
 =?utf-8?B?eTZmSFdYa0hEaTkva0ZxbUt4b0tUM1l4TWpEVnMzYkxPSnc2VDFOSlppWkJO?=
 =?utf-8?B?Qy9ZcnBvN0gycDVhSmxHZ0VEVThyVG1hUHlqQ3hBRFFqOWpIaVFUaXhXWWFh?=
 =?utf-8?B?YXlmQzR3NzJuNnFuOTJQcTFuRm1MVm0rbVE2azdWUTQwUitaM0FLcXRNY1Fh?=
 =?utf-8?B?OElnNUFrMWtGWmUzQm9Ed01TKy9GMlg5OG1WVVltS3dCWk1OcG9wNDR4VGIr?=
 =?utf-8?B?eHEyRDdrSFlFSTczQ0hUTndNeTYwYXpYbUxDYmpIV0REem5lN3M1eUFPWGtE?=
 =?utf-8?B?WXVPbE5UQTVwTzFzYmg5cHFQQ0tpdkdpYTBUa2NjYkNHNC85OHZFdkpYWjBC?=
 =?utf-8?B?bk4vUU13WS9IUmFHNHRzRXlGQ2doem1ENzJFYm9BWm13c0JBT3hDcm50TEw2?=
 =?utf-8?B?S2V0MW9BczFrYnFXaDhHVk1samxydW9FN094cXQ1Z3ROUk0wK2ZXV3lMdnNL?=
 =?utf-8?B?WFJweGszWHFPSVVDQVNTZ3dLREgyaUY2S1hYZE1nR0JCOUVqWUh6cGZBcXJH?=
 =?utf-8?B?cDFSbWttaDZWMlZDSU96TGh6ZUh3WFBOak5uZDJCWkt2YmYySWtJL3V5MGdC?=
 =?utf-8?B?TjczVGQvUTNnajluak9YemtRenNUdFdobVZ5VE9vc09VOVRvWkMxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ACB4F1A86CB6048B8A277CD212992D6@namprd12.prod.outlook.com>
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
	M1/02IHlVWS2sOkWMjjWuIuTqZuh1rCjwt9arV1qbd9/fxafm40z6OAqmrdaDOqnWyS/upz0H0CNBp2SMMN9TDICIkWXgHC+fERPKhg/R0VZm+jnEerPM2J/9eY/QWVBYZ8wxkn4+8n/KFYTV3A9kCZLgLBdl+r1bXgDf9YrCj7wJlDtJhYmWyCF9ZwBfa76P23Qr3nruT4MSliC23tbCcqUxIgrhdHswc2gYzSZh1y7ygvRawowxwCd8ykWhy1I+kXqFUBMyxoDzKWj5JihrRqsbvkZTxSBY2WY++1uXmGaC5CfVtN9VRrQuU+PvIh7nPUXEP9MScshQQWnlAY4IA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7xm1hItTmlcm3OvdQ/bNZVVQfO3ul6xuqpy5lQC53qjCUJ5WWc81W4w69ilq//YHxL7d6uzzFXuL1STg0XlXkk8h11pvL1ffSlxb/hfwwmM4K6uAb7YaLPyo+EOpiCuGwwouv/zz20crXISMS4e7LpEUf0x3ZXc3sMRLCc8e55MraN9D85qLabA7MYZ5GUiCLD10LA0Qv+FhnUnEDQVUrP7gmgySg/iQHUEx9qp6vw7rS4w+5hMWA+TKgApG2kEIKNkuXQlIh8/sUzLoPNLWPKPUc7PPijVCZ66xOSewW48ElpPfa2GejaPzEyU3CU/9OWgR6MXj5lvRIa8cBWKahBfRiTWKk9qPoBUfWw8C15beLFl9x/2X0WM3CHNMr0BcFkHe+xTOJ8Gt51YjwqQBMx8A2hiwGoTmehsQvNPZ/czbLVBcat7YIsQL5z00CEsT0iXr4Ra/4o/qK/nY+c67tNf50V1uGl0zKpZezmQtVfjzwjfuIgA0nwUbuQ07prXVaa3K4fBeWsja/YXiAt6ygQKSPHiLxJt6mgqsnSHIFb6q4A3oH6VpyKhrOy0urTnN/B+SIReq3hnkwCakHOz/wBpAXI6QwVvB+PqHE3WUkChMmHq3YUzALSlI7GOWUmhWMFzRvEIX2PQW9h7hmC4h+g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87cd805-6d2c-416a-d13b-08df4a91290d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 01:12:22.9122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqMNBbEvRjFUi0gCMw+u+l4c4AMdOW6O1Ptr2chV4EfUbDFmJDRVVPF2mryUI1ArNVEifaTl/yyLxsfO7WBPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwNCBTYWx0ZWRfX0DNd69THxx5a
 oyEOa2mTJT7uEuoCd/oRavx8TdyMuQrii5tTZuIXCBKDtvZocJZMl2Eb0zzcqJpzkwVoRmq44ue
 iT5NlCycVVsZeAT+4auMg50mhInQL2HqRsEr5t323CQJyjFQbnp9zxoHW4ftGMOMnVHh9ltYcDQ
 uIeTIYIGZRb6K4Gwgrup67WmzK9TGPuYLwuNtiEzAZzcE6akmaU+QvQTCOVKeD4Po04Zmka8Q/m
 ax3aZz7EEKuK6lv0BpjtTFPFOs7mRuMSat8MKDaa6RE2JoDYglbCfS5BLHgckK+pQig03n90yd7
 ffP3yJGSfwsLw7eUGTPMOB8iAKFFZz8iAdr7QENLgDIF+9UpbQVvQ/h6sZlm9kSR7zxmYL0/sSv
 dGNRYJNB86zclKkT5oVXmkxUId2/tTa92np8f+DSM6z4csPlfIUh0+S0yy0pOxnIlwozMAdHdg0
 6MoVKnCGZSbx0TvOH1g==
X-Proofpoint-ORIG-GUID: 4wgabXzU8gWldJIG0Zf-Ii7D2MEx94ca
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwNCBTYWx0ZWRfX+u4KsjZeT9gX
 VYeK2/K418XCg7g7u3Sb3+FQLR0+RPIR/HboE157KSpsOnUh5sLIQm3IEfSyz3NaABiHcf40t4b
 hQ6vX7TlHYLAgbkFNUY7tv2pbO9IqLk=
X-Authority-Analysis: v=2.4 cv=NoxE4MdJ c=1 sm=1 tr=0 ts=6b063611 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=l9AJbsJVh2_AXG9fYesA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4wgabXzU8gWldJIG0Zf-Ii7D2MEx94ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611250004

T24gRnJpLCBOb3YgMDYsIDIwMjYsIEpvc2h1YSBDcm9mdHMgd3JvdGU6DQo+IFNpbmNlIGNvbW1p
dCBkMTcwNmY5ZGE5ZjQgKCJQTTogcnVudGltZTogY2FsbCBwbV9ydW50aW1lX2RvbnRfdXNlX2F1
dG9zdXNwZW5kKCkgb24gcmVpbml0KCkiKSwNCj4gZHJpdmVyIGNvcmUgaXMgbm93IHJlc3BvbnNp
YmxlIGZvciB1bmRvaW5nIGFueQ0KPiBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgpIGNhbGxz
IG9uIGRyaXZlciBleGl0Lg0KPiANCj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgZnVuY3Rpb24gY2Fs
bHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgQ3JvZnRzIDxjcm9mdHNAa2VybmVsLm9y
Zz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgIHwgMiAtLQ0KPiAgZHJp
dmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyB8IDEgLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggZmQ1YzJjZDM2YzU5Li5jNGYwYWE5NjI3
NDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0yNDMxLDcgKzI0MzEsNiBAQCBpbnQgZHdjM19jb3Jl
X3Byb2JlKGNvbnN0IHN0cnVjdCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEpDQo+ICBlcnJfYWxsb3df
cnBtOg0KPiAgCXBtX3J1bnRpbWVfYWxsb3coZGV2KTsNCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUo
ZGV2KTsNCj4gLQlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKGRldik7DQo+ICAJcG1f
cnVudGltZV9zZXRfc3VzcGVuZGVkKGRldik7DQo+ICAJcG1fcnVudGltZV9wdXRfbm9pZGxlKGRl
dik7DQo+ICBlcnJfZGlzYWJsZV9jbGtzOg0KPiBAQCAtMjQ4Niw3ICsyNDg1LDYgQEAgdm9pZCBk
d2MzX2NvcmVfcmVtb3ZlKHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIAlwbV9ydW50aW1lX2Fs
bG93KGR3Yy0+ZGV2KTsNCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoZHdjLT5kZXYpOw0KPiAtCXBt
X3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZHdjLT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVf
cHV0X25vaWRsZShkd2MtPmRldik7DQo+ICAJLyoNCj4gIAkgKiBIQUNLOiBDbGVhciB0aGUgZHJp
dmVyIGRhdGEsIHdoaWNoIGlzIGN1cnJlbnRseSBhY2Nlc3NlZCBieSBwYXJlbnQNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtYW02Mi5jDQo+IGluZGV4IGQwM2IzOTUwY2UwNC4uMGRmN2U0MzZhZWIwIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1hbTYyLmMNCj4gQEAgLTMyMiw3ICszMjIsNiBAQCBzdGF0aWMgdm9pZCBkd2MzX3Rp
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICAJcG1fcnVudGlt
ZV9wdXRfc3luYyhkZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAtCXBtX3J1
bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9zdXNw
ZW5kZWQoZGV2KTsNCj4gIH0NCj4gIA0KPiAtLSANCj4gMi40Ny4zDQo+IA0KDQpBY2tlZC1ieTog
VGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGlu
aA==
