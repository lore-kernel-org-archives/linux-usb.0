Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173E136672;
	Sat, 20 Jun 2026 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781915022; cv=none; b=EU3SdQJYRwqzuPqXSdanq7cHbjTAtG4niPP5sU+EyEailReAsVDgNIJT02tMgIzWK6w+Wa+2asnXJKM05mpQSICpt2n5R1m7l7O0hRsenSraeiNqVz5G7orirUko75+Y9IzN5PlElwDUm/SC4KGG2WuJnEyoPlode6hpGfvt9IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781915022; c=relaxed/simple;
	bh=wxmJCXt0tGffXTZBYePxpUu3ASE9dErykwTI1aeI3Us=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5zavVNyk6x0bgPZ0x5aqt3JIBKy0QJH8/GbgP9iZm7vQVcmj5vyC6FTfRWnUdNZfao9gEPQakI17Vo4cOu5uPEXdTmLekjyLseXr5nrEkYqBpvlaubcq+3+MJSEcOyN0SkINwtZA9D+eMVQqHe0dLJFS47WKnNB5f2LbhVaqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=oVZG/t8b; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="oVZG/t8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1781915014; x=1782174214;
	bh=bV8f4TV6m+YC5V/lhbB4s8pGE5DnEa5C0HHy4Fow9D0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oVZG/t8b6sMVjvPhVE86QwkoJT5HnTP/U4rj469nngcdR22ApCFLXyZ5q1dSlJcR3
	 VsgJjh1ATjsjy/qWadHPTPOjGefm+fyTfgoANpR7+1zk5z1c4GzHBXd+BStneHK+G8
	 4a1uSlDYSYvmLR4nd2NcsBta8YF3qiWIT7P9JyiRbpxmpP5bdS7MqyS+FEvZMQbByy
	 MO1f64+hJ720ImxceeJUC8TKYN4H/vPkTOTTmPl2KvbxDwzaK81n7GPJQY8vdcvCxi
	 opiYA3PvEAl1e2mctP5ucqjiek03XjE+W/wlowY+yeroo7niOY3HKYG11nXVdhkEWx
	 135eO5cTssJ7Q==
Date: Sat, 20 Jun 2026 00:23:32 +0000
To: "Igor Kotrasinski/Security (PLT) /SRPOL/Engineer/Samsung Electronics" <i.kotrasinsk@samsung.com>
From: Sam Day <me@samcday.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Karol Kosik <karo9@interia.eu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: vudc: fix NULL deref in vep_dequeue()
Message-ID: <syARovqi-M4f586bD2Z6mkfwee1vtU02lQ1YoPs2N4ZA4THv-F-8OhwI89WLwvZ1T45qLgTphRmUKGwfpbPOy8_KXZQDPsZwiw6rYbXYgB4=@samcday.com>
In-Reply-To: <55bd7e53-9f90-414e-aa07-f228d8b2b35f@samsung.com>
References: <CGME20260619002859eucas1p2ac95b8f06a59a44eeb7e1a8b4bfc3a0d@eucas1p2.samsung.com> <20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com> <55bd7e53-9f90-414e-aa07-f228d8b2b35f@samsung.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 8c87e76d91c430250ae518a7bdd5cbf013ab0bbe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Igor,

On Friday, 19 June 2026 at 10:34 PM, Igor Kotrasinski/Security (PLT) /SRPOL=
/Engineer/Samsung Electronics <i.kotrasinsk@samsung.com> wrote:

> Hi,
>=20
> > From: Sam Day <me@samcday.com>
> >
> > vep_alloc_request() wasn't initializing vrequest->udc, so cancellations
> > on the FunctionFS AIO path were arriving in vep_dequeue without a valid
> > UDC reference.
> >
> > AFAICT this bug has existed for ~10 years. Seems that nobody has really
> > stressed the FunctionFS AIO path on usbip's vudc.
> >
> > I tested this fix in a QEMU aarch64 guest driving FunctionFS endpoints
> > via AIO. Before the fix, running `usbip attach` from the host would
> > cause the guest to oops with the following backtrace:
> >
> > Call trace:
> >   vep_dequeue+0x1c/0xe4 (P)
> >   usb_ep_dequeue+0x14/0x20
> >   ffs_aio_cancel+0x24/0x34
> >   __arm64_sys_io_cancel+0xb0/0x124
> >   do_el0_svc+0x68/0x100
> >   el0_svc+0x18/0x5c
> >   el0t_64_sync_handler+0x98/0xdc
> >   el0t_64_sync+0x154/0x158
> >
> > Assisted-by: opencode:openai/gpt-5.5
> > Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> > Signed-off-by: Sam Day <me@samcday.com>
> > ---
> >   drivers/usb/usbip/vudc_dev.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.=
c
> > index c5f079c5a1ea..2f1f141909b2 100644
> > --- a/drivers/usb/usbip/vudc_dev.c
> > +++ b/drivers/usb/usbip/vudc_dev.c
> > @@ -279,15 +279,18 @@ static int vep_disable(struct usb_ep *_ep)
> >   static struct usb_request *vep_alloc_request(struct usb_ep *_ep,
> >   =09=09gfp_t mem_flags)
> >   {
> > +=09struct vep *ep;
> >   =09struct vrequest *req;
> >
> >   =09if (!_ep)
> >   =09=09return NULL;
> > +=09ep =3D to_vep(_ep);
> >
> >   =09req =3D kzalloc_obj(*req, mem_flags);
> >   =09if (!req)
> >   =09=09return NULL;
> >
> > +=09req->udc =3D ep_to_vudc(ep);
>=20
> We can get rid of udc in struct vrequest and call ep_to_vudc() in
> vep_dequeue(). All the other places do it, I think I missed that one
> during a refactor before submitting the driver.

Thanks, I've done exactly that in v2.

>=20
> >   =09INIT_LIST_HEAD(&req->req_entry);
> >
> >   =09return &req->req;
> >
> > ---
> > base-commit: 5cd1731cc883a9914d91e3b93d4597317b5b5339
> > change-id: 20260619-usbip-vudc-deque-fix-d316de3d3f16
> >
> > Best regards,
>=20
> Side note, there are some checks for udc->driver being NULL that I feel
> are either redundant or should be behind a spinlock, just like setting
> udc->driver is. I'm not sure which, will have to take a look.

Hmmm, I took a brief look at this but it seems to be quite the can of worms=
.
Since it appears unrelated to the vrequest->udc NULL deref and falls outsid=
e
my domain of experience/expertise/confidence-levels, I'll leave this follow=
-up
to the pros :)

Cheers,
-Sam

>=20
> BRs,
>=20
> Igor Kotrasi=C5=84ski
> 
