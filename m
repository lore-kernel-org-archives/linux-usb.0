Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795489917;
	b=b+CZm6yWKANCnHNxsXUbUwd5JT0VZXxqMCkynpS823t0WuWLaVlQ8p0ftcvUB3kTlx03
	 Ql5l+yUXCGTa7WehHy4Hn6gCxPMgZ7QjlFVTB7NPrSi9VOHmXPF7jiDi0jgJY/M2ivse5
	 vAlVce/9vcda0Ta+rPvOFGT5Uf90p0SVMRQkvRpJ/Bvgzl01JeufJwuKeDni2vUyZ9E6Z
	 ydSYXovAVpwJYCoyCLhO0I/sOkkLVX8CjQ7F3ojRYQOhwowIcGHXo6hjgbavBOAGR6NL4
	 t8zMs0WdOK/xEWTCkT6Fva8Ix9sbVjqEJ5TpiAVLE9flWrjEjnyHC97M2KcI7YjsiFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489917;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BLUmtCbOvgBKgeK9k/ry7T6f9nVh3itOxxfb7TXtP6E=;
	b=VPHDPtrjchTyum9Uh6D/UXZ7pWTAio1AIBJYP3B3WYjida9zfVkG0jQQ4UnTTOZo8kW3
	 1qHN5+Ps5vtzlhMmYRca0CttgPe/uIjqekdfxWzhLzLkIKAIizqBaeofsp32/IyJ8VtSa
	 JTyUX3SK4WVQJ7tZLCtngo8tuLpj8S0qrcK/gQxo8PwbB041sGrIuuVjXg6P1GwJy8hsd
	 q4kp2KGzQRSiNppbw9qhmJIHJqV5WLMvXqduHweCwHvbbaiTuQm8GvTYXso9cBSoY/pMX
	 H8ozFuUNAFcJ81R3rY5jwnI5ypIQuOmAY6oCTsqD08Jp+fHW6NNZS9VxjypOdO0MnPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ZfefJZsj;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=bO0EZqgi;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b="l/lZr1KE";
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B79606A331;
	Tue, 24 Nov 2026 03:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B79606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ZfefJZsj;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=bO0EZqgi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l/lZr1KE
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lVFg1692067;
	Mon, 23 Nov 2026 19:11:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=BLUmtCbOvgBKgeK9k/ry7T6f9nVh3itOxxfb7TXtP6E=; b=
	ZfefJZsj4tyzHK9wvqThqyMv/4fKarV++ky/d6FU5mZtFdkOqAkFG0/8HYQfbn+7
	hojVLJWcuCiNTSGP2OQyW5Hiip3oSNcQRfsBaWaXUDuvluvM9llyJapRo9HP4dQi
	liaxXiBmhQ8mpukIzVid2xF1M1yEKWnNqutNfXgzNi4gUU/WmlbLC4ntqHV4mXxI
	pL9in7Ki1u7KBT0Dowmu2rRmPkbb+SiphpEl5CggdtjxCYjPVVCL7zC7+csXRnfK
	Of9jup42hZ+qY5WCSKm5mxUiQidjaoRnzzqMs3CV3i3LwozIw3w4fFZdOr7RbAtO
	otymmNW2e9GjDS+V5U7rjw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j4rk0m57d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 19:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795489892; bh=BLUmtCbOvgBKgeK9k/ry7T6f9nVh3itOxxfb7TXtP6E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bO0EZqgidW+svM48fc1p2UvLrocBWsnGVzdsw9vyOZhnEmnqDcM95GBsAvT7hx8uk
	 Oo7n20UNr83v354qcZbqYjLSZdRUUOW2zcgLKuIiNZXUW4IW8RN8u4yjsIXLOI6ERp
	 SvqGOfK1N2Y36qPCMqpxNmw8+hku/xJdSXYiC7eGSORFOOgDvsSmQ4+FAK8JEqXXXt
	 343susSWDhUan3wOjm19nSF4HjrKmuclQsdfOcOmmxRYVDz/FpZEIUGD/7WpyYOig4
	 FAeeS4rSr1RUp6ZTmK6n7viJX0jRUnBniuyHxjLEigjEtDwfbsG+PFhM4BaG1tYFoO
	 A2nWEmYXZMx+Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EF82F403FC;
	Tue, 24 Nov 2026 03:11:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 59A01A0070;
	Tue, 24 Nov 2026 03:11:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l/lZr1KE;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 11DFA22029F;
	Tue, 24 Nov 2026 03:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR1tz7R+78IyJC+5AdPoBZwk1hPwRttshMXOlrCVHwQ7WypogQhWVUS+JDXI0RXwjKxpfjwfDadIS7ibXyKwVcVHbs5iCJNn/ZQ+QjX6pYZ2D1QnoxI9j+XDaYVyoZyvhPpclg/vJR1+XluAzjPKywNThzgYXiw71Wx3ttfsihDFo6Ivg0YCeymDjLSduSlcX0V74Fn6ds2sewFATEo0etwVYD+5DbV2YN41pEnLFdoQzUCTrgeCb9PF0kVRWFmnlNKxS+VK43WU0P+DPF93VyRdCXKoESOsn9n4OxKoI/la+QCtHwRMJrR1uyuKkfkD0L0fvlxB9+8XtHGEOBT6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLUmtCbOvgBKgeK9k/ry7T6f9nVh3itOxxfb7TXtP6E=;
 b=oHmoqZeXkqs8qQZpTJyGrun5lNAsYb7z0jP0De2EPcJAPVS+/rPKRVR2FGl/3kRzUyvOuugjj61FpOsWxOoNxX0lHAc2KoPi2hGqcKFl2/uDz72TtkhNeS9AjBFQ2CujQ+J2fxzQP8F9V5qxtqSzFB5ZFUrRNF+r3pGIX0h75dPfBTGBoQBrX/A8LxJh/ODYw/GjlboIMEBqd1IDGJOgPvklF0LUFmEGp4eHtcMcLkRImVdkx+jjeCIN+TgjTTWDbWAj7qLnRLdHYbg0oroxVr4IxxrL4Dvb9V112xuL/ZARoZTFbMd4uO2BQA0hG/g1Xdze6VrVGRTzfSj/X9aCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLUmtCbOvgBKgeK9k/ry7T6f9nVh3itOxxfb7TXtP6E=;
 b=l/lZr1KEvhlAK55oLFiCm+TGW6ccqLKmDcUVl6L8I+L4Uja+I7ksrp5ySu3K0jduusl4g/3aoS1+IzF1NeB83bGigADF/u7Vb0+BFImDj2Rj1jRyf45i88W7LqHoeyQHUr1Fg5ayvGIsVg2c3VDseKrtNhMW0kGQrX0Qv0ILA3c=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 03:11:17 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:11:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Thread-Topic: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Thread-Index: AQHdcPT3jDI2RZxA1kqryJC1NkKLu7cppHuAgAB0FICAEohVAA==
Date: Tue, 24 Nov 2026 03:11:17 +0000
Message-ID: <awT8VH-ZccQXmw-G@vbox>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox> <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
In-Reply-To: <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|CH3PR12MB9341:EE_
x-ms-office365-filtering-correlation-id: f9ba1009-f08b-49c5-0c70-08df49d89b43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|3023799007|11063799006|5023799004|56012099006|261026121527099003|4143699003|261028144727099003|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 hK1pEFCSEL2ozxTmsJSWLkVdY6HefcN8PLNNNhXPS8HvDN8yRDEbSEg8F17yWWh3R6eSRbBHE3/VY4FPoxGrxXLW00OTTJFgPpA80wtX0tlEz2orluMN9vw2U+oBllrHn9QyA63biLx19GRWDprANp+h9PAezd4GLkwXOPrJiidH6LIIqatKuHdZnQMvuMpXQ1Bu0jjKDcUr0imDqRoE5g24L4ZYpK9b76G/oBQ5WBhEA16O5+OfIUUyEtGas6s9Hwziu5oTIp/p91c0ki3e+OnunuDkBXDZv0bOjferCOp06TsTHXwVjzPC2YEdWB52UQ2gISTv8dMp7tX+K7z4Vlj6taRqSxttfq2Gbt0AgfmxVay6JbSRuUf49shigTs8vG+SfoY2d9eysDnQjDJd7L7Lu/ViSTIb8AZ5cJcpRgjzVkQicxYz+FgdTdKtrpA1CwClJvDpTr2s+rK5N0LbEXB8pxc8h6al/N9aKwmYl3oPF07WKLt3JAj6sKV6cVvhMgIoQbtHebzZszKZUzF22J2vgWkakk8K+ouWX4LEGUuaagT/0vI/FevFGO8B5Yho1rC6yF/7S2SFNFtHLcKTnzYYmqg3+KGoaAhUNeuv5tZQgk65KEe4K8jlmnprC/2MBNZqXHPjNhgzn+SIHBYlYtsHjRce0rk2fGTmlthSREwoBeYQhT/fPNkrj2whGZ9IOD4Qqfyw6a4gwZtzz+dGd6KGoLIjKwkB04TaWRKw+0g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(261026121527099003)(4143699003)(261028144727099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWgxdS9LQ2gzMm5TZDRHZUhYMXFMOVRJK1dlUDNzT3pJd1VtRVFtVjRLSWll?=
 =?utf-8?B?dUI0SzYxRmM2RVNCVXNHMkk0US9yMEVoR1dDZURRVUdQRWNLckEvRHpZc3dB?=
 =?utf-8?B?QktDSEhSb2N5OHgybWttWnk0cGg3RFNtSTZyZXcveVQvUVppdE96akVpMklD?=
 =?utf-8?B?eGpabWpjdktLNGQ2OXZGYUZZTkREaml6am1QOUtuNnk2dGs5UjhJalhRL1dp?=
 =?utf-8?B?cGMvTUNJL1RqYmM2Yk9YQWRNTHRyWGpuaWltUkRPQUE4aUs5N21zc29FRHI0?=
 =?utf-8?B?VlhocVVJWTlpQkRXbnVpMUdoWFhkUVEwbVo5VnltWGNOM1M4ZlZqd0F1aTh4?=
 =?utf-8?B?NjVzWFYybEpqUDJxVFY5dGFxOC9rZllXTXZJZFpFcHNHeVlzQUtlcFVqVytB?=
 =?utf-8?B?R1pmTW4wU0hMOUIzeWRmVHFrYk9nbkdteFcvQW5EWFhLK3NIR3YxT0xOdVll?=
 =?utf-8?B?NlBYWXJBT1A3V2N4d2RvWkE0UXRhdS9RaEFLaEhRZVV2Tnl6bThwWlpUQ1RI?=
 =?utf-8?B?S1FTeU9JSWFKNGg4R2FFd0M5UUluUHA0MUFhWGEveFBPVTFESk8wYUh6cTJy?=
 =?utf-8?B?RU9RZkhJOFd1WHh6TFlra2g5OEhxbkZCOWI4ZHdMMCtPeWlJL25qNWRDYlQv?=
 =?utf-8?B?VXlCRG9qd1ZqbmRqNFVLRXhBTDdkdmpmNGhkYklxOHZiQ3ZnOXA5ZmJCWllC?=
 =?utf-8?B?clFXQ0MvTXF2U0laSUJZeVoxd3FqZndBbS9DWjVzcG9vcmtMWnFyVEJmTWpS?=
 =?utf-8?B?c2RyNnJLMGdZeExBSjVGOGtLV1hMN3JlNnBHWjJ2a2dwQ2FlZ0tSMVNSZisr?=
 =?utf-8?B?K1dNeW1UOEhMc2VGR0VaUE96V1FJbDhVUnpXSm05Z1hZcEpPWUttSFZ3Rkpt?=
 =?utf-8?B?R2tDZTkvcUphZXRYVFk5bzhiUFo2MjM0MDZLRStpdWw2WjMzZzh1U3lVSDJZ?=
 =?utf-8?B?c2REMnM2akFRYldhT1JVVWVyNjRnM2VNSy9IcjJRS2tNQ3U2WDZLdnkwSEdy?=
 =?utf-8?B?Mm53aHJtL0hvaDNJeC9YL2FGV3pSckUxNSt6UDNCaGNIWXFuV3ZwWVVYd3dO?=
 =?utf-8?B?WFpyRlBWTXRkM2J2N29ubTJvWjRUZWhoTVg1S0JER1JFNkNYQWp4VXloekR4?=
 =?utf-8?B?Wm83UzZSajlrUllpdDVndXFYNFlPZFd2ZTlhMmZXaXFXUnFYd2dDc0NaMmtu?=
 =?utf-8?B?SWRDYXczYzdpZnJ5K3AzV2xLVEJrQkQ1UURrSStNUkp5QWhXOHRHQkcrYmhN?=
 =?utf-8?B?VnJPdDhyU0lEeEJNUGVmRndRWjhTV0hqOExBNGltUVUzMjNVWmNLU080NCtZ?=
 =?utf-8?B?UllNWGYzeUdPK1hIUVgxNXlSbTFOOHd3bnZEVWVVeFphSEU0SEZQWXBpa29r?=
 =?utf-8?B?S3RwSm1hTStLdjNvRmM4REUxZmF3QlNtUDUzb0ZHZFBVSkZFTFljNU13ZU04?=
 =?utf-8?B?UmxMb2g5VVBoa1B4cEFBRi9zS1cwdXUyVjVvbkJKcDhJVWdJKytjR1RNS0NK?=
 =?utf-8?B?QXN2RmNOYTk1Q3gzQ0UrOHNiRTlxbUYyaUFJT3BOYlF6cVpYT2hmd0k4ZnZL?=
 =?utf-8?B?YURLNzd5K1gvdVcwWTRwZFBud1E5ZGRGMUFGYkpQNFp5OG80NC9DQ0Jvd2V5?=
 =?utf-8?B?RGlqUkM3TkVoQzd0aWRlU2FybUZQVncxcUF1VFJHTDRwNm5SL0dMQ21yR1p3?=
 =?utf-8?B?ZUhMMkgrVEZ6TGZPOGlCZ2Z0ZU1TVHJEUmdLTXhubmVLSVpVSDBoc0pwSXox?=
 =?utf-8?B?aG1KeUtkV3p6QmlwcXNwR3l3YVNFT0p1NGVkUDZ4UFFiK1I5dlVkTlNhUTBW?=
 =?utf-8?B?RGc3NFBUK1JndUpQOXVSWGIvUjRSYmMyNUtWR0pUZEE1U1VnOCtzQ0o2REcv?=
 =?utf-8?B?dU9lWVc5ZmRma0pNalNXSzlOSjlEdzRBQ0luUDk4WW5PMUc0clh5QVg5Ymhk?=
 =?utf-8?B?ZnluaHczMFRCdnJmTFFUeTk5c2QzeDA4OUlHUUJLRUhVRWUxaFJtSEVNVlVN?=
 =?utf-8?B?QlhnMS9NRVhjVjZCME9zc1R1V1pVSjFOZlpXdXFUR2JLdVFzQnU3SWM4V1Zw?=
 =?utf-8?B?YVNPOEdMcndaYWNsYjVOZ0NaQnE4cVM0aERhMEgzVFlOTjNzTVB6NGFXbG94?=
 =?utf-8?B?R0M0UjVFNW5yaWY1YkYzc00rcGlieDUzRXBpdlhWbTJHanhYU0NsOEs1TjE2?=
 =?utf-8?B?UzBXekxXQUlUR0J4bGxZUHc4WUluUjJyelVKSW1HKzM4MjN6RkVCc3grSEdi?=
 =?utf-8?B?cGE3NzN5NGxwZ1dvbnFZRDFBSFlsMDBrbk0rc0NmZnRTakxTWW9FWllXMExo?=
 =?utf-8?B?L2VBOXlxS1RzT1VaRDJXcDFFTkRFUzFtQ0k5N1RWTTZ6YlRpQ3dnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6646D708327E934F92A8852E46CA0540@namprd12.prod.outlook.com>
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
	Dk3QGnqKJblYPKAmCkBHYUFVFKHVrSo79MekdwsYHzfS+s76adzy0HTwZJxVaPM3UuXJRxO9MCM9WEeoRX1hsJNK4LHw1lYQevVFhJeGIURM90BObZxae3ctgatTyWWdkJRjv3RIPUNbsrR1TVR6REuZrQTM4HbHJi5tN0bENGPN38fJTFffINF504Ez7vN5Op5Ls4A89jm5W/4kAyeW7yWn3qnilk10j+d539sM6XZEe+tSyEfYYAnHMwq719w5GKcUSnPWjuVFWBWoTww0URD4BHasFOQYr9A7EGAovUbWG4kcOul2Mma69G925i+H7sgRGZKF9fEZ6IevD6V9gg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V02yph9HbsbCokLqq5brf+D3ZEA8feSeXXE17CSud7v6kTa+FGnAKKpthfDFciq/oh1f4zArp3U/tA9qawPMvHurgdjBPpKMC4JDWX5QDHIQOU0RkQmnMJypcE8izZQzBY/34TIZcpAab+8mWzhEzaDBnD/JEzwg3pgUHaWNzbKwpUyyRmTkGmwDuAcWZmRYTZZVQDd+wiAmBVj86eub0sob7nRtdOwVWFkH+WWbUOTdAofOa0iMQAKvoLWLsOd67vOXd8Sa4Vd/zNx/w98N3xdwKcWa58oPy3pMp+t1edTfjnFH04D0qOviVeQ1CsaWuGbx4fYM3QV31bdxGIRPCddWs5sXg1f/JYxs/L3AuRqptjEQDr+g/vG3vWZG5e00eg3LE5w/LriPcF3F8QQntOmhDH53HfugO+fYcWeGec3JR0RWlP+5QWi5yXBvgv7GF3OCxzRzExfMK/RnTXctxfCDVfqoiHg/d1xrGA+V8QXLgpfZB84TAqUcoYZWxHPfIPdj7qvsvPZP/5Qk+gE74X6CMYJhM9fYVOQxNhiiPuFWCdMDYkQfyPBIZKYy95f30dQ3dDhk3M7KYbPTVIT+3VRgoYfaxHQHSS04FNsYuVVLRJpNuCqkkQ5pM/kAM5YqbVUVniV60ryEp82wqnKyPg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ba1009-f08b-49c5-0c70-08df49d89b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 03:11:17.6038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70ZlollTO8eWCMhTeXGWkdH3c519azCW2YcN7wTpH7OAmuxV7aZ/mvQxIB6T0mkN5Otl5xodDQVr+G4R4ArwZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
X-Authority-Analysis: v=2.4 cv=FfyiV5+6 c=1 sm=1 tr=0 ts=6b050065 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=MUlVZkfbThn8TqxvhsoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PcIr7pR-I-T4JEDC0OnSgogLefJsK_dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfXy2/7L6L0L4TU
 F9E+bfUV2OcQlZ3rtLfWCTgltvMxt1bQfDoPr0bbRP2BJzXNuQyG4k01pm72A4vfJmRFtmNN1l7
 gXAWneGR8MCd3f70JjKxva1FgIQGoXXWY0HgemeNHsfMVsGrTgdHUfZIUDm6eqgCIYWNTi2qcgH
 0lNIq+t0wAWc6Xfmhc55I1yqeptIXeElQP8sX59yhNH1HF+IYSwOcjxxc6+4fu6i5bVIKFhOKLD
 NBW9TgxXUHqYQIagFu8hAee6MNMopkfujIshzTDrWugk5MNLbQMJUP8VoYUXbkJ0EerpUAkHTVv
 IeMCQbs+kFU9cHRfvDclwxAvfkyqhoZBRp4xd//bNc0n4otgzjd+IPE5RcEMgRbWQWNiHNoqzYF
 ltcR6ejEWZgTjh5IxQGS7Wyo4zmz560OFFE5G0r41L9x8Q9DFjIx0XaBsPWXLVO6RX531m6+vfC
 xzLlpgihwR9n8oNwWPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfXyolYEbnNvnos
 3DuYxtfg8AtP2cvR8UcVVWEPA/2e9jSzS1hDGtRY9GGapJN/m7pI8KGblTFUFjOZodU0LaKchqd
 R79L0lBwRzqOwvndPbOJSwmY192oYZY=
X-Proofpoint-ORIG-GUID: PcIr7pR-I-T4JEDC0OnSgogLefJsK_dO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011

KFNvcnJ5IGZvciB0aGUgZGVsYXkgaW4gcmVwbHlpbmcuIEdvdCBoZWxkIHVwIHdpdGggaW50ZXJu
YWwgdGFza3MuKQ0KDQpPbiBUaHUsIE5vdiAxMiwgMjAyNiwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4g
T24gMjYtMTEtMTIgMDE6MTQ6NDQsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IEN1cnJlbnQg
cG9saWN5DQo+ID4gPiAtLS0tLS0tLS0tLS0tLQ0KPiA+ID4gV2hlbiB0aGUgY29udHJvbGxlciBu
b2RlIGhhcyB0aGUgIndha2V1cC1zb3VyY2UiIHByb3BlcnR5LCBkd2MzLXFjb20NCj4gPiA+IGNh
bGxzIGRldmljZV9pbml0X3dha2V1cChkZXYsIHRydWUpLiBVU0IgaXMgdGhlbiBhIHN5c3RlbSB3
YWtldXANCj4gPiA+IHNvdXJjZSBieSBkZWZhdWx0LiBVc2VycyB3aG8gZG8gTk9UIHdhbnQgdGhl
IHN5c3RlbSB3b2tlbiB1cCBieSBVU0INCj4gPiA+IGhhdmUgdG8gZGlzYWJsZSBpdDoNCj4gPiA+
IA0KPiA+ID4gICBlY2hvIGRpc2FibGVkID4gL3N5cy9kZXZpY2VzLy4uLi88ZHdjMyBkZXZpY2U+
L3Bvd2VyL3dha2V1cA0KPiA+ID4gDQo+ID4gPiBQcm9wb3NlZCBwb2xpY3kNCj4gPiA+IC0tLS0t
LS0tLS0tLS0tLQ0KPiA+ID4gIndha2V1cC1zb3VyY2UiIG9ubHkgZGVzY3JpYmVzIHRoYXQgdGhl
IGNvbnRyb2xsZXIgaXMgY2FwYWJsZSBvZg0KPiA+ID4gd2FraW5nIHVwIHRoZSBzeXN0ZW0gKHNl
ZQ0KPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3dha2V1cC1z
b3VyY2UudHh0KSwgc28gd2l0aA0KPiA+ID4gdGhpcyBwYXRjaCB0aGUgZHJpdmVyIG9ubHkgbWFy
a3MgdGhlIGRldmljZSBhcyB3YWtldXAgY2FwYWJsZSwgYW5kDQo+ID4gPiBwb3dlci93YWtldXAg
c3RhcnRzIG91dCAiZGlzYWJsZWQiLiBVc2VycyB3aG8gTkVFRCBVU0IgYXMgYSB3YWtldXANCj4g
PiA+IHNvdXJjZSBoYXZlIHRvIGVuYWJsZSBpdDoNCj4gPiA+IA0KPiA+ID4gICBlY2hvIGVuYWJs
ZWQgPiAvc3lzL2RldmljZXMvLi4uLzxkd2MzIGRldmljZT4vcG93ZXIvd2FrZXVwDQo+ID4gDQo+
IA0KPiBUaGluaCwgdGhhbmtzIGZvciByZXZpZXdpbmcgaXQuDQo+IA0KPiA+IFRoYXQgd29uJ3Qg
d29yayBpbiBob3N0IG1vZGUuDQo+IA0KPiBBdCBzb21lIHBsYXRmb3JtcywgVVNCMiB3YWtldXAg
bG9naWMgd29ya3Mgc2luY2UgdGhlcmUgYXJlDQo+IFVTQjIgd2FrZXVwIHNpZ25hbCBkZXRlY3Rp
b24gbG9naWMgYmV5b25kIGNvbnRyb2xsZXIgYW5kIGF0IFNvQyBsZXZlbC4NCj4gRm9yIHdha2V1
cCBzaWduYWwgZGV0ZWN0ZWQgYnkgY29udHJvbGxlciwgeW91IGFyZSByaWdodCwgaXQgbmVlZHMN
Cj4gdG8gZW5hYmxlIGNvbnRyb2xsZXIgbGV2ZWwgd2FrZXVwIG9wdGlvbiwgZWcsIFdLQ04vV0tE
TiBhdCBQT1JUU0MuDQo+IA0KPiA+IGR3Yy0+c3lzX3dha2V1cCBpcyByZWFkIG9ubHkgb25jZSBp
bg0KPiA+IGR3YzNfY29yZV9wcm9iZSgpLCBzbyBlbmFibGluZyB3YWtldXAgbGF0ZXIgZnJvbSBz
eXNmcyB3b24ndCByZWFjaCB0aGUNCj4gPiB4aGNpLXBsYXQgZGV2aWNlLCBhbmQgeGhjaV9zdXNw
ZW5kKCkgY2xlYXJzIHRoZSBwb3J0IHdha2UgYml0cy4gTW92aW5nDQo+ID4gdGhlIHdha2V1cCBz
ZXR1cCBiZWZvcmUgZHdjM19jb3JlX3Byb2JlKCkgd29uJ3Qgd29yayBlaXRoZXIsIHNpbmNlDQo+
ID4gd2FrZXVwIGlzIG9mZiBhdCB0aGF0IHBvaW50LiBUaGUgc2V0dGluZyBuZWVkcyB0byBiZSBw
YXNzZWQgdG8geGhjaSBhdA0KPiA+IHN1c3BlbmQgdGltZSAocGVyaGFwcyBpbiBkd2MzX3BtX3By
ZXBhcmUoKT8pLg0KPiA+IA0KPiANCj4gV2hlbiB0YWxraW5nIGFib3V0IHdob2xlIHN5c3RlbSB3
YWtldXAgY2hhaW4gZm9yIFVTQjoNCj4gZHdjMyAtPiB4aGNpLXBsYXQgLT4gcm9vdGh1YiAtPiBk
b3duc3RyZWFtIGRldmljZQ0KPiBpdCB1c3VhbGx5IGRlcGVuZHMgb24gdXNlciBwcm9ncmFtIChw
ZXIgdXNlciBvcHRpb24pLCBidXQgbm90IGJpbmQgdG8NCj4ga2VybmVsIGRyaXZlciwgY29uc2lk
ZXJpbmcgc29tZSBzaXR1YXRpb25zIHRoYXQgVVNCIGRldmljZSBhcmUgZGlzY29ubmVjdGVkDQo+
IGFuZCByZS1jb25uZWN0ZWQsIGl0cyB3YWtldXAgb3B0aW9uIG1heSBuZWVkIHRvIHJlLXNldCwg
YW5kIG9uZSB0eXBpY2FsDQo+IHNvbHV0aW9uIGlzIGVuYWJsZSB3YWtldXAgb3B0aW9ucyBiZWZv
cmUgc3lzdGVtIHN1c3BlbmQuDQoNCkkgc2VlLiBMb29rcyBsaWtlIGR3Yy0+c3lzX3dha2V1cCBp
cyBhbHJlYWR5IGZhbHNlIHNpbmNlDQpkZXZpY2VfaW5pdF93YWtldXAoKSBpcyBjYWxsZWQgYWZ0
ZXIgZHdjM19jb3JlX3Byb2JlKCkuIENhbiB3ZSBmaXggdGhhdA0Kc2VwYXJhdGVseSBzbyB4aGNp
IGZvbGxvd3MgcG93ZXIvd2FrZXVwIGF0IHN1c3BlbmQ/DQoNCj4gDQo+ID4gDQo+ID4gPiANCj4g
PiA+IENvbXBhcmlzb24NCj4gPiA+IC0tLS0tLS0tLS0NCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgQ3VycmVudCAoZGVmYXVsdCBvbikgICAgICAgUHJvcG9zZWQgKGRlZmF1bHQgb2ZmKQ0K
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiBJbml0aWFsIHBvd2VyL3dha2V1cCAgIGVuYWJs
ZWQgICAgICAgICAgICAgICAgICAgIGRpc2FibGVkDQo+ID4gPiBVc2VyIGFjdGlvbiAgICAgICAg
ICAgIHdyaXRlICJkaXNhYmxlZCIgaWYgVVNCICAgIHdyaXRlICJlbmFibGVkIiBpZiBVU0INCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgd2FrZXVwIGlzIE5PVCB3YW50ZWQgICAgICAgd2Fr
ZXVwIElTIHdhbnRlZA0KPiA+ID4gVW5leHBlY3RlZCB3YWtldXBzICAgICBwb3NzaWJsZSAoY29u
bmVjdCwgICAgICAgICBub25lIHVubGVzcyB0aGUgdXNlcg0KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICBkaXNjb25uZWN0LCBub2lzZSkgICAgICAgICBvcHRlZCBpbg0KPiA+ID4gU3VzcGVu
ZCBwb3dlciAgICAgICAgICBoaWdoZXIsIGV2ZW4gaWYgVVNCICAgICAgICBsb3dlciwgVVNCIGZ1
bGx5IHBvd2VyZWQNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgd2FrZXVwIGlzIG5ldmVy
IHVzZWQgICAgICAgb2ZmDQo+ID4gPiBBdHRhY2hlZCBkZXZpY2VzIG9uICAgIHN0YXkgc3VzcGVu
ZGVkLCByZXN1bWUgICAgIHJlc2V0LXJlc3VtZWQgb3INCj4gPiA+IHJlc3VtZSAgICAgICAgICAg
ICAgICAgcXVpY2tseSAgICAgICAgICAgICAgICAgICAgcmUtZW51bWVyYXRlZA0KPiA+ID4gDQo+
ID4gPiBQb3NzaWJsZSByZWdyZXNzaW9uDQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
DQo+ID4gVGhpcyByaW5ncyBteSBhbGFybSBiZWxscyBmb3IgbWUgYW55IHRpbWUgd2UgbWVudGlv
biBhIHVzZXIgYmVoYXZpb3INCj4gPiBjaGFuZ2Ugb3IgcG9zc2libGUgcmVncmVzc2lvbi4gUGVy
aGFwcyB5b3UgY2FuIGFkZCB0aGlzIHRvIHRoZSBjb21taXQNCj4gPiBtZXNzYWdlLg0KPiA+IA0K
PiANCj4gU3VyZS4NCj4gDQo+ID4gPiBUaGlzIGlzIGEgdXNlci12aXNpYmxlIGNoYW5nZSBmb3Ig
ZXhpc3RpbmcgcGxhdGZvcm1zLiBNYW55IFF1YWxjb21tDQo+ID4gPiBhcm02NCBEVHMgc2V0ICJ3
YWtldXAtc291cmNlIiBvbiB0aGUgVVNCIGNvbnRyb2xsZXIuIFdpdGggdGhpcyBwYXRjaDoNCj4g
PiA+IA0KPiA+ID4gLSBVU0Igd2FrZXVwIHN0b3BzIHdvcmtpbmcgdW50aWwgdXNlcnNwYWNlIChv
ciBhIHVkZXYgcnVsZSkgd3JpdGVzDQo+ID4gPiAgICJlbmFibGVkIiB0byB0aGUgY29udHJvbGxl
cidzIHBvd2VyL3dha2V1cC4NCj4gPiA+IA0KPiA+ID4gLSBJbiBob3N0IG1vZGUsIGJlY2F1c2Ug
ZGV2aWNlX21heV93YWtldXAoKSBpcyBub3cgZmFsc2UgYnkgZGVmYXVsdCwNCj4gPiANCj4gPiBU
aGlzIHdpbGwgYmUgdGhlIGRlZmF1bHQgaW4gaG9zdCBtb2RlIGZvciBldmVyeSBxY29tIHBsYXRm
b3JtIHdpdGgNCj4gPiAid2FrZXVwLXNvdXJjZSIuIFdoaWNoIHBsYXRmb3JtcyBoYXZlIHlvdSB0
ZXN0ZWQ/DQo+ID4gDQo+IA0KPiBZZXMsIGl0IGFmZmVjdHMgYWxsIFFjb20gcGxhdGZvcm1zLCB0
aGF0J3Mgd2h5IEkgc2VudCBSRkMgcGF0Y2ggZm9yIGl0DQo+IGxhc3Qgd2VlaywgbW9zdCBwcm9i
YWJseSBpdCBoYXZlICJyZWdyZXNzaW9uIiBzaW5jZSBpdCBtYXkgbmV2ZXINCj4gYmUgdGVzdGVk
IHVuZGVyIHRoZSBzaXR1YXRpb24gdGhlIFBIWSBpcyBwb3dlcmVkIGRvd24gYXQgc3VzcGVuZCBh
bmQNCj4gcG93ZXIgb24gYXQgcmVzdW1lLCBidXQgdGhhdCBraW5kcyBvZiAicmVncmVzc2lvbiIg
aXMgdGhlIGJ1ZyB3ZSBuZWVkDQo+IHRvIGZpeCwgcmlnaHQ/DQoNClllcywgYnV0IFVTQiB3YWtl
dXAgd291bGQgYWxzbyBzdG9wIHdvcmtpbmcgb24gZXhpc3RpbmcgcGxhdGZvcm1zIGJ5DQpkZWZh
dWx0LiBEbyB3ZSBoYXZlIGFja3MgZnJvbSB0aGUgcWNvbSBtYWludGFpbmVycyBvbiB0aGlzIHBv
bGljeT8NCg0KPiANCj4gSSBoYXZlIHRlc3RlZCBhdCBHbHltdXIgQ1JELCBleHRlcm5hbCBwb3J0
cyB3b3JrIChVU0IzL1VTQjIpLCBidXQNCj4gdGhlIHBvcnQgd2l0aCBVU0IyIEZvb3RwcmludCBJ
QyAoVVNCMikgaGFyZC13aXJlZCBkb2VzIG5vdCB3b3JrDQo+IHNvbWV0aW1lcywgbWF5YmUgdGhl
IGluaXRpYWwgc2VxdWVuY2UgYmV0d2VlbiBwb3dlci1vbiBhbmQgc3VzcGVuZC9yZXN1bWUNCj4g
YXJlIGRpZmZlcmVudCwgaXQgbmVlZHMgdG8gZGVidWcgbW9yZS4NCg0KV2hpY2ggb3RoZXIgcGxh
dGZvcm1zIGNhbiB5b3UgdGVzdD8gSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlIGlmIGl0J3MNCnRl
c3RlZCBlbm91Z2ggYWNyb3NzIHBsYXRmb3Jtcywgb3IgaWYgdGhlIGFmZmVjdGVkIHBsYXRmb3Jt
cyBoYXZlIGEgd2F5DQp0byBrZWVwIHRoZSBjdXJyZW50IGRlZmF1bHQuDQoNCkJSLA0KVGhpbmg=
