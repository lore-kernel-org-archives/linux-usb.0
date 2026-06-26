Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2329D294;
	Fri, 26 Jun 2026 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782513189; cv=fail; b=RAME1YLNNx2mmrr7PltppueDEX/xoB961zHXTVPbk3TdXPOYrJPMGCrbrOdavHovJNVJNdsgUvc1WVywacOvRmUrvoTNwcZJQbJGZvzoFvnkm0oX3QmyEuqQ+4FOfRvrB/6u3Pxw29YyrO+iogUSnBePTDjCnMcvOt0Dnf0dr1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782513189; c=relaxed/simple;
	bh=VaWSrTy9WNEBO5dqwBErey4iFcAA4NU+xIf7eR9xo38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YRbLRjgU92c2BooWPr0HmArNRXW82a92CaYPu4fy+sy9lPMvo43Q4ab+fCvH6O4fNNznsKKohN5ysVmQcee/TLgzhqSf13bJcX3SyQ3pb799xvr5ood1EwpjD8oaxKZg5lZ2sUD1lsJfYoP1mpGm5L3Zo/vaw4n1CwFi9R5I2no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e3sQzAXA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EjQbBndV; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UIR1DZKM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e3sQzAXA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EjQbBndV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UIR1DZKM"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QKiXOp1733128;
	Fri, 26 Jun 2026 15:32:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VaWSrTy9WNEBO5dqwBErey4iFcAA4NU+xIf7eR9xo38=; b=
	e3sQzAXAJLKo9j06aAS0quXq/TpbD4kIA3WX8lTb2eEpQAMFLJ8lybxJk9/ITDZF
	Lfx3ASnsPryEPkx1cnMPi8+Iyiw/bXdtG5D7j1KKUdGnRU/EFnAC8JDk4uFMUd1q
	x1ymj/8OkCqZDqLUphtSqg4w5cJi3nc/WjLrwDdzgSRRhgQyhi5fzet3UCfrTg0E
	XRL4CsTBMb/BW6eXJIihK6xE006MG2Qk45zHi2G6IF6W2DrUq6JBTDzhHuZNOlvw
	mtKv+1JfNX5pirNq6e/lcf1EZxWnPmPai4Gwi+gdoTtMFA6BvBAMfMiGCW4FyGY2
	hkSHox55rUURzyJIDzbaYA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4f20qtrnxx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1782513168; bh=VaWSrTy9WNEBO5dqwBErey4iFcAA4NU+xIf7eR9xo38=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EjQbBndV9/YULaLeJE6zuOw2yW3pAVyARgJ8Y/rVhNy8hjJDFFo6oJHI9LpBUZr+8
	 9RomLnZA+zI7VmyTm7AeH4BKu9/KSWaYTjwWBFvBo0Z72y65FxjzhNz+ab6CEB8S+F
	 mBQ9at2BlNHAJ9muT4k4J6j1/s7X6/h06JR9eNKSwGrGkZfzXCcR5LFesK4+R86ngd
	 8NQND7Pn4UHtU5e4v1VGNkjEOB8OFHc8PnDqZwk0BerDJUpsuLN0GHrAPQvACOH9yg
	 m9EMSD7kAZie2Angk+4jKM3BNiMQYF8NGCOHyz4BVM0BrCEZWTR42q9Q92370jCmkP
	 LaRP75vyafw2w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0BB084011C;
	Fri, 26 Jun 2026 22:32:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 149D4A006F;
	Fri, 26 Jun 2026 22:32:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UIR1DZKM;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3C8EA220359;
	Fri, 26 Jun 2026 22:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5b4vpVrHDeBz8NERvSznbqCzRiM8RxxDlzqVmQqiIp4btW5+z6ULzL5puOY7pb6uAULJEX31lgNAv12mvEJqCK/vpVU71E0zM+b9rAAt8xsjvKoXOhA9UrFPqZkFN4erDWYQ8JBSsUfw9620rcf2mFi9Lf38IhgM9ItgrLrqNqndo0vl3yHVddFU+dLHdNFNL/nMjgUsFtxu8oll2FjA5c70EdbAXDhVmkzhVrgLreFWSBCiybjAtS2wwuCjcqUFzUtvFNny4ILXEy+RJMMDxiWQ+qXfVVRsOMhx5o4cTxiwuQBe0KqJ5Nzld3kb7qiBZ0XpGO0Mr1p16qEqNL2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaWSrTy9WNEBO5dqwBErey4iFcAA4NU+xIf7eR9xo38=;
 b=I82p9E8xdFrKUEnoxZ+c83bftcc/4Rs6F5yGO0inew9IlBiTIfjcsWJ4opToPe1q+cNtcJMMhvRtoV3nmHkvlUrGXy1KKOfNzU9wS/wiss6i8QxA306dt/802z6Socr/vDY6G4+zuL6H5WU2xh4+o4Sb1SSpKutb97ccCi1maLlC5DJk75S2Evh4ZeSj6L51yAltOPkAAlQTbJ1y2NvW769sQH0pJpjyyS9wc1jFZVodg+hZRKWP0P7PQhFhKZSNodn2U9oBhzdE5bQYvqavxmc3wbGw4c/Z2OVWsVjc1LyeSQFYT1tgINiKsG8WzgqE4qKBxgzzxa6ICYDqySnyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaWSrTy9WNEBO5dqwBErey4iFcAA4NU+xIf7eR9xo38=;
 b=UIR1DZKMiMFXyhiezhjXsZcEVcVBtnTstYYmzuK5KiwpL+lU7n4sOtf+6NoQ31hB34F95Z7xXDGmKdUdFSiGoOdPJJuzo8gBhy0JGAm/6MKzvY4jH6zO2E3T31dn7kq+buNg81hIVYcR+x9CGucn2PQmmyww8u2J2vGUergfweA=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 22:32:38 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 22:32:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Thread-Topic: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Thread-Index: AQHdAviUse0Uj1BQaE6BbtUfschHrrZRcW+A
Date: Fri, 26 Jun 2026 22:32:38 +0000
Message-ID: <aj792C105VmmZ_nF@vbox>
References: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB8124:EE_
x-ms-office365-filtering-correlation-id: 46011daf-7185-430d-ea93-08ded3d2d3ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 g+oaLkj8cA7KJV7wPADpOILKL+XOHmQEKuPcY5KkV588urKkzH2Lz8mTVO4q8Zo2otNM0zYQJRejnN/PNCn84HRtbBhfOTy4FJEitdbQTZgfdQg5Zvu7zOzcUulywv+G2ujZe1YVlpnEFKAbYkwew/NS9b/Vuhs9xoryqSrD6LpfksuBx8oVtfQmgIgMlL3RWAOC9qccXbFpORO/K49NQ/mkdSA1GR8JJ98RR5rI/yaFQctVx2N5dJBgyxDp05iBtAgmKV13eunL9HyvnFohnpo+Ea31jy+ttG8Puy7fxMgydwtzVf8yiV4OhSlz5TafiXO8SsNwQRckXFwacJU9+xmmpbHK3XpRRpuxy1Qab9pxV2ZovP9u99r3CcltHN42JPgZxif5MNJq7NWZiTcRFjUqgk+LA+fDa3LYtO7NiMw7z0YQDaS630sLuwXNaldFrDECXylQCkwBy1uoYOyEjae3YblYxG4ZKhhd7T+DE5D4X5hmwK6CZPt8PlPQOR1ZfnMpViBFtGxg7KMS0dkRm511RZL86NoBjPtBmCAcMZhSMTCZmlVZrnzGpVce6Jbuyfvpjg81W6OJpjrseo1jyXrCHuGJTX7Ue25/ijSXNsNbFRrE4eKy59mwRPV4XnTuRpbgbR0S0s6YtIQqkYbVGi7eXJTa67kPRZN5rwW2OTjLA02u+SkumKos2NdAPYxw4KZTWw+eILZiNB427LXufoTT3ufvAAmtaX5/jwZGrtA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3YwNS9hZmNXWGI2MVdVZWd1aDFMTG0yUmU3Q2dscmZWc0R3dWZmUUczaEQy?=
 =?utf-8?B?TjJRc1liOGpobUtDZ01GcTNmOHhJa2ozY1R6V2FYVHNkZFJ0OVptQzBZZzhs?=
 =?utf-8?B?WWRVbmpLY3V0SEtmYlVIQWxhcE5tbUZzSHBSeVBMWXdyUHJrUVRsWGNBUUlE?=
 =?utf-8?B?ZlM5NnFMSkNVUWhGaUhPTTVPNHUrNi9MSmJkVWVqTnp2eHVucWtxNDR5eFVa?=
 =?utf-8?B?eFcybzRqMElrQXRPZ0lMR3ZuSWJ5YkRnVkJ3VGFITWdnSmhPMTM1M1ExVGlZ?=
 =?utf-8?B?U3lPR3J6WEh5ajlSWnNxMG1KbHNxQmY5NnFlcW5SRkdZRmxGVG9Rb21CV0Fx?=
 =?utf-8?B?dHFmY2FJZ25CVUNQZlR2bE5DQ3M1Tk94OW1iSHNFOTI3Wklwc3oyYXNka0ZE?=
 =?utf-8?B?TFVsMW9KWGhIVlhmc0dRR21wemd4MFB3L1RuV1lyWWNyREtzTEtDZ0tVcWUz?=
 =?utf-8?B?cE9zelY5S05IMlBrVnBxMlBmd09MMWpvZGp4N0t6Nm1YQ0FsYnBSOGlBWmRu?=
 =?utf-8?B?Z1FERGIyRHp3cEhONThvVVE5QjlYV3RKQ2RtR2lWdjhnNHVWUFgyNE1XWlVj?=
 =?utf-8?B?TUJ5SXlFNTlSN2gzR2NpL2JFSEF1VmFWbTFWRk1aY2o4TXpzRHRya3Bwb2Vo?=
 =?utf-8?B?ZkF4aHpjdW1QVFNMSFRmdzk1Z0FqNE53L1ZITUlGWm9vbi9zMmQyRlpUZHI2?=
 =?utf-8?B?bi9rNWN2RjVhSC9ROC9wRk56TXZGN0Y2aUFsRi9hd05MUG9vRS8yQnd3bjd2?=
 =?utf-8?B?VXR2NXAvcGpHVFE4M3JKRXk0K2VrWmNERDdQc1IwSlRWYjl4QllGWnJsWWE1?=
 =?utf-8?B?Z3NncXg1bDNVeldhODlBTTh2YVhNUTRZNmdCTTcyaDdVc0pSSHhJc2JLbjA1?=
 =?utf-8?B?RkQzZTNpMzFPQldaanBXNWdKbTVoVDU4NzFoT1FVU0tXeFUrN3dXbW5vNzZw?=
 =?utf-8?B?WFFCNjYwUkZSMm1xWHFCL0JmTzk2Yy9NNGhHcnNpOTZnMTFuWTRRanZ1UWlx?=
 =?utf-8?B?dHVqZ2NZRWlqeTF3SlpDalVDUkRVMG1RbFVKT2N2M0xpR3djaG9Db0dCQjFo?=
 =?utf-8?B?Mm5FUDR0SjZOY3hqcytPNDZNTU5MM2U5VjU4SWY2elRzSldVUy9qdHo3c3d3?=
 =?utf-8?B?UXAzcnQ2ZUJWZ2ZyNEdmOTNrZUhMQjRGRjlnVlVTOWJiY1BldU9KWUR0RzB5?=
 =?utf-8?B?aW8rRXV2VU9heityeEluN0ZnVHZPdEF6T1JldHQ2OFI2ZmtFdENNU0xmcVN6?=
 =?utf-8?B?TFJxbEtZRWRzdWgwSDZ3aGxxSTVDQUhhcFFFRmhWK3pNYmVmeTdhWU1VRzhY?=
 =?utf-8?B?cjZCMTZwNzBSYnJBMVMzL2c4U0dBU0hDSUcvWFhFVGQyWDNJNVAwRS84Tmtj?=
 =?utf-8?B?VGRGaEJjaDVodFFrVm93WmRSby9jbEZreERTK1ZjYklyNnRqN3ZIUEVjRTZQ?=
 =?utf-8?B?N21HYnJUNittRHpVVXdSc2U2NmwyNDY2aDVtYSs4K2UvaUQrSEZYcG96cVFE?=
 =?utf-8?B?QkYxVWlrSUpVQjljdUNKOEZ1SVFYVlpQSTZEVFlkOC9kblJPZHN3TCtLRFJn?=
 =?utf-8?B?aDB4M3Q2N0NKRkZXNjFZNW9YYklXV0FVeXZEcXBpREl5aWdlL2xPUk9TSFBX?=
 =?utf-8?B?VnVBYUhZeVZsbjE1WGFXeW0xU3RXOWtKR29rdFdHVVI3cWFrdGt1b0x6NHZh?=
 =?utf-8?B?VkxxL01hVGVvTVl1Q2RpTkgwSUxjUC90Yk51VDRncTBhbWJEU2wxZTcrRC8y?=
 =?utf-8?B?cVpMVDczTFgrYVZKL2o5WlFCUitDUE5QYXRCdEdvNnErVW53dTBFcGpTSCt6?=
 =?utf-8?B?YzdYdWkrblpmRERWWGthSUZ2SDk1OEJzUVNvV1ZYTi9ENHUrckdKcFljUDVy?=
 =?utf-8?B?bmlzcDByNlFBUklBbk9EODlBL0dEa0JyOHlvZk5PeTU3YWdrY0hVYjJjVWtw?=
 =?utf-8?B?YWVOcmM5SkFrajVjbEM1NGh5QWR1aCsxcEl3Q2xUellQVDM3c3FWRWFuenNp?=
 =?utf-8?B?SXhvUEFFcWw5WkJoZXBqQnFlTFpnb0NVNHcwZ21HVW5yZVFHWWc2WkJFRFNK?=
 =?utf-8?B?YllFR0tiRzBXeEhMd3ArVS8yb1Z4VzlMRVV1b00yQmJrdUxFT095RldZbkVC?=
 =?utf-8?B?cjA2b2pYR0ZIUHBoQURTWWRDT0JzYzdrc0Jpd01nU0VDUExnTDlCRUhxRkdT?=
 =?utf-8?B?TitMZE45bGVPYnE5V2VTN1cyTjhQcGFrV2tNMzlHN210UUN4bHplQzJGRkFt?=
 =?utf-8?B?cElRUTg5a0wzcjM1Q2RhdEpYcUliNmdDenlsWkVaOHgwRlk5QitNbjA0dGUz?=
 =?utf-8?B?L1RCQkhsbk1STE5VN1dBLzEwTnhvRjUvVm1oV2htQWFocDJVWDRadz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74C23D9E17FF2B469BB8B683439CA368@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TbA/w8G1Fmij2jzTbK5GhBZZ45orSxAK/xWUftNPGncHjUgXwfsTIsx9NnLoHZi2kCoyxeFOmeNXMMhzgN4ylpNTkBbfaAtSjKyUBrjgOc/7Ij6GEpDfzEGR2NL0oPQpQfiHH/n3cN4Gil9zfZLCKh6HUgx+nS1PZJXOss518818iN6TJODHdkCGei+a3kePPxwYk8O4CXMppOgIV4J2MUHLjjVkLETURSvgbBT4EBWCKCa5Mj1luKnwXIsfPB7+BZWprQGI9iST9F/CG08C27ZuSZL7iH+nN83OAQTCR8S7sqvApnbCBzRDVFTc7d9+ibqVOeNa8DMX+7uEfLSMGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7gIo1yJ6u702RqR+RWLygr/Ou9vP+xJ6DdeBQKyub/lLgiziCzI3T6StM2suzG/SaiE2r4UYt3YHXsrUKiodu23tVSyHun2wMcFpyULEOyxwfErU0A5dm04RtW8mP15qS/hD5Go//FI7MIpiH9zjzaRjD04u0xUBbcas9MMDjeTHv4hdCMDKxF+/7g22iSEb5C1gOv6TX1cypE8bgTiYQPLGIJeHX4wlMMXyXIAuLT6/2uhBISfE6HFnPQd8U6hDM1DufZpxuLR7h3i893xp34kFPzwdxtvog2EI0jnZiatmD+x7XsXOnlxSIPUtI/i0NpGhNKRAaxNPUgG1UkIXlrTNjgZm8WwO4ChHrWkSP7pCpHa+R3NpjivtndHVBGa6Ot1kmzJqWagO4kTyN0cNhJ/hEozxRr+hIHLesBdZ3z3PU8f04DV2b5P5Er4En4p83zAr8T2ebipbkqq1tzWlEzZhWIYw5x0gTqZUukwCINSghQWEgjmuvwyPhmjD5oP4ap+bn0KhZprRJfJ2ODZht9xz0uVLNRWOBMhmB8VtapP2MppNBPJkJ8VdxsT72SAGDK54q4HWTzT3QNDyfu/qp1+84BTzq59fnBFLzoEyC66f8k5MDdVhCZeNUpMWvb5noZ+gG67mMx0AJq1Pj7UJGg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46011daf-7185-430d-ea93-08ded3d2d3ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 22:32:38.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79vndJ7cmH11WsKASj/PS0qa0WHKo2pz7IuWIuTuxzRIO1zUCKY0+9W2dgcwOA/Z08qVWH19IyGnP5QzRHO/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
X-Authority-Analysis: v=2.4 cv=HNPz0Itv c=1 sm=1 tr=0 ts=6a3efe11 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=1EsaE_6oAAAA:8 a=EhAVchWnsfHWGx52RlIA:9 a=QEXdDO2ut3YA:10
 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4NyBTYWx0ZWRfX09dg8IcLvOgu
 I+2OJ592PnVhQG/yA0iMdwIwuLfrlQGoQirH/GAOxdX6en1QKfVpmHVLaL1MgZc3SL1Gyt/00NG
 M7clux/relNZnzRJ+wyh1udESYvOAt4=
X-Proofpoint-ORIG-GUID: U2hRchiDoKy3iGLh9BkBUSJNbekgkoxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4NyBTYWx0ZWRfX+6i5YUrFmCJs
 znNe77VrNJJtp+bgCQDybL1ex7QAm5aIH+l8pW6//ivKiTarnVj+WILTo6eny8v0fHtenjKf9fj
 /Gopbcq1zNrR92atGWrz2a1rS0dsg+ZM96pYYtYUyRqL8KO2DG1JVX10Bdzuo+GvIW+D4RN+eFg
 Kp2ZXq68VPf4BXdGFCZdJX5VVhNrcSDHp8rZ9rPv/JSHWDVapRLwQRku/2OQeqvSlwCThmhwVvT
 MxZSmVZRAsvauEupOnGR4g9xvysIYtWar8TDsNXMV91TZKYbIeXmGuvtiX9thuLFzRMwd4Q8i06
 yIjV8IzPURFviGtRziKI8qe3i5KRt2iI1PvjnKUKW7h0WdwwIVCekoSvdcTPaEO6AJkTksER3wQ
 pIbaGKTV0QHxgiQpUpScn60rYzaj+ajeDwXv81oEYRrHbB3Nv4jaXZ6yv72jjS4cc5Vbn7ScVkG
 XAwxkP/GELSqkGqRG1A==
X-Proofpoint-GUID: U2hRchiDoKy3iGLh9BkBUSJNbekgkoxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606260187

T24gVHVlLCBKdW4gMjMsIDIwMjYsIEJlbiBEb29rcyB3cm90ZToNCj4gVGhlIGR3YzNfaW14X2ds
dWVfb3BzIGlzIG5vdCB1c2VkIG91dHNpZGUgdGhpcyBmaWxlLCBhbmQgdGVjaG5pY2FsbHkgdGhp
cw0KPiBpcyB0aGUgZHdjMy1pbXg4bXAgZHJpdmVyIHNvIHdoaWxzdCBtYWtpbmcgdGhpcyBzdGF0
aWMgdG8gYXZvaWQgdGhlDQo+IGZvbGxvd2luZyB3YXJuaW5nLCByZW5hbWUgaXQgZHdjM19pbXg4
bXBfZ2x1ZV9vcHMgdG8gZGlzdGluZ3Vpc2ggaXQgZnJvbQ0KPiB0aGUgb3RoZXIgZHJpdmVyIHdo
aWNoIGFsc28gaGFzIGR3YzNfaW14X2dsdWVfb3BzLg0KPiANCj4gRml4ZXM6DQo+IGRyaXZlcnMv
dXNiL2R3YzMvZHdjMy1pbXg4bXAuYzoxNzY6MjI6IHdhcm5pbmc6IHN5bWJvbCAnZHdjM19pbXhf
Z2x1ZV9vcHMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIHwgOCArKysrLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtaW14OG1wLmMNCj4gaW5kZXggMWNmOTY1NDBiNjZlLi5kZThjMTdiYzk0MGQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gQEAgLTE1OCw3ICsxNTgsNyBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgZHdjM19pbXg4bXBfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl9kd2MzX2lteCkN
Cj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGR3YzNf
aW14X3ByZV9zZXRfcm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+
ICtzdGF0aWMgdm9pZCBkd2MzX2lteDhtcF9wcmVfc2V0X3JvbGUoc3RydWN0IGR3YzMgKmR3Yywg
ZW51bSB1c2Jfcm9sZSByb2xlKQ0KPiAgew0KPiAgCWlmIChyb2xlID09IFVTQl9ST0xFX0hPU1Qp
DQo+ICAJCS8qDQo+IEBAIC0xNzMsOCArMTczLDggQEAgc3RhdGljIHZvaWQgZHdjM19pbXhfcHJl
X3NldF9yb2xlKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSkNCj4gIAkJcG1f
cnVudGltZV91c2VfYXV0b3N1c3BlbmQoZHdjLT5kZXYpOw0KPiAgfQ0KPiAgDQo+IC1zdHJ1Y3Qg
ZHdjM19nbHVlX29wcyBkd2MzX2lteF9nbHVlX29wcyA9IHsNCj4gLQkucHJlX3NldF9yb2xlICAg
PSBkd2MzX2lteF9wcmVfc2V0X3JvbGUsDQo+ICtzdGF0aWMgc3RydWN0IGR3YzNfZ2x1ZV9vcHMg
ZHdjM19pbXg4bXBfZ2x1ZV9vcHMgPSB7DQo+ICsJLnByZV9zZXRfcm9sZSAgID0gZHdjM19pbXg4
bXBfcHJlX3NldF9yb2xlLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGludCBkd2MzX2lteDhtcF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiBAQCAtMjY2LDcgKzI2Niw3IEBA
IHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAkJZ290byBwdXRfZHdjMzsNCj4gIAl9DQo+ICANCj4gLQlkd2MzLT5nbHVlX29wcyA9
ICZkd2MzX2lteF9nbHVlX29wczsNCj4gKwlkd2MzLT5nbHVlX29wcyA9ICZkd2MzX2lteDhtcF9n
bHVlX29wczsNCj4gIA0KPiAgCWlmIChkd2MzLT5kcl9tb2RlID09IFVTQl9EUl9NT0RFX0hPU1Qp
DQo+ICAJCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZHdjMy0+ZGV2KTsNCj4gLS0g
DQo+IDIuMzcuMi4zNTIuZzNjNDQ0Mzc2NDMNCj4gDQoNClBsZWFzZSBhZGQgRml4ZXMgYW5kIENj
IHN0YWJsZSB0YWdzIGFuZCBiYWNrcG9ydCB0aGlzIGNoYW5nZSBhbHNvLg0KDQpUaGFua3MsDQpU
aGluaA==
