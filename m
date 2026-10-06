Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C179721CC71
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 00:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247532; cv=fail; b=bpLUBNz1dVVBptwWg0PmaaHdOszWGVHVfnOWWgwHilSkl11SaVF3YRETw32MlzydG0hJftzltkipUmZIxOIqi1FlTA8nxdZ6iOFXNQlOA8nxDVdH04DX9K53r/osGQwlW3gUXhKJEFFWZrtLRrZlKNega11XML4uZLEl4RF3lY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247532; c=relaxed/simple;
	bh=QgWTSxpT/7MSj1bjeIvKk0zSafDBvsoWWSM0tJ29KqI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gXrw/lxCT1t4UPmGD9AEJ5fWEybnkCmRqnOjWXOJEJSYcNCrZSHy0k8gG9dPjh+bxN61L1pTpJ7hIJ597y5B4SwPJ1LwM753qZnNMANExTogKxIIDZ4n1fUNXjHNlxLbjVvsGSEpuVC+vY+JosRcVct5uo6/2Nr5ILYQtuLyreE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=J4MWdOEH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kqV+ehY9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JaqpSW4V reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J4MWdOEH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kqV+ehY9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JaqpSW4V"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695IcIUP042869;
	Mon, 5 Oct 2026 17:45:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=pfptdkimsnps; bh=QgWTSxpT
	/7MSj1bjeIvKk0zSafDBvsoWWSM0tJ29KqI=; b=J4MWdOEHQ0F/PnWS0bI0DDcb
	oo22/XwmJ6TZcuf+EjfHZfcl4Y1AJFe0blo+KGbqvB3+R0gnfS5PTaMQVvxGFDyv
	JPwy1rMjYIydBKhgMifdNvkPMp/YtU2erpFn2s0rS6klfuo07M9vxxsDzjB44b2s
	Iv5k7VjAL7DSDSRIQjaNWAnGFyaAy+wjMkPFXkuP8ndbBozVgNT//LOZXpSGbCXB
	wLef2WZW9NJQ6oQYhN6ajTZcTYs9j0aCSBVZKoeXMgtPQHRwHvGnXc6DnNFf+Hqf
	1FgeQEh6lsS11cUM0b1u3aVkqC4rR0cT+o2ufppiYr5lIBIFvnCKjXA8YOD+JQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h4d39mdg9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 17:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791247522; bh=QgWTSxpT/7MSj1bjeIvKk0zSafDBvsoWWSM0tJ29KqI=;
	h=From:To:CC:Subject:Date:From;
	b=kqV+ehY9TsiZ2VEgb8wjELSt+Rr+Jrj4W6USD5xIMwA7590V6vlPEmmqDwv0Hz1M2
	 ZlKzDcdks6WqB+S3Bj+ff9a9U9hOcb2ho8VChgbzZQuUT+VhGM02nKZ/7RxePvMZgD
	 nFJ49Q/FvZ0rtsLJiMORPkuZpci8FWI0Gk1/nkSrI3HI7Vi8JQ/+hxCfP0AMB+qziX
	 T00Uykx0PaGkuNCuGmMNU/Y5jYhhSAFyI5ooV45rsuU1D9NOBsgBbTTQI3ho97AiaH
	 3YtoNe829p/OyGZg0xoW+Fq95une8TrEYY7A8DitlbknYnzGK2vd7dQOjfo/HlZi19
	 cpP2za9b4y2ZQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1267E40142;
	Tue,  6 Oct 2026 00:45:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7BBECA006F;
	Tue,  6 Oct 2026 00:45:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JaqpSW4V;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00107.outbound.protection.outlook.com [40.93.6.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D94A740183;
	Tue,  6 Oct 2026 00:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otYgrLMGITjWznV8L3CaCkeYtjV1DnpNf7In4YhYNpqHRd49e75bPrNrRp0GIP6Kr4Upc6CYDOxMy1KeWNInwVtqEgfAx3jQ/Tsh9T/zNFMqkKS/bfq/GLlDj6AsJaafUUIsk/p8woaBhhmZkgtjJkFRKqc3Wn/9ANAlAycgO+UJGj21H8l4mRylkC/78dKPFIwqAPz9UovWyBkvcS6P2cGkXvsxg6sAuoyXIx1UAdhQHEVrc14QIxyo+nD9twmN7u1UzTn62cygvWGXf7iAwtsEZEKdUpYorNyrc0qBWgDqW1L2MJC9Ry/Sc2LCtL0C9Hy8z5TeA2JRap6Havz5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgWTSxpT/7MSj1bjeIvKk0zSafDBvsoWWSM0tJ29KqI=;
 b=k5c3VXtwKs5zrrvz5ZFBSDrDPQkJa1ew1eE71hmyVCzZptUUVk/mIOZC9dggYDGYBXgR/Uz9lOFfUbDEifzYVYZo6ntfcppz3K4wZpAEBD9+0MV5C+/m363Uec4+oLS39lgcYH99SX5N8u/Y6uu0yCtCtbUiUrlqV950uc/e50Dd5i2qHQdn0dRULQIradeRemZ9KqT8uR+Q5n5RIBiHb6pw/vgUZTV2NHeiiQDSnF7yzDyIqBz2YpsPTsDlPsnAoJyIe59yR/hITdnLUVSMujZIfp5CqUY6vAhAtD/vXJAxvzIORRijzX2BKxql4ahZx0ogWhL9JJSFlEdL/O7CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgWTSxpT/7MSj1bjeIvKk0zSafDBvsoWWSM0tJ29KqI=;
 b=JaqpSW4VpfArqg5RRkWcqdbjXe5GkR5KJigyTwEDAQEr2ax5vkk4ZKvbrpBMfSY0QbQJ/VopQWVXNDfIhMKDSkLEA9edTBgwB4wFgUXNqPMlyZ1m7S+IhAyb+E89g1ox5BfNNypDtAcYrAyI7Nc2qU8q6NIAcoxr1wsH9DLQQS8=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 00:45:15 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 00:45:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Roman Gushchin <roman.gushchin@linux.dev>
Subject: Thoughts on Sashiko reviews for linux-usb
Thread-Topic: Thoughts on Sashiko reviews for linux-usb
Thread-Index: AQHdVSvzxfTtuhTS/EadrqIWqQjv6w==
Date: Tue, 6 Oct 2026 00:45:15 +0000
Message-ID: <asRCTFE6gFlHBIu6@vbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ2PR12MB7989:EE_
x-ms-office365-filtering-correlation-id: 9c5e03da-55d5-4323-6b78-08df2343165b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 7Lqjbek/iZ2g1PEzTgZPLrHsP2wQpYsI2fCnpWFkXDE+H/2Ht83hzQNE5WmnKU0TvhcB8tw8um38ioabpHx8PXLGpQZavY3GyyhxjInbrYAC+Ij7PyiHdt1nsLbwlUdxndn3DHSAWfIV20jA7+SmWaOv95DTfwYqFANOGuNvcB0YsZGaZeU7DuqHLecrBvwcG89R2gNLeXqzsSEuRNmVvAT1On5WAKeyS3sKGbMRWnz5uZv4V8o82DNn/RrLV7o6mLN/ydsTHrXCIJyVihGFhShfJE2uVZ2I+Fw0jX0JDkE5zMlTC/vWulMtMLba+/Znjr1hzGzDmgc0QIhFj5i9nMdcfgv1bCzfDjv7cJ4seOYyaPLzJ8Ew3f5HN/i8VBQMpfiMTros5RYtw8JYh453OaklKDeLrA+gmXTTX4TcGweBGhERa/FZnSF7DCTdx6NPjSEtvhXZfbaV7Alf+/NVAq7mdlH44nfifjF4WffI5Qi6nVwcr/QoD9oJqVc47MFdwUkYJnlTGX6/PvEVqnChMG5bZndP9kTptWy/Ex881KNzukDLQh3jNplLkOwraGZO4tR63+DZKVMCcQdzY2EaWl8faLjP3pLZZdxkZk2bzttyXHcLGSQbJ2ZLvOfDF6qr3EAbab5O/U77Avv9SFVw8KE0jVpNRzCAkHLCpS7nKx3BP1QMTSGfAYi89dc13cftUF6RzHt0oyt/z/kp6eQNu7BVYSlWqKc3W+YHzCxVd/8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qm4zVHNKYmRpSFRLR1loK3dUdHovRFFSVkRlelR4ZzA0TW00c3FleC9mazEr?=
 =?utf-8?B?NlZCV0RLUG1NbXYwdk53SVgzTkdRdHdIV2hDWXZ0S2hOTmVhSjlLSjJWMlJF?=
 =?utf-8?B?SU1RMFFXNjFBRnZhNDVXLzBUZXV4QVp0bFhmOXk5aFVYUXhGZ2xDcEFQRnNr?=
 =?utf-8?B?c3dTWWQxM3ppaDZhMnNtZlk4S2N1YXVzeDhuSGJDM3pCZ3ZXQlBVOWJUNElU?=
 =?utf-8?B?WFovUkdwUjFmWXBndDc5bkFTc1FxMitLUDZMVmNaRVN3UTVWMENKMGN2clhl?=
 =?utf-8?B?UlNYQ3hwaEx6WlJ5NCttU3U3Y3hRR1VyTUVlQ0NmUW8xdkp3VFZSMU1PQWo4?=
 =?utf-8?B?Q1pod1dSTEFYT1Bnbjg2YUFKcXlMcm96UGVnSDBLNWh0UXV2OFZHZUc5NDNr?=
 =?utf-8?B?bktuTnZSbVhhWFIvbkdQMU1tdG5ucnIzVkdKb0tBUElrTDVxNzRacXppa0tQ?=
 =?utf-8?B?N29CYTdWVlp5ZzE1c2JudE5hditZcDQrRFE4WkUzTXJ6eHRWbDdLMFZCQkEz?=
 =?utf-8?B?RUpPcEsvNFpxSjBuMFBpNHdUOENoNmhYdGFPckw0eTg5YUg4Vnl4Uk54UUt0?=
 =?utf-8?B?ckF1czFiQTVCR0hTY2tyNGxkMXR6NUVwSkNJTitvRWxjNnRQTnNXRzhvbGdj?=
 =?utf-8?B?TkZOcC92cUZlVG0zMU56S2Q2VVhiU1F5K21aVEtVdlplTUg2MHU2N3kxUHla?=
 =?utf-8?B?S2tWK2FSczYzd25ZVEl5c0VaUDFldE9BMzV5eGlXKzYrOE9ldDFNYjhvWmVP?=
 =?utf-8?B?V0xja2c4cTYvTVQvalFRZ0lVWFZQMjVnUzhIU0VFYlZKWFE4ME00S21BeFNX?=
 =?utf-8?B?Y2Z0WW5YOGpadXFRcGp2cVo3NE5BSHVtNk94N3IzMitWK1RPYTAzYUtvQ1dQ?=
 =?utf-8?B?ZVZrTU9DVzZBbjZvNW0yTlNScUpLbGxXbU1UN3oyNExjRGZOdkpuL3RjYzlV?=
 =?utf-8?B?Um5YRzdYMFJEeU9NRHVmWUVCODd0dVQwOUxOeHc1NTh4aXFuc3Q3ZDJiemcz?=
 =?utf-8?B?bTVYTEplb2NERms1aUhXWC96MGlOellSYTlWWVBocUlxMVBpaUNURkZ5R1Zl?=
 =?utf-8?B?Wk5yZ1A1eFNKLzFEK000aFBLUzg3ajhIRVhlcUtFcUc5OUtjSDFHeGVhek50?=
 =?utf-8?B?ZTJoMW9Tdng1OGNBelVTUWlzejB5d2I0Q3g1RjErWTdDZS8xYS9rZWxDZjVh?=
 =?utf-8?B?dFArd2dtMXp0b3pUZEhJMWJ0QkYyRmxmTzhrNTFmMStNL3h3T2xFMUNmVmhV?=
 =?utf-8?B?S2NNTktSTk1WK3l4ZXlRNUVOVlhvczMra3RaZGJ6RExyRTRKS01KM1VvTnZV?=
 =?utf-8?B?LzFUSm9HZEZrd21NM1pTellMV3ZFdnpGaDNCWk45VUMwdmFwNU13OGsrdzNa?=
 =?utf-8?B?YU4xdzNjV1VSd21scWQ4bW9SNHFwT21oZkFVNlJOenpaNU1GRUhld0FZRUd3?=
 =?utf-8?B?MFV2aktkVFhIYXQwZW81MXJQMkRmNXZIaXZ6VG1rTVY0cHN0VmdrbVNIQmxT?=
 =?utf-8?B?bXh6NURtWnNtMlppTUJBNkExak9LZmw4Z3RiUkplbW9ZMUNLNU5YYk1uVU5x?=
 =?utf-8?B?cWR1WGFsbmFHc2dta0QrNXQ0alpISXc4M1J3bzcxQndRQ0NRSzV4YXM5SVVU?=
 =?utf-8?B?ZjgxdEwzdFliZHFENUN5U2hjM1ZkU0IvdEVLb3ZXY2ptSlZUZnZFL3dORE1I?=
 =?utf-8?B?aE5LN3Z4T0ZRdms3eG4rTHRneFRLYXMrSm1IcTN6dVhEVXlFNjRNZ0prNjRF?=
 =?utf-8?B?TURURmphMzRDSXlMcXRFaHZtU25xcHJuNXJZMnZaWjFYN2ZxdXpybnZoOVlk?=
 =?utf-8?B?NzhpLzVCdFFmRHAvOS9mTEw1NjNGMkgyR2dMYWdLakV3U1lLZHoyVjY1Zzc4?=
 =?utf-8?B?bG5pNHhTc2U1OU5pZHR4WDJ1MmJBVEZHYnc4NEs5T1hLeGZTWldNU2VKQW9z?=
 =?utf-8?B?RS9OT0hBOUdjWUZrak5ETEEya1NsSDhHWlp2a3ErS1I3RWdQckgwL0dXSWF2?=
 =?utf-8?B?LzhVbFYyd0lEUWRJcnVSb1NuMWM0TXJzd1VJYUt2VExKekpEZmlkL045dmxO?=
 =?utf-8?B?a1cvU3VhUDJaVUlYZ2tSbDk0SWRnT0o0VFZUbWhkTnJsdzJpL05CZTJmc2Nt?=
 =?utf-8?B?bi9DU2huVTFPUzhRRm45WlExRVdIVWQ1RldhSytkSExMcUphMjFxNTM1Zi9v?=
 =?utf-8?B?aWprZmwwRlVLdzhnZ3p0TzVKNTZyRXdsK2duZStQOUlxYkVrWENIRmh4eUxS?=
 =?utf-8?B?UWwvbGZGRFVCcDl2RmdyRTV4ejJkaTJxRStsNVE2d2VTRklUNE5WYzA0U3J6?=
 =?utf-8?B?Sjhub1l1bEhtanJjRjVFSFFzL09vY1B4Snk0YXJBSStSdHZXdXkvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E55D8F384018E4CAEB009383EED38DD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	yWsfc3QVmEjycGJ/QC0vhrl1G4DrUbLIG+ag3KfGNwzZqVus4iMc4SNuTbmtxDYeDSQs3LlKDgoCE2U2oSnKQFR89qeuthOUFbC1XcKTlQtVWLJQ3vlh2bYAnj5n9pX8up889+R7aQwZTA1Ws0Bq3TVdZ9dggraUbJNLjYH/U9ztHh372IJFPIkLZGxLHqTtFH/ahjAup/lBljU2/Vdd+9RXUqmwiBqJ+ASvzSjtiF+V2TnO6jmAiYy5VCs2vVb055NYxvdGZeu2gHl7b6/XnODNKjKV9zYNEmasQF8M4QP9eg/Ir5q+NZoe9FFHk6r3G+ORV0PSpJZQsRcGtNyXHg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ODwHkqqfGI4r9740md9WvKYt/yx9qPeuQ1igYL3Tahj0O1lGarQe4els1Azi9Q+i9pWIuRbnaIPu+Gi7WmpFV+hu1Ti2wakPsEbt5brV3KfZsdH4D6jzQjQc56DvjG4M4+UXbMzY0cLGp7/bYttqr3jk2Ic2DN5AiNEp7W52GWlxPk8q1jjTyo1zNa5m2EXP7GbclovDUEZTenN27yZtMF5TSbg5cfDJ9CPNNOMGj0p5d80QhU8Lw1ri72GJqECosQvI4zcrqKmYGVxaSCj1suHi0zgYoYzikUnjMxx4citMfO/jAm6wPkrtc7zC9wwkjnFF37gt3hPnqDMhooD2XBeRYtZy68tV+rZ0rAo/8Lg2zAid3HEd35lMnB9F+ZYpSldjqJCZyo5qIfqPe2hxSriYuBBb9yR4VGL6+cW2GUgmDM9gHCa0oy2K+SmVre6sFGE7POvaA1G0WO6RM8hfq1A/PoUCa1l0Q+n1tyGo6JwgQG/0JLUmVqI7ZZ1UYvtUdNOiuahpzlBAgAuSEBloE4qun3ymACmC8YCx09UxGw+zIFXawFZcyUnp8wO/UbuNPhH180xwRFRJagtnw6TuRW4ZXQXhvwaIGm3lVLDGbAZuOibaTR5CwhohJfviec6xZtK7yoaUKZ25Y3LcCeJ1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5e03da-55d5-4323-6b78-08df2343165b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 00:45:15.4277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSl7mBFyzb3I4SeaEr0l7wFLOH6kO6u3MINOpT2GwykNrIsHk1VqYrD7d7t3hmMELr5FdIM4alB6xA5ydZsyGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMiBTYWx0ZWRfX+j5uk2lfGDpy
 figXDn/Hy00SmuBIOrTTQjO5jo92X518AqXeJCIbINFZ79Hf6DxvfjYuwVNm0wvX1RQsHWZPHCW
 ZZXGIKTgmrEmxdv+EOZPCv6tyrB76RraVyxcuqSR27uc07yGpaoMZls4CFGmpwFckQ6ROr6t1XF
 +3zAdXl3iL2cp5ROvqfvtOstzmcCquhVO27iA+s6m80iGF5HRogyYOpM/ML8b8dknA1Ubp14s5G
 FEoCQdjEHiKvHAOZXy+kX46Bh1/eHOLG+tX9BrmWa8dEvvaurK32BzOM/UtGU8MJnq23GoC97md
 iS3xgqheQBSbOoy9WPlvY6etl8iaHI40AacthG9nOF+3vWoUJ0mV0KDAY7pHRai7YSa/MY2RU2T
 xOuxHq+mStVbhhpxJPb7M566dZRry+QCiFfpPecAcIrhOuJGgz6gxV4Hcn0ZhkykSMwV6j4uXo2
 XWIgnxgwaJlzHqK/y1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMiBTYWx0ZWRfX6zSCOhAkeVbx
 wzio6LJsyV7g8GUj1u6hwgA0VpWwjbrrRvWEZwxhRVSHYNX/gJzowtD+nvQ+ZJVq3ggv+MTXIxY
 ZXbFDlcWc/HDZ403LH2yPa1y7QoWR+o=
X-Proofpoint-GUID: _Z7cI_FWAFgZIfuFWaF8vmvdExiNLZtr
X-Authority-Analysis: v=2.4 cv=ccJHPXDM c=1 sm=1 tr=0 ts=6ac444a3 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EoHAuXmPSHhltVoKm-gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _Z7cI_FWAFgZIfuFWaF8vmvdExiNLZtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610060002

SGkgYWxsLA0KDQpJJ2QgbGlrZSB0byBnZXQgeW91ciB0aG91Z2h0cyBvbiBoYXZpbmcgU2FzaGlr
byBzZW5kIHJldmlldyByZXN1bHRzIHRvDQpsaW51eC11c2IgZm9yIHBhdGNoZXMgcG9zdGVkIHRv
IHRoZSBsaXN0Lg0KDQpJIHN0YXJ0ZWQgbG9va2luZyBpbnRvIHRoaXMgYWZ0ZXIgcmVjZWl2aW5n
IGEgcmVmZXJlbmNlIHRvIGEgU2FzaGlrbw0KcmV2aWV3IGZvciBhIGR3YzMgcGF0Y2ggdGhhdCBJ
IHdhc24ndCBDYydkIG9uLCB3aGljaCByZXF1aXJlZCBtZSB0bw0KdHJhY2sgZG93biB0aGUgcmV2
aWV3IHNlcGFyYXRlbHkgdG8gdW5kZXJzdGFuZCB0aGUgZmVlZGJhY2suDQoNClNhc2hpa28gaXMg
Y3VycmVudGx5IGNvbmZpZ3VyZWQgcGVyIG1haWxpbmcgbGlzdCwgc28gYW55IGNoYW5nZSB3b3Vs
ZA0KYXBwbHkgdG8gYWxsIHBhdGNoZXMgc2VudCB0byBsaW51eC11c2IgcmF0aGVyIHRoYW4gYSBz
cGVjaWZpYyBzdWJzeXN0ZW0uDQoNCldvdWxkIGFueW9uZSBvYmplY3QgdG8gZW5hYmxpbmcgU2Fz
aGlrbyByZXZpZXdzIG9uIGxpbnV4LXVzYj8NCg0KVGhhbmtzLA0KVGhpbmg=
