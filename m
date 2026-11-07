Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063833;
	b=ResGLk1EE/kIpNsBPj34sDjd7Cf91pIQEakZ2w8/jz0aw4PxLsqYO0Kre61kHdDqgkSB
	 yyZGAc4UAqXVe8beAjLrzvOWcTu/u6KgvOKnSSPqubjTm3d3N1LKRpLcxsRECVYStyUxD
	 477Ulvt8FpiW7puSHGwCtJRUlcGaezxtjkqgnBd4v+GW2/pzRnWLxcq3bjyaMBIjlOdqc
	 JjTdui+ZZ6+xlHuquJKqTBuv80qD8hgHmjaT+kw0pwEnWEmg+GeskraSnB4JueYu0b5VR
	 jzN7QkeulPqkcxazWTPJifOXeDorqxih3YT9yAXAJycO2aJPQtXy6VZ2r6IxRNbgDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SCVee/JCL0txQxlneuJslexD6yrEQAntW+Nk6lYWNdA=;
	b=PKpFCE9FSqSJpo8uJA+0OQFNnPrlKnYdpqvIuRHqpbnlvrBtHjPDSa85QrZ4OD28lETO
	 JuMCC1/vFXHj2WT7DYy3yso+fezy9ALgmQtVhqf4afpceuPo3QRWZmjbqbp90CeZIWNu9
	 KxthvZjQgdHc4pJe4rFkXbg0AJGPSJo5ZlGu9VdBovXHZRrVTgZ2QpyAoNkvHtzUBGeSq
	 O87bfcpYG0gR6Z4wanCHVwdFavxXrFtqf0u7dbRTwqKyLU/svDVYqKy7dt63ER651vMce
	 Mwvopi7Cdi2h83qVbshkHORA6zgXXDVbJXUZj2ffQjcn6/6MCad9RqP9DFHzutxCIQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6dCuKdk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE1606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6dCuKdk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAD11F0089F;
	Sat,  7 Nov 2026 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063833;
	bh=SCVee/JCL0txQxlneuJslexD6yrEQAntW+Nk6lYWNdA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=B6dCuKdk/olg73jkdml7u7wqyiKJKxUjojNw0ecI1lvtk2Dire0s5wSjZZWCTCMXa
	 341Zq9SRYDEv1Fj4Q0+aY2E9tnFm5jr5G/LVTFwLduM8SQrvrvkuHdFjOp1pTonrPJ
	 hKBs8rtflL6tDellnQLKbJHpCMNojX5stH3Q8CFTSNZ5QGc23bk54M4FpyUJFHICer
	 DxntOqUwHie9Z4f8XXIFJecr5ZdXN4sasLJ5UNl4mEgEZorPlMAH0RnGR6zmdChYLv
	 c2lkFqaZQzFlH8DHQO6xp62ik9asgEyE2MmR6/WjVt4qu3dFxuE/7gaczatw+eQbZe
	 HZsbLRAv3jPAw==
Message-ID: <sashiko-outbox-202981@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: sl811-hcd: delete the driver timer on stop to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261107145022.3734911-1-hj351016@gmail.com>
References: <20261107145022.3734911-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 15:03:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: sl811-hcd: sl811h_stop() deletes timer after
  port_power() halt
--

commit 2938f64d61ba1aa6f4f9800e4e15b39f1ccc6b42
Author: Hyunjung Ko <hj351016@gmail.com>

usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free

This commit calls timer_delete_sync(&sl811->timer) in sl811h_stop() so that=
 a
pending port timer does not fire after the HCD and struct sl811 are freed.

> diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
> index b044977f6f567..53a0bc81916ad 100644
> --- a/drivers/usb/host/sl811-hcd.c
> +++ b/drivers/usb/host/sl811-hcd.c
> @@ -1520,6 +1520,8 @@ sl811h_stop(struct usb_hcd *hcd)
>  	spin_lock_irqsave(&sl811->lock, flags);
>  	port_power(sl811, 0);
>  	spin_unlock_irqrestore(&sl811->lock, flags);
> +
> +	timer_delete_sync(&sl811->timer);
>  }
> =20
>  static int

[Severity: Medium]
Can sl811h_timer() still run in the window between spin_unlock_irqrestore()
and timer_delete_sync(&sl811->timer), re-enabling the controller after
port_power(sl811, 0) has halted it?

CPU0                                    CPU1 (<softirq>)
sl811h_stop()
  spin_lock_irqsave(&sl811->lock, ...)
  port_power(sl811, 0)
    hcd->state =3D HC_STATE_HALT;
    sl811_write(..., SL11H_IRQ_ENABLE, 0);
                                        sl811h_timer()
                                          spin_lock_irqsave(&sl811->lock, .=
..)
  spin_unlock_irqrestore(&sl811->lock, ...)
                                          sl811->ctrl1 |=3D SL11H_CTL1MASK_=
SOF_ENA;
                                          sl811_write(..., SL11H_HOSTCTLREG,
                                                      SL11H_HCTLMASK_ARM);
                                          sl811_write(..., SL11H_IRQ_ENABLE,
                                                      sl811->irq_enable);
                                            <-- re-arms halted controller
  timer_delete_sync(&sl811->timer)

sl811h_timer() does not check whether the port is powered or whether
hcd->state is HC_STATE_HALT.  If a port reset or resume timer expires while
port_power(sl811, 0) is running (which holds sl811->lock across a 20 ms
mdelay() when board->reset is NULL), sl811h_timer() runs as soon as
sl811->lock is released and re-enables SOF generation, Endpoint A, and
hardware interrupts in SL11H_IRQ_ENABLE on the halted controller.

Only sl811h_hub_control() arms sl811->timer (the transfer scheduler never
touches it), and usb_remove_hcd() has already stopped root-hub activity bef=
ore
calling sl811h_stop().  Deleting sl811->timer alongside hcd->rh_timer before
port_power(sl811, 0) would drain any pending callback before halting the
hardware; the commit message should also be updated not to mention the
transfer scheduler.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107145022.3734=
911-1-hj351016@gmail.com?part=3D1
