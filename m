Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADFC3246F4;
	Fri, 17 Jul 2026 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784253447; cv=fail; b=R9AmviRCIk02HPQk8KcgkmX+eHMUQqBi4wMUmkPz0KAriXxZX8+URjJjhRajhWt+a2nXlwRaeLVsNoqvS5HUbDu38f33ETTTZqcVKwIet/m92Sdd+BLSqHt2W2pBhfsnjvecdMZODx72hxo0eX5e/6zvPaVPLKaMTw86VqY1BGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784253447; c=relaxed/simple;
	bh=LKYeIvyTcckhI55jXXym9mZk4js1+NXTu3HWad5UmqA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EGgjSDbvX88Blf7rxBjYE0AzR831dqS8yACMp/QJDDi3u63tRUQG8vrfnNtWziV5/AZTpz0yaWoL9WCPAsLbAV8r3h1RtWiJfD1x7LyKniLiVFUM3k/m+clSZOwlcWKBE3HCQepveMCPOrsdpj/XPR8A3tE3mV8RhO19qmFN9Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rq/V+Tbs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EcKOGRKa; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SX/6D32V reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rq/V+Tbs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EcKOGRKa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SX/6D32V"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJXcS2002656;
	Thu, 16 Jul 2026 18:57:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=LKYeIvyTcckhI55jXXym9mZk4js1+NXTu3HWad5UmqA=; b=
	rq/V+TbsPeU/Qlg4wYwRJtLlvcZUV2G1PVlaFRITAnIjpFmALRohF6DfihulYVCl
	Tsyz/Z23PAG6eABBgG5HENxSaR670EMo9n+oFuyPOAAfiUAMo8kT8ZV9kCYY1tk0
	HarZQOrXg5mum5MP+3fNR9QTxsaFkn8K8EeMxrDSMW+y393AoEpj/ETDqMd1R5pi
	yhodtLl+NApLq/8vdl/I3Kb98bdjrExO59Ko5O8QWUycstin/epPupTMCa58fskL
	FdCuDql69nWsGbMav6sLGlUCYJHKeuGYAqpYYcScs+p4jaj4RlX89w+yXT9PDVSS
	+lYG1L/AfTdLs5CDsT4pGw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4femeh2pya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 18:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784253429; bh=LKYeIvyTcckhI55jXXym9mZk4js1+NXTu3HWad5UmqA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EcKOGRKacfBI40OAMnjrnXucZRy8QCL8yiU63W64IZqwC9msNEzKBdiA5R5yCX4zX
	 TQpxcoJKZ+JTgDiYS9efMBdzpskBsfEDjrSgekwLoLzOg2JQGynhvNaMYe3CcFml2L
	 oBaRwQsYkiOVVoSeDzqJMswu27AfNUG1zGARbRwN7dVv2cVZt8eHgaO2Mvku/q9bvB
	 LNteuCyCn2KvqIplJcLucqAy7YbfCG+a59YOeqr6a8KwqTtzTZvZDKKw8lInHOOTkJ
	 pg1hIsAcUtfiNhwpI8J37r+dLE2wIJPYUCKHsuVfLL3+BX++fc5HgnhV1RQoCORpcO
	 cr5zDyN0UD5qw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AAAF0401AA;
	Fri, 17 Jul 2026 01:57:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 17720A0070;
	Fri, 17 Jul 2026 01:57:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SX/6D32V;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00607.outbound.protection.outlook.com [40.93.23.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6FF432200BA;
	Fri, 17 Jul 2026 01:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bonJhoRKruZCNVbbRMjOAx8tTyLl/bEyFR2BARahw2qNWXTVrOVoFCWGiCrqGLYLKD8SUomTTvFUj0GTF9N3cqm1E/s1szK+KVodAVnWbSE+WMIywvpjwUgIhX+DDjZgdSHPys7k5K1J8x+BOVrUSqLIFV4duAlIRBwe78AS5HfyfbGwiqj1g2vLd/LNPgwHP2F56mrNBLfRtrBhpS7M9orrLwPZMZeoPB+gaTFyZWQEmKaXwIybheFKDyHO2u5s2K9LcSMz9bMvslljscz6sROGQNGRPAMkiOaInv4hlCj/NjU3nRXh/bSUw2Asjc4Z6Ztazbg0GscUHAO2xnK44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKYeIvyTcckhI55jXXym9mZk4js1+NXTu3HWad5UmqA=;
 b=Dxr5CbGaCq3JmXrlAJEhBdwGz7ACJ2oLuoyy6y2c03wX0kNjMb6zcPVEwypY+WBR3CSgBjNFD0lXJNlj5YTqYhtT4y50X33JW9r7gafPZ/J/QXdlH4tMwLwkBRCVBLtfAZZGVFp44XqMNrjnfP7vCd33GAjXTgykjCv1mUckwBte2VhjzD17OiogMkBoIycOlCWtDyn9eLDG5IdzHwtQZ0icbC4aX3fJHhAtxUc2/La/WEIx7Fg60liu2qO+uzrI8T2asAZOxp8NX90w1NOYjW1ZF0q4val6hiOhds4eEHkwpiAy7GZXBr31lZGZbvfooxG3fHVr2Xg6cIEGZuJs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKYeIvyTcckhI55jXXym9mZk4js1+NXTu3HWad5UmqA=;
 b=SX/6D32VCFj3q2yAVUAV23MSCsyjzH/90WNsNHL7s3ehCI8PKx/0uTE1bbVVuIa7x/rK9uQXs83I3V39efd+heRIfH/v00VzJf7WPCHg8KycAp0tgPz5cgkcxhVUmgAMn5RtJfRPHQbfo9pGg9CjUtfx0+7HJyRkn3GFfgeuUIY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 01:56:59 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 01:56:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index:
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABo3gCAAShsAIAAUfSAgABrlwCAAOIEAIAAFKgAgAAKKoA=
Date: Fri, 17 Jul 2026 01:56:59 +0000
Message-ID: <almJeSq1zfcC1mjj@vbox>
References: <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox> <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com> <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
In-Reply-To: <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH2PR12MB4102:EE_
x-ms-office365-filtering-correlation-id: e8c42fa7-3f00-4949-6e21-08dee3a6b06b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|38070700021|6133799003|11063799006|4143699003|56012099006|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TllwD5coTYG9/UioRpHCW2W+2jFOGj8uHUeiShI/pYB61foQ7IRPdf6VHWPDYtimBUBr4DWPWxXvneeXMMB/HJZvtXD2L+mNzhXLNheYV6+M2REe8XrHIE906r1FNuFX1XPIAipso+IWWiUp8R9AqTawyfKsCgfSjGgCBSU0epuLUeBnb2mgdmktUiQyIz5PO2C+QOgn7FBA9F+pnDDnCH2mOy8YGlBUXCNCYvpfiN9oQJv83Fd+sYmtMtwQFjuK/405zmf7A/VFqEz19F2TC2KQHzqvR2tVDndVT7Fytq9IoZtAb8bjiGoZIUc+BZyvLzN/pqLhWM4hxN+d6d9RjOKbw9gSU2fg+I8WeQ0hNay49WNbodcIiLWViNn9jzB3cNxF6z72UXpLqk1rZq4dL3e+W2GJq0LIvZUR51W9OtAxor64hRIH7YGs+0OQOrszIor0xpoxuYYPUfHJc2Cvsqh/DGm+GiqnyIycMX3hlCoUuCEjU27bychJZkL66+Hy0pdYkq5bWA9rPE1bn/9rT8t1TgVw/QgvX5Y1A9YaaSqmNjIYf4Db2nvXgNsopmoQe3C4yBHc9DvkYea8oY8cYKgpKagG8YqOlfKHs7kw2dYi/WvRINLUWtZYlvbD/Iim1Uu5bFdm8s5IbzXgZjG0Pu44bvsfKphfWexZG42u7BUe0X/eeKOwT88f2DA9Qd8Ex93oDFvi4HynzCRd+KuuWZwN6BBiOQ2hfwlxvk3SrvU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(38070700021)(6133799003)(11063799006)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnU3cXQ0L0s0L01Qak1OMHFoUkozUVU2Qk9WZFovRVdQNHd6eFRUU1ErRGxy?=
 =?utf-8?B?ZlV0NGJJQlJGT0F3YmQvNmo1Y1NnRWlpZFgxbUQydk9pamY0NjV5dHBwM2Rm?=
 =?utf-8?B?eHlGRXhrZmRLZVN0R3luRmN0RS9TS2JseHVvbnM1bm9nWHg0eC9aTG5DOHFs?=
 =?utf-8?B?NUt0YWNLQ2xHWHJQcGhUWGc2K0tVWFZnNFpwNmtucExrWlZXajcrWTVDZlBx?=
 =?utf-8?B?L1pHajZrTUNkczYxRW1nZ1A3alBpckV2OXVpTXNBQjhYaWFTZGZ6d0NmUVR5?=
 =?utf-8?B?TFV1N3RIaUYvaTJEWGdkZjUwZ1l4dUZyYndEb1pOblEreCt2bktkdFErZ1Vy?=
 =?utf-8?B?S3NDU2FYM3FZMTU2MUVGd3RQejhGSE9Jcmo4QTluRVk5YmcrSTFSQ1FlcVMx?=
 =?utf-8?B?cE1BYWFmSWd4TGtqNFBSV3AxN2o0K2xkY0RjNktLZzZGUVhlTmlTS1ZDbVlR?=
 =?utf-8?B?US9qVjhlVDNqanladmhMRzlTcDRHM3E3ck9FUVZmMjNyb3RLQ0F3bGd0UVBH?=
 =?utf-8?B?ZlBsa3BSdXJPWGpkdEdlR1prNFB6RXZYdkI2eFl6S25HN1p1cnBpQ2xMSytt?=
 =?utf-8?B?S2xNNFdFNlZISytrR1diMGhaQ3dUNUdFaTYrWlV5c3RTU0dXM2xLZ3ErMitH?=
 =?utf-8?B?ZU90M2ZNb0psOG9LV080SSs3RTA1NDYvTnJaUGkrY3lmaHpsc0haTm1jU3BN?=
 =?utf-8?B?akIwMXlsbHZsaTBTRmk2TTBRWG91UDNwWUtraU5GWGZ4Y1NOVVdhSk5pa1c3?=
 =?utf-8?B?Sk8xSFVnNmlKL2ZTcVVTd3RaSmRmNEo5T3NlWjdra1g3UFRhbHoydTlHV3Qw?=
 =?utf-8?B?c2RqZk5oQ2RmY2lScmxhc2QxbWJjUzBmSko5aHZsaTlTRVRKS0JhWjIrYVZ4?=
 =?utf-8?B?ZDMvcVhva3JYRnhFYkFzT3NwdnF0YlJ6TkFoTE1kR2xiRzhBekJTUm0vaG5E?=
 =?utf-8?B?ekxuT25aZ3pKZi9RUUx1Y1VCTGdRU2psRVZsWEZVblBxOTFkMWdsbncxS1ZQ?=
 =?utf-8?B?T2k2aG0wUXE0SzV3Q3ZiOFdJWjlQWEpXZTVsQ2hHNk5LWjVKaW1lMnB0cTdZ?=
 =?utf-8?B?WEg2MC91cEJOQjZaYlEyUThyOUU4MnRtbFF4b0ZtZWppUmk1Z0dGNmV4L3R1?=
 =?utf-8?B?Z1FoTlNKalVCVHlscWF1dnN6dDRDK01CR0t4elQ0aFpxRXFOV3hTQy8vNVZ4?=
 =?utf-8?B?OHlCTFIzTkI4WUZEZVM2YmM5SWY3Zkp0Nk1INk4rcUs4U3RnQ0xoMkFadDdB?=
 =?utf-8?B?ZW8ydnc0bG8zSVRuUUoydHpFbzJkYUNOSkJ0a29rRDQ5QzZLeGZhczlLNThy?=
 =?utf-8?B?OWltQ2xlbFhQeTN3YmZJYVhWNXVDbU0zVmpCcGNnZ3JNdm5ubXRwTzNHN1lo?=
 =?utf-8?B?ZXZ2cUp6WVNBUHdWVzVxTTVDRThBODZaSEhWUjlLRkpTUnpPTlNwaE9aOGl4?=
 =?utf-8?B?OHhBY1NIQUhKZEh4QUQvSlIxS0Z3SXVRTzlLNmNOVFNkSDBpQWEyVUxaaUc3?=
 =?utf-8?B?bDRyQUVEWldUU095ayt1QjN4MkU5ciswUEQ3TkM4d2dPcHBDejYyMm1aazBG?=
 =?utf-8?B?ZUxmSlI2WGZwY0FRcTZma3liVnFaMzU0RERxVDRmWS9GaDhrRi9FdW1RR0tB?=
 =?utf-8?B?U01uaDZ6R1BnWDMzandzNk96Qnh3NWpUSVY3UllXMjhic3ovRnVQZ204VXNJ?=
 =?utf-8?B?VkorSHBXTmQ5cTVHTHRoRlFvUEhEY1VkWVJ5K202Q1BJRjE4MWJPYnF4L0F4?=
 =?utf-8?B?NXN3TkZISC8zNm0rSHQ2OFpsYXFways2SXJid1pOZEJpQ3crZlNhOUk4NmpE?=
 =?utf-8?B?VnZuYk1OdDdGc0E0dzM5blFMK20zcnRzSm1TSW83NWd6Ukxxa2lOQnJKVndL?=
 =?utf-8?B?bHEzbEN2UGFpUk0rcEV3MlNHSDRKc3lIbXJmZkkrQ0VGelB5T2RNNWFRRnNL?=
 =?utf-8?B?MDlUTmFGRTB1WDZuSlVxa0tRQUZqcUJ2aTBuditERzRUMWp2UzNQNjE4bjhU?=
 =?utf-8?B?bmJuNFhyK09LaUk2Z1JEWlZMK1ozbmJkR2Z2eXVaWUxMVS9MYlhleUxYRHlJ?=
 =?utf-8?B?VExOa09obGFoWUllT2ZCQldFR1NnWlpJb1phYmE5eUZ0d1BWU0NMSlFDUmVx?=
 =?utf-8?B?eTJBdDlkVzF5SGtKOTFVTTlUdzVveVZhSGZPeVBjWlRLanlBbDU0Q0pxTjFI?=
 =?utf-8?B?U3hXY2N4eXUxKzBrSXAxLy9IcWhsVGRWSUZnY0xheHRCbXZEYXdURTZ2S2ZT?=
 =?utf-8?B?QXkrRnFYNjA0MWdXTGlaSTlwMU9MNi9uMWtUaW9iZjZyNkhVdXhKTmNLREE2?=
 =?utf-8?B?d0gzdDEyQU9FOVNDS0JleXV0TUozZjRKcEltazhXczhTRlpQb1QzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CB11BAE7B62F5408C4790391FB92222@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sb/cJL6uW5b/5jxiRkRZ7f1uHOdswSpA8r45kdu9ihkAyJaNugkEaXyt61Di2n1WUOPqDTkC6I0TVPCfa2c+LeZfaaREx1dmWdiWGsumv7fMbSFLJIeuVB8TrW0Jf9qE55fYKfBfRQ5BefCiGa/pEk19iD9AoJYrJMAkXktSs+S+2lyTBKgbkYEdeSn3fHr8phNUOr1FGu6Rqu9Ez9/Fh1NNjmS6dLV4Wf2BLZjVue1PX2IDPWyQKSHzQkzcuAvCa1xbdGgRFIlgoD2SO4PjK3KLWxoouuJc63wjTJFUeFi852EYmLT35Vg5+bK03qFOcB5IgpJy2JuKWTbP90764A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dQL5q2lVXi0qIUNvdTJyFFAixsjiZ+YmyqXNt4akkMCJu8I1KVaWwSl7PladTfuW9qrZFuKoq8drVDlR4/g0XCk2mzW44IjVK1pkb3enJASPyj4qjKOuR8F2J3DAIOkAHia2z0leSekZR49nO8usMu27MXGFz2Pv864/Ho7tcd9DUwvAKfCn0ps9ITFbJLot3Jc9LfjQPegyeesGZpcNUI9Q1yHaUdAfEF9oQpnyolJDykzW5ly8NnDXNaHVdRJTKmNWxH1ZXc46LIknx/rG4UErKZIhV6TzDSb7U4JySlvDP4HgoCsimq/igvtu+8CTx4A/HBOoVzGB/kEupyJO63krkD+V+MQlmN8+j9OC0svKLvCCf+J1EzSlaW1NHJj3A0g6TwI03IVJezL0buQmg5XAs+FsMII9Wd1jnoBbtHEfu4dl//XFY2f2ieK3Go33AmCF2IrgeDH5JEUcaRd/eXf/BQHOtJ4Bmgb2xFeuvqc0a9/qf5s9BOp6PS04OrzSOH+yEF0D8/K5zsBXcPz9R9E/s4bvFhTaGYTC7lUr+J302zYJxWSWLLQgQO1fbbm+/YBwIQWJYATPutDNbhEBr6XritUSSygI1Go+F4jwpcmYxQz0s6KQXi/168SQfChxTGQcSIjX2mxN7ffOZfp3wA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c42fa7-3f00-4949-6e21-08dee3a6b06b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 01:56:59.6703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mqeua58Rx6f9jzjp+Is9aG7M5nNQDAj27cHVFBDjvTPmbjZIsZVrMeGimph9DKc3V9trbBujyaRqkI3Diqa+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102
X-Authority-Analysis: v=2.4 cv=I8VVgtgg c=1 sm=1 tr=0 ts=6a598bf5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=q_mhSd9Jrv3ImhFzKsoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: iOr8mIEzPoqkxK1D4bFxjQ2m3_uI6FVi
X-Proofpoint-ORIG-GUID: iOr8mIEzPoqkxK1D4bFxjQ2m3_uI6FVi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNiBTYWx0ZWRfX6mOZPM6HuoYt
 9UzgN501hoiEN7LPRR5hL1yKZ/JHaA4eKct/Nar8+wsIMmXXZFR16+NcmZNK9wIT0fZ1v+HqZsy
 7KNIwxPFqOR47zWqQGNyDlb3qb0nbEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNiBTYWx0ZWRfX3FdQE4+Z8vbv
 dBkBmnI4qjDu5Y/Cb3DoiUxY/U/EXj4QOwwGdrdgSsI443qNLkK+oZ/g+kswtIecn/k82YkUU/T
 yYSV1sPUW1hTf2tOCF2TqxhZqg7C0N4H/fDtbyeRa66jMu1WJ4dq2zfmaRqHtZ+0F9WyDx59Y0e
 FGxdPrlJhEq12cPnIhNJZw+OpwtujT/5tcSVj0BrW1O8DS5bXAkDuDaq0NvIu27VNA+XvKdMSuZ
 mbc0x7/ttI9BlfcmTvPsTpeKT0oOMZ0oumsbIsiMe5br0fM0En7GOnyTKatIF2aBJbahYaGfPUJ
 nbBjnlARXkU7bTCaM8Gqy2+r4KH4CXQIEzpmU2U087BdmJ9fozpbCSLGVbylepd8f0WwfxyZkVp
 zh42GNIYSmMi/kGJnK1jw9W7W389kR+xECiSxOTMhZVzaeSiL0dusxFmomGOlTNxmjOCMRUoney
 ldhMt424lfL6Ru/bBXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170016

T24gVGh1LCBKdWwgMTYsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTE3IDAw
OjA2OjM3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IEkgaGF2ZSBzZWVuIGZl
d2VyIHBsYXRmb3JtcyB1c2UgInBoeV90eXBlIiBhdCBkdHMgZm9yIGFybTY0LCBkd2MzDQo+ID4g
PiBjb3JlIHVzZXMgaXQgb25seSBmb3Igc3BlY2lhbCBjYXNlcyBhbmQgdGhlIGNvZGUgd2FzIGFk
ZGVkIGZvcg0KPiA+ID4gdGVuIHllYXJzIGFnby4gRm9yIHRoZSBkZWZhdWx0IHNpdHVhdGlvbiwg
d2UgbWF5IG5vdCBuZWVkIHRvDQo+ID4gPiBjaGFuZ2UgRFdDM19HVVNCMlBIWUNGR19FVVNCMk9Q
TU9ERSB2YWx1ZSBmb3IgVVRNSSssIFRoaW5oLCBpcyBpdA0KPiA+ID4gY29ycmVjdD8NCj4gPiA+
IA0KPiA+IA0KPiA+IFRoZSBHVVNCMlBIWUNGRy5lVVNCMk9QTU9ERSBpcyBvbmx5IHJlbGV2YW50
IGZvciBob3N0IG1vZGUgYW5kIG1haW5seQ0KPiA+IGZvciBlbGVjdHJpY2FsIGNvbXBsaWFuY2Uu
IFVzdWFsbHkgYnkgZGVmYXVsdCwgdGhlIENvcmVDb25zdWx0YW50DQo+ID4gc2V0dGluZyBzaG91
bGQgaGF2ZSB0aGlzIHNldCBjb3JyZWN0bHkuIFNvIG5vdCBleHBsaWNpdGx5IHNldHRpbmcgaXQN
Cj4gPiBzaG91bGQgYmUgZnVuY3Rpb25hbGx5IGZpbmUgKElJUkMpLg0KPiA+IA0KPiA+IFRoYXQg
c2FpZCwgdGhpcyBpcyBzZXBhcmF0ZSBmcm9tIHRoZSBHVVNCMlBIWUNGRy5QSFlJRiwgd2hpY2gg
dGhlIGNvcmUNCj4gPiB1c2VzIGR3Yy0+aHNwaHlfbW9kZSB0byBpbmRpY2F0ZSB3aGV0aGVyIHRo
ZSBVVE1JIGludGVyZmFjZSBpcyA4LWJpdCBvcg0KPiA+IDE2LWJpdC4NCj4gPiANCj4gDQo+IFdo
eSBvbmx5IHJvY2tjaGlwIHVzZXMgdGhpcyAicGh5X3R5cGUiIHByb3BlcnR5LCB3aHkgb3RoZXIg
U29DIHZlbmRvcnMNCj4gbm8gdGhpcyByZXF1aXJlbWVudCBmb3IgVVRNSSB3aWR0aCBzZXR0aW5n
PyANCj4gDQoNCk5vdCBqdXN0IHJvY2tjaGlwLCBzb21lIHRlZ3JhIGFuZCBoaWtleSBhbHNvIHVz
ZSBpdC4gU29tZSBvbGQgcWNvbSBkdHMNCmZpbGVzIGFsc28gaGF2ZSBpdCBmb3IgdWxwaS4NCg0K
SXQgaXMgdHlwaWNhbGx5IHNldCB3aGVuIHRoZSBjb3JlQ29uc3VsdGFudCBkZWZhdWx0IGRpZmZl
cnMgZnJvbSB3aGF0DQp0aGUgcGxhdGZvcm0gbmVlZHMsIHNvIHRoZSBkcml2ZXIgY2FuIG92ZXJy
aWRlIGl0IHdpdGggdGhlIGNvcnJlY3QNCnNldHRpbmcuDQoNCk15IHBvaW50IGlzIHRoYXQgY2hh
bmdpbmcgInBoeV90eXBlIiBkZWZpbml0aW9uIGlzIG1vcmUgaW52b2x2ZWQgdGhhbiBpdA0KbG9v
a3MuIEknbSBvcGVuIHRvIGFsdGVybmF0aXZlcy4NCg0KVGhhbmtzLA0KVGhpbmg=
