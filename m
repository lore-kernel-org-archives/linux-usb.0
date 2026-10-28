Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163966;
	b=Za/D5iOl0B5mGQmM5jb1vhcJahB6Y5v34gtBYmLt32H6Y82MeVc3C7RyXuLg/dd2gZ4B
	 wgoyrAYnc9edFIWIbmLk1qqO/1XdABRoIED1vRzymX8glsIL6hvsgtmpofPiv8qaNleb4
	 Su+swaxT6FGxHXvU6NMeqXyCjGi2VbEGYV4vhPY37WoyOBI77aJFzoxIp3p7nHjPzSZEf
	 Q/gDvKbOb7KMGTqajMuhHaiLhrsgCpYiJ+E/wrRa5MVNox3fnm/jVJ2b811hWpoBZuR6l
	 4SYl4XuthZEIAK3WvQmrr+6fDSJe/oRsCuNia6G8kstVs9QOc5/xTkLYKK+CFx5ytKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163966;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SRM9Vxz5GwUlGDfdH+RZW+RawWrdbsQdiS+oYqkHZ6g=;
	b=sFdWFz+FLekIBog6eSKo6jPwUy63z3O+bOylzf33ADpis/L1xTdJ58HMsrQ5VOnlD6Ob
	 MYfMxvcvC2EEfC8MwkdBjN2qNa7tFreC0NOlmZXjZ/k8pFnXAQ0rXgIu7ulIL2H6lBJVj
	 VdLsJ5Oom9KRNVp7AHXBH+pLzFcFtGlRIvDlBWdNzULojh/MMWlrPn/UdGvOkzVUwu8KW
	 aCxyneyPmZt6gJpomsIYRfJvcvaRDfqEEiQF7BcnAv6AW49i2r9XypMoB7+ndMYtJIeRs
	 MJzoyn6LpVPAoZnEaxCvmXAPWXXA88i8nUW7mQlgfinmAgEa5S2Xw/sSu7qJ+hRBQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EG58E8oz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAF606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EG58E8oz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E521F01825;
	Wed, 28 Oct 2026 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793163965;
	bh=SRM9Vxz5GwUlGDfdH+RZW+RawWrdbsQdiS+oYqkHZ6g=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=EG58E8ozkfZW+qQRsPivkM/5tn6cxayRr7m2opyGxio+1TuLoi1/kFS3ee+ejWj8X
	 aeBetPAEXR8buCpZIes4l+rT6oyJO0hzyJmS5XFB/e9u0A8CRO8E/089X5x940bdgL
	 p41YErzSuZk6FUNco7rtykWpa5xwDfF0ifC7tNYVPhb6hBUx0QCMLcasPluu4Sgndm
	 peskQCEJFRLGhXq9SDos6hOk1phw16bmp797D0SezxeaxblHicOLY4FRJaUmtVWFRr
	 sHgEvd7sjdyZjAYlUr3jtIvW/XSc2cWHMqI0832KeiXVVDruztqsTRVRhAb9/Dt8U5
	 s8n60tgFK7dcQ==
Message-ID: <sashiko-outbox-187500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: fhci: drain completion tasklet during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261028045705.114039-1-yaojiale02@163.com>
References: <20261028045705.114039-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 05:06:04 +0000
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
- [High] usb: host: fhci: tasklet_kill() in fhci_remove() runs after fhci_s=
top()
--

commit 8d5d7e60a2f21330916d798e53dce45b931fffe0
Author: Jiale Yao <yaojiale02@163.com>

usb: host: fhci: drain completion tasklet during removal

This commit adds a tasklet_kill() call on fhci->process_done_task in
fhci_remove() after freeing the timer IRQ to drain queued completion tasklet
work during device removal.

> diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
> index d572f0c1dffaf..c3fd7f77a71ff 100644
> --- a/drivers/usb/host/fhci-hcd.c
> +++ b/drivers/usb/host/fhci-hcd.c
> @@ -757,6 +757,7 @@ static void fhci_remove(struct device *dev)
> =20
>  	usb_remove_hcd(hcd);
>  	free_irq(fhci->timer->irq, hcd);
> +	tasklet_kill(fhci->process_done_task);

[Severity: High]
Is calling tasklet_kill() here in fhci_remove() too late to prevent the
tasklet from accessing freed resources?

Before fhci_remove() reaches tasklet_kill(fhci->process_done_task),
usb_remove_hcd() invokes usb_stop_hcd() -> fhci_stop():

drivers/usb/host/fhci-hcd.c:fhci_stop() {
	struct fhci_hcd *fhci =3D hcd_to_fhci(hcd);

	fhci_usb_disable_interrupt(fhci->usb_lld);
	fhci_usb_disable(fhci);

	fhci_usb_free(fhci->usb_lld);
	fhci->usb_lld =3D NULL;
	fhci_mem_free(fhci);
}

Inside fhci_stop(), fhci_usb_disable_interrupt() masks interrupts via
disable_irq_nosync() without waiting for in-flight handlers, and
fhci_usb_disable() calls fhci_port_disable() ->
fhci_flush_all_transmissions() -> fhci_transaction_confirm() ->
fhci_move_td_from_ed_to_done_list() -> fhci_transfer_confirm_callback(),
which schedules fhci->process_done_task.

Immediately after that, fhci_mem_free() frees fhci->empty_eds,
fhci->empty_tds, and fhci->hc_list, setting fhci->hc_list to NULL:

drivers/usb/host/fhci-hcd.c:fhci_mem_free() {
	...
	kfree(fhci->hc_list);
	fhci->hc_list =3D NULL;
}

Then usb_remove_hcd() calls free_irq(hcd->irq, hcd) and fhci_remove() calls
free_irq(fhci->timer->irq, hcd) before reaching tasklet_kill().

Since softirqs remain enabled and tasklet_kill() waits for an already
scheduled tasklet to finish executing its callback, process_done_list() can
run during or after fhci_stop():

drivers/usb/host/fhci-sched.c:process_done_list() {
	...
	disable_irq(fhci->timer->irq);
	disable_irq(fhci_to_hcd(fhci)->irq);
	spin_lock(&fhci->lock);

	td =3D fhci_remove_td_from_done_list(fhci->hc_list);
	...
}

drivers/usb/host/fhci-q.c:fhci_remove_td_from_done_list() {
	struct td *td;

	if (!list_empty(&p_list->done_list)) {
	...
}

Wouldn't this cause process_done_list() to call disable_irq() and
enable_irq() on already freed IRQs and dereference a NULL or freed
fhci->hc_list inside fhci_remove_td_from_done_list() (as well as leaving the
usb_add_hcd() error path in of_fhci_probe() that calls usb_stop_hcd() ->
fhci_stop() without draining the tasklet)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028045705.1140=
39-1-yaojiale02@163.com?part=3D1
