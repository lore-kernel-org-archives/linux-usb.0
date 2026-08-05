Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F383BCD05;
	Wed,  5 Aug 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968388; cv=fail; b=Zaa78ErRAw8FxYoFNtwcNaGIYrVHT8gqFwPCj66/hX34v8Z5sP5KTUZU6g1w0X3GLp78Cho/ulPrhy7IIFxPkOHa8olw/0+LuwPLOsNJlKf/0zqq+HtzmaQiqctDDRJXpV9Le1qOeyIR2kk0JTxgiZRmmtQEIs+maBeEWq+0/8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968388; c=relaxed/simple;
	bh=hY00jVWWnGlutXgDdUnUsi3Z1t4SDZedjHDHnaIDZ2w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B9DkwjTwGKiq3RfocmS/9mQ0cpfjydK3/pJEGs672W6TpykeuNiQRgOf10KgUy+6PXg15qPybLPoDAagRKb85r8b72nwAcvAoQ+7F+INxEm1IKCEOixAhdTPNXiebETvQnHMrUbxa5JF9GGzXiXg4SRbkTXx1reEZEQI1rBLo+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L/KsMeNA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EEgWSUNh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vNrst3SK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L/KsMeNA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EEgWSUNh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vNrst3SK"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HTBm44191918;
	Wed, 5 Aug 2026 15:19:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=hY00jVWWnGlutXgDdUnUsi3Z1t4SDZedjHDHnaIDZ2w=; b=
	L/KsMeNA1KxYEMy5Je7ePvlNa5oJJcJYnehaMIRrSg/63HVF/faUNRj7E7j7f3Pf
	mpBhUAApFNUvltv9nP7S16HufUAOmjjR8nmhUuWV9EZTVv5QFqb2hjvOf6whwKiN
	FzcSUF8+8CcxrbXvj8z9+CfJ+xnHTAicX5YfkXPztrSP/F9nRcdtskSysIbCN4li
	IfigwRfMqA2jQnpJVIUxL8k6tfe+7GlZclKbHbJ/bXBPQP+BhJtpY8Lc45amYY0a
	I4x3K/J2hhVL0APKXVeNPjcmO/79hGBtVEdmSrH/9m2XaSzJQGC0tctuVvyJsa5g
	KXfw6J+R3VzS5yQoKapylA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fv782c716-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785968363; bh=hY00jVWWnGlutXgDdUnUsi3Z1t4SDZedjHDHnaIDZ2w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EEgWSUNhJa7NMRXxDs9AyxkzRbvgTP/Kte3XteB2TMCAqqOBiD7mPHqnDAv7JZcug
	 8Kc7GNyivk+poVg7jYGTi0hCWDYSztajaFl/iSZo3rm9gc+zWko8AX+ptzwX9ZUraZ
	 dWhwXFhfns8relOOBQmOm1FjkleEEieyZGOckJr9eweleUotgePAkynX2t8o4aSjBA
	 XwbLwiGl7+0/iGWbm6s2nm/BZLP0+OXrnCNUpkEDTTIsDZIjD4ps/NqfsLyWgXrSSe
	 pWBkqq/j28Il0YyBFSV918Dslckc698NngsVmqxmVchma3f7ESURlEBhdOh8DBgIwh
	 drG1V2KqIkA4w==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 785E2401A7;
	Wed,  5 Aug 2026 22:19:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 91694A00B0;
	Wed,  5 Aug 2026 22:19:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vNrst3SK;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00606.outbound.protection.outlook.com [40.93.23.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2111E405BB;
	Wed,  5 Aug 2026 22:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNxFrmLyd3tZtyPNI+xJWWNxPnAXMyh+GBugUQagyZW2wNfN/XLiYi3wjj2dmitjKwz+FHWl1jIB8fJkq+HTpwQ3Cd9fcSBqSa+VnH2Pg1+UcEJL7Rw1pJbgA25GvOb0+fMDp8/ZLI5AztyI6myrNG5KWG5iUl0M47GDWerIRXaQjqNbZP2CLyfOKQ+IucF4TyhV9voM3UHXkEB7hI4sumgE4zJkqcgo5yU+nEsicynMfBSxTz3VhvNZwBkRVO/g3AvhEPANjE9w3UAuOUQ466msr89F1D3DvbjufgfS/ere7PYC9vsr8IUN0oUgJY5MyVEECjYmTwzSai+Pa+KUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY00jVWWnGlutXgDdUnUsi3Z1t4SDZedjHDHnaIDZ2w=;
 b=kwFi2xOswabOYW37TkzHXE12V1OOPZZ3cQFgzwqQOLFHNrBhSfiIKxCB69MreLe+coAlWkdQrVyrEPLyXY5BW2d9dkB3tRNhgzoVLLGsTDe400IteAy64nH3SDSISSZe/YIBt6dNWAAml4D+BiGis6YJEumH9R62JrVvzo5aOL9pApcZH79tC8/tZI2qmuT5ENJ+3OwamhwiCsZg5Z6ypNWYzs2WBx2RI4EP4wpmWCGJuOWrdd7IjdHpdl/0fOnTF0TgS6TvFWq00BElfHAMziL8saVYdsSaUiMTlXUM4R0X4M8brfhUxUHHSNl8PKGnEDtHBlKqpPkKiZ0dIvbhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY00jVWWnGlutXgDdUnUsi3Z1t4SDZedjHDHnaIDZ2w=;
 b=vNrst3SKEERHqWJoQCJVL3KjaPMJxEsrm7wyGzPEQdz3SoDcIeL8e/2Ly8xzE6f5dx3gY3D9cPSq1YJPu6DBJj0NP8Ck89NA3OD9hc3gqHU7QJRcfrHutvu2YdoVb663G+WfTz/bRr8yPlXvH9R43H2WesRQ1iOkk9/xO862LRI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DSVPR12MB999174.namprd12.prod.outlook.com (2603:10b6:8:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:19:17 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:19:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 30 (usb/dwc3/)
Thread-Topic: linux-next: Tree for Jul 30 (usb/dwc3/)
Thread-Index: AQHdIHBwjWU92wG+MkiS0EyZPo6lEraOqgCAgAEuFACAADfyAA==
Date: Wed, 5 Aug 2026 22:19:16 +0000
Message-ID: <anO2l5QxN8WN0GYb@vbox>
References: <amtnlbQl2KLongvo@sirena.org.uk>
 <a9dd53b3-0666-404a-99e0-76617ae3f944@infradead.org> <anKJB0fmgBNEPdtK@vbox>
 <b7c0326d-0e36-46b9-adb8-5ae328d82c08@oss.qualcomm.com>
In-Reply-To: <b7c0326d-0e36-46b9-adb8-5ae328d82c08@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DSVPR12MB999174:EE_
x-ms-office365-filtering-correlation-id: 31924453-ec61-4cf5-8b43-08def33f96c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|10067099003|4133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 9JUghQGoxqSpzIluJZUSxbZTlJ7opisU007VBKlJeRzkVOknrr2PsJhAYtQrruIMbSbwYcxHNJuUmgR+/Td2wfCIzYxIo0uIvJMSpMS4KrU7mEA5Ls3q7C2wOhtPRvNa7/M9lsslOgaFLGibvJD8OoXyMnHbrPCKcTqqsIQ9F9Km+3uh73NvajoAfk1GsdgyvcJwxTiXZ1up+4yrxGj98MT4t1eXw9jsMja3/w1/i51kfE05ne/Fjc8Nbu9j4joAKnvA+ChTgkkPsYFjp8FZJVOVfe99PBSBiSQd2fCi//SL9fplno14NDUxPI2BAnWDAvf6DoqdrViFGrNtV3esxqR8jx57h60IqFx/GYXGp5GNl+pfCrkPclbScDVUw2GvPumuEP2hJnxMB3mr6HJtSs+JxZroGLhHUWEAKo6wG4Bo2nCVJ4SFbAqjcqUNxR7zemIKRieE2gtQ11g2KhchC7bk5m30VPcvbQkUNJiPcbxCEk25G+Cen0C2vr5bqjq5tJbxOdA1FYyJVVLYsByb2P6ySLrC3+UEHZhHJLuHc9UI8llNR0tkHbHFiylntY9o9d9tkVkJDWi1ihM5loHFASltcQ5dDbAxvyFVtZAOSGQO85ODMglgaps/DwlPt/Uz2OEnJIzi/JQyJYHCKcvmImCV63VUizP9eMFSfvzjDjzDHl2BUWjaVodSCcBLTjR2PsGdoLGyTkEkZ7h02mkmGpFfv1Ag/gEHBD0zavFnKq0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(4133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmlqRXlyTDZIaXZ1Z2p2ZU93aGhETzRobmpjY1lCOFVEMGZxU1czMi8wSG9m?=
 =?utf-8?B?aDZPL3g2SmRzTFd1cGpuM2QvZ3ZOOUNRbThJQnc0RWZmdTFTWEVMczZaQnlT?=
 =?utf-8?B?elJuRG51VXlQVEdEeWFsR0pjUUM3RXhTOC9TWmp1QWNjT1RPM3JZd1daVE5V?=
 =?utf-8?B?LzhNd25ZNW53bmg1aEVJVXFiaklReFVjaTZCaWZ1dDRNV20yT3ZnVlFYaWRa?=
 =?utf-8?B?QkxnSElpMUt3SnhrNDhUdE1VRTJVTHNVNmFXTmEzNmxYc3lvS1hieGFtTDlR?=
 =?utf-8?B?M085cHo4RzV0U1R1UVNHNEpwelhvL1pBVUwzbE5IejljYklYWWlOcmVycGgz?=
 =?utf-8?B?WjVLa2xBYnZOdmNXa3JpY0JNMWhHVzFQVzB2SmdQb2ZYZ2o2WDhGZmlVVG5D?=
 =?utf-8?B?WDdDUlc5eVpEOWdCUlgxVW5NV0xsVy83SW9sak5yNDFpdG8yQlpIcnhDYUFm?=
 =?utf-8?B?UnBMc1NTMENrbHlmZHJTRVIyZzNRTHd2UHlRNGhFa3M5dnM5anNKWmhzZ01n?=
 =?utf-8?B?dmNVb3NlRU1kcE9CaTdPdW16SzJ0Y1BiZy9HY2l3bnJZTG9QRkpQeXBZMmhS?=
 =?utf-8?B?cFF2eE9IVzc3dWE3RHI5Z05nSnZSN3ZZYkVUekoyOUx5MHFRZjdIRXl1M0NO?=
 =?utf-8?B?R0huVU8wSEZoUS9sTEVzc2xWb2dEMHNQcjBnN3RKanQrTlpxSVJQZ05vTVJJ?=
 =?utf-8?B?WldMYmw5STh1Ulhkd0NqQWhFVHpYWmZJc2htYWIvZy95VVZaV29CdllhYkVr?=
 =?utf-8?B?R2cxeVdNVUt0TXF3VzJ1L3llVDRiRUhyU0tQOUxCMW1adFJmd2ZFZjVHYnJI?=
 =?utf-8?B?VkNHbFlZOXMxSTZQUFZ3S1dFQTZPaUZwK29ZT3cyVFVtWHFUSld0TEJyVVRn?=
 =?utf-8?B?ek5SU2huWUtBMDJHK3lWMm1ObEZtTGcvdnFhTnhFdHNzanV5VFZYUzY2dG9j?=
 =?utf-8?B?VlM2UWpSR1BlakoyLzg3Wm1JWnhMMWEzdkF2TlVhTVJhYk9JWjBMeVBES3g4?=
 =?utf-8?B?ZVVGNERIYVgxM2U5UGZvV1FSN3JSZGZmejA3Z3k5MmZtcHhJdExKWmpkSUs5?=
 =?utf-8?B?RWhsUE5NeWlGc041RkVRU0hLMXNpUjY2WFBTOWVkamM3UklzamhFazdjR0dl?=
 =?utf-8?B?eHNNT3pmekRhU0Q4bnRIN0Nmc0xJeFBkQ3VkOUdmMURkcVlvbFoxNU00VU1i?=
 =?utf-8?B?K0g5bHFlVjZLL0hOUy9tZDhRbU1rcGxvRHVIejhIQWRacDFOZjNxS0NhcHFO?=
 =?utf-8?B?VHo5WlVTbFNVNXk4Ny9OdGlOZFFic2VDZXkycWRLT0VlQTAxVWVueGpuYjhZ?=
 =?utf-8?B?cEtjVm9HNkwrb1ZRbnhLN2pXdjZVTUdjWkpWZ2thbTRBdWNiN0FSR2FNVnRa?=
 =?utf-8?B?cFUxVHQ0eEZMSEdRb3lPYWZFeHdOVzB4TmsrWXo4OHgzZ1RTL082Z3djdWxB?=
 =?utf-8?B?MXkxWFovK3huZ2VmR3BGWjQvdktIa2ZvNmlnQkE3eWVVOEcxOGgyMVpGVllo?=
 =?utf-8?B?MGoyRjZ4WS9BbXFzNFZSclllaEpqdTVycHM3Y2JlRUVvVGo0REVkZVNFaFJ4?=
 =?utf-8?B?bjQ3OVZxeVUyYnQ1dURPaE41QThlWHVYczdVSmc3ZjhFT3E0SjNWRFZvM3Nx?=
 =?utf-8?B?bHNMbUtNK1JONGZTbEtHVlVnVXhqOU1YUE95V21LWDJSMzdNa0Ixa2g2OGMx?=
 =?utf-8?B?RHZVS3l5UFVSUitxZExrR2FwcVF6S3VLdDhjSVE1d1orVkM0V1VSUkpDREla?=
 =?utf-8?B?MHFQcmtYSmhrTnB6OFJydGFhRk9hcGpxb0RwQnI5MFgzY3o1QkVTWmw5eE5k?=
 =?utf-8?B?bGNKK2gyVDZadjF1ckNSdUo5UG1CTG1EL3lKTFZKaThTSEU1eHZ4TFI0Q2pG?=
 =?utf-8?B?Z1ZycSs4NWZEMU5YZkFQSlFJVGtCekppSzlmdENZMExsQ3dJTnZQNHN4dHVo?=
 =?utf-8?B?eGVxSVlqQmV5MEZmYUE2TFVWeWZHOUdWRmFQK0Q1TU41SXg0WndyR0tuaGFV?=
 =?utf-8?B?eWRiTktCM3pLNnNrZHdaSzhndkN6SnorRnV0U3ZkSTdPcWwwR201Zzc3ZVFl?=
 =?utf-8?B?QTN1cnByR1RqN0xQdzl4cUVScFBBN25xQUxVQmh1RmFscXVMMTVXM1V0a1RE?=
 =?utf-8?B?aUZDeUhiYWJqSmF0YmFWWERqZ1haZzR1aXlHbVBVNHhYS1d6Nk5lbVQ3Kzds?=
 =?utf-8?B?bVdGL2lMQThOM1VMODV3NTZzYWVHd3RWWUVoY0hHQy9VY3k3SVVkWFlNZk9n?=
 =?utf-8?B?bDRrb0R6cFBqSmlrcExBTCtSM0ZqQTZES1lSN1dtM216VlBiQ3dxZnpEMzdF?=
 =?utf-8?B?aytlZENZSWNRWjlINTNGVDE2YlozREpEZ1hwcDdOUHpXdTAwVkpCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C733B18D0AAD04C9D1422317A66C263@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sleGijajc0ojXUfzYqWQYBKokXbPng5NU2eHGobu3C2ym/g1OdnyFS0FDQoIVem+rwKMw5LfEL3fRW5ZOeD2Kyvr6MUtMhc8MU8awiR7lKBHdyuaz9Www+XBgG7VHevTHPRw7xHDDU+7aNvcg8UrsJqFwqjFu66Qcx1MwXb9Adhah4obhmkc5Lss9qc40zrogmNPUDhKWVr/KGmg5R3tO8ouWs4hyNQEbL0M4/E5fEu3be0DrGdLPjaDNB3UVTzj6d3Vu8Nv1p9U1NeipOrs357jQKfv8fITaJgulmQAijs8Cpqhv4FGFZY4jW8uM6qujoXHypMBZgquWY1Aexl/MA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lmSmdhU7BIakpJge+Tjajd2rijkJ/XPxOICeySiDIr1kcpNwJ2/quTS/mztnerkc+ZN0yW/gK+DU0OOuxAIh/CBK84I4DyJRAtDwl/HL7lMWL60FXKjVa2Uuojzb/vRNYO0levRCz25dSh+M376FOiMDsxXG2v9ZGqzmkBpU8uZq6EbM7cEFvY4YGR7NaqDtdsU/aA3Xb5Ls1BPPTiCZbtK159h7PnrZ/uVNGQEAxE7TL+RO4ldK/7QB3GoHXE7Zu41n6bluRYBeU6JE9wHrayH31DtVCbeYplQxKPkTnZcC6waJwRMfYjbmqlPmxXdPGlmawH1up9H4GtGSHB797C1Zi0pPCgQK+isMGwkEXHB9k1U4PrWtJb5ZM6zzi4ZfxfnmlddDCTNL3Plp8CEJ5ILdwEjB7PIutqwnzsTCRPgp8CskDoMA08kafXKxNQDmHrzfNbjrbEV5Z1iX67RS2OQtC2i8IgrbVGOFrJetbR2frDibRSdc2tWBSTtPWjXi80icPXebC/MDdu3estu46m65H4udGUojc/ihruoMx2XUXwDVqvjnU1etAdye8J0hKH/QYd1sR+AHe0714TgwBLOmbgm8GyNFXL+mFdWDm0AD/qeAC7OBJDi4yoBoviL0deCDzj1dNRouZYzOA0ITIw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31924453-ec61-4cf5-8b43-08def33f96c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 22:19:17.0147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLL9orQ8zwC95TexjrtiUsY7biVoqHdYWtjEC5Ko19GjzpCbGbs/WZ8X7HixwwgJ394P/wOBK+2xniDY1b8v7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4MyBTYWx0ZWRfXxkDui4ZBFjCH
 hIANGm7FxQaaFQYNJdxC3Rzh5GIxf4SJiOJHPW5i/iYRY3XZwYtEAdXRSL9rQXgCImmGkwXhsNl
 N84FoNfIxby+MgZk7CtDxf5VCtRIbtnhsJfUyZs5pIX621u4PssObUQAkRJItmfZLnnjxuVJCBk
 L+0mPXTPbaU54fJQtiFLyLuPVhQi9RM5qVL5rQvB27+LF2P5G5IfwcR1puT10px8OKOCKzuem2c
 MxiPH3k0pZfn5sj3hqjj7yjzlaAlojpX6kWYoxK3oPAPiRSX+yYX95BAX+ksGs/M3j4HaaRa2ag
 JAe2cLGUw2VIyQaAi+ZSGAggeUxcYfffTmmEVcqGeYxGFjbWsPjLsZVvWHVy2COXKcU+EHuOZ7n
 49MueycIGeVe/PkRkEKtnpzGMtcb+JT7GoBlfMvtmFZp0B0d8SNMEaJ5K/C9LCuw8i1i2wZJG6E
 wJAZTPsucUjYEgVCkZQ==
X-Authority-Analysis: v=2.4 cv=dbmwG3Xe c=1 sm=1 tr=0 ts=6a73b6ec cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vAGn2lfP-K2XexCGQ1UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4MyBTYWx0ZWRfXxA2ecZJHeh+0
 VpbZsQdK3zrhssc16NVm+5HEFI8PX3zJKm9AFQCa8Tt5+n7UceqjPi6PpAupefhj4ohGCM9I/n8
 WhMd34s7gpQYeNjZK29J9BvSFvQZln0=
X-Proofpoint-ORIG-GUID: rOCIHyBhNGdcz051Y5pIDP9yQa0vnUfu
X-Proofpoint-GUID: rOCIHyBhNGdcz051Y5pIDP9yQa0vnUfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050183

T24gV2VkLCBBdWcgMDUsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiA4
LzQvMjAyNiA1OjU3IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBKdWwgMzAs
IDIwMjYsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gPj4NCj4gPj4NCj4gPj4gT24gNy8zMC8yNiA4
OjAyIEFNLCBNYXJrIEJyb3duIHdyb3RlOg0KPiA+Pj4gSGkgYWxsLA0KPiA+Pj4NCj4gPj4+IENo
YW5nZXMgc2luY2UgMjAyNjA3Mjk6DQo+ID4+Pg0KPiA+Pg0KPiA+PiBvbiB4ODZfNjQ6DQo+ID4+
IHdoZW4gIyBDT05GSUdfUE9XRVJfU1VQUExZIGlzIG5vdCBzZXQNCj4gPj4NCj4gPj4gRVJST1I6
IG1vZHBvc3Q6ICJwb3dlcl9zdXBwbHlfdW5yZWdfbm90aWZpZXIiIFtkcml2ZXJzL3VzYi9kd2Mz
L2R3YzMua29dIHVuZGVmaW5lZCENCj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJwb3dlcl9zdXBwbHlf
cmVnX25vdGlmaWVyIiBbZHJpdmVycy91c2IvZHdjMy9kd2MzLmtvXSB1bmRlZmluZWQhDQo+ID4+
DQo+ID4+DQo+ID4gDQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmVwb3J0Lg0KPiA+IA0KPiA+IEhp
IEVsc29uLA0KPiA+IA0KPiA+IENhbiB5b3UgaGVscCByZXZpZXcgaWYgdGhpcyBpcyByZWxhdGVk
IHRvIHlvdXIgcmVjZW50IHVwZGF0ZToNCj4gPiA3Yzg3ZWYyN2FmNzkgKCJ1c2I6IGR3YzM6IGF2
b2lkIHByb2JlIGRlZmVycmFsIHdoZW4gVVNCIHBvd2VyIHN1cHBseSBpcyBub3QgYXZhaWxhYmxl
IikNCj4gPiANCj4gSGkgVGhpbmgsDQo+IA0KPiBZZXMsIHRoaXMgaXMgYSBzaWRlIGVmZmVjdCBv
ZiB0aGUgYWJvdmUgdXBkYXRlLg0KPiBJIGhhdmUgcG9zdGVkIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
dG8gYWRkcmVzcyBpdDoNCj4gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4MDUxODU0MDEuMzYyNTUxNC0xLWVsc29uLnNlcnJh
b0Bvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5R19wZyFmVHZJZWF3MGd5bzJSX1dOMHZQNzdv
aGFJUVFrczZfYzVJbERpVFU1ZGZ4MVpfSjBHeDRoSXhXc3lGbHc2bE4yeWs4cDZQbDExZklyZ3Fz
dE1Bd1FnRllaVzd2TmJnel8kIA0KPiANCg0KR3JlYXQhIFRoYW5rIHlvdSBmb3IgdGhlIHF1aWNr
IGZpeCBFbHNvbi4NCg0KQlIsDQpUaGluaA==
