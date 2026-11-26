Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702060;
	b=nAENqbjp0JgcIFn0JmKiEVjxPsp0FHb9joSR54wEc+eLPLw6hWm8aFUIBBvffH15OEEc
	 o5ZJQUn3BSr04UBqpxWg4EusCJeSCtJbxuT+QPsmFXtUpSv7KSrvWeEC7FkL0mYp39Jpy
	 zwfNtOHOKqBTASAS7Pv0ggoeKU8/E3CCANVBmu+dqdPSOlZnWVFtJMfYkDk+kDYQnYu/n
	 p8gOE7F9sLaVa/GNfmf+VhkffS51fMUEMaWqeUPKga2rWSYsAAyRvFH29sTQZbCTcWocm
	 4EggBxyv7kQaZ8vr3DYtGIoRA6wpN9ieiVbYUF+QQ8YxVqW8CLYWySldY7s7oGJQBmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bFmkKJ3azDeYvCcEHUuEh2P+8DZFyAZpKtAxWl/TlgU=;
	b=wxH0HRbhWY8rkLHKsCr2B7GDRDI+Hb5qbKN1ypAzcbWcOQqG/JPQGAyA8XRw4WPdv9Km
	 nUkDWkFm/eSWZ+/ipVVcFSppMwbUDbWHpFfBN7vRZ8q41UOjJLMknI3rQhQ5A2tNFU9hZ
	 Xw53USMsMcR5/m3q5ZRjRE9a/J8+CnfaDoWZflfwbpscu5QvbV3YZRfNJNAxqRVQ+9wiR
	 LI/4nHQcN6L9ztyCk6v4ipuMXBwZD3HpR/eWkxg5cY2oYwyrlrde+q3bGVy3VK9FtSbYb
	 6BmyoQs5DZnnGjK5mg0QHSyWX2nDWsuBz7+lkQty972DFaeTTf3PkelSyV3fyYjzjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loIp41ij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E405C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loIp41ij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E7E1F000D1;
	Thu, 26 Nov 2026 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702059;
	bh=bFmkKJ3azDeYvCcEHUuEh2P+8DZFyAZpKtAxWl/TlgU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=loIp41ijmpJUbnZ7OSB5Dd3zMkZUEmHHDq+Y9FUDBK0aGEkcItyycgjgmQoDC70Nx
	 OBFy43HPVUbFF/IoD4zYO4P29hkB2/FVB5sYmM0Ie1r41fzF761R0NiP8ktEa8xImS
	 U9u8zBkE1fRP0//n19Bh64eoU2/lEX5rvIkSt2p6e7B+hZ0+ydVlCN3y1yG+8twqQA
	 R6F3+hEMS3Rlsl5aDRbqLVOgQfOaTDrsu56FoN3gIQV5Ass6TP55JDjAdmT7YnzFzH
	 HePBrrIeXIAgY6jdi+Y5VyqjMVW2MzLhy8U1OgSEdQoF+4Uvc27K6B2IkIfJvrqmTQ
	 6yjciQePRRXqw==
Message-ID: <sashiko-outbox-235671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: host: max3421: fix the SPI thread teardown on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: shitao <shitao@kylinos.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261126135222.1428623-1-shitao@kylinos.cn>
References: <20261126121148.1021526-1-shitao@kylinos.cn>
 <20261126135222.1428623-1-shitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:07:38 +0000
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
- [Medium] usb: host: max3421: free_irq() races with enable_irq() in
  max3421_remove()
--

commit 58f589c27256d9aa92eb5a12720e9958ee5eba27
Author: Shi Tao <shitao@kylinos.cn>

usb: host: max3421: fix the SPI thread teardown on remove

This commit updates max3421_remove() to free the interrupt before stopping
the SPI thread and drops the HCD spinlock around kthread_stop().

> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hc=
d.c
> index 11c0d0e1f48d3..e6a447b0992de 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1936,21 +1936,16 @@ max3421_remove(struct spi_device *spi)
>  {
>  	struct max3421_hcd *max3421_hcd;
>  	struct usb_hcd *hcd;
> -	unsigned long flags;
> =20
>  	max3421_hcd =3D spi_get_drvdata(spi);
>  	hcd =3D max3421_to_hcd(max3421_hcd);
> =20
>  	usb_remove_hcd(hcd);
> =20
> -	spin_lock_irqsave(&max3421_hcd->lock, flags);
> +	free_irq(spi->irq, hcd);
> =20
>  	kthread_stop(max3421_hcd->spi_thread);
> =20
> -	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> -
> -	free_irq(spi->irq, hcd);
> -
>  	usb_put_hcd(hcd);
>  }

[Severity: Medium]
Can max3421_spi_thread() call enable_irq(spi->irq) after free_irq() has
already deactivated the IRQ, or exit leaving disable_irq_nosync(spi->irq)
unbalanced?

max3421_irq_handler() sets ENABLE_IRQ in max3421_hcd->todo and calls
disable_irq_nosync(spi->irq), delegating the matching enable_irq(spi->irq)
to max3421_spi_thread().  Because kthread_stop() is only called after
free_irq(), kthread_should_stop() is still false while free_irq() runs,
and max3421_spi_thread() also sleeps in spi_wr8() after checking
kthread_should_stop():

CPU0                                    CPU1 (max3421_spi_thread)
max3421_irq_handler()
  test_and_set_bit(ENABLE_IRQ, ...)
  disable_irq_nosync(spi->irq)
                                        while (!kthread_should_stop())
                                          if (!i_worked)
                                            spi_wr8(..., MAX3421_REG_HIEN, =
...)
max3421_remove()
  free_irq(spi->irq, hcd)
                                            if (test_and_clear_bit(ENABLE_I=
RQ, ...))
                                              enable_irq(spi->irq)  <-- on =
freed IRQ
  kthread_stop(max3421_hcd->spi_thread)

Conversely, if max3421_irq_handler() sets ENABLE_IRQ and calls
disable_irq_nosync(spi->irq) just before free_irq(), and
max3421_spi_thread() then sees kthread_should_stop() at the top of its
loop and exits, the disable depth on spi->irq is never balanced by
enable_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126135222.1428=
623-1-shitao@kylinos.cn?part=3D1
