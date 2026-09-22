Received: from mail-ej2-f29.google.com (mail-ej2-f29.google.com [74.125.228.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055C4570D4
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071473; cv=none; b=e1IaSinuubtLkG/vbZ0vXQx/iUAbLdosEUSP5iD9sTCJNsigWoq/BIbjuCrzOBNDffy9Nw0aDiWeZhF8v+QsBMLPyaVeKX63LpCOSnGbn0ZXlBhOt/lkLXAWRZp/BQaHDjSMFTSI4SgYRwCIUGti4j+OC9uHQdMshxhPUOh3tnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071473; c=relaxed/simple;
	bh=+/p4Q0sgN1gCnPeZQ7lrLCym7jS74y6M4D4tNMXfdHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeUD6meYsk6gIx2nzKhc3/QtRnxRbe0lT0r32YX6Keg2E8eryMIceJP75fVouNowbf9pn5dgPw9x0hHFJUo6BEilczvdAZKbBpIjayCK1DrjGWgSh+u0z66zVGwAuXM+lN/wKw1GbTM0+lx5UxFfCl5QwBrRlzUa3I78Lv48s/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XdPA+spD; arc=none smtp.client-ip=74.125.228.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XdPA+spD"
Received: by mail-ej2-f29.google.com with SMTP id a640c23a62f3a-c294496989aso531837066b.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790071469; x=1790676269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ips8FL5qQlrZs4lRamhBauIUV4D+6bxULsoH9iHoMk=;
        b=XdPA+spDZmMIGMsVeP4gS7fqQDoUJkMNKFvyFUWUYNBY8mo8b9lCDLOX+r6VDwIcwJ
         HTYpfmEk+zr4aDfoQSXTzAVzLAVTBDQ2salABtXGjvEhQlLmCwuezcGxZsQdrivcaqeM
         fP/VOJ70rdFAPENbXQnfkkmHnGLJbXaRdaopg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071469; x=1790676269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ips8FL5qQlrZs4lRamhBauIUV4D+6bxULsoH9iHoMk=;
        b=gXBt1TlqOS8Am/ZX9xTr7mt8GEcHZpflWS/vzykb1SGWg8c7U75GRdhTvExyJKjE/h
         GFHHhbipHOToQwNaDg3Y77Tp6by3a31jG2380RTGnVbNxhE95YjJ5Q3UH3qAUT8rw/ZO
         FmMJSJbaPtDv6mf0oAvOUhq18qmEKSIyJM/wcyAp3Fadszg5vRUOAkVT6AohC1FhJXBv
         4JioCX9hJ+QJaTttysTR39FRv3/xlfsztPNJxKSnv0b7rQu/VTft5unlp9Pz1GtzGm0w
         q9/0GgpNcyjRce74Jjm5TDiWuk10U5/UHU877d3DXpPZTZmsxCN0aZdKSxjaVMI7aB6d
         a5nw==
X-Gm-Message-State: AFuF++ms/D12qNkI6O/I4Zdt3iaW7HvWIFkAL4kBa2tzHRR53cSNUdjb
	k+2BJ7UHzZh3GakU0BTjmC19pAvLuXRW9+4UJ+7YpIFMhaGoaxGdE6xPYRDAcMIKee2fmhKKYy8
	ZtwJEM1CqEw==
X-Gm-Gg: AYBFou2hzsxFXPbmCGOEQ75RlSNb/Ush5VHZKCp4zn6p4KIsRXqI6ikEQTGtiJGt7x7
	37z/Ebxn97yDUx89thuv3sNFXfZAfHmGOh2T1Cm3lMlnAA6KP/AtjwqqzAhtloyur2Ss0Jl7Xoy
	BhJTc9TyAAbLlNe1Q2xsi+nSop8tAbzFMehEx18AD2AtJr7UwqNvyekh5N1+EJ6pAKp6y+0owjN
	qAIN+en0gUSHcrH5MBSXzgj7DjlsfozBhuxPKaQOIKF3BpijejX/VwWv1LMcddTrmHG7ETH7MDp
	WP1SgMFv9WM6h20cm/HNKtjONR5tDZbGM02sep8gQ0Tgu/givOt2B3dNW3V/2bZSGEnsI8ndKFR
	yVky43ziZwd5P8OZYXYS9dLgiM5cTipnngbtHyklZ4JmOrqqi8fRCDHJLTZ8JLMHMI/ZKITaxMW
	pDqkj+jxwdLFe9rBD2q9XWYF2PJavfwsHW5e/UplkDCRKSQSSwPJ8uhL3UXsiGvrc0+n81N4scU
	BKggnxtHdE=
X-Received: by 2002:a17:907:9703:b0:c26:219f:6f74 with SMTP id a640c23a62f3a-c2a15846232mr1049317766b.5.1790071469048;
        Tue, 22 Sep 2026 03:04:29 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f32esm60622866b.15.2026.09.22.03.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:04:28 -0700 (PDT)
Message-ID: <b37401c1-b6db-4746-9f6a-af25e9f30829@linuxfoundation.org>
Date: Tue, 22 Sep 2026 04:04:23 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: add NULL check for calloc in
 usbip_exported_device_new
To: longlong yan <yanlonglong@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260817060618.749-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260817060618.749-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 00:06, longlong yan wrote:
> Add a NULL check for the return value of calloc() in
> usbip_exported_device_new(). If calloc() fails and returns NULL,
> the subsequent dereference of edev->sudev would cause a NULL
> pointer dereference.
> 
> Also fix the error path at the 'err' label to check edev before
> dereferencing edev->sudev. Without this fix, if calloc() fails and
> jumps to 'err', the code would dereference NULL when checking
> edev->sudev.
> 

It is theoretically possible for calloc() to fail, however how often
does it fail and were you able to make this allocation to fail?

If not, how did you test this patch? In any case, I am not going to
take this patch and all the other patches you sent adding checks to
calloc() calls in other places in usbip tool.

> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/libsrc/usbip_host_common.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index 01599cb2fa7b..94762bc282eb 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
>   	int i;
>   
>   	edev = calloc(1, sizeof(struct usbip_exported_device));
> +	if (!edev)
> +		goto err;
>   
>   	edev->sudev =
>   		udev_device_new_from_syspath(udev_context, sdevpath);
> @@ -107,7 +109,7 @@ struct usbip_exported_device *usbip_exported_device_new(
>   
>   	return edev;
>   err:
> -	if (edev->sudev)
> +	if (edev && edev->sudev)
>   		udev_device_unref(edev->sudev);
>   	if (edev)
>   		free(edev);

thanks,
-- Shuah
