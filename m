Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65CAE555
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892663; cv=fail; b=u8pwR8abJOpzjLxHP9nun5T/EbnsaOje9BwyjYhuwYFygdRCV+wzHchLzKCqutX8npEBsJs+kP2KjKffuuYkTj9Rz8TTRk4qmThom5Bg5uUNm9ZSBEJPVx8vhaw7uj7/XNTfeE1qRUW5yj6ptc44d3BYgn6Wmq8shyhw+epbgSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892663; c=relaxed/simple;
	bh=FrrfzTek6+bcmt2nlevSt27kqf59vwAXxOM6ZNAsk2c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=it5xOWFc7I+5LZ5QysVSFj/zlYlYcSeWP3uujgZUzdVPHY5bSVqydWvCFdQda8HpmV1Wr6cPAh5MyX+94oPItbRsBP5Fvwg1UXnhDP17mRLTWIbsqkuefG+hIGEjhggWMKYP3wXeyrYshaqHffuesARXKIibZfcJrV+U7PpQjxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tGawZ0xy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Opv+yLhw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=edAOYPX7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tGawZ0xy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Opv+yLhw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="edAOYPX7"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NIu1G1251342;
	Tue, 4 Aug 2026 18:17:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FrrfzTek6+bcmt2nlevSt27kqf59vwAXxOM6ZNAsk2c=; b=
	tGawZ0xytfx0rJ2qb2TJnrA2aBFcwY1hraTe351qvoEiTD4E/2qI4MuT0n4wkMGh
	PVl/WWt+UV88AqQ3lEeyKRnrLdnNfXjzymQwNVpUj/UTyb546oM7Id2edlv2lir0
	9av2ghULOZzdZ5qpZ7D0K0TdSe38JnIg4k5kHkZWPVIFb8ZqXLPNMVtC1w39G56z
	D4lMYQ+C2blwVIgtheHzscaec5kghHGGboArZnQqKBOxo+tt3GU1AXbMH75LfR9G
	x2Lrnm1JTpHbwqHKkAJFMSDC/HStjgoQyiXfnYZ8CF2TxFu/loe614q/ccbT1lHC
	7yjlkWc2Rh/MMhg+s6AFzA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fufyjenmp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 18:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785892659; bh=FrrfzTek6+bcmt2nlevSt27kqf59vwAXxOM6ZNAsk2c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Opv+yLhwkG/Kb8NO8EgqL2wlmJoVpZ6Ic6cNKJbKJcy3noob0ILUynO1Dk8rjX2O3
	 +tljh8rw5fPUmp8+ahFGAzIbVaDzsaa0wg8haXzKLlWi8WxFohiCUjNxiJiaJlEQSf
	 HPbPHbCxjSL5sSIsjBWvlTA+z+gVfHMFboTCV9TnwzMUM5GXNDfjyR/Hyy2EV27M64
	 QGq05okSqoNsEspnLBOG8EKSppoEgT5Qmom/1Tsnt/B6v11eXi7CQh/D+gWFvt1575
	 hZQJcNtn4zPPTuGOpFxyEiPWGrCT8I6ENm0U+MNCKNP7JRCp/I4FGGs+4ZyF5/u4Fc
	 RBGFkNw1L67pw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E294F403AE;
	Wed,  5 Aug 2026 01:17:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 94369A00B0;
	Wed,  5 Aug 2026 01:17:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=edAOYPX7;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2312F4019F;
	Wed,  5 Aug 2026 01:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YICi8mUEa3Or4kqc+jVP2CPEXJvse3gSsGB6zUjb6uCby/bX6x+IeKP3YM4NZiKZFRFklYmnpaTkFb0lgxNySxER0Dde2i5dWufAHktuj+evBjpNagS+i9VSi7FYhtx2RXNe72ad0n5P00maQRdLMaXR68BFUcawzzPMUH8oSfZ6Nqtrj7ZgSlyWvqm4MCMtPN0vvtkcBShj39T+UvU9nXjZlZNrVN/4RRS9pTLb0qQY/OYhoL+L3YNktdSgsEm9w4f8nHTFfmOSF8dZ9Cv4aQg7kBhPrewEehFEjYsSS9iYDrmVsP5Ig/aDQ8vpkHtozniXPPO7gZxLBLiSVE0vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrrfzTek6+bcmt2nlevSt27kqf59vwAXxOM6ZNAsk2c=;
 b=aPXCXVn1oKAKEFPQLIKkqX24Wa01f6c0tVIc8UlFLjAE1pxxU9WoPEGAWWENBjU8ul/zlnmLctpYIRJ4oJQiDvW0Jla3OozQQNtVp8c3k9q0ELKgp9VyIVM2FrGfppCUWipIcviP9UY7cqAMNAODoVi2AJlSKfIbQdC38CkpbUCkAxMvzbNqW/PAjMFfd8uAegRJ/DNDgQT5HhKz86KQeIUsWHbA3S7U/bIMHEhkOC34n5xClgyX8wGDV2D1Yby2T2/qjsvT7g0msqBPEF0205pO3S0kdZp3xdKCxaBslsxwadjOTxz1EXaMyxwy6xSxCL6Ey6at1KwfKttaz5Rb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrrfzTek6+bcmt2nlevSt27kqf59vwAXxOM6ZNAsk2c=;
 b=edAOYPX7NJ0bRj9SsPGJ7kDSvq/xNqcwTPLpMpd8bzJlW4NO5JTuUbpFnFSpcmUlFEZcz08AzqxuKF2BajPwzNSQc058yBCHMqLCBE59qHLi2dMKsPrIDKfFX8xVT830f3wlLGIcF4aKl+jGu2betE+C4Y6aVeD5S6YrmgncClE=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.17; Wed, 5 Aug 2026 01:17:30 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:17:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: simplify dwc3_lsp_write()
Thread-Topic: [PATCH] usb: dwc3: simplify dwc3_lsp_write()
Thread-Index: AQHdJBgugHdr7mcLIkKkWPgmAKNZHbaOqC2A
Date: Wed, 5 Aug 2026 01:17:30 +0000
Message-ID: <anKPIMtwcn-SabvF@vbox>
References: <20260804134943.651893-1-dmantipov@yandex.ru>
In-Reply-To: <20260804134943.651893-1-dmantipov@yandex.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB6469:EE_
x-ms-office365-filtering-correlation-id: 74c6f83c-ad29-45af-5ffe-08def28f522c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|11063799006|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info:
 zxPO+U/erjmTLll+BNqSXCBdOjJVN38ww5i0rcjlYS6Fg83CDV3x+DU4T5NTJ+A1BR0h4uMe59cucdFRzEO3HXqLWz/AF5LTvK6PwXPrCwj8kxnzCAtEXhvBEsyzfhoi7z7tRY5pTbthbnmZUqfdlc43aS4Gqt0MrepiBF/yT+zmDuvaxZ26O71z3GRVtZ41UfpwM9BXe7ehRVh5XTlmpIWDgB4GUHcvzAecRMTb38tOJLCtmda9alIXqV2vCd0408jQOKJOW0BEaoSxG/65lWGzewBL7NuMiguZ1Dq1A6chTrHFSdR6U7NI11eenWEsj0gwyaIbJ8USZ51q/qvyS5hYgbw/uTLfmUpakZf3zC+Wee78dhQuqSEJqWf2STM6/1P0rKbyYZzvvQEW6HzlKpqr5loI+9CBkA5rW5bxQF9+ILpz0YYYhSFi5RmgpTC5BRoL5VE0yr+X3PnsN5bO7+/ovr8A+2U/+CGA2nG617uJSoqBxSI3AG8ZUuZ6OAy0NzKOAPylURqF7nu/pA7/2C4AHnlOKgMdC4mFvb9T04uP5txlpqM5KZ6MHwwkZqxWjmurF0UWcg389BVQyYu3/inNKAQNuQG1TSubLW9zDjBk2JAxIR28mj2ER8A134FjS1Y0GCJfbPvmbT68c9/h/kn4Am9PxiA1tf2FdVI/UKyAM5voP7QLHvxgT/RJfL1u/LKgkeHuByaHnJiWODLJZuAjKGsS5ZoZ9S6afVeKJS0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2tjNXhMN2YwK1VYcGlEbExMcjFnVm14NkFUbTNkRzdra1V0NGkwTmxnNEor?=
 =?utf-8?B?SENaZWdncjg4cWlGSnNSUmF2ZFRDR24vR0lKVzk5Wm5pZUNpVWNEcUorTG8w?=
 =?utf-8?B?bzlSbE1ZK1NSdVAxaXZMSTE0M3lHTGVVUlQ4aytRQ2EyaDEyZk50ajhWZ3NK?=
 =?utf-8?B?em9lZUR1UGVWQzFnZlJmQmVHMGNTRjNLdkhCUHdLVCtNQno0TkY3bWlZcm5X?=
 =?utf-8?B?ZzlMMSs0TnlRc2JZb2E2dGNMd3JQVnBLUm1ZaDRsMEFXaXRSUW1uMU9WTTRF?=
 =?utf-8?B?UGJnMHd5c0MxdmlGcnYzZVRNTDBKaGVRTWdPald3ajdocVJ4ellFWmtZRGdt?=
 =?utf-8?B?SkpIcDNEMnZ3TURXWjhnTGxkM1pTV3lCSk4yU3hQdkt0bDBDL1h5WWZlbG9H?=
 =?utf-8?B?ZkFQTVJ0MU9yclpGYUJ5clkwb21jbHVFUnlKNC9JcHpZbE5NSFRDU1BnaFBq?=
 =?utf-8?B?L0tTVTYxOWRrOG0rV0REbWhOSExsVmYzcTYrOG5PVFpvVXZpZEt0VDUxUVpO?=
 =?utf-8?B?cWVVMlNtWXJyS0h1MjBNMitlZEZNY05kVHp5b2FNWkNIM1dGanhRSmMvNFJr?=
 =?utf-8?B?QjNkb3JWQmc2OXVqTTcyakFwbU9jUjNIL2RPSXNpSnBPK2JsTHJVTEtlM3Mv?=
 =?utf-8?B?Z3ZNQmtTemFzM2lPTnJYSmNhTjcrYkZ5WUlmbEJHTENheE5wKzFDSlZRYzJy?=
 =?utf-8?B?b0ZzMStvY1c2MjZIMUowMzRtZlFlQStpWWJCVHAxNGFxTzJ4MTBMSzA2T2lH?=
 =?utf-8?B?ci9WZG92ZzBJQ25VUmlMbnloNzZaR2k4cUo5dTM2TnRPUGd3L2VaOTF1WjU3?=
 =?utf-8?B?WDdiZGExczdEcWpCdGVrblhqeXRiZCtvNmRycGViR01wYmlUOVUrR3I5VUU1?=
 =?utf-8?B?c3RTYXFBUlpLWWhsZVNyd1ZIZXpsRkNoaThpYmV2QmJZRDJPS2tkaXpQcnp5?=
 =?utf-8?B?OW93QXhIaldjaU5OK3g1ZXdPeFkzWXhtcDdWQlhEWlh5MlNhQkE2Qll5Q1hn?=
 =?utf-8?B?a0plSXZ4ZlZ3dG04YWNNeXFRL1VEdWkyRnZmRWlLT1RCUzFOTlVMOXFsVWty?=
 =?utf-8?B?cjJRSTdRTUVOTXg2SS9BNUs3Qzk4TmYwR0w1ZFE4ZGtsZlN6cWplT3YvUTc3?=
 =?utf-8?B?MUpDRnk5MkNDR21aNmc1TTZRaEVoTWI0bXplRGFoa29saGtqcHJWSFl4YVZZ?=
 =?utf-8?B?b2cxT05KMExVcEhwYWluNWlJTHYwK05kTXFFVjkxcXpVdzZpbUU3d2JOWGY0?=
 =?utf-8?B?ZEUxRU9zd1Z2RUh4YjRkUUJSSXpLUVdBYWNCRk9YY3ZuQWxKUEtIY2dTS0dC?=
 =?utf-8?B?cnY0ekNTbmIxQ25hUVh4SlNPeFE2UTZjbGtuZzdxOWtHRWs5clB6QkJIeG1G?=
 =?utf-8?B?REwwMHg5Ky9Vcm13cGk5YWdqMDhReWhRd0xIa3VhdU56NXduY1RXa0ZWVUg2?=
 =?utf-8?B?b3V4VzlNKzdsSFMreDRsakpXU3NtbnhCc2E0ZTY4VGluWXB4eDZRSGF6b0Q3?=
 =?utf-8?B?Zmc2R1JKSGNkenhqNEttdWFsSm1nVFIwT2t2RzE1ZVZ4UEUrUDlObjIrbGNI?=
 =?utf-8?B?WUVkRzNaSmNxKzQyaFFsNk44WU1NSVpaa0xQV0ppb0U2bWVhdUdUcU94YmNE?=
 =?utf-8?B?dWZvOVFMaGFIV1pEQm9zK0lSaXJKcGlDRkp3cE1sNG1jSWJSQmMvWjZFT29p?=
 =?utf-8?B?SytMNEVKVmVDQTIyTWNmbGF1Z29LMDhDRWVjc1BtSWFuMCtwL1V3NEptVGFm?=
 =?utf-8?B?amFScEl3UXAxVitRbWp1dFQ3bnIwaHpHVE9zcUw5c0lGY0lEa2IvZXUwK3lp?=
 =?utf-8?B?RVhkeUtJWGtTRHBPaVplRjZWNi9wYWlNS2dDNVU2ZkdxWVFoYWNtUXpWb0pD?=
 =?utf-8?B?R2x2bzZ3eG9zclk2ZllHajBML3lZeUtWVFJGRDQvdjlpRjJ1eGJnbXBoWGJU?=
 =?utf-8?B?cDlJbHhQSW1zVWswbkpBWUF3UXAwQzVVT2Q1YVd1aDFoMVk4bHY5MWl4NTFK?=
 =?utf-8?B?d1k5VkVZVGlEdVpOTDZMNFpQaGdsUVBGcWtBb1NUZW9TZy9Bbi81cHlkeGl3?=
 =?utf-8?B?UFNNQ3ViWGJZK1ZycDErMHVROTc0Rk91VnZhdzhQWGJSMHliSmhZYUhLeXln?=
 =?utf-8?B?NnZWWm1ZQm00UGFqVk80Qi9iQnpjL21Zd3l3S2RPZjVwOWZMd1AvaTBJaGlE?=
 =?utf-8?B?VHZNU3RhWWF0Qm01TmhkOG5EQVNwUW4rb0pQcW5wQnQzcGpZSGtiai81WEZU?=
 =?utf-8?B?OHNyVEVwRjJneCtERkw5QWwvRDMza3hnSGhPZ0I4QlpHN0praTRySVBHN1lI?=
 =?utf-8?B?Y3htKzJSWjhxRE1QREd4UnRWYUszZzRkL3BGaXB3eHRTUTlsbkJsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <078A1F3E62767743B10255E786146D9F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mAxMuJ0CMy6FLgjrok/OdvJ3Tj5g+kWkDG8RoKTjt9axaX4N+p/yz9EUZS8BzRpyrd7jCRqOEezkHVd0mDB+IgRrNkVJn6+I7rVY3yOz/T92aiTlAKl8/XhdKiijhbJoyQ/IZkpyUGe9YUYs1l6fHr9npBvIcy4dI0trQyhKv0kKm6Y+y9Wjjfg5VmiE3l/M9Gno+ppxY0ftGaOhYMtGpgERrRXJcgTRkuaUOuVyW1Ec4ITrXtTH2Cnd1RQJA0wc+0KdxSrjNB/kYNSiJ0U1r+qKrNpRHnmPRwWyNOj5arZfPF9zPMBK0z3X+J74tAPqPcDl9yWKAk0ZygVeShV6ZQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EIWT6+ToP2ZJ78W9Dsovna/8VltqlveH8Vl07Txu37CesWYEbG85nFB7yPNXJoA59KmnIVHubxMJlLqm3BiHZUbkNW2FaRURydMMo8g7+NVL9U+WYUy/xLHpnV/tXlTdN1cguP8aWg/URP+mAOwGoMTf++WuNfr0+ZDtRKPKrG7IBqnzDg2zoowM3zYLElQJkdYTCHD1Fh8grG4AZhradJKVRedwg6MZ4e494rZUZ9VFGVVhHYP7pRvJgDP8Pi5MGD86rLOeptawrr8uXxRypcQOli0SDdNyM672+XJ+Rzo+Ax6wnGO/srsGgP+X5Megq647NxiW3gtvJJGOG52Qn64FSPq2xatIpraDIZhkdFmunnYN7K1xuv0Mv5A6zbFFl8hFnJl72c61LBMEgu1R0cp9nsF03CdEGa1yGzj8M87DW0wLKL3a8n24RJ5dxjIzDUGaQBdfnBDomto6SRr7us18TcuUFn6+ec/sJxQ6lcy7oLuBfcfN0K+YVuwOHXcFusqXTnFW0Lu3cPak+k70IGZKWAprpeAnkHCm5UYX2ui6DhCgVVW1doJzSmFbT0fNl/g7jc5vuIR+brJg7gdocLrQzGeNLxvCuzF1scOO5t491wGsGDioiv3UpE57ucZKuq6eCd+V4C9i6BXdInRNYA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c6f83c-ad29-45af-5ffe-08def28f522c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 01:17:30.3666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGw2cnIj7l/Dx9rbUn7bIvr5fdpgafEWYF6joagZIGcvgD7Ql+/A9eZq5s1hxBf5d68QnCtWz+HyMGIyUVfyIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwNyBTYWx0ZWRfX18USmyene4ub
 RxhJdnT8CqTMKQheqCwMYoHoWn//4745ukntBy4reGt+P3lqR8p1s2g5j6/UPUbwkDaobi/iULo
 +xQK3m+2dO7647hE2Tj6+CankgQ7PhY=
X-Proofpoint-GUID: A-HHIagkRcyV5HimZ6me4j_8L2gZT5ss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwNyBTYWx0ZWRfX0E78ZYRycMa8
 1nwLOYyCPDanzju56pK5rzVJd0VJcyibx289F2mDPbPfjRLR8ZgQD2fTwLr3/g96R4EgdB/oERT
 ra5rlZNc5rFZ/ErOCDlr4Ky65JQ0Rnc8/63IQT5/eKGpZA9tvbCqbiOAaSmvCcNzfc0u7F19YhG
 bWY0HN7mWfvy31ECBNvPxUNJPwDKE7/Sr5qDb7beRtqLYcmOA0Kaz/gUnEx/FFkEcaoSOjX4amX
 3jAjikO3dFh7I8DuQORrv5D8Nh8XHo0AGpRQdpoXPkEGoogOoAKeN2LfBVpMy3b31KeCCpM+o/q
 KbnMjGj+zfdQICyorudxra7HSixKjqTc25a0FTeKHph3k66IAIG1vq+vvrALn3HIAyALspf3MSz
 UTgdAHL+aZBRGxvYftxapwhnwShbaNidV4iwBX9aV64ePWLc4L3SvRWhC0MyuvqjEfoyU7Q4s2C
 rNuF7SSBRy2NFiMdttQ==
X-Authority-Analysis: v=2.4 cv=CaU4Irrl c=1 sm=1 tr=0 ts=6a728f33 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=vaJtXVxTAAAA:8 a=jIQo8A4GAAAA:8 a=erm66U73ZP1BW7-1UfgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: A-HHIagkRcyV5HimZ6me4j_8L2gZT5ss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050007

T24gVHVlLCBBdWcgMDQsIDIwMjYsIERtaXRyeSBBbnRpcG92IHdyb3RlOg0KPiBTaW1wbGlmeSAn
ZHdjM19sc3Bfd3JpdGUoKScgYnkgdXNpbmcgdGhlIGNvbnZlbmllbnQNCj4gJ2tzdHJ0b3UzMl9m
cm9tX3VzZXIoKScuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQW50aXBvdiA8ZG1hbnRp
cG92QHlhbmRleC5ydT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8IDYg
Ky0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2RlYnVnZnMuYw0KPiBpbmRleCA2NWQ5MDllNGI3ODUuLjAxZWJkNzMxOThlMCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kZWJ1Z2ZzLmMNCj4gQEAgLTM2NywxNCArMzY3LDEwIEBAIHN0YXRpYyBzc2l6
ZV90IGR3YzNfbHNwX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAq
dWJ1ZiwNCj4gIAlzdHJ1Y3Qgc2VxX2ZpbGUJCSpzID0gZmlsZS0+cHJpdmF0ZV9kYXRhOw0KPiAg
CXN0cnVjdCBkd2MzCQkqZHdjID0gcy0+cHJpdmF0ZTsNCj4gIAl1bnNpZ25lZCBsb25nCQlmbGFn
czsNCj4gLQljaGFyCQkJYnVmWzMyXSA9IHsgMCB9Ow0KPiAgCXUzMgkJCXNlbDsNCj4gIAlpbnQJ
CQlyZXQ7DQo+ICANCj4gLQlpZiAoY29weV9mcm9tX3VzZXIoJmJ1ZiwgdWJ1ZiwgbWluX3Qoc2l6
ZV90LCBzaXplb2YoYnVmKSAtIDEsIGNvdW50KSkpDQo+IC0JCXJldHVybiAtRUZBVUxUOw0KPiAt
DQo+IC0JcmV0ID0ga3N0cnRvdWludChidWYsIDAsICZzZWwpOw0KPiArCXJldCA9IGtzdHJ0b3Uz
Ml9mcm9tX3VzZXIodWJ1ZiwgY291bnQsIDAsICZzZWwpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXJl
dHVybiByZXQ7DQo+ICANCj4gLS0gDQo+IDIuNTUuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==
