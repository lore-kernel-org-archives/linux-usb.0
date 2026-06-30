Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAF1C5499;
	Tue, 30 Jun 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779951; cv=fail; b=FB1JCb2U1FE7lAZTsnsiwqKvRxcmNghuATgTrkCPD+pFwsW6+LKp96O+uaW6LgTb9d8qTmp0UHDmJIqwx7SeA/QVIN1P+eT1tp+ZcKDSlAEwJQfhWRfw6IMRsHvXQDXvY7ErrBBzpbF5wOyRj7Bi9K+H8xc6NIhN4NmTeif1QNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779951; c=relaxed/simple;
	bh=ryv8hfGfKcXrKr27E2wLfnYC8nNeVN/rWo0N3Ait71s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KCZusyDHLZvl4VfNhxJg1fJE1w8uw1RDE8vXX2OMeqqVFmyiXERqU3EFAbjRrhqK32D0IHNpmfOtSoPuksWBhC4oFQCcJvYKV63D1x4lcJ5L7T9WLgzaKj0vGsl+mvnPMntY8Bz1Rtps9ftit2E726WiS8g/p0eIrvvVG9UNl+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HRFCk+FJ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F1sjlVt/; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YzHU3waB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HRFCk+FJ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F1sjlVt/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YzHU3waB"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKfJw83140401;
	Mon, 29 Jun 2026 17:38:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ryv8hfGfKcXrKr27E2wLfnYC8nNeVN/rWo0N3Ait71s=; b=
	HRFCk+FJ2ZSJWHSOZxRIYFOaaUwCC1dVWuXo6khL7c1EWrxqGxxF9j2mCqKhyUI7
	8IfOV4fOotXxbpQSRx6FPTnNDLceHe0WTfLkarmV5j4j0uOcPKpt66hvVZR5GtTd
	64KRIVEPVYPjsXLkYLNm6G0AQcGGXiScOwpkkPrVqUZuubNuEzXueiOwE0NWRIE9
	NAfuuc8zoCLEGkMkWJsWtP13g8SO76Kz1zzHXTmbbtoNxoXNL7g5al05fRCcU6xz
	OIh1rl37PbOEPMpjYESkREDd+a7BDjoJQb2Xu4oc0r0gHtvmAS5Y8DrXBL7tssAG
	qJigYahTLaIqhSRLUjbaPw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4f3us740f2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 17:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782779931; bh=ryv8hfGfKcXrKr27E2wLfnYC8nNeVN/rWo0N3Ait71s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=F1sjlVt/c7b/Nz6x+mDCRrg/H2ntMVQwWWIGNBbEZeGV5vzfccDp73jgnw0CXS8xu
	 /E3UgUe/dOzBQaeHD1TBb8X9g40fqaRz+ofoinSXMqzdTGc/jBXDVo6Go1hMjyyLaa
	 knUO5X51WfIZNbyVxexujbW6A0RMBCvkbVDzxSikTYDDAKQXBYewjvOb6v3TZELBQ/
	 9AIm+PnHZKKYCKlcaXghHajuL5sv+t+ehI9jBpGukm50LxGnvta3Kq1ng/lHzG0adl
	 pL0UGlt50koy5I1CUzd1WxdGOki8/GWSjHrKQgUjiHc6NDlFz4S4gvOfVrrKphTdEf
	 7TGJ0HBEZCXFw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 656054011C;
	Tue, 30 Jun 2026 00:38:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3177DA0063;
	Tue, 30 Jun 2026 00:38:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YzHU3waB;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E10224011E;
	Tue, 30 Jun 2026 00:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzB42NU6lKeLQFPFQvGqP0AO9Tcvcrz9cf63ga5YOctPF3LMxRI5/1klZgMth+wF7a3HOmVa3TzqUYBRqTn5F8RhcOZEZxsoRqwkX6CseAJTNBg8vDHMk9h7RVbfg9qNDLlI4cNew9+EEu1pW3ZTCgzJFmwRV/47ms25p8HY9Cx8A4CymxY3+hw4p1mVyY/LhE7+P/KfkZFAMT5JjMjIbAMrrOe4oLWG7MIYzaM20hqFbeLznLuUprgQOXGy2ZHZVDUGIXO36inkUn7v4z1XaY9YPkrSwue+qnGMopct7PlJ4wU4vGeemVliEHUAW+fWWOnDk83YHNrPqOdlkp/pxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryv8hfGfKcXrKr27E2wLfnYC8nNeVN/rWo0N3Ait71s=;
 b=moJzO1Jg/mJVqehwXVWjb2ZlcxfMjLRREvh8A7/NeZagaUpeDN/IX7XsUP0MGxFP/lZd7U5VuSqK2LDIRp8BZnb7Cde37qyVFdQMxxPY+jq2wWDTn8FQEXMXqjOOvVu+pM320XEBM/691IxljulaEjYZ5GqY2euJV4W/oHfn3WnsBTMNnJPuv5y9zbibRfehTdyUwGexpNCg6onbPBEv0hsAUSAWfrWGX4jpbwBB4UgldND9Lwl2pUs0I8jB/zOFlysANXr9qVHAIqMK1saJ4hX5OOLqyQ1dj+NZw7aAeePJIrfoH72clDazMAteTjfhv6C61nhfXr5r8Izf90UcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryv8hfGfKcXrKr27E2wLfnYC8nNeVN/rWo0N3Ait71s=;
 b=YzHU3waBx2I/qTWbiKzqXEAx+8mNkNkpdn9cM1olnYQc9EQAmAgyhGmLG7lzrmVMYRx0rxRM/d+dlTylTEAsULpVLFj4Fhqr659rAmOdagFR9RsAECEf8DgQsmMRzJFlDl4VNR0VOxbbRxGbQdG/1/B5KQZsasmpCiJEhWkkkqY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 00:38:40 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Tue, 30 Jun 2026
 00:38:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Thread-Topic: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Thread-Index: AQHdAviUse0Uj1BQaE6BbtUfschHrrZRcW+AgAPklgCAAPWggA==
Date: Tue, 30 Jun 2026 00:38:40 +0000
Message-ID: <akMP7QNTKJVwIBVi@vbox>
References: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
 <aj792C105VmmZ_nF@vbox>
 <1c0f84bf-267c-4dc2-a756-1997cf3871d2@codethink.co.uk>
In-Reply-To: <1c0f84bf-267c-4dc2-a756-1997cf3871d2@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|BL1PR12MB5995:EE_
x-ms-office365-filtering-correlation-id: 459c3cd2-ef0b-4a01-927e-08ded63fee56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|38070700021|6133799003|4143699003|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 Azg3S7tSA4D4vwNm+5m5M/DD0Ka7WzFBVgUpy0RSOF4sI1Et1OcuUPQM1EEsoaiCQlkWAcopGjdcfHfdeN4J/WarEuE4pG3NhBqct/rwtWxRw2z13LNzRB8KvGI+/uQMqFsjzevHQBkIw9+lzS2H1rVtQ4TlInACMoYGPob3wmcGTsKps4Fa4Ch3HHrL0ebJul7WKZ5IeuDZPNpHWos7uCZ4bvLNodRtTMEMPyRwqnvOmwuQ1pgfBprLQGygZ7yEv5mea8kca57kbOhIRsu+y1gKldUFS2WNoRrMso3nFS/IHSsnbgtG+EsfPsHJxj13GbpGTIbMt17NqMKTr1jWUhry2LnGWAQSaVrS2axGmlXMzbmlWKJ/TQAl2xm9TMeLasoM+gS99XfAoGRrHoyVnD0mryFBG8b5Nn945VXd4buJtrm31WveikJF/gzrRJB5EM8alx8NSR7dklOCCubY8P86MN7c7mwgYKTd9YVl431pEd4/Mwat/zvhL2QN+iIclvmkUWvB7+8HpmuCY2k29Fdl45hPVVSuqbqvDhYGq0ZtY2/UNW6m/aOtRBYBr/TUkcF4NoMorrodfDlC1zAeADNw1Nd1wrrLCnDD8ZkIq6Twzu8lTtgX6vQMrZdDpMonEBi0HT4yqiFIfD7SK7xP4YCJ1xTI4865a17bP8bx46AWAbSQJCKD+e78ofDQgPB+I+OpMuTzXs9FbcXzZR4Fjv8TGsDF6bJ+92PIEvdKR0c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(38070700021)(6133799003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUNXL3dFcGdDTGlURU9iUnlwc0djSE9McU1IVjltL3RkSTZTajhvRzMxZ0xu?=
 =?utf-8?B?cGQ4ajBzZ09vTUg2VGhFd3UzRXhKTmZpUUU3L1ZhWGliSFQxazNzcS9xT0pt?=
 =?utf-8?B?UUY5TVJwaGxZQ1hFOVJMZ21SNEk2SStVWDNPUkl1UlNmM0RYUU54R0F3dXFJ?=
 =?utf-8?B?ckRMTjNsZTNLVy9yV1BvTGovZU15TkZiWmtmTTRpVFpMRmh6YnlxaWVaKzcy?=
 =?utf-8?B?Z2RxMmVJUHJrRzNTbFFLMWVCVTdibGRVKzRiMnorbERsamZIdytvcHpkVDVF?=
 =?utf-8?B?ZFllWkdWdlBrR3kzZ2ViZXJZKzJqVThNYTVTeE1MM2hvTUNHWWtHQlh2YzhH?=
 =?utf-8?B?OU96bm9sWnJwMjU1MUxLL0hsbnRjdERET05LMUVFRnROeDYrUmVMTno4bWlB?=
 =?utf-8?B?ZjJnM3M3NFNVK0Vqdkd1bms4TGJESDlabmQ5ZHJSeWs5SEVnZGRFei91Qjds?=
 =?utf-8?B?NVlsMjRqZ3hmelptM2l4b2hHWEtUL1oySE5haE1xb2REY3NoeVI2VHk3WUhD?=
 =?utf-8?B?R3lRK3ZQSWRFRk8vMU5uaC9PMk03OVUxOFc5S2ZiNnZMMklKaGtDRUdsUzhD?=
 =?utf-8?B?SzFyMVZpTHJPTVVuZlAyRDZZbm80T1hBNWw2Sml1Mk9kTGFMVitUejk1TmVx?=
 =?utf-8?B?VkwwUDBrL0xrbG5tc2psaEtaL2lGLzRPeCtJYWtEdVMvQ1VuYmw3M1d3cjBZ?=
 =?utf-8?B?M1ZISXNuUFRFK0YxVXFST3RwbmUzSXdNbUJvNjBta2FaOU4zV3NIdE02TnJp?=
 =?utf-8?B?T0pibldZSmFLZnRDcDNWalFsSEFXNGdFR1NBcFJTWUdVelY0bENPZU15NkxT?=
 =?utf-8?B?QWRIVVgyMU44bWw3SXJSdjAwQTlBVFlsSGc5c0JVVjJtNlRvVzY2ZHBoQUVD?=
 =?utf-8?B?eWhrSjZhcDg5ZHN4UVBjTTRBajVUWTd1OHNYcEpyUDlBTVNjcGRvRWJlNCtj?=
 =?utf-8?B?R0FjYkdkaTR4TmY0NHVzMjdCRnlJcitPbUFHTlNHS3BsUVRqTFR2dHg0cWsy?=
 =?utf-8?B?b1pjQURtMXNvci9EU2UzZS9qMVZIa05KODJOTy9wcFRkWVZRV0tRWWhENFBz?=
 =?utf-8?B?WFRrTmc3NEorR1RpczcxOWpQMTJRd0laQ0hJN0JKcXMzZjRkajNvdU9UZCsr?=
 =?utf-8?B?eXVIM1UrS0NRQmRzTHUrK05rUW05Ukc1SXlXdjZDckEra2Nidk12cHR0T1Zv?=
 =?utf-8?B?NzZyL0F0cnhuMDRrUHhnNlJGZzRQVWQ0ZDVrY0x5L0lKU0xoTW04ZzRSbWg5?=
 =?utf-8?B?ay81M3JFQVJZSWlQMThrRFFGMVBwbml2dFlVSkoySm91dUd0STRmOEsyMGtM?=
 =?utf-8?B?dzl5ZGVTelVVUFBhNTdOVzI3a0hwUnNsYU00WnRsZmF1VWdud0g3QU1pSWpx?=
 =?utf-8?B?OVJ5elZOR3J5akdKTEdYVHdwSEdPeU1tV3E1T0U4K0hIYzlGb0J5VFlWV0Ix?=
 =?utf-8?B?SUxVVUVQQVRlamNDYnVUanVFcDZwOE4zWlRhOHhVLzhLa0ZUT3VZRGZ0Uk5L?=
 =?utf-8?B?YkdLNzhCcWtXREZwRWZOQ2NWVjlFeFVJa0hWeXhlVU85QnU2QzFNbC9FTVlq?=
 =?utf-8?B?QmxiMExQN1RQRTBMY3A3TkZJNkNBRWJVT2Rsdm5SYy85c1NkL0RRQ1dKNzNi?=
 =?utf-8?B?MXl1TFpPRHBEbnlHVG91eXEzR0tJNG5IQWNscnpSaXZQNTN3dFpqU2FnWlpo?=
 =?utf-8?B?QUFCNmpmcThQNmhNc01LK1JqVnlhVzVoNzZxVVZsZ2RFZGVtN1cxdm16SUJq?=
 =?utf-8?B?K1NSTHlQdWNtaFEyalB5aTdrbGIwRlhYY3ppWUlodDdoU29CbkdITlRZRExK?=
 =?utf-8?B?alIrRERPYjc2cVVqWWtpS0JlQ05Nak5QUG1rYTQ1dGw3N0FvL1FZL3ZMQVJQ?=
 =?utf-8?B?WkJxc1R4Y3dtQm1VZlpRYzF3NlV4WWxtYzdkWU9BdlJTb2N1WFpMc0IvUlpn?=
 =?utf-8?B?QVpaVm04TCtGM2tDZ0s1MTlRekpUNXpvOXBKb2dMMWpEYkRBMHMvbXlpQkJ0?=
 =?utf-8?B?MjNKTFU1RGJVSE5rY2llZFJ1Smh2UERGOWRRcmdtQ3ZoZkhjT2FKRVVIcWFj?=
 =?utf-8?B?emNvNkk1elRFWDJzeXhTRkFzaUhEZHZTeTFnSml5Vkg2Z2hlYXBCVlh6SjhX?=
 =?utf-8?B?WTZtd3grLzZIcG91ZWkyaC9UaEE5RHJvNlRDem4veVl2bUQ5eE1MMWkrb0Y1?=
 =?utf-8?B?S045R0QxK0pybXcyRytDTUVwQTBFSkVIVkhLaktmTElsaS90TU9hN1p6Q1FR?=
 =?utf-8?B?MUgyNnhTVUJKcjFxb3VUZUtUVHRjdkVYeWFtRFQxb3Q1RFJ1SUQ5cTFuL1RQ?=
 =?utf-8?B?MjFHQzdhejBKUUU4blBEUFY3a255ZHVWaWlkcml0TmwvOHo5dVNjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3C43D66DAA7CE46A1C28CF29A5FC527@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	f8EWCXLDG5x5+uayL1x927j9b1AgiEyBOq4CwgfWcYVKxFsuaResoBO8hdFOEaaMNMYA4ZYmG6e2pemGk6LoOt8l0ZpaaTzXCLhTuJEJr/+q7oUYY1yCO2A59jFXjO6+Pp/vRiXUxEUGtpMmr/0H62NJ/z6+R49xMW4AIJQBJqzTSalUBIOKAYGPTFsBn0ZMxD9N0MTUNzB9Mh3s1gUF/t6feNXPsep6zbkqE/sprrHjX5RMLa9ew2lkx1qVra2NyJNVV9HW3EK6sFieJlhz+YDjNQXgOvbKRj4vkpUI1NDHoZZUkjMfLTgg2uN5Sf7tFGQznhfiSw6jo5Ldv6LqiA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oN5pfyyDBs339Vjl24wSQumXcZdVsfAhJ64Ul0c+NltAAC1VqLY6nlZ77PixUN/sQ+OXMZoLArCiJmRwRrkJ6Z5AmDpMEWTbvrgLs8PD3Ahb/KLmqGzJs7Syg7kXFUTs7abE2q6G4yIEK+ca9rf0rrpxrt0FHjr1EfTHDKywxbMnUbANM+y/LhDMA1w9xDVTRUegC/gwqajOL/kTold1yCgHnmGoR3GvZO7rTjbCsc37mM8Q8iimkYfBSNYDr/rVEzFYfpqYFgUCYjLQRPioFNkeOpLMa3CmwZc1Mw37euvVkS9UdzN7saEVSpyHh8+ALAnroMqI9wjohI0QuVCvpzHR3WIvNqzpvU/yPb7O4RfgesIcOr9MzvpGRguKUzQHWHaKUf+JZ25DyjSd5f1PbJZd3JaMYPWcqh1Dnz/66xPZsr2rt1KxJW+Du1A1/ekCI3kI0zqupsSFs0gJ6ceIX2oi4//ljqAmDHLBuKG/Xn8nCekr1NwTMja5cOP/ZIIxnFIK5Z0QRPgoOuO1LxCrDC/6p1qVpbi0x7MR852yKchxcRY+nxBmGmO4XFzARBmp6VMnyZjQbbuQ0lFSiU0CSryzFkyaOKQ1PAZdW+4dldKYWl5p+1yQe0h5JwMAIYasCzxD3tn3gcKysqyo1NHseA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459c3cd2-ef0b-4a01-927e-08ded63fee56
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 00:38:40.2889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJT55XHEqIE+zoITukDkh/1kfhYvH/X8O4QlUhoUsXxN27Vfh/1+Y99yItwWXrTJT3OHTR1DWlJLlTqYfN8rtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5995
X-Authority-Analysis: v=2.4 cv=P4cKQCAu c=1 sm=1 tr=0 ts=6a43101c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=1EsaE_6oAAAA:8 a=nVcZLZELrCHGDbUU4tcA:9 a=QEXdDO2ut3YA:10
 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-ORIG-GUID: n0Bwo_r-83QD0aU2T8iwZHI1r7UuW8xY
X-Proofpoint-GUID: n0Bwo_r-83QD0aU2T8iwZHI1r7UuW8xY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwMyBTYWx0ZWRfX5US/ppNnarZk
 Z0LHNEQcqRGWf7NFtb7AOCkUNgnbinq+Y5gtXG3V76/8XdUzIeAHx0jO6gwFCU0nxu5TfG8UaIZ
 11Li4KYZh52ZWzUA83Gurd4fnDqiMG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwMyBTYWx0ZWRfX/KzbTq0EyQ3Y
 SPbbfNI6LOrUCDZn1RpfZo87I/+b7NLl6wGy6OOVi8Obbr3zMSytwz/1ndZhZyDNPeBlz2woth9
 iN1thPlqr3eWyQLb9qU9F4Rd9ulGDzv1H/tVlw3v/GGmRD6tM28HBed+aqgBIfvBdZaI9SrSGBG
 Ks4/hmCvv+IHkcurLr18ODe7mLT7ZmwTq6yp7Yi9d+qQNoa8/REWMgfGoAgie0PkcR0yJL5ttKR
 +7sTJzmKfBC84EMiwrZRzYWAy6VUc51P9qGfrPmVYpitTzlw2IciTMDMd+YiYJS6gs5kbRhVc91
 WwEIN2klYjmQY3Hh5vrao3HLf5up0lRRhBROzv3I0sqRKwekIKa0AWKr6Ypwj8bY1Y0GGRqkwr7
 IIJdVyU1CCflSl7Jj+W/eOv/fPAgEYfYR7G3lVjkj63Z9xCbntBBT8Z0iqFulfCUjWla82kUjew
 QshYj9tmQyWqEd51RMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606300003

T24gTW9uLCBKdW4gMjksIDIwMjYsIEJlbiBEb29rcyB3cm90ZToNCj4gT24gMjYvMDYvMjAyNiAy
MzozMiwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFR1ZSwgSnVuIDIzLCAyMDI2LCBCZW4g
RG9va3Mgd3JvdGU6DQo+ID4gPiBUaGUgZHdjM19pbXhfZ2x1ZV9vcHMgaXMgbm90IHVzZWQgb3V0
c2lkZSB0aGlzIGZpbGUsIGFuZCB0ZWNobmljYWxseSB0aGlzDQo+ID4gPiBpcyB0aGUgZHdjMy1p
bXg4bXAgZHJpdmVyIHNvIHdoaWxzdCBtYWtpbmcgdGhpcyBzdGF0aWMgdG8gYXZvaWQgdGhlDQo+
ID4gPiBmb2xsb3dpbmcgd2FybmluZywgcmVuYW1lIGl0IGR3YzNfaW14OG1wX2dsdWVfb3BzIHRv
IGRpc3Rpbmd1aXNoIGl0IGZyb20NCj4gPiA+IHRoZSBvdGhlciBkcml2ZXIgd2hpY2ggYWxzbyBo
YXMgZHdjM19pbXhfZ2x1ZV9vcHMuDQo+ID4gPiANCj4gPiA+IEZpeGVzOg0KPiA+ID4gZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWlteDhtcC5jOjE3NjoyMjogd2FybmluZzogc3ltYm9sICdkd2MzX2lt
eF9nbHVlX29wcycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNv
LnVrPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyB8
IDggKysrKy0tLS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gaW5k
ZXggMWNmOTY1NDBiNjZlLi5kZThjMTdiYzk0MGQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1pbXg4bXAuYw0KPiA+ID4gQEAgLTE1OCw3ICsxNTgsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
ZHdjM19pbXg4bXBfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl9kd2MzX2lteCkNCj4gPiA+ICAg
CXJldHVybiBJUlFfSEFORExFRDsNCj4gPiA+ICAgfQ0KPiA+ID4gLXN0YXRpYyB2b2lkIGR3YzNf
aW14X3ByZV9zZXRfcm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+
ID4gPiArc3RhdGljIHZvaWQgZHdjM19pbXg4bXBfcHJlX3NldF9yb2xlKHN0cnVjdCBkd2MzICpk
d2MsIGVudW0gdXNiX3JvbGUgcm9sZSkNCj4gPiA+ICAgew0KPiA+ID4gICAJaWYgKHJvbGUgPT0g
VVNCX1JPTEVfSE9TVCkNCj4gPiA+ICAgCQkvKg0KPiA+ID4gQEAgLTE3Myw4ICsxNzMsOCBAQCBz
dGF0aWMgdm9pZCBkd2MzX2lteF9wcmVfc2V0X3JvbGUoc3RydWN0IGR3YzMgKmR3YywgZW51bSB1
c2Jfcm9sZSByb2xlKQ0KPiA+ID4gICAJCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKGR3Yy0+
ZGV2KTsNCj4gPiA+ICAgfQ0KPiA+ID4gLXN0cnVjdCBkd2MzX2dsdWVfb3BzIGR3YzNfaW14X2ds
dWVfb3BzID0gew0KPiA+ID4gLQkucHJlX3NldF9yb2xlICAgPSBkd2MzX2lteF9wcmVfc2V0X3Jv
bGUsDQo+ID4gPiArc3RhdGljIHN0cnVjdCBkd2MzX2dsdWVfb3BzIGR3YzNfaW14OG1wX2dsdWVf
b3BzID0gew0KPiA+ID4gKwkucHJlX3NldF9yb2xlICAgPSBkd2MzX2lteDhtcF9wcmVfc2V0X3Jv
bGUsDQo+ID4gPiAgIH07DQo+ID4gPiAgIHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+IEBAIC0yNjYsNyArMjY2LDcgQEAgc3Rh
dGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiA+ID4gICAJCWdvdG8gcHV0X2R3YzM7DQo+ID4gPiAgIAl9DQo+ID4gPiAtCWR3YzMtPmdsdWVf
b3BzID0gJmR3YzNfaW14X2dsdWVfb3BzOw0KPiA+ID4gKwlkd2MzLT5nbHVlX29wcyA9ICZkd2Mz
X2lteDhtcF9nbHVlX29wczsNCj4gPiA+ICAgCWlmIChkd2MzLT5kcl9tb2RlID09IFVTQl9EUl9N
T0RFX0hPU1QpDQo+ID4gPiAgIAkJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZChkd2Mz
LT5kZXYpOw0KPiA+ID4gLS0gDQo+ID4gPiAyLjM3LjIuMzUyLmczYzQ0NDM3NjQzDQo+ID4gPiAN
Cj4gPiANCj4gPiBQbGVhc2UgYWRkIEZpeGVzIGFuZCBDYyBzdGFibGUgdGFncyBhbmQgYmFja3Bv
cnQgdGhpcyBjaGFuZ2UgYWxzby4NCj4gDQo+IEhpLCBJIHRob3VnaHQgZml4ZXMgd2FzIG9ubHkg
Zm9yIGJ1Z3Mgbm90IHdhcm5pbmdzIGFuZCBzdGFibGUgaXMNCj4gb25seSBmb3Igc2VyaW91cyBi
dWdzPw0KPiANCj4gDQoNCkRvZXMgaXQgdHJpZ2dlciAtV2Vycm9yIGJ1aWxkIGZhaWx1cmU/IElm
IHNvLCBpdCBzaG91bGQgZ28gaW4gc3RhYmxlLg0KDQpUaGFua3MsDQpUaGluaA==
