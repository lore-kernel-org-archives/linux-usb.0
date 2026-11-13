Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563169;
	b=IS7QpZoybJ9Ezdezl6kEzsI5GgjqpwsD+++UoSevP3aBM72Ab7w4sFHfTak2PayIP92e
	 SOpTbCn2mJpkbiI7WAGma7iojlB6iz1iHzlJyM1cwQA/kFDTK46ZOpVMV5EHJ+FkfryZm
	 SOpySALhugZ60/sKW5u9g1PJ18uQq++aEWlxRrWLWzm/UAik8Js1yV4QCkBOMS2bzip6k
	 LHKHaxJmaEJVvYtBaCJMSC3v8AlOhgHsd/x9o7anbfLaZlOsKcNZ3YKttlvX9669sZVRM
	 Q/BmhnjbnMsPNFuqjo1NKWoANW8WzanFZL2HHIJcbvjW4/HTA02HQXU63h7K1mxdbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oC8fAxyrEzbIzyNs6s6z/0pqiAk2pC5gMZcaNZ210Vk=;
	b=byKxYNxTPjVQ7PgWsDxsrC9AhQ0NBuf0QB0iFtl507lpc5e52N1qcK5WNlHhpFF8KA+9
	 I+Qd4fTy0FTtMZWl4OaL2WSdFzXg0tNtfLjzmnbrZPLozV6ETAruFQXdbcHzTFxjkp9bs
	 A0banRxIAPXShBfqqmPIsYfWvHiPIfzW8ZlHU4NdQMftmAw1CQB/vKaDcnT0FW3qlHLiv
	 NIkdoIQXlqgVN8nKZ1Pgdf+21gcBuFRQJn2hiz5rp4z8WaFl319HjR0MVURhMae8YC9Yk
	 wXYhsj52exc0+e23kG+RRUWLw5qMK4M00NRrwhV3Zt7n9ufaEJolwdRud98p2uYHe7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BGeF/1VI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8E606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGeF/1VI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE81F000C4;
	Fri, 13 Nov 2026 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563168;
	bh=oC8fAxyrEzbIzyNs6s6z/0pqiAk2pC5gMZcaNZ210Vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGeF/1VItopZjdmjVtX/xk1IHlre+eyMgBXePfZGIdnMN4kiCdcQktFhrjk9M+H3K
	 iBVL9aPea1BeD7Mp/xFdPdQOMuPww4NQo8UNB83y8oIUwQ4zBWPywX5xYHc/rAezYK
	 tO26un1JVM/4f1hh2kofebhyMsDuiJ5L1jrRMmdS3yjYfGPEXTu/ppz8u0TNYNgcnw
	 Or05J7MSdEBzrE54Qwy2LKH9yVQJi8KRbGHh3g6MLB5xp0NETAfOWasuZzGqrlgeuc
	 0rroovsniboOJjPEGNIBb6EZu8IjnW1DjhHsKMWmvModTNB7uBQnubRWwhQmIxc7co
	 +JrRmln+mt1KA==
Message-ID: <sashiko-outbox-212565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: gadget: udc: Decide on connecting in one
 place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:46:08 +0000
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
- [Medium] usb: gadget: udc: stale gadget->connected if pullup disable
  fails on unbind
--

commit 8198ac49b976bc4f15b1f15c4abb55ae61ceb982
Author: Alexey Charkov <alchark@flipper.net>

usb: gadget: udc: Decide on connecting in one place

This commit centralizes the UDC connection rules in
usb_udc_update_connection_locked() so that gadget->connected only tracks
whether the pullup is enabled.

> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 84dc0820c2cb9..e592705de55e4 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
[ ... ]
> @@ -1236,16 +1238,8 @@ static inline int usb_gadget_udc_start_locked(stru=
ct usb_udc *udc)
>  	}
> =20
>  	ret =3D udc->gadget->ops->udc_start(udc->gadget, udc->driver);
> -	if (!ret) {
> +	if (!ret)
>  		udc->started =3D true;
> -		/*
> -		 * The pullup is never enabled while the UDC is stopped, so any
> -		 * connection recorded meanwhile was only a request. Forget it,
> -		 * so that the next usb_gadget_connect_locked() enables the
> -		 * pullup rather than returning early.
> -		 */
> -		udc->gadget->connected =3D false;
> -	}
> =20
>  	return ret;
>  }
[ ... ]
> @@ -1733,15 +1729,17 @@ static void gadget_unbind_driver(struct device *d=
ev)
> =20
>  	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
> =20
> -	udc->allow_connect =3D false;
> -	cancel_work_sync(&udc->vbus_work);
>  	mutex_lock(&udc->connect_lock);
> -	usb_gadget_disconnect_locked(gadget);
> +	udc->bound =3D false;
> +	usb_udc_update_connection_locked(udc);
>  	usb_gadget_disable_async_callbacks(udc);
>  	if (gadget->irq)
>  		synchronize_irq(gadget->irq);
>  	mutex_unlock(&udc->connect_lock);
> =20
> +	/* A VBUS event can no longer connect the gadget, so just wait it out */
> +	cancel_work_sync(&udc->vbus_work);

[Severity: Medium]
Can gadget->connected stay set across unbind and prevent the next bound
gadget driver from enabling the pullup?

In usb_gadget_disconnect_locked(), gadget->connected is only cleared when
gadget->ops->pullup(gadget, 0) returns 0, and some UDC drivers fail that
call when VBUS is already inactive:

drivers/usb/gadget/udc/fsl_udc_core.c:fsl_pullup() {
	...
	if (!udc->vbus_active)
		return -EOPNOTSUPP;
	...
}

When that happens during gadget_unbind_driver(), neither
usb_gadget_udc_stop_locked() nor usb_udc_forget_driver_locked() clears
gadget->connected, and usb_gadget_udc_start_locked() no longer resets it
either.  On the next gadget_bind_driver(), usb_gadget_connect_locked() sees
gadget->connected =3D=3D 1 and returns early without calling
gadget->ops->pullup(gadget, 1).

Also, if vbus_work is pending when cancel_work_sync() runs after
usb_gadget_disable_async_callbacks(), a lingering gadget->connected =3D=3D 1
causes vbus_event_work() -> usb_gadget_disconnect_locked() to invoke
driver->disconnect() after async callbacks have been disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-udc-connec=
t-v2-0-f51b11f07eb8@flipper.net?part=3D4
