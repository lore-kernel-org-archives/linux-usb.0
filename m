Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED13AFAEF;
	Fri, 26 Jun 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782512654; cv=fail; b=m8+cPp8HdaQ/Emp6hvuG8XvjU+IMo8xpfg9Fv1ZaPkXlNXekk0sYJs/g27zU0aK2ixmGHzGoJC5Tp/ihg55NJONedl34jqTX9AToAIfgn0v9hIbJCfYOGsHnIAbo3vTZ2XXGe1anYv5wB1TIl9YRIKHnonsNv260P9b0M1Sjjv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782512654; c=relaxed/simple;
	bh=yQbTwJ3GnL9OPM/RqoqdUhuONhlu/NmHOTlu4s+dMwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qIMfwRloUVdyQ6RrN0x6SZiN7Rzf5ePoDRvknlRG5l82L/BQJqQHo2GNFAm7h8uF7j7mAAafpK4MhQw+CpLxuPtTlsPhQ6AeTjBqoFXGe/3g9i3rbXFy7+Qzn0vktzYJDhHWN4p9azKtMnpvAzwjQYSqK86MBlQ1VQthsP/N/Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cMG/UWfd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=A4+OexnR; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=piwoNmgZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cMG/UWfd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A4+OexnR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="piwoNmgZ"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QKhY7W1930516;
	Fri, 26 Jun 2026 14:53:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=yQbTwJ3GnL9OPM/RqoqdUhuONhlu/NmHOTlu4s+dMwI=; b=
	cMG/UWfdSNBrPwewPFMeGDqCnCUWh6xlU+r0vsMH6X6iC0Xx8Pn/j46Nzl7vIglz
	rt062xOQSehMuSuv9SW0GXqIt26PR14+4MqEzflvc+YdwBdKt5OdFNWLb4EdBBC1
	fRIYMaBkW+73ghuZSxx9meu5RcqTc3HigSSZEpa/HZH/x09/5l7qzjfmGLnSsIKv
	zwfTFCRZtQySMmQ5EnpZ87pFDp87ihTE+gxAuIphKzMwkf0027joxY/VgeA2NbGj
	yB1EFiMtH4NQWxQ/pW+JgJGcqGBAy5HIZDMvqUtNw5wsN+uh43djPfAkEYS+oE95
	VehekijIiatJIxyoFwAJzg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4f20qc8fcs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782510782; bh=yQbTwJ3GnL9OPM/RqoqdUhuONhlu/NmHOTlu4s+dMwI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=A4+OexnRy3A5zZtGiEZcWrg7EuFSnb96wMIPmG04PxHnMCGrNoNbo8FpKnaCi6R3e
	 GCtY5/oBDGpBB6kvJr6LEbB48sXcqEeLgkdeiO9/vq+iRd4MCdNsbu1jG50UkN7BE3
	 +Q0UmYIWnbiUG7K0xxIzMc6duqUaoRsNWw1DniBIIG/P6AXLHo3WM9kggkxRoWtiS3
	 lEXRyB/fZI1czN85b8NgdQMLrdC0J5ins8HhpDN/inI8ccYVHcoJKVfNducMANIvoV
	 h/5xxOh8vIw/c7QclCJewii24vWVEtMfPRFyyLxfeyxTwuS2FNUbu9KGg981mcPi+B
	 tNnexc9NBgjeg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 923AC40117;
	Fri, 26 Jun 2026 21:53:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 50D5EA060F;
	Fri, 26 Jun 2026 21:53:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=piwoNmgZ;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 80BDB4011C;
	Fri, 26 Jun 2026 21:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sA5+5cwyAJx2MP6oQQMEGvHOTXpx4n9FPu389b0VNuJ/L7odGv2EsnTEkJPWyTicn5SEx+BPLOvA3K9HTX+c77MZnmWf1QvTWZwW/iBL+gSxi9g7o8ySOw/mf/x99wqhLv/N26vsopB8Inkql7V8DiFWx02/guK03c5uBkKXmim7eZEgS6nkFi0LxH0OT5mzebyUUxRm6rRzYwqQBqOa8OARE52JUsDG8l9EGPhpKn2CRTIynxPoKumpKqMWSaB3cC+TOJDfESpfEMWx1VC3RQGEH71icH7brKpV6SS6PQCbnsN4EzxBsUg4lUjqKZBSpOhhSUIXGFh7lQZ9lm3trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQbTwJ3GnL9OPM/RqoqdUhuONhlu/NmHOTlu4s+dMwI=;
 b=SrVM/NiRBVtGgCnO+V0zZ8G6TRiR4/nq6ShXacQfL0wGHecqTggxew1X7b6OjgwVHfRq9q/jqQ6pBo4HuAJQuGkuWxELcYKpfsTc5AhumzqgSZtuPUCah+RwG3ZZRi9K9IQpz9UjPfXKS9ZMp7r7S73j/PrVZzkJUD1EmfvytXjJOJA3694VVaQUBvyyflqxOM0hcsJxRLvk416LKEAnjzq/EA51X2sitbP5sBjeJATzCPNab+8f1NW+xBGpDghzbFnuzUnGcylUXb7ZZ0EinzEW0Vye/aC9EeWSAvN/afz3VrrTf8rzadvqMlCq6dD5+l/agkNuINrtBhmGX/xxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQbTwJ3GnL9OPM/RqoqdUhuONhlu/NmHOTlu4s+dMwI=;
 b=piwoNmgZsw+18KnCVZAGbLSNYS7eSkpk2mZOLez7njLmJEfYGFcSXeB6EKWNBo/qhju5l1M86oeURpCe9NCqcJ+kbg70u0fp0fBq94zEUKNiUrbvtMZJlR+yJ7WAGk+yZtwJRXrQaGY6SgOP6bo5l3HABAYQbLLo54l5GICpF6w=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Fri, 26 Jun
 2026 21:52:55 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 21:52:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakov Novak <jakovnovak30@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kernel-mentees@lists.linux.dev" <linux-kernel-mentees@lists.linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: fix kernel-doc string in struct dwc3_ep
Thread-Topic: [PATCH] usb: dwc3: fix kernel-doc string in struct dwc3_ep
Thread-Index: AQHdA88qwUSQUrwj0UK0ANF1Dksya7ZRZKiA
Date: Fri, 26 Jun 2026 21:52:54 +0000
Message-ID: <aj70qqyRpJSfOMmQ@vbox>
References: <20260624114615.18593-1-jakovnovak30@gmail.com>
In-Reply-To: <20260624114615.18593-1-jakovnovak30@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ2PR12MB8782:EE_
x-ms-office365-filtering-correlation-id: e4cbe5f1-d58e-44a2-514d-08ded3cd473e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|22082099003|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 bGgO3rlqLfUW3eAP3+cgU0sDjlUrtOAr+8APYCNtMA4gS65JfGSBksB1XXSUxiS/hD7rYtC2OskC6sGdZLci5fGCh5Cyp0TsnHUPbicFZ6f+G69j6H7KlTzDFmVqO9snDN8T29E3W1rExuE5iNbNH12XUS8iiwqxaTm3mDMay1DsNviNQvKECQUmcPc5KXH61PIovuCBev0LSVLNN1EYdqSbJ3lwfoBFJtgPQA+TIVJmy/RMzz2wQLpHjB+dF2D8UtJsHRTOYuH/2GnK9kHtR2vNRJar353SQSm7uOIUjcBBeI5jgAk89K23ZVd0VO+pIS2N7xOtFsn05X0A5ArnY2/qF3HaAivRUyYPxK76Fwo9P3ccVb6eZ0UHLPr1mlw4XCdwTCse/TjgoPkIenhAWOcly59NnUYouf6dab62V1GkGuUGnEas9MtWUyJutwBVazyF8s4N3k153sO3yvcNyjk8ji3HogJi7OQZfeoQzlEOfzkqzmvVZNIsg2/X0g5EUTcXe1RK5xAwQiNJM5g1V3MklGG4KDDlSL/dcZu30tsSHzgdZfklrL+TFrP+NK2trov/UjL9ldLv7JTyYYa1ACXsaVRIFCn0N9/dOmvLs2srykBvYtJGcDaNlRn0vJnJvAhKdN/bwiWAYfZlOJgBOPPclIREA2ck3V9pmGh6GK7iAAwRaRz2l391JE1XO2Ro/+Lq4aRk/5PDIF2bxZ9Jg59k368Gf2gPoKljFyZgiYE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUl1d0JHQ213NmQ4SFdGZGJIU2hLcVVUR2lBc2UxNW1FcW1ycFVoNjhWOTZ0?=
 =?utf-8?B?Z0NMSStuUi80RHgyNll1d1RVNW9Ed0k4QnZ0WGt4TnhnV3gzUjlMYjg0RTZ1?=
 =?utf-8?B?ME9ZZzNERExPbTA5ZDhXdmdTVy84bGFrNEtNSkxpMzFhaSszNXR5RXVPK1Jx?=
 =?utf-8?B?WXJGZjRmOUxJdDZ2YUwxSy9wUUM1d1lrUWxxMXVvOU9DaFB0Umx3R2M4K1V1?=
 =?utf-8?B?RjlQMFNpTW8zRUpIYmVvaGpMK2daUVJEUnlPWkNBTHd6TlAyVkpDbHdRNC9K?=
 =?utf-8?B?eVhoVllBRW9HNWE3VXJqelJMTUgrM0hIdzFZVVRjNG1GUXlXWXc2eWJPQzVD?=
 =?utf-8?B?WHQ5T0ZuYnF3R2syVW90YWtUTkM2d1dMR0U1Yis4ZG43cmt6TzZwNWtzUytF?=
 =?utf-8?B?Y0Z2RXVWcXFqOSswc0ZUYU9DcUZNR0YvVmNNZ1QzMWV3ak5IazdUeHlIZVVZ?=
 =?utf-8?B?d2FOMGVmVGJyTWZGZWdkMWhkdjdFZlBtRmhPVDZZZmR6Rk9TRlpZOE5JdUhI?=
 =?utf-8?B?ME9WNHFNc1hlazZvbEVzQnlhMVBaU2NjV0hldDdrU2QxcVJpdXdmM3g0QXR3?=
 =?utf-8?B?UUdMZHRGNWpObENrTE9pMGxNSVRZZE1LUEZVVEFBSU9Vb0lOWmsxWXBoK1pY?=
 =?utf-8?B?cFpnckJPNVZkUlJPa0FxVkJITkZ2WVkrMmsza3NpUnZSK2xGUmphT2lOVFJu?=
 =?utf-8?B?UnZjU1p3VGdYelpHMzd3REZja1lmNmcySUNkMWIzUXRubndJSEdBeWQ2OWNy?=
 =?utf-8?B?aWhFRmxHNXFQYStEcTBseUhtY1RmckZxell5VTVTK01wNjhTRllKZThlOXVs?=
 =?utf-8?B?TmVRMmhsTzJCZGtCdFg4a2JaWm9xQjVWOEY2akVKSlo5WUp2NnJrdVFyYStE?=
 =?utf-8?B?WUx5MjhldEd5d0tRdHNBRHhEdk9wRlg1ZHBsWVZqNy9WZ1krWG9lSkQrdWpt?=
 =?utf-8?B?NW5mRE5lRmk5Z0FkSnRZSkdCRUR2cjlhOFg5UG1aMUczMGhtQVA0R3E1VGNG?=
 =?utf-8?B?bnZsMnJXRXZMRjh5azNzSFM2bGhzRnQ2aDQ0dGMxUTdYUm9sQzllWkkwV0lw?=
 =?utf-8?B?SjFqZjJEOUcwVWs3QnBuZkI1MWxLUGh3dVVMcExTQm1qUnF1THNwNHZtWlZY?=
 =?utf-8?B?NjNnMm5Vdmp5MVFaQTRlQlB6T3QvYnVkTTdadmo5dlpKZDBJYXlhZ2ZTU1J1?=
 =?utf-8?B?K09BbnJLWEJmNFBsYlg0bHBycmRYL1BhZEJvbDZJQnZmcVUzTXFPOE9LRHdO?=
 =?utf-8?B?aGhIWitWUHg4QmVNbXk3cUFGanpyOHVpT1IzbG8rd1JUMFJ0dUc5UnZIYVdh?=
 =?utf-8?B?V3hDdDF3OVFyamNzZzMwazZkWE95YTZPM3R3TXdObVdqOUMzbHAvQnlrWHNJ?=
 =?utf-8?B?OWMwNGtUS09xcHlwWHNPOW51dXQzSUtFa2VXMWxCSjQweEhIaEJkNUQrSkJq?=
 =?utf-8?B?T0VTUms4L05ScnFSclRiM2t2VWN0MU9KTnoyODgzcEZFRndSWlFyMGMyaElK?=
 =?utf-8?B?NWhONWlGalA4dnA0WmhIamtlb0wxYWdNUjBMMHRXbnJKUjU2ZE10aStEUy9m?=
 =?utf-8?B?cmVIek9MN0psbHFaTGVQTWQ1ZHhiL2VBemJ4K0dldmpweGIzTVV6YWlMdDRS?=
 =?utf-8?B?dkp5andWSWtZL29ybkVha3hERTl2M2wrUUwydGgwOTVXbmxiU2hNUGN4a3E2?=
 =?utf-8?B?WXRQMm9oUk50OU16M1VDUFpGOXF3QUx6N1FkZHdTNjZ1VWtsaW1FNFM2UG1P?=
 =?utf-8?B?a09JbXlVUUhJM3ZPR2MxOEJ2cTRsVlpJdGloVmZuaWIveXNURzJuVFVXN1F5?=
 =?utf-8?B?ZFdDWkZvVmtBUTBXNTJCajAvZW5wcEgxRmRsdk1DajFSVDNiTVR4Z1E2WFll?=
 =?utf-8?B?cjR1ODVJOHVjT25scWE5bXY3QmtJU1dub1p4WXk0eGVLK01TRzZyVmZwWCto?=
 =?utf-8?B?elZ4M1EwSm1hKy9tMEprKzZLbXhnRm9QbjZWb25rOGw1RHlnaWRMOEpuNEtC?=
 =?utf-8?B?d0JzV2hOSjNNUUJ6VDJCTGI0bzhtMnllRWdDWWtwM2dzUmxnd2lDTlloZVZG?=
 =?utf-8?B?djRGbVhDQ1lQc0dVeDBUOWhoMWprNVh5bFF1MVpJUWw2Ni85eFNRVWlzWCtE?=
 =?utf-8?B?Q3lWaDdlWHpRODdoT3ZXV0ZXbXY0T0loaW56TmoybGp0eUpOZndiaHEzb3pW?=
 =?utf-8?B?WDl5Yjljb0w0eFZEQWxBS0ZPaEFpTzhaenBGNHdkcTFER2RpNXRKRGt1TEpB?=
 =?utf-8?B?R2E4R0lXVVZCYUxXdFViL3FIekZWMTZJczQrWXhaOXcrSTljam45VU9na2dS?=
 =?utf-8?B?Y3JRSU1ZeXAvUUpYdHhQVnlwWDczc3U4ZGpuUXJXazlSU1ozUW41dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D777BA8DD507134B94B30B1529DA1D7F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XPgRTpkIO5eiDiR2nmq++armeZ6SH7M70KeX+FFqkSx7GtINHYix8b1lLH15b+fQPJhmo9YdKgZwkKgpQ5y78598eHSofmn3wbElqcsfG0qkJ/R2Q12g1vfZ2YcnU/gv/HBkDOugB2GHQTUa5LOezzsVk9E9whBmUV4QaxAVWD70VPWeYIcJ48Qd8w62Yfoh30EXh0znm0lLJiCKhwEX6M0HZGaDTzzZtPR3aiQsVwNZmE5JfZIqqo7/sbMWpI6KydbXV6e7wZUgfJZlfTqx4Q0KCglpq9Bi6cK9ABkaZ6MjLTsUZ/RHmYI/2dHzQPdyOfZ3K8ldCQvJ51iK3t9fuw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jjIPVmc+MFHDAFg6y3TyAnax4mIld7cKPw/mwelrZvWjjmdVVeuslIrA2PSAaTmliz9IlwC97IqVeKo8Ec4rCv1ZLoKMM/lrCojbTX5ssg3QmfO8hnxHO0X2yxzyUEMidTff3PM3S8Xw3AyUiVjRvi/uJ53tz9it2Nxd20XNUK/0R05Tww8aT/RakR2OKe6yOyLcYo7P2MV+sgShsJ6zq+e38xX5waT/YnfAgWISN9pGuD4aRUJLwfNPF4KZKC/eb2LBSSkmxOuowOcKoIV2fwMrPbK2S859Oec7yREEmIpDM5NmTdwGWYc4UhOEkqT+vDtU1r4GkuA/FlXs8tSLiyy8yxUGAQv1j1c7acnhbiZ084zewaboqczPgQi+mmVYHkoWL3mMALRJuiAcmWXlpFD3zv+IyAJj1IfyoHeFA0iH+MfNK+yXkiK+u+aQfJBS3YXnKcSdcH0ht8DASRWPBsV2r2e6YcEn1ta2U4PTvOb1pQZzhHR6eA26dFnniU+pRPnS+QVgGB4gj4LxlNkdPbNU7cO1zPqFFPVHpgAireBk/vpGT2nJsE7uoCjfPDkJyq52/5D9g6hhcuHD9G7jLr03EtWYKjWkG2goC6SsgjySBui7+W5tbjCr3PVwSRZTghsvmjw++AR7HI2DPtHkDg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cbe5f1-d58e-44a2-514d-08ded3cd473e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 21:52:55.0136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqN769OJ1n5k0uHf2jNIpBGNRPOdc4bYuQCitMkLMwK3OvYrCJeKTQSmiZmTUBK0ESPTKtTEjLYMD4CRjfR7eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782
X-Proofpoint-ORIG-GUID: hAOeo0ygCS3iah1JFkpxLby9pIr_pBMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4MiBTYWx0ZWRfX8VCs73WReaCZ
 hIqhfJPFfh1OzR96OhPcZJfjfXMNUQzpdV9aHzzpiaLSljDkOpur10g8wkcPew5DaFkubdoduJq
 qkJ1KZlR9ENgeUXG5u1AgG3nX436O20FgCQHI7Gkw89RAhs7m68WwAbSKDttW3k3pxB3EFe+f2k
 dJhU8JiIr2o1h1YSlObJVUBmMyc2qws07A2kwq9DYh9jEvfv78e4fKaxpRJYa0j8lGgYMV+Jh+0
 0vcv+IQvM4QUhLHgnQJtMCLBT9pxyvMcvgolIHgZ2/KEiuIjgbgWzkp8iQlzaSncRMDICuD7B8X
 7FyhYt/jXfNgxP0GNktTU9v9jLW2DWWd75AtXntBWhJeG3D1hIR5G41MoJGO3fCwyv8n8vi9CZT
 Xp0HcZW/OrAkXM3vYXlEQ0yNGe6IOiL4MHiO5zAHVkzj/PYNE0KBI3pQ+Ig6jBu2CCmwn4/jquO
 W72q7tGIgd+k4mnQfOg==
X-Authority-Analysis: v=2.4 cv=bo18wkai c=1 sm=1 tr=0 ts=6a3ef4bf cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=XbPvs4dyb62iuM7bcGkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4MiBTYWx0ZWRfX7KH3bk4+gFBT
 aap/bnerDXATzxy+jWQxR8p9DlRvkYZTta1TeekrwzGxxfSmuJtRUDMAmJ+Deqs32WW39RJX+xQ
 ABJdxWufo/8OMrp0k5VlzqP8chQspeI=
X-Proofpoint-GUID: hAOeo0ygCS3iah1JFkpxLby9pIr_pBMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260182

T24gV2VkLCBKdW4gMjQsIDIwMjYsIEpha292IE5vdmFrIHdyb3RlOg0KPiBCdWlsZGluZyB0aGUg
ZG9jdW1lbnRhdGlvbiBjdXJyZW50bHkgd2l0aCBtYWtlIGh0bWxkb2NzIGdpdmVzIHRoZQ0KPiBm
b2xsb3dpbmcgZXJyb3JzOg0KPiANCj4gICBXQVJOSU5HOiAuL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oOjgwMyBFeGNlc3Mgc3RydWN0IG1lbWJlciAncmVncycgZGVzY3JpcHRpb24gaW4gJ2R3YzNf
ZXAnDQo+ICAgV0FSTklORzogLi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaDo4MDMgRXhjZXNzIHN0
cnVjdCBtZW1iZXIgJ3JlZ3MnIGRlc2NyaXB0aW9uIGluICdkd2MzX2VwJw0KPiANCj4gVGhpcyBp
cyBiZWNhdXNlIHRoZSBtZW1iZXIgdmFyaWFibGUgcmVncyBvZiB0aGUgc3RydWN0IGR3YzNfZXAg
d2FzDQo+IHJlbW92ZWQgaW4gYSBwcmV2aW91cyBwYXRjaC4gUmVtb3ZlIHJlZ3MgZnJvbSB0aGUg
a2VybmVsLWRvYw0KPiBzdHJpbmcsIGZpeGluZyB0aGUgd2FybmluZy4NCj4gDQo+IEZpeGVzOiBh
YmRkMWVlZjA0ZjBjYjNiICgidXNiOiBkd2MzOiBSZW1vdmUgb2YgZGVwLT5yZWdzIikNCj4gU2ln
bmVkLW9mZi1ieTogSmFrb3YgTm92YWsgPGpha292bm92YWszMEBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBlMGRlZTlkMjg3NDAuLjAzNGU4ZDc3MTdl
MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTcyMiw3ICs3MjIsNiBAQCBzdHJ1Y3QgZHdjM19ldmVu
dF9idWZmZXIgew0KPiAgICogQGNhbmNlbGxlZF9saXN0OiBsaXN0IG9mIGNhbmNlbGxlZCByZXF1
ZXN0cyBmb3IgdGhpcyBlbmRwb2ludA0KPiAgICogQHBlbmRpbmdfbGlzdDogbGlzdCBvZiBwZW5k
aW5nIHJlcXVlc3RzIGZvciB0aGlzIGVuZHBvaW50DQo+ICAgKiBAc3RhcnRlZF9saXN0OiBsaXN0
IG9mIHN0YXJ0ZWQgcmVxdWVzdHMgb24gdGhpcyBlbmRwb2ludA0KPiAtICogQHJlZ3M6IHBvaW50
ZXIgdG8gZmlyc3QgZW5kcG9pbnQgcmVnaXN0ZXINCj4gICAqIEB0cmJfcG9vbDogYXJyYXkgb2Yg
dHJhbnNhY3Rpb24gYnVmZmVycw0KPiAgICogQHRyYl9wb29sX2RtYTogZG1hIGFkZHJlc3Mgb2Yg
QHRyYl9wb29sDQo+ICAgKiBAdHJiX2VucXVldWU6IGVucXVldWUgJ3BvaW50ZXInIGludG8gVFJC
IGFycmF5DQo+IC0tIA0KPiAyLjU0LjANCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRo
aW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
