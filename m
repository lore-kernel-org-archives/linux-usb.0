Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272125;
	b=cMmBhzsqWeV18ErZ4DHPsQmVIGLTNZwaNJ3xO3omYGLBpJkttrLqtXpiRY5dSCeiIipI
	 AVLzs313drtXhsrScKS6346tZlwISubrfu48AS/9RDC8A+NGy3y2ht+mJRm3Nq0oMkGzu
	 cTIMZN80V4y2QaVFZbW6/fsYyIUJkahgaG2oDMYmyguSwwDBy4O7oOloqfugEPbWNJFGv
	 yFnxgk1RFaytIp/O0BKhZHJonaJznlzA/S/QlY2YJwMK/karOCbMsrJZeDLhtcWEmczy5
	 Gxxqh53Je4PeDlgZIgLAajvg4aHzku4C9dh/18CA5fAvrSToaORez3KDmYXwOu+31dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3q2+cGlAaoA+ZMxTrBEtXkuwR+HvBqCh5v7z23M/PUA=;
	b=l7uY3XksCx7weA9+j7WKm0QY6UuOPEbT+9NXHkcjMKM5PcpWD47PB8bYlGd94xTtaegJ
	 U5R7erwd9yoDaTG7LXDyEaqQa462OKRiuwZUKs2oL5IuRCYMZ3SoZglZwj+z9Wy7RP5As
	 IQjL+I/J0j9OrGXITWJ9y0tRB5o4TWFPt9KhL2+0IU1K+vTUqsl4QITOb3rMzr6yVgVYq
	 wIwiXWFSF3xcshINxK7ZiVT1D16+r9O/cxYAAwSuIaXuK6ucaGhuCyRkyEGHBn4j2joqL
	 s4x8skW2IJAy1RkU0c6k9LW+kdbvHctdUXsKjOFtLcB7jibvMhbXnjKh6PCUszLjM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KQO/+nXw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E38606A331
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQO/+nXw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2A91F000C6;
	Sat, 21 Nov 2026 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272125;
	bh=3q2+cGlAaoA+ZMxTrBEtXkuwR+HvBqCh5v7z23M/PUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQO/+nXwxWuuD+agoVdcQ7HgbynNkHknAIEAUmw7LGYhyemkLefKpznrqUjEGgOTM
	 hARhNGSN+wKB+VSrno832FOd8j0E7MI5zkjLOl7Z9PL6R4oDW52QtGUdI1niqaRNOk
	 g+M9W/tynwGl1AYgmru/661D1UJwCjQqj0r7wvY1n4mpgHkUZKmllVOSHKAQ5Z8tbT
	 nVqjG+zFyt2BgE8zpESVLt8RReCt57eH2A5yaIi7DdQK7+hXXHEs3o77oqjl3HuaPD
	 Sz5Odld8CF4u4e9f3s4b1cZfufrTl6a9ZuUuk/SvTBFeEzxesp5BH+MJ+3Iv5udMCY
	 a4BK3HciiC84Q==
Message-ID: <sashiko-outbox-227102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: u_audio: reject srate request for
 unconfigured direction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Deepanshu Kartikey" <kartikey406@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121143142.17721-1-kartikey406@gmail.com>
References: <20261121143142.17721-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:42:04 +0000
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
- [High] usb: gadget: u_audio: uninitialized stack leak via
  u_audio_get_playback_srate()
--

commit d6b92cacc40344244658dfaa12df4f37045d7cc1
Author: Deepanshu Kartikey <kartikey406@gmail.com>

usb: gadget: u_audio: reject srate request for unconfigured direction

This commit returns -EOPNOTSUPP from u_audio_get_playback_srate() when
p_chmask is not set, avoiding an uninitialized spinlock acquisition on
uac->p_prm.lock.

> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index 83019d359c8d1..79e3f4fdde6fb 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -582,6 +582,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_=
dev, u32 *val)
>  	struct uac_rtd_params *prm;
>  	unsigned long flags;
> =20
> +	if (!audio_dev->params.p_chmask)
> +		return -EOPNOTSUPP;
> +
>  	prm =3D &uac->p_prm;
>  	spin_lock_irqsave(&prm->lock, flags);
>  	*val =3D prm->srate;

[Severity: High]
Does returning -EOPNOTSUPP here without writing *val leak uninitialized
stack memory to the USB host?

The caller in_rq_cur() passes an uninitialized stack variable p_srate and
ignores the return value:

drivers/usb/gadget/function/f_uac2.c:in_rq_cur() {
	...
	u32 p_srate, c_srate;

	u_audio_get_playback_srate(agdev, &p_srate);
	u_audio_get_capture_srate(agdev, &c_srate);

	if (control_selector =3D=3D UAC2_CS_CONTROL_SAM_FREQ) {
		struct cntrl_cur_lay3 c;

		memset(&c, 0, sizeof(struct cntrl_cur_lay3));

		if (entity_id =3D=3D USB_IN_CLK_ID)
			c.dCUR =3D cpu_to_le32(p_srate);
		...
		value =3D min_t(unsigned int, w_length, sizeof(c));
		memcpy(req->buf, &c, value);
	}
	...
}

Previously, u_audio_get_playback_srate() set *val to prm->srate (0 from
kzalloc).  With this early return, a UAC2_CS_CUR request for
UAC2_CS_CONTROL_SAM_FREQ targeting USB_IN_CLK_ID on a capture-only gadget
is not rejected; instead, in_rq_cur() copies the uninitialized p_srate into
req->buf and sends 4 bytes of kernel stack memory to the host.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121143142.1772=
1-1-kartikey406@gmail.com?part=3D1
