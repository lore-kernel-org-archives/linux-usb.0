Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3E3B2AA;
	Fri,  7 Aug 2026 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145513; cv=fail; b=VRZSoB9EtZ41R+yoc6MagwkCxvzqBWHKjDjEhVsBT6ZxSDAj6So7UCGxTGQR71Hj75RfzxDQO8CCO2b2j43CnVHVEh/nXhHoPcZMZhs+YR2ZDUDsSFMQYrddYRKQtOP4fDzb174sSagzJdNJijNgjK/QsMPa0oI5SZepiOGJkik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145513; c=relaxed/simple;
	bh=RphyB1cfdiEb/+2HxVHPwhv+Bb3kHefWDcPjb2GVR34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dv+2L7Wel0pt1gyAYgILcn9WtzOvvRocaf7lUNq26HAZDJMfVHACSxeuk/jWwNjWPaE3kQPcp/EMqzbAc5GBywTVnndYSrBV3CtUyM9Ka7ySAT4gNH+9mv6KjJaBeZ4guhJO14p/5QEDSOvJ28Tx4N3c+N5IHg/umDCmVeZyR18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IBpxmjaN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yo0bSdfr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZFi2mC3e reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IBpxmjaN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yo0bSdfr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZFi2mC3e"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677LceVK1395464;
	Fri, 7 Aug 2026 16:31:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RphyB1cfdiEb/+2HxVHPwhv+Bb3kHefWDcPjb2GVR34=; b=
	IBpxmjaN943wdbtSAHOJKC23lehYIAJpuk42QVuj4Gc3VzEoZGfJwrNybZfT0A0j
	iE+Bp3PMe8qb9YLKygZVf+DHbxluX1kAQZkJ4R3QnWznlkzf7YM7yMidwa/6aG4b
	RmDRDzQR/+TTz5HsImwGZck9Sgs/jFO9VmAB6+/2I7aqY3c2/ktjzBooJpC6G+60
	y1tJUMvAv4yBpWHyk+p4NlkACMo3eYq8oVJDgZFeaLiQtA/RO3orcHkh6CGIIMw3
	sZDhiHwMLofcmOd29yHW8ugFdTRvA4WyTFWC0zOBqAxgX7pMM3ZOfY6hCntLM2NU
	vcrCW7jU3sd+oTC/vttCAQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fvy9vce7j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1786145484; bh=RphyB1cfdiEb/+2HxVHPwhv+Bb3kHefWDcPjb2GVR34=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Yo0bSdfr5l8APrih/hvGOdpxN5np3QYFwg4W3kgRKKFMPdmpD/1qo4qajejNgRLyv
	 iTxQsErStLilaoxhXR58x1hz4T563ATA5+3BjVzqrf1h7k7BBjgjUBuafrzjfeZ7l+
	 nDk3cChxJ9g0aN04zRX50VP9+ligy9JhYWQLz7A+0qR8u8lAGdsXIz25BofQ2au9a9
	 pv76axNvbAFC7HYMfW5dC+l9LWsmSL57aDt2x4RIyRZTX16TMfgFwmkxfxv/vZniFq
	 EDWtVwEyK6D7YB6xWHjfg7ZihJc4pya3OcTbka63tkkBUaCXoo1tvzvX8tkpPV6MFf
	 fPKkmSKl0WzHQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 762574011C;
	Fri,  7 Aug 2026 23:31:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CDAC2A0495;
	Fri,  7 Aug 2026 23:31:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZFi2mC3e;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 08C56402D4;
	Fri,  7 Aug 2026 23:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8UDKRGrg40i6MtiYDIYHOR9jn3dbkULONivp0+gXDXLp9I+gpogxLGJZO9F0iAh3kiiwrOTcJ95QlBOoGcUUa+x7FXrDs8QaG7hYBuLa1mYPs6e94e2ppjUwgknfqctihgytCLMzDB+mU7esPCHq7meUnxdPEq+ED7VIC2XLYaYEfmDqwX6Zl09UNsVLfdMbS1WE3UbgMjWmNfJGoaWwOqDoQNh7hMN0tvNVTLtT+nbf4oPI1x7sRS/yiVjgBI9+wUX/oBvw3dkcspzO25hOMUnUgRz/B3vI3y8rVeWY1gPzX3Dy+vqCZ/EQNGyYhClyUf48MUwZHsWtvsYt93FXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RphyB1cfdiEb/+2HxVHPwhv+Bb3kHefWDcPjb2GVR34=;
 b=HLaZ1ORMSx91VCnifBuCkrAGQzCC1aL0oYX2gV60iU57bTjLBhdZ5E8wSmNJWd7RtVm0vUZt2aDQ6dlCggFcFYqjnPiTc6Nqf1Or3QNiYDyc5EAFXz18VgZqx94iokuAyU1dhP1Dnb4TLfMFiID4+C2rjUVZ5ctDevWygCgQ9DUwZZ58QhM/JKCI+V9oPCM2T6RFNBV3zHnJWuL+JwQIhd5q3zf4cDqAK1YtgIT+RDHHtJq9dhXnFy1UZkcNT6FmLTnw0bUM5Ajs85Ho5SH8fAWYgzEbR8rK8cuZse7a+e/+YmRAkWIAAVVNK/mCJiMW10fazm23cXUkY0o5KSHPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RphyB1cfdiEb/+2HxVHPwhv+Bb3kHefWDcPjb2GVR34=;
 b=ZFi2mC3e+RxAbEcijD0DlJ7UK7FOE8GLDP9q5r45u8BdfiPFXHZqXevSccU7zNVCxEOT+fpxzlRwoHkm682n7orVSM1s6JxRvq8AwERfchv5wF/8yFSjUzYAvWknAQtDSriedXovmWBZC55MXrOZ+JVsyXCSXOBQl+KR0pQ1ei0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 23:31:13 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:31:13 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdJWEY/O2gJF3FWk6KQkt9YbRsXbaTPucA
Date: Fri, 7 Aug 2026 23:31:13 +0000
Message-ID: <anZpZIW76RzmyiIi@vbox>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
 <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH0PR12MB7958:EE_
x-ms-office365-filtering-correlation-id: 6627e226-c531-4309-2955-08def4dbf877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|38070700021|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 SRJTqr38+/ePiuUhF/aD4hXvhrh3+7yblKr4lcBq8AxWvHGwwOJyHegs0v321JhsmCWOaW7/FRdMNwb40lkZ3jyESqNCFqtpP20bVQdl+auvg8TdO4OC+P+kXu1bUyMu5bpuKjWCP2zLVEpcaYf00CM0qNccrk3QOo7du2y8VdbQ4rxyNb07CNCD/+XFSri05j0gai+qEY//Qsak0K9irafAMZ0Ykb2eG5Xj7xp7TJ48GcBJkP0NOqX1Vo4qgNOUIHt30r1ZHFOEcNZeXtCV/tzj2yLKCtfaFL2MDeQmwKLlYR9RVTQLyF9T5/9kWOtV1/GEshe4speguGf1kdL6sKYfxhUNr3rdGMKiqM4NSd2sBxraG9FkeH2RrIs1sgGPaohYysUSv6ADdtmg7QVLfFei0zAUDnozu+d7tQuVWjMVIetiI6Pb9g/4Hy8Rfhu6Ou68YB/OV9DwdAEo7CL2TX4LiT5sa2RH4WGRK64pk5BOmsobWMmef7dUNF6UxHDhRNf0V4j32BZhqgZvWprplEIgfXIkwrklieTdCsXdQXzbfbwkWilz6IzBTtwbYaxdCwZzTaRQkBpWNQkj+YQcNbP//T06yrkZzdXWe5cV3wS6cTe4CeJEFA4xc+YTGLUnglvI20Q/2N8DtgxLy9eXvkEAmjf3RKlUN4fNZqJBQIvta3+GMNqiGPw8BOw3UaiQwFl6PwhhVD8o22yxZD/tDh9mSDNrTsXq/MsVpwBWM84=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzJVZHo0Slk1d1kwc3NhT3o4cGEvTlk1RGxKN3R5NUpmYURTK2taSzcvai8y?=
 =?utf-8?B?aWYwNUpPSVJDSk54SG1LMkxQcy9kVmloWFBob1cyL0c0b1JvajFEZi8vREkz?=
 =?utf-8?B?TytmUmtYczU5aUNndzYzYloxMVR0b3dJTzVJRExiRE5xTmxLTmE1eTB6MjR2?=
 =?utf-8?B?SVhkUWl1Y280bXVqRE92SVJYcVhSSTIrQzRrS2Z1Zm82YzYyQndMdUlGU1JN?=
 =?utf-8?B?SUtUN3lRczc4cTZZWUc1ZGdCOXBVTXY1TFZmS09FVkVWcndCMGhNRFp5S0JB?=
 =?utf-8?B?UW1KM3VmY0xYTDNoM1VWRUVTODR2R2htVkFaeFptM0dUdEZsdy9mUUFaM1Yv?=
 =?utf-8?B?a2pCbU1ENVZTM3pJM01uaCtzMTBBL01hbkJWK05icUM2ZzErNEZZcnlUVU9X?=
 =?utf-8?B?czFjaHFmdWozNlhBbTJJM2pPVHVvMlczWE5LbHJHY3c1TnRuMHNiOGZyWTYr?=
 =?utf-8?B?ZEgxdWlPWVBYdGxMR3JPYjFCZ21zZWkvaCt5cklReFVUN1kxcTJsMmdWUHVQ?=
 =?utf-8?B?TWFDSElpazRxaHRqZUJDKzZMNUk5cndweEttWmdnZWtQblR6MmtDYjdTVEo4?=
 =?utf-8?B?bGRNaDlFeURmbXlJMXlrWGwycUVmRkZacm9ZMEhmMUdCSzhxTnFQQ1RVakll?=
 =?utf-8?B?WjNwTUY4eTBJRXlwUDA0WTllOTNPMUxsNzAwK0JkYURKYUN3bW8xcmhVTkFi?=
 =?utf-8?B?cFZwMlJsekJQVEhiUjUzaVN4dGtyMytHOWdjK2FzSWVvUFlpZDVBM2ZPeDVr?=
 =?utf-8?B?NWF4OGRkeWtkT2ZMcnk5S0ZhVXFDMnVkTjM1MHAzczBGWnEwTm8rV2srdUhn?=
 =?utf-8?B?Z2lrL0NCa2ZlMlVrTVhSa0d0aGUyaXFyMjlTSGhlMGFnTHhZVjVBV0JGN05J?=
 =?utf-8?B?c3Z4emt3dVB6bkJYL1dBN1ZmSVdzdTRlZWkyQklyeXIxQ2d2TzRHUjcwODRy?=
 =?utf-8?B?WGN0VTUxS3hHV1dGdXluMExmZFRBNmNVZ2tBVytxb0w4ZG5lVFBmbzEzaXVa?=
 =?utf-8?B?TkVWaUNXQzJDNlJCTDJjUFFKNXh1UU1GQWZLTllTWEVST1RLcDkwRllJWmtD?=
 =?utf-8?B?QWxmM2U3YmZFUFNDcVNnSFNoTkJQejJTVEl3OFgrb2h5NmFiS0ZkYTZCVW9O?=
 =?utf-8?B?Vy9SZlU1YWluRER0WXY1OTVtYWNsQzFwT2laSldDRzlnUVdnQis4dzZ0RmU5?=
 =?utf-8?B?Nk9ZbGZ5TUwxQ0ZHWmNDM2kxSkwrNGZiVGx3M1NQOXZudndmZnhvQ0U0RkVR?=
 =?utf-8?B?UnI0TDJaY2tUckQ4bktPdVE1QWwyd3VvZFBsb3kxYjZwOWwremttZGlNaWlF?=
 =?utf-8?B?WmRKNll1Y0JCTWJ1VUZaaGNjK3lPM2xsYVoraUpnY0NDUlJJL094dHlIOTE1?=
 =?utf-8?B?ODhrRG1MVUNhN0JQeGJGTTVFRGtkNlZZL2ZUWGZjd3E2T3NJUFlNSXNjVTFH?=
 =?utf-8?B?djA1UE1iVDJyZXM1U3BoQXg4dWx6VzJaM2JHOXR6dm0zWXlHeURXUHJGWUta?=
 =?utf-8?B?enQxQk1RVkpyQlp2bTE4aUh1RW1mRXpiRHV6Vk1YWHBQS1BuN21RazZ1dEFE?=
 =?utf-8?B?ajZJMEFXcUt0T1l2dlBGKzN5UEdQQWF1N3Vwakx0TGs1cEN6WVNoTzhRbjYr?=
 =?utf-8?B?UzU1MmRkdVVENmdIclRqVjFua0ZxcG5zWWJtTlJxSmRFOEtleTJQOGxuWlhp?=
 =?utf-8?B?SnB3eC8zQVUvNGEyZW1mTWlWV29VNUE1RXM4bTRUekNyRVg1Sk96cG1FNzZS?=
 =?utf-8?B?Q1VkUVRLRVIxTU5yR2U0T2lIamg2QUFJYUhsa2tRZVRGRHAwZU5pWWhDS0ds?=
 =?utf-8?B?R0o5bzV4bVRkSGRGNXhmdWpSU2NLSm4yUVRmZzRBam0ySDgyUUhjTXh4TEYr?=
 =?utf-8?B?akh5TEFLaWdnQ0FteG0xTzd6ODh5aEpXMG1BU3VYa25LMHlpZ2J1YXVKYTdv?=
 =?utf-8?B?STRBMDNDTzFVSjMvYUVkcEowMmNuWnUzUDJZUW0wMUZUa2Z3N2VSNDBMMFRO?=
 =?utf-8?B?cWZzY2ZyMVdJcTFDWTNQeVY2dGRHeStSREF2RzNCeDVqeDFaZmkyVUN4VExV?=
 =?utf-8?B?aHBRMVJwQzdFMm9leXdzQWoxYVYxM2w3cW1ZQ04rMzhRckdOQ3N4dHZYNWVu?=
 =?utf-8?B?M1J3cGZwemdNRlZTdEthZkFDb2VDV2F2Mm93UFk0Y1F3N1FkeUszUEM1UG9r?=
 =?utf-8?B?NE42d0l0eWUzc3lDRVdaM011UHBYcEg2MEtpY1lHVzdPK0tBSlVQa2ZKUnBn?=
 =?utf-8?B?NjZBQ1RObTA1UURQOXpFNUJ6dEFhN085cFh4cWxVTGJQejlzdHNqYW9sMnFm?=
 =?utf-8?B?V2RqdDZIZnk5VExuVzdtR1Nmelh0bFg5Tlo0NFl5dEh5WXR6czRXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FC1518AD2064445AA5CE4764BA1ED28@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rNINuPJltfXP0p3RERPlAOmXSXHALMzMklwlCzJv/THM9PsnS0QNdDPGN3cRunJxWyLS0KOPJZVqSuWJesb2VsvlvGzANe35YIweluPgQVXswenIXE/+rKOtah76QeZsrBTSaiNsW/314QG/DhA3pUsumx3Mrx38MmUsGSRQ6znusTk/V7SMN0PmP2tk06hzp1Beyos3G/blsINEU7Z/25R6Fdr/HYjJ8uVeiJCYR5VPYmrkCL/+XGbO9g7HoSs7nPTgKY7mgqeALM5vCGOZAYSE+QWrbMr78f+yk5+99GWv7ZkZrmxqqhss1uk5a3XYh0lsMuhNzxk1pUIXXDy7mg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MST4c1EyN4/SXb/MsdvyEP7XPw326GVdJreXrPCiw5afbE2zoc/nAadRzKjh1TaUgEAjtmxLaVdsZSfKvbbjAYQ9uSYt6/NNJUbsi5wKFJq/dPWgQTR8rRJc0LNGDJecbutjJBkf3l89aH5dexaT6HTdqZJ1VQVBy/SGV4/3n7jF2hjSlBNc4TdPI/Ccx86qUGj8wExo/EzJIfBG9kubOgXrZyiTpxxOtE5J6rBbkmkO8NK4dBefIDPBQZGyq7sUtPqd6ZcFYSjdT2I+6EqrRDktY2YDEKsnwL0LFW144QJt3+VvBWXSAtsbAOBv9trAo1/PX+MAlO0VtwUPgg9Pl1V/f8jaga28pGt3FmOZVgxeEOqrgZ3AowNDVmsORGh5J7Yx6j4a5KnPOMUgGrjP1dccQP+88v2g/tCQuEZSSslPYhflwPOGKJtAUjzKw0R4rJA0KopENrswuey67KTjSPgG8N2JpHpGQvy25SlOh1qeqa7B9dvQBkxvArGG8d1ywxGumhOVlZB7Cgdh1Jj9thP+B5tq8IjrBQ4zQU/EqLh8I3Ql3RwFKGHb2DKkQfq7e8rc7ei2rQsWHQ/mk1CI4zDJhdsRyEYM6TyBkbSrXZPH0f032+pLc7ZckC0IwrBe863uXr24lOEx+qZnML/EPw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6627e226-c531-4309-2955-08def4dbf877
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 23:31:13.6563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RrD++i6gILD4rdH/vHnDMtAFpYSU8fIrjICr6CpaKl6iDyu95fLYlac2bX7MUj0G798qdvxhSo6l9OAQzXtbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958
X-Authority-Analysis: v=2.4 cv=PtOjqQM3 c=1 sm=1 tr=0 ts=6a766acc cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=jIQo8A4GAAAA:8 a=CWurzQRJBVO87lpARKAA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 4NK7wS_BixWk1ml9niMeMKHNRGsElGMT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE4MyBTYWx0ZWRfX6cREA0Ucy6tJ
 fNLzJ7ixog2yiwaSZP11mI9AGHF+lfk/OHM4WrdhRQ8UxOsRFKqErljMxTumq0LYB0wC5wRg0Ow
 4VWLO036tRqCsMhYaNZBzibpnQ8VL8g=
X-Proofpoint-ORIG-GUID: 4NK7wS_BixWk1ml9niMeMKHNRGsElGMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE4MyBTYWx0ZWRfX/JMJpZrZPPAW
 fwYcrfqBIbxxZrCwag+mA+gCVZanuswoQZwjQA4BuxxQqt6OhhERuaKLeMotULl9fugR4+ofMCe
 s4fCdNfRpt66fDulGP9bK/jhmFGOxy5f35FYJn3jnbxOkJfyUof58W74ZD2ihHb/gV9DBOtpX4j
 1R5Re3H9eFk0rgKHU8389Vuj3avkBfOpg0eHxtGW/5K1wEyBJlnxhdOWW06Rx2x76cAqlc7Mwzs
 Wh/+QMqzWq/UftB75tLILQRXqT298aRECYypEePqOKyA9Rxb78us1e7Z1jd7PZP6DZ6ktQD3rtC
 UPyR/Y3XH0DX2mntMueiX9OcCnzVBfHMxgMZ7NiutAlvvSKsBZIV5u6z70g6lJ/lhmoypVWScin
 bs6Ob1Ov/N9c3132DZ6lCDmYu/6Xs3MIfoN9ktKuCYk/+x5LiVe2TeE9OZRjx0L6kjr83z2ESV4
 7NZdW8JfE+6TCiZjttA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608070183

T24gVGh1LCBBdWcgMDYsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBGcm9tOiBUaGFuaCBR
dWFuIDx0aGFuaC5xdWFuLnhuQHJlbmVzYXMuY29tPg0KPiANCj4gVGhlIFJlbmVzYXMgUi1DYXIg
R2VuNSBTb0MgY29udGFpbnMgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIERXQzMgVVNCDQo+IGNvbnRy
b2xsZXIgd2l0aCBnbHVlIGxvZ2ljIHdyYXBwZXIgYXJvdW5kIHRoZW0uIEV4dGVuZCB0aGUgZ2Vu
ZXJpYw0KPiBEV0MzIHBsYXRmb3JtIGRyaXZlciB3aXRoIFJlbmVzYXMgUi1DYXIgR2VuNSBnbHVl
IGxvZ2ljIHNwZWNpZmljcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoYW5oIFF1YW4gPHRoYW5o
LnF1YW4ueG5AcmVuZXNhcy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJl
ay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPg0KPiAtLS0NCj4gQ2M6IENvbm9yIERvb2xleSA8
Y29ub3IrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwu
b3JnPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51
eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5l
bC5vcmcNCj4gLS0tDQo+IFYyOiBFeHRlbmQgZHdjMy1nZW5lcmljLXBsYXQgZHJpdmVyIGluc3Rl
YWQNCg0KR3JlYXQhIFRoaXMgc2VlbXMgdG8gZml0IGluIG5pY2VseSBmb3IgZHdjMy1nZW5lcmlj
LXBsYXQuDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMg
fCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNTIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1n
ZW5lcmljLXBsYXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiBp
bmRleCBjYTY5YWMwZWIwN2NlLi41MThiYjQwZDEzNzJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWdlbmVyaWMtcGxhdC5jDQo+IEBAIC03MSw2ICs3MSw1MiBAQCBzdGF0aWMgaW50IGR3YzNf
ZWljNzcwMF9pbml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IGR3YzNfcmVuZXNhc19yY2FyX2dlbjVfaW5pdChzdHJ1
Y3QgZHdjM19nZW5lcmljICpkd2MzZykNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBk
d2MzZy0+ZGV2Ow0KPiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9y
bV9kZXZpY2UoZGV2KTsNCj4gKwljb25zdCBjaGFyICptYXhpbXVtX3NwZWVkOw0KPiArCWJvb2wg
dXNlX3VzYjNfZmxvdzsNCj4gKwl2b2lkIF9faW9tZW0gKmdsdWU7DQo+ICsJaW50IHJldDsNCj4g
Kw0KPiArCWdsdWUgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYs
ICJnbHVlIik7DQo+ICsJaWYgKElTX0VSUihnbHVlKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZ2x1
ZSk7DQo+ICsNCj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhkZXYtPm9mX25vZGUs
ICJtYXhpbXVtLXNwZWVkIiwgJm1heGltdW1fc3BlZWQpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT0RFViwgIkZhaWxlZCB0byBkZXRlcm1pbmUgbWF4
aW11bSBzcGVlZFxuIik7DQoNCldlIHNob3VsZG4ndCBvdmVybG9hZCB0aGUgZ2VuZXJpYyAibWF4
aW11bS1zcGVlZCIgZGVmaW5pdGlvbi4NCg0KQ2FuIHdlIGNoZWNrIGZvciB0aGUgcHJlc2VuY2Ug
b2YgdGhlICJ1c2IzLXBoeSIgaW5zdGVhZD8NCg0KQlIsDQpUaGluaA0KDQo+ICsNCj4gKwl1c2Vf
dXNiM19mbG93ID0gIXN0cmNtcChtYXhpbXVtX3NwZWVkLCAic3VwZXItc3BlZWQtcGx1cyIpIHx8
DQo+ICsJCQkhc3RyY21wKG1heGltdW1fc3BlZWQsICJzdXBlci1zcGVlZCIpOw0KPiArDQo+ICsJ
LyoNCj4gKwkgKiBUaGUgZGF0YXNoZWV0IGRlc2NyaWJlcyBpbml0aWFsaXphdGlvbiBwcm9jZWR1
cmUgd2l0aG91dCBmdWxsDQo+ICsJICogaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlZ2lzdGVycy4g
VGhlcmVmb3JlLCB0aGUgc291cmNlIGNvZGUgaXMNCj4gKwkgKiBiYXNlZCBvbiB0aGUgYmFyZSBt
ZXRhbCBjb2RlIHNoYXJlZCBieSB0aGUgYm9hcmQgdGVhbS4NCj4gKwkgKi8NCj4gKwl3cml0ZXco
MHgyMTEsIGdsdWUgKyAweDI2KTsNCj4gKw0KPiArCS8qIFVTQjMgZG9lcyBub3QgbmVlZCBhZGRp
dGlvbmFsIHJlZ2lzdGVyIHByb2dyYW1taW5nLiAqLw0KPiArCWlmICh1c2VfdXNiM19mbG93KQ0K
PiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCXdyaXRldygweDExLCBnbHVlICsgMHg4MWMpOw0KPiAr
CXdyaXRldygweDAsIGdsdWUgKyAweDgxYSk7DQo+ICsJd3JpdGV3KDB4MSwgZ2x1ZSArIDB4ODAy
KTsNCj4gKw0KPiArCXVzbGVlcF9yYW5nZSgxMDAwMCwgMjAwMDApOw0KPiArDQo+ICsJd3JpdGV3
KDB4MCwgZ2x1ZSArIDB4ODAyKTsNCj4gKwl3cml0ZXcoMHgxLCBnbHVlICsgMHgyYSk7DQo+ICsJ
d3JpdGV3KDB4MSwgZ2x1ZSArIDB4ODFhKTsNCj4gKw0KPiArCXVzbGVlcF9yYW5nZSgxMDAwMCwg
MjAwMDApOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgZHdj
M19zcGFjZW1pdF9rMV9pbml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAgew0KPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9IGR3YzNnLT5kZXY7DQo+IEBAIC0yMzEsMTEgKzI3NywxNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNfZ2VuZXJpY19jb25maWcgZWljNzcwMF9kd2MzID0g
IHsNCj4gIAkucHJvcGVydGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTLA0KPiAgfTsNCj4g
IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIHJlbmVzYXNfcmNh
cl9nZW41X2R3YzMgPSB7DQo+ICsJLmluaXQgPSBkd2MzX3JlbmVzYXNfcmNhcl9nZW41X2luaXQs
DQo+ICsJLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUywNCj4gK307DQo+ICsN
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfZ2VuZXJpY19vZl9tYXRj
aFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtZHdjMyIsICZzcGFjZW1p
dF9rMV9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0LGszLWR3YzMiLCB9LA0K
PiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtZHdjMyIsICZmc2xfbHMxMDI4X2R3YzN9
LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcwMC1kd2MzIiwgJmVpYzc3MDBfZHdj
M30sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuNS1kd2MzIiwgJnJlbmVz
YXNfcmNhcl9nZW41X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAw
LWR3YzMiLCB9LA0KPiAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiAgfTsNCj4gLS0gDQo+IDIuNTMu
MA0KPiA=
