Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D641F427C;
	Wed, 26 Aug 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787704579; cv=fail; b=EmP2l7kbkZk1gXuSo2SmMATWGVXDvEoDndWLM3261IbxJQKSLPz+JaLoSC5XcrDfDk+8UmY+pJ14lhWS2ZNfpbQ8ErsCAqtn8/FFAs4ZWWjn/mlP3GaFQzQXljNOJUd9hwYLM5oQgds0s8A5vWePAlUm5fhq2Jo0GUmD9zhcqS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787704579; c=relaxed/simple;
	bh=tVvprQSrleaSq7mY44YacE7M4zsEHabw5VZVw1vjYco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s0FovKCHX/HjE+DoY5rmNUiy0zxUcqnESuBJo/JGjnfrTKdUqh7TbIckwYvslbv+KYwyJtZN7EVZZx1FrSrabGvm/6mkVDVAX4sHxa1yqAXuVCBlUKdSUIfWzYxq3uldXeVgA0Ml4QHkIV4MSNgkSLGyFsTca5cJDv9DdH2R+XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Z4dKUoRe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lSBvi5Zs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OAlM/FY3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z4dKUoRe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lSBvi5Zs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OAlM/FY3"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09Ul91005087;
	Tue, 25 Aug 2026 17:35:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tVvprQSrleaSq7mY44YacE7M4zsEHabw5VZVw1vjYco=; b=
	Z4dKUoReF/SCc19QdRiVmftxT1niaHi0IZ5HIA4BEWL7nx74lJ2fu9PGg3vLeT61
	GFQVtgUfrezC3zNgP3PRizlT1tzkDYcDXUAq58ug7AAYX7DeoCzTtpMdcOc201jP
	og05+uXKz/Hp7KQP0xZ/mReXMXeW86ri7efr2n4TWTvDk08cKkLCNc/cp0EtVg95
	n1hDGIUJiv1Um5izW4DoF69DBj1bhcwm70rqdmcNxkX4JiqEB4KixH/e00aYs8/H
	Sqgm6cgsI3OdCjeehzAD2EPSy8n5NoHVrwYEzrjpCToH+hBZ1EIj+CaWKwdFbOZa
	Eg0Na0rh6zQhwCa6m67fvA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9j5m9dw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787704549; bh=tVvprQSrleaSq7mY44YacE7M4zsEHabw5VZVw1vjYco=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lSBvi5ZsIqZYVp94xthU8Jk14KXJs/dVJLFQdeQ6MO5oOUNrgK1KAuVz+72SIkrBT
	 ExmIqKBjbbyJhVfKvJGfDFycfkQ1Xf6Ayp1vLmpq2lOtD/vlLScQTpHv6kiEQl1zIc
	 H4WFg0gin4qSVNHT+YsLBA/veURw7zYe+BTlxKpBNWyCtDtqmRDiq6LF72ceRm5r64
	 OqyhUtb67FfMudcpLiyAFIYQDP8PktIqhjY9TdVsMfSuk7Cmc6xQHx0Pfkm5VmUGFF
	 ELPddV2aq7qKurjf8Wx5H+CRF/L8LINwBvcnY0DNYjL0DYcZx9fIEx93k3G81ivQqz
	 1N0jAiBQN9nrw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 185F94014A;
	Wed, 26 Aug 2026 00:35:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 14B9AA00B0;
	Wed, 26 Aug 2026 00:35:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OAlM/FY3;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E69BE40082;
	Wed, 26 Aug 2026 00:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBptjcW/DOOVkrw+BcobVW3o4440QNejwS+7qumkhL1vj0sk/f5ZB4CLVjc/x3/LSOEtg/c8/wcdajsZKkZtOii7jdfXXqdPQsAp7FqSJjQxZ2yphEu9gZD1AtNZ9otk0naXvdw/1BxQE2Ns5rJYetRlER3QJ7JnkpC17irNNRfxiRORg8/xYbeZXGC7AoR566FgIrmVEWxRay5mJLHcIjhz04gL/A371gebiujFws6Di82okkUdRMuvuqVoIxv4kw6Fni2YNVGAkn4RIKNq+J2/O67s3m0P8HW7/dxyyHYQ47JqCFMTBYY2nNwUlzUFV/ENPGnvMtrL3+cdypTr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVvprQSrleaSq7mY44YacE7M4zsEHabw5VZVw1vjYco=;
 b=ARmIf4rYV+jW2oLBjCDvPEPwbZcq8LRhs8vw/w+MjRsNhOwvkzPejfFb3UdW3PXAttanoZL+NbGCMAy4mrcdMdSDA5VHkHaTowRjsBEOeqOzgHiNnwz82OWnAQmLZH/tn50V+XjSOFs8Pw790YPIo5dYV4a2TlvAzYHdspMv+dw4XCXMecPQCDP8eei5UJr3TG8IutSk4kH081k4wJphR1WzdI6Hkm+Dlzo2YLZdGUkNorLKnapi93z1B/PmCT1qqQQ7FcRKyw3nVkPiHsqKl0Uq3MX3m8kPA4QuqwkLkp/CjGFiZpFbkCiO3k38wBKF6yot7iPfDttTikFPuB+hMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVvprQSrleaSq7mY44YacE7M4zsEHabw5VZVw1vjYco=;
 b=OAlM/FY3oPkRw8NwjL8NpbL5Im//J3lbhCee6ShOwYee7UsYMkfR339TlWFV6nEC2C9Us4qJg5U4sFu8uXS3MNl4LTTcRYioiPE4nZ1w49xJrLN3+l2fh5VX1tt8X0PyyiXCiBIgCLGzGofKUZASXK3rtFnN32bA12KrvwMqims=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 00:35:33 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:35:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdL5fNRIOloCIPD0uU5HC1LRI3I7avhmoA
Date: Wed, 26 Aug 2026 00:35:33 +0000
Message-ID: <ao4yJCNXAHDYm8Bf@vbox>
References: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
 <20260819050109.681890-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260819050109.681890-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB6157:EE_
x-ms-office365-filtering-correlation-id: 578cfd1b-9f0f-4c84-5e32-08df0309f083
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|38070700021|10067099003|56012099006|4143699003|11063799006|6133799003;
x-microsoft-antispam-message-info:
 dVZs5WhitshyCV4R0a/Wcu4XBTbsmxymQqM0fAKqBV1LXAeg7IDJuO8SW02PLrmJQVjtOd94QB496zZxyS07TOJ5TYjsVituboNF5YlRmTgdbEESqIZyR0lt5pJq26SBg/oG/9a1r/7fpSVosVB/Qswg7WG0Fhck+t3Xg0S1bp84XMLxqvaXj7W/8aCPzYtoLd5ueJojbAk5gzsdXdEVnzwwtc0X3NGDnj2dLfvNv1BpMzh+R30DgTaEfk7ne86PaG0GD7M0jbvoPqKqWBCezzLgnU4exGYUFdWkDgJC8kMQJw+St9vb5tNdA7Mq0gv0kwjktZmkKjG8Yr7hNtu3yeqbBJD70EnD58mBEmNB13SJhI/wtMYrUEWBFrQmY7Z4o39kSeA0CdGX/pPoduOPLHWf20yZJZtrXI0SNbSG3RxoY+cSOh/qZRPu+LO20XUdp1ZNqotJg6F8i/yBncxNJmmpNyBe4ttOx6dADgttAuQ30SnnF3lnXS2/5A7mKlFaYFNEMY/HbCj7qKVHFWIRALUh8iJtRpyUdSBkSyClfG2BWkl+0O+lHJcFbugOmcSH2hj983QkB9aigXbi6cYJHUr1uFAuXq1urvrbV2YsHaekYUlibtQk7g2mm+pwaVLcR9rvb8cabvDJPgnKUDkSM+O1YQX5N4g7ZABFC5zstI6WrZtZ78KDhCGVYV/LVLLxBLK5Nv6UWC5Ox+ltZBczctEigMXL+D9Vy/eVFU4+aGA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTQrVzVnbXlqMnBaK0VNQ0lDaG5oaXVmVGQ5K1lHWHp3dFdWaHpZMExmdzNO?=
 =?utf-8?B?T0IweWR4RFFEMFBTa05rdjgwQURGZmpBUlhrM2ZLc2x3VDVnVm9STEU0Q00x?=
 =?utf-8?B?RTkrTVE3MDZ0NnJ1eWZ4SUhCMUZqVUVhYjhkVDZPVFRzSFRuN3ZLb084TklO?=
 =?utf-8?B?bjJqMVVpR2tyNlZENmd1UGoxUlZXMnVQc2trYXNPcWFVQUJ1dTBIMTdzelFh?=
 =?utf-8?B?ODFEMFRBaWE4ZHpMcEZSYnZtb0pxc3dxcmpBNktZNGZYZGlwcFA0cGJhdlhY?=
 =?utf-8?B?Z1JYS24rM0dLWWlqR3ByM1NWck9jdUZzekFFc2swOVcwSVdVeUhOR0t1bUdZ?=
 =?utf-8?B?aE1lWVROTnZPbEZOR1pPdHBqN1ZsN2dlWWk0VHdmbVRUSDFjNVR0dFpXd1VO?=
 =?utf-8?B?aFRicUNwbXd2MitFWG5vOUlRNTRRcnl0NWMzdFczc3N5ZGdiT2p4aDU5ZWpF?=
 =?utf-8?B?ZEFFVzNXVHlGUjNPYzgvZ2lWNnFkeGxueWxjanFydnlLcVVwM3UvRkhENTM0?=
 =?utf-8?B?NWFmd2NEUlpUUk9meVBZczliRGhQd3lyNlNGRG56dVVZOGYwc05PUFdVbDFO?=
 =?utf-8?B?YlM2M09ZWnU3UWdmc2V1cmlVQ1VmemtmZkRkWUxadmVvRkVUWTFURmc0UElE?=
 =?utf-8?B?cjV0RXVQanNsSnhyejJacXdRNzBLazV1bjZPSk9Oem8xYnFFeEk5MlBtWmd0?=
 =?utf-8?B?QUFpYlZiK0NLazJFTFh3QW5peWVmV0VCNkxremdOM2cwdldFM29KcVBKV1FZ?=
 =?utf-8?B?aDYzRUQ2VTFjUzQ1YjJZQ0tnenhONUlCSytSTXBqK24vL2Rzbi8xTGFrdGw0?=
 =?utf-8?B?Tndrd28veG52cmFaSGJqL1BZZ0lnWkFPa1QzZVpqeVNvTmgyRDROd0ZPUWZM?=
 =?utf-8?B?cDQzeDh2bDJnV1ZGcGg1KzVPZ25WWnY0WmV0SHdjUUlFU1E3aE5Tb093Rlo2?=
 =?utf-8?B?MEhic2dJWGRrcXNtdDJDN1JRTXc3b2trZDVnNEVMejViVUFPNlhDUmpIdXo0?=
 =?utf-8?B?QVpmQjE2YjFQVmRkdHR4V2hjTCs2Q2Q3WVlxd0kzTnZ1bE9wTnJodVhVTnI4?=
 =?utf-8?B?Q3o2SWtqOENjV09OSXRrWmhkTGVOVjA3TDNYNGRNNW5QQk5lejJIK3dJc0FT?=
 =?utf-8?B?WmFSYVJMQk40TG9yMHZ4eDNMTVRtbGs3TkZSRDRFU241NFVVdGJhdFZoL0c0?=
 =?utf-8?B?OTUycEtxQ0RUNmo4K3JyVmlUSDQrTWxtNUtwVlFlcHlPaXRyZExQSitWeUVR?=
 =?utf-8?B?TS8xV3BQMHpGREw1R012ekV4OWpRVEQzQ2V0Q0Z4VkwvNzJoOGFRUndMaWpL?=
 =?utf-8?B?akZGMkVYaXdPa0g1b1R1eWhwTWRkRlJlK1pQQ2hHQ1Y4cUhiRk84dmNkWVI0?=
 =?utf-8?B?cEJ5MENGbTBqWEdQWGhMZTJISEE4S3cvMVJVT3ZxUXJtc3ArTkZuTlQvbllu?=
 =?utf-8?B?c0VwRWk5WmJHdkxDTjQvOFhOY1krc2ROMnlsaXVaSDhCSW1JTHVnZVo5UHBL?=
 =?utf-8?B?bDlnN3g3VUFsdlkwc1J2Y3hhQldvS2JnVlVjL3BkcHRSbU9EUU1LeUVqREJ3?=
 =?utf-8?B?ZlAzRkZkWkdDbUs2VFZ1c2FoVmx5WWh5U29ZWlNIL05id2QxUi8yb1N5UlAy?=
 =?utf-8?B?OVNEL2V2RlJyTUlLd3B6ZzBYSk1CVU1HaTIzaU1FNVRyWUZsbVBVaXhpamlH?=
 =?utf-8?B?bjAxcWNTRERwdmVRRXlGSDI5ZEFLdDFoY2tZK1NucUdUWVNMM2NQU2pxRVEr?=
 =?utf-8?B?MTRVb2ZiT3c4VStsT1FsU2dCb2F5ekg3cDVVZmYxN0hMSU1LSHV5TXZRRFVy?=
 =?utf-8?B?dEdKcThIK1hDckxXODB3L0NUUzhsckNqS3ZFaWh0aGZmQzRiTHFYM21Pd1dB?=
 =?utf-8?B?akdIMk9KMlRQS2lWdnl3M0UvM2JJVXNLMzNUSVhkczFCVFlhSExybGltamtP?=
 =?utf-8?B?VE1VMEVoRW56dUhzTUk5RUwzVnVTSUNLNGwra2wzTlpEN0V6WU53Slo3dVZ0?=
 =?utf-8?B?SnhrbkdHSG5LMzVzUjNjWFhhUXZzY3k5WjdPQkRqMDBiQndhYm5vd3V2aHBm?=
 =?utf-8?B?bXNmQXRkVUJHVVRnQUlCOGNpK0x5dFZSUmFsa2RTd3ZCYnY4N3Q3YjhBTDVj?=
 =?utf-8?B?a001Qy9RV2VxZjFMRG9PRkh1SkpVRXQrQUZqTXppWWRiaEdkeGRaeUppVkpP?=
 =?utf-8?B?ZytZWmM3WitoQ1I4ZWFJSTRVNm5EcmFwUytpY2tUdTIzK0FhWUZCckR2Ly9D?=
 =?utf-8?B?ZWd5U3d5dXRZYTZzYzdxQ2NTY3JTS3hoR0VCZUt4S0xXcU5ObmNkazNRblUz?=
 =?utf-8?B?bGZoNVM0WG92V0pKd3NqN3FRcTgzcUdUTDZha2t1am90OWUvOUJYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <242AB8EF64C1F943898463401C7D71F6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jiNlqe+jp3FUackS5YTp+wWbEag4C1p1rU8oMp2DXJQWhcugCmIiV70mTnSNiEXXV2WkbTCOLWe3V16B0AdcLkxcaAJA9ULVZCUDYmIvlscHDstQ3Oaf9SuBNmy916ZCPH8hBWY1kluA88jY5Vy67UrKWiCUZO+Hd6WWXKkfNARchrO8y2d7hfViDcrEPhnhIxid2B8e+VbB9sUGSTIulQETK0E1szk+uTJQwPcLVhkEtlN6tBiLywIkJje3pxiXlv6OIMxQ6XszlxS0hLJc2pETjGVnb26UOQYqq7n5aq5wgedrfXwJ1PYOuaF4sqmC6NC6J3MwCwkyH8+1SDoc8Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eiJjK3o2ShXQNLGMoyONtQ3YEjAtZf5EaP8teagi2/nPgbOUs3RAHa3resaoo8yMdRVtjBE5ek/zEdq8mfOV8cWs7s8CFZzGXJfKM/dPiEojVZZBx1ppah9kUqzFC84PpFbLeknImbplo6us2Mn1mmUhc7bTbO9TxwZVkMIlUpWklh8SQeJ47NPAVjvXm9hXGgM/7cMjLxleou3By6eLQhzqW1X7yYxc7h7saIk9F09I/L9w/AXXCdtCEcj5kM17FHWAtdfMQXos10PSYVy0QfehB7Rpd8IzWLO8d0Ul6lxx+9vBqM/qQU6yOWGpv6aHzsRlUGHFcZx5BU7JvWRsxJorMhopW56HgshwBgSeShmhW8XjcfMvonjJGup0aqLV7iYemdFnzUv5ZV6oaP+3kFNTSZ+3rOw5zKf93KicJQWSxemG88QkuduviFmf7BUc7uyfoZ3A9ePToSf923SN6wLTB5N0ZntL2grxdcyq0ZU/z2JJ6hL3a59A6IRv0yh3EMxKR59XikkF8KW7SFfC0WHkMiYTfOmmRPbOX3Z7v9uy8Nafh+NXXUCFqMRZSjfVJfLQaDALsBxIlrQw7ENEFVKd3s47ajFdV4RqguEoVeRfUO8ffmShrLDGxrM2Tl+VDhwmj69tdgqSEjtdMZutJw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578cfd1b-9f0f-4c84-5e32-08df0309f083
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:35:33.4595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 214TG7xeH7fM7IgdFXEkAZhHxjN8o5W2mUITpx5qBXHQSfTtCoQlSFWpvSVo/NQazzu5nBfpifA7hs1ero+feQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157
X-Proofpoint-ORIG-GUID: e8qJ_K_WdMuiE7MlORxmjTpmvoaHx4ny
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAwMyBTYWx0ZWRfXwOINAaZ6510S
 Fi+M8v+ETb2rzjA50EW6tlguHDR7Gq8Rw2a9ZvviHxI9XKT6GxmSKi6lwP20YNNbZ03dXdvslEu
 qvgqxWSpfiEKoaHxF3QjvUt4DPCQhnI=
X-Proofpoint-GUID: e8qJ_K_WdMuiE7MlORxmjTpmvoaHx4ny
X-Authority-Analysis: v=2.4 cv=BpetB4X5 c=1 sm=1 tr=0 ts=6a8e34e6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=jIQo8A4GAAAA:8 a=lxBZA_8-wvyZqx2DzZMA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAwMyBTYWx0ZWRfXyS7fH6ttd0l/
 VH0if2MLNBjhtDjj81gre6IdVcU5/CNEqC12Gkfq15fv8xP/ZKs4gswiPh02lyNe5iz6ek0hpKd
 wxfOVWFs/bGbnvVq70jHl958ROz5FSlpnC4mNiLZyFoo5NbzVOCucFfQEjZJTydLa4p9hnEz29o
 Wh1G9g1+8FyRuAAuKliKLDfrukzeoLyPDvdmgfQLpYeyvrviIUxMOdnbcv8pIr2+M2JTiv8707u
 kKHInF0gfL3/UZIb3sBG0nWP1qqnB1+1xxaoSllRkbKSA1PsWCwEIBFL16thgrSKyUS95yLmHbN
 JlUEqRfLxrv6EhSIrzI6bd/J/VZ4qHzKoIvS/vZJZ4ftmNFqXqEvp327HwMF9sa6N1xg6cuzs+R
 kodXFpX7SPZktABUnDQMCQClwHyoqJJMA2G94s458r5jvPQSSHbqqlFblr+PeWAnMFMJM3dF12u
 EN9ZxP8yfzfUTWzZBew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608260003

SGksDQoNCk9uIFdlZCwgQXVnIDE5LCAyMDI2LCBNYXJlayBWYXN1dCB3cm90ZToNCj4gRnJvbTog
VGhhbmggUXVhbiA8dGhhbmgucXVhbi54bkByZW5lc2FzLmNvbT4NCj4gDQo+IFRoZSBSZW5lc2Fz
IFItQ2FyIEdlbjUgU29DIGNvbnRhaW5zIG11bHRpcGxlIGluc3RhbmNlcyBvZiBEV0MzIFVTQg0K
PiBjb250cm9sbGVyIHdpdGggZ2x1ZSBsb2dpYyB3cmFwcGVyIGFyb3VuZCB0aGVtLiBFeHRlbmQg
dGhlIGdlbmVyaWMNCj4gRFdDMyBwbGF0Zm9ybSBkcml2ZXIgd2l0aCBSZW5lc2FzIFItQ2FyIEdl
bjUgZ2x1ZSBsb2dpYyBzcGVjaWZpY3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaGFuaCBRdWFu
IDx0aGFuaC5xdWFuLnhuQHJlbmVzYXMuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IE1hcmVrIFZh
c3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZWsudmFzdXQrcmVuZXNhc0BtYWlsYm94Lm9yZz4NCj4gLS0tDQo+IENj
OiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyemsrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
DQo+IENjOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IENjOiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiBDYzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiBWMjogRXh0ZW5kIGR3YzMtZ2VuZXJpYy1w
bGF0IGRyaXZlciBpbnN0ZWFkDQo+IFYzOiBIYW5kbGUgbWF4aW11bS1zcGVlZCBhcyBvcHRpb25h
bCBwcm9wZXJ0eSwgdGVzdCBmb3IgVVNCIDMgUEhZDQo+ICAgICBub24tcHJlc2VuY2UgdG8gZGV0
ZXJtaW5lIHdoZXRoZXIgdGhlIGNvbnRyb2xsZXIgaXMgVVNCIDIgb25seSwNCj4gICAgIGNvbnNp
ZGVyIG9wdGlvbmFsIG1heGltdW0tc3BlZWQgRFQgcHJvcGVydHksIGJ1dCBpZiBpdCBpcyBtaXNz
aW5nDQo+ICAgICB0aGVuIGRlZmF1bHQgdG8gbWF4aW11bSBjb250cm9sbGVyIGNhcGFiaWxpdGll
cyBiYXNlZCBvbiB0aGUNCj4gICAgIHByZXNlbmNlIG9mIFBIWSBwaGFuZGxlcy4NCj4gVjQ6IE5v
IGNoYW5nZQ0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8
IDYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2MCBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdl
bmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IGlu
ZGV4IGNhNjlhYzBlYjA3Y2UuLmRlYzg5YjA2ODI5MWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAgLTcxLDYgKzcxLDYwIEBAIHN0YXRpYyBpbnQgZHdjM19l
aWM3NzAwX2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ICAJcmV0dXJuIDA7DQo+
ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZHdjM19yZW5lc2FzX3JjYXJfZ2VuNV9pbml0KHN0cnVj
dCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiArew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGR3
YzNnLT5kZXY7DQo+ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3Jt
X2RldmljZShkZXYpOw0KPiArCWVudW0gdXNiX2RldmljZV9zcGVlZCBzcGVlZCA9IHVzYl9nZXRf
bWF4aW11bV9zcGVlZChkZXYpOw0KPiArCWJvb2wgdXNiMm9ubHkgPSBmYWxzZTsNCj4gKwl2b2lk
IF9faW9tZW0gKmdsdWU7DQo+ICsNCj4gKwkvKiBXaXJlbGVzcyBVU0IgaXMgbm90IHN1cHBvcnRl
ZCAqLw0KPiArCWlmIChzcGVlZCA9PSBVU0JfU1BFRURfV0lSRUxFU1MpDQo+ICsJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIldpcmVsZXNzIFVTQiBub3Qgc3VwcG9ydGVkXG4i
KTsNCj4gKw0KPiArCS8qIE5vIFVTQiAzIFBIWSBpbiBEVCBtZWFucyB0aGlzIGlzIHN1cmVseSBV
U0IgMiBjb250cm9sbGVyICovDQo+ICsJaWYgKGRldmljZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmco
ZGV2LCAicGh5LW5hbWVzIiwgInVzYjMtcGh5IikgPCAwKQ0KPiArCQl1c2Iyb25seSA9IHRydWU7
DQo+ICsNCj4gKwkvKg0KPiArCSAqIENvbnRyb2xsZXIgY2FuIGJlIGxpbWl0ZWQgdG8gVVNCIDIg
dmlhIG9wdGlvbmFsIG1heGltdW0tc3BlZWQgRFQNCj4gKwkgKiBwcm9wZXJ0eS4gSWYgdGhlIERU
IHByb3BlcnR5IGlzIG5vdCBwcmVzZW50LCBkZWZhdWx0IHRvIG1heGltdW0NCj4gKwkgKiBjb250
cm9sbGVyIGNhcGFiaWxpdGllcy4NCj4gKwkgKi8NCg0KTWlub3Igbml0OiBUaGlzIGNvbW1lbnQg
ZG9lcyBub3QgZ2l2ZSBhbnkgbmV3IGluZm8gdGhhbiB3aGF0J3MNCmRvY3VtZW50ZWQgaW4gdGhl
IG1heGltdW0tc3BlZWQgcHJvcGVydHksIGRvIHdlIG5lZWQgdG8gcmVwZWF0IGl0IGhlcmU/DQoN
Cj4gKwlpZiAoc3BlZWQgPj0gVVNCX1NQRUVEX0xPVyAmJiBzcGVlZCA8PSBVU0JfU1BFRURfSElH
SCkNCj4gKwkJdXNiMm9ubHkgPSB0cnVlOw0KDQpXZSBkb24ndCBzdXBwb3J0IGxvdyBzcGVlZCBv
ciB3aXJlbGVzcywganVzdCBjaGVjayBmb3Igc3BlZWQgPD0NClVTQl9TUEVFRF9ISUdIIHNob3Vs
ZCBiZSBzdWZmaWNpZW50LiBUaGUgcmVzdCBsb29rcyBmaW5lLg0KDQpUaGFua3MsDQpUaGluaA0K
DQo+ICsNCj4gKwlnbHVlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShw
ZGV2LCAiZ2x1ZSIpOw0KPiArCWlmIChJU19FUlIoZ2x1ZSkpDQo+ICsJCXJldHVybiBQVFJfRVJS
KGdsdWUpOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUaGUgZGF0YXNoZWV0IGRlc2NyaWJlcyBpbml0
aWFsaXphdGlvbiBwcm9jZWR1cmUgd2l0aG91dCBmdWxsDQo+ICsJICogaW5mb3JtYXRpb24gYWJv
dXQgdGhlIHJlZ2lzdGVycy4gVGhlcmVmb3JlLCB0aGUgc291cmNlIGNvZGUgaXMNCj4gKwkgKiBi
YXNlZCBvbiB0aGUgYmFyZSBtZXRhbCBjb2RlIHNoYXJlZCBieSB0aGUgYm9hcmQgdGVhbS4NCj4g
KwkgKi8NCj4gKwl3cml0ZXcoMHgyMTEsIGdsdWUgKyAweDI2KTsNCj4gKw0KPiArCS8qIFVTQjIg
ZG9lcyBuZWVkIGFkZGl0aW9uYWwgcmVnaXN0ZXIgcHJvZ3JhbW1pbmcuICovDQo+ICsJaWYgKCF1
c2Iyb25seSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwl3cml0ZXcoMHgxMSwgZ2x1ZSArIDB4
ODFjKTsNCj4gKwl3cml0ZXcoMHgwLCBnbHVlICsgMHg4MWEpOw0KPiArCXdyaXRldygweDEsIGds
dWUgKyAweDgwMik7DQo+ICsNCj4gKwl1c2xlZXBfcmFuZ2UoMTAwMDAsIDIwMDAwKTsNCj4gKw0K
PiArCXdyaXRldygweDAsIGdsdWUgKyAweDgwMik7DQo+ICsJd3JpdGV3KDB4MSwgZ2x1ZSArIDB4
MmEpOw0KPiArCXdyaXRldygweDEsIGdsdWUgKyAweDgxYSk7DQo+ICsNCj4gKwl1c2xlZXBfcmFu
Z2UoMTAwMDAsIDIwMDAwKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0
aWMgaW50IGR3YzNfc3BhY2VtaXRfazFfaW5pdChzdHJ1Y3QgZHdjM19nZW5lcmljICpkd2MzZykN
Cj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkd2MzZy0+ZGV2Ow0KPiBAQCAtMjMxLDEx
ICsyODUsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIGVpYzc3
MDBfZHdjMyA9ICB7DQo+ICAJLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUywN
Cj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyBy
ZW5lc2FzX3JjYXJfZ2VuNV9kd2MzID0gew0KPiArCS5pbml0ID0gZHdjM19yZW5lc2FzX3JjYXJf
Z2VuNV9pbml0LA0KPiArCS5wcm9wZXJ0aWVzID0gRFdDM19ERUZBVUxUX1BST1BFUlRJRVMsDQo+
ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX2dlbmVy
aWNfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLWR3YzMi
LCAmc3BhY2VtaXRfazFfZHdjM30sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy1k
d2MzIiwgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxsczEwMjhhLWR3YzMiLCAmZnNsX2xz
MTAyOF9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImVzd2luLGVpYzc3MDAtZHdjMyIsICZl
aWM3NzAwX2R3YzN9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdlbjUtZHdj
MyIsICZyZW5lc2FzX3JjYXJfZ2VuNV9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInN0YXJm
aXZlLGpoYjEwMC1kd2MzIiwgfSwNCj4gIAl7IC8qIHNlbnRpbmVsICovIH0NCj4gIH07DQo+IC0t
IA0KPiAyLjUzLjANCj4g
