Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795568630;
	b=wLu4j7sxBvsoi8KrCyCT8g5zTiKe6CbB2cN/l3n8J7BsDLK+STLGSKEHHKDLO7oRgy6m
	 8m7t+/QL/qCKHDg1FEgufs6Mpn+gKEDk4hWNLE9QNjGK9gMCarGEy7hvJJY9zXhu4PvRW
	 Cds/xQ5t2JcvOdxALrHt5XamPRzZMSlEX0Nv7MbC4+Zdm4ZLRrrwGA9xDyVr6FQBSpoG1
	 RiQK5phLDwo8Bzc09RC3rzBKIb1BQs9biERGBjbZdDnCpPBrEg+3DmJhVFEIIiX2lptwW
	 d6nUGoRtBcPl8296tP3gcYQP+hqVjdWV2kX6K6qJpxuWR6N3iOaTdlyApMSSnEq8KHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ll/5dIh4f9eVCpzncG2dcnMYzhgw941nt9dwGzCsaWM=;
	b=Hl+eZsPwnlTGapsmETq+xfe1bFRbyv+svgFmUXCQ94odIfwzkBEcoQGEIgUj/x2Fn+sL
	 SmO3DOTroCxOckNq+TD5VUNycsln9d282AlLYj0JXedBWELE++EHYmWw21yXBTnH7PjmY
	 5CqE8ElF5bba+GUsX6pXMn2LWP9X7y8l+ZprI4BzYxDkTGKrDcqFr1tAcE1vChj4cq5et
	 1bdZjFOp5ohwwYql+Vl0uHnmBFkR/qzR6owefGi2e6ptQYJkawJ4lt/NbfyLbIiWVkWYM
	 rwckIkhWfdgqQeAxl2QlQ4uzqZgwaaaBPoNcfApbS76A2vpwNxSHRxJkIzSm8KBBqdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Ziits5TB;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UVkxI03x;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=swiMfqZJ;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB45606A31E;
	Wed, 25 Nov 2026 01:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Ziits5TB;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UVkxI03x;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=swiMfqZJ
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMYF3F379542;
	Tue, 24 Nov 2026 17:03:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ll/5dIh4f9eVCpzncG2dcnMYzhgw941nt9dwGzCsaWM=; b=
	Ziits5TBjMCUUX7F7uvUyAuGUE0LO+KGMLuVNx4gUMd1N80vLsAvHh4a+pWirXLL
	lp9zLqWq8g3naJDHqLO8fm/Bup+hPVSXO7pIYbecwTQ/dURRdIJ1QWMq396Pmb0A
	42jVXTDRpK1vBNuCPg4JRz5EM8adbfInYGTNHu3MV3GWm8VASAAWymVwp9dhriNe
	KcR2SFnR+GbCodL6Daak27SYHvR3YkJigZ7/tXwjJPLWctl3NiX0pbV92UI/ZGRq
	guo86chsOxDYizco2j2+fhnvdkUZY51v9sN3++JRCcHxqjXmIMmTbAX1vnKAZKry
	Gi8yhPXefuUJ5fxsdFSrPQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4j5jrgh0ek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 17:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795568611; bh=ll/5dIh4f9eVCpzncG2dcnMYzhgw941nt9dwGzCsaWM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UVkxI03xPkXh+hhmk6lGj8s6rI2ZG9BGfzvB7tL+FHihmQkPjC2vIwP9r24a+j9pL
	 8KDwXkUDJqZIOvi8MQ5KwEijeZqg99bmoLQnscPfuZ+5eIm7/2Xxzcn5eMG+uHLf4e
	 1G3RnVftEc2LZPzZAwuIQUQuzZuvihXAh4nVkWAqNjQqFj3kvB9DHk8ZyyT7fPj9Dr
	 mI4ulWEYmFD8WDH9NcHMsOQ0L6l3hNGCHhadrPIWxRL/MzLwyeN6DT2q1YT6Fl6hKI
	 cGRmc3YqJY2XeIN/4vVMApRBkboGS1NNoeBypWmvA50nS7iCBFwKDJhz/jaDZjP3hp
	 2Ghhl5tp86LPg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A816401DC;
	Wed, 25 Nov 2026 01:03:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 21A92A0070;
	Wed, 25 Nov 2026 01:03:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=swiMfqZJ;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D3C6E404D1;
	Wed, 25 Nov 2026 01:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofqsUX0+6a9ZeZoi42mvUqWWeV1ot1F5013c60M5jSc51kXNTTbkZ7rNf9kJTnYWklHme0h16wgqyMmgsB4j4xigv8HvKHPCWD/Q1tQoy2aytIqPaEcYK8qrYzfeEVJo/Dywy8m9RiHbHDBj7UkgPayqwj7u6GHNtVbaDHWw94iENcdg+iXrB0JkBr7s5Diz4P32zA2mZTLQkaXEwpOJ9US9tf8PNhwjCVurU4NiX/fY7SzAUYLO0VAbBPItBuTi59HdRYYn+CnMc1lYZ6iiE4KSDTXbgxz6bguOGaChX7RLLk7FGVKiuM4NuZMLdaD75mT0Ff7XCCpE3Yp/mbsdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll/5dIh4f9eVCpzncG2dcnMYzhgw941nt9dwGzCsaWM=;
 b=K+1b16gGEv/mAU/OvNOBBkOnBU+7Yc47W1Rjj7y1P2lX71g7azlfRbscgmpwAnqDLimxlibChJm5B0I7OLsjkyfMHb+hR63h0GvX50JqXU0wLG5yDew4BHVCzEpO4EJjP74v33/dhu5rcp7J1d9ghwpR+QP6GkSRS0lIPtI2zlMD6j0EzxDJLDpD/J3zHlVz5eLXkcy2b391d2xjS4z9RdxH8wnpN0xtNx1O99JtF1YMPCeOVQpKbZt6T4iTOEhAerC6KNAruAlNjGDsCXG8XjzpNsNFkm+ejdwKrN17nrYJQWais9ldrE9iISvI22yNXT99+0YS11fYtXzwZXX8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll/5dIh4f9eVCpzncG2dcnMYzhgw941nt9dwGzCsaWM=;
 b=swiMfqZJdpVer6AbGe4gX8jniXRNdCysOgf5CEeFC3ZkroV8foWL5fgeILAI+vGy2gAEhCQE52ckrAv3xEXtWPAqODZHVaGD9II87DKsHro5zr8HhmvTmqlSXQcNqpXVxw2GOnhO8Sz1x5PLNiCVMb/00GvjfV2icqgC0aWwOJU=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by LY0PR12MB461782.namprd12.prod.outlook.com (2603:10b6:404:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 01:03:08 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 01:03:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 1/2] usb: dwc3: wait for the port to leave RxDetect before
 xHCI reset
Thread-Topic: [PATCH 1/2] usb: dwc3: wait for the port to leave RxDetect
 before xHCI reset
Thread-Index: AQHdbeAoSmz8E+uCP0GwS2tYVXNXS7c+FbOA
Date: Wed, 25 Nov 2026 01:03:08 +0000
Message-ID: <awYspGsimvWjR4JY@vbox>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
 <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
In-Reply-To: <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|LY0PR12MB461782:EE_
x-ms-office365-filtering-correlation-id: 8f793844-1347-4b6e-f34f-08df4a8fde57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|38070700021|10067099003|261026140227099003|261009223027099003|261028144727099003|11063799006|56012099006|4143699003|261021121427099003|261021123027099003|261022105027099003|261026121527099003|261022075727099003|261102123227099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 I9KJi57lsexX9MoNQ/+akVHxTHPxxq3SrPXKxy1jYrgz65DH50Zaq1W54i3bheL+atd5BaFnHgtK0rNiPUez7X4/nGVtWm7b55orFZSo+IiBmWPXLraBbkRyz4TYzZffjBgmgPOrxjGAVD6Xsq7M/xtiZ8CSHqyTka+t3ptNY6GT0js1p3KachyLuQUmxfLo1cn8/GVsapuW3XemxJM1Rpt7Bi1HAgwME1tatUGEbS6Tp/SIAII3j7xBWYLPTNK9xn5bZ73YfKFcJvaD5msM6/VovSQWubZAg2cyi/S95A/dEZ5e8TRKDTnNHNADFGpagLdAFFNjdwoyt25udsk8sxQ8X1y453Nn3zPb01UE3eqIzNfuzZoo1Vj9LKAAOHc2IBKNZY0UbAwG+z1bA8ktxOQKTbgDsNyovsZnt14qIYRBObeiOUPxY+REQE2iecNNXdY/90kH2fC4ev6OHJN5nOgEAbwXdiPKrUp25gDaGnHhxE1ZkXNjtCzah+MvfctahhuAvksW9JMsjBtRHWzey8cVlll2SUkV0upY12UjZLQUHkUIYvaAn1VzHctY2rR7sp9LHJg5GcUvq8syKD8Z0ZocGKjUQYINaTxl4Ob5HuQAZ2/O//gOu9paeE8o0ZqgbE5Wsla1vrWuUmBfmZ1rRyvdnCoT+c0269AL3kY6uOYVuoBvqD2vfMdYjPCvlIjghoqjPRTHchmrw9Kr8k/shajboYBiQgqOosFq/b17Wjw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(38070700021)(10067099003)(261026140227099003)(261009223027099003)(261028144727099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(261021123027099003)(261022105027099003)(261026121527099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGFldzZReXpkeXFNYW5vdTNzeWJnOWxBejN6SDkrVHlXNXZ6R1UyaFJaSmhZ?=
 =?utf-8?B?V2tWdnk3em9rUnBUZDA2bmVMSDIwa3h1ZlgzbjU3TjBjZDVuR0dSdi9BbnBw?=
 =?utf-8?B?UlJKRUJ0N0JJWXRtbHZ6YU1SdUhKRVI2dzZJMGJZbzRja1R3cXZHbWVka2hu?=
 =?utf-8?B?bHlMYStlZnV6S1VwNTlwL0tsWjl1UzEwSDQxUVp1UzlLTGtQQXl5WGRRcGsz?=
 =?utf-8?B?YVdYSFNBZFBESTBiK28rcXUzSkNaY3lzSWFOdkt3V0o5dDBjUklnUndnVk5T?=
 =?utf-8?B?YUd2VnFkUGpVYUk5RDY0VlhHWDJZNkxRa2JHMnJiU0s5SFNya2tyb3Yyb1NP?=
 =?utf-8?B?cENhUlcxL3ZyNmpDNFJXSkRMZFJ2RUxRL0E3MERFWC9FRVhlZkw3ZmJLaFl0?=
 =?utf-8?B?d2R5Q05GcXlVc21Lank1cGEwQ0YvT1hjaUFiTjhwS0UyQkJOV0tWaDg1ekR1?=
 =?utf-8?B?VmVsbzVzZ3lvQWZtc2hPTW5CZU5ETEplQlFJQTYwYm5ZNzZtbU9mcEZWWlhh?=
 =?utf-8?B?U2k1WXlxcnJ2Zjk3U3ZoYVptd251MzArQlF5ajNQQmh1MXJwMTNoUXpaL3dC?=
 =?utf-8?B?bkdpZ2lidmpiaEFic2tRTnVhQ3FFSzc4QUsxOHQxMXdrbVZLNE9rcUdJUEZl?=
 =?utf-8?B?aDkvNkwvSDE5ZkdPeGZNRzNpZUJQU3haNisyUzdpdnhoeHhoczluVFF1Ung0?=
 =?utf-8?B?ZEo0V0krZ3JUQ3ZlNUkrVC9KQXpwdEt2S3VlSDlnOG5iREd1TnljcStxMkZU?=
 =?utf-8?B?Tk9JT0JDaStOMzRLZzkxb3Yya1J1Sks5TExvRzJTOHNDQzB2RnBaZjVUWmZ4?=
 =?utf-8?B?QjM1Tnl4cmlXdEFTbWQxSzRoV1plNHhjRHFqTUYydTZ0SjBUMDI4aERtVEhF?=
 =?utf-8?B?dFVkZ2RQY2lwVmN2d1J0bWN3ZjVtTUJhZnVuKzRBUHF4NG54ckZrVk5BNXZC?=
 =?utf-8?B?clBDU2V6V1pzeXFIdnpKU0k2Ky95UjZ6U1RQM2lnUFFTd2p3elNXK1JFT0dI?=
 =?utf-8?B?K21mUVlUTTNUa1JISjF1dzg3WWh0RG8wcm1sSForTWp0RUlJdXJkdTBKL1hs?=
 =?utf-8?B?UUtZZ3FLT1AzUG9iMitEOWsyNVFzZ3d2TFFTd3JGS3krc0V0eWhQSk5pNkxN?=
 =?utf-8?B?T2MyVGJnbTRXT2VtT3crcjBpK005bmdLOUh1YTBJTnUyWUNsbDlUM0NYdHdZ?=
 =?utf-8?B?QXVCK1ZHc2tGbWdrT2c3b1JKSnk0TUptYVkvSkM0R3U5eXpscGhzZVFlaEZr?=
 =?utf-8?B?bDA4cHFFTjBUdGEzR2lDSFArdDVkaDFscTJ3T1Q0NG0wbWtmV282bHJ4ZGJw?=
 =?utf-8?B?eUovcDNBYnhvN3pKNzRZZGhDOFBtL2RzdXEzUnZGRUxxeGJrNlhseFgvSnJZ?=
 =?utf-8?B?dG1pUGN4N2ZRQkUveG51VkYyQVVsdUh2cXp3Wk1zeUxvbWlkSk4rME14L3hR?=
 =?utf-8?B?cTR4RTNlMXgxUjNBT1E5QjNkM1FMaE5NdlVubHQ2T3N4aUJndlVZcmxiWmU0?=
 =?utf-8?B?aGx5ZzZDUWNnK1V5RmRkdlpvUE5HTDFlMitvbVZPQmNoSFFwYXRLdFVuVWo0?=
 =?utf-8?B?dmJMOFFkanVMS25ZNHNhRE1TWXgvdDZWeTFxci9BZmZpcnVVSU9SQm1NYWh5?=
 =?utf-8?B?YkNYcFA5b1VKcWxkY21Mb3lOeEYvK3lqcldUL0Roc0UxN2VQeUZRdC9OK1V2?=
 =?utf-8?B?bGVwTGRSdUU0OVVxZG9CM0lKSzlVMnpzQVF0cVVnU3lEN0lqcHhFNjlWY3BX?=
 =?utf-8?B?M1JMUnBvZXFJbk83VXVIemlGWSt6Yi9tQjFxL0Q1bldGZ214c3JCUkhkb3Fv?=
 =?utf-8?B?YjRCUjFSZmhWaGZSMzVhejc2SElaZEMvRUgrUnh2ckpndUtFaStRR1p4L1VP?=
 =?utf-8?B?TG0rdS9oTFIxd0VYRktFY3lCQjlrK0JmUWsxWWYzOTh0NkRaLzJFUjFBSnJL?=
 =?utf-8?B?TWpoaGRXamhoMW5ZSEdDMkhSUEVMMmw4NFhiQVlnUC9rdEVsYWxkM1YvbFBK?=
 =?utf-8?B?TTQ1ZU1NTjcxaG9YYllERVp0eTM1YndTSWhKWjlJaWgvZVR4Ni9PdXBPUHB2?=
 =?utf-8?B?WWpqNnFicWdiTW4xRlVoS01jcERmdkVua3crcHhsYzZva1dXZ2JIdU9vbmht?=
 =?utf-8?B?N3VNenc5L015clc2YmRGV2NWM2hEQ0ZkOWllVXJWQjZJQnR4MVRHSVg5S3dK?=
 =?utf-8?B?RCtFTkdnVVdLMUs1MTgxeUhaQVM5cUgwQzJSc2hBMTBGL0VuS0N2ZnBycWJk?=
 =?utf-8?B?MWtUYzIzMXpydWpVS256VkVBUVVUamhqbkp5ekVGTHhvTFJkZlJPQU9HOEtQ?=
 =?utf-8?B?cXpaZGFaZ0QzL2FYRUh0ZnZLcVVKcHJMWkRsOFRNWHN4bk9iSm5Cdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8F2E58C3FA2204DA83670693D556857@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	WLHtbv7yHyLDqhKk5GQWKwSRrci8cIvI78WAYPibzn83dSxD75OvTmA4oaizGNNLIJw/MOPolxql/2O7K+dZfI/4dqrUMeFwL3L0skmYlZy3cs2OU67MbGde42nYvxU3aJUX8YEVcEbASoaXjRR3lPKKenruWdS8k6JiY4nWqleMvW68bIiQA70gU34cDeuMomDRDw3LpniEXk13RJ2xAXzQEpIfN3dzzc1+vo3Z/0h6uibjOskjso9SFurKHXwhBrZICQ6EgumYh32RSSmjBR6zDiIvIA0YtIFW9+SHyQiQBFVm4ngydhikhh+L66qpVHK7rwvVw9cCD2ARoRPLQQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	47u8scYi6Udt0lq7boOS0SeeiXXWGlQTZiF0K0Oa77QFOuBS45ZZCKhWqAc8HjDGi8Rt/K0FgYd1+GgBP0tne9UlxgQL2wzyVDHRwR4qvsWMyg7DEcXsT6u2gZF9WWrNiGXdPLHeFTySd86t5QTPmALsBcK1w6Kp6EFffwwr+OeiRKqjKYxQujheXeYtZ2+6DdCR14Ua1A3csXhzOh2O9CTOYYYEN8US4o7kA8ka4MTevPQStj7OAXYgOchuz2RYgv7l9BT6UTMzxj6bSTSxu+uVUxRJGgmyanvjToTCRmCYW+SiZyIBg4TnRmTEeYmpUf3mCr2BO/b78sl2L8YvE6Nm4e4J2h49TK/6UJ6LwMp0U3/PFpxSw1tQvOPsfRr+Zpjy1veByB0u+5krWZwYLSrh9OZRfn820CWT/yyfY7FgYB49ybIjNoKtLB0ckyEnvRLhetF6d+6zB8I49iGVZRw2G2Hy2JM66fUuFIc4HE6KK1Gi3R/UPGLbdTyNCrNNHBe7AuakvG1M2AYBhrxU4oYJI8prZGKykpx+2R2hQDSkVpeThJNLPIyWlnr4oXHXMaWyzbx+tgJykhtDYAXhTxE/yQhX0OVtr/AeX5vHKFI/hg4V8VTgIRI41h8UkT4uBh9yD8WF4ZD0F0I4B5NwvA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f793844-1347-4b6e-f34f-08df4a8fde57
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 01:03:08.0829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrrNA+wTeAXqD5DJnzEBg4w15tMasUzQ0UgPqQHcG/f2AnAo4C/RJyi95bSzIhh3rxN0anroybfmb/MPYQeM9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB461782
X-Proofpoint-ORIG-GUID: WDKqAIq_DB1ssPGPXxzzokYcv4VBJdHJ
X-Authority-Analysis: v=2.4 cv=NcxzRGD4 c=1 sm=1 tr=0 ts=6b0633e4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=hEdfcAjkDTFuX0a5:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22
 a=jSPayVjLy6xbsuKauFBc:22 a=8AirrxEcAAAA:8 a=FY0tnBsIBtAkQn0Ax6EA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMyBTYWx0ZWRfX+BgfWnWW/anT
 bbJBiEWwE0m6cwt8EgaMbXyEGbI0h+0oxhqUJNOHozy0+29zFKbCz9Ld0K3aDHrXPfjQcUYH/z4
 g9cf/ZTse59JVyWXCoD9up4Hl8Y0W1A4csTLfKo+HifZ7lzjJqJS5Vxk9h+2YO/acPwyIK3DyJp
 xcXL6KI4UUvupnhm6S5cDUars4NotxA2732sjxKELnba0xzQNN0XJHhuOQ2icVLvrj/XdvPqn6v
 MhLRA7zO0LQYaXh0kQ4MvvR4viStLeD4hHH7qHUlVjMx4B3Vg95k0tUk0D7VU84pov1h8eQ/h9L
 HuHLuilaa3C6zF8nEk8QEGXo3rSdb4NjfcRT3Jrl//N9FsjBAqc9OMMWM0jKNF2oW5LzQqZ639W
 dt1kS40zD0DrQZBZq0MVQbGsJEVM+HF8UIiDKRTipePDTzfXocycpZiB3gS0K2J5J+8GDE+RijQ
 tbg47KkIbW7VootNN2g==
X-Proofpoint-GUID: WDKqAIq_DB1ssPGPXxzzokYcv4VBJdHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMyBTYWx0ZWRfXyG42cx7uCODN
 tsl3CyyjNddxrfkOMsPSAvv8b6FGivMpvAv33K4kuChrnzxM2XmEtaynQkK5yEYnd/Biz36bb8G
 JwzFJcpiply+4bXJCbSepbRsG8OD3BY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611250003

T24gRnJpLCBOb3YgMDYsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IEZyb206IFh1IFlhbmcgPHh1
LnlhbmdfMkBueHAuY29tPg0KPiANCj4gV2hlbiB0aGUgaG9zdCBjb250cm9sbGVyIGxvc2VzIHBv
d2VyIGR1cmluZyBzeXN0ZW0gc3VzcGVuZCwgdGhlIHBvcnQNCj4gc3RhdGUgaXMgbm90IHJldGFp
bmVkLiBBZnRlciBwb3dlciBpcyByZXN0b3JlZCwgdGhlIHBvcnQgc3RhcnRzIGluIHRoZQ0KPiBE
aXNjb25uZWN0ZWQgKFJ4RGV0ZWN0KSBzdGF0ZSBpbnN0ZWFkIG9mIGl0cyBwcmV2aW91cyBFbmFi
bGVkIChVMykNCj4gc3RhdGUuDQo+IA0KPiBBZnRlciB0aGUgY29udHJvbGxlciBpcyBzd2l0Y2hl
ZCBiYWNrIHRvIGhvc3QgbW9kZSwgdGVzdGluZyBvbiBhbiBpLk1YOC85DQo+IFNvQyBzaG93cyB0
aGF0IGl0IHRha2VzIGFib3V0IDIgbXMgZm9yIHRoZSBwb3J0IHRvIGxlYXZlIFJ4RGV0ZWN0IGFu
ZA0KPiBlbnRlciBQb2xsaW5nLiBJZiB4SENJIGlzIHJlc2V0IHdoaWxlIHRoZSBwb3J0IGlzIHN0
aWxsIGluIFJ4RGV0ZWN0LCB0aGUNCj4gcG9ydCBkb2VzIG5vdCBpc3N1ZSBhIFdhcm0gUmVzZXQu
DQo+IA0KPiBUaGlzIHByZXZlbnRzIHRoZSBsaW5rIGZyb20gcmVjb3ZlcmluZyBiZWNhdXNlIHRo
ZSBVU0IzIGRldmljZSBtYXkNCj4gc3RpbGwgYmUgaW4gVTMuIE9uY2UgdGhlIHBvcnQgZW50ZXJz
IFBvbGxpbmcsIGl0IHNlbmRzIExGUFMuUG9sbGluZywgYnV0DQo+IHRoZSBkZXZpY2UgZG9lcyBu
b3QgcmVzcG9uZCBhcyBleHBlY3RlZC4gQWZ0ZXIgdGhyZWUgUG9sbGluZyBhdHRlbXB0cywNCj4g
ZWFjaCB0YWtpbmcgYWJvdXQgMzYwIG1zICh0UG9sbGluZ0xGUFNUaW1lb3V0KSwgdGhlIGNvbnRy
b2xsZXIgcmVwb3J0cw0KPiB0aGUgZGV2aWNlIGFzIGRpc2Nvbm5lY3RlZC4NCj4gDQo+IElmIHhI
Q0kgaXMgcmVzZXQgYWZ0ZXIgdGhlIHBvcnQgaGFzIGVudGVyZWQgUG9sbGluZywgdGhlIHBvcnQg
aXNzdWVzIGENCj4gV2FybSBSZXNldCBhbmQgdGhlIGxpbmsgcmVjb3ZlcnMgcXVpY2tseSBhZnRl
ciB0aGUgZGV2aWNlIHJlc3BvbmRzLg0KPiANCj4gQWRkIGEgMiBtcyBkZWxheSB0aHJvdWdoIHRo
ZSB4SENJIHJlc3VtZSBxdWlyayBiZWZvcmUgcmVzZXR0aW5nIHhIQ0kuDQo+IFRoaXMgYWxsb3dz
IHRoZSBwb3J0IHRvIGxlYXZlIFJ4RGV0ZWN0IHNvIHRoYXQgYSBXYXJtIFJlc2V0IGNhbiBiZQ0K
PiBpc3N1ZWQsIGF2b2lkaW5nIGFuIHVubmVjZXNzYXJ5IGRldmljZSBkaXNjb25uZWN0IGR1cmlu
ZyBzeXN0ZW0NCj4gcmVzdW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFu
Z18yQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgfCAyMSArKysr
KysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2hvc3QuYw0KPiBpbmRleCBjNTY3NDE2MWIyYjAuLjQ2NWMxNzBkZjEyYyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9o
b3N0LmMNCj4gQEAgLTc4LDggKzc4LDI5IEBAIHN0YXRpYyB2b2lkIGR3YzNfeGhjaV9wbGF0X3N0
YXJ0KHN0cnVjdCB1c2JfaGNkICpoY2QpDQo+ICAJZHdjM19lbmFibGVfc3VzcGh5KGR3YywgdHJ1
ZSk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZHdjM194aGNpX3Jlc3VtZV9xdWlyayhzdHJ1
Y3QgdXNiX2hjZCAqaGNkKQ0KPiArew0KPiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7
DQo+ICsJc3RydWN0IGR3YzMgKmR3YzsNCj4gKw0KPiArCXBkZXYgPSB0b19wbGF0Zm9ybV9kZXZp
Y2UoaGNkLT5zZWxmLmNvbnRyb2xsZXIpOw0KPiArCWR3YyA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2
LT5kZXYucGFyZW50KTsNCj4gKw0KPiArCWlmIChkd2MtPm5lZWRzX2Z1bGxfcmVpbml0KSB7DQoN
ClRoZSBjb3JlIGlzIGFsc28gcmUtaW5pdGlhbGl6ZWQgb24gc3lzdGVtIHJlc3VtZSB3aGVuIHdh
a2V1cCBpcyBkaXNhYmxlZA0KKHNlZSBkd2MzX3Jlc3VtZV9jb21tb24oKSkuIFNob3VsZG4ndCB0
aGlzIGJlIGxpa2UgYmVsb3c6DQoNCglpZiAoIWRldmljZV9tYXlfd2FrZXVwKGR3Yy0+ZGV2KSB8
fCBkd2MtPm5lZWRzX2Z1bGxfcmVpbml0KQ0KDQo+ICsJCS8qDQo+ICsJCSAqIFRoZSBwb3J0IG5l
ZWRzIHNvbWUgdGltZSB0byBsZWF2ZSBSeERldGVjdCBhZnRlciBob3N0IG1vZGUNCj4gKwkJICog
aXMgcmVzdG9yZWQuIERlbGF5IHRoZSB4SENJIHJlc2V0IHVudGlsIHRoZSBwb3J0IGNhbiBlbnRl
cg0KPiArCQkgKiBQb2xsaW5nLCBhbGxvd2luZyBhIFdhcm0gUmVzZXQgdG8gcmVjb3ZlciB0aGUg
VVNCMyBsaW5rLg0KPiArCQkgKi8NCj4gKwkJdXNsZWVwX3JhbmdlKDIwMDAsIDI1MDApOw0KDQpD
YW4gd2UgYWRkIGEgY29tbWVudCB0aGF0IHRoaXMgdmFsdWUgaXMgdGVzdGVkIHdpdGggaS5NWDgv
OSByYXRoZXIgdGhhbg0KYSBjb21tb24gdmFsdWUgZm9yIGFsbCBwbGF0Zm9ybXM/DQoNClRoYW5r
cywNClRoaW5oDQoNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB4aGNpX3BsYXRfcHJpdiBkd2MzX3hoY2lfcGxhdF9xdWlyayA9IHsN
Cj4gIAkucGxhdF9zdGFydCA9IGR3YzNfeGhjaV9wbGF0X3N0YXJ0LA0KPiArCS5yZXN1bWVfcXVp
cmsgPSBkd2MzX3hoY2lfcmVzdW1lX3F1aXJrLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIHZvaWQg
ZHdjM19ob3N0X2ZpbGxfeGhjaV9pcnFfcmVzKHN0cnVjdCBkd2MzICpkd2MsDQo+IC0tIA0KPiAy
LjM0LjENCj4g
