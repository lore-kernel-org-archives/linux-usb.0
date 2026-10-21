Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792543118;
	b=GObnOkO/NKEaOC6h4v2ZdOFime9EjqU7SP0NYfUcq45jmBrLX8KWTsmOh4VUapwI6Knv
	 xSzPPrHM2f5aG0e+pLDptdKXUfDPh6+ECI2cbEfMqq/rCMoIfxzdcavt1s4G2CrOcCbfx
	 /Sejzy4C08TZvDx2CsIlzNhbNXF+7Ul1ZlF8mabc+EYHgjrRNQlkuVEpteAupTeLTfqll
	 sSgj33B3w23wdKnUvBHm0LrO9+eQmfD6hojqUh9LCoNlv9rb7554qxG/4/Fu5ulIEJLo5
	 Q/QrLrSGAxQVyqiwQihB/VNKNm3VdXsCh1NQxUaT+nHbNmzVi7QZW33a7bxOup7WpRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543118;
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
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CyIqrtMAql6H0nB8X27AZl8CtJZFhZCea09jdr7DA+c=;
	b=kiWATKq0nKMa+PB2riPsxuji0o2UtM4YNYZi2cWnKcrh2T67CGF+HzXOxiuEuSt+iL1r
	 tZvBB/g4l7GMfz9+ug7uya/yDJfmKllqKjwLr07ggB3j56USNpavwvff1yZO2/8J/D8yQ
	 JO9zhTBORKZMILcu4x4jdnH3G7O8T5zQy3mfU+Lrhj+nccykKN/ps/LkOysSluM22vYJB
	 mcv6CBK+yb2i7UQRXLjDjPmeXL5F7EJKjf6+JxSKz7R02939hSiABM9KI4Cg1hzblaYIB
	 C++UWy/rPhqIOHm5XZN9iHzt1cnwu/wguMHXg8RjYIHAbcl11hummbJXeBpMC2zvN1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=jeYMQ8Xv;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FDE1gNLJ;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b="OUID8Zp/";
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C5606A31C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=jeYMQ8Xv;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=FDE1gNLJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OUID8Zp/
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KLI7i33719268;
	Tue, 20 Oct 2026 17:38:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=CyIqrtMAql6H0nB8X27AZl8CtJZFhZCea09jdr7DA+c=; b=jeYMQ8XvOetp
	g7QweCmqFJ9pYqemRd1USJESaJP543SQJ/DWwYaPmyfSOa+3YCQU9qXmFBEeefnR
	YSqvsnRRNAdvRFxkFlj2KeT1T2/xtXr9Hg+5w7VrrTGtTciG81vhaK7vlTiAIUfu
	xZq3e3pb1e3H9LmnujN0K0pQpd9XUJR7ODT0LT9EJEQFQAhA/a6bD0P4kjh2chiG
	HTwn4TA9e54AU5K95oZbtaUOa3ip8xknAAL13FEExzyEsRJ2gr9SKqOKXZDUtl48
	OTXb2R/7XWJU+6xgAUAXoQ6NTyQzFlC84Ng12EbsKS0RMfHY0D568GezEkyWjelq
	jcv4zug4zw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hdw70g83d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 17:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1792543109; bh=jKqRliQfMKS3hdRGsGp64CRIq6vLvcb4NRWKw4VGwXk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FDE1gNLJvL7CWJmwVZFPMMJYmZvwvg+oZAsPBDOhp/79WNIlljE8NMc9TQQpbH2pF
	 6/VX62GIsPY89ptYP/64aIPsy+sUNI7xlQsCgNVnPGMpTaLjXW9b3tIkIjYHjvIEt8
	 aOKuqmf8336U4OzRnGJ6fEXCUwh4z0hEh7Qja5EFPK+vOGQa69ZpJOzU3+hiHo2UtW
	 9A3B0o6JtutsfPSl3kYYbHvXKuCzoQ8o0L0oZO73o7HHwNIYVxq6Orhi/dc9TVDFDH
	 UVXrdp8LO2CjuWx38R9JIl86rCPgeX1svrDF3+GUend839DqiOxRcEKGm/QycfoV3A
	 f2kDjd89HGJAQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8CD41405E4;
	Wed, 21 Oct 2026 00:38:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 749B4A0070;
	Wed, 21 Oct 2026 00:38:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OUID8Zp/;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4363C220382;
	Wed, 21 Oct 2026 00:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmogvoQcpN3UxlJZ+uROWwHxRHDKVEFrCk9YLWC4qRsCjbsmbqVbJnnEflJPkqp3UJXWXE/dxVho0hPYhK4Ps+2vcO4hssD8u6XqBxNEV3HHMn6eEkPxPd3Ns/J5F9hSNoRrcAcypC08Z3MCkvwPdAy36qCk7FYs3Oc9UVuRdt5ueniK+7jwlOywFP5to6F+MMDce7UP8H/CTpqvUXMJWcTe+XRCO9ezoK1fYTQBXt+mxvVZfv8ufAwu/HZue41m7pEWnzQoZvr2oLEzurhjClGRmDozuUPYM1MkWbXjMs/GW1+B+m3hGMYREMxBCrhj9NymFvQn2uKvsJv9yC049Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyIqrtMAql6H0nB8X27AZl8CtJZFhZCea09jdr7DA+c=;
 b=kACq7fw1OFM/lHpqQZhV4r+o3DFo2UGZqafaTSrEs3cZdS6lG1+euzLzLATcWxEtiWPYhxiZl7uk2j5N76w555Px7oFNPfnl03zT1wxRBf9QzVHVSKwIZcB19iIglTyUDH9IHwtKix0UOVb3G9sF6XHtuqy6Eq2jEYQJd06PxRo/hAIMBOMZi1UF25MIe+LhAcLYExab+rcNjAJNXxwnBLGEXdFAuHrbTQyilLASAIVeg2mqtJUalVP5P6ucWALyNtLwFchNmb2dI/sKPM2w5SkPIGJt/EtLEwll4fWepeOgEFThdY7mn7zUURSkLEf3ouLCQLsX+/9FTguVhXt4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyIqrtMAql6H0nB8X27AZl8CtJZFhZCea09jdr7DA+c=;
 b=OUID8Zp/Nb53BT6dnhQxMBRlGQuj82F7uDsWSncFUVjDu11rGfUZv/MMKo9TxL60Ou4VqwHFrtk4th35LjI8Now/RO1xHLAvvZvzj5WV5WxGHu6GvEYcBoCdvVjkTlQGhb2iH1uZrngUKFgBDnnmHDNqzZvCddu0SUQjZBeDgK4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Wed, 21 Oct
 2026 00:38:24 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 00:38:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Selvarasu Ganesan <selvarasu.g@samsung.com>
Subject: [PATCH 7/7] usb: dwc3: gadget: Recover from End Transfer timeout
Thread-Topic: [PATCH 7/7] usb: dwc3: gadget: Recover from End Transfer timeout
Thread-Index: AQHdYPR7x/CVw0m8xE+ZzK+eoPuXtQ==
Date: Wed, 21 Oct 2026 00:38:24 +0000
Message-ID:
 <7523e9a11303a33acd0b92a092fb0e8218d509d2.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH8PR12MB8607:EE_
x-ms-office365-filtering-correlation-id: e7ee5fd1-8f23-45a0-6071-08df2f0b9da5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|11063799006|261009223027099003|10067099003|22082099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 62VP51d5DUINqYXe1nDrBWt932DKpDsvhxpDblVa+qqjCZJDIz5pxgof73hxY4zegwIy2GEL4DyGar3nNKbAClgEr77JmXBbwDYnXLblDLToYTLvPe3ZIWVKnh8et/WSYtpv5eNGNwxGOS8hPg3IWcwiZHOWER83SHbwMp0TuAUrxDWp8sFhyXgEJ8YPsOeqPH1IOG0FINQnRNVkmk2geDYtIsrSe+2xHea1/JW45DuuExf7PSyFaPYCHlRsCPeHjyLaChpuYE9bbUKWJEwCeALROMzahNp7YwPy15CvMp+NUW/lCYW5ue+c99nJqa7TvbgmZ1yOzS9HDFfANkxSDPks3KZZ3EA/vJNRHpwRYnCJv/dBzKMi7TwYdYT/BbSWy/nsGJRaFwDQNEySpdU+6IBdlBRlPzYxCJgbgTAyhHtsA1iiGMG4ZUmBWo4KDoXdr7ldTkHt5+mmrmdynstubMyC5+rq6lK1j2C47eWXwyZVrHZh63GawXWo0/Y24O6gINjDKTCjVLbqCyw3Y5frTQrj9cP7xrHBZGaju7YeSZmaVALgTCYADj+D4bXNNLO3gwQvmm2OGhbKyxm1ykiwWKipxLQ2wQHOMGZ01VT7qXH+Iyd7Kk4wWAyvnjL/bcWxqQwLSK/czEoZ1/deHWc64C3JUkcjG5s8TDvYRKx35VViLfILReZkKR8a81T2Q6lhrNAewmbiUjw3CDlk9ZXAXyXvkLjHrLSwoAG/X+vwpZk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(11063799006)(261009223027099003)(10067099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2wP6Gq4RUihqx2lw44vVuKp6aSzfwDfPknHaq+Z8heXUf9hdR4S5UoA0+/?=
 =?iso-8859-1?Q?ynowepdux4dhHVvlmJwNT10BBMA4yGA3UBXIpmmbT+0nMnIprV+GTHiJK9?=
 =?iso-8859-1?Q?CFClbtZwgMYWanhvqg6f9vjYW4QNm806aToEZsOZTxJ2WaAu3C42dsDIK1?=
 =?iso-8859-1?Q?GpCG8NKGn/FGKbFB3qqFOh8DL1OHifqvkP14h4AmwRkwYXF+v9shY74S4X?=
 =?iso-8859-1?Q?i6J0cyp0/GcEaeYdKhAy9AnYF+cCZTcCDN3YqqixxOSAx0aPy93eG7QF+s?=
 =?iso-8859-1?Q?NpWu7Oh4+oiHStypZpm2eBjIUV+/1ojM0oJeNts+z8PqLADFTQouXVkdI6?=
 =?iso-8859-1?Q?OFij6wVYvQ9zWZIX1+YqGKGYn535HfWqCVjHtE0Z6iHMDn/aJRH6YUK6Tb?=
 =?iso-8859-1?Q?5Il+7D83bqZhTXgPww1zC004YUy/lWEAWR3F5uPa3lns63/1ZN17EmNjHa?=
 =?iso-8859-1?Q?GyDej0f2BdQnLttVi43bop9J7X8cLwabdAp9FcgmRfyi9Ctm5VlNJxXYUo?=
 =?iso-8859-1?Q?9AgYAnmjQyVco4G0/t+rrKXq+e3rCUEM1fqosfvmJlsSeE7JctdvoB1uef?=
 =?iso-8859-1?Q?NlxvngxZCWYLD4tnTlKsu5tjJ6gjK9Qq3ir4rbVs8pE1jVIaTuxuhQCvvd?=
 =?iso-8859-1?Q?7OpGx+Xz9sYdYlCBxVtUdUkb7cybDVRQ7NWvrYLgEi5cRoPWPAQ9Vr2sHi?=
 =?iso-8859-1?Q?gGgn7bUO0eoNaq/y0JHNtfYol2DMZZ7f5m6Y93wQf9oLBKnql7N+rop9Vn?=
 =?iso-8859-1?Q?0Av7bwxpl7gh5uIIrmUmtf/SPPZSdnE+kCb9fqiSuGagO+Mitypzyv2qV4?=
 =?iso-8859-1?Q?lD8KT0Z1/tivKDofsEeSmuMWDtGVhfXQY/bkr923G/Bx8Vd7RywiIabXi+?=
 =?iso-8859-1?Q?dvqblE5XkhRDfnH2X3UPmqe9U2T2zRyl/L0HjbS7vfqC5PlZhwrtP5N/J6?=
 =?iso-8859-1?Q?iPlOcSY75oATPGEvRGcs373hSWqZkH5UTzgymLNOdaAkOKqWbaeJxDUH2F?=
 =?iso-8859-1?Q?Tgepf8osLonxffBzINKwv5GKXZU5/CRvKt0BUO1d9fK675JMmDFPs64wgo?=
 =?iso-8859-1?Q?WFUwiq3OTzwdI6YSsKFibvlmQufYVH+XNKT5rMYXTUF0eB64yRQttytwuk?=
 =?iso-8859-1?Q?cQ4pfHTQakJRTxUOiMxp19PF2IAR/YtGlzjrzvKHINI8AXim42nB0TAE+v?=
 =?iso-8859-1?Q?fEEv4MYPVPLSiHdu6OW+8SyL+0UP9p3lZI5futwuA/3BHW7cmfEYiGufIc?=
 =?iso-8859-1?Q?rF8JtfBHA3ySAJ2EMSm7isUhu3o+WQWFVV2r5i95uSBQ6L254ev9VvfTV3?=
 =?iso-8859-1?Q?ueL2bd1/4rMjjJcUK+XYsPM6FRIX2xfWApqqNucLrI+oc6x/M6UmiY+d2b?=
 =?iso-8859-1?Q?DPLrCF1bso/bOQ29LiYR1i0GhJA2RetCqmDKG7myUVFxLWz272Ky7SrBOP?=
 =?iso-8859-1?Q?x+egJ9Hi88lADQ9BefH0Tx0VawjqD7uv+UE+0e2i1rDv3Nt79JvFuu4gTR?=
 =?iso-8859-1?Q?XcqRhhwU7e+3IyGS/mAuIt2GNS648eDyEq9/TOOW4rUr6Rq3CLpXmXpOrF?=
 =?iso-8859-1?Q?fZg0ppfAg1244KoTY3dXCWk5yV0ajieMQTO/4qSLSKRGo6t55Mvgs4xuH6?=
 =?iso-8859-1?Q?tIJ2X6DO/pn3C6W5dkIx0OtLEveKMABrR6xY1t8wXeUELmu04kz7k8nFb0?=
 =?iso-8859-1?Q?U++ryPqtKP2tdtNI6BYV77PZLmYSLOOBSrcW9hraMwV63kkxdr17BVAWiI?=
 =?iso-8859-1?Q?1esd8VA95mr22y0R/DR4v9uUkG5MJk8CXeZkjxg0Iu5mvT+Q86nWWURQud?=
 =?iso-8859-1?Q?1m7HQZq+HQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	fFtfDnSIv+kk9wtLo0RHIds1G2KpXqWRGEZamYK/ioLn4hECk7u+vxz52wJgZjP4RlxfDC6Bp1YRu15nza7Yv2OvMXsjBZcf8Bd0KcXWzYMASdwiuTydPK1kUY6fM324v+IgFfIZtsmKXw27evKseurn326jbq6Vss7FN+hEJHpnhyJxmUoVdXyHZsCLWQM/bM9JpJSxzfXiwC2HGPfqHBZD3k7GvyCqGAuVynJkoeNXoVV2qeDXrliW1oMqXAYmEPiuDvDT5RdfHdu5ViLJPbkZDokd96nOjaPdExHz38+F82AVAcCbdop/JaZ2hDxVv9RxNPBhZVvw6aY926S3qA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eEKm23QKHJejhofnr+SqhKstyuePtppLw5+zCEjlQMVihfiGtXuViqtU/njSz97Rp/F5PneGsO8+BJtFWwKJiQgVDji7pwhNFiG+PLgpWkZRoCN0pENphEQYfRK5K989DumWoePECMrYXO66uhYJ/NAQla/awsasIY5ncksmMQqiSe/pSsvYuVhsuFMR05xhCk4xjau2Lc1q6hN+IhKx+LyCElnyY0F53bt0/I/xK6ItLppaNWC77NG/vXqkjKtFgiZKRozrEX2itpIzYlFd0ouhRO5oi+HuuxqOZbw7oXZYJCuK5jR2060T4r3SzyYJj3DG0mkGCLST6VNX5soK3/pzjV+f7hg4ynaLU/v3dJ32UU5YmsOrZSItV1SEopgn9G9kcLMALnLJqggSrQorfdgJ0q+y51Ep4eaV9DktpVWezdoLQxAV6cvwN7Y46PoMGK0GVAtHy7U5+83SQVBGZBM3hlzYqzYYxWpfpKv8sVLc8X1HFDwRBUZyixGcwt28O1dQrYB2WFNZ0VuWySc5Fc7kQsi/ZEWXykAaMQ9oee0gs7XOrTLmUagA/Si1Q4CyxcyLxsyf7eycoCzjc44rnm1ajZAObETpDEI0drSufjyhT9/udzObpFOpwZtD2bwBtOaH6coAviFaqAlVv/goTg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ee5fd1-8f23-45a0-6071-08df2f0b9da5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 00:38:24.5822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QD55WqxSoEEQ6rMwoZ/ZYehkYVbH26XNxcerETsUCupbD0ABZ+2AlD1TQ89RzAk5P+JrGpA38jjcTB6lCd7J9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607
X-Proofpoint-GUID: D7AAE4r2pzSt8uTbh5NYS5k1G4h4TV2W
X-Proofpoint-ORIG-GUID: D7AAE4r2pzSt8uTbh5NYS5k1G4h4TV2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfXzKRF359/XmBm
 GQ/gSRhde62nnvcs22MvcA5M0Gc1I60hYbh7wPfi0gk3UHskxZntCL/A8YH5wSY2G5qw8P39wfs
 xsiKb3ZobtxQXQLxy3IKKNFGBdDk6AYHoiZRqxZcR6uJzPKaj9/y9p3msVc6ieeLiZrgzDPAvyU
 OuPVraWFzsVHYNL7i6Gkhhbxy0G1g32Yyl9pVOop/94K99ofFN2U5uE5FO1GBg72sSlZj5kxDw+
 bD1kbqsU4UIe6ePSe3EzIUMN1nJsezhd1wo7tgjunlUr1npOXSZ76o/cLTLZzo1toS3KDCAmY/X
 ODsH1KxHj2qjmYYzKwit+ey2TfYc35JHvYlIaE6hvlbSm17yIIlNrSNo9gZSqATMQzWBTp2HbE0
 kY+wyNjZATFHXlrLxr/IB+e0WEu6v/dV/W2qh4HSaCXH8CMRlf2ub7tiMoUsdjaZX9vnmOZuQom
 oMgkPwVY73GdfUA7UhA==
X-Authority-Analysis: v=2.4 cv=E8RYNqdl c=1 sm=1 tr=0 ts=6ad80986 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=Yp6ajdBwSLzC-ITpuvkA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfX0JOZe5roBkiH
 lb2d+WEsu04YhQZEMgy8g1AM57RcuzZhg+nSGJprxXI7Jq3pZurTn9865Sz6LN2AAWu/21fPqhg
 gDAzJ29HCOdGxiy3xk4X5bWaAwm0sek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210001

If the End Transfer command times out, the endpoint resource is never
released and every subsequent Start Transfer to the endpoint fails with
"No Resource". Schedule an error recovery to reset the controller.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a8f12e583a0f..a76f669a796c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1775,6 +1775,8 @@ static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
 	return DWC3_DSTS_SOFFN(reg);
 }
=20
+static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
+
 /**
  * __dwc3_stop_active_transfer - stop the current active transfer
  * @dep: isoc endpoint
@@ -1818,6 +1820,9 @@ static int __dwc3_stop_active_transfer(struct dwc3_ep=
 *dep, bool force, bool int
 		dev_err_ratelimited(dep->dwc->dev,
 				"end transfer failed: %d\n", ret);
=20
+	if (ret =3D=3D -ETIMEDOUT && dep->dwc->err_state =3D=3D DWC3_ERR_NONE)
+		dwc3_schedule_err_recovery(dep->dwc);
+
 	dep->resource_index =3D 0;
=20
 	if (!interrupt || (ret && ret !=3D -ETIMEDOUT))
--=20
2.53.0
