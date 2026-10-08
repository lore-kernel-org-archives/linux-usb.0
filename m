Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3233876BE
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476598; cv=none; b=KCFuf62kbdiRAPTyX4EEUVbuAuzREmzhQLxgv/mvC9P/V6AGnrXYxsr567BmlVaWnEAVanzyWBRD+fVXdxCE6fNmiWwT/DUThYQdhw5pRIr3iCutx/f+/mvPn5Q/5YsWI6M67rbA1SdDwsO0s42sfjRLupnZ3aiLEZUCfc8ERTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476598; c=relaxed/simple;
	bh=TrvOEQOb+VeR8TOSoSzkO+mbKlKQDPJfDTkc3vhglds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r0Vv/IBw4WFYVBQxACaL5RVrrloH4OCicgRwRirXJ/kF/gLNwc+rQVd2YlxXqecHZ6xRnzyvGP3KyyJy1YRVKoBs6CjQk87WBRV3Ke7wwl0pDL4ZdwEGiBa3CU05vZznpQ5x/FjJcuxGDpxyipr7rjTaZl/9aMyACAYKW6vFaWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDYkZexl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDYkZexl"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a6313cb899so24340251fa.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 09:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791476596; x=1792081396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CfDJHfc/f/vBfGp3/MG2QS5s0yrRLiIWAhcrj39KDM=;
        b=KDYkZexlrCYar7/fj3SNDYoVJqKPppYfz53nxMQ+cwWYTytkf7QaGs8ZUT5SnoF5+z
         r76KvXtZ8BiOC1HElmwUr4Cj3tQ2rMIJmgR9k5TMKypHqlvU9wmTdVd5+7rODTQaighK
         oC7LJwZTiNsJMYP6vdl1F9fU0gRlVD0l71McniIR02Q2Arx0cQSu+aKc1mzWB6NpNjQu
         r/I+sJohm0dPMOpywqwDRleFyPBCz250qrB3CACbCIZCW/a7cABOeUKVSvzflQzU3O9e
         6pMhLh+PUtw+W515qlnteOfC9BXmwhh743nOTdjiCDWIw5DWStoyvEDwJaiih6BCVUlm
         9w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476596; x=1792081396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CfDJHfc/f/vBfGp3/MG2QS5s0yrRLiIWAhcrj39KDM=;
        b=t/YbUHTINdVRkZfBLg8wohT+fDGVtD7Q+lUBGC/426xYqK3FMFSkzTN02aZJjVeVAe
         aizR2FdrqYsywNBrxeolx0Hf3tLVUh+yqgTEL6SK88gO9axFtt1cDfhiNDXhTVE7gT8J
         cB9Ow50o5uZ5/Xwyv5J+DpI3Ry972w8jafe65xk5Hv4PJz60sYxo968foz5tFL/R0Ede
         yw3JnikbdStFfe7Q2w0UTItGb+aWJUL/tTd1nUTgUXMzWHlWkMuZ5kbInMF71kqhU9dS
         SzhlidOc/0Iv1Ce8f0L/YllubJRbzXbRsGd2SjJTWffDx5U5HZeq3xXdQuI6W62D8P3q
         cWXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9mxETcfGmCxq0fpIcFMONpyo3UyHraxgTapI12r3Ta7/z5KS4AlfkF3Wkdkf8gtK6mQjff/T/p14=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdgnIwkBw63IjKZfe186hyyMxvRFBP+SJ98lri2LoAYhHb9ayc
	/uXU+j0iHBNsaYK1oZpR7KBQqr3qqRVBqPtMcc/KnU+KO7wo4Hf9klKN8h6Ysw==
X-Gm-Gg: AYBFou2LvZd2VIWXJMu0oThNYAgacqthQMAIWAygyA8OHFYL770mJvXuAXbI4PONa0G
	K6Hrip2ag2C0b4JbtRlbm3kG1lvaYy2qcIMzA1ygFQwj7juT/0dUb+xU5EDhjPe86xPxNYfck69
	B5y25beiMBL7+53ik7HeqmdFXB0H7CRw9SQmstzZsAtnqe1S2Wok0JGbvORiBG7lhoUEgJI8EQ3
	dZp0isv+Kk6FPLhqwFKXTUMfqDM3kBKApzfpk/hsxFt1q3Yd77Vmom7qsvK90Va4M+NmkBrv3w8
	xjeNeZ2LsstSjdfMVXn2vQTMSo8olBfTvauCEIy5eRi82XK3rz2pcn+dNFfwf03IP8U8vFL+LWU
	8c0+jQ+Vh1hDHcJPnT1KbcTkVF54kGZGsxa5ZFEeQESWXBrwNNkAoJfflGsVGztGkDNnh4ENFk8
	4E8cK/y8KVXwawN4XjyoArD1sc+k/UypjAjeoHYOOHXfwzWZCjRciJDrIluZBNDva+mjMmlEUas
	iHmch42Yh3886dlNOnSxxPks9exFxL6medGuUlzY3Ry5NqdsbBcQG0/MQ==
X-Received: by 2002:a2e:a594:0:b0:3a9:9a60:2c47 with SMTP id 38308e7fff4ca-3a9a2d60187mr13049101fa.29.1791476595374;
        Thu, 08 Oct 2026 09:23:15 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4730:9830:2498:c9c3:c848:4afa? ([2a00:1fa0:4730:9830:2498:c9c3:c848:4afa])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c1439956sm671151fa.37.2026.10.08.09.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 09:23:14 -0700 (PDT)
Message-ID: <08da0196-6201-4b5c-bffc-243a0250f632@gmail.com>
Date: Thu, 8 Oct 2026 19:23:13 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: uas: do not leak error codes from
 usb_alloc_streams()
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, luca.cecchi.info@gmail.com
References: <20261008132711.211908-1-oneukum@suse.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20261008132711.211908-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 4:27 PM, Oliver Neukum wrote:

> While a UAS device is undergoing a reset not triggered by
> the SCSI layer there is a short window in the error case
> of reallocating streams during which internal error codes
> of the USB layer are exported as nonsensical queue depths.
> 
> The error has been noticed by Sashiko in a different
> context, but it is a general issue.
> 
> Fixes: 4de7a3735bdc4 ("uas: Fix reset handling for externally triggered reset")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/storage/uas.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 265162981269..3f69e9de9b61 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -983,10 +983,12 @@ static int uas_configure_endpoints(struct uas_dev_info *devinfo)
>  		devinfo->qdepth = 32;
>  		devinfo->use_streams = 0;
>  	} else {
> -		devinfo->qdepth = usb_alloc_streams(devinfo->intf, eps + 1,
> +		r = usb_alloc_streams(devinfo->intf, eps + 1,
>  						    3, MAX_CMNDS, GFP_NOIO);

   This line now needs to be realigned...

[...]

MBR, Sergey

