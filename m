Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404560;
	b=4ntJT/rokQs9u+m0JZLV0XMfBZD9Xd5vqZHxS7mosqmUq2XFL32TSQ+mn8MG6vQpTKnG
	 LKAbeUg70tGLB8FUsWLWeLXfWTopRtku5VnuUjKcFFBnIENJBU8TfS8Qecb7lTQ6FA0hI
	 EOmXcqlHaH1v1It37g5zJ4Fz/VNkWL8D0gq4XeihqraRzwGCPNRRe1/OyJuglqicrbrIW
	 SuGf4Ke8cAzM55RIJj9iNRx+Uov63vuKL5omgIJK7ioI80FcxOahZQPBaT7d6UgJerwb8
	 Jq3zKODgdirYbabRF2Qt0RO7yGaNbcLSeZdBHjmk8sGeao7RHOf6RAfgiqamib4onMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7eSK4JQokF1Z+ta8uvEGtD+TiX1LlB0BjXUrxKgUmZs=;
	b=U8iym08FKTzxEoXSvZXUfpmwJmAYElnDY/xkHsnyAGg1OS6TErxrq00nY5ztb2aen42h
	 cSO0rNmZFqkziwZcDlx1FoRTXonIO7JWsqFj8LLiv3KhAADf+tFRRCqJ56GFLl4BA00KY
	 Ta+mXO/6Sppo71Dy+A2a8dFvcIcgqxhJ83CI2ymB+IwhmwKoH8nNGE/kUyYwrfnhzMMYg
	 YJ4BiyTZ7+14nyG3Ap6PpLK7sHsndjPt3691PMLIy1KvLPzSNsiX8fSJmPpfiKzNtQK43
	 CY0v/fZfHUfvJD+b7kmkD6EkUxNxEyGiTjKViG2Cs2ig+zDRlflc/WAMp8f3M3M3kFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iv2bnNnp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EEF606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iv2bnNnp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87BA1F00A05;
	Wed, 11 Nov 2026 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404560;
	bh=7eSK4JQokF1Z+ta8uvEGtD+TiX1LlB0BjXUrxKgUmZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iv2bnNnpHVNVT7DEIQeaVoq/Gg4yY+YifH2OgeXUymx+1KRJ+rIl1vxWwMGL8rrVG
	 rb4oasZBL3Azd6sldPOuvUziaWrIgOIJ2ALLiQsmnoqdI1oIpiDlhIo8FHAciKI/Z8
	 jkYYIfY81/aFaT0rZJ1lxGHA1BPRnfUdacUFBztXvO4uPFaU4x0HwmzwZGOG4MOwIl
	 VrXQrYHaszHk4jI30myd8q3ejFX93VDZv0uqeL3GkDxrshbRJsZ95MQiRGd5158BmA
	 HiD/hDZdNPAqv1ZHYLBbSuyMxJeJqowUYkOcZFF9hNfQ3U6zT59HOosSE6aQY6U2uk
	 bI/ujykwBfbAw==
Message-ID: <sashiko-outbox-209083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] usb: cdns3: Fix WA2 request UAF on endpoint disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jaeyeong Lee" <lee@jaeyeong.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111132346.9262-1-lee@jaeyeong.cc>
References: <20261111132346.9262-1-lee@jaeyeong.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 13:42:39 +0000
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
- [Medium] usb: cdns3: missing DMA unmap for deferred WA2 requests in
  cdns3_gadget_ep_disable()
--

commit 15008f28246eb4c2cca9af667c3695fb8684956a
Author: Jaeyeong Lee <lee@jaeyeong.cc>

usb: cdns3: Fix WA2 request UAF on endpoint disable

This commit initializes priv_req->request.list when adding an internal WA2
request to wa2_descmiss_req_list and removes it during
cdns3_gadget_ep_disable() before freeing the request.

> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-g=
adget.c
> index 380c4fde8298e..770fbeee53484 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c

[ ... ]

> @@ -2547,6 +2549,7 @@ static int cdns3_gadget_ep_disable(struct usb_ep *e=
p)
>  	while (!list_empty(&priv_ep->wa2_descmiss_req_list)) {
>  		priv_req =3D cdns3_next_priv_request(&priv_ep->wa2_descmiss_req_list);
>  		list_del_init(&priv_req->list);
> +		list_del_init(&priv_req->request.list);
> =20
>  		kfree(priv_req->request.buf);
>  		cdns3_gadget_ep_free_request(&priv_ep->endpoint,

[Severity: Medium]
Does this free priv_req->request.buf while it is still mapped for DMA when
an internal WA2 request is on priv_ep->deferred_req_list?

__cdns3_gadget_ep_queue() calls usb_gadget_map_request_by_dev() before
adding priv_req->request.list to priv_ep->deferred_req_list.  Requests on
priv_ep->pending_req_list are unmapped by cdns3_gadget_giveback() in the
preceding loop, but unlinking priv_req->request.list here removes a
deferred WA2 request before the deferred_req_list giveback loop runs,
leaking the DMA mapping and triggering a DMA-API warning when
priv_req->request.buf is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111132346.9262=
-1-lee@jaeyeong.cc?part=3D1
