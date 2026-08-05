Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2222FF22;
	Wed,  5 Aug 2026 00:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891495; cv=fail; b=DHA6/EWIRPwgMhZzWpt2t0XXvAwhlV30zxnKmvuGQZB5ekiQOth0iYbT9WSgUX9HPy09Qo88Q7c/k6PnrxF4+qoKUzkvKjlG55J9If2dJB2FmIB+NYnRsyVfmgW+/K2+v78/gfz93stMKSbnAI5AtzhwYEC0XURcbbRu5RR2O4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891495; c=relaxed/simple;
	bh=s86rQPmdrlVnhSdRc+ohuBGyAJAlyvncTtPFI4iJgZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bwdoNyAnn4ZhJy3yYuhCsodtFj8IlFUazsGxIkkAZYh0zuC+D7sr0f+o5/U9Dps3PxYLzl6/a8MXbE7U4+CmYNWyg6pcCsmWhehiZTW6qD5A+cCluagZ82kOfIMcHlHOPZh9oYCK+wQ2ckC21nXqIqaA/SJD+lRcipQ4Nb0wJxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jWX/mmRT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZK/yvIQf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WIcqcArP reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jWX/mmRT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZK/yvIQf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WIcqcArP"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NIVuB1473418;
	Tue, 4 Aug 2026 17:58:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=s86rQPmdrlVnhSdRc+ohuBGyAJAlyvncTtPFI4iJgZ4=; b=
	jWX/mmRTRyEKxLdWA/2nkSlFC0KUZWtbDNIXsekV1z279djVN3ctRvdUSsE7GyoU
	D17mAldevLl0HKLISedBDgctUb7CnHz/G4rQu06ltOPo8UAlWYuo1HMuQlkrlwGq
	BOt4diBd+kiXsPLFCuSZtKRkl1H/Wh5p+FdyMYlgrBhHn6GE3fmOCWCmKkLeGRpW
	jEjQyqNot+bUh0jwUh0GGrg/LsHcdoyx4IBytkWQffzT61SDSWiVNwwA+gCZcbMm
	WngIHl5RCO7AAXmvthzJYMsidl5qyQ5lufKcjxEuEhiTIK7DvjfCQl0NxAkgqeyy
	LY/kyyiaMPC6yPNjBojjLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4fudg87je9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 17:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785891479; bh=s86rQPmdrlVnhSdRc+ohuBGyAJAlyvncTtPFI4iJgZ4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZK/yvIQf9zXP7h8ugJ8sItBTsWLPiKnwFUAy2jkW+mrUpuySvWwdsX9vcmlh2YL6A
	 EvVqXK0g5sgDcxnbqA7L3HpLslZdlvMBUmj2jG0bnqDHtLaYPDArOs0vro0knU+fB7
	 hj3oouVA2z8aeOEg5w/Es8NZW3pmIC4b9nzNLzKf0lkHtckQbAsjGxqVem8k7NzM3A
	 z1lDBf41Jj5sZCL5uSC5ovwexuI0br+u5nL76QCaNyVguqAmcsPwHhUnPtHQEDXCo8
	 ufqn5Ia4raWFurwtw/UDZbJcnqm/N6GLyxtNIw8Ajxo2gmrOu0JW5xQEB8PwJZwrcV
	 VWLJW7KEb/gNA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4A644013E;
	Wed,  5 Aug 2026 00:57:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B22C5A009A;
	Wed,  5 Aug 2026 00:57:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WIcqcArP;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00105.outbound.protection.outlook.com [40.93.10.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3F60B4019F;
	Wed,  5 Aug 2026 00:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW5/MoV3Qkal3E/uSBz9ZVoUqFEgxs9z6kCcf4DPKrbm8ezqLpoVY3PoQk9L78bdzHcUpoLjJ31sOd0lifY/Elw5R8sBPZ7stWdE7WvzAJf7T5K+UZJBMkiDzPGASVZfI486TD0tn8e85fSyYB9EK2uQWSJMVj69sqqoSWi6djoS+dgInTeoqVXFlKZbXKg3dT3HM0iw6nNoe9RgjagOM3IPhTr+Dc66Ed5hR1KUawDzM9Tmfa1gH/UZzsolvgvynvYH5GcXryAhypaoa+xpEyF5aWw3kMg43alkXCfGlTMIkMLQ4nD5/ZW1j1bNg15pPm/sG39vGW0AdPY7aaHL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s86rQPmdrlVnhSdRc+ohuBGyAJAlyvncTtPFI4iJgZ4=;
 b=dp08IQ7Q3IRf5ssJZmCWNfMDM9Y4wE3tB+ICFE+whOOiC+ZSiJrwgBMj8OchtqwC/JcQy0Zn9JXJcN8fbZTSjTB6BJ1C2fkAdczX4iAptZKgKIVRGBDiY11CWD57ybnNt3yQqZo5/NZkTeQZKjTrdsWGyPdqpCYPULKuykl4AThdbKcZTjlSKjrC1LYrBG47qKPcl5gGZPsIFVfrARE3t4s+ftDSGJaYKjS78/iFhlihpi2QlL/DiNCgQDc/5lme7Ni/pAqpnocKO4XESvIhR5oUeh2lV2pT1X5i4Aw++YbWM+8HdValt6TGmnrLk8C/RbabSGogeMCk8KK7zwaNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s86rQPmdrlVnhSdRc+ohuBGyAJAlyvncTtPFI4iJgZ4=;
 b=WIcqcArP5eO4s/MmWtmssMB8IxdCh8vpwrMtPuFRofn8CQlDllT5LTynz4PKKfgnn7vS6eOmW5rsUuauJV4KG9V+gDvZRhzhaRbNeKJpTGmoDUhxI0jH3TUiOHPWETnG4YfysrrEOJPJDlJKZZKgPC3+NeVtRcznAdBYsX+Ti8o=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 00:57:51 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 00:57:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
        Elson Serrao
	<elson.serrao@oss.qualcomm.com>
CC: Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 30 (usb/dwc3/)
Thread-Topic: linux-next: Tree for Jul 30 (usb/dwc3/)
Thread-Index: AQHdIHBwjWU92wG+MkiS0EyZPo6lEraOqgCA
Date: Wed, 5 Aug 2026 00:57:51 +0000
Message-ID: <anKJB0fmgBNEPdtK@vbox>
References: <amtnlbQl2KLongvo@sirena.org.uk>
 <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org>
In-Reply-To: <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH2PR12MB4197:EE_
x-ms-office365-filtering-correlation-id: 82058319-83bd-43e8-b08a-08def28c936f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 T14oIYh2y2ODz4fyNB4gbEiUuVGFWKZLzBAupwhjqJAyz0SmRBqduWN3Hif/ONThdtHmbbp8dBZ7okeLNC3jHR337q/p9LQUDnpg39o3PO2YSyiEllqLXbprMhDaKU68PIaVXJcgoCk3mkdBhil+cbdTPblRDCwM+LdUEstHGvOBXQojcIj0jzTwNRZj1MtVsk3DGPIA5gdvgdOC4rg938Bjo30cADTO1uUqjR98F1mq5OK7EaJ4mgVP5wjnQUpk4LtetEIeHH5GLbtg0AJebbHgGWVQGDRCD9P+/XjhNeJiD2hSRntXwUPiEpYpNJy9zuhLa3h25s89hL9HjPkXcIaA0KeBxFICCaqs17hnwGFivFocVZ2TTLUhcXB0mTUTbECMRKz16itUPA2Jok6FeU8+4kj5coz0wOQf4+HQ+V56vUBPi8D9XNhNdrRhuP4B8bfAnokQ3WIGQG0tclwp6s+8ABRdgsIKQyHJ9XzxsFTSuMQz0tIZRUeSsCNeXRMb3G5w+KFxFCy4FImyb9NIT364t2e7rSIim8lhSbHf7ZK066UqZttAp3k11cRjOpkXKaSlDBF9f3wC9HE0aNov1hRRuVk3/gMKGo8kS27guPt2FCzH8LRCTzoVeyMCvcvptfsClNC2ybpA+9lmE1Ymcixi+joWTlWUZAbOrYTV2/2MIzw7C21GoYLe5RiBlts1KCT3QUehkFNQbtm5Zq20q6ZHDBzU2YIfmE4TqVGcGjk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWwwdC8zY1JrODVUckJqOHVINk9oUG03cER3b0VnbkVacGsvb3ZlSURTMS9t?=
 =?utf-8?B?M0xPOXVVR0MxSDdobHhpRzBNMTh4a3I4cktKUDBmOTVxanJJYXhCRUZ4TWlW?=
 =?utf-8?B?bS9PRGxkb29wQ2MrTzVsYmhNT0VycWxlR2p3VlVWZFEyWExJMFlydVNUcUlh?=
 =?utf-8?B?THF1RUF1eHAxSW5DK1djKy9WdDVpN1VyUEd5YlhkRVZMdFp4QlFaNXp2SWd4?=
 =?utf-8?B?VlF1dFluREFRdm8vakllM2l3SU56NDhrM0t1N1hGb0Exa0M2cmJ1YnpSWGVB?=
 =?utf-8?B?U2hpNmtyVEZlRHJJdGJ4b0wyTFdxdkg1WGNRTkJFMEpRSGpJYUlNUmFGN2NJ?=
 =?utf-8?B?UFFLWDhwSFRzZW1JbXIyQU1vR1ZtTjZmaDRySDAxM1Rqa0Z6MTVxaElWaXRC?=
 =?utf-8?B?bkRIdFJCMlc5cExwaTFtQ0Z6czRFOXJlUWY0WFlNQlBrYzltOCtJTnVZMWF1?=
 =?utf-8?B?RGxOUnVyUy8wRkVaQ0pKSE1nU2Vzb2hBbTd1T0k3UEZRK0Y1U1d1VmVxTWJi?=
 =?utf-8?B?d2FTVlNEVXpZU3VYZGtBdzBucVYrN1BNVktrcllvRnB2UFJGbGVCNk8zRHMy?=
 =?utf-8?B?Y0FqWUZ1L1FxNzVRREs3RG9BVGpQaElwZzcrbWFVVjhXTFJPTUlmZW15YkJ6?=
 =?utf-8?B?OWJ0M0lHNkFxZVQ1MFFXY0dpalMrMlM3d09UekxsWVZsRUU4ZFROMTdub1JC?=
 =?utf-8?B?RitIWTZsQWJlV1JOZjZVbUIwSVFBOFZXQThhc1pYVzFkUGloRFFvVjdGa3Ra?=
 =?utf-8?B?Nm43QldxTWZ5NkUweUh2QjJGNkR2Z3ZLQldIRktPYVlFS2ExMmlvN01VWnI5?=
 =?utf-8?B?YWdYSzQ3aVNWeVc0RlJaZ2lsZnNBRmVyZ2NLR3NhRDdyTWpxUGVEN0J4dDIz?=
 =?utf-8?B?cEROQVBqNkk3b09NU2xEamVpWGkzK1BWWWF3UjhJcE44dDdNMGNzelRueVRD?=
 =?utf-8?B?L0dCZk1VQWRaKzAyeC84QUNxYloxTm5sZTNaSkEwbVlGWFBZQnREaGx4TjJy?=
 =?utf-8?B?eGIrV0tyWVZvbEZTWFNIeWIrdGJDNmJlWmNnd0FjNDFZOVBQdy82S3o0aVE5?=
 =?utf-8?B?a1BxcVlDWmREMUlGaEc2Q0lGQ2hTeitqZnRxMjdqakFqVDd2NWF4dXpoRkxU?=
 =?utf-8?B?b0RYZm1lNVlZOFplS0lscnczbnZnYmdFcG91Yit4MXRMNUFyTUZ2YmV4U3RF?=
 =?utf-8?B?dlhpbFFpeUNmNGk3bFNXYlIwejRHclBaR3N1MGxTUEp4SmxXdWo2bmhlQ0pW?=
 =?utf-8?B?UEtndXZqcTN5RE9VZnRwMzEvQm9kZit0dFE2OWxPeDZWeGExcm9mM2xsOUJS?=
 =?utf-8?B?WFNzZlhWY3FkenFXY2pJQ00wNWUwd0RKb3dpUkZzTFZCM0xOaGJiZFV4V1BN?=
 =?utf-8?B?Sm5lcUdyL0puS2h0d3oybkRVdEQ0N3RqeWxOdTBOYmw3ZVpYakQ2eG1Nb09L?=
 =?utf-8?B?UXZIeXdEbHEwN2lZd3hpTStEY0JOT0dzZTBwVEhuSDRxNXhqb0RrSTNndjMw?=
 =?utf-8?B?eUxpRUVYU2VCaWhZa2pSZml0Z3RYSkN1akh0bE5STVZ3VTN4a3Z1cVYraWRL?=
 =?utf-8?B?eE80cE1IWGRlVWg2bXlrd3V1QUprOTJrczNOcmFpbVJ1SzAxaXlGOThtL1Jv?=
 =?utf-8?B?OEhUS21oa1A5ZUFXNTB5ekJkVDhzOFVjUDdkOG0wU1d3MWJFRENMOXdwaG1l?=
 =?utf-8?B?VHFaYmdXcjNqUmxZdUtSMlBxQ3I0d3hEN2hVZnp5dzliQlNRdTNScXhjc3VB?=
 =?utf-8?B?ZGhEaDBIQ20weUMxTlVqcmpLRWMwU253OXVzaWVwTEp4S1QvV05meGF2dnpl?=
 =?utf-8?B?cXFVd0VmUlRMc0FrSW0vVzJpVGYxaHF4ZmtZYkI4M1dwVU44ZE8zeC94MXF4?=
 =?utf-8?B?S0JONzNrRzdjNHdhRUUvRjc3K0tjNzdmQ1oxTzBIR3FFbWEwY0tibVpuZ2Nm?=
 =?utf-8?B?R05vVkp6QXpQNk1ITzhVUEhPOHpjWFl1SGNOakwzSkFkT3dobE1yNjd5SXhV?=
 =?utf-8?B?RThyQ0wwcEdNL0tKVk13dEg5L1VnUXI2TUNxR3dsdVRvdllpRi9xVmhqbzV3?=
 =?utf-8?B?UFZBcjcyeGcyMXlFZEM1SHlSNnpja044SC9sV1lqYlpNTTZLUW1nNmg5WDBY?=
 =?utf-8?B?KysrSC9xWGNtR0VRZHpjV1BNbjlxOHpXK1FEVHVGMk5DYi9xakZHMmk5Z1pm?=
 =?utf-8?B?Sm82UWJhcFlqUk1ZaUU1S0ZoN1JXd0hudnVTak80SUtzVk9HMTVvYmIrY1Jt?=
 =?utf-8?B?ZGozZGoxRytHY2lDeHBsRjB1MHNWL3ZONmlGQXhCZVRFSWQyMmtoTzZ6MjNv?=
 =?utf-8?B?T29pQUF3OGwzSWE2YWFFM3AxU3pCejFoZVlwT1F0dms5RWxwTnljUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F277D179E4CF142B90D3CEA8C620B4E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OzflDkdn2L+L5zuW3lN/N+++Lccp367wGfQF1Bo9RZ0s58xfLFHW0a4EDA+C8i9fkgc05zn2EelbV+oYQTz89CzxMNdsXNEKBNyeJ4XT79xh78010fKPt3fHOMGEuXI4aOTV6cK+zAdM1ZwL1AGwtzIveZcU2ESHEGss4Qogz7DFwiz75IMa6imkVcAAVJFMVQqCKpmI5cOZH9zdt6BfvlUatgGkQG2ezzKuW0dVziYxAHlrD6Z/ncZOGDOk7p5mnLo7xE5VmoanQpCiXmQfUjrD4C46V6jQTmsAb3PKzYGwV0Si5PUdx8PaquMQPczZh3Ji/f60G3taAw1TqLBKwA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x9KlVssol466TJS+jzsJ9NtCLyA8h1Q6rTfvRoiERzW9dazhWv0nHVmszJQw4REsKPbjqWs2N0yE09J8euc15n7du7bj9WVeLiTiGikV677F5sdo61hs1bpytju3QSKUcU+Ikd41+PvHeBXqapnEIn8um3etpWTiaKwy9hYH4g+IA8gM0SiZOCztsAQZMknuSdncMNYmWc/oiseYi+gYtjaNgNrwwgjaZUBhuWScS8AUmeSereEGWsjwU1AUGLmNOj/uneDizR4Ys3V/+QwjFsbZF6+WGWOZgH5hdYK4WEvG0xf9ZrzWUaxgQ9gxStl19sD977LAWXrG33cgMljop2EBv1Q2XjN5/qCaI2YLB/IHhkSvH1CvlIcE6MonXfhdQRNsD9HNwjEZQn+w2SvT9Xp/XyStYeS367wRXg1ZtsFwy2iEt5BzFPLfSX7HXgrINxIwtEIPRD1Kz4tnK0UtTBTRQUTOASKhKFVmnqTFuRwt2adDs4UzJYzEjvMYAwEafzapOe0VrfpV1I9pHpnvqUHSVgg4BzOQzk/V9e22cE26TwmsQsI0iDSHpWb3hrMywIldj9ZGtkzcA17KkOyNlJ1zMc3/Zg1RyEI5rpYekd3gzKwuEhjdUQn2zmNi7qLZvCoTPgiBgAF3AQwCtoFlQA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82058319-83bd-43e8-b08a-08def28c936f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 00:57:51.5468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7w0ozhTGd9w3bbzlLur32qG2g7eC88l9zllfhI/fehChMYhVtEuGt82RZOe7BG87pxrbsVv7SEUh+NLKWp7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
X-Proofpoint-ORIG-GUID: 9W4SxvaT13wVtbvapPrR7rIlVSIf3dVg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwNCBTYWx0ZWRfX9E2oj44OC/JN
 T/8gzMGpRVs6IoFgjFfU27zJG3oSCDnRKk4ZxmWGEpK3v1J0f2845yOZc6P2HUGC7Jx3h59mDMr
 Y4ZgeZkcyfF6oO4ctgSqOnk/OU/6JuY=
X-Proofpoint-GUID: 9W4SxvaT13wVtbvapPrR7rIlVSIf3dVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwNCBTYWx0ZWRfXzNMntPUoo6Vh
 XSJ7hHfdpwtXmtJWo3WBln+G5I53fpu/sjE3fSbc5lpy7ZpRYTbiqnIS/4gGb9A5X9+qrub07Gi
 aMsxFdt3X0Mw3wpMtN0vTuFFPpPsSWn+6dKyeuzSzyKy2EfR1LjDqY5iEA3fjL7uUL8YXZXbEAb
 8q/WrdqkOYkaeX7+X4BoOGnsRXJq8I1YWkVfEySfy40dt38LJeBZnlHTGkIheyqWm3Rt1PmXuyn
 bf2aT9vtNoV7V5FWikAWd3Qxehlww+dbpECV2UseYIZGr2rZb47vip3jcW1xW5HX4084qNVH1KD
 m9Wlpu2UfvKDghCghSZDfbEU9fqQsnesXz9xipGvz9WQU4wrZRDMeeEVHuBg8Js4vyIgOS17LsV
 OMbnPIv8vGsCcoTwOX30YeaDuSJTTbYOIqizkd2GZ7zxRpWggfisB3vnaTfcpY+ukQOK2zobvQr
 h/54wFWJp+u1aWPdzUA==
X-Authority-Analysis: v=2.4 cv=PNk/P/qC c=1 sm=1 tr=0 ts=6a728a98 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=u2KMTCTlG1pwL3AFctIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050004

T24gVGh1LCBKdWwgMzAsIDIwMjYsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gDQo+IA0KPiBPbiA3
LzMwLzI2IDg6MDIgQU0sIE1hcmsgQnJvd24gd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiA+IA0KPiA+
IENoYW5nZXMgc2luY2UgMjAyNjA3Mjk6DQo+ID4gDQo+IA0KPiBvbiB4ODZfNjQ6DQo+IHdoZW4g
IyBDT05GSUdfUE9XRVJfU1VQUExZIGlzIG5vdCBzZXQNCj4gDQo+IEVSUk9SOiBtb2Rwb3N0OiAi
cG93ZXJfc3VwcGx5X3VucmVnX25vdGlmaWVyIiBbZHJpdmVycy91c2IvZHdjMy9kd2MzLmtvXSB1
bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAicG93ZXJfc3VwcGx5X3JlZ19ub3RpZmllciIg
W2RyaXZlcnMvdXNiL2R3YzMvZHdjMy5rb10gdW5kZWZpbmVkIQ0KPiANCj4gDQoNClRoYW5rIHlv
dSBmb3IgdGhlIHJlcG9ydC4NCg0KSGkgRWxzb24sDQoNCkNhbiB5b3UgaGVscCByZXZpZXcgaWYg
dGhpcyBpcyByZWxhdGVkIHRvIHlvdXIgcmVjZW50IHVwZGF0ZToNCjdjODdlZjI3YWY3OSAoInVz
YjogZHdjMzogYXZvaWQgcHJvYmUgZGVmZXJyYWwgd2hlbiBVU0IgcG93ZXIgc3VwcGx5IGlzIG5v
dCBhdmFpbGFibGUiKQ0KDQpUaGFua3MsDQpUaGluaA==
