Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366201;
	b=wWvKcMSatCWtY2HJ1RbPcY67aRK9ggr5ETBHhSwpPWIDiFY5eRS+kJT4DA/GNxrkE+FE
	 Cy/VH6okVvdwjVOQGHRTJxHZWaiq8COv0hKTLOZ96ivF1Y/nHGE95Ft3Xs9kaQkPIesOf
	 /gWnvkI5DADqhMptLbSYsOD1Rn9Jk733LHefmjcQo4ymjPArQvPZDHyWP07Ia1k6DR20n
	 qr3CaNw+PX/+nY44Wi2dourtyowbNpTfnqn5DUlK6KnGAfU3dxKvZ4GJs6qzs3Hyyc1yR
	 erwiJlHrU6Y/4bcnQYBldksYaOt80NOuS13mwmkVyZUhyQzxf2n0BH2pOHPJW8w3Bjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CMOAA88aRzO8n3P5K3lrE4+ZVeXCYjpacfZgqF9fBYY=;
	b=iXbLkBDndLSRdQX9NLXyOBbO+B092TZNBTZzRz/uU/sTbyTRkLtgFDJ0qIKeilYZrUuI
	 +HgBcI//OkCSYuuB29Iqm7ZixEtIPw2b3lQ0SyWmcrzTqqEkauQhwFS3S7EOhPFDd4Of2
	 deiVG3e6bZYiXiR9YzDgjiHBvHS8VmsFaV3Iuo8EsRneYYCNsoAdDgsVDPZAk5tlb91ED
	 cKxFkc1TUVar5W3EwfM1YnqlgVQl9L62J4yuMRqqkpGtDHvG1WFSKeRDshIZJ1jvIKdwq
	 M/2Pk4AGNYvqBe8bo4c2eWMECIskAYrbgISz0vOCoiok2eKasMCX33YjIXl3hERY/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnRmhFe+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842CB606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnRmhFe+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7241F0089F;
	Wed, 11 Nov 2026 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794366201;
	bh=CMOAA88aRzO8n3P5K3lrE4+ZVeXCYjpacfZgqF9fBYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MnRmhFe+O4PlWWo7t8StkcmN5LWX7PGHAO4xUuI43yFSUSelN/Yf1SRH4de1YRWWW
	 BilgPSY5u6MLocGr8bLtLyuvLhYKQz9nJ058SVl/DQ0ngX2K/cTVwoQkRyB1S/xg9V
	 OX1AGUr0wHzEooHmAz8Lj4zdpaPcXBqkHS65iUnhpGtBg2QNX9be72OYqepIfo615H
	 3D8fr4Ug6iKtvXAQHyrvS/A9pUtDSEw8ij7F9dyn9isgaWGYaoUcbocdsDRcH3YHWd
	 vWG1XR/CvOnQvURPDKd0FW287eAjDgnTv1O2szGKUawUYKYSj5ZteC+tNHDFGY3uCm
	 t0tGkhB6U4xmQ==
Message-ID: <sashiko-outbox-208153@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: f_hid: fix race between userspace
 report update and GET_REPORT response
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111021655.37851-4-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111021655.37851-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:03:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] usb: gadget: f_hid: use-after-free of get_req_buf after
  hidg_disable()
- [Medium] usb: gadget: f_hid: leak of get_req_buf in hidg_bind() and
  hidg_unbind()
- [Medium] usb: gadget: f_hid: uninitialized memory leak in
  get_report_workqueue_handler()
- [Low] usb: gadget: f_hid: unused get_report field in struct f_hidg
--

commit d402239570ba7e6af5cac6cc1d8f6985f6ff4af7
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: gadget: f_hid: fix race between userspace report update and GET_REPORT=
 response

This commit allocates a dedicated get_req_buf buffer at bind time and
copies report_list data into it in get_report_workqueue_handler() before
queueing GET_REPORT responses on ep0.

> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/fun=
ction/f_hid.c
> index d7ba30323414c..1810e31635187 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -94,6 +94,7 @@ struct f_hidg {
> =20
>  	/* get report */
>  	struct usb_request		*get_req;
> +	void				*get_req_buf;
>  	struct usb_hidg_report		get_report;
>  	bool				get_report_returned;
>  	int				get_report_req_report_id;

[Severity: Low]
Since get_report_workqueue_handler() no longer points req->buf at
hidg->get_report.data, can the unused get_report member be removed from
struct f_hidg?

> @@ -587,7 +588,8 @@ static void get_report_workqueue_handler(struct work_=
struct *work)
>  	ptr =3D f_hidg_search_for_report(hidg, hidg->get_report_req_report_id);
>  	if (ptr && !ptr->report_data.userspace_req) {
>  		/* Report exists in list and it is to be used for immediate response */
> -		req->buf =3D ptr->report_data.data;
> +		memcpy(req->buf, ptr->report_data.data,
> +		       min(req->length, (unsigned int)ptr->report_data.length));
>  		status =3D usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
>  		hidg->get_report_returned =3D true;
>  		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> @@ -622,10 +624,10 @@ static void get_report_workqueue_handler(struct wor=
k_struct *work)
>  			 * Either get an updated response just serviced by userspace
>  			 * or send the latest response in the list
>  			 */
> -			req->buf =3D ptr->report_data.data;
> +			memcpy(req->buf, ptr->report_data.data,
> +			       min(req->length, (unsigned int)ptr->report_data.length));
>  		} else {
>  			/* If there are no prevoiusly sent reports send empty report */
> -			req->buf =3D hidg->get_report.data;
>  			memset(req->buf, 0x0, req->length);
>  		}
> =20

[Severity: Medium]
Can this send uninitialized slab memory or stale report bytes to the USB
host when ptr->report_data.length is smaller than req->length?

hidg->get_req_buf is allocated with kmalloc(), and req->length is set to
min(hidg->get_report_req_report_length, hidg->report_length,
MAX_REPORT_LENGTH).  Both paths copy only min(req->length,
ptr->report_data.length) bytes into req->buf without clamping req->length
or zeroing the remainder before usb_ep_queue() transmits req->length
bytes.

> @@ -1007,6 +1009,8 @@ static void hidg_disable(struct usb_function *f)
>  		hidg->get_req =3D NULL;
>  		hidg->get_report_returned =3D true;
>  	}
> +	kfree(hidg->get_req_buf);
> +	hidg->get_req_buf =3D NULL;
>  	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> =20
>  	spin_lock_irqsave(&hidg->read_spinlock, flags);

[Severity: High]
Does freeing hidg->get_req_buf here cause a use-after-free on subsequent
GET_REPORT requests?

hidg->get_req and hidg->get_req_buf are allocated only in hidg_bind(),
where hidg->get_req->buf is set to hidg->get_req_buf.  When hidg_disable()
runs on a USB reset or disconnect while hidg->get_report_returned is true,
hidg->get_req is kept alive, but hidg->get_req_buf is unconditionally
freed and never reallocated in hidg_set_alt().  The next GET_REPORT
request after re-enumeration then runs get_report_workqueue_handler(),
which writes into the dangling req->buf via memcpy() or memset() and
queues it to ep0.  Also, because get_report_workqueue_handler() sets
hidg->get_report_returned =3D true as soon as usb_ep_queue() is called,
hidg_disable() can free hidg->get_req_buf while the controller is still
reading from req->buf.

> @@ -1160,6 +1164,19 @@ static int hidg_bind(struct usb_configuration *c, =
struct usb_function *f)
>  	if (!hidg->get_req)
>  		return -ENOMEM;
> =20
> +	/*
> +	 * The GET_REPORT response is served from a dedicated buffer, not
> +	 * from the report_list entries: userspace may update an entry
> +	 * (f_hidg_get_report()) while the controller is still reading the
> +	 * previous response, which would corrupt the data on the wire.
> +	 */
> +	hidg->get_req_buf =3D kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
> +	if (!hidg->get_req_buf) {
> +		usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
> +		return -ENOMEM;
> +	}
> +	hidg->get_req->buf =3D hidg->get_req_buf;
> +
>  	hidg->get_req->zero =3D 0;
>  	hidg->get_req->complete =3D hidg_get_report_complete;
>  	hidg->get_req->context =3D hidg;

[Severity: Medium]
Does this leak hidg->get_req_buf on hidg_bind() failure or when
hidg_unbind() runs without a prior hidg_disable()?

In hidg_bind(), the early error return when usb_gstrings_attach() fails
and the fail label both omit kfree(hidg->get_req_buf), and
usb_ep_free_request() only frees the usb_request itself.  Likewise,
hidg_unbind() does not free hidg->get_req_buf, so unbinding a function
that was never configured and disabled by a host leaks the buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111021655.3785=
1-1-shishunbo@cmss.chinamobile.com?part=3D3
