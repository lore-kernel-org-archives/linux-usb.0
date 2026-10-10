Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16F639CCFD
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614187; cv=none; b=W4+3G5zxB0i+jHpZPn79x90CB1WOAjXeH9pz3b5bvrxiKeyGVh71FXe7R3iSU+uaX2qMurILOc6jzm/YmfGZ807wv9TuIMKAA/87pEc8vnjUGoYiYWHaBhcSxQYjUjMg9yRFuSw5LX42lbo0uQkpHeVqc+MR1nLc3MP8ZknUXpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614187; c=relaxed/simple;
	bh=ZnJxfnu9UopKxXTa0U94zGzQEzcjgXN+qKv+FV9kVl4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQkcAuLwRm2ozHEcRofx6g3C8US+f8M/ZYSpsxrZ4DdCF+PQW2+74rrBudIaCpUdJ6GcvRuBp5Va3ZP4IA74HYvcw+gGD5WpH+65I3Eywn92+DICbopZgIbaHFnLwmodz2gYMFbDu0KQPD6e91iK1SR/Zd1AyAIqYK5cINhmo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpEFoM0Y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpEFoM0Y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso3073815e9.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 23:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791614184; x=1792218984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSqVSM4fJlvTDpFrnKpXbQXJn7V7EVNmkAGYR+oqhh0=;
        b=gpEFoM0Y7e4nVf9sTR5OFUmyK5T448lHzkX+nsJnvlzO6kb1Kw6M1QT+d94g/nrKBs
         6oIVll31HfJB80U+Ic9JjSLi1UF7Nxd1glaZyu+1ke5mftXaKH9NKpZ7mNgPNXzathzK
         eXg6DWVwvoaDlzUBK6RTCfUQJOjhPqUaMfcsM8Nq61aOqQiFKOwp75ITYiwykqrA+JBb
         lDe6WcObBbLpT3S6qH95ldck+GxObzezKBgKsTue13t2wjgfZFzMZnV7iwNwFl8nrBTa
         /5c+I9Ih3vzAMpNqdxE6DdW88WyU0BytCuTxnhQ0EI/eTqOZWL18mv2Ak+lndajO8sRP
         Hfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791614184; x=1792218984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSqVSM4fJlvTDpFrnKpXbQXJn7V7EVNmkAGYR+oqhh0=;
        b=LPpxHAzVKm3u5+ev/S0XAHxuV6r1tsdS54vUw0a3i5z0yhXtm0DQrf5v6Z5En/Dg85
         O9gFJzJYBpxXiuWc2MjEwjfkiqt6WEIw6QVxfSsXBQQ4tfmisvP9WosKq146G7CUarEg
         jur4oiFH4yG2A3bWMvo3DEduPFLEnEPP6XgAsz2s9vGG423JB5nmNoTKdzzv4YxqvhuC
         jkVcuN6RPiSsHrDKGo5upXQroDsZvYjH+Xp+UNgph+6GePrYqKS8OaFdCzkxeXAH7vvZ
         zjv03NzeEXiENEaAbK4k6AiL3E7nzXg9fd1teHpoYtfMu96dhPBE+2jX8dh0VlH8CSJD
         6uSg==
X-Forwarded-Encrypted: i=1; AKwUvBxwApCP2nW9VI0xFOp/eRh7F1pVmItUH4mP/jSMuMof0GrXw/Ed35SLAu5iAa3Rh5C/qeLG4ZMVmec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwd6vhTfdLSQCM9818EJgcsSUGM6tYMTv9lSNJLqVC7AE9k5+q
	w1BgeCdgvpwEcMDR1I9CKBJ7+8n5ChjeQtjynf5Mxfjl2v6h/kV1VuSA
X-Gm-Gg: AYBFou07PXaHncrxnbfXap8LTDCPfaVk4qpYVnYszvfGPVv4/IRMmChJ8a0EXgLD+29
	uNaH+ZXEOr5dRk+bOIb5Jbcdnr3UMEuR4AuyvtUwvxYYNEIXViuwJortKOR2Kz/4v19AcZGJ82M
	UD4fB5lrXDQy6Upa+1/S5AOpttJcMkz9ZHLYecz/MM7746xv5N3pCUsfhFMeTakqhaC2NqIz+RN
	Qa+9TkyClV5XPtxHqgc+Ka6uTm27+PVXLvZoK0YRbp5QGEoUutQTNnui2alrDfDq7SE8qKsc5Jq
	llGHHspRsDBsySME7PrDMQuscj5oxRFh3G6fUjUvOn7na99VTNgqHDCUW9aR660K8FSfPSgHK6n
	v5IjeUg1esB9AbT3D6E+ArysLbtubakkC2i2fktoHzcPKouMcD7hSJ5ALbXCYaifjVeG4y9xTV6
	y8Fk1qZYwHuN5fyz/0uEtJzQhJLVj9Bh+z0iOLTEG6OEg79b5wpECGuwNaP3UNJsfwUqkNr6dTb
	pNfeABLDA==
X-Received: by 2002:a05:600c:4688:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a18e4ce84cmr84106665e9.23.1791614183932;
        Fri, 09 Oct 2026 23:36:23 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm6661246f8f.41.2026.10.09.23.36.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 23:36:23 -0700 (PDT)
Date: Sat, 10 Oct 2026 08:36:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>,
 <gregkh@linuxfoundation.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 02/11] usb: xhci: Unlock for command abort polling
Message-ID: <20261010083618.24da3062.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-165772@kernel.org>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
	<20261009151624.618967-3-mathias.nyman@linux.intel.com>
	<sashiko-outbox-165772@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 15:27:25 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] usb: xhci: 5-second udelay() busy-wait in sleepable command timeout path
> --
> 
> commit 8ece4a222044715c34357d2e1240af7af9feef1a
> Author: Michal Pecio <michal.pecio@gmail.com>
> 
> usb: xhci: Unlock for command abort polling
> 
> This commit drops the xhci->lock earlier during xhci_abort_cmd_ring() to
> prevent stalling other CPUs while polling for the command ring to stop.
> It subsequently waits for the command ring stop completion event.
> 
> Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt/
> 
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c  
> [ ... ]
> > @@ -521,25 +521,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
> >  	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
> >  	 * and try to recover a -ETIMEDOUT with a host controller reset.
> >  	 */
> > +	spin_unlock_irqrestore(&xhci->lock, flags);
> >  	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> >  			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);  
> 
> [Severity: Medium]
> The patch drops xhci->lock here to avoid stalling other CPUs, but
> xhci_handshake() unconditionally uses readl_poll_timeout_atomic():
> 
> int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
> {
>         ...
>         ret = readl_poll_timeout_atomic(ptr, result,
>                                         (result & mask) == done ||
>                                         result == U32_MAX,
>                                         1, timeout_us);
> 
> Since the context allows sleeping (the lock is dropped, and we call
> wait_for_completion_timeout() right after), does this code burn 100% of
> a CPU core in a busy-wait for up to 5 seconds if the hardware fails?

Does it not? :)
Still an improvement over the status quo.

> Could this use a non-atomic polling macro like readl_poll_timeout()
> with an appropriate usleep_range to yield the CPU instead?

Maybe, but other callers still haven't been fixed to stop being atomic.

My plan was to omit xhci_handshake() in this case and instead increase
the timeout for subsequent completion wait to 5 seconds, but I realized
that this slows down abort processing on HCs that fail to generate the
event we are wating for.

Mathias, do you know what was the buggy HW mentioned in 3425aa03f484d?
Was it really a bug in HW and not SW, maybe it was Intel HW that you
still have access to? None of my HCs exhibit such behavior.

If it's important, I could split the completion wait into stages, poll
USBSTS in between and stop waiting if CRR stays clear for 2 seconds.

Still, I consider all of that outside the scope of *this* patch.

Regards,
Michal
