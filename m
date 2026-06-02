Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1902D94A0;
	Wed,  3 Jun 2026 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448719; cv=fail; b=bKHFYOhikDmG4Hgsj4pbRupXIreS5C1r3xqq5kCaEnObsrfZNlOzoTCGgvGyeSH2myZdG8OLMDXeTehL+ximPkgEMTy2hFaLYmqtiMd5LoI2dOLhYSfepjxwhagwZ+JQ+5VLGjB81WMrLfEnzbLGOyeG/rq0O6T92CIdlT5fkkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448719; c=relaxed/simple;
	bh=Sv4In52TEAqOboeUTgJwTu1Szyh9A37pSaChk6wNoPo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W9JkFkfNz0TsHxjE3/qlTowBQhc/6i1HZ9SVTaP4uC41h7eBQDY6NVk87wUPX4TVMJNhrUVnL5pf5xwLTCWzlAOX+uinD7z8PaeYSqJK+D4VxkJ50qWpx3NixH4n1ebujRUg4QvxG1k0zsukPbHKVitPWCcXmDwx0aRih4YqqQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dF9DqZpF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cfbckhZI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UrGBAxqF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dF9DqZpF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cfbckhZI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UrGBAxqF"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652M83o33620119;
	Tue, 2 Jun 2026 16:24:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Sv4In52TEAqOboeUTgJwTu1Szyh9A37pSaChk6wNoPo=; b=
	dF9DqZpF0EEmAdtLVL+sdzrTiHpKMenThd7O3n8DltPtSyVZQPM31z3D7cDtkaNL
	bkqaMCeiYH0mII2iOTXqNMecLuLjXHqvwqS3n8Zqil6W1TyAPrGdwICf8BGnTfQD
	v3ncQeSSaJe4uYKSJzM0rqzcHzwUtCC5PXu83lUQMehPLx1kgKvhbxoREKOJf/xP
	9qHGlMFbkhnftQbJ7G0Jwsq0LYWqiIHH4uTJP3Fj2WW/OJI5eTm1ATdY4iAh+r7v
	FdsFETv1R5+KCPObR5CDXgaOZ4yPtq7Psmsd+1Q9uPJVXOfIGusFR8pRHu4fO6MV
	2tlBRiictm3lZZ/eACcXKQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ej4wrj7kw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 16:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1780442666; bh=Sv4In52TEAqOboeUTgJwTu1Szyh9A37pSaChk6wNoPo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cfbckhZIXvpBfGQyQPjsRjVHepzzIqAUEy8H+B1bpqAdwLYPmRnOU7tHrOWczbOEP
	 WEJZwWDs2HqJDPxf478wajRoxY7/G8fbWjRTnk+i4r/nyfl/yrTzF5dznAWKN4Ur+y
	 y4mUyQnK1aN25qV2iOFYqs2sIpfvEdpSYZPsIIX47M/6HdpWpuocW8+NZxn7MlhU8O
	 ZIxv5ncF1ZsEebWJyl1K8I8kawOcj0Q/Utu2wAg5lNArPsm67Q3PbizBKDD+J8R7Xh
	 vPFTmcLqe3JDkVNkO2IjB2keMt9euI9JM57RYwkvwizTf8FT1cftR3vBrTXntQRyWw
	 PzARRSEv1BKRg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7AA1B401CA;
	Tue,  2 Jun 2026 23:24:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 00588A006D;
	Tue,  2 Jun 2026 23:24:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UrGBAxqF;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00606.outbound.protection.outlook.com [40.93.23.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 817CF4012B;
	Tue,  2 Jun 2026 23:24:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3f/CVbDRtBWYhJk0V4/0oSp5aZKZubFFqBz2yRng9a0HvIzYX1V3gszkNo42wcrC0PHu0je2baFp0mx599hYJ7IryyYICFxR0nNngEEPtpJaMGTCU2tJd/1vUdCATFWtI+U3QnwAPGb851N1VFmvwlBLidXsMq3BDBQH149nczc1lkDV6rJx0cMy4AVUkoZ/MgEsASCa6rMWtBs/s8iBr679HebOiW8BC3IBYgOpuMwV6ISZ+Cg3p0xSI5/zSD+jyuNOJVsp8N4mj3KkX/yGSwULLQhl4z9Bcfd4mUvuyG2MJ1sPA6K6RVNwzP4JUoU/HnpcmFU1jfLQGQJ2z2BiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv4In52TEAqOboeUTgJwTu1Szyh9A37pSaChk6wNoPo=;
 b=EVjId+QycyR97ngO99nvIJ9CIDt/Y24L4ITEEqun9hhz/gy/tjt7sAnmUIYfD4HJHX4V51ehi3XB8ODcLbxYELC6hQ4dR66Szne+2D0VCLnmvig0yjHUAB6dyV1KBpHnlUYW1Fo3EEWjS7SAAUS8j5qQwh9j7Vn5Bux07UiOW3kk87OUTiN4BudAEdmAD58xo0jfdBSG1aiv7p5wgDApsYzQGE3qzaS6u9eBUeWGaktajS5o95N2i/u19VDS+ENJ89iQVnob1PSvlAwnuLaKg+zrb9EniUUoiuCO9EXIX7OIxS9oljvvB1dtsXvdbw90lCCnmbb53zhbId6C0428Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv4In52TEAqOboeUTgJwTu1Szyh9A37pSaChk6wNoPo=;
 b=UrGBAxqFwv0UtqV0E9sH2A0w3iij3/zzm2Tu3Sz5MsrFICl8SS40sx2aTzyajcY4nt+7NzSzgs2XjGTxi5+tXlGCDmd4wsfgP7/68X1GYE8b7OMWkePqvf8q1x/gKfa1bCyLoq/K9GcEhi7P3BXBO2fX0FTrUEfR40oWrTwTvJc=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by IA0PPF7D094C5BF.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 23:24:20 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Tue, 2 Jun 2026
 23:24:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Topic: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Index: AQHc7T274Ga5YHY2Bk2+/jibW2dGerYihSwAgAfhXICAAYzbgA==
Date: Tue, 2 Jun 2026 23:24:20 +0000
Message-ID: <ah9elkU6NI1CsXWT@vbox>
References: <20260526183016.3501307-1-elson.serrao@oss.qualcomm.com>
 <ahdzhu-wahIyD7eR@vbox>
 <7ab2b045-d93e-4a25-9ef2-ef34146fd53b@oss.qualcomm.com>
In-Reply-To: <7ab2b045-d93e-4a25-9ef2-ef34146fd53b@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|IA0PPF7D094C5BF:EE_
x-ms-office365-filtering-correlation-id: 91c73c67-aae3-42d2-d83f-08dec0fe1305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 Csck8mjGgg2YRBxgyU1FCfpLrXGSs2hQ4D9u6UWTHRu5Oo9lgk4nJGCHWSQjRFjnGj+U3NLpqFgTRJS+wzF3o8cRRTFbAFormi4EQGlgSKjn5UmXFcapBLSBG4nbz4xdQeXVhLu3TC6sWJokLM8XDIGue/ycXO5IC8Kh+C3KG7OzFIY1mtxC5otE7/+IYPSXkZG62V1up1ikxhiFOEGdSia5at8I+g3v1iVsPS9KXdMn6a2MZ/oed1SswSYXSE3nw0NzqcfXZxBfTjTWoPb9qsw9VGnKwAlQzt731RDoMFZ5rXQ8iMpHV4h+APmDBVMFSL6hEYhT0iaajCAblWmzdqypeWbT4FpZP4MRgVmkEUhOr4WNWZ2/8T6XEakv0D3PkJyAXvqvBmxAN6s965QMRGNt3te+r7BnRMExs/C40lAjIc1SK3mWx7GC1jUnKwkHW3ygH3dHfdAs+ocNv29HoSPgic2dbnh/q/8LSSQaaFt8+uFJ51h1UlgEe5GFx6ksKwVxaVLUPx9ZxpMiT0M7GakMUaMvBqBbAqmmWs4a5Qry2S4I2gZGdgfWOeG/15unqt6mxHiMBWB8Uy3DKy3I6SrdBUZM1CE3MOJ9O+G58NOGxH7eZOwIQjyPy1wc/J2y2ZOyAecrLXFOnLypMNMdj5EGW8K4fnIOVijrukrelCjRQLBmxkRsvDEHSZEV+CHfzjm8EBZ3+v1oAzzBMPvtvy4QfQd9BWKqMqDNAdldCv9U3n40Ajo8zVH/Obk2g8MI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V01hU3cxS3ZqNlMxcnJFNmlONWcwd3NhSDBCWXA5aVcyZjkwNnA1endMc1U0?=
 =?utf-8?B?T1RiekMrYnhnUU9ySzlzelpzaEJWMmNhRGRnb3lMQXhubGcxNGx0VDJJbndz?=
 =?utf-8?B?d0l0aS8yRDlxdVhDZk9wS3lKMHdDZmhocHlHRmwyNW5Ecit0RUI5dDlwRHRZ?=
 =?utf-8?B?dWFVaTAxb1JMd2hSc3ozV05tazBLQThGQ1lvTDhLdERWQUtQSHN4UFlrU05r?=
 =?utf-8?B?UXJQU2ZneHBZcmozSlpWdVB1SWR3dDdnUU9TeDk5V0pPK1IwM1oyaVNBRlJw?=
 =?utf-8?B?c3NZZ3NaUVhaZjlhWk14RDZYb0RtSkZoRzh1a21jTEdCVnZEdXdqR2VPeXNJ?=
 =?utf-8?B?Z1Ixc0pRSlVYU0hlSllTK0lhM2JsOUxhMnhEeDR6WSt3ek1aMHJTNHdCQVBZ?=
 =?utf-8?B?VlZ6YmhINjJXVi9vaVloOXpBYnpUYUxlMVBINUhoMjdIZVh0Nk0rM2FJMVkz?=
 =?utf-8?B?Y0o1Qy8rTXJ0cGg4YzYzS1BvYVNxVm9KRXVBcWd5SDZtUzRFSlFKV003dC91?=
 =?utf-8?B?dndFVzRKbDFKU1N0K2FndjFWdXl3VXg0N24yUmhZajJoODBLUzNPbWNSR285?=
 =?utf-8?B?L1hjREsvalpxdEhrOHVrVGZhcnhONzM5alRRbjgxUFVIdTFDSXh6TDAxYWZ1?=
 =?utf-8?B?UlpPSVJYN3FjVUZ6Lytlc3JQdUtJdjhieXZxVXdDUTVCZk53N0FzekdsQ0Rh?=
 =?utf-8?B?RVFIMVh1OFc3dGdiQzYzbHpZNXJtOXZaeXgyWTRzV2c0TkRNSGxNU3BkUzdW?=
 =?utf-8?B?VUlYK2hOUVRaMlp1R082c2lJdGEvY2ZPT3NjT3ViZ3BoVkdscEoxTWtnUUxM?=
 =?utf-8?B?SDdad2xtblhZOURtT3A1UjhOM08ycm1FZnF2azVNM241TDlTSTFHR1FOaHVx?=
 =?utf-8?B?V1crRVFWNFlPSkw3M0IwOFdUV3NGNk54NU15RGZ4dGFVU0ZjYWY0T1FlUk94?=
 =?utf-8?B?K21WVGEvN1gzejhRdWp2YlI0UmJaeG9nTmJzOXpWL0U0MGNLY1BMcHZSTkta?=
 =?utf-8?B?cFhOeEVoWUJ3OTdQWENERDdKMVF4dU52UFNrb3NEMGo4bVNVVmZGY0pueUI0?=
 =?utf-8?B?bllJYzFYUnJ4V3JsLzd3d2txeXRBd1AvN2xUTVhNVHFnRDduN0NFU0VQUytw?=
 =?utf-8?B?TjlMWmVDK3RPanFsdGU2aElnSmpwbFE1MHVTRGRUOHFTNE53WXFsKzJuYjZy?=
 =?utf-8?B?ZWFTcmJOL3dZNFpGOXFkVWhWTkZVbnFqVDNRU2ZmdzJRSDIxOGhUcTlBVnpu?=
 =?utf-8?B?YnV3VjI0YTQ0VDZLbmE3all5aGZ6ZDhrWHZrNThybHo4QnRGNkNiYXhNNGtR?=
 =?utf-8?B?WUxaSU1OV2ludFdLOUQwcUJ2Q1Jia21nMHZCVTNNQmRoMzM0b25iMVArbVNV?=
 =?utf-8?B?QlBOYUNuUlJHcE01VTMydnY4eW9VQXhlaUd5T1ZBSGhET3ZuRGZ4VVZSaEN0?=
 =?utf-8?B?YlcvVXdnVVBrdHZKSGE3cnRKVldENXFIcy9JM2pzWW16UC9YTkJ1Q092dVlY?=
 =?utf-8?B?M3JvQnZQclJqQVJGWjAyMC90Yzg0czBFc080amNXVmY1elFGQUZlK2RCR1B4?=
 =?utf-8?B?OXVWcjR6TVVLS3laMWx4b2FIbXZYd0JLU3o3MVlDYXlIdkxITkVIKzJXVHI2?=
 =?utf-8?B?UkVyanFnNmRTZjlzSG5HcEZQRzBEcktCOEM4eFpwUWtncVNmdU1ORDVERDJZ?=
 =?utf-8?B?dWlwZWZzRTRBdDFkSk4rN21DeTZhYjJCQVVEbkxwL0QrekJKc29iTjlKbkFU?=
 =?utf-8?B?WlJLYm5RakhXWEc1b1loazlac1p4MGlpS2kwbWwzS3h0NTZBeGZDczdnTDBp?=
 =?utf-8?B?STN4VnBIUTNNd201cFJJMjRQVnpzODNONHA2MUVldlM4VFlwVlZWb3N2QVcw?=
 =?utf-8?B?eGRFcjdKVTdhOHE0TmliOU1vZ0RhazhGbmV3MjZFdmRST3lqZURnSlBSWW9a?=
 =?utf-8?B?WHZWMXZ1Z0xXbTloaThMS2tUZDVxY0VObVh4dnNvVmw5MUwrRTNYNGpBL1NY?=
 =?utf-8?B?bmhKb3lTS212cWFuZ09hYjl4TkJ6ZzhBdXErNUZoNERldnVteGhwUDlHWDRF?=
 =?utf-8?B?cUVuWFdkOG9tVHQwUy9kSHV4ZHlneUJsa3lBZXF4cHRPU2pUVkNxa0Zxeitx?=
 =?utf-8?B?K0MzSnVvOVl3cXcxVFd2ZmZyV2VIQVd1VjFKL3BjQUdzTzFKWEFkMmJQR2dw?=
 =?utf-8?B?YU9EbFdsOXV4ejNwK0k2dEtTNFJFQ1JzdmRRcVFrdEVoTCthQ1pqRkxEblJk?=
 =?utf-8?B?dzF4Sms3VUpEYTdnbk1yZk5SVmNGVkREZ25wbkw2b25YMmk1VisweEd6RUNG?=
 =?utf-8?B?WVEvVnhEeXc0TEZvMWtsc056UHJwaWdrbGEwSUhRVlFsUUhDSE9tQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65B26F8D315F6648ABBEBAD9697831FB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	IxW+FObtsb7vf8kxteKmyFPCVwGxCh1eenUyXSZx+8ffP9dhDHFN4yUlfqDAAPNW88wmL6++KC49+i0OK3KVVlgSJeyWIizxmGs+pEJ9ko/1gwN0C5vzPlwZBmiTK3DQ9hilsP3GHJX4CRYHOVqezpvXzXuzSLBvlrRL0RiStsC59vyWrHgjzqqsgyd/92uz+1ncYqsm5xoD40WPmhAMnmMuUBhkvLql2K1tr464bBTb2g4+70U5DCv1WqyRdhg5BlWpSWE24yh3IxXs80VUKUJQT3nUHygRwmspJf7KZFvEJfEU3CPx3LzhJfbDjmDpS6s/0lpxB67jn+i96AuoBA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eslXAcaNuNDqc1Gh2InvZwJHpqoisVUF/tPWO6QoOG8YEUrTgxXZLFIWm3Tge8nxAY5VzonkelqUE9RL0iF10/yJVYRiRq6Ne2rhS0AMzn7wnp70xC5ylIV0MPQeWhpXoqB8wjLwxlOtsZrjvf2oRbQ2zwOYU6cB8ETgrmpc2/lvzZmyG2DAfG4JsRys1BBfzMfLN8KZyjQfbnqYB3BTtY+Lx+yT9E+aHR1ib2JE/qLqFJIwS7byr92LQyX34WVkZpA2O9mELJy+bxnAm/AQ4eHthbVECHRCiMMoG/rwZU7tyhBcPdEbfPOpktBEhdx5BrBIIZYZaGPwPvgfZ6g8IFTiFRixu2vnwIG4hv+qmWYeRkntMqInJbE5rEvSdv5IU3pc/IiR0d+BBcsaOKJ4DqWIEFNnftRn4UUPezjV1fls16jgonbnTT339ylwdrJKuNUaSe5zxL7EeaFUI1lH+41ErQXh3O0ZpiYhZwsZXVBtEPmvGufJR4rHYmoKGDX7MPMeqS+I8G/pVPl+UBWDzWpHzsKNKrVwRMbnsKnpI7clBmtji1JDX6C62FEVwtFnzQHi2ftYOqffqwquLwS3IKUr3brBHipulsKgjM3qjWLFH5qCNJzlMxyFTUxXIL1sYZJqlXgR7TivVV9lD9jjWw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c73c67-aae3-42d2-d83f-08dec0fe1305
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 23:24:20.6193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +vg9vXOf0jDu4lh4zIqWJ3e5ng29SWu82gxZZrAfnF4kHN+xAm+OjoCO2nvN0zWDzHGVvomjd/ZKlq54r4c+GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7D094C5BF
X-Proofpoint-ORIG-GUID: BH_4ygG5RV3NDE377fBve7w3KSFRyI3E
X-Proofpoint-GUID: BH_4ygG5RV3NDE377fBve7w3KSFRyI3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIyNiBTYWx0ZWRfX73DVNvTv2YRI
 +xVF2fHQ03sZzwYg7zNGzPKnTAgkE3TzTiGXEOCp1wnIN0ZvBMUHDfLKu6EQDNaLbXnP1WpYLL4
 z0LuYlIB1OcOpEqCVCvHGyuERvgu3IDSkPx5IAHk9C7/zQGQGgBe0MLDy5rkcP/zgdTPIabogrl
 GvUY++jLzbhlSIt36bjK6ZkuMxZqJYoeG9N/wkMeC86oKHsiR/4e9X3+2e+TOACRL0Xao+jWh8n
 Wrulwh737gQKVsM2Y7csQnx/7FyzSMsAXbaTlyKHNrqOyELTs+m7JhdGqC+VCU1RyosKqDTb4Vi
 jWHe/EFYXdpb/Aq3HZEFnjpxfgt+Pylp2n970o9NyvBRFPYePJw8SurxE7Y44DeSjWglHXSi28i
 r2SyeGkQrmeuqb6+FvNRinL2RFvmsQRZjHm7GYIWkYwZzeVxGQpCtoDOlMHOd47cZYvWx1j8bey
 FC4wQ0nte+4HzYC7JFw==
X-Authority-Analysis: v=2.4 cv=Y8fIdBeN c=1 sm=1 tr=0 ts=6a1f662b cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=yp_rlx8uBflPGGsEfUgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606020226

T24gTW9uLCBKdW4gMDEsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiA1
LzI3LzIwMjYgNDoyMyBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFR1ZSwgTWF5IDI2
LCAyMDI2LCBFbHNvbiBTZXJyYW8gd3JvdGU6DQo+ID4+IFRoZSBkd2MzIGRyaXZlciBjdXJyZW50
bHkgZGVmZXJzIHByb2JlIGlmIHRoZSBVU0IgcG93ZXIgc3VwcGx5IGlzIG5vdCB5ZXQNCj4gPj4g
cmVnaXN0ZXJlZC4gT24gc29tZSBwbGF0Zm9ybXMsIGV2ZW4gdGhvdWdoIGNoYXJnaW5nIGFuZCBw
b3dlciBzdXBwbHkNCj4gPj4gZnVuY3Rpb25hbGl0eSBpcyBhdmFpbGFibGUgZHVyaW5nIG5vcm1h
bCBvcGVyYXRpb24sIHRoZXJlIG1heSBleGlzdA0KPiA+PiBtaW5pbWFsIGJvb3RpbmcgbW9kZXMg
KHN1Y2ggYXMgcmVjb3Zlcnkgb3IgZGlhZ25vc3RpYyBlbnZpcm9ubWVudHMpIHdoZXJlDQo+ID4+
IHRoZSByZWxldmFudCBVU0IgcG93ZXIgc3VwcGx5IGRldmljZSBpcyBub3QgcmVnaXN0ZXJlZC4g
SW4gc3VjaCBjYXNlcywNCj4gPj4gcHJvYmUgZGVmZXJyYWwgcHJldmVudHMgVVNCIGdhZGdldCBv
cGVyYXRpb24gZW50aXJlbHkuDQo+ID4+DQo+IA0KPiBbLi4uXQ0KPiANCg0KDQo+IA0KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gPj4gaW5kZXggM2Q0Y2E2OGU1ODRjLi4zMDM1OTgwNDhlOWEgMTAwNjQ0DQo+
ID4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiA+PiBAQCAtMzEyNCwxNSArMzEyNCwyMSBAQCBzdGF0aWMgdm9p
ZCBkd2MzX2dhZGdldF9zZXRfc3NwX3JhdGUoc3RydWN0IHVzYl9nYWRnZXQgKmcsDQo+ID4+ICBz
dGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3ZidXNfZHJhdyhzdHJ1Y3QgdXNiX2dhZGdldCAqZywgdW5z
aWduZWQgaW50IG1BKQ0KPiA+PiAgew0KPiA+PiAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZ2FkZ2V0
X3RvX2R3YyhnKTsNCj4gPj4gKwl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4gPj4gIA0KPiA+PiAg
CWlmIChkd2MtPnVzYjJfcGh5KQ0KPiA+PiAgCQlyZXR1cm4gdXNiX3BoeV9zZXRfcG93ZXIoZHdj
LT51c2IyX3BoeSwgbUEpOw0KPiA+PiAgDQo+ID4+IC0JaWYgKCFkd2MtPnVzYl9wc3kpDQo+ID4+
ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiA+PiArCWR3Yy0+Y3Vy
cmVudF9saW1pdCA9IG1BOw0KPiA+PiArCWlmICghZHdjLT51c2JfcHN5KSB7DQo+ID4+ICsJCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiA+PiArCQlkZXZfZGJn
KGR3Yy0+ZGV2LCAiU3RvcmVkIFZCVVMgZHJhdzogJXUgbUEgKHBvd2VyIHN1cHBseSBub3QgcmVh
ZHkpXG4iLCBtQSk7DQo+ID4gDQo+ID4gQ2FuIHdlIHVzZSB0aGUgY2hlY2sgaWYgZHdjLT5wc3lf
bmIubm90aWZpZXJfYmxvY2sgaXMgc2V0IHRvIGRldGVybWluZQ0KPiA+IGlmIHdlIGV4cGVjdCB0
byBoYXZlIGEgcG93ZXJfc3VwcGx5PyBUaGVuIHdlIGNhbiBwcmludCB0aGUgbWVzc2FnZSBhYm92
ZQ0KPiA+IHdoZW4gaXQncyByZWFsbHkgbm90IHJlYWR5LCBhbmQgb25seSByZXR1cm4gLUVPUE5P
VFNVUFAgaWYgd2UgcmVhbGx5DQo+ID4gZG9uJ3QgaGF2ZSBhIHBvd2VyX3N1cHBseS4NCj4gPiAN
Cj4gSGkgVGhpbmgsDQo+IA0KPiBKdXN0IHRvIGNsYXJpZnksIGluIHRoZSBjYXNlIHdoZXJlIGR3
Yy0+cHN5X25iLm5vdGlmaWVyX2NhbGwgaXMgc2V0DQo+IChpLmUuLCB3ZSBleHBlY3QgdGhlIHBv
d2VyX3N1cHBseSBidXQgaXQgaXMgbm90IGF2YWlsYWJsZSB5ZXQpLCBzaG91bGQgd2UNCj4gcmV0
dXJuIDAgYW5kIHRyZWF0IGl0IGFzIHN1Y2Nlc3Mgc2luY2UgdGhlIGN1cnJlbnQgbGltaXQgaXMg
Y2FjaGVkIGFuZA0KPiB3aWxsIGJlIGFwcGxpZWQgbGF0ZXI/DQoNClllcywganVzdCByZXR1cm4g
MC4NCg0KPiANCj4gT3Igd291bGQgeW91IHByZWZlciByZXR1cm5pbmcgYW4gZXJyb3IgKGUuZy4s
IC1FTk9ERVYpIHRvIGluZGljYXRlIHRvDQo+IGNvbXBvc2l0ZS91cHBlciBsYXllcnMgdGhhdCB0
aGUgY3VycmVudCBsaW1pdCB3YXMgbm90IGFwcGxpZWQgaW1tZWRpYXRlbHkNCj4gKGluIGNhc2Ug
dGhleSBuZWVkIHRvIG9ic2VydmUgdGhpcyBzdGF0ZSk/DQo+IA0KPiBDdXJyZW50bHksIHdlIHVw
ZGF0ZSBnYWRnZXQtPm1BIG9ubHkgaWYgdGhpcyBnYWRnZXQgb3AgcmV0dXJucyBzdWNjZXNzLg0K
PiBSZXR1cm5pbmcgMCBpbiB0aGlzIGNhc2Ugd291bGQgdXBkYXRlIGdhZGdldC0+bUEgZXZlbiB0
aG91Z2ggdGhlIGxpbWl0DQo+IGhhcyBub3QgeWV0IGJlZW4gYXBwbGllZC4NCj4gDQoNClRoZSBk
d2MtPmN1cnJlbnRfbGltaXQgaXMgdXBkYXRlZCB1bmNvbmRpdGlvbmFsbHkgd2hlbg0KdXNiX2dh
ZGdldF92YnVzX2RyYXcoKSBpcyBjYWxsZWQuIFRoZSBnYWRnZXQtPm1BIHNob3VsZCBhbHNvIGJl
IHVwZGF0ZWQNCmFuZCBiZSBpbiBzeW5jIHdpdGggdGhlIGNhY2hlZCB2YWx1ZSBkd2MtPmN1cnJl
bnRfbGltaXQuIE90aGVyd2lzZSwgdGhlDQpnYWRnZXQtPm1BIHdpbGwgYmUgc3RhbGUgd2hlbiB0
aGUgbm90aWZpZXIgdXBkYXRlIHRoZSBwb3dlciBzdXBwbHkNCmFmdGVyLg0KDQpCUiwNClRoaW5o
