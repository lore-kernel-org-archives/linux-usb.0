Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFC346E4C;
	Fri, 26 Jun 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782512228; cv=fail; b=dbe71/dWdF0aSHg9UhRl3fmKUkaH6O+ZDLLiZSN0THtueQy7zKpLfdnt2z2moz18SFsQ+3e2OY8qWX9KCpBxWR/XuIeXHLFRTw+YrDinzDaBFy0qrp3XpxFc4iIPPelP1JmWh3x1xSaBGKPhZqG9SXbLUwtXHxyofYZfvQHdHFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782512228; c=relaxed/simple;
	bh=f9Omd3fn4CNQYLypRUvoevtZh938GOFrtNI462Vk1K8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=On2tFI/8cTxY2xy6+sOI8DXIMpu49ASWBxOB7pdXGHWP9KPmLRcRC7S8fc2Z4t1bH5DCcUrwXqtB9PJ0/Q/5N9zR5htMPRoayuruQb2QIcPoYYAIo2mLZ4+9tEp1RW36sf1nQiIE4KlEldIuMjbEQGSQrkUaf3y3kV27qCBso1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=i9vrnpzb; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Um+OcsFq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=H8i57fOc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i9vrnpzb";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Um+OcsFq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H8i57fOc"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QKiX9l1733119;
	Fri, 26 Jun 2026 15:17:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=f9Omd3fn4CNQYLypRUvoevtZh938GOFrtNI462Vk1K8=; b=
	i9vrnpzb/BUcgHt6HWbJMLOubV+HgO9N330BlVy68C5iwxh1KIuPb3tE1zFhlkB0
	I0/B3nmEwQmM0+0/1DtIKB9qwtLSBY0G340NSWHjpHXwYAYlKN/fVV9xO5m4+D0c
	q1URcqFm1NWQRXRfnMeleZ/wGzI9kXgfU1dqG3W9cFobLJnALU9fepdbOz2OmJS5
	9mxgyyqI1StaO59299BahQCqeffnLjK7TBvrP4kP9gXobWGMqVibMHvS5IhlMhp4
	2QUmc5y4/EgnWwLusl2A3jZBvnvSekZh9tFmBxolBWx+rYE1/BRwME2O/PnAoXG5
	WOhNxKlTEBbN8vVj9LIG6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4f20qtrjv3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782512221; bh=f9Omd3fn4CNQYLypRUvoevtZh938GOFrtNI462Vk1K8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Um+OcsFqfoVfQbFGyxmbho53YJmF4CoDvmXY4QXflgJNvT6KgADqpsNT8Ec2vTwCi
	 LF7MzCXISNxEW8uZUXN4cQ1aa5LmnYiYK4f1WWjL0UYxEqVb9lvmQd6IdAK+ViORdh
	 LHBCt22wNpAd+95hbl8JX39xr4Jua9tiGHwn4UF3Qf9rBD3KaU/v46IMAlzMtIwmEh
	 i2cgOWbjyeV2BlhHC1mBvl1lOshqnLjv8pIeJVFcITD2SRyi4FRUDA2OstkNryrZJ5
	 HyV6O85uzRsVwF3w3cWuzrk8QU6Dkd36ucLpQuPjPMkuLGyjbeHGu44gJ7F1Sj0fT8
	 tCqZOyVRLI07w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03B814012F;
	Fri, 26 Jun 2026 22:17:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D02E7A009E;
	Fri, 26 Jun 2026 22:17:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=H8i57fOc;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00101.outbound.protection.outlook.com [40.93.10.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69B014011C;
	Fri, 26 Jun 2026 22:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tuh04VB+Ts7vFanKd9kcLU6ISHma3s0pOKQu1tTHCMH9DSDpjeFlTGQLscO4cEXOJUalbkg1SCdkpyNboStO7+VwiMaVMfGqsz3bvU4vq3ZL9GpZVCkNI/uUwr4tzCm3t1rJMLq+wIVgh2JsSSw8UGiDNoVJAGTlGzwoOg223jqaJRdwmt9by00kN1nout3eW3Odckcg1IQN7T7W3yx0/5I3nFeAEr+Qk9ft2Opwzh41u/wOyYXcvp0IVqnoEaHK/jYpMfaV6UVW5hYiyojY9fm8OU3Ej3VNwhUeQuPAYPSzS4gVvNzSEvRCXatXOpb7tjn+hb7qEckYJZ22C9p4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9Omd3fn4CNQYLypRUvoevtZh938GOFrtNI462Vk1K8=;
 b=OivV8ArjY1v7qg6qruWuTEUAmiAh0UPZ+XbNnxg2t7oO0dJ+r09aWZgrHPWv2phrfgYwxNO1irTIHgoHCCGykPz0ngXWWVQdbbnMB18VbJtbWryE0nvkQXW3wC8oeYQDtCwcqHcoi1NiDlUKV8QqznUCYezS+5pnTXr+WJ1oAuBVEScecWlMjsn/+/ItC8geGyu+GrzwOB7XvPPxxaLZzC02Pu4m703LS96BkNdXkFiNde/ZoQgWyMBIwWwF7eJwPCRX6lViJl2NGHBtd5ANC2IuCOs+Jq245CuWdRYgAUMTKhEJQL5J9JoJ8XasLGihj2iKLQ9DHiR+C/S6p8Fq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9Omd3fn4CNQYLypRUvoevtZh938GOFrtNI462Vk1K8=;
 b=H8i57fOczmT2D9IURon4YyxLmlsMIjB73ctPW9edVDKtDhqnLnBZLh4HnYwtF98HbH49nTZhcfG2Hs8v3hozNjsaAt+UcZvGSUDfuj/lPNHgJaCFFB3TvktbNJXLuj0RLgZL4OxRWTFdLkfi3Py1ipz6RSvU/iX2fHZIv4GNCqs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 22:16:54 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 22:16:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: am62: Propagate USB2 refclk enable failures
Thread-Topic: [PATCH] usb: dwc3: am62: Propagate USB2 refclk enable failures
Thread-Index: AQHdA542z1bL0PlfskqiC/WFr4pGobZRa7+A
Date: Fri, 26 Jun 2026 22:16:54 +0000
Message-ID: <aj76Sf3nYJyHECAM@vbox>
References: <20260624055612.43319-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260624055612.43319-1-pengpeng@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SA0PR12MB4462:EE_
x-ms-office365-filtering-correlation-id: 9d33aacd-581b-47c4-9a17-08ded3d0a139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|56012099006|22082099003|18092099006|18002099003;
x-microsoft-antispam-message-info:
 jpqT2Ca1pkCNjnsxJi2K7eSN8a7ahJUCO7BO62gLMSCLctrEGntIeDsNzniNFTMZsceLhcuK6xAG98ZHTpReHTh+j8Re76vDtM4PwS+mBPYYuZy0bfvgS+yJw7K3cCcKPR6GBn3pH9pYPAQHeVUXBltf5Cvy6BSKs/jt1pwm/43BPKJZZNlm5vfieYBXt3WFVVu/z5w5R4GIEkBWgdBf8BwvBhWMMFlsxlcPzqteTDmnl7+XUBb4DwunCO6q5D9pwgWmlUKczQulhPGzfwmFEIDPwmCjZpmkXHvzp5yca17URlIBi9ipIPMnrazia6ziSlsjQKWPZDCdvvNW9LVxtVkSrLAlF8pA8k4dd6d893EMz7uSdoZqpU6lfy/nQGDFfJ/8hqS5yLv21nJ5l6CiKho99KzhRhUCkbeWt6ij+R7zGjktU9fASHwd9/+PU9/Aps/olp5gVh5F9873B9HzYxaCPhGla4hoTm+gdWqPuoteQUsAr7pixk7oCmHOXqInd5eoqOk0kvGs7PQMo6uvYGkbjBRPwUQmzem/gNy+cH4gmHeHfLmSr3cexqgBarT8zoBHnrLVrmc/NYW27i9a8aLlC+FHVyT+z8Dj8c/pXi8Z2YTjjhoUxRcP5YTWjPqX8NKjJBpdJYaNJ1mD+T3weIsUSbQhfXZyER0fnAQ91bTZvaTOjHBIgYKsXBjZTYvG7kMyaG2LY13ZuG/zjQOmfO0CINq8YRLpKFJRHLIpdcM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(22082099003)(18092099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0xiU2IvVGh1MzVGT1ZtdGM3ODRUdW84STMyUG4xdTNTL1FpcGlFaGNxeDZQ?=
 =?utf-8?B?bmpZVGFCQ3J6MWdJd0FhdGNFQnkxODRIQkUwU0I3ZXQxTkhGMEdJdGRzVlNq?=
 =?utf-8?B?YzJHNGRvWlptdmhXbWhKK0lvcncrZEUwMCtiSDAwSDVidjdRd1RrTnh0TURB?=
 =?utf-8?B?ejJGM0RnamJwNWE5MFBOTlIyTzcxQTZzOFJuMkNzK2R6NW1xZ2dlWUdYVStR?=
 =?utf-8?B?SEViSXJGVFUxTlR6aHkzQ0UrUUJCZSttRnBiYzJwUVA5S0RvZXJpaXNDR2Ix?=
 =?utf-8?B?NUU3eFB2NEFFVTl6MGN5S0o3TEJkQUxsRVpnaDFzUkk5RUFlVlNFMHBER0w2?=
 =?utf-8?B?eHJsQUFlSm1ETW9kUEg0NWZ4bGt1czAxWWs2WGdvQStnK09adjFzQ3N1UTli?=
 =?utf-8?B?Rzdic1NKSXphakFkRzJDVkpkZmo4VXBPeVBBTnF4S3MxbHM5RmlxZXJxcVRs?=
 =?utf-8?B?REhvTWlLNWRPajVDdFZHcVhjRjhLeHJnWTgwY3ZQckYyeSthVjgwa2lBZFR2?=
 =?utf-8?B?RnRURVFWb3RpMzQ2cEhnTktlWXZ3Tnlib3RSUEwwb3lxS0VWeVZYSXNhWkZz?=
 =?utf-8?B?eTF6QXRzODRnWW9mM29mMEg4ZE1XQUNUTDdzVnlVZ2ZsUTlwcFozeUhoeXRk?=
 =?utf-8?B?bEQ0ZC9JeFQzUlBzMmJBQ25rYTkwazMzTUpVbzdqTEszTVNNRlJ6K0hEaXhJ?=
 =?utf-8?B?bnFGbWp3Z0NoZE82RzI0eEVkeGVjakd0b2xCZ0ZlbUorNDVLVGhXdithZ1FU?=
 =?utf-8?B?OVVQdGhKTEc2c2l0aXBhN29UZUNGbmNnWWhzVTdHRnNGcUlWUUh4WUM3MDU2?=
 =?utf-8?B?SUREUHBPSWc1bE9QbXFDdlc3RGZaMTE3OTA3bEFOVWVQWFBhb0h6RTBqREs0?=
 =?utf-8?B?MGVFQWdOaHBZcDhPeE1uc2F4UGdUbXU0bjZ2bElEbURCNEdwVm10SlRuTkVl?=
 =?utf-8?B?RUttSWtIbnY3UkpMcU53c3JBRWJSdEFVT2dxMjVjODNQV0VUREVGaUtzYmkw?=
 =?utf-8?B?WFNXc1VDTlV2cnBhdVN6NGFvNG9ZSE5EN1pGZnlxdjlTamFkVk5IU0VTZGoy?=
 =?utf-8?B?TTZtMGZCNmYyZ0ErSllQQ3lwcW5DUWdubkRWSTdEeGJ3REJmTVQzRnhmcmVP?=
 =?utf-8?B?dWdvM0tMZUNHK0FEVHBpcnRYb2hGdW1Id0o5NGlhd0pwMk9VMUllUTRJTmow?=
 =?utf-8?B?Mjd6U0hRbEJjRldkUk9VdlM1LzRudVlzanFuemhHbHdjcXRocG5JVFVlSCt5?=
 =?utf-8?B?cXZUWXR2MmhNZkNxRzhoY0hvVEhsQ3NyQXA4UGN0OGludUY0c0ZpbHVvcVdp?=
 =?utf-8?B?TWo0SEpicnlXamFxNGtIKzdTTTc0TGdpa3FQVzZjbS9YVGtMQ1NFd1Zka0tK?=
 =?utf-8?B?Smw3ekEvY0Q4elg4QTZ0eExPR085cTFnYlp4T1lIWEQvbEI5MWRIejkyMFhk?=
 =?utf-8?B?WHl3aXl2NWxtQ3M2UFoycmpkSy9JVGRNS2tMK0Jhc3hGZnpNSmZrTUZvTWgw?=
 =?utf-8?B?amZkcEZ2U1dWcDBTUlEzYlN3WG0yaHNkNkdHaFk3ck1jWG45N2w3a3RNSXhF?=
 =?utf-8?B?WGd3V3preFA0VDdnRlpmR3JDZGhYNTN4TlhEV1M1c3dCVEhLMnBvVWx6Q0VV?=
 =?utf-8?B?TjdXTW1xRU5uZmJBbTEvVHdEWSswNkh1V2dUbHV4YThGQ2dVVXM4UHhlb09i?=
 =?utf-8?B?YXdraUoyb2JQb1N4OFh2eE1lREo4VXJ4YkRnUitOaCtOQVZKSHd1WEt3SW9K?=
 =?utf-8?B?VVRLRjUrWU53RjJiM3Z0c3pLcW1mdUZhOGNkWEJUcDcvR0dSYkY1eG45VkNs?=
 =?utf-8?B?azBYc1VjZXhYSGU5and0aWZLSzMzdnBwRzc5WTJFZjU2QlBtU0s5Wml0QVZ1?=
 =?utf-8?B?NFVsdUMvZUEzS2hZZTBFRHZDL0NMYjJPUEdlaWd5NklSb3JxL0FEbExzNnd1?=
 =?utf-8?B?L0dQdVVEOWxXWXlnVDQ0Q2VjU293aHJha0pRRll5cUhZNkt3Nlc5QnNMbXRJ?=
 =?utf-8?B?OFp0YWpNOVRuN0w1NlZFZi9mZmRUeGxnZDhMWkZrTWYwL2RrNWNiU0FJbHBp?=
 =?utf-8?B?QS9rWWN4WTEybTRWYVprMUZKNmk4bmxVZEEvOHA0ajlLUEZ6SktXVExzK05l?=
 =?utf-8?B?VUE2REdhVnZsYzBKSHVKenFhdEJ3MGpEOGpOYi9TMzZTWnltb2gxMTBPR3BV?=
 =?utf-8?B?WFQrTzZGUXhqeU5kTVQ3SE9pazNMV1N5SkxOWlplSUpubWJ1TWJ0aHJ5S3dv?=
 =?utf-8?B?Z1FQb1dETkkrTTJEVUY2Nml2cnM0RlRKS1NwUjdSY1ljS0xuSVlIb3MrQnk3?=
 =?utf-8?B?Z3JaOHpob1FwOElzQm9TQ0RJTGJ0SzdGR1N2M3ZXQnJsS1JIVzduUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9BAB99ADCC1DB44BDDE1A7C1D420C1B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Wuf9M8/LqSqesgZoc0vTMjOnyZ/OL9GlYiItMuzEXWTTdE5bXhfK1M9m8Zj2aQVwBvCiyGXTSX3Bo2ceQpSjHLEOIN54UVanonvZwAo2j/Kd19nb+nLyPjqBQT8NbKOuy3Yw4d1HhQAmJUpizU1JpXDFFCu0P5X0JXBmS9wdnM4mlnzAy8djEaDzyLBJIK8aP4ar6yfCWf1D/T4L28AOf2tRf20otR+wS8wPpF4ffGnO2cl+uQsqp910nfKGJdgP1bmJ4UvxTTq83dufhv2Bov/lFXe18JpevHq2l8k3lbC75V7WYBdbsKs1T1WbO84zHYMh85KU6338YFdIrk8drg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4piHZ0x6lNSjnlRfysmGTZ9iTy835dIis/m96tmB64fc1f9rIdOjjK0Qt+479mvl58hhP5jNWSyM0de5jMfR2e2ev8LLNC4ap3FZu38OY+X+GifHoqxHeltVfxX9QBtVoF6hy4oYsKWtJHcBrHji8WXM07ZKfNYxFbLfcM2fse0iK8epg/4Qk9ZNw7s/DqZWecwh7dWAzlMBnCefpwXfbJGBXF/8SkE2vvWQpD3mS+QSKvGSbcTsmw7keIezxYly1l/PRd0br2Yd6z+08ZjCStFuqklZ8ow4W7ezWLvTv1tpITtTaFbD0WfhhqsAgqyJkZka0/hX0DZdSkF30a460IAhQQ4Yl/vD+Q9EmbNGs6iVOO63RKGPOIMggWaCAS1zdIF5Tccdqsf1lOuXGRZFWvu/UNbTfhR6IZqYmsmV9Y7zn3/efYCI+pbCId9u8QTooGUKIQVOTSzDhKBmSxwD+nSkjzUTOsfav+anriRP0KNsXlog8JvCxgEYHW8XkZXi9jcOwBBVcUiukhZemYN020liE5/gvU9P7X/YM4U0pqwj/pY2dFV4wy12l8YeJkUbEeM/RL3mNCgie3LQ/z/CpEgcazx8N6mo8I+jNo823Ejkm9Uy8py8Gs82rMjzpy9+s9b3OZxw1sF9omFWph/0cw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d33aacd-581b-47c4-9a17-08ded3d0a139
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 22:16:54.4251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wWfqTC1jWroiJ3sZHhdeeaWu6DBIronMRmKYIlqA5DvHnMRxtscK/dGZa3t6Wr4S6G2b+sHfOYNuVMYCF6lfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
X-Authority-Analysis: v=2.4 cv=HNPz0Itv c=1 sm=1 tr=0 ts=6a3efa5d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=3G3QtPy3yF3J8wmpY9sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4NSBTYWx0ZWRfX+r9ZFnhDajL8
 +ZBTlePbLecT5S5aoyYPufCnqebeBH2HfrvKPM60VFWNs6ZssT0QjKyXSg3Kx2BWudWuci6fAxV
 Lder5HjV/Y/bXDgNEE3/lN64hT/6L04=
X-Proofpoint-ORIG-GUID: 9AJkRCJVKBLeOm2AEq0t4LxP44c9cXR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4NSBTYWx0ZWRfX2HnsOd/BH5RX
 2yQ4PrUDLsqT6dgAU7kt+pFgXwQuRG6rrhpk8TaI+zX+DBm0m3/Ql+sTW3lTRO5acwqG9RM+T4P
 EiTnrSV20uJuSmxLe7v7IDagvywaknuGVgsbJAKSpKvUBgM6F9y9bJFfDzTlpv37AUu4vLPm4MC
 zLSNDRu62/to2uPTIMyOv9YwB51cywz7FT6pnKC3fagzCXg/JSYGbmG9JhdU7kgDr6jNaytt0TX
 xPxBvhqJ2KmD7OlDM/ZJuBSvZ2tpTYzsaxwmbea7pXlZXs9QA068y9e/wqkOA9UI0Lbo7tD7oJg
 GTXeLB7xtyMbpZoz5J1vTU5lEqUr53/K9uDCQ7W2Vp/FT9/ME6cdifkBmzVaxgVB5z/jbtCMHi0
 QC3CguNmM4sb6V+P8PWdYl9ye+Kf7ZP1pEnolF7WoGBoPzQMDpkREiW0xEM5YqzioI9JcW9yuUI
 tjY1dmoan2uRGPDJ7Uw==
X-Proofpoint-GUID: 9AJkRCJVKBLeOm2AEq0t4LxP44c9cXR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260185

T24gV2VkLCBKdW4gMjQsIDIwMjYsIFBlbmdwZW5nIEhvdSB3cm90ZToNCj4gVGhlIEFNNjIgd3Jh
cHBlciByZXF1aXJlcyB0aGUgVVNCMiByZWYgY2xvY2ssIGJ1dCBkd2MzX3RpX2luaXQoKSBpZ25v
cmVzDQo+IGNsa19wcmVwYXJlX2VuYWJsZSgpIGZhaWx1cmVzIGJlZm9yZSBtYXJraW5nIHRoZSBt
b2RlIHZhbGlkLiAgUHJvYmUgY2FuDQo+IHRoZW4gcG9wdWxhdGUgdGhlIGNoaWxkIERXQzMgZGV2
aWNlIGV2ZW4gdGhvdWdoIHRoZSB3cmFwcGVyIGNsb2NrDQo+IHRyYW5zaXRpb24gZmFpbGVkLg0K
PiANCj4gUmVzdW1lIGhhcyB0aGUgc2FtZSBpc3N1ZSBhZnRlciBjb250ZXh0IGxvc3Mgb3IgZGly
ZWN0IHJlZmNsayByZS1lbmFibGUuDQo+IENoZWNrIGFuZCBwcm9wYWdhdGUgdGhlIHJlZmNsayBl
bmFibGUgZXJyb3JzIHNvIHRoZSB3cmFwcGVyIGRvZXMgbm90DQo+IHB1Ymxpc2ggb3IgcmVzdW1l
IGEgY2hpbGQgcHJvdmlkZXIgd2l0aG91dCBwYXJlbnQgcmVhZGluZXNzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4NCj4gLS0tDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jIHwgMTMgKysrKysrKysrKy0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1hbTYyLmMNCj4gaW5kZXggZTExZDc2NDNmOTY2Li42MzI2MzRkNmU4MWUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLWFtNjIuYw0KPiBAQCAtMjA1LDcgKzIwNSw5IEBAIHN0YXRpYyBpbnQgZHdjM190aV9p
bml0KHN0cnVjdCBkd2MzX2FtNjIgKmFtNjIpDQo+ICANCj4gIAlkd2MzX3RpX3dyaXRlbChhbTYy
LCBVU0JTU19QSFlfQ09ORklHLCByZWcpOw0KPiAgDQo+IC0JY2xrX3ByZXBhcmVfZW5hYmxlKGFt
NjItPnVzYjJfcmVmY2xrKTsNCj4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoYW02Mi0+dXNi
Ml9yZWZjbGspOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICANCj4gIAkvKiBT
ZXQgbW9kZSB2YWxpZCBiaXQgdG8gaW5kaWNhdGUgcm9sZSBpcyB2YWxpZCAqLw0KPiAgCXJlZyA9
IGR3YzNfdGlfcmVhZGwoYW02MiwgVVNCU1NfTU9ERV9DT05UUk9MKTsNCj4gQEAgLTM2MSwxNCAr
MzYzLDE5IEBAIHN0YXRpYyBpbnQgZHdjM190aV9yZXN1bWVfY29tbW9uKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjM19hbTYyICphbTYyID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQo+ICAJdTMyIHJlZzsNCj4gKwlpbnQgcmV0Ow0KPiAgDQo+ICAJcmVnID0gZHdjM190
aV9yZWFkbChhbTYyLCBVU0JTU19ERUJVR19DRkcpOw0KPiAgCWlmIChyZWcgIT0gVVNCU1NfREVC
VUdfQ0ZHX0RJU0FCTEVEKSB7DQo+ICAJCS8qIGxvc3QgcG93ZXIvY29udGV4dCAqLw0KPiAtCQlk
d2MzX3RpX2luaXQoYW02Mik7DQo+ICsJCXJldCA9IGR3YzNfdGlfaW5pdChhbTYyKTsNCj4gKwkJ
aWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICAJfSBlbHNlIHsNCj4gIAkJZHdjM190aV93
cml0ZWwoYW02MiwgVVNCU1NfREVCVUdfQ0ZHLCBVU0JTU19ERUJVR19DRkdfT0ZGKTsNCj4gLQkJ
Y2xrX3ByZXBhcmVfZW5hYmxlKGFtNjItPnVzYjJfcmVmY2xrKTsNCj4gKwkJcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKGFtNjItPnVzYjJfcmVmY2xrKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJl
dHVybiByZXQ7DQo+ICAJfQ0KPiAgDQo+ICAJaWYgKGRldmljZV9tYXlfd2FrZXVwKGRldikpIHsN
Cj4gLS0gDQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkNCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
