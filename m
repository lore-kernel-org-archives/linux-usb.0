Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B45CA4E;
	Fri, 17 Jul 2026 00:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784246820; cv=fail; b=Ys3HElmcdODf4MNR9OEi4zrqn2asZWyJjSweGpV+wwdh7kFcbSNooBkPpVXq5UMU/w1uODDxe86lSctbJHSE9o6rTbXt3QiZQRV272RHjNsi6EBqkncFU4zDtng7A2xSysICibEpHgmpq+DS0BKe0ZzMm2AxQHSxJJBL+ZVTDqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784246820; c=relaxed/simple;
	bh=azYtu1TSYll00WS9m6dwdfHYPzeSNNPUyhedQCdBbmM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wg0kK9S9b1lWe51g6B2w3QSAR1B5Dzn5PBuwMnyGNhTrZymvVaRMwd0xlDyWziUUHYWs2udo/oFxOoPYG8FrN9EAmP/EOCjAZxHRzw5o5WQmNrN3H6V0qgKYJAQPuXCV59FAAscjEeTANBhnextjlF/hSlwIbXnu2ODeFB8N7l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kLxDt2jK; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kvXC0NPN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pdFZbe91 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kLxDt2jK";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kvXC0NPN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pdFZbe91"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJbKm2002711;
	Thu, 16 Jul 2026 17:06:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=azYtu1TSYll00WS9m6dwdfHYPzeSNNPUyhedQCdBbmM=; b=
	kLxDt2jK/x6CCcehPoF9so/J1WiFpJ7cAczVcNz9yha0zWXd3N/g6UqiGvCp5TWk
	tzkFqSUtkEwJ2/Teqe1aj9y+BOvUzDoMBU34kKlRY/5wRHrnSZYSOiZ9+uj6qEvg
	ELQt5bFAAndJBUptZwAHj7z0Z9uLwndcSKnmb8S7XPAUAEdflDY8XnswqazBOflz
	pKIg+lcv3JAt68ul6Wh1yfiAYKfU56W99cvcQvuRZBtLvMdbHzzJOvMO5SDvj32W
	Ehk6HvKeu1L7oJWr81bVhUZDjXapoAIQ/l/51FFtC/rKvqDfnYp5NtDBl2GpAcXN
	DrPY6wemMtJ9JCRRWe7pIw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4femeh270c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1784246813; bh=azYtu1TSYll00WS9m6dwdfHYPzeSNNPUyhedQCdBbmM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kvXC0NPNgRbuTYd6OODnA7WzzHq2MgacAbPawQc9Ya+WqlWigQAN1MRLyEt2DfJ84
	 NbhtqWsMCvtVWI8t9RR/NtAhMiDf6IC7ttO5jErm+Bun7Pqa0Mtc2/X8XjcYrCCwax
	 fQNKi5W08UGGSGzqxT6AUAhvKHUz7RXzezeW43Xf0o6dsBAdogVKvD7sOGF7FaOw3A
	 f7kOfFWM/Rov4WzOcOeNVzsv8qiytgRLFdGEjWM47g422vdfZrU1YLHUfVym8XLfJ5
	 9x9q2mYp+lzceUZzm37pDPrcdyxi0ZmLx3UEN3JtQYPIGKIgUYs0SfN4hRkN5qjRWg
	 BI3o6TmJ7x99Q==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D0EA4012F;
	Fri, 17 Jul 2026 00:06:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F1789A113E;
	Fri, 17 Jul 2026 00:06:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pdFZbe91;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00305.outbound.protection.outlook.com [40.93.13.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5FF892200C1;
	Fri, 17 Jul 2026 00:06:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtolvXSvQ/085IJUITKNw21jdaJLPC+RFGM/lnEck8J9xvJqyQP2wR8gUoJwWyzxrzdb5E0C86vwoBXnu38WfuCBgAQn+SvGUp1H7lu9JwJIB3IYUpWtNu6TxKs7KCLCuE6PF2VWTT2cMt1F27IvtEKt/yQhGGBahyCs7/fST4s18psXbpgX5UUOlwl1oo+xnJcsCy12o2L7OVWnhccetDeSmmFryN3bQlRi2Csb2JLmOs3PKpb4iHiqCa+LqlQFO7xzSJG2SwPX9NNKs4qCNKVb6+vI1K5lo2jIpdIkj6MwMFCNav6wy0tNu4+xb1Y+1IJapqEIZYnEbQmR5WP/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azYtu1TSYll00WS9m6dwdfHYPzeSNNPUyhedQCdBbmM=;
 b=Gpr3GsH46RDHCJwMYGBglEFgakr4N55/Ra85ggMWSQUqOwi3Q+n9m9hlrmmOsfPhEsuZUziGqqSCKfFQyyxPnwgMxwSFcp7YRtB7SrFrGs+y7oDPake8KQZMGSgI/qRC2zdyFmIvlSwH+2UPZq9PQNgXrwXDsBvCp5ZxKN7owhb1P5872EzQ8xrM+imp38nU5L6NLVMRhhIFdy3shjdj20pA4xSFdrtdPs5w2thkljhZUTegQHfKq9rCiQ0PKprenPQA4f18qHHW6ClXz2Zd+Y5q/uFHk9eMDgpmJ6ToZSTKCP2BWNr91GajT1GZt3XShUwzdpeH9NFGP8qVtsprdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azYtu1TSYll00WS9m6dwdfHYPzeSNNPUyhedQCdBbmM=;
 b=pdFZbe91FNQgDAB8qOvX5J4bI4OsOfs2DERp8WLiGEu2qoMGsfpVrbi4Got3wJdG7Pu3bsdEZXpmQFTmQZxIv1JCbZM0xWPTxapfloMYdWcc7aAJtHfC1vGHQdCzH9JkizyPwaT76Yzys1I6M431ykVTcFE0EW0+vskNzfA/wOU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 00:06:44 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 00:06:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index:
 AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwCAA8JjgIAADvOAgAESBICAAD0jAIABUBoAgABo3gCAAShsAIAAUfSAgABrlwCAAOIEAA==
Date: Fri, 17 Jul 2026 00:06:37 +0000
Message-ID: <allvBYQN_0QkI835@vbox>
References: <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
In-Reply-To: <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB7140:EE_
x-ms-office365-filtering-correlation-id: 8d3ba8a6-dbd1-46ee-7a97-08dee3974522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|6133799003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 EyZ23qhrB4b6ZPtiR37YOFqvhZLBS6yjhvi11L0JFxCYztr/tZ+RikS8NG9H3Xw2nbZB5Y/G8lExVtdic87G9MTvOxR0gWRWD+WyiHOlCtG0uIsaEdcex2Ehn6cBUulOGwjxCGxRIBIMVVnmz1KPp66ADk8AN3SZg22E1nthwzGDNZJ4v9XT1+g6WAE2fX5jDcA3FOWd+OfotgT2n3pgako0yfyBcfQfo4ZHv8ppSFyFOnntnSMF3MH8nFCD3gdWIWhVVzltHi2f5FPJE0MK+bmu//dR3YztBrG6fwlW0u//DJye5gJAZ/EBZ/YFNHtvqF8N8iQbw5FObf4RSKUAfGZxl//wZsnCbJcyIXnz8GtEDfiFCUVXhCvu4/9K6hvv33ia6UcDJubERNWWZFci3G8XcGukQnUYrhXYudTCHr3sudxFJQyqNNIaAEI/EZe4qbKrQ1X38b/aE5IS88mFQQWq/FRM2M22cnjAoQsAyw53+dRgCwBneCQ5uIDYmGJL4gYwVTFaZ5GL/DUtWaw61rJUL08dph94o4/ARDgdbCeBitbV1L4n7xNQh88EshvwriI8rbo7R7pmbLid8TrHxdShxmrSUFM+4JIcSytdvh1/xYzLlbBu3oYNDI+gKoSI5NqnKMOCdyajH375id+OJCRTMSi4rIN5Xm72StDL62o/JaXkRGJwrCJ9xBrmnQnLd/hPlg/mhK8ELMK+VmfN3UYcoRY69Txgb/dvDi2AwX8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1ArOGYzek1Zak00dU0rNkxiYUFZWE9kVW1CSlNBdlRXVlExalRnOXQvL0hs?=
 =?utf-8?B?Z21BZjE3cFJ3aVIvRWdBNUcrYTRsMjdnai9BTklIRGpBUXNhUHlGQ2NESXFS?=
 =?utf-8?B?VmZWSTZiSS9HRUZaeUpqOFdxMW8rcDEzNjdZTXlISDIyYVFla2Z1RUJFYUJ3?=
 =?utf-8?B?TmFYOVpsRnl3UGJyRDUrWVBlTHg5Z0xGcWxHNHZvRlQrZFRNMysvWGV2Wk94?=
 =?utf-8?B?eUU2d1hGa2ErMTExcGp0cnJXZnN4bzJzWDdhMStJeVBIcGRNdFRFcjMrTEZw?=
 =?utf-8?B?UTVOMHF4S0RuQVY2T29CWFAvYzVaR2p0bkdNWGFVbkFNZGFkTjNIeWIzbVNj?=
 =?utf-8?B?RXR0dGFqV29vcWh1Ly9jSWZ3aGlmYmhQVDFrQitna0sxeWFwYTUrN1NzYXo4?=
 =?utf-8?B?Y1pGaklvNFdHcy90SHB3dVpyQUM2cENHV3U2emtoSzNRZXlEZTJoMVZYYTc0?=
 =?utf-8?B?WEhUMG54ck1SdXE3MEVTNk9Bc0I3TFZhR1FVWmJ2WmFnVnpmRkJsby8wL09Y?=
 =?utf-8?B?ZjBjek5lY2xNZnF3S2hNU1daWmFGYnlSbGphaDE2cldQcEpHWW04NStlNkpY?=
 =?utf-8?B?MGlFNm5KQlVCam9KMzVid21HVTRBZHFqTHNmQ2hHUVl4dW5rQWhFOHlIYU82?=
 =?utf-8?B?RithK29qS21CRFFBcXBaVkM4U0hheENqaFRBQ3BLOGlHMmF5NGxzaXF4b3NC?=
 =?utf-8?B?Y3NxNjZxS1lLRHZFd3ZRSU9UdElRQmRTeU1Pd3pnZUM1M3FwUEMyVXhZeGRl?=
 =?utf-8?B?bms3bXhscVNReVdELzV3WG1RU0tSY1k1ODFjVVlQV0l6SjhZM2lzaW9WTnIr?=
 =?utf-8?B?UDFPejJtQVlUUUFma29WcngyK2ZPVmt2NTJyaGtXL2poTGxGSXhNUEEwc2xp?=
 =?utf-8?B?eFpHQ21HcC9mMXY5cXQ5QVVxRWtNWGxud1ZWY3pOdEF5UzhCNUR1VnNZVUhy?=
 =?utf-8?B?dktjZ1lLQmZTSElZWjRCMm1jZDZZT1FwdytuOGJNaUUwL0F0THJYUnVSREtT?=
 =?utf-8?B?em5sYnBaY1QwWWVETU9JV2haaHYrTTM3S1pzdDZqYWQ3WDRrUHdPWElYdUpB?=
 =?utf-8?B?Z0wzeGpqVVo1bVRJZ2FHbC9PT3RIekV4NVFRYVd0VkdyKzcrc0V4T2V0b0FT?=
 =?utf-8?B?MVVYM1RsY3VXTXdRM3B1bzM3WE12U0o4OC9laVlabktoVlBLeC8wNHE5M1pt?=
 =?utf-8?B?dzE3VGVHSlhqeEp2T29kdFNURXpCdVdIZlhxM1B2dnppZkFhYnBzdkJLbitI?=
 =?utf-8?B?cVpwU0pUR3BjblJ4eDE4dlJpMGhHUTRpOW4xYnpVK0dwaVczWkErZFg2eHBW?=
 =?utf-8?B?cWhqd2R3OXhZZllnOUpMc0ZNSWZpQlZncFJnb2xTOEFySVljK3NRTVh4bWY2?=
 =?utf-8?B?RjNnVnd0YWpOd3lTZFFzdVh5TFd5Y1BNSk4wNjhMOUFIakVqMXdyYUpGYnRk?=
 =?utf-8?B?VlMrMi9wbVc5MVlieC9Gc1d1TkRMZmlYV0srUkVhNEM4enZjZmxUbjhZM2NW?=
 =?utf-8?B?RFgxR2xnUWRmRVJzZTN0Mks5dXdabHplcmVjdXlxZjJDTUpUSXcxOUQ0dURI?=
 =?utf-8?B?S2dGSlBJT0dDb01TMGJvNktjdm5GWUVDdVdJOWk2NDVQYUI0OUJRWUdDQlNO?=
 =?utf-8?B?ZVh0ZlJtNURVN3pDUEdzUisvSk9ycHlFQ3dEK2NEdGllT1hrV3k0Mnp4TURW?=
 =?utf-8?B?WStaTklsT09EVlhQU0pOdEpSMkcrcThGOHFTRU9uME1KZW9RMXk4WUNNazFS?=
 =?utf-8?B?dXlFaU9IcEg2TGVKdW9WeDd2cUpCYm5VdkIwUU83S2I4M25jTkpZUUZENG5Y?=
 =?utf-8?B?dGd3NGlaYWlGb0Qram1DZVJyclhvbGNXbG4xVi9lVXhDay9pVEVYc2twNWcr?=
 =?utf-8?B?bjB5K0JQMGVyVzJsM0ZMNjZSNnZ4OGJlQVRCVythc1RJN3NXK1d6VjFxbGVB?=
 =?utf-8?B?NU9la25EbzZYWVRmNFdYNm8vdlNTcnl4R3VhSGZHV1RENVZSVlZlRE83cmNl?=
 =?utf-8?B?RG9tZ2NTTTNKYTB1N1hsR24rdHB2TVBYdmhodkR3ZnlvUmNNOVpPUzczRzJy?=
 =?utf-8?B?ZkNXZTRVRG5kS1ZXbzl6a0gybmVYYTF0YkJIVWc2Vzl6Q2xNdUNnTkVHQTFp?=
 =?utf-8?B?aTFMYmlhS0xqQ0pwdGlzbEJvZVpMVy90bzlOV0M1bU00cDlWQnRVZWJSSzMw?=
 =?utf-8?B?QmtFOE5vNW5iZDBtRi9hbnBHaFBmK3Eya2sybHpmUDZRRGxRS1N0MVRRUXZ0?=
 =?utf-8?B?c3pUQ0ExeWlGclBtWlF2a1BTMGtuMWRsYVlUa3ZVUlVLVUNsT3NBZnVDRGll?=
 =?utf-8?B?QmZHdXRCL0pSWDVkN3ZXa21xS2UxTWRXVHp4TnUyaGw4ZjY0SHhXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4179D823D43A3C4BA097E508A933BB99@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bIWs7No/4UYQIe46U1uiBHh4x83RXApthaqMXc6V/uiBdsVG8qEF2Q3UAaUgrWa3zhQF3RAk87GfPL1q65xQvtQRvMY/ZZ6HZAe97uhd8Zq8qq0Eh7YnCTDY9nPVxRVwsHwkqxchaXy7x/mzWXC2EgCYL2FwJWhAFZigyvaryLKRRxskk62Y0+gIF3/hen09o0yxxSZbBBGV2jdD4xVpkEMKDti0VRXGVhAxxfV2LKid3MXTBJKcGLLkUFeDGWnywUbUUCHNFgp3Y6LOOIpYIIh0GhLTUMhDSf0inpRdAQLPMAm1g3naVbAZMFOQoBqd8kM+qXjqcgixK9cc/pBwrA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xn8dIqyWwsbhU+o0hHlsNAzkUwwc58ubAttnztCuoRgFCVexnstwfWVBVM1iFPrnDIXpsl31Ri5PNKoTj/Vne9aoYn28Mvsc6WQSq331AKnm3L+UdVgCfbVSTh7R4/N8Rw0Zazxjpm8KPeO2PFxqj5RhHd8WGGubNy7HrJTk5ck58iGCkVRICm06g1y8WkfPD2mKTA8/7mbjyeUbqCjRcyDYU6C2iFKnpG3+g/nRK3xqD+xYUqWfKwXWJ9lj16AY4yaz9FuxK9q7TUSIrIPl/cvb2EtrKUlfv/Y3W9yumGm3ANOq/baSIq3/cVRbz8/gar85p6BQENA4Qxk0skf+vxG7AgpypxSQdw9VvX9xdKHfQdehCHXd1ZhkeefYxPyseihR98Y62TmevXELJcleRmab59ziWszMUr9r92OFz736MwK/wx7ySv+T7ccAiewBXhZCDq6F6rc1W+fTaKanffHTqcy8mUmu0/+WCq4BP2TvJ2sTlIvUX8oFz2/oRjwOzxyYBqCVZkokRMe1Rb24DJL+zwnrw38/6YiBz3JnNgg6aa3u9s809fox01n3nZqlGqD+MK58V4bvJ9GZpLIqznomdd9clLv6Q1sbmmct2Ufv7oJaWXg0ue0/jvZIv7JAppu3AZ+Q9rWprib5LsY/Cw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3ba8a6-dbd1-46ee-7a97-08dee3974522
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 00:06:37.2480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URMJ/7BWNU940CXpZHxQBxiUjG4exLx/BjYe2Dp99CNH7z0sKtPfYjYf6+PR9MSWFdL3vXhkxanZf5CwbQNHVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140
X-Authority-Analysis: v=2.4 cv=I8VVgtgg c=1 sm=1 tr=0 ts=6a59721d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=v4WDfqSKA7Aw0AUT1zEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZOM31pD3jBMRYuueS_5SlaevYF9Gb-ly
X-Proofpoint-ORIG-GUID: ZOM31pD3jBMRYuueS_5SlaevYF9Gb-ly
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDI0NCBTYWx0ZWRfX0Ux7fvXztiPs
 UnuPYUBesGzgYbraklWmmd6hMV7fkzXMDbRIc4jP+pDhINSYT93kMFR7K+HkVMKbDWgr1lmA0n2
 2f2qQ8sG5URkD9iXHtNCaHM5CQVisRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDI0NCBTYWx0ZWRfXyz8vvxOhxQ/I
 H+o84lhPSXpfQr5gczOKbshn3oYca8sVjxBcw2QcAQ1lRH9eFKPOtAU6xwFTgq8jsv9/JXSxj0H
 v53exvNpBE7y3vZDzdZod6mmkZqzXr41KtrxXPCwu/K7HjTrPsZaPAygUkAtsgrGfgWrbaPS0Rg
 BYdUoc0nLocqlo0AmK2Jy7p4sf8/YlFApheMahX34Yow1iHSNW8en+yGw/5nXR48/n36qTdGy7h
 zhONenrLYeu1m8qV4lW/6YAhE67JN6QzVfq6rHaxGoNNO1lMy3pDdEXSZrS2yFVugacmcch026E
 ZOWrLU03VzobjoCIhViRSHM1yph/Oby0fCfhSbAj6HtG1CNGv4d+vPOazB1bFAm/PO9DYOt1g9/
 b6aS0GmzxMOE33+UAZvXoEtZh2gEshfgFEJbYvmBCYmZ8gkSjSgxH9tspYCLVbTZp4KynQhP7WP
 03IfkWijOfXvGVozutQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160244

T24gVGh1LCBKdWwgMTYsIDIwMjYsIFBldGVyIENoZW4gd3JvdGU6DQo+IE9uIDI2LTA3LTE2IDA5
OjQyOjM1LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4g
PiBBdCBtaW5pbXVtLCBkd2MzIG5lZWRzIHRvIGJlIHJldmlld2VkIGFuZCB1cGRhdGVkIGZvciBk
d2MtPmhzcGh5X21vZGUNCj4gPiA+IGNoZWNrIHdoZW4gY29uZmlndXJpbmcgR1VTQjJQSFlDRkcu
IFJlZ2FyZGxlc3MsIHBoeSB0eXBlIHNob3VsZCBub3QgYmUgYQ0KPiA+ID4gdXNicGh5X21vZGVz
IGVudW0gYXMgSSBub3RlZCBhYm92ZS4NCj4gPiA+IA0KPiA+IFdlIGNhbiBqdXN0IGFkZCB0aGUg
ZW51bSBmb3IgZXVzYjIgaW4gb2YuYyBhcyBwb2ludGVkIGJ5IFBldGVyIGluIFsxXSwgcmVhZA0K
PiA+IHRoYXQgaW4gZHdjMy1xY29tLmMgYW5kIHVzZSBpdCBkdXJpbmcgc3VzcGVuZCByZXN1bWUg
Zm9yIGludGVycnVwdCBoYW5kbGluZw0KPiA+IGFuZCB0byBtb2RpZnkgdGhlIERXQzNfR1VTQjJQ
SFlDRkdfRVVTQjJPUE1PREUgYml0IG9uY2Ugd2UgYXJlIG1vZGlmeWluZyBpdA0KPiA+IGluIGNv
cmUuDQo+ID4gDQo+IA0KPiBJIGhhdmUgc2VlbiBmZXdlciBwbGF0Zm9ybXMgdXNlICJwaHlfdHlw
ZSIgYXQgZHRzIGZvciBhcm02NCwgZHdjMw0KPiBjb3JlIHVzZXMgaXQgb25seSBmb3Igc3BlY2lh
bCBjYXNlcyBhbmQgdGhlIGNvZGUgd2FzIGFkZGVkIGZvcg0KPiB0ZW4geWVhcnMgYWdvLiBGb3Ig
dGhlIGRlZmF1bHQgc2l0dWF0aW9uLCB3ZSBtYXkgbm90IG5lZWQgdG8NCj4gY2hhbmdlIERXQzNf
R1VTQjJQSFlDRkdfRVVTQjJPUE1PREUgdmFsdWUgZm9yIFVUTUkrLCBUaGluaCwgaXMgaXQNCj4g
Y29ycmVjdD8NCj4gDQoNClRoZSBHVVNCMlBIWUNGRy5lVVNCMk9QTU9ERSBpcyBvbmx5IHJlbGV2
YW50IGZvciBob3N0IG1vZGUgYW5kIG1haW5seQ0KZm9yIGVsZWN0cmljYWwgY29tcGxpYW5jZS4g
VXN1YWxseSBieSBkZWZhdWx0LCB0aGUgQ29yZUNvbnN1bHRhbnQNCnNldHRpbmcgc2hvdWxkIGhh
dmUgdGhpcyBzZXQgY29ycmVjdGx5LiBTbyBub3QgZXhwbGljaXRseSBzZXR0aW5nIGl0DQpzaG91
bGQgYmUgZnVuY3Rpb25hbGx5IGZpbmUgKElJUkMpLg0KDQpUaGF0IHNhaWQsIHRoaXMgaXMgc2Vw
YXJhdGUgZnJvbSB0aGUgR1VTQjJQSFlDRkcuUEhZSUYsIHdoaWNoIHRoZSBjb3JlDQp1c2VzIGR3
Yy0+aHNwaHlfbW9kZSB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBVVE1JIGludGVyZmFjZSBpcyA4
LWJpdCBvcg0KMTYtYml0Lg0KDQpCUiwNClRoaW5o
