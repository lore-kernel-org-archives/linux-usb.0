Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6DA33E36A;
	Thu, 16 Jul 2026 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784246029; cv=fail; b=TeI1TkB6yKN2RrJJZCYPTbt1rBPIfvoS1suaeCGSJod0J7j08Dr4svWE6ctakFrmNwMSceGJfl+gD0ug25nK6JYiu7bwgUb/NaUobJMTgZy1n2Y5WezjLwyFgNobl6rbRON1buqwjhWV56zADgr2LDd+K+688D/H9id9Ts1tNEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784246029; c=relaxed/simple;
	bh=WAakHW4dCAN9c3tWhdOCgblF+AXjGUB6SH24kHFn8q8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FWPJLSJJGLGffNZPxDi7EnOhlMr0xWMePRQFW7rBg080Lok+ezuLFqaAoXzWgrJdnzxUdBDQPyzOeEiC2iCWFhTLKASetkK7/ki5Bj+JpomVFbAEkDvVt2gHaj8ktdKUWikyDL3s25u+QxvSBDbYWCEeCAUZfLjaOUfzPOiXQlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lR3gqooS; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mMU5Yybs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uJFDXAjJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lR3gqooS";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mMU5Yybs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uJFDXAjJ"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJQvr2002504;
	Thu, 16 Jul 2026 16:53:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WAakHW4dCAN9c3tWhdOCgblF+AXjGUB6SH24kHFn8q8=; b=
	lR3gqooSQIXbzRGRMJL/jFm93kjfDpt964JFsjTCa4q6f9lob5BWIP3525ToAPOI
	0DfwtUFr7o3p+S3p5S/uEjSA9vOYD9HE+j+nD1PV6S1M8qfBtx6903RlgqPBUqp4
	1JIrIbVmQE3fl7lQKr4/fy6jjCu6iVNGb+tnF7gn3Z31l2dAMvKkyY5XzP1pt7iO
	pUiFj1NNQq8wXJSb73WOt9BA4H8JlhCpBHxJQ4O16JZ7aNNeaWbrg2mQKA7CeXJ5
	syR1ljixOOCGL6gRG6tKWfTgDSIQfUzH0ca+zIaEE1JgbxQ+ATQdZJ7R7gQv7Yt+
	mkZ/ei9+Uh0YL74svquM5Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4femeh24gm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784246022; bh=WAakHW4dCAN9c3tWhdOCgblF+AXjGUB6SH24kHFn8q8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mMU5Yybs1k5TQC4g0Uh4whISXG4joxekh2ju64Vb8X/2QF11RVm8rOCTWFb3wY3f0
	 9JxaD/o6vFrmzH0Ca7dM/6vG0wpOkeFLAsdC2FPKvVDkzgcyxhTG3g7B1AzkZf+ynU
	 9d6atLVwCIYfWrBOGmzDUtbLqUT9yaRubJCibsP9+ubfkACOFYWiVsnympC91Gmp5j
	 gNqFQaXTrwnXuYMBsFquVg0yfj2nO7cfFZXLU4tKf+5jaeLg7N4wOkPdeiW6c/8gNp
	 +vUhlzhbAebRm1zNrTy5kSD1brBrCyzUYkLzdGp0O6gpn8BeX7tahrV3VtlmFyO9Qv
	 fZ+RRhXs2G1qA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 650224048E;
	Thu, 16 Jul 2026 23:53:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 394D5A0F95;
	Thu, 16 Jul 2026 23:53:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uJFDXAjJ;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 89FC940119;
	Thu, 16 Jul 2026 23:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voBnOV9b+cjdOyitmtS4Yuj315cyPlUBCMbP2dFENf655/LWyDm8TLgTsTzFrdbbso8QvkX8mwA9zSG07/cu0QIYbzNUZPXx0fYY/GNYtXKq8fZhwBSzmQiCzFs48QO8OJ38xV3CGtqD7hmex1AmkdBOtm8jLNF/Em854aFKeHktwPcM4kU3dCtqg5M9fe964tUx4N8KeArWNbqoEl5+LQSzM+1QGLgHuy1iF+FXRS7CH3tgDtt1GYeK1mCEjOMjSeuZcs439NGvYhDl7iIC6ZP5wvxHoJMgD8Co0GhmRDMwuSBQAOq1+pyr4t/Q0zIE0ZcOE7RxyTZNEbJ9LACgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAakHW4dCAN9c3tWhdOCgblF+AXjGUB6SH24kHFn8q8=;
 b=xmeEmO9biXqbaBCs0PQwsDqObMa1kkzOYZfEbPHNje1CgPvzATI2yQfrH55vFQ4vfJ8bc4uBVbV2b0odmG2i1Qg+XsIZ0RFocxqOtmvPQBeNGQIlIkwRDyci7/iM6YYdP3oe+3G/X1Upau/ZMfWzTFwU71ezJRkuaRmhp3DPUOVKKmoVyDACwTiRQQgx3KScb6lcUEV9MSO6jVEzSXDUOSE2okxelNKljIhKP19Q8SyUlbuN1lg1TnHKTaK6gQFxAUF/vv2LAjHgUvdt8BRpmbdDOqXWqSaiqHRV5K2P3XJBj3oDFSXCSUjbZhnsi0dkYQTdi5DD8dQG74VrkJUIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAakHW4dCAN9c3tWhdOCgblF+AXjGUB6SH24kHFn8q8=;
 b=uJFDXAjJQ8xsXQKYjmZtVTVcUQJjzeinaOmGo1oGCRYZunZuGpZAI+xw3CWV4xr9LIohuOiSHTOSAUKHDC1oyfbKoMRUa2xBGEuMpS9/1Eln1c1S8h/yT3gIprioPujRtGGEp9ZwBZdOd1da7wI/dlJJSbZjQqorDZDmUyPletU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA0PPF002462CFE.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 23:53:35 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 23:53:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
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
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABHNACAAVgyAIAAKNiAgAFk8IA=
Date: Thu, 16 Jul 2026 23:53:30 +0000
Message-ID: <allhF1peV5QZ-QLh@vbox>
References: <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox> <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com> <algVe_XD5xpB_w2c@vbox>
 <alhDjZ0gJZq_7G6z@hu-petche-lv.qualcomm.com>
In-Reply-To: <alhDjZ0gJZq_7G6z@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA0PPF002462CFE:EE_
x-ms-office365-filtering-correlation-id: c90ef3f7-4cf4-4037-fd2b-08dee3957056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info:
 tDbfz6kHHNv+d5xF+EmKQgLC5RnHTL3PFR0XrG7BrCm22IVAI9TVCN27AoGFjvR/8YlIhGYP8mqzbxQ34zOo5Jh2srHsLi0lkPVNs7vaIFW7QzDpWgJvxt6pTjLk/EDwZqt/kB7G0ESdlAFQIMKGOflRhfyIUHIPnC/Rk1VpzD0V7gGHM1DgUwNCJbwdHcVzS3BpuXyoDmCVqYXYyn/rofNr9brScTTN993uyezDMyfOoIEOWV/Zvb9Mk+IKHrCPzVr9HWFxBahke+F5eEUXqpdN85/nxlPaIB6e118CVn1bMmkS55zK5s6KW/Xqt5RNIE6SP6XdJexM7qAxvhg/dAfne5hgeeXPW3y9iT6KiYaz0i+LJFtEFAEM/8cDsX4usiEryf40fRVPxY8IHRPfrZeMKb18tFNWlN0gEynTgT/TDgT1VE13qfFEh+K/udne38j4BIN+qE3Xvg4BPiA3hEg+7CMJJ0LKSl/bSTWK7QHV2otx1ddVsr5Lqt71uBwLKQP1U+m/s0bN0RfzvWFvCYdIrkrpblfKd3Urruw7YW3K/KbeJZag+4cOQuU2cp4R9zO5FpLM7z02BiHIB8Hq93yXm3HSkjkuYQIyDMo9sFVGwHjlPZsFKa7zubd59aNalqMCpu2P+DR/bl22qFduvZ+ehXqg2exfe8dj6XbyLouLAzLKAS2526CsCrR0yYC0cesM0MrMCHleTZZ9AUeZbKhoi/mTyll2JEbV9PsDi3U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFdic2RISnI2RHNkU204SnIrdGJVZE9pZGd1akZ1VkNJOVluTFNmaXlqZ1o3?=
 =?utf-8?B?T1NyL2xFYVBQWlFkZHk5NEJpaDlvL0wwZmVoaTVvR3NPVWtXenNoV1BHYjBX?=
 =?utf-8?B?WHZBWDFsWW1HcS9YSU9HcWE5SXVIR3B0eWFvWlhKS1pNdDYrQXJpQi9aUEpL?=
 =?utf-8?B?QjliTHNacGkvcm9GSEM0d3FmSkhUYiswSVZHdmhINGkyRk4zb1JmNmxqRlpu?=
 =?utf-8?B?TzZxdU0xOHQva2NoS2VkdmN2Q3hMZ01NYmE5d05Pc2J0TWtLMWtxSTVYbGlD?=
 =?utf-8?B?eVBaV1VScVZvYWVLcXRFZWQ3cEZ2NWtMbXM3UHlTL1E1ckcvSjZNeS9WTUtS?=
 =?utf-8?B?cWVsUUptc3FwRHVtem0yNW9WcWxiT0w5ZnRJMVlqVm5qU0Z5UGVuQ0ZhQnJ2?=
 =?utf-8?B?bUJ4ZUI5Z3VQTEt6MTNHcG04UUYwZFdRUCt0ZlpzZDlrNjNmeUJrR2ZKWDQ2?=
 =?utf-8?B?amtDOGp2ZWVRcTNYcnJHc09pdXhFYkZqNWNLL3dJZUVvaEVURlgyZlgyZ1VV?=
 =?utf-8?B?WUJKcUxPMDhxb0d2N3hsVEZjK2h5SlE5bUhoVEp6SWVvMTNTVU5iL2ZDNGVJ?=
 =?utf-8?B?RkJRMlJlQzhhc0xYclkwNEpuOG5vYmpWd0ZqOWZmYVhuR1BFTW1EdFcyK292?=
 =?utf-8?B?Zks3eTZCc0JxeWZqZXBsMlFodWVITUlZY0U5SmMrT2RjVkIwVHFqQ2Nob3dn?=
 =?utf-8?B?NmNFUE5idjYxNFhEWkI1TVh1WktoVllCcmMxRlpER2pITHBYMUwzVnFFditi?=
 =?utf-8?B?b0hpMGJLWG1SZE1pQmhPTVlXNEVVeXZHN1dIaUx2b2pUT1RTUllhMCs4RTRR?=
 =?utf-8?B?cWhKZTg2L0hsbllxUXBoU2NQYWI2NGQ5dWZHZnNCL1A3ZlppYUU0ZHR1K01X?=
 =?utf-8?B?UndzZVVrQUFaM1dwYU8xdnJLbVNJV1hmT2pBT2c2cW0zK0JycllxVGt3ZDZ0?=
 =?utf-8?B?cFZla2MybUVETk8ybC9qS25kbFVsTmZESXZ3c2ZSRUpNcWpoNDZ2aXFvYU1U?=
 =?utf-8?B?MVhjdHIwam9BemMvbHQ3WWkvSGdoTzM5N2ZtU3RKR1hRRk1PVStReVpCbXds?=
 =?utf-8?B?WlRvUzlTeTB3S2tUUGpnenRzVDBXZVYvSDdpNENmNnI2YlNiV1VQNGpSRGdI?=
 =?utf-8?B?UHo3YnFlTEJveXkwTW9vL3RzMGVJZCt6R2VQS1lVZEJXbVFaWUI4VnNYR0M0?=
 =?utf-8?B?T3BUVFlNSDhJUUxOM1NHZXRSaUd3VjNVbTRjK0xuZGZYVFA0TUZhTHNTVldm?=
 =?utf-8?B?ZHNtTFNqYmVsS01VNnRRQzIzelFkQlBEUkE5UlBQYlJOeGRIMVFEbndsbXhl?=
 =?utf-8?B?bnNZMWs0U1JpMDlTWlRmdGF3Z0s5aTF2MXB0cTk3VFBrVVpJOXRIcUVhS3Nv?=
 =?utf-8?B?MDAvRFVFaTd5WDJ0aHBxQTNrZitxcnM1ME80YXF3SGhkU1dUTncveWVFSkl2?=
 =?utf-8?B?amROcDhrd0g0eEtJWFk4c0ExbGFuQytXeFA2VTA0aGhubEFQMnp0a3dpbGw5?=
 =?utf-8?B?SkJJbENuUExFam81blFmaE5JSGtMKzRadU5RL1lnVWloKzlCOUNOV2gyRzlF?=
 =?utf-8?B?Z0JtekhvVi9UeW9nYkprN0NSenNhV09INmRvWmM1OERWeU1nVnA4aXRrV0Ey?=
 =?utf-8?B?R3RtR01vSGEraWtzQjI1ZDJPVXpwUHlaYXNsbEZTUnI5QzZVR1Zad1pmOXlF?=
 =?utf-8?B?cEViQ2FqekVsZ2hIUlFPVlNRQjB1cEZCaWVyVWJvV1J3dU5EMDVNaEFTTmlN?=
 =?utf-8?B?R3FWMFFyWXpMSHBaZGltR1FqS2hYMkFiTklkeWlTNmFqMjBtNmp6eU15aHZH?=
 =?utf-8?B?S0ZaVmtQWkJLRnd3Q29LRUVKTFdSUGdGRysvK2UzWGdiMXFVb1dXaThtcVds?=
 =?utf-8?B?MlhnK1ppZXFyNCtHSDBKWDRzVEwyVzQrV0VWQm0ydTRXNFF2Z3R4ZEJnUnJJ?=
 =?utf-8?B?bHU4NGZLWDJBVUJtQ1FCbTRvUTRITngvOEx3ekpjU21zeUp3MDBWY3ViUU4z?=
 =?utf-8?B?MHFLMWpaYTNlQjhYb3ArRUlhTHFGMFZtK05jMWpPS1ZNNS82L3QwK1pTanhh?=
 =?utf-8?B?OXROcjB4eGFFR3ozejhqc2VhbWc2SExmdHpwVzJ3K3NCdk54NjlReUZHWWJX?=
 =?utf-8?B?UHdlYkJZUWVmMEFKMTJQbEZ3YWcyaHV0Y08wUFlyZzJTNDVSd09kZFlJQ3hI?=
 =?utf-8?B?VkxvOVdKams3RUwzOFJLbmJxcG1WTVVCN2JjQnMwWmw2WkJTV0d0Z2YvdmIv?=
 =?utf-8?B?TXFPbmtzL25xWGFBYUpWMmN6KzJ4MnhGakxjL3dEMGgzbE5QRHVMVUpLR2lt?=
 =?utf-8?B?eXZNanUyeW9EV053RHdCVUZzNXJDRUNwVnljaDEvYjNGWkNndEJwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4A110958B465847BB9A06075A91F390@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	dvTrOQEXwSjqG05pwXwr4Br1Ds4WAJAcpnP1Iiy5Z0UUTrgh/w+fbv/nK151rZcfbQl3z1XtxdlGKTTOmm9fsaLtctIFFum1t9p3oXkLMgFvTofWyFMLMzs+aTbyhPp7UwLtYlPT9WhJhPsC2NalLH8ql/USzdN/TG3hY0G6VLh4mO1E8dFjh+NlpBcSyIRgjLMl0YYTNOMvXSbaDKL+wef+5RT8IgnCKyAJlUpVgRkEuuKV6F4U6PORz4n9zUUZBDPX6Cc17Cl71bblZV3+hUKCLpSKvxtg4G+DS40sCXQa5cnpu8hOxNwxhE+z3q4qHjIh/hEJM2g4REZmBcWnMQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+mJke6QvlED7+HpZWaGWuC/CT8xq8r43MqqDEHbAA5iEbIrJmx2RPE3d7uN16x188Qy3hXaoJ/AYumbWKrIaJU2ITtJEgbqYVRD753jvnDGNT56XxstB4BSOQdUeZESQiDbCgs/p76BJLQM32G9ZihKHIV05A+xbdfuq4xC19CoSqx8Gv/b8jMzQeR4Sx2+gtWVCRln4+2UO6DVld4chDBdS+Wewe8pEzLkV2w1bEZVySKB9ht4B8aU3542qY0ECNBXe9rvalj+MVaB7GwBIZqpTpPusg74gmLFrbB3B5NQ5SFb4aWPDdofoDLWA+pU07ZBoFNspk11QGqoW/i+jgwcrExk/lU9qLiNjaqNZW8uiF71VVKWELOkfMumQR2EQGk+ChBTKoKcG5XrqJhzF0A2vNdcgU0FmVryubdgoHZbHkWeANKst6PjelukD0iOmGm+o7UROXh2w9zmXyA+M8me9FMPyEOu9V/UrUBPmm+k8Akhmpc+zV85K+1buXz/2mwwbBa5Xm5JTRWbV9607JXBoTHsGYrqhQNmqGptSJnGyCdDvCbiiPZF8cqbZR0Hv31N4AYECe9i50LeQhULScpmREoaJ7QJWGDcudfMpEdrHvsv0QBjhMKraReMjOTfpXG3vjm+7b4MupTS5wsDcww==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90ef3f7-4cf4-4037-fd2b-08dee3957056
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 23:53:30.7326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q29dId3+5j7dcwQoHoA7KAl9Fj/cfSltGZ290kDVrG+I82L6VPS3R/txvJHzzOg4VNVuvzBkjeKwD5yp7jBjrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF002462CFE
X-Authority-Analysis: v=2.4 cv=I8VVgtgg c=1 sm=1 tr=0 ts=6a596f07 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=KTMwEnhgltdA1SlDCbYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: AtaPOVj86lzrzbzm1W9ifu8CvLWSku-P
X-Proofpoint-ORIG-GUID: AtaPOVj86lzrzbzm1W9ifu8CvLWSku-P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDI0MSBTYWx0ZWRfXzcxxdcI0IFCt
 OOEASZl1BhhDdFVDUg1gYnVueLrN42DprA1zhRj4GOc9+xHyRnKq3eKfsOGNp1nuCE54aGMOM/k
 2T8VBmHuyRPu3zPDQqV+yYdbSvCZPFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDI0MSBTYWx0ZWRfXzceWVWN7OlVx
 VIPvFyIGCUb8B8pzaUOwQvfxXm/uxJriZAfQsLXihdCurgOplT4rKWPLipIkLlw4rk8YdOn10Yu
 GoYxEFnnl2aI2IJ8kqVYIFD4qzYTuIx5lZfUeai9q4LX+RStLkodc+/DTnzTWV8JM96ga4VKYMX
 aloGEnW2X0Md2jqftzlsNDcSJ3a+TIvwyJ4qWjHvRNh4Srzf9ybUuoiLrBdevtl4F4vDvKb6Mkg
 BWl7x4dCMj5vqxohhEMQbTC5NlOYuKpIX7s5C2hd5FFCpjIakExkU/kr9gC8ZuuUKrtx/8yAuOk
 NX1Sv6m25XTCLCY2+R/vsL/4kvgmJH/ap1Hon3/9mdfPzVacCkyPeCNaPvFtgutAZgafUAxaVXe
 gxWo+RFRVdwUsDAlvch/8OnwkuwReO2YXIct1LG84VSAYN26/UOZTs8Pga91zEHLobbtQL4uNXj
 YdJwPjdSXhZwfES2HBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160241

T24gV2VkLCBKdWwgMTUsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTE2IDAw
OjA5OjQ3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IE9ubHkgdGhlIG5ldyB1
c2VyIGZvciBhZGRpbmcgcGh5X3R5cGU9ImV1c2IyIiBhdCBkdHMgbmVlZHMgdG8gY2hlY2sgdGhl
DQo+ID4gPiBjb250cm9sbGVyIGxvZ2ljLCBhbmQgdGhpcyBpcyB3aGF0IHRoZSB1c2VyIG5lZWRz
IHRvIGRvIHRoYXQgY2hlY2sgdGhlDQo+ID4gPiBuZXcgYWRkZWQgZGV2aWNlIHRyZWUgcHJvcGVy
dHkgbG9naWMgYXQgdGhlIGRyaXZlci4NCj4gPiANCj4gPiBUbyBjbGFyaWZ5LCBhcmUgeW91IHN1
Z2dlc3RpbmcgdG8gaW50cm9kdWNlIGEgbmV3IHBoeV90eXBlIHByb3BlcnR5IHRvDQo+ID4gaW5k
aWNhdGUgcGh5IHR5cGU/IElmIHNvLCB0aGF0IHNvdW5kcyBzaW1pbGFyIHRvIHFjb20saGFzLWV1
c2IyLXBoeSBidXQNCj4gPiBtb3JlIGdlbmVyaWMuIEFsc28sIHdoZXJlIGRvIHlvdSBwbGFuIHRv
IGRlZmluZSBpdCAoZHdjMyBvciBwaHkgbm9kZSk/DQo+ID4gDQo+IA0KPiBObywgSSBtZWFudCBq
dXN0IGFkZGluZyBuZXcgZW50cnkgYXQgYmVsb3cgdXNicGh5X21vZGVzIGFycmF5LCB0aGF0J3Mg
dGhlDQo+IGVhc2llciB3YXkuIEF0IHRoZSBjdXJyZW50IGNvZGUgYXQgb2YuYywgaXQgaW5kZWVk
IG1peGVzIGRlc2NyaXB0aW9uIG9mDQo+IHRoZSBwaHkgaW50ZXJmYWNlIChiZXR3ZWVuIGNvbnRy
b2xsZXIgYW5kIHBoeSkgYW5kIHBoeSB0eXBlLCB0aGUgYXJyYXkNCj4gbmFtZXMgcGh5IGludGVy
ZmFjZSwgYW5kIGR0IHByb3BlcnR5IG5hbWVzICJwaHlfdHlwZSIuDQoNClRoZSBuYW1pbmcgb2Yg
dGhlIHByb3BlcnR5IGlzIHVuZm9ydHVuYXRlLCBidXQgdGhlIHVzYi55YW1sIGV4cGxpY2l0bHkN
CmRvY3VtZW50cyAicGh5X3R5cGUiIGlzIGZvciBjb25maWd1cmluZyB0aGUgY29udHJvbGxlciBi
YXNlIG9uDQpwaHktY29udHJvbGxlciBpbnRlcmZhY2UuIFJlcHVycG9zaW5nIGl0IHRvIGFsc28g
bWVhbiBwaHkgdHlwZSB3b3VsZCBiZQ0KYSBzZW1hbnRpYyBjaGFuZ2UgYW5kIG1heSBiZSBoYXJk
ZXIgdG8gY29udmluY2UgdGhlIERUIG1haW50YWluZXJzIHRvDQphY2NlcHQuDQoNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9waHkvb2YuYyBiL2RyaXZlcnMvdXNiL3BoeS9vZi5jDQo+
IGluZGV4IDFhYjEzNGY0NWQ2Ny4uNWNiZjE3ZDQ5M2FkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9waHkvb2YuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9waHkvb2YuYw0KPiBAQCAtMTYsNiAr
MTYsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgdXNicGh5X21vZGVzW10gPSB7DQo+ICAJ
W1VTQlBIWV9JTlRFUkZBQ0VfTU9ERV9VTFBJXQk9ICJ1bHBpIiwNCj4gIAlbVVNCUEhZX0lOVEVS
RkFDRV9NT0RFX1NFUklBTF0JPSAic2VyaWFsIiwNCj4gIAlbVVNCUEhZX0lOVEVSRkFDRV9NT0RF
X0hTSUNdCT0gImhzaWMiLA0KPiArCVtVU0JQSFlfSU5URVJGQUNFX01PREVfRVVTQjJdCT0gImV1
c2IyIiwNCj4gIH07DQo+IA0KPiBsaW5lMzQ6IGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5n
KG5wLCAicGh5X3R5cGUiLCAmcGh5X3R5cGUpOw0KPiANCj4gSW4gZmFjdCwgSFNJQyBpcyBub3Qg
dGhlIGludGVyZmFjZSBiZXR3ZWVuIGNvbnRyb2xsZXIgYW5kIFBIWSwgaXQgaXMNCj4gYWZ0ZXIg
VVRNSSgrKSBvciBVTFBJLCBhbmQgc2ltaWxhciB3aXRoIGVVU0IyLg0KPiANCj4gVGhlIEFQSSBv
Zl91c2JfZ2V0X3BoeV9tb2RlIGlzIG1haW5seSB1c2VkIGJ5IGNvbnRyb2xsZXIgZHJpdmVyDQo+
IHRvIGtub3cgd2hhdCBraW5kcyBvZiBQSFkgaXQgaXMgY29ubmVjdGVkLCBhbmQgZG8gY29ycmVz
cG9uZGluZw0KPiBjb25maWd1cmF0aW9uLCB0aGUgY29uZmlndXJhdGlvbiBtYXkgbm90IGxpbWl0
IHRvIGludGVyZmFjZSBiZXR3ZWVuDQo+IGNvbnRyb2xsZXIgYW5kIFBIWS4gRG8geW91IGFncmVl
IHdlIGp1c3QgdGFrZSAicGh5IG1vZGUiIGFuZA0KPiAicGh5IHR5cGUiIGFyZSBzYW1lIHRoaW5n
LCBhbmQgZGVsZXRlICJJTlRFUkZBQ0UiIGluIHRoaXMgZmlsZQ0KPiBhbmQgYWRkICJldXNiMiIg
YXMgYSBuZXcgInBoeV90eXBlIj8NCj4gCQ0KDQpTbyBqdXN0IGRlbGV0aW5nICJJTlRFUkZBQ0Ui
IGlzbid0IGVub3VnaC4gV2UnZCBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoZQ0KZG9jdW1lbnRhdGlv
biBkZXNjcmlwdGlvbiBhbmQgaXRzIGVudW0gbGlzdC4NCg0KQWxzbywgZm9yIGR3YzMgY29yZSwg
cGh5X3R5cGUgPSAiZXVzYjIiIGRvZXNuJ3QgdGVsbCB3aGV0aGVyIHRoZSBVVE1JDQppbnRlcmZh
Y2UgaXMgOC1iaXQgb3IgMTYtYml0LCB3aGljaCBtYXkgYmUgbmVlZGVkIHRvIGNvbmZpZ3VyZQ0K
R1VTQjJQSFlDRkcuDQoNCkJSLA0KVGhpbmg=
