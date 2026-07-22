Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171553845D3;
	Wed, 22 Jul 2026 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784759891; cv=fail; b=hckYRthtH+cHx75ksyEfbTK9bGT3H12R6etiK2RSfu0csijODGDGHJqMaGk3Mc+Eu54KvXy1KLLMxnU7sTsm1MpVj/c1juNs/OAWtzuzIfieyQhG5IV+Vq7Qza5tcfpS/LOU8PgTVLuiwcE4F+rwwVkDA4gfMh+Edv94kf/SrTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784759891; c=relaxed/simple;
	bh=YWYdWYKx5PiZRkkf4yfYgqm5dLZnJraEmudnI2PygJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ii+PevC0pUt03q/sNx876LywbFt2757oCu8f3Iim4q8FagkVns6Isds7aa0m+OG5s4Dh2VtGMEwwgeAGvTeKs4P4gDbz4nxNZwhdcooU06L3J1dqDy2HVoGFo0CBIReYezra6+6N0JR5aeFptwz8y0fvMN/5oJ4MhlO1iewTszU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PR+WHf2Q; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q6BQSFbV; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=R3orDFdw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PR+WHf2Q";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q6BQSFbV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R3orDFdw"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMFCD12520050;
	Wed, 22 Jul 2026 15:37:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YWYdWYKx5PiZRkkf4yfYgqm5dLZnJraEmudnI2PygJI=; b=
	PR+WHf2QbKH6Mgy0uuGCMauc9VsTNGVAoxepB0YwQVMb3eDjxcem8z5BjQ+NUQzv
	xBIV710QbO5NVdiMGSDKOPlhSkcOVGMECBIrKYV5/b6tRYlb+QyFJo7knAJ30u65
	B8TnPDccX7zTgBKZFEeItPOEscZWKQ9MV92Z00g9DK3a6W3xtOnWuUpkGbFGp/9B
	dDEgbwnpwe2RrpfQU6vRkyr5c9mLvAvev0GKIeBW22Vqw5BbIlJXYNCVvmfSudQo
	fKFfa1qdvidlWoV9aCZoopT9lHiSRbD02OHSlslx5Tvgva2Iadxg1qncFEJ8iJt7
	9lOqL8oD/4TuODrgDfoLXA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fjrvafmkn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 15:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784759873; bh=YWYdWYKx5PiZRkkf4yfYgqm5dLZnJraEmudnI2PygJI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q6BQSFbVqlWAhyscALenVjayIpD9ACZen/ciMw3w4M2+eqe8DqCeuEtmW8cnpEeaj
	 FXjDV+/7gqhPR01RELfDJU3XojL/gA8sjb6+eFHkzgaArgo2wCZmpp3DYKGlA3E4FH
	 7EeFaapg0a4T7zjIy3DXwstM00Y1dh/5Nuo3IYy8eQAdrtoKxUkC1a2OQZn6qjRAV5
	 QK4i9KeqYlzNSJzij+uLqNp8ukkAUWT10zp17be1NPvkpklgu5EyNbg6XNOQo0Zk0b
	 gXI1WFdpfIACEwDu0wO+nhPLA3lxWO81muRnM2QZEzvW6bPY4xGDX33ti7Ph5wuQb8
	 L9KNaKObH+/eQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 18BDB40524;
	Wed, 22 Jul 2026 22:37:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B200CA0632;
	Wed, 22 Jul 2026 22:37:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=R3orDFdw;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A34AF220449;
	Wed, 22 Jul 2026 22:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsGG3/yrJITOGUl8ftwn6aWkz26Q8IeCJpxqXfL1BBYBmwysyjj7SqNyqsPct82iTtnkqiWXTAijw0UwmRdOzEm0PHAxBMWN+BoDcIpGD151cbPqZMmJf7Tth9AeugKjwhNI6WWeSOfF6g74blNeai3skxMNFfIeRYDrCW/OqRYfPAJf9b7Gli8A90EmPi+lITqrRv3muE+CzwndpFuKpm1QfWQWshYpchS42ETr5nLkJddiBZIZmnta0X2WnW3nZiD4Z+3KqG8LnNrCWqW4TW/6QBjtcA8rV2NiQ2kj6myR63KFWSdRgjf9f7ZETJjGtK9HcKAj/uuQpN1z8PuzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWYdWYKx5PiZRkkf4yfYgqm5dLZnJraEmudnI2PygJI=;
 b=A6VZDFT22S7MObwwTkNcUy9CbHHt/CVW8IDd+2jVd8BDo+mHzy71sweUMO/tQca94+ZSlSqmVY3dYPPqKdWQlU39HefF81zDA2NXELb3rSI+WJEcKe8XeQRRHx/FdMhkEvIxilCPdWrdt3bmg0QZoM8N36i/bf8cZ018BUwK59zy9uJYOSodZAa8D5zJkVlSzcbsm2/plBAG55Ozbi4RKMbWidx0k9fUd3j8iRK2rN0E+GoET2jO4q+zuS0b6g09XQq1/JzLJQ46K/ZbAelXAWoHRVCbK0a6mkGKiaFIZ8UZXVov+ufm49TXGR5KJiKTYedAOlpqhmjszjOefA6zng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWYdWYKx5PiZRkkf4yfYgqm5dLZnJraEmudnI2PygJI=;
 b=R3orDFdwsC+CvEzQhd9YAuKO7NJoT/mK/EGuipyRbu5T61GK5V0fKdr/TelXdRdEmANQhyGjeA+2KYSUrOUioS1hUQzzVugS4xGxmj8akegHykR6zaW/KofBFKOtL9pQET5NamP5OrqKOhodTs/uzIdE8r8LNrWBRgs3Naz7kic=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 22:37:47 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 22:37:47 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Topic: [PATCH v2 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Index: AQHdFFWeY0C45Hetdk6wNt4VRr/jfbZ6LIuA
Date: Wed, 22 Jul 2026 22:37:47 +0000
Message-ID: <amFDhkvhqQHtIk7w@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-3-026487a08119@oss.qualcomm.com>
In-Reply-To:
 <20260715-topic-dwc3_tunneling_state-v2-3-026487a08119@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB8504:EE_
x-ms-office365-filtering-correlation-id: eda3dac9-dc75-4ed3-63db-08dee841dab3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|3023799007|11063799006|5023799004|10067099003|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 xEQPmy/dll1uIXxJlgH5P/rPVfEQzh83QQolFEsGS2GP6oKeKCY8UZ1Okhot1vPYSzDfa4ItffqdU3Y7is5QRis7nYIj9XUKv9JaG6UOyaydM3Hot5Djs69pt+/7x6JAJxmXxYwM32whBwLoWGiSBPb7KAbQWLBp1bDq69+75vBHHOpuWF6ep2XRob8U8hCdKGKCfdEiiShgnVUxzbaa2HIoiOwb9JY5StNaxiP5EIB4oC/C+zK8/vCDcmNcQcKqA+4wnfqr4a2fcPkxlx42x2KdM+oTmextBMZUr799Ni1nkiRx/5wMeElRQSVSGC2DAbM9UdJKpq13EaZA0WSUNGHuwISILF/IE7LJSuDb2yCdNUqKTrT6kijhvGyYsnd/MDJ6H9e09CYYe6vRLyQjW38UWxHdnRQT77V8jbTE2hyTxobqTgp7teBL3QqUMJs6Bo8sVAekoHDmT0PglfV5srSFnz9XeWfUTQSaapVZMfo9PDBCcwP4yszrFoQdq1t8tKGo5UzOFA4Fj2i4FKjnl9cbcssT7PBGQMVlYUoL9O2A8H+/2eVSljmFZRUrWvsX6o/+X9iVfx0bO4er0r/rWl7R5jNBX5W/KO7AlDX9ZFD9ne0paUCVu8q3pFT/lSxTwvsOb9G8slxV4JUqBLALt083Ly7nqNTTSGQuzZtqb05N/BvdyNsTL5Tc05+HlWNjA5ZM/OUbc5Do5E/ApqEf0SXuRatCE834oM7wlSjPXD4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(3023799007)(11063799006)(5023799004)(10067099003)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjBtRk5IYlc5VEU5aDY5bDBkUnhodm1WK1Q0ck4rV2FnbFoxMktkenNGK054?=
 =?utf-8?B?UHVmZUtvRHpsOHdPWVBUcVRzL2pybkdJMUpJV2VSUXkzK1NJNzJnUjR0QXZW?=
 =?utf-8?B?SlNIQkxLNGU3OVkzYWk5RGlaR2phN0FYaDVrbmpKbTVidE1ueVNCeXk3R3N0?=
 =?utf-8?B?MXE0QUZOWUFkUXlLTmNWcWZHdTJZNDc1cTYzRTBodXJNS2F0dlFVdmpMWFJv?=
 =?utf-8?B?UkdDU1puNUxoK1B5OEpqZ0tUZHFOWU1VaE1La0lZMjFGb3BQR255YWhCSkIx?=
 =?utf-8?B?MzEzc0x1WTNpUlEzT2JKQnV1VGxyV3ZubVdveFBkc0hXOGRYdU1xYmhHUW0z?=
 =?utf-8?B?VTVMejVjRnVaSWVzU2NJcmxVSUNONVVZV3g2U3hMbFEzazdIbVJTMXd1bTR1?=
 =?utf-8?B?aVc3akNTWGo4QXZlbHE1alZlaEpONjliWkhMeWQyWXUrRmdtSUhqN1dBY3Uw?=
 =?utf-8?B?aFB5bzROT293UDVXdHpnVjhGVDNlMUNRck9qRENNNCs1TTlQT3M3d3RRb3h4?=
 =?utf-8?B?cGhISGw1Yk5zKzhneC9QTU9ldEJMcm5XWnAzcitJOUFnclRFNTVBMG9JRGo3?=
 =?utf-8?B?Tmk0azV2d0pISVZyTEVaV3pKSGlEQVJMakllS2RaRW5BWTBFRU9XMVVZMFlE?=
 =?utf-8?B?SjhrLzA0UVhJWGdxaEFRbERLcmJJOVhpS1Z0ZEVZZk5jcVRacHQzMWlsNTNt?=
 =?utf-8?B?S2RFSG5SL2t4WHgzV0dmZDVZYVhNUGlLQ2lWam9weWNtMzJNUm9laE40aDZI?=
 =?utf-8?B?NEgxQnNCZEV1RTN4dGNxRlUxYUdwNGoxemNaaHQxRzhlWFphRlE3TjBpZGVQ?=
 =?utf-8?B?ZW1Sdk1oaEt0OGZtY2pOMVFMNmVoT3JHVkI0dmNleStCR0VzSlREeWlRejJF?=
 =?utf-8?B?aVVKbFJ5aG5CQVdBY1hTRkJrd2gvTCtEanZ0TXMyVGxUVi92ZGl0bWlmaUN6?=
 =?utf-8?B?ZzBlT3AzY0RPVHJYa21sZzlSMVN0TFdNWVF1TG5tanFiUUZmM0hPZSt2S0Zu?=
 =?utf-8?B?dmJ0UzFIemhkbHA4WTQxemdHYUpseDRIRGdCZEtSY0ppWjl4RlFqMnhkL1lN?=
 =?utf-8?B?ZW9DZm9BZHBUUTZ4NVNnT2dydFl2TjZ0SGdlQ1AvWk5lWEZlSnI5dHNyU2tD?=
 =?utf-8?B?QjZBa1BzYkw1cnZ3MDlZdG1MeDRIZWVyMjRnTTlXTFYrVTJZSHR6QUt6am1N?=
 =?utf-8?B?YXlJbXFCelJ0dmI3NWRwNG9JaGN3MWFOWHlmVlljK3BhZEY1RVlLV1R0cUxo?=
 =?utf-8?B?TmFGemlMZjJ0cDN6RmVINS9HUVU2OFQxL1FiL0ptNDVBcjB0VE56UER0VzMz?=
 =?utf-8?B?aDZQcDJGSnJrMUU4eXpkL3BqS1Y0Wmk1L2hwRTVXZFFnZDZsR0g4TWk1NitR?=
 =?utf-8?B?SzRoeWlyUmNySExMVTFBNFV4d2NMNlh3NDd4SnJlckJaTlpFQk1aQU5tNjBR?=
 =?utf-8?B?bVVSRXhpQjJqTGhhdWZpcWJQTGg5MVBmczFWRHJKZDM5MzdiblpRcEIrbDR5?=
 =?utf-8?B?TzJURGxxNXhaVXFVWDk5RXpmR2Nna1JBSldoSmx6QXVyZG90YVR4QnJ2M1F4?=
 =?utf-8?B?aUZ2TXVYVzZTVW13UmdCQTVFRWhWeEt3ZE9SVEpnam1xalpIMS9oVm54L21S?=
 =?utf-8?B?Vm14WmY5aU9iajVkOWpDRW9LTTlkNGFrOU1iQ1dnTUZQdEU4SXhEcjZEQXZB?=
 =?utf-8?B?L1liYVplVCtEQ3k3QnpNSlNjUjE1czhnRDFiYzRSNFBmenZlb2RvcVY2TFow?=
 =?utf-8?B?cUVYOHBYLzVVVTZTZVo3RFRodXQrazcycFlFSUI0U3dzY3VxeXRUY1lvRzJt?=
 =?utf-8?B?OHhTRVJJc0ZjSld1dHhSbWFNNVFlQ2pOczJXZG1ubzY4VVgxL3dLU3N3M3RY?=
 =?utf-8?B?emEwYlpGL2g2d09xY0gxNlQ3OURPL0p6Vi8vWjc3Yjgzc09uQWpUQml3TkRh?=
 =?utf-8?B?Q0Q2THBjU0JmMTlIQUdZQVJ6RXErdStIYytVbHJrdDlSZHU5K0tqZ25KZG5O?=
 =?utf-8?B?ZU43UlVyVmlRc0ZGYUNhNjE3QzN0SzdodFlpWXQrVWpCM2JONWkzL0d2ZVc3?=
 =?utf-8?B?Y3lEMjl6SnhkV3RLTm11RHFmWDZQTXIra2IwUXBpVHp3UkxPWVV1L1k3U1VU?=
 =?utf-8?B?dGJIejc2ZVFhY2FyQkhCU3NJZGNUMEJDTUJxU25iZFZhazZLNWJ4Z0ZjWGdn?=
 =?utf-8?B?Sm1leEhnTHZ2enNMNHB1QXYyVVV3YXpJZE1CbnNQM1pJa3RYdVlyUm91SEhU?=
 =?utf-8?B?bm10cmhGRW5JWENXTERqc2tJUlJNQ3lDUW9heDM0UkdWdmIzRVFvOFhpZlc3?=
 =?utf-8?B?dlhEdkVuZEI3bFBubUt2WXRlb1ZsWlhjZmFtVTh2UVpReldILzBDUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68633AEAB8FF8D419C8FDBC8DBF4D306@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ANMbUWNULfrdVvEZLdbgtW1GlRBZGrXVU0cron6FlnPQ+Ogz5Ifs2LX3dHUWjTf+thdXbEFaTqa1zIzgeSB9CD7Jupt30K9HMPetlPvsfkSeUml8GRVbS5ndRSlsaMqhMadvIzfacYKniQPYmTmE+aERhjUSGmbMDE0HcoISmBf8HVKUOuYULC4RJhgP46ROu1IAMlZVfGOPSlvAZJkF/kcaS2tE1HepYgPhdQeZHf4cexpTBS1/aYvTQORppomsIE0QaEQNGT2BEICFM0vUR6ZV26u8WDibL5//Kteb+wwFAeG6wVwqHzvRIyRVFv8V0hG2syM8Dsu3ivOcGNq0Hw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NvihByRNjeWaz+0AhsDZ3BqlUQ1BGNPJrUdn3WIewvq+zCoT3gkVWDpKsZS/zNPjHKAj7Z4FPDD8Q63ZOzqeW/AwNXeO4xKFAmiVsjBnQB246a1yqZtWKtIjkAHhTlVIPxuzp7N/JydmmV+eKR3O/UhewLsnyi6wFqW9q1LpDyCXZaaAgDKCVU199txbfjOOibslkOpJG6sxH2cQwHevt6llYj6AiWsLl9gKJtF/Zn5VMiZm+K940TMC2FoUF2qrfCymuAk3tvAWpdczhu88CNItFP+0CackIk51nOCFYB3TOheEvhM15tfqHIXM4e7z6dN3pe4THhWsyxqHQQ18m5SF2tunI40AilQYgO6fYuh4Rm7dK2Hrg8KAs9wK73zeOrQgLfAKNTEWul7/6qgAM2AIsYIp96ax58JsZzTC0IXj9SA8+a/LyEKyI5MME79MAz9aa2hgVusZHwAoLsE57isAjMhN/e+G2BFmc8r1DoIv5CpPZ4grkwkCuk9/NUc0wvB4v4sxFwKNA001qZknhcR6OimLB4Z5JdvEZNQsOF5qClIaY/NyI6E7/f5oF1ie4jFQybRME/tyBCqRJFPUKhV9XdRQtqZ0yvt7/5fd2EpohKbl/IGiMHNLpwHeZvN82Z0tGflA9gh1awEfMy6yBQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda3dac9-dc75-4ed3-63db-08dee841dab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 22:37:47.2612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urQ2usAqOjN3sGqsHaqTJUsGlIHrSA9jVcNFaxxCrNum5hoNmHtEcCt4RVsiv2AHZiQtQlnY9fwJIfTskV/oRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIyMyBTYWx0ZWRfX7XTQBs/pIh2G
 H8STj+41T7u5gifdbO1L7veDwp9Tw0IuMggWXrgDNcTZrMCpr9oidMK0KLJw9nzr5cXhM67BuEq
 dgjxm8k3VmnLQwnyRdeHTae7Z6HQ4Xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIyMyBTYWx0ZWRfX3R/iq/kVruw0
 1LGzGm/b9aV5i2qzys0eEWZrBda8NL5CnVrlUuNBIVzTRGugY9ROc/erZCobANtJVYTeyawveHY
 TyPe1VFMOTIoeZFBePCCsQbbgd4kuU2C8UK7u8W/WT8fNSUhsn2xUxpkvbCmFlV+c917cpmrOl+
 tnBXyu/iFz+DyrgcszpJab8zh10Buodhxhdw39UP55nZl0uVB3noZcZS4C/2SSHK8wi2kPbDQS2
 HtnGBsRNES84HG9VH5yszfOX1tYuhPa2T0xtvSDAXN4bT+/u6BAxiO3aggJmENe15y4hltRLhTV
 OQ99TWaZpMzfjUy5dItayqXbRMPlFlyHdFtw3D5wmVJzE7OC4OPa3Kulr6ONw/XX4ORzEXtMw0J
 JFUkteYYedfk31cUE+IkVtdgFJi3iRYuxrwlht375slXxRHkG539VzuTE+UhxA17/XwrRZk/Z3s
 D6TogBblypmAS63x80w==
X-Proofpoint-GUID: BbsFxqXuC-wmfbsGHjl9z-7GDd4poxSC
X-Authority-Analysis: v=2.4 cv=JOYLdcKb c=1 sm=1 tr=0 ts=6a614641 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=qNnEdJUOYBXo_JcfKV8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BbsFxqXuC-wmfbsGHjl9z-7GDd4poxSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607220223

T24gV2VkLCBKdWwgMTUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLg0KPiANCj4gQ3VycmVudGx5LCByZXRyaWV2aW5nIHRoYXQgaW5mb3JtYXRpb24g
aXMgb25seSBwb3NzaWJlIG9uIEludGVsIFhIQ0kNCj4gaG9zdHMsIHRocm91Z2ggYSB2ZW5kb3It
c3BlY2lmaWMgY2FwYWJpbGl0eS4gRXh0ZW5kIHhoY2ktcGxhdCB0byBhbGxvdw0KPiBwbHVtYmlu
ZyBhIGN1c3RvbSBvbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25y
YWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94
aGNpLWh1Yi5jICB8IDEzICsrKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1w
bGF0LmMgfCAgMiArKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCB8ICAxICsNCj4g
IGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jICAgICAgfCAgMyArKy0NCj4gIGRyaXZlcnMvdXNiL2hv
c3QveGhjaS5oICAgICAgfCAgNSArKysrLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1odWIuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPiBpbmRleCA0MDJl
OThhYjk1ZWUuLjk5NjRjYmQxNTRhYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94
aGNpLWh1Yi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPiBAQCAtNzQ5
LDcgKzc0OSw3IEBAIHN0YXRpYyBpbnQgeGhjaV9leGl0X3Rlc3RfbW9kZShzdHJ1Y3QgeGhjaV9o
Y2QgKnhoY2kpDQo+ICB9DQo+ICANCj4gIC8qKg0KPiAtICogeGhjaV9wb3J0X2lzX3R1bm5lbGVk
KCkgLSBDaGVjayBpZiBVU0IzIGNvbm5lY3Rpb24gaXMgdHVubmVsZWQgb3ZlciBVU0I0DQo+ICsg
KiB4aGNpX3BvcnRfdHVubmVsX21vZGUoKSAtIENoZWNrIGlmIFVTQjMgY29ubmVjdGlvbiBpcyB0
dW5uZWxlZCBvdmVyIFVTQjQNCj4gICAqIEB4aGNpOiB4aGNpIGhvc3QgY29udHJvbGxlcg0KPiAg
ICogQHBvcnQ6IFVTQjMgcG9ydCB0byBiZSBjaGVja2VkLg0KPiAgICoNCj4gQEAgLTc2Myw3ICs3
NjMsNyBAQCBzdGF0aWMgaW50IHhoY2lfZXhpdF90ZXN0X21vZGUoc3RydWN0IHhoY2lfaGNkICp4
aGNpKQ0KPiAgICogZGV0ZWN0aW5nIFVTQjMgb3ZlciBVU0I0IHR1bm5lbHMuIFVTQl9MSU5LX05B
VElWRSBvciBVU0JfTElOS19UVU5ORUxFRA0KPiAgICogb3RoZXJ3aXNlLg0KPiAgICovDQo+IC1l
bnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIHhoY2lfcG9ydF9pc190dW5uZWxlZChzdHJ1Y3QgeGhj
aV9oY2QgKnhoY2ksDQo+ICtlbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIHhoY2lfcG9ydF90dW5u
ZWxfbW9kZShzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksDQo+ICAJCQkJCQlzdHJ1Y3QgeGhjaV9wb3J0
ICpwb3J0KQ0KPiAgew0KPiAgCXZvaWQgX19pb21lbSAqYmFzZSA9ICZ4aGNpLT5jYXBfcmVncy0+
aGNfY2FwYmFzZTsNCj4gQEAgLTc4Nyw4ICs3ODcsMTMgQEAgZW51bSB1c2JfbGlua190dW5uZWxf
bW9kZSB4aGNpX3BvcnRfaXNfdHVubmVsZWQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiAgCS8q
IEZhbGwgYmFjayB0byB0aGUgbGVnYWN5IEludGVsLXNwZWNpZmljIGV4dF9jYXAgKi8NCj4gIAlo
Y2QgPSB4aGNpX3RvX2hjZCh4aGNpKTsNCj4gIAlpZiAoIWRldl9pc19wY2koaGNkLT5zZWxmLmNv
bnRyb2xsZXIpIHx8DQo+IC0JICAgIHRvX3BjaV9kZXYoaGNkLT5zZWxmLmNvbnRyb2xsZXIpLT52
ZW5kb3IgIT0gUENJX1ZFTkRPUl9JRF9JTlRFTCkNCj4gLQkJcmV0dXJuIFVTQl9MSU5LX1VOS05P
V047DQo+ICsJICAgIHRvX3BjaV9kZXYoaGNkLT5zZWxmLmNvbnRyb2xsZXIpLT52ZW5kb3IgIT0g
UENJX1ZFTkRPUl9JRF9JTlRFTCkgew0KPiArCQkvKiBMYXN0IGNoYW5jZSAtIGlmIHRoZSBjb250
cm9sbGVyIGhhcyBhIGN1c3RvbSB0dW5uZWxfbW9kZSBvcCwgdHJ5IHRoYXQgKi8NCj4gKwkJaWYg
KHhoY2ktPnR1bm5lbF9tb2RlKQ0KPiArCQkJcmV0dXJuIHhoY2ktPnR1bm5lbF9tb2RlKHhoY2lf
dG9faGNkKHhoY2kpLCBwb3J0LT5oY2RfcG9ydG51bSk7DQo+ICsJCWVsc2UNCj4gKwkJCXJldHVy
biBVU0JfTElOS19VTktOT1dOOw0KPiArCX0NCj4gIA0KPiAgCW9mZnNldCA9IHhoY2lfZmluZF9u
ZXh0X2V4dF9jYXAoYmFzZSwgMCwgWEhDSV9FWFRfQ0FQU19JTlRFTF9TUFJfU0hBRE9XKTsNCj4g
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBiL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gaW5kZXggMDc0ZDljNzMxNjM5Li5kYmFjYTY5NGJhYTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gKysrIGIvZHJp
dmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiBAQCAtMjQ0LDYgKzI0NCw4IEBAIGludCB4aGNp
X3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IGRldmljZSAq
c3lzZGV2LCBjb25zdCBzDQo+ICAJCXByaXYgPSBoY2RfdG9feGhjaV9wcml2KGhjZCk7DQo+ICAJ
CS8qIEp1c3QgY29weSBkYXRhIGZvciBub3cgKi8NCj4gIAkJKnByaXYgPSAqcHJpdl9tYXRjaDsN
Cj4gKw0KPiArCQl4aGNpLT50dW5uZWxfbW9kZSA9IHByaXYtPnR1bm5lbF9tb2RlOw0KPiAgCX0N
Cj4gIA0KPiAgCWRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoJnBkZXYtPmRldiwgdHJ1ZSk7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5oIGIvZHJpdmVycy91c2Iv
aG9zdC94aGNpLXBsYXQuaA0KPiBpbmRleCAwMDc1MWQ4NTE4MzEuLmM1MDQyNzY2YTQ4NiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaA0KPiArKysgYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcGxhdC5oDQo+IEBAIC0yMiw2ICsyMiw3IEBAIHN0cnVjdCB4aGNpX3Bs
YXRfcHJpdiB7DQo+ICAJaW50ICgqc3VzcGVuZF9xdWlyaykoc3RydWN0IHVzYl9oY2QgKik7DQo+
ICAJaW50ICgqcmVzdW1lX3F1aXJrKShzdHJ1Y3QgdXNiX2hjZCAqKTsNCj4gIAlpbnQgKCpwb3N0
X3Jlc3VtZV9xdWlyaykoc3RydWN0IHVzYl9oY2QgKik7DQo+ICsJZW51bSB1c2JfbGlua190dW5u
ZWxfbW9kZSAoKnR1bm5lbF9tb2RlKShzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBpbnQgcG9ydG51bSk7
DQoNCldlIHNob3VsZCBhZGQgYSBib29sZWFuIHR1bm5lbF9tb2RlX292ZXJyaWRlLiBXaGVuIHNl
dCwgLT50dW5uZWxfbW9kZSgpDQppcyBjYWxsZWQgYmVmb3JlIHRoZSBzdGFuZGFyZCB4aGNpIHYx
LjIgZXh0X2NhcCBjaGVjay4gSWYgdGhlDQotPnR1bm5lbF9tb2RlKCkgcmV0dXJucyBVU0JfTElO
S19VTktOT1dOLCBnbyB0byB0aGUgc3RhbmRhcmQgcGF0aC4gVGhpcw0KYWxsb3dzIHRoZSBxdWly
ayB0byBzZWxlY3RpdmVseSBieXBhc3Mgb3Igb3ZlcnJpZGUgaXQuDQoNCkJSLA0KVGhpbmgNCg0K
PiAgfTsNCj4gIA0KPiAgI2RlZmluZSBoY2RfdG9feGhjaV9wcml2KGgpICgoc3RydWN0IHhoY2lf
cGxhdF9wcml2ICopaGNkX3RvX3hoY2koaCktPnByaXYpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+IGluZGV4IDA5MWM4
MmNhOGVlMi4uMTE4NDAxYTc0MjQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2kuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYw0KPiBAQCAtNDc2MCw3ICs0NzYw
LDggQEAgc3RhdGljIGludCB4aGNpX3VwZGF0ZV9kZXZpY2Uoc3RydWN0IHVzYl9oY2QgKmhjZCwg
c3RydWN0IHVzYl9kZXZpY2UgKnVkZXYpDQo+ICAJaWYgKGhjZC0+c3BlZWQgPj0gSENEX1VTQjMg
JiYgIXVkZXYtPnBhcmVudC0+cGFyZW50KSB7DQo+ICAJCXBvcnQgPSB4aGNpLT51c2IzX3JodWIu
cG9ydHNbdWRldi0+cG9ydG51bSAtIDFdOw0KPiAgDQo+IC0JCXVkZXYtPnR1bm5lbF9tb2RlID0g
eGhjaV9wb3J0X2lzX3R1bm5lbGVkKHhoY2ksIHBvcnQpOw0KPiArCQl1ZGV2LT50dW5uZWxfbW9k
ZSA9IHhoY2lfcG9ydF90dW5uZWxfbW9kZSh4aGNpLCBwb3J0KTsNCj4gKw0KPiAgCQlpZiAodWRl
di0+dHVubmVsX21vZGUgPT0gVVNCX0xJTktfVU5LTk9XTikNCj4gIAkJCWRldl9kYmcoJnVkZXYt
PmRldiwgImxpbmsgdHVubmVsIHN0YXRlIHVua25vd25cbiIpOw0KPiAgCQllbHNlIGlmICh1ZGV2
LT50dW5uZWxfbW9kZSA9PSBVU0JfTElOS19UVU5ORUxFRCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS5oIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4gaW5kZXggMmQz
OTQxYjVlMWUzLi5hODU5NjgwMDhhOTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+IEBAIC0xNjc1LDYgKzE2
NzUsOSBAQCBzdHJ1Y3QgeGhjaV9oY2Qgew0KPiAgCXN0cnVjdCBsaXN0X2hlYWQJcmVnc2V0X2xp
c3Q7DQo+ICANCj4gIAl2b2lkCQkJKmRiYzsNCj4gKw0KPiArCWVudW0gdXNiX2xpbmtfdHVubmVs
X21vZGUgKCp0dW5uZWxfbW9kZSkoc3RydWN0IHVzYl9oY2QgKmhjZCwgaW50IHBvcnRudW0pOw0K
PiArDQo+ICAJLyogcGxhdGZvcm0tc3BlY2lmaWMgZGF0YSAtLSBtdXN0IGNvbWUgbGFzdCAqLw0K
PiAgCXVuc2lnbmVkIGxvbmcJCXByaXZbXSBfX2FsaWduZWQoc2l6ZW9mKHM2NCkpOw0KPiAgfTsN
Cj4gQEAgLTE5ODEsNyArMTk4NCw3IEBAIGludCB4aGNpX2h1Yl9jb250cm9sKHN0cnVjdCB1c2Jf
aGNkICpoY2QsIHUxNiB0eXBlUmVxLCB1MTYgd1ZhbHVlLCB1MTYgd0luZGV4LA0KPiAgaW50IHho
Y2lfaHViX3N0YXR1c19kYXRhKHN0cnVjdCB1c2JfaGNkICpoY2QsIGNoYXIgKmJ1Zik7DQo+ICBp
bnQgeGhjaV9maW5kX3Jhd19wb3J0X251bWJlcihzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBpbnQgcG9y
dDEpOw0KPiAgc3RydWN0IHhoY2lfaHViICp4aGNpX2dldF9yaHViKHN0cnVjdCB1c2JfaGNkICpo
Y2QpOw0KPiAtZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSB4aGNpX3BvcnRfaXNfdHVubmVsZWQo
c3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiArZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSB4aGNp
X3BvcnRfdHVubmVsX21vZGUoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiAgCQkJCQkJc3RydWN0
IHhoY2lfcG9ydCAqcG9ydCk7DQo+ICB2b2lkIHhoY2lfaGNfZGllZChzdHJ1Y3QgeGhjaV9oY2Qg
KnhoY2kpOw0KPiAgDQo+IA0KPiAtLSANCj4gMi41NS4wDQo+IA==
