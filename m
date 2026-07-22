Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6642F6931;
	Wed, 22 Jul 2026 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761640; cv=fail; b=ZvcNUt4OxiMp7eWHk0Q2A9ohO7HrI0Lfu6Qp46gDkkB1pU7EuBbEVCoVLarNMeiTQ3Rqrelzvjd2VSl58DS2TM7U/QxxQF5rMY1gVPPy+JhQp2xv4od7PaJ0qn/N9qJZWYrcoH++DZShPAbz6i2ki5Qsiw/7YH4/JOZzhyodL00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761640; c=relaxed/simple;
	bh=gNL8aA+2S5UxZ6QCAsmRBJQBeN0yA/KhkN32skkBvAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SRXJVhlX1v6/WZbsxozShlIIM+p/7oCO8ibijEkPrdl+PsMYmXMEWjbUB8Ze6pNaWp8RZDxd3xDe6MJe6iy/D98ylcciaj1UIwj39Yry7FhICZNvzR3bg1mzWM+jFz+GGa2wqwxM151yJUZz3oQntdbMFw6PVOiWJlEELB/LovA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=H/pnN3/y; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NPiwGpoM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AANH8Nis reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H/pnN3/y";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NPiwGpoM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AANH8Nis"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMEucH2010095;
	Wed, 22 Jul 2026 16:07:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gNL8aA+2S5UxZ6QCAsmRBJQBeN0yA/KhkN32skkBvAw=; b=
	H/pnN3/ygT+8pGXrTRcC+dFZqtHzqP5RpHKAbWLp/7bbTXctVB3mUTJhqeF4M6gV
	/H6T59QnLr5YgKBYPtKRXMt58bJ8HTOEGwYwR70MKdJtG6sxOCSUeuofGT+Ie0ED
	QIF5SvdLnOumZ5q/EKU3RTtOzCyLiG/x0V3E6h5Xf1C/YQ7N/Afeiprb7igXck+o
	/PP7XORBQ+RsTPUk9fHOI9o5wAlN0lh1NdP/vxNrPf1iD7dfUWnt6+KqEn/2wDSj
	Y/B57ydvBSE0UELpothLx3ANeoiUK8WRCdwofoE9Nnd74Ey4iaTpb5DwFFpBD7dH
	GhvD+8uV8xU3WdTPL8ViTA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fk0eh3ysk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784761633; bh=gNL8aA+2S5UxZ6QCAsmRBJQBeN0yA/KhkN32skkBvAw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NPiwGpoMoRS5v0Vp5DDtpyqocoT51jP5IP2GGDKydoEr0U+jvqCma+k4m+oH3wYTA
	 zktedNpHvGXDwOCHEv9aAUyJG7rWYd3IoUwWHCvh/i+ugv7z8IZu/m9kT4XoUdaHLK
	 cKD3cMswdfwkpFzT/3adFhXV0HkTJknWR4NjzysJmzNRUSHsIuku5R5+dhOPvDfTT5
	 o35+j6BOmm778FKaSGt9h7rkvjC/gVLfJJUSkqFC+gYhGEVOE221oOZ4Hp0RwO822a
	 A41UfudaZ03H3eaIShvl4xBeIykjyrYuWau/oAeH85hdzGpRCcFyspg4TGicshtI36
	 UIdHQ8gB39q2A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF9E94017E;
	Wed, 22 Jul 2026 23:07:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4DFE2A00BB;
	Wed, 22 Jul 2026 23:07:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AANH8Nis;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00604.outbound.protection.outlook.com [40.93.23.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 59F9640301;
	Wed, 22 Jul 2026 23:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljQ9/tkoG+lzTrjnjesWsRw0MaUfW9UNNNDW9KyFu+7HNobhk8NspcRGjYRJVGclhEiJc7wXjk2elwMsMU0dWFngdur3fmGm9T4wqPErJe4o9zuRe+7lchZSikWR05DFlseyhQ12URuICF+MkIKCcw828RKGxmmrvzyX3EVNYzS5gtua0gg4nUrzxw/f6sqTT9DzwyJ84Goc/YqrLQQOEAnzrebfNSUIdfqpnqtkijYvtebM9zByogEugbu1iE6G9087Id1ayBUF+qhbC8YmYWoPwydnOcLpG5HwpiuaXLj3AmuRlaIkOGfgk+XW5ukMeiBcYj/XobeeFrhqMGp73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNL8aA+2S5UxZ6QCAsmRBJQBeN0yA/KhkN32skkBvAw=;
 b=K3LhgJLDJi+gURbdKRNXAl+q+XB8LHRMb94PR4I+bMhtps3fpRQtiaQqeuhvKpC5uaEGBn1tp2GoJDdv+5BcgYM5bP4CwAuOZtZTMV/GmdjBq53SF4zrC8PQUyvZeRXF//uYYLGDZLzD/WoCIzbJD8WQ2Sz6mZDJOwD1i6KkYPXom5J3AFM8sFLE9UFUUON/4GV2S499fsC9+quww6OwXx15Fq9T8yHo2dCiVr5qzv3EPIZyRQ84NkG4DQ+elkJDakm9u5gN2k9Aprs/9MUfp7oHLvnSBZq/rz0hUOvIOwcGTwEmX/8P8/HfUbej5TpBiBfqMflP1p3r0qu+Gnb2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNL8aA+2S5UxZ6QCAsmRBJQBeN0yA/KhkN32skkBvAw=;
 b=AANH8NisWWxecElvsLB/sw8pGuXgypdEzJqa77kVr6wtjAyYAnPVc2TCOOWKxWV7bKd8SO88aTkWq+ZFevK7Ur7WeShSHLBDAm1dFnWRLX8ZBs6r6xmZYALJCWMoSRXr3l3lfBaM+pXcn80BzK2Z/JvGwq404js+ETk6L6AIhbs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 23:07:06 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 23:07:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Konrad Dybcio <konradybcio@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v2 0/4] DWC3 link tunneling state reporting
Thread-Topic: [PATCH v2 0/4] DWC3 link tunneling state reporting
Thread-Index: AQHdFFWYUWPZFLfG1EiHD0hWgIpMJbZuiqGAgAuqGwA=
Date: Wed, 22 Jul 2026 23:07:05 +0000
Message-ID: <amFLpbtdT9MCwPIf@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <42b1c982-410f-44f9-84ec-40d042bef1cb@oss.qualcomm.com>
In-Reply-To: <42b1c982-410f-44f9-84ec-40d042bef1cb@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ1PR12MB6314:EE_
x-ms-office365-filtering-correlation-id: 93094378-0829-4110-dd79-08dee845f28a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|38070700021|3023799007|4133799003|56012099006|4143699003|5023799004|11063799006|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 28CU9bMHE+ImLluT+sM6WAGJogiOJtIwW/mMi4y9xyE0tx8C7GSZcE1CVLdJh7l9oR7LOfXs/PqHe0XcRaZ85jTR948eVWzv2wSVsaz0xu1GNihLTfnVLF72Yv3bKj5zAN3O/jJj6jhDVSFp43bErEH8eogRUq3tiEifvHXpocGOtZyC22LGjp6ZzpElcTWWfmWLduI1MyC9Od/bdhD/7oqRy9LsXN2dxf0UtPZzeufXcOpu+fJQhnLTceGD4NOSZiMi2OeCxCbC5ckjq5nwWw6IqQAdKy2Ouj5CbEYnM56x69BmDIhLfeba35ZPTP9Wn/uyabizQiEiY6CcUfUGFWMsQTtgQX2POpiHw7QJoxJVm8fXeXTYeUFuZf7qM2E7ElB9sBa1Dpr4AnMZMd8FFkR4XBjSiDxY5l6cnpJ7Y7O2Ud4h0mPHdeQl3pRrkAijvr/4uhIT/Ar3Ty8R+fE1FvakyGTh/L7FKB/0+n7aiDOAH3+LRDISA3Aq7N/zjbsfM3YAaApLhtHFLHlZFjaGxwPzu/GljcdTmAhbxo2kupjZMx6LprBQGlwt+El4TuYtDkG3feQ6C0i/3w9DYfXr6TOHLNPSlNaIBp+npTwB2jL8MscZ2HRtyjOvBFfYYCs8OuzQ7hpJa2lAcbYguMedSh23iGaclaBzHXILoEn/nTI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(38070700021)(3023799007)(4133799003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGFrUFczdmRoMWFqUHVzRVY5ZDJkMXpmdXpoclovT09BYXZSL01lRFRaMk1k?=
 =?utf-8?B?d2lQby9hcGJDN0tscE15dVFxTmlqdWFaMWhtV3lXSFl5eUx4akNYRkszMEtY?=
 =?utf-8?B?dXNTZDAxWDd1TG1GQkJ0dW9EaGdZbEE1SWY5VWdjcWllbXZIcXlna003RDNM?=
 =?utf-8?B?RDFub0ZYcnVDb1NtNmpjY2JOUm11RFk5SEN1b1h0WjRYMWIvL3VlQ3Zpd1d2?=
 =?utf-8?B?Q1hTcmRxVFFlT3JIM1hsOVRaVE5RZThLU0VaSC9YazBKRzJZWDBZWlU2Z0dE?=
 =?utf-8?B?QVF1MWU5ODBwdFhwNFBFRExjUnlEUkpiUFdoVXAxNzl2a3ZNZE16cmlHVDI3?=
 =?utf-8?B?OHlSSE5UV3VQTFhTTk9sR3l5Y3FWaTdTUjlxd1pXZXpMWDRUMVhjbFg5SU95?=
 =?utf-8?B?ajNtV0cwSnBBR0VrZkdWY09FYU96eW1VZ255amlFdjFPNFdlay9LTEdqNStM?=
 =?utf-8?B?Vm1MVjB5NTNNcFJCSVJ2QkM0SHhrN0I2bXRidnA3bllsYmVxV2NpMjV5OXpQ?=
 =?utf-8?B?d21mMnllSVFpUkFkUzdURU9YSDh0U1prekE0ekFaMUhVbHVGZ2tGS0dnWXFL?=
 =?utf-8?B?U0lsR2NxeGVsdDdnN0l5bDJZWFdQdWJYa29pRHhpeDN3RWlZZVR0dGRnbW1B?=
 =?utf-8?B?RDY1QkpLc0V5cHFEc05zY21WOVFrMy92cnRNY0lPaUZWVndQbm1Ud0tWTUxX?=
 =?utf-8?B?U25XSUp6UGlkOGs0djZuVUJUV1VTQ21TVk5WNEhxdy8vZm0zWTVKS1JPb05O?=
 =?utf-8?B?T2tUUmRNSmZUVFcvbXZPTU9zMStQWHlJeXhuMjVSVGdtUVNVbmdLeUFRcjN0?=
 =?utf-8?B?UlpNcTBBK1p2SERUVDJWbWJxWVdSTmxjcERuMnYxdnpMVGxnQktSbXZNbWpD?=
 =?utf-8?B?ZWQvS040aXduZ0VEQjRocTJzR2ZMTGo4Q0k4WDN5elE0RWg5dWdubDRDQTJC?=
 =?utf-8?B?RjBYcmU4bDJjdU9kd09hd1N4QzBIUXRPWGFmN0ZuQTZwSXZ2Y3huZmJGZ2Qz?=
 =?utf-8?B?cm9KSFBCUWZtcGxjTmhDUGx5cGh5Z3craGMvRmFxYlF4MXRmaDlzZUpPbnZM?=
 =?utf-8?B?RlhwUytIc1VIVWhoV3JmU3J1Uy9uMFphSUdUNGZweWZOUG45TEtwT3p2SnRv?=
 =?utf-8?B?dGkwOHdER0dWblhleGM3OUVwVjJkd1NWVlNKd2lxL0RVejRpY2pLR3hJMkhi?=
 =?utf-8?B?UG1zVWtWSVgyQzhsdDRHWHo4aXZRTElPbFA5dmN4U0FXUjhYb0x4dUJkM1Nx?=
 =?utf-8?B?TjNQdWkxYm9QUXVjMmRxek91S3hUdm1SK0F6d3FFTFhtWVlMVHRiTDFMeVBU?=
 =?utf-8?B?a0lCOEVhWE1nRDVacTJFZVBIMXc0b29wQW5WT1VqNktzdW5DNlozVzlidXg5?=
 =?utf-8?B?WElPMHhZdkV5ZFBMWWRLcncxY2dJYXdVREI1RmMwMVFTcWU3NWp0ZHZ1SXNO?=
 =?utf-8?B?QlFnVVQraEQ2cDU3bi9yRXRPN05YNkNTQTBkWW5rcFg1clVQYkRoNHRlZnJE?=
 =?utf-8?B?SXlNOE9qMk11WEUyUVlXSW1IaktNOXZzMFpzalBhVk0rd2JTdVA2YkFYamZJ?=
 =?utf-8?B?czRpSDRWYzEvUzkxSk44U3V2eWFUSzNFMVlIOXFJK2Q3aCs4azlUWlVZSGd4?=
 =?utf-8?B?WjFGaVg4bktib2tydUZ3cS85RU9SSGorY2ZUU2hwWEdGQldzcHdiT01lY3J2?=
 =?utf-8?B?bmc0RmxGSzhwY0tCK2ordE1IVXJKZ29LYW5BSmhTWEI1UkIvL04vb2lUSC9C?=
 =?utf-8?B?MExiTG1wZmJKblpvakVBMWdib3FOTWZIUUI0R1VKR1hvTkl4UE9GTEs0NVpS?=
 =?utf-8?B?TGJURkpxQm55Rm9lQ2RGU2ZoeXhiWlZMZS9ZeW9MU2lscmJhU2F2Ymoydk0z?=
 =?utf-8?B?N3dkdE1aS1ltaW55RWFUTzZWTGltOENCZGtWZkMrbFNNNCtuazFzVHRoLzcw?=
 =?utf-8?B?bytOUUJ2UEZTbTNTM05nS2RBMGZhYWxUVEZXVGtrTHFzZ0RPRlY4VUJtTHpK?=
 =?utf-8?B?aWNHeng3VEx2dVlCZktGVWhIRUNFL1d3bktNRDNsY2xpNm4xWDUvdVY3dFpG?=
 =?utf-8?B?T3gyZlNpeURLNFZSN0JCdE5iRHBHZmE3MFRHNDk3S05zU3UwbEJwWHJyRDNw?=
 =?utf-8?B?cWs5QlhJVkxVNW9vb3N6TjQzV3BsTy9QTThMV1dhQS9DSzQ2blM2T0dKYi80?=
 =?utf-8?B?ZHdXdjVJNHJESzNHUCtJNUxQWTYwR3ZFckpPR0FzWjFFNTJhY3FBMW9xT2to?=
 =?utf-8?B?UVB4MzRWaEdUV2tqTTNFSVBDR0phd2lZaFZOTENiQklURVZtSmZWUWt0WVU5?=
 =?utf-8?B?ZkdlWkVpanJucGY4SjRlU0o1U2RpNzdudnd5aDVEWXB2QWkyaU5KQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3471ADC56D6E1649856A0B48B9AD7141@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	AD8CHOOCJH/2l5U37esEYof1k1TGG0CR9joAfgZgQFw8Ttnr28QrSt6XPVTt3TEUeloFNIHMYbl3nIRcLnXeieDjla1y8aHcLE910HyuQZzSQi71Uu8UoASqSLL0rhxFgad1QA3igqU+lC3DDVWw0Y4WH/Yvci8LfWK3umEVjaFHmHflWWjhBmN2Pq3fkBkR+recJ+eUVMuvq3k+2C98vKAwO8wtbMdjfzcfVfy98EuKkXoOH+7eTVeyg18nChqeMl56qWuIhJjRNSpcbEkOhvUuJY/cuH0yx6E/JU+MA0GBUgGGgnA8574bxnvsQdRg3jg5v74J83FszXX39moVKQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yxyjKz85znDolzBhjSTsB7352w/kASzNHcABUG/jjbN/8gChI+jvFq+KeWWf7eVcxc6Sr3iFuWpJBa3RQ8w92mvHv14VHMRuh8mbNbVFCIWIPtlvaQjDj4R/tBB3MGRREigMBM21nnCAtd+7ACxptYeIBzTwRHH8loW6P+6q9yJwisKxoaYYk7aoUZyz/TUBj+FHC7CZr7OoSWaPHTW/lfO/BQWD7Qr0J/97xG2HWgncGhUwq1TD1FC6qyZa9uGYcaCBz8/j38F14Y1agVonfHs6NKI3ZHPV5otIMS5HbzKTEI7sjQRD3Hj7UpznQ3G2V0bY6qsPCEVZHbTm25/Xh1lnjWanuOIVxTK0q0WzKWsyrruhiBGvfyT3hYr23cPTaYusQGVyNO8nyKmVDeAjwG2BOcWDR98FviWQq1rAyuDYfFNz7IaS/2Xoavy1ANfKqU1jhZTp/NiEM+8YoFzljxBc+Wt/E+ivckOhz2ud6UQasvOMpnAWW55hX8aOoDYPcv5QGfDJH4+gyVbp4sp4hyd6lw+3Z3C2s+DxkekhkC5IGUP7AoSXtDhUUrMTJZ5brEsW19HEZE/WoyV1njInPlrShh0WM3qblLi/zum60s3RHzAm3x0EsPVBD32HymIGD9pvESVewU/At/PwNnH4Jw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93094378-0829-4110-dd79-08dee845f28a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 23:07:05.2348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMkCUhZsgMvyML8+qohfCpN5yuh5HLaEu2Sd0+zPFpmpyLdHVbJdkN3k2hb6/BRIYGn5NRM6klWoaS0UC7Jf4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIyOCBTYWx0ZWRfX6J8ZXu3rwt0g
 aHEy1ylbjM36nxhc671L6D8iUxl7mWFVgb6Ct8X2nLAKpOea3dqHqEmGVbVgpQx24lQX48aJFB5
 wLaDc73h8tFRYXsPKP4Two81LQaDFm83s2WoOyvNCRZLUndbFHveDDyT7dRngQL6WZf8I8qmd9Y
 pGKtriXekSoyOy6mYSOjCrcbeGo7QZta9fbyjBEV+FiO9HqNI0bNIm1jzJd8iaNQNkDlDqkKx/V
 m5uGFqdm3ZfaBiIfHcU33HiLuocekISKoCPFvCxGxKRoQ4pNCfWb2ZRCk6lf7nSC3wu7dOPj6pW
 sV8fJoMPYMojOrptZmvN9Nk8m/XKvPLTAit0aeSRA9hl3OWLZ/dhwO6WIwXntQT7YaF6SPOTYIu
 TXQOj9CpBBmA0EbalDghrrW3k5yQdMUmkskTHlfze+B24fQMT+nN8ogdsw8EwIttWjDhXQVucMS
 riyJL/HIjLmkdWrA37Q==
X-Authority-Analysis: v=2.4 cv=FKErAeos c=1 sm=1 tr=0 ts=6a614d21 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YUpHdhPJIAP_9rhAVooA:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Uo-kMZkOIIAMsfDx_plqrv3pHN1i3Q2F
X-Proofpoint-ORIG-GUID: Uo-kMZkOIIAMsfDx_plqrv3pHN1i3Q2F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIyOCBTYWx0ZWRfX0HR8TnIiummh
 PhGGOrxrrSo4FBB/Q8DfVudKB2EEP9NEC3cjAWMJovF1fcb9wS8lL+fldcJXSYQl4AuLjWHBxmh
 0re1SISijBVa+Hct7+JwPmZOLV68Xjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607220228

T24gV2VkLCBKdWwgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDcvMTUvMjYg
MjoyOSBQTSwgJ0tvbnJhZCBEeWJjaW8nIHZpYSBVU0I0IC0gVXBzdHJlYW0gd3JvdGU6DQo+ID4g
Q3VycmVudGx5LCByZXRyaWV2aW5nIHRoZSB0dW5uZWxlZC9uYXRpdmUgc3RhdGUgb2YgYSBydW5u
aW5nIHBvcnQgaXMNCj4gPiBvbmx5IHBvc3NpYmxlIG9uIEludGVsIFhIQ0kgaG9zdHMuIFRoaXMg
c2VyaWVzIGV4dGVuZHMgdGhhdCB0byBDSU8tDQo+ID4gY2FwYWJsZSBEV0MzMSBjb250cm9sbGVy
cyAoc2VlIFsxXSkuDQo+ID4gDQo+ID4gTm90ZSB0aGF0IHRoaXMgcGF0Y2hzZXQgb25seSByZXN1
bHRzIGluIHRoZSBjb3JyZWN0IHVkZXYtPnR1bm5lbF9tb2RlDQo+ID4gdmFsdWUgYmVpbmcgYXNz
aWduZWQuIENyZWF0aW5nIHRoZSBkZXZpY2UgbGlua3MgKHdoaWNoIHJlcXVpcmVzIHRoaXMNCj4g
PiBpbmZvcm1hdGlvbikgYmV0d2VlbiB0aGUgVVNCNCByb3V0ZXIgYW5kIHRoZSBVU0IzIGNvbnRy
b2xsZXIgZG9lcyBub3QNCj4gPiBjdXJyZW50bHkgdGFrZSBwbGFjZSBvbiBEVC1iYXNlZCBwbGF0
Zm9ybXMsIGJ1dCB0aGF0IHdpbGwgYmUgYW1lbmRlZA0KPiA+IGluIGEgZm9sbG93LXVwIHBhdGNo
c2V0Lg0KPiA+IA0KPiA+IFRlc3RlZCBvbiBhIFF1YWxjb21tIFgxRTgwMTAwIENSRCBib2FyZCwg
d2l0aCBhIChjdXJyZW50bHkpIG91dC1vZi10cmVlDQo+ID4gc2V0IG9mIGRyaXZlcnMuDQo+ID4g
DQo+ID4gWzFdIEknbSBub3QgZW50aXJlbHkgc3VyZSBhYm91dCB0aGUgRFdDIHZlcnNpb24gcmFu
Z2UgKHBhcnRpY3VsYXJseQ0KPiA+ICAgICB3cnQgRFdDMzIgYW5kIG5ld2VyKSwgc28gSSBsaW1p
dGVkIGl0IHRvIGEgcmVhc29uYWJsZSBzdWJzZXQuIEknbGwNCj4gPiAgICAgaGFwcGlseSBhbWVu
ZCB0aGF0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+
IC0gQWRkIGhhbmRsaW5nIGZvciBYSENJIHYxLjIncyBVU0IzIHR1bm5lbGluZyBhbmQgUE9SVFND
LlRNIGZvcg0KPiA+ICAgcGxhdGZvcm1zIHRoYXQgYWR2ZXJ0aXNlIGl0ICghISEgVU5URVNURUQg
ISEhLCBJIGhhdmUgbm8gYWNjZXNzIHRvDQo+ID4gICBIVyB0aGF0IGV4cG9zZXMgdGhpcykNCj4g
PiAtIFByZWZlciB0aGUgYWZvcmVtZW50aW9uZWQgY2FwIG92ZXIgY3VzdG9tIGltcGxlbWVudGF0
aW9ucw0KPiA+IC0gQmFpbCBvdXQgb2YgdGhlIERXQzMtc3BlY2lmaWMgY2hlY2sgaWYgYHVzYjQt
aG9zdC1pbnRlcmZhY2VgIGRldmljZQ0KPiA+ICAgcHJvcGVydHkgaXMgYWJzZW50IC0gaGVuY2Ug
dGhpcyBub3cgZGVwZW5kcyBvbjoNCj4gPiAgIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL3B1bGwvMTk2X187ISFB
NEYyUjlHX3BnIVlwNGVReHJfVjQ4T1UtZmhISUFUMXBKcnZoS0kyVmJUMTljTjRNLTNFSElBNUs5
RzU3TnBkMzFIczVNTENQbmVBSjNweE0zSnp6YVE3TWNfOHNUR1Y3S0VhX2JpZUVpbERBJCANCj4g
PiANCj4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MDUtdG9waWMtZHdjM190dW5uZWxpbmdfc3RhdGUtdjEt
MC00YWFhNmMzYzE0Y2JAb3NzLnF1YWxjb21tLmNvbV9fOyEhQTRGMlI5R19wZyFZcDRlUXhyX1Y0
OE9VLWZoSElBVDFwSnJ2aEtJMlZiVDE5Y040TS0zRUhJQTVLOUc1N05wZDMxSHM1TUxDUG5lQUoz
cHhNM0p6emFRN01jXzhzVEdWN0tFYV9iWU5xOWUzdyQgDQo+IA0KPiArQ2MgU3ZlbiBzb3JyeSwg
SSBmb3Jnb3QgdG8gaW5jbHVkZSB5b3UuLg0KPiANCj4gS29ucmFkDQoNClRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoIHNlcmllcyENCg0KRG9uJ3Qgd29ycnkgYWJvdXQgdGhlIERXQzMyIHZlcnNpb24g
cmFuZ2UuIE5ld2VyIGNvbnRyb2xsZXJzIHNob3VsZA0KZm9sbG93IHRoZSB4aGNpIHYxLjIgc3Bl
Yy4gV2UgY2FuIGFsd2F5cyBhcHBseSBmaXhlcyBsYXRlciBhcyBuZWVkZWQuDQoNClRoYW5rcywN
ClRoaW5oDQoNCnBzLiBJJ2xsIGJlIG91dCBvZiBvZmZpY2UgdG9tb3Jyb3cgdW50aWwgNy8zMS4g
TXkgcmVzcG9uc2UgbWF5IGJlDQpkZWxheWVkLg==
