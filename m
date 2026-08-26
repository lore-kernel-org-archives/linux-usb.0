Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F920E6E2;
	Wed, 26 Aug 2026 00:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787705126; cv=fail; b=IN0na96qdDV3nyiUtCbT8eWM8rMDRcL3Vh3y8pFZEaGDuEYR8B/yPN1ApC4dRzWq2BJihJD36F4cYFSUDAC0fndJZyTB5VbQczlWkOqMCfztVnEKkv8KkODdKLG/H8wua0gGSGrxpJ9riW7dF5qW7sjhvh4V2ymoPg5CwGAol7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787705126; c=relaxed/simple;
	bh=gEXDhU3UlJzxOXT0NznL4mlQeg9wx4qP9DSVZ8ISPc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cuv1MLjGYyglzJZKIea0F9l3DSDG3xpb7CjXoD2CRA1zkZ/bBv/SB1Xce+vmst9dOUR6QwdK2GfuUYAkiUpo4sPqF0uCyoZOQjx2iMsQKUYh6nS/6IH0HxzWULcYjY6Mc+zumZfmrQ3814Av6I+5f/MS9ovAb3xMBlAWeHvWE0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AzdCZL+n; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Pl/V+67A; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GT+6BBnp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AzdCZL+n";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Pl/V+67A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GT+6BBnp"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09Ulx1005087;
	Tue, 25 Aug 2026 17:44:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gEXDhU3UlJzxOXT0NznL4mlQeg9wx4qP9DSVZ8ISPc8=; b=
	AzdCZL+nUrrjWOb9lIaWIKFohDHRMIef7EkhkZ/FKg8/otnhSIfXTu4xDwz5Htk9
	Dd+d5G7MFl/qqUpL5SglP5HZYt2dWeqe6WZouenCeptzm9F7/+mEdenviGsYjyMv
	IZXYatMfyG8mhsnsWt4+/Xr+sBGIMsVf8b16GRrC0m0F7w+fZEgKo85qMpTXlEIx
	uToaemLx4dTcMn81ov3laOV0PluvRtpZGHuE26T86Q9+Yl7ElJ8rYZ5khH84Bcm9
	9OrpImIRxplf3PeTQC8zPsgTyTve30+BE1obVsk3VQz/e1be7lI4+e4u6elEYZYv
	Y17kWNZMrMUPTaRRqt0iww==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9j5m9f6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787705084; bh=gEXDhU3UlJzxOXT0NznL4mlQeg9wx4qP9DSVZ8ISPc8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Pl/V+67A5/oeuW8kMWp5DWpu3iHotny5T9IMfDpfBDkLi3/HpPxqnrpizC52v3UKK
	 WOJED1wlSEdncCh8bql26RlQXTFEu7em53RnQPbMc5HEZ8AFxGJLDsl+aUV6y7G8wo
	 q88S7mZIBw77qa9lQZLTTn+A9+rMQRdQFtx+8KKbYxLnyDoWhq6ybwedZHZ1cLxV6s
	 EIwRgJJcW07gq2Y1xsNAsbZE0pln3yYSbK2MOb+7XWhDooU+iklBHnZlVbygQpK8h9
	 1Ot3R9IFOl1jHauu9TNaeJWPbyroRSNcE+zkZClr5p2KBE9iKgKGQ1Sb1lOBQclJeZ
	 UbLSOvPLcSTiA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC04240124;
	Wed, 26 Aug 2026 00:44:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EBEE0A00B0;
	Wed, 26 Aug 2026 00:44:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GT+6BBnp;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00100.outbound.protection.outlook.com [40.93.14.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0A1B404B0;
	Wed, 26 Aug 2026 00:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx/YZ6gnT2ixqtTMnwWqJTNotvIhyStpC+wQtmpJwF4jtAOspISxzaOsrMYXCWhaBuZsrdsHuovicFY8hpqz2XaXGKWTZe4UcRsn+UKdXEZzo2UelcDk6rw1MrOck1srIrdlBq8COEpmVOHy9ikCuf7CJnJbC7xowiS/Fu4U6py1FceldeCxgBw8iOJAGHUEanNQ8Xs5yuMkGj0vjvcKdrbHq5cbtCXucRoK0pUhDMautzyRNnsxfTsnzVYR9EjW7KVczn+Td+P9Bmvj7Lk0ef7KQjLj1RYHQ2+VKeirS6NStSShYeRhhRK90AeiMI6yy24/iKrieTUxAYnLMg3huA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEXDhU3UlJzxOXT0NznL4mlQeg9wx4qP9DSVZ8ISPc8=;
 b=hrKQXZG/asbJjVW3xWrdpnovWtd9VstjBmwpfc2kRe8JU+WRsmjldcGl9iFzylkBziY6V/q02hePhggRy0EpA8HdGXf9DZqQzWAPyJiTzMUhFSeOdcxsVShlk0iLz1z1YNmwDuVyGbPhhXMhpmOUGaDD38qu/gTfxcy/vTizTm9uPnwwqTGZ7ETbbdBSqHLdJJbjGEivkbbZsEBP6pr0I19Mxrqf1LApuaPz2Rs5lQKz554qDURFbsYjLFnmZrkTxlCbWlu6VCSB5C8n4I8dyO60pkxKXnCjxh/51u2nD2TXGwURNUQlvE8gd0AVS7J99P565elYPJp0p+SLbzGNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEXDhU3UlJzxOXT0NznL4mlQeg9wx4qP9DSVZ8ISPc8=;
 b=GT+6BBnp51dD5ugGbWMqFUO3LBoST4M2NWMH4GJ+3yrMOGzzdVa+etHWfIRPUxRrsPZewYRxJ3EZMp89mea+d32jBWqcy5C98MA5WqIhS52RLh8G8G0A34K9Fxr3ucyYxH4V8E5TKGEwdTZiQSOEo0r4B/Acq4v+4KyDgJ9qbLA=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 00:44:29 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:44:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marex@nabladev.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
        Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vinod Koul <vkoul@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
Thread-Topic: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
Thread-Index: AQHdKfZcIUlCtGH+wEeMTQVzIWJxBbavlCUA
Date: Wed, 26 Aug 2026 00:44:23 +0000
Message-ID: <ao42hJmXCG9thL9J@vbox>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-7-marex@nabladev.com>
In-Reply-To: <20260812010157.1772849-7-marex@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB6655:EE_
x-ms-office365-filtering-correlation-id: 5c7c8173-5e79-45b5-39ae-08df030b2cbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|18002099003|22082099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 3rn3BfjB6qdwxU/uuzWwNMMucX2+KdxaKtxz2JseLClbSrbEHAmjfmab12DuBnR/8yz41IbqOWOTNDm98DfEvRgDZ2DuYZINJu2rHKBQtmju44dbtyW7JL6W4BGBZFuocpcQdPyguSwp1mJT0xxzPoReTQY7dgqfPDZFYwqLy+2uvF1C4xolcqGeYQ2/MXSBCSqYqe0OtTNr/G0yu3x4/w2twqNZ9bl4ULCBBOYevHj2Qem73uhHDe5MKQ0Wy8Y74BeGNoHAIso1FtnBXqPXdYDC48nMnts2YbFFlpihMN/QcRM+ogTgbvgkOPdqtG3A50H2gvUWmLUv9cXEhRRoC4m7DbdRFtd5h8O62E9at7zW4ssXdsnt66DGzYScXJoKCW2hwzXiJ8tXEO9S/IBJplQgwyDGLK5+A0ErlRsOBAlRQbPQJI/dKwwE4I9rqst6OJ4mIlpZR8ou2ufGwMUab6xM1jkUuFRaT3/0z3hOQNMqZIyac5zWbTjBUSmxwJAIojkGWX3iCa7249mLTBYmYow0ungxMVqF+EdI1TK6xxun1T7tDBvpLDL+nn5TYUqgEzQeP15wlayr19VBEzJAVgWQY1FDHsZ6DW+SGWr44ARM1o47ZR6BNUGdtEYSOoYRwbzQlm1ovIT/JQOgZtH0IB+6BBOAISzeWiEOZsnrxUtvl+T9K1ya2taNfP/kODcJsSPANoFnP+QM60GCBCJsEg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWJ4UVRtakNsYVQrZHVIMzIxOEtzNVd4MXlmQ3EyVlJ5L0pxRVhHQktkL1JV?=
 =?utf-8?B?N1ZPV2hncmROTWlxSG5rTGxlZU1VTGNSbFRkSHFGVnBOeGFVTUViV0FMdmJs?=
 =?utf-8?B?SDVYZmxhWlZLS1BrMlVGemdrOTFpdXNMK3BHSUZZa1JJbHFNZVQ3UEhZc2Ix?=
 =?utf-8?B?RVZBMDF3Nms0dS9HTE1YOEFvZDFvU1MwWDRWMUdnYjE4L3FIZTdxS1lFMGxU?=
 =?utf-8?B?dnQrc0tqa3pUQlE0akUwbWtmcUxlU091bklFeVRnN2tsRndzeXA0b1l6d1pC?=
 =?utf-8?B?a1Nqa0FEa0hBOTczTlQ2WlpmSFZrY1B6ZTFIdzY3MUpYaXIvcHk1NnBCa1Y4?=
 =?utf-8?B?bUQ0QzgvbmI4YVE4OGg1YUE0VGRSVTB0MXdhVFB1UDhDY3dYZUswbm1LRU1L?=
 =?utf-8?B?M0x1ZVlJdVBDb0dCekFTa3BZTU5IclVuMUczMlNFV2VVbEJoV1N0ZnhDVUlZ?=
 =?utf-8?B?QTgyQndvQnhBajI0RThTd3pTMlpYTll6QWlaRTlEeVZsLzljTDREa1h3NDNY?=
 =?utf-8?B?Yy9EU2RIRUpkZ0V2SU5zR2tLeTFINlNyN3dld3RPVXFscjkyS3BhY1BwcENZ?=
 =?utf-8?B?RjRhR0JBS2NWcXpKcEc0czIzTGdhRzV0VEpsdVQxSUdBcHBsMUV6OHVqVE9R?=
 =?utf-8?B?cmRnbDN5WWpraUxJR0JWNDdIVy9IcEFPL2xvaE42d05QY1NUS01JcEF2Y2VI?=
 =?utf-8?B?ckYzYTdvQ25PRXZXcnFHVjhSekR2a0JpMUczYTBiMWJ3KzF0cFlGWUNjeGx4?=
 =?utf-8?B?N05BOHdXUEhKendISG45WjBoZHZhTzI5TGNGY2hydStYY3c4ZnA1ODNHOHYw?=
 =?utf-8?B?ekc2SUtha3NRQ0diYXZ3TVU0SHp0SUgwdmFKWVRvYS93VUh1Q250WmJoTnNN?=
 =?utf-8?B?L2tYL0plVnlYYjdaRFpnMkVSazQ0OHo5R3dLb21OTlhQREQ5Z3pDTHYraGln?=
 =?utf-8?B?ZTFLYjJtZVB1YlozbUYzUkIwdWNnM2djWlRTNldFMGZmd3dqSXJidVc4ZXhi?=
 =?utf-8?B?cXFzK0pLbXB4Z0lMcmE3ZkpxcjFOREloMlF4SlVYc1U0VExReXJkaldRaHl1?=
 =?utf-8?B?QXFwVyt3T09PV3FPa3p4MElzQ1g0RFV3dzk4QmUrQXNCOE16UXNOT2xZaFdJ?=
 =?utf-8?B?R05aVGh3V2RkYlRSODNkTTZ6bnBqc0tPeWxSMUFjenpuRWgxSXdvTTh1S1hn?=
 =?utf-8?B?c3kwS0FyOXZNTVFVL05oZXRSeEt2WE9nR1VNU0lzV3JoWDRVdkE0UjFJc3Ez?=
 =?utf-8?B?OEkyNnU0WmFBdE1ib2VhZlJCTHd0NktXUWJLKzhxdndxZEllbnk2SnlqWUlI?=
 =?utf-8?B?SVlKaFhsby9BNm4vWElndDRpdWpkbnZ5K0Q5UWd4WnpmVXJoVk9EWVQ3VG1w?=
 =?utf-8?B?YWJNOXE0VStKR3o4UGFtcVU1aldEWkdxU3FGaHdqRXAvc2NZaVFNU1F0ZENR?=
 =?utf-8?B?cldDcm1MMzh6VzAvYWx6MjVkTXJLSmdGVTgxWENxcmxmTE9SVXZTQ1B4VzZX?=
 =?utf-8?B?UzNSK2JyQ1AwYjNXTWdGN25KVVhKVTExREpqTGhpUlFpZ2ttOXIwU2ZxV1E0?=
 =?utf-8?B?aXVhRzlSakpEWXhhQmFDQm5JNnVZM3JaRGg2VXEwR3lKeTZ2c0FNd1FCOEtS?=
 =?utf-8?B?S25qSlZLc3VSaDZVUVFqWHFyb3NqZzBCSjROQTlzVTFSODEvMGRuRDY2SWc5?=
 =?utf-8?B?OUMzeGZUd2VnTGY2VDRFSW95T29rR0o1M0JlaVNreWZsdWFKSWFjajJXdSto?=
 =?utf-8?B?aVB4UGsrcnFhY280UW9HVHZVMzljSFdmeEQ1YVM0Z2M3VU5hUGNwbWZHR3l5?=
 =?utf-8?B?ODZjMllXbFh5QTY3cVhNejhEbG1UYTNXeWk2NStRcEdEenJNempwZldPVjNn?=
 =?utf-8?B?QW4zdFhETzlWNHB4ZDhQVlRKcTBMU284YzJhN29nQ0FVdFI4azV5bVBMSDVr?=
 =?utf-8?B?bjN3UFMzT0hDTG1HNzFsemcwMDRmQlNMWFZvTDg5UXlrQjNjMVlVQndWd1Rk?=
 =?utf-8?B?bUJac3dlTWhXRS9lZzNNUGJDdWtmemN3Q1M1QmR6cFExZHBFcU9sMnRNV1E5?=
 =?utf-8?B?d3llc1VjdVROaHNOZG5ONHNPTXZKQ0tNelpqVHNaYkVMRlp1d29tZ3dtZjZO?=
 =?utf-8?B?eExtNTVpS0htMnA3anluRjIydEMxZ3ZYZ2VLdlU1d3NueW83UzRsdm1PbWhL?=
 =?utf-8?B?MkFUOTN4bGl4OFloc1lRRFhuR2M0cFgrbG9xN0FyaWVOODNxcFJzZTU4RHJ1?=
 =?utf-8?B?c2I1RDl3dzlvZkM0bEt2bzZrWE5WaWVObDRSdXFiWEdFd1RaRHArMmQ3R3NN?=
 =?utf-8?B?cEx1UkhDMVg2VVlBVDdEdUV6WDY3clZDYlVacHYzSE0wekNGbENUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <129050A7B33840429CC1655BEFB5904B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XF8gROn7LotPXL88TTQec6bNENnh6IhIJYFGN/p3MhQKhM6MjC7wabBpYjj0vRgLPh1l13/Ft/aUI3RxPKkIBd2B50F+P9rok5J6DfDugpdK/ckFdeqpt+lHpiqJbrBINAbdyyezT8RNX0FRxtFIkKpxRTmdrJb0Plq1Xlurtuie7Kky0zVlb75rcO6oaNnHdgUKo6DekZ863sKrBFaBaC+btFZ8OiH3KCnuhcfZMx16qr9vatCRjwFCpjFXTnZ7F/VYpea0aCgFVjzqcgXa8O9trjoOerFr7wFM+G4hNKD/Q+ipE4k/wv8za8wRNuijzksKxMWcWAqSXZqO9PS29A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XzNaWw0F9WRT6dJk/5KEoVc0q3tek8wbcWmfwEvOJ7NPgeoYTatGnlGPpa4nWRb8hV/VCXYwUWbrydsVMmBNSdCQzbXp32ZMejsAQAOrpL5k215K9micp+UqRzD40OFXec7wi8l42Pqg8uV03WmR0FdeQb9YGQbZMSy8FUrn0+nFufFB9107W01ANu4zaSU0Qv4lIEcyxmjWgpiqJBsC3qsrl5A0IHJ1jPHTYfIC8tQfPJ/Lvs2NBSVdyDnscK707W5rYtRURDO3rtmVTK6E3s5XVIBHjAYn87JcqUwdmS48MLl38UgP2s7h1vCXLl0j/3IzP7EfyFI/H/jZohDavyn3R7oU0wSXCYDfBE67qJKu3bT7HMPW1kHSZuCeDDJ8ZUk26OmeBSH3w6HNHkmjMdpunmW5oSJyTloKwP22BFdtlxZ0QddaJjYspZE8Xz1JEQgyEKSPSDsV8qmHhAxN82iRAM23FVK729Xg9gnGdZaLpHI7r1Dcy1hItvRRJ3/LttGpm6iT4FubEm8tfSY6/pkUfK0TN4pAhNLPr0pQMbdhYGSqntrF0mUumHpEReXjM1eiBcYjVKY/uGUr7+nLKQVdB6PJiTHicGQAGGmqxLsD981Z9gfJVLjdHqb6Bsw8/p9G6OSblqOQaMfxi/54cw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7c8173-5e79-45b5-39ae-08df030b2cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:44:23.9919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emWqxraEw6PN5U38yDeRChM6LsKbP9kLcwlU0My/Cr21inp3E0XzIejj+tXuCaDFVQmQqshh2AGKdm1h8F2T3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
X-Proofpoint-ORIG-GUID: WOq2ebDl5Zl5C5RUHGmaxATfZlaloxiw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAwNCBTYWx0ZWRfX4CiR6hOrXX+Z
 21ohS65mmSv2z3F0zx8dQNEhdfVAhR3NgAVhhJNiwJzdAYHPNDxKyziFhwFA0P5BbSerhJQQSa8
 o1vQwOIp2mTq8Tc3nHDkZgUP7vJJ2pk=
X-Proofpoint-GUID: WOq2ebDl5Zl5C5RUHGmaxATfZlaloxiw
X-Authority-Analysis: v=2.4 cv=BpetB4X5 c=1 sm=1 tr=0 ts=6a8e36fd cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=zk4-lHRcAAAA:8
 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8 a=t83fPVWtahcSqHpI6RgA:9 a=QEXdDO2ut3YA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cvBusfyB2V15izCimMoJ:22 a=7cv85riZL9-k45RWW8P6:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAwNCBTYWx0ZWRfX4i8oEyVQ3sZu
 hq7tIguisRI+p2st059aqDvveqxz95WYsiDaLRLFpE/SqEpdHM4HTRpSwlGgxyIsa24FQvM40J+
 D5HJJq0jhWlZtexeh7ZsYyZdE0jAHXzAipimzYgTEOaBj7otItWPy8em35qn1AEQUtSc6jNneTH
 4ef8eERSZ22lF1DnXQ7LpNJjB+1kt67oWKLVRJjQSfydHANWwApl+shC8E2+xbIndOF/eaHqcqf
 U64YTqT2CW8qcvZvbMI9DCB1kqPjDBvZ0ku427AOQrlJlSe4PezxVupOy3rMRmgBMH9RtnswZUs
 Bbvbc0X5eoREv3xFMWgyWcrj0JcO5VNYubF/AGokJkuQsQFNWoH70Ef+ajttcUSNUgpM13lgsu9
 PUJXPDJwgHf4jytnr8/SBsKBaD4gboCYDnHk6Np/IjXwoSRZT53494+8Z3QwjByFZYeAXSfPaz0
 GW2mVmznft/eGjLNGWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608260004

T24gV2VkLCBBdWcgMTIsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBUaGUgU1QgU1RNMzJN
UDIgU29DIGNvbnRhaW5zIG9uZSBpbnN0YW5jZSBvZiBEV0MzIFVTQiBjb250cm9sbGVyIHdpdGgN
Cj4gZ2x1ZSBsb2dpYyB3cmFwcGVyIGFyb3VuZCBpdCBjb250cm9sbGVkIGJ5IHN5c2Nvbi4gRXh0
ZW5kIHRoZSBnZW5lcmljDQo+IERXQzMgcGxhdGZvcm0gZHJpdmVyIHdpdGggU1QgU1RNMzJNUDIg
Z2x1ZSBsb2dpYyBzcGVjaWZpY3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8
bWFyZXhAbmFibGFkZXYuY29tPg0KPiAtLS0NCj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhh
bmRyZS50b3JndWVAZm9zcy5zdC5jb20+DQo+IENjOiBDaHJpc3RpYW4gQnJ1ZWwgPGNocmlzdGlh
bi5icnVlbEBmb3NzLnN0LmNvbT4NCj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVs
Lm9yZz4NCj4gQ2M6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29t
Pg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IE1h
eGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4NCj4gQ2M6IE5laWwgQXJt
c3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiBDYzogUGFua2FqIERldiA8cGFu
a2FqLmRldkBzdC5jb20+DQo+IENjOiBSYWh1bCBLdW1hciA8cmFodWwua3VtYXIwNUBzdC5jb20+
DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogUm9zZW4gUGVuZXYg
PHJvc2VucEBnbWFpbC5jb20+DQo+IENjOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+DQo+IENjOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPg0KPiBDYzogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmljcy5jb20N
Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gQ2M6
IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3
YzMtZ2VuZXJpYy1wbGF0LmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1n
ZW5lcmljLXBsYXQuYw0KPiBpbmRleCBjYTY5YWMwZWIwN2NlLi4wOTQ2ZWQ2MTY0N2I2IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IEBAIC0yMiw2ICsyMiwxMiBA
QA0KPiAgI2RlZmluZSBFSUM3NzAwX0hTUF9BWElfTFBfWE1fQ1NZU1JFUQlCSVQoMCkNCj4gICNk
ZWZpbmUgRUlDNzcwMF9IU1BfQVhJX0xQX1hTX0NTWVNSRVEJQklUKDE2KQ0KPiAgDQo+ICsjZGVm
aW5lIFNUTTMyTVAyX1VTQjNEUkNSX0hPU1RfUE9SVF9QT1dFUl9DT05UUk9MX1BSRVNFTlQJQklU
KDApDQo+ICsjZGVmaW5lIFNUTTMyTVAyX1VTQjNEUkNSX09WUkNVUl9QT0xBUklUWQkJCUJJVCgx
KQ0KPiArI2RlZmluZSBTVE0zMk1QMl9VU0IzRFJDUl9WQlVTRU5fUE9MQVJJVFkJCQlCSVQoMikN
Cj4gKyNkZWZpbmUgU1RNMzJNUDJfVVNCM0RSQ1JfVVNCMk9OTFlICQkJCUJJVCgzKQ0KPiArI2Rl
ZmluZSBTVE0zMk1QMl9VU0IzRFJDUl9VU0IyT05MWUQJCQkJQklUKDQpDQo+ICsNCj4gIHN0cnVj
dCBkd2MzX2dlbmVyaWMgew0KPiAgCXN0cnVjdCBkZXZpY2UJCSpkZXY7DQo+ICAJc3RydWN0IGR3
YzMJCWR3YzsNCj4gQEAgLTg1LDYgKzkxLDM4IEBAIHN0YXRpYyBpbnQgZHdjM19zcGFjZW1pdF9r
MV9pbml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0K
PiAgDQo+ICtzdGF0aWMgaW50IGR3YzNfc3RtMzJtcDI1X2luaXQoc3RydWN0IGR3YzNfZ2VuZXJp
YyAqZHdjM2cpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gZHdjM2ctPmRldjsNCj4g
Kwlib29sIG92cmN1cl9wb2xhcml0eV9sb3cgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRl
diwgInN0LG92cmN1ci1hY3RpdmUtbG93Iik7DQo+ICsJYm9vbCBwcnRfcHdyX2N0cmwgPSBkZXZp
Y2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgInN0LGVuYWJsZS1wb3J0LXBvd2VyLWNvbnRyb2wi
KTsNCj4gKwlib29sIHVzYjJvbmx5X2NvbmYgPSBkZXZpY2VfcHJvcGVydHlfbWF0Y2hfc3RyaW5n
KGRldiwgInBoeS1uYW1lcyIsICJ1c2IzLXBoeSIpIDwgMDsNCj4gKwlib29sIHZidXNlbl9wb2xh
cml0eV9sb3cgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgInN0LHZidXNlbi1hY3Rp
dmUtbG93Iik7DQo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiArCXUzMiBkcmNyOw0KPiAr
DQo+ICsJcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKGRldi0+
b2Zfbm9kZSwgInN0LHN5c2NmZyIsIDEsICZkcmNyKTsNCj4gKwlpZiAoSVNfRVJSKHJlZ21hcCkp
DQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyZWdtYXApLCAiTm8gc3Qs
c3lzY2ZnIHBoYW5kbGUgc3BlY2lmaWVkXG4iKTsNCj4gKw0KPiArCXJldHVybiByZWdtYXBfdXBk
YXRlX2JpdHMocmVnbWFwLCBkcmNyLA0KPiArCQkJCSAgU1RNMzJNUDJfVVNCM0RSQ1JfSE9TVF9Q
T1JUX1BPV0VSX0NPTlRST0xfUFJFU0VOVCB8DQo+ICsJCQkJICBTVE0zMk1QMl9VU0IzRFJDUl9P
VlJDVVJfUE9MQVJJVFkgfA0KPiArCQkJCSAgU1RNMzJNUDJfVVNCM0RSQ1JfVkJVU0VOX1BPTEFS
SVRZIHwNCj4gKwkJCQkgIFNUTTMyTVAyX1VTQjNEUkNSX1VTQjJPTkxZRCB8DQo+ICsJCQkJICBT
VE0zMk1QMl9VU0IzRFJDUl9VU0IyT05MWUgsDQo+ICsJCQkJICBGSUVMRF9QUkVQKFNUTTMyTVAy
X1VTQjNEUkNSX0hPU1RfUE9SVF9QT1dFUl9DT05UUk9MX1BSRVNFTlQsDQo+ICsJCQkJCSAgICAg
cHJ0X3B3cl9jdHJsKSB8DQo+ICsJCQkJICBGSUVMRF9QUkVQKFNUTTMyTVAyX1VTQjNEUkNSX09W
UkNVUl9QT0xBUklUWSwNCj4gKwkJCQkJICAgICBvdnJjdXJfcG9sYXJpdHlfbG93KSB8DQo+ICsJ
CQkJICBGSUVMRF9QUkVQKFNUTTMyTVAyX1VTQjNEUkNSX1ZCVVNFTl9QT0xBUklUWSwNCj4gKwkJ
CQkJICAgICB2YnVzZW5fcG9sYXJpdHlfbG93KSB8DQo+ICsJCQkJICBGSUVMRF9QUkVQKFNUTTMy
TVAyX1VTQjNEUkNSX1VTQjJPTkxZRCwNCj4gKwkJCQkJICAgICAhIXVzYjJvbmx5X2NvbmYpIHwN
Cj4gKwkJCQkgIEZJRUxEX1BSRVAoU1RNMzJNUDJfVVNCM0RSQ1JfVVNCMk9OTFlILA0KPiArCQkJ
CQkgICAgICEhdXNiMm9ubHlfY29uZikpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGR3YzNf
Z2VuZXJpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCWNv
bnN0IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnICpwbGF0X2NvbmZpZzsNCj4gQEAgLTIzMSwx
MiArMjY5LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyBlaWM3
NzAwX2R3YzMgPSAgew0KPiAgCS5wcm9wZXJ0aWVzID0gRFdDM19ERUZBVUxUX1BST1BFUlRJRVMs
DQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNfZ2VuZXJpY19jb25maWcg
c3RtMzJtcDI1X2R3YzMgPSAgew0KPiArCS5pbml0ID0gZHdjM19zdG0zMm1wMjVfaW5pdCwNCj4g
KwkucHJvcGVydGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTLA0KPiArfTsNCj4gKw0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19nZW5lcmljX29mX21hdGNoW10g
PSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1kd2MzIiwgJnNwYWNlbWl0X2sx
X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtZHdjMyIsIH0sDQo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIiwgJmZzbF9sczEwMjhfZHdjM30sDQo+
ICAJeyAuY29tcGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLWR3YzMiLCAmZWljNzcwMF9kd2MzfSwN
Cj4gIAl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1kd2MzIiwgfSwNCj4gKwl7IC5j
b21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1kd2MzIiwgJnN0bTMybXAyNV9kd2MzIH0sDQo+ICAJ
eyAvKiBzZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdj
M19nZW5lcmljX29mX21hdGNoKTsNCj4gLS0gDQo+IDIuNTMuMA0KPiANCg0KRGlkIHlvdSBjb21w
aWxlIHRlc3QgZWFjaCBwYXRjaD8gVGhpcyBvbmUgZmFpbHMgdG8gaW5jbHVkZSBiaXRmaWVsZC5o
DQpmb3IgRklFTERfUFJFUCgpLg0KDQpCUiwNClRoaW5o
