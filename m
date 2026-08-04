Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D33F328C;
	Tue,  4 Aug 2026 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785883082; cv=fail; b=LwY9bDXn20EChwhQ3P4iZ+Sv9x/03ERrs/ID/cAH52FRIQ5AbpyAaiwXK7buoBwnshQCgZubbkKDtWFAif1JgeZo9KPWrkSyPly6IQFxjTBEAEMNQ+pSQBsm6Jn0rIyY1pfw54EJNBfYNZ174dVT+wUb70o4ZtmxJ85DkgNNkCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785883082; c=relaxed/simple;
	bh=IUqm7YUjUrTqG+lMhrnqNOkTZ7ck7o+74Ts5C6u/rrs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=heaG8F5FvI3grBYwguq/QBStdpyNmTM6rO1Fd7hgcBtucbVN84na3zX7GzZNp/Dv2MLTXkBWm6Ac2+vDlRY7R9lyYp0AHtw1iiey4sjoQcWt4+UKfB0MQKKGNQMunt0xCKEesjCf8cU2mcgJhUOawAnr9KeIa3bX+N0h6RdKwHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DAA6fsjN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BNhJYqyu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZSexUI7W reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DAA6fsjN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BNhJYqyu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZSexUI7W"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpXDf1535166;
	Tue, 4 Aug 2026 15:37:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=IUqm7YUjUrTqG+lMhrnqNOkTZ7ck7o+74Ts5C6u/rrs=; b=
	DAA6fsjNTzkXrbep3TzYlB2j0alaF10BANnJ34eUTCtN+zl1tVcb+FtKArvy8j6z
	2RfA9VA2pljoIxG5zzZesci4VW0llmqvy6Pim/i4RbTHiVyq6+qBLrH90z27jyH/
	EclowVmzjj+0yHpYf+6oNg653+V2c62YaQu9+Aptz6aZFy0rB1DRQjN6uIJl/R07
	K7HPXNyQHpY4ZjKqxGhzWkk97KbkvSQpMzDAn33anW4oE5z47zwGlbo/zrY4QL6q
	vE8JphtPOOHZkSxqvA3JSm6v5r/M5YzqwfCPPKovrrktgEoPlMHa8JZsQnHEL8v+
	kw2hY4kte+KUJbhqUoYtyA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fuey35x4w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 15:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785883075; bh=IUqm7YUjUrTqG+lMhrnqNOkTZ7ck7o+74Ts5C6u/rrs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BNhJYqyujIno2OuoMjG966JG1MPr6zE1KKGUayufVeeswdJQEIl9XascFtt9WjiK0
	 e5vUKDHxZlYyAH6PJzOPlXjvFbT2y49SWncgq+fqtahhP++0zyZ9MzZh9o1jI5w9kF
	 HhIumMvqa6eEUPuagtIqsxUGICJrgar1bWj+phiVt2oFISYRTgb+GrEvFcL4ewYjnV
	 D78CAxNdwnZHO8i8JfvSq28sc6SDeDuAIhcBeaYsfArFX34QS9Je7y3U7QC3M65y1E
	 IbynzvvutIWVu/TvD42LmpcJMHHttLebesHthOLSlZzt75u4Lf/TU+2iWdII90dOWs
	 JUf/9EjHb0k0g==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81DCE4013E;
	Tue,  4 Aug 2026 22:37:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4002EA009A;
	Tue,  4 Aug 2026 22:37:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZSexUI7W;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00603.outbound.protection.outlook.com [40.93.23.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A4BD62201E5;
	Tue,  4 Aug 2026 22:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSsm+A7vPJj+2127TpW2qbkAuLalkjlOZXi0FTgn1fdzOC0W81kpfLcclfs+9n9+sE2xEmMvmf7J5WaVCJmYyx4m7a/+9xVwjeTkCvdtNOzEpyZYSKufsBsVfTTFKGZ7zCvCBNgahqtCGGds0sUrJw/iaxge33fFrdweoCmKu2V0UPnyJEk/Pb6YjD5pwugS1dgzNoptW2GtpR/6vT9KMgTmZcNBLTY7j2Y+J9gHbp5zP69pLvp2LYCEUaxTmqFffSL2V2ewHR2LkurA3ZcezTl/5oVklz9IALEiV8WMqVxDPyNvXhu58S6W6ShPYQe0Aqr3IkZ4iIiPjKjOdfEzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUqm7YUjUrTqG+lMhrnqNOkTZ7ck7o+74Ts5C6u/rrs=;
 b=FOOblLNwhQq9FWvu0CLsuX20COEmIddG1MHkYyW/oifI5QmWdglzrEvvAo2VL82327v1GRBymx1J5zXOazvZg1+fdTD3CWbWenjPUglsm/O8syX8dek0eHFvHyaXXymXlIVIfDf2lAH0oFYb7uhwf9n2+zE3HbqwqNIySbQwrsxkTeKiNtwLPpRMIRWWtqGLxV1cFrUOpP+6v8/9sAjjvQ4Ie51z3SFPZ5RIHo/r+3HN973yhvvkOyA+QEd0ImOsDwxDfhZqUC6SVSjlN3gUW7ydP3JZdJXaEGBmsakk6LXhBng9Onfnm3JO5eLk1Qgqm0N8gCO32As7gLQGuGPJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUqm7YUjUrTqG+lMhrnqNOkTZ7ck7o+74Ts5C6u/rrs=;
 b=ZSexUI7W7J5vID0f/thBsVQKrxC2l+faG+19LicKfOX1W1B8fLyFuv64zvDI0YUgRM875jvRGFavL7MFfTE7dzMCussa9t5Ekyc2DH0w3X8j5THIXTwoYlWOZjUN/3+swNbJyR3EQAMV+ObgN3+MQ+/5isR8Lku0/4+2oef6n4M=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 22:37:48 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 22:37:48 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Topic: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Thread-Index: AQHdFFWc4ADUIzvtDEWex/edOcuJsLZ6MfCAgAiAFYCABNWugIAABTWAgAcOLAA=
Date: Tue, 4 Aug 2026 22:37:48 +0000
Message-ID: <anJpZTRc0xK2MRDO@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <amFCwDiD-StHHV9c@vbox>
 <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
 <30a8cabf-44db-4023-9b1e-58d7b261bb4e@linux.intel.com>
 <75ea8be5-9426-4fed-a29e-654aac4f2617@oss.qualcomm.com>
In-Reply-To: <75ea8be5-9426-4fed-a29e-654aac4f2617@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA0PR12MB8695:EE_
x-ms-office365-filtering-correlation-id: 6e427f9d-8c05-414c-b59f-08def27902ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|38070700021|6133799003|56012099006|4143699003|5023799004|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 W5TCvOsgrBV7uTc8i3mHLz9zhi/pinJajNGrj1hqCXIWyJVCr9VWqbnA+TV5nKTc3XTHAaBupbU9vt9lDrvnl7W0/hm0GXkkdSjuS9Lny0gzM+u7dkqDuF7aGcjmGnU394JZNIHULEmfxXqZTb4GSz8eh/2ORbCxZcTRoIzRJchkjrGV5HIbPzQ9vdOedk5O5jZPIFFwNLQNPFfgAjTfaVPtt4RHWds7ij4VtmS5Ej88z1kF67ZhdNM48VYFoD6lQ1TBuMenNzU21duGd5nOBEbkCWkW0lL4lATam0ZgmRV7cnnLuEJhVKm2K4ADCy8cOEy0mWRzThiPgpHbJREipAuvVT7HUkli7ypXSfYxBMj+Gxf07c7rEewQrtdhSMHGNMYAXHuh+3Uh69TkAno2G+FsKR50KNIICL6v/+VGpVtwggEZg/j+vpduT2DnUzd67rq3KYT0fIDLFndvGgRCgi6f9YR/Vcq5txA+Zi3GI89FSgcoteE9wI74HvsTskN+N5o/U8YUtaysAspJ41p2JKKYXwz9kczx04ZbRRK7ZrPpZRfc+Y0OrGi7p3n6Z/dhQ7HvxZI+xuDtAi48QIuw2DZ0cO7g7bP4EITEpGPGdvqDNCs+qYy5+yXgzeNPf0HqNs3x020Vavve8FPFy0UxUlxpMK8q8n3G4LMKPHJkNzQ1muctbWCHMG0957drgPL8jrpHxAlyIoUiXq1tKmq6uVEGDjw84qvVfXV2I+P9j8I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(38070700021)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THVMcStKNDBlc281S21LNVhPallaTWJJdkZJMWppek8wNTNwaXNtR0JLOElj?=
 =?utf-8?B?ajdFSVZoNUM1RGRNQVZ4bWNTR08zbUloUkpQdzFlendNWHhxRmhPUy9jd29m?=
 =?utf-8?B?WHhKOGh5SWl2MHlpRGtUMTF4UVNHWW04d0F2bVFvVGovR2MwR3VhQWp6U3pL?=
 =?utf-8?B?RE9leWV6emxFTG5Lc1lEZHJvZjRKRnhSc0R3NHZka0VEL0N1SnR6SWdRVmlq?=
 =?utf-8?B?RWd1WGdxYUlHakd2R3Q1clVLK1JiUHllakVYdlc4UHpkSEtYYSt2dyt6ZEg1?=
 =?utf-8?B?OTR3VmUvZVpRS1NjK0lmSjRabHREM2xBTnJraXJnbE1DNGpJOVN3VlpSOUxj?=
 =?utf-8?B?UEhPOHQ3c0lDWjZSdUNEVTR3S0l1eFBiK2Q4Rm5NUjFsaWdsK3ZlZ0N2T09K?=
 =?utf-8?B?blRUSTFXY2dSb2RpL3hiTXZYdGRaNWxHeEhxWlF0ZU1LQUtXRWtXc2VhdHBQ?=
 =?utf-8?B?Qjl1aGRVcnREQTgyMkR2cUNWTGNZRWZvd3JkVmszNVhMTS9PZWl4MVExTFM2?=
 =?utf-8?B?N1RFWHcxSWt1cE9UcUI3RGFTTkh4eGxZMkx5OXBQTjZhT1BvTmVHV3VQaG1J?=
 =?utf-8?B?bjhZbUg1OTljNUd1TjIwMWhLcjhwTnVVODZuMFZET2k1R09ybXdqcDQzbWdO?=
 =?utf-8?B?NjAxNFpWenJ0WjRzRlJJdGdDOTdVWmxMYXE0eGhtNXZ0aXgxZWRUS1U2Wjlz?=
 =?utf-8?B?QVVyTEhNUmxaOUNJS2hMQ2czMURvOXFSK0FHM1dlTnE1L0tkMm53cWhnenNR?=
 =?utf-8?B?VWR3NE8raVVEZDlNb3EyWVNUd1VVTTFaSDFCZTJ1aWR5WnEwam1KcjBaKzdI?=
 =?utf-8?B?dVJKUktlcDdmMHNYaGtPTExUcXlycTRPeDZKOXU1OW1UOXpXQXkyNVhqTmRG?=
 =?utf-8?B?QlFlQU9WN3AwL1RxR2JGRlZ3RkxXVGJGbExJcG5JaHZVVjNpbm1hOUYrMnQ3?=
 =?utf-8?B?ZGpsY0xWWUVqQi85QzZxa0d2SW5TQXhFSllXSVlEUEtoV0E2MW1FQTRkOUdt?=
 =?utf-8?B?Q2lBRjkyaTFSV0FNMXB6b3pnN0xVd0grS0YraHk3bEk5T2VNUlRmdzRSUlRn?=
 =?utf-8?B?STR2QjVCa2RNOHB5dDJ4VVZyWDdlWWV6WXdqRkNUanZLZ0plTHdIK204a0Rl?=
 =?utf-8?B?N3IzMy9UMnVrTzRrR0hVWDBBb2NVeTBEbHQ2Q3hLYUVyNnNrU0JGN2F5RXFn?=
 =?utf-8?B?ZGd3NS8yc2Nmck9pYkpBY2FXbjlkam9id09zWTZRV2cwY2NWZFFsSmExbkw2?=
 =?utf-8?B?RGVSa0FpN0RrWEdVL0xhRG9SL2t3MHhTWWR6dE9uQXFwM1ZEc1JGeWowZkFS?=
 =?utf-8?B?dk9NSHdxckZNd1RaUlVuWm1HRk5sS3NvS2EwUUhucm9NQllGcThoV29RbEJZ?=
 =?utf-8?B?emtyaUp4VjZ3TGhxOEJLN0VHaE9yYzU5OFlQb3Zaa29sdGNMbHMxN3d4K2Vo?=
 =?utf-8?B?VkhJNmY5djZ2QnNGMCtFOFhaT1pIY3Aza0lTWVN3dERSQk1pOU10ZVg2MHdI?=
 =?utf-8?B?NEt4eGdUYjlmbGJUVDgvYWhjcDQ3dE4wRytVVjdwNGFQd2NyOXFId0c2bFcz?=
 =?utf-8?B?ZjN5ZXM4NDA1L3lqazZ4S2FQbVRib05NSVB3WTJHNkdNRVppWmdvSGx4bmMy?=
 =?utf-8?B?Sm9TR0I0SDhRY1hRTG41L00xMEVtRzhhRXliMXlqMnY3R2FhN1VWRUM4UXNh?=
 =?utf-8?B?TDcza3J1SllKSytlTDZXZkdkNEpLVjEvU1FqK0tXYmxSUVZpRTF1Q1phc3E0?=
 =?utf-8?B?Wi9iT1k5c21FL2VySkVqbzU0NHVKclkzbURSUng1emlKQUl3WHhiakI4WUJC?=
 =?utf-8?B?Q3dqeW4xZVEvejBtWnFSb3FZTGF1c2ZUOTVOTHBVMUlsQytBcHdzVXF4M05s?=
 =?utf-8?B?VjZtQTR0SFZXMWtRZS9rL1YyQlpoWDRvZVhIeUFmK3JXSEFsdXRESDc2N2U1?=
 =?utf-8?B?YnJDYnQ0WXlPSWVMVTJHZUFuRzY0ZnBWdmd1V292UHZaenFQZHNHUGwzZlVM?=
 =?utf-8?B?UlV2WkllTkNTT0NIL0k1eGc0NmxFR3Z6ZGhyZmFWVXg4UjlGR1dzaXVWOXZ6?=
 =?utf-8?B?QnAyU2E3ZmZZQktSMGwwY2xmZnJrdGlTb1ZyUSsxQS94d3pIdnUzZlQ2Y1dY?=
 =?utf-8?B?K2poWm5MTUs4SC95YnNhUFFQdTdta2xPNkJnL1oxRWlkb0YzcEduNjYwMytp?=
 =?utf-8?B?UEhjTlR2UTRQV0hmNnZpU3UzZEdLUDY0bG9maTdDWlFGM0tFTlZpbVUzMEtZ?=
 =?utf-8?B?STFjbUhJeUZ1T05vS2Y2L1NUVlFYejk0V1NRNVpiZU9rYis5cjVHQ0pxS1gw?=
 =?utf-8?B?N2tnTDloUEo5cmNHUmpNTTB6RzRWTm0rY1lKaEpZLzI3UUpSUU1RZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98BA73ECA54D0B4A996AAC300D760297@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	tL3vjmyLWD51VWLltlpuqwQfGarvlC5znVGTyMOenDUFWM5R6/xZisnRJD7wWFkrTZp1e9c1RwP0KFulTUJ98HI1KFhiIxvgPO9vFwNMbMJqT9aywwJ5XExNdUmxptz/6FWoLNIfr8rxlfBXnPBtg6L09gQnyPAPseLMp2DkK+ExV2rgDF+TzQ6vfAV9X2N10lEyyBoRdwzB6b6Sz//V36/DkHQhwyrR4n3YwjAUg3Wbjdr+yzbFWzRZA9iKU+iMCjNKmRsG2lLZrPcojoqR/zTdApWn4KwzbyFXLEt2EMiwz9forvO6+B45RjERH79yxwbZf9v6LyHz4Gps6dAcIQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GohZH9Bh1fsZ6XFueNb1xbdl69LTt1pfQlYEbtRJtlN0kOotgZNYzT0jkxwk9vGvXrkGmcAlJirm5O1RExawQ0hCUQtVwbl2dFVt69AF46nFI/Zw8PN/Pn5JTN3vvziLdXrVl6gmDCsBKu6NvOqj01Dya1C0fmCdhYz9vd6k9/K1R88sitijrLIXffgL26TEuE6uIa1KfBur13aZatlgoDSgkGAuRjfpWkMRyMsAGXVRC+y4eOdtAvMXcq4KcZYTPuh2cmcRXM96UvfuKbS5rTX3yExi49IwP1ZZJtYyBNsBrIto3rQ0Pi+LUl6gDE5KPfYgRc40yPzuaZNDJNkfTQNe4aywVtCWBAU/1oz7gx+DnuGIe3MzkB9bRizQCIMc8izySixf+PlFhSwjup3FDooKMOal1jwFs1IzhCbpIY9403HNyI1jfxNUYfh53DSNf/NBFV6uUN8Wu2jG4oUI5kT59DXhbIq8vlFewKuPe4vHujnfX2/ai4E3kjG5s9DDL7cn16YfvI+YggYzUPUsn2n5lHvlgnxCeuEaE3lrQGmskqrWgwFJMZj4eh4DjH6kal8Fo18LsFfJ5vakQ4fjHHq1GT0tEsdzRR7+ZR/9rtTmOff2NLCa7sQcTrh5Ywj78/rSrDPCucrgjfQJnYda9w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e427f9d-8c05-414c-b59f-08def27902ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 22:37:48.6925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omCJIfRmwdtaLjIo0y0/h5NidJKLyTvfVk1tpJ8gnCoboVffuz5tRfUs8C20X/t/rwJ0Gh39PvvtIIVh3IBTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695
X-Proofpoint-GUID: AM58ILWUSFB3uWcWUpXed13Ru0Wu6XcG
X-Proofpoint-ORIG-GUID: AM58ILWUSFB3uWcWUpXed13Ru0Wu6XcG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE4MyBTYWx0ZWRfX9ADIyq2f485e
 VR362n6uC+h7UtA158Kh/j9A9+618Dn8RtahOTmW+iBgAphPTuQNse864tbKWjKhklqp3Yd9xhj
 yISwNmsz2X/7MUjJ746EXvTssE9v7Fo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE4MyBTYWx0ZWRfX66XpDED3SQK8
 CeVhi21b3pn9h60RsKor1LuT3YdYNQJQ2tWZLpDNBD91yPN09h3JpiZppZxBdbyxWBfOuUCpZ11
 /+2bYO7I/aUfV43g6j7VLkXha7+HAjBhlEy1B6kFKhB1pvyrM6nudpWqwPrG8pan9FpVMJIO0i3
 HtfXupO4fqxtGdKY2AR42H3sg2AlocS63SGqzXGhyWg8KPHQg+/LFSIqjQTBseh1BMIYAS/jILa
 G07qvpaxJfxEc3iPzgRiY8WMeCPQKmOOXtu9OhwOlWc2oi57Zt59j4DnI7JD4KGn/+6sAp7yI4d
 4f02FVel0aTKkbxjiaWj8EDPtQHy9oX5AmJB0xb82kNCs9RBlIDTtp7oDylxq62VDdTMdyXkg/E
 cH70r61TLRgO4Xinsl2L60geb95hyx919lbmfZkveoytDOF01G0x0anXGQGJIkt9loyY79/7jhs
 voVSbDHXJsN1eqD94pg==
X-Authority-Analysis: v=2.4 cv=DvxmPm/+ c=1 sm=1 tr=0 ts=6a7269c3 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=jsX-pZOY9Sv23e2XZTcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040183

T24gRnJpLCBKdWwgMzEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDcvMzEvMjYg
MTI6MzQgUE0sIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+ID4gT24gNy8yOC8yNiAxMTo0NCwgS29u
cmFkIER5YmNpbyB3cm90ZToNCj4gPj4gT24gNy8yMy8yNiAxMjo1NyBBTSwgVGhpbmggTmd1eWVu
IHdyb3RlOg0KPiA+Pj4gT24gV2VkLCBKdWwgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6
DQo+ID4+Pj4gRnJvbTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0u
Y29tPg0KPiA+Pj4+DQo+ID4+Pj4gQ3VycmVudGx5LCB0aGUgb25seSB3YXkgZm9yIHRoZSBVU0Ig
Y29yZSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgbGluaw0KPiA+Pj4+IGlzIG5hdGl2ZSBvciB0
dW5uZWxlZCBpcyB2aWEgYW4gSW50ZWwgdmVuZG9yLXNwZWNpZmljIEV4dGVuZGVkDQo+ID4+Pj4g
Q2FwYWJpbGl0eS4NCj4gPj4NCj4gPj4gWy4uLl0NCj4gPj4NCj4gPj4+PiAtwqDCoMKgIC8qIERv
bid0IHRyeSBhbmQgcHJvYmUgdGhpcyBjYXBhYmlsaXR5IGZvciBub24tSW50ZWwgaG9zdHMgKi8N
Cj4gPj4+PiArwqDCoMKgIC8qIFByZWZlciB0aGUgWEhDSSB2MS4yIGV4dF9jYXAgaWYgYWR2ZXJ0
aXNlZCAqLw0KPiA+Pj4+ICvCoMKgwqAgb2Zmc2V0ID0geGhjaV9maW5kX25leHRfZXh0X2NhcChi
YXNlLCAwLCBYSENJX0VYVF9DQVBTX1VTQjNfVFVOTkVMSU5HKTsNCj4gPj4+PiArwqDCoMKgIGlm
IChvZmZzZXQpIHsNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCEocmVhZGwoYmFzZSArIG9m
ZnNldCkgJiBYSENJX1VTQjNfVFVOTkVMSU5HX1NVUFBPUlRFRCkpDQo+ID4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIFVTQl9MSU5LX05BVElWRTsNCj4gPj4+DQo+ID4+PiBTZWNv
bmQsIGRvbid0IHJldHVybiBlYXJseSBoZXJlLiBDaGVjayBpZiBYSENJX0VYVF9DQVBTX1VTQjNf
VFVOTkVMSU5HDQo+ID4+PiBwcmVzZW50IGFuZCBzdXBwb3J0ZWQ6DQo+ID4+DQo+ID4+IFNvIGlm
IHRoZSBleHRjYXAgaXMgc3VwcG9ydGVkIGFuZCBleHBvc2VkLCBidXQgaXQgc2F5cyAidGhpcyBw
b3J0DQo+ID4+IGlzIG5vdCB0dW5uZWxpbmctY2FwYWJsZSIsIGNhbiB3ZSBub3QgdHJ1c3QgdGhh
dCBkYXRhPw0KPiA+IA0KPiA+IFRoZSBleHRjYXAgMTggYml0IG9ubHkgc3RhdGVzIGlmIHR1bm5l
bCBtb2RlIGJpdCByZXBvcnRpbmcgaW4gUE9SVFNDIGlzIHN1cHBvcnRlZCwgbm90IGlmDQo+ID4g
cG9ydCBpcyB0dW5uZWwgY2FwYWJsZS4NCj4gPiANCj4gPiBTdXBwb3J0aW5nIHR1bm5lbGluZyBh
bmQgZXhwb3NpbmcgZXh0ZW5kZWQgY2FwYWJpbGl0eSBJRCAxOCwgYnV0IG5vdCByZXBvcnRpbmcg
dHVubmVsaW5nIGluIFBPUlRTQw0KPiA+IHJlZ2lzdGVyIHdvdWxkIGJlIG9kZCwgYnV0IGR1ZSB0
byB0aGUgcGhyYXNpbmcgaXQgY291bGQgYmUgcG9zc2libGUuDQo+IA0KPiBZb3UncmUgcmlnaHQu
DQo+IA0KDQpHb29kIGNhdGNoLg0KDQpCUiwNClRoaW5o
