Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4C4756C3
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154712; cv=none; b=Y9Pzr3lakEPvPnQaOHr/ye7eTJpkX/0CgbGw7k3S2UL9j4CMFIQkIkc4qSCJJu3wsB1ec+l/RyVguaMkwXZrJEGJWWhRrMJ+1C67Iqz+Eel9RjB2jFtj2JQhcjb1xolL6rIEVKfKJvfOgbDjCQHqVNW87NW+KBJDm9izv6TVZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154712; c=relaxed/simple;
	bh=ClIrNXvQzgh1phRsj2WKx2BjwWcdDPaTRIsDT7BHJss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULxWqYdPaCu+QMavudpmQtNcdPRRcRuj7ab0hysHyaFnZq+7c7Sdk4wvyoaqfXG5u37/I4XoWmt8uPjrg45cFeJ1GrociQ7/f/4ZBc5dFH/0/j+C88Iv6yLdDeV58uo3wOl/6lCGcYOnNeWBAVKa0vXe+3n50FyqyArYmVX0BEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wf6NLega; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wf6NLega"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so415237f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790154708; x=1790759508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAoiQGthbdNXddwUID6hWK5ILZRJHIUjDxuRCcm0SGQ=;
        b=Wf6NLegamnVjJcmN+y8oY986P15cb7pxLV1ijB0dWg5AGWOS1vjB4rE6TE7fBSiBC3
         YVWJ5q9qo8WZpzWdx6h6oU4QftrCIUtLc0jrjVyKjQ+CogzCFFTy7ug/HfdK+8eCNgQ0
         2P9gv9WoYEPTm3ykuHAW9/Rpw9ieldD4uz260=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154708; x=1790759508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAoiQGthbdNXddwUID6hWK5ILZRJHIUjDxuRCcm0SGQ=;
        b=j+qpn8sAx8CueIa/EimeA55BSXtRf3rFAEZaJTQFxWoVsUPjlHqB2UhBSUvs1/1B8E
         p8djsfI5GRchMSLB9Ief0mQzQumi5UE3ecwvAddBoY+2pZcMnHyh6ABHJHgGkdLtjq9M
         wKXTMyNF0vvmYUH58d+QVwWItAiChlR0hotSB1fWq6rsUG0LB4RsBJUdSRu10GsV8Y4a
         bMHjjQt0Zz1NzP0V8NzxzkTcQtSytered8DDZo6QyFRRm427ymgbp3ZMPt60DSP7MRfV
         5q++PIwYJLzNa+r6bW/XrKiqGyaIzJ0ZCb+zRbhmBruBBQruWHYgh2IfClKpp7XNWFim
         rC1g==
X-Forwarded-Encrypted: i=1; AKwUvBymQGgcaSYp06FIZeV+njSjR7MiPCMStdJeiCS4DeiQ7PD7GT0qNjQ4gdyLMfHr8SGNhZornGiaSFY=@vger.kernel.org
X-Gm-Message-State: AFuF++mmgsvrI1AkEe1HLR94XTc8sJlyFXSy62qOm9Ti3O8n6TWv+R8X
	qAoXpNwGYPZIXSyVzZWtfAHreuoHCWNaNJa+f01Q8nrgUSJzH3En0l9rt/nMx+ovxag=
X-Gm-Gg: AYBFou0s1gaqslNNnK4oGG2H8MFalnUNlINmiQYnclurm+JzIsiIDdmXP/pstf1cxWu
	dfE983P9SHnsEFLS1bbTIYKyEnFPelERMmt/zigLdSAB468EMhdz8K7VF0NwMqSI2WFYGkd0RL0
	UMh6F2JbhGjYJZgACsNBmYSgUo50fTjGgjwAQCjRGowGR+VCZrLWrMqtUcrwy37/SqklylwEEOE
	ZiHg88lGDI0QESIschANUzSxdTrcPNtL+o4F33gGNj+R1BF6TTWXj4D7uhVCFor38gdeL5Ijik2
	2MpHYjw7OkmlYEHFiKSB+udCCvPL0aYbq1/mfVDnjJ+9YLxcD+PLheMLd2kU53SPApR/v4k40W6
	AY4sCQR4qVJBSBpa5R6TbketnwfL8qe5gNTCHNG335Bq1swatu4lJ6rrC7Zeh28ulz1FB0n1mfW
	e/ut7yEj3OSQSbfj2/wqTSIa75ShSnaR+YlOebxkiuSCgWtVGhd9Hb4IRnIMDNSlz1P4ZPQJ0WY
	kelvFogsk7+PR6j
X-Received: by 2002:a05:6000:98c:b0:487:40d:af29 with SMTP id ffacd0b85a97d-488670a3566mr3640483f8f.36.1790154708510;
        Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm5096242f8f.6.2026.09.23.02.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:11:47 -0700 (PDT)
Message-ID: <f1c55b79-4487-40db-b2fc-342b2dc33c1f@linuxfoundation.org>
Date: Wed, 23 Sep 2026 03:11:39 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: vudc: Prevent transfer timer rearm during
 teardown
To: Myeonghun Pak <mhun512@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260923022033.957777-1-mhun512@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260923022033.957777-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 20:20, Myeonghun Pak wrote:
> Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition") deletes the transfer timer before
> vudc_remove() frees the vudc, but the receive thread keeps running
> until usb_del_gadget_udc().  v_kick_timer() calls mod_timer() for
> CMD_SUBMIT and CMD_UNLINK even in VUDC_TR_STOPPED, so a packet after
> timer_delete_sync() rearms the timer and v_timer() uses the freed
> vudc.
> 
> Use timer_shutdown_sync(), which ignores later arming.  The transfer
> state is freed with the timer.  Annotate v_start_timer() and
> v_kick_timer() with __must_hold(&udc->lock).

Can you explain why __must_hold(&udc->lock) necessary?

> 
> A KASAN and DEBUG_OBJECTS x86_64 QEMU guest reproduced the free-active
> timer warning and the use-after-free in v_timer().  The same harness
> completed 4000 iterations with this change.__must_hold(&udc->lock)

What does the harness do? You mentioned it in a response, but I would
like to see this in the change log.

> 
> Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
> Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Drop the lock-held comment and mark v_start_timer() and
>    v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
>    the definitions (Greg Kroah-Hartman).
> 
>   drivers/usb/usbip/vudc.h          | 6 ++++--
>   drivers/usb/usbip/vudc_transfer.c | 8 +++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> index 5ef0e7d9b23a..c129f4c56e8a 100644
> --- a/drivers/usb/usbip/vudc.h
> +++ b/drivers/usb/usbip/vudc.h
> @@ -157,8 +157,10 @@ int v_rx_loop(void *data);
>   /* vudc_transfer.c */
>   
>   void v_init_timer(struct vudc *udc);
> -void v_start_timer(struct vudc *udc);
> -void v_kick_timer(struct vudc *udc, unsigned long time);
> +void v_start_timer(struct vudc *udc)
> +	__must_hold(&udc->lock);
> +void v_kick_timer(struct vudc *udc, unsigned long time)
> +	__must_hold(&udc->lock);
>   void v_stop_timer(struct vudc *udc);
>   
>   /* vudc_dev.c */
> diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
> index d4ce85c4c6a2..ba625622975e 100644
> --- a/drivers/usb/usbip/vudc_transfer.c
> +++ b/drivers/usb/usbip/vudc_transfer.c
> @@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   }
>   
> -/* All timer functions are run with udc->lock held */
> -
>   void v_init_timer(struct vudc *udc)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
> @@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
>   }
>   
>   void v_start_timer(struct vudc *udc)
> +	__must_hold(&udc->lock)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
> @@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
>   }
>   
>   void v_kick_timer(struct vudc *udc, unsigned long time)
> +	__must_hold(&udc->lock)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
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

Have you tested this with real devices bound to a host and exported
to a client?

thanks,
-- Shuah

