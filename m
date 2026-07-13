Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3F2749F1;
	Mon, 13 Jul 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953971; cv=fail; b=pEJUZ+eUbAyBkQMBWRxd0afB1fLaXDXanOsyvqW2i6k1aQccubLXK0gtsP/UGRt8KV8XgAJtm1/KCC5G6txHaUDmWlzN9DltUDlOvQ3q3w2PVps4Jh4gueKHrCEn/f+vDu9jEWMOBVBl4JwJh+jsHL4tTcfM8MAlyFyh4dGd5tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953971; c=relaxed/simple;
	bh=1GfYE/4gdFc6FNRg6eHOJ7IadRc+ArDWrMYwV/AXc80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gvrEi0okW1SQgcvGVVMtHQrnuPt2IxJpUeULUWIULfe4VlmAuvujlVCYJOsqmFSQ0v0XelTp4LqBMHY4qeWb0B19xtLhPBZb6nEqpLu7IMJxdLTO4swd2X+2ljhb4wT6TICC0GhzNCDyZTCR9lMYrP1w3QGcTpQssiCbBp/emJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JYigaXts; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JYigaXts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oba0RJRh7P1c+3p8H9hy8l+ulmGXhJO3k8KA/BjXlwyVeMJblHtE7IZUCk0GKgd+yZhzD247qhBLkkF0+JMLH00lEj7L/QabydpSs8ZZjs9Gj6ifSYhHWocOqzmuZ4LScIIO+t32X2Lm37BppCK5a03lxKDLlT9KQEQGZzzc87ll7TISHcFinqiv0/xMZAdfHdqvD0yyzz/mpPGGZQN4t1MWQNn1Syy6h3Urx4nnIpT/j0HItb+qeSpCDSmXJmojOhS4m2X5TekA6RMXVbxKvWv9Dd5QZ+EHCJ68L9EmDKEU6OM6LIIZDFhyJB2He0ySouy18gArTTcy9/bQ/9VXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+/IDxKDL68IOF+R0+3j9EZVSEu5/uOBqvlZIEVK3AM=;
 b=MhVTXKrv+en/qTcLpvFOcCHj0FnLiYLvShZGGuHVefqHmQRvM0csIdghEz+uEkPEsxeyduaa1IT++p35utrB7DbaL5XAd/jK4KwrBV7rM/EQoVRD0pdiWda3I76YegqPJgFvwOeOgblN2Z5IIDp3a6Z4dT4YEWtPsAuUF0gOjp8g+uMhvfapBDpjADsiebQEy2pRK4HZ6BkYR5vhRQVi0Gkfqzhvv11TBMZ7poIcxGwccwD97twmUYv8rAzFtyqEnF4M29vKYzZbyY/qGenHufZdffOcxAkafxBbzHJC0mDxb3xhRnN+ZzKYDQJ9ir705xfo1FDdLU1jQGMmxffj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+/IDxKDL68IOF+R0+3j9EZVSEu5/uOBqvlZIEVK3AM=;
 b=JYigaXts2+dohOerDrySqdgpGzo0GXDfXJWOTcT9IE0L1t7YZxTKFiHRT4xWGvINaiW4se3qq3VPBVyUasX7Rfc7Yjsn6pxbwP11YYQ9b5lAqKmAMTKI+LfOP/8EJpKYcDq3Pzrc5tn7gOax+1zPklu+6RCFarrCQEN3lVhlqBjt38jWwBhbPREgSH1MSm1lfn5vlw7RzcSs3Nx7yccIrLfRpMYGoxTF+0jqoACZD5VnUi1Z65z1WvsIlM1j16pwzGT9TtS4MgY7vPUsCCvLJTZNyt8Jm9ys4t+osyHCgI5eSdQk+USJEZxeQrYZ69AC82eh6ov+fjXKeCSJ2QqXmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 14:46:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 14:46:06 +0000
Date: Mon, 13 Jul 2026 09:45:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, hataegu0826@gmail.com, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: remove broken string
 configfs attributes
Message-ID: <alT6JM3Uf-UjD2rO@SMW015318>
References: <20260713050246.3739137-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713050246.3739137-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:806:21::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: bbce38c6-0fcd-472d-892b-08dee0ed77f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QILZt8RvXcA1DPPHwX9oSuqO9VlpcjzJO4Ljxcr0wCG+9WP1MSmwiEL3ktQPVO7qQTWEMp/dnxH3haVQ8gL2JwFQlPZQ9F68vDOjhOYSDfu9lPEE3I/NLrlfpB7bTpXhHpAJJ0WIAst2oJUaFB8oo5Xzw3qzAZoY9LgMg+kSgtQ0h2DTElV7zAcBlOMLXhqLubGfmxmad9lxGdTunvJlor+3AmV299e+xGYZOCQO1TcUVGrLkJTITbvRMVJKdEmU7eaEzaCiMLEooNwK2S2GWMfbvyNw6EgP4yry1STHJmHARy9Q2wmjonqkwSQlSX7ZUHf9nvQMlCWDZCx4mWz0+1bnfsnf+xUYTD1X1FXjdnwaiPSNeZ6KXCfoHJCrEc0JOxxy9jCWBRZgcvl4rUDU0gLTt7Kfb9CoGC8ErhR54+DOrFJ09CR+VibBuopewjibQRVFkaW45sEccoRUkqxcRJqPlSbMdkR2BfYlFk62chanxqNHkE40/45uUD8wL6/0Ra8LQ79A2B6YE2MKbCv9hO0TmkgAILyN9RppBJMurWBvkT0XQKBku/BzrWlqHL3pYjE+6/SD2GYneu21BbamzGwjyADEra3F3SFB6kDlwujq/gMCZPQRLqXMZNvdEf0XHC2mi3gX4iu5Haei9mcwJxOYG4GYzykto/x9Uq+Faik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQqi9qMvmnm3/OItg+qVsnf0KpC1lWulXAfErMnZDmazvVQYYCNEDz7++23E?=
 =?us-ascii?Q?+1Cdujl4NOG68tLXLm8srd00e9ZvwwByyHLbxPbdS+11Iq68H/r9AZ1sBKRz?=
 =?us-ascii?Q?EWtDiJHeAPIbrlx51vjS+0GqCU36jP+5/zXrVYPRJfCa8h2jYT/n2P0Wusge?=
 =?us-ascii?Q?f8boldL2aACZ0Y1eabGi8pefSyhPlbaRB0bPPkzkt/vSYgitACme63V+c3r5?=
 =?us-ascii?Q?9/KoXNbxF5X9GtVvLp1J2DhLmAjY9/QVwr01RXfWrAsPMXe1iYqMTrtORmXy?=
 =?us-ascii?Q?4H92iHkraQSz88j2hPg49ek37TrmvdGXiW0YksVaaqt7sV8eTwzB9Le+ufWQ?=
 =?us-ascii?Q?bgAccGgz5h2DjyceGcdqBLjtoUnxY40Bd0PNCSpgndSxlztcgcL9hdlAMgvQ?=
 =?us-ascii?Q?N8gEPnraiYvCpfa99HKL3bynads/WILxkOsx43WSPZ6/v08KMl796iUNXb7p?=
 =?us-ascii?Q?k1or6Gs+mv2pfSTS2NNojB5cYaTMVcQ8tMbxpc/QfoPbw0CzcV6HIA0Thso9?=
 =?us-ascii?Q?MbnKvfDa0gOe8Pvs8PVl+FokcyPNg2xe6UQCgsuhZmCwDoiuvw/Ll+FGjVV2?=
 =?us-ascii?Q?jkllEnJXNUNI6FXui0SkEXC3dg2lDt7RCO8doTvibEJaZNf3I10frDPg6ToZ?=
 =?us-ascii?Q?sgHK8SDBVKZA8yue12PwEeDfFNHokH7Dg7Ba3VtSsUjUfSuufc/GuXkGfi7F?=
 =?us-ascii?Q?lMlcLRT3fKyTqlpkbEmZO740LfU4O8FRsp2Jd+D+bNnvxQ5Ehy1jqIrdRmZ0?=
 =?us-ascii?Q?Oot6mepo7RMHqvtOa0phHJrFsNk7BNcVgLK8udgNACQAG+oEShOweOLwx+X+?=
 =?us-ascii?Q?eoTPMRQLVNgYutXoQ8PMSdFjU0HYaRFF//V9a2Ew6YA6ahYx2KmH9dK5LpBA?=
 =?us-ascii?Q?O7ThmcwJCFzoU1xOrwPEoo0lu6lN5Z/goMtRr0Uby1d+8FrcDs5Et0C/UNi3?=
 =?us-ascii?Q?grFzZZwBETaugaUXfrB+Y54CNlo/FAidS8Xl4Ld0ERbmNsINsB+moty4Ev1O?=
 =?us-ascii?Q?UTc+lbkiKjBuotDCDWB/Tv17fH7BV7IKYXF7I+ioNbd9ApTwOLXg8xJFU2A9?=
 =?us-ascii?Q?XyDeOzR0+Ab+p+8aE3KQqiEiaaYFlfOfzXC8F8U/JHbN6KlRRqdHLwFf7jEs?=
 =?us-ascii?Q?mhssa1ez6ffbRoBmG5DhpWppts1L0BeFZ0hFKGrMDnKKjBHMeyr609g6Obdc?=
 =?us-ascii?Q?zDPfmD/Ycg7n3ZqGZI3Mm6C+wSbm4qHMG3f4seQ4a52Xgo7Y1+L4Uo+JMTRP?=
 =?us-ascii?Q?2ZHAjuUX4SWCS9v8ODKIlg37rfATKXaBtRMfolIDrzT+6Juvbd+JBwXBx1tT?=
 =?us-ascii?Q?EzzT0Z7cBP5dJyNhINtJEa3FFTWBXv3xIvIBpzg9Q530LJQ1k24VJqYWaXiZ?=
 =?us-ascii?Q?i3jSM0o5xibJscifC0sCjPbOT/a7CPBPMgdDheT5jDjeqW05akfLyhYLkt+z?=
 =?us-ascii?Q?5vfg1K4XnZTgBLZ1lKDBzFtob55JS3OPmKR0/52X/mz2xhdM8McmZDxg+d2B?=
 =?us-ascii?Q?g7TpkHVsWp8iVx6Cy3IQr1l5fzJbYWcX9qFC7ZMyREihTG4FQlQDavX2L5qY?=
 =?us-ascii?Q?gAXLk6wYJcGNQxLINxSGTHuX0Z+OVco5kJl82GyRsbXE1M0nsK/lGq6qrScK?=
 =?us-ascii?Q?3Ylo4CT2yS4agk8K0aPLuL3AaoZNp9MS5i0UA9KZunFQFiwN12dWRhaCt551?=
 =?us-ascii?Q?LYMoslhxYCz+504K7tVMW2yaRZYO559KvjE/WPhgbPYYlL7FqIaepSKl4SIz?=
 =?us-ascii?Q?lQFG1uLiBdVEAvJPkyIkxTSmB1tu87qf+GeLwOX0awSH0wlZDAm0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbce38c6-0fcd-472d-892b-08dee0ed77f9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 14:46:06.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aFCS89KvJvz+BXVnG/FoPWLH7LKPe6zo8OAw8CCWxnjoeDDw3i1wQPjTls4Mjb7nd3gE6dgbR0P9fbb9MuCBDlMa53/AZi15hwW196i1Z5zwIGlQ1Hy4K8OJJWj55Pe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671

On Mon, Jul 13, 2026 at 01:02:46PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> The UAC1_STR_ATTRIBUTE macro defines configfs show/store handlers for
> the fn_play, fn_cap, and fn_cntl string options. The store function
> contains an inverted null check on the kstrndup() return value.
>
> This means every write attempt returns -ENOMEM on success and
> dereferences a NULL pointer on allocation failure. The attributes
> have been broken and unused for many years.
>
> Remove the UAC1_STR_ATTRIBUTE macro and the three attributes it
> generated. The internal defaults (FILE_PCM_PLAYBACK, FILE_PCM_CAPTURE,
> FILE_CONTROL) set in f_audio_alloc_inst() are unaffected.
>
> Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> Link: https://lore.kernel.org/linux-usb/20260625113154.1954813-1-xu.yang_2@oss.nxp.com/
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../testing/configfs-usb-gadget-uac1_legacy   |  3 --
>  drivers/usb/gadget/function/f_uac1_legacy.c   | 50 -------------------
>  2 files changed, 53 deletions(-)
>
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy b/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> index b2eaefd9bc49..6a681d219f43 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> @@ -5,8 +5,5 @@ Description:
>  		The attributes:
>
>  		audio_buf_size - audio buffer size
> -		fn_cap - capture pcm device file name
> -		fn_cntl - control device file name
> -		fn_play - playback pcm device file name
>  		req_buf_size - ISO OUT endpoint request buffer size
>  		req_count - ISO OUT endpoint request count
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index 5d201a2e30e7..b15f5e074f85 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -888,60 +888,10 @@ UAC1_INT_ATTRIBUTE(req_buf_size);
>  UAC1_INT_ATTRIBUTE(req_count);
>  UAC1_INT_ATTRIBUTE(audio_buf_size);
>
> -#define UAC1_STR_ATTRIBUTE(name)					\
> -static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
> -					 char *page)			\
> -{									\
> -	struct f_uac1_legacy_opts *opts = to_f_uac1_opts(item);		\
> -	int result;							\
> -									\
> -	mutex_lock(&opts->lock);					\
> -	result = sprintf(page, "%s\n", opts->name);			\
> -	mutex_unlock(&opts->lock);					\
> -									\
> -	return result;							\
> -}									\
> -									\
> -static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> -					  const char *page, size_t len)	\
> -{									\
> -	struct f_uac1_legacy_opts *opts = to_f_uac1_opts(item);		\
> -	int ret = -EBUSY;						\
> -	char *tmp;							\
> -									\
> -	mutex_lock(&opts->lock);					\
> -	if (opts->refcnt)						\
> -		goto end;						\
> -									\
> -	tmp = kstrndup(page, len, GFP_KERNEL);				\
> -	if (tmp) {							\
> -		ret = -ENOMEM;						\
> -		goto end;						\
> -	}								\
> -	if (opts->name##_alloc)						\
> -		kfree(opts->name);					\
> -	opts->name##_alloc = true;					\
> -	opts->name = tmp;						\
> -	ret = len;							\
> -									\
> -end:									\
> -	mutex_unlock(&opts->lock);					\
> -	return ret;							\
> -}									\
> -									\
> -CONFIGFS_ATTR(f_uac1_opts_, name)
> -
> -UAC1_STR_ATTRIBUTE(fn_play);
> -UAC1_STR_ATTRIBUTE(fn_cap);
> -UAC1_STR_ATTRIBUTE(fn_cntl);
> -
>  static struct configfs_attribute *f_uac1_attrs[] = {
>  	&f_uac1_opts_attr_req_buf_size,
>  	&f_uac1_opts_attr_req_count,
>  	&f_uac1_opts_attr_audio_buf_size,
> -	&f_uac1_opts_attr_fn_play,
> -	&f_uac1_opts_attr_fn_cap,
> -	&f_uac1_opts_attr_fn_cntl,
>  	NULL,
>  };
>
> --
> 2.34.1
>
>
