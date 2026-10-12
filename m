Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D142739E176
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803628; cv=none; b=GnIl/0bgqNqekeWR6msB10gynlkTRyoz1Jwv3VgzENnb9J2UU7fRN0sY2qtnYV3M3gcyaTi6SptqMVNusi87fu4AWWyVJxJ6hajWlmvI/AGAIH0Jg9hg/w6aCMKpGilH1JpSGENdK1LXM7yLrKVKFuel295A3PCy2JiLDqDQSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803628; c=relaxed/simple;
	bh=Ijuihg0JhqgDzZs11uG23h9IWk6kmItxk4tF2AevXP8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PfpGu6TMNjgWlN9hmqLiK6WZu77BvCRruu1krm5FqMgDdTbMCOuh7Dl0R2usBBgtwuX/j30li8dKCoindgmuolz3T9ok3w7g0ISa1a0cfvBpVdZ0lqXsk0aRYLNSJbrpuEQFBJEUCksN0erZSv0ThCwXvO4duShaKFUHXpRK/n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5WgZPw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5WgZPw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F9A1F0089B;
	Mon, 12 Oct 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791803627;
	bh=eVNLc1KRvqhVfdCuOj4y/1Jdj7Qwv+XU66gPEFZD7oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5WgZPw+HtKX8ABwfyeAYnaPv4q8ihsVUNMzHgjbIKlQLheUhiYMzprVBnZOo5hdS
	 8wHUszAOxlLWxVlJ5SanVX5hG03Hq6WmUKqx7eR/7tbcUjw1HRkuv2ezihqzeA//SD
	 Fm8jXENukqlVNQteApi74NluEg1G9MJbngxoqzh+Qtac6a6hzLQMC+nutqM1rGBuOI
	 o/Qun7/aCQ599+HHCLtwPjB8l8qKwRFrx/fyMaW2C+KqW5GIoJrKAQRVRn0Dda2iRP
	 20Qr2Qz4EkC7KaNQcvdCXW0VcesRThclbV+R2Mg8HprTjO80r76xd8plC9fGQ4BDp+
	 d9LyTh5dtSKRw==
Message-ID: <sashiko-outbox-168006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: cdns3: validate endpoint index from setup
 packet
Reply-To: sashiko-reviews@lists.linux.dev
To: liuc63 <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012110107.2458022-1-liuc63@xiaopeng.com>
References: <20261012110107.2458022-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 11:13:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: cdns3: endpoint aliasing allows OUT requests to corrupt IN en=
dpoint state
- [Medium] usb: cdns3: unmasked wIndex writes to ep_sel hardware register
--

commit 7991bca72d7e15fa3f3ecc88593a0461276be999
Author: Liu Chao <liuc63@xiaopeng.com>

usb: cdns3: validate endpoint index from setup packet

The commit adds array bounds and NULL checks for the endpoint index derived
from wIndex to prevent out-of-bounds array access and NULL pointer
dereferences when handling setup packets.

> diff --git a/drivers/usb/cdns3/cdns3-ep0.c b/drivers/usb/cdns3/cdns3-ep0.c
> index e29989d57bef9..d26fa89b6fc65 100644
> --- a/drivers/usb/cdns3/cdns3-ep0.c
> +++ b/drivers/usb/cdns3/cdns3-ep0.c
> @@ -251,6 +251,9 @@ static int cdns3_req_ep0_get_status(struct cdns3_devi=
ce *priv_dev,
>  		return cdns3_ep0_delegate_req(priv_dev, ctrl);
>  	case USB_RECIP_ENDPOINT:
>  		index =3D cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
> +		if (index >=3D CDNS3_ENDPOINTS_MAX_COUNT ||
> +		    !priv_dev->eps[index])
> +			return -EINVAL;

[Severity: High]
Does this bounds check fully prevent endpoint aliasing?

Indices 16-31 in the eps array are reserved for IN endpoints. The newly
added check allows index values up to 31 to pass validation.

If a malicious USB host sends a standard control request with a malformed
wIndex where the endpoint direction is OUT (bit 7 is 0) but bits 4-6 are
set such that wIndex & 0x7F is between 16 and 31 (for example,
wIndex =3D 0x11), cdns3_ep_addr_to_index() evaluates to an index in the
16-31 range.

This bypasses the validation and maps an OUT request to the software
structure (priv_ep) of a valid IN endpoint, allowing an attacker to query
the software status of IN endpoints using malformed OUT requests.

>  		priv_ep =3D priv_dev->eps[index];
> =20
>  		/* check if endpoint is stalled or stall is pending */

[ ... ]

> @@ -368,6 +371,8 @@ static int cdns3_ep0_feature_handle_endpoint(struct c=
dns3_device *priv_dev,
>  		return 0;
> =20
>  	index =3D cdns3_ep_addr_to_index(le16_to_cpu(ctrl->wIndex));
> +	if (index >=3D CDNS3_ENDPOINTS_MAX_COUNT || !priv_dev->eps[index])
> +		return -EINVAL;

[Severity: High]
Similarly to the get_status function above, could the endpoint aliasing
allow a malformed OUT request to pass validation and erroneously modify the
software halt state of an IN endpoint?

If a malformed wIndex bypasses this check, the code will later call
__cdns3_gadget_ep_set_halt(priv_ep), corrupting the EP_STALLED flag of an
unrelated IN endpoint and potentially breaking communication for that
endpoint.

>  	priv_ep =3D priv_dev->eps[index];
> =20
>  	cdns3_select_ep(priv_dev, le16_to_cpu(ctrl->wIndex));

[Severity: Medium]
Is it safe to pass the unvalidated, full 16-bit wIndex value down to the
hardware selector?

The USB host provides a 16-bit wIndex in the setup packet, which is only
implicitly masked by cdns3_ep_addr_to_index() when looking up the endpoint
index. This allows values with upper bits set (e.g., 0x0101) to pass the
array bounds check.

The raw, unmasked 16-bit wIndex is then passed to cdns3_select_ep(), which
casts it to u32 and writes it directly to the ep_sel hardware register.
Writing untrusted host-controlled data to reserved hardware register bits
can cause undefined device behavior or hardware state corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012110107.2458=
022-1-liuc63@xiaopeng.com?part=3D1
