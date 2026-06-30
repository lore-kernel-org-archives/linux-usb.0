Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BD740D587;
	Tue, 30 Jun 2026 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779672; cv=fail; b=bGqfVFXqQgpnbWDl1I1HWkYs1RQO2Q048ErK9MPXGOHLwG6Bv0vY5fkKXRX2dRzzW8mCa8RqU/Xauy4R6QgT8BlsRNtzze5EedpvGgWfoFaF0XwWTCTen7HvrJ2mZmmldVNff9nEvuLLqDMbR3ps8T1OoHgEPGZKrXv0Kvd7cXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779672; c=relaxed/simple;
	bh=L/77v74a6G8sM6af98bF0IfldHA9bpb7yJH+WZGHR/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fNcJw+3qaWkFo7097fwZ/m3myZepkxGc1omzFcpmdbpp3Ej8zCoQfY3Xh0bQiLKFzpWCYdIH+28lSfk+6q5dVqsb660b7bk1Cl4pKfZkF72ghj1QBBoOCLrsnwMskOr2IbWaQJnAr0DY4zKBo0xy4LXnk1bbJnP/nxcyyENVoOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sYt4HMvo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cFId0NP5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DFyLkSPI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sYt4HMvo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cFId0NP5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DFyLkSPI"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKgG983114758;
	Mon, 29 Jun 2026 17:34:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=L/77v74a6G8sM6af98bF0IfldHA9bpb7yJH+WZGHR/0=; b=
	sYt4HMvoMw9J/3O80WiQZOchWVOrgXLnooaEUm9hG8yezuHaSUstcw4Tp46sHnk6
	vl2tKbXQVhbnNCJy87+heU2y/L5rHKUkjkMi4OYpjolSEJaQoIIw5K8lx7vjocuQ
	jeUFNvU3iYvRhommhdoSN/Hfb3gC3N7bO3cdoN1BUYKDSCg15GCEKKg4JadM14bC
	43pSG6O6ebyibhV8QLgHB55rEinyAQ2oOfo0ACCr2JFtanJsC1rBKyOL8fgvC56e
	MN8y1QFpW1IC9kLvhlVo/rnXXTyUkJYKJ1DlNvOUUK1nak0Kowi2s9Vj0tWHMav1
	M3FyNhLyp1FOgM/6DHhfiw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4f3qyawww4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 17:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782779647; bh=L/77v74a6G8sM6af98bF0IfldHA9bpb7yJH+WZGHR/0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cFId0NP5TVewzeoyERvHO3+ALvcZnNH+a7nW3Ni+LTUqk2iCaKE4fhlXo8F/sOOUV
	 WaOcV17/2bF+sJ+Ppvrw9WP3ZOxuWqYA45ZZy2woSEKLO37cce6mAUGIVGPiEhue2i
	 3URb0ZU62E2qk49jBCAh/BGalqhkbalQVhLksLYebZagMaUahq9iTgdE9Uy6KlXrEC
	 5VjLcBAO0v50qN9JF2KwpiUD0TP7V12CXQJoFpYnGuZDTFnWzDKJ0cHaHQGqAVwZYm
	 1oixlN+bBnq4KE8g0H1cNrbpeEKjeS5Glb09ct6v6c3AP+ONI1QzoAYaQXjp8Rv/KJ
	 tKPH13O/SN0HA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15F4A4011C;
	Tue, 30 Jun 2026 00:34:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6DC04A00C6;
	Tue, 30 Jun 2026 00:34:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DFyLkSPI;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00101.outbound.protection.outlook.com [40.93.13.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6CA1540134;
	Tue, 30 Jun 2026 00:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBCLvKZGixAIj7chAE5j+rQFGF+h4qoXXuSzYcJFNsz1IW1aJgCyzgDDSbSGN/FPsQHSPqDKU/FnaYBqT3oaivHBSWrymaCWx1Xj8fARLV3L7HmgXwKiTLAh8nS3mkm1AYaH9YHsHpYxIXB4yskMIMWDBPWkE1O77v1lhMJEGI8YwRNsosT4bQToDE74xOaZbSnv43U1Ae8EjZKilZ9kmm+W0RsWVhV5OQERsx6Zpj7oNX4SXIPHIQLWW76+DNCyOPJUIACusAQ4N0MlR7zYYpRYAbjhr3Z4lcC3fJPR4vfBxHjVXVgB/JvNCHj6ylpwh8vlZ03R65KjL2wqPkVvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/77v74a6G8sM6af98bF0IfldHA9bpb7yJH+WZGHR/0=;
 b=q3Y0johChqgXilsuqYDOjTThasEZYhSK28UtRbKFETaNBf0J2181FCBARMyQLx4lC0rR2XUXzdO6seE7AB0/Y2n+4ZHfLI+GY3xnSuQo67RNO8g08lymSfVrlc9PIxNfJ6vnRnu5Ya/8t5LXAJRIphJXoMU6Z30mBRnbKGd2TkVgohuBe8ntH5PxLYobYee3dlydkyL7sw4tlZSgIGSJ07g8Tk7/7xdL8hBPmsNcQ/3hnBTJFZwtNB26ZHjsXKXQjoZZT8hsHGUCyeyuBC3SCYNUqR4F401e1W5jUvQu95VxY2VEFkVGcNzih7Mrie3T+hlnvvlD46gmsrd3PPmn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/77v74a6G8sM6af98bF0IfldHA9bpb7yJH+WZGHR/0=;
 b=DFyLkSPIgPq1U81f7/kE17wg7xs6kweU/qnB3HFXUm9j3k/I7IlzypfS+5SjjewLxj/K1jdmFsNnfqL1DxDoEPrarqMsdIA7F+phP83kJ9nMqrqL7MrbTpzxZYTMxFvKBtrXJLvDG2iMyDAj/MVZGoRMAKs2xBSTo6f+nJUHPws=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Tue, 30 Jun
 2026 00:33:59 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Tue, 30 Jun 2026
 00:33:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in
 dwc3_ulpi_setup()
Thread-Topic: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls
 in dwc3_ulpi_setup()
Thread-Index: AQHdB7u43lXLwd6XhEK3cBkykRC+xrZWQM6A
Date: Tue, 30 Jun 2026 00:33:59 +0000
Message-ID: <akMN80H0YcZU_LYd@vbox>
References: <20260629113737.1240285-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260629113737.1240285-1-ben.dooks@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SA3PR12MB8764:EE_
x-ms-office365-filtering-correlation-id: 6b33932e-e7fa-4b87-ad0d-08ded63f46cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 avwlsDO6eNoOxc/IPYIV7+u0ceDV1+Ny076KDe2gJF3sKq160G3d/PqSjAbomxIEQ7gix4ITt870/Mqgdenq26KTBNiT/cCF43863uK4Fxo/W1mqbnZHAsTaV/fKqqWRrjTf3bWsXkRmRfARogHvc8noNl4iQmCtlM4UT04MnVKw0daioh5acbca08ipDzkizUy6fqpowqSdzcA0XPFgO0y+rsQViLVa57bca/ZAupKBgKZsF1uAi+NnT3ES6Hup2zY4eJS3SAR3XVpdGUh9TGiGrvB8XRHfGmmj5g5VhpucjLTtRpt1QTPhpjDCUhdbgqKQHdFXQWrghzcpxv8qvp9o+8SPlPyUhPB8Q+zlWs8L0UwgrIKB1r/idNI+PFhTbln/R7mJYY7Lo2MquceM/hDqCx+wg0FdnbrCOAmbZhCmXnmkFLQtCeGzqM58xLoNq7n7aLd6KKiEAtIHGFAlLsjDwvSB28+2/L8q1EXw/gKni7dYUQubbwgY6ITbky0jqSM5FSgMWtGs492XQ0mp7jx1HhEdrOGZE8GzDH9aDJVBuvkGAX5Wvw9fWw0AamXVgs+ORXFtkGTwG18Q9A/bz5Lmbj9UY5liQaAmtehqNik/2GRQSPjDO6Zj7ETl+ulq3tsaCn0rJpmO3bxjVzAiMHVAbwY/25Ak7p3/Gl7NquzVltdaLeyPfZ+dfBJR3CawbY/1XBs2L/nyCCTBvzBMvrR8SBp6jmZfKrg0xvfvsvs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFB2T1FJNU5XT21MWU5DQjRjYlFFdGxtK2plSWhFajdzYmR1aUNrWWNtaW9E?=
 =?utf-8?B?RHoxd2RxUTdqOWlQd2dGcVJwc29ScFpaSFZtWU5jK0Q1TVdCSGI3U0EybmNp?=
 =?utf-8?B?aG50blFVY3pjbEp6aW5TVFQydTl3REVjdGpDNzlQaG5CSmhqTFJwK1lWZEpI?=
 =?utf-8?B?M3hDRk45SmR2ZDdwQTl5eXNiZ09pRmlTUnRDazM2K1JKU01Tazd5ejdkekJo?=
 =?utf-8?B?U0UyWWd3THpCWmNMSTZjNStPZ0RYQTBYdWVDU2I2YmF4d3hrRUtJTHk3SkpH?=
 =?utf-8?B?TEVucUZJRVBCY3JHc0dNbmM1K09rR1VlQTVoY0dGZWpPb1YrVlVqUmdiVVp2?=
 =?utf-8?B?RzRiVEE0UDdoRUNBN0JPTzRWeTNoZjVhQU1vNHhQT2lkSWtTSzJkdWZOOHVH?=
 =?utf-8?B?ZWhsNTd6blBjSTZXeitVdmE5b1hsb1hMQ0U2MTZpeFcweXZCMVpQdlIzSlZI?=
 =?utf-8?B?YXRLbElkSnZ6UzNWdC80QnNSenBOOFRoaUpiWHB6ZVM0VDlQeXRSSjBITFc3?=
 =?utf-8?B?ZnB4NFlrazNnY3dmMUhXb28wRlZMWGlUVXdZVmxQL2V4U0hpTTlnZ2lKby9W?=
 =?utf-8?B?VHA3U1QxSnVJMlpxckxWcSsyWTY2eGdNNEgycG45bzhCTjBCVmZqS3FxWTdm?=
 =?utf-8?B?S2tnRExOUTV0Z01CQXZ0WjVHWTVxS0dmNXl3TkVxR0lQNzVHSnZSNmVneGl5?=
 =?utf-8?B?c3lNN2ltTVh1V2pqRm94VFpXRkZOcm1xL2J5dW9zL1g5ZkxLL3NQd242YVFO?=
 =?utf-8?B?SEs3WWJhdmIydnFtQ1FHMFZBL0pMVXk0bmYwYWJ1dU5XcXVud1k1OFc5Q2dj?=
 =?utf-8?B?SUZKQkYwTUhmeGN3OHFINHdZVlJ5UTBsRGJ2dU5nS2hweTVjbGxvc2M0WkE1?=
 =?utf-8?B?NmI1bUN6M2JWNGdtSkVXeFcyK1U0OFRjQkVVdzFvRFZvSkxCem9CamNiZjJS?=
 =?utf-8?B?aXFoUjdmUndGY1B6ZmRjMEZWb2RCcWl3QytIcGJiQlJaMzNGTTJBdWJNbVQz?=
 =?utf-8?B?VzRJVjhMZmF2ZFJEeGtJK1FLSERKb2wxQit4RnlBbTRhSjhSa1NXejN3a2pO?=
 =?utf-8?B?elZVVFZJVzVjRXkycGJDV3hDZndlVDFqL3NiZXRWWC9MVjduY2dNSHdteDQ0?=
 =?utf-8?B?NnpxaHlSMFVuNzcySHBQMng5UjB5VkhxdVVGeEFveExEaGh6Ny9KWHBrNllH?=
 =?utf-8?B?bDgweWdVWmhkdnVUMlJQL3A1ZHhjdW0vbCtYanBScnU3amtJSExDTTRqY28w?=
 =?utf-8?B?RmQvdThsNHRLRWUvcmtwTWV4L2F2WTZRYXQ0b0pXblAwWG9QU3NqTDM4TnN5?=
 =?utf-8?B?OFVXWFNTaW56SHhCVWZ2TnROT2xDMFF2cFdQUWNyWXR3Z0ZlU0Y0Uktvbys0?=
 =?utf-8?B?LzBzTlJGTkd0Z2d4Vy9jeEwrYy9vOExLeTAreUtLMlZnNUNzVllkT2FETlNj?=
 =?utf-8?B?ZVNDMlpCRVRWRGNGZWN3T1Q5YU9TdHFZRy9KNmZCYzEvRDMrcS84M1hhTFpZ?=
 =?utf-8?B?UklYcHorRWdjc1p5LzhJVWZHdTFzRzk1Y3N5NWJXVU9vaThYVFdwOHR4dVpO?=
 =?utf-8?B?QUdVNyttUHpWaFRqNHpuUGVLMmNwdmVrTzlYUmdnSmdLblk3TWRPblJNWXdr?=
 =?utf-8?B?VlkzSWFreGZBOUJ5NUNabkpyZW1lRy9jeXl2WmlKU2hnbTZEQmdYa2NvRTZK?=
 =?utf-8?B?Qjk2RE1KN0NCZ2lJb0xkUGxKTGYrVUg5dGQwT0V3a1A4YVVsT2Q0WnBvMmZX?=
 =?utf-8?B?QUxkK1AxV0dlb2hnOHZJczBlaDljbXZGU1FXbTV1SHpjWVlzMWpXOVBpVkFJ?=
 =?utf-8?B?REIrYk5vUzRDeXdUZDFzeHQzbU90ckVrblhOZVY5NFErV08vZWNCUmVmQlRk?=
 =?utf-8?B?Yzc5dklRa3BmRExMRUI2elRsajRkdkJPaVZkaHQvODJrbkxXbnNwL05FMGNw?=
 =?utf-8?B?bGdaYjZwMHRSUkk0V0VFVGpOWjd5QTdsSEdzT2dKRmlON2ZicVBybUZnQXZn?=
 =?utf-8?B?U2pkN1VTVUw2Y0pmbDNKcWViZEVNNjFhWWprRlFvL21PdEVXL1FaLzVwWGFZ?=
 =?utf-8?B?aVVxL3JQOXZHRERxaURIeEpFaTZ5R1ZhZ2kzM3FkMlpDTVlnbHVQZFhFVjUz?=
 =?utf-8?B?UWM0NjRsVFA0WG10TXNzeWt4eDloQmVNZ1ZCWFFTNzRiaHBnYUdPRW1ZV1lx?=
 =?utf-8?B?NnNMd20rRFB6QUZ4aUhSRjQ1NUhvTmxKZmRxZkltekNyaFl4dnNRUUdMQ0p0?=
 =?utf-8?B?Y0dzMTdtUkRVVWduZDNPNGlkRGczNWFoT3c1NktuRGRvY1QxTWhOc1VRbXUy?=
 =?utf-8?B?ZVgrNEtYaFlyUEVCMHNlWWRuWFZMbmw1MXNCVDBmeWIyckZxeDFoQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <016270636BE5A34294558370B18B5E3F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	et5r5K9C8ODefUNXULu00Ehu2OfE5FA+krKERW4BbHx+dbqrbqTekWqqu0Ui27vWPa6sWJBsG3lv6s9tPnTt8SkAAP8c4sGArCpIbUsk52sixPet4cz7WgulzwAmurN0A6bGKq51nrzy9Iln2VMUspgJKKieoiQwX4iKIWE3OEAavDO3HZLm4jLmNq9QaQxG3uLT3tQisNk9nBn0zo1+cu537Sz2ORD2j0F4AzmD02LSCpIeSQxJBGQHLpRALFkiHZ0UqOBKcSrg75hKZw6tTah/JCXPMQA7ugDdxEx+FRsQKIwgLrjO/I3U0GK2g4zzoYKjgAHJktHjQ1b2pv/1vA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bghO/cbaAtxHDdXrhzmr4l82uE1/k4duqNyjIeuQyeLbz2fRr9IR35Xp/9oudh7H4/kEylkwtVxlJ25m2HWp71uBD/lOXVy4Necr03vsDRIOjwuTQyQZdUTrXCVy2b812ERSqKU/VlPxveKe/WKBowldCkS3V3m6FRxpv6LfgCBReolG00DvFM2ZMzujkebw2zsIy3vXblb/yAUjwRTOf3KJ+25noxuIBCpix48A53X2wjjcub0dFZFbMLcWWrRUS2118SB4ZK/62dxFWlDTqjLQHBKiliE9NZ+PDtkxI9chj3mr8i4Zp9XrVrgMEvrc0kyK9zz/tfx1/g9sHyUjONnBl2pcrtLaHTXVC4MZWYrk0QtECgLhs2TijLQZJah0pfFTbrsqDreBa+69m/qZakcL9biDTaxJumj9hbkNFN8cGmqw1R7vSEAQe4N4EsUXpq/xghMvO+Lsb27eTa0WzF9uMyEYfDDkfOP58jWbW8kUt9fu7YL0uTVDDQk+46CrKNv1riu6N/xZQB77zp+D9DAljZXtpr11hlR+HOQwwOF3nHS0i51KKNYTW8GNpvYCQliTNtaHv6B8E3MkOXsrn2ydgUbdmaYmwnj/3cAtXi6UTyqUcVylZzyHU5Z2C+eE1v0UwR3in1Cj0AoYyY6koA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b33932e-e7fa-4b87-ad0d-08ded63f46cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 00:33:59.1951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G2zEZigqA9ilki5I52TXhezPvQ77Rk7Sj0p4FKmE7Vf0GyxksYuI4irCtekDrRcfEO1EyHJEqw6KHPz1KokUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764
X-Proofpoint-ORIG-GUID: GorQZs4VdDXthkdArxVVb8PYiGF_-t7K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwMiBTYWx0ZWRfX3bpFnyKfXiA2
 vpmRBjO9elagE6COn780mqC7Z7SiDdqHT2ZeAyKlNHHCEUlyX6DjhmgoVfeQ6NduA/HSj/TDyFJ
 OFtl1IhhQLb6sGQn7B2JeNIzdFfSTIY=
X-Proofpoint-GUID: GorQZs4VdDXthkdArxVVb8PYiGF_-t7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwMiBTYWx0ZWRfX/0EYOAwioDGA
 q/UnqocYP/p5P3LqeMmxGnZPYg/7Sq+dHIgVtAhwnUt5NbkQOmSVmNGLFQ6lci8nvCh7P+WmmIv
 J638Xg879zglQD7BUWhX5KbpjWPv2FUOHKboinT4M3cDIzq1IcW7ftzX1OFvQ73ka0QrNzODEAh
 z2z4SCb5IRTotlqH295nnFNw/k2TGJ8NvovQjdSRDpLakr/82+rKwuwq54epKqyNUi1MNpeLM16
 BEJA5AakFgij0qNxyMJw8lpvcdg59pWJ/mkJTpoMV3LhlTmqX8NrqiTM0NQrTc1/cq7QmECWd72
 hw7KGASeyABePRZP9fdcjhjF99G8aP5xLDjcdqlBev38iZtChLfYf7G+xKx532VYTAFg78/9pXp
 vu2R60ItV+rgQOuX/G9xGVirKePZOPrD5B1ct3D7NAvRoXx00DuOxNzfRKhPHOsq/HsdcxEBd/6
 3JYfTlm2e+wcDx4wpXg==
X-Authority-Analysis: v=2.4 cv=fs7sol4f c=1 sm=1 tr=0 ts=6a430f00 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=1EsaE_6oAAAA:8 a=0oVpXeTpRItWpEum_UYA:9
 a=QEXdDO2ut3YA:10 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606300002

T24gTW9uLCBKdW4gMjksIDIwMjYsIEJlbiBEb29rcyB3cm90ZToNCj4gVGhlIGR3YzNfdWxwaV9z
ZXR1cCgpIGNhbGxzIHRoZSByZWdpc3RlciByZWFkIGFuZCB3cml0ZSBjYWxscyB3aXRoDQo+IGR3
YzMtPnJlZ3Mgd2hlbiBib3RoIHRoZXNlIGNhbGxzIHRha2UgdGhlIGR3YzMgc3RydWN0dXJlIGRp
cmVjdGx5Lg0KPiANCj4gQ2huYWdlIHRoZXNlIHR3byBjYWxscyB0byBmaXggdGhlIGZvbGxvd2lu
ZyBzcGFyc2Ugd2FybmluZywgYW5kDQo+IHBvc3NpYmx5IGEgbmFzdHkgYnVnIGluIHRoZSBkd2Mz
X3VscGlfc2V0dXAoKSBjb2RlOg0KPiANCj4gZHJpdmVycy91c2IvZHdjMy9jb3JlLmM6Nzk2OjQ1
OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAxIChkaWZmZXJlbnQgYWRkcmVz
cyBzcGFjZXMpDQo+IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jOjc5Njo0NTogICAgZXhwZWN0ZWQg
c3RydWN0IGR3YzMgKmR3Yw0KPiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYzo3OTY6NDU6ICAgIGdv
dCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICpyZWdzDQo+IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5j
Ojc5ODo0MDogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50
IGFkZHJlc3Mgc3BhY2VzKQ0KPiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYzo3OTg6NDA6ICAgIGV4
cGVjdGVkIHN0cnVjdCBkd2MzICpkd2MNCj4gZHJpdmVycy91c2IvZHdjMy9jb3JlLmM6Nzk4OjQw
OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gX19pb21lbSAqcmVncw0KPiANCj4gQ2M6IHN0YWJsZUBr
ZXJuZWwub3JnDQo+IEZpeGVzOiBkY2RjM2YzOTllM2IgKCJ1c2I6IGR3YzM6IFN1cHBvcnQgVVNC
MzM0MHggVUxQSSBQSFkgaGlnaC1zcGVlZCBuZWdvdGlhdGlvbi4iKQ0KDQpUaGlzIHBhdGNoIHNo
b3VsZCBiZSB2MywgYW5kIHRoZSBGaXhlcyB0YWcgc2hvdWxkIGJlIHBvaW50aW5nIHRvIA0KOWFj
Y2M2OGIxY2YwICgidXNiOiBkd2MzOiBBZGQgZHdjIHBvaW50ZXIgdG8gZHdjM19yZWFkbC93cml0
ZWwiKQ0KDQpUaGFua3MsDQpUaGluaA0KDQo+IEFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRv
b2tzQGNvZGV0aGluay5jby51az4NCj4gLS0tDQo+IHYyOiBhZGQgZml4ZXMgYW5kIGNjIHRvIHN0
YWJsZQ0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgNCArKy0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA=
