Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC93C1094;
	Fri, 26 Jun 2026 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782512601; cv=fail; b=tlIQ/hu3enAM0zRCLFUOWa6YxQDf058OskFpCof4BIBKQ0YOpSoTAS8WkU9ofpKOUO8M90YlD7LGnZwoQM+bPm5wpT+fu+cw880f+dlmzqsJbyDQlgpa+llwLmiNIdT1ee1E8J0SUsamiFh9jnqE0ZZvY2ukVzA2XlpWCsoFSGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782512601; c=relaxed/simple;
	bh=W4bFrMiS9ekeMT1wNHAUn7kK9i6XmZjnY3pQT7xMrog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nXmX5iK8TJBAw1nwc4mj1CF1B6qADySrotbPheK1iSc/+A8ck664GejqzmDcTkTm6Hs2Co3fdwpp5r4j550xSL9ui7KF7V6KB7+qBFPhndwIRVr9QKsnIGoke+ZrmKpDyhUfddHfxHR1ag7m5yTWxDwxtvPcd9pKGx08UxcAfKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=inucZxEP; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JJeLTPOa; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Uln9+7ra reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="inucZxEP";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JJeLTPOa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Uln9+7ra"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QKiXNo1733128;
	Fri, 26 Jun 2026 15:23:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=W4bFrMiS9ekeMT1wNHAUn7kK9i6XmZjnY3pQT7xMrog=; b=
	inucZxEP/KWVkHhItMWwMZ+d0MJa5eTcE+JzO3gWQbUyYU/ZERU2DkgJKKeGuSdf
	/pwatZUehYXU9raTfxo13KVfvYlBV6fqF/BohX4ciq1bEnK9y8zKjKStGnJ612O0
	tzC5Ap84JBxTm+HzZv+OsIFBWW/3YjFjFZq6a40M98c+LfrzwQJTbuD4RhM4cAsa
	4UfbJg24mRU9A+uVVxCfLclQWK/Jp4ZZKD+fesWKFqe7H0b7//jZG1Zd90iqCdQ7
	nT38I3oiJWndTpakeesIPRRPNObZqOeLJJoeAHmhqtbaT8vOBEyipW3jiO2Dl0bl
	QFmnjyUEVxkoPzSd53yHjg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4f20qtrm5f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 15:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782512588; bh=W4bFrMiS9ekeMT1wNHAUn7kK9i6XmZjnY3pQT7xMrog=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JJeLTPOa+r13Vprdd8mvztikZBjOb7Cf/WS4mblVyJXJm9xQ7nAIz82H9L5P1Jbv9
	 5WeEBOB8vLzKLXmO40yL66XwmF7x14DwKJ/Heh9E5Q79pqPWlJ59R4SKRTnl8aHV40
	 gGmpXbESVibJwO+/DmBUjIJIuNya4cDRDimOTHE22+OV0eoDNkR+UUzE+kAWtXhR28
	 dhw3MOf9mxGQQdxnwdYDcTPiTG0jlt2CsXo6AO3cAqaKU5p45Np6wAkO6vwZpTA3Hf
	 n+D9e5tpqpVoUb0lfNDMW3hM9qQd0fsIEX4EA8mGTEe7vCRd8NINKwuojOHSACl0dA
	 RtqNGmxr6qv6Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC2284011A;
	Fri, 26 Jun 2026 22:23:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 27429A006F;
	Fri, 26 Jun 2026 22:23:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Uln9+7ra;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00101.outbound.protection.outlook.com [40.93.13.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 41274220112;
	Fri, 26 Jun 2026 22:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plaaIh38XMeGcMO4EaIcmN3kDwG537u/1mewxLq91UatNgnzg0R/UqfTYd38z8unTT9tatY3PrcKrKa2LmhZrDCk0M+dYf8ecWQYHRp4/Q96J+qc6ULlEH28pz1UobLj89dPl8IxjOeg5o+jyQXYhYuhcLZ7x57C1tcIwjQzobAnrCYlrWci1W0VCmH3968iQAXdVzW5/URwQyaAEmiDq8w/iC8CA4sKLBCh3KPp9VXUPaUpFdMVwzGGBY7k1RkpK2ciilzw6X7xGlr+4YtUcAGkLm3bc8nTmzKgCa1jGcWN0rKx77i+aWX49oWuvckaMpNlFqkMpku6I/RhTPMR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4bFrMiS9ekeMT1wNHAUn7kK9i6XmZjnY3pQT7xMrog=;
 b=xPmr1eEK9HtWlBYpBEKUNQCBn0xmOdvjp125EVk4eWwRanW/MEcbTjAAXjUtVrothlDiLGZnk6xzCgaMT3BzZ8LhnxTNZsbaYsV4C8hKISUAf+5eZ+cAxBz+sh3NJ0HhFNc8gS7j7MMSEzaCGZikbr8lI1JRz6u+1sAdTJUr6pu54itW4rbBUkjSzjtDp4gFP45nDqaEDlavyg+SRiyg5cmQt1ARl3FZTMnaDNTp+jOtmY+mpXUjSOuGYXsnvnpLtAO5oR2Pfmw2WuQPSjjI7Gd4l4rrdamCQVPqRoiuCzysdYw7vz7Wcf8e+iD6hxwyMzN4oXEfsHnVrRzMCdSBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4bFrMiS9ekeMT1wNHAUn7kK9i6XmZjnY3pQT7xMrog=;
 b=Uln9+7raSfbbeix+KGRjd0G1NQcseGkAHjud/L2RRBPfS9IQmIBPDl6ueThHM/+1HY0Cq7i0MnP3T323Aq3Ffuz5yNAiYSQpTQQc+wqk/vYtg+5YIgomPMqy+tPgbUuh24z32CVNHO1QQKAAxk3jWPHYXiJWuzrd5GW6Jpxp1Lo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 22:23:02 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 22:23:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in
 dwc3_ulpi_setup()
Thread-Topic: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls
 in dwc3_ulpi_setup()
Thread-Index: AQHdAvg1DzvjBilp0EScXAaa5ZS05rZRbsKA
Date: Fri, 26 Jun 2026 22:23:02 +0000
Message-ID: <aj77LIT5EiOHze1f@vbox>
References: <20260623100801.738517-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260623100801.738517-1-ben.dooks@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SA0PR12MB4462:EE_
x-ms-office365-filtering-correlation-id: 5fbc6d17-0d3b-4d7b-534a-08ded3d17c7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 87xjzdaqFiJxpxRoEL941kk8kXZuZORTVCniYYXNnWjpC06FbzfChoFenDwNliljOYSEC4+t3304Qek5bhgLFg9jILKEYnRoaz/0BJrjziTIIsgfUpiGEd2gRXp39wtrG4Vx1UpoUOiwkkBpYZwV+kgMooZMztpUT/6UIvWRA2F1zfl75QTfsn87xvL/aXsOEOM/Mq89WCaX40CeC5xM1MC/MDELhBoFw5W0VyUNlNjdFpThb1St+H18mog82xUJbLMFeSXlSZTlyHYrSVjiLIZKrLYMqUEcClNX+vX7aFPGNQW+rcRJKfcIU7poLEf4pw37jzF/VwJHrg5J3mrNlpU/f73cLpL7Mu6JFqXS0A044Mo+C452dF5DmUNoIcPzu0RUD0tA+z+9XHo0W92Jk1yJZK/TLzHwA2LO2U784dEuDcmMPs22DZNFbNYItjLRtW6xwVM3j8Lrf75yPKSO3GLYYn8+ej6CnI42L4WPXAJeyv14w3mfZJ6FsYh9kraHtCZKXPk8+ghpDRwkLvAhJfRC1yX2GGIrbX4MMPF4e3SOktS6URu4POzzt7/3J0P4c00B80GhzykXCmXt63BBiODVszFELKIdaEqPavPUBeQLP1cTFHCkXPDlWW5xEUATI2Oqe6ZJrAoGH8jG3YvP0BvU4ZxxsXpS9dXbGBr97ImF1HBxMRcfALGshOeVMgAJJCttjub3VOWXRbdr7tUpEnnNIU9CVcVQdl1spqWewmg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkcxSW1lTXdUYkcvamJnUDE2RHZQNW9kMnNac2Q4Tkk3K3d5NCtTNjBxc3FI?=
 =?utf-8?B?S2o0VWpFQVFUcWlNekE2WHlRdEJYL1dsN204alRNcjhPSU52TWp2VC8rdmNj?=
 =?utf-8?B?NG1lMHNpWVhPS29EdTE5MUY0MWZ0allKZUNNT3pyYzZFQXdoUWpWUHRjRVd3?=
 =?utf-8?B?NkJTTFQ0ekI4MGxObzVMRUZKZmpoSnoxSWdXUDk5czhUT3pWT1RiNkw5bC9L?=
 =?utf-8?B?cm51Q3NSQVVaOGp0WGpxa0lrRGpJbjN5bENQNUkvdVpYWDhya3NqNUZoOHhH?=
 =?utf-8?B?RFY0VkQ4MlBVSUE0d1ZsSlZpQmtxTVZVMkorM1JobGtIVlJuY0VRckRBNHNZ?=
 =?utf-8?B?bUl1Qzl0QndoMVZWeThCZjh5RWREbXdmZ09SL3NWbVFnN3NFcHovelJHMXg0?=
 =?utf-8?B?Y2NyZUZYOTlyM29TTVVFSW1LcEpjd3h4eGNmVlhxcFpSem91UkJtMEZGMHIy?=
 =?utf-8?B?Yy9jUi9CRUpiRXFITTZWTnlFblYvdk8xSVIwczk3NGNhcklSditTdzhraklP?=
 =?utf-8?B?UEN2SEJBSTdkTjhjMDd6U21jd0JKb21RMFZTU1M1cTVLOXJGT0Q3L0tRMUtU?=
 =?utf-8?B?anNoRFJyQlM5SUh5UUlMSjErblZvbnZaSXU0cG53b1lMd3liUUNJMlVlR0pV?=
 =?utf-8?B?V01LNmVXbXQ2SFIvbndLQ0pzcWtMU1pLNE1ubFNYNTR1ZE5mT3RlR3o1VHF6?=
 =?utf-8?B?NVkwMlU0MG9UVno4Q2JHc2NtcjlVVjBtUHkxZC9ROEpMcXZScDgyaENOejVh?=
 =?utf-8?B?ZUw2ZHBKUVNBY25yTm9IMEZwTFNuRk9NZ0Y2dUdiUzdFNm5XTEw0QTFFUncz?=
 =?utf-8?B?dklPT1l4UjVJeklueGNnWFJ5cU0wemVYRElYc3BETFhDOE43TmZkMTc5Q0dR?=
 =?utf-8?B?M2YwZkc4RkwzNThhYVI1eTFIVHRIMkZWa0RvU1VvVDZ3YjdPMDU0ODJySzFX?=
 =?utf-8?B?eUFUREZEV3VleWRxYks1cGdnV0RiNXJtR2JYdk9FZ3kxaS80OFNheUcwU1NJ?=
 =?utf-8?B?cDlXcDNjSWZNcnRiQ3JSK0pvUENnQXV0bllXazN4SVlXT0d2ZGdMM0lrUWJ1?=
 =?utf-8?B?Zlg3Rk9HUFZlN25LWm1KWkVnMkF1dCtKU2J0bUZlWExzaUN3dVlUQXJRbTRH?=
 =?utf-8?B?dWE2T0RWUUZ3RTZRU0Qzd2p3V3hlTnFiUitjejhpZW04enh6dEx4ZWpnZ1dL?=
 =?utf-8?B?T21leURmeGFTSWV3Z1E0SDRYekpTU3creEtVWDc2bEdMVGVDd29Cakh1SnRZ?=
 =?utf-8?B?YkFqaDZ0WWkxWEZPN0g0U0pWNEhUQWZiVCtrN0VmelFJVmpBMjVEY1BMTGdG?=
 =?utf-8?B?MjdYeldicExZQWM1TlB0cEJQamtuOFFKbFFSajc1M1lsbjRwcWNhN0FxV0xH?=
 =?utf-8?B?NGxYbG8yRmZ1ZUIvR0VoVFhlRjRVQ3pRSElXNmNXYXlodzBSb0FBaE1ESFV6?=
 =?utf-8?B?MkcyRGRXYlgzVUFCQmk5MUhKWmZzbkNGSVpmVG1wNXBNNzFWeW9KSzVweEpG?=
 =?utf-8?B?bEcyVDNCY1FDREpCREN3akxLYzVGN3B5VjdNaVRLTDA5a2tOU3Mya2hIUFVL?=
 =?utf-8?B?bVVsVytzeHhVaTFXR29TVUNBSXdLODRHbFplbk53cUxqK0FqRkpJdmFjeDBZ?=
 =?utf-8?B?QXVVZkhCTDJUdzZ4SXl0RTl1WC9FTHFheHpzNVRoK3Bva0EvbDlLbkRicGZM?=
 =?utf-8?B?MmlGdEpRZjY0cHAyRnFpYkt2L21HaHZYc01FLzZzZWNWQnYvY2Y4WVFtTExq?=
 =?utf-8?B?LzBoLzFjaXE4ZmY5bjA4dFZxbnlWcTdhdnd1UUNCcDEwZFRTQlNoYjFzbEJE?=
 =?utf-8?B?aWZ3aTUrZmJIQjZJSm9BbU5Nb1Y2dWFPS1lXM1E4V3dOVElUQW03RU1mYzJo?=
 =?utf-8?B?eURsdk5GUnkyU3JWZVRkZGxVREtBQ0ROVFBBQjNJdytVcGFpSWRJQW1zNGNQ?=
 =?utf-8?B?M0VncFhER1JHZU92dEF4SVlDbXpWd0RHWFdsZFBSdUkxU1FiMUk2dFBrSjBX?=
 =?utf-8?B?TVRlRWY2NmthZ3ZBanhSUUF1R3p1TUNUbUgyUjcxTkdqaTJncTlEWHgwT1VJ?=
 =?utf-8?B?N1FyVmRqUUQyUWF4RHRiVUNtcFNwSnhQUVMrY0lwQmtFalhXZ2ZReCtRVTB6?=
 =?utf-8?B?anBibkE2NDA4OXRvdkRYaFNLeGJ4MzB1dG8xbVlVY1l1QXdCRkhaZWRaNWo2?=
 =?utf-8?B?c3JhQ0l4bHFaN24wTStaTzBCUjIzL3JQbzQ4NEIrOThtc1BXTEUwdk9ySEM0?=
 =?utf-8?B?VXBuaVJLYlB5ZW15djF6MjQvamN5d1BGR2hxRkhkWW5iTkoxcER4NUVTSzJU?=
 =?utf-8?B?SmxndDgrR29RWG4rNTZma0dUT3ZaNUJ5dkNYVm1ObW5CYTc3T09aUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8D42687F8A83D4987D002775A7AA627@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	NTEiAdcmWe5yas6zDrRcFfSUMiCdpjHi96zQR1OniQaJ6oS/4lX2G4g/sf3lEdr9TQFELld2QA502+CZM2iD4MZ5RRyKMhVuE8p4zD4IucFpEQIxbGQYoXolcZD/7XtCpP4ODIljpOrCw8egKWmg88jm5oCZoKQZez3f6qUrCuw0zUsL8349qL7q1ErhwMB93Olq3dW9NwcbNsqtQNtLxvn7omhQQapaKfLhwkvvfmkz+z9VHZbn2goqLWeZM36VxU4jlLBJmfc5lTtLiIJqzf8cqEVNgeIqTXTgRlO5tGpAKFPEpbRIk1hpKMBOaU9Or91HUr6yAvgesGXrgBhnhA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0KC1yQYYtcIZZr24TegKtxaExK5Dkd5munh5PV0tJH+fRWoRs4AO/Y9urfXrMyNjnfJ6U+dHxKcqUOBa1KysWwcJgm4oRv4iY4GhmMarRepaNH64zZvfgCGcYh8RHH7ArEFXabkk+terhsOzBDuZjR26TflpzP3uczimUVulEY1rHcGvtpPMoGWlQb/xrsFAi/ecVubg2X5yFwkfVx+iGYcQoU12JqxGkCZ4SIrC4f9eSxY6okltGBWbbKcA3GGwdkWg+Wbio4T0VlPWwWWr3Yk3BY5qQsfFDFYOA8G0peM+TY8Z/patcVUV/mSR/DyihqupxqhwhoBnSv8rNC3RUin0+hkqHvGtxvVaIASZCtMQr728TpX5dzskYogjfDLG0c/pnprZbzV1Y3PuRp+CBb4NbsqaXeaEtJYmCgB5h4kGTrSTvnpia2UJQBlvNFYNMxRoKIEHyCUEhnuU+J9oWrBozgpNBQ9/gFUpk6suVjfBuNKyBwEFm2XyIIJVHj4Sbuxdu0J8zUG+XBCRfR+PaR6rO7E0YHC+zUdbKPDHsTsjQLkwxQmYcuAfG5zDvFd50uCCwb13pJEOJhNqDT1YBj0nUuO/2nhE/FhITIGsMsyVZE7hme0Z9/0+lxHtklHIoLvjqnapBABtjC/OHgTG+g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbc6d17-0d3b-4d7b-534a-08ded3d17c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 22:23:02.2720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OP6P2QF1sGsxSMO0RHxFAWXTLyiaqXwrEVQxXqWpT2VLnYy2wUW3cJgK9spHvta9Lo4nod1TgYa1DNlnKKBuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
X-Authority-Analysis: v=2.4 cv=HNPz0Itv c=1 sm=1 tr=0 ts=6a3efbcd cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=1EsaE_6oAAAA:8 a=jIQo8A4GAAAA:8 a=hyiVDmQI7Bf5-gWvKFYA:9 a=QEXdDO2ut3YA:10
 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4NiBTYWx0ZWRfX6Hgq3HIy9Uww
 1Sw/EIrQ/h8aSeNVzoQPekDsyDNlAsoGo0Ki4hZz016hMn8qigpdwe6+whFl7MCLBxeItAvTRz7
 5eZiNyDQjMcHBXhzkPAq8B5XIjO5EaI=
X-Proofpoint-ORIG-GUID: rCEyIlN2ER_8nF0E5xnzC8BNVS5Nj3gN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4NiBTYWx0ZWRfX8ZAeCDNFE/6p
 VzwmldeYVAc+8WKE5J2GUODqJkBjsOH8AaExbqRzqqfaTIkcvGC8Ue+C4AHewg8GMWx6OJ6Yu2Y
 kAH/98eZlpJb/YEiuFADvg5wf1ng9CpY1mAHhM5+uNo2JVxbZGEwkbXjwjxhVuAyw2QmzY94KTp
 l1i3fWLk85H1jTCwCxfsOfjREMtWwlUW70nqvjcA5PUTMg5qmqcb/pb8BgVF11tpL1ngQmbtTFD
 0jgKLlx+67e3PDyNBF+nVGAW6/2lQsTzn/YogKqFCUr7BxwKBQ5zqvpRGEh56jNIjUiTr4vPlrk
 XqbS8fGfiRswlRNdvb+oeZrWZPg29b7OVwyq/0Zb0d/XTi3QWw5ANCORCR58ZxXndUgap5fT4Yn
 ihHAmFdzZ/QvEsdmrYbCaku5dMspDIeLK6BcVigrP9UCbq7TWTh7KW3KKux2k8TweCO29E9fGey
 o8uxxGFftF4+JcZRjng==
X-Proofpoint-GUID: rCEyIlN2ER_8nF0E5xnzC8BNVS5Nj3gN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260186

T24gVHVlLCBKdW4gMjMsIDIwMjYsIEJlbiBEb29rcyB3cm90ZToNCj4gVGhlIGR3YzNfdWxwaV9z
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
OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gX19pb21lbSAqcmVncw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPg0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNTE3YWE3ZjE0ODZk
Li5jZWI0OWYyZjgwMDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC03ODksOSArNzg5LDkgQEAgc3Rh
dGljIHZvaWQgZHdjM191bHBpX3NldHVwKHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIAlpZiAo
ZHdjLT5lbmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxheSkgew0KPiAgCQlmb3IgKGluZGV4ID0g
MDsgaW5kZXggPCBkd2MtPm51bV91c2IyX3BvcnRzOyBpbmRleCsrKSB7DQo+IC0JCQlyZWcgPSBk
d2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19HVVNCMlBIWUNGRyhpbmRleCkpOw0KPiArCQkJcmVn
ID0gZHdjM19yZWFkbChkd2MsIERXQzNfR1VTQjJQSFlDRkcoaW5kZXgpKTsNCj4gIAkJCXJlZyB8
PSBEV0MzX0dVU0IyUEhZQ0ZHX1hDVlJETFk7DQo+IC0JCQlkd2MzX3dyaXRlbChkd2MtPnJlZ3Ms
IERXQzNfR1VTQjJQSFlDRkcoaW5kZXgpLCByZWcpOw0KPiArCQkJZHdjM193cml0ZWwoZHdjLCBE
V0MzX0dVU0IyUEhZQ0ZHKGluZGV4KSwgcmVnKTsNCj4gIAkJfQ0KPiAgCX0NCj4gIH0NCj4gLS0g
DQo+IDIuMzcuMi4zNTIuZzNjNDQ0Mzc2NDMNCj4gDQoNCkFoISBIb3cgZGlkIHdlIG1pc3MgdGhp
cy4gVGhhbmtzIGZvciB0aGUgY2F0Y2guDQoNClBsZWFzZSBhbHNvIGFkZCBGaXhlcyBhbmQgQ2Mg
c3RhYmxlIHRhZ3MuIEFkZCBteSBBY2sgYWZ0ZXIgeW91IGluY2x1ZGUNCnRoZSB0YWdzOg0KDQpB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFu
a3MhDQpUaGluaA==
