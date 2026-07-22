Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51362233954;
	Wed, 22 Jul 2026 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761298; cv=fail; b=lGh57+DeFsbYeGDBKlAX/TRmgsVSQEKOe/usN+3ubRnj/QRjFnXvLfzWfX5ZxQYQOUKMFJyqE/qBxKCMx9XZcW35DG9TttOgcJhaEyHagx4KhKyJ5zckVuqmb310cUAYItFyoVyhp2IjeUA/Cvn9nsq7vXZQVkjoY6aEXOkyF3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761298; c=relaxed/simple;
	bh=Xf9/rFW/7J5Z4LYb404ZIiMSU6nc6DOIUbTA+vVMyZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hTQpV3TktOFUVuYl0neZ6bxWzOHSgPHZ1gsF4poH3F0vMKZbx5CdckKwsMf21ijNqvutAAa/OrMbFcSBJ4oV95cNENS9pjr+cSpyh+NB9TxOuZB8wTni5PbkQqExvPhvUoB9ATuI0IeDzXG3CFhGTxevijdQ8Pp22XtS3NTe66Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WNPVHsR2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=D44ToK5R; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=m6C50I5V reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WNPVHsR2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D44ToK5R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m6C50I5V"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMEmDY2009928;
	Wed, 22 Jul 2026 16:01:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Xf9/rFW/7J5Z4LYb404ZIiMSU6nc6DOIUbTA+vVMyZ8=; b=
	WNPVHsR2Si/eoq0ZS6tvXzR4ubwqwZ721ST/hYw4U60MMq0Cxqk5ws6QGDWmC1K8
	U8MK/Z6U4Howdn0SsU5XEmE+eVkmwzBPGQwHa1uWgs40fDaJoAGSLv7UzMmTCyrN
	Wc/awWA8WYCbQkJsgy+8aLEziWHQ1RDEzEpVAGQKtXkD/xernaUaXo6BzmRRgWuu
	EHGc0xKd8AcEbSet89tZqyTQrh09IWbrboZEDmU7MloBOPfDg30vmXHbO1zpHVdB
	yGJezqHOzCmYreWf2hk2JqoVEP89zEHx5Fv6e/+nwYIQPS5RH9Ond0decJaqFWeC
	AhmPhuI72k/gZpWdHFoXNw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fk0eh3xfs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 16:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784761291; bh=Xf9/rFW/7J5Z4LYb404ZIiMSU6nc6DOIUbTA+vVMyZ8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=D44ToK5Rh9ty8coVr/16cE8mK1G0V8dwidViqxcZnvQTT0Oyi/6mrAvZxddmYCTGy
	 CIXP5WfgLs9oNfHqvUyIm1r4zUMRQ/rsOl5CLQh0eqPL+VjIK1wQSgydJsLLXxzYQc
	 iqD60T4JdsroR7bAKgBxNduwLbkMx1o7Ctf5la0cMYWwSDfzH0bIHBRLZbG8aOsKhM
	 oa5Su8J2bngqf2R/GsdTplfy4JYOCHX09/10IrjcVSe1oUNJ4UOUD6cG7nf7ss6W+X
	 p+T/EsYIdMTvhGtEZ6fKvp77NNml/wa51GKY3rTWR7pcRcF1lMXSCTJkwG9vX9p12O
	 BJao0MAooUExg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2CD8D4011D;
	Wed, 22 Jul 2026 23:01:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C3542A00BB;
	Wed, 22 Jul 2026 23:01:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m6C50I5V;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6BCBE40613;
	Wed, 22 Jul 2026 23:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq98pY4lg4tju4/GVj7UVrrrIm3Gj4WmpWWHzDsaNmoLYvT3zX9TZ2/+UAI5eq+6tolp5usQxLd+q/gSaIznaJvaSWm3G5S+NbtrtosdRb/Xm7irOMthoZHx78wmn3EkcleyOIk7Mi9JdEnao22Gakj1oVFSJNS4M4v1Jp6uCHq4oDYGRCY/xQd/6hezH6HSJ7prhHwSnWExJgtqK090Ub+XIjfvcH9k0RK+5e8KyZuo5BjEslYdAIIgzd7J+mGu6GAcCybq3KEnnJ1lGyasEUzO2jZWv39/jO7+FwhBWizA2mDFoR3Tf68JB8wYa32Nsqwv08QnnwzTZRNYbJxKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf9/rFW/7J5Z4LYb404ZIiMSU6nc6DOIUbTA+vVMyZ8=;
 b=oZ6xGO2tIV0tggIFxA2xZXCm2uU8eJuu5wQTT3BNXfChzSuFiisvsBKwcqpzoRmtSTDR6KlO1i6vjgkpwRnTRoWI4FS5HRf39gqiG/2kb1F89t6+CJcdUJQ1mT8Jmf/GdNcoUfHip8zysMOYjbg9NO5J/lTuDlK46RAY6SbmtA6prwk4xNro1vF13rf+mmzjbkTz/6Afms64nE03bFPTq7U//EnVW1bbStDaQ9BHmoW2T81WgusTcKvZ2mKnUANy9GPXJNM7C5cLpfUAC4PNrB28uIyXoZYgyZ7mXHVolg5nYzhyAQE8FoQ+CjjUjGx6wCrj6EtpuflCHuaKGaka9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf9/rFW/7J5Z4LYb404ZIiMSU6nc6DOIUbTA+vVMyZ8=;
 b=m6C50I5VyhADlsVerH82314WRcxFYEVMYagGKvMf1VUb3royPfTkaAk5mgFy4Otwn/Sd98Ou/FwzeSTAoLs/jkwZoG+SrJb8XXxpeUuuengj5exMgnX+Ln48Z0sjiwAeiVmWFMC24MA0Sd4xqS7ROkjymwMGyENZeDDsGRdX+Cs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 23:01:26 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 23:01:26 +0000
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
Subject: Re: [PATCH v2 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH v2 4/4] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index: AQHdFFWhehUDO3fMj0Wxe+ANTzdAKbZ6MyiA
Date: Wed, 22 Jul 2026 23:01:26 +0000
Message-ID: <amFK22a84gjloPKC@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-4-026487a08119@oss.qualcomm.com>
In-Reply-To:
 <20260715-topic-dwc3_tunneling_state-v2-4-026487a08119@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA4PR12MB9811:EE_
x-ms-office365-filtering-correlation-id: 1974c6df-bff9-4990-8792-08dee845286a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 58wwtnjPknKLAt82hrliuwgMmctnpZCcHIddog9hETApmJ4ak8vBM7wtNMhsU5202VL4kXqkadZ+yv7DU8SX/rPBXyseHF7bixNo1SOQpJAi6Ab0C7xpnH101E8zhPzvw6sB5E+yvzkUUcMwSmYHz/D4xV1yHrnc8fLIlUVmBG8FAFVj1h28oxD59ySx19KJd83WQjbvvsO0jO1pyXMCWPVpS5U3rppqvf4ND7MaNNkREafIwER9NJUe0xKTVfR30fTucl0V6DngVNJc8HCbgzlOUXW3dPPAGSNOxh4s0M/9YztDizzAif8+M2CaV2EZIehgrtvAp7nV5m0i+7fWJMuvYxgumE7GM4UvV4zzHfkrFpDoz3JultpxEaHxq3sy6MD2bNBNTNo2WlN52w7HP8JjitFsjiE1b+Kz9/Sged/eoHHyksQ75iNf1az/N+uO82GudRI7pIZUUX9entKLvbyaeLdcV1VtS9tm0mXICcefDEbWKTR1XwWlonqrF2UZKP545YHsVDwCZ09xIbADZtHK7etn8ut5j3A1rRFY/uZWtJgdTKbDGaJOcYQ3ODFhvjJCQQ6qywCnrKcCpPOuszLsFYh5WTyFLvaw/iwvX7fELgZ6zP+n0a6Ywa26/y+8jzoUqLqeHoHyWi8wSGowgfucDzSj3TEKXc13nPg5ago0er+6OQvJYmqrDGHWYZGQNv/szKEMSmdhxc2RPbDFmTv0lgQy8ZP3D5RHnMGre4k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTk1WExJbW1qODdSbHNlOGF3aFJORFYrcnpiUWJnemc1akowcVluR0JHWlVL?=
 =?utf-8?B?VXRSSWRSVEp1eXJjZm1BUXYwdi9ibStyZ29nZVRMM3JUN0tEVENRZmF6ZlJS?=
 =?utf-8?B?TDJDTm85SXN0NlJFbDVmNnNoczVZQWthWjdhYWRlMFdycXRqQUVWR0w5Rlc2?=
 =?utf-8?B?SDVCanFSZEZ5aEtjeThTakxQUm4wSlBuWDJkaWVna0VXc3JCV09hN0tOZFNL?=
 =?utf-8?B?NWNlczNqTFhnRVZQMkFIS1g3VG9kVk43cnZrcnhab3hET3lGL1N0VndqL1hn?=
 =?utf-8?B?UmhYOUFQUm1NTThrWkRPVWtqanpaNHVpbmZ1WnBmRFcrOGo2c0hOV1FtVnVT?=
 =?utf-8?B?TlRqMVRLdkt1bHN5MFRpRHJpOStWeGh6Mmw3YXBTMXR2WDhJYzM5Q3RmZHlB?=
 =?utf-8?B?d2ZUSDI0UlB2ckR4QWpScXNQajV4eko0YjlyRnF5S242Z05HVmpnd3Z4NWU1?=
 =?utf-8?B?SWlKSEJYRS9FajlFT2w0cnFUZml4d0VROUd1VmxXbFIxTURHUG51bUJ4QjRY?=
 =?utf-8?B?cE4wOVRTRDNoR2Uzd0V3eEZQUnB1TUl1Ukt3OFRCeXFFdGNWK2NYckdrRjN5?=
 =?utf-8?B?VXdVTzJzMzB3TmxYZzlPNHJaVGtHZGNzMnF5ZS9maHpCMFM2WFpySXA1dERi?=
 =?utf-8?B?dDBaOHc5QTN0M2haMWdndnMzRmo2azlpSnFJdXU3NTJzZmtWaXY0bTVYOEdt?=
 =?utf-8?B?bUZyY0JoeEszQndiaSs1Vm9mK0JTdE53YUdOUldmZjhtQm9tYVh3cHFaeDVl?=
 =?utf-8?B?VUJqR0tRNVA3Y2dudmpiS2Y3NUFNdUo1T28vQlBBYkpZSmYvRDJvcUxHY2V4?=
 =?utf-8?B?NExnSWJweDIrenFvdHl6d3VtT1RKMEtIVWFlNk1lOTF0VVY2TnlMSnpUMlpo?=
 =?utf-8?B?UUMyOEp5NlZEUXd5Tjd2TWREKy9QVldSNDN3S1pmUHpoVXZGWkR1T1BnU0Fn?=
 =?utf-8?B?UHh6U3p6SDFxQnIyeE85VmpscEpIV05tbHFKS29lVTFwVm80TDRzZ3dwNFZm?=
 =?utf-8?B?NkJwdWIvcDhVRWF4bHp4ajBIM04ySnRkUDVKTEViWFc4YWZLa2FHUW1Zb1da?=
 =?utf-8?B?cFowYzI0WUFScWw0cHh2eitaVS9UanIxdTBVSUxNeUdHSmtndEs4eUl1K2t0?=
 =?utf-8?B?WlNqR0dKK0g1S0ZrcnNUSnFhanBPb29iRDdmRGVYL015MEhjQ09CYit3ZHlm?=
 =?utf-8?B?VEhwMW9wZjhxd2JIMkJibTdEM0l1cm9YdTFyYmszYmtrVDJ0eWhsVVo0RHZq?=
 =?utf-8?B?ZFg2RXQreHFxQUR0S3NaMnVObWhrRk5mQVJGdCtpMWVoVWhPYUhqcEM3eHRG?=
 =?utf-8?B?OHB2UUJlQ1ltYW4yNm9ZY0FGZ0xhNjUrNnZzRVJsTFdDL3ZjVHhSVnY3Mk5l?=
 =?utf-8?B?NnBPVHhlUWl4NDhTay80WUw1eGxLMVFPcnErR1FQQmsxOEhBZDZCNGtLZ2VC?=
 =?utf-8?B?bXk2SVh1SVVsK01xK25yTUhwRTNaQlJmQU82MFF5dm12eklORVUxdkplaE5Z?=
 =?utf-8?B?S0pEdmNxZHNVcStKTlR2aUpZdVVIaGpHdGtqaVpYMUlQeHZ3NTNDa1RWR0V3?=
 =?utf-8?B?ZjUzNWsrUWtxNFF6WFBIbHF2REpRUFlHY0w5SkZYTUhXNTRxdGd4VEFXSmJT?=
 =?utf-8?B?SVA1N3FBU0hQcjFhcnZGM2dGQmdBUUVvazYrakpxZkM0UlNoS1NjM0ZDK096?=
 =?utf-8?B?bllmeHVrMTRyRGZkUmRtRWdhNXRhdDlhRUlpVnFHWkhwTGtZbnlFTXRJNC9L?=
 =?utf-8?B?eDRnQ1RjNU0vQ2NaWEpOaGI1ajZwVWptNmsxS1VKM0NSaEU2aHovN2pCNndZ?=
 =?utf-8?B?dHFOZHZiRW93VVdVY1BnTE5QV21WRWhQYk9TVm5CRUt6OFFqL0hGL0x3czI1?=
 =?utf-8?B?c3BZN2FTYXJ0dkI4QWV0eElFMnY0UGZVTE1QYllod0lnQ3RqYXlPNGxZRGda?=
 =?utf-8?B?eXF2eFY3bFFUNzkrd1RyTk1IZ0Z6Qkxibm5vWlBkZE1hTG8rZGFTWk1NSGM0?=
 =?utf-8?B?MEVjN1l2QnBUYU5sSHB3ajBIeWtBTzNVUHJTb3pLekNmRC9BRVZBRXRYMjN1?=
 =?utf-8?B?aUdpUk56MHZ1U2tMQVRrcStqTEIrcGFYa0MwZU5GV1VNT1hIUndSNHg1NG5i?=
 =?utf-8?B?czBNSS9lMm5xYVMwNDF2Rzd4VDZqa2JGa1BzWVUySFBlSTM4UEd5UThHWTFI?=
 =?utf-8?B?T1JUMWd1MWZGTDZEemdldEg2dVhSOHZ0TnVwNHBnK0tKaWJWOU5aOXE2SkNB?=
 =?utf-8?B?TlVQOENiUXg4Uit5ZC9STmRtSnA5T3pweFdnQUlDSWY5SEVMZ3BBVVlDWkZB?=
 =?utf-8?B?YzZpM0NjQ0M0R1lJYUlYZU5RZDNVNkQ0a0x4Z3hVa0RLTkd4bVdwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BF372FC1016354CAF48AD27F85FA6F2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CAQ0Uqp3s7Z+Gj9BrY0dK/ap94XbtdmG5zB7d/0viR1nrbjH6A9ZXLuiONKA7W2ip+AKMfciRK2Jj3p36jYXebB6x/AXxb3CDjzW0t/aCwJwktIp3HwJ84BPZsPqqOqccKWVEaRhrMhc/ui29qf7w25DwYuG2/cI+52MRRSKFofiQchUQH16kOy12gJOOKOXm8SgbrQlOQZBFoHan9exyXReLSXIRR4n+Pf4L9H+G9sDtxBtqgXzhEwEFV/rRo9lARyA35EOFFKs23e8jm1tfGL+MHu7JL/oxJBmZRaia9Cd27YcrVToRHwQMDCHeABY5y1omQNY2CbLW3Mq+hP9jw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xqt8aFGLfHqA+uNYgDsjUtQEANljn64ju4ZftX1K9k+hi6FmFFaSJZ3ZvVquSK0+j3sArf6/vVW1A92ThjHpYTQz3QI6H9cd+YcvEN7rZy/wH/OtulPfj+oiMT+PQ3P4ryHuemWpTlIuZa8Zr1D5UwnbxP7zYqbNpqsIeT9c8VWfBVDLrWu8QjVwmzbmgLfG9Khk80CbzwcR84Kvty4pqtV1Mw7UzyIJJN3LUMs2GYiMOp/zoP/GIiTWVPZEFtOFh7Vn5aKGKe2jB3NTo2c/4AZLyyqdMwfbh9yFy+FYEAyXjmYMdrJHBwP4mUYGBKG7FkNx/ht+qo8AkvGBn1XXdEldd9HykuX3prmiWjRAKVU62QvcHdjKC45ahXoa3RZy1gl9RPpmyMdwCofZHiw1id3pglNY/ykyWEWeost1CZmpVM2tZdfGQoeZkQABW93QSTLblqMgR5ToVtwV+y9cdR8NpsoF3DbLav/AigxB4OkJjBwCaBCVnokyiwE1Wdt10gYwmQjZwi/WDLbmJv3nuWyS4WjP8cm6VSwHnkiiFohznZMbEDhZcwOq0dTY77L9CoQZDmW3dqTAebVA3Ugj6fM2p6CEWBaZKpxm7kJqZmiEVPUIXsAqrXUv0Ae8uSLhFzI96S3RjmlmjpmbOx/QhQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1974c6df-bff9-4990-8792-08dee845286a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 23:01:26.1170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBfXWO4A7Mbmp/GxKC7CX87nEiQlYJhFEEJTFeVtfljQQ9WY6c23gD+5TM7jSFQXYNF8L3Y6KosNwuZj4Eod/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIyNyBTYWx0ZWRfXybr6y/b9Irbx
 9kOyzGX5kkYhl3JNC35SCckxoc37zNhUfJIEgm2U4J0xUj0JamQBSZzcbx0sRjZ3G1hymZ+Vz+N
 UM/li/e3ra5e0P+YuPFM2i8xXMuldSNqZWAbft4osxriDsBt0WJZXiqVPKGrQegZ2TlEQU2wI5k
 E90BOGXB92tdtAVJnvNZzgvNi87PHFkisLQ1kIc8g4ujRqBSyxf/WrNbK1PtJplM5V5AbantLar
 8/m7t964mvzc+Y8bQilu9e5cXEkbhDcgKqhXLZP4rHLMCWwt6e32Q6+B5WIG7jHdmkU9ycqs+1i
 zaIcHMv5ZWEfMPrm5b3lAM745P+rdbCmFUi7SluLpA+T8gfsdTDtIolsi0Jako/JP2uHYU+KdIZ
 aRs2FN4u1IE9x9yMxtqvlC2P31bIbP7vG/wdftS+cDBTygNJhBiF3mwWKKrEPUyFyU89Go/Uy8C
 Kn03Il3H6pouyWItHrw==
X-Authority-Analysis: v=2.4 cv=FKErAeos c=1 sm=1 tr=0 ts=6a614bcb cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=EUspDBNiAAAA:8 a=soiN2gxJUTUeuFZKkfAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nqUm2MLeYOWCQdDh10XIbg2DhuGL3u7G
X-Proofpoint-ORIG-GUID: nqUm2MLeYOWCQdDh10XIbg2DhuGL3u7G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIyNyBTYWx0ZWRfX/+7EndUYZML4
 lHt58GEiC/2B2000Y+pHN5krG/MCbo6MaxqYiGZg/6ZNBHUsuEvXYLE18W5dGOnz/+xnpJjDvzG
 j9D5H6sk5Qwn0hBsDtlwxsCK2CEM2aE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607220227

T24gV2VkLCBKdWwgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEgY29u
bmVjdGlvbiBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+IA0KPiBBZGQgdGhlIGxvZ2ljIHRvIGhh
bmRsZSB0aGF0IGZvciBEV0MzIGNvbnRyb2xsZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29u
cmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91
c2IvZHdjMy9jb3JlLmggfCAxOCArKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3
YzMvaG9zdC5jIHwgMTIgKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGZkNWMyY2QzNmM1OS4uNmVlNmZjZTRjOTI3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTYyLDYgKzE2MiwyMiBAQCB2b2lkIGR3YzNfc2V0X3By
dGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgYm9vbCBpZ25vcmVfc3VzcGh5KQ0KPiAg
fQ0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19zZXRfcHJ0Y2FwKTsNCj4gIA0KPiArZW51bSB1
c2JfbGlua190dW5uZWxfbW9kZSBkd2MzX2xpbmtfdHVubmVsX21vZGUoc3RydWN0IGR3YzMgKmR3
YywgdTggcG9ydCkNCj4gK3sNCj4gKwkvKiBQcmlvciB2ZXJzaW9ucyBoYWQgbm8gQ0lPIHN1cHBv
cnQgKi8NCj4gKwlpZiAoIURXQzNfVkVSX0lTX1dJVEhJTihEV0MzMSwgMTkxQSwgQU5ZKSkNCj4g
KwkJcmV0dXJuIFVTQl9MSU5LX05BVElWRTsNCg0KUmVmZXIgb24gdGhlIGZlZWRiYWNrIGZyb20g
dGhlIG90aGVyIHBhdGNoZXMsIHRoaXMgc2hvdWxkIHJldHVybg0KVVNCX0xJTktfVU5LTk9XTiBp
bnN0ZWFkLg0KDQo+ICsNCj4gKwkvKiBOb3QgYWxsIERXQzMgaW5zdGFuY2VzIGhhdmUgQ0lPIEhX
LCB0cnVzdCB0aGUgcGxhdGZvcm0gZmlybXdhcmUgKi8NCj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0
eV9wcmVzZW50KGR3Yy0+ZGV2LCAidXNiNC1ob3N0LWludGVyZmFjZSIpKQ0KPiArCQlyZXR1cm4g
VVNCX0xJTktfTkFUSVZFOw0KDQpTYW1lIGhlcmUuDQoNCj4gKw0KPiArCWlmIChkd2MzX3JlYWRs
KGR3YywgRFdDM19DSU9DVFJMKHBvcnQpKSAmIERXQzNfQ0lPQ1RSTF9DSU9fRU4pDQo+ICsJCXJl
dHVybiBVU0JfTElOS19UVU5ORUxFRDsNCj4gKw0KPiArCXJldHVybiBVU0JfTElOS19OQVRJVkU7
DQo+ICt9DQo+ICsNCg0KVGhhbmtzLA0KVGhpbmg=
