Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385950;
	b=kHSV5pvS7Ddrf5O9jaQgeIDeACw1jKZSgSW7UBSOUKFJstKHHC4Vv++C7ALcSxbZX4xX
	 GozAcMixkasc4EHF9rjRp8x9jVPvgwJnVwxse/8aDqURF+0MHau0qi+AAZ4nFd5WyZbkE
	 +i2VccTvZo9XNrk21rlwS5I91G07t2lKuJsq7/hoBUmx++PZ1hKzD3Itgl9FgBBRqGsVJ
	 xrRAzekHd1ATGuQ1tJYe2+NhpZSCqbsp2tLaWkJN1CUb81N1JD6Ioh8HbYeOpK8qGIOVX
	 ajdHSuixtWI3wubkwdW+RQyZFnu40/ovKKcwJ6B6q3/T1LzLj0IdVDHjSBTjAEvDo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/Pq3qspxC8lHlMLhYCqfunKuM5Bl2MSEB8l7SnB6qqc=;
	b=Haa8yAel5R1C2gkyJ5yfmq0oWP0GFHEPmE4QvfKbCZ+oHfx4NkW3niWiFb6o14mgSuzy
	 4eZ+/56GnEdA7OtXmPArug2xVpyAy141JV0IvLuucSj2e2tCOmEyDpWcXOu8SkfqvpIM7
	 eQTYSjKsQl5RIl4M9bV9MTDwKALJvV054D/EoMArfDvyekgBEe8TeACki0advE1BbwyrJ
	 DVtOXzr9XgYvyl1T77cvKMpNA+5nqz+NUwlbM6GgqQkdk5gYboWIPIsSf9UkcQ66phO3l
	 u5Tz+UolATnfC2aWjgU449eJj96tVMZp2MAojqa4I1nnwW4q2Z2G9lXXEKGvzMDVKrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGNDVo5L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A815606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGNDVo5L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956651F00A05;
	Wed, 11 Nov 2026 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385949;
	bh=/Pq3qspxC8lHlMLhYCqfunKuM5Bl2MSEB8l7SnB6qqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGNDVo5LzROFSiJiAdaELR30TGxru6K4ApOD/s5Dh1MHP8lcTMWLbrIH4bbm9c8Gs
	 0h6Mo6x5pkX+IVM7chwJWVL4ivvIdiaLxIJ84kda/SwbRBPKXSdc1oQG52Pf754dER
	 kA9h+nKW+PUo53dBX3eQlwwvHvYk8JHpgqB64r4nO/NXobhGK3LSB+zblJOhxYbz06
	 fQMtbvQPSZKiOLKrmrXuudyrxCZh4p4zlgPh6NrpC/7WDPIgVRGe8pL0rHAyhjE9CQ
	 vMAahxewsDnHOoZJX7vLATjHwgDP59LASIktCwAWcVrv5SJ1haYiyGfRJfhrZcq8xL
	 vxFAAMo3KEeMQ==
Message-ID: <sashiko-outbox-208608@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: gadget: f_hid: fix race between userspace
 report update and GET_REPORT response
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111081313.16626-4-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:32:29 +0000
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
- [Medium] usb: gadget: f_hid: use-after-free of get_req_buf in
  hidg_unbind()
--

commit e3eb22ae89791d0f4572b69a78a39ec433f7be8d
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: gadget: f_hid: fix race between userspace report update and GET_REPORT=
 response

This commit allocates a dedicated buffer (get_req_buf) at bind time and
copies GET_REPORT response data into it before queueing hidg->get_req on
ep0, avoiding a race with userspace report updates.

> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/fun=
ction/f_hid.c
> index d7ba30323414c..426bc1743cbb9 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c

[ ... ]

> @@ -1593,6 +1619,8 @@ static void hidg_unbind(struct usb_configuration *c=
, struct usb_function *f)
> =20
>  	cdev_device_del(hidg->cdev, &hidg->dev);
>  	destroy_workqueue(hidg->workqueue);
> +	kfree(hidg->get_req_buf);
> +	hidg->get_req_buf =3D NULL;
>  	usb_free_all_descriptors(f);
>  }

[Severity: Medium]
Can freeing hidg->get_req_buf here cause a use-after-free if hidg->get_req
is still queued on cdev->gadget->ep0?

get_report_workqueue_handler() queues hidg->get_req (with req->buf set to
hidg->get_req_buf) asynchronously on ep0 and sets hidg->get_report_returned
to true before the transfer completes.  During gadget unbind,
hidg_disable() skips hidg->get_req when hidg->get_report_returned is true,
and destroy_workqueue(hidg->workqueue) in hidg_unbind() can also drain a
pending work item that queues hidg->get_req onto ep0 right before
kfree(hidg->get_req_buf) runs.  Because hidg_unbind() neither dequeues nor
frees hidg->get_req, the UDC can access freed slab memory via req->buf and
hidg->get_req is leaked with a dangling buffer pointer.

Should hidg_unbind() dequeue and free hidg->get_req on ep0 before freeing
hidg->get_req_buf?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111081313.1662=
6-1-shishunbo@cmss.chinamobile.com?part=3D3
