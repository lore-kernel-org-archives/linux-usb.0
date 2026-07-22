Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9278B2E7185;
	Wed, 22 Jul 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761056; cv=fail; b=LgGcpoQ10W/y83NaRuqZODM8t8aOKHoBpR2yoCvxv6PxY2Lkw+P9rSCqduNiAUhftG2rtscRGpEocf8iE+ntdc1EbCVfnEUbdXqLng6SVu8T5azhHflPkULO9BA8pPHyuXEwbD7tlwQyH07/pWA73iDDFiFUfgjZTk2oKl3nLCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761056; c=relaxed/simple;
	bh=6c41iwneq3dVnVGSDNMhPV9lSdWWOpj16GUUdJzFArs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZ/jwhUzC5j7pGc2zui/qdVkXyfFWnOILWUvWPwejkXzklAR6l+lJtPhJMeIlFyQCC9RmxHKg6vkcM6RwRHMUX0vka2xDwNRRB0s6tvChEqaViir9oa88loNofKytebCQ+l4T3g7qgSnIuY79BMRSf90xOJA/N7MS0+1X0g05yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Nd+Rhdg4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=i3E79ypI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Kf1e0/Q1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Nd+Rhdg4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i3E79ypI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Kf1e0/Q1"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMF21l2436419;
	Wed, 22 Jul 2026 15:57:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6c41iwneq3dVnVGSDNMhPV9lSdWWOpj16GUUdJzFArs=; b=
	Nd+Rhdg49RbExeUkrLPY28dWiPuds+HTthOaLlvP3wJsVc0ssc1HnUBsUcbpUmeM
	iG8FRdi2MnKRXK/AO4btGjgQlAdCZwgYsHLqYWAjW5CjccdkSDssX4dm8cAMK0l1
	KLGXmU65ktJuCJhc/unbxk12UHB3FnfWZyd7OV5RV8yrCNcBEXG6DsbvYVILnOqa
	Jap+TW+hyjMDzNzAU6Y3BWnv/qbRTVKcCcdO/v/tj/t0LP2UFRA/rpz7pBwKTUsb
	Jg2O4n6ibeOS6qWGNWallL0PhMBAlujvwRd4F//8HpYL5HtDov0MJ9xj1dL4pf7e
	k/ouQioLXQqs/K89bAiWSw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fjtyh6vnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 15:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784761034; bh=6c41iwneq3dVnVGSDNMhPV9lSdWWOpj16GUUdJzFArs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=i3E79ypIzBKjJ91tERzHy4wsG/iUS4nCpf5RoyUSXaXSP7uhLzNca6197AZUn90Ng
	 gK/FVRmbWO3s/NHfEV/GdaWmmuIKC/1uqdFNrPsSR1yNjX2YPfIAlFhDxas2F0df0N
	 TWF+6XOnE7Ab0++5hBVmggcpUX++NMCdg+HU+cyLyoAcz1p9v3fuePTGlHUcT7AHkz
	 omQMJsWgQlT7iE91m+UdlnwqlUFUUzs6jgbmabBy2ALUNrlWqBkbKNrpBCUyurEZeN
	 /hrpBJg05aCdMuAEC0Sav68BcT26SSC+ujBRgUMfCz2SXUjHgiLTDP4NEgslCUn7OP
	 x6vDIblksYqig==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E6FD140134;
	Wed, 22 Jul 2026 22:57:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 87205A006F;
	Wed, 22 Jul 2026 22:57:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Kf1e0/Q1;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00405.outbound.protection.outlook.com [40.93.13.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C73F94065C;
	Wed, 22 Jul 2026 22:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEOxjMjntPDrT5RU/vQHDa8IZa4xoXs7zEMVEeSNMQmEiCd2AApAVcXEaF99Rprq4xbJf4vttsNycH+vLUqkqtgTq7fscSOgfp1r6EhmK4gOSCocZUGRGBBL4MWbJ0vNkOluRwONhaOTz62/hbG5MZHdyqzsG1Zl9XpedkH8i/SKxyaRVE5I+3ED5w5w3nnj+XMQ8msLYxVWQxjfrGkABOQP5lWEuiA4d0eU+tRrNbATZYyjlESFQOnxVh0np0b67ltudoIJbni/NreBK6tgXqKXHqMvHEbhBU999Qz3hFa15Ko4bALt245qzLgRlyOyilgUsNzV/9ndfWYqz3uqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c41iwneq3dVnVGSDNMhPV9lSdWWOpj16GUUdJzFArs=;
 b=BiWfHZdOhubkEKXVT3Qv4yWCerXwKjeN7ahBbvJeQhYhd7SAFxR54f6YYQbIO7iJPU4fGplOiha+jgUNyArHHAFhi2bxmSQbXdRqxL+K6bv7ba0Ud4YUOZZQqTfRkXyvT96cmM0LI1ZLik54kxj8dn2mFKEE3O7NL30a4/eQSfHyc4IjwsBvIVxMHyQwzcLSVvxma8BMNihFp6XRziH7Vz9aneidHK1qmYMWAKzDBQH+fLtP+IamWTjn0HcU8fhR0gh57w84+4QH2L9Qqkvt9wbsoVA6P9sS9DmNoALBuJmt7Sphg/fu30CBF81lIwIC7j0oxQmmihMbwCXjC+XO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c41iwneq3dVnVGSDNMhPV9lSdWWOpj16GUUdJzFArs=;
 b=Kf1e0/Q1s183pLuODkeGHYnEczRxNpV7x40tSQNbYdtFMOX7Ho8VY4flHhYhMkq/2VE20Sz+I2SRxuq/jy3vHWiPPgiT7w3qzhGDXv93d9Xqxj2aGvBp63wVgQjV513Hs576wKyERNlhtraDzPDqZruWCX9BwUiSPxLqdv7otnw=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 22:57:04 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 22:57:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Topic: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Index: AQHdFFWc4ADUIzvtDEWex/edOcuJsLZ6MfCA
Date: Wed, 22 Jul 2026 22:57:04 +0000
Message-ID: <amFCwDiD-StHHV9c@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
In-Reply-To:
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA4PR12MB9811:EE_
x-ms-office365-filtering-correlation-id: a61c1954-44bf-4dd9-e4fb-08dee8448c41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 lYjk+qBI7aUsAjWfhTcxbkbBzUE20byyXx1xZEH8paLdE/hrcI5XvVqy0QA+zZA6ghzZ/jSkfHnv8qprpqBKZVqDM+HYQL8yUPxBh/BjVB83CFzGTKBVrRzVHhEpPk6rICc9i/RyYLftqoFs5WE4Yo99Xz+/bMzeUyvkovjMPs9PRay5z4s49i9rrZ3WzAS99kFWA5RazPzVdZApbUxguqsNHyp6qVq6tv1u2kXf+H3HpikNHjPcVsIdGmnzE87rHTPSGvSr5rVMd7ehuS4FxPBP2j7ufMhz+Cqv6PIfJqKTMWXihzcCjOuLKI8yiZdXisHuJxMU8lHNBMERq4PQf0NPjAFZ657jVgqWKGnq6YTNQ/jb+pfb8vztU5Vr+07YyQacqFLi5L4Mt0mULQS8kqaavhZemmR/CAtxUrEdJmAISkez180sRSeez4l87cZv0LMSLyiTxsAXBcnpyLrKBg4WB8FsCpgzinSmZ2iM8BYYnDfTR25Z+6AZw0yTheyV4cMbcCMX+uBstV3Wtgli89ERiQ0BxUdpYN8wl3dCbu6u+Hw+ve1piRKOcXiBLQGedhbgszBVlmVZZsngMW1iWMdZV/h0lRs1RE7rSPWgl1An2VGWJ1H1GE2TV2XEaZhIYrVrO2FENg6znVviBNfJJm8o62C8bduiU6z4Ga7+iqxLB9t+j8mpHAbVZRYP3wt9p4pFC9ApIAqo1NfRnP5kDsnu6/2UicltFxTvBXoqHfo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEVWR3h5bENSYWhyWmkzREk5VUhZYlNtaGdHU3lhblhlNEszS3lFL0IrY3N2?=
 =?utf-8?B?cHlLUGt1Tm9WL1FzaFRpZEZPQjUyVjliVmNnZUZaMlhtM2QvK0ZpaFZ3YkF2?=
 =?utf-8?B?RXNZTWFUWEpUWW1MSmxSZ09CRjFsOHhBOVJ4bk1jOG1Ha1ZjRlEvUUpGWEU2?=
 =?utf-8?B?b0ZoSlFSYkU0V0JhSjVPY2I2dlVXcXoyblZRbmZkM0lIY2FsMUZtQkkyQTFY?=
 =?utf-8?B?RXczY3QxeXlWUmZyY2ppekczeHoyS2ZPbDg1N0ZiTVJFeEZDV1Y0eVkzTFJj?=
 =?utf-8?B?WmJyUzVTRG1qZGp3bnRhb1JyZ3ByaytTUVBoL0ZsSmUyM3NDZWdEeWJqWnBs?=
 =?utf-8?B?MjhmSTl3blYycU5UMW9EUTQrcVVQRi9VUFBQdEV1azFMSUpmQWxEeGhTd1U0?=
 =?utf-8?B?cDVNRWx6UldGbk1NdUZvSjVkRG1XVmUzajJQSDN1TVdOTDcwYUR2dDMwUU5o?=
 =?utf-8?B?bE1CVEtWbHI4TENDYndxUXcvUjhiOGdjT2dtcVZ6MCtKRmQ2K1B1QWJ1Z0RQ?=
 =?utf-8?B?a1V2L29qeFdlLzdJUk90ZnFvSmlnbEdjZ2tVWWFGMUE1ek9PQWFTaWMvM3Rh?=
 =?utf-8?B?ZUNXb2lGb0Nxd1BNTFpleXBqU1Arenk5eVlWREEvQ3dMK2J0RFVHLzZJKzJB?=
 =?utf-8?B?QkxOWWhmMHRFOVNlbjFhNEFwN1E3aFNvUW1hdGU3bjNkRDFPakpGWUZQdTlp?=
 =?utf-8?B?bkgxdXdUZGk0dGxQL0Z3bTBpUFZKNUhLQnp1WlNXOEtIcDh5cDJSWTFSNEhm?=
 =?utf-8?B?V29NVFNQQlVjV1dPQWlRaDIwUHFXdlNod3M3MzlhMGdCaXVEZ1lkUkxyRnhh?=
 =?utf-8?B?clJhODZGaFRxRVoyTzNhSFowdUphQ0VjVmg3TnpWR1JpMHRkRnhaWm5GN1Nr?=
 =?utf-8?B?cnQ3YlRJWUUxaXVZeGgyTHBUZ3Q5WnZMZUtWb0ZRbDU5VG1nc3NsK0NDSk9s?=
 =?utf-8?B?MG1wUExFTTFXbGFYK21ZNjg1ekFFbU5hZ0VRekpjU1FqTHhiMmE3ZTJrN2o3?=
 =?utf-8?B?OHFvN0lZMlltZSttMG5sa3M5akNJelBzVGhWUTRGN2o4V3F3M1VHaVRhTGRo?=
 =?utf-8?B?Vm10Z1ZJc0JnQWJ0aENhaWNMSXJPU3RtcWE5K3o4bDBOaGRxZG1ocTdiQ2ZZ?=
 =?utf-8?B?NldGYSt1R05Gc0REOGR1anZrVkdMQmw2TkIrVExNdU9aZnB0enBFQjZoZ3JY?=
 =?utf-8?B?dis0QnJZUGhzSzRwcDQydkMzQjhqdG9lcUFwYlJqWHRsd28xSzhXSXJ1QXQ2?=
 =?utf-8?B?SjA5RTVSK0Z0elBTZ0NPMXpGYm9Eb0lwWnZUaW5PVzYvT3Bsd2R5ZkVuek9o?=
 =?utf-8?B?UHJ1L2lTMDl5cWc2NzYwQmx6WlVybm53b01DNElUU2lZS01vcWlnSW1vSWNp?=
 =?utf-8?B?Y3VNM1V6ZHVheVk1c1plUmt0MExvOHhXcno5RU5kTUpacWw2eUlPeFZYaTY4?=
 =?utf-8?B?eHAwbzdCNm1iaHdDbVhUTDNzSXBkK0JidEZZVmZSRCtlV2k5SE1XbkIrVDJG?=
 =?utf-8?B?UHFHaVRKWllncjR6MGc4ZXNjQnhESldHYzBBWmZLdm5PYkdvcVBjL0ZYbXhp?=
 =?utf-8?B?b0NMVk5aMWNBWmNySzdLdjhndkt5b2hHd1EzdGRDY2tydU5RUHpOSXlHVGhR?=
 =?utf-8?B?SmEwdllWYWt2MVZFRWRCNU11RXY2TlplZUVlTlFBQzRhbFh5MzlVQlZiM0Zz?=
 =?utf-8?B?dno3ZlFMV1NBQTRjRzh0aHNJanJzQ3U1bWRiTDZjMzdQOGlhSnpSSUV1Rkph?=
 =?utf-8?B?UjZjS1dPVVlCTUhMK25KSFRJOERYVEdYOExpeUxMNC9ZQjRjdUxUeHNyVGMz?=
 =?utf-8?B?UzVYTGlGYjRscXROS0k2NUgyZW5PcUpWSW16MytnTXlzZXF4ZFJmUjJCL2RJ?=
 =?utf-8?B?YWlOUXJsWFRFK0R1UWtPZUYzTjJZbU5FWkJPeFNvMFVNUHFzTU1uM1pwbVhy?=
 =?utf-8?B?cm5ZN0xqYUpNVlhGTFhQUm5FSTBWMzViWGxZcmhpaVlEemlYZzNMTDBFZlcv?=
 =?utf-8?B?ZkxkNUcwTVdoRzVHSTFKdmpsODFjb0JwcFlva0VhWWVRcW9BaWdjRW1YK2hO?=
 =?utf-8?B?M0xpMlN1UE9FZWlnL1VZQkFHaW43TGkrcUxKVDE0ZmVvN2lFZkx5cnlsWWlV?=
 =?utf-8?B?K2xwNExPcVh2SUUybXpiM293dy9ncXViTHhIMkhnUmxvS2o4VWRxNk1oQkRi?=
 =?utf-8?B?K0VFUVRaU3VPTWR4djdiSWJObkloY0VYUmt4ODBHNkxiNzVOTlh2allXaHJ3?=
 =?utf-8?B?MC9CNXAyQlU2dy9kZVBNaTNDY3RMakV5TzlVdFJPVDQ3dkpVeVRGMUptcUxm?=
 =?utf-8?B?TnVqSFpOUVNReVk0bENlNkc0MnFxVTlBdFRyRlI5OThnZjh5WVJVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5403FEAE4AFCB4B9D659324409F96E5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	MX5X7DAgQGkDOj9nF9lLJ2yVDjqdwWUrPCpRX76FUcGcfdTOhPeg4lC042K0LD/YqQXhmW5MOXhkiG6c2uSIZv/YKuUIvTD3pfh3yVnbmQUWkHwrzyAZYu8a+oliJwEHE2KZG2hRpWdZN6kfPKiwVdUvpPjOflE0A4rXKtjadsseVHOi4vnazi7gyPb0E5lREvmJB0d4K7A5gld/Gx5IAqavabCG3U3lweCFspNqM3AfOHN9Xf57oYb2pEMRguR2nME6xyeH7/yIs86Op3nhEbDgK03mSiRp2ywunXf5g6pMIROOJ6iZrMcTukBNPJu87ydySLwWHUJ7q6cDI5ZYvg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S/rhsIHU3eDlS8Ixbw7qwLAuY3RsPKU+kLjRoxv8X/T31jAPkiS2+Tx1lksJqoCk5472bImVwB7r1rsFvgEmnXBEHRU7WN7A5bcy/9E1oxy0sibWzbDc1cDNBuZ/sfGF6yVpmDwGiGVpULbldhgTb3xiICIa3U2e1g1I48G/RfJCmxkVfQH4KibiyDVB/+gG8b0+RdBWqK9EKGjhvarj7QLPDDqCHSs8LHwKeO254Sdt0RSQtLDsZIYSFK6lEVVEqhOWUXk0mgyIOP24bhe8Ordk1QMW+zc8vzgLFtpj0MASj/1+UVbh6eSuxuPvvb0oNf4Bcqn14Vo0YIFjkXpUs+HqUEBJpg/fr0parOGOP9tyaz3U4e0AqOYLwch/Nots1bRbj5YJqaJ2m8TqzPB26cEeQVodn4NIEWLh20oa3mfnc0eC9O3NZ1GwUFBaUdp/TLiywLvZ34ifj3VP8eeA5eO8F7cE9maSVC/skEDCv0uHYLlgExagVFmzPZD6FwFxawVSB0DdxXiklIhROQloXKCKcPL3emN59F+NXogdqHtRklf4v0Zmyv+Cqqyv23yR9kW36LKaC9H8ohYDelQqNytJGDOBPfBp3DWqiN+MInKGttBrB/FCGZdxj/UXS2lvAoYDwKyq+5S3Wlm7XH1ujw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61c1954-44bf-4dd9-e4fb-08dee8448c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 22:57:04.1315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6pY3gW4REgfAn1Yt1pC6QCP5Vs64lOcD4eE6MfpRMv6hIypsIWkEepI5yg/TnAtpQAFzRyCAuGnLgZH9mASLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
X-Authority-Analysis: v=2.4 cv=Ys4/gYYX c=1 sm=1 tr=0 ts=6a614aca cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=feBMtWVfIkc1CacfwL8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIyNiBTYWx0ZWRfX7FuBxSSaMg70
 MC8t94Z921hB9b8Be2RycroOAqZp224ud7kavPrn4IG9AxAWUZxM6YTYLDR/6P63QsPL7J8FteQ
 hcjo2BMzZINsNae5KpQ4ssRIyQtFg8J5SGwQ+rfigYOfg6xBhpPtsC+SgNS70F05QPSKIg8zTQF
 1CtXKzHZcmDSV9JYrzNoq+GTJg9PZrrzZaCtcEqZG1QqR8Jf4nyNytHQaWADwcN0f/3wohwOHJy
 +SsFlnMndjtqQHlt8A5pjaFtXWlpotfIdEEZKm2UZDHVBgfrFbxDdINlZ0qpkD5YSsAvl3nfWDE
 5ws2f9sNDNxIPtgD6LDLi6qIeZ2WYd+23AQtchqQR3odrrgdFzQMd7dTWB0iH3CnQOwmtBldKww
 jyrAs/BfsjM7GQh+6kh/+04+vikVinqvyt1T7OoQYWQVdUcpV1Qk8oNAYvr5eAFj3wU3EupRFB9
 T35GeklAIjYpOAkN+dQ==
X-Proofpoint-GUID: -lzk69UYfw3oKnuD1lBGcXPqtkskf71b
X-Proofpoint-ORIG-GUID: -lzk69UYfw3oKnuD1lBGcXPqtkskf71b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIyNiBTYWx0ZWRfX431HzT/fFrbt
 lsQePqlaNyR7XCY8OCPFrhrDBfgv8uJWrDvyYfpjrZXjx+S/05j9eqfDfvQXVUNEOylbBeySo4A
 i5Yoft+e+EE/hMlrBYMR/X8BeRTw4K0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607220226

T24gV2VkLCBKdWwgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IEN1cnJlbnRs
eSwgdGhlIG9ubHkgd2F5IGZvciB0aGUgVVNCIGNvcmUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhl
IGxpbmsNCj4gaXMgbmF0aXZlIG9yIHR1bm5lbGVkIGlzIHZpYSBhbiBJbnRlbCB2ZW5kb3Itc3Bl
Y2lmaWMgRXh0ZW5kZWQNCj4gQ2FwYWJpbGl0eS4NCj4gDQo+IFRoZSBYSENJIHNwZWNpZmljYXRp
b24gdjEuMiBhbmQgbmV3ZXIgZXhwb3NlIGEgY29tbW9uIGV4dF9jYXAsDQo+IGluZGljYXRpbmcg
d2hldGhlciBCSVQoMikgb2YgUE9SVFNDIGNhbiBiZSBpbnRlcnByZXRlZCBhcyB0aGUgdHVubmVs
aW5nDQo+IHN0YXR1cy4NCj4gDQo+IE1ha2UgdXNlIG9mIHRoYXQgYW5kIGZhbGwgYmFjayB0byB0
aGUgZXhpc3RpbmcgSW50ZWwtc3BlY2lmaWMgcGF0aCBpZg0KPiB0aGUgZXh0X2NhcCBpcyBhYnNl
bnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLWV4dC1jYXBz
LmggfCAgMyArKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyAgICAgIHwgMTkgKysr
KysrKysrKysrKysrKy0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBvcnQuaCAgICAgfCAg
MyArKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNhcHMuaCBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1leHQtY2Fwcy5oDQo+IGluZGV4IDIyZTUzYTc1MGUyYS4u
YWY3ZDYyNGNkMzhlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNh
cHMuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNhcHMuaA0KPiBAQCAtNjYs
NiArNjYsOSBAQA0KPiAgI2RlZmluZSBYSENJX0hMQyAgICAgICAgICAgICAgICgxIDw8IDE5KQ0K
PiAgI2RlZmluZSBYSENJX0JMQyAgICAgICAgICAgICAgICgxIDw8IDIwKQ0KPiAgDQo+ICsvKiBV
U0IzIHR1bm5lbGluZyBzdXBwb3J0IGNhcGFiaWxpdHkgLSBzZWN0aW9uIDcuMTEgKi8NCj4gKyNk
ZWZpbmUgWEhDSV9VU0IzX1RVTk5FTElOR19TVVBQT1JURUQJQklUKDE2KQ0KPiArDQo+ICAvKiBJ
bnRlbCBTUFIgc2hhZG93IGNhcGFiaWxpdHkgKi8NCj4gICNkZWZpbmUgWEhDSV9JTlRFTF9TUFJf
RVNTX1BPUlRfT0ZGU0VUICAweDhhYzQJLyogU3VwZXJTcGVlZCBwb3J0IGNvbnRyb2wgKi8NCj4g
ICNkZWZpbmUgWEhDSV9JTlRFTF9TUFJfVFVORU4JQklUKDQpCQkvKiBUdW5uZWwgbW9kZSBlbmFi
bGVkICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMgYi9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMNCj4gaW5kZXggYjAyNjRiZDg1NzdhLi40MDJlOThhYjk1
ZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPiArKysgYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMNCj4gQEAgLTc2NiwxNyArNzY2LDMwIEBAIHN0YXRp
YyBpbnQgeGhjaV9leGl0X3Rlc3RfbW9kZShzdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpDQo+ICBlbnVt
IHVzYl9saW5rX3R1bm5lbF9tb2RlIHhoY2lfcG9ydF9pc190dW5uZWxlZChzdHJ1Y3QgeGhjaV9o
Y2QgKnhoY2ksDQo+ICAJCQkJCQlzdHJ1Y3QgeGhjaV9wb3J0ICpwb3J0KQ0KPiAgew0KPiArCXZv
aWQgX19pb21lbSAqYmFzZSA9ICZ4aGNpLT5jYXBfcmVncy0+aGNfY2FwYmFzZTsNCj4gIAlzdHJ1
Y3QgdXNiX2hjZCAqaGNkOw0KPiAtCXZvaWQgX19pb21lbSAqYmFzZTsNCj4gIAl1MzIgb2Zmc2V0
Ow0KPiArCXUzMiB2YWw7DQoNCkNvbnRpbnVlIGZyb20gdGhlIHJlc3BvbnNlIG9uIFtQQVRDSCB2
MiAzLzRdLCBiYXNlIG9uIHRoZSBwcmlvcml0eSB0bw0KZGV0ZXJtaW5lIHRoZSB0dW5uZWxfbW9k
ZToNCg0KRmlyc3Qgd2Ugc2hvdWxkIGNoZWNrIGlmIHR1bm5lbF9tb2RlX292ZXJyaWRlIGlzIHNl
dDoNCg0KCWlmICh4aGNpLT50dW5uZWxfbW9kZV9vdmVycmlkZSAmJiB4aGNpLT50dW5uZWxfbW9k
ZSkgew0KCQllbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIG1vZGU7DQoNCgkJbW9kZSA9IHhoY2kt
PnR1bm5lbF9tb2RlKHhoY2lfdG9faGNkKHhoY2kpLCBwb3J0LT5oY2RfcG9ydG51bSk7DQoJCWlm
IChtb2RlICE9IFVTQl9MSU5LX1VOS05PV04pDQoJCQlyZXR1cm4gbW9kZTsNCgl9DQoNCj4gIA0K
PiAtCS8qIERvbid0IHRyeSBhbmQgcHJvYmUgdGhpcyBjYXBhYmlsaXR5IGZvciBub24tSW50ZWwg
aG9zdHMgKi8NCj4gKwkvKiBQcmVmZXIgdGhlIFhIQ0kgdjEuMiBleHRfY2FwIGlmIGFkdmVydGlz
ZWQgKi8NCj4gKwlvZmZzZXQgPSB4aGNpX2ZpbmRfbmV4dF9leHRfY2FwKGJhc2UsIDAsIFhIQ0lf
RVhUX0NBUFNfVVNCM19UVU5ORUxJTkcpOw0KPiArCWlmIChvZmZzZXQpIHsNCj4gKwkJaWYgKCEo
cmVhZGwoYmFzZSArIG9mZnNldCkgJiBYSENJX1VTQjNfVFVOTkVMSU5HX1NVUFBPUlRFRCkpDQo+
ICsJCQlyZXR1cm4gVVNCX0xJTktfTkFUSVZFOw0KDQpTZWNvbmQsIGRvbid0IHJldHVybiBlYXJs
eSBoZXJlLiBDaGVjayBpZiBYSENJX0VYVF9DQVBTX1VTQjNfVFVOTkVMSU5HDQpwcmVzZW50IGFu
ZCBzdXBwb3J0ZWQ6DQoNCglpZiAob2Zmc2V0ICYmIChyZWFkbChiYXNlICsgb2Zmc2V0KSAmIFhI
Q0lfVVNCM19UVU5ORUxJTkdfU1VQUE9SVEVEKSkgew0KDQo+ICsNCj4gKwkJdmFsID0geGhjaV9w
b3J0c2NfcmVhZGwocG9ydCk7DQo+ICsJCWlmICh2YWwgJiBQT1JUX1RNKQ0KPiArCQkJcmV0dXJu
IFVTQl9MSU5LX1RVTk5FTEVEOw0KPiArDQo+ICsJCXJldHVybiBVU0JfTElOS19OQVRJVkU7DQo+
ICsJfQ0KPiArDQoNClRoaXJkLCBjaGVjayBmb3IgSW50ZWwgUENJIGFuZCBrZWVwIGl0IGFzIGlz
IGhlcmU6DQoNCj4gKwkvKiBGYWxsIGJhY2sgdG8gdGhlIGxlZ2FjeSBJbnRlbC1zcGVjaWZpYyBl
eHRfY2FwICovDQo+ICAJaGNkID0geGhjaV90b19oY2QoeGhjaSk7DQo+ICAJaWYgKCFkZXZfaXNf
cGNpKGhjZC0+c2VsZi5jb250cm9sbGVyKSB8fA0KPiAgCSAgICB0b19wY2lfZGV2KGhjZC0+c2Vs
Zi5jb250cm9sbGVyKS0+dmVuZG9yICE9IFBDSV9WRU5ET1JfSURfSU5URUwpDQo+ICAJCXJldHVy
biBVU0JfTElOS19VTktOT1dOOw0KPiAgDQo+IC0JYmFzZSA9ICZ4aGNpLT5jYXBfcmVncy0+aGNf
Y2FwYmFzZTsNCj4gIAlvZmZzZXQgPSB4aGNpX2ZpbmRfbmV4dF9leHRfY2FwKGJhc2UsIDAsIFhI
Q0lfRVhUX0NBUFNfSU5URUxfU1BSX1NIQURPVyk7DQo+ICANCj4gIAlpZiAob2Zmc2V0ICYmIG9m
ZnNldCA8PSBYSENJX0lOVEVMX1NQUl9FU1NfUE9SVF9PRkZTRVQpIHsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wb3J0LmggYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcG9y
dC5oDQo+IGluZGV4IDg4OWI1ZmIwZmNkOC4uMjE1YzljYWRiYzM0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcG9ydC5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhj
aS1wb3J0LmgNCj4gQEAgLTUsNyArNSw4IEBADQo+ICAjZGVmaW5lIFBPUlRfQ09OTkVDVAkoMSA8
PCAwKQ0KPiAgLyogdHJ1ZTogcG9ydCBlbmFibGVkICovDQo+ICAjZGVmaW5lIFBPUlRfUEUJCSgx
IDw8IDEpDQo+IC0vKiBiaXQgMiByZXNlcnZlZCBhbmQgemVyb2VkICovDQo+ICsvKiB0cnVlOiBw
b3J0IGlzIHR1bm5lbGluZyB0cmFmZmljIG92ZXIgVVNCNCAqLw0KPiArI2RlZmluZSBQT1JUX1RN
CQkoMSA8PCAyKQ0KPiAgLyogdHJ1ZTogcG9ydCBoYXMgYW4gb3Zlci1jdXJyZW50IGNvbmRpdGlv
biAqLw0KPiAgI2RlZmluZSBQT1JUX09DCQkoMSA8PCAzKQ0KPiAgLyogdHJ1ZTogcG9ydCByZXNl
dCBzaWduYWxpbmcgYXNzZXJ0ZWQgKi8NCj4gDQo+IC0tIA0KPiAyLjU1LjANCj4gDQoNClRoYW5r
cywNClRoaW5o
