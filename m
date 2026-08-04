Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627D41A4FC;
	Tue,  4 Aug 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880892; cv=fail; b=Jcol4T79jV4/klXq18ftCIXosRyxsR5hXMKhGFrazFP6oa2evbKYWBLlrLLCg6dWR53sCsWd0x2nidkA0GEDK/oEMfGiauINBFMBcKUX9LTMQMj1nJuBOLsQjYqRNhYX8aXaADujEz8uhkgC8ToXAo7uNlFWTY6d0JBGamihIl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880892; c=relaxed/simple;
	bh=OouCDYvCmLps4EIbH7BX7C9xO0CVBvV665EwKUqjx7k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dwxzK4ljprMAEo3pbOp15IsmeU3w4CiZ52KY5P+alT8uUry4wgcDv8X8vADD+t4BhP5iJp6qIgl6KXjjFPRlEkUjNyyqbnJ1k8J7g75JlJijLZJQC0ACoITdT2CZeMyWZ5JurLeZ0HDPM1lY6jmEhpzYrzUPiSybgk5/zL8CCIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jEc+JGKN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kcAOs3sZ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t67DtgMX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jEc+JGKN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kcAOs3sZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t67DtgMX"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpXIe1702306;
	Tue, 4 Aug 2026 15:01:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OouCDYvCmLps4EIbH7BX7C9xO0CVBvV665EwKUqjx7k=; b=
	jEc+JGKNBVhswm3Z6/WG92oJOtXxfKtQl18J+aZqZaoUPBVU02KnEu4QZJxxl8ZZ
	WQxS1dYQB0kOcga5W9LKXKkKdfgktkWMQWSfwUUr0BXuu91L4xugR4Rcw4HXaRSr
	Wln6KV5lh3Sb3WDHX+F7FeFLZLJSx0cDif2fTDeD35D1qf7k+ldOI7ArKJcTPW+B
	dRpMaC95OMzRkznwyUCHy5vthg5ZwGLgGVnaQsMcwrhd4dIZrX5PCeDP/6WoJpMT
	L8qySYMw38VG74oWKIMY49LdwI55oXFzmRsa6Kirl7BEA8/VjPbUk5aoE1VDzduJ
	hhV6ympO6FRiomD8wVOqhQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fug0k554h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 15:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785880880; bh=OouCDYvCmLps4EIbH7BX7C9xO0CVBvV665EwKUqjx7k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kcAOs3sZuivU75DpxpNddtwgXVl2+04v2xgQcobR1loZHtmnC6wpZext33pLkhBAr
	 Kn+NL8D2hhlMqNaSenCSV7uPxSjk7geRno88pR3g721qd5JbqPySfZNTHQmKxd5N7j
	 knsB6BKw+PwozbB4mJrdqm0J+foSjRLYelFUuwhzS91AkzczjRE6aI9CFVke9L+3x1
	 FosXVlBvAmjrqng99F+5VdbPwqmhZQxOAkmT/bgcu7icFJobkW0xFLNDLPp0441Wli
	 +LtGyq/qvWnFz+UZdF4px1ydFqzfv6mzlRzDO3iOcqX1jO00zdWWy2vNFnSjPkwGRT
	 B/hir8PZzIS4Q==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6568040515;
	Tue,  4 Aug 2026 22:01:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E3676A0941;
	Tue,  4 Aug 2026 22:01:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=t67DtgMX;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 03D63402D6;
	Tue,  4 Aug 2026 22:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXGjEhdadUtWLkdXQLtqPE6zExwjmHNpAr8nADQSAhp56Gvcpy6d3dbpdYT7yn0M+ogSVSrSEkZm/x3DQPfuAik4xt7jQdarlKi+tWVs+sDQiQGDcQvqmQ2veTP8NFlzlBBDwSmFk0hewZCwWdeXmCbMDdFn86IiRz2fEkQtRqXfQaeA6bmgnTXZyJVugRNKFHTvrnqK0Ufww2ayw7Uq0P9G3GqqGO2HvOBIoK0Iw2vjjxPIiq9ULkkhV/fo5BJv6b8Xpi7y2HrcFeK9jsh3pWbFsC9UldyxAf0//k8sJDcTQ/IAoGZmf7qWbHzee+VvyQ1+bsodIpA0dmYq3TTYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OouCDYvCmLps4EIbH7BX7C9xO0CVBvV665EwKUqjx7k=;
 b=GPHlNOUc/rX5C2PF8aEWH//C8Lep/hCQ0QybWWVillyaToXnXbThfnO2dEoK6yDrX2ItmuNsTTxGr4tbN22nAsilvEBo+iGhSMRXvyqH04RMMgORxM1oekf3xianF7q25vcfDlbz7QCYB+J2ZhNss5pYkNyiH+4TSbyZPSTXzrlbdR+/AUfd/MTqb/sfQc/gBDop2C6sSjHJ4y7Ae/6uWFW7pTJLAeX+YB7CIwdwirbaZe7TQ1lNiFb2d00TNPY1bMXBqdqRFq1JjBHEaKj3a5DmnOiO7bDR6iOZPjVX+1J+QTYaBKuIjBlTFivYuv/COGpAuFUBfMPKn+AjeeDV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OouCDYvCmLps4EIbH7BX7C9xO0CVBvV665EwKUqjx7k=;
 b=t67DtgMXQvlipbnvnLhbQO+82TlDlz9bDKc12hwrgSeBctg3hBtbzLZ8bqdOPT97OLKFreRtjdF6fRGcvIQZjkvXVt3k006Ejp8E0X4CB8L1KT9gCFacE3656k9qTy+40jtEr/0O9tlnzf4c/Oi8y97KLe1PF860Cu7u+0GcxK4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA1PR12MB9465.namprd12.prod.outlook.com (2603:10b6:208:593::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 22:01:10 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 22:01:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: Re: [PATCH v5 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Thread-Topic: [PATCH v5 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Thread-Index: AQHdGo+XPlmCwpSNBEGdSSXOvEuv3baOhGGA
Date: Tue, 4 Aug 2026 22:01:08 +0000
Message-ID: <anJgBMFlzHGaVNMm@vbox>
References:
 <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-5-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To:
 <20260723-eusb2-int-handling-v5-v5-5-f32ea6c1a318@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA1PR12MB9465:EE_
x-ms-office365-filtering-correlation-id: caab05a4-e127-4832-569c-08def273e383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ucKjFbt9DVQ6nx0TVieMZqNaroWPDSS1HcbQ8amf/gOlxX4p38aNym5YUapXkM+5Gox1NLFI31HCYAwsKFmncz0ijPc1fO0Cm884XbEOm8vBrqlFBl7WGtSxpOjwrIc1BpmwJko4IPJOuAkj27YVhb5TqZe1DF0xX2x/mrINwgV3U1nofbo2euq3DqINPUPPLkAXL80pbz1RU3dX67/jBMGB4ue9nMUhB8f8w317qrIFEJmrGBGKr5qDt94Vz/v5fpJROHak3B8lsZgUQYObDKW081rhCLAWt0ozL444Hwhi3nijWb+cxTcjlp7kAopCHzVwxI88yurF0JL7jr3zwchD0mkAqCc/w8/Yx2LsiWM8wDmzh0kHY9apBxM4IHfPJ3jDiwzgy4ueB+slK29nglKMJcBGfAFRRNE2VcIxj1x/fc3LWUwXVwVBta2jd5KWgQe2XOseGsmfxT27xjo3+g49Bsg6R3FD0llbITXzF89OYuFsnqTYShA92j5eGQOfMznqFlzKE+23jMn5x0dN6ShX7zcIUCNlFJ3pgRsKFLQqik8ec45shiFLtRP779cV0QCb6DJnzQVDt3c8RdyCu0MxUn8SPm4RxSiWf5Rcbx+3nyNM5bXow65/p/TnnvYSbA2qFjytZ3s5HTwLxeGdIU7EGzXozbOHhc7UOB3LkT5sa0tTct4pLX1/MmCwXj6SusDe2VRyJv+VGZBkWaeH+aD9/TVUCRFqUGJtN29qDQk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWtZeElwS0ZWQ2lKaWhuZk04d0JEWStLazhBMm9JZG40aWc3UUJnTk9VMW96?=
 =?utf-8?B?bTFvWDIvV2pOeGNwNnFJMzgwT0FCeWtWczdNa3JrTHFoRXFSTlAyS0YwU0JV?=
 =?utf-8?B?NVY0RzA3YVpuYXBIS3UvTCt3cVhHYWkvRWhFU290aER4ZGJTUGE4Q21KdHow?=
 =?utf-8?B?aERRYzJDNFJCeEdqdG4vODZNNFoyZjVvbXdTVlZBM0VaUUkvdlljVnBzcTkx?=
 =?utf-8?B?OUR3bU1ndjdFZytzNWVLSDQ4bHluZ05nYmFtMlNaSGR6a0llSThGYzgrYTJL?=
 =?utf-8?B?MHFNeWtSNGJTQndPM1h4djRXRU9EWmRGTVJYMXhKWjl0dm1zL0dpMVY3eDF6?=
 =?utf-8?B?M1FpcUJuL0V1ZVh6TmFyNGV2a0ZLYUVmMzFzTXBReVdDUEdpK2RWSkw0NkxS?=
 =?utf-8?B?aU8vY1l4NW9DTk5scFozT2t5bTF2REpCL2J4bkNRVWZ0c3lxc29XRzhpUE5S?=
 =?utf-8?B?aUtzRGFsWVRIdGtJb2hDTURvTEZDMjA5R2VxcFNsTTk2clhHRi9NUnZ6OHFj?=
 =?utf-8?B?WU9oaEtUVjJMdnk2V1QyYXlXZit4eHMxbHBaVm5kMkxRcjgxWWo5OXZFRm5m?=
 =?utf-8?B?TzQrSE5pZWhJMkh2c2tuR1NaMkdBYUtOVjhhWmNzc0NXZFhYMjdmTEFnQ1Bp?=
 =?utf-8?B?UVkrdjdKejI3Q1NsU1BSWFVyQ2JLRjRXRjNNQm1XWjdTTGF2ZGE2VmlPanEx?=
 =?utf-8?B?R056d0JONlU1ZlRRYmhUY0RyYmI4S2Z6bS9rZWJsYVRPU3BKMWdDNFpaU3pN?=
 =?utf-8?B?WENadzRsdVJNM2gwYlFPNGdIVm1JZmNNT1RMYlRuMzk5UTRnTUZoUG04dHNE?=
 =?utf-8?B?M2VGenRtK3hVMDI2RlNhaE1RWlFnUGZIWVRvZXhwT2hmVE1hbGNHT3dDRnZZ?=
 =?utf-8?B?NXVkWGNhejMwSVY5Z0dYR1dQc251eSthdEhVb1lzdFoyV1V4eW9HbzhCUmhF?=
 =?utf-8?B?WVBoWlQ3aUNySnVOc0J0VjA5Um9xdEdMaXBGTXdMWGttMVdodGFtVkNVbTMz?=
 =?utf-8?B?Ykl2LzNFUWZCZVgrcE9Mc0g0a245RDFnZ0JnUHhQbllDWmptazBFMWtkZFFx?=
 =?utf-8?B?VnZCRXV2ek1BQk5lVDVxRDFXNS9KdTFrYVRnK2h4azNHOFRMOEgrR3kzdFB4?=
 =?utf-8?B?RkRRZzh6Y1VUNVIzLzJsUDFNbTBmdUhlSHRCbDZGMHhNQVE2aGtBbGcyQm9u?=
 =?utf-8?B?eWVwVE9La0lsaFFTdGlyV3NTb24wY0Q2MXFvM0oyNGJKd2N4ZTB6MmRGOHhl?=
 =?utf-8?B?K0xiRmJLbnprR1VWb1R1akVpWUl0dTU3TUVGZkRKNnkwZ1lpbEdjMmF3ZDRC?=
 =?utf-8?B?dEY4Q1IxVzNscnIxMjU2WDVXZzlWVkdkZG15bUt1WkJqOUpRV1BFQ2JZVkVN?=
 =?utf-8?B?ZmNQamtVQmIrU1JmVC80UXhhd3NRMis4dTc0RGg3ZG1RTTE1SmRMSi9sTURn?=
 =?utf-8?B?dWgxeWs1Ykk5NFpGd08yZ2ZhSWhBaGl3RVRhTmVOeW45NWRSdzRtbTFZa3pz?=
 =?utf-8?B?SkxwZW1XaWxOV2IzMWZ2OVhuMjVXYnd0NmNvZ084eEJSYVVYbHZ4NXhBNUJT?=
 =?utf-8?B?d2ZhaEtVcFpaY21iNHhlSVVPZWRiNmtQWE54M2kyNnNjbHpVQUszWFNneFJp?=
 =?utf-8?B?aFBMbURDZWF0MlBLL2dIdWJnL2ZGWDRHSFJTRGdIZGJLQzMvdE1VMmE4MU9v?=
 =?utf-8?B?Uks3U25kdVZ4Y3FZdml6bGZYYmxKZW40RnZzUDlJUXVWeTFtZHdKSE9RZHBQ?=
 =?utf-8?B?RUw5NUpXZEJGamgyL1N5U21kWVBidDJXTFpSK0h5YXpKZHg1N2pVMjVjck1s?=
 =?utf-8?B?V1ZKdS9TWXBPRzBzZDNkY21kRU1JV29oSm5FMzlsME5pc0s3em1kajBNZWNS?=
 =?utf-8?B?cmhMNlNZZFBibFU0N1RreU13L3AyMXNZbktYazBJRmh0YXhCajdWN2FmdjNu?=
 =?utf-8?B?MVhISWx3cWNmZTV4WURWUlF6Z2RTd2thTXZXeC9vN1VMVTZVMjF4U1JYTlh1?=
 =?utf-8?B?K0tSRGpEem9SREh5REczcXhkc2NuZ2FVTGVnWi9URGMyNFYxZmpaMDdFNEhM?=
 =?utf-8?B?cStVc3pWMXhTYWdIU09WQWdvRXVGcFB3MmFGSnhKQUVTc01WaGxVNzZKd3lI?=
 =?utf-8?B?RTZzWWxqdzhsbmdSN2xmcUVpZElpTEpOU29Ea0xtdVRTWFFtWDlUVXFtNGds?=
 =?utf-8?B?dGx2cUFpQTMwb3pJZ2pJZXBScTdyUlZQcS90VE9IOHVXUjZoRjl5NnUzWUh5?=
 =?utf-8?B?YkhHNmtTc3FXK213cnlYUHVLL3NMNnljb0RBQkcyOUdSaFZmamtHOTQrb25v?=
 =?utf-8?B?cE9rZ3FWSVVFUVlnZ3ptMU5FREJDVUJSakFqY2FyeXVWcWdvQU50Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79D131B9B3CD964CA118319CF23D9488@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ipGJaIFFGVXT11NINMY92RQeuX4FRmDC/5j0SNALxpAllWegfgqQPpFdnJfzqAYXvyt1WKyS604iJetGEND5E9ehZG8aNmFQv2UjNGbIWdb/Y1IHTNleS5p3QZ+XD+EoZ7N5bnqLl7DdHq7KHhKu2u4SycsKdbfeHX18LE9gNeTnSIJYTCC8PY+FWNIJzr/xbl/2n7V7oIc3W7lOgFCcIC7j+L2STc6civZBcDjf08N5+C0/TBggvPvKzLT4cdmJGYo9JKS3il4lRGhlVslH4NP19oghXejT46tyfV20vloY075K54oHe1Jlqdd+vTmtcfOXEcIdh9iAzC663iqdeg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1MQBtcilXz5bjc+QQCoEsQhkUe2zC7jDkdWWMzGSHwoyO7g15+D8eqYzS1mnTGQ38ntfqyD+OU3z+bhfr0YHNEyuhmwIHwgOG4DkttK8KX7u0uThKv9NQlK2vupHpbBwuyNuhasbvDsSl0qVCVhffNKA3so/sCG87oCc2V560SQJynFIFOIl11K3ZQ5mYScQgIAmeb8ThB1rlTmQFbirUigwY6GEgoHFUJZHKsnKbzMpa9jTejA1D1GLzxKK2ZfY2EyJRtseMnUcd/bfW230CIfG06fUeD1qzS/uc4csmKxbg3nKIxBtNUCVoAAMRYQIuEC979WEkIEIgGj3LRB/WEz1Gv41Hiu5g4GuL/+bXNkJrxqfW/bUWma8bxTUzwLc4ooWH9kVXQniKRcvqsAn08OyOtV9gxmCe1KHcI1OcnI3zxWyAa7IB6wD8Ai0FxRVH0RnhxrtrU2LWJ2+0PxRoAh9cQnd9v6tCvt3hYVQ3eor9KELDAK69WPpqOYuQJ0qBpR8GfQ4z6GZ1HP/oqo+Z3SwjE++XJAWlt3jvYBXJJbwxT67P8iRvc/p+H4OPYKHLTLBIObmMCOvnjX3rt2CMhNmc2/zXCWQexHQ2pPCaNhDyl/5ifUEsf9UbOVTrTf6iU4UHoXPef6Pxy5WLikX/w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caab05a4-e127-4832-569c-08def273e383
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 22:01:08.5022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbEfAFBJrH1PQgSNHdtv4bUO5Gh/saYi4TIA/Yp5mINN4ASoA+CP5SBmgbVQRfsbmu2eco08GGLKmJdZq8Wxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9465
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3NyBTYWx0ZWRfXzJG4pKlijEyl
 yDIogHewSyALVVEQri2qROT/YecbKD3IwyQrJPAU7gEckdPj0O4omGM/9S+mNpp+QSDbc0K6UnS
 lce1C83zL2E6TF7OlxGU1ccA224f+YE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3NyBTYWx0ZWRfXxzJQ94N42dXv
 L5sFzj2Vcwg1kwxBTNiLS3O0K5kGd7fvDn0ijERUDxRD8cDVoER1RzkwJOJJ9W5AwGcyQvZu0HD
 l2lNy2f1JHCqyAEwKmNiCUzLgHNtCMeYq5PwtwB2N9QvgKg9KEfgOMUj/W7iS44Z+ao5Dm5xpby
 aMITbvn/8JiZhHfYupPjX/EAvFzJKZOPflJ2CO205RyzMosNkYvs6ujBMrsIUI/xN9Gy1pRoJPy
 12Dr6DMqBZzSlXI5sqxGi7i5CbllWvQLWpgSo/m0VrHzmKLfnWMDevkTmt5HYgozYbHG3GuTEVG
 +wOGhnWZYB9TyM3jMD9563vt+RJrMXug/n6wCPbXODTjLogNpKTshjpX3lDzRDsJ8a8XpEUaBoE
 VnUc+fSuGeDTHS3/hOFvedk117THj4I5ESZztRUOaPUXBqUSJJKXAO9+7O/ARGWY2jnb/pAjzBN
 7V5pUtfm8+P3jvadENQ==
X-Authority-Analysis: v=2.4 cv=DtdmPm/+ c=1 sm=1 tr=0 ts=6a726130 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=QU4UNRELPDOJWLpp1BEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fO2NxngfWBmQF7qyRoBjqDt_6D2fQQCv
X-Proofpoint-GUID: fO2NxngfWBmQF7qyRoBjqDt_6D2fQQCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040177

T24gVGh1LCBKdWwgMjMsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IGVVU0IyIHRh
cmdldHMgaGFuZGxlIHdha2V1cCBpbnRlcnJ1cHRzIGRpZmZlcmVudGx5IGRlcGVuZGluZyBvbiBk
ZXZpY2UNCj4gc3BlZWQgd2hlbiBvcGVyYXRpbmcgaW4gaG9zdCBtb2RlLg0KPiANCj4gQWNjb3Jk
aW5nIHRvIHRoZSBlVVNCMiBzcGVjaWZpY2F0aW9uLCByZW1vdGUgd2FrZXVwIHNpZ25hbGluZyBp
biBob3N0DQo+IG1vZGUgaXMgZGV0ZWN0ZWQgdmlhIGRpZmZlcmVudCBkYXRhLWxpbmUgYXNzZXJ0
aW9ucyBiYXNlZCBvbiB0aGUNCj4gY29ubmVjdGVkIGRldmljZSBzcGVlZC4NCj4gDQo+IFdoZW4g
YSBsb3ctc3BlZWQgZGV2aWNlIGlzIGNvbm5lY3RlZCwgdGhlIGhvc3QgcmVwZWF0ZXIgZHJpdmVz
IGVEKyB0bw0KPiBsb2dpYyAnMScgdXBvbiBkZXRlY3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0Ig
bGluZXMgZHVyaW5nIHJlbW90ZSB3YWtldXANCj4gKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rp
b24gNS41LjE0KS4NCj4gDQo+IFdoZW4gYSBmdWxsLXNwZWVkIG9yIGhpZ2gtc3BlZWQgZGV2aWNl
IGlzIGNvbm5lY3RlZCwgdGhlIGhvc3QgcmVwZWF0ZXINCj4gZHJpdmVzIGVELSB0byBsb2dpYyAn
MScgdXBvbiBkZXRlY3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0IgbGluZSBkdXJpbmcNCj4gcmVt
b3RlIHdha2V1cCAoZVVTQjIgc3BlY2lmaWNhdGlvbiwgU2VjdGlvbnMgNS41LjE1IGFuZCA1LjUu
MTgpLg0KPiANCj4gU2luY2UgdGhlIGVVU0IyIFBIWSdzICJEUCIgYW5kICJETSIgaW50ZXJydXB0
IGxpbmVzIG1vbml0b3IgdGhlIGVEKyBhbmQNCj4gZUQtIGxpbmUgc3RhdGVzLCBxdWVyeSB0aGUg
cGh5IHR5cGUgYW5kIGNvbmZpZ3VyZSB0aGUgd2FrZXVwIGludGVycnVwdHMNCj4gYWNjb3JkaW5n
bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFw
YXRpQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFj
b20uYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1xY29tLmMNCj4gaW5kZXggZjQzZjczYWMzNmZmLi40YzU1OWI5N2M2MjcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBAQCAtODUsNiArODUsNyBAQCBzdHJ1Y3QgZHdjM19x
Y29tIHsNCj4gIAlzdHJ1Y3QgaWNjX3BhdGgJCSppY2NfcGF0aF9hcHBzOw0KPiAgDQo+ICAJZW51
bSB1c2Jfcm9sZQkJY3VycmVudF9yb2xlOw0KPiArCWJvb2wJCQloYXNfZXVzYjJfcGh5Ow0KPiAg
fTsNCj4gIA0KPiAgI2RlZmluZSB0b19kd2MzX3Fjb20oZCkgY29udGFpbmVyX29mKChkKSwgc3Ry
dWN0IGR3YzNfcWNvbSwgZHdjKQ0KPiBAQCAtMjcyLDE1ICsyNzMsMjMgQEAgc3RhdGljIHZvaWQg
ZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShpbnQgaXJxKQ0KPiAgCWRpc2FibGVfaXJxX25v
c3luYyhpcnEpOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBkd2MzX3Fjb21fZGlzYWJsZV9w
b3J0X2ludGVycnVwdHMoc3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0KQ0KPiArc3RhdGljIHZv
aWQgZHdjM19xY29tX2Rpc2FibGVfcG9ydF9pbnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fjb20gKnFj
b20sIGludCBwb3J0X2luZGV4KQ0KPiAgew0KPiArCXN0cnVjdCBkd2MzX3Fjb21fcG9ydCAqcG9y
dCA9ICZxY29tLT5wb3J0c1twb3J0X2luZGV4XTsNCj4gKw0KPiAgCWR3YzNfcWNvbV9kaXNhYmxl
X3dha2V1cF9pcnEocG9ydC0+cXVzYjJfcGh5X2lycSk7DQo+ICANCj4gIAlpZiAocG9ydC0+dXNi
Ml9zcGVlZCA9PSBVU0JfU1BFRURfTE9XKSB7DQo+IC0JCWR3YzNfcWNvbV9kaXNhYmxlX3dha2V1
cF9pcnEocG9ydC0+ZG1faHNfcGh5X2lycSk7DQo+ICsJCWlmIChxY29tLT5oYXNfZXVzYjJfcGh5
KQ0KPiArCQkJZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShwb3J0LT5kcF9oc19waHlfaXJx
KTsNCj4gKwkJZWxzZQ0KPiArCQkJZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShwb3J0LT5k
bV9oc19waHlfaXJxKTsNCj4gIAl9IGVsc2UgaWYgKChwb3J0LT51c2IyX3NwZWVkID09IFVTQl9T
UEVFRF9ISUdIKSB8fA0KPiAgCQkJKHBvcnQtPnVzYjJfc3BlZWQgPT0gVVNCX1NQRUVEX0ZVTEwp
KSB7DQo+IC0JCWR3YzNfcWNvbV9kaXNhYmxlX3dha2V1cF9pcnEocG9ydC0+ZHBfaHNfcGh5X2ly
cSk7DQo+ICsJCWlmIChxY29tLT5oYXNfZXVzYjJfcGh5KQ0KPiArCQkJZHdjM19xY29tX2Rpc2Fi
bGVfd2FrZXVwX2lycShwb3J0LT5kbV9oc19waHlfaXJxKTsNCj4gKwkJZWxzZQ0KPiArCQkJZHdj
M19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShwb3J0LT5kcF9oc19waHlfaXJxKTsNCj4gIAl9IGVs
c2Ugew0KPiAgCQlkd2MzX3Fjb21fZGlzYWJsZV93YWtldXBfaXJxKHBvcnQtPmRwX2hzX3BoeV9p
cnEpOw0KPiAgCQlkd2MzX3Fjb21fZGlzYWJsZV93YWtldXBfaXJxKHBvcnQtPmRtX2hzX3BoeV9p
cnEpOw0KPiBAQCAtMjg5LDggKzI5OCwxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fZGlzYWJs
ZV9wb3J0X2ludGVycnVwdHMoc3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0KQ0KPiAgCWR3YzNf
cWNvbV9kaXNhYmxlX3dha2V1cF9pcnEocG9ydC0+c3NfcGh5X2lycSk7DQo+ICB9DQo+ICANCj4g
LXN0YXRpYyB2b2lkIGR3YzNfcWNvbV9lbmFibGVfcG9ydF9pbnRlcnJ1cHRzKHN0cnVjdCBkd2Mz
X3Fjb21fcG9ydCAqcG9ydCkNCj4gK3N0YXRpYyB2b2lkIGR3YzNfcWNvbV9lbmFibGVfcG9ydF9p
bnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGludCBwb3J0X2luZGV4KQ0KPiAgew0K
PiArCXN0cnVjdCBkd2MzX3Fjb21fcG9ydCAqcG9ydCA9ICZxY29tLT5wb3J0c1twb3J0X2luZGV4
XTsNCj4gKw0KPiAgCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVwX2lycShwb3J0LT5xdXNiMl9waHlf
aXJxLCAwKTsNCj4gIA0KPiAgCS8qDQo+IEBAIC0zMDMsMTIgKzMxNCwyMCBAQCBzdGF0aWMgdm9p
ZCBkd2MzX3Fjb21fZW5hYmxlX3BvcnRfaW50ZXJydXB0cyhzdHJ1Y3QgZHdjM19xY29tX3BvcnQg
KnBvcnQpDQo+ICAJICovDQo+ICANCj4gIAlpZiAocG9ydC0+dXNiMl9zcGVlZCA9PSBVU0JfU1BF
RURfTE9XKSB7DQo+IC0JCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVwX2lycShwb3J0LT5kbV9oc19w
aHlfaXJxLA0KPiAtCQkJCQkgICAgSVJRX1RZUEVfRURHRV9GQUxMSU5HKTsNCj4gKwkJaWYgKHFj
b20tPmhhc19ldXNiMl9waHkpDQo+ICsJCQlkd2MzX3Fjb21fZW5hYmxlX3dha2V1cF9pcnEocG9y
dC0+ZHBfaHNfcGh5X2lycSwNCj4gKwkJCQkJCSAgICBJUlFfVFlQRV9FREdFX1JJU0lORyk7DQo+
ICsJCWVsc2UNCj4gKwkJCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVwX2lycShwb3J0LT5kbV9oc19w
aHlfaXJxLA0KPiArCQkJCQkJICAgIElSUV9UWVBFX0VER0VfRkFMTElORyk7DQo+ICAJfSBlbHNl
IGlmICgocG9ydC0+dXNiMl9zcGVlZCA9PSBVU0JfU1BFRURfSElHSCkgfHwNCj4gIAkJCShwb3J0
LT51c2IyX3NwZWVkID09IFVTQl9TUEVFRF9GVUxMKSkgew0KPiAtCQlkd2MzX3Fjb21fZW5hYmxl
X3dha2V1cF9pcnEocG9ydC0+ZHBfaHNfcGh5X2lycSwNCj4gLQkJCQkJICAgIElSUV9UWVBFX0VE
R0VfRkFMTElORyk7DQo+ICsJCWlmIChxY29tLT5oYXNfZXVzYjJfcGh5KQ0KPiArCQkJZHdjM19x
Y29tX2VuYWJsZV93YWtldXBfaXJxKHBvcnQtPmRtX2hzX3BoeV9pcnEsDQo+ICsJCQkJCQkgICAg
SVJRX1RZUEVfRURHRV9SSVNJTkcpOw0KPiArCQllbHNlDQo+ICsJCQlkd2MzX3Fjb21fZW5hYmxl
X3dha2V1cF9pcnEocG9ydC0+ZHBfaHNfcGh5X2lycSwNCj4gKwkJCQkJCSAgICBJUlFfVFlQRV9F
REdFX0ZBTExJTkcpOw0KPiAgCX0gZWxzZSB7DQo+ICAJCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVw
X2lycShwb3J0LT5kcF9oc19waHlfaXJxLA0KPiAgCQkJCQkgICAgSVJRX1RZUEVfRURHRV9SSVNJ
TkcpOw0KPiBAQCAtMzI0LDcgKzM0Myw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV9kaXNhYmxl
X2ludGVycnVwdHMoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSkNCj4gIAlpbnQgaTsNCj4gIA0KPiAg
CWZvciAoaSA9IDA7IGkgPCBxY29tLT5udW1fcG9ydHM7IGkrKykNCj4gLQkJZHdjM19xY29tX2Rp
c2FibGVfcG9ydF9pbnRlcnJ1cHRzKCZxY29tLT5wb3J0c1tpXSk7DQo+ICsJCWR3YzNfcWNvbV9k
aXNhYmxlX3BvcnRfaW50ZXJydXB0cyhxY29tLCBpKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZv
aWQgZHdjM19xY29tX2VuYWJsZV9pbnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20pDQo+
IEBAIC0zMzIsNyArMzUxLDcgQEAgc3RhdGljIHZvaWQgZHdjM19xY29tX2VuYWJsZV9pbnRlcnJ1
cHRzKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20pDQo+ICAJaW50IGk7DQo+ICANCj4gIAlmb3IgKGkg
PSAwOyBpIDwgcWNvbS0+bnVtX3BvcnRzOyBpKyspDQo+IC0JCWR3YzNfcWNvbV9lbmFibGVfcG9y
dF9pbnRlcnJ1cHRzKCZxY29tLT5wb3J0c1tpXSk7DQo+ICsJCWR3YzNfcWNvbV9lbmFibGVfcG9y
dF9pbnRlcnJ1cHRzKHFjb20sIGkpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNfcWNv
bV9zdXNwZW5kKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiBAQCAtNjE3
LDYgKzYzNiw3IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICAJaW50CQkJcmV0Ow0KPiAgCWJvb2wJCQlpZ25vcmVfcGlwZV9jbGs7
DQo+ICAJYm9vbAkJCXdha2V1cF9zb3VyY2U7DQo+ICsJc3RydWN0IHBoeQkJKnBoeTsNCj4gIA0K
PiAgCXFjb20gPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpxY29tKSwgR0ZQX0tF
Uk5FTCk7DQo+ICAJaWYgKCFxY29tKQ0KPiBAQCAtNjgzLDYgKzcwMywxOSBAQCBzdGF0aWMgaW50
IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChp
Z25vcmVfcGlwZV9jbGspDQo+ICAJCWR3YzNfcWNvbV9zZWxlY3RfdXRtaV9jbGsocWNvbSk7DQo+
ICANCj4gKwlpZiAocWNvbS0+bnVtX3BvcnRzID09IDEpDQo+ICsJCXBoeSA9IGRldm1fcGh5X2dl
dChkZXYsICJ1c2IyLXBoeSIpOw0KPiArCWVsc2UNCj4gKwkJcGh5ID0gZGV2bV9waHlfZ2V0KGRl
diwgInVzYjItMCIpOw0KDQpMb29rcyBsaWtlIHlvdSdyZSBnZXR0aW5nIHRoZSBmaXJzdCBwaHk/
IElmIHNvLCBjYW4gd2UganVzdCB1c2UNCmRldm1fb2ZfcGh5X2dldF9ieV9pbmRleChkZXYsIGRl
di0+b2Zfbm9kZSwgMCkgaW5zdGVhZCBvZiBoYXJkIGNvZGluZw0KdGhlIG5hbWVzPw0KDQpUaGFu
a3MsDQpUaGluaA0KDQo+ICsNCj4gKwlpZiAoSVNfRVJSKHBoeSkpIHsNCj4gKwkJaWYgKFBUUl9F
UlIocGh5KSAhPSAtRU5PREVWKQ0KPiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJf
RVJSKHBoeSksDQo+ICsJCQkJCSAgICAgImZhaWxlZCB0byBnZXQgdXNiMiBwaHlcbiIpOw0KPiAr
CQlwaHkgPSBOVUxMOw0KPiArCX0NCj4gKwlxY29tLT5oYXNfZXVzYjJfcGh5ID0gcGh5ICYmIChw
aHlfZ2V0X3R5cGUocGh5KSA9PSBQSFlfVFlQRV9FVVNCMik7DQo+ICsNCj4gIAlxY29tLT5tb2Rl
ID0gdXNiX2dldF9kcl9tb2RlKGRldik7DQo+ICANCj4gIAlpZiAocWNvbS0+bW9kZSA9PSBVU0Jf
RFJfTU9ERV9IT1NUKSB7DQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA==
