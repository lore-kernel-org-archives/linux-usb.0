Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196914;
	b=YyO6PQnHM3UUDwbbdXlTg14t0CKF2Rd5I7lExrHMc9CNVjlvXl83YAH1MiXl/YnN7Umo
	 heaf7KEdZkh83ybaJF8ly9HVhHLwVKzAIgZcnpLwBOJ33YWi/72X2mWHX+U124u5CWFUe
	 NAVVYHztiZrZRzEJWl9RBILtHFfohS2IpgMkkAGADbFLDnCol4AT9j0TRA6O/sB/OQ4sP
	 kbmG/t5zHRyjj90tYRVGAq3pI1+TCpWN3b2j8/VByWUb+VA5GMARj+pFYX69HGN5szpP1
	 STHddBpDCCctu6EldZ7I48w0ql4MyDl19zy0CAxkCvGg3n2OcnmPWnB9YoksBSD766g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aGQYX0espepN/+SRai53eGQNq0szmPyH1b5u6i6fuBk=;
	b=cHCwbFBwT/FP4GJj2O+za5BmJydfKcw2a0d2nVgTtWyxK8NojC0O0TBqkm4SnrPKaEJI
	 yCyHBL+J2nvL+UCEdwxPqi3qOudFwrMuDpUSlBlxFwJ+B/Kb7qEAXF0jc/EmAHXBasEi1
	 6hlaMt5EU5GtiV4+NrSzohw2eIDamaod0L/IpFHP+PYOSVvwdxSGAHVGrbRg9Gt7sAUMB
	 rnGjRMB1S5DZWb9ShOj8CHuWC/y5V0ULJhiaAIdltJdCHek/jfs+T+4dNqsANhGF4mN7z
	 yn4MldoGhfSNlh0aQzCVY81+ZDQN3IkfuaHa9DhMFlKV4cl9JECJ95EUe7vKu+FIRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bfyl9VBy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4F606A33B
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bfyl9VBy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3281F008B2;
	Fri, 20 Nov 2026 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196914;
	bh=aGQYX0espepN/+SRai53eGQNq0szmPyH1b5u6i6fuBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bfyl9VByIGmjak5+UrB6cZs0VYcnxxWgAPNTmcW/y3Q/h7fenjKS354zlCaEGe5kU
	 DaiRnCh73xDH7f+6/Lm7iaax8D8k7dgZD6sHG9gj0vEpg7ZvqMPiLQbIUIdzly5/sK
	 LsfS7Bs5Xh+ZAa/sDl8bN012ySdmdr88rrU6TZw8dxq0kLyM6KzXaWXNCH1WInHoQs
	 0b5zDdvPgTISh2VfT5N1iov7KiWRLm64iYvst8Wv0GvG6Sso2tMw6JkoADWozz+aCv
	 oRHnGpU6xgl3dDdNv4t44C8Oj+Z+tXtgVwgFoHDn9OzmUHtP+Tbf3tsNSM/qm5vLPd
	 vTYShnwuGu7MQ==
Message-ID: <sashiko-outbox-225719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: max3420: Fix potential thread leak on
 probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120173512.3923833-1-liguangshuo@mail.sdu.edu.cn>
References: <20261120173512.3923833-1-liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:48:33 +0000
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
- [Medium] usb: gadget: max3420: UAF of udc->dev in max3420_probe()
  stop_thread path
--

commit 1aa81e8a2fed8c598f135d63a9ff28aff8ed2d0f
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

usb: gadget: max3420: Fix potential thread leak on probe failure

This commit disables the UDC interrupt and stops the SPI worker thread if
requesting the VBUS interrupt fails during probe.

> diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/ud=
c/max3420_udc.c
> index 11fd61cba5af9..84309229216b9 100644
> --- a/drivers/usb/gadget/udc/max3420_udc.c
> +++ b/drivers/usb/gadget/udc/max3420_udc.c

[ ... ]

> @@ -1283,11 +1283,17 @@ static int max3420_probe(struct spi_device *spi)
>  		err =3D devm_request_irq(&spi->dev, irq,
>  				       max3420_vbus_handler, 0, "vbus", udc);
>  		if (err < 0)
> -			goto del_gadget;
> +			goto stop_thread;
>  	}
> =20
>  	return 0;
> =20
> +stop_thread:
> +	usb_del_gadget_udc(&udc->gadget);
> +	disable_irq(udc_irq);
> +	kthread_stop(udc->thread_task);
> +	return err;
> +
>  del_gadget:
>  	usb_del_gadget_udc(&udc->gadget);
>  	return err;

[Severity: Medium]
Can calling usb_del_gadget_udc() before stopping udc->thread_task cause a
use-after-free of udc->dev->kobj.name when max3420_thread() exits?

udc->dev aliases &udc->gadget.dev without taking an extra reference.
usb_del_gadget_udc() can wake udc->thread_task via max3420_udc_stop() (or
max3420_irq_handler() can wake it while udc_irq is still enabled) and
then drops the final reference on udc->gadget.dev via usb_put_gadget(),
freeing udc->gadget.dev.kobj.name.  When kthread_stop() runs next,
max3420_thread() logs its exit with dev_info(udc->dev, ...), reading the
freed name:

drivers/usb/gadget/udc/max3420_udc.c:max3420_thread() {
	...
	set_current_state(TASK_RUNNING);
	dev_info(udc->dev, "SPI thread exiting\n");
	return 0;
}

Disabling udc_irq and stopping udc->thread_task before calling
usb_del_gadget_udc() (or falling through to del_gadget) would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120173512.3923=
833-1-liguangshuo@mail.sdu.edu.cn?part=3D1
