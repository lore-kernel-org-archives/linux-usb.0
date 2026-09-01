Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B322BD59C;
	Tue,  1 Sep 2026 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225506; cv=fail; b=GweP9JO3B5u1rxzRG5PKiW+b+fek6ZDcPpg8BvnenCbf1DDN3cWp8qlNASAzuohqaXYxyU6pgx58zbNE/euTtUponLap6UeDXV47vgHnKSqfYJZysbxYXV4NkkG6QFEmXkGV1KGBgyKoXAue44XeANHO596Ya67TBGfiba2z/qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225506; c=relaxed/simple;
	bh=u91fvvYy0QjyUjthNMxr3UoTgjM7e5QBgjv1dmgzj28=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JJteEF8ZeUcZBl8jmmbFm5cR377CQ072an0NJk+8/8U4OKa/CKxEZih/Unr4Sz+NPOHh5FdFKLRcMAGSiZuAdacfCG0mW/K32BuJB7d0G8NF3YZZo9RjS9H0qpkUolKdUyQa5uMczSaSm/tkuBGFoUi3BT1YQzHXJTwrGrdQrSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WdNeoaxi; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ddn0JoJn; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PqIE3fHT reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WdNeoaxi";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ddn0JoJn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PqIE3fHT"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810pUx7690222;
	Mon, 31 Aug 2026 18:17:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=u91fvvYy0QjyUjthNMxr3UoTgjM7e5QBgjv1dmgzj28=; b=
	WdNeoaxia8yuONUJKqvLV1mR6JC4T27YiFn1MhvlyCHfEm20oA5FVyhfpe55IOL7
	Uh2IplbcNQXNYCgzDQQv/TqnpaWwb3KT2zOXik8svA57udX7XRc8cJ4Pt6HuIgTb
	irCeGXYA/+ezp+ogfASeBX/d3UyY64BsbPhfzlhGdABdHSRw21yubiCbGYcnfYtB
	yNeMzL01kY/ZAMtIqSoKVOXKsFIIAC9cuO0RVPMhGj5l+A2tW0zEvg9nItZdeiwv
	YJI0TZho70Uc3Y6dCYX0Bc6JGi0JAD08PzEhh3OUGOd5oITd64w7BqRHTmuRZA7v
	rCWlw9le7V9JXvwrTNq/CQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gd1vk7t81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 18:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788225475; bh=u91fvvYy0QjyUjthNMxr3UoTgjM7e5QBgjv1dmgzj28=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ddn0JoJnUFkCutlagzUzmZVzntF+4ywyi27Ee9xUU2nUnBVwpnG76GByIqsj6/+GV
	 7RRDC2l+ZoddS3zdBJgKKGwU6gqUVNFj9QizyKPZkRf3YvfQm+QJNh6JkXMsIJXka0
	 56CoFcqpJ1RgObfmNtFdtuULY9G0KaO/Ce/1ySvW8D3yLE5J9NSD7nSdM4Rl+m32/d
	 0/4Xd2ADgEnrgkFO93o8OYfXcU4ovcXSXNKAmamlPUl2FkhvRXcFGpGSan0ApZzVz2
	 184P3Pqq7tqlPOWvWSKHtk8etL7efTvUgJYusnJwZa7NHCXwiho/7A3XD7ujrOJTPq
	 GX83LHkcwHMkA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DA5BE4017C;
	Tue,  1 Sep 2026 01:17:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 73C02A0070;
	Tue,  1 Sep 2026 01:17:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PqIE3fHT;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00104.outbound.protection.outlook.com [40.93.10.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2C1562202F3;
	Tue,  1 Sep 2026 01:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyePeE7qJBUaHsM4YCjFDhN5EiDpQtDrOpLMcHTpS/6Obl2gD7nItRhsICbcSfwAvWDljkdb3J36+H6qTKfwANwc2r85758oHXMCMriQxSNCjPK5szRY0pvoGV/ycWrFDZSmvd49YDR+jyqjKmUwRu1F+hGQnROBsmRZ3sljYDuJhmBSutYk6GcV9ikmPNdD+6MLz9lp/y1D9TK9j84w7vOa9mqmcjNJ00OCQRNDuQ2wiFlQe/NLmw/2pejCMmmm1FpcsFF0iPitbZEnr6AwuYq3RfzlzYhxEx12aTidM2yuqeyu/2FiFF0M7ndCCgtgaYdF/n74COKtkiyurvSsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u91fvvYy0QjyUjthNMxr3UoTgjM7e5QBgjv1dmgzj28=;
 b=G2d8ZziyyZVA4OtUaUF30qkw5KSt7PaJkOfKvdvGshzAecgCO2z6C5pQr7w+LJ+4VX2hFNQP+PPN3FHrLRH2EvQoNxtRYmX+7a2/u/BCbFPXTp6de1z4UNiKMDH6ZyKjEgpxyuwldfTL9e+3x/DiWL3s9NCH2rqiMO5Tae1VpsPp4xIJ6kf+x6y9OL5+UBW9/95tq7+uGUCWyo/K5GT+MHxZA4I2WUr3PfGZNVfSXQHPdfKfs7o9SvB3V99KZ6vMlYp9OkKsZvdwRmtlszr00TRuI5hUzlYU26D32nD6rOEznFfZPhwkJbRme1dj8yaRXyOAtXiKSo+VBjleSemQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u91fvvYy0QjyUjthNMxr3UoTgjM7e5QBgjv1dmgzj28=;
 b=PqIE3fHTxqefKFx5DvLCFnzQsEb4IRhXrft6b/d2HDsnYtyVaUEq5Z7BdOUmPhidBvL5xngD4KNW6pVbZaQ3DXpzASAi8EygLVQsE9ONMV2KJGvo5p3fDBOgLVK/LumRN7w4h6pEuREESDV9XfAibKhkZ9U9xbAnfpfz4yiVEIk=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 01:17:47 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 01:17:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Topic: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Thread-Index: AQHdNxp9NdtCDifOw02utC0RS08PD7azyilkgABD/YCAAEiogIAEmlcA
Date: Tue, 1 Sep 2026 01:17:46 +0000
Message-ID: <apYmMt_vK5fbjBUJ@vbox>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org> <apIGMJ6wveRRRMCv@vbox>
 <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org>
In-Reply-To: <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW4PR12MB7429:EE_
x-ms-office365-filtering-correlation-id: b1b72cef-3064-494c-c384-08df07c6d4f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|11063799006|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 gvnynFLZLQwc1hi2Y8WYDVmpHpJLMJUQlPXR03/59daZ+CzyFIr7io2jE+Q5rTx3IX6vtMWqDzJDMYI68xwY6V76LzmYgNODr1hymGmKfBLzfpVwM1h/PUwWNF5zpLMhyQYZqnEntQ4GVCChN/uOkbO5+t1jpHlGYaoSLbx7CweHdCVCbA2ORk3DuL5XAGIEGtZQ47duBMrEVudFvd2M9mIZjnuEVFJ2vxNH2D8d+YVRV2T8j6XfYeOfB155HI9TZc69+aVmuiAIGG2nBSJrGegoVaM85x3xkyu5HIJkF6lxg0XcdZ2S2Nnn+P7MV7R9LTWl96EdXLUwNXL0jylNyOEW+vkS7g6psxfqX31xfbgYKPYxWRm25HW2sqen1sR6k4R61QKPF/UCeo7sVjWd8XAPSYr7lBpqvQSMmeku6fE/74BHW1wggctuh70q0sTBdOp+lnvPth1F9oIqfCVdF4cBbGzDIaWPzJNmUGlRIc3O5pilqxGDZYDRstG/mF0Nz5LytFhp0zaREPvq3WqClYaMyGp8K8G0BuDH9+YzMn0uDXUxkVfnH5oKg/kkyFvWiNRF8g0+jdnqScdY42WeXO/0+UwgiwpxxRo17f5zVFMDEXmdWNE+tEvqdQGRiXM16trhu3iIUYbrNkjcJqODXMxeWpfeZimC/obEN16eHGUX68JwKeJNPnZqgxnK47XZks9QVSpyNsDDFEIA7aoQTq92dJbl6TDYpaOzIScjCD0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGgyRmdoWmp1clBaVVBoQWV1WkZaeFVjMGpCb3Q1alREd2NkV3I4Z2RLYmZr?=
 =?utf-8?B?V2tPYXdTNzhpcUFFWXlCb3RYRG5ueDE3NGpCdFQwMWFaaC8yWG9VNDZaUFgr?=
 =?utf-8?B?QjFlZHUreEk5akNCSld3TERtWnB6MnFKaDBnWVBCOXkxVEFPdGE5dWdLc21X?=
 =?utf-8?B?RXZnZzNscjRzNmtHK0FsV2FrcUsrTXcrU2JWc2U3VmM2bzQxeWhQbjV5Q2My?=
 =?utf-8?B?UitDd1VtUEpIYm9qblFrTTN1SEdnTWloL3VvdC9YVkw5NFNaa0lXV3c3cTZy?=
 =?utf-8?B?NlBwc1pQbFNWVDc4YVpsczc1WU8zcGFTeXBtcWNiNG40ZDlCVElLUnJBdlFJ?=
 =?utf-8?B?UFZHSlBQUDIyeWI2TkJMSVZKSkt0MWpjMjdkeWJrVXdWMFNBakp3d3ZnWlBK?=
 =?utf-8?B?UEF2eFNDcjR1OVNnTGFkS1lQc3ZoSlAvY00rWjM5Y0NaS1V3T3NncEJTNTVi?=
 =?utf-8?B?N3pJSlRXbTZLL1g5OVFONHduRWNvejUwZlltMEZLZkJlNFpVR01UWFowaFlH?=
 =?utf-8?B?Ynkrc2ZjT0piaWhDcjhTam9YMmxOQ1YzU21LNElNaEdiTzFMd3kxY1NuOW1v?=
 =?utf-8?B?VkZ1TnFRdTd6VXpRM1BFZEI4bXBiMW5xQzZJRWJUVEdDazg2bW1qaHJoWVIy?=
 =?utf-8?B?ajNFOFpkUjZVWFk1aXFHRWtNejRnZEJpRFBzWGI0MVpxeEFyRk5TM1czNkMy?=
 =?utf-8?B?SXFWTzJBelFrK3IyRHlCUGtONEVOZERmazFaSlZJR1dxaHdKV0JWMlZZWnVj?=
 =?utf-8?B?eHBtUTJpMmNPMENpa1FVaEZnRWF3TXA1VW1lb3BEek4xdEJzc3k2NkFIR0cv?=
 =?utf-8?B?SHRPb0gvYk1hOE4vRzlUOU5UcTNJTEJEQXFBM2tYbE9LS2tNK1VjTmdWRDFC?=
 =?utf-8?B?RzFrV2hYVUluNC9zUTk0SW9lRDRlM3FCWmRNbVFZZ0JqZTloTGhub3Y5Q3Ba?=
 =?utf-8?B?T2ZuTW1VbXRJdXkxWTBlUldINkJtUURTckgrbmN0eTc4TTc0Z2QrMHB1MkFG?=
 =?utf-8?B?cFVLOUs5OTA4bVVkUkREaHhVQzdSYmcvV1FpUU5HbmRtaFRpOGRSMm83Sm5u?=
 =?utf-8?B?RndleEhXVEI4QlFDYklSaUZGMzI2YjNKamoyeFpJN1NpZmtGTEgwZ3l2RmNl?=
 =?utf-8?B?VHFxK0UybGlRNzlUUmNhRnNTNmRrelR4KzNva0U3ZUZnL1BnMUN1dUlZNkdn?=
 =?utf-8?B?dXJTTXBxbkhLL0QxMWZjemhVTHg2R21CbzdrSWtsREFONWVRQzM0RFN3aHBK?=
 =?utf-8?B?UnE4WjdVZXY3TUltT0Q0QU9kSkFkSmdldHZGaHVhSkVONVFzamRFbkF4MHh1?=
 =?utf-8?B?ZlpGUXlLdmdON2JNZHVoaDUxczllbmh2b2I5bnFTelJvS3ZjZDdLeCs2OFBB?=
 =?utf-8?B?NVgwVStTUUY2N1dhRUVrZjBwTC9MSUdrbTR5dWJKd3owUXE4bkEzZW1CTXNB?=
 =?utf-8?B?NzREeFBIeTNQYk1KTTkrODFYOUxwcWxhN0gzMWtpZldxTDFiTUZCYUtncXYx?=
 =?utf-8?B?clRCWkdpQUtrdisvdDk1K2tZTEdaVkxnaTQ3WHZCdlkxQ0l2NUI0eWhiOER2?=
 =?utf-8?B?SERpUU1iMUxuWDRtcUpJcTZtQjJsTGNmRldlbXZOUFk4OEVKTTMreWxVOHor?=
 =?utf-8?B?SEV0Z1dmS2F3bENjQ2RPSjV5YTRLNGVERVBMUXJaeXdwVXRXVCttdVh6YllG?=
 =?utf-8?B?ZFU2S0pyYjVpdmxkWGdRcEpXNHRlSTkwWkxxMEVlbVBHVGNRSmcyWnFsWmI1?=
 =?utf-8?B?MXhITnN5OXpISnN4bDdJRFEzRWp6NUlxUzM5ZDJROEV6S1U3ZEhZbndHd2lG?=
 =?utf-8?B?aFBRT1pJb2dXZ1d5ajRHTVBORHNFalpCWlc5b1NSbld4Z1p2czRJQ1dhQ1Bt?=
 =?utf-8?B?bk5zTk5wYkpFTGpkSCtPV1RCcitkck5oS2lIUmYzZW56b3FLR1MxU3Q5SXg1?=
 =?utf-8?B?NWdSSXdRbUM0VzBlaldOQllDdVVlbnZTS0M3KzNUdkVlRGh6RWZuLzVkYkI2?=
 =?utf-8?B?YmVKSmxRL0tQZWdaWElIaDF1VVdEUHFIcHpQTEluVXdubmN5OUZ5MXJuck92?=
 =?utf-8?B?M1lGNTFDbm03Zlh4KzhJTHdNYUduM2V1aytabGF4Ykg5MVBRblhyY0MyS09N?=
 =?utf-8?B?WkdlUmJDTlE4bVBucmVsdG5uMFZqc2VnTWZUc2dzSHRSWlVaQ3RoRHJRWUwx?=
 =?utf-8?B?MG94RUdtaS9YVy9nUzl1SWZUcktDZTkrK0hLbmhROFp5b2dVM1I0Z0MrRFBW?=
 =?utf-8?B?QmZSdkROQmtxRzZGN3FXeEFaemJmdHpmSHVFbWRjSkREVm9kZDNpa0VDbzRX?=
 =?utf-8?B?TVNhY1JKTnoxRWt3aUM0WDJraHNHbWVXSWV1OUdHdEgraEtrRjVtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DF85CC7F1F22442ABD96BDBCADDA798@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CrHLCdlORfEvld9+jTR+ARSiDrC//WeJVQQBpvvfpYri0vPkGp0p0eOyQmDReOQNNkIAClqBxnOoKPzvc3HKWFWYWQeJn5rLRxtLYMfaJlEk3Cqdm9rtriY0FBAyRB4zDrXaNPL0RqLmXt1/YrcHNseOU8LG0gKB42vu7dxpQz8aYELojIQLte5+bEagrS8CCaQXcUOwUw0IP5HCGy5V2lLLwnlA9zqZGpmxpYbmrXz6lcwKGZRCU4nh7gOzS9x22FrcdV5bbZgEfAJcxMef7XcpfkPus4GNdrdVt+RuAHMT8HqZqeKEaCNffwCZfarYa9yt9mUePKg++gmAs1CZ3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o1j8lw5UnY0eb/tATxBopNfcgjySHT1N+1/zekZGcuDoJQB3BTkyVSdRvj9nxdfwoBaAo9lEHWk4ASlOvEkoCB7s07NCtHv4ZEnbY261c2+tEAclkdfJleI/h3wzdU40F+F4DCJWlcgQxDx8j2mO1scqisryCZnQ0KT+yaGzyKjlMLWjZApQlm3itR9OUS1CUG6+M6uvh+6wF9rIwku+CxK7PrvyVBxEGYFSYCammUIdi/7gAq5IiBeSu5H+Vn6js6jhubxrntpPZTmQGR3R3gPAo5XJANtwzIcCyGl1Cfnrp2JG0jn3UAEfojXqNaOIwezcSqBmwokqEd7fQe8UDauOqc7A3gT7oAD1qA71wD0qh7TK4r6VcimkxN/iMTOnKeV+dPftytKUtVSI4nZchaSgCa3rxXpMOPt/izEiiuB8mnTsMh7aMPgMwiD+jPRArjjRH9qOhG/El7+nXkFrRmiIg3JrZJ7gcqk07mRdeAoLBYwhDafTPP3wJ9r5nGMAUix3aSVxHrOb03fxXPVYZMbwcHCeUxXD3iZA0hRUSqNndU/vhWR0bHNRh4kkxVR8aZufIKOBlY4d7FGd08EjKbIBQXPjuyIWxki9DivrwhOwzzH22LcD01woR8vIjfGSXcv6spAo3esJDyRO7DxmqA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b72cef-3064-494c-c384-08df07c6d4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 01:17:46.6830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOWchcltSZADKmCB8U+jr1Rk0UsohOt8JCHE2CC73P2fp81Ko1MtqjspKCc6mdOFxq7kC182fL11k4UdZXS09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAwOCBTYWx0ZWRfX10TVS/teXM/y
 E9y/kYWuHwtuR9XC+mMF/b0r3KdVYYZVwTBqCJ/j7sMIzMWlLs4kT66jtikgnjXaerHdD9dAaWD
 ZZNWrpS/amfbnqbaTyug0XEGy0K8rAJVTVStg46qpj+BLGgOCg0PfZdwXqoQ7hWwKpz1ingsp2O
 Jcx6vPA4O5v52S5xwXrmzQEhoyWJ1HHLIXQ9pXCRkXqBKIbTheR4PoigayTwGpjx2mcsvS1AphE
 9+Z6j3pTS0ToZXt4mcFk4kX6g8x9peZasFBt/3rWW8ILdNTvMpsZfGNgDa9QnUBU86xnQDxl9S3
 ZmIV1F6ZCvoelWY7vVtJp14N3JZjo6l3Jm8Jwdbe28MOjFlJqc8z9AGRQU3Sj5oxmuCt1OEdmpd
 tmzjrzlaFfeOPS5brr4uQUeTSiu4v9wWLyBTU+BqbcNRlWq8C3hMlx0/l8ZkJyoHyAPmGMb3px0
 aLv5wUi5F1NoKtgHI7g==
X-Proofpoint-GUID: 3zNwPhRjFtDScxll7qhPJV2JTU3arzcM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAwOCBTYWx0ZWRfX2jMVhNGqPhGj
 oci5M1mT04wx+e3Z/Dc1iItvYu4lBdDRs6EeZh0DwBWyxThf9K2INe9u39T6dwAly6n6gEdrA51
 opdosv44/hqZPERJ9A7J9i5DxX8kI6g=
X-Authority-Analysis: v=2.4 cv=SNtykuvH c=1 sm=1 tr=0 ts=6a9627c4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=Y3BANllcnEScbbSA6cMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3zNwPhRjFtDScxll7qhPJV2JTU3arzcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010008

T24gU2F0LCBBdWcgMjksIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiA4LzI5LzI2IDEy
OjQwIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+IA0KPiBIZWxsbyBUaGluaCwNCj4gDQo+ID4g
T24gRnJpLCBBdWcgMjgsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiA+ID4gT24gOC8yOC8y
NiA4OjMwIFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiA+ID4gPiBUaGFuayB5
b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVu
dGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gPiA+ID4gLSBbSGlnaF0gTWlzc2luZyAnbWF4
aW11bS1zcGVlZCcgRFQgcHJvcGVydHkgaW5jb3JyZWN0bHkgZm9yY2VzIHRoZSBjb250cm9sbGVy
IGludG8gVVNCIDIuMC1vbmx5IG1vZGUsIG92ZXJyaWRpbmcgUEhZLWJhc2VkIGRldGVjdGlvbi4N
Cj4gPiA+ID4gLS0NCj4gPiA+ID4gDQo+ID4gPiA+IGNvbW1pdCAwNzI3YmIyY2M5YzE1NWU0ZDU0
OTdkYjk0YzMzN2JjNWIyNjAzNDY0DQo+ID4gPiA+IEF1dGhvcjogVGhhbmggUXVhbiA8dGhhbmgu
cXVhbi54bkByZW5lc2FzLmNvbT4NCj4gPiA+ID4gdXNiOiBkd2MzOiBkd2MzLWdlbmVyaWMtcGxh
dDogQWRkIFJlbmVzYXMgUi1DYXIgR2VuNSBEV0MzIHhIQ0kgVVNCIGNvbnRyb2xsZXIgZ2x1ZQ0K
PiA+ID4gPiANCj4gPiA+ID4gVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgZ2VuZXJpYyBEV0MzIHBs
YXRmb3JtIGRyaXZlciB3aXRoIGdsdWUgbG9naWMgZm9yDQo+ID4gPiA+IFJlbmVzYXMgUi1DYXIg
R2VuNSBVU0IgY29udHJvbGxlcnMuIEl0IGhhbmRsZXMgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24g
YW5kDQo+ID4gPiA+IGV2YWx1YXRlcyBQSFkgcHJlc2VuY2UgYWxvbmdzaWRlIGRldmljZSB0cmVl
IHByb3BlcnRpZXMgdG8gZGV0ZXJtaW5lIG1heGltdW0NCj4gPiA+ID4gc3VwcG9ydGVkIFVTQiBz
cGVlZHMuDQo+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0
LmMNCj4gPiA+ID4gPiBpbmRleCBjYTY5YWMwZWIwN2NlLi4zOTk0YTZkOTNiOWRlIDEwMDY0NA0K
PiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiA+ID4g
PiBbIC4uLiBdDQo+ID4gPiA+ID4gQEAgLTcxLDYgKzcxLDU1IEBAIHN0YXRpYyBpbnQgZHdjM19l
aWM3NzAwX2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ID4gPiA+ID4gICAgCXJl
dHVybiAwOw0KPiA+ID4gPiA+ICAgIH0NCj4gPiA+ID4gPiArc3RhdGljIGludCBkd2MzX3JlbmVz
YXNfcmNhcl9nZW41X2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ID4gPiA+ID4g
K3sNCj4gPiA+ID4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGR3YzNnLT5kZXY7DQo+ID4gPiA+
ID4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRl
dik7DQo+ID4gPiA+ID4gKwllbnVtIHVzYl9kZXZpY2Vfc3BlZWQgc3BlZWQgPSB1c2JfZ2V0X21h
eGltdW1fc3BlZWQoZGV2KTsNCj4gPiA+ID4gPiArCWJvb2wgdXNiMm9ubHkgPSBmYWxzZTsNCj4g
PiA+ID4gPiArCXZvaWQgX19pb21lbSAqZ2x1ZTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkv
KiBXaXJlbGVzcyBVU0IgaXMgbm90IHN1cHBvcnRlZCAqLw0KPiA+ID4gPiA+ICsJaWYgKHNwZWVk
ID09IFVTQl9TUEVFRF9XSVJFTEVTUykNCj4gPiA+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIC1FSU5WQUwsICJXaXJlbGVzcyBVU0Igbm90IHN1cHBvcnRlZFxuIik7DQo+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ICsJLyogTm8gVVNCIDMgUEhZIGluIERUIG1lYW5zIHRoaXMgaXMgc3Vy
ZWx5IFVTQiAyIGNvbnRyb2xsZXIgKi8NCj4gPiA+ID4gPiArCWlmIChkZXZpY2VfcHJvcGVydHlf
bWF0Y2hfc3RyaW5nKGRldiwgInBoeS1uYW1lcyIsICJ1c2IzLXBoeSIpIDwgMCkNCj4gPiA+ID4g
PiArCQl1c2Iyb25seSA9IHRydWU7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJaWYgKHNwZWVk
IDw9IFVTQl9TUEVFRF9ISUdIKQ0KPiA+ID4gPiA+ICsJCXVzYjJvbmx5ID0gdHJ1ZTsNCj4gPiA+
ID4gDQo+ID4gPiA+IFtTZXZlcml0eTogSGlnaF0NCj4gPiA+ID4gV2lsbCB0aGlzIGNvbmRpdGlv
biBpbmFkdmVydGVudGx5IGZvcmNlIHRoZSBjb250cm9sbGVyIGludG8gVVNCIDIuMCBtb2RlIHdo
ZW4NCj4gPiA+ID4gdGhlIG1heGltdW0tc3BlZWQgcHJvcGVydHkgaXMgbWlzc2luZyBmcm9tIHRo
ZSBkZXZpY2UgdHJlZT8NCj4gPiA+ID4gDQo+ID4gPiA+IFdoZW4gdGhlIG1heGltdW0tc3BlZWQg
cHJvcGVydHkgaXMgYWJzZW50LCB1c2JfZ2V0X21heGltdW1fc3BlZWQoKSByZXR1cm5zDQo+ID4g
PiA+IFVTQl9TUEVFRF9VTktOT1dOLCB3aGljaCBldmFsdWF0ZXMgdG8gMC4gU2luY2UgMCBpcyBs
ZXNzIHRoYW4gVVNCX1NQRUVEX0hJR0gsDQo+ID4gPiA+IHRoaXMgY29uZGl0aW9uIGV2YWx1YXRl
cyB0byB0cnVlIGFuZCB1bmNvbmRpdGlvbmFsbHkgc2V0cyB1c2Iyb25seSB0byB0cnVlLg0KPiA+
IA0KPiA+IFJpZ2h0LiBJIG1pc3NlZCB0aGF0Lg0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gVGhp
cyBhcHBlYXJzIHRvIG92ZXJyaWRlIHRoZSBwcmVjZWRpbmcgbG9naWMgdGhhdCBjb3JyZWN0bHkg
Y2hlY2tlZCB0aGUNCj4gPiA+ID4gcGh5LW5hbWVzIHByb3BlcnR5IHRvIGRldGVjdCBVU0IgMyBj
YXBhYmlsaXRpZXMuIENvdWxkIHRoaXMgY2F1c2UgaGFyZHdhcmUNCj4gPiA+ID4gd2l0aCBhIFVT
QiAzIFBIWSB0byBiZSBpbXByb3Blcmx5IGRvd25ncmFkZWQgdG8gVVNCIDIuMCBtb2RlPw0KPiA+
ID4gDQo+ID4gPiBUaGluaCwgbWF5YmUgSSBzaG91bGQgcmVzdG9yZSB0aGUgVjQgY29uZGl0aW9u
YWwgaGVyZSA/DQo+ID4gDQo+ID4gU3VyZQ0KPiANCj4gSSBkaWQgdGhhdCBpbiBWNi4NCj4gDQo+
ID4gLCBidXQgcGxlYXNlIGRyb3AgdGhlIHNwZWVkID09IFVTQl9TUEVFRF9XSVJFTEVTUyBjaGVj
ay4gVGhpcyBzYW5pdHkNCj4gPiBjaGVjayBpcyBub3QgbmVjZXNzYXJ5IGFuZCB3b3VsZCBiZSBm
bGFnZ2VkIGJ5IGR3YzMgY29yZSBpZiBzZXQgYW55d2F5Lg0KPiBDb3VsZCB5b3UgcGxlYXNlIHBv
aW50IG1lIHRvIHRoZSBjb2RlIHdoaWNoIGZpbHRlcnMgdGhlIFdJUkVMRVNTIFVTQiBvdXQgPyBJ
DQo+IGNhbid0IHNlZW0gdG8gZmluZCBpdCBpbiBlaXRoZXIgRFdDMyBjb3JlIG9yIFVTQiBjb3Jl
LCBidXQgbWF5YmUgSSBhbSBub3QNCj4gbG9va2luZyBmb3IgdGhlIHJpZ2h0IHRoaW5nLg0KPiAN
Cj4gVGhhbmsgeW91IGZvciB5b3VyIGhlbHAgIQ0KDQpZb3UgY2FuIGZpbmQgdGhpcyBpbiBfX2R3
YzNfZ2FkZ2V0X3NldF9zcGVlZCgpLiBUaGUgc3dpdGNoIHN0YXRlbWVudA0KZXhwbGljaXRseSBo
YW5kbGVzIHVuc3VwcG9ydGVkIHNwZWVkcywgYW5kIHNldHRpbmcgdGhlIHNwZWVkIHRvDQpVU0Jf
U1BFRURfTE9XIG9yIFVTQl9TUEVFRF9XSVJFTEVTUyB3aWxsIHRyaWdnZXIgYSBjb21wbGFpbnQg
dGhlcmUuDQoNCkJSLA0KVGhpbmg=
