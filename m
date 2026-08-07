Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DEB28726E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112319; cv=pass; b=iHkjg28VDCy1gxag6j6HKwucrknH4ovsyKeQwNuQ8PQr4uiPLGQLPw34O/4yiXwN5WK/h+QAbm0QxCUWOA47RBZSlqkMPvD2KI5pJuWRbaOj89YAQ4TVQUGEuAGw1oHNyu7Fnt/jqmdQYhcU0bEuRHYoW5PFIuVim5mneacxEno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112319; c=relaxed/simple;
	bh=xQuwE/MAnkcPhAl1xnNy+xdjjQRvVgNAORp7hRl0fbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sz7Z4hC3pBsMybdIVB2tE7/71zs+9wk5rjbJP58R+bDRjcSiD7HFMHJHzhkKYA71k5Is/WAIMXCCSOi8ruxI9u+44EiQhShWt98Pq9X4F5hJZS1qZOhfYqMDDWFn4nHL62MZcMi95ugTb4yhrHaeHeRp5DYt5/N9DRdABx4kqbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KS1n+h2T; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KS1n+h2T"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-49fa951b2c6so1997472b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786112317; cv=none;
        d=google.com; s=arc-20260327;
        b=C0eOJ9LZpcxj1yBWsCtWnHS/CBTYJUcd/LbzVd1lxVhxEmpk4DA1ZdQ2oq2M+/P2DK
         O/0Q2IZWcy1JE7SYTjjDhbyEVHUoKncTkLX4xc2L4jLzGHImlf4J25A2ehVt6TSnsFnr
         8SQYrTdeP5W1BSrqn8/sFt7XUbpf3+zrmEiQbro3HTZCb3Du3SZsoyybUd0obh4FQJ9a
         DGheDtb8fIW7jqYpDtQ9kxr+mXZRCwLmqCSzjxxTf0YVDQEHNLy0EhQap2rGSOIhTMvM
         sjhaBqr185P+7jYUWvVnxgTyXJmKLv0ZuhgA4LVaZ8KeatHq1DRhaiom2vi5v+JOS7jC
         iBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzs4z8L+wfJloOnGXsZCdQZ4DprTclm6OHqI46jCAx4=;
        fh=EvswwP05rmZJJmUpyG1se8tnXPzhfHeQckh+wiRcQu4=;
        b=bES6FeUBLcNohnnBpR/766nZ5ZtZEVUEPYsehlK4S6xI7NsHi75olr3hECrx3d5yGP
         sdEppgaNZ7P8OercW4NzvRIpsXIDUOH6rELga/agN9L7sjFHcUqLEMC7BF61qa8raMgC
         qEoZsev/pXrOv3KU9UvIF/RKxMTqGxU1YKr2ZCLAbtTpZFG2XErI0SBIpe+aoihRJva0
         0tacywvV1u7eYzVIqshwbPyebw9KPrF+2RrZZsOGCMSI1yiXkjX4fLGpWj0nS66mO98L
         3KOuYOYMkLkYiapbYUF964QS7NO9dyG/EQ89h8oH/ykTGPfdUOqA7KJMRjYXu+8aeO01
         ciAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786112317; x=1786717117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzs4z8L+wfJloOnGXsZCdQZ4DprTclm6OHqI46jCAx4=;
        b=KS1n+h2T52V/4YqhaZhdJ8AUAsV58RqUhohza0DsoxzmqgPF5wnV+pmiH+otPP1YSH
         SPDTP/wuOS8HZBX0weznTFN9+d0HhP+Zi7lc3axqylEpKjyJOUyre/TJqxdNgtXmpTl1
         IqIfoZAL9V7MiCQAl5iPXAoyEqYL3tztaiyclr2Nj4NglbJxY0qFjp50OaZf/E+5ZFo0
         dLXGRw2BUm/igFfsua1MWzJuQg+Oj0dOkOS6Ex+mcPVpyYsVhwRyvwVHH127kUJ80NRT
         56kvMBg9UyLAtp2Mh/97agcZxaL08WmB5pxLxwWt4jhDY5EqQ9vKnRNG4JGTktejoVRZ
         cJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112317; x=1786717117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzs4z8L+wfJloOnGXsZCdQZ4DprTclm6OHqI46jCAx4=;
        b=aPLFRBolgGcUI3m1dPBgOxgL81U7frMH/lwT7xwkdiBH+3ViMhcdlbyeojC8OSKP5X
         TPLKCZuakQVat9ynxNEhoPj5+epPTPIjUQs2TmLhLec+1icCPmECztdlNtpLkUWTWX69
         cFkXNUxkm/sq+fBpr8C3hOhcedw5DF4HR3LF54V9PJMyPHd4cKosipcNqM9w1FgXmCY+
         oHz55ZtiN8x0Kzfrng/mWWw+pBzKIYVwivB30iO48V62FAEvztfMKe62tcCNOCCiZ5jl
         fz5CIYVz9Hawr4VeIIBcX1Br/9eqEjVWeneg2Y0Gx38vWPitCDLHhyYUUkJO9EkhSV9j
         l6Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rov3+ZXPH4zEEV7G6Y2OyZB7c+wqCzxQAwLQLA9jJv2sGXcos2vpltb5zpOETc3rHXTjsV0eQazKUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQM/z8T9+c6U0Tn1qaE80YGDr90SwE5OO6zGMsYV65blU/fpP
	SCJxyz1uLCQ7Aw1YFd5QhT3rPy3cr/F2VS4IjHmrUyq1erkA4PvC5mjXPqrl519I/P2q7sK8xsm
	60dceLrNKJkyIrtDW2XlUk08SywTnmejNKfq8rbqM
X-Gm-Gg: AR+sD11PRp6aiYG7tg9PbBmXdIoxXuogfilIhLUdyHUN21inXWIJNuekcfcuwzNfUCX
	zvVnFS8N6Kal8oFgqBLeBod5wlESm6FVFoF40VjqiUwVfEhRi4gNmtchI6htiCE4AdvnvuyKm7g
	DeGRCCSt+sI7hw41CYz2ZJAUP4ZR+ZwHDrScs9ZnQpTpWT6vZSRBlRrRh+NKiZRkNAzdk4vPzEx
	aWbYpcsB/0ezPiIgMZj08jFSOhowYoyUOyzXSSvvzalRqGPYTvJOFQsOu9V1zYtvcVkzihGDhTC
	8zplxBSXtPnmMs/u5oGVODKsoABgX/T4PccyhQ19WmG64XXNrHmbaVR4ccok4cd5z0dZDuBgNMw
	ft9xuBi88EsNSQuK9D2WsDro8JCNgg2+7s7yNMXk9IWXXKFoncRnqCzNU9AP1+5ylpX90tAxtYk
	mmVSCEkRnWAhy+
X-Received: by 2002:a05:6808:344b:b0:497:dedc:605c with SMTP id
 5614622812f47-4b1ab77a7a9mr287484b6e.7.1786112316084; Fri, 07 Aug 2026
 07:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org> <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
In-Reply-To: <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 7 Aug 2026 16:18:24 +0200
X-Gm-Features: AUfX_my4HtjtCrRtKzHWyUtzFni5hkI-iqkp7piQNUPiq_LTV40Dav2LnTa-Mwc
Message-ID: <CANp29Y51K1Y0Z77oUEQmDpVPjJuz3fQhvvZp2=fw3GWSPiCg3w@mail.gmail.com>
Subject: Re: [PATCH] usbip: fix use-after-free in event_handler()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>, 
	Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>, i@zenithal.me, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Thanks for reviewing the patch!

On Tue, Aug 4, 2026 at 7:31=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 8/3/26 09:05, syzbot wrote:
> > From: Aleksandr Nogikh <nogikh@google.com>
> >
> > The event_handler function in drivers/usb/usbip/usbip_event.c is a
> > workqueue item responsible for processing events for a struct usbip_dev=
ice.
> > During device teardown, usbip_stop_eh() is called to wait for the event
> > handler to finish processing. However, usbip_stop_eh() uses
> > wait_event_interruptible() and ignores its return value. If the process
> > unbinding the driver receives a signal, wait_event_interruptible() retu=
rns
> > immediately, causing the teardown process to falsely assume the event
> > handler has finished.
>
> Does this mean unbinding didn't happen?

The unbinding did happen (and finished freeing the memory), but
without actually waiting for event_handler() in
drivers/usb/usbip/usbip_event.c to finish processing the removal
event. As the device memory was prematurely freed, we got the
use-after-free crash in event_handler().

For reference, here's a C reproducer for the original bug:
https://syzkaller.appspot.com/text?tag=3DReproC&x=3D16ffb7b9580000
It sets up a timer to deliver a signal and wakes up the
wait_event_interruptible() call.

>
> The teardown process then proceeds to free the
> > usbip_device memory. Meanwhile, the event_handler workqueue is still
> > running and attempts to access the freed usbip_device, resulting in a K=
ASAN
> > slab-use-after-free crash.
> >
> > BUG: KASAN: slab-use-after-free in __mutex_lock_common
> > kernel/locking/rtmutex_api.c:559 [inline]
> > BUG: KASAN: slab-use-after-free in mutex_lock_nested+0x5a/0x1d0
> > kernel/locking/rtmutex_api.c:578
> > Read of size 1 at addr ffff8881145245b0 by task kworker/u8:5/6177
> >
> > Call Trace:
> >   <TASK>
> >   lock_acquire+0x84/0x350 kernel/locking/lockdep.c:5842
> >   __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
> >   mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
> >   event_handler+0x1e3/0x4a0 drivers/usb/usbip/usbip_event.c:73
> >   process_one_work kernel/workqueue.c:3322 [inline]
> >   process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
> >   worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
> >   kthread+0x388/0x470 kernel/kthread.c:436
> >   ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >   </TASK>
> >
> > To fix this, change wait_event_interruptible() to wait_event() in
> > usbip_stop_eh(). This ensures that the teardown process strictly waits =
for
> > the event handler to finish its execution and drop all references to th=
e
> > usbip_device before the memory is freed, preventing the use-after-free.
> > This change is safe from deadlocks because usbip_stop_eh() is never cal=
led
> > with locks held that the event_handler would need to acquire.
>
> Correct - usbip_stop_eh() is called without lock hold after updating
> the shutdown_busid status to true. However I am curious what happens
> to the unbinding? Should usbip_stop_eh() check the return value of
> wait_event_interruptible() and handle the error instead?

During unbinding, we must wait for the scheduled removal event to
finish before we can safely free the device structures. From what I
see in the code, once we have reached wait_event_interruptible(),
there's no way to abort the process or somehow gracefully handle the
error.

--=20
Aleksandr

>
> thanks,
> -- Shuah
