Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8943F8A7
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156956; cv=none; b=I7M9W+ZHkBD9joFZUUDarqR1xHB0EelCKshIqxNXgGqCjSouilHRlJ3S1Ytd+sD59rQZM5icXsIhOb9Nynwr7jl3LbAwFb2Kyr4QpD7tyTQB+P0D8fCcvpsIaFcQa+1WF+ryoEJgDMPtWv+xNz2M99Cq8TLNtUYaAY96M/etNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156956; c=relaxed/simple;
	bh=GjWhhapekepSw3xDZhTubaOgG9SpMCtdY0jaTW4TErE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwaAyxjX/OeqaibHppq33uq6a656v8B8xrJgyR7SiTqS30DQB58v9lLCvEhKqKLe8rEZoVmiCxKhi5iHepWGgM0eQ63M+X/9ejhoPGJOW/LKBVWMm6XNicpzjJteVgXDK4MHwdUE8L0lO4VNUAEagT6I+691ew8KBs12c4zdw2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPCkuayi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPCkuayi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso4803275e9.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790156952; x=1790761752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQY9+mxl5RQeElezYwhR5Xgjfp9BQCJuxwrhuNY8J6A=;
        b=HPCkuayi90S0BJAjAhbdq1lbdYMgDpMaqRkXNgCTZh5aAbk1j4Zfn25Kx255lkkrm+
         gA6uqW/ZXNHGC8e5vua2Bt4hzV9bPAvQXfUyc8Od68RmOXRvp1ZzWnFDXTSdLcX8OVnq
         E/xmjk9Z9WEOq0tYED15aQRBOop+r8kRvX7mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156952; x=1790761752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQY9+mxl5RQeElezYwhR5Xgjfp9BQCJuxwrhuNY8J6A=;
        b=ubbiA/aCR3z5YZ/Ft1BeIh4UaN6LTOOx3XcxioRgiM6Kx5LhSACbTLiV+xQdrGhfug
         wTYS1Xf+xs7niX+JbIi2VyPLysnl7lRNkZHOtsw2lJFMN7ltq06NVDVSYx9qFJby0kWx
         eoz0hk9cWFtANF4F+3Bz+mxq09u86zSRkag39mpAxy8WVAoDrk455gBfWTQe7ILJT81Y
         mEwXPLRXhKty62Ul6ChkHUB6UqCMEZa2dPnAW3JS1u+KG/pMlPcyvpD49k4LdeG6ZAFy
         zhZxF1+880b+rpO9xKV8JptRLug4vJm0buBq6xwTco2OTYZefMnMj5NLL1ey9rsUgKMV
         jh0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2Bzn0TOk93nevLy29jLprqmVO99SiMnTPADx4wYLasFxfeHlSZSHoP8/xI3/iepv1UFURXh4BHDk=@vger.kernel.org
X-Gm-Message-State: AFuF++kBKoJHjC2hxvnS5VZRUSWdvU1vp0nXZeCFt95C8cu1ozuetaai
	Shv7Lf6/0VfWXn1WyW3nf75eEsUChCMeyoq8GZD9tEjDXf5WcOg7In+62QVpxlwafpqHpWKtlLv
	TW+9g4qbb2Q==
X-Gm-Gg: AYBFou2Zzoxx7LF1Tz9rquTYh6O8C8y4hxM+erHWkMIb5zIiz9TF7gwThJitIdDf5us
	LuL+uzbZfYyohyak3h/e8BvRHVW2/PIT5S6B5XKV0DBVaRxICb6A3e5ttiPMXToCK+BiWPom3TM
	srHJM+ZQFHWbcJ9ZGdt5JPealgFWQ6s2KLBmPTTefL9yECtvQd2obEMwOEg3yzRGf4c1GM3KoYp
	uDis03KWmnLu8Du/0koyrwAcXhNOFm/DsUSUgvFuW/UxDOMfWMbd3arph7JT3cN5duXYc6Wu1K9
	faOlVnXJ1VP7R3X9pTO6eBbCFPb4NGSXgGfKIyfHz8RAe2rPdcw39nhAgw9+NXGzDit+wZBzPBc
	zRSv/c+5FaNLx7TGr22T8F7kr/NFkafkSDAO7aFskyFCPXWSARel/GiE1EFenpkVHV2Smd2xm9x
	EI5ok21OBk0z+EvjVN5oDZESt/hF4oIbJKv5ayY2bz2NAYRjIYYL1pJFy/zH2++6DykQyssySbd
	oxMegc29F1VEN2O
X-Received: by 2002:a05:600c:4e86:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fdeffcd07mr26633495e9.7.1790156952208;
        Wed, 23 Sep 2026 02:49:12 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe14322c0sm50931985e9.5.2026.09.23.02.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:49:11 -0700 (PDT)
Message-ID: <eeacd6db-3f4a-4f7f-a27f-b7bfacc0a981@linuxfoundation.org>
Date: Wed, 23 Sep 2026 03:48:42 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: host: ignore number_of_packets for non-isoc URBs
To: zjzhao@edatec.cn, linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260825033623.332537-1-zjzhao@edatec.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260825033623.332537-1-zjzhao@edatec.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/26 21:36, zjzhao@edatec.cn wrote:
> From: zjzhao-eda <zjzhao@edatec.cn>
> 
> number_of_packets is only meaningful for isochronous URBs.  The USB/IP
> stub currently copies the value from the CMD_SUBMIT PDU into the local
> URB verbatim for all endpoint types.
> 
> Some clients (e.g. usbip-win) leave number_of_packets uninitialized for

Using usbip-win isn't a supported configuration.

> non-isoc URBs, so a garbage/huge value reaches usb_submit_urb().  Host
> controllers that size per-URB allocations by this field (e.g. dwc2's
> dwc2_hcd_urb_alloc(), which always sizes the iso descriptor array by
> urb->number_of_packets) then attempt a multi-gigabyte allocation that
> fails with -ENOMEM, making usbip-host reset the device in an endless
> loop (older dwc_otg crashes outright instead).
> 
> Sanitize number_of_packets to 0 for non-isochronous endpoints in the
> stub.  This is a strict no-op for well-behaved clients (Linux vhci
> already sends 0 for non-isoc URBs) and fixes the dwc2/dwc_otg failures.

Also how does this manifest? Where in the code path do we use the
number_of_packets without checking the usb_pipeisoc type first?

> Signed-off-by: zjzhao-eda <zjzhao@edatec.cn>
> ---
>   drivers/usb/usbip/stub_rx.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..ec9ecbf432f5 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -481,6 +481,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   
>   	if (pipe == -1)
>   		return;
> +	if (!usb_pipeisoc(pipe))
> +		pdu->u.cmd_submit.number_of_packets = 0;
>   
>   	/*
>   	 * Smatch reported the error case where use_sg is true and buf_len is 0.

thanks,
-- Shuah
