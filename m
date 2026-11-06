Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978764;
	b=NA0FjqvBaBG2bd14+aMef6N/0meaW35Bxx4xMQAIqOdY+9K4jUp6UfVmYLJPuZ3kfh6F
	 nE353K22pgCaB+Vd4nfQnPM9n4KimMpB3sFrvBnlPMJ7JRF+pB419IoWFPsM05/KJq/kK
	 4pCQYTZFV9yGs6hAwbPwqTceAmfE9O7r5cRTJFTmMxTr3DUZboJLg6vU8s/2w1Em3REoy
	 O2L/8DsF0ly6AL9cLt1buK2S4j2pTgOtvDwOWV7pxcVmcEbxiBamJFX+8AIBai5O3kwFB
	 MsKEbpnqwe5oa7MVQwec/UVMEMPe/WZnGHHnJKn1iQRvBsAhKNfmYqX9FXJLVmVkcEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xibxdAGYMpYlYRSt7NqOnEETMq+Xcq4KTjsU5eXIEcw=;
	b=ucx+bqsDuy6my0wFjTyj4MFn/GV99CYBfKOTclIz/2KYRS6TRO5mV+EzbpX2epXu1466
	 lXD/iWDUELYEdol3vMUPbQcTDYtrXY5HOjO57Ken1qjhr4kh+pjb+Wt7kmrSpR/YqPNXB
	 D4lYVqDAEB5aYmzSER9aW6CAkrsnhvsCDsz6GSFEu14T7LqKvhx5qLhFvhZj+Yq+hCEQz
	 0GJM9saAbhm++iWvlh1ZZ61YQan36O6WYxHoVar6TqWtAJCDYn7tDrKScbdBbwKjOfVq0
	 9ZkvRhV+CmvpZSCnYZF5gXYk3gRtnQcH0g2Pz14EjYyf1UyOItHQn2QS+umdW7g9xOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNQbCUUF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CC6606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNQbCUUF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B651F0089F;
	Fri,  6 Nov 2026 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978764;
	bh=xibxdAGYMpYlYRSt7NqOnEETMq+Xcq4KTjsU5eXIEcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TNQbCUUFRWL4B9up3h7c431frweWDvinqcqi795cj25O7kM0lsTvejJTYTTgYZlxL
	 4WjmlBsekuarIfjX90kzqzIUKRiRp6zf1GeuV4fKss8FRlA5wUZ4r8UgW6i2zBjPoV
	 83xau3LVfjdzvsIOzhMtgP2Nk6zoTyzlOFCIW8xuCl4CI/y+Izjm+Xx85A2b5xxAYM
	 oRa2ktKghVvFv7hpOOlZc5+sVKooDbh2OE468ywucdPsERlF89lYFJ7eqQ0LFTYEMV
	 /dI2qaQQk/E8oLnHp9wOXxbRtgziWUb5/CuT/M2MAeDqqvRqYchySSI8t0LuJUvQF3
	 5V/rN7YtR4K9g==
Message-ID: <sashiko-outbox-201689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] usb: gadget: gadgetfs: dequeue pending ep0 request
 before freeing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179397691694.27761.9543494907127681190.gadgetfs-ep0-patch-test@gmail.com>
References: <6a6944f5.e3659fcc.2a40b8.0021.GAE@google.com>
 <179397691694.27761.9543494907127681190.gadgetfs-ep0-patch-test@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:26:03 +0000
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
- [High] usb: gadget: gadgetfs: gadgetfs_setup() reuses req while
  setup_out_ready
- [Low] usb: gadget: gadgetfs: invalid Fixes SHA and syzbot command in
  changelog
--

commit 30f3f2dca823922d4eaa362244e46b92716f82d8
Author: Jing Lin <kayano050408@gmail.com>

> usb: gadget: gadgetfs: dequeue pending ep0 request before freeing
>
> Please test this gadgetfs ep0 request lifetime fix
> The unpatched base reproduces the warning and use-after-free locally
> on arm64 QEMU with dummy_hcd and KASAN
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git f66469d9905b39d2c260a15d7d6db450f4db67c1
>
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active
>
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed
> This triggers the warning in dummy_free_request() and a use-after-free
> when dummy_udc_stop() subsequently drains the endpoint queue
>
> Track dev->req from submission through completion under dev->lock and
> reject reuse while it is busy
> After waiting for active UDC users to finish, dequeue a pending request
> before freeing it and clearing ep0->driver_data
> Drop dev->lock around dequeue because the completion callback takes it
> Only dequeue pending requests to avoid errors from UDCs that reject
> cancellation of an unqueued request
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc73e1942197af9f54ca3
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

[Severity: Low]
The conversational testing notes and the "#syz test:" command at the top of
the commit message should be removed before applying.  Also, the 12-charact=
er
prefix 1da177e4c3f4 in the Fixes: trailer cannot be uniquely resolved in git
history.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 7f6d8460152f9..d60df4ad38a3e 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -1508,6 +1529,11 @@ gadgetfs_setup (struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  	} else if (dev->state =3D=3D STATE_DEV_SETUP)
>  		dev->setup_abort =3D 1;
> =20
> +	if (dev->ep0_req_queued) {
> +		spin_unlock(&dev->lock);
> +		return -EBUSY;
> +	}
> +
>  	req->buf =3D dev->rbuf;
>  	req->context =3D NULL;
>  	switch (ctrl->bRequest) {

[Severity: High]
Can gadgetfs_setup() reuse dev->req while ep0_read() is still copying out a
completed control OUT transfer?

When a delegated control OUT transfer completes, ep0_complete() clears
dev->ep0_req_queued and sets dev->setup_out_ready =3D 1, leaving the payloa=
d in
dev->req->buf until ep0_read() copies it to userspace and calls clean_req():

drivers/usb/gadget/legacy/inode.c:ep0_read() {
    ...
				len =3D min (len, (size_t)dev->req->actual);
				++dev->udc_usage;
				spin_unlock_irq(&dev->lock);
				if (copy_to_user (buf, dev->req->buf, len))
					retval =3D -EFAULT;
				else
					retval =3D len;
				spin_lock_irq(&dev->lock);
				--dev->udc_usage;
				clean_req (dev->gadget->ep0, dev->req);
    ...
}

Because gadgetfs_setup() only checks dev->ep0_req_queued (and clears
dev->setup_out_ready =3D 0 at the delegate label before calling setup_req()=
), a
new SETUP packet arriving while ep0_read() has dropped dev->lock for
copy_to_user() will reuse dev->req:

CPU0                              CPU1
ep0_read()
  spin_unlock_irq(&dev->lock)
                                  gadgetfs_setup()
                                    /* USB_REQ_GET_DESCRIPTOR */
                                    req->buf =3D dev->config;
                                    usb_ep_queue(gadget->ep0, req, ...)
  copy_to_user(buf, dev->req->buf, len)
  spin_lock_irq(&dev->lock)
  clean_req(gadget->ep0, dev->req)
    kfree(req->buf)               <-- frees dev->config / interior pointer

If the new SETUP request is USB_REQ_GET_DESCRIPTOR, req->buf is pointed at
dev->dev (the 18-byte descriptor at the tail of dev->buf), dev->hs_config (=
an
interior pointer into dev->buf), or dev->config (dev->buf itself).
copy_to_user() can then read up to 238 bytes past the end of dev->buf when
req->buf is dev->dev, and clean_req() then passes req->buf to kfree(),
either crashing SLUB on an interior pointer or freeing dev->buf while it is
queued in the UDC and before dev_release() frees it again.  If the new SETUP
request is another delegated control OUT transfer, gadgetfs_setup() clears
dev->setup_out_ready =3D 0 and re-queues dev->req, after which ep0_read()'s
clean_req() frees the new req->buf while queued and resets req->complete.

Checking dev->setup_out_ready alongside dev->ep0_req_queued in
gadgetfs_setup() would prevent reusing dev->req until ep0_read() finishes
with it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179397691694.27761.=
9543494907127681190.gadgetfs-ep0-patch-test@gmail.com?part=3D1
