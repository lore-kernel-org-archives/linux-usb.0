Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105805;
	b=MxTrSnTEISVKvZ6w37V2TReDH8euqhZL+K1V7SWZzjNkpMxSHHqByB6nplBNAX77i4qM
	 LwXayPhzVDd9cPZG3PccSgr+QNKeYAeRoQkOfmOtexgfzPC8XqtjDIaQmnhoMLPsJv67r
	 bIvo2Cg1Z6n43fuy9tUrEUyG287KmZpxf5ZMuD65V38FlkpE/VHNqeCvHDIVNMpO64riE
	 ExqP+s4MWKERpJEJTHR+yZYQ1gtfaBsDr4RVasKJO/XRhqQd+PL70Yj0YIzAjLznAqHdB
	 Zmd89VqBGD7/bv2zPWMts8uBDlw/Ed7jNicYXm8MdpsrTvUZzZvhTNsjKiWng65ng2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1DxIXMatrBRcYO8fXPehQDYT+ggSdmMpkz/fHzZMxIQ=;
	b=Av0sq1so4HeehKIP80qO/0dhGILGYFhDOLkcbg2uTksRqNU/Wem++jZmW43+QDthdnX2
	 syqHcAYyBh910QZzyZzvmjdjyBIZ1bm/m3B6xjgNsbmYqAuvijgLg7Ix4s7MsD1bR0N4d
	 rCca+TLAWx7EcCi7rWbaUYOVYDRzKQTz0UECUPDFLSFZ0iAhiz4OZdZJeWpcpzf9Gvt2+
	 TsDaQTujNTUjUs1W5ygfajr5F5tQgGWjMPtM+wSB/fOA20fJAkIG4VhaVgBlwQ9CzGxcP
	 0JDzXsLozpWQcwweK4TiPFBHdTN8jE4MRvnLejZTG5lnfiPrnUG9903tCgJ6DWnkiNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSan62Hp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1845606A32C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSan62Hp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F621F000C4;
	Thu, 19 Nov 2026 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105805;
	bh=1DxIXMatrBRcYO8fXPehQDYT+ggSdmMpkz/fHzZMxIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSan62HpdVcspZA54vNzvLCbm2n8C8UbMCxZFHzunvLDcjoyAERiW7oZD9qLfAVcs
	 G386WUkeFZ45eDvm/9xpmkiSY2wKFY5CE87NRXU7ErWDw6hxS2au/S8YdPmcdvmhNi
	 6/+UA3xBsQXvz7ZkiJsDViaNyjd/ong5ZJDZSOfOEwdXNnjD/fuAfLInNlkGC8RMdq
	 zfDdb+5JhRIiZcxTjLzYA8n3UpBOb5bRt8Tt1GOkUkbbzS/tgcoWjqeN1r0Lw5h2+O
	 xQG+5ySHDBRAFiVnrRfeubdufiynhXSl2aSb+d/7v/NdAeWRukSN786PKVjTuMyiPz
	 Eq99zPEdeiecg==
Message-ID: <sashiko-outbox-223524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: remove su_mutex from configfs
 _show/_store callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Timo Joannin" <timo.joannin@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBXRUJDQU0gR0FER0VU?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261119161742.758715-1-timo.joannin@gmail.com>
References: <20261119161742.758715-1-timo.joannin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:30:04 +0000
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
- [Low] usb: gadget: uvc: missing Fixes trailer for configfs su_mutex
  deadlock fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: gadget: uvc: u8 bLength truncation in
  uvcg_extension_bm_controls_store() overflows heap [1]
--

commit a01d42011350eddd8e616a06c5a390f67d1d73f0
Author: Timo Joannin <timo.joannin@gmail.com>

> usb: gadget: uvc: remove su_mutex from configfs _show/_store callbacks
>
> Syzbot reported a possible deadlock when reading UVC configfs attributes:
>
>         su_mutex->func_lock->tpg_instances_lock->i_mutex->frag_sem->su_mu=
tex
>
> When calling _store or _show functions, the configfs framework
> already grabs a frag_sem lock in fs/configfs/file.c, which pins
> the ci_parent chain in memory making grabbing su_mutex
> inside _store and _show calls for protection obsolete.
>
> This su_mutex lock acquisition is what triggered lockdep.
>
> Remove mutex_lock(su_mutex) from the UVC configfs _store and _show
> calls to break the final frag_sem->su_mutex link. Furthermore,
> since color_match->refcnt was protected by su_mutex, protect it
> with opts->lock in uvcg_color_matching_*_store(),
> uvcg_format_allow_link(), and uvcg_format_drop_link().
>
> Reported-by: syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dcaf0e2bd08dda787005d
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>

[Severity: Low]
Since this fixes the su_mutex deadlock introduced with UVC configfs support,
should the commit message include a Fixes tag?

  Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index b9af49940d5f2..d7594406f1753 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
[ ... ]
> @@ -1106,24 +1007,18 @@ static ssize_t uvcg_extension_bm_controls_show(st=
ruct config_item *item,
>  	}
>  	mutex_unlock(&opts->lock);
> =20
> -	mutex_unlock(su_mutex);
> -
>  	return ret;
>  }
> =20
>  static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
>  						const char *page, size_t len)
>  {
> -	struct config_group *group =3D to_config_group(item->ci_parent);
> -	struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;
>  	struct uvcg_extension *xu =3D to_uvcg_extension(item);
>  	struct config_item *opts_item;
>  	struct f_uvc_opts *opts;
>  	u8 *bm_controls, *iter;
>  	int ret, n =3D 0;
> =20
> -	mutex_lock(su_mutex);
> -
>  	opts_item =3D item->ci_parent->ci_parent->ci_parent;
>  	opts =3D to_f_uvc_opts(opts_item);
> =20
> @@ -1157,7 +1052,6 @@ static ssize_t uvcg_extension_bm_controls_store(str=
uct config_item *item,
> =20
>  unlock:
>  	mutex_unlock(&opts->lock);
> -	mutex_unlock(su_mutex);
>  	return ret;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can [1]
uvcg_extension_bm_controls_store() (along with
uvcg_extension_ba_source_id_store(), uvcg_extension_b_control_size_store(),
and uvcg_extension_b_nr_in_pins_store()) truncate xu->desc.bLength and
cause a heap buffer overflow in uvc_copy_descriptors()?

When 24 + bNrInPins + bControlSize >=3D 256, assigning
UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins, xu->desc.bControlSize) to
the u8 xu->desc.bLength field wraps modulo 256 while bNrInPins and
bControlSize keep their larger values:

drivers/usb/gadget/function/uvc_configfs.c:uvcg_extension_bm_controls_store=
() {
    ...
	xu->desc.bmControls =3D bm_controls;
	xu->desc.bControlSize =3D n;
	xu->desc.bLength =3D UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
						      xu->desc.bControlSize);
    ...
}

During UDC bind, uvc_copy_descriptors() allocates mem using the truncated
xu->desc.bLength, and UVC_COPY_XU_DESCRIPTOR() then copies the full
24 + bNrInPins + bControlSize bytes into mem, overflowing the heap buffer.

[1] https://sashiko.dev/#/bug/linux-b5a5242b-262c-45f0-8665-4d268c233a8e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119161742.7587=
15-1-timo.joannin@gmail.com?part=3D1
