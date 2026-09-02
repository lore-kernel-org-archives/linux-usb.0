Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7333DEF7
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324132; cv=none; b=d53/Xlesh+24q5gNlRiKSjh3Y9lMK/JPENurqHiZeLOdcPjmcsW3CmKFGE+4MyCkrLRmgtILrD9lJA6mhjnCZ7jf/aJGbuoTKMqQCKfOJZZIUv7TSgZ/IUpG3fZXVdoy68H+2Mad/NEogrqXt2qerwyf+a4CxiCyoRt6j3ty14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324132; c=relaxed/simple;
	bh=LXFqGSPU6uxrVcsyBUi9g49Ou8b7JGqIdU5mSeZDps4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9GEp3wWZnw0/Y0kmMyzmtCjnKeWIwqtU5gF6cseObf+W+L1j2tTxnAmLmg6tLipOOzbjM93zNS67pqofyaRQlqujAV3u8hY4SA5pFkN7xAaqzS3olQ6m9UPYwchSKT+5LoN6EmAGN7T6QiRLV999MfmoZ5yzj5Yt5BWAItKx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azo8Y4Ov; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azo8Y4Ov"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so5750035e9.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 21:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324129; x=1788928929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ai11qm4QGJgktgxHSdbSgMC+yqSgpeOZ79fxhBHEcOg=;
        b=Azo8Y4OvukdbtyFWidxRB+MJxUIjfQmOTOuOLMspmQ2mm9IMoZa+jludRRzZDC+Jmw
         V4kzA5jStt7FKxDusSU0bp9ZzXAY8PH+7uDAlM9FJRXfYWLfq1eQF9NBXekwmEYZv9L8
         K60IW998iIKZXnd1ivPsKqEePbZnlf7M0uFo3dmxbZN7MVJ1uiOWnA797g6UmooZEPaC
         bprbBattHBmXwzU0Xl3wCk0IwPgEm6Pj7jb7DhWY2UyHWhS2fUFWRDkKHHUWfrNXTzzU
         4aRBvtWSfTbCThvIwyziq782VHxH45fqtCMdL7rBAGToiiIIFxk9ln2t6kv0SqtI0l4k
         D0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324129; x=1788928929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ai11qm4QGJgktgxHSdbSgMC+yqSgpeOZ79fxhBHEcOg=;
        b=r9RAKt0jqhoOjnOsbd/6nzX4H49JxoXYRb4w4gYQiDBQgcd9P/tPWTO63zvODdJWdp
         yUJnFh/QWawpAtP//UGmHbu2rFhchcIvz0rFtYx/QEjcpEkaBCUdHG3HL4Ln267aeTv9
         WTq6P5YRqswzdXBQbfHm1EshHFdE+m4Sa+q/8lZQ+SC6Zpfos31m+lZ5hx6181N8PDX0
         KvLbBo6q2//EGs+T83Dg9TBnZfZX/jLs1y1dqOqpOR0HKwMfj6LpVkU9zri2WmupDuZ9
         U6re5mw3lDapVEbSIgd6YK4tSHe+iqNrzmENG1MgFepwXs7QnvTzTHKg4suaHlGi2Gy5
         Xs5A==
X-Forwarded-Encrypted: i=1; AHgh+RpjfCZAPN+/ctMScfX22hTWKHpANDdQFUU5afYLfvWOlx8lPP7NvDfU75/oOEVsmSc0ExhPfQer1RE=@vger.kernel.org
X-Gm-Message-State: AFuF++k5+ixO9hO8lVKbISzBnMEKP1l0NCCzD7dzZ4ahYiCDO1CZWCD9
	qSLioJkFRblq3qS9omCBG4kQqWfWO9MHPWBApbldic31AEZDGR+u08kV
X-Gm-Gg: AR+sD11kZJsYcGL/fFM3wEGPtFra08n1hO7MH0tBCgEEXW96tWyx9WtVyUSSeNxqr0z
	+w/aoQj2yClXYHaeERNSu3JlfoOLqUiw+vuhn0Swlj3tZmTRgT+LGy7QthcjOAFurSer+CehrnC
	rHxi/mrSPso5pSFtxQ2QGtRpxh+N8NJL88jjg0vYPASVFrDk4IzvQVMK+ECH3EqD/cnSCllJ+Ni
	hHFZsw9Eoq6IFTtMN9UUdAepNGKTQzeoiSY32Q6vdTnjmh/GnOqeLE/2xl+C5qz4mAq+8GmFTd9
	1erCynvGiv0s52x+oWzh08HRwPxhSCO7JtSj+zCX+XIcagViSW8zFSS7GVVg1o7NGajWdAbP7x2
	zWfnj60JKnz2EiRawAkdoPIpWKyZsoTbBLWR3GxqW7qGY0ekhzgNMa3fc0tCKCFAQIedctv3LMa
	Wluna6BG3u3IYsm1md4TLGHs43vzSd586SdPbOZzXSXkci0WqkE8RGZzbMTfJbjhP03VG5yzbgV
	1sKNA==
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr37954975e9.9.1788324129258;
        Tue, 01 Sep 2026 21:42:09 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce171c3sm125809605e9.8.2026.09.01.21.42.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 01 Sep 2026 21:42:08 -0700 (PDT)
Date: Wed, 2 Sep 2026 06:42:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Julian Oes <julian@oes.ch>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
Message-ID: <20260902064204.1a47cd73.michal.pecio@gmail.com>
In-Reply-To: <20260901231355.114733-1-julian@oes.ch>
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
	<20260901231355.114733-1-julian@oes.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 11:13:53 +1200, Julian Oes wrote:
> On Tue, Sep 01, 2026 at 10:28:08AM +0200, Oliver Neukum wrote:
> > But why do you get a port stalling?
> > It seems your hardware is quite broken.  
> 
> Maybe, yes, but as I wrote to Greg, I believe I have seen this (or
> similar stalls) over the years in the past with various hardware.
> Maybe it's just me but if it is not, it would be nice to fix it for
> others too.

What you are probably seeing is USB 2.0 hub(s) returning STALL
handshake when a transaction attempt with downstream low/full-speed
device fails three times. See USB 2.0 section 11.17.1 page 364.

If that's the case, the device endpoint isn't actually halted and you
would see the traffic resume if you simply ignored the error and kept
resubmitting until communication is restored.

That being said, calling usb_clear_halt() is indeed the only recovery
supported by USB specs, both for -EPIPE and -EPROTO or similar. Linux
has traditionally ignored this and things are quite broken sometimes,
particularly with xhci-hcd, even if you call usb_clear_halt().

I suppose you can try this and see how it works, and if you run into
xhci-hcd bugs we could try to fix them too. The -EPIPE case is easier
because drivers don't rely on out of spec behavior of the USB stack.

Related discussion: (gonna need *a lot* of popcorn for that one)
https://lore.kernel.org/linux-usb/261996a8-7ad4-4df2-a469-f6602da71255@suse.com/

Alan Stern tried to come up with some solution in USB core, but not sure
how far that got.

It seems there is only one risk of usb_clear_halt() in such cases:
- you send a packet to an OUT endpoint
- and the device accepts it but you never receive the ACK
- even after re-sending three times
- you call usb_clear_halt() and queue the same packet again
- the device may accept the packet twice

The recommended solution is to query the device by class-defined means
to determine whether it has received the apparently lost packet or not,
or to put it into some known and desired state. Common problem: nobody
knows how to do that with given device.

(And the same could happen in IN direction if you usb_clear_halt() after
a successful transfer, but drivers are unlikely to do that).

> > Your conceptual mistake is seeing the recovery from stall
> > as an indivisible process. It is not, as it has two parts.
> > Once your port is in a stall, you should send the feature
> > request to unblock the halt. There is no reason to cancel the
> > feature request if you close a port. You just need to refrain
> > from resubmitting the read URB.  
> 
> That makes sense. I'll try to fix that for v3.

Yes, if you are going there, just clear the halt and reset everything
unconditionally. Then the pipe will be ready for new transfers.

One note about rate limiting: it would perhaps make sense to perform
the first attempt ASAP and only slow down for retries. But arguably
anything at all is better than just giving up like now.

Regards,
Michal
