Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206680;
	b=umB0GIYQvKucBCH72jMmA/++bHu8fDRdNXTiJby9a1GqitEA4eFsAcB9XxIJDnWsnEGl
	 erytxBd/Hb5rky3igW/8BFlRIoVa7wC84bST73bJCH+JtNFUzRPZgod9SNLfz3akUubt6
	 iKLepyIFWyHJhpwzZFuSHE97Z1sVSdVou7x/9PjZibOOywiAmNgiZTa7/pVDPedJPVTsr
	 3ItjI83Es1it2SxYg2bdy2LZEKtlUUfy0i6ihtW4qwcow23MgR5UokWnn+mdUOHFlBYPb
	 Q8in9j03sgX6ILmA0f0i9mB9PxeO3v9oj+Qe9usnedrtLUk/OjPLsZDNMg1SNYk3eeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8CE7S5SK9xFhK1RQecJDej9HNZ37TYgoe7wvWcI7AQs=;
	b=oCVmDRue3SCYVBzvOjtHFNo0vc9WYoMMo1mfz97NHi01Q0xuKoTjkiKBATETY0a9ngVd
	 2o2uZ37q8TmpwZ9ELZIbPWTy89C1SpVAlgTQ7HlkGATls+VV2HALLzhtyKPmygXoYfzCO
	 pMYvjpq7nn3TNIQ8alP4ubHGv/CzpNGvm8YZ0ahwP2bfxJtlIFT5rLUFtZDgumE5e4QGt
	 p1pOmp033haNzFGBakkIppoM94ujilKfPtxfbAU5CShap2hGSFrIVLHLxY+pj5obEFvEA
	 foVr8X699dQG0+YiwNcgGinwVykwCqUIAqgu6oUj3rtvr8URlMqwgsTzFKMAA6ugeZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KqJsdIxg;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E638606A337
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E638606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KqJsdIxg
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716b58a4365so832024eaf.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795206677; x=1795811477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CE7S5SK9xFhK1RQecJDej9HNZ37TYgoe7wvWcI7AQs=;
        b=KqJsdIxgtQdXJSsFpLxI/C+6g2RZsNoh95Bx44dViI1nogOQsODhYyo8bbQwrFgduz
         TR45KjNOv8Fy3TkT/LDgyUMQyYo0dHG0RAAYWQRowliioOPi3wla3COAiuJbcPRd2LO0
         cKyKo4wugA9GxcmsTTD4yAx2wt1lAB21f9UBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206677; x=1795811477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CE7S5SK9xFhK1RQecJDej9HNZ37TYgoe7wvWcI7AQs=;
        b=t4cxciS/+eY9hX8p2H5x7hPoeNdDckYPN8hYvnRFS5UIhdB6YEqlbn6rokM78TE0ur
         GeVwB2g8qbh5wcU7pXGKjLgPbkb1WnYHKbn+wU+cVVxW4R7OCjg/T2woRcXL6sECgS0/
         axp4aa78DafdlbUbOarZ1ZEnILCZQAZzMOPXaLMtBLXUVs+ZjHNfXKKUSO7vyIeKHYFc
         yLmITGFASRAly3UFk4dKjQJ4rkaCQnCrw9K7jKkKRo0pqgrDY9TNjPeL3uJNi8HE1+pd
         j07HGZhiZ2qKJ49SxJxe6JuQAccIHIh4zcJ+GyRo5fbNF7BprbrscwK+9ZqHrm5LsdBH
         D4BA==
X-Forwarded-Encrypted: i=1; AL+hErEtZyaxZUlejBrvRM1Nspx0xaqN/PYA2dFaZGuGOhMvA6tIQ665h9QUwVXYJaydD/OIMFxL4xsLmjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FWzQbySNPUCo2K8msaiDUkr7UOZT0/N1uAu+U1b+EhVULP1E7
	XZIiYJqzgaFlP21BDpkhDuHw/Lb+16G6pQ2GOvUshiBKLnTo4iasD0+QOStYTCUwb5k=
X-Gm-Gg: AYBFou0kNKXAY16tWPrlIaCxO9Ie5P7/vE8ydPZ30qUZkg7aspGSzLBdrZ34ZvFXeMw
	mZhS1tBntqBOypKkhRegx/yaNC2VvDPvzvdseQtddD5sNf3IonwycVje329ekVYujy1P1vjgcE5
	Nshb18u+9giJZhGh102fmR40nTsnXdC2PLx3G7srzToAROBG+FlAbFuE59IysV1WgEk9nt1NYfp
	Oy+s95TpvcSV2YiOzTr6EZ5Jk3A15b5SC8sit/fd95Lz4yDe5MMitPAhw3CB8kYBp4cD+qBYRJA
	aINkBvfO/zl1yAu9XCWgYftQTU8v9K5Smdl7Tz/WxcHKzgYzgdizA45wd2hUV6ldAbt8hTKSFQn
	Ini9LYqnABeb/ukh8QwINL1ZwIRIs118NILdlx0qv5i9+sG7uE+25pJIoy1kFaVDstpxqIvqmwt
	pdm+NpMnq+k0TWSvmiQ3HM35kWvIWdrsAJBesxtte6UrUQXYunKoe5XK2RlT4G+NWknJvo8TIKh
	lD6bXqvZC6ydP0A4gw+6zHUPzXGed3K/mFkCH4i/Q12W1qg43uZQcC6LY0uY/0ooc2KKjaYpVQx
	e5GvfW2BYtN76ZSEu7mnTwysVYcQekVuy/rpdA==
X-Received: by 2002:a05:6820:16a5:b0:6e2:3d8b:a007 with SMTP id 006d021491bc7-71b3944bab7mr3741303eaf.32.1795206676974;
        Fri, 20 Nov 2026 12:31:16 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60497300sm3878568fac.11.2026.11.20.12.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:31:16 -0800 (PST)
Message-ID: <de58a250-ef73-417a-bad9-ef31e9ca6e27@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:31:14 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: Release udev references when refreshing
 devices
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, valentina.manea.m@gmail.com
Cc: shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261120062114.98435-1-zhujun2@cmss.chinamobile.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261120062114.98435-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 23:21, Zhu Jun wrote:
> Device discovery creates a udev enumeration and a device reference for
> each entry, but releases neither. Successfully exported devices also
> retain a separate udev reference that is lost when their list entries
> are destroyed. Repeated refreshes therefore accumulate references.
> 
> Release temporary device references on both the normal path and the
> exported-device creation failure path, release the enumeration after
> scanning, and drop retained device references when destroying the list.

Do you have a reproducer for this? How did you test this patch?
> 
> Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_driver to libudev")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>   tools/usb/usbip/libsrc/usbip_host_common.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index bec6c42e29c8..a0df0a57b38c 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -143,13 +143,16 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
>   			edev = usbip_exported_device_new(hdriver, path);
>   			if (!edev) {
>   				dbg("usbip_exported_device_new failed");
> +				udev_device_unref(dev);
>   				continue;
>   			}
>   
>   			list_add(&edev->node, &hdriver->edev_list);
>   			hdriver->ndevs++;
>   		}
> +		udev_device_unref(dev);
>   	}
> +	udev_enumerate_unref(enumerate);
>   
>   	if (hdriver->ndevs == 0)
>   		info("Please load appropriate modules or export devices.");
> @@ -165,6 +168,7 @@ static void usbip_exported_device_destroy(struct list_head *devs)
>   	list_for_each_safe(i, tmp, devs) {
>   		edev = list_entry(i, struct usbip_exported_device, node);
>   		list_del(i);
> +		udev_device_unref(edev->sudev);
>   		free(edev);
>   	}
>   }
> 
> 

thanks,
-- Shuah

