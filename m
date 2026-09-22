Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C74E01E9
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070476; cv=none; b=njH1Rp0XDUfJNyAcLnq5E2ZhNko+QzJqjAz897SGQjgAtBnMJncY9fVHtbKn3CqfL1yDc0Hezw4gDTjZ3yLv3kEUH+9Be6hOrb5Q1BlxX4dP6DavE8X/Q4eEOiSnR8QyXX+/d8Mp1tUREhV9nhPT8KifGPOT+npD4fdgjkAp8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070476; c=relaxed/simple;
	bh=vKmZX7j2+UMDbTs0prpQw63eYE6eWd25yIxQG7e+2sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYTTDTIHCf+/Ch5nIDU5ePB8AKvRCOWrzR0S2HUUuwGGjFvtu1XsHJXcpAN1XY6RdSP48gOzBdti6n1qVGWBgPBJ2xSiVRAyHAASoamNg7lOPQi9vArFYuMx1ZuA0O+blAJgrlb8L4QEtMN9YNz4K8MYIRgKEJe6HJ1P1H38hEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yel9d1Yi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yel9d1Yi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso106352166b.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790070472; x=1790675272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFnXezMJTHEfGOyaUx+BGn6Bkr0k5HX/YPJ63ltM7lY=;
        b=Yel9d1YiUWKckQm9siMITV06DzQmcD/aNeLvSHdUjPGvXWzq+kyZTunnQpLKnaGrsT
         qVSzU0HV6IpPXWHTimLAwW5zOLVQhbOUsGrZ+OhgnKvFwh1M2OmdCMmUXTOZbyLy1jO8
         awmbrkjFw5OW+TUapkgRxvaZ0lFclGxbiVTXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070472; x=1790675272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFnXezMJTHEfGOyaUx+BGn6Bkr0k5HX/YPJ63ltM7lY=;
        b=R7J21Cjhxtff4jHkz7aoa5KNTwA5ayEKkhu7NhrbmXR+ObboHOS4lR7DEJGxfZMIl0
         CoKE5iTGdJbXDuieoTYdDzOnbGYFgktkQ4cm6ihjF6/RoQ882qkN/ElfCdGhfTq3XGmr
         /t/8MIHRrvDTQFnozmUxXYfqA00AdhI0mDLwaFF75qm8DfcirD3iW8Awb+R+USYl2H23
         WAt9t40LdYGiBGcq+rJ6VVTov0hxHAXuA/Nx8dYTuRYdVY3ZjM5B4kG35vIsG/RgWeYo
         od2zK8OXNr46ikAJ8oZlb/xTdru3A8v7VZcV24sTuBeOPMnSAcgx1pww6xOmEf8nwmrE
         QX+w==
X-Forwarded-Encrypted: i=1; AKwUvBz0mpZAJDPSOHimbcC87Hokxo4z+OZOD7uRNQDntyQ0JfFFdFvh9x+cM7j7LfZel5fyUqja3qtQaHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mfqULiNVGmnCmsSb47y/HQ2S3YuaqOmNQFxL7M3s2tQBtj1bt8
	IojHwho46v9nLUkBZ7WkOou6WnFnQfjvgRCPnlQWYSImGqxmSeLn1ltpy3/nTcNa2l0=
X-Gm-Gg: AYBFou2+Jk+UrFfQvRJhYldixMb5CPtpxZ0DWXFLcEzSMILl0gi6xhyg78HGTUok2lK
	LbphRq2D3dDnCnBjpZELvo2+uYdZ/gU3THfq0KoBsha2mLGFq27zDcDnh3tgYo0j6CsgMYCYwO5
	ZxBDke5lIru4AW7OOCzjcbZHDagk7cLZPD45MWR45cZN0nukRazy8qmVXnnatWTE+GfPsmFt1Sw
	0WmnsiuK9u6qlNbPqELNO5WCTFfx8AogAof2oJxZhfLJN/MdcMdqwd4EhOC0Ct7rUQGvUgAxSrH
	ueQHfzo6GLub/2XQN+kxYa0XGuGLec1R8PMPjtqziDmpwq490PyRwwL5pdU/KnIwz5iV5nm4+M/
	2liVyhckx6ovbtkZDbJ7onjbAVrXiCVrFa0w8yqEVk4fjXAANVsZ1NXJrv86tsYb2txPd5xNw5C
	nZTaNJkoGv/SpEJ/+D9ameEWTCw3zZ81aKV6QwDQurbkew219O6f4p4We7+aHu/3rxC9JroUj5G
	eaVIRnLERRU
X-Received: by 2002:a17:907:3fa0:b0:c25:f7dc:2d8 with SMTP id a640c23a62f3a-c2a8d762753mr200948966b.25.1790070472034;
        Tue, 22 Sep 2026 02:47:52 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ec614sm55899666b.45.2026.09.22.02.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:47:51 -0700 (PDT)
Message-ID: <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
Date: Tue, 22 Sep 2026 03:47:45 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
To: Myeonghun Pak <mhun512@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260921224130.492681-1-mhun512@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260921224130.492681-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 16:41, Myeonghun Pak wrote:
> Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition") made v_stop_timer() delete the
> transfer timer synchronously before vudc_remove() frees its containing
> struct vudc.
> 
> That does not close the race with the receive thread, which is stopped
> later through usb_del_gadget_udc() and vudc_shutdown().  The thread
> calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
> v_kick_timer() deliberately calls mod_timer() when the transfer state is
> VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
> therefore enqueue the timer again before the vudc is freed.
> 
> timer_delete_sync() only drains the current timer instance and cannot
> prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequent
> attempts to arm the timer no-ops.  The transfer state no longer needs to
> be updated, as it is freed along with the timer.
> 
> On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
> binding the device, submitting a request and unbinding it produced a
> "free active timer_list" warning followed by a slab-use-after-free in
> v_timer().  With this change the same harness completed 4000 iterations
> cleanly.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.

Were you able to reproduce this problem to test and verify that this patch
fixes it?

> 
> Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
> Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>   drivers/usb/usbip/vudc_transfer.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
> index d4ce85c4c6a2..4146b746a320 100644
> --- a/drivers/usb/usbip/vudc_transfer.c
> +++ b/drivers/usb/usbip/vudc_transfer.c
> @@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   }
>   
> -/* All timer functions are run with udc->lock held */
> +/* v_start_timer() and v_kick_timer() are called with udc->lock held. */
>   
>   void v_init_timer(struct vudc *udc)
>   {
> @@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
> -	/* Delete the timer synchronously before teardown frees udc. */
>   	dev_dbg(&udc->pdev->dev, "timer stop");
> -	timer_delete_sync(&t->timer);
> -	t->state = VUDC_TR_STOPPED;
> +	timer_shutdown_sync(&t->timer);
>   }
> 
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5

thanks,
-- Shuah

