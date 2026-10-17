Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166A3B1EC8
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206045; cv=none; b=Su/gxkZXXv/hf03gAAYHQg9WiwB1JVTiGadarOaNOncNUQe+KFl9k8GnTm1AukQAlK0tc7Bjr2AlKY2g7iuuKLmpNFCd2EPtEARduG2s8VU1jgry8GnlZMNa1b3thbh9MjK4CQ1kBqciQJudXyy+jqJP+kSMd4wJL2lXpF7Py9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206045; c=relaxed/simple;
	bh=YX60QvntkmQ13SP81QgBoKJzAaecTPrlH+f+SuoJ1L0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Uj8VJtWCjMpcXvS2b26ZuCi/iAxw1YRg3N8kQY04Pyv/Y4edGopREpJRrF2TIHuudsqyFiQOskBULBSD3hISDFp4QojI4VlNBw2wFEdc7iqUSRceVy2X5bZklaUk10PZkZ6B1LP+R+ruXMK1ZXJLXcUCx1Nd3Uy6UN72j3PxE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ccep4/SK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ccep4/SK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCD01F000CB;
	Sat, 17 Oct 2026 03:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792206038;
	bh=WUesCHfUz1K8QDyFv8IIBHlfChD8q1QhBBB+BaLttR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ccep4/SK41ljpHeOf4vaurvlLOR9xs3WpEI9fUtzNmwes1CxsODVOxsgxz5Zi//jo
	 dcC/qZp9hGl3kT0pH/nT8wm+seWm0PvrZ2M3089mu5wq2ojVaWXyQ8KDwRfKOqbcAR
	 spFOSDA1YzA3t8tOoWmhaivV0VL+mZG7bwx9xVcleQ+dffVF3q26nTzovgS9driCzk
	 6F6cBgYyq20Liad8YzYY4ag3RAFaKgWTkn0GNifN2mP8t5iz04wljRpk/6ghrW7SXC
	 ye5ozn/IchrpvnleFJELvlq8NeFNwAgAsOrneih8UvrVP0YBXZiBsKgUjUTiDrHHyR
	 WAF1ObOegD73w==
Message-ID: <sashiko-outbox-175223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: cdns3: validate endpoint index from setup
 packet
Reply-To: sashiko-reviews@lists.linux.dev
To: liuc63 <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017024422.3400907-1-liuc63@xiaopeng.com>
References: <20261017024422.3400907-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 03:00:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: cdns3: ep0 guard bypass in cdns3_ep0_feature_handle_endpoin=
t()
--

commit 315547ec5e1cd4b938b672e53824e1e53cb91496
Author: Liu Chao <liuc63@xiaopeng.com>

usb: cdns3: validate endpoint index from setup packet

This commit masks the endpoint number in cdns3_ep_addr_to_index() with
USB_ENDPOINT_NUMBER_MASK (0x0F) instead of 0x7F and adds NULL checks on
priv_dev->eps[index] in cdns3_req_ep0_get_status() and
cdns3_ep0_feature_handle_endpoint().

> diff --git a/drivers/usb/cdns3/cdns3-ep0.c b/drivers/usb/cdns3/cdns3-ep0.c
> index e29989d57bef9..ab18adec831ea 100644
> --- a/drivers/usb/cdns3/cdns3-ep0.c
> +++ b/drivers/usb/cdns3/cdns3-ep0.c

[ ... ]

> @@ -368,6 +370,8 @@ static int cdns3_ep0_feature_handle_endpoint(struct c=
dns3_device *priv_dev,
>  		return 0;
> =20
>  	index =3D cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
> +	if (!priv_dev->eps[index])
> +		return -EINVAL;
>  	priv_ep =3D priv_dev->eps[index];
> =20
>  	cdns3_select_ep(priv_dev, le16_to_cpu(ctrl->wIndex));
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-g=
adget.c
> index f4dfd01317083..be6d607f55c92 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -109,7 +109,8 @@ void cdns3_set_register_bit(void __iomem *ptr, u32 ma=
sk)
>   */
>  u8 cdns3_ep_addr_to_index(u8 ep_addr)
>  {
> -	return (((ep_addr & 0x7F)) + ((ep_addr & USB_DIR_IN) ? 16 : 0));
> +	return ((ep_addr & USB_ENDPOINT_NUMBER_MASK) +
> +		((ep_addr & USB_DIR_IN) ? 16 : 0));
>  }
> =20
>  static int cdns3_get_dma_pos(struct cdns3_device *priv_dev,

[Severity: Medium]
Can a crafted SET_FEATURE or CLEAR_FEATURE (USB_ENDPOINT_HALT) request with
(wIndex & USB_ENDPOINT_NUMBER_MASK) =3D=3D 0 and stray bits set in 0xff70 (=
for
example, wIndex =3D 0x0010 or 0x0100) now bypass the endpoint 0 check in
cdns3_ep0_feature_handle_endpoint() and operate on priv_dev->eps[0]?

In drivers/usb/cdns3/cdns3-ep0.c, cdns3_ep0_feature_handle_endpoint() guards
against endpoint 0 with:

	if (!(le16_to_cpu(ctrl->wIndex) & ~USB_DIR_IN))
		return 0;

	index =3D cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
	if (!priv_dev->eps[index])
		return -EINVAL;
	priv_ep =3D priv_dev->eps[index];

When wIndex has bits [3:0] equal to 0 and any bit in 0xff70 set,
(le16_to_cpu(ctrl->wIndex) & ~USB_DIR_IN) is non-zero, so the early return
is not taken. With cdns3_ep_addr_to_index() now masking with
USB_ENDPOINT_NUMBER_MASK (0x0f), index resolves to 0 or 16.

In drivers/usb/cdns3/cdns3-gadget.c:cdns3_init_eps(), both priv_dev->eps[0]
and priv_dev->eps[16] are populated with the EP0 endpoint pointer:

		if (ep_dir && !ep_number) {
			priv_dev->eps[i] =3D priv_dev->eps[0];
			continue;
		}

As a result, !priv_dev->eps[index] is false and priv_ep resolves to
priv_dev->eps[0]. Since ep_sel only decodes bits [3:0] (EP_SEL_EPNO_MASK)
and bit 7 (EP_SEL_DIR), cdns3_select_ep() selects EP0 in hardware and calls
__cdns3_gadget_ep_set_halt() or __cdns3_gadget_ep_clear_halt() on EP0. This
either stalls/flushes EP0 and sets sticky EP_STALLED / EP_STALL_PENDING
flags on priv_dev->eps[0]->flags (which cdns3-ep0.c never clears, causing
subsequent GET_STATUS requests on EP0 to report halted status) or issues
EP_CMD_CSTALL | EP_CMD_EPRST on EP0 during an active control transfer.

Should the endpoint 0 check in cdns3_ep0_feature_handle_endpoint() also mask
wIndex with USB_ENDPOINT_NUMBER_MASK (or check !(index & ~16)) so it stays
consistent with cdns3_ep_addr_to_index()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017024422.3400=
907-1-liuc63@xiaopeng.com?part=3D1
