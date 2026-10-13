Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED7E3F0A9B
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901408; cv=none; b=i1tB/0dma3BTwYmvlgssR4o2XvpWY0Hh3yZrsFJzVy6CpSshuJWxYGlxxF+ic3k0DdHDJIWtzn/kNFxYe0SJcCxN8aIOb+jcUF4r5rGk/8vwgPoX9mzZxyTs1R6l0voFdXvoa0T9WP0Ux9AnzMLZELXD/xAwu5oc7Q/R8RDh6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901408; c=relaxed/simple;
	bh=N1V9PKWmqdyWzXat/Uy5bUJgFKxPDQHngXQcMxPJI9Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kiw7kU3DXKhnilAA4I9eDEuaEX48b1iXRxLMAzPaE/MqMgyuAKM/Bv5HDSxa4I25gwC5AKLqg2554qv3yc8bMCLqcqIul4DJFzfaOjt6eSIEpQD67YUN+/RO18x7UIANOhgMc4yc+gHuLiHRLY7wWAzLU7gqtBGVj1YWzcOfcj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZXE9jdP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZXE9jdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8D21F000FF;
	Tue, 13 Oct 2026 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901406;
	bh=duAMbDk3QfL4t2e5Y5Lfrm+f5ORR8BKjf7pC2I9Fk/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZXE9jdPqLw223QnCzcr2qObh5j0FQfApd2cCqj5Ghol+SBeHhw4h3n2ElQn04j0y
	 IRHqZtEyZO2Vc1aTwQC5O106ottQ2L0i8mBakCQiCY72luvD+hbsgxxbl1LqiW/CbQ
	 h+nN45AcYGGbSa2+WvV6cbIxtj0xdlRbEiaD2Hdh62N9Ztw4Vdel7KmJmZ+OrMOzxs
	 nngoDBNFNuZmGvgE3QYWZYxuEWAf3WxkogJy24ISdLHxhKU7qIxNgxRJKhkYVKE4Po
	 rV1CWjZ0IB8rmU+sbPhVLueK4S897iTSa0xiny7qMeevRUuRcdLwYPo4r79JR+98Rp
	 CC52ZymfrAHhw==
Message-ID: <sashiko-outbox-169899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] driver core: take parent lock in async device attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013140408.1226841-1-johan@kernel.org>
References: <20261013140408.1226841-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:23:26 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] driver-core: UAF on dev->parent in async device attach
--

commit c5f34060c20ab88f32e94e3a0ebf364f523925ee
Author: Mario Peter <mario.peter@leica-geosystems.com>

    driver core: take parent lock in async device attach
   =20
    On buses with need_parent_lock set (only USB), probe() must run with the
    parent device locked. A synchronous attach after device_add() gets this
    from the caller, e.g. usb_set_configuration() holds the udev lock while
    adding interfaces.

> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index f6525a7ee8c54..9dc7cce9bd8d2 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
[ ... ]
> @@ -1029,6 +1029,38 @@ static int __device_attach_driver(struct device_dr=
iver *drv, void *_data)
>  	return ret =3D=3D 0;
>  }
> =20
> +/*
> + * __device_driver_lock - acquire locks needed to manipulate dev->drv
> + * @dev: Device we will update driver info for
> + * @parent: Parent device. Needed if the bus requires parent lock
> + *
> + * This function will take the required locks for manipulating dev->drv.
> + * Normally this will just be the @dev lock, but when called for a USB
> + * interface, @parent lock will be held as well.
> + */
> +static void __device_driver_lock(struct device *dev, struct device *pare=
nt)
> +{
> +	if (parent && dev->bus->need_parent_lock)
> +		device_lock(parent);

[Severity: High]
Could this acquire a mutex within freed parent memory?

If this is called with a dangling parent pointer from
__device_attach_async_helper(), this will dereference the freed memory.

[ ... ]
> @@ -1038,7 +1070,7 @@ static void __device_attach_async_helper(void *_dev=
, async_cookie_t cookie)
>  		.want_async	=3D true,
>  	};
> =20
> -	device_lock(dev);
> +	__device_driver_lock(dev, dev->parent);

[Severity: High]
Can this cause a use-after-free on dev->parent?

In the device removal path, device_del() sets dev->p->dead to true via
kill_device() and later drops the child's reference to dev->parent via
put_device(dev->parent).

If the parent device is also being removed and its final reference is dropp=
ed,
the parent could be freed.=20

If this async worker runs delayed, taking the lock before checking
dev->p->dead could pass a dangling dev->parent pointer. Prior to this patch,
device_lock(dev) was called, and dev->parent was never accessed if
dev->p->dead was true.

> =20
>  	/*
>  	 * Check if device has already been removed or claimed. This may
> @@ -1060,7 +1092,7 @@ static void __device_attach_async_helper(void *_dev=
, async_cookie_t cookie)
>  	if (dev->parent)
>  		pm_runtime_put(dev->parent);
>  out_unlock:
> -	device_unlock(dev);
> +	__device_driver_unlock(dev, dev->parent);

[Severity: High]
If dev->parent was freed before the dev->p->dead check above, wouldn't this
unlock path also dereference the same dangling pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013140408.1226=
841-1-johan@kernel.org?part=3D1
