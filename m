Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28168154425;
	Sat,  6 Jun 2026 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780708555; cv=fail; b=IOB3mZi1xat8S2CocEHn5DgWS+5h0cSVBeM2UOEWbuoduJH5lUFkDXL97RQ9owHqfgJN3I+V+mv51fZsjmIRWUpqjWIJsRswXVf4TehafC61joWeY0cbuFo4/+flKtOQyD7/wtM6mU337Zca+XefhqEXH9fXSPa5EdWjgEtM1Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780708555; c=relaxed/simple;
	bh=2cRdb1PRSnpu0RIG8JllDAPlBn5gvzVxPU2UYgKFklE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OnXGQU1b13zipCDKTjsea96Eyoo9oyYj+qS85omoBXNA90EYJoerTP9J9V5d0gXAVrMbFnxhOj5ri4vCFMyMTqtqyflt/K2qljK1VbCx8h0Ymw8Yp7ta92MTHsrOkdmkOH3o94nB0OG4Okuq+7OcjihTKamB1n+I6IhHyQCXJwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mpN7yLuL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VSVIBPkx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hWkOSiPZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mpN7yLuL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VSVIBPkx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hWkOSiPZ"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6560o2Ru039929;
	Fri, 5 Jun 2026 18:15:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2cRdb1PRSnpu0RIG8JllDAPlBn5gvzVxPU2UYgKFklE=; b=
	mpN7yLuL0Zou2C5lwLOIQGeV7MKBU5jq+bYNYmCDIdoqTYHAx9IHY4sRLvKPaOuY
	YJfGbqt+WXJS4ljxgqT3pqe9Ekxo0JaII3SHk+sfw+nJB/vmpeGgPocPS82B5YqK
	kSjqO34GyDd8Sbqzt/gj2TO6SzA43dDdtcoItIF4N7piCrHxL0jioHeZX0e54adU
	Kn/bY1+KldS6DEu7CwA+ihIpqkjFYJ4xFRXQqZMM+5i1Zfct4NsxoEi6pXlC2lap
	bhB55YJVluSBbs+YBUi3gDNRaN1fhvfiyegoQsOokK2oV6JoE6OJ/IiUKSlg15AF
	kFq0J1FamZIqKsB4QfmypQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4em9bvg5nd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1780708550; bh=2cRdb1PRSnpu0RIG8JllDAPlBn5gvzVxPU2UYgKFklE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VSVIBPkxyxhydrZFV3YY9Hgm3uBeuYBaAMJNLgRZYP0daPeksIVjsJ5D0YJljLLiv
	 4nHxrxqmhFoAi1rCr4a2/7IDTcGqhMgxXfXmCah1+U33nfLmImtGsEsSCgLkcDSrmg
	 4R8nsBMgt8rFbS1OVCIqgENbZhS3sYFoSFf6fqd958I6PaJJKv1G++ePcXJf37vppl
	 juGln6ut7tLLrcRBKxIHwwNB7yxJrVcJFTHdWbKGeKT1c+EHgj+iYcr3td/Eoe1Qjp
	 sMggBRgrsP4YOtPpK02q/QLLWS4uiKeQ2jrdKHcEKwYpoIGabV2Q1yi6oiS5hiYcFN
	 tHAftGFJGMo/A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB9C74080C;
	Sat,  6 Jun 2026 01:15:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AEB37A05BD;
	Sat,  6 Jun 2026 01:15:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hWkOSiPZ;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00100.outbound.protection.outlook.com [40.93.4.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C95E740ACA;
	Sat,  6 Jun 2026 01:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de0DR7t3nTgniqb5Y5jJNKl0auKUOQbw4Ngj58GdCDSj21HosnA//rN2Dd7pAeurg/WMxg1xdEQ/hxor9TFafp/3vQjUPNOcBrm1/BKzW7k0N2oJWWZqganVRuvcUz3S9EVFVrlRQsbxXr4M/yFQzzhsITDMynzcLjWZuosdfJDVqBYKHWKNia4xGSNOE2uJOfEEstIQfzXEWBSNn0zxLEMVsQB98LGNwplClkAQsKDqKpqnPgE+im6PMa45uNWhsOPOhDRHJEw8TG69J1dR43TSJIhjoUCtUbCyGQRu0IPotAbciGZrkHs8TwJQzIaYFW1eN0YbzOq7fA2TnnjfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cRdb1PRSnpu0RIG8JllDAPlBn5gvzVxPU2UYgKFklE=;
 b=hMrs1yxCSP+6+zghRj3oDYRHERPpA3jvrJsQL4STateVRnP+TNA2FX0uEo641O9gZfcu+dE5Qryk0LhUG/J+xflUM9PFmjdeA7DLF4FBGxEUyDY3iAz3NcrmaZroo+w12Hkea31IwhKOasT+pFrh2ASq/gBMy/0/jsBHvhskDdGPxcO9WGIp8ElQK+9wfsfoDs1xUeulNXCubRjy/CCwDv2DNbk//buUQHc5MkZZ+sFm3NeL3QNzMwRKKZdAxKkjt4rAk/gZWBwlEHAc37MB5zp8gsIWEThL9KkLCZkohXRdHptKDgI++BjbjLzPjk0rG2ZjxFitNBVDmvMpVVFMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cRdb1PRSnpu0RIG8JllDAPlBn5gvzVxPU2UYgKFklE=;
 b=hWkOSiPZKQmgqlYoWslaSHgU/BIi+PutczvfFKF3EADpT6KrNFzd2Idp9Kni+B7XWG/TpHepnNdLxu72mvTyLefrAd5vd0LN9rTK1UrGnGWLICb6qEiPKZxw9D8Wjo3GVhMmmm/oP+Jq4VwdQtOACBq+CUwId4Hs4hV4QDau2IY=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by CH3PR12MB9026.namprd12.prod.outlook.com
 (2603:10b6:610:125::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Sat, 6 Jun 2026
 01:15:44 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Sat, 6 Jun 2026
 01:15:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Topic: [PATCH v3] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Index: AQHc9RbMU6iUfCwpG0qfJGOTMo1rg7Ywuc2A
Date: Sat, 6 Jun 2026 01:15:44 +0000
Message-ID: <aiNz8jjwt_oxIILz@vbox>
References: <20260605181142.1925832-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260605181142.1925832-1-elson.serrao@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|CH3PR12MB9026:EE_
x-ms-office365-filtering-correlation-id: add97dea-21a2-4ea6-84e0-08dec36921f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4133799003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Q6Ta6ILsbMel0C6s/fvLJkeFbENJRuO7O8uZ1mPGYl0DcLITxF9XtAnda2Ux9MY3+LJV1inv73P/x2++GND9Bv+1Mj+CZ9cArXtVpscW8qggsfo9qCnLywIKu7TMdF0eMo+cpj3aePqqPV1KzjhQLtQB48iYhlGd9SZe0zmWzVXheMH5v/ekmnBFCpWT+pVbpwmHCcpRDwgyt521gs7/3/N8/RBz95JX9Xrp1om09K3Tj3EANAoIa1j4/KlRoTLgKFzG3WVZK2qEfg9c+HKfwD80WDZmDbeJTFtZVEpbkS8lEv+EhE+Tbtw/3jiMsnAcDDo1b5KkE/b8aC6IMbJRFkxaf3NxSOP8s/Crhd7EJqIAnGmYyvw25PF9vyOxgUN4TVbG6ogn84SnnS+58r7wyGS/dt269fNCbYsqTVnMK9EilXijEmNOJxAY+X/q+2iPw9zOLPeRlnIWQZEJbfSA8DZCFkLdIo08R2rX1Os68IXkrdfLEwrZhUobjUtUXxu3wHenIXrTF+tlDHr/8pUCCf3pE/p05nJf4FMw92p8FqaEXm5MCqlt4+i7b9cVEwy92Hh0kSjAI9lY9L87SEN4gP0b1lAoqAtnhKYAtIRsvm9aopmhAxOzLge/hI51qTnB6F+rQkJ4d2fXB8r1SbGH/1jGKl2WpCaaxSYgjzKwez18IuQzW73y5m9q0D6XT60WGugPHdVmW0bIOZivcRA3Iw1YSMros8PHA7s4NYhD0oDCpXP5fne9TDBITASHOpSW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4133799003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aldScHRtS2VIV0R3UEYrSFBjSjdLVWd0WnFGVk9QUzQ2Z1FTYU9saEEwdVBi?=
 =?utf-8?B?OUw0dzZZbForQXppcDN4Mk5icHRuNy9iaFNJdHUxUWJHQ0pCUjNlMVpLRkox?=
 =?utf-8?B?a1VocXEvUHFxb1o4WThjdDl3V0xzSlRLWHA0c3BwYVN2eDRFeGhCR0s4VU4z?=
 =?utf-8?B?a0lFWWZHcjc2UEFoblpYWDIxU1krVEVveUZBQldPZUk1MHZENUpmOHRhKzNs?=
 =?utf-8?B?eVQxNkpmeGZ0aG1vQjdBQ1pCMjI4MVF3QndFU2IvRW1QSWNNQU5oMS9CZnFX?=
 =?utf-8?B?cEZ5QVo2MHVObHp1OCtTakVXODFPZjF2SnZoZ2UrdmJvK2EwZXh3b2VFajZU?=
 =?utf-8?B?Y3Bkak9HNU9TV29NbHFwNjg2TkJxYVI5SWN1d3dxS2h6RVl2blJtVDc1aEpV?=
 =?utf-8?B?R3Z1RnllZkZSbm1Vb2FvRlMySHBhZUFMWGxhTW1VK2d4YkZoaDVJRUptTHBo?=
 =?utf-8?B?bGdFUm50MjVPRS9xUVhaNXptS1hXYlpBanFxTmpybGNYckMxaHFJc1k4c3Y1?=
 =?utf-8?B?THRBdEhzcytackEzN3BLY29kQ1JRZmJ2V0dtR20yWW1FQjFzMFp6WndDcldB?=
 =?utf-8?B?c241dWtvL00zUVZkcVFtTmlsQVVhTEV5RmtDZlJZUW80WU1RMU5VRnlwdUh3?=
 =?utf-8?B?cjd5OUFUTm9ZMGhCVksrV0k5empUTTdIL1hLbnJ1K1h3c1ZHUk95MklaYUsx?=
 =?utf-8?B?eW8wNUFhVENKcTkzR05WTUNnZ1B5WmJvcmtiM214YkEvYTY1VXo1WnBMOW1q?=
 =?utf-8?B?RWpHRTB4VVBvcEhoWDFBVXVmakJoZGhLY0tEVFArNmt6UXpXdVZMQ1d6RDVp?=
 =?utf-8?B?RVF5NXhtUWoweFZWZmMzaytEUUtrd0pPeVVZelE2dFVOaVBuV2dhTWNxL3FQ?=
 =?utf-8?B?dCtxQVlWTzNPRVlvbW5LRERERFRXOUlkVWsveWFqNGk2UkZkSTlzK0EzYng4?=
 =?utf-8?B?QWhKVzFRc2tmenlsdFRxT0xsMUpqQzJQTkhkQVJ2SklkM01jaVNBWittdHEx?=
 =?utf-8?B?eDZvMERWeUdCdm5WMjVMYkM0TmswWmFOVncyMVgyODZRbTBqdnRQZ05OalhU?=
 =?utf-8?B?dUg5dy9WbTIzci9qWGRzb1dhZXZZUklyYUxsSjlPclovYXkwZllUbXg0dnZT?=
 =?utf-8?B?TVpkQmxCRmpqMTQ1c2FGeUtsZFhrQ1BIbVBJaXYxaHM4b1c3WHBNQ05aTDB2?=
 =?utf-8?B?ZTFRUGtvMTJ5SzFmNlMxbVcvQ0NENXpHRkphMmpRNElBbVdFZDBkVTlxQTFL?=
 =?utf-8?B?TGp2cG5DMzdSbFlBU2pla3Frcjl6amJXeWZqeDh1bHdwVkE5OEM5UXJPUHFB?=
 =?utf-8?B?aXh0eW5EVjdGeUYvcW10ZDdCblJRWGw2bzUyb1NwUnozMC9na0hCZEhUUlRs?=
 =?utf-8?B?cVpWTFlKeS9VTUZPaW91SHZtTVRtWDkwdXNIVVN3d3VDYitMVFB6Q3Exem4z?=
 =?utf-8?B?TkNwZHpRVkZDQWhsTkpqOEFKSDhYZEU3cjlPVmhldUdRUFowOER6WE1PdjVu?=
 =?utf-8?B?OFhRSXI1NUxxY1FrNG5WWnpYVjkzZzJ6eWJiR3l6QTdvcU9oL1d6SEpRclo4?=
 =?utf-8?B?NWI0M25SeCtzbkFwWUo5RVQyc0g1WUljZGc4cSsrZmw4VVFOS0h2blV3SjZ1?=
 =?utf-8?B?bWdVNjlkV1FQalZuVXpWUXBjOWFKSnA3SnFkM0dyUDg5U1BRaFA3VXBjK2dI?=
 =?utf-8?B?bFZlWFo3Q3VRemZlRHFZcVNVdXMvN0ptWllzVUJwTmI4Y01FYlZLeWhsbnM0?=
 =?utf-8?B?ejRYOWJuNVc2L1E0dFdDRDZFSjdDNWlGc3lhY0FUV0YzMUtUMEpuU2UrTDJj?=
 =?utf-8?B?cDRQa1FEalpmMzk5aXZIaGwxNVJSeGZjOFdzcDJTMXNRNWFvZUZiV0x5WWpY?=
 =?utf-8?B?K212bEgrUUxJMEJvOFZlQ01ka0xMRm5YaVNxMldLNUMrNXovYmtQK3N5YktT?=
 =?utf-8?B?Vy9lLzR5Smd0cFEwb3kvNkoxcE1Rd0VadmtFamIvRmczL0txenIvWTl2cTh5?=
 =?utf-8?B?eUxzdTd2a3F5TE5YVHVLVjFKWWZPc09IZWxjQmFoc3NhY1Jlbmk2blg1Sisz?=
 =?utf-8?B?UXdONElCNEYzYURFZ1FmbzlieUJ2Q013TFl6ZWUzd2VDZEdod0NTelQ4YmdU?=
 =?utf-8?B?T2JEMzNwbnphSC9HTE91bnVDaXliN0RQVGZXZUhFK3dhdVl4cFRnQldnbEFp?=
 =?utf-8?B?cHZJL2hOMGdLOStaZllOS3h4aWZZQW1mZmRKay9YMHkwQlc2T2ZHVnlZOGFi?=
 =?utf-8?B?ZE9RZGtrUXgwUk9pckJUeWJ4eGt2U3NKdkhqQi9qUkg2WXNrSlF2RTZzdkJL?=
 =?utf-8?B?RCtDTGxvUXRWWHVnSGxkT1k4eFN2ZFl2RlpKUjBXMzZidkVkOGZmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <632745E543F7904EBF207500EA1DA1D6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	KRwfyN9jknA/tDAw2DuwN5SkzcIJ/Wip5gMppj0ITZ0aADh9RHvdMBD1yyfiYB3p3kiJJNbypwwlxRxVnvghvpe2caX0GJwcaRT1pvU+YEz2lUVmjkOsVkpWREadfxnKEuvk4K0JALSryqMN/FgnLR0jAOWV05w91tUt6gnNcWdIe6KXGingFDiehxBOq0ZUlG2yjPLvwS6gZoH3DyLZwP39u/smjrzm8G8JfgAk1fO/TmQppCDLeupog6Y/LC3SmWlr+maiuzRMhL1vPg1lJbIR5KDnhIRtd9qPNVvklEetYDd7D4Rv8Hqv0UXMgM1jhUShWja+V18590enS2I/Sg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Do7tie+eD9X/sInle5O4wHfPBVqPYOaw6o+bUW6VKykiSi/mGSriqLuNnDPXfF5AC51WgPKiirQXzeRnJsA/igEHso8P7T6JaFdP7EshfNNvR8aNUi1RP9rwY1OKqkjOXqi15E8heU5Zp18lx/MOtbSU6MAtkurCBtldqOosrKNa1gJAuecV3nPmm4dgovmQx+jGTuFma1zv2miE/liDoM2XocXAc6wIzebQ8BuWxgjP6AwJOVnSJy9RtjaQlDzVCIJ/Wrw3A8h15tRGn47wZ95KIMbAnX2kuf5EMQRP+CrK+NhiQoSdytV3xgaJJgMR5Va0xLKKUU7GfDbBOI25Hh1PYq67VSnJe903VFqMoy457LmKL7HtrpbQL2TIRX5ZBLZH+CvLFY8G5dpGRoV9ewgSnPM7Xsrlq9joL3+tSP13AG5uENjsS2m1mFT7J1dnRJQ4ReyvmNe9Z/d1OZkUaDa645AEbCh9a28GQ6HO6iPc5PiBHhyM5vx48fLfemILiJHjzdM4Yn/ssT3kswWiTxw+oAM/Gxxrkij17h9sDSbMvzxWPfmeQyw3qQSKYjUpMXe3mrH+Qjj/H0sc+i9Dr93f/smh0vYL9Ys59KFkoX5CH4/LFXl2Ig67dvNkLgjBJt3Ak4QB71rIjFQ5s2XV4Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add97dea-21a2-4ea6-84e0-08dec36921f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 01:15:44.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XL+shSLTBaryXUV6s1umtby5E6xmLPcsbI8HPLOPE6ppCU8jxNBGKbEQprLxDolCOBGDKhUOnUaqLZrGDCuYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAwOSBTYWx0ZWRfX7j+hidKM/lUf
 d6hrUOtdR6s9717yQ5LzO2/Jsb/MkB870kdb6IFNSjYD+Py+MRbDofa7YKHD8mN6r9AhXLXRtq4
 kSPERzNUQbu+VaL+KpbS1kTYIvUJhtcK6dMAjqVuavEPl3Z5rLCUaG+2Bn92AhgQKqx2frzG9dF
 ybZmBV+zSYUA2+kTatrofA7wGEWVv32wy72L91EBw9cEXMNEJVfxBs2vIiVsrLpKwfyEUZ+2mGZ
 oLP7rxxjb39bbulTYV389jGvIf1gMkifdx+0oXnDX9iURf9C8gtNkEWuv09AadsYdLZ6HJs6P4K
 LdpHvdCTarPmaKDO8/kP8HvoWA/gp/rNV6OSXkAdAt8+PaJSx1XwlRtq/3hRHKQnyX4KD2FasTe
 Hbp+D9FxnWqtUjjhGIIQo2PiOQ8u+cbujVgxrK0lIvLg1NVsWjOKm0bFl8P3voHNTzMy6YDLUAr
 6ozRptHPaYRk4JtxSdw==
X-Proofpoint-GUID: KYsJb4Dv-2CYTWA4KBh9ysUPZyoLKKuJ
X-Proofpoint-ORIG-GUID: KYsJb4Dv-2CYTWA4KBh9ysUPZyoLKKuJ
X-Authority-Analysis: v=2.4 cv=B5+JFutM c=1 sm=1 tr=0 ts=6a2374c6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=_dshocqAdEtbz79AbAEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606060009

T24gRnJpLCBKdW4gMDUsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gVGhlIGR3YzMgZHJp
dmVyIGN1cnJlbnRseSBkZWZlcnMgcHJvYmUgaWYgdGhlIFVTQiBwb3dlciBzdXBwbHkgaXMgbm90
IHlldA0KPiByZWdpc3RlcmVkLiBPbiBzb21lIHBsYXRmb3JtcywgZXZlbiB0aG91Z2ggY2hhcmdp
bmcgYW5kIHBvd2VyIHN1cHBseQ0KPiBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZSBkdXJpbmcg
bm9ybWFsIG9wZXJhdGlvbiwgdGhlcmUgbWF5IGV4aXN0DQo+IG1pbmltYWwgYm9vdGluZyBtb2Rl
cyAoc3VjaCBhcyByZWNvdmVyeSBvciBkaWFnbm9zdGljIGVudmlyb25tZW50cykgd2hlcmUNCj4g
dGhlIHJlbGV2YW50IFVTQiBwb3dlciBzdXBwbHkgZGV2aWNlIGlzIG5vdCByZWdpc3RlcmVkLiBJ
biBzdWNoIGNhc2VzLA0KPiBwcm9iZSBkZWZlcnJhbCBwcmV2ZW50cyBVU0IgZ2FkZ2V0IG9wZXJh
dGlvbiBlbnRpcmVseS4NCj4gDQo+IFVTQiBkYXRhIGZ1bmN0aW9uYWxpdHkgZm9yIGJhc2ljIG9w
ZXJhdGlvbiBkb2VzIG5vdCBpbmhlcmVudGx5IGRlcGVuZCBvbg0KPiB0aGUgcG93ZXIgc3VwcGx5
IGZyYW1ld29yaywgd2hpY2ggaXMgb25seSByZXF1aXJlZCBmb3IgZW5mb3JjaW5nIFZCVVMNCj4g
Y3VycmVudCBjb250cm9sLiBUaGUgY29uZmlndXJlZCBWQlVTIGN1cnJlbnQgbGltaXQgaXMgdHlw
aWNhbGx5IGVuZm9yY2VkDQo+IHRocm91Z2ggdGhlIGNoYXJnZXIgb3IgUE1JQyBwb3dlciBwYXRo
LiBXaGVuIGNoYXJnaW5nIGZ1bmN0aW9uYWxpdHkgaXMNCj4gdW5hdmFpbGFibGUsIGFwcGx5aW5n
IGEgY3VycmVudCBsaW1pdCBoYXMgbm8gcHJhY3RpY2FsIGVmZmVjdCwgcmVkdWNpbmcNCj4gdGhl
IGJlbmVmaXQgb2Ygc3RyaWN0IHByb2JlLXRpbWUgZW5mb3JjZW1lbnQgaW4gdGhlc2UgZW52aXJv
bm1lbnRzLg0KPiANCj4gSW5zdGVhZCBvZiBkZWZlcnJpbmcgcHJvYmUsIHJlZ2lzdGVyIGEgcG93
ZXIgc3VwcGx5IG5vdGlmaWVyIHdoZW4gdGhlDQo+IFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHll
dCBhdmFpbGFibGUuIENhY2hlIHRoZSByZXF1ZXN0ZWQgVkJVUyBjdXJyZW50DQo+IGxpbWl0IGFu
ZCBhcHBseSBpdCBvbmNlIHRoZSBtYXRjaGluZyBwb3dlciBzdXBwbHkgYmVjb21lcyBhdmFpbGFi
bGUsIGFzDQo+IG5vdGlmaWVkIHRocm91Z2ggdGhlIHJlZ2lzdGVyZWQgY2FsbGJhY2suDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBFbHNvbiBTZXJyYW8gPGVsc29uLnNlcnJhb0Bvc3MucXVhbGNvbW0u
Y29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gIC0gSW50cm9kdWNlZCBEV0MzX0NVUlJF
TlRfVU5TUEVDSUZJRUQgbWFjcm8gdG8gcmVwbGFjZSBVSU5UX01BWCBmb3INCj4gICAgaW1wcm92
ZWQgY29kZSByZWFkYWJpbGl0eS4NCj4gIC0gRW5oYW5jZWQgZHdjM19nYWRnZXRfdmJ1c19kcmF3
KCkgdG8gcmV0dXJuIHN1Y2Nlc3Mgd2hlbiBwb3dlciBzdXBwbHkNCj4gICAgaXMgZXhwZWN0ZWQg
YnV0IG5vdCByZWFkeSB5ZXQsIGFuZCBvbmx5IHJldHVybiAtRU9QTk9UU1VQUCB3aGVuIHRydWx5
DQo+ICAgIG5vdCBzdXBwb3J0ZWQuDQo+ICAtIExpbmsgdG8gdjI6IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MjYxODMwMTYuMzUw
MTMwNy0xLWVsc29uLnNlcnJhb0Bvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5R19wZyFlZ0tX
ZzE3OXd2M01ZSGdnemF2RlItemRHM0dxNkdKak42R0JpMkFnbFNoSDJSWFF4WEhMR2pUSEV0MGd6
ZFpqZGdfY0l5V1dhd1hPS0psaEZhSktVRmtNNkVHTGJGMXokIA0KPiANCj4gQ2hhbmdlcyBpbiB2
MjoNCj4gIC0gUmVtb3ZlZCBub3RpZmllciB1bnJlZ2lzdHJhdGlvbiBmcm9tIHRoZSB2YnVzX2Ry
YXcgd29yayBmdW5jdGlvbiB0bw0KPiAgICBhdm9pZCBhIHJhY2Ugd2l0aCByZW1vdmUgY2FsbGJh
Y2suDQo+ICAtIEFkZGVkIGFuIGVhcmx5IHBzeSByZWdpc3RyYXRpb24gY2hlY2sgaW4gdGhlIG5v
dGlmaWVyIGNhbGxiYWNrLg0KPiAgLSBNb3ZlZCBwb3dlciBzdXBwbHkgcmVnaXN0cmF0aW9uIGNo
ZWNrIGFmdGVyIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbg0KPiAgICBpbiBkd2MzX2dldF91c2JfcG93
ZXJfc3VwcGx5KCkgdG8gYWRkcmVzcyB0aGUgcmFjZSBpZGVudGlmaWVkIGluIHYxLg0KPiAgLSBM
aW5rIHRvIHYxOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYwNDA3MjMyNDEwLjQxMDE0NTUtMS1lbHNvbi5zZXJyYW9Ab3NzLnF1YWxj
b21tLmNvbS9fXzshIUE0RjJSOUdfcGchZWdLV2cxNzl3djNNWUhnZ3phdkZSLXpkRzNHcTZHSmpO
NkdCaTJBZ2xTaEgyUlhReFhITEdqVEhFdDBnemRaamRnX2NJeVdXYXdYT0tKbGhGYUpLVUZrTTZK
V09jLTFvJCANCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgIHwgOTkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaCAgIHwgIDYgKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTUgKysrKyst
DQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkN
Cj4gDQoNClsuLi5dDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggZTBkZWU5ZDI4NzQwLi5kNzIyZDNmMTQw
MmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC02NzcsNiArNjc3LDggQEANCj4gIC8qIEZvcmNlIEdl
bjEgc3BlZWQgb24gR2VuMiBsaW5rICovDQo+ICAjZGVmaW5lIERXQzNfTExVQ1RMX0ZPUkNFX0dF
TjEJCUJJVCgxMCkNCj4gIA0KPiArI2RlZmluZSBEV0MzX0NVUlJFTlRfVU5TUEVDSUZJRUQJVUlO
VF9NQVgNCg0KV291bGQgYmUgbmljZSBpZiB3ZSBjYW4gcGxhY2UgdGhpcyBtYWNybyByaWdodCB1
bmRlciB0aGUgY3VycmVudF9saW1pdA0KZmllbGQgb2YgdGhlIGR3YzMgc3RydWN0Lg0KDQpCdXQg
SSBrbm93IGl0J3MgbWlub3IgYW5kIG5vdCBhIGJsb2NrZXIgZm9yIHRoaXMgcGF0Y2gsIHNvIGZl
ZWwgZnJlZSB0bw0KaWdub3JlIHRoaXMgY29tbWVudCBpZiB5b3UgdGhpbmsgaXQncyBub3Qgd29y
dGggdGhlIGNoYW5nZS4NCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5
bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
