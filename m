Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B147CC67;
	Fri, 21 Aug 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323031; cv=fail; b=dlabq2lBOkUmVZYbUS31JXURih3zSc/X1WUFgDtjl19UEUtGsWTBPJIhjeqBQxfZ7IiQjt/7vsrZbpRVoTp/HbyYK0uUyyWBgbqTkTGMx3plyEh+x7mX4RyNe4LmyPDdwVAT77nU1liOPgaOmQE3zSA1MEhqiLcCiqXj7tTlHP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323031; c=relaxed/simple;
	bh=7qRgZsMMQ1X4Ywz4gsitFxr4rFM0N8gFpO4PpZGnrbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=algu+/6yH/kibBPBMJm/6UWZKewMgB0BYOus/PLCJpzxhEfGXNW3qPXVSUJ3DzIyjjW5sg3NpyWuSetn8C5BtYEO1NTVA1tA5YSOrcei/OFXDISJDYptkuGJdAcMPfUC4kdbdQGI9wkVhQJlEWI+q9R4TMlAcFDNPb2EM8/o00E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uz1Jc5rr; arc=fail smtp.client-ip=52.101.83.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Uz1Jc5rr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPwUOqIdQ4TViVtLCbRgGN4JnHc1TvrMOxMeUfMefsAQaUF5HnZIoXwL/bCDKMaparJq2P/YpG4+01osfIim1iR8A8O8BrDvca+2akhKS0rr9V0tyzE4I8CRFl7ib9X3XbDQt1XKjRPln53LvogiG6acMhttKlUsbMenfRqpPQoqF5o82yAOWSmdk2VtVDF/RqAyEZsGf8wCasDuJkFQWWdsfIY7Yb1Gjqt27zfT4vqcJvS9ObmF7auwtYk3QDS5ZoIHCdEUOkw+5/23g2KNahVJFYU0wZ5Iy/CmrP04tkwFmcBzNET6qPNWx5UA5bZCRajBKZUNj9ANA2HaDvOy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk3sAGUl/1bew7XTBMNaH+hIbZ1yV06SoOwjlxUAfbg=;
 b=edp2X2uW74WdOV62flCNMtxn0RA/gnOZCrN2rJ2sqkfzIjBV8q/nKJapbinCQ6HIlL5ra5kbM/KV1cKAr+RhcEHC81g2eSK6F1l9yGtjlbHixZj8xM+Rx3HGqoLah/d4y/esZGZd++8eBf4KA550dAi5tYVy/pbmW5Q5NDSOqEkhQ+b1ckbS0sl/1kfiIn7R6WqLfeiviaybtN53ckNYo37g+bq/bw7o0aSYhF97r3iCh/825aUudWje89BjFQaubCp+Nc8q+b1obT7u5R17YihM8txEQ8MAin4LIEoWZXa5U7+Z1//w7DHNZJAK238Ai21OeQVhV0ubgoBQhl5q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk3sAGUl/1bew7XTBMNaH+hIbZ1yV06SoOwjlxUAfbg=;
 b=Uz1Jc5rrvDk40tB56lqhd6JOfiTcw/62BHDuGU8/5vid1jf9k70zVhzT/TqPpZiTWuqQuWgWKB+18jn233MED7oAOioGfZlX6c6d6RdDVSsABmIPWAiO90NlU7anfFPddL4hblVyn7+Xcl0RnzRAVPlbzVsTNW4dfP8uZeolXXTJjz/H/90OdioFp4xU3am5usK0RTGPKQoq+vJ39VbxMsSAq71OKtuDv0C99ASPkIFN3Bsr7LoVG0qGVM77mx79efv84rb7rWEdTdSOMSA7XOcGCOjw/AUxocd3kVAPjwYUysd/j+lO3kutVXjaxS1tt73vMiuO9PqaDNuHELvRmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:37:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:37:04 +0000
Date: Fri, 21 Aug 2026 09:36:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kai Aizen <kai.aizen.dev@gmail.com>,
	Michael Grzeschik <mgr@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 1/2] usb: gadget: uvc: replace mutex lock/unlock with
 scoped_guard in uvc_function_bind()
Message-ID: <aohiiQXRp5QnX393@SMW015318>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
 <20260821-usb-uvc-fixes-v1-1-80e6e279523d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-usb-uvc-fixes-v1-1-80e6e279523d@nxp.com>
X-ClientProxiedBy: SA9PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:806:6e::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: a4422fd0-664a-44a9-8127-08deff91ab8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TIP3j2RMjPrDlVpGe4PXKXK5F4LXV9ngdYVQ/abJTvhFc301PdSP5xVQ/XVsFxU89d8nrXuXXIHbutXgOy4DnhRINgc9c3wP3sHaWcY3Yn0R+3zn0UfkD2i6VhnMtJTTj+XJQicr+bmDOj0W1iU+KRM9WKJpsqAWZgiQeFaewrBOpyihv8xJiogMs805l5Ubi7RXjjhGNv4kDoyFwUgLkJb7GFuf8wd076lt1UWq5Fa6lGMGp/I6pe40vhv24zmOVnXkfmU3sQeF2q5otY2HX5GlZGxSH+NET7ksAL5bQPF0nzXTjXXjd53CYkGQZhqG4O2Ol4T+H8ctuBAFlHSfnzqPUFzSBAK7ZKdwp5U15i4cVfA8eeVkpdAHQDObrqyJRmKrnC81AfiCvS4cnIaluDoHSftTNTHVYSAx93/TMapEJdMm6Z8QoUABDWg2WaSDM/RjtAbLtxfPjwfkBzIRwUu9xjzy45mGDSRAkOvLcr+9r0/W00RtihFHkvaJ4mZEy47Mw0nYhs0kXHY9lzE+4kcykwjwFTEizXBb7kys3wdT7jbrfnahKvkK+NvfIGUdjK8Weh9I7BBesFna0AfgsOzhQuCBRoDixqu1IF1GnN5a2sHUTlumHSwF1F9zSITFktZRWXcGYs6rHQFL6OeL5GGETgcehSuYgAxWoOUxU4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AJbKUneS8wD/FukcRx4lmK6kiVB3VyU4q8e/TtpqOuOnHeL7Kijtn382weO3?=
 =?us-ascii?Q?Qm6JUxjyLltM1uvN9ivk1txXhD9JUhi1wQn0LZ984YzMutplwmRJ9KQYVGnv?=
 =?us-ascii?Q?OXT7s4jdXri3e2QkO/Knx4znNsX8pNIWYjzawVGJkbrQ5zqzC460L+za7NAm?=
 =?us-ascii?Q?3gWlDehaz9c8xYUI4vfJJ87sKoTH99lkRJXQnNp7qr6sV9umfZrsPwi0O0GY?=
 =?us-ascii?Q?sUlrY8oRDbxL7Zjs8SyaY/OUPXPRjqyKyHRuPy+QQ1uiC8IZnjOCuunXa5fR?=
 =?us-ascii?Q?gzvpyWRqsr42xV+mGJmR5BFaE/yCk+NZGexFuYNs3H7DvRKS8Yw6XlBcGH81?=
 =?us-ascii?Q?2p1iK0YRLRchGXr8m2EF7PxcIdJPcpYrDWom7Rpeb/JTRTAMn0P0WT/rD4BL?=
 =?us-ascii?Q?y9JEOdfAFU8/kq3CFiCFLVbgy9jtow5ShXLsTDEyQZ8BpnduZKu3YYq1zsKB?=
 =?us-ascii?Q?EXv3mBIadJuZ3WSlpTTu3EziRJg8WOPDkL7gSD4OONT0lcnRukyncbHVGfN3?=
 =?us-ascii?Q?SwPJFGQ99AI+jvraMvaI4ddQzbo4lkeO3uRLDgTbJwoX9/J4RwHs5yhrIfyq?=
 =?us-ascii?Q?FWITzQiDb1oPJRdDgm2Lh9qAwq2Zh81nbLzQF7CQ69v8uLYvM6BSWCLa+YEi?=
 =?us-ascii?Q?4jlWLSIjzncg4luHmw+ws1o6JK2Evr9/JsHyPDPfhS1qFm102XLC0JaEfzSX?=
 =?us-ascii?Q?n1bVNkvfaKP+w22D9LDZ0KdeH2cIxicZp0TxyC50X6qFMQejjJvAdZ3bJYG8?=
 =?us-ascii?Q?Yz9BBT8VREQTR1s/aauiMdRm2vkI+ChSR92Q0drBwPI3wR+B+/xmVDx9oGqA?=
 =?us-ascii?Q?P5ig3747UDyZLdsANoq9ybpv5S6L3c8BEzk4nEYwF+cPfDGEjHhO6JJ0+NrP?=
 =?us-ascii?Q?HZ09jEfIYYkjK3G3kyE0ORK7cIGYbHLqeAHToVjwgSR71nJmmQgoT8kYyQFr?=
 =?us-ascii?Q?MCdtZSi5UymfpqMtQUQeqsGkd4tSPn5L6vPyCDR99BGyX/X+Qu8potepltwj?=
 =?us-ascii?Q?2K+mxQrakMpRXMEJcm22WJL4lhG+/wVhvAxBdR6Zy+/I0/vg5BcT4cJbUbYe?=
 =?us-ascii?Q?/h9SaD9iiwvHnfwf6iFuj6EWEx1X9cyihqtU+QLQ4RQr07j8GJKB370fdT7D?=
 =?us-ascii?Q?ZUUbwzhYOnQsYPzaM4SKzE59XhEyj+T0w2jzibhswLn/IHzeiGNaIwmK6cYr?=
 =?us-ascii?Q?sHxgotezw8cUvRWth2zujU6E5VS2ZmMG+UsTBPUE+BNMj4QE3hsrN1t/yaRJ?=
 =?us-ascii?Q?CF2WDetjlEdvkxLziDzCpHefyAhh5+QpX5SNV1sPJqzTQ9vVAHIw7O6RyDFh?=
 =?us-ascii?Q?ETSAaLv8tyHO1RHGY7noyXCyOFvkSPdxRBnka2cJl53UoMvveNYaKhsxOMAF?=
 =?us-ascii?Q?EL+0tMxSYwOAviJ9RtArFxBfzUlPOOQhToUiKj8vAvo7bt0zR1jOvtgBs2Lo?=
 =?us-ascii?Q?A6sE/CUawHknNLeWrnB53CV77Uog85zDCgdwkSED/w5lvfWEQMXQhdsV567Q?=
 =?us-ascii?Q?/6AQcHFug2q1BulWsxlol6RnQ1oCr/FLKc/J+SgesKMftj0/K/4pkjqtb04x?=
 =?us-ascii?Q?QUWzGiQ0A6l+SZRR7TXva44q/yE+5yenz+AtoLhOPMDKsU8OjFluLL+5ukgJ?=
 =?us-ascii?Q?0DIj6+r8uWF+CpuSnC1hz2UIMfzDi3Gdd+gRAm07SlVP9sICvhQz9lvAKP2a?=
 =?us-ascii?Q?IYoPphJdCgLJE9fnCPTqqu/zIVWow+aYvy4bej+SInI60GrXo/bIMJmpM1a6?=
 =?us-ascii?Q?66GI1Soytj89FGh5axFvMHS5yGyzGeSRWh1nicQgl61bIVSpJKGU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4422fd0-664a-44a9-8127-08deff91ab8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:37:04.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD2aaiTnz9b0UwmfALgk/noBKcMsLQSJRmvr6S/n6K30ipwZAjfYgELiI0trrGohVjNMdFnBr7LLyDwYKwJVoHpKjTTANKHFtWBNS0iIwY5/VDD5hQn//bkdj1O4APl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

On Fri, Aug 21, 2026 at 04:22:36PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Commit 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks
> in uvc_function_bind") introduced an error_unlock label to release
> opts->lock on failure paths. The label is misplaced between the return
> statement and v4l2_error, causing it to fall through into v4l2_error
> and call v4l2_device_unregister() on a device that was never registered.
>
> Replace the manual mutex_lock/unlock pair and the error_unlock label
> with scoped_guard(mutex), removing the need for explicit lock cleanup on
> error paths.
>
> Fixes: 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind")
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/gadget/function/f_uvc.c | 80 +++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index d1bf3ea75197..a4fb2790f4ff 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -768,23 +768,17 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>  	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>  	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>
> -	/*
> -	 * Hold opts->lock across both the XU string-descriptor fixup below and
> -	 * the descriptor-copy block further down.  Without this, configfs
> -	 * uvcg_extension_drop() (which takes opts->lock) can race with the
> -	 * list_for_each_entry() walks here and inside uvc_copy_descriptors(),
> -	 * leading to a UAF on a freed struct uvcg_extension.  See
> -	 * drivers/usb/gadget/function/uvc_configfs.c::uvcg_extension_drop().
> -	 */
> -	mutex_lock(&opts->lock);
> -
>  	/*
>  	 * XUs can have an arbitrary string descriptor describing them. If they
> -	 * have one pick up the ID.
> +	 * have one pick up the ID. Hold opts->lock here to avoid race with configfs
> +	 * uvcg_extension_make() and uvcg_extension_drop().
>  	 */
> -	list_for_each_entry(xu, &opts->extension_units, list)
> -		if (xu->string_descriptor_index)
> -			xu->desc.iExtension = cdev->usb_strings[xu->string_descriptor_index].id;
> +	scoped_guard(mutex, &opts->lock) {
> +		list_for_each_entry(xu, &opts->extension_units, list)
> +			if (xu->string_descriptor_index)
> +				xu->desc.iExtension =
> +					cdev->usb_strings[xu->string_descriptor_index].id;
> +	}
>
>  	/*
>  	 * We attach the hard-coded defaults incase the user does not provide
> @@ -795,7 +789,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>  				 ARRAY_SIZE(uvc_en_us_strings));
>  	if (IS_ERR(us)) {
>  		ret = PTR_ERR(us);
> -		goto error_unlock;
> +		goto error;
>  	}
>
>  	uvc_iad.iFunction = opts->iad_index ? cdev->usb_strings[opts->iad_index].id :
> @@ -809,50 +803,50 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>
>  	/* Allocate interface IDs. */
>  	if ((ret = usb_interface_id(c, f)) < 0)
> -		goto error_unlock;
> +		goto error;
>  	uvc_iad.bFirstInterface = ret;
>  	uvc_control_intf.bInterfaceNumber = ret;
>  	uvc->control_intf = ret;
>  	opts->control_interface = ret;
>
>  	if ((ret = usb_interface_id(c, f)) < 0)
> -		goto error_unlock;
> +		goto error;
>  	uvc_streaming_intf_alt0.bInterfaceNumber = ret;
>  	uvc_streaming_intf_alt1.bInterfaceNumber = ret;
>  	uvc->streaming_intf = ret;
>  	opts->streaming_interface = ret;
>
>  	/* Copy descriptors */
> -	f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
> -	if (IS_ERR(f->fs_descriptors)) {
> -		ret = PTR_ERR(f->fs_descriptors);
> -		f->fs_descriptors = NULL;
> -		goto error_unlock;
> -	}
> +	scoped_guard(mutex, &opts->lock) {
> +		f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
> +		if (IS_ERR(f->fs_descriptors)) {
> +			ret = PTR_ERR(f->fs_descriptors);
> +			f->fs_descriptors = NULL;
> +			goto error;
> +		}
>
> -	f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
> -	if (IS_ERR(f->hs_descriptors)) {
> -		ret = PTR_ERR(f->hs_descriptors);
> -		f->hs_descriptors = NULL;
> -		goto error_unlock;
> -	}
> +		f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
> +		if (IS_ERR(f->hs_descriptors)) {
> +			ret = PTR_ERR(f->hs_descriptors);
> +			f->hs_descriptors = NULL;
> +			goto error;
> +		}
>
> -	f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
> -	if (IS_ERR(f->ss_descriptors)) {
> -		ret = PTR_ERR(f->ss_descriptors);
> -		f->ss_descriptors = NULL;
> -		goto error_unlock;
> -	}
> +		f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
> +		if (IS_ERR(f->ss_descriptors)) {
> +			ret = PTR_ERR(f->ss_descriptors);
> +			f->ss_descriptors = NULL;
> +			goto error;
> +		}
>
> -	f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
> -	if (IS_ERR(f->ssp_descriptors)) {
> -		ret = PTR_ERR(f->ssp_descriptors);
> -		f->ssp_descriptors = NULL;
> -		goto error_unlock;
> +		f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
> +		if (IS_ERR(f->ssp_descriptors)) {
> +			ret = PTR_ERR(f->ssp_descriptors);
> +			f->ssp_descriptors = NULL;
> +			goto error;
> +		}
>  	}
>
> -	mutex_unlock(&opts->lock);
> -
>  	/* Preallocate control endpoint request. */
>  	uvc->control_req = usb_ep_alloc_request(cdev->gadget->ep0, GFP_KERNEL);
>  	uvc->control_buf = kmalloc(UVC_MAX_REQUEST_SIZE, GFP_KERNEL);
> @@ -884,8 +878,6 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>
>  	return 0;
>
> -error_unlock:
> -	mutex_unlock(&opts->lock);
>  v4l2_error:
>  	v4l2_device_unregister(&uvc->v4l2_dev);
>  error:
>
> --
> 2.34.1
>
>
