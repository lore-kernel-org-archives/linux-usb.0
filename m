Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858708;
	b=0XPJ1iO8a2bJ5HAPd41e13vuEdO6mVsrK8hq64eAh/6y1N4Vg3j7K0Rngb9CGKaAoViC
	 qavtBkgVB6hvHz6ndTZ76t5gFv1glSnzadJ9LH2Z964JIGAtEomPk2weh6q3e8D7ksC/3
	 jhodGM7LnkltOMuEAwBBremGedmVeTPuY1Ak9TcKuHFCQOEqUj2Y7oC15KPBUhkbZZreb
	 bALO1FVPNpmQ5/k4/mgThOaNY39PhbW0Hs210T01pGms/mIRsjLC7dTHnJBxgQuzJWOXh
	 a0Tw6RoBDzN7LyTIlvej99HKac9CuumUCxjqdbWRCSjqmog3Tk4Xc1JYtSQPDeVC4Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858708;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6qxLO/fdsMCWBNHFZXtWHn23UONchV/t+I6gtAUztNU=;
	b=RAVmWYeT3CFpqArqFsfxzVnEplE6efbXBxghuiIl1xjjO3k/mqfSEMVrr84zTfkg9KRW
	 0GoAmzPc/8GvZ16kwOUNsV+mRQAOz3b6iDJxo3FaHIn/QDYjTqhQSyehG2+7jyHqzQjWX
	 J4oAnIaoKEzuc6SoJzMI4qYdeaxOJwC5DsBShrxL6QTs1w4eRaVHCxDVUXj/wmBf33JSJ
	 abqnapvJv0ML43ZYBRP0EI5Wj7/AdUCTU0OXltOrODH8isyDiVTe0WeUT+tu0IisQMPOE
	 MzC8p7mdkmUak/9fHQiaMNjWl0e+2wqApIXzMFz+WqYqnz93UOHUOmrTeYn6cmsn4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZP1kngJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23A606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZP1kngJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2B61F000C1;
	Thu,  5 Nov 2026 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793858707;
	bh=6qxLO/fdsMCWBNHFZXtWHn23UONchV/t+I6gtAUztNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZP1kngJP+sV0Mn1GUNzKnATc4VeoPrmvxyVrEbybmVBpyWt/8AyRhdXNua9DyYXI
	 dbRERGB5rOG3lR0jVOFsTBXL4O5Z00Va9RK3rd9ngoRSxJdcfG+5J1smarLDXcQjRQ
	 MUDRIyn5lVnL+KkmbgwsRVi9kcev5OtfEIanvY7q+6q+Sp1geQ0PraOhCnAKHcGEHe
	 yJGe1kgVLyTfzodClbEDdQ+mdL+BLrLdKzg9RZXwxsoaJjhxZ6PWQ5BH//KsXRpt5U
	 WUb7Pg+LOhjAG8TEKh9rorAAF9HupEfKFSVjzGmBCy/VPoFbJ3bI33TN9rPChjRgc+
	 YZF8iiX2YfL7A==
Message-ID: <sashiko-outbox-198610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix deadlock in
 uvcg_extension_bm_controls_store
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105053900.20082-1-varshanisaad@gmail.com>
References: <20261105053900.20082-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 06:05:07 +0000
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
- [High] usb: gadget: uvc: incomplete su_mutex deadlock fix across sibling =
configfs attributes
--

commit 352b1b2da8cde195be417fe376d9490d718f3b87
Author: Saad Varshani <varshanisaad@gmail.com>

usb: gadget: uvc: Fix deadlock in uvcg_extension_bm_controls_store

This commit removes the acquisition of group->cg_subsys->su_mutex from
uvcg_extension_bm_controls_store() to avoid a circular locking dependency
reported by syzbot in configfs_write_iter().

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 70a1415ea4014..78588366f656f 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1114,16 +1114,12 @@ static ssize_t uvcg_extension_bm_controls_show(st=
ruct config_item *item,
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
> @@ -1157,7 +1153,6 @@ static ssize_t uvcg_extension_bm_controls_store(str=
uct config_item *item,
> =20
>  unlock:
>  	mutex_unlock(&opts->lock);
> -	mutex_unlock(su_mutex);

[Severity: High]
Does removing su_mutex only from uvcg_extension_bm_controls_store() leave t=
he
exact same deadlock present in all sibling configfs attribute callbacks in
drivers/usb/gadget/function/uvc_configfs.c?

When configfs_write_iter() -> flush_write_buffer() or configfs_read_iter() =
->
fill_read_buffer() invokes an attribute callback, it already holds
buffer->mutex and down_read(&frag->frag_sem), which prevents configfs_rmdir=
()
from unlinking the item or its ci_parent hierarchy.

However, the sibling store and show callbacks on struct uvcg_extension still
acquire group->cg_subsys->su_mutex before opts->lock in the same way:

drivers/usb/gadget/function/uvc_configfs.c:uvcg_extension_ba_source_id_stor=
e() {
	struct config_group *group =3D to_config_group(item->ci_parent);
	struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;
	...
	mutex_lock(su_mutex);

	opts_item =3D item->ci_parent->ci_parent->ci_parent;
	opts =3D to_f_uvc_opts(opts_item);

	mutex_lock(&opts->lock);
}

The same locking pattern remains in uvcg_extension_b_control_size_store(),
uvcg_extension_b_nr_in_pins_store(), uvcg_extension_b_num_controls_store(),
uvcg_extension_guid_extension_code_store(), uvcg_extension_bm_controls_show=
(),
uvcg_extension_ba_source_id_show(), uvcg_extension_guid_extension_code_show=
(),
and the other configfs attribute show/store callbacks throughout
drivers/usb/gadget/function/uvc_configfs.c (such as
uvcg_default_processing_bm_controls_store(),
uvcg_default_camera_bm_controls_store(), and
uvcg_frame_dw_frame_interval_store()).

Should su_mutex be removed consistently across these configfs attribute
callbacks, and could the commit message also describe the lock dependency
chain and why traversing item->ci_parent is safe without su_mutex?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105053900.2008=
2-1-varshanisaad@gmail.com?part=3D1
