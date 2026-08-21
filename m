Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E111243712C;
	Fri, 21 Aug 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300331; cv=fail; b=lIGGTox1BKFVMazQS9cW0hNPbWtlKJi2t7mSNU9qGYod0l2MdmOv320Sb1LNgnF+L8MlSOcaxGg/KGKsoajhRnk16/UrRq3SMivsIZDe3XQyzFdU6cw6v/6ruHadTpGm+H4i1a5SaWDdTZ3SxowCoOq8weo0lY8LwQx+va6lrzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300331; c=relaxed/simple;
	bh=QMtomWao5YH+DoRlTTDCBQcBkogVELaUXwTy3NPgbOE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eYTmTKuzxVeG5wAOP1lg/z5DaJ7MZGIiQF+UB401j1ZrSE4Z/SrvPriiplxULH6dK2Fp1OwIVo6LfT6DO/IcLXoEqlKMNTGF6JQAzB08/FbdyYsTFY1f0sTGIAhF6BIS2lyOtqHHHnqQem1zS5NzuYZXtLqGcGmmQyd2NR2Zn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ltOPREIy; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ltOPREIy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meP9wL8u7Chyv49iw0uRcUgxMf8gZ0nCcKPO4y7adcH3IRpwxtKt9BO36iqDaQMtJC6y8ZfHvcTPYj6Q03gI5s7yos5EF1RgS+GGgplYcDefAl0kWAOEpVyjRsipZv71lOCyiRcKU7B14Q3sTWUqPVGxil+EpHXNkLPd/7lvadxNIrPTmwNntc3T2qOzRQ1wNPJvL1fXf3a57drELTZbqpLXYW++VFvltbKI6SDkc95Ty1FxweqpYr/dcBUa+IGiDk6hQ+gOMThz+8LVGUUDlQoGBqpixU62NbmxI+ndzttG2eeGQi5p71eLtMDQjhBNr9vkQJTmraq0hCMJ0zTUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sNw+dYOgFz2a54GUjuT5h1hhycQQnSrdIE+X/4AOnU=;
 b=dQ1tthluW+CsrU0Mtt7lzZ9IOGRBPx8qL0RYOYWuZpyEZnUmVpfX2wEEYcBMWqOoUXKNOoggmLhciX5h3/9juWFVSwUeX+J9v7BWQJ8RUnkX9zG8DdECllT4fuUpjulCC56FRJqwl0IUO5+TduiJPcMRNGxsIsvxEpxtzS5VxNwXZQfjntMLtlxODIlUvnQobThkcWDDXfFOSBfk4CUWcELFgyElPoaRNtYGmz/Mxzl6cmEvRmd/pW7b4Lj8MvorJ+/OMhzj/i4Y9WIGT6qfehkqDjspnzl1QP7MDFNzFgTkK1glYBOD3p5y6jwrjkHyPYoCOZKQfWPV8HS1gJMVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sNw+dYOgFz2a54GUjuT5h1hhycQQnSrdIE+X/4AOnU=;
 b=ltOPREIyXMkclB0oIGQR/IZvFqPz383/3ffV4pMoG6UCJQjR3TjO1mrK29T9Sjge8JSDPiH0vlQhucUIrJeTgoEAhmixRZhjbC4ey/ABsneijkFRSyRoKpmkTTRTvIrCebp/BzBDCdmdVgGoEhyvoOp7YL72aLKZjWMoLC6XQpsyXPgcIFLgV1qmn3364FjFj8KErE50Bc6b2zWtpy6CZ0J64QZcBiwXFXpu79FiXdmAyLaO4Dvv28klkQN69BTtPyz81CbtS9EWLGrt/4UXBiBxAhZp1I770zw17svqbTvRg09qtSabrt1rTIg2BbVd78E1HcWPcyL6fkfqhENMkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 08:18:47 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 08:18:47 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 21 Aug 2026 16:22:36 +0800
Subject: [PATCH 1/2] usb: gadget: uvc: replace mutex lock/unlock with
 scoped_guard in uvc_function_bind()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-usb-uvc-fixes-v1-1-80e6e279523d@nxp.com>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
In-Reply-To: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787300562; l=5531;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=mWUGXT1C1WJ4OWhj9NKPCDvp2bUAKjPPAJo2sGch6hw=;
 b=KSliM4m61at4JcSyDjzD0Lu/OfDW/Hm40sHs9HVWA5KALmCNKNf0M97tT1xAPtXCxDN0qYIzy
 sFssdvg0gfFD5hi/Z86fXUX7vvTV6RE5ggevp3rS2HVlLarelcBdwft
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI3PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::18) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 239fc40d-ea14-4230-4b44-08deff5cd241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|22082099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	O9AKpElArLREaeM5JEYFPO/vdKlhF3sOE86vTMUf6gaOrL5PsM6B/OZ7M1DrhJvBwJYpJNNYjIIJs8I3oIupYxDW5ZKsmKAx+pJ2hUgWWr8hy9u4oNY+Tx2iYOuqV/EB5LEjLVHFruv1VnQ2n7lzZYivyt7lcjSWLigIrRJBqosBUbSP60ur0RWFjIbBGaipr757zCGj0tvBSm7SMfCKQ1FoHYwKaNhi+uJqH39RKfcpzT/6W6/B1ErV8mKUqiVvv7E9PgNYosi7f93jCeufd/ZPCruT8WZwfJrnRpcLKyKsPt48XpRR6kDwVldIvPojqmLAWrBGcYyGSPhZJALk5SYMHY/GAo/OtgutMLQAmpXwbDsNWR9yhK4TZqYMfKSEZFAv9YKG/S4G1P+VA7bJ1JZApJo2Fhj0of2dJhiHExc6m45wVRGqP1moWrW4N06S6DNidofq7z7mHpeSgl9YMNF+eQniE2sxmjkhScZCThton4kEK1L9yMy64KiUFEGvEw3CMB6OnBcYkSW8Xq0gE4C/7M+3EGFVEBgJ8as+ExovHP4ogz+OZNB3tSOZkwFTPmXdVNNk4XGlCJDmdpQ+bZxPw4g/Wn0gBJQlML3JZBrDMHr7OH1/VmZe6htvCF9XdVuD7IcMb82kcBJhBZyB6kxweWOXTcxsBsowX6/tNwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1SU0xHeVlhaTFLNmV0czZ6Q3kySi9rZVo0QWdkTGJ6VW5ZYVFWTnZQOWIy?=
 =?utf-8?B?eFpyNS9OZHlpQm5LUU5TK3luZ3R2a1dtTjV4K0V0OVd6MkJMUTh0a1hZUkkx?=
 =?utf-8?B?VkFjODRydTFuYlJnUEFQTGJWOUdmekxReFI1SUpvRndRa0x4NENTVTdTMW4z?=
 =?utf-8?B?dHB3OWx4Q2hPZWlQT1hUS3Q4Yk5SK3E1Q2llaVpWSVRxY011T0xDWGhMNGFq?=
 =?utf-8?B?SXFtTmxOQlEwTEtJcEJWYlRURW9HTVgxVVhvOVZqNnVkQ2RDa0t0KzJERDFn?=
 =?utf-8?B?MUFUOHRnQlVEcTVHZVVvMWlhTXUvblBDeU5HRkd5bDhpeGJHVkQvYmJKQmQz?=
 =?utf-8?B?OURVTmxSZ0ZSZ3U5WWRuZUxXRDJlTkxIcUFITG1yNVlnNWh4bGVRR0xBSVQy?=
 =?utf-8?B?UlVvYVVZNFNkUG1yTk1od2E1SkZ4cEVxd2xPanN2VTR5TkY3M2ZQZ1QrUHNN?=
 =?utf-8?B?TW5rWlA5Yk1qaElYbktJWVc5QTY1Si8rTEIxdTFhaFd2VFZCZlJsSkVNdmdz?=
 =?utf-8?B?Sld0L3NxZlJCTmtqMnlhNFhTbk50ZGN3SUZsb1ZrR0pvZnpBRSs4bFdoelpj?=
 =?utf-8?B?QmVuZFRFbVdualRma3Z4RkdmTnhRNHFTWkxKTHZWTjNZZlBnODBPT0lKYUhM?=
 =?utf-8?B?c1ZlVC9jUy9aTy8xM3RRMmU1NmkzRzA4UlNHTVNoREg0Ni81UzF0UFlTalk4?=
 =?utf-8?B?UEJXQ0FxU0dGMytFQi9TRUw1em9oWGdka1d0bjVRd2haVkVMdmpaUXBFVDZX?=
 =?utf-8?B?bXViUFlia2xrMFhqdWx6VGwvWVVObGxJRHBzRXZ6dGkyMlc1aUxFS2RhNkZN?=
 =?utf-8?B?dlF5MjdpNjk0TkFRMW1ISm9HTnFLdXBsMWNiK0Fab1JZQWdwNFlIem1oRmJh?=
 =?utf-8?B?a2grQ2lsT0p2UjZ5TGh4dzlGcnEreHhYYWgvdUFOZlZVTnZKZWZqZ3N6TUxI?=
 =?utf-8?B?U3FhZkswbmxnOFh3dVZ6cUxxR3ZMK1I1UWtKaHE0NForU2MzbCtXQXVaaWZt?=
 =?utf-8?B?a1lsL1UybU5GOGdmdHNvMm12RlJ0VVhWUG5uaDRxRU1Pc09RdGVYYnlOcDQr?=
 =?utf-8?B?T2E1WWJpSStYLzh2UkpXaUxxSk5aNDJxbUJ5OGJhQ1RzUjM5RHJvZEluckZo?=
 =?utf-8?B?OTl3YUI3ZzRzbG5UcWYraGo1MGFnSWFNd3ZMbElWYUZqZFIrT3NpNjRyeE85?=
 =?utf-8?B?RkJlQXR3TjNJRFNvbTRaZ1hobERkWG5KMGlwNThsbWhmNW1GM0tUbUNiSld0?=
 =?utf-8?B?RTRud2hxTjFPMk1EZGk1a1NLaFYyWDlvU0piSXVKNGlGdWlrYy9NTkE1MUdY?=
 =?utf-8?B?VWw4M1RCU1RuZCt5c2dQZ1hoQmJEaGtFTWJrMzRNTDBHLzU2bzF3cFhDeW1n?=
 =?utf-8?B?RXNOWE9uQ2tyYjhkazc2QWpjeFd2dlRybGNZYVZaR01Bb25oOEFGSVhNa2RY?=
 =?utf-8?B?OTdnRHhVWmhrbXZqV2s3SFFaYy9uTWt4ckViRFNqdFdjM0xLU2wyNlBZWld3?=
 =?utf-8?B?WGt0YXM3WHRkZzcrS1NKa1pIUE1EL08wTFZvR2pUYi9aVHlwWnNiM2RTQnVo?=
 =?utf-8?B?TmZ6ZWZvZkV6OXB4RUJCRDlhaXhhYVJVQkZBblpNYjlSNS90dWNGMHg3WVZm?=
 =?utf-8?B?TklTOUVtUHpVcDNGQ2ZtUGoxZjIzUk8xbU1IUDNiNkUyYmdmQ1FDUVR1d2R4?=
 =?utf-8?B?MnlNOXdoRXlPc3JaOXd0cEQySFZKTElidXFLZSticXQ4OEJxZW41dG0vMk54?=
 =?utf-8?B?cWx4R1h0bm54c01udGI0MWZDQ2svQU1lTnFNeEh2eXZJRE9PeXJRd08xajJX?=
 =?utf-8?B?aWNhRWFOOUx1L1ovdnJlZXFRWW1FdHVCTDk2RnNEUWNqSXJkclpRenZRMFVZ?=
 =?utf-8?B?YXlQbkRVeEl6Qmo4dEo1L3B2UFhUZDhkYW9mUFppVGRKNkNXaEVoRlkzemM0?=
 =?utf-8?B?d1Freld1M21nNTZkd1hCaVdtNFgxTVdlWUxWQXNoTmNHSHVHRWN6ZTlXdWhC?=
 =?utf-8?B?aCtvUTFXemdVMnBoWFlSajg4YUZmQWNjU2VKV2hTbmNncThKQm9TekNmckU1?=
 =?utf-8?B?VytYakJlSFkzTXMzOVlxdlpIb2NjQVlyZ3ZuaHQ1a1BGeHV2R1J0RmZVQWd0?=
 =?utf-8?B?SkZITDhzY203U3NnYWZrMkprdk9hTnF6cE9NWG4rWkZSbGYyaHprOTNYL1pw?=
 =?utf-8?B?b0wxRGJYemZrU3JuRkN6bWRCRG5WUXdmSWpNQStGRi9Zd2lUaTBzMVltSXNO?=
 =?utf-8?B?MDlKOVo1dGFWTngzMWxJSUVKcmxjNXJtUkZteDkyR0M5dythZnc4QUlydFFs?=
 =?utf-8?B?ZDhSNElBV2U2WHhuUHNEMzJDRFZEa3Rwcm5PVVhBcGVBSlpGeUk5eTlOMStF?=
 =?utf-8?Q?70ouJUDtSRsPFaJqM8/OieKdIhuZY/5r2bSMB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239fc40d-ea14-4230-4b44-08deff5cd241
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:18:46.7480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rd9urdzEEGDI/e4rbAx77NWF1hIbWFsGmdRfIkfgmrk9DXhNbCz4oZrY2wS138Lmnjqku+JEphc8RLq0Rnsy3zEohdNE1V6bm4aqkxf6cZ+TThjy6pidy0Lni6AQhYk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571

From: Xu Yang <xu.yang_2@nxp.com>

Commit 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks
in uvc_function_bind") introduced an error_unlock label to release
opts->lock on failure paths. The label is misplaced between the return
statement and v4l2_error, causing it to fall through into v4l2_error
and call v4l2_device_unregister() on a device that was never registered.

Replace the manual mutex_lock/unlock pair and the error_unlock label
with scoped_guard(mutex), removing the need for explicit lock cleanup on
error paths.

Fixes: 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind")
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/f_uvc.c | 80 +++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index d1bf3ea75197..a4fb2790f4ff 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -768,23 +768,17 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 
-	/*
-	 * Hold opts->lock across both the XU string-descriptor fixup below and
-	 * the descriptor-copy block further down.  Without this, configfs
-	 * uvcg_extension_drop() (which takes opts->lock) can race with the
-	 * list_for_each_entry() walks here and inside uvc_copy_descriptors(),
-	 * leading to a UAF on a freed struct uvcg_extension.  See
-	 * drivers/usb/gadget/function/uvc_configfs.c::uvcg_extension_drop().
-	 */
-	mutex_lock(&opts->lock);
-
 	/*
 	 * XUs can have an arbitrary string descriptor describing them. If they
-	 * have one pick up the ID.
+	 * have one pick up the ID. Hold opts->lock here to avoid race with configfs
+	 * uvcg_extension_make() and uvcg_extension_drop().
 	 */
-	list_for_each_entry(xu, &opts->extension_units, list)
-		if (xu->string_descriptor_index)
-			xu->desc.iExtension = cdev->usb_strings[xu->string_descriptor_index].id;
+	scoped_guard(mutex, &opts->lock) {
+		list_for_each_entry(xu, &opts->extension_units, list)
+			if (xu->string_descriptor_index)
+				xu->desc.iExtension =
+					cdev->usb_strings[xu->string_descriptor_index].id;
+	}
 
 	/*
 	 * We attach the hard-coded defaults incase the user does not provide
@@ -795,7 +789,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 				 ARRAY_SIZE(uvc_en_us_strings));
 	if (IS_ERR(us)) {
 		ret = PTR_ERR(us);
-		goto error_unlock;
+		goto error;
 	}
 
 	uvc_iad.iFunction = opts->iad_index ? cdev->usb_strings[opts->iad_index].id :
@@ -809,50 +803,50 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 
 	/* Allocate interface IDs. */
 	if ((ret = usb_interface_id(c, f)) < 0)
-		goto error_unlock;
+		goto error;
 	uvc_iad.bFirstInterface = ret;
 	uvc_control_intf.bInterfaceNumber = ret;
 	uvc->control_intf = ret;
 	opts->control_interface = ret;
 
 	if ((ret = usb_interface_id(c, f)) < 0)
-		goto error_unlock;
+		goto error;
 	uvc_streaming_intf_alt0.bInterfaceNumber = ret;
 	uvc_streaming_intf_alt1.bInterfaceNumber = ret;
 	uvc->streaming_intf = ret;
 	opts->streaming_interface = ret;
 
 	/* Copy descriptors */
-	f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
-	if (IS_ERR(f->fs_descriptors)) {
-		ret = PTR_ERR(f->fs_descriptors);
-		f->fs_descriptors = NULL;
-		goto error_unlock;
-	}
+	scoped_guard(mutex, &opts->lock) {
+		f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
+		if (IS_ERR(f->fs_descriptors)) {
+			ret = PTR_ERR(f->fs_descriptors);
+			f->fs_descriptors = NULL;
+			goto error;
+		}
 
-	f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
-	if (IS_ERR(f->hs_descriptors)) {
-		ret = PTR_ERR(f->hs_descriptors);
-		f->hs_descriptors = NULL;
-		goto error_unlock;
-	}
+		f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
+		if (IS_ERR(f->hs_descriptors)) {
+			ret = PTR_ERR(f->hs_descriptors);
+			f->hs_descriptors = NULL;
+			goto error;
+		}
 
-	f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
-	if (IS_ERR(f->ss_descriptors)) {
-		ret = PTR_ERR(f->ss_descriptors);
-		f->ss_descriptors = NULL;
-		goto error_unlock;
-	}
+		f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
+		if (IS_ERR(f->ss_descriptors)) {
+			ret = PTR_ERR(f->ss_descriptors);
+			f->ss_descriptors = NULL;
+			goto error;
+		}
 
-	f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
-	if (IS_ERR(f->ssp_descriptors)) {
-		ret = PTR_ERR(f->ssp_descriptors);
-		f->ssp_descriptors = NULL;
-		goto error_unlock;
+		f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
+		if (IS_ERR(f->ssp_descriptors)) {
+			ret = PTR_ERR(f->ssp_descriptors);
+			f->ssp_descriptors = NULL;
+			goto error;
+		}
 	}
 
-	mutex_unlock(&opts->lock);
-
 	/* Preallocate control endpoint request. */
 	uvc->control_req = usb_ep_alloc_request(cdev->gadget->ep0, GFP_KERNEL);
 	uvc->control_buf = kmalloc(UVC_MAX_REQUEST_SIZE, GFP_KERNEL);
@@ -884,8 +878,6 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 
 	return 0;
 
-error_unlock:
-	mutex_unlock(&opts->lock);
 v4l2_error:
 	v4l2_device_unregister(&uvc->v4l2_dev);
 error:

-- 
2.34.1

