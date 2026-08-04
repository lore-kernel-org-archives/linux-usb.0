Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090A37F741
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864687; cv=none; b=PzXsu9iOwPGF3ptPsaF6fhJk4lU5NWYpd/8ZjuuXZ4+b+15+3wJ7FaIDp4U1aeL5T8LWoOLIajEP+g9iaHP7WDTJzboPpCgYipOqt147FMXh5T1ML4MO5XtqmK9c8PnOa0qO/pzGUuMxejgH8wUV66dH/b9yKXvTRuuBkXy+Cog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864687; c=relaxed/simple;
	bh=PEIo+F6nSB/oPmXub2a1WcIGBd3T5QhN0xPjELeCzQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqlHoy7WPDC3qPYNHep0xOQiA6JL8GHOXim7MZRlXA9UAbpq5uHVPoTM4bihZyGDzQm3Ym4Wm0Mt22npiUCZ7lfhcUHmdeVXf2ItbCTtEHHMmi7zLy3idpZJ0+mAGI3HbhOMI+ej6XS4Y2tDAAO3pWIdNtWffReNZRzZvytwBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DEhkO8L+; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DEhkO8L+"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ec1e9d3359so128809a34.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785864684; x=1786469484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nShkqNi6OVr5kcjYAHosuW4Py7XxiJXhmTYRr0hY3Fc=;
        b=DEhkO8L+kplLHHMgpjKXPIbiCNjNvATB/T9IKH1TV08XPvuG142dP2sX2iggzZauuF
         9mVzcVX8l0C0vSCbh8B79d734eaPhhtM+6QcbEo9g2tr3rw9NaPa6xxnSUnqQoQYfATC
         CqQZGSR2CYMV22RVBeRNrexJn4PqljwKMjULE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785864684; x=1786469484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nShkqNi6OVr5kcjYAHosuW4Py7XxiJXhmTYRr0hY3Fc=;
        b=PE3GkG47svwLpcPM/nyzNjKjFWR5Oca7ML1KgI80bD+ub5VoKwWv8HBsoUxooHadyn
         QaaYaRK9Kml1AvzHpLTP5LqJTcS7ZRHaQO2LDOnTK5XcR2LG4pQFNyxW/P+oPWyPbVUJ
         NzunXdsOzZ6+GFacuh6q4ZIFhNxImD3LLte9AqQ9F8yHzsRCdIZaKGUP4hgExIbAjQec
         LGhgjRh11XUk4TsA4GPxGNY7n2CGrJeDLkHsjsNSkatdd0RLclUiT7IC09cwTLbej52Z
         2sI/cpLZNY7hgPof1LRlHp/5lQiRR/mdheoWghGnpgDwokqqpDBhwviVivoO6QVLNYsu
         Tyyw==
X-Forwarded-Encrypted: i=1; AHgh+Rrv0zEgHQBqBGSoCVhJKpj66DsOAX4RWT7oyOVhvIf7pbbxlobg4TRCy5kxfyra+syyjIs86K2P5eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNTCbI50Th2teIqBYyPqoL3JKP3IwsUPwZh7xirvtSi7auG7Ga
	BPem9j/EDDSbS6qgqmoDkgEkiGYaSmNXniwfxoLvbUNuDwQUfF+UDQw5nG9cAIwIrgo=
X-Gm-Gg: AR+sD12SZ/r+RBqNYc0UbYHGOQ8OJaQN//PFho0LApnUQp3VUC5+K4x/xGZTKPBr7Y/
	o0WL1vFskeInF+SAc9NypCET/zCh0jP7PpR+2BMM0oiiFUtsqNmN0u3OSR/TYIQgPaTibcDpBB7
	j50nbIuWNw8LGOrsj364vKj2Ie9rMhKwE9zzxvRAaGgb9pEn1x2bIZEVhP/rQtPApvxZlUwRQRE
	rAcvmeFqaX4Chvbfh+M3ZxQuBxjjTGYZwpgsONKTzC4nIsn7G2BaQ92ArI3lpLSn7ap/ePdiL3T
	R8/ZUnnVs2oVozcy8Ktfgb/MzYqEmFuf8YLo4l68V99Z1nmoQggGwXzo4lAjF0d4h8Vugn5FWTw
	swjsX+MXh87K5VFbbZyvOjA+/OleEk6zJqKs8MqlTevMg28fuTDEVACGoOxfEhkliLBC1avdcJU
	nm8zd2Ny9U22hf/8HwFRIMYKImQyNBhay3zYtb9bVmpOe/qPJ1FRKD+gwD1/80TMK/UQ+pzA==
X-Received: by 2002:a05:6830:83b7:b0:7e6:ef2e:28a5 with SMTP id 46e09a7af769-7f1e5f5ed24mr508079a34.15.1785864684292;
        Tue, 04 Aug 2026 10:31:24 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5e21d0sm1396175a34.27.2026.08.04.10.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:31:23 -0700 (PDT)
Message-ID: <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
Date: Tue, 4 Aug 2026 11:31:21 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: fix use-after-free in event_handler()
To: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
 Aleksandr Nogikh <nogikh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Valentina Manea
 <valentina.manea.m@gmail.com>, Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, syzbot@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/26 09:05, syzbot wrote:
> From: Aleksandr Nogikh <nogikh@google.com>
> 
> The event_handler function in drivers/usb/usbip/usbip_event.c is a
> workqueue item responsible for processing events for a struct usbip_device.
> During device teardown, usbip_stop_eh() is called to wait for the event
> handler to finish processing. However, usbip_stop_eh() uses
> wait_event_interruptible() and ignores its return value. If the process
> unbinding the driver receives a signal, wait_event_interruptible() returns
> immediately, causing the teardown process to falsely assume the event
> handler has finished. 

Does this mean unbinding didn't happen?

The teardown process then proceeds to free the
> usbip_device memory. Meanwhile, the event_handler workqueue is still
> running and attempts to access the freed usbip_device, resulting in a KASAN
> slab-use-after-free crash.
> 
> BUG: KASAN: slab-use-after-free in __mutex_lock_common
> kernel/locking/rtmutex_api.c:559 [inline]
> BUG: KASAN: slab-use-after-free in mutex_lock_nested+0x5a/0x1d0
> kernel/locking/rtmutex_api.c:578
> Read of size 1 at addr ffff8881145245b0 by task kworker/u8:5/6177
> 
> Call Trace:
>   <TASK>
>   lock_acquire+0x84/0x350 kernel/locking/lockdep.c:5842
>   __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
>   mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
>   event_handler+0x1e3/0x4a0 drivers/usb/usbip/usbip_event.c:73
>   process_one_work kernel/workqueue.c:3322 [inline]
>   process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
>   worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
>   kthread+0x388/0x470 kernel/kthread.c:436
>   ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> 
> To fix this, change wait_event_interruptible() to wait_event() in
> usbip_stop_eh(). This ensures that the teardown process strictly waits for
> the event handler to finish its execution and drop all references to the
> usbip_device before the memory is freed, preventing the use-after-free.
> This change is safe from deadlocks because usbip_stop_eh() is never called
> with locks held that the event_handler would need to acquire.

Correct - usbip_stop_eh() is called without lock hold after updating
the shutdown_busid status to true. However I am curious what happens
to the unbinding? Should usbip_stop_eh() check the return value of
wait_event_interruptible() and handle the error instead?

thanks,
-- Shuah
