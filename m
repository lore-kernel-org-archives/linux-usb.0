Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F568549388
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170476; cv=none; b=t7lrq/kQY9udNrElrUzRe0FvMMP87Du7xoJxb0P6DjzEvMtkCLLrSTLeIwP/5wncCaQyvS/Pe+y9CjaSpFZMb0NGEiFVeb2NNDOhVlTMZ+lZv2lmMPLDOOBfp7VbgPiwWLjUOAyUQ4awvl+UpIv8QAjLku+HUWVENFLsHd9otPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170476; c=relaxed/simple;
	bh=WCxIAMNe6rzkmMuKbuNke73T66semW8c4ux7+DlJHlY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=UVZOOdWFVbxNF4EI+cVOxGpLJBH8eIVAizTiuSJo3itVYRDLR15gCW3R+WU7GhS9ojPrZ2KFcjEcJ3g5HjuIJAg2AQ31hjAMvIzepFboA02TrxRzfynNeuZKjUBZfwKyso9D0/eoddulLTnn/i3hKkCTbSEK59b1j6FCOFj1SAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StQqshgN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StQqshgN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0451F000C5;
	Fri, 16 Oct 2026 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170475;
	bh=B6BZ3fk4ycPR1cJy2cG2i1/0IIXo6jaXZkRUyTLZGR8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=StQqshgNskzAEhr8Ew1krLcKps0Il1nwcE80LvmAjzI9MEUZSHsaC8vRncFrhjQxn
	 3+rD96qSG2Ohx1IIE3guRAnjXOyYJFBA+QFUW8K3Qs0XFGaLyyDzX4rTqX0pIy6AP2
	 Q+kfwev2zdQ8tQ1ygVAqKHhs3hSk5SC2hlKeE1SZaS9qusCQFmioZrmwJwyRQO21K1
	 HkC0KZfmWsd6VdKu8TinS02FiTDiynKFo9Ghp9+7thdFIR+wxaWYPN72qX7qteM30r
	 me4CAsuVfJjHrSrHEAqD7u3axjL08daIUXmEi/D5FY+wY1qrlOi8fz13CXJxkvc9yc
	 2pHt4ydXEuq6A==
Message-ID: <sashiko-outbox-174688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2 RESEND] usb: gadget: f_uac2: allow explicit
 channel count independent of channel mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261016162534.384844-3-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
 <20261016162534.384844-3-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 17:07:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] usb: gadget: u_audio: heap buffer overflow in u_audio_iso_comp=
lete() due to missing bounds check
- [High] usb: gadget: f_uac2: u16 truncation in get_max_bw_for_bint() leads=
 to undersized wMaxPacketSize
- [High] usb: gadget: f_uac2: memory leak and race from shared static globa=
ls
--

commit c9264c2b1a112c6d9a2f079577364a2e863c803f
Author: Kyle Farrell <kaf@nwlink.com>

usb: gadget: f_uac2: allow explicit channel count independent of channel ma=
sk

The UAC2 gadget driver currently derives bNrChannels from the number
of set bits in bmChannelConfig. Since the bmChannelConfig
channel-location bitmap provides only 27 predefined channel locations,
this limits playback and capture streams to 27 channels. UAC2 permits
bNrChannels values up to 255, independent of bmChannelConfig.

> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/fu=
nction/f_uac2.c
> index 46255ad0a9cfa..c7801bb8765e6 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
[ ... ]
> @@ -689,11 +699,11 @@ static int get_max_bw_for_bint(const struct f_uac2_=
opts *uac2_opts,
>  		// Win10 requires max packet size + 1 frame
>  		srate =3D srate * (1000 + uac2_opts->fb_max) / 1000;
>  		// updated srate is always bigger, therefore DIV_ROUND_UP always yield=
s +1
> -		max_size_bw =3D num_channels(chmask) * ssize *
> +		max_size_bw =3D channels * ssize *
>  			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))));
>  	} else {
>  		// adding 1 frame provision for Win10
> -		max_size_bw =3D num_channels(chmask) * ssize *
> +		max_size_bw =3D channels * ssize *
>  			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))) + 1);
>  	}
>  	return max_size_bw;

[Severity: High]
Can this overflow the 16-bit capacity of max_size_bw?

With channel counts up to 255 independent of the channel mask, this calcula=
tion
can exceed 65535, causing the required bandwidth to be silently truncated.

If this truncates, could it bypass the validation check in
set_ep_max_packet_size_bint() and allow invalid, undersized wMaxPacketSize
dimensions to be programmed:

drivers/usb/gadget/function/f_uac2.c:set_ep_max_packet_size_bint() {
    ...
    if (max_size_bw <=3D max_size_ep)
        dev_dbg(dev,
            "%s %s: Would use wMaxPacketSize %d and bInterval %d\n",
            speed_names[speed], dir, max_size_bw, bint);
    else {
    ...
}

This would severely undersize downstream ALSA ring buffer chunk allocations
and cause data drops.

[ ... ]
> @@ -1059,12 +1084,12 @@ afunc_bind(struct usb_configuration *cfg, struct =
usb_function *fn)
>  		return PTR_ERR(us);
> =20
>  	if (FUOUT_EN(uac2_opts)) {
> -		out_feature_unit_desc =3D build_fu_desc(uac2_opts->c_chmask);
> +		out_feature_unit_desc =3D build_fu_desc(false, uac2_opts);
>  		if (!out_feature_unit_desc)
>  			return -ENOMEM;
>  	}

[Severity: High]
Does dynamically allocating memory and assigning it to the shared static gl=
obal
out_feature_unit_desc overwrite prior instance allocations if multiple UAC2
instances are bound to a composite gadget via configfs, leaking memory?

[ ... ]
> @@ -1099,13 +1124,13 @@ afunc_bind(struct usb_configuration *cfg, struct =
usb_function *fn)
> =20
> =20
>  	/* Initialize the configurable parameters */
> -	usb_out_it_desc.bNrChannels =3D num_channels(uac2_opts->c_chmask);
> +	usb_out_it_desc.bNrChannels =3D uac2_num_channels(false, uac2_opts);
>  	usb_out_it_desc.bmChannelConfig =3D cpu_to_le32(uac2_opts->c_chmask);
> -	io_in_it_desc.bNrChannels =3D num_channels(uac2_opts->p_chmask);
> +	io_in_it_desc.bNrChannels =3D uac2_num_channels(true, uac2_opts);

[Severity: High]
Does modifying static descriptor templates like usb_out_it_desc directly
during bind cause data races and corrupted descriptor fields if concurrent
bindings occur?

[Severity: Critical]
With the channel count expanded to 255, could this cause a heap buffer over=
flow
downstream in drivers/usb/gadget/function/u_audio.c?

When uac->p_framesize is dramatically increased by the larger channel count=
s,
and residue accumulation triggers in u_audio_iso_complete():

drivers/usb/gadget/function/u_audio.c:u_audio_iso_complete() {
    ...
    if ((unsigned int) div_result >=3D uac->p_framesize) {
        req->length +=3D uac->p_framesize;
        uac->p_residue_mil -=3D uac->p_framesize * p_interval_mil;
    ...
    if (unlikely(pending < req->actual)) {
        memcpy(req->buf, runtime->dma_area + hw_ptr, pending);
        memcpy(req->buf + pending, runtime->dma_area, req->actual - pending=
);
    ...
}

Will this memcpy overflow req->buf by up to p_framesize because req->length
was increased without verifying it stays within ep->maxpacket?

Request buffers are tightly packed at intervals of ep->maxpacket:

drivers/usb/gadget/function/u_audio.c:u_audio_start_playback() {
    ...
    req->buf =3D prm->rbuf + i * ep->maxpacket;
    ...
}

This means any overflow immediately corrupts the next request's active DMA
memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016162534.3848=
44-1-kaf@nwlink.com?part=3D2
