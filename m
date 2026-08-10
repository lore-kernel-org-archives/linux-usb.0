Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40673AB48F;
	Mon, 10 Aug 2026 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401332; cv=fail; b=Prc1EmZ7uPY9E5q2ENwjXVaJuS1NBf6tZraba2wFgjkxYBbDXfx595GIpHeb25OTCqvsA3i0m2MPbwBuKx03dPT9BTAnb1aWGi75nJ5TtvfEe7iIBqego8Xgt+woWI5lUCt5yqZ75689SAb5tbOIj3HM05MFyxROmDiWfNk7y74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401332; c=relaxed/simple;
	bh=Gn/lsGyp3kQ8NbLn84d19vQjVKQ/3V5C/SANLlh4pdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sO0fBwC5mJ3ehj3MXs3EirEr8PtuCIyUOPIuCWYwRnLspKUPyCg1vuN/qS2C42pSTPRhAdTcGH10yJVxjpDCa8sYdQQtYdKtI0LSpniZqW+s+IRB7sb8Sr2viiS1XNRonLYSgMp/Ss1iLdE7A01XJfxnChr7AhmzA/UHjz+2ivc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=krKjaxAE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YyYn96ZX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BHNI+N7C reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="krKjaxAE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YyYn96ZX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BHNI+N7C"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AKJ7ja925704;
	Mon, 10 Aug 2026 15:35:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Gn/lsGyp3kQ8NbLn84d19vQjVKQ/3V5C/SANLlh4pdc=; b=
	krKjaxAEZwpcKFmm0ZYYf3y8B27KWBb2r+xjySt7ihMRTe7y2CEZ3+kBLVq4Rghb
	9yFEfGHbDCxZlieblnKIbbvVa6ZNz0xhq0w09jCv9mixHe6B0ujIsIG6AG8QSbeb
	36Td1nEVg+7ksOGH4fI9niG+5+cHfWKCcSEEJzGYb4mFYKtgN6N6O6y0Ba2bhh7T
	FrfrbnNVVq5xo44uwMmu4mVJVeOxCVHJWzJoORAA3iT12V3F5wFBfUIvQQJdZJj7
	O5HsoNryqL2l51R4EIhKNA07DG1jyuDXlW0OCDqXJNbncb1/Gk288LFi6Wi47FsW
	rTmOWjqAr8Jjb/wfW0mV6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fyjqb2puj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1786401321; bh=Gn/lsGyp3kQ8NbLn84d19vQjVKQ/3V5C/SANLlh4pdc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YyYn96ZXIuzX3zUzojFYjtfJyQKjetSkeAC9I+MhUSHFK/m+BHhQLNJVGEp8pdjAI
	 YOo2ZSpFtn95V3hMcR+tPttBqGwI4AgrnOelOlY41eZACxZbll+qQ5JIaREoxvi8dK
	 rK17sl/tBeSrIbXQGo2EuRIn1soKVNm4mUrUvcHC3uwXqq/n3+J7BQnc54hLkK63BD
	 D2Hlr7VuYmr4reeNGgMSwPTEJkMuQA+qJ1oeqDYVfMTkDKOBos09MUIJ/v7UST8wFT
	 vnNdoPho/FtYJdESS5FGGjw7uWY4W23LdVE9OBVGnd9y/MkkQtGNAJWl/+GyQF0ZmJ
	 UXPK3gC3Hgu2Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4926C4048B;
	Mon, 10 Aug 2026 22:35:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 020A7A006F;
	Mon, 10 Aug 2026 22:35:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BHNI+N7C;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E0B640580;
	Mon, 10 Aug 2026 22:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRPc6T8sYyFNOG+TFEVjve4lyYtu6lQstlcYS/Fcm2Tvafgt6Nt7nzxc+wwWt1rZBbXTObdtPYBzoHlQsA1Vo0oDIrwSHP4VVh/58RDGUlZwuoVhRRgxcYhbsEYi21HRTmjb5a5SIZfU1v1o3AJy1+V71vLofJKLhFnjDyuNtpYZZwvab7bzmPbbUh7aNr4x3oK3vPkNcaOqJqfWAX6BgwLT6rnlrAzSNVHE5WlaenlkJnMIOBhkQ5Q7H0JsqFHqXKcljKV01TDTDSEHU+/u33TZGVskMYE4l1GPoTYQtEzchv6lvLdR7BBSfdysCgyrnV92/K780oGF4C/yFToskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn/lsGyp3kQ8NbLn84d19vQjVKQ/3V5C/SANLlh4pdc=;
 b=Wg1I9ql3L6z+a4xCrawqJkPDPanmFCCA+sccZXqr5O/XHyUh2QU+wkka6ygsr7fZTxcay5U2pR4dD+B7lFmJtseNwk99GN9iAkAZwcDNeXciA3de+WhTeqGYMh06aPOo+wd/C9oI3k5/owoIwyyrFwnfh7Kp6gpYzQYe/njXOhs0/CEKjvOWrou1Xbi1h/Xde3O8KaHhDxlaqotGF5slfdpbJLUobwhcB7IXkBNaXlP8eZ9tu0vQs0GZdov1in2mAYSwVxXabWcHMqCkp4dfAWC/yTTmok418XZGGc5o+SzvpM2hc5IMLf+W6ONQg78F/dW8dOInbr/dQYjGBNvN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn/lsGyp3kQ8NbLn84d19vQjVKQ/3V5C/SANLlh4pdc=;
 b=BHNI+N7CcEmvz8vALGY1V9VuTP9SdolCzn8/hLE0MJhXErorocdRcknEn/ikUmR2Dti99jj9qEmN7bXIi/VESDXHW+VIEKN8BLLfv7heyFbxwNTQEzi7HNNAeLlrAHdGv0OSqzeRMUzBLzTKxMzD8u/rKhtOtkWS1/BtnX5Ckx4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 22:35:15 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 22:35:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] Add version check for setting ForceRM
Thread-Topic: [PATCH 0/1] Add version check for setting ForceRM
Thread-Index: AQHdJf0B0bmOV+flT0CvRD45cw315LaRuPQAgAYNBQCAAB8SAA==
Date: Mon, 10 Aug 2026 22:35:15 +0000
Message-ID: <anpRMnKIRwll8g14@vbox>
References: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
 <anUevdJ3ZNaYyB61@vbox>
 <3ae42f16-ead2-4811-9b5e-da42bf81d477@oss.qualcomm.com>
In-Reply-To: <3ae42f16-ead2-4811-9b5e-da42bf81d477@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB7161:EE_
x-ms-office365-filtering-correlation-id: 98ed8282-7157-4960-78fd-08def72fa616
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info:
 fTwsBviy97uziONEsaDRhpecIje9QAfOdiVJ7bsNgOA+DiJaXJrz1amJdI1FTTuoa9JskyQXMjDPrRA6k7LVVy4nz3jO+orao0NuQBTdzNcXFo0iM1fdT9qCVN3+whS0yzRJKMLcFRlX7l920fvX3JKQznM6gJOQpy/VsyJYFOqvGzWb5YfgJ342OScWfgCvhdn5Vpqo5qAjWsBAFy4MXoSIfFHFaRtwm11Ak52n56FIKWoQGbNTSeAgXexOyuDrR9Ys178oSLE9HSP5exKd4vJuebGEfoj36GX0GDpB4eF6S4bNcq3YH4iaUQ3BQtkVKJ9qVc3G1m+CuQocpNUF9W7+7V9IfSmXSCO5pGagc5C29l/VD9hK0G6FvtnY+efnQyxtNv5Iwgll7+Wp5VS9T5BuO+JOSM9ZRcKHH8EujP+bIjwwRbJzBTdNqacdHiTHix0FaVr0SFFmI9cv02SEjughcT0q3gGDiGvOupFAP/VcOj0ux13zeN/nWtGsCqqtelKihHT74Ac8svHsNsu1t9SykRvP+CK28dzDPcwzl+VRxL472J+XEQhW2+QRP9wnqglWhfcuE51CJrpT8Zljqwnhfe+5Mb4EHr1eqjEMMXjlbQAR0+p1EzinckUhyDLFSoBIDYcVX5iwvyCgGKCaFdz/HgjxYUqb1jTzmubUWyeU6rdAROCsSwug82UOfJQ6dGqc9qA2Z8DN9AEv99lQVhsohiSu/K8btEcPQy/V5HM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVIwZ2NoNml4bUJnemY1bDZ1MFg0TlRzUU1WSVBqTnJFVlYwVVJOS21ua3RP?=
 =?utf-8?B?TWlUeGQ0emdMZWxRT2FieFJVNXRIOUFiWTJ2LzBmcXhtWnVYSFVLSDJlb0pH?=
 =?utf-8?B?eWhyc1RYVzU5R2UxdkI1SzBNTEI3d1JEdDJERzUycEpKOXg4S0RuRHUyN29O?=
 =?utf-8?B?aTFFQ21uNnN0TytYeHJxWnA2OFRVeWlWRjB2Z0o0bE1UbjN5aFdFTFdsTVpR?=
 =?utf-8?B?WVlMcE9WUHcrbXZyTzRLcWxLN0FVemhheHNYZ3JmYmcrS21WZnZxNmRwOW9S?=
 =?utf-8?B?ak5tTkhOeGlzZ0hVRnVCQlhtODRqRWpFTlpxNFloMkxUQ01OYlBmTXdwWjlU?=
 =?utf-8?B?ejRVdXRsSzk0dTlKSnRzMG1PRmhVTnRZdEtISkkxd1Q5WlFtK1VVbkkxNTdJ?=
 =?utf-8?B?MFJUMmtiME0wTWdXdjF5SkY4d1FGUTJnMnJ1dXNUN1E3bml3dkxhVUdsd2RQ?=
 =?utf-8?B?am9qaU8zd1ZWNnVmZzJhdmVBRkdpN21TZlE2ZGxhNjBISnhDSEFjbnZUYkk2?=
 =?utf-8?B?RDFCNTVQWjJReEpOVEJtenNldlB0bnJ4bWMvM3RlTkU5aS8rR1ZaWERkK1pm?=
 =?utf-8?B?STdiRVRKMGExM2UzTE5weEdWR051ZXdGSjh3YytuYWVEUDdkMitpR1VldU40?=
 =?utf-8?B?RGc5bzlJSWsxc1JVdHcrOVI1Znc5STFXZlZNckxwRGxrYkxKK3dsNG0vTDdD?=
 =?utf-8?B?YTdlSVp6c1MyZUoyL1k5SDVacDlpNUE4K2lhdElvRzJyTCtxT2dLVXk5WFlH?=
 =?utf-8?B?YlJmNHBSSWJCT3dhNVFQOWlYdXJwM05ZemI2VHh0SFVmeWVEa1Q1U054K2Y4?=
 =?utf-8?B?OWQrMkhxTENySmZraUZ4S2FBTm9ydTJ1blY3TjV5eUdGeGxza2FlU0xLR2Fi?=
 =?utf-8?B?UXdTNVArTThEUXZEVDM1T3FCR1hMbHh2MGViYXp0MXVUS0Yxb0UvRmRxbkMy?=
 =?utf-8?B?b0RnNEJuWVdRMm5ETDl2UkFkUWpRQU9iSVlVQVZybzBTemdDV2hxNlVScGhN?=
 =?utf-8?B?ZllRRklVUWRkOFBHVmw0UGtpcGRmcTM1dGRkR1BVY1RkWWhnU1RKeWFRTFI5?=
 =?utf-8?B?QnBqSzZ1bkx5UmJ6SUt4SVhUS245cGlmQVJDTzVTaUlsKzZqT285VDBqands?=
 =?utf-8?B?UE1QaHdSS3RpdnF1R3JMcitLRXFSU0pxRWdVZTlHMVNqUEtYUEsrRmFWaE1v?=
 =?utf-8?B?bHg4V082dDBEZVovWTZQcTYvME41RTBCaWNOeExZV2s0T0JmaUdML09ER2Rv?=
 =?utf-8?B?cFppZ1psMVdjVitmbTVjL0o5SnhacmQ1RW83bFZkTGNOSUdZNFZnMzNXYzd3?=
 =?utf-8?B?LzhZRDVMNXp5dlM1cDVNa2dmOGdqajJBa0V1NW56V2xsWlN2d1VpNFhhMHNJ?=
 =?utf-8?B?aU5DOGFVNkFKMEQyVFQ4RWdVa3NHaGUyeXZRbU9ZaytsS1BhcmZFSlhUWkZu?=
 =?utf-8?B?TCtWSFFFME9FT2szYklCNkt2U0JHMU9iYkViQzdZZ0pNcHdHK0Jic0d2d21N?=
 =?utf-8?B?L2daeVJsL3FkWndCRzVjOGV5b25MRjI3RFVvRGhIWkkxTHA2WkViWEVDSmxn?=
 =?utf-8?B?eHBnM1pUTnZhRGZiaklrb0FUc3VMQVVpM0IvRk1UdmJzRmZtM1M1c3ZqUVla?=
 =?utf-8?B?UFJoNmFJTGdtUi9Ed2tZYUhTNnlZQjgzdDV6cWQ5UmpFUzQxQ2I1YWs4ei9Y?=
 =?utf-8?B?WXlxdXd6N1VwcTQ5YmxpYkhvY0Q5OWZaNHY3VEdSbkNyMlNWNTZqdlUvRzFR?=
 =?utf-8?B?cGN2a0J3bmYyeUNVQTYvTFhvYU5mdzhjeGU1VHVCM3ZTWk9qRkUySlpLcjR6?=
 =?utf-8?B?OVBQZUJRQnVMOFdhUlZIbG9lYmF0OVhpZytLRjV4dlgvY2RicmMxWDdCVHpT?=
 =?utf-8?B?aFN2d1VQVUVHNVRkZjZ6a1FySDliOWxCLzh5MHZZcW95TWtveHFlVHhOUm5O?=
 =?utf-8?B?dll0Wk1Sa3RBK1FJNm80R1ZuaWFPWlFpdTZGUWVvSElYeFl2bm1TcHhrc01z?=
 =?utf-8?B?Z1dJdTlJN09BdHF5SklGbXdaRGlDSVhJcit4ZTgxVWx3Qmg3YU9oNGU2K0p5?=
 =?utf-8?B?ZkRiM0ZUMUlrdFFUdVFpQWQ1MnR4UURzR1BkUThPTVpidlp3RW1maVlqNWM5?=
 =?utf-8?B?NDBLOTd3dTZDZVRtV1loVlprZ2U3MzMveGpNek5pSGNOcE84N2FuN3dGYldz?=
 =?utf-8?B?am9MNmVGcUZVbGpUNi9HWW5scWcxajhwR2dmNjJoS1JhaG5DNnorWDAvRTdt?=
 =?utf-8?B?Y0gwUUkyQnYvS0Z0RjZQVjBYNisrbVBGeGdlRGZtNXNoTm02Q0w4bHNEd2l1?=
 =?utf-8?B?RHNSS2xIM0I4d1RYTHJWS2NtRDZZN0F0OUFzUnpTRFhMNEFJQ0dOUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94740179BC56EC4995C8CDB2C218C733@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	eL27KQdowMnUS3udW83p08WUGvitenfmvBlRO6Xr4jfO1r1slty+9mQ774GZ5fOeuPifvm9YS36Ehk30I4RD3lgpJJ6QQWXuM7dmEd/cnTLsiPY0pOK/tb7w79XEpK+YZ370H3RGWfubu3Lj78DgerljRHw/SHK6epWQJz4vvCy2aoHF6Zz0wBPJWv1Kc3N2381hZxMP/Y1abWDmQpHkBva63ML2EA6RJGfQKcOQnUbuoyH0ihVt7V1cmYbmSHsy1cxs4rJ9UJIJuWnP7orm2u4xlAtKq5wrHGjC1MQJao+lq9JkFbm+9CCYYLP+gOdVAjc+WsjFyzObavARO7/wmA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jXc5zM+gLGxbJVSz4fvvyHjdu9pXVjeejcR4n4Gei/pVwMkRLht6v3iz+fFnmaRvxHBoCA2sh8cp2chKXq1xRrPcmfgmQTHIE5RPzQNXJ3SkVp8JTfM1FMqRxF6KwVo7sWlm6Hb6ybE+0vZobURqRLcYQYcX0QOqJuli6vss1YkGgsFNQscCZuwuIWGBmLQxOxHYUS4vvAFJXSVQXYoX/YtVTgMx0vfFW4ICLEBgUca3n06iy+/ZvYVTl3HV7OKyCd8BY4QKZ3/xFSxvf0kp7c2lmBjD58Vb2dZGxAsE028f2/nXEnt6dOOS7mvYEdQ4Sg1zuGkbr7MwkQfjvgw0at3O8ptSnobsvVNPtHuyb1FWrJ5hhKAIg//IM3/fV9dCD70T/ZQkbUsQaJ6fpQFyBO7W8qPvsR9oHPYZpSwdz8H/DNaM3iunFmLk/2km3ArinTNWAij12oBwXFUxtiPtIz7asgpmlScgT8d/erpXsBIYWLwcgd5E7M5YON6YJT6Sw7Csqsqyc0LtpBpntzW01sp8p/TTNHLwnj6Rj1cTrkAxfcGv6Tj6+T/f2YItuDpZdW0JcOfl85WOjBHzOy7nb1wD1NDFrd2fhynlk5m+FUGJkiLvWyZGkkymkt5Zbdds9E2SAKdE4KM6hdJDW8EFrw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ed8282-7157-4960-78fd-08def72fa616
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 22:35:15.4883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8fKOEfHLT6H/Vz0+n2RSMlGdB1Rqoo+0ToEziD0uxhErQf3qSTwUQlrlHE09MeG0XJLV/kzQZodkA5lwF8nag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
X-Proofpoint-ORIG-GUID: j76L7Kem0Qy7jrasKi54RaM5BsVlf0Y4
X-Proofpoint-GUID: j76L7Kem0Qy7jrasKi54RaM5BsVlf0Y4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE5MSBTYWx0ZWRfX3zj3tNVDIWWg
 c0Cn7KkUOzW7Ldei56VBmfxIySg2dHvuW3S1jnK6cLXoStbYh7dnckr1giwrt9RzYeQbPFi4zLG
 /CCHI3qga2o10kXf3cPAw9+oemyBbz4=
X-Authority-Analysis: v=2.4 cv=TI11jVla c=1 sm=1 tr=0 ts=6a7a5229 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=D3UA5E_8vJUXLSxjEh0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE5MSBTYWx0ZWRfX9Rj9eXAZkucV
 9UnXVGHR+JKdd7jhz8u/+9QqAfmKadjDKW8z3trl+EKskxqJCkbZnYgjUmd5+ap30cFEuOrcuEw
 W6RJlfdvPe0HoFnx2Cj4xtjSOxtcsQvhtMElcS1Aw+eCnvUfbsupGR6codgVNrKAUlT17XajCvc
 VxNsSmAg6InQZ39Ejw+PJ2O9IYiwagUp2mR2cQooJwHGGWzr77LQhpijvv+LxdRIGZmyoE8NZIE
 J9YPt1EQ4E32exUcIsxnfsAHHXuIvFCHBg2QXY86hGYtK7Bko+b/LWsC3H0O5nLqCorkIzPieRu
 5Wig/XALQ40Qsameikh8Pt32hXYij0+OPddyi4F8+AahVdn3s9fTHNgZJwe34NIBymUFOZ6kvFV
 gvwzoO00CUS3UPS11zcMQVd6HMHPyenMNv29mXdJQrk3yWuNYlKgJUp9gnJRQqbcUo369TdAzum
 GYs6+7ZFLjVFb/+T2fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608100191

T24gTW9uLCBBdWcgMTAsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiA4
LzYvMjAyNiA1OjE5IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBdWcgMDYs
IDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gPj4gSGkgVGhpbmgsDQo+ID4+IMKgDQo+ID4+
IFdlIGFyZSBvYnNlcnZpbmcgYW4gaXNzdWUgb24gRFdDX3VzYjMxIHYyLjAwYSBhbmQgdjIuMTBh
IGNvbnRyb2xsZXJzIHdoZXJlDQo+ID4+IGEgdHJhbnNmZXIgYWJvcnRlZCB0aHJvdWdoIHRoZSBl
cF9kZXF1ZXVlKCkgcGF0aCBjb250aW51ZXMgdG8gZ2VuZXJhdGUNCj4gPj4gd3JpdGVzIGV2ZW4g
YWZ0ZXIgRW5kVHJhbnNmZXIgaGFzIGNvbXBsZXRlZC4gSW4gb3VyIHRlc3RpbmcsIHRoZSBpc3N1
ZSB3YXMNCj4gDQo+IFsuLi5dDQo+ID4+IFRoYW5rcywNCj4gPj4gRWxzb24NCj4gPj4NCj4gPj4g
RWxzb24gU2VycmFvICgxKToNCj4gPj4gICB1c2I6IGR3YzM6IGdhZGdldDogYWRkIHZlcnNpb24g
Y2hlY2sgZm9yIHNldHRpbmcgRm9yY2VSTQ0KPiA+Pg0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyB8IDcgKysrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQ0KPiA+Pg0KPiA+PiAtLSANCj4gPj4gMi4zNC4xDQo+ID4+DQo+ID4gDQo+ID4gSGkgRWxzb24s
DQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4gDQo+ID4gVGhpcyBuZXcgcmVj
b21tZW5kYXRpb24gYXBwbGllcyB0byBhbGwgMy4yIGNvbnRyb2xsZXJzIGFsc28uDQo+ID4gDQo+
ID4gSSBkb24ndCByZWNhbGwgZm9yY2VSTT0wIGNhdXNpbmcgYW55IGlzc3VlIHRvIHByZXZpb3Vz
IHZlcnNpb25zLg0KPiA+IA0KPiA+IEkgd291bGQgc3VnZ2VzdCBhcHBseWluZyB0aGlzIGNoYW5n
ZSBhY3Jvc3MgYWxsIElQcyBhbmQgSVAgdmVyc2lvbnMgdG8NCj4gPiBrZWVwIGNvbnNpc3RlbnQg
YmVoYXZpb3Igd2hlbiBlbmRpbmcgdHJhbnNmZXJzIHNpbmNlIFRSQnMgYXJlIHVwZGF0ZWQgb24N
Cj4gPiBjb21wbGV0aW9uLiBTaW5jZSBvbGRlciBJUCBkYXRhYm9va3MgcmVjb21tZW5kZWQgc2V0
dGluZyBmb3JjZVJNPTEsIGNhbg0KPiA+IHlvdSBhbHNvIGFkZCBhIG5vdGUgaW4gdGhlIGNvZGUg
aW5kaWNhdGluZyBuZXdlciBwcm9ncmFtbWluZyBndWlkZWxpbmUNCj4gPiByZXZpc2lvbnMgbm93
IHJlY29tbWVuZCBmb3JjZVJNPTA/DQo+ID4gDQo+IA0KPiBIaSBUaGluaCwNCj4gDQo+IFRoYW5r
cyBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQo+IA0KPiBTaW5jZSBmb3JjZVJNIHNob3VsZCBub3cg
YWx3YXlzIGJlIDAsIGFuZCB0aGUgcmVzZXQgdmFsdWUgb2YgZm9yY2VSTSBpcw0KPiBhbHJlYWR5
IDAsIHRoZSAgZnVuY3Rpb24gcGFyYW1ldGVyIGZvcmNlPWZhbHNlIGVmZmVjdGl2ZWx5IGJlY29t
ZXMgYQ0KPiBuby1vcC4gV291bGQgeW91IHJlY29tbWVuZCB3ZSBkcm9wIHRoZSAnYm9vbCBmb3Jj
ZScgYXJndW1lbnQgZnJvbSBzdG9wDQo+IGFjdGl2ZSB0cmFuc2ZlcnMgQVBJIGVudGlyZWx5IChk
b2N1bWVudGluZyB0aGUgZm9yY2VSTSBiZWhhdmlvciBpbiBhDQo+IGNvbW1lbnQpPyANCj4gT3Ig
d291bGQgeW91IHByZWZlciB3ZSBrZWVwIHRoZSBwYXJhbWV0ZXIgYW5kIGp1c3QgaGF2ZSBhbGwg
Y2FsbGVycyBwYXNzDQo+ICdmYWxzZScgLCBzbyB0aGUgQVBJL2ZyYW1ld29yayBzdGF5cyBpbiBw
bGFjZSBpbiBjYXNlIGEgZnV0dXJlIElQL3ZlcnNpb24NCj4gbmVlZHMgaXQgYWdhaW4/DQo+IA0K
PiBMZXQgbWUga25vdyB3aGljaCBhcHByb2FjaCB5b3UnZCBwcmVmZXIgYW5kIEknbGwgc2VuZCBh
biB1cGRhdGVkIHBhdGNoLg0KPiANCg0KQ2FuIHlvdSBzZXBhcmF0ZSB0aGUgZnVuY3Rpb25hbCBj
aGFuZ2VzIGZyb20gdGhlIGNsZWFudXAgY2hhbmdlcz8gUGxlYXNlDQpzZW5kIG9uZSBwYXRjaCBm
b3IgdGhlIGZvcmNlUk09MCBhbmQgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgcmVtb3ZpbmcgdGhlDQpm
dW5jdGlvbiBwYXJhbWV0ZXIuDQoNClRoYW5rcywNClRoaW5o
