Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D183D9665
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033214; cv=none; b=Yldqfm/Mqx2XZPSNnd89W+ZwQHsQqiXSEpBRISBeiWwu1bmwbGIQjHBK7ECUmCUrrOBXULsS3p1r9IJeOr1ydu2HzKtjkbzZPCW/iEqHFCyRY0ezD5cAV/E990KvTSsvzDrIIdUhmw4KUbFeDqgpYQ0szy6MKOkteogxv8/pgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033214; c=relaxed/simple;
	bh=FTCxCDBcHMyfkU8vbFTUK4IxQH84dZ9tNxBpWaeF+tU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YIBLBZO4RxEHIx4yuPKnWBAUBIvf2ye7uGeveHzDKFkyH1PR3QrofyWyYlaWGDBtq2wSouKxKDLmlCY0DUcMCK3TdUcJOWPSNb/J2+D0HmQ3qR+i40DsuL4Tyj2a9MfC+YH0dyywnUX7KQqMhCIqevJpnJZQ+sqPR2dnK2e8kJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwT8Xfy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwT8Xfy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F48F1F000C4;
	Thu, 15 Oct 2026 03:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033209;
	bh=/qC6DzHVTsDRv+sU6tklLHPQt7IZDGCHiCXz2GjDr0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AwT8Xfy/2d4mjWm/teJFk65r7sH3bKSE/BDZOEcl2dDTGDRbgvpkkHBT1p21JlUjO
	 gxvKjvSSJ8whNxK5JuyVuSsO2DY0SnOFVSVgPMmHlB7HJpzCnDmNe1UiLXHaTA7Omj
	 fHEJgXlg5nfrCkVItasFzJ1PP3DmjqZjFj1ps/CYyeAf6QT2ANCHgtzqiPW+wyiZ7b
	 QH/e5u+GnKZW245BUm2TEyP2NohIw0deaP7re2fmvIiT9nvWIgivaJywrHboGrv+IS
	 yjDGbPAxcIBfL0P5m3kqtp0Vjh+aJX2SruyteKQTsgGIOZnnTpO0id6o4rpvfvpsfb
	 xH56tsJwpRQzQ==
Message-ID: <sashiko-outbox-172189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in
 ncm_wrap_ntb()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boyan Liu" <yymhvert@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015024508.3179-1-yymhvert@gmail.com>
References: <20261015024508.3179-1-yymhvert@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 03:00:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: f_ncm: NULL pointer dereference in ncm_wrap_ntb()
- [Medium] usb: gadget: f_ncm: skb2 is leaked on subsequent allocation fail=
ure
--

commit 8ffb0eb4a1490f0bf7e457d7a7e0bc30811f90a1
Author: Boyan Liu <yymhvert@gmail.com>

usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()

This commit addresses a use-after-free by clearing the ncm->skb_tx_data and
ncm->skb_tx_ndp pointers after freeing them in the error path of
ncm_wrap_ntb(). This prevents subsequent transmits from dereferencing the
freed skbs when allocation fails.

> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 500c9c19c78b4..be1c2fa36350b 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1132,10 +1132,14 @@ static struct sk_buff *ncm_wrap_ntb(struct gether=
 *port,
> =20
>  	if (skb)
>  		dev_kfree_skb_any(skb);

[Severity: High]
Is it possible for ncm->netdev to be NULL when accessed in this error path?

If ncm_disable() or ncm_set_alt() executes concurrently with
eth_start_xmit(), they clear ncm->netdev locklessly before calling
gether_disconnect():

drivers/usb/gadget/function/f_ncm.c:ncm_disable() {
	if (ncm->netdev) {
		ncm->netdev =3D NULL;
		gether_disconnect(&ncm->port);
	}
}

Because eth_start_xmit() relies on dev->lock to verify dev->port_usb, it can
proceed to call ncm_wrap_ntb() if it acquires the lock before
gether_disconnect() disables the TX path.

If alloc_skb() then fails under memory pressure inside ncm_wrap_ntb(), the
code jumps to the err label just above this modified block:

	err:
		ncm->netdev->stats.tx_dropped++;

Will this unconditional dereference of ncm->netdev lead to a NULL pointer
dereference?

[Severity: Medium]
Is skb2 leaked in this error handling path?

Earlier in ncm_wrap_ntb(), when an existing batch is full, the function
packages the pending frames into skb2:

	if (ncm->skb_tx_data && (... > max_size)) {
		skb2 =3D package_for_tx(ncm);
		if (!skb2)
			goto err;
	}

Immediately after, it attempts to allocate a new buffer for the incoming sk=
b:

	if (!ncm->skb_tx_data) {
		...
		ncm->skb_tx_data =3D alloc_skb(max_size, GFP_ATOMIC);
		if (!ncm->skb_tx_data)
			goto err;

If this alloc_skb() fails, the code jumps to the err label and runs through
the cleanup path modified here. While the incoming skb and the pending
ncm->skb_tx_data and ncm->skb_tx_ndp are freed, skb2 is never handled.

Since the function returns NULL without freeing skb2, is the newly
aggregated buffer leaked?

> -	if (ncm->skb_tx_data)
> +	if (ncm->skb_tx_data) {
>  		dev_kfree_skb_any(ncm->skb_tx_data);
> -	if (ncm->skb_tx_ndp)
> +		ncm->skb_tx_data =3D NULL;
> +	}
> +	if (ncm->skb_tx_ndp) {
>  		dev_kfree_skb_any(ncm->skb_tx_ndp);
> +		ncm->skb_tx_ndp =3D NULL;
> +	}
> =20
>  	return NULL;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015024508.3179=
-1-yymhvert@gmail.com?part=3D1
