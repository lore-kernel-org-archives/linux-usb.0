Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F943F096;
	Wed, 15 Jul 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784157590; cv=fail; b=qK3zirP0hODAqhrAoFYMfwFzSNDIkHy/h/nwW1+iGZFRuAA2WYPfrO0JUxKEGQ4SXxlYsX9n4nvItBTWOq3SVDS6EZPSBB3vHDncKC2NHRBW4A150d5+XwfkOtat5OQzjkgKQexBGN7LTxknlebJDiIfGpAfxAZcqz4T00mY/u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784157590; c=relaxed/simple;
	bh=eJd8I6tDhANQnwHWC8i8DMs5ixCtoEsHl0qNKLL+Pbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jt2TzGkoz6mDw4qtDKOW/HJVo2zu1eSN4xthElMvujO2UoYGh4Ctm5P1u14PTdxBbT1Ogh8sHzTsUPZXTVe89lh4Njkv4xEx/3HglWevqwbX5N0nCDhQmTF/22hikTDao+UIJ4/KTxDLlKA6FEqWgpxrUbUuIZzyG1emnBDYHqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rEepDJ8K; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X3QJT+o3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HoEFz3z1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rEepDJ8K";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X3QJT+o3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HoEFz3z1"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FKQEE53229137;
	Wed, 15 Jul 2026 16:19:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=eJd8I6tDhANQnwHWC8i8DMs5ixCtoEsHl0qNKLL+Pbc=; b=
	rEepDJ8KUuDa8iY4o7jqa6xvdcQOw6R8+0wAstqWO+6MnrEaJRDqyIP2OmQ3qiG9
	auhOyl1b4oPYL/t6jhUYNdeXlo8nVd1O/N7OAXexpAIJINAlX4lGoqvfZG6VdqR4
	Wu64cKf+jVrZN86pr4Y1NKrceLjzpzw7Z9nEi/Jrh3WJG2gk9kmZJFOjyCwTr3og
	EPO+42wZKQITXiw9/Ov7EuaP0v0vqjIl/BbNRtdT+9IGc+gBfeibj1ZLNNc3aOHH
	p6VHLxdt8MQudS5F43tsC6i723jmU0aD8/zHvJzkAr7wTmd5yndffotIcxSsco2v
	MQ2shCgFF2bpaCDwlvA2jw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fe9w8wewt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784157570; bh=eJd8I6tDhANQnwHWC8i8DMs5ixCtoEsHl0qNKLL+Pbc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=X3QJT+o3+1ial2ygDwWf6uAJEAxlvm/eVVcVCcK3tfBw6NpkxEG/vWkq4Ayhxon6B
	 jyBkWWxNWR/yCjUv6oKuAoSRyY0MHzufM6ue1DFNR2uuLPLJrkQYwkR/A5N49ARSmv
	 t5RaFQn3MUZcd5LdQHfks+64lrnbWB311WTtldcKNJqvsL5zqe1D6tTlVjWaU0ChVc
	 j7vK8bX1bK0JgXYyiDDPXDG1J0noqtjire6PkuzMVexBoYcO1lZEUbbK41Gu5ND+SL
	 kD9JZOAruI/srFscHu0wqImYmsmMmKO8jQfXVpA+5W/yN/B7OciFQuXakMBLdjcORK
	 Zmgp95oIfEkDg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51E23401F8;
	Wed, 15 Jul 2026 23:19:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B5358A0070;
	Wed, 15 Jul 2026 23:19:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=HoEFz3z1;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E35CD4011D;
	Wed, 15 Jul 2026 23:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxMGpkn5VgdpwgxLTA6kmlcxf5TEn+Slev0UVPMbqeojO64ouwKH61/ZYMTJlOCer4hyVmMqLp7EccnuTqe+GTzLkgvFlicPQQuSRcjF8WIkKD/UMXipNS3QF49XEFoA1lbbmHS1ied9pTfgBgn7x0GrYfazoqdsXim0clUhyIBzwY3lnqxvQm2CAxhwipdMpn6UnFr43h02k+sv8zCza0E3Ahj2I9o0UqELFeirfT0ozGbqUY+Uiwu6njh2q5tm5z+d3JbKxmd2Q2PgJuz2s7vydpLGGD3f7SHlb+q/JWkLcDce1l3W/XqYV/Xrwnks+934Yr7o1KQAZKP6d4rtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJd8I6tDhANQnwHWC8i8DMs5ixCtoEsHl0qNKLL+Pbc=;
 b=IhNNvtZv1kv+cVnfudXhmltggr36gZeTyioMS2SRhKOPduNEbvTw7r0Y4oH8kRGNZ45I7XFaEfbjaeqklp2o9otXXKf9mFYS+bQ5NroTk/s1d6KwTgjCvoAocf006dEN//ie39s6XNQlfS+ixeaX8+8Hiqe52RTxNPYIGtmIhTU96jimorlHpXGFoG8yhTAfRdvCYBgNof8j6/ODRv1x9maPTGcIpTi6xjhn7/jk1Mpy9PjXdS+wnCRfb+KSSwQTWItD3xJpRHU4LM5YTZmKBhmFgrO2Sj1cuRsSbCictT77MUxU5p8R/crl+3VNmIHOXZuGvMUGH16aZoy7apPjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJd8I6tDhANQnwHWC8i8DMs5ixCtoEsHl0qNKLL+Pbc=;
 b=HoEFz3z1cYbp87iCeUz/d8R78ZOe1Gpl2r8QArgM5aZCrMkvxEqT5MF1epKip/OPiwk+zYQVP3msNcaXSf6ftk+KdyOZ5p8WNq7tRqqI5f/6wYQDKEM17UNnDnldQcsxfKCJZOTXoYYv3C8Ip3n3FAdY2GSduJQSQh2JYhf9msg=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 23:19:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 23:19:18 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index:
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABo3gCAAShsAA==
Date: Wed, 15 Jul 2026 23:19:18 +0000
Message-ID: <algTE3PyJVxLdFq6@vbox>
References: <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
In-Reply-To: <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB6488:EE_
x-ms-office365-filtering-correlation-id: fc9ecf16-5892-4bee-f54c-08dee2c77e9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|4143699003|56012099006|11063799006|18002099003|22082099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 lAZreupk40SLFHDH/sgHQjuzPCPg15NamzdEPAa67rq9sAJUcd5R/XA47bPVY4j6PACGtwQRVFphhUgFc3FqPFpDcO0E97lrc9pTvXoywuyksMlkUL3qnfRIPhe1w0tVWlLTDOSTlcJX+Lg86/+8jJdn2g2yGH9kUsQwiDKQ8C1sDXpORmwCFKM7qTOCw6QMk5mhQLsbspMK4rDKWUXwy9HpqHtysrS/nS56vOOuHeeyfAAC9D1Xr+JXj52py9l33ue/nXpx/lPCqfpkckgFFidkkaBoP4hYf4PC1nx3vu750rbIC7WqA3YPFF9ODtpKIgL83/+1Ogv6wDXJv7fFoKeEyrnM6/0L3Rd/148Fh2HIacPhivI2cOaR0yc0rZ6QU4Xh0FbHyxmsjart/tGSJLU/Sm9zHBDYdGrXOnvbizzrPSBap4lPMGGUY2pPT2GNw3Y1SDfS+xS+l2oWPknbsvBp/XRznKGisG3j0/gBU6yzCVEiyAVcxpX/2WES2pu+ORcGvkOgiwxAHlzJct2UWfdgSY2Z8ttR6OWL4q8/1Mm0u/3AO2VV8CLVcjyypRB2bFJLv909ZWJuPtbq6Lu2VaHo2K8wPujR+0EVQ6l8xwCNrYaVQLz8dda5XMfzusSWs4Bd9AO/Fuv5E7xnq4NUkwC7auQeQdhHD2NJO4CgZna8f+ORUnbxfUlozRHeI27Sp07tXGDnqHRyO7BmVRSoUqEUnA/tJ3ESJjRXg9ejcDI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGxuSldJTklJRG93N0ZFbWdXSFJwVFVQaHJJT3pzRmIrQTdST29ZdllrR0Ux?=
 =?utf-8?B?SXltKzVnUkFTakdtd0syQS9nR3ZLM3ZOY2pFMnNaR2YrUEdpanB0MjdXNGlu?=
 =?utf-8?B?dEdHamRHRUVRN2xtTmttS2FhYTJFOUVLRFNLNmFseHcxakNFOCtKSTJIQTlm?=
 =?utf-8?B?OTZ6MmRaUFhmS0pySXdDeWE2SUo5YzducndyYzVnaUVvSXlFWmg5eWgxU2l4?=
 =?utf-8?B?T1A4R1o2U0RZd3NRdHdnZ2tCcmZpc203UkJpYUF1RStyNTlhSTFpWTVnaU80?=
 =?utf-8?B?dWRyWXZsSVZDUzAyQUJhOGZkbVlkSzFKOTVXeHNUcXp2ajJkOS91cW9HMS9N?=
 =?utf-8?B?SkxvR0VuRmhlYnBqbUVvSE0zUmlGYzF3dTBZazBCbTRuWkVScjZxcUVua2Z6?=
 =?utf-8?B?Ung3clpBaUpBby9LTUxZR0o4QlFqVmMyMzlWeHpvUnV3WExZWndKMk04MFRK?=
 =?utf-8?B?bzU0TG5YZ1dSajVNZHNoMy9kTHNsY2loSmc0NGVNMlE0cU1XYTRSVkpzY0tN?=
 =?utf-8?B?N3dyZE9PNVRjM2JCbUlIT0xtcnNrTERaZWpBcXpXQkFxNW1Gejd3dTdXR3ds?=
 =?utf-8?B?TU1DeTlkSEhib3ZuMEhjVUJPTnUrV210VDU0aFhzM2tGWnNZbXR6dmpUMjBw?=
 =?utf-8?B?bzNOaC9JcXJ3eVRFM0JLbG0xMXB5aGlIWUJoWGhTR2IxQVNoSXN2MFg1U0dH?=
 =?utf-8?B?aWJLa2Z1b3o0WGlvSnpWY01maVNRblVMMUNaOThzcU9mQlEwam5QbWd4eUx6?=
 =?utf-8?B?VWpJVWZxU1FsYnVZUXl5OVFlUFRneHIydGRxVkxuMmg2MmR2NEdRTHBQeFF4?=
 =?utf-8?B?aVRzeWZwYVRySFRyRVNuSVdCSjVvYXlKU0JYaDFZMFhaS1A5WDVCZTlvOFlm?=
 =?utf-8?B?L1JRZ3I0K3ZYanlLaXp6SVY3WXZwSHBUL0xCVGxybTc0amdPS01CcSt1TXcv?=
 =?utf-8?B?ZUZPRmt0dVh1b213NTlZSS9LVVlISFlETUREcW9YVGZTUGJQZXgyMDgyRHdQ?=
 =?utf-8?B?aUxLVFpWeThZMVYwTnhURGtSU1N1OFYrN3lUNTRsSXZFdkJUaVNIZ2FRMDY4?=
 =?utf-8?B?RGRBajkzemhzTW5QUzdYMEd4WjlzQXBXdDN5cFR4NVdid1NBOG9ZTFNzZ0Nq?=
 =?utf-8?B?bDRZTVBsRjRyalhWdnZGQlhKTXdpZUNiTUtpZGdQSVVXT0JHMU1HSm54Yk0y?=
 =?utf-8?B?aXhjU3pIbTlEaDNOVVBNZnR1T0wxNEJ6UGxycWlicDRkL1BqeXVORVJFRG9K?=
 =?utf-8?B?L05uSEcvNVhVWDlPdlRScXRsZXU0K1ZOL3JIQm9WQ1dobmZUKzZHUWVxcDhN?=
 =?utf-8?B?UTlMbUMrSFhLa2VvVy9QSWxqVFRtTFdhVXBUOWJKMm5ENlFaRUxiUVRMTkVl?=
 =?utf-8?B?ZnU3MjdDd20vSFNuUmN0ZkR1ZTA2cTRBeldOY3I3VldUVXVEcDdyM0hwNmU0?=
 =?utf-8?B?ZmdLaDhkYVBhUlBEVGoxbHY5QW8vWEVvRUtCS0FOSi9QSmZuZVRwSHB5ai9D?=
 =?utf-8?B?K01pOFRUSkJpanVCOUUrZW1hYjgvTjRNWkw0em8wMk9nVDJKSFNJTDhtNlJu?=
 =?utf-8?B?eThxNkNDNFpEOTZEOUhjUnpqdDM2WnpTbE92a0d6SEQ5Mzg3d3FUdU44eUcw?=
 =?utf-8?B?ZjQ0OSttVm1mS1plRWUxdmxjYVVodEVVdE8yVStOeCtUNXg4amQ4WG5SdHNi?=
 =?utf-8?B?T2lPbHNRR1NzTEpLcnIzTFRqdFpydkl0WlRRN0tpaEo0K3JHS0NRYW5QQmtN?=
 =?utf-8?B?aUdxQThsZmxmN0xLNUtRYk90QmswaytyVXBTTjh1VllpYU9IcFk5Y293S1U2?=
 =?utf-8?B?QzdZZ3phVVI3azdrdFdPWjZxUm1HZi9XaVBuK2kwaHdoVGRuU1IxSnExRlYv?=
 =?utf-8?B?RjB0Uit5allNT0NteTU0MzY2SnJZRXhEYXoxcldSQlRLTERaYzhmSGJZeVhK?=
 =?utf-8?B?YjdvZ1lJUWFMRnFFcHZZVlNoV000MHpyblRaRGtqK1E3NU92VXJRamwvc3lT?=
 =?utf-8?B?TkIyVTN4YUduR2hWKzB6elRlV3Y3K0FubkZEWXo3TmdpWW5xMDhqNzE3K2sy?=
 =?utf-8?B?REtFTFYzVG9nNGVFYjNNN0lFUEJjcjNyVHQ1SWFzYWY5a0I2TDQrY3BOZGh2?=
 =?utf-8?B?bmpKY2VaNS8xV2NORWJmdkllZENqK1l2NFY1SzgzOFplYjZFN1hQMEg1OHRn?=
 =?utf-8?B?RHRwT3N0VCtQdGRvUWxhVFlrd09SSml0ZGpQbkZuaXNCU1pyUHpNbUkvMG05?=
 =?utf-8?B?VGZkZ2Z1VnBPTStCTURoMW1JQkUrMkwvRU11UjB3aGV2U0l4T0RuNTBHalJ3?=
 =?utf-8?B?bjQ5OWtReCtqWGR4R1pTODM5NkFydXRFZ093WUdxaWVnYnIyZTVLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E256E6A65C04C45947F34127CC0E163@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	j9+ZbUj2ogiV3Ex/4dJv8HT82rUb1eipBcB5fYV66T40yUKuZgkRDjAEmt6TC1N+HKKk2kVGvUiEeQIiUwumwLY24PRihEYlK8fo71So5/+fVocNSlG5y73HbGkyUQaR1x6pX1gXuIa7VFu7F6f4ICyCv4EKC7dOmJMoyjtf6Wq+RtRpE/NFvv+2U3Zkqm3JTVYJXAZzCcKKtciGCz1I0bDjTKuDlWYCy1cdivuOzJR8gUJfvhtOzNcp3BvOpQ2oYhDI4JfYdRRZuu4ng2YVxzYHyvK93Jmkl7U9WfSdW/HQi3Yf9wiLaGwKPA03cRkA/hHY+Gcr0zMDBMOLhr+iHw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iDfHvVmyCPUc5akg0gKRPbYR+MhuOanc4kcJZPKwJsCwGeiFz+GXYRhKIMp78s3SGzlLvvBMYNS7GEiXymzKooWZI5nLymoUya2ZwD0dzOAR0oPrkKUeUGRAy7mZTOsVGc5HsWToISGdlYCSQkT5DVooegAkZra8bFFY8rcObGk2VKL1wBe9A8MjEwb+eCQL5Ce8y6w2OuZ+pK3nfC4z3xeRti1QH0qC5F+tMtTz5gY8a7hA9c31f3MNRE6pi6FUF6agzcRI4G44VwuMU8wOjxAh4jX6/Ww0gspSiqumOyJPOyp8yGZyBMAQc3fPWpPDuiuRpYIBW9KV0Ww5EGS266utYUqbYA3NpL3LLrAD7okhIO0UzH2qdWE2RvnOdc6juVLgj2cowEd1NWQmTu0op3ZrXqQR1ulhiPVTOz3yil/jKZYXdPe4iDvFwUvw/zYjCfe6b2mXo+cha4ITMhsiKSn0tQN5Fp4bwwzmjHumgyKUgRlO969loyrLJrFq3QEA0phv49vJXCL4M64gTM+j/K5X1lf8Eur0qGQ0oHH/S89rUlP8/zKAGgJOh4L707X1c5uShmFPzZeO13Ux2cOvt5KaKhNUTTz5+/jRbQXfVn/z/7cb5W5C5C9xSTWn4EMdPpbV6yhg7ZfrxX8gvDR/Og==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ecf16-5892-4bee-f54c-08dee2c77e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 23:19:18.3489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/nWtfgIaNAEiiJ18V3/v0b0YCiFKQ1PQfUhczPBbORXalECW5hDM2uNlCwR+hmlQFS3cwz5G3u/22fo/qAA7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIzNCBTYWx0ZWRfX9LIjDEAyiNh+
 SX2Ynt2wFDdrCKkEJ3A2BaCF+ve0xyBJQaPUXJw+WB8ezevywLrnUxg1G5FXT1qsYANeiRNt1Mz
 yg8j6jAH1OcZc6zZnJ+qSY8rpIE6GRUIVKSNAjbCJdUd1sMfVC4cn31IdaLvyEFcacw7LPAm8o8
 2iZ1kIoabLAmieDkSgIuyXu/E0rz9/gKpU+F3sekTOyh+7Du3u71wqWQzLZyfkpFf+OpYq1mUBd
 5hMHWBurzBtVEXTD/6BgeukkLMj7v9y8OZZT4ndB7YUtOTH3Hw4XLqo05LtERXx8AiMxw0GUXiP
 Mxj+AyHKdoeggjAEFESZGTeSXssDU14Er9gKtM7f18VPzMaKR4tMipRpm16pCjYBULlPp/eeXWB
 G2o0MNnT5C4uL2soJHkbiqnvrr96Y80maiInY+OAHtodZnPsC9MC5EWn9F7G+48tnGKnBNC9sDP
 SqVpoh0mY+3JfYjg2eQ==
X-Proofpoint-GUID: KmB2O8HqhMFrZBr9yuZ6t6W--w1L0Lpn
X-Proofpoint-ORIG-GUID: KmB2O8HqhMFrZBr9yuZ6t6W--w1L0Lpn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIzNCBTYWx0ZWRfX+keBdXPEjMng
 ki5DLvEXcE1cVQ59DxM2L/X4zwB3soxo6+AqX256NojMEP4MdL28r9f8MPJmyCP3r9kLjjjepZb
 iXdD5aYqlC5VLSvKdt/mcoY1GZu3DwM=
X-Authority-Analysis: v=2.4 cv=KeLidwYD c=1 sm=1 tr=0 ts=6a581583 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=ExWW-DEU-sLxsG46nXYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607150234

T24gV2VkLCBKdWwgMTUsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNy8xNS8yMDI2IDQ6NTMgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBNb24sIEp1
bCAxMywgMjAyNiwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPiA+IE9uIDI2LTA3LTEzIDIzOjQxOjE0
LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgSnVsIDEzLCAyMDI2LCBQZXRl
ciBDaGVuIHdyb3RlOg0KPiA+ID4gPiA+IE9uIDI2LTA3LTEzIDA4OjI2OjU5LCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IEFuZCBEbWl0cnkgYWxyZWFkeSBzYWlk
IHRoaXMgYXQgdjMuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBBbmQgSSd2ZSBhbHJl
YWR5IHJlc3BvbmRlZCB0byBoaXMgY29tbWVudCBpbiB2MzoNCj4gPiA+ID4gPiA+ID4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi9h
aGpZd0p0aU1zbTBCY0NoQHZib3gvX187ISFBNEYyUjlHX3BnIVlrc0owdFB0UnRoOWV6OHQwR0Jf
V2F4SDN5bngzeWE4TThhRkl5S2ZZcEFwUkNfNzlJZzkzQ3FFMk1LY3JHSjZPNnRfRGwzUkQxemZ0
cm54aGR0Y2ZvVzdoZ2VwOHckDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEl0IGRvZXMgbm90
IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHR5cGUgb2YgcGh5IGlzIGltcGxpZWQgYnkgY29tcGF0aWJs
ZSwNCj4gPiA+ID4gPiA+IHRodXMgeW91IGRvIG5vdCBnZXQgYSBuZXcgcHJvcGVydHkuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZvciBVU0IyIFBI
WSwgaXQgaGFzIHByb3BlcnR5ICJwaHlfdHlwZSIgYWxyZWFkeSwgaXQgY291bGQgZXh0ZW5kIHN1
cHBvcnQNCj4gPiA+ID4gPiBsaXN0IHRvIGVVU0IyIGxpa2UgYmVsb3csIGR3YzMgcWNvbSBnbHVl
IGxheWVyIGNvdWxkIGNhbGwgb2ZfdXNiX2dldF9waHlfbW9kZQ0KPiA+ID4gPiA+IG9yIHJlLXVz
ZSBkd2MzLT5oc3BoeV9tb2RlIGRlcGVuZHMgb24gd2hlcmUgaXQgbmVlZHMgdG8gdXNlLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9waHkvb2YuYyBiL2Ry
aXZlcnMvdXNiL3BoeS9vZi5jDQo+ID4gPiA+ID4gaW5kZXggMWFiMTM0ZjQ1ZDY3Li41Y2JmMTdk
NDkzYWQgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvcGh5L29mLmMNCj4gPiA+
ID4gPiArKysgYi9kcml2ZXJzL3VzYi9waHkvb2YuYw0KPiA+ID4gPiA+IEBAIC0xNiw2ICsxNiw3
IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCB1c2JwaHlfbW9kZXNbXSA9IHsNCj4gPiA+ID4g
PiAgIAlbVVNCUEhZX0lOVEVSRkFDRV9NT0RFX1VMUEldCT0gInVscGkiLA0KPiA+ID4gPiA+ICAg
CVtVU0JQSFlfSU5URVJGQUNFX01PREVfU0VSSUFMXQk9ICJzZXJpYWwiLA0KPiA+ID4gPiA+ICAg
CVtVU0JQSFlfSU5URVJGQUNFX01PREVfSFNJQ10JPSAiaHNpYyIsDQo+ID4gPiA+ID4gKwlbVVNC
UEhZX0lOVEVSRkFDRV9NT0RFX0VVU0IyXQk9ICJldXNiMiIsDQo+ID4gPiA+ID4gICB9Ow0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gZXVzYjIgdXNlcyB1dG1pLCBz
byBpdCBkb2Vzbid0IGZpdCBoZXJlIGFzIGEgc2VwYXJhdGUgbW9kZS4NCj4gPiA+ID4gDQo+ID4g
PiANCj4gPiA+IEhpIFRoaW5oDQo+ID4gPiANCj4gPiA+IFllcywgZVVTQjIgaXMgYmFzZWQgb24g
VVRNSSBQYXJhbGxlbCBtb2RlLCBidXQgaXQgaGFzIGRlZGljYXRlZA0KPiA+ID4gUGh5c2ljYWwg
TGF5ZXIgU3VwcGxlbWVudCBbMV0sIGVnIGF0IENIMi40LCBpdCBsaXN0cyBlVVNCMiBQSFkNCj4g
PiA+IEZlYXR1cmVzLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gVG8gZ28gdGhpcyByb3V0ZSBw
cm9wZXJseSwgd2UnZCBuZWVkIHRvIGludHJvZHVjZSBhIG5ldyBwaHkgdHlwZQ0KPiA+ID4gPiBh
dHRyaWJ1dGUgaW4gdGhlIHBoeSBmcmFtZXdvcmssIHdoaWNoIHdpbGwgYmUgYSBiaWdnZXIgY2hh
bmdlIHRoYXQgbWF5DQo+ID4gPiA+IGltcGFjdCBtb3JlIHRoYW4gdGhpcyBkcml2ZXIuDQo+ID4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBJdCBpcyBub3QgYXQgZ2VuZXJpYyBQSFkgZnJhbWV3b3JrLCBp
dCBpcyBqdXN0IGZvciBVU0IgUEhZIGRlZGljYXRlZC4NCj4gPiA+IA0KPiA+ID4gSSBkbyBub3Qg
c2VlIGJpZyBjaGFuZ2VzLCBpdCBvbmx5IG5lZWRzIHRvIGNoYW5nZSBhYm92ZSBmaWxlcyBhbmQg
cmVsYXRlZA0KPiA+ID4gZHQtYmluZGluZyBmaWxlcywgYW5kIG90aGVyIHVzZXJzIG1heSBsZXZl
cmFnZSBpdCBpZiB0aGUgY29udHJvbGxlcg0KPiA+ID4gaGFzIHNwZWNpYWwgc2VxdWVuY2Ugb3Ig
c2V0dGluZ3MgZm9yIGVVU0IyLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIHVzYnBoeV9tb2RlcyBk
ZXNjcmliZXMgdGhlIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBjb250cm9sbGVyIGFuZCB0aGUNCj4g
PiBwaHkuIGV1c2IyIHN0aWxsIHVzZXMgdXRtaSwgc28gYWRkaW5nIGV1c2IyIHRoZXJlIGlzIHNl
bWF0aWNhbGx5DQo+ID4gaW5jb3JyZWN0LiBJZiB3ZSBpbnRyb2R1Y2UgdGhlIGV1c2IyIG1vZGUg
dGhlcmUsIHdlJ2QgaGF2ZSB0byBhdWRpdCBkd2MzDQo+ID4gYW5kIGV2ZXJ5IG90aGVyIGRyaXZl
ciB0aGF0IHVzZXMgdXNicGh5X21vZGVzIHRvIGhhbmRsZSB0aGUgbmV3IG1vZGUNCj4gPiBjb3Jy
ZWN0bHkuDQo+IA0KPiBIaSBUaGluaCwNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgYW55IGV4aXN0aW5n
IGRyaXZlcnMgbmVlZCB0byBiZSBtb2RpZmllZCBhZnRlciBhZGRpbmcgdGhpcy4gSWYNCj4gYW55
b25lIHdhbnRzIHRvIHVzZSB0aGUgbmV3bHkgYWRkZWQgZW51bSBmb3IgYW55IGV1c2IyIHNwZWNp
ZmljIHB1cnBvc2UsDQo+IHRoZXkgY2FuIGRvIHNvIGluIGEgZGlmZiBjaGFuZ2UvcGF0Y2ggSSBn
dWVzcy4NCj4gDQoNCkF0IG1pbmltdW0sIGR3YzMgbmVlZHMgdG8gYmUgcmV2aWV3ZWQgYW5kIHVw
ZGF0ZWQgZm9yIGR3Yy0+aHNwaHlfbW9kZQ0KY2hlY2sgd2hlbiBjb25maWd1cmluZyBHVVNCMlBI
WUNGRy4gUmVnYXJkbGVzcywgcGh5IHR5cGUgc2hvdWxkIG5vdCBiZSBhDQp1c2JwaHlfbW9kZXMg
ZW51bSBhcyBJIG5vdGVkIGFib3ZlLg0KDQpCUiwNClRoaW5o
