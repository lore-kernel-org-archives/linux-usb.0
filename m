Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4823BF67E;
	Fri, 10 Jul 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667111; cv=fail; b=O4otqaW0oqu70ez4OwjwYT6S0f4i/sdgXfLYVaRRWjKM6JnuoGP6MMTf3jmeKvuHPgtUp2BSgAA2vtzZTTI2w9vx+9DiIEmxozKrbaZx5QrbegxzuwN3+i0j/jyYidxH6GXWiLKt1SBKx+op5Onz5iIrw4SofpUzm4wkg/iQIsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667111; c=relaxed/simple;
	bh=XvpprFr1Bgaat08HTzwWY9aYsuZbyJuImLgP220cVQw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D9jYW+VJME1lJiFQ/7EsH3HPQVl1iV1B/m0OOyJEr1dGZ6DIifdsxiTCubA4wKXPHB7h69U+mQvllkQclQjbHXng17HVARp5WxiBGBbs78dxmFn7WPhfqRM/JQgdkFC4LWXlOoSZfwdnS73X1MyFzr4fC7hRAtqdLyN6QwdZaV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=abEkFkBx; arc=fail smtp.client-ip=40.107.159.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="abEkFkBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtTT3rHEDAPRPLlIJTTXnQRu/1Z+9L16xaWArrTTY0pSSHBrQi9P1g72tu+IR9btGuYdAYAXiiOABcH5sicNJwH+qAirqM6k3OAGudhC02rgo4YO3zfxvJIZKNjRGtT0c6QVEmPIGdnMTcU6xFUZ2zWEjkguDcaW4cO84YlJKpN/rO1HudhE6NNCvIzk1UesQpy74UAsdZI+CnY7UKgJr7BcG/RYLqUCzlq18qOgHgGfWCyVRXhUh2k6ZS0JSQcf75abJQ0f0nzjm4OPyG5pyFYmDVJrHCzJ2DhvEIotDU7DMjgGozI2/0zMAheZFlDMfioL3ptnCRc1fSOldk6X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRGfZfkra0eihHKKGvP+5U/cOaqThixokW+NQOaBAKQ=;
 b=HhXy4VAyuvH607JYTeqKXPjt6tLgFBIqAxKd5rqygQ5OZizMGQxSpMJDjfjnvF5s5LWeKhLWBqZ3B5cXc9/DRee9TXLLK0xxfs4oEb7QKh3ojqY68RloBiOC62dQmU0aAk5nMmoEJICvybrvA0Kq7+4FxIuYIv/wEQ2GSFdsU8dn7G8Fuj/5ySLSC+Mtq4pnScjermCMnTmLPxIvK0BEcqN5QJfLhdcwYWAtnv4gHD62VK0dJETAmEdOf5k6DjRhmbTchb+1tpWnUkdSw+3kfNXGWe3LDKreFqc+jpkB4dsP9MAwvPUCzI+cafIuDweWkx72+/jeeilwCZ8mQQ7IUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRGfZfkra0eihHKKGvP+5U/cOaqThixokW+NQOaBAKQ=;
 b=abEkFkBxe+MSI07f1y8zm9wRQlVBfv9vGAgWNWfXBhhZTmKFOnoXNqd0+0vRWHZnFS84K27QQa0Du7tIKJmPolAFPDb8eLH+CErZaWoRRTuu2QJ+EU5NvfHepYzNG1pXZX9l0FfWGsAwIc/9Wpb3BfAwO6/lLLhvmUL0K5LGLIxIs4RZcSea/3ThSRiFlOKJLhZXc5CI86ABeG3/hkqjGxp7snJU0iaDVjyijvcvc2AUTV3xIzFIyihzLZm7pOB/qk3wzTob4Pyz7M6WhKXUzl3O32e9ARucrCw0il8HeN9k8bh8kouCcDua5gWMwagQgM5vi/mNvh46BhnRxuFrFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 07:05:05 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 07:05:05 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: imx: fix missing ret assignment for dev_err_probe
Date: Fri, 10 Jul 2026 15:08:34 +0800
Message-Id: <20260710070834.2744357-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: bad88b27-1327-43d5-dd2b-08dede519194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	MLASnbwg6PUNJi/oKoXvZwwVB7ScYxEXMJxsp3OT7aaVRfTrKwL/1lLnbYbYyI9Ka1XZidA1SLCWknWFmXoyBdU/HABu1T4VWfeJZD8PK+oM66E5vyneJC0WwFqlji/6wYiJincuWBhJkO7BKkWOL1RJl2Y6ONN5oXZc606bPkZEkwZgNGE8u478l35bkdgFfroADNVran8gd3SeT86In7ommidq76kY01WXRgLmDqOnd60KBCj/OTgi/QHE0QnEzKD/4tDfq6pdCmreso+U+hHRBXFIozrJ7kvMJUa12CXURttJlu6PVMFbVmdV+Hycl1l/8ve9HEiW3WZKK8R0WzgLELRoCEcEEf9X5sgCK2KxIMIXH690lBhIFDNs/RdrhmVRTS32h3HpOfKv463SJ/TvEhcc3u3r9to20/YM9mC8jP5v3MLIPdZRY3LfJZQgvyR7kFztzMmf/WdJwafBqSc2OaiRcydO47YC6EIKWXFHAVlF5OHJpLDOVgHWpxwgG9ov5O3KANPBmqNHcnSKYyRLWnJfpEeN8Vc1ElpZWn/u6pGy8KnDhKmG1Kq7SBTsCkKjBrBm2YCsgnogJJITUAHuD9wfuhZQ1KLT0KHRzIFRRZTPgC3cmhDmMPmNiLazv1nIO4V26kKWu62szMwa12dyjnJDaxdR9vh2/PufSwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i4/N7sG7ffvp3brHIVrtrYgD/r+DLV7PsMFk0hzw6trl8HKJBucVbcpWWkRN?=
 =?us-ascii?Q?pUKPntYeUIFBFl/CX3+Bz73GtFjHZj+0sfeWQthfH8y6RGzzS71zhLCzRhBV?=
 =?us-ascii?Q?HEc0NkkVnPMI1w6BD2d3YBYcJNtp91TdbBxK6g5YP0yIFMQ0c5pCZnQ+nNxM?=
 =?us-ascii?Q?uR6ePpbNkAb6ojwYZ+y/KdnBP143J/RrVC/Xh0wBt0RfVZ3xYf2mrGhyP74i?=
 =?us-ascii?Q?/7ovWmOVyMMXpz6l5/3ozOWRAZxhvVVmECfVIAWX2Ln0Ug1m3nWDAn6SEJsQ?=
 =?us-ascii?Q?1gR+0EkurTXfYWzooqlTDsPITB3HxAXcViPWQZVoTtjTUZDeU/Pvlf3PF+76?=
 =?us-ascii?Q?5xtgmPP8XKdvJ8as5l26Q/mYrjoW76r6feqKG/zr71SuEEa7Ze8IMe2YPkw9?=
 =?us-ascii?Q?4GH79M43wZPtejdJ3RdExkd6LT5fXji3qIzo8gDCVW6DH6FveHAg8jKqK0cL?=
 =?us-ascii?Q?5SOLDr6zi22uJmZsM/2AH82SYyf16JOOTkery8fYaleOr6h9xFhj8sqgc2wh?=
 =?us-ascii?Q?At7fK4eMN7LCUeiszEGnV9aqP54iBmkJ4k0XbpxAscaNVf1tPU6Np0ZP5pMI?=
 =?us-ascii?Q?DVfeRTwH3tXN7A7ULj6jhtG2cHnK/YB0kR/TBKImT6u4m6jrTBt3hjTKARS1?=
 =?us-ascii?Q?qZ4pAiX3mkwzJnntaMRj9eYN2IZeVieMiMdsik0MAcVvvjQbwuCPFy6aii02?=
 =?us-ascii?Q?mIGvQxiyvpnGjmj8xT7hRVuifpwkZ4g/k2l7DAaLzDo0ns1lO0ZGsZuH0J5A?=
 =?us-ascii?Q?lXOK5ev/Sh1BVsEr82YGWx4KoKWISd7jL8hpsBv6+12kDMfTThnoaTty4Q5a?=
 =?us-ascii?Q?O/OLcdWgU9Me3vLpwzajYCGN0MhaCFttrS/mG7eFiEkLdSgj0+YaRLX9zBVh?=
 =?us-ascii?Q?qfhZixVDlEm2x1wYckwIhnyEW9EGkWDCHuY2JHqHMUv8FM0/3qrT2m+r/tT+?=
 =?us-ascii?Q?3K+WsvkjWMsnNCYprCD2sQoYj/eWpdjjISDxz+wD1B+WrSU7Vhk47tCvnWon?=
 =?us-ascii?Q?/gP90bqgcX5VEEd4C6C2Hut4wgHBhoOnaZSg//OLwcv45wGanv0BRauEtjdo?=
 =?us-ascii?Q?8WgA/mUgpDhtmYizojO65f1jjFwxPsArT+hx0x8AUpF/u3z3ZjE5/fo1ctTQ?=
 =?us-ascii?Q?xG9JICN59FWkMhHdkpzlPU3U2EhwUAM99NpVNJhCrr3B+hWFkNmjLMrk7PqP?=
 =?us-ascii?Q?gYrlT4U9GZupyiNGf4PcyabNQfhwAlvqznYzTSWHFZpNs85ULe87Rzf1p0ye?=
 =?us-ascii?Q?x9NiLfwgTQHlpdzopeCF1JxRSJLMnS94k2SPrQmNFGD5En/7dmVqyUuOvoTz?=
 =?us-ascii?Q?XRg7miVeA23NT1CMZURudlIzNUbAa2mMTfjMnyYbbxyv1KmmoUHgYQbPe1YP?=
 =?us-ascii?Q?jol3ZEko3SYB6fP+BZxkjo1VXJN9Y6C/4qiYH/jrzu5Geo6V4ePa4adtV17s?=
 =?us-ascii?Q?LySI//viQs9JuMjBlq8lNzg+e4DjOQW0PjRPQ7puQZoLAKRjBRjLndNJHH5t?=
 =?us-ascii?Q?GgX9OO9Ha3i2VIEnrOSSvO/wKxqLvCNvycC/AJZSD0AXoW0Zok8SlsM4cAWF?=
 =?us-ascii?Q?DHTDfdxvWJk1wI2hjOlhsIgRr768/wjaA/v6Pp7CJynFFyhRUUZFpinYCdBK?=
 =?us-ascii?Q?+Q6q0XLXGYTBRRAjfcYVtyemOcPh6U4dHOW3Pwf9bIQEhzLXOzMfv4hrRrqv?=
 =?us-ascii?Q?QjuINy/xY6ZhR8jhfzbIHQcxWc0sBOeHn5HWNOSuiQt6Ph4UdTFU2z89z33q?=
 =?us-ascii?Q?CiDW6bCnHW4wx8Kvpu6McWTY+bApKqFIy/bLCIzeMNrpwjdo33iE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad88b27-1327-43d5-dd2b-08dede519194
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:05:05.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZseLMhOJlYVX/oh6mNsqy7RM1r0gpips/+w78/T+IyEK1/fYHHQstO0mYyHK5+as2ivhgCE1dumPyxYBzyKdCbTre+dIFQkVCGSEducBvJeXxks1nH4W9nTqsS1uG/pu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

From: Xu Yang <xu.yang_2@nxp.com>

Assign the return value of dev_err_probe() to ret so that the correct
error code is propagated when goto err_clk is taken.

Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..282314eea7fc 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -528,7 +528,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
 			goto err_clk;
 		}
 
-- 
2.34.1

