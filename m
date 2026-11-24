Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795561174;
	b=GS89wzISEVwsrnLLBpWDZR9mbRaB51Y2AEMTWE5R+DUGSoLdK+atxU3G0oFWRMVw7mGJ
	 Lx7rFebHPsGB3IkdRx0gOW+RlxF0Cgepj/pDDOUcgX2sMkvJLSY8xoApefFHrZv1Kke3Z
	 BueNAtMovHcfrUIo/gyVxa+k31iUkRcxn1pgZY/JTnDkCCFiYqkRb71ClAI1Jiygn7CLQ
	 w3dHRGokBxrCqaq572EtxS/+5kK+PFwop5XaR4j8UfHS8R+qjILZI19zLIBy08+dC6kvr
	 XslvwyNj5EOaLhvCxQw6ho2DPr459hzA35776aC6sYdUZFRUgRmFttPeLkPXMx4vXfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HiB6oKT0Aj2TgiLs1sSjZZ2Zn3WECWIfpjmlvGppfWc=;
	b=I17US+tuFAexRPD3lDTuRyrOVCoMk+wBdPYnKEPxLhOEjIxSXysEYmqtyQPGEMuWMhmW
	 MfTUKYBeIbC+hWS0272oG0rrQLKE3smQ83caFN6zkx4dMItDWyySAPYq+LdogIgIUaI/+
	 LrhcJI/VtmGg/cGqyK+wfo9siuaMWrQH2r6xQ7Cv18e3QGkkc6rRB5d14dEsapkRCZsPG
	 oeHMqpD/6aCsaM9rie5CvW0i6ACGXGortGDcBr/OPJlUFU3+EWS6EbXHpgiRG5D8idCc3
	 625zdoXCaogrFioWwDThDk91WIzDBxjAbV4bQd1zyxMcWcHHNtfYMzOkDu4EojDHc7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=RiZrHIaC;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=f7wy3aE6;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NDgHWemK;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68FB606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 22:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=RiZrHIaC;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=f7wy3aE6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NDgHWemK
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMYKCt379598;
	Tue, 24 Nov 2026 14:59:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=HiB6oKT0Aj2TgiLs1sSjZZ2Zn3WECWIfpjmlvGppfWc=; b=RiZrHIaCi7OB
	B6/94j8+36J406pp2Z0NfRX/U1qUTFH5czXSVc+FVNCUpFyLB21kgMISYKFMV3Wm
	pn6NvyVdyo9u5pjlRm3Te78OkX6XgvDtNrR4bISGEfU+qpheZVX9roIR3bFejksJ
	2a0dSgwA1bUFwUlMQESQpnj6o4E5vZYIWLFr9cUs1xxBg0YbBWEsXKEh7b0TMcnc
	3WtihkoIKqjb9IHYHMmGSjSpYlWrRdOX/WiovCyZHlcpki+ojTBMbDBttvYt9XKK
	CUkr4xJQYCDnp/+qaiFTqKHzgzJbYJkZzcNebpkcBBoSUoCE9r5bMewcOtq9uwky
	nHufoPWeLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4j5jrggc8g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 14:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795561171; bh=HiB6oKT0Aj2TgiLs1sSjZZ2Zn3WECWIfpjmlvGppfWc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=f7wy3aE6R1gqtt5g5QArJYgumWmwtymMdQfFK+qLABG5jUhkGPEnzDN6IP/fonPOG
	 TPLDK0DuadP8k1aNCwqFwlp8O48xSFwxXnByT81IsgRRBup4u/cV/EY1GIZ+KdL2S2
	 4xKKhlEVRmEtUe1VpQCOzRGBKY443FAsY2n6KCr1+ON6OWm3xcS50PeA0vdgEo7ZY3
	 Xy4OekioTHb59ixtFFxNWrgV7sv/R0JYeoPJadWb+Kn3z7m6MRhLWuCVKTAxrLoK8F
	 LeTmwS1QxS+KIwCcbD/F+Ewvt9nVW6lQBrzA0o6InD3gvdTe0fsZbtSLcaWP52zpcN
	 +ZMAI/MWBelkg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A1F4401DC;
	Tue, 24 Nov 2026 22:59:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 031CAA00B0;
	Tue, 24 Nov 2026 22:59:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NDgHWemK;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B490740131;
	Tue, 24 Nov 2026 22:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz6c6kadriJdT2I9khmt/kJejSVRxgAazTSfi1jhjF+HO7FxSFofWBFh+H3qwI7I+GHBkvOyWCNTg80IlLLYhb6/guPaVBa1pHmEOBECrsOTB1XCdmm0L8voaFb6VoyuiysYVK8JpLIP+rBQkEjT5R11zF61KZaeE485ZEc2SOHnGj9vKchXFBTs2PgTYxiiWPzJnO80K48J9cU5hcwX9bCn20WbvfH/4eSFg0OLe2TJ5rRiot3n7ZyZNDZeMp6Eu2gWppxSTz+OY+UfO3k0+wU7WcDI1rNV5zj/xAGTNjVaCKW9UMGAptHnX2F0UqQ5wdjA3xzjL825TK/Jexa4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiB6oKT0Aj2TgiLs1sSjZZ2Zn3WECWIfpjmlvGppfWc=;
 b=DcvhPc+EHCcMe/VEyogDWOR8dqvFQSBQdz0RoivN4ASddR/WOmruT90w477qH5N386AYwRiq6gLnVZIXmdwuqWKw7G6BIWE/Db5+O4qQjlT0QT2ixcv7aedOqR1asBm8OriqWrmSDkXURyL8pWXJ2fPkBsC+hWBwVYt3ptVdvAxu05D/EZBgdtsRys+pESLkxPNal0mnfEHt/QVLI/403Y6WbCR5zR9fX/GMwJkrHZNrZxrnTBtu87EHo6elIIPHunG3GXa7w5PWJiaD/G45qgn6j2GfeuNkC714uOHlUnfgGsh75toU3RYC2RER7yWWkLEG94cI1qbDjK60X33rRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiB6oKT0Aj2TgiLs1sSjZZ2Zn3WECWIfpjmlvGppfWc=;
 b=NDgHWemKXqI+L5qhDfvCzl0oxGgY5z08to5/0u54MYGJ8w0ECw+7VbQRI16VqptkPT5W8ZERlR3TIAoGmA4Lxe/e8fHjMIKQDul9SKWLpXFlL0LlFencUMzGzuHLfLZ0s4AX7Ol7P7Z1aSOG2E/mVZ26FjAS+TYpnE6cHSxCEPA=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 22:59:25 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 22:59:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 2/3] usb: dwc3: Move sysdev selection and clamp out of
 dwc3_get_properties()
Thread-Topic: [PATCH 2/3] usb: dwc3: Move sysdev selection and clamp out of
 dwc3_get_properties()
Thread-Index: AQHdfGdzwfONQFp4bUOHYgL48CJPjQ==
Date: Tue, 24 Nov 2026 22:59:25 +0000
Message-ID:
 <6f0f6d1316450597da0515dc31954339ebe59482.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|CY8PR12MB7121:EE_
x-ms-office365-filtering-correlation-id: 2b052b3b-fd90-442b-33ef-08df4a7e9610
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|261009223027099003|10067099003|56012099006|11063799006|261102123227099003|261021121427099003|261026121527099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 9rO9MIWjqClz5A0SYXMtJKopstXL16d6Kwp6DxoZvpyG0ApIFTqPh3fP+N+g3AkjhPQ3kZyHqFcO+L49XDINB8VRcXZhu/2lWCjtR1VbHdf+tdKBZAjzqt2WXcJfTCZCQeraFhKEzROAG6nN2SqVuTj9w3Jeh948lP34v99wZgOBfQk2UXSCIo6cyKcjPl5QnMA5GDoUpznYNnNiiLGjFnrxxzsyfI/Nx26Fg0WWQkkmSEW0Rq7uDW/zo7q/jcSNtLKDjE0RrZ6hDxwq/WE3BOH3t0xNYEC79LhDc6QROotwon1P9w3OqYiE7U+TkOxH+OgruFnkpk8Uu0/sz8n0TeYI5QTW7uVmZExOxZqbsPPGijwbYWDPHshfJtzn1fruxOh8hioFi0YGSHgLPzlUZvWP7cN2Cf5I5BVB940SkQQyV7MD4HZQpI3uMnaqWGi3Ix5EgSyGwMkWUzEIXpeL8nV0XiIpewBFd6S0hCZZzHbJnN3knW2LGHC8Rir4A48N/1VOC6Nd2ailyPNAG4Dg5deEpkNUoMUtBFpeTdO79FEG7hyyzqxGw6K8D6I9HtZ9SJGFEcM5I19wiZa8m1hbdYHHs0LPRM2Okvbsnt38knhBzpjqMbiaXfLcSIScyDgoOeWhMjAK4Y7OSikrQL+CHCwW8XDhGH1PtRtT2fne1pq4a+vm0DQKTyjJ8xyewZc5QLkXrFnV2NdwLGXmRRDAbRvQeb8iEkBJMm2mOqbsxMM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(261009223027099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261026121527099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akh0Yytad1kyU1lET0NhcTRNakl5VHEybkNCVWwrNVdyWWxjaytoK3B4UWxs?=
 =?utf-8?B?eFUwRk9lakx0YzdOZkpFeFZYSHpDS1lwNnJrdEpoaXdTbUVvSzc0QnR2U3d4?=
 =?utf-8?B?S00rOGM1dmdiRDZ0amdyYnBkcStDeXlFcnp0ZlE2WnFDeEFCZTRFZmpKNDRJ?=
 =?utf-8?B?NUE2ajlrYzdHOHVvbmdDejBWT2JiZWkrK2VYRFczejRTQnNhc3BIbjBnVmJU?=
 =?utf-8?B?NnI4eVZkMTJwM1JBVmF1ZERibmVKU3FWSmxjc0xJOWlxcVpwTUtHOFpLV3Yr?=
 =?utf-8?B?S2cycDZjU01CMm1vTVhVU1dMSkF6Z2gyTWRIbHpMTnFiaUhNSVgxdUNjQzk0?=
 =?utf-8?B?Y3p4ZS9JUWZiNldFb2F0TTd0QkFiU01vSUFtdnE2Nm4zQzR0clBlVjEyVW1Z?=
 =?utf-8?B?bXV2Q1hCS24rdWoxODZla09LUmI3bEtxVjdjQkMzaXJ0aS9lYlE2cnNMLy9u?=
 =?utf-8?B?Wk9lNUR2OEpOQmZ4dzBtUEU4VmZoMC9TYkxua0M4RlNreEtWZGEvVngrNHdP?=
 =?utf-8?B?ZzA1eTV2enhpd2tzd2swME9zUDBUWmFWb0FpdlJ1Qml4TWtOZk9VSk91ZnR0?=
 =?utf-8?B?R0R4ZDhVaEVqd0RQZC9VaWw3aFVqKzVldkNENEJtT0JHR3JyVWJkTXZHSFZy?=
 =?utf-8?B?VVFtMytLeHB4QXBlUXNDZkNYd0lyYk04elBlMTI5RGpwSWJ1OGpyS3czVFY1?=
 =?utf-8?B?cTVJaE5WbzFXWUtqb0UwY25SWTlrWGUzQ0c3ZVdFNlUxSlRhVEM0UUowdlpw?=
 =?utf-8?B?YnpEQ0hZQTZiZkd5Ry9GWGcvVHdZR2szSXg2WElSUWora0U5QlJxR3Q0aXJu?=
 =?utf-8?B?TkFGdll0UlBvWXdMOUx0NjVwVkkwS3hQVVJWSXJmdXQ5dUhLaXROeWY0cno3?=
 =?utf-8?B?ckd1R0JUS28xSUt2d3hSVHIyZmw3amhWdzNZRk5ENHVyRjRiUGFqT3VzRU5S?=
 =?utf-8?B?dTZLdmZGcm53Uy8wbEZSVFBpR2hJaHZvMkc1OVhhUGZqT1hJVnhzQlpZNGs5?=
 =?utf-8?B?RE50cUhqTmlqV1V1cEdrY1dZRjFuUEVINko4U1Fob2szZndBVHFLU1Y2MThD?=
 =?utf-8?B?OGJEek5iQVBsNmdsVGtBYjBKQXJFY0pkbFVFcFdhY0lBOU1rTGlMMFJYUFRL?=
 =?utf-8?B?QkJuOHJscmwyUTdEcVpROVkyY1BlZS9mT2o3bkdmLzF5SnZ4YUdkczZMWXQw?=
 =?utf-8?B?eThjZ1pnczRiMkRzcHJHVS9pckxHbEdTMEk5SktZS29xR2Yvdng0dVI0dGMy?=
 =?utf-8?B?R0tKaU8vak01RDFZb3I2QmhKaG83WFFFbXRBTWVvQmdNTHV0cVdKcDVSNkV2?=
 =?utf-8?B?b0lYa0dCV1pkemN0K2NydDlkTWtEOEpCQk9SbXhaRnZzM0hoMXgzY0w0VFpI?=
 =?utf-8?B?Y0tTQjFLYllDdTAwTVBJWmVxcTJ1cG1sUkFvYnNRWVBCUTdEeFlUL2JxMzM5?=
 =?utf-8?B?VWVsU2g0NW1UeUpub0xjK2lOQVRhMDNiUkZrM2FNb1ZqT09qeFhFcUpheVdI?=
 =?utf-8?B?QlFRRXlldnJOMkRoeFJWYU1tMUJmTHJxcmdwQXR2N0p1c1J2TUxUd2VpWnFG?=
 =?utf-8?B?U0xPUzgwalkvc05kR3VlN3F0RTVoZUp3U25yU1FyT0tjNXpoalI5eWxJMU9U?=
 =?utf-8?B?Q2NNVXZxc0o5MkNtcDBkZzdXWHYxRURFN1JZWlQxYWZObjQ0N24yWWhNa1NM?=
 =?utf-8?B?VDRLODdiS3hBRWk4SGQ4WGpZV1Y2d2Y1SXVWMFRiYkM5ZXlrZWN5REdtelhI?=
 =?utf-8?B?STBMZFdjTk53c0o2SU8yMUxTOHZTVVQxRXdmZTBDTlA3dE5yWEtIdmxTQ2lB?=
 =?utf-8?B?bllsb3N4bS9RN3A0RGdLVHdkSGtDRG9WcmRHaXJwVjgvaXNTNXAxeU91Vk5X?=
 =?utf-8?B?a3JxOFljVTdMQ3hKd2JJbDRETHllaFJ3aFNPVmFuTEVucFhVZ2VueUpkdUU5?=
 =?utf-8?B?SExKWkdHVlQ3S2xvK3R3MkdwNFd2ZTAzR3VUSnRsVmRWbVg5TW51TnZDUmd1?=
 =?utf-8?B?bWQ2ellocTZWSGhhcHptYlpxL0hoSlNjZG9sWkVqZy9VQ01FcjBtcHdjSVdU?=
 =?utf-8?B?Q0VlU2tyZy9hUU9VbDV6bi9lVFFOa3ZGQ0dVT1ZYUUVUUnQyeU5tUVV4cE9y?=
 =?utf-8?B?UVpRQ2REWGtWS01ISE1JU0lDMGdUcUQwa25NS0tpL0tDY05tUXU4WjV6Q3VP?=
 =?utf-8?B?akg5S2sxOFVoYUd2Q0tRTS8wczliWTd1YVdGVlpiTlVZK1lkbVBlSjNsbVd1?=
 =?utf-8?B?aHl5RWM2Wk9UbDJ5a3RGREdEdnl1N0tBR244TVFjdWNPbFh6NDl4WmpGdXc0?=
 =?utf-8?B?ZWhVS1JlRFVGOEJURXU5OVlGVXlCeTNvaCtIRkJ6cUxrTHdXVVI3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	LcYqUzp1VfWYFEAZT2jIFSlMMi3426HELDEJVlooFFPSkmrFCLdinJAvJaUNX8i+9o5mjeMHtB/nscbN57Ci5FARPoAfWCbFmZ+gyAY7dctlgLGa6A2yGBa++WGtTGtH8bXhz3vnfVVT8ZLWTYm6xbgTVlRDN5HhaapTCyiqyqx6+kt87xFb7aSP8YuBhEplKlS0L02On4GRsPhjF/ajTenwPXiKtIHPrjhIAwKnSyw2hn6SDHaMfr3slvMeIUoATjOkXeIaFDi4uV7KP1qXT6OKW3SyAskzOyMeVTjplMReUvCS856w5G88qPQiz+RJsQTV4bQhoWnpbieddeF0bA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hDnVqDOWLD0aULXTnqXoST6LJAsbi54OVV2+CUKiZuHhwgAmc4G/Dacee/Ya9aYHdMMXcWZmpA1XBfk/cg4CcjSSN1Z8QJelt6DGLgt0lgxtfeAzjVXxO0sotQ/cIrP+wdEHn2k4wNXxijr2qvaUkR2TOvH0dyjfbRmxpebLm10utzG8CegUk7aAjWVIMAL9qMskyMr3atpgfT/IAseUQ3miM/9xXyPRdl6bLAj9LE8DSH2sMkm1XF4XUWHo0ae2ebzSUwbY3OdPe7YqNGgD6+BAPBemWqhhdNEA37y/tRSDsOnk3JCukOd6y1d1ExDWQEFWPoQMkh6+h4GoNt9IiQqOtoC+I11zuvo1a+Lua6GAX6rAmqS3N2PXG0zSmQUDQ1NN3TbhUr5I53i/B15Gb0QeGdag3KIe0KWMidFCecn0tkG7hNT4hZBfrL8OhShW+VhcQAUSbH9cmgrp/JW28gASOYwNKFprc4H3PIWIq22sTYqCX1fCmz/KnPMCAmatFufA3em+a5dLuKOOwTu2EiC24Remz0wpw1Ypdmb6Y9K+FgAa9jGGMVqa7CETf+XkPjJaoF3xH/XbrdGL34HSDvzh9E+Kz25lwaBjUd/9MV47+y22CAFk2cI3+Tbq/f74fhjV4YxQ2+jww56F96t9aw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b052b3b-fd90-442b-33ef-08df4a7e9610
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:59:25.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UsWFUiskSN+rpDlfcyPlN5JgCfbjLtwv4xdcFRdXCKahno+8dYbiTpDi7uMub+uz8FM5s9JJJYF2xpo0RbRsVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
X-Proofpoint-ORIG-GUID: 57wRInpktdvzpNzGmbiTIsxti67wqIuX
X-Authority-Analysis: v=2.4 cv=NcxzRGD4 c=1 sm=1 tr=0 ts=6b0616d4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=S0pWtWSWIYCuTWndZ3sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX7xXj5BpJI70s
 Qj6N6Tl9jR5QgqoVeglVbtKrQJih0C5ag/mwWSJPZ3PCEkgHvNu9eOwHV8TjP5YXI13fqGh91QP
 TOGWkWlSJmpel7ur/dDVav3f1iYIoMuXUzELXEjeGJZlCdjonmKL+42QSreLc/2gp8/LBIPOUlI
 AndnWiQPQDqUn7vI9PdnJtK4UHRgVXKxxd+SHAvmFDNXxMavR9GoAXCoPcmvhzUkbdHmE3Mcwpu
 FyXjC9D2XJv/ERzCjii2RuSGAUX1kL9sy10UjyH2uGg5YHdl1590wtr7JucS6zfSzpvaiV06mYS
 0TGMwMa3jfMKfiLSMvcDEb+5xP5jApB2k1pOMLi6brnJ9QKPbhsIG0DbNFw5NmUcVgAqevOMyO2
 raZn0NXiav3A83n2VTKgtDnm4AwRSGeIn2dVKniHMe845lpshPiBjMLVDcjcdOOO3dV/Y13zzXg
 uJRpA/e0VAk0lfzVZvQ==
X-Proofpoint-GUID: 57wRInpktdvzpNzGmbiTIsxti67wqIuX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfXxUthNROmKjzS
 uaxC1ihnuacCice5lPrD5Ufmk7FXBEm0V4ZmboQoHA7eSomViIzStAA4AyQdD9fLMMbg2His1fx
 iMWGKKyjHa3DqgUdWc4DcbdgZMfQLJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611240090

U2VsZWN0IHRoZSBzeXNkZXYgYW5kIGNsYW1wIG51bV9oY19pbnRlcnJ1cHRlcnMgYWZ0ZXIgYWxs
IHByb3BlcnRpZXMNCmFyZSByZWFkLCBzbyB0aGV5IGNhbiBmb2xsb3cgdmFsdWVzIG92ZXJyaWRk
ZW4gYnkgZ2x1ZSBkcml2ZXJzIGluIGENCmZvbGxvd2luZyBjaGFuZ2UuIE1vdmUgdGhlIGNsYW1w
IHRvIGR3YzNfY2hlY2tfcGFyYW1zKCkuDQoNCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQotLS0N
CiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMN
CmluZGV4IDM3MjczN2Y0NzUwYi4uM2IyYjVmY2M2MjdhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQpAQCAtMTc2MSwx
MiArMTc2MSw2IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0X3Byb3BlcnRpZXMoc3RydWN0IGR3YzMg
KmR3YykNCiANCiAJZHdjLT5zeXNkZXZfaXNfcGFyZW50ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsDQogCQkJCSJsaW51eCxzeXNkZXZfaXNfcGFyZW50Iik7DQotCWlmIChkd2MtPnN5
c2Rldl9pc19wYXJlbnQpDQotCQlkd2MtPnN5c2RldiA9IGR3Yy0+ZGV2LT5wYXJlbnQ7DQotCWVs
c2UNCi0JCWR3Yy0+c3lzZGV2ID0gZHdjLT5kZXY7DQotDQotCWR3Yy0+c3lzX3dha2V1cCA9IGRl
dmljZV9tYXlfd2FrZXVwKGR3Yy0+c3lzZGV2KTsNCiANCiAJZHdjLT5oYXNfbHBtX2VycmF0dW0g
PSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwNCiAJCQkJInNucHMsaGFzLWxwbS1lcnJh
dHVtIik7DQpAQCAtMTgwMiw5ICsxNzk2LDYgQEAgc3RhdGljIHZvaWQgZHdjM19nZXRfcHJvcGVy
dGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KIAkJCQkmdHhfbWF4X2J1cnN0X3ByZCk7DQogCWRldmlj
ZV9wcm9wZXJ0eV9yZWFkX3UxNihkZXYsICJudW0taGMtaW50ZXJydXB0ZXJzIiwNCiAJCQkJICZu
dW1faGNfaW50ZXJydXB0ZXJzKTsNCi0JLyogRFdDMyBjb3JlIGFsbG93ZWQgdG8gaGF2ZSBhIG1h
eCBvZiA4IGludGVycnVwdGVycyAqLw0KLQlpZiAobnVtX2hjX2ludGVycnVwdGVycyA+IDgpDQot
CQludW1faGNfaW50ZXJydXB0ZXJzID0gODsNCiANCiAJZHdjLT5kb19maWZvX3Jlc2l6ZSA9IGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KIAkJCQkJCQkidHgtZmlmby1yZXNpemUiKTsN
CkBAIC0yMDAxLDYgKzE5OTIsMTAgQEAgc3RhdGljIHZvaWQgZHdjM19jaGVja19wYXJhbXMoc3Ry
dWN0IGR3YzMgKmR3YykNCiAJCQlicmVhazsNCiAJCX0NCiAJfQ0KKw0KKwkvKiBEV0MzIGNvcmUg
YWxsb3dlZCB0byBoYXZlIGEgbWF4IG9mIDggaW50ZXJydXB0ZXJzICovDQorCWlmIChkd2MtPm51
bV9oY19pbnRlcnJ1cHRlcnMgPiA4KQ0KKwkJZHdjLT5udW1faGNfaW50ZXJydXB0ZXJzID0gODsN
CiB9DQogDQogc3RhdGljIHN0cnVjdCBleHRjb25fZGV2ICpkd2MzX2dldF9leHRjb24oc3RydWN0
IGR3YzMgKmR3YykNCkBAIC0yMzE1LDkgKzIzMTAsMTUgQEAgaW50IGR3YzNfY29yZV9wcm9iZShj
b25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KIAlkd2MtPnJlZ3Nfc2l6ZQk9IHJl
c291cmNlX3NpemUoJmR3Y19yZXMpOw0KIA0KIAlkd2MzX2dldF9wcm9wZXJ0aWVzKGR3Yyk7DQot
DQogCWR3YzNfZ2V0X3NvZnR3YXJlX3Byb3BlcnRpZXMoZHdjLCAmZGF0YS0+cHJvcGVydGllcyk7
DQogDQorCWlmIChkd2MtPnN5c2Rldl9pc19wYXJlbnQpDQorCQlkd2MtPnN5c2RldiA9IGR3Yy0+
ZGV2LT5wYXJlbnQ7DQorCWVsc2UNCisJCWR3Yy0+c3lzZGV2ID0gZHdjLT5kZXY7DQorDQorCWR3
Yy0+c3lzX3dha2V1cCA9IGRldmljZV9tYXlfd2FrZXVwKGR3Yy0+c3lzZGV2KTsNCisNCiAJc3Bp
bl9sb2NrX2luaXQoJmR3Yy0+bG9jayk7DQogDQogCWR3YzNfZ2V0X3VzYl9wb3dlcl9zdXBwbHko
ZHdjKTsNCi0tIA0KMi41My4wDQo=
