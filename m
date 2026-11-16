Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861238;
	b=3G+fyVHD0Qb1962zvZ0AWVdhMnW//gHOlbW3oGclA9AhJxWg6PR1fuOcPD8wDD1Kc9Wt
	 5A+2onil1EQoyOyCFLzKr8GepTDbEI/Sym+vZn/rEXrH1n18tBAl3h+OSI9CV/QdhrGAx
	 3jKMNYK66ZYSDcK8DuaJu0u8pb1Ia9XrU6NDxSVAdg7QSCSt9ovV2gCAaOEnHMP5VEc8r
	 OJHQZ/b4d97EOB9Uh4OhiDvNLj9HILQP05b0QDhGDnoRiVRZNnq1urvCZPPtkanQmMHOO
	 CXbv5NFtVhb7E2FhijjWiBx4u8+4nNhwjjqWqJCq1B0SND7IekYrhmWJGH6pF88+VcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rP/P3UN9pRURk03EKu5GqOEiOBaJrHMSu8MWN5EnCNM=;
	b=Sw2lL0t1AFpy0oE9NV43LxxK0zgA/UwFGnfO/I2JgrWxiPCtHwjo+knD2r6PXXcj3/A3
	 h23x6z/lHe+6rDaGTZgVBM/FqMgEWWHEa4KWr5SmCByVO3hNXqOizcrfg0pwfG2bK1e1K
	 kZU2/FmZ/N62jtP8FzmVJDvieIabvXqF0QxnmxCD3GhvI5fgXqPR0ugOVPjopxFo84oh+
	 83ND4UdQlS3eGcNV9ebkDYzNuR5qtLiqek4hB1EzxnPXaDdVNVFrXs9kpwOILEpcwOoSR
	 5hPoSxt9ws9ibS29NLGYzoyFqWDHCL5UnTHswOY1Mlq2rvcNT58luOZTTQg3GPgNong==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jFOlX4Bp;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213E606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 20:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9213E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jFOlX4Bp
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2149141a91.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 12:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861237; x=1795466037; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rP/P3UN9pRURk03EKu5GqOEiOBaJrHMSu8MWN5EnCNM=;
        b=jFOlX4BpgG8rI8jqom7Qtfwj6MrVOKQt1i9mUtrI4/gO5oieRpAjWVbbWHzjnbV6h5
         r15c4l+otq1oJdOBuS9dMSFAoWPsuzZQSxM1p2q7ILrwEylFBWF0OoVq8yXonNIj9tKB
         bT3dliupbUNMtUoMXJsMnz+gzCEuHSw05Td9TFiDe0UddjehS8WgHUyFFFu2aABUsLPt
         zYlaOWLk//6z4j7O+ecXpqKFYMXWOynhO0Ucs3ibXpwRh7L/VK4aEiKFtXyzhG/YTmrs
         BLRPrMtWP99a0sRQOpColTFD+/k/8maLnjvX+Wh56U8FXf+5V3vaCAvK4KJ2cOgWIEIr
         igmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861237; x=1795466037;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP/P3UN9pRURk03EKu5GqOEiOBaJrHMSu8MWN5EnCNM=;
        b=2oPe3YcxWl11JYZLzJC7d0swnLyEziKKPq4GTiXRyMzfqe3sbUXim72NVTMY2KuhIS
         m/F8YLHdgEig9S6lsJYwz54AQRIOXx354CdtMycSXVUidRAbjx4UIRCyyDhxK4UO1obZ
         0lWKyhMG5L+7c7YzERm+du0rxQnVsLUcDo0CmVpcmMgxsMltaH7EB7W+mjI4U3B/5ZG0
         dztVeUQ1v/c6xn2x3UIyuLP5BD3nt8vo7p92/oYujEnl7nYSFr+ltWacBgrQKQDp3ZOY
         Dxx3v+u9TUtP9fc4ymp3v85GxLu1sPEOHIJ0yvqqFbkoFxuEZaTXzPueqfAPBZfLdAc0
         km/Q==
X-Gm-Message-State: APuU4Z8HrNV+F8hf4ZybNT6b0UX4jOo8w4UwqilltGaYWNfXnLeMO1+5
	gXUxwZ7MttBjuefE/KQnB8yrIsbJ6z4kI7noK2iun3Jxe5RHAwoHzYfwJlM/gnqq5V9TdIInCLq
	Zx4cZMGEXkQ==
X-Received: from pjzt10.prod.google.com ([2002:a17:90b:58a:b0:3b0:944b:61fc])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e88:b0:3ac:eeb:e0ed
 with SMTP id 98e67ed59e1d1-3b1b0ca34b2mr10485741a91.36.1794861236532; Mon, 16
 Nov 2026 12:33:56 -0800 (PST)
Date: Mon, 16 Nov 2026 20:33:51 +0000
In-Reply-To: <20261113063409.47485-1-lui2012qwq@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179486123129.2938203.11196849096055246374.b4-review@b4>
Subject: Re: [PATCH v2 0/4] usb: stop timers/works left armed on teardown
From: Neill Kapron <nkapron@google.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	nkapron@google.com, tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr
Content-Type: text/plain; charset="utf-8"

> The teardown paths in these four drivers do not quiesce every producer
> of asynchronous work before draining it: an interrupt handler may still
> queue or re-arm a timer or work item after the cancellation, while the
> corresponding object is being torn down.  In three of them the IRQ is
> devm-managed and freed only at detach, after remove() returns; in musb
> the plain free_irq() happens later in the same remove path.  Either way
> a late interrupt re-arms the callback, which then runs on freed memory:
> 
>   [1/4] musb core: musb_stage0_irq() can schedule irq_work (and
>         finish_resume_work on remote wakeup) from interrupt context,
>         irq_work can also re-arm itself from the session recheck path,
>         and musb_hub_control() can arm finish_resume_work and
>         deassert_reset_work until the root hub is torn down;
>         musb_remove() cancelled all three too early.
>   [2/4] musb dsps glue: the devm VBUS interrupt outlives the child
>         teardown that deletes musb->dev_timer; its handler re-arms
>         the timer via dsps_mod_timer().
>   [3/4] r8a66597: r8a66597_remove() deletes the timer while the devm
>         IRQ can still re-arm it from the VBINT path.
>   [4/4] gpio-vbus: gpio_vbus_remove() cancels the work while the devm
>         GPIO interrupt can still re-arm it (100 ms debounce delay).
> 
> Two further instances of this defect class found in the same sweep -
> pch_udc and lpc32xx_udc - are being handled in Hyunjung Ko's
> "usb: gadget: pch_udc: drain vbus GPIO works before freeing the
> device" and "usb: gadget: lpc32xx_udc: drain the pullup work on
> removal" threads, so they are not part of this series.
> 
> Testing:
>   [1-3/4] build-tested on x86_64 (COMPILE_TEST where needed); they
>         require hardware we do not have, so no runtime reproducer.
>   [4/4] additionally confirmed with a KASAN reproducer: the driver
>         probed on a gpio-sim chip in QEMU, slab-use-after-free write
>         in __run_timer_base() after unregister (5/5 runs), clean with
>         the fix (0/5).  The KASAN report and the reproducer kit follow
>         in this thread.
> 
> All found by static analysis.  Fixes written with AI assistance.
> 
> Changelog:
> v2:
> - [1/4] also move the finish_resume_work and deassert_reset_work
>         cancels behind the interrupt quiesce, per Neill Kapron's
>         review; finish_resume_work is armed from interrupt context as
>         well (musb_handle_intr_resume()), and both it and
>         deassert_reset_work can additionally be re-armed via
>         musb_hub_control() until musb_host_cleanup() tears the host
>         down.  Suggested-by added; Fixes tag corrected to
>         commit f730f205cc51 ("usb: musb: Split PM runtime between wrapper IP and musb core")
> - [2-4/4] unchanged; collected Neill Kapron's Reviewed-by.
> v1: https://lore.kernel.org/linux-usb/20261112160448.41566-1-lui2012qwq@gmail.com/
> 
> Chengyu Liu (4):
>   usb: musb: cancel the delayed works after quiescing the interrupt
>   usb: musb: dsps: free the VBUS interrupt before the child teardown
>   usb: gadget: r8a66597: free the IRQ before deleting the timer
>   usb: phy: gpio-vbus: free the interrupt before cancelling the work
> 
>  drivers/usb/gadget/udc/r8a66597-udc.c  |  8 ++++++++
>  drivers/usb/gadget/udc/r8a66597-udc.h  |  1 +
>  drivers/usb/musb/musb_core.c           | 15 ++++++++++++---
>  drivers/usb/musb/musb_dsps.c           | 11 +++++++++++
>  drivers/usb/phy/phy-gpio-vbus-usb.c    |  8 ++++++++
>  5 files changed, 40 insertions(+), 3 deletions(-)
> 
> 
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
> -- 
> 2.25.1

Thanks for V2!

For the whole series:
Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
