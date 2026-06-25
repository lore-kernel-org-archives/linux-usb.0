Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56523DA5B0;
	Thu, 25 Jun 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386920; cv=fail; b=cofjxGpEFrkGo2M9VMC5jhdiwQJmJf0wC8eTZiLlZSE3+90w5pW0p8hFheXp0zsFuFX5b+bs3w/VaZl784dIX0EhGyvfGXVwh747ce0Gc591HPn6dQIC9OM35+Xx47ZMaHTlzB2UrGjutMPu45JB3LIgfLA+X4rha38xNEglxw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386920; c=relaxed/simple;
	bh=bt0+Rb+hX736ZtqqnyA43n+WnXtKnPiCn8N4di50pa4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oIXaU64hC3WU5SNTZldpizAX8ZFjmmdnRQqnK2eu/OLKcH83m0PNHciHgme7lgqD1q5oezcg/UG/vxU5yEvDnjrH4l1fmvNrDSVbpfMQddR9rSIefN8AjOvNXY/7ko0w1FE0RDEks9TQUnJVGPI0T1cBb8nkjACBoo/BC467z+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yHNpKF/6; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yHNpKF/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLwbS4ghWnJ+Ogjs8rYn+E3XA83gRtD+Efr3x0tBV4UBt0Rb/CvgX9un/u3RIEEf0ZP0sZgBIG1+X90uENL+prnzxb0nQFfC4pjy0w3Xs4nQCMtO5c4ijQkBfakLjlXQxwnx9iJnzhUQtqBc7/TOJvQYlOn2jPJoNqwxQCYPArY+HfvjY6mJM/+VRgMseJwd/2j2g88sjH8Zs+PGu+UcIzn541ZGVtMqHu1qB0yCf9B6mTmCznBuOmfyiAhvTbGUZ1yTL7LCHKkSFX2y+/at+UlRbisabH9GLmzmsINYhZn+w9jGkhMG5LTA3v6jQQu0Qq27f1LAk6wgevPEX3wGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIxm80IB4ypg0CgMSmn21zuDaBFuTNMBzXcH8S+vByY=;
 b=xh+i1Tk7CSHDoOBR6E3SM85JuQvAVNWh7KsSVd/dnNCF1dwZ65Z0tcYXFQu5K/8N2sGKpQa//fDt9CDsWDxDnHhawIkcom6pQazxt0JXWc6tWBS1dqHc4J26WQKErBNjdGkNpLZF9WldQSIAdkVOsfMyuvZOYr24ujGMx0EHumIsk7helu8brsIbZNeVFX+UaeGhi5vevNqMPaK3t0iNtvicoPKGjMSvw1nY2Hm+RpOVAenzLFD6nl33acZYMkYFTQjlkPxjXg/plvqsPZHGLdZtyQq9VlmFIIylD4srMu0mK5tf7rz2d25q4rHiZDoLntWPmkalAPFb4bPrBGF8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIxm80IB4ypg0CgMSmn21zuDaBFuTNMBzXcH8S+vByY=;
 b=yHNpKF/6NXHqH0DGxfLjFG95+y0iYz3deEDQI2ofIjSaSThxKgQFClOcGNQkrVg6gIJlYt6LvuvXcq9st2IFWkto2dmqo0oLPkhaReA79VP1ecbuRVnfhxllEEm0jxbYfVZDg5qBKRRxqNrlEf3Np3wEmAHEBxKQoUyJ/WZwXNBx1iBWVEHW1Ckagh3c6WBxQCTucXfpWb1Z9qq+O3bKH3TYC7EzWQ+E9Cke7pod1o9uLDTNSqepyzeaNqAldTPiV3qzF1zBrnL/lZYVTpxkwxRnqhP1qq91dO5Dtmm+tqXwNdhi5kZJ+96G2vFgX/vg3yQmAcemnmuEhhyEAGeZcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 11:28:34 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 11:28:34 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org,
	christophe.jaillet@wanadoo.fr,
	xu.yang_2@nxp.com,
	hataegu0826@gmail.com
Cc: balbi@ti.com,
	andrzej.p@samsung.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check after kstrndup()
Date: Thu, 25 Jun 2026 19:31:54 +0800
Message-Id: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3d7d44-3361-4583-463b-08ded2ace43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8LZgYLpJmIlwK1hPlDZkmMA9bCJwVmLAs8SOXWb9ZGousBSaY/bGC+jVWgJ2ZxgDw0UIKmzJIY0UXHl9/aO4PmKQjLwHQDppS8xLxy5lt/qPrkDi/KdPUnCkKQWxnsALmN0+p4qYAYmvq4yAvbqCQXCsUN4rjG3YoQxyXWmBWiT0c5rjq0bjjUuhAcSqfyBUe6ehmdVXMS3xpEr1prSnDsWnEHTQLml6JKayicv5g/Co1F3RJSqeRKHVkO39eowctc+T1Lxmx2k9t1+xA1Nnw8XfH2g/TcIZ/f75sHG1iEtD6IBbPWdUVWMbn/hQkJIR6YlKc7vi19pb8dwQVVlNOZCRMkaLrALo8oWnSFFs4AhOjdd4tjVYEpD3D12xyA3fZOPazEzx7plBGCh9QBB04ug3Yh8ysboFijlcpYfgI79o6FARCAZAKXdByjA/a724Ie2pbNuj/vqFO5yzY2erVDhV3hL6m7uSXB0wJyVvpgU9GSYOWbsXfY4fEaIqJJo17f3HESH/w8ZDzvr2YBRJ9BzgGZDBusDynbhzalE14MP8ed2ZcqY6HcS0WPVaotSqSfBBZxmvzcCVJuVlN6IZTwpl/rqf9PCXZIozEDL+jvhLwmfG+2SYWJTvC+Y4VkMEAC3/IA3Fx+MO2Stwx957WbxEeyRcF4ELX2qS3necLVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhxdWszdEhsMkx3cUlIMFVudE01bm9uK25JNk9KeDFCMFA2WWM2bnVsNitF?=
 =?utf-8?B?RWZRVDJ6RFordDBLOWZ1cU9YTTY0OVBHYk5JTVVDZktFSWRqMDBZU0dZZm1Q?=
 =?utf-8?B?OW92TTN0T08ybklqRFFaR1ovTXl5enJVdXdpNUljdmZYZ0Zrczlmd3R2bFhp?=
 =?utf-8?B?SVh5aUZxeEt5N01Hbjk2WTIrNUF5VTJFSnJxOGR1Z1I4SWJCNEZVTkpScDZU?=
 =?utf-8?B?NmdOU080NEo3dmZxaW9CYzRVUWkzbEJXVlRsR1BXK2YzSUFzQTFQaXlwbkk2?=
 =?utf-8?B?NkV3UXVDZ0NwODR3STVYVGFrdVRxcFBrWnU0WmJvZXM5L016ZTNjbDFkeDRT?=
 =?utf-8?B?T3NMWDhwRGtMRm8xNkZLTnJYU2ZWLzkyUmVpMUlJamh2UytvbDFZcGxLbUJm?=
 =?utf-8?B?SkdlYTNVSEZVdVp3bUVjMDZUUzlTeXA3OWVCM04xaTU4U3FFQzFnT1ROM3ZT?=
 =?utf-8?B?UVd0dFlmckRmc2JtZzFVbFR2anErSXdQdFgxZ1E5WHd3bTZGb1FrYUVRczVo?=
 =?utf-8?B?S1pEUkpwYmpubndVa3FuRWJjUkdVQzkrNkZDYXhPbzNGa2VWK3VFUk5FS29J?=
 =?utf-8?B?MTlmaEQ0bGhpNHlheWhuVWpnSkpuc1F6ejVtQ0pUSm43NVNCc0M0ZmlNQXYy?=
 =?utf-8?B?RWxOL2ROSENYN2JKa3AxYXVBWW4rK0pIZVRrWUdGQTJ2Wm5kTjNIcnBZcUsy?=
 =?utf-8?B?S1hMcXJKYTFFUzZNNWVyNFpNTEs2ajZ6REZUUjg2dHpGOFF2a29aTVNnZEtr?=
 =?utf-8?B?T0lQQzNBUzVrYVJpTUxEbVJ6OXZxeHhIME1sT2pwVnpYeHJPQTVKOUdRWjds?=
 =?utf-8?B?Z0hRNGdvSDM1b0Z0YnJhU2RlYWFNZGh1cGZzMWNIOGUzNUI0eXRGakxka2c4?=
 =?utf-8?B?M0VxRCswMEFjQjNsTWZ1bXZtYVQ0S2FWMFRCRDRJUGJ4anZxMW42M2YxUEZD?=
 =?utf-8?B?OEtzWEoyTWQ0amFUWlBWNFRUdk1uWXUxclRNNGhLOURVK0RudUUxUlBFM3pU?=
 =?utf-8?B?aWxaa0Q3SHl0Nm9ScGZmWWJOWFBqME1qT2cxemhOUFozWURnVUFvUGZ6dTh4?=
 =?utf-8?B?R09YRkN3TDl0QzJOYUYyQjZEUGN5Y3ZaenFSazBoR2RteWpQVUw5aGYwTG5i?=
 =?utf-8?B?aHB5RzlFd2ppK1lURk01SDl2TnpoYzdLU2ZlalFWWWJqYlBzVHhOZkVMYTBp?=
 =?utf-8?B?RFJJb3NVa2hJVlZKNVhONmRUbTU1WHVHR2JFUHBGa3RjclRvdmJpUWVHL3Jp?=
 =?utf-8?B?c2RJSmVEUFBMUStTOGhDMGt2bEJ6Q0VTbEJEUm9jOWtsaEJGSU9aa21qLzAz?=
 =?utf-8?B?d2lHY094UFJWeWdqamVFSEVVQjNmZ0h5QlhHQjNvM0hVNDNDa3g2YS9YRWlJ?=
 =?utf-8?B?MW9HQ1hOT3dKb0xiZTJHMDV4VEE2NVBsQ2RCR3diYU55Y05zQXB4R3JaTnJh?=
 =?utf-8?B?R3E2VS9HNTNLNWI5M1FYdzFPU1VJTWFrZzFpeTBhcXVndHp5NlFic2xyRWNE?=
 =?utf-8?B?SWJDb0drQ1ZmejFrcjNNLzQrdFBuQkZVdDE0RWw3dmg3eTJ1OFpOWlIzTCt6?=
 =?utf-8?B?Y3o1eVF1UzlzSHc1aDRiUUR5RHZwS3lKb0hLUVFSQ1VNKzg0MlRUUWZQZ1o1?=
 =?utf-8?B?cVRaV3JuZWVrMDQ1U2FTRENEd0VjaTdoQVNtTmx1OENOVnNVeElVWWdTRDRj?=
 =?utf-8?B?L3E3QkpnSFhKUTBWZVVKWWkzaEdYWGNveWRha3BCZmZJM3lUV045MFBGVGE2?=
 =?utf-8?B?UVJjclduUWFBdU1tNTBEQnRYVk1YYkpZcXBkOGc2OU9vK21kd1JNcllWTnZo?=
 =?utf-8?B?MU9kL0RzUUNzeS9YT1I2bFp0NVNVenhvV3VTbzFST3JLVkFqMnRuS2JVRzNq?=
 =?utf-8?B?R0ZqZ0Q1RjZuL3J6dy9HN1FBUjBUdlNWTDFUZDdXRlpJMkg0blNhSjZ2S2M3?=
 =?utf-8?B?V2dzdURzSXg1OC9jODdVdFhDc0JpL0d3QmQ3emZZbUhGNnNjWTBNUXAxdlVU?=
 =?utf-8?B?L0xIaFRyaDVhZUM2TnhRTHgyRU5qRHFoK29kalYzVEZXT1FQczVyVlRhSitP?=
 =?utf-8?B?aUowMWpTVEFldVFwR1Q1YUlhVGVUMjVodEppMUFSSDZlbTIyaGs2STRJQitt?=
 =?utf-8?B?Z0FOalNpcWVtNUdxWTN2ejVJalhFdFI1eGRZMzVscUJpMjhLelp1Rk84NVly?=
 =?utf-8?B?QXp0cytSNHlYa2IrbFN6MzYvTlZzRXQvUW5UendYWW1DTjcxLzZwTWF1VnIy?=
 =?utf-8?B?cUQ2WjYweSt5Y2xCREVCcUdMbGh4VnYxVjJXb2U4RTd0V1BFTG9HR0VVWkZx?=
 =?utf-8?B?SU8ya3ZGMHlnZnRQbUdZNVQ2TVZOcTdtWGd4dTdMWnNCRzM1Q1JxUXVZdG04?=
 =?utf-8?Q?KkdwcUL1OZN2qDHLVq1DjG94nFAXiCg6vKTfH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d7d44-3361-4583-463b-08ded2ace43e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:28:34.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu3Y51yh+qkH2Rt2bZMe21pT8FpHfpxeyZtdAnriRkvw46Mit4bqM/y4BCnbkHVOT8PhQs8pcfYrKInV+2VwJBY5cwTGgMM4M+S9NVf1c129aZrsjRzGC8cvWWFO0iKH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

From: Xu Yang <xu.yang_2@nxp.com>

kstrndup() returns NULL on allocation failure. The condition was
checking 'if (tmp)' to detect failure, but this is inverted — it
would treat a successful allocation as an error and return -ENOMEM
while leaking the string, and proceed with a NULL pointer on failure.

Fix by changing the condition to 'if (!tmp)'.

Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..e9f2632ce785 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 		goto end;						\
 									\
 	tmp = kstrndup(page, len, GFP_KERNEL);				\
-	if (tmp) {							\
+	if (!tmp) {							\
 		ret = -ENOMEM;						\
 		goto end;						\
 	}								\
-- 
2.34.1

