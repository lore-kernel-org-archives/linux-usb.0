Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839782;
	b=wpm2nyQFlunieq1Zp5TBIS9ENv8t2zTncM26G1PsqdTlLNtQF+SU2nujnpZcTq16gxMT
	 XgvPEkWnllRXO3egrzXowAg38UlJvCjmlc/QSMWBUoFDaGNjjSKP/iyp7mObRNnMVFrn1
	 mhoGMiWrV2MYwXHNv/dTBbrfIiK07A0j9hPQBQPkKMB4gMmDC2EYIbNGb48GPmf/kZ6hS
	 m6qBFbHP3Kiy9qzERQTRPBYINcdwn5mjARhc/LQ51km2NQsdLJxszmPhD8GflnHRsDUSD
	 cCxe7Gy4WkAmqVspInzpY8Fd35gUK/UR+xKhNzCMt8UZouPwHskY1mNevTDEXcqW2lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AjwEyn0vGsSXG7Vfit1WZQue+48FWhYoE9UqYj2FfyU=;
	b=PK7MEOY2okTX6202wxljwz3rcp8ucXoQy/zZd7OaJNbb/CvZeH6VdE20wozmpHdCBE3W
	 YMX0mmXpxzCe4e/B0TDcza1GadEfu8DM0P25zZMZbdMXX496X5McLoGno3bGw0BEVw34t
	 80oQXmRxuw2THt60OfN6yw8WIVs2MUXksCGL5X26pyLhWh/iG1pwLKP/8RIBMotn3aFu7
	 76tcZ9C1bF6dMNNylgwFvSqaTgp7Wh2+ePE79nhe9K5UQmZ5Zi9/60P0Fd+ZtjTM/Jv1D
	 xuw4SsmZ3bxFxboXdZFxoJ03Ck5ARDhMxFdPJa+NJb6F/q/Ai+gJw5kzENAU+DLMzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ph1AtlNp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67671606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ph1AtlNp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13951F000C4;
	Mon, 16 Nov 2026 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839782;
	bh=AjwEyn0vGsSXG7Vfit1WZQue+48FWhYoE9UqYj2FfyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ph1AtlNp9oYWbnQWovnelODbGr8L9C6X9ZI6Gx5jHM3Qn5SFUeyXYbglbajMej7Ka
	 VkflKD1x/VlQWYQvqDG7nVR4o660A6q3icJUkCyPTG+xpDHoremZEiL75pDJ4HRQf8
	 4yTP6uMyHgYHodVHsydhtYMIOpdt2xlNhe79Bbdc8lZkTYhTiAPF1J2NYzXjg60aF7
	 uW9lpGuEZvgkUgJewdqoI8caj3YKRcTL9i2nm+F0ifSVY6cs0JGotsyCWYSamO+hE2
	 euElhZ59wN4aR0L5vKkQ8KQX4iM1N1ST4iqY0gdt2+DJlPVkek7mUCEg27sykFqNbO
	 r38huHRmNnS+Q==
Message-ID: <sashiko-outbox-217180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: max3421: Fix potential resource leak on IRQ
 request failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-c29ba55625-usb-host@mail.sdu.edu.cn>
References: <20261116-c29ba55625-usb-host@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 14:36:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: host: max3421-hcd: use-after-free in
  max3421_irq_handler() [1]
--

commit bf9ea93a3f4c8766b32b8f1ff53f8a0863775270
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

usb: host: max3421: Fix potential resource leak on IRQ request failure

This commit calls usb_remove_hcd() when request_irq() fails in
max3421_probe() and reorders the error cleanup so the SPI thread is
stopped before freeing the transfer buffers and platform data.

> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hc=
d.c
> index 73e76d0e69738..09ba92c41a0d5 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1911,23 +1911,24 @@ max3421_probe(struct spi_device *spi)
>  			     IRQF_TRIGGER_LOW, "max3421", hcd);
>  	if (retval < 0) {
>  		dev_err(&spi->dev, "failed to request irq %d\n", spi->irq);
> -		goto error;
> +		goto remove_hcd;
>  	}
>  	return 0;
> =20
> +remove_hcd:
> +	usb_remove_hcd(hcd);
>  error:
> -	if (IS_ENABLED(CONFIG_OF) && dev->of_node && pdata) {
> -		devm_kfree(&spi->dev, pdata);
> -		spi->dev.platform_data =3D NULL;
> -	}
> -
>  	if (hcd) {
> -		kfree(max3421_hcd->tx);
> -		kfree(max3421_hcd->rx);
>  		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
>  			kthread_stop(max3421_hcd->spi_thread);

[Severity: Critical]
This problem wasn't introduced by this patch, but can max3421_remove()
trigger a use-after-free on max3421_hcd->spi_thread in
max3421_irq_handler() [1]?

CPU0                                    CPU1
max3421_remove()
  kthread_stop(max3421_hcd->spi_thread)
                                        max3421_irq_handler()
                                          if (max3421_hcd->spi_thread)
                                            wake_up_process(...)
                                              <-- use-after-free
  free_irq(spi->irq, hcd)

max3421_remove() stops max3421_hcd->spi_thread (which drops the
task_struct reference) without clearing the pointer, before calling
free_irq().  An interrupt firing in that window wakes the freed
task_struct.  Calling free_irq() before kthread_stop() in max3421_remove()
would avoid this race.

[1] https://sashiko.dev/#/bug/linux-1a37fb82-5226-4771-845f-e2e6c320c91c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-c29ba55625=
-usb-host@mail.sdu.edu.cn?part=3D1
