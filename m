Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6E20E702;
	Tue,  4 Aug 2026 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882552; cv=fail; b=PqZ6unDihAEtmll/k9K8zDEw0yF9Gm2FFzH7zzDPsMo2+nQsUP74OOYxbcsfb2UTtpwUc5G65q/vcjB4BOEb1tVatX0RP13YOxt/4sDEqKRCJwuTpUWL5ei8Xybn8SENpHn4+tQAUjQ8DM7xVg8sHo8MrGegrI2DscArjy5nhgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882552; c=relaxed/simple;
	bh=QGeQGUFpV9iYh73aIDBAy4OdX/GDk5vZ+We4shTtmc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R2bqxHLztS/tOfZr8PAgsbOhyHC+8122xtpYV4I3KZk/3UxpfSwmxOAO4pxKKkZiiK1nRtvCHFaI30fYg7o1lXqJW5Xtk2idKnQ6lsPiylytXHBPbL17pdWfD7Y4IIBbQGfOCOZBJNiJQRxH6pt2Kv3sIv39+54U0IReW5Ijpk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SnA+8FKD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XXZMhUYA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=N9ukFR4R reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SnA+8FKD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XXZMhUYA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N9ukFR4R"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpXLv1702306;
	Tue, 4 Aug 2026 15:29:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QGeQGUFpV9iYh73aIDBAy4OdX/GDk5vZ+We4shTtmc4=; b=
	SnA+8FKDmL3oYiSA2MdEaTco2WBsOwrTProwYwnF5XWgGYZi1xfCZrt5JAWehzrJ
	jveKShUl3BDCa/dv/uv3/TcbPzzTefeTwZKPrwok3+V9rBQb9YJPQVZlq9oUb5ip
	m/trbUvKCdVgLwcl3E6GdG7Y1LwitXLX9ZSdN4/n2gGxsB+f/oN2ZnlIsvsS4xit
	95qnqoBGvKxSRI+LoY/2uajNu7ATgZ9cz96AtRj0uQ1/sAlfJc0s6Lqj52wRtO5a
	zOf3XXR5IknwUr+b4zHqa55RCnCa3suZjbK3cnc9loT2GVLt/zSgZraEJHqb5Bl4
	z2UrsEcExN+yY0y76kH7YQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fug0k5bg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 15:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785882539; bh=QGeQGUFpV9iYh73aIDBAy4OdX/GDk5vZ+We4shTtmc4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XXZMhUYAEVyfIS0IEN4OCglU1oq1hF1JxRK4ZS3w+OdHd8C0gQYBACGR7c0Ybg2QF
	 sy9//5wJz0WW/DJVLVv9acNJNnLYtqIscmr1k7psj67BNG/RkJ0uUTDfrQnbYml5tw
	 Muphiz4hrv8aQtVnzRvvaxDh6zmjcG7DNsqecuDGc3Qh8dKQo7/oZAcmPdY7pC3pXZ
	 mvQwKxXnQV9hPrV3EBL4PBENkMXVpKCWNIyFXwBsQdIzIt6DJsXBIJuin0qsOYC7QD
	 XenEd+rTNWVxj3fA4vH37uUiMhAjJMKIGDlDEYzQ2xU0EsoH4QHkW4K9/r53sck4BB
	 DHa9wZ2AHkbiA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A5C804053F;
	Tue,  4 Aug 2026 22:28:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3CEC8A02FF;
	Tue,  4 Aug 2026 22:28:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=N9ukFR4R;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00103.outbound.protection.outlook.com [40.93.20.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2382440139;
	Tue,  4 Aug 2026 22:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBMMj78do2/I+h9Xtv/iUuWJNx3ojsHWRF2MbNdtqQuOK3XuwluU0pdm3iM6LXuDO8PblyjTcxRsgUz9cW65QNUH2ZDtxRumltWfAri4ZT0+kZiAEeJnLIOmj0RU9R1zoX6PTIvhg2JsehsIqNGuT85jS27yGsFjntxzr1NfXNQErjKyHg+9H3Zz2rvWQ6prHqJ0rY2SU/0rPo3cmGi+2rxetVtkito/hq6ExHwLnzGL1nZVlkZ1CNloVOWiqj7JKGXv4CiU4xrYBsjuIKj8oKmTsIFJDpVCOt0Xt1AiwJO9pgBvTl3EgUQ9j7wPjTvugPZoku5k+zU08KsgvjMhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGeQGUFpV9iYh73aIDBAy4OdX/GDk5vZ+We4shTtmc4=;
 b=Eaybh+8F/AgFXeDQDm2qF3Wecdh/iGKvejlGa6O9LjbC2PS4iNTe5N3FjNrokCazOO37BHFObsSWgYk7/H6QkLjHCwO/Hc/aqMh9tpW6fzJrA8L+ozZVrIXzuJDjm4EG8NiIldnGc5PtmGPyrhQ7161oOj0BTw0KGWYypBfrXFeVII44qKwERnxywme9rPTLZDPhenHIyHZCiIHEAXUZiZ8vEK36bpLQs4qmX/YjJel5Ztn6y6tIXfVKCEHOcB0/t7lgNg+8L5s1tHjIahx+2MbGmRGxvo7ImWCr4eR3DiZNjj8DXWSlmjByHlHY3Y0IFRjeMzRS5fRkYJ+Grocm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGeQGUFpV9iYh73aIDBAy4OdX/GDk5vZ+We4shTtmc4=;
 b=N9ukFR4RmCoBNEiC9+NchqKTWODbTA3X8BsseRV2gcbTsG7XW+Rm0Umz3WUmsWXc811MiihH1DpIkXvaqLWOVmK9l/acFtBkDumDVsMTxMxVBLltiEU0tJHB6vlaauTIzz3WqfRWNajJF5KHw8aR9/n0XRy8rjtmq3r9A4ey74Y=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS4PR12MB999077.namprd12.prod.outlook.com (2603:10b6:8:2f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 22:28:53 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 22:28:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Thread-Topic: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Thread-Index: AQHdGo+Q3rD3gTAIK0eH+V7Ef5oF97Z9OAiAgALVq4CADn5uAA==
Date: Tue, 4 Aug 2026 22:28:53 +0000
Message-ID: <anJmrEe9IcV_iaac@vbox>
References:
 <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
 <amPdeL2GWkNhPoal@venus>
 <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
In-Reply-To: <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS4PR12MB999077:EE_
x-ms-office365-filtering-correlation-id: 6fa2a705-f425-43f6-e6af-08def277c3cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|38070700021|11063799006|56012099006|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 YCPoUy7vvJutPcoPquap3tN6ywY1bIfNUMB1MK2px7ECDzwOqczvLOaTf19obhWrWeMJof+5zZoq0kfsNOSX8CarpEtGPSUj4l71voMqUcK2dU1MBIfdBRquGWiF2eMhH+rhRW4KWvAlX7gH9FowTsMlcUppZm4YRe6cxrYND/lmU3wP8am+H7jGNAewGRZXl6WcaiDryLn7FDLfbdjsfk9xd8AaTqCOXt4JKCok/y/Xkk/ibZ9SAZDmnf9L1Gio3Cz/B8OJI3Z0Xg33NrVj6AJmapwgbmxrnKo9oEDzLZHkabI7WUNP6P3e1hHn4UFskgBzjII4r7xujucG+N2IOOFdrItGdVmDLgJl33rUcn5aCaCt17qVkvFWRj6T/dJ0UVwkdhDO+NLGPCy4/XRjHE2hvQopuG7ynTQGmMU96Jo7JUik7Z6HgQEryXcl4zzqV+vpY0CuxvLPWsnPDg/ExKolGp+JHSKlGPKc2fZfsn6bYQyrWHT5KapZ2hl+x1nQTzi9OnR4e67iElWsZM6OPfhYDu/HA2YFgTG31Q2Cy9KQNfcTchlx9FkdMrMbynVBriVQqpBymfdxF8z1Y0dQpUbysZ9tIzTfw/Isws6BWJyFYpDRQid+39dfP5Hs4ITDhnVDyW9DqOTKEDYBo3qO0h6iw1nda2hYfwRs2QGpqW/6sSGhQv502KSBhpFnTdc+Sr/mFvHLt8rEYMlsDBz1kDwC2vjMTzN6DrX8vq+hu+c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(38070700021)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2UycVNqNFphZDRVV0x5K2U2bmVpUTlHNVZmUS82UG0rbGpNQnlidHZaYy80?=
 =?utf-8?B?U1BFaHg5YTBWZ2xRRmU0RnFLaGlwbGROVmVWbXdqWXBjOStpb2E2Q25rczZa?=
 =?utf-8?B?dXVXT2lZUko0MVlRWGxZdlQzWmdFTjRjRGU0cTVoWE95dW9DaFNxRDBHQ1VV?=
 =?utf-8?B?S0pOcno2ZW4rQTZrbDRzNkNDUEE4ZzI0Z2pzSno2dm8wVWJlYXRHMlU5LzRt?=
 =?utf-8?B?d2FjVUQzeXcvV3Iva2JUMU5EdXhkRGIzSWplYzZpOC9zWG9ydTdVdUhSc1gw?=
 =?utf-8?B?RnhJbldPSEkweGIremUxNVpGbTdCeUZBeW1SWHlyU3pvdVIxNmFVUUFCT05k?=
 =?utf-8?B?WEIwbmZVRGNvakdwYmEyOWU1TGh6UW9RRzljaHpqV09kOWp3bncrTGQzR0F6?=
 =?utf-8?B?a2R2WGRQdHVGRDBOLzNrSWhQUGM3T1hvc1JqNDBkZEdOS1BON3JIUG4vTXNu?=
 =?utf-8?B?dmh6V1JRanNQZUp1TXp2S01sQ2dJYzFQUWdqM0xVZXJ3VU9uQ0ZNZ1d1L1RP?=
 =?utf-8?B?bnJ3Wm16and1SktzYTg4akZBTzA1dXJQMWhMOHBYN3FoL1gwTU1mdUl0MWh2?=
 =?utf-8?B?RkJFSUZRa2tBSUYrM1lLOE15MUJFRGNYZnlnK3p5MFFSbmpNQ01hK2laNnJq?=
 =?utf-8?B?d08rdkdTSTA4aVEvNmdudk5OQkpXZEdiRllSN21pcHQrREg2UnRGakYvWGFS?=
 =?utf-8?B?Sk5tOWlzSWcvMGQxVFBESGNUWXA3YXpRVjhlck5CazBvMUVQWFFYQUNtSWls?=
 =?utf-8?B?bW1EZFBPQytoclRiTC9KdG5CVDltY3plZXhuS0h5OTFTdXlXUE42UG40MlBR?=
 =?utf-8?B?VHROTGZXMFgyMVdCTWxva09UYkFENFZxd0xNSDlacVUwYnNteTVoOW1lTE9P?=
 =?utf-8?B?T3pjMmQrUlJUc2ZGSnUrQ1EyanZpYzFRQWZ0ZW1VNm5JTnAwa1BFendjTFFP?=
 =?utf-8?B?V1gzQjRycVNndmFxNEdUaWhzdHQyTzhyNnJpdlBOczJJalhlR2xKZkJiN05I?=
 =?utf-8?B?QVdLY2FzYk5JeXAwK1dOUnYyZEZIUnRZVUlRcWhDdkFlb21nOFhCd05VU3Vz?=
 =?utf-8?B?cTVLWTVNOTVKT2ZMb2FlV2xrWDBZdU00RUZmWThmMkRwQmZ5QzRMNm5WUjJZ?=
 =?utf-8?B?SitKODFqU0h3WGVJOXczMXV1T0dGaG5kSXQ2QkRhTGE4Z1g1STI1YnpQRnRa?=
 =?utf-8?B?Z2ZRZG5saHJFaWp0YmJERGhuY0JpR3d4SkFXMjFQRWZzUDRmVVJydEVIRFlZ?=
 =?utf-8?B?emNhL0UxSkgxMWx1dWNoZzQvcFBqOTJnRFVWeFlxWCtxVFE1TkFoOGFOaXAx?=
 =?utf-8?B?MXArVkN3WUMxeXNrRkVJMlorNjRpbnRRczVud1NzVHJGZUV4a2hmNmlMYk4y?=
 =?utf-8?B?bUhkTVBLOVJ4eHV0MVA0K05rV3UySmtsdG5laURnT1h3WWdOeXl3UGhQTkhr?=
 =?utf-8?B?OXZqS3hPbTJOTGJsMitiM05reCtoRHFkNXVUcmlJb0s0TDl5YW1OVVlKckZ2?=
 =?utf-8?B?aEpoUFFpRzk2cWRUMzVVNWdmYmFEOERrZlU4M2dldS95cERqWjVxZDAxQm5D?=
 =?utf-8?B?NVo2dXJsbG5ZcWY0WDdnK0xBMGFZTjNJWnRMa0FYMmpyWTdicEJZcWlRUSs3?=
 =?utf-8?B?OUlPWTIyVW12K0FnQlEwR1V0ZTFDMnRIdmlNdzBSK2hhVmJxNlVLVTBpNG42?=
 =?utf-8?B?Y2NYblNpMzNPWEZtWTdyK0NKb05xSTJHcHZuWjlOQ1U3TTA0WTVEbnUyWXox?=
 =?utf-8?B?S2VGT2U3RFRPbTJtcUMxOTFHazJ1L1BRZ2dDekYwUi9JWkcwdTAvNTBGK0Jy?=
 =?utf-8?B?TnpSekkyZ1B0RlZVbEExTlRJVHo2OHNJdVhlYlpHV3FIeEpKSWFSN3JubHpz?=
 =?utf-8?B?NDRPNGN3T3AydjF3WXhWQ0l5em41WjlQVHh3allwNG9RSnRyL3haM1FBeDEx?=
 =?utf-8?B?dDNEMS9EejBSRlZiZGsxc1RvM3ZSMThYSk02V3NnY0pGdDFRUkFKbFZBdWFk?=
 =?utf-8?B?R2sybmpDWkpabzBJZjEvZU9ubG1kUjlLdDFOTGh2NklNYXhxeWFnSjFWemw1?=
 =?utf-8?B?YUtYNWl5Q3oxQ0lROUZ6dEFvbHRjaXNieFB3bDJuSDRZMFpmYjRKR3VZanph?=
 =?utf-8?B?aTFLYWhNM3JxOURZQktoTEN1WU5ZdCtvc0hJYk9vNW11VXo3Y2Z0VjlEaG03?=
 =?utf-8?B?K1pnKzdmYzhaQm9zQnRWY3d1VFNCRXA3d2p3ZFVjT3c4UVVlR2JkSFZKZlg4?=
 =?utf-8?B?SU5uREM0aFlSM1pkTmwzcmRCVXRSUjVQcG92RmZ5MlhmbFgxbkVUWHBTRGpo?=
 =?utf-8?B?TkxuYWdGMVdXcUNtT2p1SVVoVVc3K3JDT2pCVzZsMEc3RnZaWlU0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E5CCA065915844F9453B6C8EA386D52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	E9MU6pRsgblQYHiN1/dgHMhsROd+H+84XbgdmQ/2W+RX1s+k6uQoOuX+wq+OyCOfJ60mZIyyzaZn+fD1yUKns90GSMJEnhm5b9OIy5kWEsajWpaENskVIxYkSfU9BlKoXY9G60trUfvkOM8MrJrRmzpLxug41QvaRxu7ynYs95Ab0CIpLiI/kQHo888LrXdTTz61wbAORcMvpXzqNlCsLyDp6wJMuU5dt7F8DAKcf8zpM1OTqAIRgk7Irczzv5QzT1EcjM0ue7DuZiyfp64yz5DQkI1V3pWG0xlj4C/uko+o4sxkgFPt61XaB++zuJJ7hw4Is+klMLb3PROHnqJsFg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DomXJBU1jPpsdvzObrVFeb+NKJIaPbN0YoZD74lNVpUQaomF6TMs0CZRtFddy1an2zSjLGB2P9VqiupeXcuXpZDnn2LebEMY2NCT8T+PaqLQQnaRgCgtL/sejoHYR8VH5pky6smtal2TN7A0/ipIKgTFlqfHE9r6HHRcawBxeXgxJDy7pK3Qdz07xpSUZD+7cc6EUzx8CN+1pzaiFN897ix2M1nZ43zazG0nUlQ+A6lW3rsvw+rHSRoBo37scf8s5faHiXngubbeQHnfecHZh47gQoYmCsmjTHGAkD4fug047bbaF2/Z9nSh16p6JfY+Zb0P+Od5guGxtxt7XCIuhfdB/gdJfW8uGMWbs6PIk7fxG4iiB+3X/KPtFDWy/OF6MtDFHmPN9mSU36fHm6jbzJW7Eeys09WBg71gQvFji23PUpRntwGdxBnz1IAlVaCj2/kAvcgYNGgkuln3nVfgPpGh8ka7Wo4Bh3d6xoAJuyRWMK4Ajmu3PjMuIOScdgIMBHtPUh/CUJpT//4LDiNxCC8fURppGbP/ReilxAOQEbn6rZaG9rGmFujnWa1egc5uYWG+jVFp0J5l4hghqXcrgQVK/wW953uf0t/KlLEOqOISHok37jTXR9AWsXYtRHdpvWyjNLWJHo9X/W2I+DxBKQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa2a705-f425-43f6-e6af-08def277c3cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 22:28:53.3168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSzSFoo3qjdjfjHypqFyyvV5f5AsX8C5TjuFP58LDFPg3wiyCn2RwPsPEomO2LgH4K5UwEJj9GcS0PB+hB1iJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999077
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE4MiBTYWx0ZWRfX6aTLgOOTIqrP
 NKq1KJOyOBX6gwr6ZRcI4A3KssYXzg6+3GAhKNZXfQes0MviIPk2ep9Mhb55Okrq4CRO3lbIqvG
 Ae/oUYn3cbRXHz3Y+++lnNcnMW/B2Io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE4MiBTYWx0ZWRfX08tirPMXDort
 Zgk8wQejUeNqFoq5UnSxjrcj1cA8F8Cxhz4xkywaAoZZkNx0M4gndfmNDJjCuf9oe8XKYXskX15
 2KX4QRq0SO8pMjAeC67u+qLAvUUceh1Pot18AXJktwZVtjepET/uKazy1P/ipFJUfqAPHrsj+fT
 6M7EBjBE7MJtC2YqYmq5DyrgODCLBSrpWufxBeUwGnhsNTT7/rgzoROPiX9F3giYqxS2bjlvlvn
 pm+z705FPJIXqwnhYMnv6zXd3XFZYp/5Y87yd3pwlAYojZJ2+qNgzb9EMpZeeV946Y6B4rh1YWG
 0l8Spxv4Edm3FGLlW7GARHg0BcDpGOys4KgZ+++/zrpMI6OfkVEJ90aux637+Vbt0e5RmZCfbBK
 2wQdwV1WcYt72s0qV2HsDrnZBekfMhvFG+Ge4QeH4OKmQx68mp/ZgsDH/6PiUHVlXcQRyqzJmWi
 x8EZMFlFTjZhl475hRg==
X-Authority-Analysis: v=2.4 cv=DtdmPm/+ c=1 sm=1 tr=0 ts=6a7267ac cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=BEGjlnNButEchce3XfwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dE6vdih5RdqFoTNeuTIU_WMnuGc2zW-m
X-Proofpoint-GUID: dE6vdih5RdqFoTNeuTIU_WMnuGc2zW-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040182

T24gU3VuLCBKdWwgMjYsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNy8yNS8yMDI2IDM6MjEgQU0sIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiA+IEhpLA0K
PiA+IA0KPiA+IE9uIFRodSwgSnVsIDIzLCAyMDI2IGF0IDA0OjA5OjA2UE0gKzA1MzAsIEtyaXNo
bmEgS3VyYXBhdGkgd3JvdGU6DQo+ID4gPiBVU0IgY29udHJvbGxlcnMgbGlrZSBEV0MzIGFyZSBh
Z25vc3RpYyBvZiB0aGUga2luZCBvZiBwaHkgKFVTQjIvZVVTQjIpDQo+ID4gPiBjb25uZWN0ZWQg
dG8gaXQuIFNldCB0aGUgcGh5IHR5cGUgdG8gRVVTQjIgdG8gbGV0IHRoZSBjb250cm9sbGVyIGtu
b3cNCj4gPiA+IHRoZSBwaHkgdHlwZSB3aGVuIHF1ZXJpZWQgZHVyaW5nIGl0cyBwcm9iZS4NCj4g
PiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJh
cGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvcGh5L3Bo
eS1zbnBzLWV1c2IyLmMgfCA0ICsrKysNCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcGh5LXNucHMt
ZXVzYjIuYyBiL2RyaXZlcnMvcGh5L3BoeS1zbnBzLWV1c2IyLmMNCj4gPiA+IGluZGV4IGY5MGJm
N2U5NTQ2My4uZTEzOWIxN2JjZGE1IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9waHkvcGh5
LXNucHMtZXVzYjIuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9waHkvcGh5LXNucHMtZXVzYjIuYw0K
PiA+ID4gQEAgLTEzLDYgKzEzLDggQEANCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRv
ci9jb25zdW1lci5oPg0KPiA+ID4gICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiA+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5oPg0KPiA+ID4gKw0KPiA+ID4gICAjZGVmaW5l
IEVYWU5PU19VU0JfUEhZX0hTX1BIWV9DVFJMX1JTVAkoMHgwKQ0KPiA+ID4gICAjZGVmaW5lIFVT
Ql9QSFlfUlNUX01BU0sJCUdFTk1BU0soMSwgMCkNCj4gPiA+ICAgI2RlZmluZSBVVE1JX1BPUlRf
UlNUX01BU0sJCUdFTk1BU0soNSwgNCkNCj4gPiA+IEBAIC01OTcsNiArNTk5LDggQEAgc3RhdGlj
IGludCBzbnBzX2V1c2IyX2hzcGh5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gPiAgIAkJcmV0dXJuIFBUUl9FUlIoZ2VuZXJpY19waHkpOw0KPiA+ID4gICAJfQ0KPiA+
ID4gKwlwaHlfc2V0X3R5cGUoZ2VuZXJpY19waHksIFBIWV9UWVBFX0VVU0IyKTsNCj4gPiANCj4g
PiBJc24ndCB0aGVyZSBhIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbiBpZiBpdCdzIGhhbmRsZWQg
aW4gdGhpcyB3YXk/DQo+ID4gDQo+ID4gMS4gcGh5LXNucHMtZXVzYjIgcHJvYmU6IFBIWSBpcyBy
ZWdpc3RlcmVkDQo+ID4gMi4gZHdjMyBwcm9iZXMNCj4gPiAzLiBwaHktc25wcy1ldXNiMiBwcm9i
ZTogUEhZIHR5cGUgaXMgc2V0DQo+ID4gDQo+IA0KPiBIb3cgYWJvdXQgd2UgZG8gdGhpcyBnZXRf
dHlwZSBjYWxsIGFmdGVyIGR3YzNfcHJvYmUgY2FsbCBkdXJpbmcNCj4gZHdjM19xY29tX3Byb2Jl
LiBUaGF0IHdheSB3ZSBjYW4gZW5zdXJlIHBoeSBpcyB1cCBmb3Igc3VyZSBzaW5jZSBjb3JlIGlu
aXQNCj4gaGFzIHRvIGhhcHBlbiBhcyBwYXJ0IG9mIGR3YzNfcHJvYmUuDQo+IA0KDQpUaGVyZSBz
aG91bGQgYmUgbm8gcmFjZSBoZXJlLiBUaGUgcGh5X3NldF90eXBlKCkgaXMgY2FsbGVkIGJlZm9y
ZSB0aGUNCnBoeSBpcyByZWdpc3RlcmVkLiBkd2MzLXFjb20gd291bGQgZ2V0IC1FUFJPQkVfREVG
RVIgaWYgaXQgcHJvYmVzIGJlZm9yZQ0KdGhlIHBoeSBpcyByZWdpc3RlcmVkLg0KDQpCUiwNClRo
aW5o
