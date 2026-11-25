Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795574275;
	b=STiU11qel03tst+OqNOYNOuHt4k4vNWsYX8nNUIESDJnTFsoIbBM1chaVI25/CfJWdMh
	 S/90SHQnwpOqg8q8MFvJzq10Pe++wtLGb7DKEeeqDXD7QYLeA8AwKTRyvgkVty419EFJ9
	 f/RRWtDbfbjGyQnZijom1QQf3TGG8fqo1gE4/PTqaKhx6LGOMTYf3RpDQCzsxZti6ENrr
	 SjCSbYC41LEs0F+mjWR8CNPlqtHy1N/LqQl+GsjvOQhy0U3unoGWBO19i914hsixBznDy
	 YUrK0nIojo2VlGkiGae/Rf78Z82S1RIY5qmdOcTDwrydRP2CvEbRsGI3RTJcvHhsF4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W0g3GoTyRwkwzDOB5c77tzuclbMYy1bg2sTCIqIyzH0=;
	b=PJAuP9QItiO0pEjoAG2h4xBveG38C/nUZWGtyCMUQPHPHRUrqxWAcOOzqZjyq7IL7sAF
	 2sMCJoV3UtF3ETUVva4q9t74GR07QR/hyTlkY3+Q0fnN3xuor5bgNWCmfQ3gtb4TBEMNw
	 KE2vtYabrUL7Q35zTfiytIjg0dmRsUAo6d51JshDK3kn8ftutssxUARkNpm5bQG9QQY0+
	 WxRgoQe0FZrrupT8Ml/n00FU0uayz33umyuU3PBjonExjMVEITnzMb1GfN8n1BVP9L5S+
	 PmfE7D+WCiy5GfGJxU1sNbfqpXT4keObPDOUtJ/PQVVF3CI+Uc/MmlweIZ+v6XX3BcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=wGUTVFaQ;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=NaySasqw;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eUJzb9h4;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403C606A321;
	Wed, 25 Nov 2026 02:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1403C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=wGUTVFaQ;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=NaySasqw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eUJzb9h4
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP29d5K240448;
	Tue, 24 Nov 2026 18:37:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=W0g3GoTyRwkwzDOB5c77tzuclbMYy1bg2sTCIqIyzH0=; b=
	wGUTVFaQ4R43V8lBy8jsiFsU9l7O6OM8zvcNAsKaoPT+HdXpxYPLZHKCBVFMVIeW
	m45/IYODhtdLuWzqBnTh8SqXHRajbl0WXpdhmSvT5bY22a1xgJW7xGx8nb7icAZw
	kHFnTtIP/nv1k+mtzUt4SYdRt8uz1vioFXu7q8HPbXvgfxAF0QVDw4lKagZAH0lw
	lZVW+R0NL9Vxau8bCbabv92WiAlKrxtdZW2lcktUtm8Di42pZwqAy3qHDXqJyYsb
	l1/01eSsvSSSsHRm1EsdVfhI6/WjhiAmvd+OJWKn56slJ3Q8jd8//y4GBuz1pi7Q
	JC9dzyIcJNxKV0guCNTTZg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j5dr13yvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795574265; bh=W0g3GoTyRwkwzDOB5c77tzuclbMYy1bg2sTCIqIyzH0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NaySasqwxm5iq/FpVQzfomy06H7PHPYWRZXVwRK2zJwx/dhIeW4I+y0IfjE+Q+crV
	 cV6BuyuOdozflIUQR/eZyAX4j9AzCffYtqJpBk0WBbTMaQ6sM+y0n5jZvnKFDLt79G
	 A63gCJ59hhNf71yYEF6i15ltfv3KKfigATKraoFe9b0s8OEZ0ipSJoTt5tU2Ft1OYX
	 dEAn0qB73XiEO6PLZ+IMDHq2wiILId5Y6msq2y4/xUCYmeEOOPfG8mqj9/5q5zkrxV
	 yucWDR8+/OT+wNl41cJqZOeEGTYYwshEknc3mgEJQKMTceKuDXiHQOr9h7F+B69xlr
	 Y/d7gL6E4z/Kw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 92EE4400FE;
	Wed, 25 Nov 2026 02:37:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4772CA0076;
	Wed, 25 Nov 2026 02:37:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eUJzb9h4;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00100.outbound.protection.outlook.com [40.93.13.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8A83740105;
	Wed, 25 Nov 2026 02:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkLnjXLn2hAcslu/ZIntG1/v6gN+0+b7u2G61ZHoPlU6Dwm8AECtwJRyZR2syHumMFQlfbSEyaBYqpEX+s5P8gZW4tEnfYIoYFINGnnMVEJiU/9YTiP31gIR0jZOvOpamoOhH0Iq4q3V1I6FvW/77zCUvadGxhW2C/1KwXFtSQNtHniK8GFAZ14KIOJ5+q9XDjVppw2oyHk6vYtAPcbg2IdmCZ94bNQ2T4DJqcp60PYRlkG0Ga4eHxQEk6KMtayj4G/BMJf/ekLY5QTBElr05+OJYskAVhMp4abG4tKuaZMkiNeeuAOZL/qVF+2cNSPm7bmZg7KJ7aImyUhSkqi/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0g3GoTyRwkwzDOB5c77tzuclbMYy1bg2sTCIqIyzH0=;
 b=HTtkfojNRdJw09U56TuGPx4y+d83BfGaSj+jMI7MSzfkKzbpLJ4QerNgBxt0PqIma+stx08XeUwx33KR0i/nWv8xaHWBqnE4zY8MmXJY3lDG5WP/xUgSp7DD758bOME7Q0gD+N+YbGoHy02e0R+NgOpDaCiQKoTK7LdV9U5ew2KXQAIzbphUBmOvzNgV+Y4wb7Rqsax9y25JvHX8oyHuLwqWzlwvxyehc1n1XX61AuvYe7CXGo3RLpHgkBYcVIHttqptl19R1gT//1ZctUY+uF0CA5FE+kYWhQaNXw3W//W7qK5uEqmuKHuJa3DyS5op9PK0J8u5doogB7Zh+220Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0g3GoTyRwkwzDOB5c77tzuclbMYy1bg2sTCIqIyzH0=;
 b=eUJzb9h44zm//ofQ0LtQgKgveWspHPKRjnVaA6G4+7sbrrLXTyYPuAZrM3LNoyveT4irRv26ijtoU8C1ABh8vLVwo7e0LIN68EzxvdOwc2+GKpspylSYpbn/54Hl+Da9QBW1ty3PjS/wJOlzVx54dhX97jrwVWVkgtezRKMfKUM=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 02:37:39 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 02:37:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Joonhoe Kim <26rote@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "xu.yang_2@oss.nxp.com" <xu.yang_2@oss.nxp.com>,
        "aiyengar1990@gmail.com" <aiyengar1990@gmail.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
Thread-Topic: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
Thread-Index: AQHdcrBEIpS1iUqd6ESe3x29MIIRN7c+JnsA
Date: Wed, 25 Nov 2026 02:37:38 +0000
Message-ID: <awZHwRiICsPs-UyI@vbox>
References: <20261112141512.1840-1-26rote@gmail.com>
In-Reply-To: <20261112141512.1840-1-26rote@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|DM6PR12MB4092:EE_
x-ms-office365-filtering-correlation-id: 31704b9a-9ae3-49fe-2990-08df4a9d1210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|10067099003|56012099006|5023799004|11063799006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261021135927099003|261102123227099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 qrWaR9o7tsyk7BuESNe00dGEhm5FjNv7mVaYOymlJDW8Lgv9jSag23qyoa4lgZITP19mVFruo7FreyDZ/fR3fth1f1ma7TXbzAUtNIaRw8F8kyvgpVT0udmScoeVXgDWB7XOWex/S68+YvEWaadSkcJYl37xuo1Kv9VD/Kv0HHyhF9IpOfh8uYGQZnZoci/DgcGpi/ZUqbvrqmVXSLUouBclNVdR0i7bxrfHs6nlJjwJFAIcj5ky+NwaHn7HhJhr8hODPp1cpsjw7SA55av7b0GKZeAY8V/B0m4ichdd8RWPUWHsfg6e+WWr+NQ6oRshIYna0lsTt94uoLHo5hlgBAlmGV1mNH85bvG5jKOSNbDMzBMUyq2AZumzQCiP2Oh4RJa/JA3zYXC7uhvXvWhyGihKzp64DpP1ZBaj2mzMQDiGMKDqme7wkffbubymPkH4ZGSD08Dh4acBUL4A/qGUDUjsjscplu5BoMGOYXXlu39cpNOW0K/i4DrZIe+mTbFm/qU+wBAjP2bimZ0hVhPw22OE9dqwwMR8fD/Hn/buDjVVA9MoAtY3lBmUMDndaTlYOerDSf4jeGGTXgYbfioQJDoTVHVsgs6GlXBE5TrkbpdTcEbRdVOgMWWs1ZcjI4dQR6dZ+qypSsxMeNMC2/p1Pf1ZSMUE4CQQR28aK/joJF/TRZvU/CT21Lz02x82QYGrdfXWfjbaANrXIe60phFPPbb8/eJ79joRNptPPlN2JXE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021135927099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2J5VmlRVVMxNFQzeDNaMVNSV0xnTExVMFdXSDZmTnhTQ1FrSEh3bjFsdjlu?=
 =?utf-8?B?UnpXSXg4RS9XWVJhMU1GR3dSY0VOZ3pSZ20weUtITXJVWFN6bDZ5aVYyamRR?=
 =?utf-8?B?bHdJVEhpazZoUElwVjZ4amJRM1Z4WnlRTllKZ293cHlsclBBeHptcEQ3Mzh6?=
 =?utf-8?B?QUJjWUFFVDhkN2ZZMVJaTjFGN09CYU9uRUJhY2hBdE9JZE1KUmNnTUFTeXI2?=
 =?utf-8?B?YVFOQUE0aFNObTYxQ1FHdjl4bTJWSFhjM2NsQkhUdVRPcHB2TEwyYkRFcXA0?=
 =?utf-8?B?aHZhUFVFb09YaXBielVDUGkxVmUycXhtTE1vS2FqdFpXQVo3OUlFYkZaU29m?=
 =?utf-8?B?UXErR0FmTXRxTWN4R1pVaWw3QWgxSllpRlExTlF4Y3E3RVhoRGJFdzZXcW5v?=
 =?utf-8?B?MnRIVkx5bEJBRU1kSUtVVjNwQzN2Y2JleHdXRHFxUG9HUjlqNFY5TmhhWUZR?=
 =?utf-8?B?MzdnSlpsMDdTTDdhUE04cWFib2VYYjExWWRLaXRYdzV6Z3laYmJOb0w1cWVC?=
 =?utf-8?B?SjNyeWVwT2M3ZWhyaVN2WFZpSjh6MW1KQVhkZGs4ZTh0N3dhbnVnZkpaejZ1?=
 =?utf-8?B?V3hXcW9GTnkzY0NENmwyNkdtTFFMcmw3QWROVzJFdEtsamtva3FJNExtQWFS?=
 =?utf-8?B?eWNPdXlGT0ErVHhSMklpKzZKUnQxd216cXRkZ29TbjRjWVl4Z1kwbnE3Sjlj?=
 =?utf-8?B?Z1FBeXFiRUx0Z1MzZ3hEbTh4bEk5SzlaeFhzN2UrZVdwcFBnR096c0p4TER1?=
 =?utf-8?B?cUdjWWpiMkhsM1kyWWZZK2FJcmxRaGdLc3BYT2FNdWFUalA0allDUTdRODZ1?=
 =?utf-8?B?WXJ1MHV0K2syVHVSWjZtMFAycUlLTFRCZDB3T0FzeVkxMXhTWFI0U28waGxS?=
 =?utf-8?B?OEljR1RJL3pWMXp6S3F3dVp0eXlDcDRhdXU3QTY0TkgwbGxITlpUNnMxN2VH?=
 =?utf-8?B?d2xRU2xmMW5JZDlPUyt4WnlIUkp0OHJDdGZXN3JUZ3NyWmtpTVo3SlUzMUdw?=
 =?utf-8?B?bDRWK1JnK2MvOENoWFdIdUlGeXNLUlpjNTB4VHFVVGlGR3AwSlg0MmNVc0p3?=
 =?utf-8?B?N3VYNjhSSTdubXIyVUR0akowOGsxeVZhVG9aZ1JvMU5JbTJlRnpsQlN5dzZU?=
 =?utf-8?B?UXd5UnFXYjhFVDErWE41QllOY082RVM4RUJKazNUd0hVVDNOYTZEVjhtbUdJ?=
 =?utf-8?B?eEpJNlBPMU1ZaXJpdDBpZTU3ZkFaOXZtNmpOSkEyL29oY1paS1VVc25ZVHJC?=
 =?utf-8?B?NTdWSU1Ob0N2Q1lSNjAwcnN4K0RlNHFmbFZ0ZDc3M3FCNVFtODhMUWRvbnM3?=
 =?utf-8?B?dHVFYXMrbW5ma1o5WEFGZU9MUk1uRGZXVzU2THVyKzR4dFNJVHpQRGhsZUE1?=
 =?utf-8?B?UTNuRDJzTlBvbG5vVFBNVCtYZXRRUFBJQTlwOE9BOGZEZUFwcmxObUlySFFF?=
 =?utf-8?B?VllxRjYwTi9rMGdZS0tyN2ZXUm9wYUVMOUpKbjI0LzRVVE5uM0Q0emU2ZEQ4?=
 =?utf-8?B?TkFaMVQxMkIzRC96KzJJdGRGVHFJcEgrYXZzNWRaeGxUTWJDVU9CR1lwQ0JF?=
 =?utf-8?B?YVUzY3d6Yk5aZGZwL2VMVmF5Wklid3BsN3RjbnVILytuRXJ3a0J5bllraGxX?=
 =?utf-8?B?T1BRakZPVWxYcE9WL1NEaEhyVE5ESndVa1RWMU9FemVpaFlibnJOVDZCaC9R?=
 =?utf-8?B?TnRFams0TG03blFmOEg4TU5Ibkl3K1dlRm93MFUrZ3c1ZFJGVDBxc2VnM0Jp?=
 =?utf-8?B?bUFPQ2ZlMHc1b2txd3VYWDVabVBtR09rZENkSVczTVdFcThDTEQrZkhQWkRp?=
 =?utf-8?B?dUZ6dThvTmo4d1IrbkVaSVo4a2RtUXdqU01PZmRac2pKaTE3VWg5cjVONWsv?=
 =?utf-8?B?TmlPTldOOVZCNVRUUXVRTnpaZzRFM0w1RGFnNThMcTlaTk0xY2Rma2IvV3gw?=
 =?utf-8?B?TUlSbzU3THdtcmJUaXpQb1RYYXcvNFV4TUpPZFVTQ3NzVlF1blBKcE5tRktE?=
 =?utf-8?B?YlNvL2tYQWtuUXU0ajl5MUZGdjROMTJKTzhNSEVITWRwcDdxNUttVW4zTHdm?=
 =?utf-8?B?Zy84UXpNbWFiZy94UjlWRzVudjQvRy9OamMwaGIvWDc1WVcrbURBdTJFd3I3?=
 =?utf-8?B?bHJsejc3TUdodXpzQk1ZSVlqODhVMDhFN0RqaERUTks4c2lYeUJ1N2NkYmM1?=
 =?utf-8?B?Vkd2WUlxSjkvSGpPRFBueEUvMHFuempOYnJWSGtoL3RSTVlLY3REVzdSOEw5?=
 =?utf-8?B?TVArN1ROQ05PTzlWMVBCb2xGVHAyTC9DSS9mNmIrSnJPR1dSL0p2UlNabVhL?=
 =?utf-8?B?V2tFditmdzRZSFhyeDlKTExGZkZoR1IreHZhZjNCT0xMeC9FSFNFdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76C7D6FB88C5394F8744EBE2A0184BFD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Cbdwz7jrYSHmpkftgOaRbe8hCyt6/vL5QBum/E0vX/cQFRyYLwX997+6iHolF3/Zk4Xm0KYzgzyUlhGJIspYAKjtoXsVIFxTuk7MKZ99IGEMaHBP+64iL5VkZxvQGlelCqJiCSnsIov+duKBPNTbGzPyKMquatkibGoiTUn5HlUG88xFhV32TVoNHO9Qp4TLxRe2bb21ATHzZR8zJ+WRM2vGjb77443HFzJ5oNFagoIOeg+GjRrN+GslxksXK1ttj5IDrmrEnedQJXeaED2eOxYmQkZw8EFGmSw9LABQU6Yd2tGOwKqmtf4iSuXnWiAa2Ij3JhxfcyWON/vnWs3e8A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j2/KLKvq145HAOKQgBstLhv2cAP3k9dgBCyoJaB2XlIovSjvVof50JSPr1WlgLJ8Qx8JsMozOLxwpN2Ag0+HDk1gHOigRDJ1Fvq9NgzJMXsjlJHTv70odZE5fZCC5hfQ8Y2UZB1ww0jfAXfq2dNkmSWPvgHqBRScyxvVBQWl/ZV3PVHO2MlAgrt6aPrmnxqllX8siB6AZfaqB/3po28fS61KtoItBN+xPc2wW72CLEfrqp+pD8CIQJ3HIl4dSvdLlmGyUeOn9qBqzlgNJseb0n6y/qD7AgZK4dpRcx+cZVk5Yad9LPCYVkCQBC4aslMK/P5Aj6BLrlpeIrKkMM4eIb2arA/i4I24lRSx3nxmCVipAz54l+3gC/E/jusquYkhi4eic+ZgPkTN3B+CNkNg2Nilo1xB/g5bi2WPC0XEsj2vLmWkzOo2wwl79HfoVf99dvtuZy2Ja6mxkS9F3HFnwKZOn6DQpx7XH78lT6yrdxv/igrWCQnQSGI0nwPV6LMa4lhj+8pFMMux0cHeyU6ihKYgBtjQnmoKyCaXiWwiDZiaJuE5GGpLdGW+Z/XkaCOCYopGamAANArhOx3D6r95GyAFLKIF/keIsWd6lo+9cfHerAy3eWQCmsJcVtDI9J8nrwxaV5fOZx3R0MNn3SGf9g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31704b9a-9ae3-49fe-2990-08df4a9d1210
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 02:37:38.3103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBhBjZNveHUVAYw2QesT4aMDmtfxE+aj0krgUoGvBgK2u4RwkNoz+qk8G+J6ajXN6eXXFS2yrlSdSSMT5vNrQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfX5Wjotn2lRORY
 2Gs32sN8s3UO3PGcHH6+r7AcizeEBWCOtGvuaMRRWG+w1aHK+wGOWeZUNpz1SdA5LFBZVmL3DtL
 YqVnDViNc8e9nugeIwyA92LRplVFqvnQ4+JrILMizw4NFc9DnuV3ZV0hcTj/3m7u+z872k6rENW
 V3CAWLEcmwwf6jpbcID2cTPIR94mIu4EOzfVCg57wbMkQzd2Id5oMaG4FRkA3nJbHFsPQAlnwlK
 9R3ZFP0CTiqAvkKREwTl6H9EjgDqY7pFJGXmYp5nPja9zvVe+ui8/qjryO1fnUPSOtS4gN/R7WX
 tnnjpkheG0y/VB2yPsmY5jtDUfe/45YetyWGOSRjsk1CV/OM/ZbJYWl4R2/dCGrNvF11Ghiiw+o
 NTXYOYEa1R8CzN5vgJoeQdU4cWW8bZ5BMFAVCeRFrYL/2IVg5rolVfWWZbWRPHPu/CU8HerlV5R
 oT8Kppxip9HT4cDqFBQ==
X-Proofpoint-ORIG-GUID: l7l26oVSxAXSIEWTpfOKpCLwutzzvSn5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfX0ASn0B78sJZL
 D7+PuUU8pgjU9jOtUfBTKLR/fhvwCKsg+tqMEKWdl2Oov4X3clZaGYghciG9ZcnJBCqLfM/v2Pz
 dIX2CvO8YDkzEx48gwPr13xp8qYJGDs=
X-Authority-Analysis: v=2.4 cv=NoxE4MdJ c=1 sm=1 tr=0 ts=6b0649fa cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=GqlTGYiZhiGrODLA:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22
 a=-4-sGo8i1FcW4KD7_GeR:22 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8
 a=kBvQ6TlqAmX3PEqpuuAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: l7l26oVSxAXSIEWTpfOKpCLwutzzvSn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611250010

KysgWHUgWWFuZywNCg0KT24gVGh1LCBOb3YgMTIsIDIwMjYsIEpvb25ob2UgS2ltIHdyb3RlOg0K
PiBkd2MzX3N1c3BlbmRfY29tbW9uKCkgcG93ZXJzIHRoZSBjb3JlIG9mZiBmb3Igc3lzdGVtIHN1
c3BlbmQNCj4gKGR3YzNfY29yZV9leGl0KCkpIGluIE9URyBtb2RlIChEV0MzX0dDVExfUFJUQ0FQ
X09URyksIGFuZCBpbiBob3N0IG1vZGUNCj4gd2hlbiB0aGUgY29udHJvbGxlciBtYXkgbm90IHdh
a2UgdGhlIHN5c3RlbSBvciBuZWVkcyBhIGZ1bGwgcmUtaW5pdC4gVGhlDQo+IHhIQ0kgcmVnaXN0
ZXJzIGFuZCB0aGUgc3RhdGUgc2F2ZWQgd2l0aCB0aGUgQ29udHJvbGxlciBTYXZlIFN0YXRlDQo+
IGNvbW1hbmQgYXJlIGdvbmUgdGhlbiwgYnV0IG5vdGhpbmcgdGVsbHMgeGhjaS1wbGF0OiB4aGNp
X3Jlc3VtZSgpIHRha2VzDQo+IHRoZSAic3RhdGUgaW50YWN0IiBwYXRoLCB3cml0ZXMgdGhlIHNh
dmVkIHJlZ2lzdGVycyBiYWNrIGFuZCBhc2tzIHRoZQ0KPiBjb250cm9sbGVyIHRvIHJlc3RvcmUg
aXRzIHN0YXRlIChDUlMpLg0KPiANCj4geGhjaS1wbGF0IGhhcyBhIGZsYWcgZm9yIGV4YWN0bHkg
dGhpcywgcG93ZXJfbG9zdCAoY29tbWl0IDY2OGNjNmJjMTE3OA0KPiAoInVzYjogaG9zdDogeGhj
aS1wbGF0OiBhbGxvdyB1cHBlciBsYXllcnMgdG8gc2lnbmFsIHBvd2VyIGxvc3MiKSwgdXNlZA0K
PiBieSBjZG5zMyksIGJ1dCBkd2MzIG5ldmVyIHNldHMgaXQuDQo+IA0KPiBPbiBhIExlbm92byBZ
NzAwIEdlbiA1IChUQjMyM0ZVLCBTTTg4NTA7IERXQzMgKyBlVVNCMiBQSFkpIHdpdGggYSBVU0IN
Cj4gMi4wIGh1YiwgYSBVU0IgMyBmbGFzaCBkcml2ZSBhbmQgYSBCaWxsYm9hcmQgZGV2aWNlIGF0
dGFjaGVkLCBhbmQgVVNCDQo+IHdha2V1cCBkaXNhYmxlZCwgczJpZGxlIHRoZW4gYnJva2UgdGhl
IGhvc3QgY29udHJvbGxlciBvbiByZXN1bWU6IGVpdGhlcg0KPiB0aGUgY29udHJvbGxlciB3cm90
ZSB0byBhbiBhZGRyZXNzIHRoYXQgd2FzIG5vdCBtYXBwZWQNCj4gDQo+ICAgYXJtLXNtbXUgMTUw
MDAwMDAuaW9tbXU6IFVuaGFuZGxlZCBjb250ZXh0IGZhdWx0OiBmc3I9MHg0MDIsDQo+ICAgICBp
b3ZhPTB4ZDg1ZTdjMzAwLCBmc3lucj0weDNkMDAxMSwgY2JmcnN5bnJhPTB4NDAsIGNiPTEzDQo+
ICAgeGhjaS1oY2QgeGhjaS1oY2QuMi5hdXRvOiBXQVJOSU5HOiBIb3N0IFN5c3RlbSBFcnJvcg0K
PiAgIHVzYiAxLTE6IGh1YiBmYWlsZWQgdG8gZW5hYmxlIGRldmljZSwgZXJyb3IgLTEwOA0KPiAN
Cj4gb3IgaXRzIGNvbW1hbmQgcmluZyB3b3VsZCBub3Qgc3RvcA0KPiANCj4gICB4aGNpLWhjZCB4
aGNpLWhjZC4yLmF1dG86IEFib3J0IGZhaWxlZCB0byBzdG9wIGNvbW1hbmQgcmluZzogLTExMA0K
PiAgIHhoY2ktaGNkIHhoY2ktaGNkLjIuYXV0bzogeEhDSSBob3N0IGNvbnRyb2xsZXIgbm90IHJl
c3BvbmRpbmcsIGFzc3VtZSBkZWFkDQo+ICAgeGhjaS1oY2QgeGhjaS1oY2QuMi5hdXRvOiBIQyBk
aWVkOyBjbGVhbmluZyB1cA0KPiAgIHVzYiAxLTE6IFBNOiAqKioqIERQTSBkZXZpY2UgdGltZW91
dCAqKioqDQo+ICAgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IHVzYiAxLTE6IHVucmVjb3Zl
cmFibGUgZmFpbHVyZQ0KPiANCj4gV2l0aCB3YWtldXAgZW5hYmxlZCAodGhlIGNvcmUgc3RheXMg
cG93ZXJlZCkgdGhlIHNhbWUgc2V0dXAgc3Vydml2ZWQNCj4gZXZlcnkgY3ljbGUuDQo+IA0KPiBS
ZWNvcmQgdGhhdCB0aGUgY29yZSB3YXMgcG93ZXJlZCBvZmYgYW5kIHBhc3MgdGhpcyB0byB4aGNp
LXBsYXQgYXMNCj4gcG93ZXJfbG9zdCBmcm9tIGEgcmVzdW1lX3F1aXJrLCBzbyB0aGF0IHhoY2lf
cmVzdW1lKCkgcmVzZXRzIHRoZQ0KPiBjb250cm9sbGVyIGFuZCB0aGUgZGV2aWNlcyBhcmUgcmUt
ZW51bWVyYXRlZC4gVW5saWtlIGEgc3RhdGljDQo+IFhIQ0lfUkVTRVRfT05fUkVTVU1FIHRoaXMg
b25seSBhcHBsaWVzIHRvIHRoZSByZXN1bWVzIHRoYXQgZm9sbG93IGENCj4gcG93ZXItb2ZmOyBy
ZXN1bWVzIHdpdGggdGhlIGNvcmUga2VwdCBwb3dlcmVkIChob3N0IG1vZGUgd2l0aCB3YWtldXAN
Cj4gZW5hYmxlZCkgYW5kIHJ1bnRpbWUgcmVzdW1lIGtlZXAgdGhlIHJlc3RvcmUgcGF0aC4gQ2xl
YXIgdGhlIGZsYWcgb25jZQ0KPiB4aGNpLXBsYXQgaGFzIHJlYWQgaXQsIHNvIHRoYXQgYSBsYXRl
ciBzeXN0ZW0gc3VzcGVuZCB0aGF0IGZhaWxzIGJlZm9yZQ0KPiB0aGUgZHdjMyBjb3JlIGlzIHN1
c3BlbmRlZCBkb2VzIG5vdCByZXNldCB0aGUgY29udHJvbGxlci4NCj4gDQo+IEZpeGVzOiBjNGE1
MTUzZTg3ZmQgKCJ1c2I6IGR3YzM6IGNvcmU6IFBvd2VyLW9mZiBjb3JlL1BIWXMgb24gc3lzdGVt
X3N1c3BlbmQgaW4gaG9zdCBtb2RlIikNCj4gRml4ZXM6IGYwOWNjNzliNGIzMyAoInVzYjogZHdj
MzogYWRkIGR1YWwgcm9sZSBzdXBwb3J0IHVzaW5nIE9URyBibG9jayIpDQoNCkNhbiB3ZSBhbHNv
IENjIHN0YWJsZT8NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKb29uaG9lIEtpbSA8MjZyb3RlQGdtYWls
LmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAtIEFsc28gc2V0IHRoZSBmbGFnIHdoZW4gdGhlIGNvcmUg
aXMgcG93ZXJlZCBvZmYgaW4gT1RHIG1vZGUgd2l0aCB0aGUNCj4gICBob3N0IHJvbGUgYWN0aXZl
IChTYXNoaWtvIFsxXSkNCj4gLSBDbGVhciB0aGUgZmxhZyBvbmNlIHhoY2ktcGxhdCBoYXMgcmVh
ZCBpdCAoU2FzaGlrbyBbMV0pLCBpbnN0ZWFkIG9mIGluDQo+ICAgdGhlIGhvc3QgYnJhbmNoIHRo
YXQga2VlcHMgdGhlIGNvcmUgcG93ZXJlZA0KPiAtIERyb3AgdGhlIGNvbW1lbnQgYWJvdmUgdGhl
IHJlc3VtZSBxdWlyaw0KPiAtIEFkZCBhIEZpeGVzIHRhZyBmb3IgdGhlIE9URyBicmFuY2gNCj4g
LSBSZWJhc2VkIG9uIG5leHQtMjAyNjExMTENCj4gDQo+IFRlc3RpbmcsIDMwIHMgUlRDIHMyaWRs
ZSB3aXRoIHdha2V1cCBkaXNhYmxlZCBvbiB0aGUgc2V0dXAgYWJvdmU6DQo+IHdpdGhvdXQgdGhp
cyBjaGFuZ2UgMS8xIGN5Y2xlcyBsb3N0IHRoZSBjb250cm9sbGVyOyB3aXRoIHRoaXMgdmVyc2lv
bg0KPiAzLzMgY3ljbGVzIHJlc2V0IHRoZSBjb250cm9sbGVyIGFuZCByZS1lbnVtZXJhdGVkIGFs
bCBkZXZpY2VzLg0KPiBPVEcgbW9kZSAoRFdDM19HQ1RMX1BSVENBUF9PVEcpIGlzIG5vdCB0ZXN0
ZWQ7IHRoaXMgYm9hcmQgc3dpdGNoZXMNCj4gcm9sZXMgdGhyb3VnaCB1c2Itcm9sZS1zd2l0Y2gg
YW5kIG5ldmVyIHVzZXMgaXQuDQo+IA0KPiBob3N0LmMgbm93IGluY2x1ZGVzIHhoY2kuaCBmb3Ig
aGNkX3RvX3hoY2lfcHJpdigpLg0KPiANCg0KVGhpcyBsb29rcyBnb29kIHRvIG1lLg0KDQpBY2tl
ZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpIaSBYdSwN
Cg0KVGhpcyBtYXkgY29uZmxpY3Qgd2l0aCB5b3VyICJ1c2I6IGR3YzM6IHdhaXQgZm9yIHRoZSBw
b3J0IHRvIGxlYXZlDQpSeERldGVjdCBiZWZvcmUgeEhDSSByZXNldCIgcGF0Y2guIENhbiB5b3Ug
Y2hlY2sgaWYgcmViYXNpbmcgb24gdGhpcw0KcGF0Y2ggd29yayBmb3IgeW91Pw0KDQpUaGFua3Ms
DQpUaGluaA==
