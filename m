Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C465422A7F6;
	Wed, 26 Aug 2026 01:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707860; cv=fail; b=PPi6JfyLHQUPlHNB+Mi3kpV23LD77OOmJHoVzBMOcfoD2Z8pkTJlwqAoQlLVKI/jXlcKULsdt32DjyU43a8uPc9Yb04qXTvV5/E2HiGt0y2J7Uuo6KW5FhLtst0BDeedIn4AvytHDmMt8pQaKZLMJwOJfcm6DxqPc7ORz+j4a7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707860; c=relaxed/simple;
	bh=FleeKalW2ghzxoih2AYBtB1i2pFMFdfCh5ziUTJ8VzA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GyVaePn0gXKUyvp6KqDz+v77Uir5jw/ZpK7zbaHRb4nqhmUOtFy+/Aj9QO1BmLUJePhnJ3GYmOJpUvLVLocAxjgEy8i13nTBg358XxYX1ERG+FhErDUC3Xkk4VabdJaeOGrOngMWWTUvV6tnDb8G/WplYcqmrUSitrYzlNFr8G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=encv5WgB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L3b7c5it; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JY++FEgn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="encv5WgB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L3b7c5it";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JY++FEgn"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09UiK1005087;
	Tue, 25 Aug 2026 17:09:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FleeKalW2ghzxoih2AYBtB1i2pFMFdfCh5ziUTJ8VzA=; b=
	encv5WgB5iV+uxt4xHDh1BOSaAJVftt5fzFgk3JdARfomNYI9B4pmI7duqegeS0/
	RyYxDoQB6vk/IXcn/c+OWaSMStgzyHgtOB5jxd5JBkYF7Nj3agGOL4ZycJ90WhWQ
	4sa8xMbTJ1r1UogmXLPVN0oSi2JQY2a60964kKsmriOXmy+oN7CoRQ6LiarKbU3r
	zM/i/ANyGckXVjJ6sjgv8iE/1r0PBLH3zeab7DVHfw4fODq49hZ9lAjuXlnJuTWg
	G572HDWmSaLZZqppFWxLY/GYeufiqBLXxQNyzUZeBp/RMy8IlSi5hdpl4GkLTiCq
	NMcgG/giwGHx2VwkDBF6fw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9j5m99ur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787702969; bh=FleeKalW2ghzxoih2AYBtB1i2pFMFdfCh5ziUTJ8VzA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L3b7c5it7vM/EZ0yyYJ0sBLJHG8wKfPniczNEj3N/4sJsMkBaGk8mrR/Ledqxxznz
	 /MYxkz/FbPhD03ZmlwYPZdazF7bI7d17g6OH9BdcgppPd2G5mEkAyEXZ9jdrHk+hm9
	 35U/H+LuJho2a8nT5BqG9m2F3vUANWw21n4vyEJC0YN8DCqdGiGdxrURnen3ZwyVSp
	 He88lrvtaHBycMpsu4uzVMaYZ1dW7BB9nU/Ftl5n4dZLhtLFGYfA2RKo/toAZw7GsS
	 JGWkiutBBwHkbQKA5KBXVhVISgC/eokuqMWB7eMScQVYFNkekh85sOZZoQs1nifmMu
	 OzuQdfBu40oDQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 069EE40124;
	Wed, 26 Aug 2026 00:09:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 77336A00BC;
	Wed, 26 Aug 2026 00:09:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JY++FEgn;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F139840348;
	Wed, 26 Aug 2026 00:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/zCspvObtCf/U89Jojx+n0gKKPPCP9Ma4tuzChCDwzXdOj7xuYGGbzbJxnVy3Pw3tTZYRAoZdxpyjoOmLwomsqqjlcE0ihdyEymJhIdde0dSdKi9EZRrr0q5Rnge2Y4UQCpSCsjeN/XbvS7GycJ5kTS//JGP9XDrzg33OMqcHU/Xjzr3mkEL358RnA6ae50haTIzj2LOj4PK/331wKlvI+niMMGF2WJNUCuJGnh2IfgaeHgEDv7K+eEBV2r+GaeYr4FeOk8VeeOVMugMEepFYRnYuXgrDkznkp1Lily3CZ52yJ/z6GVXCFl/UGwsf7T1kn+SuvBla9SG8oxE2h6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FleeKalW2ghzxoih2AYBtB1i2pFMFdfCh5ziUTJ8VzA=;
 b=pVQWDmdDS0ds4qwwMVGUzD4t8GYyjP8NAvlas5U8qXhxHxnUaBfMUE7OKXGyyfvl5Al4F15ZVi0lVKqM2SRKAczjPQWdRPbBTvPEy1Z+TnrpC6tl/GYQI4uZjpd/ZMHXSoKw77XbiKoBM2wnDW/X/pLhfURp23SIkA2lY+M4AD/MOGtFe6JF9LeEJagovtn2yJk4obr4UIuIeMZXTZBzjsTCX6+XqArVDlA35p0lTAhx0eIkhLIzt04MfME+C7wEXXyRyKtzj9Y7iFhoZcZqXmVTMjjRi58gMxJLMu96YlcZRrUE8pkNGj+44kpSl5CSbTCeFyEIW/akMbobGq7wgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FleeKalW2ghzxoih2AYBtB1i2pFMFdfCh5ziUTJ8VzA=;
 b=JY++FEgnRPJhwcnaKVLfco4gHtk539XgijCjIbs4yYyGQ41kv3BIgaOxhv8aBqon1i6SyzeiqP3/IVB9Q3ANBNWPeq3ptJ+CFPVsiqogssyd+VyMZ9YIZSKVA3N3yTOdOwUnFu7ofvQhQHkoRnuSULkMzSq+VnotuiFsOPJkWZY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 00:09:17 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:09:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 1/5] usb: dwc3: xilinx: use device_get_match_data() in
 probe
Thread-Topic: [PATCH 1/5] usb: dwc3: xilinx: use device_get_match_data() in
 probe
Thread-Index: AQHdKPBmxpL1F2dQRk2imOA86JIuZbavjGGA
Date: Wed, 26 Aug 2026 00:09:17 +0000
Message-ID: <ao4ulw-7vVQr4vKU@vbox>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
 <20260810174713.2325292-2-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260810174713.2325292-2-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB7501:EE_
x-ms-office365-filtering-correlation-id: f0e27abe-eeb3-49b4-987b-08df0306450c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 w4i7dlikvc82XK0VpD5YkTqASZxSyCGlQIjvO21smwVWN9Rf0un4t1vl3jyrtaTv+tejRgQDnymtIbFNzqjRnGootQAVx7gE1Df6m1JoVhbwJckgzBOjrXqBR1JYBbhFbrZ4KJXeAQB02nx+zVRogd5X67KpetrFqncOnpAoLV0+ENzyEDG+AO0N/XzFc4eRX969nrR4GpL4xZe79KMiF/vR8P7/+Hn3dDK3CCgxjvHx8zRuCtEBI2FN5qSb7AZ/EhR8AJbja2MKPupwY6Gv59n44QxitM5rIIe4qHeYQ8StWR3Jou0NabFOZTd8xLkObF8pMY2ygEpdYMWxOWeCpEnWBYirghvvXs+vYZppKnN3hWbPVE8GmlBr41I28z3jDAiTJCDxGLbolz+Xd7KixMzT+BPy7suiTuJ78zQqzK1ju2v2CffIftsnx3a1lLZLrqWqQIqiSK8wdXhfvRsen1ahY8aJJllEgicIDezAolL3cSghr+EM9nZBKiW6aeMjNmP3Y7tTj6LwSkMKLKEux4EL6DEgLu/L/18vz3BtH6UTphEmy6tgxdDRtBUbxoLmULYNlar+hO5o4xtfIerzX8ytsV8LCqOQ/16LBellJNvJA7bxlu2vo8vp+GMD/b3CVHiAC+L2kuMNdwO6ltmWVuLQYafiKyWABLK2q17yLGDo0fjt64iQIqTfmOdrLwk/f8dZBE9XUBKAcWoSX2V8Fr/50qhK/gUQXIvuYylvRb8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YklFQmNGVDlLWXA3eFl1K0NuaVA4eUE5cTlFU2hYZ1JOVDRmcUdUUW03eTc1?=
 =?utf-8?B?bjZDTXRtVVFOM1Vabi9TNDgwazUzdFR1dWJBRUM1K3NGcHNRbGJVbmV0VDVh?=
 =?utf-8?B?cHd5cmZlUTlyeXA1RkVlTkFFSjFUWU51Q2hKMVgxZkRiYVRzK2VWQ1JJM01E?=
 =?utf-8?B?R1pHcExrajkxZ1crR3Q3dHlKRlJ0aWtwYjFFdWxlSHhIYnVUenU0WFBoSEFs?=
 =?utf-8?B?dnhjUGxDYWxTRkpHVFVpOUNmR2FyQ1Y1dUtFVXNoSmJxQlhBeUJqb01jdGNz?=
 =?utf-8?B?YmtwMzJ6SVBJMytiaElTWlQ4TjUwdmpBaHNmU0dMYnNpME5EdWdzTTRPZUFJ?=
 =?utf-8?B?SGpVN09xY0M2NWhHYkRWZ25ZTmpCL2E3eDJ1Q0Z5NWdIWG9vSHRvVWg5OGdX?=
 =?utf-8?B?YjNFZHo3bVhrMmZVYk5RdjlDWkJ1b3JBaE9lcFJrYW9YMXQyN0w1ZEtZNno3?=
 =?utf-8?B?WVRHK05PT3ZPbllndUtQeXExS0FCQ2NjKzRCbDl3T1NHaUJZWWp5Q1duVGhm?=
 =?utf-8?B?TysvbCt3cS9rZmRKZXFnZ29XeVdNVGlVRW1vcDcxWkZIOGNDT09yWmxuSlZl?=
 =?utf-8?B?TTBDdndHUzVNR3JkdVAxTk5zNmlObUxtNVZmSWhXb0VvaGZnSlZNODVmZnU0?=
 =?utf-8?B?cDBKYVFGa2tlZGJMV01NQlJuTGNrRElWd2RVcGpXU1BRS0ZaYk4xRjB5RjV3?=
 =?utf-8?B?WHJickpiNkVMQlV1MVBCZi9JNURRb3h1eWlFSitBQ3FDdHdvdzZHbnEzQ3lW?=
 =?utf-8?B?ZUVFSi9mVEkvZWZPQWdDUEtMRjcrTnRFK25IREZnM1hMSTVYYi80S2hhUVNp?=
 =?utf-8?B?RHY0bDRFaVkzV1hFNjFIZHZQYnFBOXBDa2tvOW5wa3dWR1dOdUxwcGxMUW9M?=
 =?utf-8?B?ZllaMUIvTEZoSlFKeVZydDUyUjV3V1k3THl1bGc4a09wSjRVa2U4VHc0Ukg4?=
 =?utf-8?B?S2tITkE3ZFR6cTNoOTF5MEUxNWZRbnhhWnFlZ001STYvSTIyZmRRSmt3UStE?=
 =?utf-8?B?YVhZVy9hNXdQMTdmbTZLVTY0N3grMDdwbjl3bmZ1Tyt6aVZGMGQ0bmRPY3JQ?=
 =?utf-8?B?MVIvNjE2UFFaRXVqeTNya2d3STExdVkwT1R0TS9HazZFemJnelNScms4K0hS?=
 =?utf-8?B?S1ZCSUptdjZCZXVBRVMwanVOa0ZIZ01Rb1E0RGFoTjJqVUVzSWd5OHAzWElt?=
 =?utf-8?B?emtUNWhzZ2RROHA1NHJwZmI0ZmZCVExCaFJicGpPZWtSZnM5VVVkM2xmeEo4?=
 =?utf-8?B?SWF2NXkwZm0xTDFtaTlOazhFL0tkODFyRUt4SHFnNmpxaHo1ckw4elcyOWZP?=
 =?utf-8?B?RW1seXBreUFjMnBlckR2N05YU25ZdGVPT1NjSlZVQm84NFRnVDJJSm51QzBr?=
 =?utf-8?B?dXFVVElhdXg4QnBtTURoUnNMODNXNlNHZWprRE95citzWUoyK2MzN0tSNUpV?=
 =?utf-8?B?WVlpODNuT3hEbEs4akhGWmI0UWhnMGFRMS9ndXloMW9IaFJJcTNhUDNzTUg4?=
 =?utf-8?B?ZjdtY094TjNLN0cvVSsvZERMNTNkTUJCaG9sWDFaUllaSEFWdnFzSnRQUWdQ?=
 =?utf-8?B?eDhrcmlTWmJTNVkzUjJiRDlOMEZVcUZpdjYzanRmOHVybGxEb0dMMkZSa2Jo?=
 =?utf-8?B?WERkTzZNeEJwdHRTbS9RVlA5ZTBTVUxLd1VFUjFXR2pjV2EySWlTdjU0ZHhB?=
 =?utf-8?B?c2NVYi9PTmR2QlJqNWNmNkZ4RXg0VXVCVFRlcXVyZGZBU3QzYmoyZ2s0YVk3?=
 =?utf-8?B?MmdYYUwwS2lpemtLWGhQVXRuVkRZMWxwbW5XNEpjMXhmUkJwdHd0SC8zaDFl?=
 =?utf-8?B?MUdyOXBIa2taUFJ4Q3RIQjdSNnhabVhLU01seTFZaHRYQkdFUHZadUhBbXJr?=
 =?utf-8?B?QVhLc1E3TFI4bWZnMEQrQStZdi9GNGlYd3pOTUF2MjJQOXc0QjJDUFhjeVhJ?=
 =?utf-8?B?MndGSG9oTzNhNWpUQ25xNk5zcFhrR1Zjd1JDYWFJbkhPdlVrYnkxdlZGN1Yv?=
 =?utf-8?B?V2V1MWkvLzV1QTVwZEhZSFRtQkZVWmE4elFqUGZIWmhNRkh6U0hpODZFc3RS?=
 =?utf-8?B?NjRCWDVaTWNRUU1VNVNWa3VEUm9ITU5rejdXODZhdUlDWUJjdWh3VHpCNVVm?=
 =?utf-8?B?aEg3SmtqVHdMZFZFZWNUNk9DOXpnTlJ3NzBycld0WlVWY1FuMVFkemlrcU1N?=
 =?utf-8?B?UW9KNUFla2d5Z2lTRmNrRURqTDUxYzUramp4cDRndkorU1ZtdEw4cnRMS0Rv?=
 =?utf-8?B?RDRva2hSQllHRGFGVHloOTNtOVYxek92ZlZlMlYvY2ZDYkFMaEFuKytudDV6?=
 =?utf-8?B?QjIxNExpN3h4TzZYREFYWVpwYW9vNU5vdnZEVnVOTjJBQmlRdTYyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD81CA564E09924EBA626B10025C4AF9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	4ClFrc3DXsq9JRNdkPKSWMq61x0zJnqTkbHeBdllZr3V9L0sF982857W/pIVhn1i1pyyfh0l/unyxkzh6c3zhwF3ymOg5zrkIv0gNtJsORHOCstV10cr/86V5gLaVfMh+ZIAP9i4nltAeSuFmghH60Ka5NxSDs0qgPfXrsQBz8z4b4JyY7opAwGBzCrro4sXpvNyZlEk6AAqAchrlw/2VPUO3vtAyiwpsbj+H8bfYf6QQDUFYqftt+HbAlkfulybafV4IDvhgOJxMhY7xppjWpkjRvqjued6tcQ+CYuuYzF7Kmrsyaus+jJT7ckme8YyF522bVIDAi4MliKF/TYi3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FrCu+OlEM8v01U6dzHt/2kaWs7jUto6cSR0K5PwhZmkQfBiqeC3eHz9WFfwsQwzWW/qiPgwm6OHTpph6I+iupPkKRzSk4a34jUS46OnrxhPAZg/kaXrDkwnVLyHL47NfpLryY6U7MCLvTFu8Py84wnFFPJ5RM0dpTWIDcJKJ/i65N/aH4ipdhJiZvT4NPc7Rm0YlZKqwyA9CQY1CNpmTAk+QSlIsS2c0lO7iRcl7GQS6DWG0xnMo/xmGlTxTKTu+1e1aLco/M9TB6i/TuBrZkUUGoWHl71NuxzlSHlIKI618kB63mqVk9iIUL/wC4wIaMbZ2N5YGON+R+QeOzxiKzqmqPMtRAEAuPv0A0Nq3fkds4uOtkzbfkFGJPWdG2INstt7SpYK9bK1GqzVvgicnnVBDXHFW5U8eiD22g260ekSc+FSxaOxbGlq7S2WQGzEbTar7ZpUPObCy0ITCsNuYZUBCV01HyB/jDofW/4y1pwxXPwiiydAoyMCY67IB3S/JJWlYVCqBMc4eU5gEm1MnycexSAxD5aTu1H23lskZ81QDtfOhEbE6MlDlPNQ2c2IRhg9P9L3Dq664FvXVuL9G5Cgcc4t3F5C1C7W9LSseVx+msDsOKUNbkpl7HLoM+irYwJ5cnFiaYYkqQQfVjJFd7Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e27abe-eeb3-49b4-987b-08df0306450c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:09:17.2942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kYJUABSTgPIS3iJhOXu94aCnaC/RidAc6iRMEM0dmmzQ39cRgkDA9hG9ONDSx+mSHRZqDYsLeEnzoT/y6faPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501
X-Proofpoint-ORIG-GUID: hP1hpzJzSbKcCQngwlvE6HIKsrlU1TBG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDIwNiBTYWx0ZWRfXyU3/7Xs3nCvz
 icvJppmKV4v0JsRis/rfLl76MY2sJaUCoDOmtitHIJFAomilaGdURHfUEfxl+/gXil4Y0PaZrgg
 KPKXqh+/tDRx1xolK8KP8KnXzLhiyDc=
X-Proofpoint-GUID: hP1hpzJzSbKcCQngwlvE6HIKsrlU1TBG
X-Authority-Analysis: v=2.4 cv=BpetB4X5 c=1 sm=1 tr=0 ts=6a8e2eba cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=zd2uoN0lAAAA:8 a=jIQo8A4GAAAA:8 a=MnkcK1Y5XfynlzLMz44A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDIwNiBTYWx0ZWRfX/Fn28Jphdfvv
 J1p56tQCMove/FaiPN3eXKSXMcQDMX/Xxw/a+b0+jEtXDF1wG1iKVFBUvlHS/BU//L2wR0u0Bvq
 zU5AgfPJ+FU9V5Pnybf9zmNgKLRp3J0/f7+pr3cPqVnKoOdrAWiu7Ih342XmIjYIN2CkG+05gn0
 RMJmwu9De9g7lFsEbALAxx+vaHQytrvgcHRu5xbZJwVs0In6M9Lc+Q678yL2wGS5+52ZXS76e2K
 cKoAYN1yVOhTlU4gq1VdX0cGU8SJi/I0Sg7QE0KtQyAaFrwPJue1dAo62LS7C0vp2Mhd7dni40u
 WD4WCCJD1URizB/13glZljy4o2KqiA33iM/kUHU3l+GbdbUrIyxDNMqj09inUGu8EPNj9Gwrcbv
 FbnE8IzABhTzGdAyT5kVpqK++a8yKf27rYXR/H4XAc5VQVJfWpvuKymFAAfndGstreodkJpHu/Q
 nvT3cKirQ7fAOToSY/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608250206

T24gTW9uLCBBdWcgMTAsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFVzZSBk
ZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSB0byBvYnRhaW4gdGhlIHBsYXRmb3JtIGluaXQgY2FsbGJh
Y2sgZnJvbQ0KPiB0aGUgT0YgbWF0Y2ggdGFibGUgaW5zdGVhZCBvZiBjYWxsaW5nIG9mX21hdGNo
X25vZGUoKSBhbmQgZGVyZWZlcmVuY2luZw0KPiBtYXRjaC0+ZGF0YSBkaXJlY3RseS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJhZGhleSBTaHlhbSBQYW5kZXkgPHJhZGhleS5zaHlhbS5wYW5kZXlA
YW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCA4ICsr
KysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiBpbmRleCBiODMyNTA1ZTFiMDQuLjFhODYx
OTg1NGQ2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiBAQCAtMTIsNiArMTIsNyBA
QA0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+
ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
cHJvcGVydHkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9y
bS5oPg0KPiBAQCAtMjc5LDcgKzI4MCw2IEBAIHN0YXRpYyBpbnQgZHdjM194bG54X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJc3RydWN0IGR3YzNfeGxueAkJKnByaXZf
ZGF0YTsNCj4gIAlzdHJ1Y3QgZGV2aWNlCQkJKmRldiA9ICZwZGV2LT5kZXY7DQo+ICAJc3RydWN0
IGRldmljZV9ub2RlCQkqbnAgPSBkZXYtPm9mX25vZGU7DQo+IC0JY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZAkqbWF0Y2g7DQo+ICAJdm9pZCBfX2lvbWVtCQkJKnJlZ3M7DQo+ICAJaW50CQkJCXJl
dDsNCj4gIA0KPiBAQCAtMjkxLDkgKzI5MSwxMSBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJU19FUlIocmVncykpDQo+
ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyZWdzKSwgImZhaWxlZCB0byBt
YXAgcmVnaXN0ZXJzXG4iKTsNCj4gIA0KPiAtCW1hdGNoID0gb2ZfbWF0Y2hfbm9kZShkd2MzX3hs
bnhfb2ZfbWF0Y2gsIHBkZXYtPmRldi5vZl9ub2RlKTsNCj4gKwlwcml2X2RhdGEtPnBsdGZtX2lu
aXQgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gKwlpZiAoIXByaXZfZGF0YS0+cGx0
Zm1faW5pdCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLA0KPiArCQkJ
CSAgICAgIm1pc3NpbmcgcGxhdGZvcm0gaW5pdCBoYW5kbGVyXG4iKTsNCj4gIA0KPiAtCXByaXZf
ZGF0YS0+cGx0Zm1faW5pdCA9IG1hdGNoLT5kYXRhOw0KPiAgCXByaXZfZGF0YS0+cmVncyA9IHJl
Z3M7DQo+ICAJcHJpdl9kYXRhLT5kZXYgPSBkZXY7DQo+ICANCj4gLS0gDQo+IDIuNDMuMA0KPiAN
Cg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0K
VGhhbmtzLA0KVGhpbmg=
