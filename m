Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021079.outbound.protection.outlook.com [52.101.65.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F23AC0FE;
	Mon, 10 Aug 2026 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.79
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345949; cv=fail; b=DFrqqokgJIbYla8REpXQcUmbZ5I9l3xHTWdAd3jqJoCcxlnPwTm9JOMNf43SuI/vXEsDQw+n3aqSVVV/d9wVqNhTJmy7umJjTHPMu/dJFw+yZIzxrzdkgqG7M1S99d3/mqyb5DEA8EfMWD5dp1fWWb0gwGKWT87vaM2WQmP7dNo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345949; c=relaxed/simple;
	bh=QbDgL8gbuZ5ZYEzht39SkUP8BFquMDWPZpGr2QHgOPI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YBDBSSzmmqByMzmN5OyDbZkhMpwzgacGuw+QQYTtvc+tIEJEGySxecXOXJnH7RIhXqFq2SpsShwdtcJZl4o3kjkulcXoPPDEXzuFiy1uQM2fdE4P9ovveDfLFQbtFR+UCDHej4FgK4KkK4mAI7oZ9nNXZwVzWn4p05p18MtvY54=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=L8ZFdMLA; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=L8ZFdMLA; arc=fail smtp.client-ip=52.101.65.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="L8ZFdMLA";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="L8ZFdMLA"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h3VO/Y8ZmWF+su+yD/j0o/T7pD7w7t8YqQ0Z5GaEYefpRBGc/2kcp9B9TEuW9XFXcaHauZ9f3JCPo1cyJCJYDm7MYrqofn9LVWrKiBwjTxew2KQws380Yi7n9fm3QxhM+9ZrDBbFS7czX8n17mmHFjf8SGjXQD6wSAbDx1XAvU1FUPVY2+2g0XOISWByAw3fRnWxq9RzPfKuigXWuBAxk9BKbWJgswdmWRhwk/czS5yptelNXbH6YMvJtrPZO6VOP4QYBrxRFoUKVYfIKveFhyMUqt6T9/70dDHYbt6Pi77g14VF+nTVAQmiWtbUOVjHgmFSXC9VQQe8woUfxLRd8A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9QWR7bDj3rWK3IKq/GxnigZL3e8GZ+z6U1b8AOLxvg=;
 b=NdRn4m872oSfnjj57YYfrZRio/uDg/6QmyUotvioFt66Z0kxct0OfZVQqYLdVZytDkMZ5hSqz/isqhWfmbaVFo4jXdsK7ohynmI2kaKdvcUXlw3KMcRarseFh7KVYwuROwrC9YcYLvoZXg8s+QYydLXftdR554TN69yAHbjGDpRfxXl2yaIAGXxExUgY6xlVH9BX8QR6hzu5RWjEyn2zKyFGRcg+lTfCU7x5mIw5MyHNA/4W+LOy1c4w02NoujEWPSr/bJjVzC+ChUAfUxixS4c8cmOSIm4izvHeIHM3qjTMRand6SgJ+QAI6ro3ax5MLaSyB7sWPJqKsGGA0Ezeow==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9QWR7bDj3rWK3IKq/GxnigZL3e8GZ+z6U1b8AOLxvg=;
 b=L8ZFdMLAniPnxzbldorfOjKVhUb2nBzDIIf3GPlp0Uaxtv5kd+ddsDHjAC4xpBfK3SAUXt4fwncpKJE35O3KwD0KEv+7mgJKz1CMvRVpRLLcGaL+hCSyqOS/VS/pcbbASAllUXgfqmOVC6FvOxfcmbUM9EXqS3mNYhaAv7IJh6+VtGR5U0zccGkcZjEOFiG2xFgI75krkrjBcGd79X4rhclBPlZMzJ8gM5vjuczJKz8pFDEkHqH438DTpxxwfe/ZuPeYgRvkhSqXOxYzTYyKp5vAVecQsIcH1KJ38ThypJ1OiTFQCmGhF2yVo6FOKQxnNWreMY8jAiD/I2gbKMrQuA==
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by AM9PR04MB8681.eurprd04.prod.outlook.com (2603:10a6:20b:43c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:18 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::37) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 07:12:17 +0000
Received: from emails-7477848-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D376B7EC91;
	Mon, 10 Aug 2026 07:12:17 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:12:09 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345937;
 b=DpKLRNoUcvFGuLMtrOp9leunZyY5upZ/z3pTf+BWHLRZNKZefj9QAbpoDLGfxa4YnBDcG
 DjtI3iR9nmfDcpbCDTJ6kLZMlSsxG9EQU/EjxbsoKNwNVECPN5YUHsFrVbjYLcs25/ET5cK
 paPdNK7E8UXHiWwh+wWyJieTcdPObmM=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345937; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=H9QWR7bDj3rWK3IKq/GxnigZL3e8GZ+z6U1b8AOLxvg=;
 b=OLrqNvXg+jekPxwL15uXGquLD6DZdTVIxiuLt31fyZ1MdGgSPE8itYctEuYzFlh1T0qkw
 9wSYzrWhkBmFPGalyvUUKpd/jDPkrsci820vvulS4977MRFVEfgNSwvwECz01eHPQphm84l
 gFLyPbu21HlyxwaKtt0oG6av4jpvFro=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9QWR7bDj3rWK3IKq/GxnigZL3e8GZ+z6U1b8AOLxvg=;
 b=L8ZFdMLAniPnxzbldorfOjKVhUb2nBzDIIf3GPlp0Uaxtv5kd+ddsDHjAC4xpBfK3SAUXt4fwncpKJE35O3KwD0KEv+7mgJKz1CMvRVpRLLcGaL+hCSyqOS/VS/pcbbASAllUXgfqmOVC6FvOxfcmbUM9EXqS3mNYhaAv7IJh6+VtGR5U0zccGkcZjEOFiG2xFgI75krkrjBcGd79X4rhclBPlZMzJ8gM5vjuczJKz8pFDEkHqH438DTpxxwfe/ZuPeYgRvkhSqXOxYzTYyKp5vAVecQsIcH1KJ38ThypJ1OiTFQCmGhF2yVo6FOKQxnNWreMY8jAiD/I2gbKMrQuA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:07 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:12:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 10 Aug 2026 10:11:54 +0300
Subject: [PATCH v6 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rzg2-sr-boards-v6-5-41faa32cdafb@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
In-Reply-To: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>
Cc: Josua Mayer <josua@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|DB5PEPF00014B8A:EE_|AM9PR04MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: e057fbec-20cc-4f1f-5bfe-08def6aeb67f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 FcNhTHsaBBDA838y8TwkI1RxkbHejzYX58hCE5VBYnRk+dHdUCu7ERrL67iP5350H5bgIX5oTCULLwwk0cYC9ZJJMrJ5PXCF1JjbFJcMjHUJMNMEaMTZOf1AaH2ka+6cjPsvosf9mKVi4OzLCKEVKymxZR8X8lLzIVHz9HAPnXwRWy1j6gb5I0VcgQ6viOQQwZ0sstnVD5hzdM72x91O/XvzJc1U/lL/3ou5leHEpxrBtddzwyIyPRkcfhbALgg4cRM9VdtgzAPZgU8MKZAR30x8nTMlAiFTA3d2NHt4E+mwITK6FrURtVNMHB+mXBt+WcwKlH8v96kHK+ZrJRg1S2F5kiBgxqjnREopf8ikP+K58Re9LKZtiS9++5YuvO+4icSjlz0CtVaY0OH5MOo2liQdIFRESeg0OvGYJeGioMP6U4RHDnBzQ/UweF4x8kRZr3K4bsZuT8PDNUBM/a6zE/rQszl3AoCfr9luo+WNrpWq4d4TM1A5brjZWWdYoX/3xu4NVlRBc8a/FYtcHG7V6LohKgJZyClHMTIUjQ0hI8KTw6SlyASKgurJ9HmuJ2Dl74iLm3tJpnCNt2O7t8O8zSs+ivzSnYC0I7q9BLXKoxkPG7yb95YPWIP+HswV3DukhDRG2CzYotkh//J9NJN4YwUyijd29rNt8MCtZdu4w+RoyaqqpGNzsEvirmOIKJVhF7VCf6vPvDHqakBPSG3eEgXZuaEMurxXBZYVvYLAqnY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 JUSvXK01p2Lj79EW4BeR5El/To8sLNK2HkNZMMnvMrtlQuOB9IhtJmqQyWmM5zvjRY65scTUoFvNbZIKCPgWfPFE89JlzoepuyqtmrDJWD1d6TbrfQjS4R4mWm8XlHFyVojnNWu9tWomhX2JLonj3LZcNUo4QMS2sYKg5Q9CPOdZ1tuv44JjdqtwVO9w+kI4TBIVxtfwcZES7oZIJb9aLOs2rthY3K+zcS71vc2ZJzU6XeBxrltfgHcuVMUcr2aBqLL0RTqUe6ElvanVF8uMcO6RKmEvCgm8db9g8HNkqiROfafcVTLGn4or42uNgr/QwkDMSgelD+/tCGhOMgiT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f891dce481874032a5823ced1dff440d:solidrun,office365_emails,sent,inline:296e93809dba7f6842e6e1e7503db0b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcPY6LovvmQveuKSgVZ5weEVn6krXf8PNc8BnMEkE/mrYgxRWPaM56rHvH1kF5iqnQFtFMaYQOTidzE25jrFJt6qJnK/VP1FADGV0GhE8WTSoKpp7uBHq+wNoLYolux8l9d4gz0j1rNsHAMwqd1vxdm8y/T4g8OajbKUFE29Cixts6Su1OJvkYuVpYiAHgmbsuTrVgSFBt4eX09J1YgqRs0FY4cOGJlNq+YKXPqhMmezEnh2u8TuoOx5HspgnjEGgxyjj5sxNoFBXjFI0+5AaM58in18ZJ6PX0kbmnX0xKVLBlaztbRf0wcOHyagEMuZG2KbvBvPPZegcmrAnF2z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9QWR7bDj3rWK3IKq/GxnigZL3e8GZ+z6U1b8AOLxvg=;
 b=Hfj64yVATRefh7iyyWkC2pIl8TNXB+3hIUlcCpbezNKL9Ii/2iOu92MFIjrifSi0QRD5uVc32yqupT8ufBgvRsKODUaxa7BhK3HWvDmYKP8OU0GBH1XbBgEyvAfxaNgVMB5Q+r87MqkpzaeKzaHirpAVqbR4JQKkoeFw7rNTcaH1CnkaPondGi+PV3Sb0Sb/pCbm2QZMIOU6qsFA2OIdm7SzhTP5pkQKqp1Rd4pcZZ35ZGzyUDJdzjuKMSMELFZVir74oSFZIywLsAdekdqnMiZL51cUtTN2EcHqLBfa4CZfF2sYjvuShWUmLO8SffHtu7EPO4TbRYe+1jT3dJ9neA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e99c327-2899-4d86-9a5b-08def6aeaf23
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|14060799003|82310400026|23010399003|35042699022|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	nbrh6mQgk98bxFQ5238bcoaYuofcMiTqgU8iBZcW+7wOU0uGtDZ9pBe/0pyEDn6Jgy6CaNXdSx3IwYxHae6Xr4ckLVGSCqBD/2cs8saqrkPlCzjhXCUBc+hKqWRji8ZB8SKuvKbyFl9Df2TMk9xOEGp6qm9Ld1qd/JAMwZiyK7+HXD/3B0xQKibePREqKAAJ/1JSd37jSm6Ymx8kk8HT2ZG97IFMsAJSdxxGux8HUiT3M7Rwbv9DVK/orGnY3M6afRGkNsNs1aEeZ07KdG9oEm0iob3BJvwfUgEkUG08qVLM5Oav5F/cBGStWOixg+aUrnpd/3bkso0lJgSVAUXBqByYhzzvRMX9PUIwPus8Qwh0mJkB9WmXZgKLetfikc96gQQdWgJfVabLg3/upHmJgHPaUs9RytU85FafqNsYNHDCS35sLtoKBDtkXw8WW+EajY2Rp80kM1MhuVgyWkGltS0IREJKsngWofvGZcnag/e4XAXBMEBkj5FB7VDPDFaic2aI0rUVertz8flghoIHsG81qGpHHb+0QHOJ6VmQpNebkqvHGglv82FWz9Wje4a+Kfiv4znMQE+7fd07sstcwnqwwNsOXpuLxzhupbihjIewKG1MAUGt9/O1fPHr/EPKCwHFJVp6XfFV3Ftg1SIwABnn2A0WzejktPxRQuDf3zrD86XAKp+sfX1Wcax3eXcbf7lh9mRe1grnVrYsNFCVmw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(14060799003)(82310400026)(23010399003)(35042699022)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T4cuSOrrAgzvAQ3LzNnRabN34Q5GBLpzAMoNlqajCSkUCjnf7wAI2DOB2OOR0zxhAe0vnFp3J6TZOtQvzSEXprddzz5aPyog5aZ7tq2ocTTQnUSU+w79VjZtkqb48s6rq8fwFEkt2vTDVnN7iS5o5+Ned0f6q0zyaxEkzDXLrv2L0AvoadVYmbwBUdzW5vmY83KmqEEbw/mKIztd+UlJAOUhXPOfZcqm6WNHI2gCqh/08KokAgt1qTZK7JUs+Ycj71UyzUEfvvzah8gGRCLpTUDI48BQMZad2zurFGRr82z+tlOvgYEAmepIbuarSOI2vaw760ZoW6xILmhi5pmuZTwaqdawJWmjgRH9eefaPzaRwTPRjdEsLduJKxNnouWRx1tU0YamZJPqdGzgdFW04TsNR0SLVTvF1Fjp+8WsPnvpON3R4X0OwJit9rp1RSOW
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:12:17.9298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e057fbec-20cc-4f1f-5bfe-08def6aeb67f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8681

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 408 +++++++++++++++++++++
 3 files changed, 437 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 4a0cde8cc3b7..69b1f7515601 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -165,6 +165,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 000000000000..9cc21ae32ed4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 000000000000..a497cc4dba28
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * High = connector, Low = eMMC.
+		 * Define active-high for logical mux state 0 = eMMC, 1 = connector.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x40000000>;
+		device_type = "memory";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_4bit_pins: sdhi0-4bit {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * Configure as input without pull to avoid overvoltage,
+		 * and accidental use e.g. as gpio (default pin-function).
+		 */
+		sd0_dat47 {
+			bias-disable;
+			input-enable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * Configure as input without pull to avoid accidental use,
+		 * e.g. as gpio (default pin-function).
+		 */
+		sd0_dat47 {
+			bias-disable;
+			input-enable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.43.0

