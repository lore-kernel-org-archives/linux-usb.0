Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013079.outbound.protection.outlook.com [52.103.74.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ADB3EA967
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819195; cv=fail; b=Q6vZAxxPQcmX2pyH9JXE8l3NeQW6RMF3fJYT9Ze1E4qjygK66r4qjW62ri1yT2VLtGTIQDKOcWc7CzEPW71XQZz8x0NImxPDoq3IIi93wLNvf3jTqZ3T5Fm0Hw3pjgwoGMHtKDy3nH7A0dJivnAVWXgeI2jHxULby/Fqom8PJq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819195; c=relaxed/simple;
	bh=0OwTrOeKLnBSeJaoOCbsZSNxnbdY/ZajX0OfojpSHpg=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Udgw1l95R5lFGQCWB5cFPnRPvyDxZo51c6ExAnuhJBPrXe54fvCX5e0j3fQBmbb7zt5JF3Rr34EA7QQmAi8NJUJoeoM0WkFCACRVLi6qnFgJgTNSTMgJQ3FX0o7yZNwpEFtIOzvO0z4AfJT4VHFYyfYsVsgVh+xKkAhXOdDlkfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=a5JynJ+p; arc=fail smtp.client-ip=52.103.74.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="a5JynJ+p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOUvbZ/KLzkLetkHjukad4TQf3lgFBVCn8f8aXCPV+Zn5m7MpLCDVG/RsKDEt0MNkxw9WCWHr1YQlWFu362uR2N6Sm5LerotgnTVIwoIK0/Lmbr9orzATgjAdA41QTkq9lVYfF5IHVHJg/vFIIWv2bEpR3i9Fup1fTHaxA5ToYW+z1BYyrbKN81wys2QZsJCa4jJQwdVcyliAEOPwDMeDJsOHSv1qha8m0W1hryCuvwwrbb8A+XAeJs6n5tLsEGppU/BItki4YHHVaRfotYDgOGeJbdmllkZCquMR5K6RgguVFQfzXd9YlaZhky54FZUAO6G5BLLdstpCKQOLCDsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfQyNybiWPFpjuSKzxDi1bubijY0sV5W0d+jFfqSURo=;
 b=IjIbvcU0UZ3fZrr98ItlOY14bzaTh3Hsugu6AHdlZUUJOC/tLQNM1oyLcczj1PbFx0dVQvC9DFX3IGkXziCsHLTuu9cZv/IFvEF4ZuHEXcPL94yHJcBZeYXKCCm3Ijn1/khH37TjGUyc2OdUZhjXKPxFkrnwgURq6goR4iY4fnJm0dj89U7sTMZrWviwO3QKdGKz6Id/DSPmIKwMbezYwzfN5JwNEaWqgCzkOdIuaC+GipJ/XIwBUyJaSllUKTQESOh9KljzIIhfB9HmGZXI2IvZ2i42xW6QYdSuazF9UM+UbZ7h2zD5wtdoR6gdAAeKQ07v3NstcrtKo2jBK1R52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfQyNybiWPFpjuSKzxDi1bubijY0sV5W0d+jFfqSURo=;
 b=a5JynJ+puv8bsnsl/00Jg0TZmiOac2iPHrQ0Xuf421IuvVHwzH3uSQjJLV7SIxlonfzAB/nwmubfDnAOcA6GTmx0HJWDKltjIOOeMCXJX6oOkYBQdogBlgfIXKIPjl5ku3MCg7W8/nmoBWLjpjnwhzPdJXnfK3STvbSVYrpBz9rc5kdyzVLEmlD8lfmDyarmqwCVViwROoyEn0Myb1V3cq86PM71g3+PsZECcEWDhHKOYE3rSQLZ9lEtbx96//bLUbw2Q8Y0XolryZbyd5QEMyqjX5iKZX2pUuk0xFvOxmhFMh+rUHbw8q+3AmFVZf4viStTaKmbZ6Jycag07Mlngg==
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com (2603:1096:d10:44::6)
 by TY0PR04MB6445.apcprd04.prod.outlook.com (2603:1096:400:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:33:11 +0000
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0]) by KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:33:10 +0000
Message-ID:
 <KUZPR04MB8968032AEDE5FB1CCFC62D5985F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Date: Tue, 30 Jun 2026 19:33:09 +0800
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Cc: security@kernel.org
From: DongliLiu <dongli.liu@outlook.com>
Subject: [PATCH] usb: typec: ucsi: Fix potential stack buffer overflow in
 altmode registration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0183.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::8) To KUZPR04MB8968.apcprd04.prod.outlook.com
 (2603:1096:d10:44::6)
X-Microsoft-Original-Message-ID:
 <f1c3166b-7ac5-4146-81a5-63f8848b74c6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB8968:EE_|TY0PR04MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7b05b0-2682-4cde-068e-08ded69b5d2b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5062599005|8060799015|6090799003|5040399003|23021999003|4140399003|15080799012|5072599009|19110799012|40105399003|52005399003|3430499035|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dllvMW9MWkk1TmxURzFSUDRlQmZQQTlQcytWUS9wc2gzU3RqOGJGQ1kwRmlE?=
 =?utf-8?B?RmtBVkVWYWVvNkdRa0xoZzJlQWVaZTRkQWNJOWk3dktYYjV5QjB4WVJsdnFj?=
 =?utf-8?B?bHRCOUtYbFU2QURvU0JpTWYyMk5CT0dyZVVsOFBhQjl4d0pKN3V0R2ZibXJt?=
 =?utf-8?B?OGFOMHBqM2tvUG15elFBKzNZRXQ0cytnakcwc3doZXYwS044WmJvQk5rYW9u?=
 =?utf-8?B?WmxOWUg1UEdnREYveUZKQXRrVXdORktuNXVIMVMxRHE5L01hVm1hL0lZRUt0?=
 =?utf-8?B?VXNhQ00zU3VpYklyVVpRYkg0WlhOMEV0MVAvUkZBR2JrRERUQ0lqVFREdXU2?=
 =?utf-8?B?KzhCbWpJZmptaGVaQVI5MzQwVTM2dHJwMkpja0ZyeVJneitkckIxSUh4TlRP?=
 =?utf-8?B?bndRT016c3ZYaDd1eGJWbUdiclgxcWsxbTlYaTh4OFBwU2NseWdHUnprNzdn?=
 =?utf-8?B?bGVRZy9VYnlpbzFJZ3dWdG9sdFg0ZzZucmYwQTVHRjNLQ0U0RnRJemxSMllo?=
 =?utf-8?B?UXZ3NFp2aGdhejlCTS8rRG1NTXhpNlREKzRXRGxYNitPaTkwMzM4YXF0QWJX?=
 =?utf-8?B?SjVwaUJhUEhNa1BDYWczdjB1NmlPNm13VXJpMlVmbGpFcTRZUUhCWDZ6cnJt?=
 =?utf-8?B?UG1jWlVPTTlUVzVZZG5iaG1hTXpKSExWNm9aeXBhTkNPUXd6NEJYQmtDbHVv?=
 =?utf-8?B?QWgxdHcvVW9xL1hUVlh0K0dYK1g5WHVtN09vMGoweHR1ZVlhMUFmakZ0NHhO?=
 =?utf-8?B?dzdUZlpzU25BaGw1ZlE4aDdXTEtOL3Fkc3p6Qkt5cGs2SklzZnIrUThXOWRs?=
 =?utf-8?B?dDR3SXJNdjg2WmVQUnp2WGxTL0U3eFluMmw1NEFiaDQzajlWTkZpZy9KWDdw?=
 =?utf-8?B?c2NpL1FzMWJCUG93Uk5MRTBody9QRWNRU2JvOVlQd2dVMHhZbFBkRlNoWmYx?=
 =?utf-8?B?NUMzSUYwTVFSSFVYUXIyNmNxYzRlaW1XQkVTRWZaaW5sTzF0ckRyYitoUmdq?=
 =?utf-8?B?VGozU1B5Z0ZBazJTa0NzYVUyYzYwc0xHclhiUXRHTE5ubHdMWGFrdTZ3WU1Q?=
 =?utf-8?B?a2EvcnlDaHNyeFpqcXlUVm5NVC9Ib3NTNUNmUlVwYVlFc2hRc1dCb2xOZWcw?=
 =?utf-8?B?ZGoxM2MzL1FsOWV4UHEycnlJeFAwYTFnZGJtSVFjMGlHclIvTElVenFoWFlj?=
 =?utf-8?B?bG5McnR1b3VOeEs3dS8vNzcwcmhDc1pwSWlrMFl0am56enl3NjVoaGIyMU44?=
 =?utf-8?B?Z1J4alo0MmZqbFlTRkxhaHd1Vlc1dlptVUxHN0UybFBLSkZzNCtmLzJabTc2?=
 =?utf-8?Q?Bk2K7OQ8/GxnLSukIu4nLTYNsZvTLDBfjO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdVbWIwbGFBMjEwQk92NTlvcG9YNW9tamRtMHRDZVFzQUxvOFhLY3k1NTBC?=
 =?utf-8?B?enZuNEc2ektaRkpkVjFPbHhLMkFEL2I5bGpLYmVpcExDVWVRdlpqZHczVjJN?=
 =?utf-8?B?MWFDNFlwMXJvYklKZzJQSWtvaVhyY25WSGIwUUU0eGJyMEh3bDBJSGhzUzNp?=
 =?utf-8?B?YnFuU2E1dk1UN1hCWTRPVGNpQjlOblNaQWR1Qkw5SWFNRTdGUEFYZ3RGYzZE?=
 =?utf-8?B?RkdrT3B0eVlqT3ZQREZWR09PTVltd0ZodldxRGVKWnI3WHBmSzFuckFKU2F4?=
 =?utf-8?B?ZWd1YkNvd3ErQVo0RGR6LzZWcTVVTTBJSW0wV2gzUXNmb2U5d3V3SU8rVktl?=
 =?utf-8?B?UTQvRFpqVFhxTGhsbThCVmdwMU4wS3RzR0ErVjRmeDNqVUdJQ3dVRmJ2U3dR?=
 =?utf-8?B?TDhCZDhKaXliallzSzBYdEZiSzZpN1ZsbmRaRG45WEIyVXR0VlpKemhrdE1L?=
 =?utf-8?B?WW9mVWlERVMyVlE2WVBlQ1hUUmdSb3VXZUlIRUd3bWxzZ0xISXFVb2E5encr?=
 =?utf-8?B?Y2NoTW5GQUNRMlBsTGxYK2hTbFhncEVhdStBQ3VJNjVWaE1rODg2ZmdNa0RV?=
 =?utf-8?B?WnMvQ0ZxenQrbnJPSERRUjF5R2xkd2FUY3JZNWJoV0RJZzFQVEhhV2xoTEhu?=
 =?utf-8?B?dUcrbDJ5RGwwSTFIVGUyUnFSRExISFFZYWkzMGZpTFpxNE1mYmkxRTdPd2JO?=
 =?utf-8?B?WWdwaDNGRHZwbVBETGpzVzB0dDNXYUorVDAwWkVXUDF5bU1wNDlnRGlwT3lo?=
 =?utf-8?B?djBwV1RLQzNTZ2J1S1M3aEVaUjJSOEJSOVJhUFlZaUFwTG8zQ0RLN1FTMTJ5?=
 =?utf-8?B?bDRWZURsSEptNU5ab281WlNDNHNFZ3RDcjRZOG1oQ2ZweVlTWG8rdy9ML3A3?=
 =?utf-8?B?aWVGcTdDRDVpNU1FcUFiU0RiQ3AyV2o2VS9JZFRndzM4ekdPNjFPeGtPQll2?=
 =?utf-8?B?YWM0S3VTa01ITXpqNy9CVU0zNk5hTTNlckhpbEU1WjlpbWRYMGdydlFoc0Fk?=
 =?utf-8?B?Ry9JNUJOeEV4cm9aVVJDa2lyVVJseDVBamQrb2ZzaUdDRmwyZHRxU2tvc1JV?=
 =?utf-8?B?enAxRjk4L2JzMnlqSmlEaHFjRnNXOTRCV2VnNmtYOXFNM1ljdlNOVXVQcEFQ?=
 =?utf-8?B?RktQYldrd0dXZk9ib3VuVXVncEVINlFoYTN6Q3pFU0tFb3pxNW91Zzl6Skc2?=
 =?utf-8?B?ZjEvZVJyNHZyd1NLUURIL0hkMmppbUF2ek9wa2crT1Y5SVRxZjNFOUZqZU1I?=
 =?utf-8?B?bXNRRnQwS2JRejVRaEJKNDVsQ01zVlh6cGtkMXppQXI1ZXRpSngxTm9malJL?=
 =?utf-8?B?Ukg4aWNXWU9kN2hTcDNqNGswYXR2VG9TY21aTjFWdngwZWZyeWdmcjEzc0Rl?=
 =?utf-8?B?cXNKNzRiY3lTRXNKc0ZaTExFWGVuR2UvakkxUE94U2N0cTFHTU5FcE1mK2g0?=
 =?utf-8?B?SjFpbjNoZmFoYzhTcFZ0UWtpcVd2K3VrbUlSUDl3N0tZaEcvZmhBWm9lN0FK?=
 =?utf-8?B?OGU4Nlo1N1lWc2NhTS9ScllPL0MwazhTOVBWZy9jZ244VjJtZGlKYVRBVHEv?=
 =?utf-8?B?MjBPUU9XQWZ3cjg0aVNTblhYQjc4eGwzZXViSUlDdmhGN2ROS1pRbnNiQnpy?=
 =?utf-8?B?SlAvTGNpbEdLR2ZibWZYR1JONUR0T3lOWFU2L1FMTWt2Tm5ZN3B5Q0RGWmVv?=
 =?utf-8?B?MFNOeEVTZ1pYUlhSalU3VXpNNDJjSm1jaHpSU2R3MmthSDN1TkRsWDJGRmJ1?=
 =?utf-8?B?OEZ0T0gyRlhLSGdyK0VQT3BiSUF0dmdROFhCZ3dtQmx2RHEzR2hjVHRtSHh2?=
 =?utf-8?B?b2laenpHdXdBVTZUOEZ2UEFrdmljOGNlUTVGMmNtWmZVY0xhTWpycG5kbE1q?=
 =?utf-8?B?bUpiWlBJNHI2UjRZUUFxdkZOZDRvVytJU0pPQWIzb3ZYNkMrZC9MVnA3a3N2?=
 =?utf-8?Q?WARcK9CiAPBmc2DJBLPBbRBo2W4f2+Xv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7b05b0-2682-4cde-068e-08ded69b5d2b
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8968.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:33:10.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6445

From: DongliLiu <dongli.liu@outlook.com>
Date: Mon, 30 Jun 2026 19:32:00 +0800
Subject: [PATCH] usb: typec: ucsi: Fix potential stack buffer overflow 
in altmode registration

cap.num_alt_modes is a u8 hardware register value with a range of 0-255.
The altmode arrays in ucsi_register_altmodes_nvidia() are fixed at
UCSI_MAX_ALTMODES (30) elements. Without clamping, a malicious or
misbehaving hardware could report more than 30 alternate modes, causing
a write beyond the stack-allocated array bounds.

Add min_t() to clamp max_altmodes to the array size, preventing the
overflow.

Signed-off-by: DongliLiu <dongli.liu@outlook.com>
---
  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index xxxxxxx..yyyyyyy 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -xxx,yyy @@@ static int ucsi_register_altmodes_nvidia(struct 
ucsi_connector *con)
      struct typec_altmode_desc alt[UCSI_MAX_ALTMODES];
      struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
-    int max_altmodes = con->ucsi->cap.num_alt_modes;
+    int max_altmodes = min_t(int, con->ucsi->cap.num_alt_modes,
+                 UCSI_MAX_ALTMODES);
      int i, k = 0;

      for (i = 0; i < max_altmodes; i++) {
-- 
2.40.0

