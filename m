Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B281862;
	Wed, 26 Aug 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787703195; cv=fail; b=R1YgP2qbB71U4CVAoL3st+AexAmEPS9T2cyTVXkOdrAtmq6GMKUwELxFFCBVfl1691fKjIizpkUb7v9HyOhZFYZPFWyU/wbfNkFdcOeK0hNLbUCenBTiMugn0hJm8MeXI+o0IEaL/DhYfvce4cG5yWjNGRJl4zysNxy/ihX07MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787703195; c=relaxed/simple;
	bh=WuykSmvRhxLq/8fXwEhuivbFCCW5Y5KMOVLUC61hpnw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cVDYjxOK+r1nCbEYeTaUXxl8Md0vYKNlxp0kdpZvW/HPf7b8c+5LCuw6KcmEARh41mmMGLiaPxXAdaERRCj5G3MSAEu3UQ9qvJKnVNg88FzvYkOYjHrrM3iBKCA730znWgGvtHNSjx4EbSJKxLCX4fIqoYMF527hMW6twp6DrYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kQfWg7YA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mQxvylvQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NLecypAl reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kQfWg7YA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mQxvylvQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NLecypAl"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09Ksd2241977;
	Tue, 25 Aug 2026 17:13:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WuykSmvRhxLq/8fXwEhuivbFCCW5Y5KMOVLUC61hpnw=; b=
	kQfWg7YAq9/0zhknr9sJSFEus8su3ZDqolXY4RZjiNVsZCf5MSVkkcWOWYAAeO4O
	sJXl228PntOOmzVMWvi7EIkhCvyzGq/7aZ24Crtfb8TFDbqwVgj8amdvyEtLIHpC
	0+IC9fJx15HsCvLhLkABuh+zMtwNIa8HZHawRkZJBOS7smKQP6t9Lfb8vVIjiWof
	rqAsqd6eIQA/yIkeHFcPYLcaoVWL8S9bSj026hV9arCDmOP82vWxzIozuyDCaZDl
	m/CG34p8TbifJ0KNocx820XFhryG50UyW0UZD6bWYHxaW359VROI30o2OBVQVHoQ
	5HjUf5VloKfYtlQJmKwX3w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4g9buyx8f5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787703184; bh=WuykSmvRhxLq/8fXwEhuivbFCCW5Y5KMOVLUC61hpnw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mQxvylvQ0ucDVDNvifD3EQVb9Bqkn41h0O+6gE/WCLMJWXTXrhp6JPydjr2qrSxFj
	 xynoobsSOKcir78HSyB9ni8KmflnTM3t872ZuQv3Lud6mC6D5sVskyD0nty+gG7Nbd
	 oq3I87GZz8eDWOGAVcBcmKw276Jim9L9Fht3AbDyPCt+CdNDn6FhoYK5vVE2llYYdX
	 kBbMHSuTOg6PXoZHmvBJ5yruhvsQduyw5hSgLoZcTperxw/+pz7qLwmJwHFmazJ2nw
	 Ubbnj2gairSKvI6zMBuND3BaRZRkTdNUnYxrxgnEvpTuwKySYDDmVL4ktEr3zCXMgs
	 qebDhQ5VWI8Vg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D4CD74017E;
	Wed, 26 Aug 2026 00:13:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 54943A0070;
	Wed, 26 Aug 2026 00:13:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NLecypAl;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 238D2220500;
	Wed, 26 Aug 2026 00:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0pQU8pKwuyKt7A4pDQYxNDzlKZOJ7Fk1ZApvcnJ2MXilVcclfXCdKNisdRl2svLEV3Ex2/7omGaFCt7hd8e4qjEiJNZazIC4y9N1vG2OMnOsTGHkK457rE6SjlNPlHlCM9aEyhJAdZv97bpQUv5yn1GuEPzZOqqB0RckxRPnlduOS5vx6q1tjKfjICDrms8snX30MVmtA0jPBFOQNWcXU6E0jL2klXy7ZTos4NHb0H6f7Jxf2P3TZ/VRBFFrCoeBBWrn/lB/ampuk8NFMX/JtVaTXjOSCF+nxhzJjfWkso/GhwZgEyhvywGSCsOnRDiJ6RnvXWbvW2CwHVpERC3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuykSmvRhxLq/8fXwEhuivbFCCW5Y5KMOVLUC61hpnw=;
 b=iZyiPC/9SV3eBhBBr1He4kAfYUnObdxGrLD/pECpR3N+bEqeQPSEU7ARd/DwpLP/RwTk1F638SDvvbebED0VboVLRQzaJjkv4qfUwLfP2XxpAsnU4eX3XInQK8rLu2/bIJ+2xeW1wb39SRRhu1LjFpPI56Ma6XK1iZ9bXIxXpugEqlKgkjWsTw/sLD7uEFRrmCJxhYuEqG2CuCBvfDGjM6IyFsa7LbOst4UqDFd/Ua1Cs6ZToGF5pqtF3tW5LT8IeLoly5CE3OocWipXx2xbBaEo6BqgMGuoSrUkNV3hzplEFPAL+hXNklhOHA38HejAbSdK5n27KfhVUsI55V6xPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuykSmvRhxLq/8fXwEhuivbFCCW5Y5KMOVLUC61hpnw=;
 b=NLecypAl0YcijPN96ePt+iU1rOnlO2/6qnNdJ8ERurdtSsl9SN9swrB8QWEKUjdzA0fCuj73yeDvC105EZoIkBj12Z7Namb6LQNnovKYS8D+zpTw0H7PVvd2pQajZFRscbmEFiOV3H/Dc5DtqjMG+W1gRhP8wkta8W97Wk8+0ns=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 00:12:56 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:12:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 3/5] usb: dwc3: xilinx: fix system suspend and resume PHY
 handling
Thread-Topic: [PATCH 3/5] usb: dwc3: xilinx: fix system suspend and resume PHY
 handling
Thread-Index: AQHdKPBrfUZRWSkw5U+7ueEN1gh60LavjWYA
Date: Wed, 26 Aug 2026 00:12:55 +0000
Message-ID: <ao4vUiCsjZ9oOpA9@vbox>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
 <20260810174713.2325292-4-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260810174713.2325292-4-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|LV9PR12MB9832:EE_
x-ms-office365-filtering-correlation-id: 2979c35c-a6e2-4024-24b7-08df0306c749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 Sak2FpS9urKNqqVjHMSw6q48DNi6Cp/bQYBU4ddUUOV6KiyWTR6ykTcClZFbtHP8FWSszVq4yxa+9YklmNQWeYJVPjSQT+zYik53gzJ7OPSa5autltR/PeDb8Du3jbHt5k9mnjWdl6yMB+wyFiWnYJHN8ZkzxpsnOnflivPlV29JFVltMnHEFTPFSPycbKP4wQ4i6fU6+R3pLeZEZ/NjPK0jjcJH6+iMGnWvt9LZfhgWT5NZCBMYCFOIeJIJoJDFGFl8LtlMx14tqHE/cfkm7odt81oqLX9WGPlUmdRk+CpjQugoVh/5zNcyVIXk7cP0j87+lmvvQWzLdhSdQcwRWKCkQX3zVsxD8DLz6svslHdVSyZYfde524twuZef9a0FpXLxq98lEHkS6FvMjYPDjSD+h5J/ev4PTNNETziWOuUmrbI0CFDlQVmo48WLrRUf3++kQXufyRT5JWyhb0APthIUmNXhfqewOMFRM6uMeFsRXMct6CYO/jgSaS+N9l/cN+fUijZwW1pIlcv/Zs/Q8N+d6EORoo8K8OlKjf6MEN5FqqQB0tI7gXkruL+uTZr+Oq5kM0WM0/P1wYOTsS249Iv/xFsDJfwyM7pcwNLO+T66rNttirU1ZTZ0XRSTXHfB7HtZKMrTdnbfMT2PJwSB5xaIAAWyj3F6YnlnUvIbSuOKmY+MzLlyvIImMyuooIkH/d3recs9Z9al/n9Yau7ocSzexTqw9dHMBaQDuEldxaU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U21URG9idUt0SUVBUjcrbFVIemhETVZzYmpCUXQyd0lTbmJkZVRTZERxeDQv?=
 =?utf-8?B?Z2xvWmpyWWkxaDNuN1h3SmhMcU9maWlSWEQwcmswNUhyakdvMklDZnlDWjJl?=
 =?utf-8?B?MG5QTGg3MjlzbFZVRVozV0VKS3Y4WHdnZDBkSDRWZUYwS0lYMVFQNTkrQVdu?=
 =?utf-8?B?K0cxUUdWcnUvUTZKdjNPdFp5SS81YlNHQ0JWTjJMbjVCb3dCYmY0NStEcFJ1?=
 =?utf-8?B?TFU4WjJJenBVQVFLQ2llYk5FYUxueVVpUTJNL3VKTU40TTRzMWRhVThCSzd6?=
 =?utf-8?B?TDRoQWpvWCtCcm51cEhkYjlUdUJVaUxLSThvRzJDMCs5akdkSVEzQndPOHVz?=
 =?utf-8?B?a3locXF0MkQxcklXb2M0YzcrOWRITzFvc0RadjByb3BFcCtqVjJkUGQ4R28r?=
 =?utf-8?B?S29pa21OQSt3MzM2YXYvWG9YUGFMbnI1emY1VENmUDdUMkpwcjJtL1pSVjFK?=
 =?utf-8?B?SWpzVlZ1Vy9kYlNqRERUK2tGSzB3bmhlQkdXVU83N3V3bXZVZ3NhcWtic1FR?=
 =?utf-8?B?d1RQWm8vOWZmbzdXakNkbWU3RUJaZEdRR0JUOGpia0JRQitwbGtjMkxLUTJq?=
 =?utf-8?B?aGRuZDhDd1MrVXFFWFZyT0xLWE5QdlVjNWQ4Q3N3Mlk2MGRwT0dSNnRtVE1Q?=
 =?utf-8?B?ajZidG5TTnl5TkpPRFN4Yjd3bjBtZ1hlODdXTVVaM01OU01TcDVFUXVsL0FC?=
 =?utf-8?B?cmh6OFBZZ21uVVV6ZjNvUmQ0dUMza1d2bGZFd0NrWkNGZXF6TGFWZXNKdGQ4?=
 =?utf-8?B?OGdFQmpuR1NrNzhLZHN6K0F2RmdOT2tXTmNrYWMxeG5veWhFM2hNdlZNOXhl?=
 =?utf-8?B?MDUxMWloMTBORXNQNGFqNlpicUZiM1NpQjFGQ3J3a2lkNmtEbVMxQnVBcVVF?=
 =?utf-8?B?bkZ5UXdpMkVaVlRSSmNCL0FUZzlmR0dWU2hkcnNDTW1KenEwcHVpdmo1SG5C?=
 =?utf-8?B?NFQ1WDhoTG9SdTNDVzN2T0tNaFRtT29RRFdmYTBjY3kvODJOaUg2MlBmYk1k?=
 =?utf-8?B?RWRlbXpzRHpJaHhBNTIrVU5mM2ZQNnBGVWcrN1ljNHpSTGhRSUFNVHl6VE94?=
 =?utf-8?B?UnVJcU1iS3E0M09DK3E2RjhxUWJtNjY2THBLVFZ5amVvMVo1bktlTjZJYlhh?=
 =?utf-8?B?Y2NIZDRwL2ptSFRxYmp4cFJMRTRVL21QV1NONFpPQkxzVFBERnJIbytxalU4?=
 =?utf-8?B?aUR0aTRnR3VSZ1JjVG1PYzNNWmhyNFZKc2RvdFU3TE1WZDNxWjc3d1ROTks3?=
 =?utf-8?B?TGhMTTRETXNzejhCaFdFS1R2TlByK2p0N205TEF5TzBaWmFvM3JpekdaK3dV?=
 =?utf-8?B?ODh5bXlHWWUvbXF5ZjVwM1Z6cm4xbkZMRjN4dXZEMWwxSFJWbVB4U2ZzVGZD?=
 =?utf-8?B?bUJYZXloVURXSjRsbm8rUXd5eU5oV05helNHOVlNRkRwVWNkbHBGaHBtczBj?=
 =?utf-8?B?bE1MM1FYeE1WSXlkNUhNUkxRUG9KMzk3aHU5cmViL3RjKzllai9OczFtWUor?=
 =?utf-8?B?eWRwZ1EwRStqKy9neGwvTE12a3JVeTlJYXpHV1hoU1pGR01qM1hYOTVpeGNO?=
 =?utf-8?B?RjBlc2d6WCtSWHpHUTNvd0NPRDFQUitxeUVaMmdneXAzQnNOWXEyd0RLUS9y?=
 =?utf-8?B?ZjNuajRkZGx3OHZQUUJmWlRwVVVUK1ZGVmJZeVl4bzQ0WXBUZzZsOVd3b1Rr?=
 =?utf-8?B?dTRwZDZGSVhQTk9pT2JuQXZZem5oK0tlMEQzcGFOSzRUbFJ2ZmJHNEUxejcx?=
 =?utf-8?B?NCtHR1BTNWZTMU5HdVA4Qjk1OXNWOHhMWG5DcGVUV0h2dmZqR1BoWHR4L1cw?=
 =?utf-8?B?THVES2xuZmJqVVkwS01WZlgzNFJ2YlhwTjVjbHRhTVYwOVJHUzUxM0VGVTkr?=
 =?utf-8?B?V2pUL05lRlY5YnU0R0ovQzJpSFJqWDMrblpKTDkwdzlpQjRqUjRJeWFKWG9E?=
 =?utf-8?B?ZWpyV0pBeU40akZyVjFJMHdsQkRQQVAxWEExRjVYSFVTNlV0L3NiRlE3Zkw5?=
 =?utf-8?B?ZmhyOVFKYnN4a2wzUXFLY0tNUzBBRnFsUzBneC8yQXA0cWVUNzUwaVdsbk5l?=
 =?utf-8?B?ZThyQ29icXZJdWo5cEYvQkd6NVBWbkhCVXJXaXA1VHpBVk1UbGhySUdPTXZN?=
 =?utf-8?B?S2Uyd3A1VjBZQ2k4d2UzUERGZ0I3bDBBZ3gvckx3TDZQU0piUDFWT3BteEhG?=
 =?utf-8?B?MWlBNWFyLys1NFlnUGtvdFVIWHF6UkVtVjF1VHRrTldhTmdnME03Q0lqS2Y0?=
 =?utf-8?B?N3F6S21iR2Zhd2ZtZVR4R3Z6dnhaajgzTEhIdHB2SGZJYUMyYWN6dEU5elkw?=
 =?utf-8?B?NEx2Wm5oY3U4YzRvMDVENjVRVHVFNDBwaTg4WkEvdk04bjhSTE5ZZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9764F762B99E644D9131FD25F7E0A0CE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	EBRI3ZxsLQZsOXRsC75r2Xi4yY8FLd0IZJyVz0UZxxT9FEwoUqdPrBDEYnMT2xBxgp/7hOiY2/crfs0nmwVMM6KlKs/0EdP38kRT4HPfSfmbvi6vQnghNCJudYUfRSrRPxeII7zP7t7qMtkmgTOcc48/FIgTmZSkew2dTrA2Su6c5NFR2fOKe7u1sGqhU6I1BUta/MNBxEarypTKeYxxj4u2j0B9WaWESojL6VeKJM826s6XtT397Rzalk+4cf3BjHFEzda8fgbkxvUi8eOwXSn9NK5Bh0EOxRmf5AkHwflm1nXrYYZtNHbAqQnyXfFQJE8ES3Fk2UJUunwhdu/uTA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0hN70X35zPOG3ASpcj/GlIz0aDqgSoJKkc8Gw7q9vZZhjfT2pBUJavy23iQaEl8+dLiMOcpa3EKvwpUOVZnhLaoBLgx4jNAPCFRhoz2T77O1fjnLvbD3MSypORRbyZZnWq3SbXMIgSqdZbylY2wxvZDfvQ4uOCxgxbEWq50zNv1Voxb/jC8u65KMPwCgtEX+mCkSYevUNqkWqVipuVsxi43z/K53505plfcT0H5rVb0Ru8S0CbEe/u5GlBbqlVYqUNZC+ftBvVn9UguODIP4JMBfP3hEfpzZoLkMOdDsqIXeKXdKiYGaMKsHIg0rQv3wZnBLPZ2L3jrlnp67krTiTocnLVJ63PqQAMdWkbsDnz7t2v+mi3HgY52TdojHvUKuIwNPmtlzTAGUVB7hs96fWH2IPkvROZTO4JS3kTHntegCplHsGN/NstHjFMInUeZ0WQd3Ub8qfHowK7b8SEYy2FUkCLzJC10PGOmdX4fVdaLAZ/ITLneRD0QHt/0tFWEtJLi8pnWCTubwNpJfesVKg6suiUOpW0nbdNH8FiUzWU7CqTV131fZO0a15OVNUI0n3NBIHnT2jWUmOZ5+RejEFVkxPTSKxL7eLWZIP/m1CZhgOeIkaCUmXZ1ucfqsqAWAKdebJtnRDO7dYl6mDdVnHA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2979c35c-a6e2-4024-24b7-08df0306c749
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:12:55.7847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfEgp6f38+zNz9Ywk9NyeEGvHFaTRNHYrf0S1FJB87BgsszE+NtzSXrFNLnUy6ODDxCralkG5cEWGWvQXab7Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
X-Proofpoint-GUID: G29pXNyERCPqoUe8Web7C1wVBcBKCHnl
X-Authority-Analysis: v=2.4 cv=euvvCIpX c=1 sm=1 tr=0 ts=6a8e2f91 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=zd2uoN0lAAAA:8 a=LCXRTY2cuyGu7DlhGkIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDIwNiBTYWx0ZWRfX+6PjcBIGYLmu
 lv6w86PA32ISDGgbBYZAWUDowqumXB95jqmS/S8qjI1uA6kbOGlxzpsNS8SmNq8ZkQo35ASUlMo
 jm4zAmcDaiDlveZilE0SfkR/OynFxHz7DKlV0UPfGd+s23OoTFlyeonGmYTMdsyXulVJVTyG/pA
 yt47cU+kmYdNeU7fLhxZWyFKoJA7c99GuPdHPxd+T3Q7EIUB1iUAbpbkyVgVAoxpextdkL798G6
 pzxigUMti/fi5ku2VtMlgueC9ymKif4VBWckOo5c2B+s90fOLaANg8k/zKKqQi5XYZ7TDqk50D1
 9OUmj+6ZQPXD0pqfsSnSUqauBN4RgWPzH1dgMc9pRNmjnCxp2kigri5nI0PkFdrqcmjSNozAhwV
 DXFiCcFVMQ0tN/CAQStZJZe+HycWyloh2C+7NBAjKk1zQ27RbzRjRXhnuqq8/GRu5TfcjAF3FUI
 7EF2uHYeT/lr5Bs6RUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDIwNiBTYWx0ZWRfX002+5DtN3exG
 LczAxkLg00BsN8jXHlmN7H7Q6YvJt+ExHF/opGHGTM7vhsJ00deeG01JNih8m/ocShLEDa2Aj/1
 3OzqbmXubBIL+CnKijDVeE8C/Vytb1I=
X-Proofpoint-ORIG-GUID: G29pXNyERCPqoUe8Web7C1wVBcBKCHnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608250206

T24gTW9uLCBBdWcgMTAsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFN5c3Rl
bSBzdXNwZW5kIGFuZCByZXN1bWUgZXJyb3IgcGF0aHMgZG8gbm90IGhhbmRsZSBQSFkgYW5kIGNs
b2NrDQo+IHJlc291cmNlcyBjb3JyZWN0bHkuIFN1c3BlbmQgY2FsbHMgcGh5X2V4aXQoKSB3aXRo
b3V0IGZpcnN0IHBvd2VyaW5nDQo+IG9mZiB0aGUgUEhZIGFuZCBpZ25vcmVzIGZhaWx1cmVzLCB3
aGlsZSByZXN1bWUgY2FuIGxlYXZlIGNsb2Nrcw0KPiBlbmFibGVkIGlmIFBIWSByZWluaXRpYWxp
emF0aW9uIGZhaWxzLg0KPiANCj4gUHJvcGFnYXRlIGVycm9ycyB0byB0aGUgUE0gY29yZSBhbmQg
dW53aW5kIHJlc291cmNlcyB0byBlbnN1cmUgYQ0KPiBjb25zaXN0ZW50IHN0YXRlIG9uIHN1c3Bl
bmQgYW5kIHJlc3VtZSBmYWlsdXJlcy4NCj4gDQo+IEZpeGVzOiBkNmVkY2RjMWVmMDYgKCJ1c2I6
IGR3YzM6IHhpbGlueDogZml4IHVzYjMgbm9uLXdha2V1cCBzb3VyY2UgcmVzdW1lIGZhaWx1cmUi
KQ0KDQpEb2VzIHRoaXMgbmVlZCB0byBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZT8NCg0KQlIsDQpU
aGluaA0KDQo+IFNpZ25lZC1vZmYtYnk6IFJhZGhleSBTaHlhbSBQYW5kZXkgPHJhZGhleS5zaHlh
bS5wYW5kZXlAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54
LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+
IGluZGV4IDRhMDRkMTU4Zjg3Mi4uODk0ZjVmNWU4YjdhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhp
bGlueC5jDQo+IEBAIC00MDMsMTMgKzQwMywyNSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IGR3YzNfeGxueF9ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBkd2MzX3hsbnhfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
ICB7DQo+ICAJc3RydWN0IGR3YzNfeGxueCAqcHJpdl9kYXRhID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+ICsJaW50IHJldDsNCj4gIA0KPiAtCXBoeV9leGl0KHByaXZfZGF0YS0+dXNiM19waHkp
Ow0KPiArCXJldCA9IHBoeV9wb3dlcl9vZmYocHJpdl9kYXRhLT51c2IzX3BoeSk7DQo+ICsJaWYg
KHJldCA8IDApDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXQgPSBwaHlfZXhpdChwcml2
X2RhdGEtPnVzYjNfcGh5KTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJZ290byBlcnJfcGh5X3Bv
d2VyX29uOw0KPiAgDQo+ICAJLyogRGlzYWJsZSB0aGUgY2xvY2tzICovDQo+ICAJY2xrX2J1bGtf
ZGlzYWJsZShwcml2X2RhdGEtPm51bV9jbG9ja3MsIHByaXZfZGF0YS0+Y2xrcyk7DQo+ICANCj4g
IAlyZXR1cm4gMDsNCj4gKw0KPiArZXJyX3BoeV9wb3dlcl9vbjoNCj4gKwlwaHlfcG93ZXJfb24o
cHJpdl9kYXRhLT51c2IzX3BoeSk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+
ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfeGxueF9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KPiBAQCAtNDIzLDE1ICs0MzUsMjAgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBkd2MzX3hsbnhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIA0KPiAgCXJldCA9IHBo
eV9pbml0KHByaXZfZGF0YS0+dXNiM19waHkpOw0KPiAgCWlmIChyZXQgPCAwKQ0KPiAtCQlyZXR1
cm4gcmV0Ow0KPiArCQlnb3RvIGVycl9jbGtfZGlzYWJsZTsNCj4gIA0KPiAgCXJldCA9IHBoeV9w
b3dlcl9vbihwcml2X2RhdGEtPnVzYjNfcGh5KTsNCj4gIAlpZiAocmV0IDwgMCkgew0KPiAgCQlw
aHlfZXhpdChwcml2X2RhdGEtPnVzYjNfcGh5KTsNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwkJZ290
byBlcnJfY2xrX2Rpc2FibGU7DQo+ICAJfQ0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICsNCj4gK2Vy
cl9jbGtfZGlzYWJsZToNCj4gKwljbGtfYnVsa19kaXNhYmxlKHByaXZfZGF0YS0+bnVtX2Nsb2Nr
cywgcHJpdl9kYXRhLT5jbGtzKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2MzX3hsbnhfZGV2X3BtX29wcyA9IHsN
Cj4gLS0gDQo+IDIuNDMuMA0KPiA=
