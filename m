Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70964395AE9;
	Fri, 21 Aug 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323004; cv=fail; b=N3TYvibuWlN5LYudFwKDax1pYjWpWctKRZfcIY+f/6eCyMgrcTaymyylf/rbf6NStb5i2gsqqUrmj9K8JWCyH97zAlxKXhJGtSXcueZs0QEhnHrWvb+nUkmdb9HNNVtTEabxPirjmyH+0r85DL/cUQFYLMK+jSvHEQT9IBMuZOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323004; c=relaxed/simple;
	bh=MfrPXhk3mpGNsbOJKShwFZsSAGh2z3Zq7AIFb/n2UlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I0RWSfKYcsncNpe0cB8TW1x/KUDwcSmhVstpFbXrMoskmRLhpj9Lg7FOUoOcbTJKMAF4fHP24SaTpvw+oHrzV52EbmxAnSKoD/6/r/Ia4t+L6RAA83gFS4MA2ySwZz20i0PN2IZsq7B1EE7Rpqyldp8VqlLloDRKvLu0p+F/+sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T4DvrrgN; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T4DvrrgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9qnSRv5e7s5pCw12AE+s1vURuCJPPXsXlZyCzCzRcgAMaHobG+GO5UfsF1CQONtKZmRVHp8yMQaRSn6m/23X0aijNVSWGF2HM1Tkg4nWCaPce4n6duX6aB7ql8rEMa3zfpTQjNqMDFnyN0RN8vpYx4u6mXdL0i/T7/32zEOPMYD9LOvFYEq8Hl3p3uOclqbEjFiCRdHP0oC+ps3uFwvDV9uMuRAuzeqFGVY2OBJCDgtnfZUvPWCNnFvHq/BCocGwW6SI0PeMzloyh5tfbc22IevSNsF7UCMdA4yIGaTctPd2gF6gqmKi6Wv+7tUyHamzeKs89AjfhJp/DcFZiyeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCw6LQ8xkKOnUBwZtB/rTLtiWvUxekwk1ljq7Pw3iVA=;
 b=qyOKkd1s2HZyWCC63tdaFreKP2eSyQcL1+u2wh5a69gtVQJM8PKNQjGcNf1eBOgIufqLXVOIrOUqtawU/8VzlhdJEEX2m4N9MS4ceW5833sd2wLClA8zsRF8oCXFXUG0a6GWdOd/GUFdZCnB2SQwesIj0GfHx2JJrUPu+NahuD5mkSTWqeswrTY1h1napgg9rJW66feu4amISm8y56ZlsAslr08UCvRDtL5SKOhhsJmIP9BO5fmAjfkoNXZaNZWaH3Tx+l6QNqIEUiWJXUaOjg/crK3LQKVveQ31XmkcFCdOGVqvziOO86juBsRxwx0onMHWMjAmvhttoORzZhA9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCw6LQ8xkKOnUBwZtB/rTLtiWvUxekwk1ljq7Pw3iVA=;
 b=T4DvrrgNOQgMcCqgSvuDP0Tuk731CtBX6dpyBqqMGWsVukhN3aetXjpHAp7wBD+aoG3KpyrTikOUy+m1F9UaPyt66kn2r4Dae6SGH+2UBmxLs+1cDnBQwu5Izi3+bKP9YOzhpKmXKHEGSQBjm+9S+dRw/oyyMiWRtOs+LR8JXMY05+fF5WsXdAT6zB/atdLvo2Un/qf3fWfqEU1eKuxa0FS9X5zKZkVarEydA07d/YyTZ7Vqf7NAg9wCzOZhThnsCnG6+aIJuONe5ZkFgTHo7jpsbIQkJQ1vCkuq1b/H0c28u98QLq5AvysYeTMmeI2dhE5XGOLzDp9XbEwRUVItjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9634.eurprd04.prod.outlook.com (2603:10a6:10:31c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:36:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:36:40 +0000
Date: Fri, 21 Aug 2026 09:36:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kai Aizen <kai.aizen.dev@gmail.com>,
	Michael Grzeschik <mgr@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 2/2] usb: gadget: uvc: refactor video cleanup into
 uvcg_video_deinit()
Message-ID: <aohib0yXT92apzfl@SMW015318>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
 <20260821-usb-uvc-fixes-v1-2-80e6e279523d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-usb-uvc-fixes-v1-2-80e6e279523d@nxp.com>
X-ClientProxiedBy: SA0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:806:130::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b77e261-6182-4577-c036-08deff919cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	F4+HCAX4tUKOLccrXxc4O3ztg6avPita3DKXttmn8izWcFFrqGkznDBoQEkWVjxkDD9ubvcHVLAcHJnt2CQaisn92hoa4YINncRpumD6GHyK3hWJoyt2xbY072iQDcLzDeXUWtemgchPwQI47gsNys4qguwBwDi+2ioLfCJx0DTxcAV79TTKggwWEwqiTxiPXA0xMGFyEg9J/thiiPYZftHBv2MMoXDGxwOZNcoX00p1ffkCG4+aG9pzumY2ILlZJMrTKmArji8LNwrESTVtTD8SZ+kU0oBHIvaqq/WqFmdP/HbdMpA46YvNOXTsX+8qAu170NduQ2kAgVv6N7LbmlBTOUBu8Y0NUyD8EDdHqZnFL4BwR9vdZF910l9NNQayhv5w9SjkAS+h2wuPez0Vr4CkItFvLOZKxkPpvMdBUryyFbqMfHRFi9FZigFWZWvHVK1b9bNKfh3NzgjQuDbOSMYAfdA6A0udtxaKkFa/E9DMVMHrl+Sk5Odw68T6By531GkHV9GhE9j3egZ8lEFVyonEyTeILgf0GSac0VcfCH3aGTAkWsaLZeDHnqakONXiaKCmsSTBnj8/Ny8v9ChiWSSqrrjfzp/TyRGg7xqF4G0AtReM6MOYNNp1u2OOyiHPv/phcLn8x6kKvtH8ODkIOyZ73LXk/4ONbxRaXIzbzeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLYjH8SR3iBsOjS0oF1vbgAUE/EyITB0DoVEuDSoOCIdIRnqNKfuFH+b5Fp0?=
 =?us-ascii?Q?FQazQKW39dmcgWzgvKvq9eBFsESb7Iyw2Az2QLVbHnm0JKt9dZ1rnvFQ+TUH?=
 =?us-ascii?Q?daT4RsxrxLQBD1AQ/5FHoip8CUzUXjG3J9MJCY7K/UwCtq51UoyZwsejzdTt?=
 =?us-ascii?Q?kVR4GEctUmrlKg0DixmXhsZIyrNZPGk/e8xt2F2OJbNaFPvQ+MMrJjQIgdrw?=
 =?us-ascii?Q?gvM8JGrhto/DljLTCbnPMn/tUTf22N5p+3DwynuFmIigyPPfvYmj5siiHqn+?=
 =?us-ascii?Q?Mdj3f0hcuR62VC1ZsuQXoXD6LrpH1bVf8ckYT60eKycfIk/jtcatoDLbjcy3?=
 =?us-ascii?Q?rVHdG/yfoyE5639oVOWuouREARUtNSOowHUPIvBtcZUhaUYcLmyrpd3ZTwjk?=
 =?us-ascii?Q?rqjYT23R05QGXRX71jQGSKKn05wctY0CzSO/77rwpImXDvjd2trzqegG0JHb?=
 =?us-ascii?Q?whYu0kI29m5UDfpf/kc9zR7I8oyFVD8pHkzIxKjWfTEeoKufU/4HFtCnZ6ZQ?=
 =?us-ascii?Q?ZVuCOP8pcX9xhSz8YbUBSoF/CCi/CGJ2XUCRt6WA+Cwy4g9smEdL0EyFw7Fo?=
 =?us-ascii?Q?uI1qU0uySjTkJm15JM+KmO8BAXEG1lUgJY9U8FinW/+Ny8BHHzP4E7zTZR5m?=
 =?us-ascii?Q?Cy4Nt4mcr9K36ZhnQgzzsxabLK6DXozWdiQteilfRAe1sTIaaSH1AC8j4pqM?=
 =?us-ascii?Q?/QsxoA0PkOmOkFLhlSqKZFVTKd+5ag3Vr+9iQ0tS6yayPpz2WWgI3JjYWJYf?=
 =?us-ascii?Q?rjrR7qcGm7WWTapoqZfvGbCJcHHoYm6ietV6o5OuaCw27295Fbbfz/XF3lXD?=
 =?us-ascii?Q?tnkSHllVnebm2QvRE4yFO9im7pLZ6TS4FPR8kprLqXmnRK12EWOWIOpZ191p?=
 =?us-ascii?Q?Z7mXJlzRULuJGxQ39COe4u3AbN6cksIucrK8NSK1WbAqtpFG57/2b+Sw2858?=
 =?us-ascii?Q?Y5rQXyeNQN++x1alFyKqYJ/sBaiuUU6gaMr37mg9F3XyRmVQOtrHSGKX9hA+?=
 =?us-ascii?Q?LYJC5NqYijzjAC1sWzw/hbAPmsSGkQGDU6/XhGKZeeGUDQfrSVL8GAFM/1Tn?=
 =?us-ascii?Q?cIa406OAKrJX7wBSaGIS7Sk9ldHJMiVO25aNmb/tUM2RvYkSSgxlbyl7bAq5?=
 =?us-ascii?Q?bdjcBIBBJNqZd4zZhiuoAOJe4BTmrglGxPpnoIF7OA/wV4P/Qf3Tmn+4IIGS?=
 =?us-ascii?Q?LR1ZyYu1FdsAUE4GbyvU3PNgScoVbz2idShPDTffJ26qAMVWL90156SpI1C0?=
 =?us-ascii?Q?ZTIyzWfovebpYTgwdi5eL3ziykEyixDhGm2necNqWvJ8OywAhQz4GgJDYYLf?=
 =?us-ascii?Q?5rDjxGZoBngNDqzdHKzl48OBIQiqB6v6kpVRCOaydRFEKou899Aj+s3yxRbb?=
 =?us-ascii?Q?a0i5ELx7G7hEl66xIZwHGExcf/dSgyzamlZnAq8qjvXaz5D+iIz5iLmFJe2/?=
 =?us-ascii?Q?PR5ybbvpLepgb8k4AumgPDUSwdSnmXgjuokmjzt1lfSEvoS0v/SpKLWXToyj?=
 =?us-ascii?Q?kDweTCMX02DltCjAQwJCoG6q6SnemIV4i14m9ohrUCPhwuH28qDsOiXFQR6A?=
 =?us-ascii?Q?cEx0mLhOSo/QNSp1bIyKa0KqO0GCJAq6NnmxHRvhQy+ih9jKjW4R+FntGKSb?=
 =?us-ascii?Q?sIGZ8pMuIwDBdv53jMzMcQ7CAsW33BMpkVpOYSw2EYJkdtGidc24eTH3jCvt?=
 =?us-ascii?Q?qpWx6YbXxQJtcKKfoMRAzyRgsly4xfhJcHLUOdqUq1jIRMx/jeMl+M8EDOCu?=
 =?us-ascii?Q?QmUKAWO5XK4OmC9K1wCOl+13BOfbj1W0L7rlbv2RCOXgZXgzlJ1Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b77e261-6182-4577-c036-08deff919cae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:36:40.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvI2N+kriZrMvIo+poQH/1y3NnZ731V+BAfGg7BY2tz3tvc3yVycdvcHoJtnSRy8JJIlKhJWfggcHX9z4n3qKLK32doRsGU6eE+XsgnOUTDvC9ZJDqVExF22wP7v9ZfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9634

On Fri, Aug 21, 2026 at 04:22:37PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> kthread_destroy_worker() was never called during unbind, leaving the
> UVCG kthread running after the gadget function is unbound. Also, if
> uvcg_video_init() or uvc_register_video() fails during bind, async_wq
> and kworker were not cleaned up, causing resource leaks.
>
> Both issues require the same teardown sequence: cancel the pending work,
> destroy the kworker, and destroy the workqueue. Consolidate this logic
> into a new uvcg_video_deinit() helper and call it from both
> uvc_function_unbind() and the v4l2_error path in uvc_function_bind().
>
> In uvc_function_unbind(), uvcg_video_deinit() is placed after
> video_unregister_device() to fix the ordering. Without this ordering,
> tearing down the workers before unregistering the V4L2 device could lead
> to use-after-free on video device resources still accessed by those
> workers.
>
> Fixes: f0bbfbd16b3b ("usb: gadget: uvc: rework to enqueue in pump worker from encoded queue")
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/gadget/function/f_uvc.c     |  7 ++-----
>  drivers/usb/gadget/function/uvc_video.c | 15 +++++++++++++++
>  drivers/usb/gadget/function/uvc_video.h |  1 +
>  3 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index a4fb2790f4ff..fa2f9d0e4ce0 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -879,6 +879,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>  	return 0;
>
>  v4l2_error:
> +	uvcg_video_deinit(&uvc->video);
>  	v4l2_device_unregister(&uvc->v4l2_dev);
>  error:
>  	if (uvc->control_req) {
> @@ -1028,11 +1029,6 @@ static void uvc_function_unbind(struct usb_configuration *c,
>  		connected = uvc->func_connected;
>  	}
>
> -	kthread_cancel_work_sync(&video->hw_submit);
> -
> -	if (video->async_wq)
> -		destroy_workqueue(video->async_wq);
> -
>  	/*
>  	 * If we know we're connected via v4l2, then there should be a cleanup
>  	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
> @@ -1048,6 +1044,7 @@ static void uvc_function_unbind(struct usb_configuration *c,
>
>  	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
>  	video_unregister_device(&uvc->vdev);
> +	uvcg_video_deinit(video);
>  	v4l2_device_unregister(&uvc->v4l2_dev);
>
>  	scoped_guard(mutex, &uvc->lock)
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 9ba09118bb74..002afca9141e 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -841,3 +841,18 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
>  			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
>  }
> +
> +void uvcg_video_deinit(struct uvc_video *video)
> +{
> +	kthread_cancel_work_sync(&video->hw_submit);
> +
> +	if (!IS_ERR_OR_NULL(video->kworker)) {
> +		kthread_destroy_worker(video->kworker);
> +		video->kworker = NULL;
> +	}
> +
> +	if (video->async_wq) {
> +		destroy_workqueue(video->async_wq);
> +		video->async_wq = NULL;
> +	}
> +}
> diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
> index 8ef6259741f1..6c5481f107f9 100644
> --- a/drivers/usb/gadget/function/uvc_video.h
> +++ b/drivers/usb/gadget/function/uvc_video.h
> @@ -18,5 +18,6 @@ int uvcg_video_enable(struct uvc_video *video);
>  int uvcg_video_disable(struct uvc_video *video);
>
>  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
> +void uvcg_video_deinit(struct uvc_video *video);
>
>  #endif /* __UVC_VIDEO_H__ */
>
> --
> 2.34.1
>
>
