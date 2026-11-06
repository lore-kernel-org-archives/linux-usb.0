Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931671;
	b=ZPSB4oyHAOhlpR0GJk8aIFG9FuV3s96aHDz68J5/UjlXlnjRf082osUUtZTEpFOAof2t
	 gb8yCP5wMhxvpKEM3S8//dOMylawQCZsi6S/asxDFkysCoxab8t4/U3rQH5GSxWFUm6nO
	 qBNYBveUoTf4sc4Cc3R2h2PvL3NbiBp3R2zLspgCa+nAbf8OY+vLhQ486jPUsXRz+JpS6
	 n6Bp4d33sLtWlVqDcVnwYOXZ/0+ir+icw1bUlFFRx8UPy7FVstjFD72D28raRrrtx9q1M
	 vsAawneWSyJetxSAcMi2ZcKNgz6eD/psNMsrPtRsM5XmrvMK5KrBRo8OXUgsU79pVZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931671;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qDq6ioX1Rz4Bl/wf17+69MIX7/mleTnSWckOSuR/V7Q=;
	b=l5vJcO5jZozOzAgxOWsd3kQfsx7MXCqGh47V556649TiRm74+ZKVrn6fyefdVShnz1h2
	 H7/rEdNaob5tOUY8a1thMFeGIJanZ8jy4b+X++jNqhbXwzc7Ra4MN/OIy/ykiapop0pM9
	 ja1oX4tLJkahJ7WoNIk5B/tXEOedunLmU/LcapQI3kV8txzmq7wYuccIIPlWkt35+S5ho
	 CzLDBCw9lgRjZzBG/XisePYYXecmJnAYv1Vik8xyPeTtnkjywkgbFrLN2OS5GDkOe9vvN
	 mxfL2cXISF9BtjIP9W5FjFcyw2AUXGN//RfDu/Eh3A8kRPRVJDs8Y2fghZ+KMp3U7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sikq+urC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE3606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 02:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sikq+urC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE0E1F0089F;
	Fri,  6 Nov 2026 02:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793931670;
	bh=qDq6ioX1Rz4Bl/wf17+69MIX7/mleTnSWckOSuR/V7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sikq+urC7OpNc3o360+Os1bQJ9R2n10yhj8dEVuLUMtIeOVznIwt5Ch7+IhYnWRSs
	 VPTmbfI7ma4cCQHU0US0LDymcYzxwItmw/j95yzJqhyQ0WYWfh7HO5aDZ1YRss3aTJ
	 aROZjRROLnSc8vM0ow5Grp2YjWudU31SabfVggTrRWz/4BAAeSgR2HlMBq9sODbifc
	 U+fhNayZshSzaXJj0va4xkxoZSqV+eEV5tMO2R1ASwu6vsdSoCiwn+J1wAwKMM+F+t
	 VJiCWXut4QLG38cgkJlHKYhtKiVfoTDJUrGsuMoKw1pdG8RyVCKkK+IcLa/QIofWlg
	 6U30sAUgutnzQ==
Message-ID: <sashiko-outbox-200588@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106020727.6055-1-varshanisaad@gmail.com>
References: <20261105053900.20082-1-varshanisaad@gmail.com>
 <20261106020727.6055-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 02:21:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: gadget: uvc: missing mutex_unlock() in uvcg_extension_ba_sour=
ce_id_store()
- [High] usb: gadget: uvc: unlocked hierarchy traversal in uvc_func_allow_l=
ink()
- [Medium] usb: gadget: uvc: unsynchronized refcnt check in uvcg_color_matc=
hing store
- [Medium] usb: gadget: uvc: unlocked fmt->linked check in uvcg_frame_b_fra=
me_index_show()
--

commit 79cf2a23edc28ab90194ff7fd9c348a2fe889c55
Author: Saad Varshani <varshanisaad@gmail.com>

usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks

This commit removes su_mutex locking from configfs callbacks in
drivers/usb/gadget/function/uvc_configfs.c to avoid a lock ordering
deadlock between configfs frag_sem and su_mutex.

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gad=
get/function/uvc_configfs.c
> index 70a1415ea4014..6a4f17b925e75 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c

[ ... ]

> @@ -1027,24 +939,18 @@ static ssize_t uvcg_extension_ba_source_id_show(st=
ruct config_item *item,
>  	}
>  	mutex_unlock(&opts->lock);
> =20
> -	mutex_unlock(su_mutex);
> -
>  	return ret;
>  }
> =20
>  static ssize_t uvcg_extension_ba_source_id_store(struct config_item *ite=
m,
>  						 const char *page, size_t len)
>  {
> -	struct config_group *group =3D to_config_group(item->ci_parent);
> -	struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;
>  	struct uvcg_extension *xu =3D to_uvcg_extension(item);
>  	struct config_item *opts_item;
>  	struct f_uvc_opts *opts;
>  	u8 *source_ids, *iter;
>  	int ret, n =3D 0;
> =20
> -	mutex_lock(su_mutex);
> -
>  	opts_item =3D item->ci_parent->ci_parent->ci_parent;
>  	opts =3D to_f_uvc_opts(opts_item);
> =20
> @@ -1077,8 +983,6 @@ static ssize_t uvcg_extension_ba_source_id_store(str=
uct config_item *item,
>  	ret =3D len;
> =20
>  unlock:
> -	mutex_unlock(&opts->lock);
> -	mutex_unlock(su_mutex);
>  	return ret;
>  }
>  UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);

[Severity: High]
Was mutex_unlock(&opts->lock) removed by mistake at the unlock label in
uvcg_extension_ba_source_id_store()?

The function still acquires mutex_lock(&opts->lock) after resolving opts,
and both the normal path and all error paths go through the unlock label.
Writing to the baSourceID configfs attribute via configfs_write_iter() ->
flush_write_buffer() -> uvcg_extension_ba_source_id_store() will now return
to userspace with opts->lock still held, permanently deadlocking subsequent
operations on the UVC function instance.

[ ... ]

> @@ -1998,11 +1851,8 @@ static ssize_t uvcg_frame_b_frame_index_show(struc=
t config_item *item,
>  	struct f_uvc_opts *opts;
>  	struct config_item *opts_item;
>  	struct config_item *fmt_item;
> -	struct mutex *su_mutex =3D &f->item.ci_group->cg_subsys->su_mutex;
>  	int result;
> =20
> -	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> -
>  	fmt_item =3D f->item.ci_parent;
>  	fmt =3D to_uvcg_format(fmt_item);
> =20
> @@ -2019,7 +1869,6 @@ static ssize_t uvcg_frame_b_frame_index_show(struct=
 config_item *item,
>  	mutex_unlock(&opts->lock);
> =20
>  out:
> -	mutex_unlock(su_mutex);
>  	return result;
>  }

[Severity: Medium]
With su_mutex removed from uvcg_frame_b_frame_index_show(), should the
check on fmt->linked be moved inside mutex_lock(&opts->lock)?

In uvcg_frame_b_frame_index_show():

	fmt_item =3D f->item.ci_parent;
	fmt =3D to_uvcg_format(fmt_item);

	if (!fmt->linked) {
		result =3D -EBUSY;
		goto out;
	}

	opts_item =3D fmt_item->ci_parent->ci_parent->ci_parent;
	opts =3D to_f_uvc_opts(opts_item);

	mutex_lock(&opts->lock);
	result =3D sprintf(page, "%u\n", f->frame.b_frame_index);
	mutex_unlock(&opts->lock);

Both fmt->linked and f->frame.b_frame_index (via uvcg_format_set_indices())
are updated under su_mutex and opts->lock in
uvcg_streaming_header_allow_link() and uvcg_streaming_header_drop_link().
Checking fmt->linked before acquiring opts->lock leaves a race window when
reading bFrameIndex concurrently with linking or unlinking a format.

[ ... ]

> @@ -3000,7 +2780,6 @@ static ssize_t uvcg_color_matching_##cname##_store(=
			\
>  	struct config_item *item, const char *page, size_t len)		\
>  {									\
>  	struct config_group *group =3D to_config_group(item);		\
> -	struct mutex *su_mutex =3D &group->cg_subsys->su_mutex;		\
>  	struct uvcg_color_matching *color_match =3D			\
>  		to_uvcg_color_matching(group);				\
>  	struct f_uvc_opts *opts;					\
> @@ -3012,8 +2791,6 @@ static ssize_t uvcg_color_matching_##cname##_store(=
			\
>  	if (ret)							\
>  		return ret;						\
>  									\
> -	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
> -									\
>  	if (color_match->refcnt) {					\
>  		ret =3D -EBUSY;						\
>  		goto unlock_su;						\
> @@ -3029,8 +2806,6 @@ static ssize_t uvcg_color_matching_##cname##_store(=
			\
>  									\
>  	mutex_unlock(&opts->lock);					\
>  unlock_su:								\
> -	mutex_unlock(su_mutex);						\
> -									\
>  	return ret;							\
>  }									\
>  UVC_ATTR(uvcg_color_matching_, cname, aname)

[Severity: Medium]
What protects color_match->refcnt in uvcg_color_matching_##cname##_store()
now that su_mutex is no longer held here?

color_match->refcnt is checked before mutex_lock(&opts->lock) is acquired,
and the callers that modify color_match->refcnt (uvcg_format_allow_link(),
uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(), and
uvcg_framebased_make()) update it under su_mutex without taking opts->lock:

	color_matching_desc->refcnt--;

	color_matching_desc =3D to_uvcg_color_matching(to_config_group(tgt));
	fmt->color_matching =3D color_matching_desc;
	color_matching_desc->refcnt++;

Without synchronization between uvcg_color_matching_##cname##_store() and
those refcnt updates, can a concurrent mkdir, symlink, or unlink race with
attribute writes and allow modifying an active color_matching descriptor?

[ ... ]

> @@ -3642,14 +3411,11 @@ static void uvc_func_item_release(struct config_i=
tem *item)
> =20
>  static int uvc_func_allow_link(struct config_item *src, struct config_it=
em *tgt)
>  {
> -	struct mutex *su_mutex =3D &src->ci_group->cg_subsys->su_mutex;
>  	struct gadget_string *string;
>  	struct config_item *strings;
>  	struct f_uvc_opts *opts;
>  	int ret =3D 0;
> =20
> -	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
> -
>  	/* Validate that the target is an entry in strings/<langid> */
>  	strings =3D config_group_find_item(to_config_group(src->ci_parent->ci_p=
arent),
>  					 "strings");
> @@ -3676,7 +3442,6 @@ static int uvc_func_allow_link(struct config_item *=
src, struct config_item *tgt)
> =20
>  put_strings:
>  	config_item_put(strings);
> -	mutex_unlock(su_mutex);
> =20
>  	return ret;
>  }

[Severity: High]
Is it safe to remove su_mutex from uvc_func_allow_link()?

Unlike attribute show and store callbacks, uvc_func_allow_link() is an
allow_link callback invoked from configfs_symlink(), which does not hold
frag_sem or su_mutex:

	if (!ret)
		ret =3D type->ct_item_ops->allow_link(parent_item, target_item);
	if (!ret) {
		mutex_lock(&configfs_symlink_mutex);
		ret =3D create_link(parent_item, target_item, target_sd, dentry);
		mutex_unlock(&configfs_symlink_mutex);

uvc_func_allow_link() calls config_group_find_item(), which walks
group->cg_children and requires group->cg_subsys->su_mutex to be held
against concurrent configfs_mkdir() and configfs_rmdir() modifications.

In addition, before create_link() increments target_sd->s_links, a
concurrent configfs_rmdir() on tgt can run unlink_obj() under su_mutex:

	group =3D item->ci_group;
	if (group) {
		list_del_init(&item->ci_entry);

		item->ci_group =3D NULL;
		item->ci_parent =3D NULL;

		/* Drop the reference for ci_entry */
		config_item_put(item);

		/* Drop the reference for ci_parent */
		config_group_put(group);
	}

Without su_mutex, couldn't evaluating tgt->ci_parent->ci_parent !=3D strings
in uvc_func_allow_link() race with unlink_obj(tgt) and dereference a NULL
or freed ci_parent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106020727.6055=
-1-varshanisaad@gmail.com?part=3D1
