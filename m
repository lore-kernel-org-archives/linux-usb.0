Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6C3D522F
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209808; cv=none; b=LTUSdSQfblqPgT+kYMPRdT5ZxpQTC5xlwSun0eRjY4EBwg2NjPpZR+uN8kdcFLZo1chcrYnDDR8OEoq18709LOCJF6GmLbGpc+pYHcL77pLBB0kiILfL7gK7M0k/mVU4d/ShC+17+v62vxK8ygGx6GaDexXPzWPKMMtWK/hv0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209808; c=relaxed/simple;
	bh=aL+R0damZiB7sA0jotIpouwuYqTFvSqemReY+3b2sqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeJN9BxyzwyTR8vNK0EycfCLL3lXwYGW5/zpS6P7YdMhl/fUAL79zhbuWuEaNPjiAb3uiHko1mzvi2Dxxh/cDwhDEwSLKRMVtpVqgApVyU6Vty/JGj6zuGC82glkDfXHOIcp2zmjctFi0NG9mwi2I4ghJg3lSqV0b6IMd2Dfxz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WBaM0mLu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WBaM0mLu"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c05dcdf49so72160181cf.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784209804; x=1784814604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io4XoahyhiQbR4jRUatAVwYbSwLWV1P3tyDhT2e/cns=;
        b=WBaM0mLuTvj9uCLwZ7y9HNE59sOqbLC6i0h+Ep3IGPsgVB/yPoNegc2G3jyugVDDLo
         iOoZdN/69yDwFj0LV7rkcSxC9DTfRjVwjyBC3Le6c8VWJ03IXA6pwMYm0f/ZyC+INk5R
         7ews0B6ntiINOwhBUQANAGymXAFdkplvQSovTuxNyc4Z6aX8oyxwNKWVt91Dt00snHpf
         /DyKsAIF0oWC2mZ41WE7AR9dRjjU5lxWPJ/FvAGeeRTFRyPDrK6215d0kPaslHbH3jad
         gh9DvwbIUUxoCkzcBDnLLNuhjHaU4E9KhFElcJeLm9aiii8CjCrvf4HfB7+Xj4wDhv0g
         R3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784209804; x=1784814604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io4XoahyhiQbR4jRUatAVwYbSwLWV1P3tyDhT2e/cns=;
        b=T+TpjBm7ezZHpMpegarJF6juxlJfjUduEb/oEvptjwaENLvB702UwdOozYDq4BIUce
         Q29txv1j4rwA90lWWVcgAu93UbwPcU1jezVIypvqqZG9afEOsDN1DAsHHUMikniH/q9W
         /8IOXuBO9QPUvD/jGvmgFz2K1X/HoMFPUDc/LuJY7QEdk1I1vFfywSvfhvUfOJQTG8nl
         Up6YhzlZuK+9+eFnZGKlOOVRZkK1bhxrfARlOla/KL/dXKdOd+UiAJuv435rCBAmY75L
         vkTij97CH3SpijMGsgIVNWv3afE9xWzK3OCtXfgmfBtFjJwPRpRpYbBoCneZXvOI4BtC
         jzNA==
X-Forwarded-Encrypted: i=1; AHgh+RoorbWZKHGfSU0B2V/IEWcQhgudwhXPX6ouBaObSh2etihynxCt9QtYNtmj4dZM5b0YJrO+sYyjCag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCr705fyMidIPnenb8XQYlOU4zikOk5mw8/MQ45LWndXaSPaRh
	h1twrEPtLx8qqd8+j24lDjguwnNRLEB2A5MR6QGRWzvzePR1rD53siMVL8gPk03HLQ==
X-Gm-Gg: AfdE7clOQhD4ipj+1R2RWs3rQvrjM+gziq//cM1sqYoiR7OExAjhyp5tDamIlUEdpdD
	Q8aLBij77IH82OqoC3wsA9MmmbpO9oegG3rS+IjvgGu7xlGINdDbeBLmKqOfsN9hvgOOqwDXgXF
	XIcTaPvqlYz8AXLMOxHb0arQ4qDyIvMNq52s1C5gRSEk9uabrbLyYPyHONo2QsuipXLwKuM5Ayk
	PPWFtLZz+Gu1uEmL9pXMx08GuwZlJfIoQnWzL4CGQ8U6t1W9DF5482P8qf70T3p6LGxZRDx2tLq
	s6UlVFRx7riqo0ncCjRf/wX5OajNFKZvEaR6A1/4zFEUAUcdG3UgXCKL1AmLCD+D0FNNCHkvHb0
	XfhuLW+OXYhDcqzfl/YNtw4pLzcFsUnVX3UQ+w6E7sRwzUwtlggfY7yxln/+iPwwRMjsR7YxmbO
	uYrcvrIve0PB+of9hINR3Z
X-Received: by 2002:a05:622a:1789:b0:517:b68a:8d84 with SMTP id d75a77b69052e-51e4f0a7558mr74319031cf.56.1784209803445;
        Thu, 16 Jul 2026 06:50:03 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf671e2sm154058111cf.25.2026.07.16.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:50:02 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:50:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huang Wei <huangwei@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: Re: [usb-storage] [PATCH v2] USB: storage: add NO_ATA_1X quirk for
 Longmai USB Key
Message-ID: <5851b0ab-840b-4c5f-9566-44c5a202850a@rowland.harvard.edu>
References: <20260716033341.2830872-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716033341.2830872-1-huangwei@kylinos.cn>

On Thu, Jul 16, 2026 at 11:33:41AM +0800, Huang Wei wrote:
> The Longmai Technologies USB Key (0x04b4:0xb708) advertises itself as a
> SCSI/Bulk-only mass storage device but does not correctly handle ATA
> pass-through commands. When such a command (ATA_12 or ATA_16) is sent to
> the device it fails to respond and the transfer eventually times out,
> leaving the device unusable.
> 
> Add an unusual_devs entry for this device that sets the US_FL_NO_ATA_1X
> flag, so usb-storage short-circuits ATA pass-through commands and returns
> INVALID COMMAND OPERATION CODE (0x20 0x05 0x24 0x00) instead of forwarding
> them to the device.
> 
> Information about the device in /sys/kernel/debug/usb/devices:
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 12 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=06 Prot=50 MxPS=64 #Cfgs=  1
> P:  Vendor=04b4 ProdID=b708 Rev= 1.00
> S:  Manufacturer=Longmai Technologies
> S:  Product=USB Key
> C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Reported-by: Ai Chao <aichao@kylinos.cn>
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
> change for v2
> - Update the sorting of VID and PID.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 255968f9ca42..ac22fa318734 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -395,6 +395,13 @@ UNUSUAL_DEV(  0x04b3, 0x4001, 0x0110, 0x0110,
>  		USB_SC_DEVICE, USB_PR_CB, NULL,
>  		US_FL_MAX_SECTORS_MIN),
>  
> +/* Reported by Ai Chao <aichao@kylinos.cn> */
> +UNUSUAL_DEV(  0x04b4, 0xb708, 0x0000, 0xffff,
> +		"Longmai Technologies",
> +		"USB Key",
> +		USB_SC_SCSI, USB_PR_BULK, NULL,
> +		US_FL_NO_ATA_1X),
> +
>  /*
>   * Reported by Simon Levitt <simon@whattf.com>
>   * This entry needs Sub and Proto fields
> -- 
> 2.25.1
> 
> -- 
> You received this message because you are subscribed to the Google Groups "USB Mass Storage on Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to usb-storage+unsubscribe@lists.one-eyed-alien.net.
> To view this discussion visit https://groups.google.com/a/lists.one-eyed-alien.net/d/msgid/usb-storage/20260716033341.2830872-1-huangwei%40kylinos.cn.
