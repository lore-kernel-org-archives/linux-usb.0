Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471384;
	b=nbbaPB4ROjwK3+u1HARSOkQhMua4jV+Q3fJOTY6T9FQoBuyxKO+KKHf7qZs/fijjtZJC
	 NQcj0JEIlKofJZhWCqjwQXIZe3d5vQ2HepojLfdfLYEd3EdGpnkifFQFt4euR0PDK5VED
	 IOptWxIP4vnMDYtEI05ErzKP7hSStZNjFtRzaGnfVhadqWoHsFKIEmbh+a8MHBmuHjZxJ
	 wibYhF1Jzs29sDaL0egGjQKdPKq5B5WZ9g7EMq7p3eMx5dcxcvnMo+2EXWaUiA0D1qgNE
	 7JK9X5Aejb0J1hsOKQoioXVcQfCWLgilwl1+YXPoCBej7SiEn16IZHXpsm/iqC3vDgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471384;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=km+WEIDIfQNwbnvUK7TRp0pVd679RoKCSIdrpxc51s4=;
	b=bAHTbLYK8IaebdUHqd9/CLmm1KCkWdW6UGsqRzvBOuX8q0o1t9X2HwJ8uemMipe8GQbx
	 g93kVkHtx5oYpkznF8HVuJYyuYTxn85TrCpOy9W313n9HXfUeblEjvB6WKr3SyrerfQND
	 btjNqsgzMHDpTNXZoGYJ0l3O5LfiN74V5+W0CDFWg9J8JYmE2tf+yTp7sNn1J02zZxGNd
	 sgm+a8B5Bx7xAVrJdptzsJPhjQPj/6zb6olQapNUNfsBnJeaief7tFpGEXiHdT1BG8IhW
	 J9qzIxQPNV3VDl6DEn/Fo49PM+5PThR5e01MZMvJmXNtZh46DN/arkNV57KW0tbqxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZz5DErX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E396606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZz5DErX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0301F000C1;
	Sat, 31 Oct 2026 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793471383;
	bh=km+WEIDIfQNwbnvUK7TRp0pVd679RoKCSIdrpxc51s4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=SZz5DErXpSLjHRec/mb6UYELfpohl21TcM5Tt/Af5f0pXqG09QI40RWIuQ6xbkhWz
	 zGDWOut/mCg2zuTmHugB8G92QYXiWYMazMpZVIgyYyiceb13e7oTB6aWVEx0sRIqZo
	 Houqsd75DL7o560bebWNz+62vM34zWygDYDizYJSl/6nsW0IWvV+/Pson3I0Fyvcge
	 LNJdT/iPXuwChEYRH2w6SBD8GeymJ6r6owIT3KTyjFodn1B/koyzharqnTuJkXrLCh
	 yAXDIz9OlNd54smGaQZjz2X8+ui4fFf91KD5kc8jH0Oyc6Ur5xem7Jb5tRHdMdUPPI
	 Uk0IPdl2bHZhQ==
Message-ID: <sashiko-outbox-192092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: configfs: keep extended property
 lengths consistent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yingjie Wang" <x-professor@outlook.com>, =?utf-8?b?bGludXgtdXNiQHZn?=
 =?utf-8?b?ZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <54d5a6f6202a9a145fc123476c5ff6b8aa4b4c5b.1793470427.git.x-professor@outlook.com>
References: <179338899796.2590875.15337207674245295434.b4-review@b4>
 <cover.1793470427.git.x-professor@outlook.com>
 <54d5a6f6202a9a145fc123476c5ff6b8aa4b4c5b.1793470427.git.x-professor@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 18:29:43 +0000
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
- [High] usb: gadget: uninitialized opts_mutex leaves ext_prop stores unloc=
ked
--

commit df5678128639f7210af0f75c6d367de91a94c6da
Author: Yingjie Wang <x-professor@outlook.com>

usb: gadget: configfs: keep extended property lengths consistent

This patch tracks the raw data length of USB OS Extended Properties
separately from the wire length, validates UTF-8 payloads before storing
them, and updates wire and aggregate descriptor lengths when the property
type or data changes.

Link: https://lore.kernel.org/r/179338899796.2590875.15337207674245295434.b=
4-review@b4

> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index f5fff213d7952..3d931da3ae6b4 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
[ ... ]
> @@ -1321,37 +1344,34 @@ static ssize_t ext_prop_type_store(struct config_=
item *item,
>  	if (desc->opts_mutex)
>  		mutex_lock(desc->opts_mutex);
> =20
> -	if ((ext_prop->type =3D=3D USB_EXT_PROP_BINARY ||
> -	    ext_prop->type =3D=3D USB_EXT_PROP_LE32 ||
> -	    ext_prop->type =3D=3D USB_EXT_PROP_BE32) &&
> -	    (type =3D=3D USB_EXT_PROP_UNICODE ||
> -	    type =3D=3D USB_EXT_PROP_UNICODE_ENV ||
> -	    type =3D=3D USB_EXT_PROP_UNICODE_LINK))
> -		ext_prop->data_len <<=3D 1;
> -	else if ((ext_prop->type =3D=3D USB_EXT_PROP_UNICODE ||
> -		   ext_prop->type =3D=3D USB_EXT_PROP_UNICODE_ENV ||
> -		   ext_prop->type =3D=3D USB_EXT_PROP_UNICODE_LINK) &&
> -		   (type =3D=3D USB_EXT_PROP_BINARY ||
> -		   type =3D=3D USB_EXT_PROP_LE32 ||
> -		   type =3D=3D USB_EXT_PROP_BE32))
> -		ext_prop->data_len >>=3D 1;
> +	if (ext_prop->data) {
> +		int data_len;
> +
> +		data_len =3D ext_prop_data_wire_len(type, ext_prop->data,
> +						  ext_prop->data_raw_len);
> +		if (data_len < 0) {
> +			ret =3D data_len;
> +			goto out;
> +		}
> +		desc->ext_prop_len +=3D data_len - ext_prop->data_len;
> +		ext_prop->data_len =3D data_len;
> +	}
>  	ext_prop->type =3D type;
> +	ret =3D len;
> =20
> +out:
>  	if (desc->opts_mutex)
>  		mutex_unlock(desc->opts_mutex);
> -	return len;
> +	return ret;
>  }
[ ... ]
> @@ -1370,10 +1391,18 @@ static ssize_t ext_prop_data_store(struct config_=
item *item,
> =20
>  	if (desc->opts_mutex)
>  		mutex_lock(desc->opts_mutex);
> +	data_len =3D ext_prop_data_wire_len(ext_prop->type, new_data, len);
> +	if (data_len < 0) {
> +		if (desc->opts_mutex)
> +			mutex_unlock(desc->opts_mutex);
> +		kfree(new_data);
> +		return data_len;
> +	}
>  	kfree(ext_prop->data);
>  	ext_prop->data =3D new_data;
>  	desc->ext_prop_len -=3D ext_prop->data_len;
> -	ext_prop->data_len =3D ext_prop_data_wire_len(ext_prop->type, len);
> +	ext_prop->data_raw_len =3D len;
> +	ext_prop->data_len =3D data_len;
>  	desc->ext_prop_len +=3D ext_prop->data_len;

[Severity: High]
Can concurrent writes to the type and data configfs attributes trigger a
use-after-free on ext_prop->data or corrupt desc->ext_prop_len and
ext_prop->data_len?

Both ext_prop_type_store() and ext_prop_data_store() rely on
desc->opts_mutex to serialize ext_prop_data_wire_len() and
kfree(ext_prop->data). However, neither of the callers that set up configfs
OS descriptors initializes opts_mutex:

drivers/usb/gadget/function/f_ncm.c:ncm_alloc_inst() {
	...
	opts->ncm_os_desc.ext_compat_id =3D opts->ncm_ext_compat_id;

	mutex_init(&opts->lock);
	...
	descs[0] =3D &opts->ncm_os_desc;
}

drivers/usb/gadget/function/f_rndis.c:rndis_alloc_inst() {
	...
	opts->rndis_os_desc.ext_compat_id =3D opts->rndis_ext_compat_id;

	mutex_init(&opts->lock);
	...
	descs[0] =3D &opts->rndis_os_desc;
}

Because desc->opts_mutex is always NULL, mutex_lock(desc->opts_mutex) is
never taken. Since configfs_write_iter() only holds the per-open-file
buffer->mutex and a shared read lock on frag->frag_sem, can
ext_prop_data_store() free ext_prop->data while ext_prop_type_store() is
reading it inside ext_prop_data_wire_len(), or interleave type and data
updates to leave ext_prop->data_len and desc->ext_prop_len out of sync?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793470427.gi=
t.x-professor@outlook.com?part=3D2
