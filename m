Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811596;
	b=MNyRVgwphqc9FlU/rQ4J1x6WxwshpsNRDqVxRbFzYdhcbrqzGJshfgj9TmV4qmsY0UuX
	 iGJ9TLAwuBdNsmnWASiknevNTYeLv19sZaXM7yDhU2oyWtOwwjBzAl4mToWn6Cnp78O1e
	 aYzi4DSmBqc0ikcAA50Trc5R6mls0u1MfhNgICT4TqseIrx8yw7/uBTOCHBUkcU2qI/ya
	 S30SMZ7vjhJadcBnrAdgS55xRIqu+3WkvjqPG7VpxEJgEDiWA3e+vTvBYOKRg+xmZn8Mj
	 4D11xOzTPHLvPLqpr/UTeW/T8LXASeUrKi9zqV94+vvJqhkjmqz8hxlnvP4Yp1x9t7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
	b=rAx9MrGGK0Qx9oRUmhHvix63HYgGz1PwhRBOi9EJwwT2hE+uaehCNih8TNKfGNxw9Bgn
	 4wzTJnoeTRyjAYsKq5GhI/70YkaUWx9oPLGBvjqux99H/vSy00pmox52lJeY2g4wLmy8X
	 3SILDR1xS5Dc3qivUbsOPyAkAnBcBo5HNj3/o0eWC7i3/L12QAGzd3fP3f0l1ZTMQpXR/
	 Rjc+WqHkqIJxClZFVeQF520FnEzS56ugE8ILhYkzdmHq295GiM4a9V6uZWJnKIGoJHgpP
	 JeXhRZolZI1KYSO4+hz6kGJdLWj++XNqtG+8zQ20RKQ5X5f1bCrwBcN5fe3AA6LMXEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCMplPqy;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F7606A32F
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 16:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4F7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCMplPqy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so165094f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811594; x=1794416394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
        b=aCMplPqypvZ02Qbsm7VMD3bTNFEpqoSx1cyTAXBIt7KNVO+q2nAmW/IKy2PuDVXETR
         WHBjMbNP+1l3BOQE+u2M8lp5zAPtu7PPTazCS0uyJ+nO1RPAr+XWi9bxVx5lKiMH4ywd
         +Cl4vFbEHFnZywwCIRYqrtTYmdU3bnh3mCcDhDlo/sMJ/pzojDkG8mZuyBddOCPbEs1/
         B3cj95SagdKjtw5Jj59Uvg7guAwnSBRBknmG6MIYCZSgKK+HbdEsEBaxlK9kZqFlOIq4
         kY8I5lmO6Lasd2+R8YN3f6/WKzvP6Z2+bgKt+5y4k8aAkZZRNWr6BtFkMTL64VVzFi+q
         GOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811594; x=1794416394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nBmuFFvpK9ZuJMVGhj4Fxmt/qwgnA7lrzzghhGHOis=;
        b=uibYsa3iI0nIKpekFs7YWYZWI/2mEUZZ8aCJ2AsS/3nHLk6xVjx4Sw9y2u8AO7Ttrq
         Fp1Yvf9EipMjM1ODtaZM5HxjFp1W3xjXhQYSCzIL+Sw5NPDy6KcZGazIrJoLrAOVd8++
         5eT+f4GG0CpOxYlzHwQXEU3eo71y84zX3Qh/IOxBZqR5JbIUQjBCM26pOFGs79AZnHkM
         js1jDbtExEWTn/9Kdjt3UgBoCgOi+JQftcRWWDumNKiSIYrtFnA5wUDq6cx+S3x/3iGR
         mL7BbsWI/Pt9EWiZthAVBz/Vi5rk3//70gXWiigbB+O9rUhJHTlrseKyO+LVl/ZqDTvE
         EvWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvc955tjwafVgZGt35+99fGu2dnCk6DizAUsmeh6WQqzMskeQ0DuP288Z8blIo/kLlcCBaAhLlS7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zP9Fqv3LWFL93+ZJvj+yNaV59B0UXtnv5eQH0Dz8pXnkMCGzr
	e1pUBH5bjKGKke5fUb6DivPm0S6yi2JMzZR4DJG9TbkJNhkkbpFfEDl7
X-Gm-Gg: AYBFou17m8bRtVVSN3gA90D7avyGxNeo2lXLsaRtKuz+Ny5m8fen8P6zFaQBU5s3dAk
	ibQyF1HYdDdFGPyvCWXXHxXOgGw58TFbWM5ZQTbeACCFHaWeNHLJjnTV+2noHm4G+pr8QUFJeA6
	hYScQdT8icOKum35tIsoK9OQYA1qwNqRHnRzpaBILqRnnITIUU08zXp1LmoqN/iE9uvlgzCZOlf
	2cbmmRMULiz6pC4Q95OcBAmMx4UdNbAPVzIN7UMekhGR+CKuSoMS5YsRCNGSxcOPisLFwVMQeyo
	V2g8brfoCioyMbDmJamvkFH/y8a//inHvwH6hhEjQ1wvMJTs7dpFEQ6vVQSgqnD/f7Qgg4K+Cng
	GilhbWyOK6G3oGgTOe0pdcEeJ8nXtvYBSaR9jfFjGxFwNbpMqiyfl8/TmhfyMoFcnDyjRHok42L
	gNDRSgJAhRajxBVhsDpVRu2F0BBZ4QIhLYgmty+m4r5ZEVcCwg0/kgOyezGO+6XyeitPtjrCCXI
	FPCX6uOrRFrvZqpcxDFvFne7HLXVXNvq9p78ssVwMWNJcphOlYasL9DL5NWj5lJWmY7cJO2QVJ0
	xkaTTEh9obHkz683lPA0J55lWJQtZyydb5LxnGQc5nZAll8BdWDnQ8rjcXZZcQ==
X-Received: by 2002:a05:6000:4804:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-4911aa56dc1mr33104f8f.28.1793811593929;
        Wed, 04 Nov 2026 08:59:53 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm4769440f8f.49.2026.11.04.08.59.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 08:59:53 -0800 (PST)
Date: Wed, 4 Nov 2026 17:59:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>, Cheng Wen
 <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <20261104175949.71804650.michal.pecio@gmail.com>
In-Reply-To: <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
	<20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
	<b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 10:02:48 -0500, Alan Stern wrote:
> On Wed, Nov 04, 2026 at 11:56:37AM +0800, YuanZhe Liu wrote:
> > The port suspend is a hub class SET_FEATURE(PORT_SUSPEND) sent from
> > userspace through usbfs, and the teardown is userspace releasing the
> > hub driver interface, which quiesces the hub and disconnects every
> > child under it.  Neither side takes a per-device reference, and the
> > usbfs control request is not serialized against the hub driver being
> > unbound.  That is also why xhci_bus_suspend() 100 ms after a disconnect
> > looks fine: this is a different entry into xhci_stop_device().
> > 
> > CLEAR_FEATURE(PORT_SUSPEND) is the resume direction: in
> > xhci_hub_control() it ends in xhci_ring_device(), so it cannot produce
> > this trace.  
> 
> > The patch makes xhci_stop_device() re-read xhci->devs[] and the "device
> > is going away" marker under xhci->lock, and give up with -ENODEV
> > instead of touching a device that xhci_free_dev() has already detached.
> > For that check to mean anything, xhci_free_dev() has to clear
> > virt_dev->udev under the same lock, which is the second hunk.
> > 
> > If you think the mutual exclusion belongs higher up instead - do not
> > let usbfs suspend a port while the hub is being unbound - I am happy to
> > work on that; from your message it sounds like you would prefer the fix
> > there.  
> 
> Don't know about Michal, but _I_ think the problem should be solved 
> higher up in the stack.

Perhaps in userspace? Or is it expected that root hubs (or other hubs)
receive random and conflicting requests through USBFS?

Do we know that the device whose port is being suspended has been
quiesced? Is its driver even aware of anything?

What I find more disturbing is the existing protection from this race
added by 88716a93766b - it looks like core was triggering this too.
I found this usb_disconnect() code suspicious:

        if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
                pm_runtime_put(&port_dev->dev);

        msleep(150);		// my addition

        hub_free_dev(udev);	// this drops xHCI device state

        put_device(&udev->dev);

but it seems that even with the sleep, the bus only gets suspended
after put_device(). So IDK how that panic was possible in 2016.

> It sounds like the sort of race that could  affect any HCD, not just
> xhci-hcd.

xhci-hcd is affected because it tracks association between devices
and ports and accesses devices on port suspend. IDK if others do.

xhci-hcd shouldn't even need to do this, becaues it's pointless if
devices behind the port have already had their URBs unlinked. Case in
point, nobody noticed it's only done to the immediate child :)

I would have sent a patch to nuke xhci_stop_device() altogether, if
there weren't known cases where core leaves URBs on suspended ports.
That stuff should probably be fixed, it caused problems before.

I recall the main blocker being that core wants to setup wakeups in
the same call which puts ports to suspend, so it cannot reject ep0
URBs before doing this call.

Regards,
Michal
