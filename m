Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9575360EF7;
	Mon, 13 Jul 2026 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922721; cv=fail; b=ihi9faH3vbDeYSxMGIO6wjQOiSWKo6hc49KqJ/yBIX05plzh3G+t1Zqn2ZeVBJoCluVxFnnMZ0dpVI7+dTuN/r/FpYq359oHcmZbVjjQwJ3oasmDO3rqfP51RvKWpY5PqCeTiSUP5XTO0IL63QjAYoA/xrwoe9jOEooC3gpj640=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922721; c=relaxed/simple;
	bh=muG4HEz5pHBg9KAR6i76grz1F5TkBB9SWvJfUAhomp4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=drGllnp+9QuuErr3LH3W1krwhiwj/FKzaN1fFPGZXgPxNNQyU8xJxCZteZ869qCG+oDTTbzRlrutSDEpxXfcJnv/LyNb2Gd9mOe8b+Nl83CNiNSX7vcGkscm9tJWRRtQMmrSkFY/2kf5xtOMmqE8axKuF2qauMzuTvSV2JcBliM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lLDwd3Fg; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lLDwd3Fg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYaFNIYc5oHcRi115w8rs6ZwAaZv7XgaT2P84nnNH0GzZGgf6DGt61cmwPupIC0jA1fNBVU50IzZSRh2b7vJGYjLY9L3xSNwzu4hGWz3FislqW2ErdMjUP1ebGalepc2jDHzjGNtJn2NRaMQrGU3+M0Rq0DotSh7Okyg9aH3E1RvfcbFiB3jQS0DQOSPBjNejCIWuxZnb8zoeOgLW9Uj62pxSVGkmQuya5hoIfmJvl1GeC6IYkeLOQdYsSRrEc25VvW3ok0EH6FqR4Wo+tZ2J5YjhZ61KLFiEt+o8L1vC5TJf2LTwMoEWB5+4oY4STZttE/9Q9xtW1+nhqqN2PlsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+Ej4kYnV8UigC3va5GRZMRQzGuajp0vDks+RGAoSlw=;
 b=iXRu4G1cCh4lmnCJccYqaJunikVKaw9FKlM8Tt2XnwUm6t1rn+fnrWNaw1tylY0zzX6Q0AtLveGqa+ohz0KHnSEIm0UvOQDyA/4riXmYCnnPtEOjHufXup9NA78uzDIxMD6YnJYT5HyZOnZNjE4e9GpyL80Nn5jYysYP3Hib+Bpgl+UPtHXKCEphLAPBSyheHoMkhGhSr2YC9m3VKb5YcdrAremWpywoy8hE3J2QosA7JwVzhYbPVSSlDPZiogW9BS8KribbMoOPJHqL4Y/D9rOx0hmhdghnyuJf0uGLPKj8q5azuwd+UmeQF69rjaMBSnNQkPLXc4zCkU0npkgghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Ej4kYnV8UigC3va5GRZMRQzGuajp0vDks+RGAoSlw=;
 b=lLDwd3FgBAdTPsilZBX+yrq9X2IFhzwt++y7TXRrLzlIJ7GLL2YUk5pylGuQ/ht5QJ4SF4aAZZ1N3YxCtYdlBJvzEjnMwYHorKqOLeCJlmHMnX9iMyppUTOgz85ayTBYlXZjcshQUOQO4B+7UmdhATA+FANaGRMVomVPs6WKT6aNQE1tCnhdSho05uDEnDPKYmAFHs0Mu31TouN/7i8pIcWrsEe4OcBVWE1rW0IaFH1kZN/odrUogdthmeCNNVvPz1DHsYXBICyqMNtsz65kQdABE0Ys5gMcoVMLVNHRDWjxdjerBUSnNZnOiHzckcf8Xvvt4xDK204M8DNWZtPO/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 06:05:14 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 06:05:14 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	kees@kernel.org,
	hataegu0826@gmail.com,
	andrzej.p@samsung.com,
	balbi@ti.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] usb: gadget: f_uac1_legacy: remove broken string configfs attributes
Date: Mon, 13 Jul 2026 14:08:45 +0800
Message-Id: <20260713060845.3759673-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0062.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: e30d317c-68b7-4dd6-a90e-08dee0a4b4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FyzGKsR7dTIF73HSABbtJJcO4Sj1/U344itFoZNVMla/9MU9Lu7ZWLVpL+IiymjpFrFMqPXAOwktCw8QexAa+9Bu4oesIahG2tFD3pGIzQb/jo2zTRhcEtisVSusCDunVaxstWVOV5XgqwvHlgVUNV6yLJRJs+nv2RJp07LTDqj7kzTcilvXkhYC/KC5Sb6YnkIpekwVSC11ukPtLnrp7+WuJQUkwL74730/lyeflC5Ud0MyBA5hyt3wzCVMSug5Gi61pF7Ko8FBgDur4owQ0GmqkQVXX2oTfLaKLJZ/pvqNEJ9z71aQNsUC7YTAHQxI6C9z5FUnBoe8YeAkUCp7dypyDxqj7VaeIGrvqlR0hBFWMqXDzhV3GhBQp4jpWhMkT4mTbUnGfNmochdNYW9+LsqhPcKGtPyu23T20ZhgH19h+43qRxV+IUJ+7X26u18LZxKU59qXg8Bf3ko3DjvlVYW10JEkpHlfN0dbsamk+d4TCCaeztPXrznV/oPF69tLxMsplIU0ygGzF0ED0hUzxA5KZQ8I6S06L7FJL+gKiiaAh/iJE+doozeBYPEBFN2DMjtSwnct44GDFSk9g2FsTKB7h61PQUUh63Vv1zKDHjJXrz6ElSQXhdwGqPV+bk8zeAnmiDhiKLYQJEE6+SKb6CWuGIdZeHaB5vVfd678iJ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rriZBDyhn28GZ3YNu1UOPcuClfzwh5wVJW10LZbZc6WfDG9aQDUIqfurVtuL?=
 =?us-ascii?Q?M59L1Tkwsv/gkLwjjew5EZBhG8tCZxW+Tx6b2cAz+44uO0eAM9inWyOBGnpt?=
 =?us-ascii?Q?8pXGyQZqBRCeLIbVfLRY0w1HmkHrhGLJ0EF8gMaocfeYXeoCL/YWZX+tS1x4?=
 =?us-ascii?Q?SJxJW8todAqGgo/ibT3L7BaflzLC/YJpxlmznYfwCzDAlVl2HBm3VJmn0zbf?=
 =?us-ascii?Q?cqerDayUW0z6yBRuhAeUicwi3Voq2Z710za7dXiJb6v277SXYfW/FsaCDxiX?=
 =?us-ascii?Q?Q2vD/s+dKJmKqoh6E8C7S6pYSMZf9nX1I3P712jOAZ8Rad3Npif1gHQhP/xu?=
 =?us-ascii?Q?3XKthnv5AHXAc82sswKaP6Vtvs/MyG3gOauI5mt/szPBGAhvvQ5F7YH2cqVo?=
 =?us-ascii?Q?PDemFz9e0XkzWo5a0zJp79EHU1JEAJr854YOkRqgePxIZql1oYw3joKryyRg?=
 =?us-ascii?Q?CPvsWIwJoSGvT/hpt8ce5+NoIDcGAnxyCiamU7p/ndloucKb6Giwq7Z45ukw?=
 =?us-ascii?Q?4dTZI99ElskMNhNOHAmB0Fzg9iIu+5aQih/Rt3x2arRoMB9OIMiWrIszjv66?=
 =?us-ascii?Q?SLNmQNdYcMshsS9SlG39jUHIr5naNMdGF3JhrGFYJhHwfn2s8i6b+11zW/Nq?=
 =?us-ascii?Q?QjxzMttebZyZW1rtZKqofLP7x7OgJO1aFfc8HqBuwKyVhorfegKA3wPXHb8a?=
 =?us-ascii?Q?kIuggkrQYebGf4Iql+Oea7FGLjgGZ/Qz08oFiGXqjCMUKmGOV70K1EbZ4eGS?=
 =?us-ascii?Q?WFWW5pIZ/ufwQd1zxaF77ukd8CKdvHwjFcbns6Ub722TO7swdsnXNIUh/4HE?=
 =?us-ascii?Q?HlRDoZpXpeOJg2PBVNWQ1GEpmK/t5X8OUDoh78OhYPhNDKPjDHO+s3LOl4WE?=
 =?us-ascii?Q?Ffzulyrrk/cPQt0OjtdGEoVV4vbuMnXqoKc/VsOm7DY/+FO+/K3rLMO2+4s4?=
 =?us-ascii?Q?1Xr4T2DaGnvmWCT1CBHohcrgdQMZGSucPNi2gcc/DRxnlifYOt9xwGu5bigA?=
 =?us-ascii?Q?KuIn4UYeUCVY2EC/BQnscRKqEpbJ8QKbLFoypj+SOvqRcuYXh7NbUhhzmECQ?=
 =?us-ascii?Q?FRAKnRY4/rHw6bCDGucAnKhvOXhpXT/97NDIcvug4likUCajWxQKwVHQb6ri?=
 =?us-ascii?Q?j5VdXPgVzg0N0geFn/Y1A9X+DILMylUWhK3IUvqVjkD+d0ZU7X9zw2sVpMzz?=
 =?us-ascii?Q?Pag12VcoEMkLQO2J1pigoh5NIV4Xk/Jdkpn6nXLOTaEJZ6Cg4db7yVCTYZra?=
 =?us-ascii?Q?09S49oTM51nUX/3IL86DzGwERoEdzSe80dhvPm+Z8zX0Fg9cF8qfNWHKU2yY?=
 =?us-ascii?Q?C3AobevSsqho2nWgVRPxAKKXn6TR1k+dXNuAtAqsxFc2QR2zm4H6gn//Vj17?=
 =?us-ascii?Q?2BKfUT/N3kCIHVGPtJAAGZSn6MCt9J8jf2aVNfB961xD9AO4qAi6FJ7ZELmZ?=
 =?us-ascii?Q?OjFzhMlr7lIBIKaZ5uMrIeEUhyy90Hwlgyy7rZ9lS6NSHwYi14Itlz9qSkiE?=
 =?us-ascii?Q?jL0lTTFtlmv7heMbWXDiUggpn/x2Jh3G83wM4khcPLwlwcSBR0yYz1idcA8J?=
 =?us-ascii?Q?4vdK+36xh9eEtK6ZjTq9YKNKzBCnTsqoQzHBU6FUNLJvTDmUjec5wLWCij71?=
 =?us-ascii?Q?5x2rLNOz4/vD24n8IXlwAgsi2aAKWc6YQLehE6/1t8MY8PBcM/aRPn1lbvie?=
 =?us-ascii?Q?oKfsEwLtol1SZSVX1Wg/jzLSGvBo4odtBIskWyVwV1vIY/n9FBTcPZBovdC5?=
 =?us-ascii?Q?BzNRS2ZvI8FAZISoTr8csvjenjV/aV40Gm27xCUIlYHn7g4MMWZc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30d317c-68b7-4dd6-a90e-08dee0a4b4d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 06:05:14.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxFVv520ua//ODw09GqDxklBbQrLyP0LeTkOpKZa52EHEVzzKTiOQzQTXIRgS6PFAAHJAc9Np/K07fRP8+fh7TDBED7+ClJJX6b4ZV8HPQjktwgovBk2EaGqnyGUkJKf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

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
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - Remove fn_play, fn_cap, and fn_cntl in gadget-testing.rst
 - Remove fn_*_alloc variable
---
 .../testing/configfs-usb-gadget-uac1_legacy   |  3 -
 Documentation/usb/gadget-testing.rst          |  3 -
 drivers/usb/gadget/function/f_uac1_legacy.c   | 56 -------------------
 drivers/usb/gadget/function/u_uac1_legacy.h   |  3 -
 4 files changed, 65 deletions(-)

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
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index a6e8292f320a..4921e5307d49 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -714,9 +714,6 @@ The uac1 function provides these attributes in its function directory:
 
 	=============== ====================================
 	audio_buf_size	audio buffer size
-	fn_cap		capture pcm device file name
-	fn_cntl		control device file name
-	fn_play		playback pcm device file name
 	req_buf_size	ISO OUT endpoint request buffer size
 	req_count	ISO OUT endpoint request count
 	=============== ====================================
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..3f52099a4fdd 100644
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
 
@@ -956,12 +906,6 @@ static void f_audio_free_inst(struct usb_function_instance *f)
 	struct f_uac1_legacy_opts *opts;
 
 	opts = container_of(f, struct f_uac1_legacy_opts, func_inst);
-	if (opts->fn_play_alloc)
-		kfree(opts->fn_play);
-	if (opts->fn_cap_alloc)
-		kfree(opts->fn_cap);
-	if (opts->fn_cntl_alloc)
-		kfree(opts->fn_cntl);
 	kfree(opts);
 }
 
diff --git a/drivers/usb/gadget/function/u_uac1_legacy.h b/drivers/usb/gadget/function/u_uac1_legacy.h
index b5df9bcbbeba..b9ddae550ff3 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.h
+++ b/drivers/usb/gadget/function/u_uac1_legacy.h
@@ -62,9 +62,6 @@ struct f_uac1_legacy_opts {
 	char				*fn_cap;
 	char				*fn_cntl;
 	unsigned			bound:1;
-	unsigned			fn_play_alloc:1;
-	unsigned			fn_cap_alloc:1;
-	unsigned			fn_cntl_alloc:1;
 	struct mutex			lock;
 	int				refcnt;
 };
-- 
2.34.1

