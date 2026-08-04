Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC643BDB3;
	Tue,  4 Aug 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832671; cv=fail; b=dINg+yXGzHGrjVIaSJrdTxXSC8cjM8aw4+OEUleiOFK8L6osNrghVXjCDJdGaXkwhWolwb8YeWpC9dv4PniU3J9ZaNtUCSTJFc3yA7CVo7M9ZHFjjDmDQO+YHiWwnV95/W2KcnUh5YFPEYBnw2Bo3W6hfeeyOR1e3Z/vBcPn2S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832671; c=relaxed/simple;
	bh=4plfKsCx/jcQWXEqFam6Z+Dm8MZT8tgxkHVRbDhO46s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gS3lwLfIgcRfMM9D+OjtUzp+yTjraEZmyfso1el9pMmaCF6opPcSNJhzh6R3VMFu+CClx0SEHdjWSWK+I1Uq3oYQqESrjkQfktC0QYdNJlbBdgSCIBVDGONMHwmP9Tz3o0QMTC3IKste+ZXHxHOe/Lm1zcdRhCvnKGN/E3isteA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=4t.pw; spf=pass smtp.mailfrom=4t.pw; dkim=pass (2048-bit key) header.d=4t.pw header.i=@4t.pw header.b=VvNNLx4v; arc=fail smtp.client-ip=52.101.127.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=4t.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4t.pw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4t.pw header.i=@4t.pw header.b="VvNNLx4v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wREnZzGxIxrzjspjicFHTqGiBw6gZBv+SY4mVWNdAtmyD+tgEQUuIh7u24oSArIEwrR4S3UR8STbk4GuE88xNfGOp7f4WEJBOSBCshcPEdntqQ19x4hsmn6Kk0dhJcMRJnqe/eQfhTavJs+iypCs/6rRGLBqT+tA4iWmCgfOJW9nSvhoog+cGO5uUqWW7NwedD1SzvDRdJRiIjvt1c6gUDFTQ1D6dlFKwTL9mQhFb1hlL8w1EPfi0u5eGo6b36BwzshrYpM+nTIrlS60qAT6uHkHi2PDPaD8gY1E1qK8nndlFfRwbvMY1J1kIzF+BnbADde0aqFUnqS1PqUjUc+PDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfknToGVdl+qERKzZ3RyD3RiTg0gtGvIkxrmBDsHzaw=;
 b=BJNVtFa70QAELQZEogv22clD/P26AzBYk1yougEtIfVzX16xRfLSwOBMbo/irE5DHBJyq+wWBq4l2PNFhJujV5fosbpoacCJg6k6NHukd/hCl8Bb4Kmv2t9ffzEPp/gopMIJiVVslAaKWhxKeuGNOx9VF32YUOOlXzoIkGgYPM7RVZH+xC3uxurNSP3lz8/hXyklnLDlv16jT+vmKs1CjeZlsuqwYoAB4xTFYvzBrT56Gd4KOtQF5F3+eyf3VdwLUPYbD7zYOsm172LDWx0bI5NV9cF1uqY2VKoPuw+st5XqX6DfzH2wKz+FUZqrfiLFnK2qt86AyGXcEbxMidKVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=4t.pw; dmarc=pass action=none header.from=4t.pw; dkim=pass
 header.d=4t.pw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=4t.pw; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfknToGVdl+qERKzZ3RyD3RiTg0gtGvIkxrmBDsHzaw=;
 b=VvNNLx4v+nwhC5jzao1NZJ2LYWjfsBvzbqdnZb0txWhoMnVaicS7/f8e5d8t9z4YkK9ZmA3qVYT5SZ/wM7vA7Esq5OmSTuK2NnuSs4YTKOAUuei3f/SjnrsYmzRwqdUOB82s2aaFGDJjzAXzg6ufyNRRyKGw/su5Jv5ktxu03m+a+Y8tnFsaZ6Lz26HYcoJC4ocITMXoMVGSkBC0u85NZ1nM+FujY+5N+qlaZXv7B/MyFJvWV7oTUtlRfLC035Az98tmBwUByrFJ2Ui3DkgvGyAFqMhRO+rBYCVBDJ0xqjsq35JNTP2jFFZhkIy/Xr1o3uHW0r1i38GY9kzCdQcmug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=4t.pw;
Received: from TYZPR04MB5631.apcprd04.prod.outlook.com (2603:1096:400:1cc::5)
 by KUYPR04MB9440.apcprd04.prod.outlook.com (2603:1096:d10:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 08:37:41 +0000
Received: from TYZPR04MB5631.apcprd04.prod.outlook.com
 ([fe80::e833:415f:3732:3823]) by TYZPR04MB5631.apcprd04.prod.outlook.com
 ([fe80::e833:415f:3732:3823%6]) with mapi id 15.21.0292.012; Tue, 4 Aug 2026
 08:37:41 +0000
From: Haobo Cheng <i@4t.pw>
To: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	Haobo Cheng <i@4t.pw>
Subject: [PATCH] usb: typec: mux: initialize orientation switch array
Date: Tue,  4 Aug 2026 16:34:34 +0800
Message-ID: <20260804083434.20885-1-i@4t.pw>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To TYZPR04MB5631.apcprd04.prod.outlook.com
 (2603:1096:400:1cc::5)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR04MB5631:EE_|KUYPR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: d63cbf20-85bc-46a3-55a9-08def203a585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|19092799006|23010399003|52116014|34036016|1800799024|376014|366016|41320700013|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m36/Zs8BQ0aMZAng0TaW22f+g9eLYn+U/ZBbN7ngfHGKV5bTxQiecpwTJzC39KZuK/EYdelsWFGzZ+6fvFl4/OLeQ4+FX46Cvpz1fezpR1FkiLbJIMPON0dpm4NXR4rWw5yppve47nfkhhbTwZ/OnX6y5izwudB4E3cM224143+lo0KakLlxCpo5xsphgcw1Qq/y7WhIRGYRuCxvWkyVVxIF7TwXsCXKcYFlOkSsrG1dPQKVU8+tKbTEpu3mt9J5qXBeJDthOI94AcJoqz0U72Imz5Uf6P11Iqar1QWpcgu9WzIr3o89gsVt0NPg/CvGynvaiXj1SHeG70FL97C4jHya/5rLy33x7BS1TjpfLefWblB+VLsq7o+m5nLGhVWsglJGOxcSQCXThN2Ln7w3loM4/x4E8Nv/zj7VL7P4DOLGpCP3lbZwc8NJCeAfmbLeL7SepsxwRNYbSxJ+3u4ZjAHS84xS0k8zgKhNj+frwL2342U3+NzzH4jIPTv/Njm0BplpGM6kR36yKjltU5QjgHayH3KH7gBEUIA5Fg/vnpZ5+BCQ9FxFxACoMeNXvXpF/FSk6DSCc0FEIOmy2QgDFHCAAYCszhEbyydwXWibnoJlPW03bZqWP0y50/cxobi70crq5NsOR1AvUByPVx/Svj08pEpz/MIWoxxutciFnio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB5631.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(23010399003)(52116014)(34036016)(1800799024)(376014)(366016)(41320700013)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YoqWPRrKtwgPtdivnGy1xgesTlgypTz8jDCJWupR5MIH2mzW4Z98orGwl+gi?=
 =?us-ascii?Q?xapf+gyrob2DCcxGV0FT5AlDJ28qQlhDmRJhATHAC56bw+01l27KDL168BnA?=
 =?us-ascii?Q?s1kYPCXWBEOo67bgn02AaY+ItH223h1iBgyzQgWXKBfsrVdmoxHAXCPIPURO?=
 =?us-ascii?Q?kRTsvNYBtdfpyxt5PayvYTZdkMyAV7WemFwtaC7wk24WNdvD3YmF+vDM6rHD?=
 =?us-ascii?Q?38L5/QwGbovCpJGkRUX8E2DFqQ0Pag/BgLLQ8FtWbPEZLIrlQ7lSYYhbRyaC?=
 =?us-ascii?Q?dPTozE1XBi4KypLT7HzoYPdx/H4TT5LhMshIfl2SmrVneHBRDA3bvTVPIV/P?=
 =?us-ascii?Q?T7Pl0cG/Mp4Io4ANFO2rKmCHTLpFeszPcsar9ft5CwmzosgAVGISvRDgmBRl?=
 =?us-ascii?Q?g+lI3tEj+8G8rRP/x1TBKWYdC4avVqWEEZ5LD41BpVue7BYnuRXG53tFpV+d?=
 =?us-ascii?Q?DzUOeS2QYwcJgAAq1AuBh5NAy2ZDHhz6wdcfRjJY6KzRCcU1GnKieOZWCdso?=
 =?us-ascii?Q?np+qdKUU6OcVh8HFDEKUvlU8xfBrFLuGMU3yxgKFoZO6S0Ev1pXFe1EoyF+g?=
 =?us-ascii?Q?GUa3rNRWuKq4e4SweO4zTAtdfQXep8PQMisIVEVY9INMH/0t9JWWSEO/N9xJ?=
 =?us-ascii?Q?ZWInYecRutbwD5PADZ6Wjkl6t7LOz+nCb13kl+sibGQtDF1pH5MuTtDmKeri?=
 =?us-ascii?Q?PP/OBj2FdytmAQ/P+cWoqrAOCu+zYGzToa4RSy06Ku5iauTdjvXLt5b7LKpO?=
 =?us-ascii?Q?3+kjlNAZ/slxnl3NnFAFIKv0ETRNqU7fxQlyCwSeuo7F+eGDxdZZeobMq5Lh?=
 =?us-ascii?Q?HxAj30xxJhX5F+s6N8wFLOJKt41eLiP0Q3f4kLZce+esB8VNHAb54+bnXyuu?=
 =?us-ascii?Q?GS/qx6F3jo1VG6eHXt2rZFjDexKxtwMgmJcn4dvC02TR0AmkHJePpVdSaW8z?=
 =?us-ascii?Q?h5amKYowzRpVIQGOMZLx4OVyqkCb5vDM1V/CHNIak9LovASM6GyiXSwt44Or?=
 =?us-ascii?Q?HZhagxoEiT+LyHwYrEccOkq6tb/S6ayFUXPWD3XYxKYfUhyqLx7TwaVlUDX9?=
 =?us-ascii?Q?UnCiL3KlWYS/iMB9Xqp7b1gdVV5fRdpqxcLylhU26pUpH6Q6/caf06TfaJyc?=
 =?us-ascii?Q?B8jzNdoVTUsvY2Po/El+rhVdHOAtXXThn5pKeKTX3Zdqm6JqcTPpsf0LcVDN?=
 =?us-ascii?Q?crhXa2Nac+ZkIsGiz9RxNA/4nhefnMw30JS4zpZzVvc9yVc+miZAwdTuJ6Sm?=
 =?us-ascii?Q?ygn5ksxv42yk5nnFO2+6WlybaZAFeEwz0oPuL7Cc4sYfWGibhcLBgvxkzh+7?=
 =?us-ascii?Q?ga2pgfaT9pe8igBjC3NLulg+DCpY4wZyZOVWN3+pIy/GXgfMty8uvb1G4Kws?=
 =?us-ascii?Q?WL2FBJfw+YMOuaPyAuBkr7nj1BMZj3AbTbZsn77r3aFCG7E6fNeYNVBiodP6?=
 =?us-ascii?Q?ecFyUecaBeNbl7vPm5bftMyCy3SnkXIMai4/0bowrC9LvlJpf2QxGJS0owWs?=
 =?us-ascii?Q?3tUSVoEH39FYAU/K8y1s1l3sAKEeEAP14fb493JuzYCbI45m70GD5PJHXdEL?=
 =?us-ascii?Q?on9nVwXO0qNNkLIH0Cc08EawPAdgsqMKDuPxtxjjSkVYEE9KtVsT9dU1HMWR?=
 =?us-ascii?Q?WTohA6fgaZqmnffdgUAsDIC2ZxQQBZWmqCTMs4vJqkrlFlc022cXjFES4AN1?=
 =?us-ascii?Q?OSANrOr/zvf8q8UOP5MKETa+3QhcHT+8DP+qxZyWnJznuD7BYAikHNS2exFR?=
 =?us-ascii?Q?qjAUNTwt0XYfmrrKfxi5om/rUyipQ4Y=3D?=
X-OriginatorOrg: 4t.pw
X-MS-Exchange-CrossTenant-Network-Message-Id: d63cbf20-85bc-46a3-55a9-08def203a585
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5631.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 08:37:41.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 262ce2c7-e1f2-4118-ad6f-ba332dedc11e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60koYKngF6C7OxqnCa/jus/YudxhgzZV4bCNtFTTZjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR04MB9440

Commit a53b4f9c51a9 ("usb: typec: mux: avoid duplicated orientation
switches") started using the orientation switch result array as state for
duplicate detection, but left the array uninitialized.

The first match therefore scans indeterminate stack contents before any
result has been stored. A valid orientation switch may be incorrectly
discarded as a duplicate, causing fwnode_typec_switch_get() to return no
switch.

Zero-initialize the array before collecting matches.

Fixes: a53b4f9c51a9 ("usb: typec: mux: avoid duplicated orientation switches")
Signed-off-by: Haobo Cheng <i@4t.pw>
---
 drivers/usb/typec/mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 9b908c46b..55dab1c76 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -79,7 +79,7 @@ static void *typec_switch_match(const struct fwnode_handle *fwnode,
  */
 struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 {
-	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
+	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS] = { };
 	struct typec_switch *sw;
 	int count;
 	int err;
-- 
2.53.0

