Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39131B823
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906052; cv=none; b=ile992vdTm1+i1f2WNZrTJl65ZTlwApiBzPitTqxFJuiM7XKKQZuct/MiIKcJyf8lkqtgF7NC2OHQV2xstzio1RlroC88VjUuMdp0PTFh6JdNcnZrmJrZQDUqdJza1UldOXP7fK+04R1hFhMI8BkvBQScSh3JkSsomqzqn+3ZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906052; c=relaxed/simple;
	bh=9qIwg5blpsGHBsHZmXwdu874kUyQf2EFzdGeRRw8hj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6XTm4QKiAjzQMhji+Ntb30lsdvZx9a/naTwkOV0NsbeQXt9vuyMeqwBInlOwdNldmCVbDwOFg+6DAlIe0nLuq9glv4sjQVBvVJlXq7MyGAlvK+aOl7j5mPJmmM5OK2pb64Kw2lkIduCirW2Hu21q20vKXIg2+DQfBNf7kojGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H62Bz+BL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H62Bz+BL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso6008825e9.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906049; x=1788510849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdG4ratxJr2h3SHdDRaAUz5b5worhsvaeMjq57np8Xg=;
        b=H62Bz+BLXTpxzzXzicBgFhbvA66G7UUDFN/qGWOLo2AAb+4yHrrjLTUYWxTOz+OHJc
         zVoiFFntkY0lKxXe72BnCbAoY0f24m4b4EmIybiPQUR5BuVZrgCr0N9hyBw4tNcyJVm6
         4QqakLHeLjyiLSdnoAOQrynf4LGr6M2N9uEfFXR+0zwKqF6TG7YQKjv4QJSpx1GUISOE
         T9ucenRwpDnVhBYmqTaYGYs5eUPbS33fztR3Qslckbvxo6vEHEo6gDT9nHG7heZs4qoN
         kcfXyV3P0U3nXWFyZ8C3uFcEMUG6I6NSXj/8iDom3NlYtc+SjBB43iW9aYkVEjSM1Rts
         jNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906049; x=1788510849;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdG4ratxJr2h3SHdDRaAUz5b5worhsvaeMjq57np8Xg=;
        b=jZGryb8KYmrPxVqWjPZuGvCUhb+GGjNw+cfbiVde2Y9Ch18gDS5gZTMgXyIp31husZ
         zh1jyzSSn10ms43kQzTLfxyRS4qu62Gg9hsphUJCuMeZnfzspwBV8JsxOHz6hbKqXpUQ
         R1YrFtsB/E3/zUnClMjvbLHL03BMkakpJzu/r2jZrDEiZtyQPUN9Tfza1jKpuZguE0E+
         7JRwaq9E9vJUIlWk0rQVye8k1tNbk31FUosWk1jJJclPhUVNNa/joc23uWwZkVd8Yvcw
         wLl7Je1KJppiYtGjH/oveRgJvDpDl6aISHy88fajyvxiFZvJAAwD9T6DfVNO0wLTVYXU
         4RuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4zlvwOilKOBz+tuP8JzyvokRjTsUgjTTZo7USYK1mRGEbQnw7j1ZBDsjAerkqT8HiYc3eh0hs3Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++luAsFxZvbG9q/FLKi4H3aa7ft//fwxgof3UTR83lj1sCsFpNZY
	/YJYHKy5vPu51LcYksvtpQQXN8tAfA82RiIEZjS0YcNKJZgZYIp72jkL
X-Gm-Gg: AR+sD13Czs+1ukg8vmj379fX61UBfbvi6nLLqNQKgtehFWgYLlL6qHu2Q3f3VXCdzKG
	mqCaqQEBMvTJfv6AiLlO/aTJSp7YAHd9+6Ed2iIb+bfpHtJJ2k4P0Do0qTSAUt53mf2Z0pTmLI7
	3OMsjE8XliUVlrZClof7CYMYT+r3Tq7HpEhyRcn2rnmEQGsjvI5EiAlW2Cv0NYY20UTU4Aov/Hq
	5pMg4sHiKDE12zV7aOY8TEpyiOg7pfoQE+CaPAMwLVkBTAQF8Ht0uGpvsMccoIC1fXr1TO+zXJn
	/WFZAfx/j+L/owq9egRMq2rmhTB9m8FsDS37E8nb+RDVbxpuB7oxFUqby5aARzwCnLdbSsPSQnB
	lpxM5PG6UIsJP+ofS/kBqGYmVao+f7zw7jA77CMCsEvCQmobvLqHhhV1SoBedgqEDn2mH31nTkK
	Sv1lQH9kaqu2v9Z+MKD5IglPeEd+FPfP8fUvja58TUm3wCBpJZNPDNjE54ZXkFJ2LFM74=
X-Received: by 2002:a05:600c:1c0d:b0:499:a5fc:207e with SMTP id 5b1f17b1804b1-49b91c338dcmr82824855e9.8.1787906049245;
        Fri, 28 Aug 2026 01:34:09 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm38990515e9.2.2026.08.28.01.34.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 28 Aug 2026 01:34:09 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:34:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, Peter Chen
 <peter.chen@kernel.org>, falemi@asu.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <20260828101926.086f97dc.michal.pecio@gmail.com>
In-Reply-To: <2026082846-lethargic-ability-93dd@gregkh>
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
	<2026082846-lethargic-ability-93dd@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 08:01:19 +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> >
> >   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
> >   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
> >   Call Trace:
> >    ci_hdrc_add_device+0xb76/0xd10
> >    ci_hdrc_usb2_probe+0x22d/0x370
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    device_driver_attach+0xe0/0x1d0
> >    bind_store+0x1d0/0x220
> >    kernfs_fop_write_iter+0x3af/0x540
> >    vfs_write+0x61d/0xb90
> >    ksys_write+0x150/0x270

This would be more useful with decoded line numbers, like Syzbot does.

But it looks like you don't actually have this hardware and are trying
to bind the driver to a different device by means of 'driver_override'
or 'new_id'. Many others monkeying with this recently, hence...

> But again, stop messing around with root-only sysfs files without
> understanding that you get to keep the broken pieces of the kernel
> if you touch them :)
> 
> thanks,
> 
> greg k-h

And for the record, I still think that focusing on bind/unbind is
misguided because this interface can be used to trigger actual bugs
which would otherwise need connection or reboot cycles to trigger,
and they would still trigger after sufficient wasted time, with same
stack but 'init_module' or 'usb_new_device' instead of 'bind_store'.

Conversely, this splat could as well be caused by a PCI device with
spoofed IDs (think VM). Possibly even by adding a new ID and running
PCI rescan, so no custom VM needed. Too lazy to try it now...

Actual issue is that the kernel doesn't care about working around
platform/pci/insert/other/subsystems anomalies which don't actually
exist in the field, and I think that's what should be communicated.

Regards,
Michal

