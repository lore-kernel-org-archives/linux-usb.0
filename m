Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966280;
	b=oRn8UHGvI7MhNwiHJcwpL0PiMyhy9EnGPMdgxIsiPRsvdIezddg4gvIsgrugAvVmvjV4
	 ArWCKPFKFaz4n6gqq4MFK0RHIHHFLXe1oDwPMNRpMakHbv0nzeV8ebZ2fPwi/gTNeYOhm
	 22dc/jsJin0j/tyOsJwxz9m9Z9KMSVwZPi18fZxkTxF/8Ugb8IgOkyK6ksPypT8N7il9w
	 Da10l1Evc5bZ1+tYw+B+accUQfX7EKF9U1OkFPjB6oiMC5MR6YLQ845Gqqi/h0LV7ciSv
	 vzuheR6VNRTok6lRk+s22ALsMb3vnpccgHDJn3AJU4jjtOUQcmjsMfGStCvTVmExPVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966280;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IK47gmLXjQYtR3QPjuBqimLTbqJ+3Tf6AL6xgIEzRt0=;
	b=jFc7NBv4OozGVv25muIbWK12mP80pwWrb7Bx1/Pr8BLUh5ztng3UxW5X6PG5jW3lgfA6
	 oGKBC9iwd9imzqp52jwhzhUqVRKE0mA554/0bAcvssgr1bBP7e8eZEoqfTd5gUH9dEKcM
	 4YsieMeCUcPhKCdH0TNkvvNd+2y/WZCkIT81u2WVhIftUIRQyNYwVw1irCVFHqbg8G1La
	 1sGkNYjd/VB8VnddvIdrrCDBSAo1c2/VwcFXydGYn1mxTPW3Ll4K1IuM3ZYyiaNn5Cwmo
	 15oAKix2c4OT1U6ANmLopiPr3Bt9BS0ud/MKEYpWej6hF8mX1mP2URDPXb44XpyhnTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023128.outbound.protection.outlook.com [40.107.44.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF374606A31C;
	Wed, 18 Nov 2026 01:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF374606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXzgN6Gd2ECq7NND9/rV8DX2iX/M21NqgNkLu3EY+0l+Ws6lpBgqD3AHgSoFyU/NvqBjdzVais4jdOOUVE64W8YD2ZdDYGSHd80WwJroEHvZabNIJF3PHuXNK6PCZsDCDY87AqoNfh8ddIj6eRWNI2qZ4BHKsp/sZGK4WIvigqfK5tQhh0giKoRAsyDh++BNN0k6a9jMBsIPa9EITNoZAWcVJAP/h+GWzIsEzLZ6BLwFX1Mp9P0Hoh2nsDCCrwq0Ir41RumLj7NE4Hqx8LkYUTZnuFXHvyQeFow/1aKOjLgrAOtHZGWM4lolA5Cs2J3wZPXZHvdvEPCPwyuNy1Ahpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK47gmLXjQYtR3QPjuBqimLTbqJ+3Tf6AL6xgIEzRt0=;
 b=xRBy2LYSQdTPYBkXQ5pdk7JX02zAogOhfm8l/TpdwXH6KYXfWCVZbyYdXXOApEMF7nScLEZQozw9PZqg+0IHQoQYbTG/NHPBgOJM3pvg6bZWzs52qhUOn0B92oSe9auXUbdECyJ4/S1Aumzlb28gLHAZJNDYU2D8NKM8RmsMpMYb5f4b2kK5RLjU0HCiVMm8A21LNOwYa6Pf6r6ZLyZtWp6e606z31r8Nz3dpFyfnSBuncnh0U+t/iHaa2MucVwZ3zDdgpI1k/QAyesICr8avOn30h1ofsJBXrYXybCN80mFs9ok/9Cu6mEuRimSP2lX5+2ZxJwAyUKZA30eBTJPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::7)
 by TY0PR06MB5458.apcprd06.prod.outlook.com (2603:1096:400:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 01:44:34 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:405:380:cafe::ad) by TY4P286CA0107.outlook.office365.com
 (2603:1096:405:380::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 01:44:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 01:44:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF7D5427EFC6;
	Wed, 18 Nov 2026 09:44:31 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	Gary.Yang@cixtech.com,
	fugang.duan@cixtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: Re: [PATCH v9 2/2] usb: cdns3: Add CIX Sky1 glue driver
Date: Wed, 18 Nov 2026 09:44:31 +0800
Message-ID: <20261118014431.3405198-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-218132@kernel.org>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com> <20261117021705.2202892-3-hongliang.yang@cixtech.com> <sashiko-outbox-218132@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TY0PR06MB5458:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a1fac70-3cca-4e3f-4e47-08df45157eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261028144727099003|261026140227099003|261026121527099003|4143699003|261022105027099003|56012099006|10067099003|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z5lZR5EGuU+HLUYA9YGptiqYGHkwLmWPGrKZz85GC85q0H3pG5mcRyNCzxO7VIhMMtl3EbH2Weru88fCTh2O3JLewBLynhTbfwfvczArqpV82IRzpGUYSgz3iAzuI3S0M+DzAmBmJGr7GauDPturNBO+4BJMGwhI3aFHZSNtZbn1LLEVuXopxpfmE+ZNfXQsgZEUWuVV0JT0lCkPEoln0arvxzcKIRnY6q8UpE/nFnWhhA0pwFdk1Td4AV3rO9iewpXU37dcJ6vJ18aHCCyeSNCxpu4RnOQ3sAzTP8D1CMKO+svZ39es528OWYTGH7/X/GAWOwB2EnK5Bz5wJd+95hMdyzyWxuHrR/qyskukh6usRlCZiRCAtuElnkrZLLckQNgHSTx5pDRcCoEhl/L2KbwadtLHmjeir9wF35gcDYxcTL3X+yPxG2bAecjYKzX1wMTB9TQit8LIUGQRxnMtn9dg1oxyOR3sJiUi/8EJs/RK1XiyQ1SIQCr5eF3Hqd5BRSdsEceOFfasql2UDcKmVPCvEQQlCoGwLpBMuabC5XsGe4D/DMC69mHoue3XkBRALV2oc3NadTFtmsB1p904WX9dMExZnHRO1SnWDaApmFEFK0EOnGclm93O4msdPHBCqw4IJ/TI0JfWggLf2HnVC91KgMB2eayGRmNhAozz2ikpYL0zWtFzrFAiOsoDkyffTbJRvz2CDOri0ZiFdPSxBA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261028144727099003)(261026140227099003)(261026121527099003)(4143699003)(261022105027099003)(56012099006)(10067099003)(18002099003)(261009223027099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A89+EZXZcYUTuBccOXOiDzLNA1NEuyES7LhpatZUPA21PVkWGX0sGPTsPfiSMA/QJxbWyfzw+RXEpgopQrZ8EhdmfThEgLo5Iedvn1PDjVCYRQwrSVRLy7DtIzU4MGeb8v7wmyZN8GYYWysrQarJOWfkMbB2SfdyHEY5L/fTt6W2v0rg1EgZlRRfg6E8G3ezQ9/JIPgdxyk3J4I06/T8AADMiuq1n/16j74GTDyucYW9spz3PKaMJokC4SRqUqtLMx9QmseugQz1F2CjQqi0D1LlG84wtpt08nrWj2DaLdeKhKgPO2g/gOsLDD0HDbj0imKlHfX6rRtKOifh5BxNqqBsz6w79v+zrhESAQ9nVZxKQjWNH0U0TW505yGPsQj45qGzXErxQa2kbdAsLGybp/b1nHx8VlNzduVV0uHc17zPRwxK25jCd75USNE5RLq2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 01:44:33.3547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1fac70-3cca-4e3f-4e47-08df45157eed
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5458

Both halves are real.

> Can this leak cdns_sky1_pdata and silently succeed when creating the child
> device fails?

Yes. With matches == NULL of_platform_populate() always returns 0:
of_platform_bus_create() returns 0 as soon as
of_platform_device_create_pdata() returns NULL. That function also returns
before it stores platform_data when the node is unavailable, when
OF_POPULATED is set, or when of_device_alloc() fails, and only the
of_device_add() failure path frees the buffer, through
platform_device_release(). With the child checked by
cdnsp_sky1_check_children(), the reachable cases are the two -ENOMEM ones.

v10 checks the result instead of the return value:

	core = of_find_device_by_node(core_np);
	if (!core) {
		dev_err(dev, "failed to create the cdns3 child device\n");
		ret = -ENODEV;
		goto err_quiesce;
	}

probe fails rather than returning 0 with the clocks and the resets still
active, and the buffer is freed where of_platform_populate() itself returns
an error.

The one case the caller cannot see is of_device_add() failing after the
buffer was handed over: it returns NULL like the of_device_alloc() failure
and has already freed the buffer. The two are indistinguishable, so the
buffer is left alone there - a one-off 16-byte leak under OOM rather than a
double free.
