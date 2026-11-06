Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937019;
	b=giyqTPW1MC7Rw2fK0KDtZStsUcEcbeOhS6J9yW64iT11PIOHHRrOxJfR0vzgcd+2xjle
	 PUpUBnYLzCNSK1+GwYpAtRm1zKy/J2Twm8Z5TWMzGBiCGHh629pxGggDyD6Y8NzleT3P9
	 d8erl6r+lMwEhOXvTt9m3+eyVjbRA7pJyceva76v/BtkHkfjRdfu69iqkAo3MMSKC1cOi
	 1hsrY3XjD3kRfuJK4DgPHFCgq3BAKLE6G8n5SSdVAzJP/7D1NZer0QWJthgKb29JmPKXa
	 gmlfb0DPTyvpGqsp7mvEWHoCjGB5CEZOIkEYHY67vRP9SWds1WrF3IZoXw9kVaEoL4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
	b=gb6bHh9TSPDJ4trfpdY9Cs1rknLuYbeaCFrTHJD8pd/+dMblUBUuh8zNd3nDiIOW9/qw
	 +hSE1JDAkXUkTwIEoRgPzX5s/cgJ6t5Lf2jfGAH14ZcIlfp0lE2tAxW0WvUnxJ2Tm+Npx
	 XQqpobNWDZud5dtqyW34bqh5sgKriP4KHZDkq0LamI+5r/gHIpLsWlKD4AZUI8CcL2gzR
	 EVoZpQ6Qzu1Dh0Fzqv2t+KKkjPAiWXeLAoczGxUa23/iwlwVAQofpsDoKrYo6mCDxa0+f
	 Gyruj29s+JYgg7Z4cMtysWDZnuJ/JoVLqj5aL50uaNpaqZk+bU2eZiPFMqrqbfhFpmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XPHMrNAt;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E8606A33F
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 03:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781E8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XPHMrNAt
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917aca1aee5so2211746d6.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 19:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793937018; x=1794541818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
        b=XPHMrNAt1ma58S1edfZpOnZGbqEmlSlhwQ5XZQ2FInojM9/wJO7Mq/3LCb2ggducBe
         ohNDZXcSyuch1+bqwLKl+U9HqlnERsB/vqxAINoPa0QIPZddBlw9w4zWAC1pbc/ZEo5Q
         kCtClKHzYYX8FjdUygvZBiivKbKN41CoQbsB7OMigxIArgLZ+JyaFjRg1qCqoktfdZ8Z
         Y1E4Js4YcgoHpvtdU1YgQ1gg1bh71W1t1bmm25EsmXnZpDjS4DHEmrkbcZu2K6iQGEqk
         mZceupHmxDI8Tgcx2J2ulKvUwWGgk5EQR/2UmFDlEqjeW2Tsc1T2EhEnKfNASt0xihdu
         A49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793937018; x=1794541818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
        b=G9dQ0pTPXseIlC6pAtWYb+i4rvHqcf2LN3lnxD+94B5iVPNVcGds603LaOV1ditx0C
         Zx9ykEahdMzFCHevKHHeGwt2ccKNsoRMjqSDS/NQMAGphN8RR6PghnumLqtG4+3J493+
         2CUYDRmOd/XVgyecxYKoTnfq55peKwrIw6Wm2yL3hwRiP8kiX24wI5VWXlsEtQDLVZSG
         vaafNyNk4zfUMhky3WZMeOiTnmHt1SQmLcwMA5SU4Vx8u/JoMvt8BOGr+Kbig51YCFPt
         UlvqrZp1Nqb0MYmIi8qe7OjaYP8+8T8kwhLHpyAPlrnCrMPb9XYhpTcH5xhvfI7zK/yX
         fOEw==
X-Forwarded-Encrypted: i=1; AKwUvBw9lXD9e85BltcJoIOUISRR8yGe7fk3uolmgWy0I40vIucUkpZe5Z0c3OgKL/AnkwBWh0segu8G8Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uCQZtqnMxtMF5+i5mbqjCwWHC+50wpWbm7DgD2PDK9CEMTB0k
	fuofdtgiQwsOm8q/KQAsOvKiEUomGJ6xz7eSc3J7lYnu6VDbeAV2yrvG3bN3xDNfrg==
X-Gm-Gg: AYBFou1QYju8blQWmKJOGtaidBfbLOjciP4bUxm5xrOi7QGQZ8r8OvT53OFRUY7mGuw
	tH55/m3rENQ3Vov6hQHaHM6R/MuKQXM8zoXXBaISGJNTQjMuOejCjcggZavZ8T+FEZ07Y87zTZz
	IQJytUrWYPd1wVF1UaPpSOKGBjLWuUoh02L73L6NFK/kYra8m+sWxhBLyDXQGG+lMAXqCk0b280
	D4v9G/YbuAZf04tJQhN1mHFt2AQrmhedhNuDVfX8JSanDzaf/hH/uwn/YDexwBYl4rRCJJIBddm
	CSscboRIlaE9weUE9qX4Pdnn1fMObFx9ocu1p7OvvcIXGsvXPPnTJoV/zW6ZmMHUomuhrjjRxTu
	EZHGpPxeRyBUQ1z3yzGEj/sCv9poh8T//akEBPsW2EXMrHo8FrKWGuRdBgxEtjzPJ4LNuguXI6x
	e56VeWh+ReOeNvOFxsRarBJagtnBHosNueePQILrboPeOnPrYoKEqflagj6Z/dsIXZ8pER6bDvx
	aSZRAIGyh5FazBLs2+sxJcMefKJ7CWesOF6wn9roWZIx3TtnLtCPhzZ4L81KajflFiEqayKQDuk
	KyzSQvr1vNAX6cEPlch9r2/ybls2
X-Received: by 2002:a05:620a:458e:b0:943:fbaf:6f62 with SMTP id af79cd13be357-945f3541b0bmr188405985a.58.1793937018321;
        Thu, 05 Nov 2026 19:50:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5bac07csm46448585a.17.2026.11.05.19.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:50:17 -0800 (PST)
Date: Thu, 5 Nov 2026 22:50:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+3a56b27661cb0e004a40@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in dev_config
Message-ID: <b28839b0-7de4-4dce-a046-e453c697b4fe@rowland.harvard.edu>
References: <6aed2980.53a4481a.2cc859.0009.GAE@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aed2980.53a4481a.2cc859.0009.GAE@google.com>

On Thu, Nov 05, 2026 at 05:12:32PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e11160948333 riscv: vector: Fix output operands in context..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=12e4e525580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1c1b9a4a89432905
> dashboard link: https://syzkaller.appspot.com/bug?extid=3a56b27661cb0e004a40
> compiler:       riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: riscv64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-e1116094.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/69abda6e64cf/vmlinux-e1116094.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2d7716a5dfdb/Image-e1116094.xz
> 
> AI-generated root cause summary:
> In drivers/usb/gadget/legacy/inode.c, gadgetfs_bind() only acquires a reference
> on struct dev_data (calling get_dev(dev)) at the very end of its success path
> (line 1709). If an error occurs earlier (such as in usb_ep_alloc_request() or
> activate_ep_files()), gadgetfs_bind() jumps to enomem and calls
> gadgetfs_unbind(), which unconditionally calls put_dev(dev) to release a
> reference that was never acquired. This reference count underflow prematurely
> frees struct dev_data via put_dev(). Furthermore, when driver probing fails
> during registration, usb_gadget_register_driver() still returns 0 because
> match_existing_only is not set on gadgetfs_driver, causing dev_config() to
> execute dev->gadget_registered = true on the already freed dev structure,
> resulting in a slab use-after-free write.
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3a56b27661cb0e004a40

This has already been fixed in Linus's tree.

#syz fix: cb3b441f2698 ("usb: gadget: fix refcount underflow in gadgetfs_bind() error path")

Alan Stern
