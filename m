Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D281F233927
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752942; cv=none; b=a4oel3Ml6YeLEnHICfTcNhiLeiXrlM2sM2FcUxsmPXa9cfGAbTXvT23QVbBbBFLgP/ujGbkIUgMGl/h5TJuI3ouVyX5dnzzHE7NR5egQGUF4qHgzJacRl5WZ58BLRtHGNRJe8A1SkX+syE1D1wfQ6bhp7HBCSQGpPX+YhL9+VX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752942; c=relaxed/simple;
	bh=qNKnwJPuqwLilA+ovzJXOTGM/D5oGwYRXasYDd8U6aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZOjccTykkJVc6mnMeCx2pLGNoukIqj1M7c+vCFV8ih2nmzpZ0ut1VFttmU+5S2KF9cHWiuzg7D3QdGvFfjQWDam6fvghW8J1uDKwxVyauTOBFH8grqFQRsp7QCHLxM8DzFdbbJRt2/d3qKVZDiIp9qrRopxxRliXanECefsj1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqmQYb5e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqmQYb5e"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf258aba12so807615ad.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752940; x=1782357740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imswksTyd/yb91FWjRyM4rerg2GhmS7VPu2V2CljQ9o=;
        b=aqmQYb5eCh4wu1TDVpVCJIvVGhFYtOooMjgzoaJHhbohB9evvVBEFfoaB3TwbBEZJK
         00RPj0CmICsScWWd/s8yBNPBcfG5+c/ZCg4Gp2djzjWTpBWu74C/rTcLwwbPqOaezB36
         f8X+kuEpaaZla98GihKRx3tlKIkAsNlLNp6WOHwAhqj8y7m8y8EkMPlSA2e++jxi13v3
         3DVmOxIGmsdiKsLToDqcM+aY3QDUjlU48W3pmCE8pfRUe/1RnWnVouv3Kj3lqJQF70Lr
         QzUpAjWxp9UgGpnvhZLh6boQfl7DaVzHMsvUS3oWtXLsFlwwwuyM7vfVQnAzPL6RHDhd
         SNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752940; x=1782357740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imswksTyd/yb91FWjRyM4rerg2GhmS7VPu2V2CljQ9o=;
        b=r1zLgjcdxUhWx5yJh+K3iMgF2pdNfEprlvXGSMAAAZO8UXmiHzXmhVzYVMhVKNbyh6
         Exl8YMHIZtH2LQHAw9JuHjpP3hEm8Eoa3HP9xL7JUko/6L0sBC2Ez9PRSjN6POgsiI6A
         Lhq1tIWq0fQQm47sT6P1dhSYthpXjrN0icC+T/hKW2Rh2P5oZFk11Lb/rivNYT36VKSQ
         s3L11s+0FAPI2Z387AFB+tW46cbwc3X4cqlq583VFBr2rt6OlceXaJ311T8+cExDkTfB
         QCfX3pHwP0tELAjFdbwatzAFhO13L7keLPos+LjjOIGKxDSVGrjfcSvZXF/q/vdsJinX
         TZfw==
X-Forwarded-Encrypted: i=1; AFNElJ+8vHHNX1bbTYI4E2ZTeQyOS3aFHuopuK1uvhKpElyDZ6M8MZ8ZlgBMQ8hzN5e3HQVRQip1GQxHS88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+d4wa3SCJA4XUPu7s7vXVOXXF8khuWOmDEkp8bDAEbzPImfR
	/ULnTCO2NE/YRrxh9lopum55eXuUWRrIusHKAzDtjVRFJT0WsTZbgFS5zY/ZePXYKEo=
X-Gm-Gg: AfdE7cko/qGlL/bsH3nvD/dFR9CXOC16UczsUn4Ju6LoSqYV/+923e7kdhy+U+KdVdW
	a2KJs/VyTbLlao2IH9JlikEJBtyIVzDc+ElMXdAuLpVJAyNv3q1fB0A63V0MbPjEHJMunetFsI2
	BpCWGvVtarjsw/ClnS34LTIsJTAq8xmFOYVOOUhgo3EGHpKYiklpDjYVe9xpyQQvlb78VDozrai
	ekEDmFGxrYCrTNj8XDCZpjyrnKEWyEw3V5tseFKsURYIqJGL0SLmu9VxyFO5TT4sUYvtCFB9ZDp
	ab3Gaj4Kuon8Pc0EhO9aK9nfZM5XJJBgt0rhXj0u1iLSHB9/TZ/VZitqA5U4Uw9ijnf6GRKdZed
	AY+NY8su/STbMOOw5eCBQ2g1+zcnxp6FDZ/sGeYeAX2fyBlNG10HTym/ysX4SV5M0aOuVA19xyw
	IPboOuAja1v8sbDSvEM/a4ySxdzQ==
X-Received: by 2002:a17:902:da8c:b0:2c6:abaf:860f with SMTP id d9443c01a7336-2c6bc2975c7mr33035975ad.7.1781752940287;
        Wed, 17 Jun 2026 20:22:20 -0700 (PDT)
Received: from [192.168.73.71] ([1.46.147.252])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2c6a1878493sm63150975ad.81.2026.06.17.20.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 20:22:19 -0700 (PDT)
Message-ID: <2544c706-8d3a-4d58-bb4c-b471692439e4@gmail.com>
Date: Thu, 18 Jun 2026 10:22:04 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: option: add multiple VID/PID
To: yangsizhe <18392868223@163.com>, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618014917.11383-1-18392868223@163.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260618014917.11383-1-18392868223@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-18 08:49, yangsizhe wrote:
> Add the PID and VID to facilitate the binding of our company's module
> 
> Real name:MeiG Smart Technology Co., Ltd
> 
> Signed-off-by: yangsizhe <18392868223@163.com>
> ---
>   drivers/usb/serial/option.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a34e79cfd5b6..e7025e0fa3b0 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2458,6 +2458,24 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
> +	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
> +	.driver_info = RSVD(4) | RSVD(5) },
> +	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
> +	.driver_info = RSVD(4) },
> +	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
> +	.driver_info = RSVD(5) },
>   
>   	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */

Hi,
why do you add a vid:pid that is already supported by the driver?

thanks
Lars
