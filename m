Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AA429CDC
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457863; cv=none; b=FaNkAVsXJpGhXYGcm+W7z+8/UtSKwEYuUeZkjrkLdmijxcsvNOZE/x1CE7M7zfAms3coXgBIOsX8nyJKegTNVvWQ1t5XHzJLCh27pCuGIwNqFqYfI9vHsPE4wnmEeZiqe4BBTiQDI8bDw7D6/WHuisilQt42iBc8htKOfhp8kH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457863; c=relaxed/simple;
	bh=9nLa+lG6hE+0+8DolKisyL8IWAwt1pVkEicA89j+xnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToVU01I44S6MPck7XZfFu4/we9ztWljempxmimddfwp6Zcx1P0hx+QQnLAQTmkXONBqSKlRmEHNXU/z0sJmK973fAwbEBNHzKstllIaeARdyr2EPf+Jc63XGKPHlCuXGL84PCOKBY1577HXexLoOpTsMCpBKsAPiPD5ger6AALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GaCZiav8; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GaCZiav8"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8edda5d56a5so25960816d6.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786457861; x=1787062661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5agz8hjyhktEJjZilWrywE8FS4mDF7OHsUJsldWFAQ=;
        b=GaCZiav8NcF7FW8TPiAKpB2gUOo5+CKEXlyYB28RrYz8i3KEhNv2FjpsAcekU4ddT2
         h4zs6MNJ3uFFlV+OVrOIYEZWJsca1c+J7NYZwpUMv3SIcDXK6TZkF/oi6P1jgQZfGzrY
         RpM7u3zaef9YkL9s6UKzs53z3nPPjvwmw/YNmWc00RK9hl04eLipJJCsf74S2Z8WYpcf
         oSk1smPWQI+rJsUTZVuYyxd3O+FRCr/BJ0OizKJbNL67cH+M38mPbbvxJl34wStchxq6
         vGdgVkR8eScpyilfgOdyLlox/SEEw0Pc/idYy0vp7bB/gbRNsvxgGkkwD55FqKMz6MS8
         fzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457861; x=1787062661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5agz8hjyhktEJjZilWrywE8FS4mDF7OHsUJsldWFAQ=;
        b=jDaVZ2a9QNUod8xeBCFP+MOKp6FfI7bHoqO0kL48Jd8/MHj7uDJ+97Yxm13oZhxzNz
         IXcWSHTI4ouYcGDvkXiWGaWJGAhXkTi+YfWzqHHwBiNjVkX+eKoVU4T72GxCAQtEZm0n
         GXESGmZAQH/m83VVAJs7uagbikRTPC4ab2ip1q3spt28NFpXCmITpSLcLfmHl1q8FDkQ
         ZvR8Kl5PAunqJsMSgJycMIHbsTohHdfhHLBL9WGpPh0JYyybtVnlQiMmQ+Uqprxzx828
         oF1Jkk30nPocdsSzODBjCVpLburOaspy14z2WtA0a8fxD3Yc/4/0vzfflEQgAC1Cumld
         N0zg==
X-Forwarded-Encrypted: i=1; AHgh+Rppn+RrtVCG6qfx6Lg2UlO4yl0QVpdqPcsBxCsVqA9VViAL+HCJCKrRsXMe9gOrVAWnUVHYavQjqPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXUhTWZZAXwhTYeFWymAWT5/oYkVnhJ6t9QB8t0fSkHXQx9FO
	fJNPL5dLP/khDfKmZLUA17+Khn/9yRrYB3GZ2NdI0rlrNHSLZtFrAYbW0e6NSRqMFg==
X-Gm-Gg: AR+sD11H4gB8+v3F9MlEjjhbKktlSPd5aIlf4pADmJ6Xrqf8sy6G9j85kHlIRCWkdK6
	lcRW86KB+hEdLfL3TvuyXi13MWG2qbpQLzdq8EBWhCDXa/DDcQDlzBcvEU9zl0qHaBigByei3Tv
	d8g0Jrx5pb49Q4xXdGPio6dDekKp0yHF5pasoZ9riDq/ID6jokLGNjQzFofo692i8ePQTNT0X3Z
	qceI5lscf2ev+rjrxTWs5RsZWm/pCU91xw/uph9816Op+YDa07K51XyoaMcX4+bvwVeFb9zuVcZ
	JGSaHiSdYaQ7zK+z1cImcUQ7gHrNSfn+rYU+lKGJscu27eIw8Qk+lmX2vJ5vLdJSR42BKRkMzSD
	zlu7t1GyFQbXhgBj7hOhZVTRaGD9/4aNeam+rCAMLzM9rLEjzZyEBVMqIUTCJLX4em/Kbp1Xrrg
	2BV1WjjnQnPNvacknkqO7hfzU8SiVEgWcFbNCcvItKhN+JNVsTDpUqtpFQYrYrJQ==
X-Received: by 2002:a05:6214:413:b0:8f3:2566:3700 with SMTP id 6a1803df08f44-90a66df7522mr29373016d6.15.1786457860752;
        Tue, 11 Aug 2026 07:17:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c272a8csm323486d6.5.2026.08.11.07.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:17:40 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:17:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: handle port status errors in disable_show()
Message-ID: <aba0f145-8273-4abd-af52-244f1479d5f5@rowland.harvard.edu>
References: <20260810230432.44511-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810230432.44511-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 01:04:32AM +0200, Karl Mehltretter wrote:
> usb_hub_port_status() leaves its output arguments untouched when the
> status request fails. disable_show() nevertheless uses portstatus, so a
> sysfs read may report the wrong port state instead of an error.
> 
> Propagate the status request error.
> 
> Fixes: f061f43d7418c ("usb: hub: port: add sysfs entry to switch port power")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - Simplify error handling (Alan Stern).
> 
> v1: https://lore.kernel.org/r/20260808131601.75096-1-kmehltretter@gmail.com/
> 
>  drivers/usb/core/port.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..6503668f303b 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -96,8 +96,9 @@ static ssize_t disable_show(struct device *dev,
>  		goto out_hdev_lock;
>  	}
>  
> -	usb_hub_port_status(hub, port1, &portstatus, &unused);
> -	disabled = !usb_port_is_power_on(hub, portstatus);
> +	rc = usb_hub_port_status(hub, port1, &portstatus, &unused);
> +	if (rc >= 0)
> +		disabled = !usb_port_is_power_on(hub, portstatus);
>  
>   out_hdev_lock:
>  	usb_unlock_device(hdev);
> -- 
> 2.39.5 (Apple Git-154)
> 
