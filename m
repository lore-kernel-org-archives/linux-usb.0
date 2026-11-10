Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310998;
	b=Bn3H4sVWxBdw9HQCfI3mQ5FENATSocYB4CatOXzioP38qEEGqhcqNG/BNHmANBb2tIDb
	 0mOG43Nc8AN+q0Vif+NDMkNYyd0WDKckjQcdzR/BUQLWqvmu69Ktm7wtepxdvb8bBj3Hq
	 sPNppE5ZvC4mmUDclzxJT8qfeaGwyikd2rv5SZo7DaosVKtuaZMI1EIMme18A4tMIdse5
	 Aeeyl8TCAaupgCceY5m7rSH6zIGyqfDb/tzoBtS/CQNJX8Nd7GjCvyVBU7EzUwViDF9uH
	 N4P4XYCUJzbAQ744CVKjjgSIYRsngNeEpRCCQ6XatZGwFl32xSYnDunKPp0v7z6B3CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310998;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CmFGioBUzk8PYDV7woPh8bfVYuG+stJoLcW+4lyb4VM=;
	b=maCup9ZBGdJNyIZQmTwGeFAKugf1wMvIupeuHavAgkdZ+wkeGNKE69rlmAR8fVhCmGWN
	 O8u8+tbfJcBnaw1psALPtsYg9KZqhRPK95zQBLzFq7hF0psTT/RRncbqpAxGlFktJ8HVt
	 Y4QKrEUCPDQMmdbpD/t53FrxAnXd+NsdQdSpKiJfBbE681Uw6Cz9alN5LxjhiEDaqHO5C
	 tXeAuSQQ8KzXmW8MnYrtcf6EVzMO0JogFgHevMNpKHGf6nJNoFVYf2TRg9InfbcYxrCbv
	 xBc1nG7A+jYyuzdF6TcnfsS/LnPIuzUzSxGkElMuZcHJGXg5sEcKNsMpxw5oSEkoAeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/t8xoVd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86F606A33F
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/t8xoVd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982891F008A6;
	Tue, 10 Nov 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310997;
	bh=CmFGioBUzk8PYDV7woPh8bfVYuG+stJoLcW+4lyb4VM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/t8xoVdw3W9ea7ONR4uVmgBuYx50Wmaq37k41FD9XaE4F9XFQKnQbH8JDkjGat3x
	 oyX0c76qKQSLbSHFz6owDXkZjhXqbPcHsx8juIyVGB6S7uTqwSVimmMCW709g4i0vq
	 RXeI+E/c2AND0ZCHisPbQzBtcf/+V+H+xtZLNftp3SimGy4QnwgM2LtquwVbf3Xl2A
	 61I7h6pn5L3nasCIj5bh7ljSzH0/YH5gr+iIkBkva1W3YxNgn1NuvlsP6mpEaLoKUb
	 qro36255f1wjQhlyavwAJ10wIyk+lQziYCS2OIQzw8XpkR3sNdTe9xuLcLggNtb0Qg
	 9TVjzyYRTTjsw==
Message-ID: <sashiko-outbox-206950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: cancel wake work on device
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110113523.2517891-1-hj351016@gmail.com>
References: <20261110113523.2517891-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:43:17 +0000
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
- [Medium] usb: gadget: aspeed_udc: wake_work is unreachable in
  ast_udc_wakeup()
--

commit 59e63d484d3cece4c9053b24c7e169339b0f2919
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: aspeed_udc: cancel wake work on device removal

This commit cancels udc->wake_work in ast_udc_remove() after unregistering
the gadget.

> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 10214232c08fa..2acf84c489909 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1460,6 +1460,14 @@ static void ast_udc_remove(struct platform_device =
*pdev)
>  	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> =20
>  	usb_del_gadget_udc(&udc->gadget);
> +
> +	/*
> +	 * ast_udc_wakeup() schedules wake_work, whose handler dereferences udc.
> +	 * The gadget is unregistered above, so no new work is queued; drain a
> +	 * pending one before the devm-allocated udc is freed.
> +	 */
> +	cancel_work_sync(&udc->wake_work);

[Severity: Medium]
Can udc->wake_work ever be scheduled in this driver?

ast_udc_wakeup_all() is only called from ast_udc_wakeup() after checking
udc->wakeup_en:

drivers/usb/gadget/udc/aspeed_udc.c:ast_udc_wakeup() {
	...
	if (!udc->wakeup_en) {
		UDC_DBG(udc, "Remote Wakeup is disabled\n");
		rc =3D -EINVAL;
		goto err;
	}

	UDC_DBG(udc, "Device initiated wakeup\n");
	ast_udc_wakeup_all(udc);
	...
}

Nothing in drivers/usb/gadget/udc/aspeed_udc.c ever sets udc->wakeup_en to
true: ast_udc_ep0_handle_setup() forwards USB_REQ_SET_FEATURE and
USB_REQ_CLEAR_FEATURE directly to req_driver without handling
USB_DEVICE_REMOTE_WAKEUP, and ast_udc_ops does not implement
.set_remote_wakeup.  As a result, ast_udc_wakeup() always returns -EINVAL,
udc->wake_work is unreachable dead code, and the use-after-free described
in the commit message cannot happen.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110113523.2517=
891-1-hj351016@gmail.com?part=3D1
