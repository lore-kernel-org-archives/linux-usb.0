Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419A41F7E1
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390407; cv=none; b=aDJSqk/Hg7MBBHr/drcuxN9jFX+pg85yqzJ4l3Qr2f4OU5l94uua+yBsGrod74+2a2hxNutsFO6Dd4QgWH/j9+uy/Dd+GxvviPCxFhordsPEXewz6YVOFYg+uG/VDuCdmslRPJUD4qMAot5bsEyQuGH9ZyGXO0TZo0hxct2yza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390407; c=relaxed/simple;
	bh=SW5/seaUl+tZNUVKwpdaQB5vHV2SqlBFmBBbRGHqLu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZEyfX6G44k3RKhLO14RY5iMIXGARLp1zc+BuIudTk6kLbxNMUQSR4HFCxY6Iha4WF0yvTlN/xOyceMi87ul+SRqoCWan2vawywbMGuTn4RmUnRlKLjK9HkpSTuo9wnvNMmXATGjd+Ye8sbHbuVSFb1+QNz/eC8b0gQLlSdesoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PVwzylR9; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PVwzylR9"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ae50ba83efso158507eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786390402; x=1786995202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrRlsgcOgMJKftL8Bqe2As9MXqW/RKYfWKo2wJ61FY8=;
        b=PVwzylR95W8sUinMFu/x2GTRQ+B9p0fqZiaAlzC33nBoOBRlExlOziF6rdlppeFJWK
         RO5KAtyIfh0jPkwf0krJOXrI/Zor7X4kogJCK6xtLgVSAxhOh0TUh+HpNAhAaEpgLZiy
         Mbyo6Ua3SG1KMbh2MY+ATAGe3rXZv+Cy4UMwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390402; x=1786995202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrRlsgcOgMJKftL8Bqe2As9MXqW/RKYfWKo2wJ61FY8=;
        b=pxNWoqBHyZlpgBTIjDOElMAtPoL76IegIGyPsrQ5hcD+MhVNfXrvc7V5c7YnI98aKU
         c7R76qEC3pHAySO3s1f10R85l/XkFDvTc+2L5KLTNI29LUF8SGQbQg0Izto5eA7lCICZ
         LFJmd2unQxIpeSuOnw0EvOfx4LGiW9jAzm+Uv6+73YchcpWe/Z/QEY6UqUk4mEWsbxyn
         hfy/sm02OpxxdfoCERwifFUNo7uP7luOSzQLFP2VPEgV/xr68q9bfDnEoyeBlS4pnBiG
         pNaT+ih+79i2l/HNJSejYbceWOXALlNabflLcyAtgRylDQxAFH3o8W46C6YuFexXUWFb
         TtbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4s4Ozm3vfq8N5chT/y/PRf+G+A2BkikTOwthM0JYd80oahdgjF6raG6HWPcs0gEC6K6+9BrnYqXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv3Elcgw//LzUunc4TXJY+zKwjrw7DiepJ/J9yXOnEp1oNyoa
	SExrXZn0zj1ZEhxMTkeAY9a9tkMwSG/JqANHmV0F0JlbfSLdOpG0oRSJmKOSmFOWLqs=
X-Gm-Gg: AR+sD12ndu1/EAz/sn8zcEmhRYeOZ7/V2MAHtCS9UWvSE5Pqc45k7EBjH2vD8k8UyWU
	0WQDItvq/v/Z8kMR0B0Wd/oHQBO+VFXFVJ6CEvQq95woK37tYpu94LZSslbk8/YF8qOkkrne4Lm
	E2bSIdPwBIbxNQi/X8N3qh8xun8bfRDaXGlyNZA0oB3mfvghwkE/xFj2Mdmd+C2B3Y6slHsruXL
	WTKzGatRIku6vO2RNdStGP+TKuFQglRN5vPzVA01BZq/8fqGVjtaRkO8CqJTTTDTFD9QcXYl4nE
	74X/5DHVoLlCeFg6lkUQEs7/eMCt05RhFgA2mn6Vy5d4+1iXd1G65cf7LvzDc1QkY6UqIbQh+VS
	Lr1euBrHkSvShRT7f96hbyfUoL6fzJK+PM3pw3qK/o7NFbNK/Ehq8HB542f7kizIG7101rf7h+v
	tiiwn8aFMgsjO6rt4tmq+Ujvjj33lxI4hr1PB7ZinobgwbN4s2vFEnXTU78/hH+uJDNCKvnw==
X-Received: by 2002:a05:6820:178a:b0:6b0:40d9:8691 with SMTP id 006d021491bc7-6b099ae1beemr490758eaf.8.1786390402359;
        Mon, 10 Aug 2026 12:33:22 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8909201fac.6.2026.08.10.12.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:33:21 -0700 (PDT)
Message-ID: <34d4ca1b-ce89-444f-bb02-245287edfad0@linuxfoundation.org>
Date: Mon, 10 Aug 2026 13:33:18 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: fix use-after-free in event_handler()
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Valentina Manea
 <valentina.manea.m@gmail.com>, Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>,
 i@zenithal.me, linux-kernel@vger.kernel.org, syzbot@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org>
 <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
 <CANp29Y51K1Y0Z77oUEQmDpVPjJuz3fQhvvZp2=fw3GWSPiCg3w@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANp29Y51K1Y0Z77oUEQmDpVPjJuz3fQhvvZp2=fw3GWSPiCg3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/26 08:18, Aleksandr Nogikh wrote:
> Hi Shuah,
> 
> Thanks for reviewing the patch!
> 
> On Tue, Aug 4, 2026 at 7:31 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 8/3/26 09:05, syzbot wrote:
>>> From: Aleksandr Nogikh <nogikh@google.com>
>>>
>>> The event_handler function in drivers/usb/usbip/usbip_event.c is a
>>> workqueue item responsible for processing events for a struct usbip_device.
>>> During device teardown, usbip_stop_eh() is called to wait for the event
>>> handler to finish processing. However, usbip_stop_eh() uses
>>> wait_event_interruptible() and ignores its return value. If the process
>>> unbinding the driver receives a signal, wait_event_interruptible() returns
>>> immediately, causing the teardown process to falsely assume the event
>>> handler has finished.
>>
>> Does this mean unbinding didn't happen?
> 
> The unbinding did happen (and finished freeing the memory), but
> without actually waiting for event_handler() in
> drivers/usb/usbip/usbip_event.c to finish processing the removal
> event. As the device memory was prematurely freed, we got the
> use-after-free crash in event_handler().
> 
> For reference, here's a C reproducer for the original bug:
> https://syzkaller.appspot.com/text?tag=ReproC&x=16ffb7b9580000
> It sets up a timer to deliver a signal and wakes up the
> wait_event_interruptible() call.

Thanks.

> 
>>
>> The teardown process then proceeds to free the
>>> usbip_device memory. Meanwhile, the event_handler workqueue is still
>>> running and attempts to access the freed usbip_device, resulting in a KASAN
>>> slab-use-after-free crash.
>>>
>>> BUG: KASAN: slab-use-after-free in __mutex_lock_common
>>> kernel/locking/rtmutex_api.c:559 [inline]
>>> BUG: KASAN: slab-use-after-free in mutex_lock_nested+0x5a/0x1d0
>>> kernel/locking/rtmutex_api.c:578
>>> Read of size 1 at addr ffff8881145245b0 by task kworker/u8:5/6177
>>>
>>> Call Trace:
>>>    <TASK>
>>>    lock_acquire+0x84/0x350 kernel/locking/lockdep.c:5842
>>>    __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
>>>    mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
>>>    event_handler+0x1e3/0x4a0 drivers/usb/usbip/usbip_event.c:73
>>>    process_one_work kernel/workqueue.c:3322 [inline]
>>>    process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
>>>    worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
>>>    kthread+0x388/0x470 kernel/kthread.c:436
>>>    ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>>>    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>>>    </TASK>
>>>
>>> To fix this, change wait_event_interruptible() to wait_event() in
>>> usbip_stop_eh(). This ensures that the teardown process strictly waits for
>>> the event handler to finish its execution and drop all references to the
>>> usbip_device before the memory is freed, preventing the use-after-free.
>>> This change is safe from deadlocks because usbip_stop_eh() is never called
>>> with locks held that the event_handler would need to acquire.
>>
>> Correct - usbip_stop_eh() is called without lock hold after updating
>> the shutdown_busid status to true. However I am curious what happens
>> to the unbinding? Should usbip_stop_eh() check the return value of
>> wait_event_interruptible() and handle the error instead?
> 
> During unbinding, we must wait for the scheduled removal event to
> finish before we can safely free the device structures. From what I
> see in the code, once we have reached wait_event_interruptible(),
> there's no way to abort the process or somehow gracefully handle the
> error.
> 

Yes I agree with you on rewinding being hard.

Care to explain the scope of this assist?

Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot

thanks,
-- Shuah



