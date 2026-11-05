Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793838200;
	b=zU0PHbAcLAuhnwU2Zo+GDCS9AHujHt5Xw6e3r8QmQPJUgt5f25kwTj7fuljywBYmaO0r
	 OL/c1wRRdrXr70Xz8y322GX0j59ZZBx1KIJyNMeAJWbX4UNoralJYanZoVi9iffSUd/ar
	 Fqoi9pN5o/2OO6EUYMfxEI377Z3noQ2gezdUQ6XRyYcBBs9B9sSZmpENbXEpsKGSpPNvi
	 9P8BBrNjTONgn+pbn4KsrX4a2rnAj6M971C3gUPFuEXucvoU79JTiU43jQObxCnvU2oZp
	 hCN0389hH8hXUMSFzROXspWmqDMnvGFETvRmXCvcUlp4gpezkyu5mogTQwqOuDQMG1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838200;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wBgc0aCc+3wKyWn+udfujIWvw5QIwCwNaC+zvjr4qX4=;
	b=IOO4TwjijW6we9UnhCDf6uAvhZHaj5pxABM3smX8be88kGff2PQKsClADUiohbkX/S8W
	 2Dty6xLsYQkjXHm37Dg2ypWPJYYEoTXmhDkdF9Azuu9SAColuqIUAui+83iel7wMZwlV6
	 mtuXEkQ5K6WcxBTenHB00sEtKSQ65MmAqFhjK97fxsGRUrOkqDYMgaWlFSSAp8RhwyfiL
	 Fct8g0mZMKs6sGEBsf5+XaQANyUJxbvWCaYH2WwzSX1/rOJPHf72HuVDp6+eFbXhWM32M
	 O1+rst/X3X7ytJxUhG7imabKSlGLZ0skjxON5RRuJUiy1tIxZJZOgv6yzVdMK8rw/DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=aLzB3g0L;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GhWvetD0;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MjOd1Elb;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B6606A333
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 00:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812B6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=aLzB3g0L;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GhWvetD0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MjOd1Elb
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4NOp4H3222743;
	Wed, 4 Nov 2026 16:23:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wBgc0aCc+3wKyWn+udfujIWvw5QIwCwNaC+zvjr4qX4=; b=
	aLzB3g0L4/qyy2WLhBwD8HctpNjbSUHCwb3G9mmj1czWatoHVR5bVPdISagPZgRR
	EJl94KsFimEYw4bSfXHZjfgbf++/SFKBGG83A6/N/IEyB3jlRaSLupKTMHDODMi+
	6iIxcT+Cc4CCpg3/Jeo9u6gDzxWJP4BUtmVzmh8WcwK74t/dvU4WcsxrEPvpqBxm
	s9L8HI/Aw2X9vCYz2QfKhrEI85q5fXDXFeDFL0ASSM95dHIFpyp/61baLmgMXX9+
	nWHZTKPldFvySBnzeAfDIJhGgUEvPy/r6qr8/+cMEuNT50WN7oZNvKHHRRocJM75
	DmPCLuw8Lc+sufjhCknPSQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hqv7bk61d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793838196; bh=wBgc0aCc+3wKyWn+udfujIWvw5QIwCwNaC+zvjr4qX4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GhWvetD0vJtLYqckjUu2pzoY4Zw+TK4vcjwMDqlIkC8BUEM623SPKELmeJ4OYqZh/
	 OpBeZAWYXE+LQ3QTq92BEiXcm10NTUPYz1+kWVh2HP7kZVEl2F3SfXLj16zFtj/Ghw
	 q+CIz9gsxhkUiudkS+P1xmQJiZQYjz0ppuixvt4Iv/xLROay/HCbwD52Rdq4sitjlG
	 kRNTcgsjGAqlm2GvPa9OnVi/7Y/TQjUqpq0RiLYIrukEkJe0EFct1XRnlrR0Ou6gin
	 S8KsQ5Mp/kDKFkdihFUmsaW+o4YLEim+JlGsa1WHYK3wNjMGqsU+r1ZCH/bNVJZxJD
	 NR0bj4qoPzR+A==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B26740183;
	Thu,  5 Nov 2026 00:23:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4BC76A0090;
	Thu,  5 Nov 2026 00:23:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MjOd1Elb;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id ACA8F401A6;
	Thu,  5 Nov 2026 00:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooMTGz1a8GAQ6W7+Ju11ChLljbV9MoQEVPTxcrdTT4HyPlX6P7/vV9wzqqxwDw++zWjF1pT6JYR00tKRknj+T+NOigPoWw8QCkSK98j6SpZpJYSSMqXGcdf0sEi5KeMjfyhrvHxncCWHrY4TmnGP1vMNyefZCl+kEZpMHdBMP/X1FeFqLKNngI0wNSterIpteRmUtRz/iX4UJwRaXbM8jpzrCvX2p1AnZiKgCGveClXLbTG7iTwGA1WnylP1kIN5Jkrksi8iQMZnx3owQTjnaojaV9zzatG9wW9V9ZKAFMVrwb6jJyEZEdIQSVpAika/KCgP9vcCf+jbq6WVCSWprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBgc0aCc+3wKyWn+udfujIWvw5QIwCwNaC+zvjr4qX4=;
 b=yiqiAzfzydiE0U8lLFMisDOBGtpYJrNhIkPxSO1WK+Fd+RH2w6zsij5dq7uxFvJGfj7xBy6hyiW4lW35DEgXdNM4F0tVHuH8+q9hd3Zad4174RglVw5npoT4LSankhpSTY+rGrPsKZaETGT9lFMyIOsgkj1r48PXheQrjVNH0EQFzDMaPjOteXQEoxLWilmmZ5rS+2P4Frlkl86Jo+Y2xVpTBXWkEerFouaiRVqS9XF+L5enYVN4PNVh6GoN9qGqV2iH32JhLtJdmunlJKNbMzmckffmJMIRg5DWc2hxrddyfSI80raGeoI4jCUXJ8gT28T0dO5JFCsn4jozIAoNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBgc0aCc+3wKyWn+udfujIWvw5QIwCwNaC+zvjr4qX4=;
 b=MjOd1Elb59+BYLTuQDEoJpo05Nc61KWhUCoGm5aaFmrlN8RFiKC9RcBZ8K3e920S/QD1lOZmxX4aLoKItCi5XeSkZGXuq9RWWPiqb0D6K6PPSAuNvFjB2ywfgdIrVtap9CmwLe8ebXCrG7q8nQlLfid4MViSKhd8fzlm09HR4ek=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 00:23:09 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:23:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Olivier Louvignes <olivier@mgcrea.io>
CC: Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: gadget: Restart the gadget when a new session
 follows a session end
Thread-Topic: [PATCH] usb: dwc2: gadget: Restart the gadget when a new session
 follows a session end
Thread-Index: AQHdYs/Mg1sbOwhWYEqae3zaZu8SpLcesdeA
Date: Thu, 5 Nov 2026 00:23:08 +0000
Message-ID: <auvJvr3oFWhB2SeR@vbox>
References: <20261023091832.6765-1-olivier@mgcrea.io>
In-Reply-To: <20261023091832.6765-1-olivier@mgcrea.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB5844:EE_
x-ms-office365-filtering-correlation-id: 526e75cc-c352-44e0-4b98-08df3ad2f814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|38070700021|56012099006|5023799004|3023799007|261026121527099003|261028144727099003|261026140227099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|261022105027099003|10067099003|11063799006;
x-microsoft-antispam-message-info:
 MIrgUvo2Zs0Svcvi3x8ZKg8ycd31y3Cpc41fg0LZSqlU+jzSqiLsXXJIbEHqVS9zk9WWWHauX5dPK+SRWwflo2aBP2z/zrvk48fkq/KLTkqce/dtdbatvPMch7GECB/vKcNDcpDmP/tGzvAMc3H50OSZ5MjKZI8OUiei4WmyYgSDscqt4MpBttb9ooyDGrHYPrL95+6t99hMYYUdWS1LBiaugzlT2dfhjGSpE90hORRnrWO71CLpS0Gzu7hZeNfY6XYZL/5kGJXwWMCYcXZoq9mVyG77BtCZkLBcZwMR1C9At5ODF1f2YDnOsyeMci8czUokRszjW6QofbhGGUl+7IVdUJSPlFgSomtuYMSAbWX6lxE9v2Dhwy6DdTFt9BxtGes1himfpVdNT9OBxdKav00llqZo/GtI1D/CkaytU6XqJmzNhDDBLGxpVawoIX/Sii/oA1XxHfvssSSFv9dFeMu35wViFpO3Lb/rQIjNm8Eg2o3UdvkQiOWQ9vxbFF1mep+J7IzNp9y9J1B2rhwqtQxksuMt3LzbzS/UlC4BHe1Z9VCKxeTAg8+XNuVmNxWp8DRIFEqs4Tnvr88n1qC6wE9d/FR84tCgulO85//sRuogss/uoYQLAui9wwRPJoexqxfUq+kzEXEWx2nlaB0eDv/HzIw5o/OJzZOYG7oAIwfy9EGOh2RBF+sbR7g5XFeT3u4Ux0u8b/qvjpO+UkQLSZc7tMeMF9ugHT4cD5PFlaE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(5023799004)(3023799007)(261026121527099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(261022105027099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWNwcjJoVkNhZ05JL05HSTlkdFBsUzlia04yNHlkZ2VKOWhFWVVEUWxzNEZk?=
 =?utf-8?B?c0pDeElkc2Y4WWhPK0JHb2pBVHBPTXUxRHVxQ1NrTnFDSlMvVlEzeWJ6N1Vr?=
 =?utf-8?B?N05ScUtxeUtCYUpRUzBNcXltTmIrL3VteE1MNXVudGQ5MU9GUUdnTjRlcE90?=
 =?utf-8?B?WTVQVjFzeG5vUWw4OU96N3pBWG84aWNsOHlHTTNlTldNK0NoMS9oV3JVdkVO?=
 =?utf-8?B?emFMWVZUVllkaTZQSlZmT1N3cHVwbDFaTk9iUzUyd1dwOXlTTklQY1NhdURh?=
 =?utf-8?B?STVlWHE1b0gwb2ZsTE1XUDJ6OFhQMUw1b2diVTlzSXREUG9BZTZpemp3L0du?=
 =?utf-8?B?cDNYR25nS09PL2hJR1RqaGU2bzgzcHRSWitMSlFIdjJhUVQ2VE9Qa3dNZVhY?=
 =?utf-8?B?bnN1NmZOQnNYSS9Mb2crSnB2QUtoVDJ3SFNxTTVrWS8ydGhLclhBNWhDSUpz?=
 =?utf-8?B?cTArTUEyd1F5bW1Ub0hmaXpiVFZ3UjZ6bmFVV2IzRmcvT29DRVRnWGFGYzZk?=
 =?utf-8?B?QzhjajkwWW84a1lOWlhDRDFzS2pVZ28ySUQrSEZ2YnJmSCtybVgrc0hOVk1Y?=
 =?utf-8?B?RHpjS3hXNm5sWjZQSTVUWXNkcjNpMnZuMkVENnRXSVU2NEN5RGhTc3I0ZUxX?=
 =?utf-8?B?M0N4b3hpWHVMU2k5M1VpOWlNaHN1eGFaKzJETEluNEh2bC9yQWlDeC9qTGZy?=
 =?utf-8?B?a2svSmFMQy9SNWwzbWJ3OEZjYVM5dzlzTHZ1NEFwcFZXbGI0VS9MMEpmTXdK?=
 =?utf-8?B?eTdRODJOQUxzZUJ1eEVvL3JweHhqWG1Ybk5sRkRSM2J3SE4vL2lpWWNoOThu?=
 =?utf-8?B?VmQvZ1hJQzlENVBjRnpxb2tKaTlPWHBUb2l5Wm42dHpMVjVBVVhKV3FoWXRD?=
 =?utf-8?B?TmRvMitSdVpwTkZWVzUxTmE2cUpQdThsM1FLTmdNM08wTFFpaXJDY1pkT2Q4?=
 =?utf-8?B?dGFNaTJIMjN1cnc0ajk1VnFZd3pHY3BEZ1k0UU5ML2FyVTcxOWVXMzEwK2xi?=
 =?utf-8?B?SXY0aWVVTTF1aC82dmRUaXQrUWJUYXNmRjJ0Qk9td29mSzloWWNyemNsS0lj?=
 =?utf-8?B?YmpqTlFCRVcra3hkY05HY2d3Sk1UQkR3Q0VMbkFhZnc4TjAzcmJnRllCbkN6?=
 =?utf-8?B?dmJjWWhjZE1LejRVRC94T1J0em5XU3VBdksvUXF6WjdTbTd2eXZoR09rVS80?=
 =?utf-8?B?SUY3Mm1VRExkQmI4UmplS2tobVpSZGNrTHJoUlZHUFA2V2FRUVVtMFhCZHJ1?=
 =?utf-8?B?UTU2RmljeFhSeGNzQ0pDQXRLZzZmeTZDZmNGRFZuOVQzUWVaNytWSEE1Wndn?=
 =?utf-8?B?Q09zTTJwODl6U21PYm1kbFVJNGJXWTVTSWZ5RHJMVHZKVTlHZUJlQUlWblNG?=
 =?utf-8?B?NVBzbklSSUh1U293bmlxTjRtcW56bWUwN3h6TjFScGE4YnpsRW8rNndIUEdE?=
 =?utf-8?B?b1dCN0FtZXphTkFKeDF0NXBmOGxYb2VFdGVnY0E1Mk54N0pGazlKK3hBaGdE?=
 =?utf-8?B?TXZ2aC9lVkVRbGRZdlpXZHhBTjF5YmE3LzhpL0RzeFJjWW55aEhWZ3NTUC8r?=
 =?utf-8?B?T0VvQ3Y1RjA0TE00bHc0Z0RLaUNYWkxCWXFUWHpNR21MbHdrNHBDU3RkaHFE?=
 =?utf-8?B?QTdNblJJM2U0QnBJYkgvQVRjZkZidUxqWEtOU1hTcUJOODhYY1htOTNINUgr?=
 =?utf-8?B?VXI2ZVpNVTRSUlB5K1VsUFNpODJneUhibmtES0hCNlE5ekxoZTV3SzFGdWNQ?=
 =?utf-8?B?cWxmQVFWOGIrM1Bmb0RUSlZkd0hRb3dFY2hIM2l2d1VncTFVL1FCVVZGd0lR?=
 =?utf-8?B?clJlei9wRGIzZHFHUXRRQnBIcE5Jc0h1NU9JcHlNWno2V3ZOSEVMZk1La1c5?=
 =?utf-8?B?S3BLcVIwc2h6MGVERG43ZkpZTUVReFE5MjN3Z0F0ZkNZYjJtTTNDTHhGK1NR?=
 =?utf-8?B?VTcra213NHlnVis0UnRaVFo0bmcwWnloeFlMZEhlUUovMmUwbnZsK2tPV1Rz?=
 =?utf-8?B?UGIrdVNKUGJEcVJaTDZ0YUpucXRVTTJ0eUpEZyszN3gyYWRzeDlkQmZjZnVC?=
 =?utf-8?B?WXZ2RVJsY3QyUXZrQStXaWwxWjRseENxM1hOc2Z5YnlTbHBxdlQ2UnpVQjd5?=
 =?utf-8?B?Ykw2K3NTdkMvZHlHMm9Va3lNWUtjMUcxOTJpdWhWNGtJeTFrSGFKSWNKQmUz?=
 =?utf-8?B?QXV2T0tVY2dBZFZoLys5NmR4cWxGYXZOWjBxSGFjeWE4VVExcy8zM1B3OXJz?=
 =?utf-8?B?TE5pUVVKYnhEckpWSlRRZzlqRXU3U1psTDdCUERPQ0EzeDRDSEhVSHdNcStK?=
 =?utf-8?B?dTk2MEQyUllYQytTZ2M1eWlwSFhPZllXclVhc3htaFgvZmJMRjlzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A050470B24B8C649B2A04F84864903E9@namprd12.prod.outlook.com>
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
	GYijG9c8L6THwcWiVDuqYJoF/5Zs5Ltu+vF+2eDexM/WEcye8K8t39EDFl1XnhM3437Hvosz3KOPFePwKHAM27C2SSgwAtlFcri3ge61IsajFf0fWNcN26Ib/rHkRTspy/2G87ozzoIR6hgbdSPj0Gz6N9DfmYWB5vSnABMNQlVRoIfvC2fbPKgHMoNF06w5kYK0spSfNCj6nG0LmpA/wjG+olir0qaJVJTWv9ScEm6Kmk52OWIPSGc5GQmGJYdhmWPMTa2Ym4tOxMlnBDVf0HJs2aaQ6kCDPI/iyZ+VQSVLGBKPa7Vg8NnVeitAF0o6VhwytcEjH3Il7t3xUYn7Fw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5ghx+kDLtlWj7sx1KfV0pB1qynA43UhtTHuJab7sThq/RzLPs8r75jkoPv0UBwlCNiKpZ/V1F4VDkEssAWfGaWUXW9jW/Xq/GTkDnb94S/rMS56jcABzCyidYLLBOx2hvyNmWtaOs/c+A9lNWrV3WoydSXQnm5LNV+mcz2Zha7XVlPlozPnyhEgUlcFS4wt6LnlL+3XDqfnc9i7SWz8k1Ol5BPnzType6PaiyiizM9oqxv8i0rsiuX4+OPJIcy+HQHJVwtMOBh7nnDdSDopJjjg6fE7BXs8aH4KEPKuqDJQtomALDmIz7/czSU+X+2QRTeoxB0CB4rsd1CSryKcaxZk/cDCoXWjufKKBxkTw4X5y3xTpAoXK9aYF5L/v57pktJ+ZmnMewuFf/xahGgEyl9+2ZJ1uj1AFT8rMRBvCTPwJGAYXgNRIgVcf1dsFSnBk/+m9VQcP98M6COfpevdeJfomsIw9AKXebEKJrvHmcD1TxarZxTBxSanumEZjRWXVauCAT+7H57BnYsjH9LBNWB97n4Z6YLLlo4IaV7N8g5bGDlPMw0aWNYPibur/jdJtK3yejoIzEZcZUCC2h/V5iRvA3iZvK1rAOc3W/xT2ynURuVRkDdcOltsH0C2aB7yFQxYeCAfEcqrdzHnvh+7Hxw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526e75cc-c352-44e0-4b98-08df3ad2f814
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 00:23:08.9427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRjYPS7ueEuuRvsikxwd8KAOSFi9A9cBOmAoDJ0CMin62mKJxc/hXTRagH3dST1pbrjKxyy1T61rVjn6CE9i4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMSBTYWx0ZWRfXxH5/HGItWxqj
 /cZVSMgwvPNgXY2v9ATfwtPZUXMNI2LQ+xAAhYaRn22NiKgY3BaIaf5z6/rD+A0f9p5aC0HiMnN
 qD+sOUhUlXrRIc2oQc5PfW7ZFnl0PuY=
X-Proofpoint-ORIG-GUID: 2-XOTO5SHWJgEihsyOBfi1RH4cmQyp0H
X-Authority-Analysis: v=2.4 cv=etZKXYpX c=1 sm=1 tr=0 ts=6aebcc74 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=hC5H4nVttKUOipePZO0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2-XOTO5SHWJgEihsyOBfi1RH4cmQyp0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMSBTYWx0ZWRfX9Z5AKZtHEqzK
 Os/WxMxAtfmjHG3yBQFUdNMA+RTZs7QN+Rm+zNDWy1AAzw/5k3QeoKaximrhlXYLY2JfR4ETLai
 IRpY6ngeR/IMcbvPccLMPfDMhXSEt2GsLeiyzS87Zlb/V/HJyh5v0auJuUo9QYYpLCj4ERn/lyU
 blPd81ClZrOaCiXfMPGqopEPYEX4t+QFOG45D1Y7ISh0Fb5JDqQ1YScsfDUuCisz++Ma0yIb1rG
 s1omMpdYUFVO5vavpvrrcZHJ99dOgvkROC2ydOnC3/FWT/yK8cwMFf05mgbL/HdAk6prmMW67vr
 TxI+zUYJmLNAcSXr0v2rjSnhYTEj2Yb985CAyKBvkE8Q7LT4TJ3FFbL3zBR5e1HWKDyBnIkpIM0
 u+wfwcYV5kqVzZR/gp0Odwh4XkRb1hCseGTMpoAh9Z0E3078wd2pKDCLBSQWXXtnnsw4gvtdWpN
 SvtlPOuLmF7gbdlz29w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611050001

T24gRnJpLCBPY3QgMjMsIDIwMjYsIE9saXZpZXIgTG91dmlnbmVzIHdyb3RlOg0KPiBXaGVuIHRo
ZSBCLXNlc3Npb24gYmVjb21lcyBpbnZhbGlkICh0aGUgY2FibGUgaXMgcHVsbGVkKSwNCj4gZHdj
Ml9oc290Z19kaXNjb25uZWN0KCkgZGlzY29ubmVjdHMgdGhlIGdhZGdldCBhbmQgbGVhdmVzIGl0
IGluIEwzLg0KPiBOb3RoaW5nIGJyaW5ncyBpdCBiYWNrLCB1bmxlc3Mgc29tZXRoaW5nIG91dHNp
ZGUgdGhlIGNvbnRyb2xsZXIgcmVwb3J0cw0KPiBWQlVTIHRocm91Z2ggdXNiX2dhZGdldF92YnVz
X2Nvbm5lY3QoKTogdGhlIG5leHQgVVNCIHJlc2V0IGRvZXMgbm90DQo+IHJlaW5pdGlhbGlzZSBh
IGdhZGdldCB0aGF0IGlzIG5vdCBjb25uZWN0ZWQsIGFuZCBkd2MyX2hzb3RnX2VwX3F1ZXVlKCkN
Cj4gdGhlbiByZWZ1c2VzIEVQMCdzIHNldHVwIHJlcXVlc3QgYmVjYXVzZSBseF9zdGF0ZSBpcyBu
b3QgTDAuIEV2ZXJ5DQo+IGVudW1lcmF0aW9uIGFmdGVyIGEgcmVwbHVnIGZhaWxzIHdpdGgNCj4g
DQo+ICAgZHdjMl9oc290Z19lbnF1ZXVlX3NldHVwOiBmYWlsZWQgcXVldWUgKC0xMSkNCj4gDQo+
IE9uIHRoZSBzZXNzaW9uIHJlcXVlc3QgaW50ZXJydXB0IHRoYXQgYSBuZXcgc2Vzc2lvbiByYWlz
ZXMsIHN0YXJ0IHRoZQ0KPiBnYWRnZXQgYWdhaW4gd2hlbiBpdCBpcyBpbiBMMywgYXMgZHdjMl9o
c290Z192YnVzX3Nlc3Npb24oKSBkb2VzIHdoZW4gYQ0KPiBzZXNzaW9uIGJlY29tZXMgYWN0aXZl
Lg0KPiANCj4gU2VlbiBvbiBhbiBJbmdlbmljIFgxNjAwIChIaUJ5IFIxKSBpbiBwZXJpcGhlcmFs
IG1vZGUgd2l0aCBnX3NlcmlhbCBhbmQNCj4gbm8gVkJVUyBub3RpZmllci4gQWZ0ZXIgYSByZXBs
dWcgdGhlIGhvc3QgZW51bWVyYXRlcyB0aGUgZ2FkZ2V0IGFnYWluDQo+IGFuZCB0aGUgc2VyaWFs
IHNoZWxsIGNvbWVzIGJhY2ssIHdpdGhvdXQgYSByZWJvb3QuIFRlc3RlZCBvbiB2Ny4zLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBMb3V2aWduZXMgPG9saXZpZXJAbWdjcmVhLmlvPg0K
PiAtLS0NCj4gVGVzdGVkIG9uIG9uZSBib2FyZCBvbmx5LCBpbiBwZXJpcGhlcmFsIG1vZGUuIFRo
ZSBhbHRlcm5hdGl2ZSBpcyBmb3IgdGhlDQo+IHBsYXRmb3JtIGdsdWUgdG8gcmVwb3J0IFZCVVMg
d2l0aCB1c2JfZ2FkZ2V0X3ZidXNfY29ubmVjdCgpIChhDQo+IHVzYl9yb2xlX3N3aXRjaCBvciBl
eHRjb24gbm90aWZpZXIpLCB3aGljaCB0aGlzIGJvYXJkIGRvZXMgbm90IGhhdmU6IGl0cw0KPiBW
QlVTIGlzIHNlZW4gYnkgYSBQTUlDIHdpdGggbm8gc3VjaCBkcml2ZXIuIElmIHRoYXQgaXMgdGhl
IHByZWZlcnJlZA0KPiBwbGFjZSBmb3IgdGhpcywgSSB3aWxsIGxvb2sgYXQgZG9pbmcgaXQgdGhl
cmUgaW5zdGVhZC4gVGhlIHBhdGNoIGlzDQo+IGJ1aWxkLXRlc3RlZCBvbiA3MzRiZWY1NDhhOTYg
KHY3LjMtNzM2Mykgd2l0aCBhbmQgd2l0aG91dCBnYWRnZXQgc3VwcG9ydC4NCj4gDQo+ICBkcml2
ZXJzL3VzYi9kd2MyL2NvcmUuaCAgICAgIHwgIDIgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzIvY29y
ZV9pbnRyLmMgfCAgMyArKysNCj4gIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgICAgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspDQo+IA0KDQpQbGVhc2UgYWRkcmVzcyBTYXNoaWtvJ3MgZmVlZGJhY2suDQoNClRo
YW5rcywNClRoaW5o
