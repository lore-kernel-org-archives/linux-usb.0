Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F11142F707;
	Fri, 21 Aug 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300336; cv=fail; b=cEudFqlpB6GzgBUCrzg7blHhjt01iGTqR5PM2gHCqEF0xun+URc7eSVRttwb0zYEOfNZBf3WqUux2Sw2jhDPaTzUMdKIb9NAoUNEHSVxAjkF01YmmsDZT89FvvjGnO4FJK5f8KU0BUiy5uDu/WUgSLecaxxxUweO2KLBXnLr770=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300336; c=relaxed/simple;
	bh=yJmHa63jWIGJRjBW820x/pFyX2bjSJphBNUDs1HgFwo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G50xpIYdvaZZK3W0GTQuD8Ns3J/gmk1K12ZFhJBTO96viQxzdYlPQ27olGQGyKKJh10cZipg8wTxkaiTy+khdCkHoakqWHnSHavuy+7+osCwZD+GGoAFBLN5/bTlO8GMPHanW+S7dM3vFXhnBaAFd0yM6NeGMvZc0REVlf1GmEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a2E4aL6k; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a2E4aL6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVP07diQ7D+KDp89S7wqyvJMP+g8VHnK27DQ/mMZqh21U9N7XYMyJI5o7AtM9MPgIwNlDAbEi59kYC/bulMFtA2x+HgrVg9r9e1TtfAFWwHwQh2awdvEpTWk8KPxUbtFSYReXu/qkRYHGh2dtQ3DezTVE7I51QcMxj7uvCMR0xFX98txlQ5Avwg35bPsTOI8QbmWtxDgyKSxAznDtho3eSmdWpB1Q346tRLIYPtxRlCaCTist8yhTydhwzyniR72WCKOmRtcCITpgM5w4YrVAYrRHtjCAQTpFBx5t9KbNkkBP7alV65tFGDCr8prXU9eKYx8sVe49b6RUJlP8SjBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWQtuoUSaufxwbRnmDhTzCT9SRSJ7JnpzLuv8xgFj3Q=;
 b=XvOrPG6rQzULK7W8xd41P2XQ1tJzS5beSt94zsfsrDVWoa36d8P214hZ1om9Ew93ENtfId+QV+Uw5EHdtLpXh8RGzK013cPcTF3CMoJ9OD5q0XPRkotmQP67yhdoKNrdlo9Kj59pe4ktkCa6EDtk5eW9vspEBSyej8oZVt4AUsYjearleOQhBMLy/tDlLygvgtUI8cihbj3wWkbwvwxE/hRhZoYjf01bxzykqlc0e6ksC8qZb5qEtSNooN2uTt8+VjSvRVT9onWmZ/qWRlcxTstvuZD8KvaQVKoz0pF1+LPU0KnGNdB7IL4k+EATRRpWyeJDqIuf02zuYw/N7GYQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWQtuoUSaufxwbRnmDhTzCT9SRSJ7JnpzLuv8xgFj3Q=;
 b=a2E4aL6k2ecD2H3nt9XoYJOEDY/EgvXSspjp0mVwFnGoFJQYeH6tSjD4XqMqkpwwYt33wnngt4ZKnwZ4cCBe4oR8TP01sxhpAJY5GNPwuAEC3LNYPspDrtAE1cVQ5g+fHPPF3hv+uhsN0OF5RIuD9V7VrvWCKYpizjiD4qx0/lucxOG1u8q5KSvk0R+JOg3T6IsCS0N11CvY24MsgXOh4eFLBfd0a6dAm8DqfOXLjvldJxYpEMEOAnJT+bo0EYURGQufl0o6Erjkc4iEAJ6UQbRuCvabOBri/d2Ilin5rHDa0fsDS88xYlogk3RoltPAX5TP3IJb3JbvEdTSur22gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 08:18:51 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 08:18:51 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 21 Aug 2026 16:22:37 +0800
Subject: [PATCH 2/2] usb: gadget: uvc: refactor video cleanup into
 uvcg_video_deinit()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-usb-uvc-fixes-v1-2-80e6e279523d@nxp.com>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
In-Reply-To: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787300562; l=3692;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KLIVCAK620t9s4wAsk88W92ECN5OuNdpwaW5JhqGjY4=;
 b=UzPxQAoekScVX5tbqe9Pbn3zeiRx8sikMvRNF9si95r5BM3RWOF22X0/oBzflHu50XA7REZFJ
 iDUwBDztQCaCtyi06whIAKrfDtYy95LfTX/F3WaCbBdyZRSb3vppHVA
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3c7c74-0612-4c10-c5cd-08deff5cd523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	lKHzEYBf4auFwbm6+lLsCVfFy9oZjzy2t/ZrOWru5dRRgAw5GVCHtsMhKrkn3Uul4E+2U06VmcdgQFNDpojb+i0VahmMZnpyY8h+BuTd3OmX4Z1px95aor+aAgxngLXSwUJXTZfQUTAP5NxL7FM6dUIJD34VwvAds3PiApCwJVfPo9nP97a695yOHWwe6NcZ2SedhucU0rUG9XmIGW18JRBcDNqqxuZEq0vrfUTg7Vheen2ACUxCYpf7Tx4WXwQV9cFhj5Opog3qyZ9heeBXpdSP+ppp/ibYjETo15Xd8XjEFYgAPLtrgdtBQxIaU4G16H35t7j26SqaN9lndMz9UHPoO2KhZOP8/Phx04stW5wHe1GYPiLoApa9V2zeGmYkRQJc4Hs6LeSRs2QKQC77bRKbL26k735MEs6Q9qYw5fOanOImRYSF9Pswic1ebRD59QB35kBkwwliDhKQ/r2r95nEIxgunIrWkAraECVHYtKs+UATBhAFlLOw3HxL8u6667sXhNtuWbEziSn6WOpJvYHLdtFO4jBtQRjmuWpwfviQT9fpp1t8BXqCKMBHckisUab+TisHoudiJ7dhL7y1d29XWuekygadoQAPHN+mg0LF8iCHRHe205Otso0Dk5H8y8skgEYtp1GCofi4pwUMfZjFiD0JHStflAG4nE5lYRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHMya0prOTBHSCtvcWxQbXM0eUgxLzF2TGxEeFVVeW5WclphR1VsNklQRVhJ?=
 =?utf-8?B?WUpYRXVDNlVrUHBwUWhobUV6dUtyT2FYN2dNcFBhdUpRWVJjZnk2QjY2YUhF?=
 =?utf-8?B?bU1LM3V5OUEvb0IxM2cvaUZvbVc3c1ZFTVdCQ2g2ZGpRbFVyZWlVelN2M3hi?=
 =?utf-8?B?aXBaU1hTVHdaYlZpSUMvSEgzS1dkZEp5SFRLVWdUcnYyS2xLdmt0TjMwMzdw?=
 =?utf-8?B?RHN5Z1NMMzVuZithd3hUM0daR0VBRE1DOGFYU3g2YjAxQkJpSU5SN242T2xX?=
 =?utf-8?B?ZFhBYWxrL01ZRWg0bXk1VTdWMnlNL055K0daeFVEWEc4aXRWcDVsWXBFaTU1?=
 =?utf-8?B?SzhrVlVrdzNWRzl3N2poUTNCZm1IODFSTWlTSTRyekVkMVJRdTF5a3gwNkdG?=
 =?utf-8?B?eGRjaDA2VlNhOTNjOU40WXByRzZQeEE0R0FxK1RBZDU4MUVWMDc1QUVzYWlE?=
 =?utf-8?B?V05UZ1Z4dDVRalBoazFVUzVFREdQTVk0Ti9ucm0wUmJmb2ZCaDl3OUtsdUFV?=
 =?utf-8?B?UzdJbU00UEF2b0dQRlZtVllsMk8yakU1b3pRd3JONjhsSm0vR2JvTk5nK1d5?=
 =?utf-8?B?MkVZeXRjUVQ1YVZmRlJWMTVmZy9kRnJmNnB4R0hMUzY4WW1EdEJ1UnZIUEZF?=
 =?utf-8?B?ZmxweFZ5WmFOdzNBYXFDRHVEa2l5SDFuTUx4d0VCSVE5OXNzSExGQlFHQVJW?=
 =?utf-8?B?RXJpcEgwZ2FlVENtdXVDS0QyTGsxUWEzZzVrTGRwMWI3WkZSOStSN1lBVEVW?=
 =?utf-8?B?Qy9pa09zUWJZSU83QkFFUGhZeGdpeXEzcTJDUWRzdC9QckFVU1lYNFBaY1dF?=
 =?utf-8?B?TjF0dmFzaGR3blVyZTZVVWVDdW1FUVMxUU5EU3NzMFJiekRWQzQwWitoblRn?=
 =?utf-8?B?NDRvRXFXZjJDVEZCcTBmUTBqQ1lCbmlPNlhLQi9Hc28zK3JmN0FUenM0TkxD?=
 =?utf-8?B?L3JOVHFhRmRSVmQ5NnpncGtHNEUwS3F0Q3VrNVl1aEJTRjdESzFkdmJFY2tq?=
 =?utf-8?B?R0I5SEZzaFFDTnN6K0FlZmk5Nm5BVml5TG50UW1mQ1BqQ1BldVdOdURua3dY?=
 =?utf-8?B?STk0bWxXNE1WclJWMFByeCt1K2JsTVlWcmFqNkZITEtVTThiOE1lbjV0eFJI?=
 =?utf-8?B?UFdXVUFFRy9tRE1BQWZBYUVUU0JFSWYrWnYyajdjekl2RjI0ZW5UbTAxQjhR?=
 =?utf-8?B?WnlxR1ZrVzlSUEFyeCt1N3BSVTdRWXFMd2lDWUs4OWhCTkgyUWo5Y3RaNWlq?=
 =?utf-8?B?akt0a0JlOWkzbURRSktXQjBLem1UTFJ6Q1JSU1kvM3h0SVgvRGFTc3BJT2c4?=
 =?utf-8?B?ZDh4QVN4WlZwOVZrUjVpR2JXS09iQm9CZnlaTDRKUkdVWTRPdk01VkJoNkUv?=
 =?utf-8?B?elcvbXVxdnNxWEx3NnRqSTFsL1ltVjM4V204VFBEUGczUzBQT2w5aEg2U2Rq?=
 =?utf-8?B?YmwrcStKVmxCMm1RRHluVUNMRFNYci81Y3BmV1pzelpZNjJ2SWh3elhGMzBB?=
 =?utf-8?B?UlVHUzdMRHBCV1dkZGF3eVNlMGlrVGFJcnlIaXZNSjhVUitpZE9IeGpWeW4w?=
 =?utf-8?B?TVB3ZVRwa1NXT1RTeGg2WVRuRS94NVYvTkR2dS9kRU9SN2NYSlQ1T3Q2K0t2?=
 =?utf-8?B?NFJnWng3YTZDS3ZmWVMrYWxmaTJpbXRzSVY0NXdwdHpka3hoL0VnR2xZSThq?=
 =?utf-8?B?UTFMZ3Q2K3g5eUNPV0JoMjYwWlh3ck5kRWZubmtXNWIzdDY0WmhaMmRhblUz?=
 =?utf-8?B?MHNjRU5xdjVHSkVhY242TVdOM0I3SE5IVXpoRkNUdC9HdWV5cGl4Q09WS3Za?=
 =?utf-8?B?cFg0Qk5INk5RQnR4NG9XaGV2cXMyMko2SmhIcWt4c01KNkVLNSt3VEFveXhI?=
 =?utf-8?B?NGw0MjJ2TXFCbzcvSkZVYzVBdWpDU2pnZDgwRzNJM3hSSUE1K0RMNnAwU1VT?=
 =?utf-8?B?MC9tbDhSS1BQSTFxUVJGNmt6ejVYVDhXWmhlZlZ2bEE0Wk40Zzh2L0JJNTB5?=
 =?utf-8?B?dU5Ydk40RTArc3VyOWhYZ0REdUtCZUJPTkhxRGNZUlZsZXRhT0pRMzkvNFp5?=
 =?utf-8?B?QUVkdFQwWElvMXJQL3ZLZWVJc0NLcVA3cXRHT01PeUpKaG1laW51TlNIbHBB?=
 =?utf-8?B?TnNmeExHMklpZE9CRVVNY0tqVzJvWXN0QUNpbU1uS1pRV0VGYkw5S2Q4V2lS?=
 =?utf-8?B?NHFEaXhvc2t2S05Pc2xMaHZXSkNxOG95WW5hZldnM3F2TEI2czFuQTJRTDFo?=
 =?utf-8?B?MHBBT2tPbWJXQlNiQU8yaEFOUitGWHJTYmdrTW5KSkJZMW1vRkJUVGVqQktr?=
 =?utf-8?B?VExHK2srdjNiZW55VFpnWkxPMzdzWDVYUkR1YlpMUnVYcHMxRE50T3lweith?=
 =?utf-8?Q?ZrOs/Pi7AQ/UHd5iLXhSvndvqcpxqIcpvDGf9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3c7c74-0612-4c10-c5cd-08deff5cd523
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:18:51.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/bA3t8U/BU+tlf3gAe/qSh17Ng4/reELX8a2km1qjGlXwyFQEu0mzTnyyzW5SFDeuqOBVUCA8Etb76StPAEjcjcwtc2Db3h16VvsTUIBZy0Vbhz/EFrnNWV/TiAMTwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571

From: Xu Yang <xu.yang_2@nxp.com>

kthread_destroy_worker() was never called during unbind, leaving the
UVCG kthread running after the gadget function is unbound. Also, if
uvcg_video_init() or uvc_register_video() fails during bind, async_wq
and kworker were not cleaned up, causing resource leaks.

Both issues require the same teardown sequence: cancel the pending work,
destroy the kworker, and destroy the workqueue. Consolidate this logic
into a new uvcg_video_deinit() helper and call it from both
uvc_function_unbind() and the v4l2_error path in uvc_function_bind().

In uvc_function_unbind(), uvcg_video_deinit() is placed after
video_unregister_device() to fix the ordering. Without this ordering,
tearing down the workers before unregistering the V4L2 device could lead
to use-after-free on video device resources still accessed by those
workers.

Fixes: f0bbfbd16b3b ("usb: gadget: uvc: rework to enqueue in pump worker from encoded queue")
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/f_uvc.c     |  7 ++-----
 drivers/usb/gadget/function/uvc_video.c | 15 +++++++++++++++
 drivers/usb/gadget/function/uvc_video.h |  1 +
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index a4fb2790f4ff..fa2f9d0e4ce0 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -879,6 +879,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 
 v4l2_error:
+	uvcg_video_deinit(&uvc->video);
 	v4l2_device_unregister(&uvc->v4l2_dev);
 error:
 	if (uvc->control_req) {
@@ -1028,11 +1029,6 @@ static void uvc_function_unbind(struct usb_configuration *c,
 		connected = uvc->func_connected;
 	}
 
-	kthread_cancel_work_sync(&video->hw_submit);
-
-	if (video->async_wq)
-		destroy_workqueue(video->async_wq);
-
 	/*
 	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
@@ -1048,6 +1044,7 @@ static void uvc_function_unbind(struct usb_configuration *c,
 
 	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
 	video_unregister_device(&uvc->vdev);
+	uvcg_video_deinit(video);
 	v4l2_device_unregister(&uvc->v4l2_dev);
 
 	scoped_guard(mutex, &uvc->lock)
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9ba09118bb74..002afca9141e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -841,3 +841,18 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 }
+
+void uvcg_video_deinit(struct uvc_video *video)
+{
+	kthread_cancel_work_sync(&video->hw_submit);
+
+	if (!IS_ERR_OR_NULL(video->kworker)) {
+		kthread_destroy_worker(video->kworker);
+		video->kworker = NULL;
+	}
+
+	if (video->async_wq) {
+		destroy_workqueue(video->async_wq);
+		video->async_wq = NULL;
+	}
+}
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 8ef6259741f1..6c5481f107f9 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -18,5 +18,6 @@ int uvcg_video_enable(struct uvc_video *video);
 int uvcg_video_disable(struct uvc_video *video);
 
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
+void uvcg_video_deinit(struct uvc_video *video);
 
 #endif /* __UVC_VIDEO_H__ */

-- 
2.34.1

