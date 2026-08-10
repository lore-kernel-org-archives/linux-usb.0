Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0163B71C9;
	Mon, 10 Aug 2026 23:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403933; cv=fail; b=X4CG8Lwdyvk/sU2mMQo2QlnWg5askPb31d3g6VWemgQL40r5p0/WgqGivicZN6pzKtJExyfeNUfod3gLEFllPMGtxyUpTPOgWKb0NiZ381S8Ddrin0MtpihQJ/BDkcQU3/jTfI+iQkZWGyVH9eecejMF5yAcVGg1oB7V1Q1CXeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403933; c=relaxed/simple;
	bh=V4q2AS2GkVpVevU7QnqRBY1Hd/2AUhLGJODJ62DT/kI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dw4zRkSsrIC3Y/e8SwyrFpZGKm1shtl5MbySOPsAEKbGa357Rr+Sn6IRkx5a5aIGf3Idm/QQC4546q05UH95mU09Va3jSWfbhJIS9JjVa3HQhl9k64b6DEDqgSzIPEzI9NTvhNX0lbjNntmnVtT843Hr9BGrmvcM9gXira4x2x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gjm4ntDx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S/XTzQ+c; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PqG2wKEn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gjm4ntDx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S/XTzQ+c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PqG2wKEn"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMou482212742;
	Mon, 10 Aug 2026 16:18:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=V4q2AS2GkVpVevU7QnqRBY1Hd/2AUhLGJODJ62DT/kI=; b=
	gjm4ntDxuep0WOHLtTFR8eZjViFt8CNtlhO6drC3phGrcGcoWKvvf859M8XctI+J
	j2Geag2mChshDmpKYw0ZbSik1sYZ8pOYRPr4h7Rb1PQmcMNmw//amzJiXZK3e3iU
	Y51MgMgTLHUtzHlWwMlElT3HyWtjttq+o29eOfugM+IN0Fhb9Wzu0RLEC2snhWXY
	+yTjsVBtgp+zJzPzZsB7UMywZjanDrQidWrn2aFqW+T6WTLD2142hQlUd0lIR96P
	Iqkg+wzt/PTFjOfkprywrSBpfKtXUW151aFDcklMGGtncciI63SXD1yeBeDavH3H
	PgSOEXFgOLcUlUYwX1ZcAA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fyk0vtvvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 16:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1786403896; bh=V4q2AS2GkVpVevU7QnqRBY1Hd/2AUhLGJODJ62DT/kI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=S/XTzQ+cDr7J4RHcRums5cOhC9OpNxsMZJQOeuqjCDNK4q3vA30lcyJy80ocvne2J
	 ye2pl/Ox/3ejlHN0xaroJd1VhV3mzH1TsXuIUIbL7tXBkEh2+tXBtlcd6vJpNAxXBT
	 rvsMFUxvrgCh2Rgg9oSv/AUJdmft9F2UGtA8/I+j404y+rYLk9YV3xkFXtmpBqlzTT
	 j8Ey934xK5oTSTptxMbZIYnHQDhWRYTU2W4GFRa4Mqv80bNQJL1nmWV5RK9aoe5N8e
	 kYcLATof5nwViIDhkMQ0ztc9d3bPgxijY7vIraO8afyvUrHcXo8zj8neG3W3MN+elo
	 7aoctV//JxS2w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A23D401CC;
	Mon, 10 Aug 2026 23:18:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 583EAA007C;
	Mon, 10 Aug 2026 23:18:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PqG2wKEn;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1CDA7401DB;
	Mon, 10 Aug 2026 23:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKMA2EvRBXURwpMiaDpiJ66iV+dV4PafXSHatpfTru8576t6flp6X+03bj9FDBAg7YUhpJlT44uwIjI70qXh8I9wAZEaIvgfTd0oNfcF4zsAtoSnJAmjqB7sM460Jv7O+xgwUNkRnJnNcN6PQ5LxQU0nuWfXlof6twCrtAXknzH4BCPeXRoGWl8rIeqt9Hp9EpLniafd6dhsvzETOr/7HaOqioi+RyaJPhxWPEUjJyzcJW3inVJxZtwnZMjucFRgiVVaiq936+lx5C3le1onaYw3nADY2r8EJzSwc12QkToisny5Jw1zHQMvoblVYoSEVYph6AKvZpqCtvsYXbNJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4q2AS2GkVpVevU7QnqRBY1Hd/2AUhLGJODJ62DT/kI=;
 b=eQSWMBPTZHkjfoEOt5gvY+GKV3KKfo4E5Jci/3FQvbsIr9mMTTEbxtqSC1/NL66oU4nVYLiansnw7UhvbnFDZNuI+0Ja8JeyTidTbLQdHsm9uSjkHl7UQoiYEQ7Rj/N3KGViUKk6dTF537sLgB9bq0e3pWYQUyNfJdMeHR8+3rp5PkNqRZLg/6iJfhqwa3jQ276R7VPWthkUw6oF0iZPxwwiu+NBEvK7HpmwG1IE+uqY2npmL5rBwell7mcXi0/F7u+Ssy8TpqvGhGKLyJAjp4t97DP7u3WFiw/T4wb7JbnUvSh8g4v6cgAj8CQeFdAuOWsLwWR6h3JT6hCcSMgmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4q2AS2GkVpVevU7QnqRBY1Hd/2AUhLGJODJ62DT/kI=;
 b=PqG2wKEn93ovN2AiRsyMbSKzv7g4lcAilxH4BRLTH6t31IfPpa7PmlH2r1s2Zzwl6FV2zie9vm2oiXUFe6dkF39TrdA4tkfHmgwXGevlTwbh5AwE63hVTZT16nojmSsuFD9JugdwkFh/u8wlhX70mAKVIy6hzqBXb72IKi3YD28=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 23:18:08 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 23:18:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdJWEY/O2gJF3FWk6KQkt9YbRsXbaTPucAgABPggCABGPVgA==
Date: Mon, 10 Aug 2026 23:18:07 +0000
Message-ID: <anpSU2q_jAssGb7_@vbox>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
 <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
 <anZpZIW76RzmyiIi@vbox> <400a1d8c-3b71-4e73-b103-c6e6c518fa13@mailbox.org>
In-Reply-To: <400a1d8c-3b71-4e73-b103-c6e6c518fa13@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CY5PR12MB6058:EE_
x-ms-office365-filtering-correlation-id: 1d2c2e14-b77a-4a0f-f1a1-08def735a34f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 8o959MAMpgMePKiIQ6xz4AEBHmyaPhjNslMcu+8hhRoYWEl97cgzvO9br6fHh26PAmzJqH6imGXBP8aA3R4L4Ee85AetAlihqLPYcDNdUqnuJ6qFzVZ+/a8HR0dDwZeebOTsagN7jOB8xwOHZIr9Zy14/rYULVlkg9q603dEuSDmf1jhO7mYxQu97+65HGYB3sBfNzVjtS++/LXfsyKLSefU6NpvUIrU8n7CxB7ztrIqiN/SYKUIiZL9bamE5FKDxRADHb6v0pML2XPpWAyuw9cpfTwUhXTyi5Z6V21g9K/alEexCeYPtLsS7jG9NVSYk8Zc4HCYHeiBFRQkGzFlQ9oNFDEdqeBFo5ISt/UjQ/aXiV90WziUhFHIiJSossvcdtyJQJfVN5Jp1uMIcn4XC1WBqlpacxURyUwAzy7/EhaciQ3an9FKvZ1j4kYluzdICejRpeL7rZeRM+iVmZ+yQEXzrD52RSDXKUBrWIx+Nqif617XWSXf6UJAAvkYbnxDUBt2Xbou1HqYBB9HVstqRubrP0mXBtC8oO03CqjMFRg2SHVs0WeweVC7CLVnJCll3YvvV+pyi649KyOuXJYDIJGmM+hq5R53PHR0nfM4hXicgfmcA/e/yO4f9siOSAzog4VsDZ3R6A1LmMwuytPna8zaT/iutD+vqmaGjFsql0OLBkr5xcN5UBVEiWFOFydQsztlL3JX+rw4flRZSjHbKaMwQEySWNEQeEVKc3pDWXA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHhFSldkajMzK0RpMEVMQUMvSGxHemdHd1JEOXBDanRxclM3dS9tN0NQd08z?=
 =?utf-8?B?OVYrWXpFZ2ppdHVXMm9ueG9aMWJwOS9HNDlsZFBCSmNsSVlZTU8rOERody9L?=
 =?utf-8?B?MnZ6TlVGcDZ4eDNoaWtMM1BWRjZnUG1HQ0pSZ1FnWFpsTXRSdHoxRnVpbjRH?=
 =?utf-8?B?SkdpcWpCbElFdWViTmpmZHBWS0dMcWl1OXpmeVliYm16ZHVwQ1FpNW8ydzUv?=
 =?utf-8?B?UXA3UENldXBhSzQyMnVBK0hKOFdINFJsWTNBWHc4V0RZdXRTaVVET3ZSZDN4?=
 =?utf-8?B?dnAzcjR6ZkFoK2VaNXBiWHE0S2FyVHF0OUdwVktLamJ0RFdicnQ2N2JxUHBy?=
 =?utf-8?B?ZlVscDBMakpRMEcvVzZxV1R0WHkva3pZNzl3UW1ZcEVyVk9uMUw3Q0h4QUFQ?=
 =?utf-8?B?cmdUWGFQQ1hhaExBd29EaTFWZ01HdUR6VXRBNmQwWU9pbnNxYk9mb3BHTnBJ?=
 =?utf-8?B?MlNSUmVjcnd2REdnaWJzTDhVMmw5emdtMHVDVlFvQ3F0WFg4a2ZNWDBEbGtZ?=
 =?utf-8?B?bjc4elQ0WmYrbHlIR2RxSlZ4aDAvczNZRUwwRHZ3dGxIQ2x5cGllTDZJUFps?=
 =?utf-8?B?SzNyUkVaREJuRjRneTV6MjczbE1kNmh5ZlNXZm1DTzk4QUlTVWhPUC8ydDFa?=
 =?utf-8?B?OE1ES3B6eGtxTE05VjlZbUlCOVkzYjlTSlFEdElaZmI4YW9SQ2htZm5KUS9u?=
 =?utf-8?B?ajhUQUcvWU5Tb1lBM3prNDUvTEtCb293M1BIbDRXd0lyUGdJOFlKckdUQWFr?=
 =?utf-8?B?UUxOZDQ5Smt2TXQxMjl0KzJxc0k4cEsya20wcnBOblNRRUNEdG9aV3NuR0Nl?=
 =?utf-8?B?QURsbUFta0RKcnpUekFLcE1ia04yK2kweVg1aGEyZXhidldFcFAxOFEvR3U1?=
 =?utf-8?B?S05lQjVzVXpPRkNUM3gwY3VJUHIzQkdDck9hU0kra0dhSzlOc1pkdXQra09S?=
 =?utf-8?B?L0t0TTBMblIwN1ZTeEROdUpUV3lYQXBiOUU1WjYrRFVNUi9uczZ6dG0zYVZH?=
 =?utf-8?B?cVNYSHdKY2p0d1ZXMGRiRGI0MmVUNzFUb0JTdjYxMzNKYlFSQTJudDc1ZTRs?=
 =?utf-8?B?SDZ2aWFKbDg3alZMdmcxMjAzZ1o1R2dLOWlFL2xTZDA5cGdWWXlPdkFWbW5W?=
 =?utf-8?B?V2t5S2ZYZEU2dktTaDRtVGx4RkJKcVNvS0RQOWhBS21xQzNaM2ZDUzhhUkNT?=
 =?utf-8?B?TFYwaGVFYjM3c2xOTy81YXpmaXJJV2NIRHVTY0w4R1JIMmlyc0oyeHZSRHRC?=
 =?utf-8?B?YzNSVXZ3dVJ6Rk5JeHdyQ1VjcjZ4eFROdkFaUW4rNENZcGt0cWxCZDdTanB5?=
 =?utf-8?B?L2JremxYVWxSNlFudEZSZTBUSGJvWU5kQ2MvUG50dWdyYmRxUHRxRlRXQ1Fw?=
 =?utf-8?B?WmNpYU9nOXFtMW9iM1dGaVl3N3lzYWdHN1hxNEVkZWREbHNqMDIvaVp2UDZG?=
 =?utf-8?B?YlhkK1RRU0J0bFdzakFVbmlMckZ5WGRIQUZrQzM3aTBoL3NWc1FYZENDN2hl?=
 =?utf-8?B?NW9mdVVBSEZiT1M0c2srVElBZ05MNHNEcXV6TlNzOEh4OERDWWlHZUE5bGZy?=
 =?utf-8?B?RjljR1RMNFM3ZGtQZS9tcVRlaFcvSHJnQ0pSV2E2MXNHRVpMNkJicTQ5MXVE?=
 =?utf-8?B?UHFXNmxaaHd6N3RScVZ6SFlBVjJaWlVOajdTOUlvZkl5Y09UMXphZmkvYlpl?=
 =?utf-8?B?dWluRzhnWkxJY2dyU3Y1ZTBhM1JMa0xLQXJwc2hyS3dpUkxab0tuZkNpK2Vq?=
 =?utf-8?B?b2NYUUdUN2F5VnprVDFpZGdteXdrZ0c3SkNjdFAzNDk1ekU4cmkxaUorNlpv?=
 =?utf-8?B?N2VvTEhPOXpRZUpGeS90dm0xeWlQb1BOQ2tKZEVWVHp0Y0xhelNnaTQvQkE0?=
 =?utf-8?B?dlppOThEaVZNVGl3Mis1aTdEdXNhVjgyWXhZZ3VYcVJXSUZXanZBTUhOcUlF?=
 =?utf-8?B?RjkvZWIwOXZmVXRqaGVyZDNUN0pBTkxjVFhlRy9VWVNkQWt4YWN2RGthMnc5?=
 =?utf-8?B?UDRaa24zY01JNDNBQk90QkF5MHZPY1lYdlJUK3FuQ0ZwcVVGNEpFN0xWY1kr?=
 =?utf-8?B?SDEzVHQ2Z3FwVTBrL0JpbnJlL2M0b3RVSk5IMGtuV3IwalhwUlBtMzhDeGtH?=
 =?utf-8?B?ZENJSVRnb2lvdXdmeXE0UnZudHlTYzFhMUo4R2lteFBLeXhGN0tuY0paK1li?=
 =?utf-8?B?REpSQUtzV0VSNDFPelU5Z2JCRGtkeDdMSU5UNzcrbjBZeDNLcUpHT2p2ekwx?=
 =?utf-8?B?R2NuQ3ZGa2pmaUhPektRbHVJS2h1bVpZbCswQnV4bWY4Y3pQdnRwcmNobFlx?=
 =?utf-8?B?cE5RLzZFaExHRU13MkZBbkFuUTg3K0h6bjdraUR2T28xNVJlUkg1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEC0CD703D26B342A8FEF3A4ED4891C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rbgsmpBGXLfM/SXRkyNdFqoW2qQ0BIEFOlBnjU8JZe00IoyiCbMPNVPaYB1/+zM1c5XrhYkD7gaUbkGIyYEenmuYn3XIZleYLtZ2S2rYsWYEPmhMtnU7hon3x2KCflycttYr2tJ8h6YI2Q/jKZWfmW97vaFIC7pGm3GpT21Aext0D7SCLLMeMemLGjKyBoXSaezo+m1IRCAmUvnUcEz5b0sHw2fIptAD42utop+UcsKcy3QC3fcm7dcQVBz9RPCBaOqJFFtkdLRGJLu8Py2seS34838Gy1+O5zFbUSlR6cbhTe1Q2qbQeBC5XsFJ0tNk2Rx+dbJRHyf6J5/Y+g1nug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k06JN8F8fyQ/XQqplaTTw3PW6rTJuVnGH/oIPFW7xAQkL20HyF4md0FeyECqlu9m9kHwZfE6NsLeW6QOBigkCYOLWnHgynV8sqeaJXh9L5NwHOQ1WMyuPPJLscBAraBhDj/+CzY1VG+KantnkwROYOc8fVJjmezSVbsJ9Xd1VfDs3tLd74vcJg/VhHugAl4NH/JcwcqmHUI5DHM3oBjSYMH/Fg+wqOeAuojtShoI3Jf7d3Sz1dL2FXz58xMshZvJmh+Zos7vsHgICDV7JSxWSQ4nu8xRl07E3pksuj8AI42cqWQMgUf4dWX3HCit/XRfS8npcpvtgjh6rqNIykw9AqXtQ5FwZh5GqPCvO+wxfuwyKlwwh5uJ2/aZWQj7hTqqI6EBdw+VQpG5chdg2ISBqnhw2SnpIqcOB/UnVYQy0/wEqqvhN4sUHXXFF10vUUlOaz94c//aq6q3vtWZbopsjYutm62x2IHrXiNCz6IznjvZOiO4123VlVQMYjJIHTVg8MyxeJqpvF9DEQrvWYYt0INdws72Z9o3e9Y8MwsvlrF8LctopXY0RUgIeE6y4jC5LhLuKz7htE7+fdUg80uqOhT9UXPy7n42oFx/UoJaDPOXKrSg7XNxmQ+a3drt175JOqtFRxh1Mr+rAWhVPhuu3A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2c2e14-b77a-4a0f-f1a1-08def735a34f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 23:18:07.8297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha7aadMa806skXwzW3PZFbxhzKs1OhYuNUGJLbi6OC76Fyjt4zRtMex8EwhoSWtMONLMGr9/muY7u9gJLK38SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE5OCBTYWx0ZWRfXzt3O7rdz2ARv
 hVEmzS4aMJkxIAk2K/9ibf4Gl0uQrVCJ4f0IGQotjmzIEMUsTukcqnhShCNFjOYRQnmh6vzCukb
 pYB09NhF2OGkgB4hNhVY9SZtYS4dfUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE5OCBTYWx0ZWRfX37jP+jtN7eSb
 fDnbbX73EawZvaJxk8BjCXaVMpTSmpLqWlFaOlzOXxj95GL5yaHa8CVL851XS3oN7Z/CA8Xvmex
 rTj6zQDX03ZHaVXTowXFOYlh9fbOm5r4e76Qr0M/zM82K7dAjKk5/FtHsqabQEs9iy26O7RRasC
 XQEf7oAci4T6j4T/yepguzt8fgmKBuD1DkDE0TYtHHB+iuVqhyvkJcgCTbjruEMqtjSf/aaoAKH
 Mbeukk4KX4dsXwHlIMtRakDni1dXea/tD0ky//dq5FOQnP1OGM6Ny6zIl6GEu7G0ZMw/XPr6nV5
 06mw8VQPVMm8H7zR1tbkabZGKubGi2TyKlFGhy15DS8czSa7HURrQyXC9XMj2a0LvwHMnfqaYQ2
 tzMv6s3CvbpAOPxEZ4SCFWyC4kREqOptOQ1aSYgumURNtUZEy/J/5Bdq1BfaFOqFZgELR4xG76a
 yIncz6ctJS5vWKoUNZg==
X-Proofpoint-ORIG-GUID: qs5sjTWCY8L1CekSBpaRfpzVtcib16fy
X-Proofpoint-GUID: qs5sjTWCY8L1CekSBpaRfpzVtcib16fy
X-Authority-Analysis: v=2.4 cv=b6CCJNGx c=1 sm=1 tr=0 ts=6a7a5c39 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=BO3eQNwKSors2Q5o8LoA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608100198

T24gU2F0LCBBdWcgMDgsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiA4LzgvMjYgMToz
MSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gSGVsbG8gVGhpbmgsDQo+IA0KPiA+ID4g
VGhlIFJlbmVzYXMgUi1DYXIgR2VuNSBTb0MgY29udGFpbnMgbXVsdGlwbGUgaW5zdGFuY2VzIG9m
IERXQzMgVVNCDQo+ID4gPiBjb250cm9sbGVyIHdpdGggZ2x1ZSBsb2dpYyB3cmFwcGVyIGFyb3Vu
ZCB0aGVtLiBFeHRlbmQgdGhlIGdlbmVyaWMNCj4gPiA+IERXQzMgcGxhdGZvcm0gZHJpdmVyIHdp
dGggUmVuZXNhcyBSLUNhciBHZW41IGdsdWUgbG9naWMgc3BlY2lmaWNzLg0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBUaGFuaCBRdWFuIDx0aGFuaC5xdWFuLnhuQHJlbmVzYXMuY29tPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFp
bGJveC5vcmc+DQo+IA0KPiBbLi4uXQ0KPiANCj4gPiA+IFYyOiBFeHRlbmQgZHdjMy1nZW5lcmlj
LXBsYXQgZHJpdmVyIGluc3RlYWQNCj4gPiANCj4gPiBHcmVhdCEgVGhpcyBzZWVtcyB0byBmaXQg
aW4gbmljZWx5IGZvciBkd2MzLWdlbmVyaWMtcGxhdC4NCj4gDQo+IEluZGVlZCwgdGhpcyBpcyBu
aWNlLg0KPiANCj4gWy4uLl0NCj4gDQo+ID4gPiArc3RhdGljIGludCBkd2MzX3JlbmVzYXNfcmNh
cl9nZW41X2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ID4gPiArew0KPiA+ID4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkd2MzZy0+ZGV2Ow0KPiA+ID4gKwlzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gPiArCWNvbnN0
IGNoYXIgKm1heGltdW1fc3BlZWQ7DQo+ID4gPiArCWJvb2wgdXNlX3VzYjNfZmxvdzsNCj4gPiA+
ICsJdm9pZCBfX2lvbWVtICpnbHVlOw0KPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gKw0KPiA+ID4g
KwlnbHVlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiZ2x1
ZSIpOw0KPiA+ID4gKwlpZiAoSVNfRVJSKGdsdWUpKQ0KPiA+ID4gKwkJcmV0dXJuIFBUUl9FUlIo
Z2x1ZSk7DQo+ID4gPiArDQo+ID4gPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRl
di0+b2Zfbm9kZSwgIm1heGltdW0tc3BlZWQiLCAmbWF4aW11bV9zcGVlZCk7DQo+ID4gPiArCWlm
IChyZXQpDQo+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FTk9ERVYsICJGYWls
ZWQgdG8gZGV0ZXJtaW5lIG1heGltdW0gc3BlZWRcbiIpOw0KPiA+IA0KPiA+IFdlIHNob3VsZG4n
dCBvdmVybG9hZCB0aGUgZ2VuZXJpYyAibWF4aW11bS1zcGVlZCIgZGVmaW5pdGlvbi4NCj4gPiAN
Cj4gPiBDYW4gd2UgY2hlY2sgZm9yIHRoZSBwcmVzZW5jZSBvZiB0aGUgInVzYjMtcGh5IiBpbnN0
ZWFkPw0KPiBUaGlzIGNvdWxkIGJlIG1hZGUgdG8gd29yaywgYnV0IEkgZG9uJ3QgdGhpbmsgdGhp
cyB3b3VsZCB3b3JrIG5pY2VseSwgcGxlYXNlDQo+IHNlZSBiZWxvdy4NCj4gDQo+IFRoZSBHZW41
IGNvbnRhaW5zIGZvdXIgRFdDMyBjb250cm9sbGVycywgdHdvIGFyZSBVU0IyLW9ubHkgYW5kIHR3
byBhcmUNCj4gY29tYmluZWQgVVNCMitVU0IzLjIgOyB0aGUgVVNCMi1vbmx5IGNvbnRyb2xsZXJz
IGVhY2ggdXNlIG9uZSBQSFksIHRoZQ0KPiBVU0IyK1VTQjMuMiBjb250cm9sbGVycyBlYWNoIHVz
ZSB0d28gUEhZcyAtLSBvbmUgVVNCMiBhbmQgb25lIFVTQjMgUEhZLg0KPiAtPiBUaGUgUEhZcyBh
cmUgYWx3YXlzIHByZXNlbnQgYW5kIGFsd2F5cyBjb25uZWN0ZWQgaW5zaWRlIHRoZSBTb0MsIHNv
IEkNCj4gICAgYmVsaWV2ZSB0aGUgUEhZcyBzaG91bGQgYWx3YXlzIGJlIGRlc2NyaWJlZCBpbiB0
aGUgU29DIERULCBhbmQgdGhlDQo+ICAgIERXQzMgY29udHJvbGxlciBub2RlIHNob3VsZCBhbHdh
eXMgaGF2ZSBwaGFuZGxlKHMpIHRvIGl0cyBtYXRjaGluZw0KPiAgICBQSFlzLg0KPiANCj4gVGhl
IFVTQjItb25seSBjb250cm9sbGVycyBhcmUgYSBub24taXNzdWUsIHRoZXJlIHdlIGNvdWxkIGdl
dCBhd2F5IHdpdGgNCj4gY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiAidXNiMy1waHkiIGFu
ZCBpZiB0aGlzIGlzIG1pc3NpbmcgaW4gRFQsIGFwcGx5DQo+IHRoZSBtYWdpYyBjb2RlICgidXNl
X3VzYjNfZmxvdyIgaXMgYWx3YXlzIGZhbHNlKS4NCj4gDQo+IEl0IGlzIHRoZSBVU0IyK1VTQjMu
MiBjb250cm9sbGVycyB0aGF0IGFyZSBtb3JlIGNvbXBsaWNhdGVkLiBUaGVzZQ0KPiBjb250cm9s
bGVycyBjYW4gYmUgZG93bmdyYWRlZCB0byBVU0IyLW9ubHkgbW9kZS4gQ3VycmVudGx5LCB0aGlz
IGlzIGRvbmUgdmlhDQo+IHRoaXMgIm1heGltdW0tc3BlZWQiIERUIHByb3BlcnR5LCB3aGljaCwg
aWYgc2V0IHRvICJoaWdoLXNwZWVkIiBvciBsb3dlcg0KPiB0cmlnZ2VycyB0aGUgYXBwbGljYXRp
b24gb2YgdGhlIG1hZ2ljIGNvZGUuIElmIHRoZSAibWF4aW11bS1zcGVlZCIgRFQNCj4gcHJvcGVy
dHkgaXMgInN1cGVyLXNwZWVkIiBvciAic3VwZXItc3BlZWQtcGx1cyIsIHRoZSBtYWdpYyBjb2Rl
IGlzIG5vdA0KPiBhcHBsaWVkICh0aGlzIGlzIHRoZSAidXNlX3VzYjNfZmxvdyIpLg0KPiANCj4g
SWYgd2Ugd2VyZSB0byBvcHQgZm9yIGNoZWNraW5nIGZvciBwcmVzZW5jZSBvZiAidXNiMy1waHki
ICwgdGhlbiB0aGUgYm9hcmQNCj4gRFRzICh3aGljaCBpbmNsdWRlIHRoZSBTb0MgRFQpIGZvciBi
b2FyZCB3aGljaCB3b3VsZCByZXF1aXJlIHRoZSBVU0IyK1VTQjMuMg0KPiBjb250cm9sbGVyIHRv
IGJlIGRvd25ncmFkZWQgdG8gVVNCMi1vbmx5IG1vZGUgd291bGQgaGF2ZSB0byBhZGp1c3QgdGhl
IFBIWQ0KPiBwaGFuZGxlcyBvZiBzdWNoIGNvbnRyb2xsZXIgRFQgbm9kZSBpbiBib2FyZCBEVCwg
d2hpY2ggaXRzZWxmIGRvZXMgbm90IHNlZW0NCj4gcmlnaHQgKERUIGRlc2NyaWJlcyB0aGUgU29D
IGhhcmR3YXJlLCBhbmQgdGhlIFBIWSBpcyBzdGlsbCBpbiB0aGUgU29DIGFuZA0KPiBjb25uZWN0
ZWQgdG8gdGhlIGNvbnRyb2xsZXIsIHBsZWFzZSBzZWUgIi0+IiBhYm92ZSkuDQo+IA0KPiBUaGF0
IGlzIHdoeSB1c2luZyAibWF4aW11bS1zcGVlZCIgaXMgSSB0aGluayBhIGJpdCBiZXR0ZXIuDQo+
IA0KPiBCdXQgbWF5YmUgdGhlcmUgaXMgeWV0IGFub3RoZXIgb3B0aW9uIHRoYXQgSSBtaXNzZWQg
Pw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGhlbHAgIQ0KPiANCg0KSSBzZWUuDQoNCk15IGNv
bmNlcm4gaXMgdGhhdCAibWF4aW11bS1zcGVlZCIgaXMgYSBnZW5lcmljIHByb3BlcnR5IHRoYXQg
ZGVzY3JpYmVzDQp0aGUgbWF4aW11bSBzcGVlZCB0aGUgY29udHJvbGxlciBpcyBhbGxvd2VkIHRv
IG9wZXJhdGUgYXQuIFBlciB0aGUNCmJpbmRpbmcsIGlmIGl0IGlzIG5vdCBwcmVzZW50IHRoZSBj
b250cm9sbGVyIHNob3VsZCBkZWZhdWx0IHRvIGl0cw0KbWF4aW11bSBIVyBjYXBhYmlsaXR5Lg0K
DQpXb3VsZCB0aGlzIHdvcmsgZm9yIHlvdT8gKEdpdmVuIHRoYXQgdGhlIHVzYjMgcGh5IHBoYW5k
bGUgbXVzdCBiZQ0KcHJlc2VudCkNCg0KCWlmICghaGFzX3VzYjNfcGh5IHx8IG1heGltdW1fc3Bl
ZWQgPD0gVVNCX1NQRUVEX0hJR0gpDQoJCXVzZV91c2IzX2Zsb3cgPSBmYWxzZTsNCg0KVGhpcyB3
YXksICJtYXhpbXVtLXNwZWVkIiByZXRhaW5zIGl0cyBnZW5lcmljIG1lYW5pbmcgYXMgYSBzcGVl
ZCBsaW1pdA0KcmF0aGVyIHRoYW4gYmVpbmcgdXNlZCBieSBpdHNlbGYgdG8gc2VsZWN0IFJlbmVz
YXMgc3BlY2lmaWMgZmxvdy4NCg0KQlIsDQpUaGluaA==
