Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650929;
	b=rXTmOEfHyoiz6gpUi+DsawkwQsc0i/H32ony4S3Ejm/oJ70iHOr30JNoUsDyyIQnL/XI
	 Bds4Z0c8A11PA55X1gRYMpvuZpF2WqrPoFN5ra1t2jCvVbMxLRdMR40j+VzPNxy9dSr9K
	 tj3FKrc/tnt1ydrAh7Nq97N7pPYoyGwU1QGW+0EtjSUw8h4/rZJQJ089py/mvnAKI3RII
	 JslXlWZs7Jva9GhjJ3UqGXoaIFAoVbckvl+hOHJMBPnk9HHM+8vRpeG4kXx0i7GY2GKyR
	 1X4xMqp0mwCdnUuw/FB+Klg9+v52iCaSvH67A5dBGfxG8fx83+2UVYck30IJHSFzEIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650929;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OjLkZxgACeE6axkztOXOGwFCNPkHbvX0zuYfeM9235U=;
	b=zz1W54pIp3rU2ZwWqAL7Z+E4Ie8tslkgjOvUgJh35gmxuKxD5rjE3qM55ZqsQuvWU9UZ
	 2Vg6LYGhb5qGCQPGoLuXRB4yeGlj+6Bv/yeaXQT7tJpMztnVe0hgRH1LalFc8FYEyZ9VI
	 hnayxdI+oU5abMy83aA0O7auPNI2geuBTWs1wk0PF9ZAMCr9DAL7FWj49z2SHrqEFtftx
	 DoLkHoaw3LztBPWzB3Uf85jgR3pTpAZMgirTtevNCVlb5v+l0LIuhfJAKGomnFqgHyEql
	 ZO9wjsoQO/0A9P7vhLdeELrl8LFf/T0DWVDpOA0bvmge+qKa/sgfzss9FqA2J96/2Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyfARGVY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68C606A32E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyfARGVY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B91F000CA;
	Wed, 25 Nov 2026 23:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650929;
	bh=OjLkZxgACeE6axkztOXOGwFCNPkHbvX0zuYfeM9235U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyfARGVYeRqd+RZ16jc7grffjmImISxGMwC5HBueFo9t+K0r9aukXLx2eudDktDoT
	 26WRp1aXBs/BKIFQLExM3YZhy/oYUaN9ntNKUy0dDNfYT/IbpLIVHg+LFGoDj8BfKV
	 ZseJayVamPp/osdpWK0xLMbHnJfLkSWUgvURL5Du6lCbw0YrIEWaRIMm3sA38bzS7c
	 di3vQd9RT4P50IyqRufc7D+RefFkqFSGieev+9EbpmVZj49/vLMAuGzMU4q3bwhAbp
	 lj/eDFsyxF/JrnEDVcRBCGUEw2XgmqivRJ4ek/7LMHmC7OJnUvpvjIg4CvuS5rQtJK
	 emcBkXld+I3gw==
Message-ID: <sashiko-outbox-234419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: roles: serialize registered checks and unregister
 under sw->lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilia Snezhkov" <iasnezhkov@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125234825.94733-1-iasnezhkov@gmail.com>
References: <20261125234825.94733-1-iasnezhkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 23:55:28 +0000
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
- [High] usb: roles: ABBA deadlock between usb_role_switch_unregister()
  and dwc3-apple
--

commit e0b16766d03a43b431963aa2b14fba31f31089de
Author: Ilia Snezhkov <iasnezhkov@gmail.com>

usb: roles: serialize registered checks and unregister under sw->lock

This commit moves the sw->registered check inside sw->lock in
usb_role_switch_set_role() and usb_role_switch_get_role(), and acquires
sw->lock when clearing sw->registered in usb_role_switch_unregister().

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 8ea703e63ffbd..0a13c871c71f2 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
[ ... ]
> @@ -423,7 +428,9 @@ void usb_role_switch_unregister(struct usb_role_switc=
h *sw)
>  {
>  	if (IS_ERR_OR_NULL(sw))
>  		return;
> +	mutex_lock(&sw->lock);
>  	sw->registered =3D false;
> +	mutex_unlock(&sw->lock);
>  	if (dev_fwnode(&sw->dev))
>  		component_del(&sw->dev, &connector_ops);
>  	device_unregister(&sw->dev);

[Severity: High]
Can taking sw->lock in usb_role_switch_unregister() cause an ABBA deadlock
with appledwc->lock in dwc3-apple?

usb_role_switch_set_role() and usb_role_switch_get_role() invoke sw->set()
and sw->get() under sw->lock, and the dwc3-apple callbacks acquire
appledwc->lock.  Conversely, dwc3_apple_remove() calls
usb_role_switch_unregister() while already holding appledwc->lock:

drivers/usb/dwc3/dwc3-apple.c:dwc3_apple_remove() {
	...
	guard(mutex)(&appledwc->lock);

	usb_role_switch_unregister(appledwc->role_sw);
	...
}

CPU0                              CPU1
----                              ----
lock(&appledwc->lock)
                                  lock(&sw->lock)
lock(&sw->lock)
                                  lock(&appledwc->lock)

 *** DEADLOCK ***

CPU0: dwc3_apple_remove() -> usb_role_switch_unregister()
CPU1: usb_role_switch_set_role() -> dwc3_usb_role_switch_set()

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125234825.9473=
3-1-iasnezhkov@gmail.com?part=3D1
