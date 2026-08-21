Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A24279DC2;
	Fri, 21 Aug 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300326; cv=fail; b=sAEfnCoVmzGb9Ux4k2m9wPHQ7kgwsSCcnQS0T89xvDlivVysI3Kan43Dk202XYK0Q8NgCAP9A9dgU7xw778opasX9QWQasCIzZ6cBk3XmbDQ1ucMbjfQxHtAPM5o5nmStZPSGp+6Ez58oTzqDX5CQ+PTJQz7K0LvEYymwzni4HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300326; c=relaxed/simple;
	bh=gIMWmOdERGNu9GxGFF9vvUMS8yayHnEH1jvMrreAKG4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nnW2wtE3tudoTRYeSrFvFl2iG0GayWhUy4aJAIsYUfQhl1gXF9SaAF4H4MNXGX2N+iOZmSdX5ed3xOdz0INfW8MNuLsRVUl/G4X6nEQanw9MaQHbymtlYESPJFDpMCnheF40d0WtbVL9GJ7k0yGUTojO9VpHSEJJYNbsGQ6ud+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=riZ15fs5; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="riZ15fs5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKDlhvwFUnKtnUjc+yAeMu+mr/gBdeT188l2WBUlcBCdjhkbkW0rGD0rfLC3C1bfGsWCcRY8qERkeJCpLyZvconhuCI6sfjRfn8O32xdhdOKfyzMS4qnAu26asZILZxRMCAAUYWzpA2kgrokev+GOHtZf54+JrfTf/BtySuKML4mjbPzEceDEVV9MJdGRL2EnEQZ+p2RzEhRc2doFOaF3E2mY+GaZVVbf3E6nAC2El1wlZUugxluQI1wQDbRirosT0kW3sspGM+HHJd3Rzgdi+g8D67rBYWACCPu30fym/TzogjxkWHYt/Fps+SzBT4sdW40svk0x8irdpyAJRwzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyCPnEZa+DrrK1upVtG/lyktvXsczPsW7dNI001TBPM=;
 b=YQ8RzsTq48JP1JHAbegYd1iB5+Yqp+gHZAyKWzkoDqKCJ8XRYIjw/nR9TXPpIoiXK43Fe+R9+S6tkMOwVbWzCoxwigKDKOzm1ldPfhLemraWRWx9v0ov8PixmSO6RMuguRrHEfDkhBTVZdlOh2JhGMDAnX8FmJWPs/rm9pVGnToH5mpJwdYi0pdGq3v+8kuOsJVEOpHfcLK8ONnv540XvOqAz6B2p9OzbT5T9PsCAPX79ZtHvwVsIURUuHZu1HeNLtZ31uQzwQQbPwN0mbaNtX0Xa1uEUOL+wHPsNBqS+lgNU4oTTAUv+qf7bazkOONXNVTQJACpdt5f4HwgKh5yvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyCPnEZa+DrrK1upVtG/lyktvXsczPsW7dNI001TBPM=;
 b=riZ15fs5WAXDJGshO741DkLIGBEAdyzWZRgsyG59qK4lwNbXkXZ4cpEuj+I+T/I2HFYufWOdyN+3l3Zs9If4QHn8fFfuYg5qbE1bIlt+5rVx+F8KrGp36sKjWLwn4TU6Picl2U5Wh3KuErqiZfe9QCRDiwo5ms8GV4nQcwq2n5ijbv0rZzhHVldFIUxBE+gOo7yWh8szWc3OjPbsGN5LKFAw8cMqHTQ4vOl8BQYiiBlobnJ1bVbJepEw57nhO2OrssNsI5OGZwsG6aHF636UpxmhT5wmC/p+Xwr8hPGI0CqlYnZfwHVvuBV80DQL3M3vNn5NRP3UDzxNQT8rEa14QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 08:18:41 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 08:18:41 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Subject: [PATCH 0/2] usb: gadget: uvc: fix resource leak on video->async_wq
 and video->kworker
Date: Fri, 21 Aug 2026 16:22:35 +0800
Message-Id: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsKiGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NL3dLiJN3SsmTdtMyK1GJdY0NzM0NL02RDE4tEJaCegqJUsARQS3Q
 shF9cmpSVmlwCMkSpthYAr1/kCHEAAAA=
X-Change-ID: 20260819-usb-uvc-fixes-3176195c148a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787300562; l=981;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gIMWmOdERGNu9GxGFF9vvUMS8yayHnEH1jvMrreAKG4=;
 b=KBg/te8IrVfUz0gXW1ygd7HrJPEYgsO4EV/R01Lgw4wINn+CBJc0H1caKAk/MfTv2WuArL0MO
 ffPWyuNDczoAxfZFW0lWzLV1qiybNBwjC38sdCNN6rT1fFec0AZXJww
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c229d0e-a2ac-48e9-9eb4-08deff5ccf3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	fxWBZuGrBoPPo/5q8ga69Tb2Q3VcrRKAosLmRMz78MHmoEHigiiayzyF+6fd3+ObwnP8bo28aOLiZboaG7yVF7cHFZicfQfAqzK4T88mLmXoZGl7RSxNRnr70PQ1eVfzpp41fhdlBN0DcD7XJmaer5GsR4R64lWzodPKXLZQPBZ4Iu7E8efQwznsBLX5+5ApVPmQtl+MJkCetlipupRfIrILovHqwSV2v4MJ0JoSSJltGo1XUBtQzKEIvD1qCOnppFzYMQ9+J/u48L7u/tia46f4r2LAL6wdxu4dpgeTc9DzoHoQ1Q6rP0LrdR+6LxLQrD/esDrJFzC1wjdrldPkezxRYRS/6k1GECNmb2i/7109by8mKK/OqlDUP8DjlvlCaEe/QzGynIMZmXiAD1Ffldz57fmg1pkM+Lr5/N/Oa/MKno4xpBNJz5rkLbpuk7m0twGihxut1YJPLza9AvsXy3RfJP3bNeQHrkREOUtSSo1NkSUi8OhFN9HM+e3d+QP21tCFikSBgpNOi41CG0isp2GPf3dHywiF1WgJKXM69IT0Zy6J1zIwgTpk9ucSiHRIYobbWyunB2Tl/VBb8QJvP+GHxhxzWYnp/WoiKfjbSbhBwr59SUENifPLUjU//TrHOxSdOaGc+OJkdtCi0fSshA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1htdmJhWXpFamlPcnNJaUZhSHlRZUpSZW5tTXdEZXRRaVlsRFR3ODN6WWhq?=
 =?utf-8?B?WXhTc001NmpOa2JvNHdKVE9ITnNxM3hRTWx0U2d4MHlXSzdMQkpiSlkwd1Ja?=
 =?utf-8?B?VjBtZ0gxYjNkRVpieGM2Uy9IM01JWm9ObEZpNmhHYU5uMGJxNWJUWDdNMXJx?=
 =?utf-8?B?cC8wOGt4R040UVZtT1RLaHc2WjdoZ0xHcW9XRUZsUndnT25hb05sS2ticUNZ?=
 =?utf-8?B?UmdpOEtCN002bFlsTCtFdUViVDhyZXJRcTJrTDdQRzdMVWFjMTh6eGo0VTVW?=
 =?utf-8?B?cGZoMk1ERnRsUHAvQy9MZkx1U0hMQUJPSFBxV2lOcWlPOXlXL0dhWWFqYmp2?=
 =?utf-8?B?aW9VR0xoR29qcWtQV0d6bmtvSnM0bkE2MTFxVmtVRk1UVWIrVFJlY1ZMcmVJ?=
 =?utf-8?B?L3pRQjNKb0x4WE1XTElQY1p0L2x3ZUtZUlMxekF6dVVtTHRNVnAyRy9NUXBQ?=
 =?utf-8?B?RDhmcXpEY2hjUTFNNE9LSU9XTy8yc2NjZEYwT3RaaXEvRnJPNWUwZEtsY1V1?=
 =?utf-8?B?VE5nWXdVem1sRlUzTldidlRhVk5YYUdLTWhoZEV5NTl5RHR0R2pBNWl0a0tU?=
 =?utf-8?B?bkEvN2FRKzhWNjNTbEcyb2NuZG84THdJVjNLR005T3BiU1UrWGIyZkw3Rk9J?=
 =?utf-8?B?UlM0cXNIQTdSWklJVGtTaHY1V0lmSTY1NXJ3d3YvUGN2ZVI1QzY0bmFXV0h4?=
 =?utf-8?B?WU10ckpXc3FwS3RreUJUbmRkaGkvSFU0aHUwUy9rcUFaOURIaVBvWk9mUW5M?=
 =?utf-8?B?ZWtGZFdWVjR1YW1qSEttSU5VRFZueEMyTzRSTVdwemE2NFhNSnNrMVNYUTVj?=
 =?utf-8?B?R2dkRktWSXNJTVBpNkFuNHU2aVA2WExuTUVxR3MyNUFSTzdZanNTV0VSY2ZH?=
 =?utf-8?B?bVFEMVQ4eU5GYzJVNHlLYnN2NHJxT3ZYSjVlTjNsaHVPZ09yUFlsdXdhZHFN?=
 =?utf-8?B?bFNXdWhmaWMxbzhWOVdSdFJZNGtma0tqTTJpZWU5R2pkVTRIbDBnMHY5MDVL?=
 =?utf-8?B?d0hxVC95K0pHZ04rQ0Z2SHBGN3U4MnFjenBDWXhXM2VMc0dhSTRKdmx6dTQx?=
 =?utf-8?B?UEVZSm90MVdENlI1YkxJV01pQTMrbWVFVkdkanBwWHVPWmRLdlVUYWs3MU9I?=
 =?utf-8?B?MDgvVmFjaVZ0VmZhNm1qM0FpRytuSS92Qm5jNytPV0FGNW4ydXJaVWlVM3RJ?=
 =?utf-8?B?UzNubUhQZWJubXFNRXkybHdaK2xXaGpkT1lsUXAwdTJrVlJkbXRUc083YW8y?=
 =?utf-8?B?anl6ZVhPZkVpMU9Ec2ZIZW9wbjZsajFlcnlTYWgvaDZaQ1Q0MnhlNW1QbHA3?=
 =?utf-8?B?RGZGNGE1TG5mSWU2c2JkekJNaVExYmpZUzR6MUFUaWFNOHRFNkZabFkyeGFq?=
 =?utf-8?B?MXJya09Ka2F5WEk5MllYWVJDZVYxcWQreW55eFdJRjdGTHhQNFNQZW9IelRH?=
 =?utf-8?B?WTN0OFByZ2lPN3VQRHlVeEk2OUNEK2tzZGVXSko0bDRkR01CbmdPVXkvTUVS?=
 =?utf-8?B?S2VDQlVzSEV1TWF4RGI4YWZXa3VZZXo2TFJQaUkybWhEZE5ML08xNVFpWHh2?=
 =?utf-8?B?Rk95eHJvbU0xZUlxRmFqRVRrNlp0NlB3NFUzMyttNUU0Z05hYnhWVDlVYk11?=
 =?utf-8?B?Z1hxWnJoZFcxSjdiZUVrYzljbzBWcE84ckx4ZWVqNkpuNFNKeDMvT21oSkNF?=
 =?utf-8?B?NWpzbXdZUWoyYTZBVml6NlFJaGtWeW5tV29KdHdyQmc3K05KQWhHdXQzQXRL?=
 =?utf-8?B?WWhZQkRzeXZqVTcyQnNwZXA5ekZiQ1ovcDFsb3Frdm5FWlZGZyt1OXYvMFIx?=
 =?utf-8?B?Qi9ZUDNiVWV4cStyRW9nM1dhelB0RitLOSsvM0hzUmUrT0txa29YeXFHOThZ?=
 =?utf-8?B?UUtqbS9RTk9URUgzL280UFV2OE1TRTV4czFQNFlUZU5KOTFFYXJJRjdBbWtX?=
 =?utf-8?B?eGtlTFpwVlZKWm5PZ0IvT08zZDI3Z0pmeTVXb0pkekt2RXBaT3RieVhwUXAr?=
 =?utf-8?B?S1NLSnM0NkF4MWd6RTg0U0FNdzY4bGJEV0czZEFuR0tJaXQ3cnZyTk9WM1Q0?=
 =?utf-8?B?R0M3c0xlZUJCWjlDNDJ3TXVwcjFmQmZZNlZsYW9TazgzY3JZNis3Z3VEUzVw?=
 =?utf-8?B?V2ZqclUxWUhHOUVEZWtJNU8vTlNYdDl2STExNFJheEh1Z3B5V2xETUF2ZTFo?=
 =?utf-8?B?NnFJNk44ajE0eHk5UW92R0xVRFZxdUlOU3NUOGw4QWRjeGgvcEFZUUtIYmlW?=
 =?utf-8?B?NDBKcmNXakJUVXlUZEdMK253ZWtiNlNxOEludWsvaXBVL2JhNjV4MGJ0VU96?=
 =?utf-8?B?cytETlN5aS9MMEJGbmVVSUlJTWs0R0RodlBWYXVld0d6U0tUbXlIRVZTbWx5?=
 =?utf-8?Q?/oirQY1qR9Pc/Nv0avt7jbtHsqyZ0q0x3/y4C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c229d0e-a2ac-48e9-9eb4-08deff5ccf3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:18:41.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpvGYXer/3+Czw6GTKosUOAf/Ns93RPqqfCyFNwWAhieHjNfarHdAU3y2yniFvvvAWtUD4uSEen5n7e4LQ4wTAZe4Ai4hwZzRT3MI9GKjX8ka5LlcrCel5cX5Y5A2js5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571

This patchset fixes the resource leak issue on uvc_function_bind() error
handling path and uvc_function_unbind(). For the former, video->async_wq
and video->kworker may never be destroyed. For the latter, video->kworker
needs to be destroyed.

Besides, patch#1 also fixes incorrect goto labels that could clean up
resources not yet initialized.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Xu Yang (2):
      usb: gadget: uvc: replace mutex lock/unlock with scoped_guard in uvc_function_bind()
      usb: gadget: uvc: refactor video cleanup into uvcg_video_deinit()

 drivers/usb/gadget/function/f_uvc.c     | 87 ++++++++++++++-------------------
 drivers/usb/gadget/function/uvc_video.c | 15 ++++++
 drivers/usb/gadget/function/uvc_video.h |  1 +
 3 files changed, 54 insertions(+), 49 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260819-usb-uvc-fixes-3176195c148a

Best regards,
--  
Xu Yang <xu.yang_2@nxp.com>

