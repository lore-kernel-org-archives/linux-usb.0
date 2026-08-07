Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A22D2397;
	Fri,  7 Aug 2026 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786144385; cv=fail; b=Yrtsn5zm+wIE2JKTCRE2xGADUfmuaXmzBSxN5W6Oi81x5/GUm9IcdAD+iQI70yuF5bxr6SkmJW9NUzpp82mIJCmE7SoXqaWBYkmt7kPR7MAmOudO0OtQvB4oqZ5whO3F0wMOr2CpJvU9jaFodGosV19UaDZ3IKx1L+4ZeQwfSIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786144385; c=relaxed/simple;
	bh=vJc8UR2vAOvnqLnCWM0Q3YIYDiYobWwMoXM3pRl2tAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gZW5MPOs19T5/BnxG9BCbmhu44nuE/7FHqQDq1Z+Poeb+BN7xt2uUlzTqfNGymoxvCKe8XnDFV2vLHofZbprOoy7ggvFmKcdIDjo7+ulhmm6Nb1TLtlKM9EumQ0hGjO7G9KstWfjnO9ywBOnBjOEUbvrNrjkdREXIlXkDc1vzO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bC1pi1Ou; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZD6rzrJ9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k7uVR3FQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bC1pi1Ou";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZD6rzrJ9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k7uVR3FQ"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677LcZIE2333828;
	Fri, 7 Aug 2026 16:13:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vJc8UR2vAOvnqLnCWM0Q3YIYDiYobWwMoXM3pRl2tAo=; b=
	bC1pi1OukrI1zzjyGWG2tg2N94gWza8m/KHNNN7VPy2xFLXnrdm609BBcMrYzAsQ
	Xhdwys18o5u5NLFWC6+Jx4l/gAStiMSBTJaY9uXkyn/p2Uhc12YmkIZZDHCd7kWN
	izYJ7cYGpUVMJk2tfnEV9tiqrGr8PGHHQRxVSeozn/EcJecG72SFYern7DoXxNfE
	FMAXozw9+FmPS5bMaGbkVXJPSnICXm7PurD898ylLAqAm2lHwRNlytdRJMeUYxBP
	gOiJhAl4zDklnM5te4ual61ATHqzfg/VdeS2yOWgMp6APxzz0zwaZ2LNQupR0KB0
	Gw72i8uX5/eQVdO2f0anQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fvy9vm9cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1786144379; bh=vJc8UR2vAOvnqLnCWM0Q3YIYDiYobWwMoXM3pRl2tAo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZD6rzrJ9tiYvF16BnNbkThf9VHE+uq+2JFdQeuKKdAdHIncdBfka4DUTg1kQ3bOqA
	 697/mIew3h9pOl/JN1LPye0rovd7otboo9Pi6C4bj9koxPIxRpx0qOujf7u6cOqO3Y
	 YmHr0TJSp919OT56AVzit7hqqg4IuqwSmaodcJ6NcbpjWVJyi0ck+SgVIUpYIQVUl2
	 kTx0T1grmVWs6mQkfRmcOJWpAsn80tWtU2iy9x8yYM/Eo+ODgvywVJxgZU2gLcpzLw
	 xyhr7spkeOirNvRXZW+PVjSodeILRETEwP1PhMXwKpaUgHwt618AjCfEycdFIDA+cg
	 CKltDhFB47gwQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14AF24064B;
	Fri,  7 Aug 2026 23:12:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A0186A0070;
	Fri,  7 Aug 2026 23:12:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=k7uVR3FQ;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00100.outbound.protection.outlook.com [40.93.1.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 97389405DB;
	Fri,  7 Aug 2026 23:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQomyjO4xCVB7uNXzXcZVBFNdk5pjsr5VZqE3CbI5qNWoRDiCWULsR8tdC4YRcExpDLB/PFnbgaavOF0uljUG+kY4nXGUmJPrJJ5WxPmt271Mrvz+KNlRNOVMNPqS6Pk/6FcHE4CUyTyYX8OXP8pcQEyxBBOoMyGEZ9ZSO00oLZsFNWsdaGNgvYafMRZ9/Nv6tK4pJp9/qL+Q3m1CFLfwmgPiZ9EtrpN8YvM1feeHABE+oQRN1owBA8xiCXUhiZ5Yzg0SZjMeW+dha3nq8MjK5pTpitomxRJzhnf4XKhEetOmPPKnD0FGJtXD+dk1C2o1YiD9Uyg3cPAkoWHQSZsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJc8UR2vAOvnqLnCWM0Q3YIYDiYobWwMoXM3pRl2tAo=;
 b=U0FBwDBvaGISNCDygsLuoGptv3cXNhG/GwzVU5ezrg3Sh7SNJkQ2la9kQTwGdkVWIKtKaBxvmfa+Mct38XzFW/ehntg6yTsd9Xd5tyZZxEYrDuznKO7Bgj7awJaJzxxU7HvqLPdlCGGvDkLKZwBWxu4PxNOBs2tEAObkCog8JIBraZ8Kg3EJc6d6F+IsMtD2viP9WFJ7MJ1SAKWKRl6lNYKPmBEmHIiEma2eprt7IVcQ6QBgm2E5FQncAzZVw82eFZ+zo/nFA6JPLXKRFwTYy+Dxuc1nu80NwY4zmYz5uFRvr+FSBS9ewyhLThmKleOUiaKSdVnhnnodUKXzzvkJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJc8UR2vAOvnqLnCWM0Q3YIYDiYobWwMoXM3pRl2tAo=;
 b=k7uVR3FQzuf5hSHeXDFM06fo/nHghfoOtdylIOdi09mDGOcYvqVQgBuRM6XglSl14ugzGjYebV7YwWuSkjRQZjUziMD4ZdMlF+2gARoV06CfjAZeqnVmo8Toy+rmIITtmmAMXM2lX4CncEn5Ba51sh+JRaVZZETQdIIlU91FCSU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 23:12:53 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:12:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Topic: [PATCH v2] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Index: AQHdJWdk0wSJsjdku0enGalmLOWV2baTObsA
Date: Fri, 7 Aug 2026 23:12:53 +0000
Message-ID: <anZmMltO9MJxQdBd@vbox>
References: <20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com>
In-Reply-To: <20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CYYPR12MB8654:EE_
x-ms-office365-filtering-correlation-id: 24d4f705-a91c-4816-4449-08def4d968a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|38070700021|11063799006|56012099006|6133799003|3023799007|4133799003;
x-microsoft-antispam-message-info:
 dHoW1gIl45baBT68Dm3iuvj8rueN09NoF8T5n+GvP8nzjIMOj9SvlIaNjpvQw5ao+Bzjt6i/mtmpwv893d1VpDlvH0J3jDjV6DF3n6gVyHvc+AirXK5GxpOyVSv13CBVlR1E48aniKuA8+aUP44PGv3t0zOuUNm/oWs2V5HIY7Ru/IxQfwoeAx90S4vAgyr8KKqvkDR8k3P8qlKuekhE2RiO09/HVig74lbUw5hWcz6/gSM+o5ebygKAIWt9qieB5osT/nki8LfQAGgbARG07JbnZTVBc6JL+ILJcf31vldUEUbrDS1eZW1RGfKdYrB6pLqD3cs7WJ/bEFqUAzs/Aum2UzyHYM1iCugyMyqlqO8cAEyOgr+4EaxvZiXbJsk7F7GSuNbe1ljRDJ1ULnHQze+2u4S/Hmv9Gk/+Qg0Mqip7c7TCv6zA6hMUAx916xTh86zR3Av0Q0mxFHNhnnRgWdPnXQS0aTqcyJPMvrLN2Ie2My3hGymyCj2yinUNjL3XZxopnlTKpG33HZLcXuN3hQ9z/xxEGefE9v5EqIhYYNhYQPtKpG39sLw1ZpCaFfEmmnCPBiA8avHttlZpfWWZdgoKpvm35TXeEWuVIBjQ9r3+7P9qel88RXAse35WtSD7q3uWqxyR+h1QAKa+tUy6V4qEh4UxFTAe4+rN3heVJYqCU7w6uOzgmuG5KT0BRa3ZlLq4/ZppFu8gjxzm0/EBlUZHrzDVSbNFrW7bLOz+zTg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(56012099006)(6133799003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFNNWVIyZGRoemtybVhjTnVkU0czV1U4TVJmR0llUXFIM3pTU3FLZGJqc3Ni?=
 =?utf-8?B?VWNDQkxDMzNyYVVFVkJkQ1dVMXJqZklzeHdISzNpL0l1SEdwMlB4QUJXaWRX?=
 =?utf-8?B?ekNySkpzcEVQVTZ6RHVYQUgycEQ3U0FtdFhuTlVvNXpOVDE3UldwTDAvTGsw?=
 =?utf-8?B?OXFaOTlMVmRveEUrRm1IYUdXN1BUZmh2eFdRbTI4OFBIbkhmOTVLTTE5RHBS?=
 =?utf-8?B?VFozeFJVMTRNZm1hTjZlalVML2tSUzFEb2tLR1RvOEVzRDZSeWlvaW1lTlJE?=
 =?utf-8?B?anFqdHg1K09Qd0Nwd3BaeldudDdva043MGtSVDNZS2hWeXNpcmplaWM5aWhp?=
 =?utf-8?B?b1VZNFJzb3JxYnRiVkdSQnRCbVhncjdldkxnRXZBR3FtZW42bndWTjN1WEpZ?=
 =?utf-8?B?NGN4TFQyYmdUT0hhZHpjb3BzNDNXMzU5VlQ4SWJMTTFkc0N1Q1dZYUl5cEk1?=
 =?utf-8?B?U2RhQkpXL0VBK2FJSnlnMURPZ21STzVaYzZTbmQ2UEk2MkZyWEVpNm5LTjhE?=
 =?utf-8?B?bFI5NzZLZDZEK0kwWHU4NExLMVNtVHo5U1M3SkYxK2dTYlROd3J5dXpzS2oz?=
 =?utf-8?B?VXhCYTVNN2ZVTzZDS0JqRzQ5ZVduVUZaTTVabklKaVNLUUQxWTVmMmpkUElB?=
 =?utf-8?B?cllUNnV2VXB0QnlKNlNyTURNOXZ0MnBsODhLVGJyR0Y1MGJ1aDlrMWZYTFZj?=
 =?utf-8?B?bFhTMC9pZjZRQ054c2tIa0EyWW1vVVNCWWRiYmFDN2tka1FLNTlzaUU4alBn?=
 =?utf-8?B?U3NiejJjY1VSUStnQjQ3bWVsZTFoM3RyajFjdTMyNThMc0dvVXQranY1UXMr?=
 =?utf-8?B?KzFrWFA5dlBYL0dqbSsxNjVvT3FMcFo3L3o2bm91YWJQNFFJOGdFU1l0SHNh?=
 =?utf-8?B?bXo5K1ZBdjVrZzNKbStoN3FDQmh3bnlyMkZYZzhZRDdyaU5xSUNBRThDMzJp?=
 =?utf-8?B?OHVIblJXU3ZJaGZCcDdJbytLZFNKNjlWRUs2NGdDL25FZ3gwRlRCNmRxRGxp?=
 =?utf-8?B?dGdCQTFVMDRJdkNvQS82L3RXdFlVWW5DYUxyODRIOS90bmExek1rakZIWjY1?=
 =?utf-8?B?TzgzQnpnSFdobGduc1BpQUswUU05Ly96alZMUnJ1KzBYcTJHVnZzcG83bXc3?=
 =?utf-8?B?TGEwSDZhWS91WHp2SWFVakQvUUZiL2xLRTJ0V0dBUU9Bb0phRlliV3pyRkNX?=
 =?utf-8?B?N0t0ZkpLbG0rQy8reFg1ZlFYOU1Nd2dvSk1zY3YzUGVYWVBRQnE3cXlUYU9h?=
 =?utf-8?B?S2lyYjQyV0Q1QnhwMHlaMEJDSzR6Qjc1dkdtNHJZTllKUjY4alV5MFdJY05X?=
 =?utf-8?B?ZlBicEkydHNNR2pEQVYxSUpIZnI5eHVJeEttUVUwOWx2T29UWXZBU205ZW81?=
 =?utf-8?B?SzdMbTlHMm1RNEY5Mi9TYWJNbFlKUXNhb0Y1amtFMXBJMWRPM3BKSitGS1Rs?=
 =?utf-8?B?c3ZIOFBVbEJVVHdjOVBjMmFON3pzd2Era2U3Q2ZvS3Z1Rnl5RC9HbTZzZk5X?=
 =?utf-8?B?ZHRkZWk4VnNrN282SmgvUlhWbDFOcW5OTjFBbitlMDNVeGRvYlQ0MEtVTXhk?=
 =?utf-8?B?a3hpZVArKytMbDU4Rk5vMWxIcmc0bmVmei9yc3FQZnAyRmZPdW5qNW9Ja3g4?=
 =?utf-8?B?RXpFUGREOXMvZ0NnYXUyay9yLytlUXcyTDRMeitLWnR2enY4V1JscUVROGpP?=
 =?utf-8?B?Y2VSYk9QTmh6RksxdHhCMVY5QW51akVZUERlSXJpTDZUc2Z2ZkluU2g1MkpE?=
 =?utf-8?B?U3lmUmVZQUxGRW1HejZYT1ZwY2JpeThnczU2VVJ6aDByQjc4aEtLNkdnY1hl?=
 =?utf-8?B?dDgrQU90YmdGdjBWNEpTeDAycTNFM2ZLTVpxS0Voa2RkZmtxd0s3ZVdORjY1?=
 =?utf-8?B?RGN3ZFhUTTZ6VnQ3M1VSN3A5bnBtZlc5Q0xFY203V01iQVd5ZkxwSXNZNTNa?=
 =?utf-8?B?cU9DcW9yUVg1a3NmaTNRQ0JxZncvMWQ1VTV1RTNwYnpHZFNJUGFNcVp6MDVn?=
 =?utf-8?B?L09VQ0ZqT3N5cHZldHYrMXRYY0Q5bGNod1JoMmNWVzc1cUJIRjRnd3FFTEh2?=
 =?utf-8?B?Z05nblRHNVJKRmc4aGZ2R1pSTkRQbW4ydm1rUmw1Z1RqYURmM2RPNnE3NWZS?=
 =?utf-8?B?ZEE3V1AzN3kyMEdVa3l1Q0V3SVNSRVQya1hXOUttcjFoMFdMdi9HWnJDSkk0?=
 =?utf-8?B?MVFMWlZPQTRkanh5aW5tRUIyV21JY1diYnZWTzNDOHRGTkF6WXFkRkg4Q3lU?=
 =?utf-8?B?cUIyMC9wVWJUWi9xODl0bzRlOVROQTJUbHVDVXNWNGllOHpoeXFUeE9hbElP?=
 =?utf-8?B?clU1Sng3UTVUbXppRmluTFEyYmFUcHJaWlVoc2F3QzZYOVJFc3poQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA71A2730B508944BF4485500AE2C17E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ebZKqStGT0Mhs1esu575/GftlD5/KwnQvbhxNiVbvF9mlhxbLW8SOISRsPW3zW2upxkaU4kKv/dodcg11EUtv5FIrnzOgztU81fIyaSFNccNpsna4n6woOf76Ycfp1r22WKcuDG4T2xe/c0TmsFtaxUb9h8n/S/NTOUkxE24nb8jEVGuulqsWCa07WuK+PlEgg4kxw+yS8bGIDy+C4ajwre3Sj1kGoJ0TtFu2+qw3EUCTsAlufDSeAJS1ixdbOufB1XYJuC5mjUeC44a+cnH8Q+LeOtHQkztZ26ivKZHB/xNvXgfOw5n4dzNf+Hb5RAmNPhay7cC1neK0FM2HAXcWw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ghH1l/wNDvDuswLDaKmJe/BEjbB5lavXDKnHlRi2mx1kuOlGuwmW+yzrG3+xIRYu6Re6aE55f31I1aikJzIpXJF/FMJTfN5pX6GYeFdGT57huxU4rm6RISWOOoXdx64e3YDznth4oRaJn2iyQ+9aDXslC0sFnvcL3U+4xXRhlbsmmpPXWTaBc3lYsV9AyJW+03Hg8XrcQWSs9yse/wHocMNp3fETmtyvyqgETCmEiTCkdPZ4Ji5cU9EuyTf4IBz5aPj96/XvqAxwNKvGrr7xV/CGKj1hJQjzqJlu8IN5OFFZ55/bi2kHplt3rj1KuQk7g8U9RGU5xB7kX0REcu+utGQr+J0SMpst9bZnW3+baKtXzdspldp2o1z1H1SlE4qZwv8xJ8tZu+BTSnjWQbFK1VYsfairzB9bEyWuy/l5+4G8vYvuxyTcht2ZWJerw+JLM4BMHurlO7gg0tz4z3V/dEsIcuJbSLvdg//q7kO7yLFLtjIAEAsbaWCn3bbhZp/Xe/M0xcS33vDOnfOJhb4OISIdMxzFcOcguPQwAZYYrs9qQuPmN02JiCPIFXOgWHTN7PvtM0boCCizLBKkxEoS5Yp92jtqKQZgu4qAOrbsCGJxbhsnsanAicKcoGz3W8nMT3aEaFl0N6RNNTuEdbRSwA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d4f705-a91c-4816-4449-08def4d968a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 23:12:53.3091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apSJdDFiE08eGK0tSxJqw8jTi1GeNQ4Rpl3rUulkUguvYtKtLLjLHEshqaWyqJ/m5ad2DMKD7h7btzweAOGfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654
X-Proofpoint-GUID: -u61oT63hqqWIWKZLq-25Dcgp_z3n3_d
X-Proofpoint-ORIG-GUID: -u61oT63hqqWIWKZLq-25Dcgp_z3n3_d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE4MSBTYWx0ZWRfX681zQBiKNKRP
 uhdw8BMxjUYfwr6hvtfvF0aUMFcLPqy8Dv26gny/Hy9tCTveAECevCcvCRxGLZmkS3BIfIGBCki
 qpwCTGK5YVzNHhu1sP7MzCcEMMxDtBo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE4MSBTYWx0ZWRfXwpDVt1d7lqWI
 /CB1lnYAjQawD8zn7RrqlRCOfz1P8bCnmJkqNfWjZJQulS+duOgtZfpVi2GcsqU+FS+lXhHnHq8
 7dVOzKNXj2auK9jal3iZk9FFOfH8AJoR/YrYW+B8hUjfKLNKSrmdtIxRTPUfnayHO39kwzE/iX4
 e7HlVonk38vgCqEBJHYGhO4aj0YMUl5mNyTqklXI0EyLn/bC2gbIQIqqgnqfn1RWxwRNwW7qOjT
 ZWIPQGN/SZq12CFX19QOD9hwZcHpNv61tQ6MLK3RYphDzbrK9UXnVJlGZFJC85whP1SBw6vN1av
 clAss1e17HQaNpDcAxFIL3KYJD/eDu3WYweBK2A2sj87L+PrK4E+mUQmV+CcsC/AKluWqMrLciQ
 9CfgVI30D91JXQcKDCs9v8QbjZaLCuHTwC6eJjNUmXTujpmkWRahtcb3Y95dgItLCs+B6a7aEiQ
 92ojRnMsOnlFEvmgBMA==
X-Authority-Analysis: v=2.4 cv=dpLrzVg4 c=1 sm=1 tr=0 ts=6a76667c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hciGgIt9BUuGmga862wA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608070181

T24gVGh1LCBBdWcgMDYsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IER1cmluZyBw
bHVnLWluL3BsdWctb3V0IHRlc3QgY2FzZXMsIGl0IGlzIHNvbWV0aW1lcyBzZWVuIHRoYXQgbm8g
ZXZlbnRzDQo+IGFyZSBnZW5lcmF0ZWQgYnkgdGhlIGNvbnRyb2xsZXIgYW5kIGFsbCBDU1IgcmVn
aXN0ZXIgcmVhZHMgZ2l2ZSAiMCIgYW5kDQo+IENTUl9UaW1lb3V0IGJpdCBnZXRzIHNldCBpbmRp
Y2F0aW5nIHRoYXQgQ1NSIHJlYWRzL3dyaXRlcyBhcmUgdGltaW5nIG91dA0KPiBvciB0aW1lZCBv
dXQuDQo+IA0KPiBUaGUgaXNzdWUgY29tZXMgdXAgb24gZGlmZmVyZW50IGluc3RuYWNlcyBvZiBl
bnVtZXJhdGlvbiBvbiBkaWZmZXJlbnQNCj4gcGxhdGZvcm1zLiBPbiBTTTg1NTAsIHRoZSBkZWJ1
ZyBsb2cgaXMgYXMgZm9sbG93czoNCj4gDQo+IFByZXBhcmVkIGEgVFJCIG9uIGVwMG91dCBhbmQg
ZGlkIHN0YXJ0IHRyYW5zZmVyIHRvIGdldCBzZXQNCj4gYWRkcmVzcyByZXF1ZXN0IGZyb20gaG9z
dDoNCj4gDQo+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMDA2OiBkd2MzX2dh
ZGdldF9lcF9jbWQ6IGVwMG91dDoNCj4gY21kICdTdGFydCBUcmFuc2ZlcicgWzQwNl0gcGFyYW1z
IDAwMDAwMDAwIGVmZmZhMDAwIDAwMDAwMDAwIC0tPg0KPiBzdGF0dXM6IFN1Y2Nlc3NmdWwNCj4g
DQo+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMTk2OiBkd2MzX2V2ZW50OiBl
dmVudCAoMDAwMGMwNDApOg0KPiBlcDBvdXQ6IFRyYW5zZmVyIENvbXBsZXRlIChzSUwpIFtTZXR1
cCBQaGFzZV0NCj4gDQo+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4uMS4gICAgNjYuNDIxMTk3OiBk
d2MzX2N0cmxfcmVxOiBTZXQNCj4gQWRkcmVzcyhBZGRyID0gMDEpDQo+IA0KPiBBbiBYRkVSIE5S
RFkgaXMgcmVjZWl2ZWQgb24gZXAwaW4gZm9yIHplcm8gbGVuZ3RoIHN0YXR1cyBwaGFzZSBhbmQN
Cj4gYSBTdGFydCBUcmFuc2ZlciB3YXMgZG9uZSBvbiBlcDBpbiB3aXRoIDAtbGVuZ3RoIHBhY2tl
dCBpbiAyIFN0YWdlDQo+IHN0YXR1cyBwaGFzZToNCj4gDQo+IDwuLi4+LTcxOTEgICAgWzAwMF0g
RC4uMS4gICAgNjYuNDIxMjQ5OiBkd2MzX2V2ZW50OiBldmVudCAoMDAwMDIwYzIpOg0KPiBlcDBp
bjogVHJhbnNmZXIgTm90IFJlYWR5IFswMDAwMDAwMF0gKE5vdCBBY3RpdmUpIFtTdGF0dXMgUGhh
c2VdDQo+IA0KPiA8Li4uPi03MTkxICAgIFswMDBdIEQuLjEuICAgIDY2LjQyMTI2NjogZHdjM19w
cmVwYXJlX3RyYjogZXAwaW46IHRyYg0KPiBmZmZmZmZjMDBmY2ZkMDAwIChFMDpEMCkgYnVmIDAw
MDAwMDAwZWZmZmEwMDAgc2l6ZSAwIGN0cmwgMDAwMDBjMzMNCj4gc29mbiAwMDAwMDAwMCAoSExj
czpTQzpzdGF0dXMyKQ0KPiANCj4gPC4uLj4tNzE5MSAgICBbMDAwXSBELi4xLiAgICA2Ni40MjEz
ODc6IGR3YzNfZ2FkZ2V0X2VwX2NtZDogZXAwaW46IGNtZA0KPiAnU3RhcnQgVHJhbnNmZXInIFs0
MDZdIHBhcmFtcyAwMDAwMDAwMCBlZmZmYTAwMCAwMDAwMDAwMCAtLT5zdGF0dXM6DQo+IFN1Y2Nl
c3NmdWwNCj4gDQo+IEEgYnVzIHJlc2V0IHdhcyB0aGVuIHJlY2VpdmVkIGRpcmVjdGx5IGFmdGVy
IDUwMCBtc2VjLiBTb2Z0d2FyZSBuZXZlcg0KPiBnb3QgdGhlIGNtZCBjb21wbGV0ZSBmb3IgdGhl
IHN0YXJ0IHRyYW5zZmVyIGRvbmUgaW4gc3RhdHVzIHBoYXNlLiBIZXJlDQo+IHRoZSBSQU0gaW50
ZXJmYWNlIGlzIHN0dWNrLiBTbyBob3N0IGlzc3VlcyBhIGJ1cyByZXNldCBhcyBsaW5rIGlzDQo+
IGlkbGUgZm9yIDUwMCBtc2VjOg0KPiANCj4gPC4uLj4tNzE5MSAgICBbMDAwXSBELi4xLiAgICA2
Ni45MzU2MDM6IGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAwMDEwMSk6DQo+IFJlc2V0IFtVMF0NCj4g
DQo+IFRoZW4gc29mdHdhcmUgc2VlcyB0aGF0IGl0IGlzIGluIHN0YXR1cyBwaGFzZSBhbmQgd2Ug
aXNzdWUgYW4gRU5EWEZFUg0KPiBvbiBlcDBpbiBhbmQgaXQgZ2V0cyB0aW1lZG91dCB3YWl0aW5n
IGZvciB0aGUgQ01EQUNUIHRvIGdvICcwJzoNCj4gDQo+IDwuLi4+LTcxOTEgICAgWzAwMF0gRC4u
MS4gICAgNjYuOTU4MjQ5OiBkd2MzX2dhZGdldF9lcF9jbWQ6IGVwMGluOiBjbWQNCj4gJ0VuZCBU
cmFuc2ZlcicgWzEwNTA4XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgLS0+IHN0
YXR1czoNCj4gVGltZWQgT3V0DQo+IA0KPiBVcG9uIGRlYnVnIHdpdGggU3lub3BzeXMsIHRoZSBy
b290IGNhdXNlIGlzIGFzIGZvbGxvd3M6DQo+IA0KPiBEdXJpbmcgYW55IHRyYW5zZmVyLCBpZiB0
aGUgZGF0YSBpcyBub3Qgc3VjY2Vzc2Z1bGx5IHRyYW5zbWl0dGVkLA0KPiB0aGVuIGEgRG9uZSAo
d2l0aCBmYWlsdXJlKSBoYW5kc2hha2UgaXMgcmV0dXJuZWQsIHNvIHRoYXQgdGhlIEJNVQ0KPiBj
YW4gcmUtYXR0ZW1wdCB0aGUgc2FtZSBkYXRhIGFnYWluIGJ5IHJld2luZGluZyBpdHMgZGF0YSBw
b2ludGVycy4NCj4gDQo+IEJ1dCwgaWYgdGhlIFVTQiBJTiBpcyBhIDAtbGVuZ3RoIHBheWxvYWQg
KHdoaWNoIGlzIHdoYXQgaXMgaGFwcGVuaW5nDQo+IGluIHRoaXMgY2FzZSAtIDIgc3RhZ2Ugc3Rh
dHVzIHBoYXNlIG9mIHNldF9hZGRyZXNzKSwgdGhlbiB0aGVyZSBpcyBubw0KPiBuZWVkIHRvIHJl
d2luZCB0aGUgcG9pbnRlcnMgYW5kIHRoZSBEb25lICh3aXRoIGZhaWx1cmUpIGhhbmRzaGFrZSBp
cw0KPiBub3QgcmV0dXJuZWQgZm9yIGZhaWx1cmUgY2FzZS4gVGhpcyBrZWVwcyB0aGUgUmVxdWVz
dC1Eb25lIGludGVyZmFjZQ0KPiBidXN5IHRpbGwgdGhlIG5leHQgRG9uZSBoYW5kc2hha2UuIFRo
ZSBNQUMgc2VuZHMgdGhlIDAtbGVuZ3RoIHBheWxvYWQNCj4gYWdhaW4gd2hlbiB0aGUgaG9zdCBy
ZXF1ZXN0cy4gSWYgdGhlIHRyYW5zbWlzc2lvbiBpcyBzdWNjZXNzZnVsIHRoaXMNCj4gdGltZSwg
dGhlIERvbmUgKHdpdGggc3VjY2VzcykgaGFuZHNoYWtlIGlzIHByb3ZpZGVkIGJhY2suIE90aGVy
d2lzZSwNCj4gaXQgcmVwZWF0cyB0aGUgc2FtZSBzdGVwcyBhZ2Fpbi4NCj4gDQo+IElmIHRoZSBj
YWJsZSBpcyBkaXNjb25uZWN0ZWQgb3IgaWYgdGhlIEhvc3QgYWJvcnRzIHRoZSB0cmFuc2ZlciBv
biAzDQo+IGNvbnNlY3V0aXZlIGZhaWxlZCBhdHRlbXB0cywgdGhlIFJlcXVlc3QtRG9uZSBoYW5k
c2hha2UgaXMgbm90DQo+IGNvbXBsZXRlLiBUaGlzIGtlZXBzIHRoZSBpbnRlcmZhY2UgYnVzeS4N
Cj4gDQo+IFRoZSBzdWJzZXF1ZW50IFJBTSBhY2Nlc3MgY2Fubm90IHByb2NlZWQgdW50aWwgdGhl
IGFib3ZlIHBlbmRpbmcNCj4gdHJhbnNmZXIgaXMgY29tcGxldGUuIFRoaXMgcmVzdWx0cyBpbiBm
YWlsdXJlIG9mIGFueSBhY2Nlc3MgdG8gUkFNDQo+IGFkZHJlc3MgbG9jYXRpb25zLiBNYW55IG9m
IHRoZSBFbmRQb2ludCBjb21tYW5kcyBuZWVkIHRvIGFjY2VzcyB0aGUNCj4gUkFNIGFuZCB0aGV5
IHdvdWxkIGZhaWwgdG8gY29tcGxldGUgc3VjY2Vzc2Z1bGx5Lg0KPiANCj4gRnVydGhlcm1vcmUg
d2hlbiBjYWJsZSByZW1vdmFsIGhhcHBlbnMsIHRoaXMgd291bGQgbm90IGdlbmVyYXRlIGENCj4g
ZGlzY29ubmVjdCBldmVudCBhbmQgdGhlICJjb25uZWN0ZWQiIGZsYWcgcmVtYWlucyB0cnVlIGFs
d2F5cyBibG9ja2luDQo+IHN1c3BlbmQuDQo+IA0KPiBTeW5vcHN5cyBjb25maXJtZWQgdGhhdCB0
aGUgaXNzdWUgaXMgcHJlc2VudCBvbiBhbGwgVVNCMyBkZXZpY2VzIGFuZA0KPiBhcyBhIHdvcmth
cm91bmQsIHN1Z2dlc3RlZCB0byByZS1pbml0aWFsaXplIGRldmljZSBtb2RlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNv
bW0uY29tPg0KPiAtLS0NCj4gVGhpcyBzZXJpZXMgaGFzIG9ubHkgYmVlbiBjb21waWxlIHRlc3Rl
ZC4gVGhlIGlzc3VlIHdhcyByZXByb2R1Y2VkDQo+IGVhc2lseSB3aXRoIGEgY2VydGFpbiBraW5k
IG9mIGNhYmxlIGFuZCBDRFAgcG9ydCBvZiBBTUQgYmFzZWQgTGVub3ZvDQo+IGxhcHRvcC4gSSBk
b24ndCBoYXZlIGFjY2VzcyB0byB0aGUgY2FibGUgY3VycmVudGx5IGFuZCBoZW5jZSBvbmx5DQo+
IGNvbXBpbGUgdGVzdGluZyB0aGUgZml4IGZvciBub3cuIEJ1dCB0aGUgaXNzdWUgaGFzIHBvcHBl
ZCB1cCBvbiBPRU0NCj4gdGVzdGluZyBhcyB3ZWxsLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4g
LSBJbXBsZW1lbnRlZCBnYWRnZXQgcmVjb3ZlcnkgbWVjaGFuaXNtIGR1cmluZyBnYWRnZXRfZXBf
Y21kIGluc3RlYWQgb2YNCj4gaGFuZGxpbmcgdGhpcyBpc3N1ZSBvbmx5IGR1cmluZyBkaXNjb25u
ZWN0Lg0KPiANCj4gTGluayB0byBSRkM6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEwMTExMDAyMTQuMjU3MjAtMS1xdWljX2ty
aXNrdXJhQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFlQlV6TWxuRVAyVEsySGZiRlpKYUwx
RlEya0xwQ1RrUWdwS0pmMW5LNjE2a3J3bDFGNWJxMkxESUVBSHdHcEZqMW9vSDh5NlF6bzF6aWtk
WG8wQ3N6TzVZQ0JRVVRSaHN3a3dxWEEkIA0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IGZhMGYxNmZmYWZl
Zi4uN2FhMjkwYTgwNGNjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI4Myw2ICsyODMsMTcg
QEAgaW50IGR3YzNfc2VuZF9nYWRnZXRfZ2VuZXJpY19jb21tYW5kKHN0cnVjdCBkd2MzICpkd2Ms
IHVuc2lnbmVkIGludCBjbWQsDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiArc3RhdGlj
IGludCBkd2MzX2dhZGdldF9zb2Z0X2Rpc2Nvbm5lY3Qoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ICtz
dGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3NvZnRfY29ubmVjdChzdHJ1Y3QgZHdjMyAqZHdjKTsNCj4g
Kw0KPiArc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfcmVjb3ZlcihzdHJ1Y3QgZHdjMyAqZHdjKQ0K
PiArew0KPiArCWRldl93YXJuKGR3Yy0+ZGV2LCAiY29udHJvbGxlciBkZWFkLi4uIHRyaWdnZXJp
bmcgc29mdCByZWNvbm5lY3RcbiIpOw0KPiArCWR3YzNfZ2FkZ2V0X3NvZnRfZGlzY29ubmVjdChk
d2MpOw0KPiArCXVkZWxheSgxMDApOw0KPiArCWR3YzNfZ2FkZ2V0X3NvZnRfY29ubmVjdChkd2Mp
Ow0KPiArfQ0KPiArDQo+ICAvKioNCj4gICAqIGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kIC0gaXNz
dWUgYW4gZW5kcG9pbnQgY29tbWFuZA0KPiAgICogQGRlcDogdGhlIGVuZHBvaW50IHRvIHdoaWNo
IHRoZSBjb21tYW5kIGlzIGdvaW5nIHRvIGJlIGlzc3VlZA0KPiBAQCAtNDMyLDYgKzQ0MywyMyBA
QCBpbnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWdu
ZWQgaW50IGNtZCwNCj4gIAkJY21kX3N0YXR1cyA9IC1FVElNRURPVVQ7DQo+ICAJfQ0KPiAgDQo+
ICsJLyoNCj4gKwkgKiBTVEFSIDUwMDE1NDQgLSBJbiBzb21lIHNpdHVhdGlvbnMsIGxpa2UgdGhl
IGNhYmxlIGlzDQo+ICsJICogZGlzY29ubmVjdGVkIG9yIGlmIHRoZSBIb3N0IGFib3J0cyB0aGUg
dHJhbnNmZXIgb24gMw0KPiArCSAqIGNvbnNlY3V0aXZlIGZhaWxlZCBhdHRlbXB0cywgdGhlIFJl
cXVlc3QtRG9uZSBoYW5kc2hha2UgaXMgbm90DQo+ICsJICogY29tcGxldGUuIFRoaXMga2VlcHMg
dGhlIFJBTSBpbnRlcmZhY2UgYnVzeS4NCj4gKwkgKg0KPiArCSAqIFRoZSBzdWJzZXF1ZW50IFJB
TSBhY2Nlc3MgY2Fubm90IHByb2NlZWQgdW50aWwgdGhlIHBlbmRpbmcNCj4gKwkgKiB0cmFuc2Zl
ciBpcyBjb21wbGV0ZS4gVGhpcyByZXN1bHRzIGluIGZhaWx1cmUgb2YgYW55IGFjY2Vzcw0KPiAr
CSAqIHRvIFJBTSBhZGRyZXNzIGxvY2F0aW9ucy4gTWFueSBvZiB0aGUgRW5kUG9pbnQgY29tbWFu
ZHMgbmVlZCB0bw0KPiArCSAqIGFjY2VzcyB0aGUgUkFNIGFuZCB0aGV5IHdvdWxkIGZhaWwgdG8g
Y29tcGxldGUgc3VjY2Vzc2Z1bGx5Lg0KPiArCSAqDQo+ICsJICogSWYgdGhlIGRlcGNtZCBkb2Vz
bid0IG1hdGNoIHRoZSBhY3R1YWwgY29tbWFuZCwgdHJpZ2dlciBjb250cm9sbGVyDQo+ICsJICog
cmVjb3ZlcnkuDQo+ICsJICovDQo+ICsJaWYgKERXQzNfREVQQ01EX0NNRChyZWcpICE9IERXQzNf
REVQQ01EX0NNRChjbWQpKQ0KPiArCQlkd2MzX2dhZGdldF9yZWNvdmVyKGR3Yyk7DQo+ICsNCj4g
IHNraXBfc3RhdHVzOg0KPiAgCXRyYWNlX2R3YzNfZ2FkZ2V0X2VwX2NtZChkZXAsIGNtZCwgcGFy
YW1zLCBjbWRfc3RhdHVzKTsNCj4gIA0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA1ZDVmZDg0
MWMzNDY0OWYxYjA5MjIwZmU1OGU1OWRmZmQ2MWM0NDdkDQo+IGNoYW5nZS1pZDogMjAyNjA4MDMt
cmFtLWludGVyZmFjZS1jb2RlLTEyYzYyNDcwOTczMg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAt
LSAgDQo+IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNv
bT4NCj4gDQoNCkxpdSBpcyBhbHNvIHdvcmtpbmcgb24gYSBjb250cm9sbGVyIHJlY292ZXJ5IGZs
b3cgaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi9hblpZbldmRGxOUFJR
QnEzQHZib3gvVC8jdA0KDQpNYXliZSB5b3UgY2FuIHJldmlldyBteSBmZWVkYmFjayB0aGVyZSBh
bHNvLg0KDQpUaGFua3MsDQpUaGluaA==
