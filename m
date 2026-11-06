Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938179;
	b=I52nGw7QciD25bRF4fPiVpUsTLmQbQJ933xzHJvYDVWJDK5InMxIjZyO9emdJFuHLTi/
	 Hgds7jbKg2T8c0INpm98FFyhq34wdHA6h3GhJo0AOvsft2pq6vxAdD7L2drVBaYTGf5lc
	 S0PSw6VlDpYt0j57yqRPBv6a6edpt5auXgTsCjKKpJqJQ6MebjEITAnVZVIcfaRKqccbb
	 nIpMpl2ZGgbKcqE9JqG+ytSJbKhsBuEr76wWCH1AbhmHfsEqhEUA7Eg5fotr9Abmggrk1
	 7Sj5bQxv95q/0x4/3gzD8qsWx4CuV8MF37PmHklB8pgf6T/bRV5I8Yv3gRsJjIDFNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2DvVV+28KZcJbhsAl/FbOUJdmfyS4ZBSSbPHIRw30A0=;
	b=epgsbPLdjO8IhyXaTIPG0yda5BsGhiGKL0IZnvqQXoqOdCXW/4/vgxTx7rYZeBSx0o0L
	 uVGOYZq45uUMHUHPyjjN4vCpfGZrm4VM4uGWG32fgJiT4xSoyOf6Mwy396hR3054XGrkC
	 /iS/fl+RX2furQWRpc+n/7cSfEGw4G1pqdWgOMM0srHpE0xn2vc3AnJDo8xGxxdxRXOrB
	 bWGKN5M4WqMNZPkfx6WNGcPeEXme15sHiLrdFpm9iQ3OdrjwDv8RNMQ78WoxtBLdbPsL/
	 Kv9GlFpvTK560meTdW2gTA0RnheNuQjYhAaNg3EHOJwgd+AcTS9EIfa96L/mgXU4akg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYHaT2+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02515606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYHaT2+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6871A1F008A1;
	Fri,  6 Nov 2026 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793938178;
	bh=2DvVV+28KZcJbhsAl/FbOUJdmfyS4ZBSSbPHIRw30A0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NYHaT2+fqakTdL1jTj+WT7dCbquM1ToDUYQ6qxt7e8Cvep/FnIkd6j9Eut3xYLsSO
	 d03TXJifSnhBlueJsto7CPPui92F0WfesmcLxoqx/ZfGLb8oTfn5bqhPXU5oHO8NqG
	 CNnt/6L3EogEVMB83W8SGNSxr5vdIoUJ/1KO2a/a1d0rq1JBwIyqETGXOUG5Gp+Lw7
	 Poz5XyBpuJFxybV1SzJsJ+rRpIkIzI2viZsT54YalJ6n5XKaO5XKtShKH76/uCSv3y
	 5oMhGVv3FdWpikuRCdm+bpyiclpOuuKHSpI4aC6d3Ct9139W7MrJ5PHPWxutp0ilQl
	 r98TcLuFsA8OQ==
Message-ID: <sashiko-outbox-200688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106035732.27338-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
 <20261106035732.27338-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 04:09:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: gadget: uvc: unsynchronized refcnt check in uvcg_color_matc=
hing store
--

commit 52f34f2adcf8a7a6589075037a07a9887a733e9b
Author: Saad Varshani <varshanisaad@gmail.com>

usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks

This commit removes su_mutex locking from uvcg_configfs attribute show and
store callbacks to resolve a circular lock dependency with configfs
frag_sem, and moves the fmt->linked and color_match->refcnt checks under
opts->lock.

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 70a1415ea4014..606c02214c8ce 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
[ ... ]
> @@ -3000,7 +2782,6 @@ static ssize_t uvcg_color_matching_##cname##_store(=
			\
>  	struct config_item *item, const char *page, size_t len)		\
>  {									\
>  	struct config_group *group =3D to_config_group(item);		\
> -	struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;		\
>  	struct uvcg_color_matching *color_match =3D			\
>  		to_uvcg_color_matching(group);				\
>  	struct f_uvc_opts *opts;					\
> @@ -3012,25 +2793,21 @@ static ssize_t uvcg_color_matching_##cname##_stor=
e(			\
>  	if (ret)							\
>  		return ret;						\
>  									\
> -	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
> +	opts_item =3D group->cg_item.ci_parent->ci_parent->ci_parent;	\
> +	opts =3D to_f_uvc_opts(opts_item);				\
> +									\
> +	mutex_lock(&opts->lock);					\
>  									\
>  	if (color_match->refcnt) {					\
>  		ret =3D -EBUSY;						\
>  		goto unlock_su;						\
>  	}								\
>  									\
> -	opts_item =3D group->cg_item.ci_parent->ci_parent->ci_parent;	\
> -	opts =3D to_f_uvc_opts(opts_item);				\
> -									\
> -	mutex_lock(&opts->lock);					\
> -									\
>  	color_match->desc.aname =3D num;					\
>  	ret =3D len;							\
>  									\
> -	mutex_unlock(&opts->lock);					\
>  unlock_su:								\
> -	mutex_unlock(su_mutex);						\
> -									\
> +	mutex_unlock(&opts->lock);					\
>  	return ret;							\
>  }									\
>  UVC_ATTR(uvcg_color_matching_, cname, aname)

[Severity: Medium]
As reported by Sashiko on v2 [1], does moving the color_match->refcnt check
under opts->lock after dropping su_mutex in UVCG_COLOR_MATCHING_ATTR leave
color_match->refcnt and color_match->desc unsynchronized against concurrent
modifications?

Unlike fmt->linked in uvcg_frame_b_frame_index_show(), all functions that
modify color_match->refcnt execute under su_mutex without acquiring
opts->lock. Specifically, uvcg_format_allow_link() and
uvcg_format_drop_link() update color_matching_desc->refcnt while holding
only su_mutex:

drivers/usb/gadget/function/uvc_configfs.c:uvcg_format_allow_link() {
    ...
	color_matching_desc->refcnt--;

	color_matching_desc =3D to_uvcg_color_matching(to_config_group(tgt));
	fmt->color_matching =3D color_matching_desc;
	color_matching_desc->refcnt++;
    ...
}

drivers/usb/gadget/function/uvc_configfs.c:uvcg_format_drop_link() {
    ...
	color_matching_desc =3D to_uvcg_color_matching(to_config_group(tgt));
	color_matching_desc->refcnt--;

	streaming =3D src->ci_parent->ci_parent;
	color_matching_desc =3D uvcg_format_get_default_color_match(streaming);

	fmt =3D to_uvcg_format(src);
	fmt->color_matching =3D color_matching_desc;
	color_matching_desc->refcnt++;
    ...
}

Similarly, uvcg_uncompressed_make(), uvcg_mjpeg_make(), and
uvcg_framebased_make() increment the default color_match->refcnt under
su_mutex (held by configfs_mkdir()) without holding opts->lock:

drivers/usb/gadget/function/uvc_configfs.c:uvcg_uncompressed_make() {
    ...
	h->fmt.color_matching =3D color_match;
	color_match->refcnt++;
    ...
}

Can a concurrent symlink, unlink, or mkdir operation increment
color_match->refcnt and link color_match to a format while
uvcg_color_matching_##cname##_store() observes color_match->refcnt =3D=3D 0=
 and
mutates color_match->desc.aname?

(Also, the error label in uvcg_color_matching_##cname##_store() is still
named unlock_su even though it now unlocks opts->lock.)

[1] https://lore.kernel.org/r/20261106020727.6055-1-varshanisaad@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106035732.2733=
8-1-varshanisaad@gmail.com?part=3D1
