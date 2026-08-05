Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71C3BCD05;
	Wed,  5 Aug 2026 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968463; cv=fail; b=iWT5XU5NI+A4nQu0cCbp0yzUuFLM53iz7/JVx6CAJAbxIGiZCIYtlmuvfEmZDkUmLxSyfDlSUPAXJsn4zcxULxoicX8YAdD5G/z0jjYXZvKl1+J88ZR0LdNMqhhTHPyMDni/HAzL6G7ORaclaPkt4ckwnFebDMLZIrAw7tjhJMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968463; c=relaxed/simple;
	bh=B3+U2pUNzljQ8QxW6LLkar9bRm9rPD1kqRyEHASSgDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EW0YT5iC2u2UmmSSluwaz3mfffSikuZ7ju9Lt5xqf4ZfjkhIYBwJC9Z/x0fXY9TQ9OSHX8wxAj7WLK5nTfvr6MhYdNYoP6oai8Lv2iXtMk+GSUnUYI7+BFjVxhF3bpm5r7vqIne0rV1iclm2yfnHYnhnp/CG0Tn5iTu6L9cay+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=o07grxwg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fZv1WN1c; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cuRyjr3m reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="o07grxwg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fZv1WN1c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cuRyjr3m"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HTpR43703498;
	Wed, 5 Aug 2026 15:20:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=B3+U2pUNzljQ8QxW6LLkar9bRm9rPD1kqRyEHASSgDY=; b=
	o07grxwgSBJwhfmixqMSCYvDcDT+BP4whc+tCr03qRrwgj5rWhDP2J8xxrJWfBqS
	pni3LmDp2pJUDeTvC3vzt0/Mtl/11Rbb5gZasdHbBbXlx2kRG8UWoUahU+mDxlJA
	YoPgpWqbppcnWUoOGHV19GKr3PLkVOn0O638hQrCElzVQWAi9G1ILhC9oAOx8CtY
	qTEtzZVFxA9TOSx66BqJ3QIwUhb70xoN6cjHPLo1TVCzJ1M44wMy34fHeQMpN6Zr
	KWjowaFKPGB7KFgvUI3oi8+PvEJnCLjtiXesEWJjcgZNAWqpjHxyIw13TNGoQfM2
	+9INxFKn5HaQh6zVT7/vUg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4fv2hupdfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785968426; bh=B3+U2pUNzljQ8QxW6LLkar9bRm9rPD1kqRyEHASSgDY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fZv1WN1cC+sevTB0q/HtmTByZwXVALHbcJ+CiLR0X6ceOu/n+/Yp4dlYQNNw/GPq3
	 QVjarYbeZBaW9f4lymRi2CvBOL53j0Hk68/LYWm/JKS3iDYjYYIyGhx+U/iwcR9aHz
	 XhUPVpq2MhgqxiIbecXXht0jR2C8ehW8tKnuowJupcs1NTLkKJGEMNZ8eXg/E6xlY9
	 K0vqKUKHqQvSflDOobwBYxhFU/RaVWNAAmEAyMBBZY6+14gQWzwy3ZtGPidksWoZWD
	 RC7jvrxF7jEeo2fh9oaWBMvDokGiyMmpBK0p2fQAA8LTsBFIQS7w/OotmjDpeCQu2O
	 3HGZEDnZeOZIA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BBA8B403AE;
	Wed,  5 Aug 2026 22:20:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1A28BA0546;
	Wed,  5 Aug 2026 22:20:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cuRyjr3m;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00101.outbound.protection.outlook.com [40.93.10.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F40FA22058C;
	Wed,  5 Aug 2026 22:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGCMVH9Qu6kCrAStQ73CNOiZiQTRNXTVVHBuNsRxgqsdPiYpybk41JV55goMstyqU42grFLDKmznNqRnpj19BgulOqY+HMYknkQXb/3BZyZrpcBseK57h3KAeZq0cEXc0PZAVGLxX/xUud9qJ+B59xc5BafVNOCCCDn0lozCHcjOLP/oW2MHB4vXieySFYEsI1hMJwcmiwgZxYHn3EMwjG/Kp3d28Op5zkiRmnfD6qeX/KVkd37vG48eG4FL2WZTeZR3hesO6KOl/ZHs8EtO0LV2alZaPRBQwTuyVwSGb/UrQTEnac6PCo93zd02xAyxcJF/ZO/Bnbvyee6UTuF2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3+U2pUNzljQ8QxW6LLkar9bRm9rPD1kqRyEHASSgDY=;
 b=N+kYfiIt01FRotD/Ew0HXTkqBl975WKAswKBPaEQ2QoWJnjCuJzSg2UWr4zGbWzbU8B74ZBR7TDDPGkwmPmYDWoYEdF/3Q9fmmR+1XttPZzFPw+jwf3u+T787m1FNtfBLQL0rxXGZehfGoCZxh2MtHmt4VFkqbjR+upSq5duOXP9OIbEI9086Ftt5vj6YLwwkSBZUNfUxf7+CTIDeW3JA4ibpaZlJD6MqJ79MM8Wu+N7bC8I/2+am8OvjjFwhmbdZlLIZy6ZTReVzMu+7BkvrnpViS0Q2hSXzHRvXCNyJVYcfrQ0iFfZVIbANHIRQe+4rq/OBmA+uZ6T8SbYiyzzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3+U2pUNzljQ8QxW6LLkar9bRm9rPD1kqRyEHASSgDY=;
 b=cuRyjr3mAiRSYjnO/P/ZGV146g5gJQ1UB/u/z6jFu4T7NSo1hIYWegO0jEdr6vKrpXAgGL36tECCreBH8LVL6zruaH5sYco9SBlRnGC4MDMG+Oxpvk9WM8Q4kwTdPBtl3JCr2LsmB6SYE2L9+hljSQnitjmqYK4SPgXqVtQv8D4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DSVPR12MB999174.namprd12.prod.outlook.com (2603:10b6:8:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:20:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:20:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
Thread-Topic: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
Thread-Index: AQHdHi7a3ggsNoqD806vEwYeGGrqQbaOq9yAgAB2x4CAAPIxgA==
Date: Wed, 5 Aug 2026 22:20:19 +0000
Message-ID: <anO29i2hq9nMP9Gz@vbox>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
 <anJ6HkPgDb7I4xeL@vbox>
 <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DSVPR12MB999174:EE_
x-ms-office365-filtering-correlation-id: 6fcbdaf5-a7b9-4860-02cc-08def33fbc49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 C96vSVkTZC0xXA1B7NHz+8S1SFx2BTEWuzyv1+c5hzFBCzjHPwtLgwC5pyiqQcYYa68YRel6XfKjSzt9J73Hh2goG/zWalgz4mMVpXnyEJne0IZGqh2FEN4FAy6I4vddGj/J3EN8SFGr5Nvggy6LGqDQzoTAqpBd1QYvJNH3ItPAq2MaAEpb7IH6McUuowFxLTcAUk7sMPBjk2DpOoYvskybLfivWvT6Ic8WcMUfZ6kAhvetodg1Gz/aSFoMbpJiuII+/28WBSkD5qU2C5yj6lBMdJ549DsigkP1wNTNUErNE8wx/tPaz3VbTC4GuJzXLF2G+N4SXnT6w6vtJVqqnLMnOeU2WVohvKoHQUY9tOb/Wz5vtxEFNjdoDzsM2D+IhDlOgRGYMSP07Ogq9ZopPOUyQ5CUZ0B50u+3lqSI6OEfUFTKiuwnEoQdiiL7RqBa99Gww7j2c8Gn+y/K2DzaMAHifvZ5WC87vVanpUgexVUsj8dH+m2H4afyChk5uCI9uAmPKMGBG7KHSOh81iKikIHrrl99LWUKs8UDfOjjAJ/5WUlWoyysSDzEA/lboVGmefL1KtVkcKQ8R/y46LMqQgODKu5kBhMoX71NmfHJstSZisKvaVz0XRvmTQPV1MfEj3JC+b6IwfDP18QfWOPOBytt8IkvoHPF0ideoGebm1LXVmrIEiq7cFbWaRAqNT1LusdKvyaK9EdEA03NLj2GuQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEp3VkVINDBkbVViZnBsVXRwbUNjeDZYSmlGcXZqYTRvZU1UU1g4cldqZzln?=
 =?utf-8?B?YlNSVGlpTmpuV0xoS0FvUUNjemhlaXBFTVQ3MnVNblpsM2JaUk1oWmt0L1Vj?=
 =?utf-8?B?YVI3UUtQSEdpbklJUEFmdnE0Z2VvTTNkSjkvN3Z0QzFtQWxIVFU3NGxsYUsr?=
 =?utf-8?B?QStIb091L29Ucmt2WHFUbk8yQ2N3MURsWnozelZvNE41TmxuOE9XcTFnNUtv?=
 =?utf-8?B?WFE2VU02TTdEcEEwYzQrNFBTcFlkNFdmTkpuL1o5Si9CYUtHZkFacWYwSzV2?=
 =?utf-8?B?ZTBpT29TWUd4eWdPUWlwRmszZTV1eWxBcjIzT1NiMnlJRzNmMCtjU0NhWlRC?=
 =?utf-8?B?N2tmZmJsbk0rbUMyZDM0eEpjdUczblhZdVhza25pT21odXZoYmNnWU95bXVL?=
 =?utf-8?B?YXBrSzRRSmRhQm5vb0JYZjF5SmY5L2RYUmxvek4vVmNoSEZCYnQ2NEI5ZDUw?=
 =?utf-8?B?QmNLL1ZJZlh4WTNXSUZaUmpPMjd2KzNtZ0x1Z1ZiazBmTm1OQjREU2FZQUYr?=
 =?utf-8?B?OXo5TUZEemRFSjI4MU85M3Jqd2hlakdBOVRwbkYwaXgxSjBKSHA4QXNPQ3Qx?=
 =?utf-8?B?d3Uxd21pL21NNDdyTW9EaEZxZjk3bEVwVXRjZEN2cjBaaDVLR2RrK3I2Unc2?=
 =?utf-8?B?bWt2bjJhQVlQaDNYZ2JYeW1DOUVlM2FuK0NvV0dyZlB6N1Zkb0ROZ0hCOVdi?=
 =?utf-8?B?aEQxQ3dGOGpSV2RYL0FGNzl6Wk5rclNSQ0lSK0JWNWpGdmdpTXdGb3RPMkZp?=
 =?utf-8?B?dlNUZHVsRkV4ZFpVUWpQZGVrRjBDYU9ieE01eU01Yy9lUGpoZE9Beko3cjlV?=
 =?utf-8?B?bHBIbVZ5dTRxMDhrQnVLK2dUUjc5VUkyWUNtZjhZeHF5Q2tTOEFJVkdFb3pP?=
 =?utf-8?B?aG4zRWZjR3QxYkwrcmVZZ3VVa3E4LzNMK3JrRXVjOXJWRVNDQ016WDV4TGk2?=
 =?utf-8?B?ODR4NkZ5OUJ5cTVPUjRKK2p4eExickpZOEhIaExJbWorRGxiblk3a3l5Ymlm?=
 =?utf-8?B?K09VT1JhUGRqczZ0NjM0cGZlVWRVV3ZCVDl4Q1V2UzFJZGxQcFV3S0N6dWUz?=
 =?utf-8?B?WDdVblpsdTA0cFNnTjBHYUR5YW4rbktxclNoS3BvWXpZZERoc1lUdjYxZjNn?=
 =?utf-8?B?cVdJUXEvYlM4dWdhbGNFbkU1dElwT0RsQkFFQzgvYTh5c2VhUVowVjlXclhF?=
 =?utf-8?B?dW44dkxjNmY1VDEyYUxTbHJDMXNabG55Vk51d1hzQzlmWDdqSGhZWUtvL2ZO?=
 =?utf-8?B?MHpvVlY1MEo5N3d5UGhCcklaNGVlSkVGOW9zNmRzeEJOL0JPL0pKbndYQTZC?=
 =?utf-8?B?ZGxuSUhyZ2RyMVNzeWkwcm41TjNqcVBXTzJYelRvY1N1cEJtb3VBM0dXYldD?=
 =?utf-8?B?RmVJRzFtQlJWcTR5RG9Qb2o2SjhCbXlhZXJQUjdUVDc0ZVplQ1NBZzRwcVlv?=
 =?utf-8?B?SDNtN0JtbkU4enp2Rk44dVBwTFcyTmpWN2JDV0RhUFVIb3QzalFWY3UyZCtn?=
 =?utf-8?B?RWFDeG02T3NXK3Yxd21FbEVHNUkwVGZPZk90T3hxK2NETnc2d3lselVKT2hG?=
 =?utf-8?B?L0Qya2lhM2diOFN6Zi9CNHpIdng1elFSSEJqS1REdEpzMHpQa3BDNjNyR2d4?=
 =?utf-8?B?d2hkZDZidExLQzEvOHJtd3VTd2RtdHJhVWRwL0hraWt1OVVWSEVQSHNMNXdF?=
 =?utf-8?B?UUNNL1JPdEFxejcxMTlZSStXdithQTJFR3pCdW5uOWJrWjZsTUNqZHlTTWdZ?=
 =?utf-8?B?UTR6Z1ZIdHFyR3B4clRYYTZxVzc4QkE5dEF5RGxGL2h2OGZ3Smp2V1U2SGZv?=
 =?utf-8?B?amZVL0duakxyK0U4T0xIL2xEcitXa2lpdDlZamtwLzJoMmttZ0dZNXpvOUxn?=
 =?utf-8?B?bWI2UGNYbjRkVVFtWmJmYjA3U3hCbDdvNEdqdEk1TkN4MEtvR3NXOU5XK3ZP?=
 =?utf-8?B?cUJjZzRYOVc1Y1h5d1E2dkRtam5waWRjTjZKYXZTclp1WFNkdEorTGwzcmEz?=
 =?utf-8?B?ME5vZjIwb2R2T21TcTZwaHZPTUdHTEhUaFQwTjRpWU85T3dmeWhSU0lYc3E0?=
 =?utf-8?B?NC9xRlZHMkVCeWZDeVQzdjh0SEpHZmUvSi9CQmFGSmVJYllNbmFjMnRjRzhm?=
 =?utf-8?B?RXJVZ2VyREVxNldMc1AzdUFvdlJlV3FyT1pObGl2NjJNWlozei9qSHZFeEFP?=
 =?utf-8?B?b1l1Z2xza2k5bHF3cHhmSUlzM0RvWlorMCtKU2tvQmJWQU9LaHU4RUxqNHBi?=
 =?utf-8?B?QlJ3WnpnbUtpVzNKNDhFZWdzSGs5SlkrbVR6NDd5ZDFVdkVtMHhpeUloenIv?=
 =?utf-8?B?YWFxeFlsTEpZMTVjbjBwM005bXJwOHd2RjR1QW9zcFJ4Tzk5d3ZIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8B0EB61886CC040AABD200B0B3AF47B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PjNv++407pkhjbkidVCti4bOw2SkkY0WY5uQ3v7XWE9A3Y4DRG1D5a/A66mCZ6hYTwsSmiS38r1dMQfq8YlSqQMsgnEtrY6u2RW/5Qe4XrCIHsvW12i2syOno4UINh8+rShoOJtKEU+YiCw9Vtv4R5pd0aYDbt3mwUWmwK5lnRE13rcQdEcsPmuA6sNpD9g8EtLwKhYn5391t3sz3QAy/qCYgiXQDZNVmWRratXOcmVuOi1t9DNaa87CEIArCGGrNNA6deH010+veIKnC745Q8Pm1vKxDLUzdb/FX5AGtakY2c1Myf4UM177R/rPD+nycLZlqr+hvwlmeo/FqcrjlA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OlZu/pzjzNTXcOEQjtg0fzkY7Xyyo4SnQgrBEK+aljMh8eYghcnqIcWJ79nw/7odDVC3y5U4CWV5vDHhoCddvzQjkIA7NG5E/jExJCggb9kFDdGfhGFEkKph22Y1FA253LiyO897vQtEeGHmUGFfPQy2eU/OQq2eXepYkPUHIH9B1u8w9ji312Pp5afjtALNvLWMljrn36cs+7+ghsTx8brx8NWjTmHCBLWS6PHwSnlHFCJK1luAPVnNXmfKgA/Zscfme9TlzU7W3fI9MinB0Bxw2niZiVs+hFx9dPPVKnRsQFOZjeL0GVrz/l34Q3S9CCAfR0SHDK1/tLAhB65RS4VUmrOUlQcbqf7F1Zg2GSYHfv4ka6IkoN2JrvMCSZ0wD0hgZD6i+0WitkIaqGShfLceVURN5b+tOGdU2tXaOkggT87ZdI8EaizjYFv297WERoNnDm2yYpELGu9J0EqZtRtpXUxGuO8bIPCRIvyP7Pjjj11gw+e6VooGdgYDTG1HihpBPQL/LCjYFERAJOf6uzAHEoTRrJyxrj/NtXBDDD9AfUZ4xs36+hGErIarmC0bKHjmQIaZfH4Z48eT0L1rdxAdzfQ63AtKDiXtZ1FECBhqHZ8dAwBwtAzS5iZUIKwYgl0tr9SBJffRsD2hUVOxQw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcbdaf5-a7b9-4860-02cc-08def33fbc49
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 22:20:19.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyK+0rlhkNt/te6JihyNFKp7LW+84SkyK8AZIHIbXGTxWk2pGW7OnTTxNVJjBMBy4mZ0pkjxgciklxzhTubMnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999174
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4MyBTYWx0ZWRfX/tXDDtSYDorm
 brjp6s7GK5rnMJtbwBS2s55F5kH+8dU4t6cLJLAZWZ0/fGY7nJ2SG69VQFRfAmKc96+xEoygjXD
 lFsOZnZdm8Y+9UIj5QrPCeragfjXiNg=
X-Proofpoint-ORIG-GUID: SVeg1EHnjwhgHQRgpIp5EHiaFUtHM1-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4MyBTYWx0ZWRfXwgB5jnIYDHZp
 gbXr58Za5buQ2OtHdgzJhUdJMrWCbxRyCMYxL1MrYPvMMSug2EoObg4++xIpSD9/WHEhbUXP2XJ
 qIGgXSgRJhg8LnEtke1OO7/2di5qS0ijc+VSSHV/zq5sLl0yd2rvwIj3xXnQ5kX3/UcgfTL05GO
 kDdqIkUTmqDGDVBKO0PbOIqMWLWFIYn6voYTSDHCh8UJmWPZgi9EFZzXwpUM+sH5p5WIrH1odaV
 P/g3QtHJwsdoRV5UwHZ2XPywznsCavATWBssdMmZeGXE5KgcBI2vTmXcILp8xnu3gZ5b9iFg/Ao
 gLD8ow/4xYZl3eHsArJ9ZmyRitGixR1tTmEl1Vzm/sOixWiORH3V8zV1sllmxIZELHAUzlxCTJo
 LnQA9lFX3hdOKIQUGbhK8IIfkei6n6l5Gc/Eudf6XLJd5eDvM/5xUbEIQcRIotU7CXl1zOcJsG5
 uwaAEfgKutizon3NVkw==
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a73b72b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=qypj8v-q7zkW0I3EHYIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SVeg1EHnjwhgHQRgpIp5EHiaFUtHM1-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050183

T24gV2VkLCBBdWcgMDUsIDIwMjYsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gSGkgVGhp
bmgsDQo+IA0KPiBPbiBXZWQsIDUgQXVnIDIwMjYgYXQgMDI6NDgsIFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+ID4gT24gVHVlLCBKdWwgMjgsIDIwMjYs
IE1hcmVrIFZhc3V0IHdyb3RlOg0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXJjYXItZ2VuNS5jDQo+IA0KPiA+ID4gK3N0YXRpYyBpbnQgX19t
YXliZV91bnVzZWQgZHdjM19yY2FyX2dlbjVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
ID4NCj4gPiBBdm9pZCB1c2luZyBfX21heWJlX3VudXNlZC4gSWYgaXQncyBub3QgdXNlZCwgcmVt
b3ZlIGl0Lg0KPiANCj4gV2hldGhlciB0aGUgZnVuY3Rpb24gaXMgdXNlZCBvciBub3QgZGVwZW5k
cyBvbiBDT05GSUdfUE1fU0xFRVAgOy0pDQo+IA0KPiA+ID4gK3N0YXRpYyBERUZJTkVfUlVOVElN
RV9ERVZfUE1fT1BTKGR3YzNfcmNhcl9nZW41X3BtX29wcywNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkd2MzX3JjYXJfZ2VuNV9zdXNwZW5kLA0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGR3YzNfcmNhcl9nZW41X3Jlc3VtZSwgTlVMTCk7DQo+IA0K
PiBBcyBERUZJTkVfUlVOVElNRV9ERVZfUE1fT1BTKCkgdXNlcyBwbV9zbGVlcF9wdHIoKQ0KPiBp
bnRlcm5hbGx5LCB0aGUgX19tYXliZV91bnVzZWQgYW5ub3RhdGlvbnMgYWJvdmUgY2FuIGJlIHJl
bW92ZWQuDQo+IA0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGR3YzNfcmNhcl9nZW41X29mX21hdGNoW10gPSB7DQo+ID4gPiArICAgICB7IC5jb21wYXRp
YmxlID0gInJlbmVzYXMscmNhci1nZW41LXVzYiIgfSwNCj4gPiA+ICsgICAgIHsgLyogc2VudGlu
ZWwgKi8gfQ0KPiA+ID4gK307DQo+ID4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19y
Y2FyX2dlbjVfb2ZfbWF0Y2gpOw0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIGR3YzNfcmNhcl9nZW41X2RyaXZlciA9IHsNCj4gPiA+ICsgICAgIC5wcm9iZSAg
ICAgICAgICA9IGR3YzNfcmNhcl9nZW41X3Byb2JlLA0KPiA+ID4gKyAgICAgLmRyaXZlciAgICAg
ICAgID0gew0KPiA+ID4gKyAgICAgICAgICAgICAubmFtZSAgID0gInJlbmVzYXMtcmNhci1nZW41
LXVzYiIsDQo+ID4gPiArICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IGR3YzNfcmNhcl9n
ZW41X29mX21hdGNoLA0KPiA+ID4gKyAgICAgICAgICAgICAucG0gICAgID0gJmR3YzNfcmNhcl9n
ZW41X3BtX29wcywNCj4gDQo+IEJ1dCBhcyBTYXNoaWtvIHBvaW50ZWQgb3V0LCB0aGUgcG1fcHRy
KCkgaXMgbWlzc2luZyBoZXJlLg0KPiANCg0KUmlnaHQuIFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQu
DQoNCkJSLA0KVGhpbmg=
