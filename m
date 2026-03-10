Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069D24E4B4
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181740; cv=none; b=gu+qVAMWjPshp0acn6l9msVr/XkyrK1KK1cSkNEhamf7yDtVXATKz5gi6ATv3esmEHWTNWR1ypQvuGH0EI26peMKr8NkHteNTnX/m5viiOC4OT8kotwOpVlvk4vaKB80k1M6bQ+osAqOnnsVeIg2PGdISJSbL+xEzP902XMHSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181740; c=relaxed/simple;
	bh=NUjIEizbo29qtzs2awZPNTMpz8i68TB6RLGD9Qmyb9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwmMwUU2trmAfgBVKp24V6FDza3xviIhJ82iDJTav+/K7IfnCvM5+sqlPj+5udtds2Mq8waP36zoPO88uMrLc4+gAb/DBOOS4FS42xkgqZLGTlK3G9yOCiI7V0VK9OqDrHNlSkH1xoIFbODi6RYW5Fk4OB9rVrdLX8lfRkae6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PUh3miLT; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PUh3miLT"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4645dde00a7so389307b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773181737; x=1773786537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eXADtt9ifVzPBRkJJtfktxddtuUYPmrX6OqdykBaRRk=;
        b=PUh3miLTET4xHvKMz+7p2kqMCG3QN1pIp/6kQ3H6dHn7DNIJDDcwxzbLXoStbU2LvA
         IfUaQto4AmetNXjYqS979PgWmqeM3dvMU7sAugKs25GTdPwefRDuTIPUsN5khiIoD1CL
         eqLxYmKrs1mfbMmLgk9kqWHQLBtIm2TE/T3h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773181737; x=1773786537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXADtt9ifVzPBRkJJtfktxddtuUYPmrX6OqdykBaRRk=;
        b=h8mqCUPjTmSHMyHf8LdfjvW9cTxZsvp7rTVQyiUGe8rlpfl8u15m8A0fnPcmrA8h59
         jPnI4ibrFDf/ITZsSwRdm9YykF3j3mxQ6DAboCr2AfxSyVlcLGBvpehoJGXnXqzlsUhe
         0AY0ch4YrRq35f1QZi0J1viHTuzDjPNjnHyiLQKSc3syfBMjRvMp4yD5DYLe7BlqBTie
         6gRfU8RL2a6qi0otpZJulvs+W7eu4GWZHCQFyaxV1rKU9pbmoBYOavGzPFf++5T9LjZ0
         4elzZ5cYOe+vOQQwRzWydkWok94zznm0gwRVBDdlTWLtqBHvvIA0mdEEyDy2xMERpyTN
         fJAA==
X-Gm-Message-State: AOJu0YzcHPoY3LwJVFgQZRJHswyvrMyxfop/SZgzBOUnoF0eJ1UQhlJ0
	ldlIqeY5P/jb1Gg3gqI3QJUtA0k6EZOm+UcAN9iBaAqVgJZXmlpeSda1SUBRlZrKE2toxEN8D/l
	3kzuc
X-Gm-Gg: ATEYQzyGxF9Sl3YU5ikCwNMzy9GJ0rHicx319LYpYrxcVe7YO+zzjLDC+UCctE/TXvw
	Z+i3jOong2zmYD/i9u9+U+UVsSDRAXn7FB2GirzWAYetXawWnY+cH+g4fg0MwQb0sjQtf+8Gqt+
	QOZGYE8DSwSSftAWdgP8yi6CoZaDdCh0De4X1bQ+9CcMQ4pgbgV3PmYEooJZyEkP7fPaQ71zX/1
	8WSOstbQOri1AxPgftkmjh9ppX8tNrDfJlvm9J5TBeKv/1oMizkyNG/x+4I57YcP6F2EdEnCAnj
	Opr78D/DiVlR8EfZALQMHw4lq/P2T7NT/wICmNoZHXXGfnfvpiqb7/RKtsWCKtdl0vnNRqqNFFJ
	9xfl5iurYO/sPwrvjQt4hkbiMVZJF2wzUqCHSOgvsczuKr5iu+YE8KfankQerxN8Jenl/slJSOD
	V7CCbn2TFQ5vuryrncv4BbsIf9ySoecZD1PL0=
X-Received: by 2002:a05:6820:1614:b0:67b:af91:ce8e with SMTP id 006d021491bc7-67bc9152676mr194114eaf.37.1773181737529;
        Tue, 10 Mar 2026 15:28:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc9118bc7sm212270eaf.6.2026.03.10.15.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 15:28:57 -0700 (PDT)
Message-ID: <190cf50b-7b1d-4b97-9f9c-86242cff1391@linuxfoundation.org>
Date: Tue, 10 Mar 2026 16:28:56 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: Add usbip host driver availability check
To: Zongmin Zhou <min_halo@163.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260303081720.84868-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260303081720.84868-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/26 01:17, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Currently, usbip_generic_driver_open() doesn't verify that the required
> kernel module (usbip-host or usbip-vudc) is actually loaded.
> The function returns success even when no driver is present,
> leading to usbipd daemon run success without driver loaded.

Doesn't usbip_generic_driver_open() try to refresh exported
device list and fail? It returns error if it can't find fetch
them.

usbipd starts and the when usbip_host is loaded it works correctly.
Doesn't it?

> 
> So add a check function to ensure usbip host driver has been loaded.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
>   tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
>   tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
>   tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
>   tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
>   4 files changed, 37 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 927a151fa9aa..6da000fab26d 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>   struct usbip_host_driver device_driver = {
>   	.edev_list = LIST_HEAD_INIT(device_driver.edev_list),
>   	.udev_subsystem = "udc",
> +	.bus_type = "platform",

Why are we adding this here - user-space shouldn't need to
know what kind of driver this is?

> +	.drv_name = USBIP_DEVICE_DRV_NAME,

And the name?

>   	.ops = {
>   		.open = usbip_device_driver_open,
>   		.close = usbip_generic_driver_close,
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index ca78aa368476..900370095b61 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -164,6 +164,31 @@ static void usbip_exported_device_destroy(struct list_head *devs)
>   	}
>   }
>   
> +/* Check if the usbip host driver is available in sysfs */
> +static int check_driver_available(struct usbip_host_driver *hdriver)
> +{
> +	char driver_path[SYSFS_PATH_MAX];
> +	struct stat st;
> +	int ret;
> +
> +	if (!hdriver->drv_name || !hdriver->bus_type)
> +		return 0;
> +
> +	//Check if the usbip-host or usbip-vudc driver directory exists in sysfs.
> +	snprintf(driver_path, sizeof(driver_path), "%s/%s/%s/%s/%s",
> +		SYSFS_MNT_PATH, SYSFS_BUS_NAME, hdriver->bus_type,
> +		SYSFS_DRIVERS_NAME, hdriver->drv_name);
> +
> +	ret = stat(driver_path, &st);
> +	if (ret == 0 && S_ISDIR(st.st_mode)) {
> +		dbg("driver '%s' is available", hdriver->drv_name);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +
>   int usbip_generic_driver_open(struct usbip_host_driver *hdriver)
>   {
>   	int rc;
> @@ -174,6 +199,12 @@ int usbip_generic_driver_open(struct usbip_host_driver *hdriver)
>   		return -1;
>   	}
>   
> +	//Check if the required driver is actually available.
> +	if (!check_driver_available(hdriver)) {
> +		err("please load '%s' kernel module", hdriver->drv_name);
> +		goto err;
> +	}
> +
>   	rc = refresh_exported_devices(hdriver);
>   	if (rc < 0)
>   		goto err;
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.h b/tools/usb/usbip/libsrc/usbip_host_common.h
> index f46967c0aa18..cf9bd60846cf 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.h
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.h
> @@ -40,6 +40,8 @@ struct usbip_host_driver {
>   	/* list of exported device */
>   	struct list_head edev_list;
>   	const char *udev_subsystem;
> +	const char *bus_type;
> +	const char *drv_name;
>   	struct usbip_host_driver_ops ops;
>   };
>   
> diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
> index 573e73ec36bd..e8f9d2ee2497 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
> @@ -41,6 +41,8 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
>   struct usbip_host_driver host_driver = {
>   	.edev_list = LIST_HEAD_INIT(host_driver.edev_list),
>   	.udev_subsystem = "usb",
> +	.bus_type = "usb",
> +	.drv_name = USBIP_HOST_DRV_NAME,

>   	.ops = {
>   		.open = usbip_host_driver_open,
>   		.close = usbip_generic_driver_close,

I need more to justify these changes.

thanks,
-- Shuah

