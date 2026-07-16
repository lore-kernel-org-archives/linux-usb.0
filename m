Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED51F936;
	Thu, 16 Jul 2026 00:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160613; cv=fail; b=oHNSk0d5O7PK8DI+z3rxWTPkqCbSMyCCWSE0pTShItw68I5Q/9VnhKCZxO7/lMjnnaBvhUgR9vH047k00sd9qABgPOUQupW6n1Fem/VFUwq1X/BnWigR39zz3KkduUCtjfoXflPz5k4buVzZpEtEPon+357OgGeP1sqB+30NDH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160613; c=relaxed/simple;
	bh=Hx9X9oAXUfhGBOal+2u07u6Gip3pIxZN9lSYIzung/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fCQl89BnyetJCXa1b1/5Qh8n4DtxBDkf17mFlbeD/6our59US84K55XiCxJPCTnqRqpxT2VuCmLeD2GUY5B+X9p1EHDl0wAoOmMxLdmf7BKSiv7GIu/a2jA/pvYUk34z4K5ecxgi3fGjkMdNCEy51DQTxPZ2cSRwexzUMU+R71M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ra9R6qo8; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MH+cXL7h; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y3aC/1Ub reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ra9R6qo8";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MH+cXL7h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y3aC/1Ub"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FKQ8YR3154064;
	Wed, 15 Jul 2026 17:09:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Hx9X9oAXUfhGBOal+2u07u6Gip3pIxZN9lSYIzung/Q=; b=
	Ra9R6qo8GtHyW0eRpcq1DMSPGlSw+9he6BrdwVNG1d6+dqYKGyHWbJ05EGagrdtv
	a9g9ChpoxqPHw265tjbgrkAHKnBYLkYx3vde20nICEXRBWt660dzCPmJxuISMjRH
	XCerJCKhBqx5xlkj/HSx+nfBZMsyI+J4+n9h8NkU9e+XKL/SXl+zm+Y4IDvFL/2d
	nm0yGcKiGIFbGNoQMIkjQOQmJDzrYycc2H1+lFLkTv067KMmXEZlVV4Qn5BWEzfJ
	WTIe6Sox8qt0VLwU1XM9wUMm56Q1pmBzTLDH6ouiE6DJj25Yi+moj69hpZn4SFk0
	wRd9s/Znef5ftidxQnS7VQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4feddmbrq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 17:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784160593; bh=Hx9X9oAXUfhGBOal+2u07u6Gip3pIxZN9lSYIzung/Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MH+cXL7hTv3KaSh4Mbv/hB4lpAtaI0KlmkKLi7mrqdIlv5Ck2lUqKUiDXEzFBwAhu
	 kCCOlEt5uwwJRhcddO2NS1VW4UXlNpuwH3AaUfCZ5XzDrinXIbMGLVp0ZnvD+TSjo0
	 OfVtsYUSP1IG8hfEL/jtbvuo9VxMX1s9zTHdRQLaXGi/91rRgG/BK0H2dFuwpBuTjX
	 zMGxU6GLnaEx+1UAzB0NznWOTdk7mOa+gQMyexwsQ0nOQyrhjhov3lV91WrYalYBDE
	 8umr/7Q9gibcuYCad5q1IwDY0aYVR+XqzHwaudw0XzNNHt6Qn0tMN2Wml1Bd3WkwH2
	 cjlWUPT+xknWg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E434C4035B;
	Thu, 16 Jul 2026 00:09:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5F8FAA0068;
	Thu, 16 Jul 2026 00:09:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Y3aC/1Ub;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EF64E40119;
	Thu, 16 Jul 2026 00:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w739lOQOIgcloSILWG7jJLQpAMUxRooYtQMvcfG76VscO4ajE8TKu0KA/BTt2nLa5c9vPeuLDsfqlJ1NZDQLirFfD0GBhxwbUPweuILPHXI316PXNmqDFVjQIvO+/c/vLhItetjqaNfKxPsG16Khnv5E7s/rFab+50Vz8njhXuH6AmZlWPRgwzJqp+jVmULWpjdbX27cEacnfb6zgYaGtMo0/AblvyJcro56SXCW/5Q38LIknQwqb8LhvRylDyKZo6r7kMrs2ziN5QLyiY929VVoWcbxVmQBKE6rFQWMvbYwdd6yban9QAl35T6UyQiURx56KGMT2ahDGvGnhYrRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx9X9oAXUfhGBOal+2u07u6Gip3pIxZN9lSYIzung/Q=;
 b=GxrrSdcGOxkccI8HRqugd/Fuze9zTaCVAOp1VjqTXPKJGUtonlaKKqFDNk9gxprXTZON5m868XkX1tL9yECw0GNtUujyGTuRVcj1HKDzXjIkO7aAT8Y3BOxSs7KYwyup+yK0vhOyE4xjikCF3OyzKHYA97TCIgf5X9MPHtehOhoYX8c5/5CpxMWxogiSGsNUV3w53iOa8uN0aVfB2tn7eprNGUrl9hZwyis0N36NZPLaBzD734lkmBJ/BaSrJqcRrVxjkUZQO7Rq4fhZ4cULp+C3DXaRB/CtggujskdT0iKqJ3BX7TnvonUTGkMTKXKTYBP4ZvD/ndjThFxiUC8WJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx9X9oAXUfhGBOal+2u07u6Gip3pIxZN9lSYIzung/Q=;
 b=Y3aC/1UbDD864VYzWNODf0cBq0XT7blea2/1mbZktHnLgVv26bJFLMA6kxWQrvEqA9uPhUTUGlrkRJN0GXPryZfMLSIjQKKWTD+I56NCYLdfez7HAS2kRfzsZ3zjWPDp16vmhEjS5kWmFJsxDyKnNKJief3l86YjszIcfpnUw0Y=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 00:09:47 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 00:09:47 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
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
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABHNACAAVgyAA==
Date: Thu, 16 Jul 2026 00:09:47 +0000
Message-ID: <algVe_XD5xpB_w2c@vbox>
References: <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
In-Reply-To: <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM6PR12MB4483:EE_
x-ms-office365-filtering-correlation-id: 4c07417a-73b3-441f-081e-08dee2ce8be9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 1GkLL++hd4VZPx50YFVOjQrfeLqdqUp2aFbEKXDb2MP7KSveeBAApWUi96/c2q4L36u+lSHJi9RFy9hkTUu1wFlQSorKP8JeOOjPfsMX2j6eyguiWlwEdzbvJAVcBDgjS4oNs9WHJUwiB2yYMF9oSZ2KhcoUyKbwDUtfCwkFmSr5lzZA9RzRMPLnqY/o2PUvBPeXWkdZ9lZOEi//of3iP5Iu+fMJbFz2BI09fLxp3raB4oHmnCx2YlA7DiWWVndDVWdben9BPuXD1jgF6NgqeICdHfSUMByNJnHJyUwLFeTVeVTLDlc921TNp7Sz/hP7jhBnhayMt8QeCSqz1QUhWzouUvZwqIbTusAHmcDV0okT9S2vZ7TcHNnDNg6Rk6HH4D5CxYCzg9pEuOJzXASRFLova0PQcuawvn7WQ9M1L7MxPKJDQMazl+nYZtRNeiE/fTqkXHvyloIYis3FCwgraGzyhLLNwUFDvVwvtB+zf0jJZfiBmW7r99cYNFUuw6uhnenkWTpPgqdaSsmvmHxasUR22UGnN4bjGG1XlS3Qf3fxBKPYdDxzoWbpgooquNUQasZ1ADGRFD34KhIApJ8kWClgRImrIwGqbloJN7/7bQQfUCTk9GI923L+FcFPKvAyNp2GOtURGZ7CfFc8v0jl73ZV5A1rkQ4UAFUORfkA3FadXmr+GT8qb7SM6CAfVhm4n31eW+EeNjhSfm0WFfQB5xk/op9GM56pvbaQeLqe4ts=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTlQa25scnhkckZoZG5TTzJhQnpsUXkzb1pER1paVUh2Z1FqNllGbUFMbkty?=
 =?utf-8?B?YXBZVDBrVCtwK3N1QjNlR1FDcjhOY0hCeTVkRTlVMDlWbUIzenRvV09peXVK?=
 =?utf-8?B?RXU1bVZtMXdVUk9RQWJrVUl1eWk3aVpHSlp1MVkwelA4Q1Jpd1owa0ZSUWMz?=
 =?utf-8?B?OTR3ZEN2NCt5M2lFWkxIbllYazNxWk5ENEFIbm9Fc0R4VlRadmFqSng3U05z?=
 =?utf-8?B?dmJmc2NPaGtRL1ZSRjNBdmREWXlWLzRLaU1ZMUFlbmcvM0lSVXhvSXNORDk1?=
 =?utf-8?B?M1FhT0QvcWtnOFUycWJxRHdWMGdrOGE2QWJyVXRQV082YkZpcnU2M1ZjRXJL?=
 =?utf-8?B?Vk54UjRPYzdJb3hpemowRnBLR0dZRWdJOUxwOUd4U2tscnRwaG5TS0dZN1Na?=
 =?utf-8?B?eTJIVTV5blViTStNRWpHUlZ0bHo1eU95ZTR2UTYveEtGb1M2RDRGRW9hbXp1?=
 =?utf-8?B?YnlRaDRTK2wrTlNQNWZVRWdQdnpaaExZTThQUUVkK04vc3FDdHV1ZHE3eDRX?=
 =?utf-8?B?bDlBZFkrRzRSRW9xdGcwVmlUVGZIaHZDVk9Hd0V4WmdEbEtCZzJDZk9KZG5R?=
 =?utf-8?B?RUJsZjhCYjJoVGFtQ1lYdEdrcjZPZ0dMNUFHMkQwMUlMQndVeXIveEVYQ3dm?=
 =?utf-8?B?L2Q3OExQMUpZUnJaQ3NCWVVjemlraFBEMFVQQVhGQUNoeEsyZTYrMXduKy9i?=
 =?utf-8?B?R2ZUM0IvSmZYcHRYSjg2bnNuZkc4UDA1NjFON0FacFJvOXoyajQ4cGhBVG1O?=
 =?utf-8?B?N0lsaVAycUVEbm9UdzdkQ1IwNXU5S0dWSXVUREIxTHlKdHYyTkR0STlnRFNx?=
 =?utf-8?B?ZzFhN2VaeHhxUCszek8vMTBhRG1pSVljRm40dU1yRkh3NlI2MWV1MnNyOUE0?=
 =?utf-8?B?L3NyZXNHMEY0T2NQQURsS2REZGc2SG5nbGY0a0dsZmUxTzZzMzZrQStJby8x?=
 =?utf-8?B?dmc3R2hkY0lqRVkrcUhTNHQyYWNrZFY0UEJYQkZBU2F5aGt6aVNYeUQ3TmVP?=
 =?utf-8?B?R1FtcHgxdlNSYzFQTWVPTEkxbklBQUM5d2xLUURvSXo5RlMyUnhsek1nNUlz?=
 =?utf-8?B?MURPS3U5TjdYcE1wK1I4dXZNUGlrUDMxVURLcU5wOGhXNW11cnhqaEhWL09W?=
 =?utf-8?B?ei84OXM5MEY2Ui9tRjNKZEZhUytxRU02THk1YVdvRWZkOTRZYjByNHFlSUVR?=
 =?utf-8?B?Q2xDbHcrdVlQSk9JZlZsN05YdUp3amNkQ2N1WkhNbW5mN2UzdVhjOGZtQWZQ?=
 =?utf-8?B?cE9Dclh4TjJjclkwR1B1TUVtNThsaEtTOXhVSm8wQ0cxQTVFZFZNaTdBV2RM?=
 =?utf-8?B?RGpVUDU1SHhYS3U1KysvU2hQQkNET2daVExpVTczV01ZeUVkbTBkN2VZdlgw?=
 =?utf-8?B?T3hRQy90LzZBc0U4dFhpUzVjRUxoVG5pSjJvTTg5Vkl6TmUxSDZHOFRpSE5a?=
 =?utf-8?B?dUFjemk0VFkrTkVxb2hsdXg0bEs5WWhuRGM4VzMvNVBiaDkydjZDaENScnBC?=
 =?utf-8?B?anN1N21Gd3hKR1c0YnVxRkgzNU1Kd3dGSU92VEJJV0xONldYTzB0R0JpbnV2?=
 =?utf-8?B?b3prR2luSVEvRklvTmUzNk9iVjNtdWJ1UVA2cE5RR0lsSEVRbElaZ2tWWkJ3?=
 =?utf-8?B?ZmN4MnlTTGthMFZZWUROQ1dkNEdJMmxNSjRtU0JDdWFMeFV0aHFEbnhLVDl2?=
 =?utf-8?B?dmZ3eTVtZVhBR0NNYjNNUXRXME1uL2RTQlg2WkxJRktNZFhlSUhTcERDdWp4?=
 =?utf-8?B?QTBwNkpiUTVxV2lzUSt3MkFWZUgwSTFBa2lNSjZlUGt2eU9peU9ndVkyWElB?=
 =?utf-8?B?VVNjREE4cnlnVUtESERQdVFJT2drV1FlbXRTRXJRT0Fya2hUM3dPdzFtNWE0?=
 =?utf-8?B?QVhQa2oyZjY0TEhRbERNaHJranRQamZQbW4vMWl1YkZEN1Rkbk95OUxoUHFJ?=
 =?utf-8?B?TmRham45RXBNRWlzVHJNSml3ZjhBVFMvQ3hjMmc2ZUM2bnVOSVFjQXZ0Rldo?=
 =?utf-8?B?elJCc2ptWjB6cVNmZXIrNnIvMlNOZzlKQ2pCMDVQSWxrUTU3Zm9QWjJxaHNo?=
 =?utf-8?B?V3RjTzlYSW4xSHMzRS84TmdXQXVNTmdkOEoxeERrZVZQUVg4QlJXK2ErV3NN?=
 =?utf-8?B?eitER3c1SU9qU2FSZ2ZoSDdrblN5WklROWhZY0xFMGN1cDJQbDVqcEhlOHpB?=
 =?utf-8?B?TVFDTndQeFlEa080Q2JDVWg3dVVMdkZGOVZGQVpPNUVZUCtoMlQ4MUJNaFZR?=
 =?utf-8?B?MlVKam9panZkSlM2SG9IbFc3b01sVWFlakNwMmRrZ2Q0aEVkbGNyTjh0VVJw?=
 =?utf-8?B?cDAwZCtGcXkyQ2lNWlhCa3dsZXpFcTF1SytENE5UYVRmd0w4RVVOQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <337286172950CE469135A3DD281B92B6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	dRuwL/BuQg44+nakRyyoMNemc6ZGqLwNXJ6qSlLjUXZa6pBCClEdJSqqf199q1lRk5vgf4KeOseJfJaWFyZqhEIocYeHKNt3o167+i/7/r7yMNGhtaBnuHJOlqzb8qP7+dk6VovT+3vEysdUI1vtkZJDD/J8NhLA7UMCYPNweWPGGGDNAUdDJvFpO+3K7OCGs8HgAol2jRLo287SMLstcFMzMCejmO0BgGOoVh6qV3anTnXSZ1/7tO7OaNCke1QHqujDkDvbgY7xjgLRcYW7qwJMwhhhp6YpzV4Hw5O2NCrPjSXL8iGtt6hrLJcA2RjihtAuuLm+TlQxB25frIQdZA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Aw0RCTZa1GbmUNghGD2PIuFGgoN74p0vwdeO3x50/caD+qhX6FYLQ0tbI0A3jziVIgBDz9/JMMPYCvBAOWBCBDr+X7/gstTVFWpbTNxI5QNm9nqkSZtgWy4uRMBYn6OgL0hNXTTIEnIwrj9pSmRCR4TdyVXYnLjOuxqvYtM5h0trbnlYsp4JspgbYyOmsmcX4hLGGDp3duQ+AxaQ3VcWwfffwEVQmXQjjThKG7XhB51dmfsgh84WZNfOUur3BfMsQVa5Ey3gXZu7CHKTTAT/5G/7iJ8850JoBoxI0GX2qN9TpKDFkpNHY4SSA0WGbNF+4nICxzaxj3W7Esh2aonOQ4uGHuvWQoQqatQfzZbJfPHsho8PDM2Y2YVe+dNderyfFDEodNC0oPWP/lUtDO1aFKD4crdSXWazQMv8v6CbtrZlDxBOKM0hO5E6R+oSwtKg+yvn8Y4q6MxKt6TZnt+wCjRF5INnV1D6RTINN7pbQbWDUhP0hOm+FclzZsLGUUpM/bndOPdMK73ncWG9qURUDJt234+JlHw58FORZO2QcO7yzZS20pOuYm27FNFRzOH9A4RxuZERsnvYqKdImoqIcmYgEe2qmSsagfpBpK5/ZpOH23j4WP3FFx+nKtVdHtPlFPI252NS4tDO8fVsDo6H9w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c07417a-73b3-441f-081e-08dee2ce8be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 00:09:47.1218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WDeAGQl/1WbhshijUW/Ek5hCICck1F1jNMCC1rQLC0bUNgSkKWGF2R+erniSfs7wylhgjt4x3PIfmE81h4bZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAwMCBTYWx0ZWRfX0YFOGtH7XPCI
 rL0exdwNk8pjgH2L8f27qOevjEVhHieXzBD4EWNWjYiYfjcbPPWOt86bh5dTzuBMcrb2GbxMCon
 W74R+oAwIdtyd8c4BuiSAwGAEWaGkpB69bFfEyenThsc/I84fpcXL/kpIpgjcz+p6E9PUEzS1EM
 990YODCKnciqoFq4W5gJcv8WWnNK9hSAIzmbsNfANk8VzCLhWDvZAiLMJ655Jv80Fndr1JDhTbQ
 Nj2Q4X4362FLL/357tf0uVxnNSoeI12xC4DFLRtrfUhiiXj+GeU8Uxg3GQP8f/nZzVbra21w3p0
 b7VPMgbZUbHAwnjXSxdAE0hHvDu5X+syQeTl9W0dsrlB9NY/FPAG6EwljdScEVOzxbqXlKfSPmm
 3WMOPwU25sM/l0zH/Tc89wxMEv+TsoGJyIsFNPwGty0y14UquZUJjCV2AGEoL+q2DRVD0NDswht
 Y5M8nDuIDbW5HL7oqng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAwMCBTYWx0ZWRfXxmQ3ArqVzuQN
 +Akq4Czimz4wCpywwlknk3QrfB1W7b5EqcUrWzN4s55lJN6b/s/tmue4IJ5B+kjgA+weQPiBUzZ
 o8oAVFJrFU6mQjp+8JqtA9LQNbfATsw=
X-Authority-Analysis: v=2.4 cv=Ir8utr/g c=1 sm=1 tr=0 ts=6a582151 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=MVhNXCNigzl8e71xA8sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kgKJt7oe6ncOnilOvs1VNDVlDkycECaM
X-Proofpoint-ORIG-GUID: kgKJt7oe6ncOnilOvs1VNDVlDkycECaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607160000

T24gVHVlLCBKdWwgMTQsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTE0IDIz
OjIzOjAxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gTW9uLCBKdWwgMTMsIDIwMjYsIFBl
dGVyIENoZW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IFllcywgZVVTQjIgaXMgYmFzZWQgb24gVVRN
SSBQYXJhbGxlbCBtb2RlLCBidXQgaXQgaGFzIGRlZGljYXRlZA0KPiA+ID4gUGh5c2ljYWwgTGF5
ZXIgU3VwcGxlbWVudCBbMV0sIGVnIGF0IENIMi40LCBpdCBsaXN0cyBlVVNCMiBQSFkNCj4gPiA+
IEZlYXR1cmVzLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gVG8gZ28gdGhpcyByb3V0ZSBwcm9w
ZXJseSwgd2UnZCBuZWVkIHRvIGludHJvZHVjZSBhIG5ldyBwaHkgdHlwZQ0KPiA+ID4gPiBhdHRy
aWJ1dGUgaW4gdGhlIHBoeSBmcmFtZXdvcmssIHdoaWNoIHdpbGwgYmUgYSBiaWdnZXIgY2hhbmdl
IHRoYXQgbWF5DQo+ID4gPiA+IGltcGFjdCBtb3JlIHRoYW4gdGhpcyBkcml2ZXIuDQo+ID4gPiA+
IA0KPiA+ID4gDQo+ID4gPiBJdCBpcyBub3QgYXQgZ2VuZXJpYyBQSFkgZnJhbWV3b3JrLCBpdCBp
cyBqdXN0IGZvciBVU0IgUEhZIGRlZGljYXRlZC4NCj4gPiA+IA0KPiA+ID4gSSBkbyBub3Qgc2Vl
IGJpZyBjaGFuZ2VzLCBpdCBvbmx5IG5lZWRzIHRvIGNoYW5nZSBhYm92ZSBmaWxlcyBhbmQgcmVs
YXRlZA0KPiA+ID4gZHQtYmluZGluZyBmaWxlcywgYW5kIG90aGVyIHVzZXJzIG1heSBsZXZlcmFn
ZSBpdCBpZiB0aGUgY29udHJvbGxlcg0KPiA+ID4gaGFzIHNwZWNpYWwgc2VxdWVuY2Ugb3Igc2V0
dGluZ3MgZm9yIGVVU0IyLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIHVzYnBoeV9tb2RlcyBkZXNj
cmliZXMgdGhlIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBjb250cm9sbGVyIGFuZCB0aGUNCj4gPiBw
aHkuIGV1c2IyIHN0aWxsIHVzZXMgdXRtaSwgc28gYWRkaW5nIGV1c2IyIHRoZXJlIGlzIHNlbWF0
aWNhbGx5DQo+ID4gaW5jb3JyZWN0LiBJZiB3ZSBpbnRyb2R1Y2UgdGhlIGV1c2IyIG1vZGUgdGhl
cmUsIHdlJ2QgaGF2ZSB0byBhdWRpdCBkd2MzDQo+ID4gYW5kIGV2ZXJ5IG90aGVyIGRyaXZlciB0
aGF0IHVzZXMgdXNicGh5X21vZGVzIHRvIGhhbmRsZSB0aGUgbmV3IG1vZGUNCj4gPiBjb3JyZWN0
bHkuDQo+ID4gDQo+ID4gVGhhdCBzYWlkLCBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIGFkZGluZyBh
IG5ldyBwaHkgdHlwZSBmb3IgZXVzYjIuIEkNCj4gPiBqdXN0IHdhbnQgdG8gbm90ZSBpdCBpcyBh
IGJpZ2dlciBjaGFuZ2UgcmVsYXRpdmUgdG8gYWRkaW5nIGEgYm9vbGVhbg0KPiA+IHByb3BlcnR5
IHRvIHRoZSBEVCBiaW5kaW5nLg0KPiA+IA0KPiANCj4gSGkgVGhpbmgsDQo+IA0KPiBPbmx5IHRo
ZSBuZXcgdXNlciBmb3IgYWRkaW5nIHBoeV90eXBlPSJldXNiMiIgYXQgZHRzIG5lZWRzIHRvIGNo
ZWNrIHRoZQ0KPiBjb250cm9sbGVyIGxvZ2ljLCBhbmQgdGhpcyBpcyB3aGF0IHRoZSB1c2VyIG5l
ZWRzIHRvIGRvIHRoYXQgY2hlY2sgdGhlDQo+IG5ldyBhZGRlZCBkZXZpY2UgdHJlZSBwcm9wZXJ0
eSBsb2dpYyBhdCB0aGUgZHJpdmVyLg0KDQpUbyBjbGFyaWZ5LCBhcmUgeW91IHN1Z2dlc3Rpbmcg
dG8gaW50cm9kdWNlIGEgbmV3IHBoeV90eXBlIHByb3BlcnR5IHRvDQppbmRpY2F0ZSBwaHkgdHlw
ZT8gSWYgc28sIHRoYXQgc291bmRzIHNpbWlsYXIgdG8gcWNvbSxoYXMtZXVzYjItcGh5IGJ1dA0K
bW9yZSBnZW5lcmljLiBBbHNvLCB3aGVyZSBkbyB5b3UgcGxhbiB0byBkZWZpbmUgaXQgKGR3YzMg
b3IgcGh5IG5vZGUpPw0KDQo+IA0KPiBTbywgaXQgd2lsbCBub3QgYWZmZWN0IGN1cnJlbnQgdXNl
ciBmb3IgcGh5X3R5cGUsIGFuZCBJIGNoZWNrZWQgdGhlIGR3YzMNCj4gY29yZSwgaXQgZG9lcyBu
b3QgbmVlZCB0byBjaGFuZ2UgY29kZSBmb3IgbmV3IHBoeSB0eXBlLg0KPiANCj4gQ3VycmVudGx5
LCBpdCBpcyBvbmx5IGJlbmVmaXQgZm9yIHFjb20gcGxhdGZvcm0sIGJ1dCBldXNiMiAodWVzYjJ2
MiBsYXRlcikNCj4gaXMgdGhlIGNvbW1vbiBVU0IyIG1vZGUsIG90aGVyIHVzZXJzIG1heSBsZXZl
cmFnZSBmb3IgdGhpcyBuZXcgcGh5IHR5cGUuDQo+IA0KDQpJZiB5b3UgbWVhbiBkZWZpbmluZyBh
IG5ldyBQSFlfVFlQRV9FVVNCMiBjb25zdGFudCBpbg0KaW5jbHVkZS9kdC1iaW5kaW5ncy9waHkv
cGh5LmgsIHRoZSBnbHVlIGRyaXZlciBuZWVkcyB0byBwYXJzZSB0aGUNCnBoYW5kbGUgYXJncywg
YW5kIHRoZSBldXNiMiBiaW5kaW5ncyB3b3VsZCBhbHNvIG5lZWQgdG8gY2hhbmdlIHRoZQ0KbnVt
YmVyIG9mICNwaHktY2VsbHMuIFRoYXQncyBhIGJpZ2dlciBjaGFuZ2UuDQoNClRoYW5rcywNClRo
aW5o
