Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906234EEEA;
	Mon, 13 Jul 2026 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918760; cv=fail; b=CjAGxOTAfaUA0t8mmkCymRWNhk0y9oRshEnAMIN2lRGJQUJdvwMkdfEOj2vZsb+Gy+XZAtsXI9EwZ105MCbZEfDdNDnp2273eQ3u2naJHXUl7emQorPCcBg1ir+IidB6ml9/1iNQczSBDqs3AeOfVQjrKkz5YC+h4HcpCbenpsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918760; c=relaxed/simple;
	bh=ehXixtYY+GR9wW7B62eIEv4afZ88N8XYld6G/whoZQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZUpfXTrn+6aLpPSKqj5UHEeJGgZYfVr6o9OvuEqpWS/2fE4WedBEQcw8X/q4/NPAW93d7KCsrFrSv6LWT2Cwhw8Wp72s4zMnRnF03K8K3uROds4fG6nDboQh1qznhGJJGbWYeC0rUJySg5s7LAoLt58ihtb6triUgNsIEHX+HDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KpqolE3N; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KpqolE3N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww7M1ezXXpGfwVjTqIsLWsMqkd3AWhq3n/fnvBEJpssReuOZueBdcJlIU+qGExNjVHIHJ0gw+N4RlGIZjfYeaFouZrAhOiyobgCL32Lwvo5hypWsjiEvpVwpH180kmeBEqkayDUbfUMrNX99zvSIh0ORljrZDxWnRgKA1SH1m8rQs9wMDuVgFNyUTz3Qri1F11ot9Wl9goFY14LWrfYmOs48n0BSCtP9lLm+PhkxdmD3mNbr+4jUoUhRNxzMqnKa1oFOfBr7q0w51CmsJkK2lXxRhv/peDfPOmtR3tnouTPHxwc1eQc6ZPv5sGjgB+Iqx6fn9LkCBVNyPtdNhwrXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBwCWtvnQLBmJ/sAmORKthZtHWWhLLQWoUP/fNdyA4s=;
 b=iPEhVXWk5tTNrJ5fImmB1Wwr0RpXNeVKMFrP7Ba7vTN/Ny45r5V2eoxJWMkjWibLprkgue8QEtkzmJCIrCezR4WdvbEFScJ/hVAr8M/H6VDgf4Qf8Ao1FdFGDRqBtmnvPfCnae2t7vhpkMQLmTmBovrkZB8vrSYVDEDknKnL0Um8RZfu7sSewFRZ9cC+iRG6MVGea5oaGT4rzjwafgufQ5FBTSBQd1clHx03sd+A10a1ao5SAfZXVHGKVW8ZsRYipJEbNQ6XJWrz7V2lqxlK6NavoDkNihJFBA34n96Du9vgbm1Dg5YdrGeXQXafY9QLJrQzZSKHZZWYlsn2dROfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBwCWtvnQLBmJ/sAmORKthZtHWWhLLQWoUP/fNdyA4s=;
 b=KpqolE3Nt3U3JXygu897ItRuGZMPIswRJ+zM5/xioeeLSvvQjyGxHYzV7DKD8yWtFjKESGhm/OQ1pP+q/+wPv4SwP9qc3COHpqoxwPiRKhzqIvR2gw4IXUFdroLiVTCAfaJxd9mwSlonhQ0hmhBGLrmnQAXUSAR71zyP+jioTUtWK/ppf8mCDcN0xEdleta8HVIx8m57ensXzB5/HHrZtZHTZ0RQQvBNkl0o2SgNyNwbh8+LW4DedRi3pSfB7D2OpmHwAMA92F5t6NkRsw/aBX6r8yUVdVbVDC2gm3f0CHrRrvCWsyq1CLpumeVULvuQ6we5X2bwf70Z5aTcMPH1ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 04:59:15 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 04:59:15 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org
Cc: hataegu0826@gmail.com,
	kees@kernel.org,
	christophe.jaillet@wanadoo.fr,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: gadget: f_uac1_legacy: remove broken string configfs attributes
Date: Mon, 13 Jul 2026 13:02:46 +0800
Message-Id: <20260713050246.3739137-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8de948-2d36-493f-6570-08dee09b7d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xKPqyTATp4tAk9SX2sZjDS4+yp+iJuDspe97oXsnx1nyyhiq34TYJtIR7cSoRxmcPJ3fmW/32TmaVaT4CERzxWhTV5Nv42p5TfRgHezNKXnkyL0IoMfQhOg5WZFFOSdzZNmstImFCfw9UeMGL6eh3xwaHWRssELueGhMYnL+cc6fpmgI3PeoyOhxuTa4YKPB0SsMnUDM7FFkmk2rRvy3qycbvJYGFY3cHtZGLHlTKqNhSNFm2ZfSggBvIizLgmS8cEv9D2Wiw8khx3Ih2/v9jmXQAfQSddJ08aYQt6fiOOZtqAbXycgOUOnZw3TjxL6raUfKwGpiLr90FLm5gZgH7bfTdM/VIoswJUQKr3vOk/KAGRRCD+Lnzo4c3bCWDyqyn6QZS2dOvqWAZIAQsoyXDIc9RAzEiZKt1+fFRcknLcLBdDg7EfawYvBJgQhztGHYDFuub3uOtPd6mnpvoGvMSiYE8TZ5JM2XVdGUkmJudGyfJn3Yf8S92aJ2cixQ+cPYmgZQo4ip6PJxdsCXZ5RQL4D/GK+DskUAVnvYRwHumdLCu8w51StczZ0gqOLne0iXhy+ajHPvV1Vm7TVvdvxzHK6n7qCas1kj/op8ZSW6rw7AHE9VoBRcGMHYP7y0tXevYkKIikh/IN/xGs3dzXecrrnJThrojVu4g5L2ZwQdPmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0do0WchUf+O3I/KKxKHBsgLMtrfleIce+P76xyNqfdjqnMeqzCWREM5LuTIe?=
 =?us-ascii?Q?IGPcy2ZUOSJliwk/8xclLHDXdGpmxcLVczQ+0VWu7MTKmkFHYprHmr2MAp0w?=
 =?us-ascii?Q?uCIoJL4yBLTfUxU2gVN/DtcFUB0ZEJTHba+qXZx/R+SNs7II7lCKDqroU2Xq?=
 =?us-ascii?Q?3SMJUox8iOgaQuzs/+/mlXnFCFkAA9xLNCSmPeE9zdkdyLxPd6rVLSDgvrIe?=
 =?us-ascii?Q?YBbASPA8HvdO9yt1HziAW8JG77SVMA/r4Mcybc7jDJi0UK4UvRDbMasNI7s3?=
 =?us-ascii?Q?VlvzZvXZrY63+JkaB4kIz2FCz+kZn6fEeQT/hDFI4c8FfeCDYWTzxZU04tdi?=
 =?us-ascii?Q?tKspaGcJWaSjAqcT7YXZsaryafYzVdsR0Km0q538/DUB+H7r86VeEJ4koXN5?=
 =?us-ascii?Q?pLJemCnsi3fzh3jUlF4SIJyezbqeZPgsQwYGH19lzQ/JljKdW1KmBVw8P8lg?=
 =?us-ascii?Q?IzmM5SLKSP4YzrUV04k0rFOoJmkAcn+YmZWplY/iM5/+NN9pMT2+nk42p16W?=
 =?us-ascii?Q?XsyZbbm4mOfNAyTCZO/XBcznoqNwVbz6csiXfv/INI5KnRK3DNr9mwH5B68x?=
 =?us-ascii?Q?oXRDwsLAw9aGl8noMNr87nU1QG7LEv8vO1q//5L2O+TSIp8Xdh5DbiC9oKuR?=
 =?us-ascii?Q?QNvLS3dOyjT+qo1Am8rDe0XAqNSOuI3c1CyddnlMfCR3g2Lp+Xc05pmiIIwy?=
 =?us-ascii?Q?Q3lW8nE6qBZZ5jyZy+WisSBa/lPln1U0sRn9EGd85kAuJBYGekmjN/tEogLH?=
 =?us-ascii?Q?xZ1u52vyAYJo0ewWNyEH7mOHBOzru83oGSzUDLQJC5hW5MCyKuNiF1XAbgqT?=
 =?us-ascii?Q?BqLKffaTl+9gdx148dZSPlBSdKjwmo7ZW8Ym2G8LFPC8bojJQaMJavZMTdbU?=
 =?us-ascii?Q?ywQnDeDh/YHsQGXksoJNAqrU3u7uQz3jYT/n3reTK89gmVK+KDkjBYps2sUT?=
 =?us-ascii?Q?BV8Z8d6iewHQd45kAZK3EazAkdbRu2GiajAehD+EYKQisC6yQJ1j1BVS/jib?=
 =?us-ascii?Q?sa+KlAIC9sDdTumWPBljZX2Aq0mcDFClSK5BTxYNbRddevbbAErWk2Zv6m1/?=
 =?us-ascii?Q?Ojaw40p1zbggVbdVQ+avohrpeu+puaSwPuvAh788729ZBDOPxqipx4VWF5l/?=
 =?us-ascii?Q?R1eOZq6oJECb2zsUu9RfzN8Kd5+QCauAvTquyzQJEL74rqXAUd21wXEBqN7q?=
 =?us-ascii?Q?uTbNqEF5j6llMy4bDVUQ7ygQq8AG3TaqdFjL6iUDylV0qcOVaf4KsjwK0fKw?=
 =?us-ascii?Q?L1JnVrp1A77KDRkdWEcne/ZuKK4C2DybgBgpawoeXktmhjwXXjuSjMXWIliH?=
 =?us-ascii?Q?ffxaFRuw/A+2T3b1jxMytOz6PLLjt19RwrfinjSjpCewUOUgeoiVcK7cDc2r?=
 =?us-ascii?Q?tTBMAyZ0OTsk88K12HFm42T8RfhvAFGAmqQ78YYgzgb6YnnDg3+OzfWwdW+B?=
 =?us-ascii?Q?dC3acMVIikzV3ynrhfoldCMPh2MhQRYG5j4nHqda+WjhC++Pf889SToOktXi?=
 =?us-ascii?Q?xlD+WUV76kYV6/2E6ZbQZEkhtBWN5AAeDkhs4B3pMzGZLsayL89V9drsa/0+?=
 =?us-ascii?Q?EW0sHjYo0IYi4Uzj1f1smLXnmpXHUBpkL4etj9LNLr3hgXC7PNl0yWEq1Qe5?=
 =?us-ascii?Q?Z8UHrKU9llfOsE55Lljll/1yIHh0qN0GBfInZi4XX8EtfqxIloYdcoclSN8P?=
 =?us-ascii?Q?rFWp0PqVG4EZDCszOH/r1WQ2W03byj0BR+FAHs2qwbI4nFy9NyGUbqHnfvAX?=
 =?us-ascii?Q?Gp93AHl3qaeTFYpSQ8TXrI/Qgajw2sjDIsQCCozBkzwocUjbm2vn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8de948-2d36-493f-6570-08dee09b7d0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:59:15.7056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHamtfypCcE7Ie6aYTM/UoL+rKAuGq5K5wzs4xea29/kETR6VRqrAzHuC35EZde4b23cGuvAkHcDEJPEhyZtl/8R1FYLpdkK3OETTJ/V8slXzNIdemgnIkpEmgmZ/rtr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8734

From: Xu Yang <xu.yang_2@nxp.com>

The UAC1_STR_ATTRIBUTE macro defines configfs show/store handlers for
the fn_play, fn_cap, and fn_cntl string options. The store function
contains an inverted null check on the kstrndup() return value.

This means every write attempt returns -ENOMEM on success and
dereferences a NULL pointer on allocation failure. The attributes
have been broken and unused for many years.

Remove the UAC1_STR_ATTRIBUTE macro and the three attributes it
generated. The internal defaults (FILE_PCM_PLAYBACK, FILE_PCM_CAPTURE,
FILE_CONTROL) set in f_audio_alloc_inst() are unaffected.

Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
Link: https://lore.kernel.org/linux-usb/20260625113154.1954813-1-xu.yang_2@oss.nxp.com/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../testing/configfs-usb-gadget-uac1_legacy   |  3 --
 drivers/usb/gadget/function/f_uac1_legacy.c   | 50 -------------------
 2 files changed, 53 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy b/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
index b2eaefd9bc49..6a681d219f43 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
@@ -5,8 +5,5 @@ Description:
 		The attributes:
 
 		audio_buf_size - audio buffer size
-		fn_cap - capture pcm device file name
-		fn_cntl - control device file name
-		fn_play - playback pcm device file name
 		req_buf_size - ISO OUT endpoint request buffer size
 		req_count - ISO OUT endpoint request count
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..b15f5e074f85 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -888,60 +888,10 @@ UAC1_INT_ATTRIBUTE(req_buf_size);
 UAC1_INT_ATTRIBUTE(req_count);
 UAC1_INT_ATTRIBUTE(audio_buf_size);
 
-#define UAC1_STR_ATTRIBUTE(name)					\
-static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
-					 char *page)			\
-{									\
-	struct f_uac1_legacy_opts *opts = to_f_uac1_opts(item);		\
-	int result;							\
-									\
-	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%s\n", opts->name);			\
-	mutex_unlock(&opts->lock);					\
-									\
-	return result;							\
-}									\
-									\
-static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
-					  const char *page, size_t len)	\
-{									\
-	struct f_uac1_legacy_opts *opts = to_f_uac1_opts(item);		\
-	int ret = -EBUSY;						\
-	char *tmp;							\
-									\
-	mutex_lock(&opts->lock);					\
-	if (opts->refcnt)						\
-		goto end;						\
-									\
-	tmp = kstrndup(page, len, GFP_KERNEL);				\
-	if (tmp) {							\
-		ret = -ENOMEM;						\
-		goto end;						\
-	}								\
-	if (opts->name##_alloc)						\
-		kfree(opts->name);					\
-	opts->name##_alloc = true;					\
-	opts->name = tmp;						\
-	ret = len;							\
-									\
-end:									\
-	mutex_unlock(&opts->lock);					\
-	return ret;							\
-}									\
-									\
-CONFIGFS_ATTR(f_uac1_opts_, name)
-
-UAC1_STR_ATTRIBUTE(fn_play);
-UAC1_STR_ATTRIBUTE(fn_cap);
-UAC1_STR_ATTRIBUTE(fn_cntl);
-
 static struct configfs_attribute *f_uac1_attrs[] = {
 	&f_uac1_opts_attr_req_buf_size,
 	&f_uac1_opts_attr_req_count,
 	&f_uac1_opts_attr_audio_buf_size,
-	&f_uac1_opts_attr_fn_play,
-	&f_uac1_opts_attr_fn_cap,
-	&f_uac1_opts_attr_fn_cntl,
 	NULL,
 };
 
-- 
2.34.1

