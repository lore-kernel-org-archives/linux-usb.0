Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400482;
	b=T/B4kkLxIAzC4wvBf3Zmga8+pk8SdQ38u50ufQRChUUc+FrvK1VKA4jO4JSYOcIohdlw
	 pOEJTVypxpRJ7C7N2aqFHC+DthftifWFSej7J1XduH1f/q73CYe/lDRRpAGswlCSLi4fS
	 zjbRVDps+L8Iw57vxw7EpAdD6Rg5xSB3gfZkqLfEPiBG/GwL46vb2Qi5btcV0FOf9JfuU
	 NN8F27q3jv8c9VmoY94gA0GQLp+2Ljz43+byp+fvSXBO3ZEyN/bmXqiwYe7H6zCu+0F8W
	 CuJlyxmqXOFyUS665UKBLiKLgyH3yRqUtnQ7pcXjQFRR7qJOQA5prYy+EfupvymcGqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400482;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IBw7gNU8AWB+22iUWIwEfoNUe0gDtq1WPJi8GnsRv54=;
	b=M5HAqrwJJ9738yCKv2s16gs8TmArMl+LerT2jr9gdt1tSfh7XGt1xrwK/vOILH+lC5Be
	 a+68tt7jeFwXpA8xPjgvZWxse8JOm078M4jzWR3jKYafZxaPdL+9gHt05YzkygBK1j9G7
	 CnBi+TlUhO57bMTi9j5zIWn+zV+xsr51YP05DA+7U6/3YCRee7h9uYESNI5j1SKpj6BlV
	 k0fHKjG9vJdylXAk7f0YRJ/Mb3iN3XuRwJ/qGrjKOtuXu6W4R6hyDt0LI+o8s5NiY2HJi
	 uU+d90Cf8EHtb1trRd92ZtdoSYjVRnvlN1l+E2KEDOG6RBZuUcvqu4ENM4MSCtcOHqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqKFsZua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF284606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqKFsZua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1909A1F00A05;
	Wed, 11 Nov 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400482;
	bh=IBw7gNU8AWB+22iUWIwEfoNUe0gDtq1WPJi8GnsRv54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqKFsZuaG13lYFSRDrk5ol+cobr8+gSECSXORsSOa8ghYwZqCmAI0hKkF71aAkBpR
	 NxUUq25kLK3LR+TUc0SW7oYEXqkTmH7XQYV33Fm1dhOJBVT0dC5di0A+AD6e5eIuon
	 fgXs7tGDKjX0IPac4k5gxBO+PcNQStmnldbSPgzthGOGqfESrnvLauKowe7QBcAg8P
	 dU6/nwEFHh9giBDNiP15vgd+HHZNCwGXmqCkoU9hd4MWO0MpSgoWaTs054BxjSwnr3
	 U5YSTYWQnu3UXTN/ggCy2L7lgPj3uNjE8ViNxME37xVx6HxBy6NSX+vN5+wTm8AkwU
	 3BRPZ+WFI3OJg==
Message-ID: <sashiko-outbox-208982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: pch_udc: Fix potential ep0 DMA descriptor
 leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-e5624093d6-usb-pch-udc@mail.sdu.edu.cn>
References: <20261111-e5624093d6-usb-pch-udc@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:34:41 +0000
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
- [Critical] usb: gadget: pch_udc: double-put in pch_udc_probe() [1]
--

commit f7d7f9013f20e3f93fc549afedd53c2c94be66c1
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

usb: gadget: pch_udc: Fix potential ep0 DMA descriptor leak

This commit frees the ep0 data DMA descriptor back to dev->data_requests
before destroying that pool in pch_udc_remove(), instead of freeing it to
dev->stp_requests.

> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pc=
h_udc.c
> index 99b3ce28210f9..5996f1d16aedc 100644
> --- a/drivers/usb/gadget/udc/pch_udc.c
> +++ b/drivers/usb/gadget/udc/pch_udc.c
> @@ -2989,6 +2989,10 @@ static void pch_udc_remove(struct pci_dev *pdev)
>  		dev_err(&pdev->dev,
>  			"%s: gadget driver still bound!!!\n", __func__);
>  	/* dma pool cleanup */
> +	if (dev->ep[UDC_EP0OUT_IDX].td_data)
> +		dma_pool_free(dev->data_requests,
> +			      dev->ep[UDC_EP0OUT_IDX].td_data,
> +			      dev->ep[UDC_EP0OUT_IDX].td_data_phys);
>  	dma_pool_destroy(dev->data_requests);
> =20
>  	if (dev->stp_requests) {
> @@ -2998,11 +3002,6 @@ static void pch_udc_remove(struct pci_dev *pdev)
>  				dev->ep[UDC_EP0OUT_IDX].td_stp,
>  				dev->ep[UDC_EP0OUT_IDX].td_stp_phys);
>  		}
> -		if (dev->ep[UDC_EP0OUT_IDX].td_data) {
> -			dma_pool_free(dev->stp_requests,
> -				dev->ep[UDC_EP0OUT_IDX].td_data,
> -				dev->ep[UDC_EP0OUT_IDX].td_data_phys);
> -		}
>  		dma_pool_destroy(dev->stp_requests);
>  	}

[Severity: Critical]
This problem wasn't introduced by this patch, but can pch_udc_remove() call
usb_del_gadget_udc() on an uninitialized or already-cleaned &dev->gadget
[1]?

pch_udc_probe() jumps to its finished label on failure and calls
pch_udc_remove(), which unconditionally invokes usb_del_gadget_udc() at the
top of the function:

drivers/usb/gadget/udc/pch_udc.c:pch_udc_probe() {
	...
	retval =3D init_dma_pools(dev);
	if (retval)
		goto finished;
	...
	retval =3D usb_add_gadget_udc(&pdev->dev, &dev->gadget);
	if (retval)
		goto finished;
	return 0;

finished:
	pch_udc_remove(pdev);
	return retval;
}

If probe fails before usb_add_gadget_udc(), usb_del_gadget_udc() calls
put_device() on a zero-initialized kobject.  If usb_add_gadget_udc() itself
fails, it already drops its device references before returning, so calling
usb_del_gadget_udc() in pch_udc_remove() causes a double-put and
use-after-free.

[1] https://sashiko.dev/#/bug/linux-7ca8dd59-dc65-4e63-bbde-b83dd0eb2845

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-e5624093d6=
-usb-pch-udc@mail.sdu.edu.cn?part=3D1
