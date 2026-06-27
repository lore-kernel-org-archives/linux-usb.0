Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADF15B998;
	Sat, 27 Jun 2026 00:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782520350; cv=fail; b=jINnnQcaOjNrGZJNtknRwZaalhSxDDXj9bzSIsqfzsiof9jKaKtNwIffoau5FmHIB6qq/NKL/C4Yi1iVXjrJRWa9bcBW/lYYY3mvtMk7jqpCeSWOElwfkzQA36n137wp6Vg5x+YTk5hS3VPA+Xf8rbyKc6TEG+GIFR0/dV3fZTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782520350; c=relaxed/simple;
	bh=3v+YMAhy/JKbWStd7KITlSdljYdNP+UYy571y3LKacc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=smLqlLTVuxqTqJSneFWviGYQK/t2j+1snmbQ8bkam/ITpAUPmGPMw+3DLjQHTtBctljfgvpsnrwGFgEFEG98pPLIohSE5UJ2nbv8BrtThMUl09Ph0ZlbwDWTb5zwI9+d4l2xYgX6Y3yB+xqzwq+wxhYEbMoZrJTqKECWLEQoSKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vOaXuDVd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gjFqDAP+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=os0ACVYf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vOaXuDVd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gjFqDAP+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="os0ACVYf"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QNGu1b1719805;
	Fri, 26 Jun 2026 17:32:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=3v+YMAhy/JKbWStd7KITlSdljYdNP+UYy571y3LKacc=; b=
	vOaXuDVd12eML4dCoCVQROaKxFsM4I/EinGVUhbiLETlpqIwyrP8XN7I9OEBjmIO
	yk8s8F97CklXZdf2s5rcpiejUm0WOzr5CACWjxLLbAGUTtv1ec0SivoXuZm8F0W5
	MB0W5+9oDuhDORTLOw5CH1HtFE9lPFFRIvs3o5V35myXWluMH4fI1dmKpFFHdzzv
	+Om73FRbSTMC/Azdtl/c9mVrNdTBI6na/ESTEVGtkfXNDsBgopb9vz+CypXztCKI
	x34oLzO0zo4nErJRvH9AXKtJexlFktvUq7qM4SaRjr/4IJ1Rb4nEomwauEsPuI53
	YPDzr+T1zrSaieAlk0bSUg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4f1s6cxfkr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782520339; bh=3v+YMAhy/JKbWStd7KITlSdljYdNP+UYy571y3LKacc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gjFqDAP+sPE3KbgzWiOcYchL7NYCpKW66ygTcRv4HhaJ0z/ZIJ2kPxeIzxXe9c+sa
	 QtuefR4IDLCAzYdyIwPe47aphVB060rwcuDOXmwb8UF3nrgPydYoyVTrbHsX53Weg4
	 E+hV5ohaQkz4qKLu18e9dldD1LYtFBV5eHqFlgzyGEN1FdpP+Ze9tRfBAM7yJAO6oa
	 jj0uX0YwAXJZhlbgRRepohxZqbXzEJ7PSC7HGY54iAWlc4OWGFdCZL9KZcJ0l8+FZ4
	 Hb3DwxeArgL8ZhsXa+/2ICVsS6+41n9TrW8jIxqH9fWRmQjXlE8vupvoTMULfSgi6h
	 hmfBs/77JQCUA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E34340122;
	Sat, 27 Jun 2026 00:32:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E8136A006F;
	Sat, 27 Jun 2026 00:32:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=os0ACVYf;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B451F405E7;
	Sat, 27 Jun 2026 00:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd6LIWL0ncdTVZxGLueYDmrp3wo/vgw9aUPPR9xl9qu5rRaI15qniumsJ+JsUkEKbiA2rLibzE/9bDKecLQokQ4rISFU1ESL1qAmnpnILL5a8JV1z0XpUt0AreKUNITUWMPodBUnhdccyXXYneUdeo7glIJ6qrS8HLZfPGX2oA3zvtT4Paiz1dawbLZdvWJVmE5Sf8fZvB66BDXtZ0kO0cyg96b5P3zQSbkNzA8K8wJ1tkhWKSi/mlpyDWqMVN4aD4bGYO+oBTwjMPhXZ5Q9GPLUy5rRi4q6SzIv0SlnRf7yXjmZnsNozUUKNWPPp2MYutCm0s7AcTswvHbHedzVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v+YMAhy/JKbWStd7KITlSdljYdNP+UYy571y3LKacc=;
 b=V2USSiHc24uVq+2IM0toPIBmpL0MZDo/vsUPVoi9ftoBIKgXQs5b/9XsXLsWJFpsDiCdivSX51DEeTueS7YzC9Ys8xsff3s+pW0usASt440jbHNiRrTxcbnxwiItuXo98/uBAwCCbWVX1+2wPN0fyIRa12lftRRZp3imW7uC36nKpX2hk94SQo65phqLTeLgdrhJoaN+xCOwtrF/Jm96zN4390cBO4BwNwHJJH6vuaIEFLLrDLgUEq7Di4QYZugtu+ZknNMVWntpA0I3zJOHnOZBMYKj8pytLCSYjfZ8Byd082L+2bJ6uU3FyucUDSeW2RYV442u1Zn+34ijlbYUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v+YMAhy/JKbWStd7KITlSdljYdNP+UYy571y3LKacc=;
 b=os0ACVYfTvQzyGz5retcWZ/KhGjZXYZHkuzbU5SEtrkZrYAJocnzsukWGkwMJd3BytgGn9GcsM/mqfcpP+ZgF3+697jMI0Q/Oxy0ySOhV3DnGVGqaZE+/V7ifHvGxKC4fYJZFfPch54D993v50CAMPPKXEjUw2NQETGAKIxVkL4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Sat, 27 Jun
 2026 00:32:00 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Sat, 27 Jun 2026
 00:32:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mike Christie <michael.christie@oracle.com>,
        Kees Cook <kees@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: fix remaining nexus NULL dereferences
Thread-Topic: [PATCH] usb: gadget: f_tcm: fix remaining nexus NULL
 dereferences
Thread-Index: AQHc9B88V8PEyYp+lU+Igdb09dYbE7ZRsHsA
Date: Sat, 27 Jun 2026 00:31:59 +0000
Message-ID: <aj8YyBVR90FGSki2@vbox>
References: <20260604123929.1427579-1-lgs201920130244@gmail.com>
In-Reply-To: <20260604123929.1427579-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6812:EE_
x-ms-office365-filtering-correlation-id: 4fca6521-eb0d-47bf-a347-08ded3e3807a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11062099010|22082099003|18002099003|38070700021|11063799006|56012099006|7136999003;
x-microsoft-antispam-message-info:
 K1e/zde+nPROTH8WCJAnnIM6nfO5fWSJzXTF/Zvm1nVak/DcexZDi69/ouy9wbNwpi6YA15TTXX+cQpT6e1ht4UQOe1+2RYckJ+dFn/UrdsNimKz1T/IW4usk/AF0ZppI/VrsD5ovjf8R0Xq8hWQKZ930rTfuEifyadR38Yo1bnDkLAgKKFgpinEv6lcezVQEvA554GVLJ5NQB2XrOwmyvwvVJ7hAZRvuedXcqd0aDAmMh+Y4sDjaBOLyd4fDcOW2E/QPANhB9TNM3PUCxELe1hUPYKHn26mdCVhCdfmQe9Ssl4CvLDVkmHQbunNpxkhzy9O/3KnbpEobUDydxM3Xz0u+p4V8rJ6EhuTtuhlc5mesxA95sVsnftAw+2xjzYuKzO/ZVhlBGFUSfkOwobwftqAvNJcM5hWJNa50OtCSwrsEeI+hnFEqLi5EXGJdsP507Kge88MLTkDYC8SlaiPfmw7AQoOXhaY1kG7SjoRvswSpbNeRAZabKVArBUGaRxMW8OkcihrSG2rgwYFV3DWaHdQqfzZbEoBq/vYMAfnRJ28ldzybwE8tH6LsxrIXKR10+5fQnH4SUY8Kbx/uBBSnuH8/Ta+2K7YjSiF5i23qsGRy/6gpr7fYlGViTN05qxPIMCzEqsvhtZoyusPs8AKVBdAPMLhe3RKmZLiiYIXpisrNnobaj41iWVMmej7jwJfe8qhk7mortD5t0j+AyYrweyagGiRTguT2MSBWDimAnQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11062099010)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(7136999003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3hRbjVTdkZEU29KOXI4aHdOeU43dHZRM1FUNWRKQThBVG5TRWFnTnZnNHlo?=
 =?utf-8?B?MHRYK1BGTTVGa1kvMEtHRHIybnplbHpPVFI0R0QyQXhvZkNLWFJzR1pmRWhC?=
 =?utf-8?B?aFdLQnpDRTlvN0FGSkRGS2tNOVZZS3BBd0dSUk5ydG8vczhrNE1lcGJKUnVj?=
 =?utf-8?B?aSsvWFFhdEt1NG9jN1EzUUJZd1M2eUlsazNSYmJhNGN1TFMvNjVpeGNKR3Iv?=
 =?utf-8?B?VTlSNVdJa1A0bjV5Vzlmd1JSNmM5R1k4NThNaFJFUWoxcXpnUGthMWtFWGJW?=
 =?utf-8?B?ZjZYeVFKa1lmM0IzWHZ1MlY1bnBwRXZBV2MrZmNhdmc0WnFtOTB2d0luaHBL?=
 =?utf-8?B?b2J3emxJVWlHTlRZbkFyUEg4M2RwUE4yamV4TnllS2lDdEw1Ny9aTFpYcENp?=
 =?utf-8?B?NGh1RXlOU2FienBTQzZyNHF0cGRpeHpOKzJ4d2dwUm5Gd2tualpWS0NhYksv?=
 =?utf-8?B?TjZ0eDBYVjhsRFVlMFVHZExJQVZIWGFIQnJnanQ1NTNRS05HOWJFRWUvb1pz?=
 =?utf-8?B?TDZoQzlGYWJDL3dZam4wZWVBb1lqSCtodmplM3p6U1BRKzdOSERjd2xyY21I?=
 =?utf-8?B?U2lYRkI4UVRYOVF5ZWozMDg4bDdwWnJPYjV5Z09kcVQ2ZGltc0R2VjVobEIv?=
 =?utf-8?B?Tmw5VGNBcWd4U0RMTll1UTFFOHNpdXVXeG5MNmwxL29TMXBrenV5UExJMzht?=
 =?utf-8?B?Yk9VZXUzK3J2YjdsSTdWc20wc2lTZWpOaHAvSzBhNVNqc2JYQXQreUoxdUJq?=
 =?utf-8?B?SHJGYkVXcVVDSmpYWUtaa3pGRTNoNFBCTU5WSXQxZmRZQWxVSGNpNzBXMDNG?=
 =?utf-8?B?TmZmcnBIVWpzSEI3dTdzd3ZYNEUvS05xb3ZMQmJaSW9OUWwvWGg0N1BwQVdJ?=
 =?utf-8?B?Y1c4Y2FUamRjaVVldzNxREROSU14VWsrMC9RNG1SeUl5QVlydUZDcG5Bb1Ba?=
 =?utf-8?B?Q1NhS2hGelB5MDA0TVVhY1BSdjYva3l5am5jMFlLVHNUOHBFVC92dVpOWGpo?=
 =?utf-8?B?YlU3NEFYdXRTdDhYdkx5MCtiQVhaTFVHSHo1aHR3TU1FcWZ3SmFqN3liRWww?=
 =?utf-8?B?dVhoQW9yZmE4SFVWV2lRRk9wcDZNaEhTR09oRURqRGszeWV5R2wybkQ0L2J5?=
 =?utf-8?B?bkZORyt3TmNZT2l2WkpwMTdkanBPRGswVHkrVVAyWVdycjJJZUh6UTlzMXda?=
 =?utf-8?B?MFFLK3JsTG11OXBIKytDeW02aG9JZWozc1Y2MFdFK255MDZFeDBhTkxBeXd1?=
 =?utf-8?B?Q3AzclRBY0xGZStDSFIwOXBGczI4VUlMYkNnNVcybk9yWlhGZ3JPZ1lGRStu?=
 =?utf-8?B?bXBWQWxVS0Y0Kyt5eTFKOVpjTVE3Y1FZKzNTWHdKdGhwUmJuUTl0NmU2cGhP?=
 =?utf-8?B?Z3ovbXp1Mk50WDJsQXNJbzMxT2ViNFVQMUtTWDBUdVlSZExDZXZVczc3SUt6?=
 =?utf-8?B?cmJ6RGJWUjdSWVZ4VEEvemtodkR4QXRnZUZjNGt1WnJFMWcwQlFDMFJtMjVW?=
 =?utf-8?B?T3VOU3RLZDZTQzV4aCtUb3VrMTgxeVN1cUo4MzdZamtJc0lPVThTejNuOHFG?=
 =?utf-8?B?K3RnOEh5WmlVU2tDQVFXSDJ6WlliSFo4aVVhV2dMclFWV1NGeEJuQkIxSGxk?=
 =?utf-8?B?Mmg3aHNqbkhyalB6VkNCL2E4YXRsbGFCRnlmWnEySVlmckdxRVgweEwwY0NN?=
 =?utf-8?B?TzU2NkZzbGhzYlRoNEViMkpLT2NXbm94TS9BUDkyL2g2eHVkRkUxNlJaaHk3?=
 =?utf-8?B?ZTFDRVl6R1N4RCtRVUtRWmVDazRiYjdJemdpNjhySkhqUnlTTGpYM2tjd08y?=
 =?utf-8?B?T1hRZGRWU29WUUpSa1JCYW91NFdZMUpocGFNWHBwSkRmaU9lVVQzdTFLaXVJ?=
 =?utf-8?B?TUFMcS91RVZGYW9BOWlReC9JYlo4bUV4U2Q3VDB4SFErZWFLOGlBNW5DeHBy?=
 =?utf-8?B?SmxMVEZhZWFoWmoxTEZsRTdIeVlwcnJQYldVMWlhNUlvbDRraUwzT2szWXJL?=
 =?utf-8?B?M2dXZ3duTTlFS1daTFF1Q2EvWEM2RkFtdVhnN1d4eGVKYlVTbzBlWFRaWWpW?=
 =?utf-8?B?YmY5TUNrRUVwak5ZdTJCb1NNM1RidnFiQ0h6OXhLOXBXYkdaZkFNWGJnTlla?=
 =?utf-8?B?REozMTVib1pXc2N5UkJWRjZsZDJqK0J1N1czSEpSWVhwSnV4MGdNMVh0K2pp?=
 =?utf-8?B?aTcyb1VVaEZFMkQ5eE9ueDRFQjZRYXNZRW1aZDdKRGVKTnhJRlVxYXdKUzgr?=
 =?utf-8?B?N3FBYnZyRUIzckdHVzluRG1NOVZpVng3Z3d5d1NpU0piYXlrN3FKV0JXUVpE?=
 =?utf-8?B?clFSV1FRRVNRamxJbCtwajltOGt2MkMzU0M2SmxMRlQxcktSNFR4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FED06884F02A5B458577F3DE33F2B9C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	IS+CQsMcE2uzsBgvnGxIUb10nCxFDY6JXL2SFD3Oa4WlfqoYnN4ksxQIua0wAYP0R6q0ESYIrVJOyWYBnBdIi+zNKPeUgNjO9DT1X2uQjIQqZbr3+4vvueBQZ1f/ChuAKb2WJBHUNeNINE9Dcjs+mt0H+hKdrD+Ad1FhwEjGwwfo2cb0EjaQ8KxuUpvodU77VDrK7dD35zBVmJGsJH4bb3AfFr6CrdJGPnPT5Bs3jkzdSgqg55pB4HuGcmta6zLKE4ENU97+5fBO0YKzGAfcJ3RXtvZnn+ChEA8deR0Qda6fBchuh94kf2WoTNz+OIFSAicTF+4LhIpSAbB1kI94TA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3kvug2pGc6IEphsXLuQ8aAXk2Ekaly9K0CjeeTs2WNCjEJz/HgnCwoAPPnwkjI9c8MLTbUh0le0ENcbFXA4As92NDWX0ngG3/F+dOQUI6wlNBCQ6tyLmqOb4iNevK6LKopDMg4xT7Jwt2G3r5Tbs29+usbV5B+T6jF7Gl2QGba52trpeO3oZVctwHhTDaLFVHmU1ryDnASuqm53/aRrBBIPo3JacLpcH5vWxHo4s+5HxGYoAuI9SeweKCzNPCCZdCZSKqcB2LXepxAFmEaE7F3db98eR3rDXAzea+giVWVwRWnhSb/HjQbqwcQo1mEqqNkYgp8jeCiXMK+0btZ0qAHEEY8eFx4TB8V5uCMoCfys52uuvgHIGNSItIlxhZllwLg/xCFUzK/mnYQT9YLcvAyR2wcMhIdLZd65fJA+43jRRWbOeYtJuKgLT62lvsMBP2dsRnwkif8z2jOcBM1Rl+dsDACWbdA8LsrZ2bb/k9V58G4aD9FSZ5+WNu0PyVcgQUW/KEkPWpqnb3ygkRyu0QPm934WQIxIFDIjWP2vLFFz8TO1cQF7n17bMD2DTx55BfwNqxoKlOb+yo7vfSErUMMScY/JnGvRoK9vjZxnWnTn2xCFPX8XLEyiOsT50yyDP5shbzIhcArD3AqsoRK4yVw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fca6521-eb0d-47bf-a347-08ded3e3807a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2026 00:31:59.9546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4SZPQoErxjCLUA1NH00dszy+vSEYDcM+juUmFwy9RKR83moEYVXS5alqNu2SwhlgM0QNgcV3YikwD4lx7LJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDAwMyBTYWx0ZWRfX5q52qhIIimyL
 mjp++FGvaF2p3vlOJ3lgBtgcO0n/eJc+CRRBrezgQne7w3aNuCZjPNV1Pz9zNl7uC0r0prh0Nf/
 r5VNVmhQYNHDobrm/J8FJV/3Ao/TmfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDAwMyBTYWx0ZWRfX4rPU7RJlA/ri
 U5e8zXaC4LyfZhzUiOmVLUuWTXQga0CdUal5Lm2F4tvqepS4DEpXTF95z9O525kCiZKOp5gGY45
 Ed55G5rcQZk3a4u+mPr8RYB4ZKp/EhyNS9PwIhnPy6FQuX9rcyrqOrTWAVzNtJI4B+ZVmmUhW1E
 vB3jm1pxroQNRqLXgQwugHWdZ/KtDv5Y0fcYx/xjQk+R9/tFNzqEIAYyRXXhEgekIaRzJbpjGUw
 zn4V3XtoFroFCXjy50AhP/HOl8Z/qAGZnEvrLWD4WuHgRB1kkWVUzcK9jiCNFPNecCVOH4VCjaF
 hDLuAOOGPzoP9JvJM0A5k5gExqB0qxqhbK/Zl+YF0fymCk8uSktrF6y1O6ExpRykkScIKQrkfU0
 a4VNu+C1u3yDM5w9ajcfqaIhqsWAuNxyT7NzDysRTZGI8Clo+JWY0Kt3e+3qzBA8ePt8qmbmyUe
 bS25hjfXZPdIGps/Ilw==
X-Proofpoint-ORIG-GUID: hgjmJUZ7ye3023yelXoi2jhqVChA1NGP
X-Proofpoint-GUID: hgjmJUZ7ye3023yelXoi2jhqVChA1NGP
X-Authority-Analysis: v=2.4 cv=AeyB2XXG c=1 sm=1 tr=0 ts=6a3f1a13 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=pGLkceISAAAA:8 a=aYTR0O9waNlfUnIom6cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606270003

T24gVGh1LCBKdW4gMDQsIDIwMjYsIEd1YW5nc2h1byBMaSB3cm90ZToNCj4gVGhlIHByZXZpb3Vz
IG5leHVzIE5VTEwtZGVyZWZlcmVuY2UgZml4IGFkZGVkIGNoZWNrcyB0byB0aGUgbm9ybWFsDQo+
IGNvbW1hbmQgc3VibWlzc2lvbiBwYXRocywgYnV0IHR3byBVQVNQIHBhdGhzIHN0aWxsIGRlcmVm
ZXJlbmNlDQo+IHRwZy0+dHBnX25leHVzIHdpdGhvdXQgY2hlY2tpbmcgaXQgZmlyc3QuDQo+IA0K
PiBBIFRBU0sgTUFOQUdFTUVOVCByZXF1ZXN0IHJlYWNoZXMgdXNiZ19zdWJtaXRfdG1yKCksIHdo
aWNoIGZldGNoZXMNCj4gdHZuX3NlX3Nlc3MgZGlyZWN0bHkgZnJvbSB0cGctPnRwZ19uZXh1cy4g
VGhlIFJDX09WRVJMQVBQRURfVEFHIHBhdGggaW4NCj4gdXNiZ19jbWRfd29yaygpIGRvZXMgdGhl
IHNhbWUgYmVmb3JlIHdhbGtpbmcgc2Vzc19jbWRfbWFwIGZvciB0aGUgYWN0aXZlDQo+IGNvbW1h
bmQgd2l0aCB0aGUgc2FtZSB0YWcuDQo+IA0KPiBJZiB1c2Vyc3BhY2UgZHJvcHMgdGhlIG5leHVz
IGFmdGVyIHRoZSBjb21tYW5kIGlzIHF1ZXVlZCwgdGhlc2UgcGF0aHMgY2FuDQo+IG9ic2VydmUg
YSBOVUxMIHRwZ19uZXh1cyBhbmQgY3Jhc2ggYmVmb3JlIHRoZXkgY2FuIGlnbm9yZSB0aGUgY29t
bWFuZCBsaWtlDQo+IHRoZSBhbHJlYWR5LWZpeGVkIGNvbW1hbmQgcGF0aHMgZG8uDQo+IA0KPiBD
aGVjayB0cGdfbmV4dXMgaW4gYm90aCByZW1haW5pbmcgcGF0aHMgYW5kIHVzZSB0aGUgY2hlY2tl
ZCBsb2NhbCBuZXh1cw0KPiBiZWZvcmUgZGVyZWZlcmVuY2luZyB0dm5fc2Vfc2Vzcy4NCj4gDQo+
IEZpeGVzOiBiOWZkZTUwNzM1NTMgKCJ1c2I6IGdhZGdldDogZl90Y206IEZpeCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2VzIGluIG5leHVzIGhhbmRsaW5nIikNCj4gU2lnbmVkLW9mZi1ieTogR3Vh
bmdzaHVvIExpIDxsZ3MyMDE5MjAxMzAyNDRAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
dXNiL2dhZGdldC9mdW5jdGlvbi9mX3RjbS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMgYi9kcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYw0KPiBpbmRleCAzNGQ5ZjQ5ZTk5ODcuLjE3
MTdmZGQxYzQ2NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2Zf
dGNtLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gQEAg
LTExODgsMTIgKzExODgsMjEgQEAgc3RhdGljIHZvaWQgdXNiZ19hYm9ydGVkX3Rhc2soc3RydWN0
IHNlX2NtZCAqc2VfY21kKTsNCj4gIA0KPiAgc3RhdGljIHZvaWQgdXNiZ19zdWJtaXRfdG1yKHN0
cnVjdCB1c2JnX2NtZCAqY21kKQ0KPiAgew0KPiArCXN0cnVjdCB0Y21fdXNiZ19uZXh1cyAqdHZf
bmV4dXM7DQo+ICAJc3RydWN0IHNlX3Nlc3Npb24gKnNlX3Nlc3M7DQo+ICAJc3RydWN0IHNlX2Nt
ZCAqc2VfY21kOw0KPiAgCWludCBmbGFncyA9IFRBUkdFVF9TQ0ZfQUNLX0tSRUY7DQo+ICANCj4g
IAlzZV9jbWQgPSAmY21kLT5zZV9jbWQ7DQo+IC0Jc2Vfc2VzcyA9IGNtZC0+ZnUtPnRwZy0+dHBn
X25leHVzLT50dm5fc2Vfc2VzczsNCj4gKwl0dl9uZXh1cyA9IGNtZC0+ZnUtPnRwZy0+dHBnX25l
eHVzOw0KPiArCWlmICghdHZfbmV4dXMpIHsNCj4gKwkJc3RydWN0IHVzYl9nYWRnZXQgKmdhZGdl
dCA9IGZ1YXNfdG9fZ2FkZ2V0KGNtZC0+ZnUpOw0KPiArDQo+ICsJCWRldl9lcnIoJmdhZGdldC0+
ZGV2LCAiTWlzc2luZyBuZXh1cyBmb3IgVE1SLCBpZ25vcmluZyBjb21tYW5kXG4iKTsNCg0KVGhp
cyBpcyBjYWxsZWQgYWZ0ZXIgdXNiZ19nZXRfY21kKCkuIFdlIG5lZWQgdG8gY2xlYW51cCB0aGUN
CnNiaXRtYXBfcXVldWUgYW5kIHRoZSBoYXNoIChzYml0bWFwX3F1ZXVlX2NsZWFyIGFuZCBoYXNo
X2RlbCkgYmVmb3JlDQpyZXR1cm5pbmcuDQoNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiAr
CXNlX3Nlc3MgPSB0dl9uZXh1cy0+dHZuX3NlX3Nlc3M7DQo+ICANCj4gIAl0YXJnZXRfc3VibWl0
X3RtcihzZV9jbWQsIHNlX3Nlc3MsDQo+ICAJCQkgIGNtZC0+cmVzcG9uc2VfaXUuYWRkX3Jlc3Bv
bnNlX2luZm8sDQo+IEBAIC0xMjcxLDEyICsxMjgwLDIxIEBAIHN0YXRpYyB2b2lkIHVzYmdfY21k
X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgc2tpcDoNCj4gIAlpZiAoY21kLT50
bXJfcnNwID09IFJDX09WRVJMQVBQRURfVEFHKSB7DQo+ICAJCXN0cnVjdCBmX3VhcyAqZnUgPSBj
bWQtPmZ1Ow0KPiArCQlzdHJ1Y3QgdGNtX3VzYmdfbmV4dXMgKnR2X25leHVzOw0KPiAgCQlzdHJ1
Y3Qgc2Vfc2Vzc2lvbiAqc2Vfc2VzczsNCj4gIAkJc3RydWN0IHVhc19zdHJlYW0gKnN0cmVhbSA9
IE5VTEw7DQo+ICAJCXN0cnVjdCBobGlzdF9ub2RlICp0bXA7DQo+ICAJCXN0cnVjdCB1c2JnX2Nt
ZCAqYWN0aXZlX2NtZCA9IE5VTEw7DQo+ICANCj4gLQkJc2Vfc2VzcyA9IGNtZC0+ZnUtPnRwZy0+
dHBnX25leHVzLT50dm5fc2Vfc2VzczsNCj4gKwkJdHZfbmV4dXMgPSBmdS0+dHBnLT50cGdfbmV4
dXM7DQo+ICsJCWlmICghdHZfbmV4dXMpIHsNCg0KU2FtZSBoZXJlLiBBbHNvIGNoZWNrIGZvciBv
dGhlciBpZiAoIXR2X25leHVzKSBjaGVja3MuDQoNCk1heWJlIHdlIG5lZWQgYSBoZWxwZXIgZnVu
Y3Rpb24gdG8gZG8gdGhpcyBjbGVhbnVwPw0KDQpUaGFua3MsDQpUaGluaA0KDQo+ICsJCQlzdHJ1
Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0ID0gZnVhc190b19nYWRnZXQoZnUpOw0KPiArDQo+ICsJCQlk
ZXZfZXJyKCZnYWRnZXQtPmRldiwgIk1pc3NpbmcgbmV4dXMgZm9yIG92ZXJsYXBwZWQgdGFnLCBp
Z25vcmluZyBjb21tYW5kXG4iKTsNCj4gKwkJCXJldHVybjsNCj4gKwkJfQ0KPiArDQo+ICsJCXNl
X3Nlc3MgPSB0dl9uZXh1cy0+dHZuX3NlX3Nlc3M7DQo+ICANCj4gIAkJaGFzaF9mb3JfZWFjaF9w
b3NzaWJsZV9zYWZlKGZ1LT5zdHJlYW1faGFzaCwgc3RyZWFtLCB0bXAsIG5vZGUsIGNtZC0+dGFn
KSB7DQo+ICAJCQlpbnQgaSA9IHN0cmVhbSAtICZmdS0+c3RyZWFtWzBdOw0KPiAtLSANCj4gMi40
My4wDQo+IA==
