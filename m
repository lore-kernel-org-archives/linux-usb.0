Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76E34389F
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485432; cv=none; b=YJNovvzOZiTd7wqgKT6upBWqISQgXXwZgD8Rpn10gDK/Tbwr5buT2clcN/wKwHKhZJ2fhx+bMdwo8NzwnjdtDrT+0MXboMnBWpSs+Sgs8CTpDeIXqPzHTomIDptnH9FtYAfyDYEBDVmofUpLmMl66PYB/qJrDWFE0udnKhylrYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485432; c=relaxed/simple;
	bh=JTZtCbDFfEYKwZXrLy52gi0Yv/ytsnVenZeD2n+cw0I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nJw6XPfta5DJxwsh5J/a66bDyqrdTnepP62YFwAjfRxAnmaPSo6eKoNqFbWurdNx+/546icp0bP6tOmzJfiS+iZBg/kScjwKncIZCn63YY0ivSKJVTX8m/QODPL1dYsgyDz+s91svZeJofJaj16p/pODK8ftK2qottpUadT/Kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc3UGKxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc3UGKxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295E51F000FF;
	Thu,  8 Oct 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791485431;
	bh=EVQTmxxqsLpvRam5dZZWWSB8pRDo/tNVZe56zULHBJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tc3UGKxBH/zUBinoKXtu3IDOq78hoIKXJ0/GrXFx62RfSO/jz+z+THTDNkA0rTePj
	 QrzWB8Pf75dKv/9KAsxLHuRt5ZawcLqDMGch57RVflSU/+cMKvYu7BouxLyRzt8v6Y
	 vC48RvA7s1gzGpcj+PsOOmD/mD4v2a3XHinn35kNcwE95rTr0+csUjA4wo0m5poxlH
	 6yTowJhwAsh4/fYMuIAJ3+x+lheodxO+56EmSUxpJor6yxkN9kh3Bi6SzGCz2Wy09E
	 9tfzDFyMD1UEhLC8WL8zYPsX4W3+X5DuUpt2XpyLaJ5oo3mGVHkNypS3HQ+Qh+tHCY
	 O53fivyM6y8/w==
Message-ID: <sashiko-outbox-164480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: vudc: reject submits after endpoint state
 changes
Reply-To: sashiko-reviews@lists.linux.dev
To: tjdqudcks0424@naver.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008183753.10231-1-tjdqudcks0424@naver.com>
References: <20261008183753.10231-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 18:50:30 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usbip: vudc: connection state leak on stale URB submit
--

commit b5cb3556d735fa03d4a0491206e54476efc259b5
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

usbip: vudc: reject submits after endpoint state changes

v_recv_cmd_submit() looks up an endpoint under udc->lock, but drops the
lock while it allocates the URB and receives the payload. A gadget
configuration change can disable or disable and re-enable that endpoint
before the URB is queued. This commit adds a generation counter to reject
stale requests with -ESHUTDOWN.

> diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
> index 51bb70837b902..3c459c7b57b5f 100644
> --- a/drivers/usb/usbip/vudc_rx.c
> +++ b/drivers/usb/usbip/vudc_rx.c
[ ... ]
> @@ -175,6 +179,13 @@ static int v_recv_cmd_submit(struct vudc *udc,
>  		goto free_urbp;
> =20
>  	spin_lock_irqsave(&udc->lock, flags);
> +	if (urb_p->ep !=3D &udc->ep[0] &&
> +	    (!urb_p->ep->desc ||
> +	     urb_p->ep->generation !=3D urb_p->ep_generation)) {
> +		spin_unlock_irqrestore(&udc->lock, flags);
> +		ret =3D -ESHUTDOWN;
> +		goto free_urbp;
> +	}

[Severity: Medium]
Does this new error path omit a required usbip_event_add() call?

When this error path in v_recv_cmd_submit() returns -ESHUTDOWN, the negative
return value propagates to v_rx_pdu() and then to v_rx_loop(), causing the =
RX
thread loop to break and the thread to exit.

Because the usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_TCP) event notificat=
ion
is missing here, the usbip_work teardown routine is never scheduled. As a
result, the TX thread remains indefinitely blocked on tx_waitq, the socket
reference is not released, and the device state remains stuck in SDEV_ST_US=
ED.

Could this be triggered when a host submits an URB to an endpoint whose
generation has changed, leaking the connection state on the server until ma=
nual
administrative intervention?

>  	v_kick_timer(udc, jiffies);
>  	list_add_tail(&urb_p->urb_entry, &udc->urb_queue);
>  	spin_unlock_irqrestore(&udc->lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008183753.1023=
1-1-tjdqudcks0424@naver.com?part=3D1
