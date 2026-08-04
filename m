Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EDD344D8C;
	Tue,  4 Aug 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882841; cv=fail; b=S1iwS9AV/oCG7RkhWPWDp0uIrHRUEqbQ+GLQdjucvADc3sKbdYjYvQruetmKjY1sR1MZB83lhSI1KvrgkvUceOJgufVbLv69Jxy2EcRB43yNoyg0OORjMhgXH+3EXLSk2ApH9+0KBhpuOH9QW2qfnWxqksWb1oKhh+IelwX2Ss8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882841; c=relaxed/simple;
	bh=KNGJKXNLACD6zqfsEVSzh/LolMuVoSlkLeXdccsfm1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bohBDDsmmOja492t50H/A/eJaSfaSYlT2VRulJBNT2gwJqY9LoK5ImQFU5caExYzEbiaFeDcvvPd7Ke/qoFIPCJis/S8DPFA+Z0ieMoSiGPGDpnsY+dDubzJgyKFT5yO/tWSIAHgNmIwfbx558FB9ND27Du2ZJM3GZLaKs8PTVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O373KiHA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OZmzTQuF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YAvcpLs6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O373KiHA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OZmzTQuF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YAvcpLs6"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpX5G1535166;
	Tue, 4 Aug 2026 14:25:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=KNGJKXNLACD6zqfsEVSzh/LolMuVoSlkLeXdccsfm1M=; b=
	O373KiHAWtZJ5NMva0DW1ddBxQxIdPXTGduRgUhg/9koxxox2u5iTfa7a7ZyxqAN
	jMjwEMlksVi8OFKavCRlmTPhOXkh1H4Ii+h3UOCEUNs1JUl0qvrit8nrL+/2aYzg
	Xp3z/dyH4/qi3BD1ndc/nGRbjDBmYsTjZUm6ZNPn3AOBfMpImIcuTyQoguJBLD24
	jvh5jd2wrfwDjoYBu/P11x+cgM4mtk6Ysq9b7erYaA191cagC3j9pwc3RcLia1XM
	I5s2HFkA1EPJaE8N9X7e2STRWmtJuA7HUO6dLqCYmWMj/U1wlD+1AtwNkz6254FV
	gbfqYNI2kOLjKk38uFhn8w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fuey35de5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785878725; bh=KNGJKXNLACD6zqfsEVSzh/LolMuVoSlkLeXdccsfm1M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OZmzTQuFP4z1c743BHR2WIcnpiqewZmjwwVGA7WmfL6dz5O0ttUNGlUWQ90Lk6nP7
	 E0hl3EXeWfRX2LKdOPLoyCBWjsT6wbQ9S4QB4cjo2Y+UJ5owE3K3n0AVLlW+4d5r+G
	 beTkXDqMHp5ddEAu15wsLYv+JIFI9oqb+wFKEIYPAxhCX5wONAto6HU5TU8GetclJT
	 LlzPCXftOty5pckITwipDHDDAvD0Ix4Njot2AdzHZDUUbOp2PjWMbOHNtGF1oQftYt
	 DLhzPm5MuRAGUeH1sEqdM9Ox2kkQPcqEXB6odOyVQMVgQDkwVcANO/3ialLqjk668Q
	 6ZNSkwWpDYpEw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 100F3401EF;
	Tue,  4 Aug 2026 21:25:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BBA31A0EB1;
	Tue,  4 Aug 2026 21:25:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YAvcpLs6;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CE3AC40139;
	Tue,  4 Aug 2026 21:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTadqTGBeOaznijr0ZPCEo6Yaoyar2UxlWzpiljSq2B1JWzqwp/l9qu93zdxHJ1VgS3FWfNyXpO+NyNoqKe2WTERc916x7b9s2Uwhq8aV3e3Nlq2NYzW+NEKx1XZFxFCRW23VAvnXPo1juWdhuVVX0gAbfCIGCaXTo3D7Rhr4RZLAs6CKbZeKAPJUZkPxjb9hVCshq2LVH4h7k894U9ZJEMSfaOt+jQBnJJoj9OX+w21rKtlojjqHvzXESYoLDuyDzvTRQczgr6f8jW8N1160FN9yYZ4dNttHRa0tLeq4Tmk/Re7iKM+hvv5jJvHiXSlxRyJHYhkeWaiBjAVZ6Js3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNGJKXNLACD6zqfsEVSzh/LolMuVoSlkLeXdccsfm1M=;
 b=ygIa0Xpks7tiOc1mhPUFe+e9S+8TJf4hXAx87m8zG4OT1pUk2nJaV9G0IDONOVZQBKkEFDJI3YNE5WDzatI5S0ncgOcvffQIMCCrZHd4D9YeYtSmmsGshQbRcJnGxeazWe+IDtMeLxSmbPUZvWpj3N+Y2Xo7uTScvnL3FlrWpW2lN+bKQjBGR9DV765HzjwqTNE9qJVmBWXIP1g+NVWdDVK/iQ/BSLLMw069YzUE1zurFCwbXtC532sdphHmug9AX1xBhVfEE++PZepVWqy0ZLeA0L16aB/JlNeJlLyGrD6tqDkbtlg58dz3lJf2C8jDXfRi54EkT+RPSTtuSRLy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNGJKXNLACD6zqfsEVSzh/LolMuVoSlkLeXdccsfm1M=;
 b=YAvcpLs6ZlDSbTIfJkK7vQ1wGeZ1N+xQrNeMdDJq1CsyfmfsmiTwk3PNw6qMc0omkHSSYuolbBc88cHXg81n01zm0c4damll9QezMN1gpH5EEkubOgnlWmX0MNltY4ofIEMrfDI/pZ/t2g5kmrWEBxoHnmDc4MP40O828tq+8Q0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 21:25:16 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 21:25:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Topic: [PATCH v2 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Index: AQHdFFWeY0C45Hetdk6wNt4VRr/jfbZ6LIuAgAiEdwCAC9XNgA==
Date: Tue, 4 Aug 2026 21:25:15 +0000
Message-ID: <anJX3m5KgC3e5zUB@vbox>
References:
 <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-3-026487a08119@oss.qualcomm.com>
 <amFDhkvhqQHtIk7w@vbox>
 <f26077aa-f3b4-43b8-b173-f40f0aafbb9c@oss.qualcomm.com>
In-Reply-To: <f26077aa-f3b4-43b8-b173-f40f0aafbb9c@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6787:EE_
x-ms-office365-filtering-correlation-id: fd37ef90-1d11-4c17-849f-08def26ee087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 8+9RLx/RRWLOYRfshYXnpP7dJUB+rc7KR8tpd732ws98kWW9A5YXM46e6n2iyMrDF/wVjLxCZQKYCwa5Gf7Op8Ki8u0PK/4KFZOsPXm7UnsDQEL+WKHhhBzrxhxXym3kLO7DIu//xTIR8UDiwajMKRmy0Tz0/c2xjaOU9q4bWYM1fAtw6RoDUi713NPFh5EJEGCFWTptkT5uEAxllki1y+3LARWZQx3DYZ0CoVNVfiOY9xF4L8zsUVPYOS+jKq2Dz1wQkUYaHgAhQ5urnqRPWY45rQQitAyEbyIIbeg1k2xkcyOHHJjTRNRbOf1RgoSyqD4jWlNPOohQlhDPQjubYyvtUw8P0p33qoFaSwp8r/AmQOG1noMKjvnrpIf/L/MOR6yFoimt84lexonH+dIswmDC7pb7fD30/r8VuffxrOHUqhX4wMI68tQJBoAjWa6vZVZ8xjVCpmJoA64XvJoEN7DLgAhwVvAXOYWRHSpKiLWkluURibWPGzKgSdk1aJ3UQret15PyNygu5NtXq3GgjPSWC5DzrMt/to9b3OC3aLpoZE0zEg/4o3i8Vikbj1M6LjcV6/HjgPMRYHcZKpFJukaOC4qm8EcLuOjXaN6XeGp2rEJYBx7HFMc5mVeegzEpGMFwdGN425MHfm4XmMGNL9wiUEY9+ue9rWXjSRYzUeTpADtgaelx0yZNgoc8SD7c6R6r+NJUdYUP9YW7dj8TlmLWKHX25iRmlBWB0Icq34Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z29MYktCZ29FZTFkeDkzVWlvOTh3aVNGSG1vRXp5RHJBTEVIaTlUSVBkKzZz?=
 =?utf-8?B?eE1VWWpqWmw4S1NibFUwNk9MemYxMXVoQ255dTZ4a3BkTW5JT25hSmNCcUlN?=
 =?utf-8?B?VXFyZlIvc0t6TUxWb0s3dkhGRW5oUHdNNjVsa1FwaTh0OGVLdWRia21yeHht?=
 =?utf-8?B?N2s5TWJCbncyNkgydWE4RWYrTEZ5RGI0OHdZUEJlMjlPVWRGRGZjK0ZONWUz?=
 =?utf-8?B?Zi92bzM0akdYSWdkNUhyZnZZVXVZZE5JTFJITlVZY0VuTjdLT0NvSHd1bVhO?=
 =?utf-8?B?VnJQY2JlTFBudXFHdFNPS0crWHdmS0tiTEQxQU9IMUp4RlpwOEJHcGxibXQy?=
 =?utf-8?B?Ly9zY0pTWWd4andnZjVpbnBFWHY5WmdrcGFxRmtXdExER3FQTXcvM3JTRmU4?=
 =?utf-8?B?U2RVTTcxN2pNLy9FcnFhQzZNdGpEYjRoa0FJamJkdEVOdXFjZ2RwR3IzMWxO?=
 =?utf-8?B?V2NpVU9kbGhFMzBnTExJRmtjS2VIUVFvS3NOeDFqZnFOY2RnK0RLU2d0S1Fj?=
 =?utf-8?B?LzlDQ3NmdGRSSExVRFBoaUorZVB3VWtQcCt6VjJhQ0puSjBPUjJlQzJGRlBP?=
 =?utf-8?B?Tk9hckN0NTdkdVpJeGhYMmM2Si9ZbnVLQVA0eC9HcWRKcVhydExTZVFKZ3dp?=
 =?utf-8?B?c2EvVmVoKzV4WkEwUjUvemhwckxzdDdkakdoOGlpRTJPVkpVcHJYM2pOUy9z?=
 =?utf-8?B?ejkvYTA4RzlBdEUwdjhZQXUwV0IvYXB6aXIyblpkWlJwSW85SmR3b1d1TnBu?=
 =?utf-8?B?YkFpK2RSa0c1K3VxamprRWJsd045bzFlY3A3R2U3Q3dZOHRsK2VSejcrUElp?=
 =?utf-8?B?L1hKRVdoOFhwamVtSVBQK0kyeENQQmFrdlNlQUVWRkF4V1lmcnd2dVJWbXJV?=
 =?utf-8?B?Y0xseVprQ3MrQmtLKy96emZITHFGNmtScHJuR09jNmRRbEYraGc4VEJRNU9O?=
 =?utf-8?B?VGhMWGNFSmVFUi8xd2tGR0wyWm8ybWRjV1hEYjV6S2t4MSt6cjBhZDJNSlcx?=
 =?utf-8?B?QVVFejJrVTlnVmVHN0NzaUxmZUg5VjcvT3VIVzU3SU5CcEszUk1NWnJ5UWgw?=
 =?utf-8?B?TVBmQzhaYllqNzkzenlhMW9IZFByc2cxRzhDVVQ0SEtTSStGSjFQUEFiWFpM?=
 =?utf-8?B?VnJ4ZUIwM0ZPOFlTam9qZ2svMlh6a1M4allxMkdrdGcvZ2xkeFhrMG15eDg3?=
 =?utf-8?B?b0M2K1F0N0l0OVljMWtQb2lxdEdHcW01ZHI3dVhUQkNCUnFmWHhKQUlMOXZo?=
 =?utf-8?B?Z3NUMTc4b3ZpQ2xuYjN6dGVBbHdabS9JeXJwUG5mMnVVdnFNdXNvKzVMRXBr?=
 =?utf-8?B?L2o5aHlKKzRQQUhxZWFkc0N2U29iWnBWUW5nMUJHUHYxTURiYitzdHdsME1W?=
 =?utf-8?B?ZmNaeEYzVnExN1lOZE9MQlppdk9JL1JkRUpzaldDN3pKeXU5eUttUGt4RXJ2?=
 =?utf-8?B?MGY2dmxRdGtYZldtd01hNml6QmtOT2E4WHNVTVNaZkdqM0xld3JZSnlLTTJY?=
 =?utf-8?B?d01tSkNXMXdwTVdHTDdpNThYUXRQSkRtUVgrY3FjOEZmQ2ptYUZBUTdYY2FC?=
 =?utf-8?B?MFJCbDJWZXJDd2VvZGJWSHBjbVhqWGNSd0FsOThTUTNkbm5NZjJNZ1JuQXBW?=
 =?utf-8?B?RXE0NUFGSmJWOGVneGwzODRaZGFueTZvT2p5b2FxQ1EwZnprK09YdnVicEl0?=
 =?utf-8?B?Vit2cFJ5M1BrMmVDRW5nUnd5d3l3M1BEWUErSGtXdHRkbVpETmwrcnJLKzJC?=
 =?utf-8?B?Z2Q3Nk5CS1ZycERTZjJyemZlUHh1bnBWYlRVek1PUGlMM3VnUVIwc0h4TDJ2?=
 =?utf-8?B?YXhVRjhXZjFCYS9yODM4RCtNSm12WE9kMERDSnNSM0xSSTlTZkMxanhHSWla?=
 =?utf-8?B?aldSclpsQmI1OEhVK3A0bUZkZmg3NU1PN29kR2VJUVNWSzhONE1RbmFWbWVE?=
 =?utf-8?B?bksvZTl3N09FWE00NFJUZnlhT0NsR1ljaDNKek03SEEwR0xqSGZQdkZtcmZB?=
 =?utf-8?B?WS9WTGhiTUFUZGxjNXdUcVptMmw4bmtVY0gzTFZHS1JUdTlibGdMTW9EQStN?=
 =?utf-8?B?YnhLR25CaC8wWTdGUU9rWTZGWVRtSjZiUU9LOGxTUC9MeDFiazlaYWFrWUZ6?=
 =?utf-8?B?TmRNUWFIRjhpNFhUL3NrU3RjN3FoREZKTzFZVk9FZ25aMHNoZkJZTENkWnI0?=
 =?utf-8?B?Ry9sMXZWc3U4akhGUThiQUlvNktIdDBnalYyQUEyMk9sQ2JBOHVkbytWYlVs?=
 =?utf-8?B?d1ZyTmd0TGJZSVdIb0lRZkNyOHlLS0hhUEJySmxLZ0p3c2tUZkZSU2RpMm44?=
 =?utf-8?B?SE8wcTlVZkhQTDQxVWpyM05RZlNSR3RUdWkzallPWnJqTTFkYnI3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C1FF12E5D0C6B4DA845459D1771C54A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Q1OTmyFDJSVtbBk169V+xBVxJ1T9fu27YmtruMOT3PxaKk9NvJBSon6DqPTDDzLPh5nGQH/T8pgIl42hc+G190SzMVBUhhq/ha8FTpBiTN7sqJG6xfCTcooDup79vWj5pzIgBW4x8uXEps1kubFDRrFDYLaqK8mfcZjVrGEhLhwro267OUzCp+HvWfmdb27/CPzmI93nVUVXw9ERn61GnebMbnQqtUWzv/4JQRBZzqSkU3dmCnCRexYwGDYx4TOse7v7ZF7RFFrnV1MPN+lSUI1ISYnVNrB4pDP4yZZ036CYIiDDhNjT6eT+kLr/+Dogs+6YM3rLCy3dPBD6B+jj4w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NIeLx7Vp017lcOvBxQbJObqhCd5JdI1t/EDM+FWJYS92vzqcce0tFEPtKoL8uToa9lwtDi+u1Yef+oQBUh1b0wbSOIFZ8wWidHdnrhOjwgty2gB3cuZY9HlP8vMXH337TlkzmSOGea+NYI1i5+2rP5i62kmmGMMODbZnH2B3C5SQGWwcLrRV3+w1Zknbk2jM3F9odv9pWPQXkoB1f+zE6YBuxjZgRHlGaRBSE31A/nZyTHNvCs31pRSfSs+1MkmeCXpA83Ug4ixsekpkUmnHgokCpmxAKTrAHb1HgwnyWg0eGHpnqCRXhzdWkmbS0BnE07/xVvRJXVoa/z5P5N5cbABM+mNDr7PxImTYR1GY9FTnMyz2TDOlBHWGD9xQmiCqg7hIgXcZaffIzlBB8g4IdJhOR6Lj6Mziu0byZMgg3oFxrRcR1JqpLclWWlRXYUwxCXPSyfRLT9J6wWWzscY/jWWIvqDXrAlZnvNhaDhKjK1C1u0VormpQOjv8cJHX+uizSf8vRR2tcr6JXtMZ3tnyvw4wqop+jXFqgQUAfYEaaCQxp2GEQt6t4iFtkrGXON5/nHwnIgyIk78tqtBEgZ4Xo2Hnn1GZnXj4A/IuLN8inWUmK/jbxuAaYpuXUb+mgkUxH/U+mLUDuJgyHMr9PROaQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd37ef90-1d11-4c17-849f-08def26ee087
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 21:25:16.0170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tNlPxIbtw7ZngXWR391tZuQ9JpJQzv/wpq84To2fH+2eOgfIvJ8zYH4YESf4w1U4ICtqykQFUJORZULa++q5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
X-Proofpoint-GUID: zqfabWz45pGhNVRr-uSNDazVCrG99TOF
X-Proofpoint-ORIG-GUID: zqfabWz45pGhNVRr-uSNDazVCrG99TOF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3MyBTYWx0ZWRfXwYF8enzVY8TJ
 wiCO2FVrgWOIBiFd3+5T2/z4yRKaCrPZwAuReXpmnv6NJIw/BRtJtPyzddh2HUuwhuPGC4uun0u
 ZbEG+JP3/oAuJZ5eX7jlZJ7uzqEotf8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3MyBTYWx0ZWRfXzaH/V4mY4hJK
 ougSSZU+2i7La/ELGIIb6Vwy3LECK3QEZJ6NefAjCMs/erFOzKWYt9Aa1508/9sFRshC2wfjH/R
 nYNWE0pmaYYHCwgBMxrji/Nz4ZEbGlAU0qDqYhM5dVkOpwMuliQyeo9NEJkcOJgLsm4bRwFoYQ0
 LytJwV8WMmNcCKZbUelFygtQT+KAY0hb99LG/QttC3NlQVI1WhPPrOlho7wOBJi925YYsBggARm
 7wN+w7rt2mXH8ZnE8N+grEgSK3He/mpGEgXa+Uro2u+J3UTOrk6gRRcwbU81m8fBD80972pLqVB
 gNkPiND95IYyXCtDkbu4S7/NUfOk7gEqFsGdqD8upZvcmAF7ApBN3Kn0Cg6OHjQhrmbkNsJKKDi
 9PFYed5ZQlTmX2VpdpigFR++GcUHRjQL3y+qEAMkWG9ldeBFr52GxPZDsRXFtxECaZUySMFwn5s
 +67wVFE6AbUIhKejr3Q==
X-Authority-Analysis: v=2.4 cv=DvxmPm/+ c=1 sm=1 tr=0 ts=6a7258c5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=zr3GOHd-Ftws40IJAxcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040173

T24gVHVlLCBKdWwgMjgsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDcvMjMvMjYg
MTI6MzcgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBXZWQsIEp1bCAxNSwgMjAyNiwg
S29ucmFkIER5YmNpbyB3cm90ZToNCj4gPj4gRnJvbTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5
YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiA+Pg0KPiA+PiBUaGUgVGh1bmRlcmJvbHQgZnJhbWV3
b3JrIHJlbGllcyBvbiB0aGUgVVNCIGNvcmUgdG8gY3JlYXRlIGRldmljZSBsaW5rcw0KPiA+PiBm
b3IgdHVubmVsZWQgcG9ydHMsIHNvIHRoYXQgdGhlIFVTQjMgY29udHJvbGxlciBpcyBvbmx5IGtl
cHQNCj4gPj4gcnVudGltZS1yZXN1bWVkIGZvciB0aGUgZHVyYXRpb24gb2YgdGhlIHR1bm5lbGlu
Zy4NCj4gPj4NCj4gPj4gQ3VycmVudGx5LCByZXRyaWV2aW5nIHRoYXQgaW5mb3JtYXRpb24gaXMg
b25seSBwb3NzaWJlIG9uIEludGVsIFhIQ0kNCj4gPj4gaG9zdHMsIHRocm91Z2ggYSB2ZW5kb3It
c3BlY2lmaWMgY2FwYWJpbGl0eS4gRXh0ZW5kIHhoY2ktcGxhdCB0byBhbGxvdw0KPiA+PiBwbHVt
YmluZyBhIGN1c3RvbSBvbmUuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJj
aW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gPj4gLS0tDQo+IA0KPiBbLi4u
XQ0KPiANCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmggYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5oDQo+ID4+IGluZGV4IDAwNzUxZDg1MTgzMS4uYzUw
NDI3NjZhNDg2IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5o
DQo+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4gPj4gQEAgLTIyLDYg
KzIyLDcgQEAgc3RydWN0IHhoY2lfcGxhdF9wcml2IHsNCj4gPj4gIAlpbnQgKCpzdXNwZW5kX3F1
aXJrKShzdHJ1Y3QgdXNiX2hjZCAqKTsNCj4gPj4gIAlpbnQgKCpyZXN1bWVfcXVpcmspKHN0cnVj
dCB1c2JfaGNkICopOw0KPiA+PiAgCWludCAoKnBvc3RfcmVzdW1lX3F1aXJrKShzdHJ1Y3QgdXNi
X2hjZCAqKTsNCj4gPj4gKwllbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlICgqdHVubmVsX21vZGUp
KHN0cnVjdCB1c2JfaGNkICpoY2QsIGludCBwb3J0bnVtKTsNCj4gPiANCj4gPiBXZSBzaG91bGQg
YWRkIGEgYm9vbGVhbiB0dW5uZWxfbW9kZV9vdmVycmlkZS4gV2hlbiBzZXQsIC0+dHVubmVsX21v
ZGUoKQ0KPiA+IGlzIGNhbGxlZCBiZWZvcmUgdGhlIHN0YW5kYXJkIHhoY2kgdjEuMiBleHRfY2Fw
IGNoZWNrLiBJZiB0aGUNCj4gPiAtPnR1bm5lbF9tb2RlKCkgcmV0dXJucyBVU0JfTElOS19VTktO
T1dOLCBnbyB0byB0aGUgc3RhbmRhcmQgcGF0aC4gVGhpcw0KPiA+IGFsbG93cyB0aGUgcXVpcmsg
dG8gc2VsZWN0aXZlbHkgYnlwYXNzIG9yIG92ZXJyaWRlIGl0Lg0KPiANCj4gVGhhdCdzIGNvbnRy
YXJ5IHRvIG15IHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCB3ZSB3ZXJlIHN1cHBvc2VkIHRvIGFjaGll
dmUNCj4gd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBzdGFuZGFyZCBjaGVjayAoaS5lLiBv
bmUgd291bGQgZXhwZWN0IHRoYXQNCj4gaWYgdGhlIHN0YW5kYXJkIGNhcGFiaWxpdHkgaXMgZXhw
b3NlZCwgd2Ugc2hvdWxkIGNoZWNrIGl0LCBhbmQgb25seQ0KPiBmYWxsIGJhY2sgdG8gdGhlIHBs
YXRmb3JtLXNwZWNpZmljIG9uZSBpZiB3ZSBtdXN0KQ0KPiANCg0KSSB3YXMgdGhpbmtpbmcgb2Yg
YSBoeXBvdGhldGljYWwgc2NlbmFyaW8gd2hlcmUgd2UgbWF5IG5lZWQgdG8gb3ZlcnJpZGUNCnRo
ZSBzdGFuZGFyZCBjaGVjay4gTm93IHRoYXQgSSB0aGluayBhYm91dCBpdCBhZ2FpbiwgaXQncyBu
b3QgYSBnb29kDQppZGVhIHRvIGRvIHRoYXQgd2l0aG91dCBhbnkgdXNlIGNhc2UgeWV0LiBUaGUg
d2F5IHlvdSBoYXZlIGl0IGlzIGZpbmUuDQoNClRoYW5rcywNClRoaW5o
