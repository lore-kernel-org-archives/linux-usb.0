Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A7344D88;
	Tue,  4 Aug 2026 21:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880013; cv=fail; b=U/DT1hpa8i+1EzoyuHgrOeBUAfHQo60ivNv5oqwJ/QfY9nEnkuP604frmiHEbiydJX7fCrt/H4clpTmKNvAk8cwSjCO3GamZUibx9IngbhM1CkckzT764YXtvWNNs0YhwmfAtqQU9ZfkZMmTM/q/xVbUeb3tMi/QApgY5w+LZ4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880013; c=relaxed/simple;
	bh=0HFAO6cLudTGIb9Zlfgci9PxsXmwIQa9BYgEpeXNMc0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B42K4ITUsBd0KqcIxASA0fsv2Hsru28IhlVNAmeH7Gusrbt7Ez7tBpI7yFfR6frZeuUkh1RyO7lCPqzCy4QuKt3afJCXIb9Zs89TulVNkdpXsN+ZhhHD20cVKyEyoxlfW6w+76dLVUg0sOod8zigH4z/2WM8EI60FVHUqN0N/xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y3Ney4Lo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CXZn2sSp; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FAi2Aenn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y3Ney4Lo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CXZn2sSp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FAi2Aenn"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Jpbss1535218;
	Tue, 4 Aug 2026 14:46:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0HFAO6cLudTGIb9Zlfgci9PxsXmwIQa9BYgEpeXNMc0=; b=
	Y3Ney4LoUDTRpw4ckxRQk9ab2LkD5wHbOjczpGOHxzYOv8gx2mdDklMQh3Qo8RwW
	JgkIdRoe56VQaEk+CxELS9R8p9RQIY3K6A31K3yhwYAak+zcANJWcykJmwsWLGCR
	wlSNT6srXq8IqPhJC7nQ3OuvatPnAPhoIRKwzQhNfwLXBSwtWRz8iOIfABrqhdaF
	XLQWSq1uXCkTpJuyNorgn0OQgKFWdU6G0jlrQQuupd0IjO7SevYRDFOitLkc4Q2w
	NcwzCTVLxTfVzshu/Zw0jQHpsraOCxcPzy9Q5kodKdHOuQwXiv2jRKwTYHtDwrXb
	pCX8Ef+RmfkninnG4ePxQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fuey35j4f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785880001; bh=0HFAO6cLudTGIb9Zlfgci9PxsXmwIQa9BYgEpeXNMc0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=CXZn2sSpOXo79n3zwtInMdnGxajImBMk0OC3sl3x0ekemPgIDHjqy0gP5vLDCPEow
	 Mvq5Th1mP3XZntFIUH6/G7bEKGzZOFzLWoffhlYKXJkkVZWMb71+m1N6gNrXKTz/TV
	 RdkVrB9pjs/b/db5VDX9eIJPYsz8nxxoi7CLfPrqfA2DStFtBio+JcOFjGqJ3GP9Bz
	 xiSIkPjtu1jcYehEedO9/SPvwc2S4kUlFuZ/0YIZtwC8dhXYV30/ZtohedpbZwdYPS
	 R57i7Qs9wQwoXtymy5mqYG0ADg3seeZdTqe3xXZ9AGAF9sG7W4hw1Ke+FFRVJUETGr
	 dBLQbyj3gVRig==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D9A88401EF;
	Tue,  4 Aug 2026 21:46:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5D6F9A0F03;
	Tue,  4 Aug 2026 21:46:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=FAi2Aenn;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00100.outbound.protection.outlook.com [40.93.6.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 115E8401DB;
	Tue,  4 Aug 2026 21:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOygbc61F/VVEs/innxYm3IGDsKSKTEnZgs4Hl+FZjbw5Mcp5UtQsNRobD/cMVN2hwqwUrSJKF6jsn1McoR+iDjN4OXVydeNbkoynuBq8r9fGhzrvZZaaHXrBHLX5JG3nJNEqNTKNnm/AhPuNL5AghSKyap1uHXJ7g++YLDD/UOsktb++JKWSbH84q1RKloXDZsdZXjc/bWDKz1kBZ6IE4A4sAi7a9t9Hr4uoP7ctZBBuOgjdlKySGQBuViDD43GHt6sWvYmoh32YK55HPJy7F0lsWTiyxtPpAneBsacDp5cU45X7Tlf0VZ4o0eywpJyETlYffCwzhVXAvEB9OoQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HFAO6cLudTGIb9Zlfgci9PxsXmwIQa9BYgEpeXNMc0=;
 b=HJ6qcSGdx+Vs/0qiz/fuY1mOj/E32UwIQSNuytR4KjQnH3rfwwtELgCDJOrQBDEarJSuiMDio5iLlmDmj1nSR9QnYvU79k+V8E9N/OU+e9CaBiIDcrjPW0KQZ4/CjgKxxT85elnGLGp8a+0Q5I+3XHxQ4egmsx/yGhHHhMJMiw5QWv3yxRkerPeSsPDV/iXV7ixML1CBQGgRXgjiwL5KT+eWyOvLYcs7B7TLEvup+2rRCAufqmfjDBQwzrFPzMInErKkBpc0cVJMo2+0nxA2OB8NZD0usRflOahTAHMyipQktUBUPwRGjWVTigvSCTzDUAkSUj1N3tLPiuxe9MmMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HFAO6cLudTGIb9Zlfgci9PxsXmwIQa9BYgEpeXNMc0=;
 b=FAi2AennI7uCP4+CptEwkiiUxWZam/MUtuTTtZgZV4GQ88upaS1RepEPqxS4saM6AbObGS4AHuf4+2ezKssQ6uslNAztOB9mmFQtuijtAKiDq+YyY4AxHvduhlpGz5/6TBdMglZGq0tuNKc6kuwdToYl+zt4IrFDscEKQULRjFI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 21:46:35 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 21:46:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Thread-Topic: [PATCH v5 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Thread-Index: AQHdGo+SuZRk4kmybkenp9Qe1kxzObaOgFGA
Date: Tue, 4 Aug 2026 21:46:35 +0000
Message-ID: <anJcyaErzrXz1tAZ@vbox>
References:
 <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-4-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To:
 <20260723-eusb2-int-handling-v5-v5-4-f32ea6c1a318@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM6PR12MB4465:EE_
x-ms-office365-filtering-correlation-id: c2f8287c-d7a8-4951-6fd8-08def271db44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 LArnir4HspWfQuWTCBg4ZAxBEaAPLDJ9QcA9YRV4w0BdrarSxGkAD++kVCd15WYj0qPI3U57pAQi5w59HsFvahlKfbXRGnqyE0q29q0+nf5WSKGlxVbt9j4SAUwXDxO6GD3UuwO8B1/7u8rzBOqmui1FiBUWgusrmdPJLAg5lXbueDGduVIVsZ3/Ur8oPzTovUjlGIwTXuQDelDwhcmzIj2+/JG3UwbztkKPJdvvA5CG2kxdsusSSoTCiyT1fX4DSSVEC2EfF8CbThpmM8ge1/e8cHXQdbE5qLZj0OwvXXgdEkCy9YjA0D7ui0H5DNWM6LvjU/Tpc9vKjAzaDy/p1zqP3DpdbCKnduzpagB1HzOdQYWw590o1AWNKCYXBS8b042LtiCaSyf+3/O4opXj51McVZfi9ebwedGgWajj470B1zqhVCDknj7MaADYgia8WxvWLCcA3McvY5Z/PZjhTlrWkmqjEZIcXq8pGFVJErX0i0Dzdirz0q1IWGVGijzwNJsW79RK8f9/+QtEFDHoxC1YJXVACtI5ycNGCton1A4znykCe5bQwtMC+adcVe/eTe0x13nhT0WqgFT0kPEdGmfXtuysUfmnPFrzdHvcUGKSVYPoUpIClUq/tt8wpbnKr+GFSeF2u1C3s/+71ORjL5yP6/SdM+A9jYsPNuWN6sC2RCGfYHqlldNdCVJVPSmldsJ+cEY8JXl/PNJczQCKGCOti1aypNg5Xk6adSLPsoM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmtyLzBUOU0xTERaMjBwRWNQM0VZV29UU1ozNE4zbkVjSTdGT09vRkpkMEx4?=
 =?utf-8?B?K3RuYzFpWDRPek9pdVMrMHZUVnVJR0xrczF3Tk1WdUFiUzJvY2s3SS9wVVd1?=
 =?utf-8?B?OE1OQXNnaHdKQXBTTjc2MHEwenpaNHZ6Z2RLaUJUcERXNDc2bmlwUEhBSGho?=
 =?utf-8?B?UDJRTTZpeDlWTTBpTWtwTHpZTXdZRlR6Z0c3WStEMHc1SlhtVWFuS29wSnhT?=
 =?utf-8?B?SURzcTg5cE9TUVo5S1lqVlAreHBtREtSZFc4dm5DbEpKYXRjTUhmTUlQUndv?=
 =?utf-8?B?bGY2aWE2bTE4NnV1cGxkZHU4cmErUnM4R3JiN0c4YmpFL1A1QWRCdGUyRlhy?=
 =?utf-8?B?dkM0RGRhTy9QV25aank2NXRZYU9YNU02TitiQ0huTi9UMmVDb1g3UkNhM25S?=
 =?utf-8?B?cGhtZU41cjl2ajE3RFVqczFiTnN1SlRxSlEyUDJOVGlsbytMd2c0a0xTQ1Jl?=
 =?utf-8?B?RDJlb3JJWUMwR0lSWVExQ29yQ1Z6aWZZa3VET2QvTURJemg2WWE2VE10V0ow?=
 =?utf-8?B?WXZvUEZvMXFjOFVLNEw3OE1mQ21qMFBjNC9lOHVXUjNGa0hyYlAzUnpYc1pM?=
 =?utf-8?B?RUNHZFo2ekY3M0dadkcwSVRnc1dSS3BiSnRiclJhc1NpbG1ydjVSSkd2cDJB?=
 =?utf-8?B?UktGci9DMzBlVW8vR3NSZXQwajhhTDc5eWVxeVVMdWJObVpjUkpHMUI2NzdU?=
 =?utf-8?B?NjZiU2hrWENVbWRqd2VHaUJZby9DL2tPdVRVNHZ1MDBTNmxXRmhHNDZyV0tF?=
 =?utf-8?B?akZFbmk5MjBtTlVVcEMzWWhQOHRwVjRsa0pDanZUS3plVGhKMGxNUTJxTjU1?=
 =?utf-8?B?MzZDdnhUQkYxWlpqMDlhVkl0c2lqb0c5c0JBR1V6a2NxOXNhendHSG9JMGJj?=
 =?utf-8?B?aXJLTUF3RGRhQStxMERoY0trcDU1MlpLaitQbEg4dENVaHlpZXZXaVVMRGht?=
 =?utf-8?B?WmdWV3hOeEVscXNzOFRqWXJHYVU1OTZ5SHVYUmhTdSt6dWFiTndnc2V0emdy?=
 =?utf-8?B?OTUxMmtBcmM4VExhNkp4LzFnbHV3NHpzMDBNYm1tTTJhZlJyY3NsUHFHSVll?=
 =?utf-8?B?MTY5WkRPL0hrcVFvcm84QXlwRFlDSFRVMGxsbEUyZ1k3eU5DZm5PRlIxbThv?=
 =?utf-8?B?MWRkSy9EaFFhdVBFZWhxVFZTeWtWOU9JOUlZUWZ3aE9TUEFIWVU0M0Y3d2lS?=
 =?utf-8?B?SlJsVWw1TEcvVDJnY1lCSGt4MXJGODZYWUJ6eDdXTFRsdkdsMEU4NzFjYTlI?=
 =?utf-8?B?L0Z4QzRWV1hPT3pXWHFDa01rKzV6TlNtaUdxTzFrYml0bGFqbnBlSnlhbmR4?=
 =?utf-8?B?MXNEaHBtNmV4YlV2QXlDODZHMjhYcUp6QytMdENpU1ZiWk14RGd5Z0oyRzZN?=
 =?utf-8?B?K1dOOVhoSUFvY2w1SHNWVkpnOTIzMHpOMGR3YVFOSjRBRForNCsrUzNHeEE1?=
 =?utf-8?B?WmRZZnhXR29lN2lVUWxIM0Zrbld2UThudXZVZjY5QWZGaVpNL2U5YW9GU2oy?=
 =?utf-8?B?dHNhaDMzb0dHTkFES2k4Tm9pV2FoTnpkU2hoN1JVMndDMThpcjZwbWoyS3JX?=
 =?utf-8?B?a29pclA2WjBpbG9vTEljcGIwTE83NnN3dHlpUEpuM05xT1dNZGlKWGdlTEdL?=
 =?utf-8?B?TVlwK2dDWGVzanlBVXVzWXJ4Q05zVUp3MnJ6cEVlQUp2RU9YdUwxeTI2NVp3?=
 =?utf-8?B?ZkdSczFnM1pCNC8yMzJqcG81Qy9GZDZkVnlkdTNJWmY1THFCUyt3OUZGTW42?=
 =?utf-8?B?djlnMzQrWnpHM1cxb0FaVjNxWDBEMERhdDN4OGx5R1EwWlphNlU5MWE0b21G?=
 =?utf-8?B?bEtPeVJybGRlL25CVlZZcmVFcU45SWFMbXFJVFczSDBaMkwvNHgvWGtjSklX?=
 =?utf-8?B?MFZ6VEJDbExObUx3RFNENlZOM3Z6d3BsaXV6SllqaHNDVTFuOHdzaWRuRllG?=
 =?utf-8?B?V2ZjZzE1V0c3YTczSmVLeGNOMHo2MEE0MitrUmZqQjM0WW5JbStMWTMwMVdU?=
 =?utf-8?B?YzBlOUlYam5XVEJXQVFyeFAvQlBzTVJTUGdtbDJXRFpWTjhmeE91Z2FzVEY4?=
 =?utf-8?B?UnFlMy9hcXhRKzNpMW9pcktvWEZKSzE2VERQVlUwbDVVOVVoNGI3L0JNd2Mz?=
 =?utf-8?B?Qml4UXZmRHIyREEyWXNQaXdxL2NOcis1enJ3dU1WQWw0WEVDQkJyTGZtUVR4?=
 =?utf-8?B?MG9MV2tReFRSa1VSVnFLbFFDZXZwU1JXejNtZ2dhbnZ5cjAwcVdsSGdQZG5Z?=
 =?utf-8?B?NjNmTzhzUmZDZW95WXhYMndzRGRGUk8vakRzNXlKMXlqRjFxTlFuVGJuQ3hy?=
 =?utf-8?B?SXlQWUd0YnFqc25UOTYyMnhtMXpFbCtIRVkyVmVCd3UyaVdlY1BNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59156AB9B6B83A4FA017CB3B2D5396A9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gSHgjjc+XX16AlLuNkDUcaYBUqVgpOFWgfMt1MpaBE2Fyrgq8i+pMgEKVUvyylqaXQh83U2kyl+ksXmzz6oi/nbAV2D1KYhTqDsu60GDnx9ZzCGAQB0kFZRxNoQW3kW99d6NcRe0gr+cdYAjTMBJNznoEOQsk5518GyEuC0bCmxuXnHxg6AYAK2gSMU6b7US4Z+wlNMuK8RVKA0awHRJ1luQvcfXN4zhdPNTEY0/wH0QAQRgi4N2hhduLbgIk34jPpAjDvTLEYbkwK3xLT2Psa7og2urM2gIDQcMNSxoeAFct6fNqPhAN5Y0mYMF7XobfmAVU4oILbgY0Pbx1lUgWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vEgPtf8DXTlXGwxAkJQueWMBd4R4w/3wW2AI/yVEHfpBojcVYwjSW41ghUB931HTWNvawb7wuFttww1BmuDblmFOPIA+d654qLVdUpc905a3wXJg4eTHZiyJXpmU7JHNce7du8iRAsFrqGsLjHRX9Mr3/bGZqhCXVsv/IlKCk2ACGzybl2CVoBYRGuQ7c7ZNqslYiUg+06FNOiY3YXnnHaT3PEfhiPmECQ2hpH1dpir8HLHe+2dxdEKugx2fUswcbtHtQ5ns8XfmQp70JUHpJcuigH6jvZ29+k1Y+pNr76HapgY+8CU2pUzp99GYQ0E8xsvM4AS7U49U/yL/ZRB+WhBdXuoGxVY9bbmyLqzCwDIOYdFzKhicK41sIplFkENUQJu494GDSTHj7FLx8mWku06BMv1b+Tarm0Dr1FjXJhsfEhYXayjDDVX4QLOlgdgo9hyLCHPEt7ozboS69zzEaa2kp2gqcWb0Q/Y3eLSewtVBHQVtYDbCXU+WMVtSDJRx/B+PX1TzLiNNzHpNxSMT178wzXYNoFfOlvfcE9tyvkcaAJlmlpvLIFJc3ua7cTfMWniRJJtlI2LFRmghDpiAyEIY92yjwGekFfzipnZx+unsJAjxtEkn31WrH1ByfITEshCtPKCwlreUc1/jJ90FRg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f8287c-d7a8-4951-6fd8-08def271db44
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 21:46:35.6757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQoBRn6TF5oPWUcIm01/ELUBvA0GdaKsG9wCi5JRqDNEXrF5ZhxygAWSTbIFP9I8Y+O9WEWlW++jchk3+A8XdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
X-Proofpoint-GUID: NrQg1jhdiG2tY7C3gyFBf7WYG5O6jjCF
X-Proofpoint-ORIG-GUID: NrQg1jhdiG2tY7C3gyFBf7WYG5O6jjCF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3NiBTYWx0ZWRfX6HK7a3FUHfNz
 fzkOeYz57jTjqpOeafSwyqrfP5NpKW56Qy9dw7KbI488NUuLgQNuFj/Lu2Lz9PgyoiB8LbeIoxK
 wSHEXHSKjBkY2tKIkMgt6waxtxxms30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3NiBTYWx0ZWRfX0HVllpsKVjSU
 gbJbaq4UhBlk9a/dzXXIkJbal7Z8bPGqpVnYh9zKeA2E+694/3Auwdj+Y4uRxv99465nA3pS/AI
 mZLk9ylW1YuIvS1hUK/ghfiAT6KCokDDYeVCiZYepNrj/wavoAuUXxUbsJpy+MkPQx6rEUWI3xF
 PGwcv+uPqsK0a5wx3Lo0637qNJAd94PNsPmheqo2C37rTBxBWKpZ62iZIEdNr/0gWHUFNV3xCV9
 SMtIBG3R2y9zgBMU3qSg7ci1IBu2U0fMV8dGd8wGyS5nI0xZbwwB7D3IkLBczyXx/gunfDIzwER
 gGvuM2d1wWhNIcMlW80IxlUnpxUhvnKpNnK3lZ/nYqMXq1vLCufAa1ePqVaVEptDX89CkiojL62
 /+xN3UvQ/vibyQD1k/k5+FZmXs5dDzaQkIGKohvYqjhwk2pgPghsexltmRE1Yqo/EA+JZxHVmJH
 f1/gjIjITA8LeMDZO8Q==
X-Authority-Analysis: v=2.4 cv=DvxmPm/+ c=1 sm=1 tr=0 ts=6a725dc2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=e22kJxjajdrG75zfTf0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040176

T24gVGh1LCBKdWwgMjMsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IFVTQiBjb250
cm9sbGVycyBsaWtlIERXQzMgYXJlIGFnbm9zdGljIG9mIHRoZSBraW5kIG9mIHBoeSAoVVNCMi9l
VVNCMikNCj4gY29ubmVjdGVkIHRvIGl0LiBTZXQgdGhlIHBoeSB0eXBlIHRvIEVVU0IyIHRvIGxl
dCB0aGUgY29udHJvbGxlciBrbm93DQo+IHRoZSBwaHkgdHlwZSB3aGVuIHF1ZXJpZWQgZHVyaW5n
IGl0cyBwcm9iZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNo
bmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BoeS9xdWFs
Y29tbS9waHktcWNvbS1tMzEtZXVzYjIuYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3F1YWxjb21tL3Bo
eS1xY29tLW0zMS1ldXNiMi5jIGIvZHJpdmVycy9waHkvcXVhbGNvbW0vcGh5LXFjb20tbTMxLWV1
c2IyLmMNCj4gaW5kZXggMGJlYzg2NTcxNDljLi4xNThjM2E1NWJhNTYgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvcGh5L3F1YWxjb21tL3BoeS1xY29tLW0zMS1ldXNiMi5jDQo+ICsrKyBiL2RyaXZl
cnMvcGh5L3F1YWxjb21tL3BoeS1xY29tLW0zMS1ldXNiMi5jDQo+IEBAIC0xNiw2ICsxNiw4IEBA
DQo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+ICANCj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+DQo+ICsNCg0KU2FtZSBo
ZXJlLiBUaGlzIGlzIGFscmVhZHkgaW5jbHVkZWQgaW4gPGxpbnV4L3BoeS9waHkuaD4NCg0KQlIs
DQpUaGluaA0KDQo+ICAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+DQo+ICAN
Cj4gICNkZWZpbmUgVVNCX1BIWV9VVE1JX0NUUkwwCQkoMHgzYykNCj4gQEAgLTI3Nyw2ICsyNzks
OCBAQCBzdGF0aWMgaW50IG0zMWV1c2IyX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocGh5LT5waHkp
LA0KPiAgCQkJCSAgICAgImZhaWxlZCB0byBjcmVhdGUgcGh5XG4iKTsNCj4gIA0KPiArCXBoeV9z
ZXRfdHlwZShwaHktPnBoeSwgUEhZX1RZUEVfRVVTQjIpOw0KPiArDQo+ICAJcmV0ID0gZGV2bV9y
ZWd1bGF0b3JfYnVsa19nZXRfY29uc3QoZGV2LCBNMzFfRVVTQl9OVU1fVlJFR1MsDQo+ICAJCQkJ
CSAgICBtMzFfZXVzYl9waHlfdnJlZ3MsICZwaHktPnZyZWdzKTsNCj4gIAlpZiAocmV0KQ0KPiAN
Cj4gLS0gDQo+IDIuMzQuMQ0KPiA=
