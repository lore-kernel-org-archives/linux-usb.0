Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9664A17A305;
	Thu, 16 Jul 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213631; cv=fail; b=bB999aAr8+9kc4HOBy3uyrhy7mQzMbBoR6MveLB/jea6sa51kPy7TPZVCVRuNnr8Lw3Yof18zIl256EGYOj2V9a2ZPFlSfucKtJV4ae94xEqPPlTmnZaCu06QlQ7PfVgcXVwCtvXUyZv98ozzpKMueNYmJrrr0mm/YyfEFiJFjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213631; c=relaxed/simple;
	bh=DmINRXBJX5X2rnL71B+MJGc+kEsRn1COeGEBeQiW+s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BJJT4xWycBlFyIiK72LVrLMAXBdjkEdVd4FsYLdbLuk0aHA28z/kcyrjRb1zJJ9NP68c52UcqR2j5Im1XTwS08M2CQOy3DqAO6dQvqIGfmUx3k7kuvKeyCqjlXcb9R1vW6zeeiyDfVQ5AbRLz7GwERjRebed9xpO+QxJbpSdvM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tpPz/nYC; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tpPz/nYC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slUZFuYrqiHlOboIqjqTfVePhhVkEk93s5mo8w64hR1IIceV/oJcT5RSGeo6H0l9bVEvKnXp5WOR/XjakV3EJgs3VtuZ25GpqURQlgh0a6n8nBzLrUibswRf5CHB1Y96xVhCizhEdW7l801BiorDG9xp9N700svY4rlajBGVSqc+aCIyGf9s8Umtgq129oMkorWQwzllYj4sYVBaJvm6SqmdcW22zlTqtmTsoRPSmBbCAwTUCroVY8mvPkeaxiP0iVuiW2kXQx15xSane6fS4qc07wFTbLRdw0IAASRLCxn86OOvvW3VvpoU092g0z4BH60TAITWJFda35wFF9UTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5lZaiq1BbVuBHRQA3N5wO8RIUNsBoa9m7nhfY6TJ/c=;
 b=lhHunU+b3HVwtV8B5kT9sO5zrrgrfSjtrFAcJTLkAZf3f0kbWa03UMyTnj2zf+EdH9x4SqWwk4dJ2jYV/LyIJ1zbBsEit5nFsovajQox1gyaGzHBqq/z8bD3128QIcRBH4psd3Ry1u01B7BTUn61Dq9aSQXnN3I1Fd50WA0FBpTh6FQ9xtTtRDQKPbFlMDycVbrCKRDxgq9WaX+eo8ErxxWu1321vrIuztvFimjzw/+J64uj/pU0AzRFG/vncXlo5r/r+qnhl7GGWMtdptG/s9CMiwMyPNy1faM9MTOgQPxI6KoaGufkT3YrKSmztNO8fqhcsUakqknH5zB9gMFSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5lZaiq1BbVuBHRQA3N5wO8RIUNsBoa9m7nhfY6TJ/c=;
 b=tpPz/nYCYfefNe4cbw/eGLhQO6QH1/ON6/qZTFsUj4IF69ZKGaQvOQrzd6X9lEpXdSJnC0r1673ortSB5P54poT1eP0pY3nYyWmOAJPi8ZAFehPuU5L2GF40JD12nhaLVAKwadoz1lBIMksxrj+EnYepFjYeu/ldUYcR4WaAqk0fQhYm+6Cu4e5sqmjydYkyjjfmE3oV1Bem5orAMIpVeUscQrnA195jy2UcpArTv2t3zxmHfol2cnwpQdSmxP2Z+RVDHMl+qiKSd9qC6LjUHsKBjHSwQV9IhFXpXHm1+ZxB9rWZTYB/SGRtqJBDuro9d/gYYxycE9cuKSgAqommQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9317.eurprd04.prod.outlook.com (2603:10a6:102:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 14:53:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:53:42 +0000
Date: Thu, 16 Jul 2026 09:53:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, christophe.jaillet@wanadoo.fr,
	kees@kernel.org, hataegu0826@gmail.com, andrzej.p@samsung.com,
	balbi@ti.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: remove broken string
 configfs attributes
Message-ID: <aljwbddQlYPS_k2I@SMW015318>
References: <20260713060845.3759673-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713060845.3759673-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5166a45a-9e15-4814-6f35-08dee34a073c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	aEZs/+XVMIOJr7NSW61i10QcSNO59LPLp/DJr0i5IFknks5d0GL+dt5CDZxsPRQnE4uHu/f6rQUbxGCSG1Ot3lYmBOzkPebnFpfGm0Pxkc6rRqz2hQaUBvzZk8fuUuSn6S2be2EHxfB1b47ovLae+0L6xa1nMqvg9yFRPaEVWUa5EG8pvyxaKGvk9oWeGg/d2MkHlaJ86UCStsif6TxVZA0pZ0E3DuYX+liI7j36urLHeb5f+GJtRz0Y/J5DIDP5Yr94aTJpvbAnoJFB/A7WrrumpTPXoHJHUU6LKvC+2d90JPOaHIAMo7GKv9t/6zwI1dmPo5/LHm7J9kvTaMLC+lye+gh92bfmTUDVYKu85U+R5vJJsUoDuTp1Yq9oJb5nq/QtyQ7gXFhEy62KlzasQBtxYk0VS8mYweUPb2uGyN5YNQsrPiHWAtdkIx5fX50/fnDbUoLTf8LOi6p9pXPdFChBZk3PhlWWG6Bos0vHpQZANYgS9YB0YeTRPh+ebSHSG1L+SBLXgosWn8ww/ALCJTOWTDyHPL0+EWgdpiBIPpv1WcdgZHi09W6nhlRsY0wS4DMiwJuz5/2jfxdYXMFK65jjBAiMEpaxMC8wqgPP0SmtmUpBp7bZqR95Us8fzXOPlNCfDsPZklDqzU3zCGrgOjnigIAqWhG5Fry584Yh/1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4JZBZ5/pdPfT8MPPacY/5kxJLA0D2Rfiy9pvRntbSluUZQtDckCBDikn3Wx?=
 =?us-ascii?Q?Ga6E6r9Hjd7b+CUPSo12hm93rAMm3/THNxlU9yeGsHHNs2Z4Eog8Wysdts6i?=
 =?us-ascii?Q?QOEaeLWHewl0zDqsHddWF48X4A0+ucbPWIMvSBrtyTBCx0jdD4UYTGBeIxzs?=
 =?us-ascii?Q?nnlZQXbnmQT9XWD0Je/52p1c8WvxUz89v/DopgnR6/00nHzQTOdzSrv4h+Xf?=
 =?us-ascii?Q?juWLZkaVO0BfRDMV/U/MnNP+ghueAkHHm7Nxa6NXG5uv/CGwOi9MhrchxaAV?=
 =?us-ascii?Q?VCaNuookZBxUHjTFTjL7EFoS27KUVwtkLXyask9zESHVWGLg8iWLXWUHFu9b?=
 =?us-ascii?Q?af/TNjwVSJ5mNDQPuRUVAtz7tiRupmI2qSaC5q1YoqlQ7lGvX7naTbQ7wWlc?=
 =?us-ascii?Q?EDMGKmTh053LZ3f9A9wBZuAPAMHjefWU5zCEZmHLZNZ3SgUc/kt897tnUIQw?=
 =?us-ascii?Q?cP6emjjXYXvpAF4ppa2xegxxhcHmk1enb6VRhAs39LTYq98UM3JPMcVYgXFP?=
 =?us-ascii?Q?t2Fl5E2lRB+0LkcgrrRJ0dJ1GRYFkRMga9mHZgbqP1JrSgNw04RrhcN4isx3?=
 =?us-ascii?Q?cpT8Bk9H1TJZicQXhB2VvoRkdvolhen3ucgrzVKdOa2rgZZRL6RwfLdl9vh3?=
 =?us-ascii?Q?v7owvs/yHZGD2iFdCZnh1YdzriS1oDCYnPb5n9kh2VAGTIu2pnYlLLZQ6tNj?=
 =?us-ascii?Q?QVvoTo/RwI/q+5hd4p5m8xJ+yieNSu9cn4UvUCP1s0kzL4V7vw6uw+ZWsvJm?=
 =?us-ascii?Q?k0TjZeKZWblpEHw1wEx45qBoCLiSszA9C0NGILqPF5AFoIHmbBiWbFBE4FiN?=
 =?us-ascii?Q?eN4NxL+wcu8Mbj6u+XGPdpAku31fr6IuvObTRpP6WaVzIHf/07mJGWJ2VEUz?=
 =?us-ascii?Q?UTC8+e7ArshGSawfRmP7k9AWwf21nUSqKJih9b2H8JJsHqUt2KdncactFIHa?=
 =?us-ascii?Q?vDqsyNMh10QVQNkTF5Y603cDMTL7ydrajqIgZ1pKO4271ccuWesNc6QIHg8w?=
 =?us-ascii?Q?xgeLjitmTpk5EF8BCt4E/CFByszgWZN4mGT2mr3fTdwGnQB9oLi6un/BmjRd?=
 =?us-ascii?Q?Xc9rbRHt7WDBx4uJT6owYTPN6y8y+bZYff7mNuyljNLBwbLl9N+cDDCgHkOo?=
 =?us-ascii?Q?kn74D7mpsMOr5kOcG696CZC16E934VijJo06yEgU724SPUpgfeKZZUXKDRZy?=
 =?us-ascii?Q?N8Gs7x4l4mVs3u3ZqDEFq0kTgv6hAnPau0WZ4v0Y53U6pN0xkW+NkOkTrlCj?=
 =?us-ascii?Q?XRWTZiyC9/jayU6LEPEFzKmGUEQ04VFJVI4rtYAYkBosVW+Rn/w8RHJiI8mz?=
 =?us-ascii?Q?aCeUrpogh8eiOpa+RYC4ZMdrmyvybME4/nUrVEgupRM+ISIObxtfhr+lyeZY?=
 =?us-ascii?Q?+cohp+qBj7yGx+iF41qTcb2HA9F71JTHOPqAac2O0Vl/qBTLkG2DxTn685wU?=
 =?us-ascii?Q?MdQyaRePpHQ9wVdIgI4JF0NvAOk+/8JzgfBn2jL3Mxkjcl4oDd0ea8R3mAsV?=
 =?us-ascii?Q?S8JoYUcmB95xIA0mHmlhLb02l8TygoWMo3K0br54026f7HRO6MQi85RZiFQy?=
 =?us-ascii?Q?LJa7amDGz7HKifstH9s8Ss7sor//HVDts3yoajGAVEn/6jM7GgcRhrqdGkG7?=
 =?us-ascii?Q?KQXgM4HJfdb49Nagm+QqRsvNOOcdWHDNjy0vHoyDx2RxziR/RIekcN9OMToh?=
 =?us-ascii?Q?syzLq+N80FU6fkHmuNINYLbHWCuxIpLwDrM8ugIj5eUCN5E99hfBBkkxC91C?=
 =?us-ascii?Q?nS+IuC6bQQAx0lnlgsV2hwq8DKlLYYlY3HNShYYvrytPmkwQkwjM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5166a45a-9e15-4814-6f35-08dee34a073c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:53:42.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikDUvC9bv6ceGCkCvWkTLV30b3vYuXccxlJnxSJhuZz4FMhenGZp6MMlj+y8deZ199T9t+obswicRziiQV6HulQs+P689Uw72d7kvFypoUzAxH7fbQVprUgY2cxFy/Vn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9317

On Mon, Jul 13, 2026 at 02:08:45PM +0800, Xu Yang wrote:
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
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
>  - Remove fn_play, fn_cap, and fn_cntl in gadget-testing.rst
>  - Remove fn_*_alloc variable
> ---
>  .../testing/configfs-usb-gadget-uac1_legacy   |  3 -
>  Documentation/usb/gadget-testing.rst          |  3 -
>  drivers/usb/gadget/function/f_uac1_legacy.c   | 56 -------------------
>  drivers/usb/gadget/function/u_uac1_legacy.h   |  3 -
>  4 files changed, 65 deletions(-)
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
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index a6e8292f320a..4921e5307d49 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -714,9 +714,6 @@ The uac1 function provides these attributes in its function directory:
>
>  	=============== ====================================
>  	audio_buf_size	audio buffer size
> -	fn_cap		capture pcm device file name
> -	fn_cntl		control device file name
> -	fn_play		playback pcm device file name
>  	req_buf_size	ISO OUT endpoint request buffer size
>  	req_count	ISO OUT endpoint request count
>  	=============== ====================================
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index 5d201a2e30e7..3f52099a4fdd 100644
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
> @@ -956,12 +906,6 @@ static void f_audio_free_inst(struct usb_function_instance *f)
>  	struct f_uac1_legacy_opts *opts;
>
>  	opts = container_of(f, struct f_uac1_legacy_opts, func_inst);
> -	if (opts->fn_play_alloc)
> -		kfree(opts->fn_play);
> -	if (opts->fn_cap_alloc)
> -		kfree(opts->fn_cap);
> -	if (opts->fn_cntl_alloc)
> -		kfree(opts->fn_cntl);
>  	kfree(opts);
>  }
>
> diff --git a/drivers/usb/gadget/function/u_uac1_legacy.h b/drivers/usb/gadget/function/u_uac1_legacy.h
> index b5df9bcbbeba..b9ddae550ff3 100644
> --- a/drivers/usb/gadget/function/u_uac1_legacy.h
> +++ b/drivers/usb/gadget/function/u_uac1_legacy.h
> @@ -62,9 +62,6 @@ struct f_uac1_legacy_opts {
>  	char				*fn_cap;
>  	char				*fn_cntl;
>  	unsigned			bound:1;
> -	unsigned			fn_play_alloc:1;
> -	unsigned			fn_cap_alloc:1;
> -	unsigned			fn_cntl_alloc:1;
>  	struct mutex			lock;
>  	int				refcnt;
>  };
> --
> 2.34.1
>
>
