Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13F422D4E9
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 03:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777119; cv=none; b=X7zTzOeuYmrx1eeg+lHmUFLDtgDx44lOGN9P2dpgmSj64759yU12HCD7T4w/5sGMq/22L9g9zXCXIlUmBpuMd642dj4f6idFfWK59kwQObUODY04Y6tFqrryn/wxjLd+k0gVLHocQ+HYND2fVUOlb2Mq6dYCRYp9X5PRgpjUhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777119; c=relaxed/simple;
	bh=FHolJ16+rgENRx3tqkQT8AwFRXWDYRl7hyx+kWqUb+s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y/f9rLLp8axnH5vz82iHuGp9w+Nb2It+I1VL2j+E776ebj8SNBhKwzTDzzhOh9xpcP6zr5McK9/GGaR5GSr0fIvkLx4mc6jtAGz0wV7zwZrkL0RDKDgjRyhxgmollQEGVcG6zRqYfRJFoz8DdGH7byD7aKbWajTn87iDyEIuIzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTbQLLTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTbQLLTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7445C1F0089B;
	Mon, 12 Oct 2026 03:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791777118;
	bh=+266Z1RBWR1oAWfw9nL+AGsB5W9NTw31ALUvuaBMqBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTbQLLTJY03EBiIVfiXIVkt+ewJniZOUkrY0oFVX1ITK2l5Ko1lUAelTEK/V/HCtW
	 Rma/gkTuu3mKiIV4mK+2mMdF7lngVduh2WHvY8dRcwtPUQWVl3DxBasgkCTG/ygBwv
	 s3aWBqKtJZes9dCZ+1cXynihiAc4XOBRl8TC4ckTfZjAgg9H3PplEBmgaba4sUtQP2
	 qU0Ne25kPwlsrndcHui4tmeRG0vuSN7Ly4hHIR7Ya3gxL1AwTOLbPqr5bbasC0Kgrz
	 kemm+7N849+KsBHPCqFk33EhxjyVP6KTr4aG/RPTkizLcQM9lr7KxYGc+qm+o3eXBb
	 ehXFtZC7T4iOg==
Message-ID: <sashiko-outbox-167584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: reject short
 GET_NTB_PARAMETERS responses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xinsheng Zhu" <xinsheng.zhu.ny@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com>
References: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 03:51:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbnet: cdc_ncm: strict 28-byte length check breaks pre-errata 26-=
byte hardware
--

commit 21684fc876b53044a42f2941b653d84cd5d8ed14
Author: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses

This patch updates the initialization sequence to strictly validate the
length of the GET_NTB_PARAMETERS response. Instead of only checking for
negative errors, it requires the response to exactly match the 28-byte
size of the ncm_parm structure to avoid using zero-filled parameters.

Link: https://lore.kernel.org/netdev/20261005041525.49111-1-xinsheng.zhu.ny=
@gmail.com/

> diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> --- a/drivers/net/usb/cdc_ncm.c
> +++ b/drivers/net/usb/cdc_ncm.c
> @@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
>  			      |USB_RECIP_INTERFACE,
>  			      0, iface_no, &ctx->ncm_parm,
>  			      sizeof(ctx->ncm_parm));
> -	if (err < 0) {
> +	if (err !=3D sizeof(ctx->ncm_parm)) {

[Severity: High]
Could this exact length check unconditionally fail on pre-errata CDC NCM 1.0
devices?

According to the driver's fallback logic further down in cdc_ncm_init(),
"devices prior to NCM Errata shall set this field to zero" when referring to
wNtbOutMaxDatagrams. Pre-errata devices typically return a 26-byte structure
instead of the full 28-byte structure.

Previously, with the leniency of checking if err is negative, a 26-byte read
would succeed and the kzalloc-backed ctx would safely leave the trailing
missing fields as zero. By requiring exactly 28 bytes, does this patch
unintentionally reject valid 26-byte responses from legacy hardware with -E=
IO,
preventing probe entirely on those devices?

>  		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
> -		return err; /* GET_NTB_PARAMETERS is required */
> +		return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is required */
>  	}
> =20
>  	/* set CRC Mode */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011035150.5331=
5-1-xinsheng.zhu.ny@gmail.com?part=3D1
