Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484985;
	b=5h2HOCdaN7kRL/zwfIG/LFLzneiTAJ+TGJDr68fdjG8GpcahN+kA/eW7d9z8cfMlsK0o
	 5clD2TDSj1LULFnXL89X64z0PWMW3HIF4Q8tMvLRNsqLEbS1CHowc5H5RrpOX9uKR4UZn
	 bWQ2UKGjsGPnxlkDrcj02O59weqKcdVYFyYhX8cr1JoABpNjZrZNxROfuuY9F/Pt+Yjyx
	 +3mw/BmX1xgttaj/eRW6JntiQkeEYQRfe22r05GlKCbOtRKsEv9B03PcuLG5TsY3mtKbj
	 ylKRA/r8V5fqZEbG5EVRK0CQxInalzClm96Z+8+tWMUKosO5KPXBMvfmeQDu+1swPWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484985;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JrxdoFCkrgcPHGBYCweSSVAe2gwPPODEZuY8LbUG6Bs=;
	b=YZ59TTssjxngFOuKTDddRJjNor1Q1Xo1JNQSxWbgVpd1vxsBTMr4ygVKfSDkWlrzjJbF
	 J/OnN1pWcBdxh6FuQua+df8+59PZlAozSp7dIRavXW+HJLxb/G5RfOs3gdeuv8DeVzuGV
	 Z+VMG/sxzn0PbS3oDN05t8MncZedmD/TG6YT+LCOLYlCI9/+stmoahumqiYFOh5LYZr39
	 bAZa0ROaDL0xh855p2ZyGr+gInRCsXOXflLGRAnBqsyYiMlWb29FK4efhQwixJJi9vQcN
	 AFQsu2rdzPLHlnvmtTDzF6BvU4mmkUfoKxp7uAe7T78Tnghv3/9lsjMtL2IbcSDLywA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7aNqH1e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3907606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7aNqH1e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402241F000C0;
	Tue, 24 Nov 2026 01:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795484985;
	bh=JrxdoFCkrgcPHGBYCweSSVAe2gwPPODEZuY8LbUG6Bs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=E7aNqH1eAhvpScfDPOsiiYYPIXk3aZE2SfIuHQgkQd5ON1ktUDc1aF4MUPkwpyY/6
	 GwErpfv8/mM1uYjFHoGU1bZr7nRPCr6H07+Oh54Nacn5MRdz8ep2UkXyPXSeASf3b3
	 Hj9dcS5YbRZX/DKOwEWSCoF4I0dnolTy+62TuvILoCpvnvFIalbwGOcBW5R8Kc8C7k
	 gC3Db+wkP9MFOFP/LEn5sHpaL4FA5zyGaEkaado3kcRmOEZ5lyPP7bOhFyKkzw0GQc
	 5zOympigTCbRTyWU2kY0XQFO/RxyAll3aDkOqqfiqTTn/To5qQ+fadDTbOcnNH7zit
	 MXUiIeiMSNogg==
Message-ID: <sashiko-outbox-230357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
Reply-To: sashiko-reviews@lists.linux.dev
To: hanzhijian1991@gmail.com, linux-usb@vger.kernel.org
In-Reply-To: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
References: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 01:49:44 +0000
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
- [Medium] usb: gadget: raw_gadget: unlocked dev->req free in
  gadget_bind() error path
- [Low] usb: gadget: raw_gadget: missing Fixes trailer for gadget_bind()
  leak fix
--

commit 02db8ff1f01d6f46fdd516cc5c3f8446a7fb6921
Author: Zhijian Han <hanzhijian1991@gmail.com>

> usb: gadget: raw_gadget: fix memory leak on connect event failure
>
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
>
> Release the request before returning in that case.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3Dd83b3c49738aea97c0e5
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes: tag for 83e30f2bf86e ("USB: gadget: Fix
the memory leak in raw_gadget driver") or f2c2e717642c ("usb: gadget: add
raw-gadget interface")?

> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca5..33d70b552b6d9 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
>  	ret =3D raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(&gadget->dev, "failed to queue connect event\n");
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req =3D NULL;
>  		set_gadget_data(gadget, NULL);
>  		return ret;
>  	}

[Severity: Medium]
Can freeing and clearing dev->req without holding dev->lock race with
raw_process_ep0_io()?

A running raw-gadget driver can be unbound and rebound via sysfs while
dev->state remains STATE_DEV_RUNNING.  Because gadget_bind() publishes
dev->req and dev->gadget under dev->lock and drops the lock before calling
raw_queue_event(), a concurrent raw_process_ep0_io() can observe
STATE_DEV_RUNNING before raw_queue_event() fails and sets STATE_DEV_FAILED:

CPU0                                  CPU1
gadget_bind()
  spin_lock_irqsave(&dev->lock, ...)
  dev->req =3D req;
  dev->gadget =3D gadget;
  spin_unlock_irqrestore(&dev->lock, ...)
                                      raw_process_ep0_io()
                                        spin_lock_irqsave(&dev->lock, ...)
                                        /* dev->state =3D=3D STATE_DEV_RUNN=
ING */
                                        dev->req->buf =3D dev->ep0_urb->buf;
                                        dev->ep0_urb_queued =3D true;
                                        spin_unlock_irqrestore(&dev->lock, =
...)
  raw_queue_event() -> fails
    dev->state =3D STATE_DEV_FAILED;
  usb_ep_free_request(..., dev->req)
  dev->req =3D NULL;
                                        usb_ep_queue(..., dev->req, ...)
                                          <-- NULL deref or use-after-free

Even if raw_process_ep0_io() calls usb_ep_queue() just before
usb_ep_free_request() runs, freeing an in-flight request or passing a NULL
dev->req to usb_ep_dequeue() on interrupt will corrupt endpoint state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124012837.2071=
714-1-hanzhijian1991@gmail.com?part=3D1
