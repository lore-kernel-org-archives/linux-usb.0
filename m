Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0286392C4C
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299721; cv=none; b=HQqpM0XI66yhlhVOUJTMWreub2u3UQafw4KPidHmEkV2jygBSB9TLWnNEy0xZQ0lOSeBo27AWN4b84LfacZP4qGdJPpf2co5yQjyFs6BkcxQ4ePnYu+M66htLISm80nxrmPV/YPFOaJCs2ci0V3JIrGst1s7o9udXgEmOiG50e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299721; c=relaxed/simple;
	bh=VYVHFgrTkcar/5URQkD2e970a96bYQeBnEEwklU2zYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=enugXLbnnyRpeINRhGDyQucy0FhNLIU9J3mtHtKh45PKEem41KCPmKHRBJNVAOMK2x0DSZysJq0PYXWThamatbCZdnMk7aFNWzstY5Jy8cxLnPRBfjCoK76E0oJCcDCfruO7iesuiJSK3CfARVukoVxVie9G3rM+ReSpqbk9boM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=fuFdV8qY; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="fuFdV8qY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1781299710;
	bh=VYVHFgrTkcar/5URQkD2e970a96bYQeBnEEwklU2zYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fuFdV8qY8Q+LTAKK1MVWsD+/+jz5toNZDl/NmTCVBWBXaJjjH971KvNAEDvb0Yn5c
	 2531wKlWT8o0/MKxBtmfy1Yi5piuamy0ztjqeHjfTUz+73UjqXQTByQzV1WFcspXJ3
	 bvB5zAhk80Tj0k+pnwu2jlIPN6iIBdI3PRuNvQuo=
Message-ID: <8c1e5e88ea820aae5580ea2f7857064c2f86512a.camel@crapouillou.net>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix fence cleanup in
 ffs_dmabuf_transfer() error paths
From: Paul Cercueil <paul@crapouillou.net>
To: nuno.sa@analog.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: linux-usb@vger.kernel.org
Date: Fri, 12 Jun 2026 23:28:26 +0200
In-Reply-To: <20260612-fix-f_fs-fence-cleanup-v1-1-79f489b0efe9@analog.com>
References: <20260612-fix-f_fs-fence-cleanup-v1-1-79f489b0efe9@analog.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Nuno,

Le vendredi 12 juin 2026 =C3=A0 15:57 +0100, Nuno S=C3=A1 via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> The error paths for endpoint-disabled (ESHUTDOWN) and request-
> allocation
> failure (ENOMEM) in ffs_dmabuf_transfer() jump to err_fence_put which
> calls dma_fence_put() on the fence. However, at that point the fence
> has
> only been kmalloc'd =E2=80=94 dma_fence_init() has not been called yet, s=
o
> the
> refcount and the fence ops are uninitialized. Calling dma_fence_put()
> on
> such an object leads to undefined behavior.
>=20
> Use kfree() instead, since the fence is just a plain allocation at
> this
> stage, and rename the label to err_fence_free to reflect the actual
> cleanup action.
>=20
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import
> interface")
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Yep, makes sense.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/usb/gadget/function/f_fs.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_fs.c
> b/drivers/usb/gadget/function/f_fs.c
> index 75912ce6ab556..ac8c53789ec20 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1682,13 +1682,13 @@ static int ffs_dmabuf_transfer(struct file
> *file,
> =C2=A0	/* In the meantime, endpoint got disabled or changed. */
> =C2=A0	if (epfile->ep !=3D ep) {
> =C2=A0		ret =3D -ESHUTDOWN;
> -		goto err_fence_put;
> +		goto err_fence_free;
> =C2=A0	}
> =C2=A0
> =C2=A0	usb_req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> =C2=A0	if (!usb_req) {
> =C2=A0		ret =3D -ENOMEM;
> -		goto err_fence_put;
> +		goto err_fence_free;
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> @@ -1736,9 +1736,9 @@ static int ffs_dmabuf_transfer(struct file
> *file,
> =C2=A0
> =C2=A0	return ret;
> =C2=A0
> -err_fence_put:
> +err_fence_free:
> =C2=A0	spin_unlock_irq(&epfile->ffs->eps_lock);
> -	dma_fence_put(&fence->base);
> +	kfree(fence);
> =C2=A0err_resv_unlock:
> =C2=A0	dma_resv_unlock(dmabuf->resv);
> =C2=A0err_attachment_put:
>=20
> ---
> base-commit: f176a7c3e44f80b4493d22aa12d02673243ec7d8
> change-id: 20260612-fix-f_fs-fence-cleanup-7a802db2550a
> --
>=20
> Thanks!
> - Nuno S=C3=A1
>=20
