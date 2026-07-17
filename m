Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82843F083;
	Fri, 17 Jul 2026 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784324094; cv=fail; b=gIHMByQ+SPo1Em7tamuj0+veICVffrxqKQDkzvsy8FM1Mgfbk3rMJM9ewW7a62qWWO5TGjXSI2pHQ+UDIFaR48rx/a8WVd9sMterHhtVBUpEH+7tEvjVPdcPIutuHMfOUnxK7Kmg+M14//38670MrxHtVkAKxfxRwfQIOI7KClg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784324094; c=relaxed/simple;
	bh=6PSXjegfo/U8OCzIborGNn2UpAp6wUotynGzTnl41zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Glt3gBNJe4IgRyOEwOE2Che0TZd4WSwsi10OhK++9ApDZ4OG9H1P+pmt6is3U6SLoQ73gG8I4OcfVak8A8nhr5T9l2Ve1uEP6GK/uwslqwdHoPGX3W9eeXRqix2k4WIX7jYOdRN5cUFmYsHnrN8mb4Jn7pc1OBmdWUNAndxLNXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GOePYswD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MNNYoYCZ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lPTAZ9MY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GOePYswD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MNNYoYCZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lPTAZ9MY"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtlhd600467;
	Fri, 17 Jul 2026 14:34:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6PSXjegfo/U8OCzIborGNn2UpAp6wUotynGzTnl41zs=; b=
	GOePYswDsyMkdp8PJwGQEQu5FEPx4lfn5J0xluwthI9wL2E9UwYMiD/yPpkoJytX
	r7VezoWBcv54N/pLdSX5o3m2tMub4L3zSp/M8sAiVOMiSpwYAdEmCOJRTb51pU+Z
	v1q/huvL9jqVYpF6Hi2iMQXOzsYULDkXSGJCJdgc7+8D5NH6WsgqrTwsJNcgP6UA
	Lq1AlUOmpe23fASxqSREpY6ULndWRrKJgbkPDk15eWCh9qeuotrW682QNArX3SKB
	pIUMY6B3bg0nHvlfYmoz1HF9+RSYFckJFQwIbcrV8UnbgnoUvECUQ1aQxs3CSWUI
	J4D/Mu//9lxAZQBlzN867A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ffpq3babr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 14:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784324086; bh=6PSXjegfo/U8OCzIborGNn2UpAp6wUotynGzTnl41zs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MNNYoYCZDKpsp67A1en+Af+P5wkxO9jOOs8Q4dLHwn8Wqi+F8mXtz+Cmbl0eneuI6
	 HBHsE1u+LbLGHFQtnolMwzO2FzD0usN2jbjV4EUUFwJMWhi7LbOA+2nSaT3J7r1+Rn
	 4r1Y/X2sf07i5VnlRVxtuLj//Nm3l4IBRdfWY0RsvHArXDC+gloY3UhCi2FXcFfcXb
	 0sw54mLOvu/uXTJf6nQmzXeb/VXVinP07ijHP+L1hB33ykyBBLVQGWSaYMaTkeQpOI
	 dPxYoDyOu1ETnyOsoWCxvPpn2+vQY77G4LzcPPFFaZMqclfhqE33BpL8yH4Qlq3bRk
	 y1W/A03svG7xA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D90E3401A7;
	Fri, 17 Jul 2026 21:34:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 54E2FA009A;
	Fri, 17 Jul 2026 21:34:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lPTAZ9MY;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00104.outbound.protection.outlook.com [40.93.6.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AD366220C3F;
	Fri, 17 Jul 2026 21:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFuP46Tb5UmM2phowtAwCy+lHrlCjEih6ebkCG7cLpRAgujtG8RN+7RoNX7GtBv17wiJmwgnHHR4IXcgMQew13nsoTyWPA4GbtvKRaJTtk2YTSCQNRDUpsM3ZAe6miTOhaqW/82tOJiQt0vl35u+2M5i19HpesdQwkKdoar3IFExKveFbef2hkGwNon/jnJcMTsM5jEzuB7vTzumzjUVOUNIAzo45s+Se3Oi1AQ399+9oyZyOLBfVRBxb+KPuSrNQc35G1thH0iaUtOSUpD2YJpd6I1SQTjDHhhVui8rStJaHiKakU3ISJuCZeaO5dgDSz0kCQd9VgXmYE6ZX0HnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PSXjegfo/U8OCzIborGNn2UpAp6wUotynGzTnl41zs=;
 b=o4yvea3j5p+96cgCvRgcHrcHAhi6nyyclYEBezHnI2CqJ2uV+jNHDu9BkYR7BTkhQTaxaTYwrQ1RDnfeqPMyxABlhmZsrm0/25wdZ1PtDZjhqpza4HWWSRFcxpzvglwMVnziimCdBgM00r8/ShyQjSlUNYC/1m3Ju9yDwBEmH7ZmoaoSF1oe//lkkPrGjEAhBl4FdCu0XuqhT+Xi7RmDe3WqbGbOauOoM9d2xpsd/pxYRptmoPZZllyR0DJ/hml7Ih6WAz5LluUT6O8Zwb5OAHuaPIY2SB/I/Jc1mjj42bX/7Cjl5M2ZRZzYvCpw62cOQK1t2YLYySGPekRhgDbkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PSXjegfo/U8OCzIborGNn2UpAp6wUotynGzTnl41zs=;
 b=lPTAZ9MYmEWZSSWlL/yLMNSHS6g/wkNLWb/TCw4CrKt8UfybTukXYUIVvplRacBBvZo5aY1ecTiKYphuqJhL+f7hQNzQPnNPHMZct6n8HeFzj3/Q5oeUt+7sncIuMH+78D8dib0LuWV19ltVBQQpJLuAb8WLtZzcMLMs8ufkoO0=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 21:34:38 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%4]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 21:34:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABo3gCAAShsAIAAUfSAgABrlwCAAOIEAIAAFKgAgAAKKoCAAB12AIAABXKAgAEmIwA=
Date: Fri, 17 Jul 2026 21:34:37 +0000
Message-ID: <alqZQL_TrQ7Da4Zw@vbox>
References: <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com> <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com> <almJeSq1zfcC1mjj@vbox>
 <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
 <bea99c43-16c2-4f5b-b14c-e1a518b97e11@oss.qualcomm.com>
In-Reply-To: <bea99c43-16c2-4f5b-b14c-e1a518b97e11@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|PH7PR12MB5687:EE_
x-ms-office365-filtering-correlation-id: f771c0e2-f56b-422a-a865-08dee44b3406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|4133799003|3023799007|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|6133799003|22082099003;
x-microsoft-antispam-message-info:
 tZvMhyNsavvEAH5T3/uLbEkuwO8Dl0gNy5nEIMgUhbLOZr6TAXHqSuNZpofoccoWkxL2tgftew6uFRoWpQANFWUDog1W7Q0a3E111Xdr2Z0QyrA1cMtXVBYgbo6W1RbimbzxXFLFiA+122IFB3yqVa8cN1numnVyxeGlhVZcQy6CBD+EWbJAB77vSUWmz2mWuLf1xntLSqhkTbQXObNKKi272NOYijPrqis7+X8i5byKhM2Y2jkJPZJaOeDs6sHkS2TnnNi/jxG1Kbb22y9532Met7pv8kjjpSpdJvOhIsWMSIVyErimYolG3rjJMwPoN+LHxDPgYkb65eFJlPrTWksKoi7KWeYP6ThFlE6uCTMJ+m+IhUVXhtTLS33YHglMeNO0aT6mdB2gegPyJROdbnytjxWTJRaTzfEBHTEs7/YkrEygBsZe5bcQ11OQCaTMx+NBo6LJJknkiQ7URyZ7M5Glr5KLR0dtmDTY5JRdGIhwFBZaYvweKyBeGEA+WhEuB7A3CwxlPV9LAQePKVSMrj2CyenXYJPlCV7redBFTaR2AXdeigvWh6ZWU8H38q/o3zyl5K1Z004K2jxbXt5i/tcBW5Nsu6HhntxOafZUI72w4wqGomjxNKV6p3KWYCBcumt9aY6Dtc+/h/IacFVMnhrOMd+OrlTDlkEVDDQ00gMLxj3KVb6+UEdgh41lzw+1vaBQ7HTr7Q0aRGIXPRP1mzcFOjCbzIO2euOoYM/gBcI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(4133799003)(3023799007)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnRwVzJ0eExPMVFWWklhbVVDRjVvaDR5enM2ZE5Jc0VzeUs4blZ0ZThOTDFu?=
 =?utf-8?B?czhlcnVoZTZLWDVmKzZNNUhDR0p5M2NqZmNHU2hhd3FZR1ZBQi85UVYyRzZs?=
 =?utf-8?B?OEdQdTZUaDFXTjNLVndEVTgzZVdncDNkZ013Vi9UNXpSVEdUUWFRK3NxN2h2?=
 =?utf-8?B?QU1QOUZiT1JyMmRJNmFqaXZtMFJET1ovNjRvNk5pV0RHbk1JTkNkbHpCY00y?=
 =?utf-8?B?TnY2WTZndXJxUFk0SXFFYURSd0l0ZlJwdmt6UUVuZ1JRRWtObW5Bc1hidU51?=
 =?utf-8?B?MUg4L3drTG5DWEZRd0c5cE9UR050WlR0WDVpb1BzN0RqdzA2Sm9kenlILzhP?=
 =?utf-8?B?NUQrUXAzYURhVnhFZXlNZHpBbG95V2d0TjRjMmtnZnQzWmpoQURodktranFx?=
 =?utf-8?B?eHFFQVQyanhlamNOYzVVekxicWIvaTloSE02UittUVlDQTdncmhoZFUzY3ph?=
 =?utf-8?B?UTFIVW12amtXd0tSbDZXT1VmdVlHK3M2dE1KZGtoeVdDMXI0cERtWDhOazlB?=
 =?utf-8?B?RlA3b1NDK2I4UWVpMnYzdHExUGw3M3ZrR3ZpVFhsdGN0bVE2Rjl4dHM2aUJq?=
 =?utf-8?B?UGlMd2tyUlM1WmlidXNDeFBUVDlCMS9Ea0c4eSsxVzM1Vk1XR3FPR052UWh4?=
 =?utf-8?B?ck5EMG9WNDRxT2hGN3pvNm5TUUM3WmdGYmtOemVmTVZyT3hwd0ZibU05dWRN?=
 =?utf-8?B?MDBGaE5DbWpvTjJ5dXcrMlpGZ3d5dDBTWjZJMmpiZ0ljN1dVM0JKOXVxT2RO?=
 =?utf-8?B?TVRCdWhNN1Q0c1h4aG44N1UyTmRFMTdvNGk5MXl2SVlrSEw1UkJ3UkhITFZQ?=
 =?utf-8?B?dSs4dUpTMUlKSHpIQnoyUWVaUVBRc1c3T0FVZmxLaGJ1OEh5LzVuQ1ZEWWpW?=
 =?utf-8?B?MkhUT0JGbGdHY2Y5TnpiNWFiUWlXS0EzR0FZNnk4Q1Nndyt5cmhldnczSlJM?=
 =?utf-8?B?dU1zUGdUTStyNEVua3diWUFHWGVIbExKOXg2RUwyWnpSWm1RYUtnWjdZYUhi?=
 =?utf-8?B?Q2hhSXNMQUdBRm5PSXExbERqKzNMTE9MdUVOTlAvVTc1U2ROVDVpd0pEOHdR?=
 =?utf-8?B?UlgxdFdJTUpueTMwc1B6cTlXeEgvaVVyc0FMV3NTYTk1WHIxbU5QWllrOHJW?=
 =?utf-8?B?Umo2QkllblR2SEQrNmZDZFdYZ2N1RTdLd3Vvak9ZRStidDNEL0Y3SE9WM2lN?=
 =?utf-8?B?dGFRZGpKVnBkZC9TUVE2RTJZSWpqSTBTY3N6RkxxWEhsSU13QXpSbzNjQTVp?=
 =?utf-8?B?VlV3bjNoMjdlQVpOVTNTbkY3VWRGcU1aZmpmd0NPV2xBZG5tSVBwOTM1TDlp?=
 =?utf-8?B?c3FwWndIRW8rUVQxS1IxSnMvTFFpT0ZvaVk5Q3RpWWgvUkM4bmNnY2MzazJo?=
 =?utf-8?B?anltbGtyazY0SmlXT3RwN1JTa3B5dkNLKy9mK2d2Wk9jTlFlVGUrZE1JQm1X?=
 =?utf-8?B?c2Q3UmVqU2ZZYTNURWgwZnQzS0FUUzZKYUlQZjFoVnhjYjAwQllRMlpBaHVX?=
 =?utf-8?B?MzR5U3NNSXdBRXVIc1pCTlpzVHRiS0t5WXA2eGdFaGFSVndRT0x2bTV4VElY?=
 =?utf-8?B?dmc0NENJZVB3cklJZ2hlekhvWXp2dHNENjltYkxQTzZxV1VWRGY2Z28vY0Ns?=
 =?utf-8?B?K1FXa1pMS2U4U1ZHMURoSTNSVjNHY3RCQjRjWHU1c0FlZmswakdScXE4V0U0?=
 =?utf-8?B?MlpYSDl0LzdaMm5pV1pnTEZNNXR6VjZtY3d0bnR1U1k0elhYT3RIUWsrY09C?=
 =?utf-8?B?RnpUWTdZbWgzeWJYb29nR0I4SW1VOStBeDM4a2sxSGpuUGdJUlUvSTBxVVQz?=
 =?utf-8?B?WlJvemtaTXFoWVpjc0tUS1hKNjhDRkFPek54a0JDRXdqNzVUQ3ZhemYzQTZP?=
 =?utf-8?B?NFpaTGtTTW9OMjJGU0tWTm1TdVdvSHQzcC9lYlVRK3dONE1ZTzRzYkxNWVp0?=
 =?utf-8?B?KzJlMTY5cVdwSUltNDNrV3VkV01WNjJGYzRUZUZuWmdlY1Z4eTZjZ3d3TTFO?=
 =?utf-8?B?cG05MUtuZjhmcjF3ZkNGbmEvOWlWTEJVbGJ6ZzBOdWNrcFJiM2Jpc1Y3bDVa?=
 =?utf-8?B?YjE5U0V1bGJ1VlZEZ200eUxtZUlja1RqSmZEK2h0RWlkREs0YWR4OXhRN0VI?=
 =?utf-8?B?VTgyMzNoOTJCaXdkWTh6VzNVOUFDN1lGUTRRbFR6c1RFUGp0b0xraFMvQkdy?=
 =?utf-8?B?SGtTV04rdjdscGd4bCtteGovWmdkQ2JIRGZ1RWFwWUxUOWd5eHc4aHRsZ3NC?=
 =?utf-8?B?NjFSYmV2VWhPNHM2bWg4ZkpoZlIrVU4xOTdWMllyMDJNbFpGdjFTamVTMzJF?=
 =?utf-8?B?SjIyVkc2MGhxNlI4RGxRSU1KWlVHcXpNRVRqL3BxOVFJRVZieWYwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B413360EEEA55C40822A1B3A449618B8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jW4G3ljZrpX8RPZD8R699Kipw8xJrYljv7IG3l8wlbpUutGEbxK4hBOaUVY2gDIqvZ39f+0xB7wUewT+YCbNnLJLquuT/4yuGb3S46h+lPyR2sNKwM3zACAaxW/8gpox2u0KE8fz8pNCqFlZIivnFmXYvlg/n2kUj5dihXzZD/W8zS0Axn10ovixZlkOK8sh3As2iB+W4N3UO9KlieAM+3SBn7bf5ZBK981jDT03+w0nm43zYxyWSSN+qehMqfR5JugKn4pxSNFbPHRE8ENoPgqhPWB6AMYZnLZNQVmIOQu57F2C66VEdnnpUUl5GyabmhH2fIK1CJpYMoe/uIYf/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LTZojLHN+IHrljcR/XnlhUOis4xWxZynaPnRf0aALL/UcMij+OczUDlJ14MW75buykdYyKjZoN/LK0omHh/c8TCpwNC85jJijhp0vMx892F3eNKrXQBwo5S0IakiZde3EUNWiHQiKWeeHWNrxjL6ACGKa95wNrWVL2FaAsKjERSM3Rsco2d2XLy7C9aJYCpRGOzX9U5p6VIKLeijy4RANNIcKG1d5i416shL6xxLEHo5gZvWA0cZlPoDAzDUDvI+MW6lgsM5ZM7V5I78xKGQ7EsLKcKk2E0UKOBqS5mhuUHBUmpphbPOOQsltdNPqUFiOsi4kv38erbBOvP5QLa7hYEi9pRTVjYVOQ4XlbzY8IxVmI5Ee075bsHwOHOLeDlgKWLGySOXwkQkGiGxz4tn+0a5tbM9naGwAEfGGUGORwa6eiK+9tNoqZRyKgRsn9ChUJsK2GWxviPBIGFZCScvx9/Wittct7ZJ1SFN8m4AQ86qstmMusZ2UIqWg39d1e7s/3Lu/rZBr6PhVIOofSPy7oiPR3Knxdwabb6Y7ppv1LrPnni/UGWphagx5ioFoVnbJhUjqkftIyZsjiCZkfQ+pHeJejEF601+Z8moikz9ay5rJQOgOV4vCL2HXBW+6Pkn6hkIBvLuvZUlV06guR2+Tg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f771c0e2-f56b-422a-a865-08dee44b3406
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 21:34:37.9130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqAb2Zbjr1t85ZfoClzho5C+Z4infUQesb96EukkrRy+efiRhgTegM/EEVeazdvOMBtvfkrXoT4F2PUjFRpkLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyMyBTYWx0ZWRfX1RphZcSaCvC4
 rwUVQzAo+zmrW12g4otZoB2JrOI5xvOIlxqMV50+Xqrx9HOgSqXi96kEowqdYenCpFTN7Wh9qf7
 EOOvWZga6ILjmLGQjrOTYGBVt2qUmho=
X-Proofpoint-ORIG-GUID: yo2tBrEAeldaHmxAVSKTwGR40TiYheta
X-Proofpoint-GUID: yo2tBrEAeldaHmxAVSKTwGR40TiYheta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyMyBTYWx0ZWRfX6a+5i8wqCan2
 q4I6IVhv1jsFMvzbzA0ytl8HvGs8rT2rfmkpLBEmJxE7t1ekMd0mqXFdIsZr8xp36lU5sZW37AF
 EtNpRAt9yL6jaA0HLQ3irgkhIqQnR7vESaWi85ZOTlnI/QByE1OXq+81gSKpP0ZOLIpRAvZKZoC
 WQcB2rAdDyOgvvBoKqvLx8qUSIS7MriNK4aTflBQR5+K6vGBUKXlCWLAmP6c9sY8o5gAUgSC96D
 a0WOpZJeU8MjIlFP7VNUSxd5u3ZVev+QbInyXmR7vNjluwgyILKSz2K9XElsqvaWLSrM6JKfllW
 csXe3tkhEJiEDJEYFDxmKQPx8jHi1lhSbhcpzhJ5N85ege7MRpt3CDlQL8Q2CnsWRYVoAnKJMcp
 YTmRr5WZqM46NWI600we9qoYrsrgq90cq1fPAmw8kgAzOA1igLjQQojg+9g6mr9IwLMn7EbNLli
 oRWsPMemmp7PmceQOTQ==
X-Authority-Analysis: v=2.4 cv=asiCzyZV c=1 sm=1 tr=0 ts=6a5a9ff6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Muf5AeU9w55oMAw2kAIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607170223

T24gRnJpLCBKdWwgMTcsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNy8xNy8yMDI2IDk6MTIgQU0sIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gT24gMjYtMDctMTcg
MDE6NTY6NTksIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IE9uIFRodSwgSnVsIDE2LCAyMDI2
LCBQZXRlciBDaGVuIHdyb3RlOg0KPiA+ID4gPiBPbiAyNi0wNy0xNyAwMDowNjozNywgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJIGhhdmUgc2VlbiBmZXdl
ciBwbGF0Zm9ybXMgdXNlICJwaHlfdHlwZSIgYXQgZHRzIGZvciBhcm02NCwgZHdjMw0KPiA+ID4g
PiA+ID4gY29yZSB1c2VzIGl0IG9ubHkgZm9yIHNwZWNpYWwgY2FzZXMgYW5kIHRoZSBjb2RlIHdh
cyBhZGRlZCBmb3INCj4gPiA+ID4gPiA+IHRlbiB5ZWFycyBhZ28uIEZvciB0aGUgZGVmYXVsdCBz
aXR1YXRpb24sIHdlIG1heSBub3QgbmVlZCB0bw0KPiA+ID4gPiA+ID4gY2hhbmdlIERXQzNfR1VT
QjJQSFlDRkdfRVVTQjJPUE1PREUgdmFsdWUgZm9yIFVUTUkrLCBUaGluaCwgaXMgaXQNCj4gPiA+
ID4gPiA+IGNvcnJlY3Q/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGUg
R1VTQjJQSFlDRkcuZVVTQjJPUE1PREUgaXMgb25seSByZWxldmFudCBmb3IgaG9zdCBtb2RlIGFu
ZCBtYWlubHkNCj4gPiA+ID4gPiBmb3IgZWxlY3RyaWNhbCBjb21wbGlhbmNlLiBVc3VhbGx5IGJ5
IGRlZmF1bHQsIHRoZSBDb3JlQ29uc3VsdGFudA0KPiA+ID4gPiA+IHNldHRpbmcgc2hvdWxkIGhh
dmUgdGhpcyBzZXQgY29ycmVjdGx5LiBTbyBub3QgZXhwbGljaXRseSBzZXR0aW5nIGl0DQo+ID4g
PiA+ID4gc2hvdWxkIGJlIGZ1bmN0aW9uYWxseSBmaW5lIChJSVJDKS4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBUaGF0IHNhaWQsIHRoaXMgaXMgc2VwYXJhdGUgZnJvbSB0aGUgR1VTQjJQSFlDRkcu
UEhZSUYsIHdoaWNoIHRoZSBjb3JlDQo+ID4gPiA+ID4gdXNlcyBkd2MtPmhzcGh5X21vZGUgdG8g
aW5kaWNhdGUgd2hldGhlciB0aGUgVVRNSSBpbnRlcmZhY2UgaXMgOC1iaXQgb3INCj4gPiA+ID4g
PiAxNi1iaXQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBXaHkgb25seSByb2NrY2hp
cCB1c2VzIHRoaXMgInBoeV90eXBlIiBwcm9wZXJ0eSwgd2h5IG90aGVyIFNvQyB2ZW5kb3JzDQo+
ID4gPiA+IG5vIHRoaXMgcmVxdWlyZW1lbnQgZm9yIFVUTUkgd2lkdGggc2V0dGluZz8NCj4gPiA+
ID4gDQo+ID4gPiANCj4gPiA+IE5vdCBqdXN0IHJvY2tjaGlwLCBzb21lIHRlZ3JhIGFuZCBoaWtl
eSBhbHNvIHVzZSBpdC4gU29tZSBvbGQgcWNvbSBkdHMNCj4gPiA+IGZpbGVzIGFsc28gaGF2ZSBp
dCBmb3IgdWxwaS4NCj4gPiANCj4gPiBUZWdyYSBhbmQgb2xkIHFjb20gcGxhdGZvcm1zIHVzZSBj
aGlwaWRlYSwgaGlrZXkgdXNlcyBkd2MzLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBJdCBpcyB0eXBp
Y2FsbHkgc2V0IHdoZW4gdGhlIGNvcmVDb25zdWx0YW50IGRlZmF1bHQgZGlmZmVycyBmcm9tIHdo
YXQNCj4gPiA+IHRoZSBwbGF0Zm9ybSBuZWVkcywgc28gdGhlIGRyaXZlciBjYW4gb3ZlcnJpZGUg
aXQgd2l0aCB0aGUgY29ycmVjdA0KPiA+ID4gc2V0dGluZy4NCj4gPiA+IA0KPiA+ID4gTXkgcG9p
bnQgaXMgdGhhdCBjaGFuZ2luZyAicGh5X3R5cGUiIGRlZmluaXRpb24gaXMgbW9yZSBpbnZvbHZl
ZCB0aGFuIGl0DQo+ID4gPiBsb29rcy4gSSdtIG9wZW4gdG8gYWx0ZXJuYXRpdmVzLg0KPiA+ID4g
DQo+ID4gDQo+ID4gSSBrbm93IHlvdXIgY29uY2VybiB0aGF0IGluIGNhc2UgdGhlIGVVU0IyIFBI
WSBTb0Mgd2FudHMgdG8gY2hhbmdlIFVUTUkNCj4gPiB3aWR0aCwgaXQgY2FuJ3QgZG8gdGhhdC4g
QXJlIHRoZXJlIGNvbnRyb2xsZXIgcmVnaXN0ZXIga25vdyBpdCBjb25uZWN0cw0KPiA+IGVVU0Iy
IFBIWT8NCg0KVGhlIGNvbnRyb2xsZXIgZG9lc24ndCBrbm93IHRoYXQuDQoNCj4gPiANCj4gPiBG
b3IgdGhlIHBsYWNlIHRvIHB1dCAiZXVzYjIiIGZvciBwaHkgdHlwZSwgSSBzdGlsbCB0aGluayBl
bnVtDQo+ID4gdXNiX3BoeV9pbnRlcmZhY2UgYXQ6IGluY2x1ZGUvbGludXgvdXNiL3BoeS5oIGlz
IHRoZSBtb3N0IHN1aXRhYmxlDQo+ID4gcGxhY2UsIHdvdWxkIHlvdSBoYXZlIGFueSBhbHRlcm5h
dGl2ZXM/DQo+ID4gDQo+ID4gQW5vdGhlciBzb2x1dGlvbiBpcyB1c2luZyBnZW5lcmljIFBIWSBB
UEkgcGh5X2dldF9tb2RlLCBzZXQgZml4ZWQgImV1c2IyIg0KPiA+IG1vZGUgYXQgZVVTQjIgUEhZ
IGRyaXZlciwgYnV0IGl0IGRlcGVuZHMgb24gUEhZIGRyaXZlciBkb2Vzbid0IGhhdmUNCj4gPiBk
aWZmZXJlbnQgc2V0dGluZ3MgZm9yIGRldmljZSBhbmQgaG9zdCBtb2RlLg0KPiA+IA0KPiANCj4g
S29ucmFkIGRpZCBzdWdnZXN0IHRoaXMgb24gdjM6DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzNkZTM2NWEwLTQ2MzItNDJlYS04
YThhLTVhNDc2NTk0NWE3NkBvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5R19wZyFiRmZIVmtL
SXpuVUxaUEkycUx6YWhHb2JUNk9JejRqMy1YQV9uXzNoSG5SdXZ6cHNfWHVBR0pkcGh6eGtLNGJr
NnR3RWFoLVpuNnhSUzF1Q1FDaloxdWQzSG5SZnRLaHcyU1hmcUEkDQo+IA0KPiBUaGlzIGludm9s
dmVzIGNsZWFuaW5nIGFsbCBkcml2ZXJzIHVzaW5nIHRoZXNlIGVudW1zIGlmIHdlIHRha2UgdGhh
dCByb3V0ZS4NCg0KV2Ugc2hvdWxkIG5vdCBiZSB1c2luZyBwaHlfYXR0cnMubW9kZS4gSXQncyBh
IHJ1bnRpbWUgb3BlcmF0aW9uIG1vZGUuDQoNCkluc3RlYWQsIHdlIGNhbiBpbnRyb2R1Y2UgYSBu
ZXcgcGh5IGF0dHJpYnV0ZSBwaHlfYXR0cnMudHlwZSBhbmQNCnBoeV9nZXRfdHlwZSgpLiBUaGUg
cGh5IGRyaXZlciBjYW4gc2V0IHRoaXMgYXQgcHJvYmUgYW5kIHRoZSBkd2MzLXFjb20uYw0KY2Fu
IHF1ZXJ5IGl0IGZyb20gdGhlIHBoeSBwaGFuZGxlLg0KDQpXZSBjYW4gZGVmaW5lIFBIWV9UWVBF
X0VVU0IyIGFsb25nIHdpdGggdGhlIGV4aXN0aW5nIHR5cGVzIGluDQppbmNsdWRlL2R0LWJpbmRp
bmdzL3BoeS9waHkuaCBmb3IgdGhpcyBhdHRyaWJ1dGUuDQoNCkJSLA0KVGhpbmg=
