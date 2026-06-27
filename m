Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080338D;
	Sat, 27 Jun 2026 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782518946; cv=fail; b=UBMh2iWsB7R+ObgFMLdDUFeIbhKaSUr+1GrraldBcW44EPisvIzkpDi9jkPLw1qRBxDIWWGjDu6+7BM1Fk4WORrXS3Tyx5wM5ZKIkb0GiW25IpVhaDUBNzOXxipR9fqysKnIW2+TyAtUYMP3JPbhUPkFIMVYVC3UVZ47G3hEVwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782518946; c=relaxed/simple;
	bh=02zbpQtl4qoi+XAKSTMryV0OZvFKkPwSnaAXAQzzFwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rWZ3cOAAF4Xqsa2AphlDbt6WVGvsQeRNXLWsbj1CaR7WFax4aW4EPWP39kbHGGV/QgEGL/6pFiIN6s9bHi+MrKjfERoMVYEuxCit1P8yIQUdnm9B7t/QIIwEkX1brV+liOgW4xLX4DxYxWinqAJ2zmlPDo+COD4Q/Zcj+MBkrl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nA3BDREP; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=M0WSXiiU; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=A1MAVpl1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nA3BDREP";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M0WSXiiU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A1MAVpl1"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QNGLG51718341;
	Fri, 26 Jun 2026 17:08:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=02zbpQtl4qoi+XAKSTMryV0OZvFKkPwSnaAXAQzzFwo=; b=
	nA3BDREPedvqkWZPZ/1ArLO6LZsQcg+venCoE4+BitPIF3yHU3jlHs9cOXM6o2wk
	UUp3s7n9NGmsBH6O8y33ePr6XCPvyHB7yKFnOPS1vOAGOaZAeqoa6rS5MOyI/pmm
	paXe/zFOgwrqNJMssvyFoenIb7iDd119tBJv6CzLTYmTVLdMxLkd1muxNW/k8nYV
	X4TDjQqdXptnQp2qul8g1E5Xdy1HxkvepEoRKTBpP8BdnLWlPJCC5siPe9kWilZx
	bCwbKhTCj38vjAqZPmVaWN3Kl3j/lXzb++vvtqatLVcdD6/mQ7+H3nqO4yqByLtw
	vWIefTNtZftBfql81DxBaQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4f1s6cxbte-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782518921; bh=02zbpQtl4qoi+XAKSTMryV0OZvFKkPwSnaAXAQzzFwo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=M0WSXiiULImH8+bZneH1lcBSGbGTMdZvn2lN5/0tuLPGfUv0g3IrL7gVcarOPOCzL
	 iN/llzbpYFiHb6fxX95wg5InjCDkCbJCOOe0xXHTLlewBbnBgf3pfsYx5JdDJk7yKV
	 4F8cFCY1arOLoDI94X+apZ+V1xcxIwCkSCUrMoNg3U5hFx8wzahhdRy84v3pAb9Zhh
	 YfYSXmYSPxv3h50j2iQZcYFckZo89xNQsdSBmu6RIQbidNVgWJTHROq5cfdgNybNjS
	 FC+Oqd8pWMU5hIP3amrZwtYfuKW/Kllu6vZjKmzyZR6INcgfJ/djjxLlN+3beUwocu
	 76frC7w0CrtZA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5C5D940138;
	Sat, 27 Jun 2026 00:08:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DC0DEA0966;
	Sat, 27 Jun 2026 00:08:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=A1MAVpl1;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00604.outbound.protection.outlook.com [40.93.23.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B410A4011C;
	Sat, 27 Jun 2026 00:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B56vZw5/+zZfQN8nSu2qPHGFLmQBR9weDPElHOOm1vlC4N2U8/PRR/0jP2g0PYCUnz6QJ8z88rSuyaOOtRh3SzfJSy5H5s8EoOm/gJlgazNrW1Jy7igdmqr/Oo5HI7BZe7syiABag+1EzBFneKV9HFgncdgcUyK+avo/xUYT5NihRcv3NIxoA8/I1NX8ft0YEiovcQI2NIS6V3rpB7n3t1UuHgAPj01E8DZqQK/QJyvDrL27efk/I+P0NB1n7LcKmdu/ZCQ1g92wL3Myg/gKtJMa6AinYT1OU+/bw1GD9M1z/vA2PGJxKFEnaTTVQ6QFoUZbvlWhosxP72fFgXMtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02zbpQtl4qoi+XAKSTMryV0OZvFKkPwSnaAXAQzzFwo=;
 b=RPYUmrDq/74iG62B9mF/gVHX0qBLU1SUADoTD3loziBnkvhtH8twDY2TGYfpRZBT7cuYfyF17xM5p/7yTsELnrPnpsSlq5y4kOjyv2eG2IisOopOm4dppiF77aiqrqqKdi3bRgfi2g4mdNoL8ZrMdN+NkeOdhcgdGtGCx9ZbbLIFJ8JNUiXOPiPdQWw1lyxG+MoVcrjukRQ+6GpKe/GEdSRfCXtoRe4QNRV8LIFbFOxwas4WTo1M7ivVBnjVbcDBP7dJramdcrsTufwI0CHHTGrsHatNrQBxn+/DOtYFb2r0jK+UK/7Fmc9c870csSM/fZEkGucVU5GF5x+UpPWg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02zbpQtl4qoi+XAKSTMryV0OZvFKkPwSnaAXAQzzFwo=;
 b=A1MAVpl155wo44/rB7CvtCkyd0KWwwtwVyAiEOvFbvl0g923DhpNd4KQG7BtgS9SowbAr4qg2+3rS3GkgjXp/b4d257d5RfQrgBberyMTXWIJhafDZXu+/Dy1sBnes9VEfxv5LSaDEgx/WpbqMY2xbLb2Bn8JSRBoNSscCszTrg=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Sat, 27 Jun
 2026 00:08:33 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Sat, 27 Jun 2026
 00:08:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Cen Zhang <zzzccc427@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>,
        Kees Cook <kees@kernel.org>,
        Mike Christie <michael.christie@oracle.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_tcm: Cancel delayed set_alt work on
 teardown
Thread-Topic: [PATCH] usb: gadget: f_tcm: Cancel delayed set_alt work on
 teardown
Thread-Index: AQHdArL1txcOgAPKEEmmfKdrYGaDmLZRjMIA
Date: Sat, 27 Jun 2026 00:08:29 +0000
Message-ID: <aj8S2btHtbyjvbCB@vbox>
References: <20260623015211.4111938-1-zzzccc427@gmail.com>
In-Reply-To: <20260623015211.4111938-1-zzzccc427@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH0PR12MB8532:EE_
x-ms-office365-filtering-correlation-id: 9f76c0fa-e037-490e-5e76-08ded3e03809
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 x2kl0xR5QTtWYcvX/Dq/0CKy3Z4smPLECKcrr0TkHrgXf+yVhUbXf4zJEK+KnN63DUHk0Tqph4wgQyMbMySxO4SDXXstf1h+JBmOLPA/sJ0F31PhQdVhkTzNa5ESgdunuckWa9whiAynceRsl+UgqYNoDFc7eDOlRP/Lu9xO8j1K3uzMaEQUjEHVDMYiks1lUJhmJwmCyeYq2GVu9aTu1KGD4B7exI+0jTUj19eQYcCRYde2xL/8KAX36IB6dr82VqRJSy5fEjOUn2Oms+557Q9gfx0D4nJ+wY0cabaajyPouw6qF4fQR1lK8AvtqNt0GEJrmNHA9taWvMMbktIUxNaEhiDVCZmwQ1cw/LoWwWXrXqY0+Trd4gDGzU7gMkwU7IrM1xDb0NAPHtgF9CEpr2egBZQlp2XdEgMTOgWmX0nZoYWiRkK21yMpMpuSV5G85FPOfE+7TdefQKlJy53SeyVEK7WJxFLGSM85xenKG0GpLO/Bh7ri0EOqw5xUoUnF9hHcq7OhT6lt79UxxNwF+RF9H6yIwtgT31yEWcUF08n4J/DCLc+EOH5sOTSirtJrMLEtt2runzm551dZxeiuZP/Mrx0n4omPlNqqgHC7v6XbdrDdmJDX584nujk2Jey3buvHtc5YmYgIWyyKgRy0oQQV+NHx7hIpPO8CGzW3KbiPnSDA398Sniu8FiYXxXDeA0tRyPZXiuvpGJTJ9APgmFZlGvy8wP44F16ZrhCZ12Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bitkTzVKZVlYd2pCZ0xPTW5nMGJ1bWVuY2c3U2RvdU5Nam9RR1RlaDR6R2Fo?=
 =?utf-8?B?czlDOHg3UkJWaDdudUQ3QkxBbVBtUENBRVljdDh4TSt0dWY5WlpiTnVHT0lz?=
 =?utf-8?B?NFRLMmJudGxzNGpjMnlkdlltcmMvTm0rM3hqN3hSbW5NdjROTlB6OWZON3hT?=
 =?utf-8?B?M281b0FvV0RQejJ6bzBXMEtzeEwwM2loTFYxckdXZGxGSUdSeGlzcVFob3Bi?=
 =?utf-8?B?VUh5c1o2dWFuVUN4aDg4emJEdFRLZWJrSGl5RzlMT24xVlRLbGNDbnB6dlZ1?=
 =?utf-8?B?TUE0L1JNQXQwTFFrdThXdWZUeEVjdDQ3b3lYcTJWaW9memxDL0k2Qmk1UERs?=
 =?utf-8?B?ZXJsVWlVYU9SUERwak5aQUtnQmNwMk1MdStSSUQyUWpTNmdKSHNneDJNN2Jt?=
 =?utf-8?B?ZEt1TXRPZmljODM0Y0FiclN6ellwNkYvU3F1R0I5RStKMEJ3UVZWaGczSXh1?=
 =?utf-8?B?K0d3Q1hraWU5SUlGTDZMUzBhVGppVm1QV1Z5THBkTFRZdnhHeWZlWmpITThw?=
 =?utf-8?B?eEt6Q3NkVjFZS2E5b3VJQ1RVdUlRNTlDL3dKdUJSU2R2T29qczVVZ1pXVzNF?=
 =?utf-8?B?cytNUytpeFNjS090Vm1VaVAvc05oeXI1ejJzRXJxRlNIQVFGdWJXSTJXVXBq?=
 =?utf-8?B?eG9JS2p4Q1BYRzExdUk2Y2FWVmpjL1J5eVZjWkxjTGtUNU1yd2xlVzlhL3dJ?=
 =?utf-8?B?VnRZb01VT2VxOS8xVFJ6OU5iN3RuZjRicmkyS2liRWRNeG9NWUFTdHRLUTB1?=
 =?utf-8?B?QzdhYk5yL0NOTDk0TTM0UlZ0WGFXU2JZeFdJdWlaUlRFNStHQzRITk9WQ3Q1?=
 =?utf-8?B?L1JnNG43NnJvcTBEcEpOamx0TnhyaXVHZk1mWDVmSW1ZaXJ3VEVHVFM2Rnk3?=
 =?utf-8?B?YzliNUJQTXFLWE1XMVJRSnBNa3VqVGkrVzB5dzhUV2hSNE12ZHk0N0V6NHJS?=
 =?utf-8?B?RTR5SUF2cG1EUUdueDMwT0lqOHlOQTVNeUluQ25qUEJMSDMvMENEK04yZFFR?=
 =?utf-8?B?d1dZcFlGaVl0ZHJ2T1lOV2Q0cFJ3NHBRVmh4UkhnbDNjcUx0OXRRa3VlNEJX?=
 =?utf-8?B?UW5pbDFjSFBYQ2loSUdsYmZHM3BPQkd5dTIyT2ZZdFBSeFFrUE13SU1YeXAv?=
 =?utf-8?B?a2FwL2F2dUhuTTNTMTBodlBqS0VyRXk4YkQ4YkpEWU9COFM3aGVvMS9yMEdK?=
 =?utf-8?B?TUtHbmRBQk9WdEFZRDJObDY5K2hjR1ZLKzl0M2o3end3L3BXangycitGRk9Z?=
 =?utf-8?B?c1liWVM3UkQ2VVhDdm5GV0RUZFFodDYxRUVPL3dhdTlHNVBkWnBzTGh6bGJn?=
 =?utf-8?B?TUVZWVU3MmM1UThPRFhsMXVrTXFrSVZmcWFWOWRtV0JhSFEybVdPU0N2SDN5?=
 =?utf-8?B?V0JBRW1xY2VCNHA1OHFHQ2kzSlJDWnI3aE1xYUIxQVdwNVNFc0JDdWx2cTJF?=
 =?utf-8?B?UkQ1dm5zeW5WR0NtOVljWG9sT0ZMaTZ5dGFuQy9qY0I2WXNZTEFXSjI5UUhl?=
 =?utf-8?B?YjBrRS9oeEpKbGpra2V4WStPdFZQaVFXSUJxeHNXM3dxanNJcnErekgrSHdK?=
 =?utf-8?B?RU1sSlFYcEFXYnhUdVJ1NjZmMmpZdGI4cDVjcDlSNjJkbjh4WjJocE83V0Zo?=
 =?utf-8?B?ODRoK2RCVm05QzNWazdFODRQZW1SNmFzcmF3ZStxdWdnOE9RWGZBM2xwbGNL?=
 =?utf-8?B?NlJURDEwcTlTSS94c1FMcUhLZ1BvZW52SHdXZUpXUldxMVZHMVlRLzhQUG9S?=
 =?utf-8?B?dTk1MGVydGZvTnFYOUJmU2plSjNmWUtjZjlPRVY0b3R0ZklQODdLM3Y5VkFo?=
 =?utf-8?B?SUZjbHRDK3N0Q09BZFlvNlorU0lVQ0dBcUhkUFk1ZlhmeDRUTXZpTUhHajRP?=
 =?utf-8?B?enZmVFFyTktpdm1BVkprb05HVWtBUktBc3VSaTgwb0VJcGFkeDRwZkdSbWNp?=
 =?utf-8?B?VW8wQWxpQ2tZaGNwQVJWYlBGQVlyZHNFZ3dUZnk4dDJndEtyenY0N251TzRT?=
 =?utf-8?B?aGxKVEJ3TVRaME9jUVBDYkMxdmdEbk5kYWJRajI4cVFIanRya2tIVG9ob0hr?=
 =?utf-8?B?R0F6YkYvQzZ4NGs4ekhSQnlSV2pkU3lSQmJCdE5lekt5T1VWbE81TzYwbWYz?=
 =?utf-8?B?N3FYYllMbW02c2huaWlGR2M4MkI3Z0lzaU9UTkx5WDlFd052SnF3NklzSkVw?=
 =?utf-8?B?dHF2R1RTWlBRWFM0bmVpTVB2ODYxRTR3c1REUGkzRVQ3NGExR2NDOXJVQTky?=
 =?utf-8?B?RGRzamxoQ3F2aksxVDZoWjBZc3lKaTd0a0pKWEhTOWFPOGovTjhoYUR6Tzdy?=
 =?utf-8?B?c1d1SnpSZnFjbk1JSmgwUU5GZE9HVGNpY2U0VTV1aWVBZnNQa2Nwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4A5787FD8DE0A4693CA47EC7C426AAB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Pmf1U+xDByK7evwh9omhoeBVmhHlZRx+mIm9wxVbPUeiQ69jYAokyU6MsPY1q1SHWzCjscWqzP+Jn7xwC4rd/6UfDGId3BENW6tV7HthimVArqzLN5SNAR4cyhPLENT5DGiXCymU+cSOTagWtejosGeDuklEC6nvWKnyjGv4j+sCAV6bX/zxKtnYsX8NRJISLYj7v63wynuvZnSo2MTGQRxI2GN4oITYQmKWr7Ed1E9aAbvEAyOD2gemLLWEaTozoxF6vztrKr8Aez8BWSjwoiUUYr34IFqH0NZ94JGparpgKLLCDq3FpqpwVNqZX8rjgqCxxrLGSf1Pjw1axwkWGg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	enj+IFZj7bG/2cn7oIHuLqjXST+0oP7HzWaLwl41dwZ0TMOIPSwjmYxKW4T4HqfyXYONBYBs9bgtsmtNoYcFbdJO2a6h/05y7iulBOpm+BjEGFy4sWnngWKzmyolpOtokubeg04VZ6v1+Xp9yBdUvOTbXLNF50Jbx49NFgbZ7qc+b7gV/e0mttiO37Y6jJ4ru+RSLhXtpTQ3ez1NYlrQ1+C4pqZDFj/cwDrryLZIjJ87mvWxAysWN/Mltp3OISH1VePoSoglx8s5+a0x8e7mNa/IpfStO8kJA2UDbfI6lT5V70HABviBKmcEB6wySn49ve3GxMbVkI9802oeKp+A71AktaXoo6gjIsWhJIOAronvdqabbzvoZjAg8KVj13e82RgD43Z2WNi0FFomP8LWxKg9Qq2tcoxKiyLl5b96C0bxDehmwcX9FIpcxH3GecepgY6I1W+LNlpwqZfqKKKaX5DTwwApwVtow25wKKvNYgJjmqQun+uF49BihqYVlhrmUf7jQXJRmlBDhvb8hPnZRwP42cn2rRBRZA1akvPh+5/vnH79bOkKKW0e63VwEVh2G914RjK1m/Hgm3pJNb7BwILFWTvaDsNMpjovJw6RWbtLPncdr7LZd8iLw+bzpD8rcClQQnpf1o1kibD66T3bWQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f76c0fa-e037-490e-5e76-08ded3e03809
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2026 00:08:29.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Vz8z4JQ/bcoMwEayM69VeAxSKbWIDenk+8AAyitJm2EWFVhuxTTBUD+LB5QN5+zZNn+3gpJaIwUkV8g6aWoXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDIwMSBTYWx0ZWRfX/Bpmc23ULV7F
 930hG/aakEamz1hAR5YLRMJikMbjX0ziQxb/+II6mwL0TNT7KyrBQhWk8ANeWLvygKaNMxLaGhv
 6R7G+xu0SOt0S0+SX+BkpvXJ9CZXI+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDIwMSBTYWx0ZWRfX2xSZxytIydGi
 ZDcx5/g5QfdWW8Zp1wJ9R4FvLruCKnF+rBwDS6gbRPj33xHPrxSDI0XRqha66/L7NUb1oPZ8uVR
 dAbj0Soy0VR/P0GxNDGXLtbBy38XlJCnMwJizZcELtQb0ydd25r1hSioMFZn/9aZ5axZZwme78M
 FTSNdePHgkDnTjweDwS1fKFMRaZXLuru+gyDxU4y5pVzCAKnLBMm1A5RRZ0WeoQDiGoxiCeWpLB
 pvZXXyBNcIznKZntLgkeorjl/yJL1vhAQTGluynVreOCn3tY+Unaav28JBp48mXjjYN7JG6wSmL
 9MLQNJLiKoie0fv3w0PCI5ctx2JGoSY0xdxHnLGBM/jc2OFFQUzJ00PKCaTP/W9mr4fFNQrXc/1
 4aMRbKu4B7lXDgj3iOAdhReApBgP7lYmdC+DxkZqe0r5+5HpJ5f/4LRNhdy3L6ph5HHAj+AbYMV
 Qd/U6bDCTO7k4x+yDZA==
X-Proofpoint-ORIG-GUID: zpaLs7e2xnZKrQhb4qRM7DmhWUCpPKDr
X-Proofpoint-GUID: zpaLs7e2xnZKrQhb4qRM7DmhWUCpPKDr
X-Authority-Analysis: v=2.4 cv=AeyB2XXG c=1 sm=1 tr=0 ts=6a3f1489 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=pGLkceISAAAA:8 a=Arcpy4CjTEBJ1y0w7zQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260201

T24gVHVlLCBKdW4gMjMsIDIwMjYsIENlbiBaaGFuZyB3cm90ZToNCj4gdGNtX3NldF9hbHQoKSBk
ZWZlcnMgQk9UL1VBUyBlbmRwb2ludCBzZXR1cCB0byBhIHN5c3RlbSB3b3JrcXVldWUgYW5kDQo+
IHJldHVybnMgVVNCX0dBREdFVF9ERUxBWUVEX1NUQVRVUy4gVGhlIHF1ZXVlZCB3b3JrIGtlZXBz
IHRoZSBmdW5jdGlvbg0KPiBzdGF0ZSBhbGl2ZSBvbmx5IGJ5IGEgcmF3IHN0cnVjdCBmX3VhcyBw
b2ludGVyLCBidXQgY29uZmlnZnMgdW5saW5rIGNhbg0KPiB1bmJpbmQgYW5kIGZyZWUgdGhhdCBm
dW5jdGlvbiBiZWZvcmUgdGhlIHdvcmsgcnVucy4NCj4gDQo+IFRoZSBidWdneSBzY2VuYXJpbyBp
bnZvbHZlcyB0d28gcGF0aHMsIHdpdGggZWFjaCBjb2x1bW4gc2hvd2luZyB0aGUgb3JkZXINCj4g
d2l0aGluIHRoYXQgcGF0aDoNCj4gDQo+IFVTQiBjb250cm9sIHJlcXVlc3QgcGF0aDogICAgICAg
ICAgIGNvbmZpZ2ZzIHVubGluayBwYXRoOg0KPiAgIDEuIFNFVF9DT05GSUdVUkFUSU9OIG9yICAg
ICAgICAgICAgIDEuIFVzZXJzcGFjZSByZW1vdmVzIHRoZSBmdW5jdGlvbg0KPiAgICAgIFNFVF9J
TlRFUkZBQ0UgcmVhY2hlcyAgICAgICAgICAgICAgIHN5bWxpbmsgd2hpbGUgdGhlIGdhZGdldCBp
cyBib3VuZC4NCj4gICAgICB0Y21fc2V0X2FsdCgpLg0KPiAgIDIuIHRjbV9zZXRfYWx0KCkgcXVl
dWVzIGRlbGF5ZWQgICAgIDIuIGNvbmZpZ191c2JfY2ZnX3VubGluaygpIGZvcmNlcw0KPiAgICAg
IHNldF9hbHQgd29yayBhbmQgcmV0dXJucyAgICAgICAgICAgIGdhZGdldCB1bnJlZ2lzdGVyLg0K
PiAgICAgIFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVMuDQo+ICAgMy4gdGNtX2RlbGF5ZWRfc2V0
X2FsdCgpIGxhdGVyICAgICAgMy4gdGNtX3VuYmluZCgpIHJlbGVhc2VzIGRlc2NyaXB0b3JzDQo+
ICAgICAgZGVyZWZlcmVuY2VzIHN0cnVjdCBmX3Vhcy4gICAgICAgICAgYW5kIHRjbV9mcmVlKCkg
ZnJlZXMgc3RydWN0IGZfdWFzLg0KPiANCj4gVmFsaWRhdGlvbiByZXByb2R1Y2VkIHRoaXMga2Vy
bmVsIHJlcG9ydDoNCj4gQlVHOiBLQVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiB0Y21fZGVs
YXllZF9zZXRfYWx0KzB4NmMvMHhlZjANCj4gDQo+IENhbGwgVHJhY2U6DQo+ICA8VEFTSz4NCj4g
IGR1bXBfc3RhY2tfbHZsKzB4NjYvMHhhMA0KPiAgcHJpbnRfcmVwb3J0KzB4Y2UvMHg2MzANCj4g
ID8gdGNtX2RlbGF5ZWRfc2V0X2FsdCsweDZjLzB4ZWYwDQo+ICA/IHNyc29fYWxpYXNfcmV0dXJu
X3RodW5rKzB4NS8weGZiZWY1DQo+ICA/IF9fdmlydF9hZGRyX3ZhbGlkKzB4MTg4LzB4MzIwDQo+
ICA/IHRjbV9kZWxheWVkX3NldF9hbHQrMHg2Yy8weGVmMA0KPiAga2FzYW5fcmVwb3J0KzB4ZTAv
MHgxMTANCj4gID8gdGNtX2RlbGF5ZWRfc2V0X2FsdCsweDZjLzB4ZWYwDQo+ICB0Y21fZGVsYXll
ZF9zZXRfYWx0KzB4NmMvMHhlZjANCj4gID8gX19wZnhfdGNtX2RlbGF5ZWRfc2V0X2FsdCsweDEw
LzB4MTANCj4gID8gcHJvY2Vzc19vbmVfd29yaysweDRjYi8weGI5MA0KPiAgPyByY3VfaXNfd2F0
Y2hpbmcrMHgyMC8weDUwDQo+ICA/IHRjbV9kZWxheWVkX3NldF9hbHQrMHg5LzB4ZWYwDQo+ICBw
cm9jZXNzX29uZV93b3JrKzB4NGQ3LzB4YjkwDQo+ICA/IF9fcGZ4X3Byb2Nlc3Nfb25lX3dvcmsr
MHgxMC8weDEwDQo+ICA/IHNyc29fYWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1DQo+ICA/
IF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4MzcvMHhmMA0KPiAgPyBfX3BmeF90Y21fZGVs
YXllZF9zZXRfYWx0KzB4MTAvMHgxMA0KPiAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUv
MHhmYmVmNQ0KPiAgd29ya2VyX3RocmVhZCsweDJkOC8weDU3MA0KPiAgPyBfX3BmeF93b3JrZXJf
dGhyZWFkKzB4MTAvMHgxMA0KPiAga3RocmVhZCsweDFhZC8weDFmMA0KPiAgPyBfX3BmeF9rdGhy
ZWFkKzB4MTAvMHgxMA0KPiAgcmV0X2Zyb21fZm9yaysweDNjOS8weDU0MA0KPiAgPyBfX3BmeF9y
ZXRfZnJvbV9mb3JrKzB4MTAvMHgxMA0KPiAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUv
MHhmYmVmNQ0KPiAgPyBfX3N3aXRjaF90bysweDJlOS8weDczMA0KPiAgPyBfX3BmeF9rdGhyZWFk
KzB4MTAvMHgxMA0KPiAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwDQo+ICA8L1RBU0s+DQo+
IA0KPiBBbGxvY2F0ZWQgYnkgdGFzayA1NDQ6DQo+ICBrYXNhbl9zYXZlX3N0YWNrKzB4MzMvMHg2
MA0KPiAga2FzYW5fc2F2ZV90cmFjaysweDE0LzB4MzANCj4gIF9fa2FzYW5fa21hbGxvYysweDhm
LzB4YTANCj4gIHRjbV9hbGxvYysweDY4LzB4MTgwDQo+ICB1c2JfZ2V0X2Z1bmN0aW9uKzB4MzYv
MHg2MA0KPiAgY29uZmlnX3VzYl9jZmdfbGluaysweDEyNS8weDFiMA0KPiAgY29uZmlnZnNfc3lt
bGluaysweDMyMi8weDg5MA0KPiAgdmZzX3N5bWxpbmsrMHhjMi8weDI3MA0KPiAgZmlsZW5hbWVf
c3ltbGlua2F0KzB4Mjk1LzB4MmYwDQo+ICBfX3g2NF9zeXNfc3ltbGlua2F0KzB4NjIvMHg5MA0K
PiAgZG9fc3lzY2FsbF82NCsweDExNS8weDZhMA0KPiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9o
d2ZyYW1lKzB4NzcvMHg3Zg0KPiANCj4gRnJlZWQgYnkgdGFzayA2NjE6DQo+ICBrYXNhbl9zYXZl
X3N0YWNrKzB4MzMvMHg2MA0KPiAga2FzYW5fc2F2ZV90cmFjaysweDE0LzB4MzANCj4gIGthc2Fu
X3NhdmVfZnJlZV9pbmZvKzB4M2IvMHg2MA0KPiAgX19rYXNhbl9zbGFiX2ZyZWUrMHg0My8weDcw
DQo+ICBrZnJlZSsweDJmOS8weDUzMA0KPiAgY29uZmlnX3VzYl9jZmdfdW5saW5rKzB4MTczLzB4
MWUwDQo+ICBjb25maWdmc191bmxpbmsrMHgxZmEvMHgzNDANCj4gIHZmc191bmxpbmsrMHgxNWMv
MHg1MTANCj4gIGZpbGVuYW1lX3VubGlua2F0KzB4MmJhLzB4NDUwDQo+ICBfX3g2NF9zeXNfdW5s
aW5rYXQrMHg2My8weDkwDQo+ICBkb19zeXNjYWxsXzY0KzB4MTE1LzB4NmEwDQo+ICBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ny8weDdmDQo+IA0KPiBNYWtlIHRoZSBkZWxheWVk
IHNldF9hbHQgd29yayBpdGVtIG93bmVkIGJ5IHN0cnVjdCBmX3VhcyBpbnN0ZWFkIG9mIGFuDQo+
IGFub255bW91cyBoZWFwIGFsbG9jYXRpb24uIFRoaXMgZ2l2ZXMgdGVhcmRvd24gcGF0aHMgYSBz
dGFibGUgaGFuZGxlIGZvcg0KPiB0aGUgZXhhY3Qgd29yayBpdGVtOiBkaXNhYmxlIGNhbmNlbHMg
cGVuZGluZyB3b3JrIHdpdGhvdXQgc2xlZXBpbmcsIGFuZA0KPiB1bmJpbmQvZnJlZSBzeW5jaHJv
bm91c2x5IGNhbmNlbCBpdCBiZWZvcmUgZGVzY3JpcHRvcnMgb3Igc3RydWN0IGZfdWFzIGFyZQ0K
PiByZWxlYXNlZC4NCj4gDQo+IEZpeGVzOiBjNTI2NjFkNjBmNjMgKCJ1c2ItZ2FkZ2V0OiBJbml0
aWFsIG1lcmdlIG9mIHRhcmdldCBtb2R1bGUgZm9yIFVBU1AgKyBCT1QiKQ0KDQpDYyBzdGFibGUg
Zm9yIHRoZXNlIGtpbmRzIG9mIGZpeGVzLg0KDQo+IEFzc2lzdGVkLWJ5OiBDb2RleDpncHQtNS41
DQo+IFNpZ25lZC1vZmYtYnk6IENlbiBaaGFuZyA8enp6Y2NjNDI3QGdtYWlsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYyB8IDMyICsrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdGNtLmgg
ICB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9m
X3RjbS5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gaW5kZXggMzRk
OWY0OWU5OTg3Li40MDk2Zjk0NTg2ZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdl
dC9mdW5jdGlvbi9mX3RjbS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9m
X3RjbS5jDQo+IEBAIC0yMzYzLDIwICsyMzYzLDEwIEBAIHN0YXRpYyBpbnQgdGNtX2JpbmQoc3Ry
dWN0IHVzYl9jb25maWd1cmF0aW9uICpjLCBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KPiAgCXJl
dHVybiAtRU5PVFNVUFA7DQo+ICB9DQo+ICANCj4gLXN0cnVjdCBndWFzX3NldHVwX3dxIHsNCj4g
LQlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsNCj4gLQlzdHJ1Y3QgZl91YXMgKmZ1Ow0KPiAtCXVu
c2lnbmVkIGludCBhbHQ7DQo+IC19Ow0KPiAtDQo+ICBzdGF0aWMgdm9pZCB0Y21fZGVsYXllZF9z
ZXRfYWx0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd3EpDQo+ICB7DQo+IC0Jc3RydWN0IGd1YXNfc2V0
dXBfd3EgKndvcmsgPSBjb250YWluZXJfb2Yod3EsIHN0cnVjdCBndWFzX3NldHVwX3dxLA0KPiAt
CQkJd29yayk7DQo+IC0Jc3RydWN0IGZfdWFzICpmdSA9IHdvcmstPmZ1Ow0KPiAtCWludCBhbHQg
PSB3b3JrLT5hbHQ7DQo+IC0NCj4gLQlrZnJlZSh3b3JrKTsNCj4gKwlzdHJ1Y3QgZl91YXMgKmZ1
ID0gY29udGFpbmVyX29mKHdxLCBzdHJ1Y3QgZl91YXMsIGRlbGF5ZWRfc2V0X2FsdCk7DQo+ICsJ
aW50IGFsdCA9IGZ1LT5kZWxheWVkX2FsdDsNCj4gIA0KPiAgCWlmIChmdS0+ZmxhZ3MgJiBVU0JH
X0lTX0JPVCkNCj4gIAkJYm90X2NsZWFudXBfb2xkX2FsdChmdSk7DQo+IEBAIC0yNDEzLDE1ICsy
NDAzLDggQEAgc3RhdGljIGludCB0Y21fc2V0X2FsdChzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmLCB1
bnNpZ25lZCBpbnRmLCB1bnNpZ25lZCBhbHQpDQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4g
IA0KPiAgCWlmICgoYWx0ID09IFVTQl9HX0FMVF9JTlRfQkJCKSB8fCAoYWx0ID09IFVTQl9HX0FM
VF9JTlRfVUFTKSkgew0KPiAtCQlzdHJ1Y3QgZ3Vhc19zZXR1cF93cSAqd29yazsNCj4gLQ0KPiAt
CQl3b3JrID0ga21hbGxvY19vYmooKndvcmssIEdGUF9BVE9NSUMpOw0KPiAtCQlpZiAoIXdvcmsp
DQo+IC0JCQlyZXR1cm4gLUVOT01FTTsNCj4gLQkJSU5JVF9XT1JLKCZ3b3JrLT53b3JrLCB0Y21f
ZGVsYXllZF9zZXRfYWx0KTsNCj4gLQkJd29yay0+ZnUgPSBmdTsNCj4gLQkJd29yay0+YWx0ID0g
YWx0Ow0KPiAtCQlzY2hlZHVsZV93b3JrKCZ3b3JrLT53b3JrKTsNCj4gKwkJZnUtPmRlbGF5ZWRf
YWx0ID0gYWx0Ow0KPiArCQlzY2hlZHVsZV93b3JrKCZmdS0+ZGVsYXllZF9zZXRfYWx0KTsNCj4g
IAkJcmV0dXJuIFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVM7DQo+ICAJfQ0KPiAgCXJldHVybiAt
RU9QTk9UU1VQUDsNCj4gQEAgLTI0MzEsNiArMjQxNCw4IEBAIHN0YXRpYyB2b2lkIHRjbV9kaXNh
YmxlKHN0cnVjdCB1c2JfZnVuY3Rpb24gKmYpDQo+ICB7DQo+ICAJc3RydWN0IGZfdWFzICpmdSA9
IHRvX2ZfdWFzKGYpOw0KPiAgDQo+ICsJY2FuY2VsX3dvcmsoJmZ1LT5kZWxheWVkX3NldF9hbHQp
Ow0KPiArDQoNCkNvdWxkbid0IGEgcmFjZSBzdGlsbCBoYXBwZW4gaGVyZT8gSSBkb24ndCB0aGlu
ayB5b3UgY2FuIGp1c3QgdXNlDQpjYW5jZWxfd29ya19zeW5jIGluIHRjbV9kaXNhYmxlIGhlcmUu
DQoNCkJSLA0KVGhpbmgNCg0KPiAgCWlmIChmdS0+ZmxhZ3MgJiBVU0JHX0lTX1VBUykNCj4gIAkJ
dWFzcF9jbGVhbnVwX29sZF9hbHQoZnUpOw0KPiAgCWVsc2UgaWYgKGZ1LT5mbGFncyAmIFVTQkdf
SVNfQk9UKQ0KPiBAQCAtMjU4MywxMSArMjU2OCwxNSBAQCBzdGF0aWMgdm9pZCB0Y21fZnJlZShz
dHJ1Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KPiAgew0KPiAgCXN0cnVjdCBmX3VhcyAqdGNtID0gdG9f
Zl91YXMoZik7DQo+ICANCj4gKwljYW5jZWxfd29ya19zeW5jKCZ0Y20tPmRlbGF5ZWRfc2V0X2Fs
dCk7DQo+ICAJa2ZyZWUodGNtKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgdGNtX3VuYmlu
ZChzdHJ1Y3QgdXNiX2NvbmZpZ3VyYXRpb24gKmMsIHN0cnVjdCB1c2JfZnVuY3Rpb24gKmYpDQo+
ICB7DQo+ICsJc3RydWN0IGZfdWFzICp0Y20gPSB0b19mX3VhcyhmKTsNCj4gKw0KPiArCWNhbmNl
bF93b3JrX3N5bmMoJnRjbS0+ZGVsYXllZF9zZXRfYWx0KTsNCj4gIAl1c2JfZnJlZV9hbGxfZGVz
Y3JpcHRvcnMoZik7DQo+ICB9DQo+ICANCj4gQEAgLTI2MjEsNiArMjYxMCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgdXNiX2Z1bmN0aW9uICp0Y21fYWxsb2Moc3RydWN0IHVzYl9mdW5jdGlvbl9pbnN0YW5j
ZSAqZmkpDQo+ICAJZnUtPmZ1bmN0aW9uLmZyZWVfZnVuYyA9IHRjbV9mcmVlOw0KPiAgCWZ1LT50
cGcgPSB0cGdfaW5zdGFuY2VzW2ldLnRwZzsNCj4gIA0KPiArCUlOSVRfV09SSygmZnUtPmRlbGF5
ZWRfc2V0X2FsdCwgdGNtX2RlbGF5ZWRfc2V0X2FsdCk7DQo+ICAJaGFzaF9pbml0KGZ1LT5zdHJl
YW1faGFzaCk7DQo+ICAJbXV0ZXhfdW5sb2NrKCZ0cGdfaW5zdGFuY2VzX2xvY2spOw0KPiAgDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdGNtLmggYi9kcml2ZXJz
L3VzYi9nYWRnZXQvZnVuY3Rpb24vdGNtLmgNCj4gaW5kZXggMDA5OTc0ZDgxZDY2Li5iMDdiZjRh
YTdkODggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi90Y20uaA0K
PiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdGNtLmgNCj4gQEAgLTEyMyw2ICsx
MjMsOCBAQCBzdHJ1Y3QgZl91YXMgew0KPiAgCXN0cnVjdCB1c2JnX3RwZwkJKnRwZzsNCj4gIAlz
dHJ1Y3QgdXNiX2Z1bmN0aW9uCWZ1bmN0aW9uOw0KPiAgCXUxNgkJCWlmYWNlOw0KPiArCXN0cnVj
dCB3b3JrX3N0cnVjdAlkZWxheWVkX3NldF9hbHQ7DQo+ICsJdW5zaWduZWQgaW50CQlkZWxheWVk
X2FsdDsNCj4gIA0KPiAgCXUzMgkJCWZsYWdzOw0KPiAgI2RlZmluZSBVU0JHX0VOQUJMRUQJCSgx
IDw8IDApDQo+IC0tIA0KPiAyLjQzLjA=
