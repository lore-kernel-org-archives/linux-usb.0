Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EAC3BD643;
	Fri, 26 Jun 2026 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782511687; cv=fail; b=JJhC+kFObTeaK7S9+wRHAD6IKpsQ++XIMBWYrkKCBMjqUZMy14tYbfcn3IQDmU1hUFE62EzPPqnjULCyIqFBgDGSiDXk8TBOh5KGyhgvIhCUrvNpFegyUFVupmNi8PpMEpk8WsiSqD80WIkR61e6WhGwp9QD5mtJaWK73NlOliM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782511687; c=relaxed/simple;
	bh=nlKult501L1z1hUbb+icRQobALMyX9zvcPGWWM44LR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gCJXzcoY5oqgOXT9lZ7wlmBao+rhcPodvc2y4kg3bLBhKebqgVfyTOCV3EadcBcCa4A8wX38Eeb/lSWRsKp/yaEJpNeODkA0SaOs47W3Vk0xcQcV6qBUBrSgp6wcbqFVd6n6BhxNgUhk5/rcBm3qwfolLAZiAM9IhHj1FdJxq0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U7KLCcl4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VNlAtDcs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vFcMia1a reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U7KLCcl4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VNlAtDcs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vFcMia1a"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QKhWhX1930484;
	Fri, 26 Jun 2026 15:07:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=nlKult501L1z1hUbb+icRQobALMyX9zvcPGWWM44LR4=; b=
	U7KLCcl4mOGnYI0q8Kh6sjxFJ4PRrhgTFa/xmPEhYZ5FFB3JiN6b+zQv+b6ek0sZ
	6Y3IWwyfFB461EbLb2XgbqoIqTIycgoK++jlABAOG4WURI6Ojea/X/wIB1caPTiC
	Fqf4NBCrx+aPvc7dyR6N4vPU/iqy/eM61GbdIg+wwY7EA/mEOLnb99m843pocJvL
	p2WhliZcRCLMEIlw5BkE5tp8Cs8gZ/CQgE50fHeS0PqYrEv7OmwyjAlPcRJGwQWJ
	jJIa/QHZqyo9usx3x9i+VKxGLzbMt9BPy1UWGaqcmAob613D7gvi5EieZPig2oYO
	Me6bIx8u8mTxHBsYAXHwUQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4f20qc8jak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 15:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782511668; bh=nlKult501L1z1hUbb+icRQobALMyX9zvcPGWWM44LR4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VNlAtDcssGK65ig0dnXe+XP1YVL3fO773lQfR1RkqLz3WbyIqfxUQ8+VI01Gpg9xd
	 chjGbISi55I+tdI52+NPqQZWbB7RBuLWpDf+9HWpNtyPAFCGJfevZb+ru4lqdhyAHA
	 17Rp+PHVR/UuP/W7KK3cQLBTshNQ3lLgQjGUaMrLzbuIk+CuV5zrXCmVLpIQ2qWKy6
	 VEIAsDRBs9sbAJD2u+Mb/O+d82+hcGpVAOWZIJBIpLVRIzOmaCM/SGigW6Ko4QINws
	 6NTBv998YOcB5Gsg16CnMVV2Skn9KL/NsFXIGQUV5erQmh0mgodDfjuyzha5RNLuIC
	 VRN77GdS/sakw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B3AA540125;
	Fri, 26 Jun 2026 22:07:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EC2F9A007A;
	Fri, 26 Jun 2026 22:07:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vFcMia1a;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00107.outbound.protection.outlook.com [40.93.13.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8ECF14011C;
	Fri, 26 Jun 2026 22:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqqjAPd1IJPv+C7tQd8sat+xDzBf+2sDvDxoqmzSpoVCUKaxwqeM0IH3BnD0IsB3pOJXFH1zE5R28VRxi7gndz9eI46oyHzAr8Y9v4W1pI2MWpufHUL0iE4cw0b7Gn6E+4X4N83M/TmULeeeSJjfdJ2XRrKp0qzxH0HF8KaZjrfvxY9hY40o9IGWyxoNWPd4XCnhUodwzeerXu0XWxVA6RSgSqxluJWxg/NJT/ZsR7ctIP/8FaP6U0kG26bvmWNr/7hztIkzJQeEN9T2XXT0PCyG3Mv7K2muxzR2zwyLeMutpPT/LDr4CvP0JQCTnJL+Nkj02UFQAz02/3huGvJNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlKult501L1z1hUbb+icRQobALMyX9zvcPGWWM44LR4=;
 b=MkyoCj/F5jSkR+G/JmYpgoU5VjfXMKrL6z4P7x34AqjxueCOpoz06V/tzkDlNsz0nzH8cbhARe42/ewMJsPrCZ57G5U9xBXL8nFstvUfqu6OMPODZFItQKPG/ithXC3UO5E7BqITMfonh0yzFYNZ6B9dIshhJfvwZ1xYlwH0RYxqalb1J8FOf9OZNy8n2vmO50mO7Lq4fyOaqr8n8+/hgeV/jG2KZ0m9Leoao4rvpeeEXYvyxw5okPr8AwhgzEWxB1M3f4Ir7pXxvsQROSCnPjuysDcM6hOknLJcG/tY8nXT4NnzzddaERmPPOsiplubk5Yv902qijcUARTKszEIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlKult501L1z1hUbb+icRQobALMyX9zvcPGWWM44LR4=;
 b=vFcMia1a/fXtJbmnagyUUzrSL9LYicIDg2vgpqI/V4aVoPJnMC4Rqc83g974ghhoFS1ObK+Ggfn0ncoBgjEQMt/SfehmYrO0VmtfzoTkOt9ATJE57LKblnYaSwqKg4Mugtl4PWNCY7Lud4vkoyroEltKNHUTg71tHgqY/LImS2U=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 22:07:35 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 22:07:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: st: Propagate reset deassert failures
Thread-Topic: [PATCH] usb: dwc3: st: Propagate reset deassert failures
Thread-Index: AQHdA55lv1c8W0tRNE+dggZ1pzGO9bZRaSOA
Date: Fri, 26 Jun 2026 22:07:35 +0000
Message-ID: <aj73tdMG7uEHoUBy@vbox>
References: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB6493:EE_
x-ms-office365-filtering-correlation-id: 9fcba0f4-e8de-4c81-c6f9-08ded3cf53f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7yxuJJCO4eOiV/odToJ350CjVINUvWb7AuFyVDjyHXLOjeCjcJBlKwvqHdwZ5e8ttOQjxdMb5ysE683Xp9Qv1JClVi6Z+hd59uWTHIZPc0cLreFqAuvSXQUnXmwZEgLi67Wse0cTMuttvdg3VAyM0ITDt6SZH2lmRu8cg22xfNAhv+m1kjiFaUuK3ITgxbMoJC0YgJM2pzEL16junOiYyZybVnPbDJf47WSQSGcPDyFx4NrT/LmKC8o+LgCBtRkaYt70aTepsPoHsLvOfAbNSxTdzvUrhaawR1YOnE++QaHiZGSwZkVvtyPAr3+Bd+baZShIr7rNSjzBOYKppYFeM6eFNk6zGkvZtpb/IFyxq0+iAcr2dRrlCYYIWVuIK2lRrDT5DVeaStkhhpQ1eXb/fLMUWtsT1U8I2QGtgbgJun3/dNzx2bynlelaqZ2t236lV22/HhA2vxvC/jz0OrjvhgjJtDtJ1NM36q/6qLpMHKrqHVw+mj05ghZ5VUD9Bnywdun1UXhuklptM6S69Qdt0zWfoHHOMqlSHtyk4h4NgdHDREhJnWWIKwpDkNUFipjUSMPEo9vN0sy0xI9vCMwz6ttnGgrXphwRjmvnqg6CQdmUGV0UyhJggeMU44NMbD+OwrMUKnDltmuA9jloiKoB3O282fE7RKMmpZw/aA0mGIWE9D9WyLVMeJKTjEqsNfBfwIVv5+eZVUKdpFMDNWWTWXSv7NeUWEzIG+8aUppZuMk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkZPZmpmRHVMWFBtQlFZbmFGSzVXNGlQZWR5Qy93SXJ2c0FQRXhvVXFkbXd4?=
 =?utf-8?B?SkF2Y1hyVWpDZ2pHaXNiblp5WitYYVlDQkJ1bG5zUGl3bWV4YVowZ2diN2I2?=
 =?utf-8?B?ZlJXeHBHQUV3cFdKL25xWExhSzI4VHYxL3NMaHVCbU5HMEpTMFpoT1d1Um95?=
 =?utf-8?B?L0pWVEZpUGluM09UbTZ3Zi9RS0NxV1o0OUdzaWlmaDlwT0pTYWhPRFdxenpN?=
 =?utf-8?B?eHdyRFVIcCs2U3lTZHlBQVAyVlRxNnhKUEdQbnNON28yb0wyR3ZPYTNuaHBr?=
 =?utf-8?B?Tk5qcGhtTHgxNFNaanUwTU1MWTNMK2o5TWcreDNHMkVzUTU5SzgzSUdBL0s2?=
 =?utf-8?B?OW9YdXpsdjRoeUZzUUlYallZWVhZZnpkVHpHUjMvMDNXbWlNRkIzSDBJVmM5?=
 =?utf-8?B?SGkyeDEzeUYyT3dyR1dYRFRWS0Qyd1A4NzU1WitnVHFmZFlpWkphT0d4Tzdq?=
 =?utf-8?B?U3RnR3pqRUJrY25sUEU5dzFnbytlWWpveHMzOXdXbGxkdncvcjExMTdzM1V1?=
 =?utf-8?B?RjJHVDBKOGlPczJEZWdSQngrWGlUN3Uzamt0WVY2cHFZMWxEN1ZsdjN3MkJz?=
 =?utf-8?B?cURnank1QXc3eTFCQVZuYnRLRVFvUUdXM2ZZME5rZkRDZFFDK1dITUN0S1FO?=
 =?utf-8?B?V0N0cCtJMFBxMDJMSm1KeFA4YnFYVVRGYnczYytGa1NDZWtSeExMN2dlWkZU?=
 =?utf-8?B?RDVrUGMyY0l2OXBsMkUvUStPOHZSMyt1ZXREdU5nUExhdmhoQUVuQVFTY2lo?=
 =?utf-8?B?SEg0eDRqTTB6NHZyNWNoOVNkVXVCTVpYV0RIeWNzMnptR1Z5R0R0cXZvY0Fi?=
 =?utf-8?B?eHc0V08xbmNmRXRNWlpzVWFvU0Y4NnNYc1JUMVRwZi9IQ0FCVThQRFYyQXNT?=
 =?utf-8?B?WDk1TDhRY1NXTFVlMERRc01DU1h2bWN5Y01jSlZIQVMwKzFjQlB3TkJtV21t?=
 =?utf-8?B?alJyRE1WYkpGQlluV0RuaXdhaDRlSVFQbHBJdEhYL2RPMFBTUncwY2JLSVJv?=
 =?utf-8?B?Sk5zZnhxZWpEdkViQ1JsK3J1aWlkWDlVY3BWbE5ZTXhZWmxaLzRHdzdJVlo5?=
 =?utf-8?B?VFdCTVNwRWxPdTdlVTl1bHNIWnRRVzNrMmloUzJCckJ2UkU2YjlQaXpXQ295?=
 =?utf-8?B?U1ZBNjNCU3NvYlNudkpORzk3UHREaWhIdVFVVmtNb3I5dkRqcEtZQktUeTRO?=
 =?utf-8?B?aFJZU0JGSzNFTzdxMjBjUVZmdUt1T2JIbjJHYzQrdDV3V1RXV2ZTdmpOWTVz?=
 =?utf-8?B?NU5YODE0TWN3OUZVVzlFRlo5VnNwK0p6OHp2aFJjWWJ1NjJ6cnVubjNEUmRk?=
 =?utf-8?B?a3ZPSk8yeGVhWHM5MHdSbE0vKzEwNGdZRzNvbVZkOWkwQlh5eXhzUGxXcXVN?=
 =?utf-8?B?MzYrNDBnNDRKcWg3WWNtTlpjR0t3NGFabDRtMmR0Yktabm4wTFVVNTd5WmxP?=
 =?utf-8?B?K2t5b1g3cmNUcjRQalNJWk9HQngyWWhBdUl5Q25TSHQyQVcvQzBMRk9FcC9y?=
 =?utf-8?B?eWVEOGVCVUlQRFI0Rm5XS2hYSVdQRnRQSWhWZWlady8wVTRLMmI2VnJJSEZN?=
 =?utf-8?B?RW5FeFpkcGVJMGZJQjFtWEorQThpL1psL3E4bjY0QWs2NXVjMi9wVzV4b0pI?=
 =?utf-8?B?dVIxaTBybUFNbkJObDhZM0xBQ05sZkNMTnhYd1pDUk5Gb3Q3ME9tOFVrd0dD?=
 =?utf-8?B?Ky9WKzRaZFlzWGxhemZtem5udzZRNHhmWW1CRVFjNVMyOUFkNWNZczlEb3p3?=
 =?utf-8?B?L0ErM041c3hCMVJnTkczSVgwNDlacmtsR1paVmVGeHZ2ek03eUUrM3RndkZS?=
 =?utf-8?B?c3FDYmsxSzFNVzdaT2EvaW9KZzBsdUV5a0FnaWI2cTFHUzdtS3VlRFE2SjN5?=
 =?utf-8?B?clFJQkFpOXVlNzlzVjU5S05JdmpnckdxSUwzZndCckI0MFFObFhTWkFJL0d6?=
 =?utf-8?B?Z3J3WVFoNzhVci9QejU0QzR2THlseWpZUTkxcDl5cEV2RWVPdG9jQ2Y4M2dP?=
 =?utf-8?B?SDVlcmdRbnFQOGU4RjlkL1FiLy9kbnpYYlk4Qy9DWlY5dC8vVUsxTkJMQUlD?=
 =?utf-8?B?SWVMYTVZVmcrMmMyNEVacFZ2WTkzbkNhbTFDNlNTUmhoSjNaMDhQek5KeW4y?=
 =?utf-8?B?cDZtYUJvUGVuaG5rTG9VTzlwSDBLWUM0Y3I5OVVvN2NGRGJZMjNNN1JPN2VT?=
 =?utf-8?B?YW42Z281VkFjZUV5L05XU1piZk10QXNtM01KNjZxdlI4cmsvYjJMcmxRZ1JO?=
 =?utf-8?B?dExFV0R6Uy9LWmltUWFJMnZXOWlhMlRVa0djVFVVQkE3YUdIb3BmNDNBTlVr?=
 =?utf-8?B?akFYRWUwQmRFM2JHMk5MSHhqeEYrZ3M5aHFhRTlZeklQZ2cxb2Mxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BB3896D22B3A9499836CDB7887ADB58@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CUfIRmmkTFaiC+gt/+IMxTZ1D2Cc7nWNUUPl/RB4T7u6s8dRcmh4NrJNN8nQIY0kjfwuyB8532A/eDMqubfvDImZQ9evFTWzjrXg9pJk1Yx2Cmpja8Q33HkAoaFDEPg8NMLQl6NG9dUgSAUJXBEuss8ZltwXFR/Te+J5B/LzfSJ8GMrpzu+qC2S8i53qwPizYdbPitQ99gMI9ZuWnUWfU8ZpNtDkuuSF2QGTTmtUfec+cuhx5patOQH4m8Y4VicR1qdPhR/GdWOrjF/0Eg7SWktbs4+/TpjlcIFXpCl3l6juO20N9rBsgDB1cV1KKyQ9zVtlQQeKYpWQlY00/yTYEQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0vgoG41L6qQQOBoB3inFmJDM/nnPLeDZjWfdiqUUtICx7TbImDaXSSHEyJj2DYG4AEtggLrMF0GWROlxH9ojNJ7yJruh2Hhi5ZUzAdixnPi7qtAD4jdfWsUGLnYi5lnhNf8XFy9+hwkQiXN3PjRQ8izENBEWSKRRtaFafNUraOL0W/AqUMlvnwRv5O4UrY533lv5TT1ndyz6RVbC9tWqquFUjmuN1gfqONRvoq+egoouo2SCtoQovf/qKWjy1ps6xFU/7PufHWhLLRTu/UXcPi6cPCAReZZtVbQtPUBeWiCfVjVbS0v273qUcScZvjkE9VlRlwX+pyfbBBGXMQt8oZkaF6clzafpJG9xARF7MIyrWbwRynriUAUg253pUBCH5LXCVdp0p7hgb2iML4FfLwOMHPPyCiF7aQrVy2efHfdihgsfvFZnjryQo/VJqHTMLfMhR1wndXgXqbnvAmRCE83Pyjx7lCKuN1RgEGLX9RNTwxikBxvpGiKGUKGbLdA5H8+/w6L25XLagAAlZwmwNenWbus1KEg56Ho7oYvQNE3fYNxRPJI8y/HrGLbM+nAdW1WzQ/mH99MNy7o902Dfv5VBfagv34ZO4IZ8UZYOzfuuT1mKZVV44lUI6EWJhV+JIPesQwHBpNdmoBIfMvGjfw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcba0f4-e8de-4c81-c6f9-08ded3cf53f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 22:07:35.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYGBr1g2Zy/zFBOx15RZcBLV1+X+xYEEb7ncFtejYje86MGqOVswFXj3Joi8Lk6QNwEhQM8HuIwt0IhVd59O7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493
X-Proofpoint-ORIG-GUID: 0ayNV1wsCADqvZNPxhFAC8Hc439dEodr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4NCBTYWx0ZWRfX+q6uyQwjB+dS
 qauwEbDiXRiq2dpvW+YZYc54CRaoblV+8V61bW3l5Ra3nvt+s6EsYyUyiuXGn25S2wz769FEajm
 ErUcz76lxatezEJdNqRppuyGQOugIRkQzWcphdbqde4NV0mUZbvYocO6tG5rlWDkcGhGFtqfwyy
 jmfRFL234jQe04MnyZLQepvjnGTvemM78Issi2E74jwfrcEUNVUBit8pcj/YH2hm8ABY7jTb0Ma
 gyi0V/sFEyWupdPtI9GrHunxMvV2Wb3Pt5cx+tnvsEj9fJ3RVSrLKavX/24V5pYQq3+NJdeJcfI
 sQr45rwI/kIBJSyAMwDtGGxcoI5hjLMg9iDle4JZB+LlLhaW4zTtl3NfKtnUVyX7918x30lJ6vO
 MA1DCZ2cqV+msqHU//Yda9E69MmVVApouWsgs78hwS3dW4v/0c/V3Fod9B9XeqFVH7PDltevW9l
 I+XXrJvQMh5koF7jV3g==
X-Authority-Analysis: v=2.4 cv=bo18wkai c=1 sm=1 tr=0 ts=6a3ef835 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=QPOMwdtYFG5MZfDgLBoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4NCBTYWx0ZWRfX093+1WzuL1HM
 2i083c8UaROkQKuOSPYZVu5CYzyvLUDT0WwnCAz6k47mjiRFmoy+ZULYyhWJsiCBnYrk1+dM278
 57ch3106AjIfM4FeVEgwSK+J2rNSiUE=
X-Proofpoint-GUID: 0ayNV1wsCADqvZNPxhFAC8Hc439dEodr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260184

T24gV2VkLCBKdW4gMjQsIDIwMjYsIFBlbmdwZW5nIEhvdSB3cm90ZToNCj4gVGhlIFNUIERXQzMg
Z2x1ZSBkcml2ZXIgdHJlYXRzIHRoZSBwb3dlcmRvd24gYW5kIHNvZnRyZXNldCByZXNldA0KPiBj
b250cm9scyBhcyByZXF1aXJlZCByZXNvdXJjZXMsIGJ1dCBpZ25vcmVzIHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoKQ0KPiBmYWlsdXJlcyBiZWZvcmUgcG9wdWxhdGluZyB0aGUgY2hpbGQgRFdDMyBk
ZXZpY2UuICBSZXN1bWUgaWdub3JlcyB0aGUNCj4gc2FtZSBmYWlsdXJlcyBiZWZvcmUgcmV0dXJu
aW5nIHN1Y2Nlc3MuDQo+IA0KPiBDaGVjayB0aGUgZGVhc3NlcnQgb3BlcmF0aW9ucyBhbmQgdW53
aW5kIHRoZSBhbHJlYWR5IGRlYXNzZXJ0ZWQNCj4gcG93ZXJkb3duIHJlc2V0IGlmIHNvZnRyZXNl
dCBkZWFzc2VydGlvbiBmYWlscy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8
cGVuZ3BlbmdAaXNjYXMuYWMuY24+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0
LmMgfCAxOSArKysrKysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtc3QuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jDQo+IGluZGV4IDVkNTEz
ZGVjYWFjZC4uYmJhYmZkOTMzNzk4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtc3QuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYw0KPiBAQCAtMjQyLDcg
KzI0Miw5IEBAIHN0YXRpYyBpbnQgc3RfZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgCQkJCSAgICAgImNvdWxkIG5vdCBnZXQgcG93ZXIgY29udHJvbGxlclxuIik7
DQo+ICANCj4gIAkvKiBNYW5hZ2UgUG93ZXJEb3duICovDQo+IC0JcmVzZXRfY29udHJvbF9kZWFz
c2VydChkd2MzX2RhdGEtPnJzdGNfcHdyZG4pOw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVh
c3NlcnQoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4g
cmV0Ow0KPiAgDQo+ICAJZHdjM19kYXRhLT5yc3RjX3JzdCA9DQo+ICAJCWRldm1fcmVzZXRfY29u
dHJvbF9nZXRfc2hhcmVkKGRldiwgInNvZnRyZXNldCIpOw0KPiBAQCAtMjUzLDcgKzI1NSw5IEBA
IHN0YXRpYyBpbnQgc3RfZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCX0NCj4gIA0KPiAgCS8qIE1hbmFnZSBTb2Z0UmVzZXQgKi8NCj4gLQlyZXNldF9jb250cm9s
X2RlYXNzZXJ0KGR3YzNfZGF0YS0+cnN0Y19yc3QpOw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoZHdjM19kYXRhLT5yc3RjX3JzdCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byB1
bmRvX3Bvd2VyZG93bjsNCg0KVGhpcyBzaG91bGQgZ290byB1bmRvX3NvZnRyZXNldCBpbnN0ZWFk
IG9mIHVuZG9fcG93ZXJkb3duLg0KDQpCUiwNClRoaW5o
