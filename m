Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794027459;
	b=Z/GghprMQPyc2DWFdfDppV8D8d6CcxikJlMEZs+DAXHhfBxcGBALUp8klvaOg70+8/4y
	 b5Q6Ab2AG7oy0Tt68zY/6HZT1DvzPa66TV0S9AlaiiN+CqmnYKMGyJwAQs3b/lmEfQygo
	 j7l4DihHFpJBuQHDjbiHP3+Y6Lswrup3xzsNNE8nAJnMRgE6s4lpTlfl+0hRmXu7VmI8c
	 pvd3hdU/oNwAIhbRtT7FWT7ild1ipT9nZCjOOaoC28bkrKakZE0yNZLIuFEa7OAw8zn/7
	 F3KrE4BwxS6OcZzUGcrfDGR+JZucPPMeXLOnUYhZvfjWgZkTzWWQrw46B6ON1sVlnbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794027459;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hoIZETR2EiRksj9azsWsRUtRW0+TZxnIiU5jCy2mf3E=;
	b=ILl7YewPbBdMnRXDZkKtxkYZkiB1TqKAaFxcEmfra0PBD5j48MCk1AxJ/Xf5LWQWFfW2
	 9n0/YlBkmNF3AC1W7cbuGJUeZFs9Nx32+XHw/rAr577NZPV/GHWHL9+ysEPv35h7uS/+i
	 +VXDogfPjdli3l1pAGkJv2RKiWJg2J+50JoXT5+QLLRcxKCL8+A7F9CozBxnB714vAQ2Z
	 D7HkzYdbdgSnb+FymJlMCycZ3tjLXeEKwsu2UQHLu1LS4WcgwUuV/yyZJCuwI7WRGaDmu
	 CbeU4ZpprEpD/bXkT7964bwPn5TWsoC66Sqib8Hfye/OKQyWW3QqnqlVYCs1C+zHTxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOI0vfxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59B606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOI0vfxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49EC1F0089F;
	Sat,  7 Nov 2026 04:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794027458;
	bh=hoIZETR2EiRksj9azsWsRUtRW0+TZxnIiU5jCy2mf3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nOI0vfxGI2RUicCcez1jbbauvy6kZNn/kjkfCukru8AZaxto/VZsv5n31xycPV+Js
	 JbeGNs5HKee13jOOUfcw6PcB8uLAizuEKOKvdfPEtkv2LKBUPlDAXQiTLelSm/0MGO
	 1w45QwWkuRjx7+KWqP65MYPMVC3rZhlk7iYSNTMj5fUkz+mepDK4RKon/tEwoPOxh9
	 AN1kICLuVgtDWpwsqeTIgQedhb7FUapLN3Y3nm8NKTVIMJugM+KnRewG5dFIvLpO4d
	 XxgMnRwmnmm8+mTuQwxzx4oYQnfIWYIkJLi1we7bUEko04AceHO5G+6AXB4HIJkrT/
	 jjVRgivqhMclA==
Message-ID: <sashiko-outbox-202605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107044553.24277-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
 <20261107044553.24277-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 04:57:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: gadget: uvc: undeclared variables and broken parent lookup
  in format ops
- [Low] usb: gadget: uvc: missing Fixes trailer for su_mutex deadlock
  fix
--

commit 836a51f50b7ceaae4e0f814eb631463c15ac345b
Author: Saad Varshani <varshanisaad@gmail.com>

> usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
>
> Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
> Done this due to the deadlock caused by the mutex conflict in
> fs/configfs_write_iter. Validated commit with the C repro provided by
> syzbot. No other conficts observed.
>
> Also removed the su_mutex in the other attribute extension functions.
> Such as uvcg_extension_b_control_size_store. This applies to all
> uvcg_configfs attribute store/show functions.
>
> The deadlock was happening due to a circular mutex dependency between
> configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
> to traverse item->ci_parent without su_mutex is because
> configfs_write_iter() calls flush_write_buffer() which calls the
> attribute function, holding frag_sem. Which prevents configfs_rmdir()
> from unlinking the item or its ci_parent hierarchy
>
> Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
> under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
> store to be under &opts->lock.
>
> Applied opts->lock mutex, to functions uvcg_format_allow_link(),
> uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(),
> and uvcg_framebased_make() due to them also modifying
> color_match->refcnt, to avoid concurrency issues.
>
> ---
> v5 changes:
> 	- Synchronised color_match->refcnt changes with the opts->lock
> 	  mutex in the functions uvcg_format_allow_link(),
> 	  uvcg_format_drop_link(), uvcg_uncompressed_make(),
> 	  uvcg_mjpeg_make(), and uvcg_framebased_make()
>
> Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D300213c2b5b55c0244f4
> Signed-off-by: Saad Varshani <varshanisaad@gmail.com>

[Severity: Low]
This fixes a deadlock introduced when configfs attribute callbacks were
added to the UVC function.  Should the commit message include:

  Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 70a1415ea4014..4f775efe24b6d 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c

[ ... ]

> @@ -1609,6 +1485,11 @@ static int uvcg_format_allow_link(struct config_it=
em *src, struct config_item *t
> =20
>  	mutex_lock(su_mutex);
> =20
> +	opts_item =3D f->group.cg_item.ci_parent->ci_parent->ci_parent;
> +	opts =3D to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
>  	streaming =3D src->ci_parent->ci_parent;
>  	color_matching =3D config_group_find_item(to_config_group(streaming), "=
color_matching");
>  	if (!color_matching || color_matching !=3D tgt->ci_parent) {
> @@ -1637,6 +1518,7 @@ static int uvcg_format_allow_link(struct config_ite=
m *src, struct config_item *t
> =20
>  out_put_cm:
>  	config_item_put(color_matching);
> +	mutex_unlock(&opts->lock);
>  	mutex_unlock(su_mutex);
> =20
>  	return ret;
> @@ -1651,6 +1533,11 @@ static void uvcg_format_drop_link(struct config_it=
em *src, struct config_item *t
> =20
>  	mutex_lock(su_mutex);
> =20
> +	opts_item =3D f->group.cg_item.ci_parent->ci_parent->ci_parent;
> +	opts =3D to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
> +
>  	color_matching_desc =3D to_uvcg_color_matching(to_config_group(tgt));
>  	color_matching_desc->refcnt--;
> =20
> @@ -1661,6 +1548,7 @@ static void uvcg_format_drop_link(struct config_ite=
m *src, struct config_item *t
>  	fmt->color_matching =3D color_matching_desc;
>  	color_matching_desc->refcnt++;
> =20
> +	mutex_unlock(&opts->lock);
>  	mutex_unlock(su_mutex);
>  }

[ ... ]

> @@ -2498,12 +2330,17 @@ static struct config_group *uvcg_uncompressed_mak=
e(struct config_group *group,
>  	h->desc.bmInterlaceFlags	=3D 0;
>  	h->desc.bCopyProtect		=3D 0;
> =20
> +	opts_item =3D f->group.cg_item.ci_parent->ci_parent->ci_parent;
> +	opts =3D to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
>  	INIT_LIST_HEAD(&h->fmt.frames);
>  	h->fmt.type =3D UVCG_UNCOMPRESSED;
>  	h->fmt.color_matching =3D color_match;
>  	color_match->refcnt++;
>  	config_group_init_type_name(&h->fmt.group, name,
>  				    &uvcg_uncompressed_type);
> +	mutex_unlock(&opts->lock);
> =20
>  	return &h->fmt.group;
>  }

[ ... ]

> @@ -2688,12 +2512,17 @@ static struct config_group *uvcg_mjpeg_make(struc=
t config_group *group,
>  	h->desc.bmInterlaceFlags	=3D 0;
>  	h->desc.bCopyProtect		=3D 0;
> =20
> +	opts_item =3D f->group.cg_item.ci_parent->ci_parent->ci_parent;
> +	opts =3D to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
>  	INIT_LIST_HEAD(&h->fmt.frames);
>  	h->fmt.type =3D UVCG_MJPEG;
>  	h->fmt.color_matching =3D color_match;
>  	color_match->refcnt++;
>  	config_group_init_type_name(&h->fmt.group, name,
>  				    &uvcg_mjpeg_type);
> +	mutex_unlock(&opts->lock);
> =20
>  	return &h->fmt.group;
>  }

[ ... ]

> @@ -2945,10 +2753,15 @@ static struct config_group *uvcg_framebased_make(=
struct config_group *group,
>  	INIT_LIST_HEAD(&h->fmt.frames);
>  	h->fmt.type =3D UVCG_FRAMEBASED;
> =20
> +	opts_item =3D f->group.cg_item.ci_parent->ci_parent->ci_parent;
> +	opts =3D to_f_uvc_opts(opts_item);
> +
> +	mutex_lock(&opts->lock);
>  	h->fmt.color_matching =3D color_match;
>  	color_match->refcnt++;
>  	config_group_init_type_name(&h->fmt.group, name,
>  				    &uvcg_framebased_type);
> +	mutex_unlock(&opts->lock);
> =20
>  	return &h->fmt.group;
>  }

[Severity: High]
Does this break the build and use the wrong parent traversal for
opts_item?

None of uvcg_format_allow_link(), uvcg_format_drop_link(),
uvcg_uncompressed_make(), uvcg_mjpeg_make(), or uvcg_framebased_make()
declares f, opts_item, or opts, so uvc_configfs.c fails to compile.

Even if f were replaced with the newly allocated format h in the three
.make_group() callbacks, h->fmt.group.cg_item.ci_parent is still NULL
until configfs_mkdir() calls link_group() after .make_group() returns,
which would cause a NULL pointer dereference; and walking three ci_parent
levels from the parent group argument would walk past the UVC function
instance item because group is only two levels below it.  In all five
functions, opts_item can be resolved from streaming->ci_parent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107044553.2427=
7-1-varshanisaad@gmail.com?part=3D1
