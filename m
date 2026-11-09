Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202869;
	b=UmicpQtE+XmcboWEpQMTLfPeMI0a3BT6QPmDyHHhMBllQOyOik/ieCdMF4Smu7Rp7imh
	 jZjcnOua49O4fAqjpw+RN4tKxH5jJGKCZTT7pKw3dy3NqqDADAba1ngirJx232WxiEqYW
	 vp3cy2FG3EdUfccGS8PFprZ1ez/3M8WeXi47OmTCGyBq1bd2fRJpug1CpRfe0RPtkow8l
	 3f8buaSQWBw/LAFnA4Eor8WBNGANSNFtI9GcOdkgVVKaVqzSYit44kn6h5XCbyCZVP0gM
	 vr8EswC5Io3/lkrKi7eObmatsdWvOz+B6PD+4R5JpMUsflMRedMdfvJZWeWsPAG/Rfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202869;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QWB+txj9hiV4uJoxSDQXnx1+LZvnUuA7rzZrCLgCEI4=;
	b=eKKeZdUPK3T72LgaEs2sLQaWCpPZbinTIVcUPA33UknyHWphaecmgvUuZHAc+CxOdjxU
	 RudevVYMTtYBL0pjCJbY4dalMSYqSO9QtrzVdCU0Qpg0I9eMkJX0xLxQhTnBuU/+tLSXu
	 Fu/2YVOpq4mlPvTbLrEBpNmIs3S/KOHP4KhMve7XCya8OYCRE008WtatQBfCeeEBiYdUi
	 ZMzSxu6eCRCA18w3gI+T+TnaMkyO5L7BVJ5p+jfZN+QkB1iZ3ZhtFafuo1pjI43TPCqCn
	 0Y26aneLylcQnsCP4dPAG5ghvb17Zji9IEXQp8GhFnwlz+h75lDY/wr1IvjL9WBxQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G/g2nx2k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B629606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G/g2nx2k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B321F0089F;
	Mon,  9 Nov 2026 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794202869;
	bh=QWB+txj9hiV4uJoxSDQXnx1+LZvnUuA7rzZrCLgCEI4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=G/g2nx2kedYGkCOw0xrXTngR8+33OywHfYlzEHs6JSC01H82B/fWiVQAi5jtz2Gpj
	 kJmJTihPjFhig9CDlWqIXzV3cAhS5pufBnE4IVUpkc5GhbxsVi1wwhpu6ThIrQmJSh
	 erzuAVzZ0mBw/Ipz99yUK/nHuINe8VnrnVGvTyr1B3jExuYH4ISjjMFYltXdSsoSC0
	 DD/3dGUN42qZ/yRcyKa2Z1U+xbBOPaO6tNWEEFX4UegewY6rTxLA94OVeBKq4wVXVQ
	 Z8Cdqsl58lfHR5IwF+x4b3wxu+2uhEjl8IT/IKKUADEOONApfx+95FAoJdxkaicq99
	 uoGIVPdrj8jQA==
Message-ID: <sashiko-outbox-204450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH usb-next] usb: gadget: f_ncm: prevent double-free of OS
 descriptor table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xinsheng Zhu" <xinsheng.zhu.ny@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261109053440.49156-1-xinsheng.zhu.ny@gmail.com>
References: <20261109053440.49156-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:41:08 +0000
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
- [Low] usb: gadget: f_ncm: missing Fixes trailer for ncm_unbind()
  double-free fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: gadget: f_ncm: memory leak in ncm_unbind() [1]
--

commit 1d3d70b425a5f8ec0afdd69a5b560a6e1867217a
Author: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>

> usb: gadget: f_ncm: prevent double-free of OS descriptor table
>
> ncm_bind() allocates an OS descriptor table only when
> cdev->use_os_string is enabled. However, ncm_unbind() frees the
> table and resets f->os_desc_n without clearing f->os_desc_table,
> leaving a dangling pointer.
>
> When a ConfigFS gadget is unbound, the function object can be reused
> for a subsequent bind. The OS descriptor support can be toggled
> through the ConfigFS os_desc/use attribute, which determines
> cdev->use_os_string on the next bind. If this flag changes from true
> to false between binds, ncm_bind() skips the allocation and leaves
> f->os_desc_table pointing to the previously freed memory.
>
> A subsequent unbind may therefore free the stale pointer again,
> resulting in a double-free.
>
> Set f->os_desc_table to NULL after freeing it to prevent the stale
> pointer from being reused across bind/unbind cycles.
>
> Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>

[Severity: Low]
This is a bug fix for OS descriptor handling in ncm_unbind(). Should the
commit message include:

  Fixes: 793409292382 ("usb: gadget: f_ncm: Add OS descriptor support")

> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 500c9c19c78b4..685152ec9a5d0 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1741,6 +1741,7 @@ static void ncm_unbind(struct usb_configuration *c,=
 struct usb_function *f)
>  	hrtimer_cancel(&ncm->task_timer);
> =20
>  	kfree(f->os_desc_table);
> +	f->os_desc_table =3D NULL;
>  	f->os_desc_n =3D 0;

[Severity: Medium]
This problem wasn't introduced by this patch, but does ncm_unbind() leak
ncm->skb_tx_data and ncm->skb_tx_ndp [1]?

ncm_wrap_ntb() allocates skb_tx_data and skb_tx_ndp to aggregate outgoing
packets and arms task_timer to flush them. If the gadget is unbound before
task_timer fires or the NTB fills up, hrtimer_cancel(&ncm->task_timer) stops
the pending flush without freeing those skbs, and ncm_free() later frees ncm
directly.

[1] https://sashiko.dev/#/bug/linux-c8af1819-7ebd-4e08-89f6-265e1b0462fd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109053440.4915=
6-1-xinsheng.zhu.ny@gmail.com?part=3D1
