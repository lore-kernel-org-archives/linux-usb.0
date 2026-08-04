Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFFF40D562;
	Tue,  4 Aug 2026 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882448; cv=fail; b=noo8abQkEriw3+A61LIf8+KXrvExezM5emnOpk2FfIxphEGQNblwVW3YyKgYNvU9Lj2pbw7ERdYqOfTQxZEUODbvx5ls+C9iYm8KgYQJtBLovIZcWSlocxcn6pSH1cdG7AgdtovyluQP6t1i3VWzlEeN1w3a2inwXylNMT1Mvh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882448; c=relaxed/simple;
	bh=Tq+UTXxaWzL/m4Xq2zmsedkaO/ItFJ3JozSIFN8Y2lM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MMkkpmyOtf+qG/LLGmo/CaYMlESDPxWncDUKg0ZXi7CxTwpqVk+ySk+BdiVxhEO12UFg/PjfQ54WR9gYB7c6iRhFLg9YvhAvWrCyVe0hMUuGJCuv4kCWjNliTpmA58iocBF09wqTB+JGDmtOJOEZSUVZ4O9gj+uFlrH0Ab4jcXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WTnsuu5W; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AJ/b3mou; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YSHMETqo reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WTnsuu5W";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AJ/b3mou";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YSHMETqo"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpbwD1702331;
	Tue, 4 Aug 2026 14:29:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Tq+UTXxaWzL/m4Xq2zmsedkaO/ItFJ3JozSIFN8Y2lM=; b=
	WTnsuu5Wj/w84tZhq/GL3GtYznyTpB//zFko3GruzntbO4RLPnTOjf6VfLHzJHC/
	b7OOG3yD9FJB/CeHI5LBdNeZdP4KjhvRxQJR+gyNhY2PerElF/W+EwRyb+PIZgxN
	aYRH95A0PhWTbXWujOgwewnHvs1LcV0vQF7b5vPfKFIdjZtm/057oD1DeRNuHmw2
	QWVsC5nOBtv87XWXqjuACAg0B7XLGydaXmRvIm0zlsTUw/34olRLhEgGhvTXxf7I
	nfDsm0zLJxrP/zgDqWfRtSYM5DNU9igl92AeVX3msYpJazsVkQbetYZwo2eFpavb
	OMTegLW0BVBl2nEOM79gKw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fug0k4x91-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785878964; bh=Tq+UTXxaWzL/m4Xq2zmsedkaO/ItFJ3JozSIFN8Y2lM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AJ/b3mouzuhT2tMXCCFFER9JI1pWn0tbTOQZV4YppRE3RZAU4fjgXvLgKvHoCOmwi
	 kD1S6jkSl0na5m9IPycivB8MmKqrSJQuCkW8PmLe9OhR3/hHXM+V2WWSKpqE5kupLJ
	 e1KIsktWo6ZbXCXpNtBKfD1WR0On/5z+9Z1vAu8S/Je5qiecTmPJKvFbeWKg3Gatsi
	 usSQdOKZigBTOSH7J3wtQTCjCE/FgXs5YGLNE7CTUAoZJsxGzh/ajIjHJqnBEbDoAt
	 XB38kOC6I9x7pNErJ/KjKtzsBJC7ZnR8Muz0Ama9uxYu2n1zb0odyeVfz9CrrplZMq
	 0jBQR/ObYHYLg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F8BB40515;
	Tue,  4 Aug 2026 21:29:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F2FA9A00B1;
	Tue,  4 Aug 2026 21:29:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YSHMETqo;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F2B0940212;
	Tue,  4 Aug 2026 21:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqAvn6EyD22gT+S7R2wmavgeCwHHOXpHE/GdGW+VbqL2FpkSyxbExQiDhmLm+EyNEUsQ3XuI2spVl1WxOHU/NITzW917AypgkZfOkE8t02diU8utThg2KU0tzsQBS8AI212n4XwycEbBGVNvNVMYYEwxhaFWLJME0fJGtKaJb1Nz33vnkKBSdxYRQzdzf9Tc4f7XW+in9gMEFQRNVfS0Fir8v7RFGsGgkh6Ox2ICWMED5gV6QBorDneofLfGU3bF04gMFtuzgc3+Ee6HlF1eZj2BBs5UM/Iw7mXC5zBW3SYeGdVPRleXroEmeT99jzsLtLJ3e9lAd7ZH1ZB5f0B3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq+UTXxaWzL/m4Xq2zmsedkaO/ItFJ3JozSIFN8Y2lM=;
 b=RyhTpzBsLRrIMWMLAnsglG1ggGTEprXrsUGvI24Efw7U3ORZ/AUOUy0SoqM5hEm1WKytMjSZmk8Cn3j7NTHwTqqqUURtOQ18kETRiEMbSHI8xXV/l1cy0wtHMF1yctxvJ82iCoLbU8huPtgZdKuvXTOYhVQIMWVUFbqXnAT54xRuxES2NmjBJE4lo03QWeRZMl5UZPamegPPKwc87ZbHSV6b6BgpPq17RyUWACuLth53/t6yW4YHGTqTi35NxZ42cp9/0VY+Z805KuqmPwM/mnNnbVhKNISWGt3Drb643uNoluBenaaprR6AyHPFNfxsvEUZCJfaJCpaJeIXUeN+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq+UTXxaWzL/m4Xq2zmsedkaO/ItFJ3JozSIFN8Y2lM=;
 b=YSHMETqoY9umphZvz07wpy1oqbfbpVIdswsRrkk8rbf6pwoGDmuFfEPKcb9gJG8mPNniTbqb4XOQpjFT8XJbOGZH8C+ZOSWhDUw513Na/y3KSxcKNqw+Sr+Lt7bIuFhM4ALStNyZ0JocdvXPTDn70nBcGfK2H+FIakU8S+3cDMY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 21:29:16 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 21:29:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Topic: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Index: AQHdFFWc4ADUIzvtDEWex/edOcuJsLZ6MfCAgAiAFYCAC9XogA==
Date: Tue, 4 Aug 2026 21:29:16 +0000
Message-ID: <anJZGqGeCt_bBD25@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <amFCwDiD-StHHV9c@vbox>
 <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
In-Reply-To: <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6787:EE_
x-ms-office365-filtering-correlation-id: b583ddc3-64eb-41a9-a32b-08def26f6faf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 hPxvX38EGNuh6on+D6LBhlRxZe01L9ZWBNVpoBMl5YpGUq3n8TAZhHhrJR8JnaBq/qpBj/1LlzJh3rTpIL8VHNoGnq0P0mEm/TviabnnC27Mq+n4jZu/plCKqekH7yS9ODBljunlmbL3VYYM3Y8uS7zX/4lngMeITLF0CECRGglsF8AFgQX+UK6JxpaYqxvpp+/jI3VJtqWoHcWQIjruNM1mgZ/PzfCF5VnmhFvvriWs5rRqXw3VrgfQbM9sRrmaJgJOaR/a5RPSOU+vd25QkOurYBijt5xf3NMw435ZcjnAx8Hx6EiXXVC/ZSzIpMnnN5wrZI2WP54/FcWD7z0czcF/gadggxqCRhIB3pbNGzb7FK4csWuPUnQu0TCM5jJR+Pa/M6nJJC43KK2uinWPRZ3axv+GEg88U3OuoYRLr34vKVFXh2EvVJnDYQk5U2/U+QwoIddFOxEdGC/5+H9s4JcaYZqXm0FqFLd8qCSmyiai/wCJuz3wE16HJmpdNGCYnZuZlihDMVKxAgB4jKEFqmlst8JrRdJBzQj/Olw4EX+csP0e3crFXxo/xXfwkyEuxbms9mydCkFTb96871YCn49gUIFb1V7+UkdNEEBZc/ed0VL70GnhgzjJire6JvLhG9/E+e1egtcoYcv9kRbleNGk/nZdwSUBDUdbsGtl4GDfYnSLTjRd/07UbDD8ylFSavuf/6pxUVgrkGEtcmi+CEx4xNQw8FIkRz9+amuC+sQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmJCM0ZsUGJvbEZnL1VLTTA3MkhncnpjUXFjQTZ4V2lxU2V2QW9QbVgxVUMx?=
 =?utf-8?B?TDlDeTBhd1VXSkVIR0VpN0FWc0JhT2RlWTVUMHVDNWp1SmFHdGFmNEU2VWR6?=
 =?utf-8?B?Q1RFdlFEcDVsd2ptQ1BvWkZjeHZPc0hTSWVRc1kzMENQZ1NUdEF1aTBTa3ZB?=
 =?utf-8?B?SGNPdlpRaE9JRlFjdXY4YVhZaFpXZ0RWa3lzUDFyRm5WZ2pxc2phV01ycDJh?=
 =?utf-8?B?VUVoaFRJWXFOYVVJd1BybHU2cm5iSDF2Wkg2NGhKQnVIR0lKbEVYcFZNYUh5?=
 =?utf-8?B?U090ZzRWZWxGbTNmR0xuTm9JUDZuejAvVWtRcXEyK0JzdzFHOUhrZStnTWlv?=
 =?utf-8?B?QzhzeTgrMkl6b1VYVFc1NFBqU3FHS2dlclk5RFRYb0U3eVYxWk82UUZrMTRI?=
 =?utf-8?B?bHBwQk0zNFhHQ1NrWTV4YTdXNytqd2N1MHF5d0VQaUNPVEFLRTVKQWNJS1J0?=
 =?utf-8?B?aS9GYU5vVjJnVUplbVVORTlmNDVpUTVjdy9xM2U4V0VIajh3S1g1V1pOdHo2?=
 =?utf-8?B?S1Q5azZhU3g3dCtobzNEM2ZGOW03MzQ5bWxkZVdwS085UnJGVHVpQnQ3bXBC?=
 =?utf-8?B?TjlOaTQwbUVUeEt0SXlJem9LSmVBQ0xZMWc2eTFzZ3hRd1ZRMjFkOEpjYkY2?=
 =?utf-8?B?QTlSd1d5Wk12S2QzcXFqeG5GOGN5ck1ITkFtY2lWT0RoVERQWC9weFFoY3ZD?=
 =?utf-8?B?MUxpYjREZGVqOVlpS01UcWtkdnFtQ01SRHVJbXQyUHJLdy92NmljNE1QOVpF?=
 =?utf-8?B?T2QxMEVSeE5odjh4YW1NdEo2cDcyTTk0eGhmTFk3MUpocnhJNGFNVnRFM1RH?=
 =?utf-8?B?MGo2UkhMSlJjK1dzQUZUaUUxcEloRi92YWRVa1BFQ2NleGhPeStzV0VlUEEy?=
 =?utf-8?B?cng2WjhJbEJ1eCtFb2k4SFA3cDFBdE51aGpUSzlQU042TVZOVk9JV1VQcEtz?=
 =?utf-8?B?OWtrNHpFSUxuaTlJcXdrZDJCSFJhMWpxWStSckFsSDZmd2VFOGRNRU1LZWt6?=
 =?utf-8?B?U2JKa1g4bW94V00yNEtONVdVYWs5L2FUTVd4UENIS284YmdLZHJndmZOTU02?=
 =?utf-8?B?ZjY0c254ZUh5TFFwb3psRWdxdWdBZmFoUmRTdU85N2M2bVUxbUpjbTNUSWRS?=
 =?utf-8?B?cGxnS0xtdmJrekR2b2FUSDZ5S3JFUVFZcldVL3VQWTZMMUxKbEZpaUVXdEE0?=
 =?utf-8?B?VWVkTXJaOXIvWVV0UjZUTE8rOEduTGZvYnF5VHRrQW5DRzhQaU14Z3FnTXor?=
 =?utf-8?B?TFN0VHhKS25lbG5jb1lXNGNua2FwanNkSkNZa2tHZ05ZTWVyOXVGTjB2WWJC?=
 =?utf-8?B?QjlOcTZ0cGRKeXhyWlJ2S0MyYkpqcXFyUXFSSHp1M1hEd0ExR25RN3c2NWZI?=
 =?utf-8?B?elBINTdWTE5jRTNHQ09Jc1d4Vk05QW1IejZXUG1UR0JvektXUWV4d0drQXNS?=
 =?utf-8?B?cmlrdk8wYmFWVDRDOG41Z2JLQktqUUs2TmRxODluNWJCcDU4bzhNOThxNnp6?=
 =?utf-8?B?cHNRQ085Vnc3REJidXRzWVJ4dWJkWlZ2VG1admNKU2MrL2NYbUJDcFplbVNp?=
 =?utf-8?B?NkhNbVVBbTRRSGI1cnQ5TWNXU1NTQ2d5ME80SVQvTVRpNGovNnFXRWxOSGpJ?=
 =?utf-8?B?SitSSlZFL3lyTnkxVm9qMmZ0SlV1V1Y3dnpWQ1ZiQ0dFTmttd04yeUdJNFRG?=
 =?utf-8?B?ODZoVjlqZlYydlFrTmEydjZpS1NpR01heFcvZnZYVVVpcm52cmxrTXhVS2FI?=
 =?utf-8?B?YzljTmEvZXN5cDh6YnZqb1V1dkFrcnJ4ZXRtV2YzNTQxVEVJdDlmK2ZpcWd0?=
 =?utf-8?B?TVBhZXdYQTBjemdLTzY1K2RTNGpLS0V6STI4akxLTUVKMXFWd015ZGFCUFkz?=
 =?utf-8?B?SE5pNzl2WXV4UHc5MXpVb0d1Mk84elRBTTJrZUFWMUY4clMzTkhjZVZXV0FK?=
 =?utf-8?B?RkIyWkMzd0hpZXlaSkI0aTJMQ256Z25CODV6VXdrTVRKQXhoOWxQenJKYVlk?=
 =?utf-8?B?TjQzWEYvaEQ2ZS9JSGhORTNsamdFNGFkT25sUFZMS09LdStWaWFSSzdOYTZW?=
 =?utf-8?B?aXBzMGJabjhWL2MrR1lqTk5QYTBsbGplS2hIb2NCcGVJNG1CRmF6SHUrRmNM?=
 =?utf-8?B?MXFBQk9DQVhwYmQyOFpGQVN0Y3l4c0hKSnhXckFjWTBmS2pTS1RqK2RWWUg3?=
 =?utf-8?B?R2hMWVByRGpaMjVqN25aUlZhVWpQZU9QdXZQSEhrVEFwUHhocUkvVVVWdVB0?=
 =?utf-8?B?VDBFMHpVT0lyS3lmV3RheFhOVjA1VnZMeU1mL0VpbFJobUFWUnQrZmh0WVNa?=
 =?utf-8?B?aVpoQmV1OVpENHNiNWQwdlQ2UTNvWTVLbzlOZG0zMFVCb0tnc0Evdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08FE8D700D11D1409B4FB7E5D64C9A87@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	hIyIIYnLq8ckB3z3tKtmXeOE0k2Ke09bgecB8vYlPp4UX51ZTvFvGp121SiW7SAxs94ErXmxSTslYVn93djiLblACbGqXpT39/ZVUSiQuYbxDirkRUA17oHoWETsM8z526XjFSzYaU53YW57mdSNytBzOrupGgmGVWcCzfdPEnSihogakVqPY6kkx8X/fBhz5fPC0cGiS1MGv+ZWlFBN3NbacIGCZZD/ongabDfnDscUHODT8BpbnOOe82o3D8vD4DWG8u2lI7qavivc/0bA4cRhUAIDsMXqZf4AJ0w9WX6PySNbNGP1r94enA+qFWjhN873bpOxIlANnIbZWvzDpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oBMuWj3K7Lj7WSZuiRakQRvQB4A1+dWuBtRLs+wGwT2zTdkHYnqwnJawXG75EKJYG0rQk7Wc/NAB/iXcVnDLLCsiNljjekqc8xB906lAhX9qF0NZSBRUFzz2xR1hV59b+ZIncTpP1sN/3+axe+HxUpD6kAhO5inZ1BgrZaMBiKZ3uGPpK6gmoK8hCNIJFjTNVdQFFTFBcWos6K+4XZGdHeqCJhldwUZK7UYMi9hMsBZ6ZkWh+fxNtqueojmd51FXVDU67KEGmdVa/967fXlnE90sL9hwD/Dwixt4O5DWoJmG+2bzlHgsESkf7cmw29etj1/F8kCa2f6PRBIuEUp0Ox93x/rZkTEVhhtLDac7Wb01ywGG05KOlz+09Jp5BZrt54Uwxi9MIHikQUqjC1dMQVCZ6qjoIjypIRL5qhfImJUbd8P3TYpxacmizg4yZ1UUyo3pl77F8nMzPsvSYFT8ZxeSH7TE1cqYELKZf3P1kC84af+5vDCsKLUD8/hI6DlVgwI28Da8p8/jhaZWm2XflwqPArmO23b0y4vt1WGqLmUxGcP0xfvOueF+GTB0zgMgaomdKiBqI7ZQhohRe/3m6HwErgu3L9XAG27bYvX2S9EaY/3AgN/uSET3dprwEfaXmRDhWGplxn1E2ZVSCjTrAQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b583ddc3-64eb-41a9-a32b-08def26f6faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 21:29:16.2013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: koExvK6SMKFFf1BkcdqyUWsf1Jj6tvVOAezl9oLkT02yBmb/cvUsyZDBkZYoTh3WhAJv2MllhTi8EFngMVrqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3NCBTYWx0ZWRfXw4PUZhUJpKie
 ov7qSAN2awynM6SPNPY/ttshBXOwBZupMiZs1oscvTjYUBtAIMrgSxUmZ3UfMtfkM9z4exNh0Su
 GSyWw7zLR/M9dU9ROss1oi1hBBN7b5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3NCBTYWx0ZWRfXwGog4/rPlkkM
 l8N68eKnoMojWBktuHK4FsZPF4HK0/8Hc0709lkxMYSosVbXIlHwR0djLAsAS67M2gDsn5DOxUC
 X7OhkQ2uNgYgcazXTuss019ozoFKNv6LEVn8dJY7vSzZEFP5uipYM8PxZNQ/xPStbDKq62ovnJi
 gVPu+pTKabuAoTsQknWsVkbmFrepJvceY+CiNUsSHo7hs6bEYicLt/V7IeQ6IQsm6CtiWpqxus4
 cqVoUE/bTj9mPhLPY8O3VVH7QBNlytVhA0eOIXGt9WSNX7ruQf0FTU+dCDXf4P0X5drMyxnVJQL
 9RgvWUvTCJAFK6prVlAT18MRy8atAzXuAloAzppXV01WD2KuYbBrpj4Zw+66Xd+JUoFIWxQg88J
 4Yw5M+G3RLf+iQSZrpNUbTSR4rQ+G+ywuHWBOe7ha7JSIEYlTR3yICSGCfl3Dna3c3obOlYHyZf
 EpuPAZeQdbnK6EDc5eg==
X-Authority-Analysis: v=2.4 cv=DtdmPm/+ c=1 sm=1 tr=0 ts=6a7259b6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=-7qL_bpV0U9CnoKd7bkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 44H4isWxnb-1yU28z7Vrt-B0MUSgFZB4
X-Proofpoint-GUID: 44H4isWxnb-1yU28z7Vrt-B0MUSgFZB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040174

T24gVHVlLCBKdWwgMjgsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDcvMjMvMjYg
MTI6NTcgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBXZWQsIEp1bCAxNSwgMjAyNiwg
S29ucmFkIER5YmNpbyB3cm90ZToNCj4gPj4gRnJvbTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5
YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiA+Pg0KPiA+PiBDdXJyZW50bHksIHRoZSBvbmx5IHdh
eSBmb3IgdGhlIFVTQiBjb3JlIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBsaW5rDQo+ID4+IGlz
IG5hdGl2ZSBvciB0dW5uZWxlZCBpcyB2aWEgYW4gSW50ZWwgdmVuZG9yLXNwZWNpZmljIEV4dGVu
ZGVkDQo+ID4+IENhcGFiaWxpdHkuDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4gLQkvKiBEb24ndCB0
cnkgYW5kIHByb2JlIHRoaXMgY2FwYWJpbGl0eSBmb3Igbm9uLUludGVsIGhvc3RzICovDQo+ID4+
ICsJLyogUHJlZmVyIHRoZSBYSENJIHYxLjIgZXh0X2NhcCBpZiBhZHZlcnRpc2VkICovDQo+ID4+
ICsJb2Zmc2V0ID0geGhjaV9maW5kX25leHRfZXh0X2NhcChiYXNlLCAwLCBYSENJX0VYVF9DQVBT
X1VTQjNfVFVOTkVMSU5HKTsNCj4gPj4gKwlpZiAob2Zmc2V0KSB7DQo+ID4+ICsJCWlmICghKHJl
YWRsKGJhc2UgKyBvZmZzZXQpICYgWEhDSV9VU0IzX1RVTk5FTElOR19TVVBQT1JURUQpKQ0KPiA+
PiArCQkJcmV0dXJuIFVTQl9MSU5LX05BVElWRTsNCj4gPiANCj4gPiBTZWNvbmQsIGRvbid0IHJl
dHVybiBlYXJseSBoZXJlLiBDaGVjayBpZiBYSENJX0VYVF9DQVBTX1VTQjNfVFVOTkVMSU5HDQo+
ID4gcHJlc2VudCBhbmQgc3VwcG9ydGVkOg0KPiANCj4gU28gaWYgdGhlIGV4dGNhcCBpcyBzdXBw
b3J0ZWQgYW5kIGV4cG9zZWQsIGJ1dCBpdCBzYXlzICJ0aGlzIHBvcnQNCj4gaXMgbm90IHR1bm5l
bGluZy1jYXBhYmxlIiwgY2FuIHdlIG5vdCB0cnVzdCB0aGF0IGRhdGE/DQo+ID4gDQo+ID4gCWlm
IChvZmZzZXQgJiYgKHJlYWRsKGJhc2UgKyBvZmZzZXQpICYgWEhDSV9VU0IzX1RVTk5FTElOR19T
VVBQT1JURUQpKSB7DQo+ID4gDQo+ID4+ICsNCj4gPj4gKwkJdmFsID0geGhjaV9wb3J0c2NfcmVh
ZGwocG9ydCk7DQo+ID4+ICsJCWlmICh2YWwgJiBQT1JUX1RNKQ0KPiA+PiArCQkJcmV0dXJuIFVT
Ql9MSU5LX1RVTk5FTEVEOw0KPiA+PiArDQo+ID4+ICsJCXJldHVybiBVU0JfTElOS19OQVRJVkU7
DQo+ID4+ICsJfQ0KPiANCj4gWW91ciBwcm9wb3NlZCBjaGFuZ2Ugc2F5cyAiaWYgIVVTQjNfVFVO
TkVMSU5HX1NVUFBPUlRFRCwgYXNzdW1lIGl0IG1heQ0KPiBzdGlsbCBiZSBzdXBwb3J0ZWQgdmlh
IHRoZSBJbnRlbCBleHRfY2FwIGJlbG93Ig0KPiANCg0KSWdub3JlIHRoaXMgc3VnZ2VzdGlvbi4g
SXQgd2FzIHRpZWQgdG8gdGhlIGlkZWEgb2Ygb3ZlcnJpZGluZyBzdGFuZGFyZA0KY2hlY2tzLg0K
DQpUaGFua3MsDQpUaGluaA==
