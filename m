Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAB4963C7
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540792; cv=none; b=PX/xqSSK1lwUvIpBaE4Jp0Mwpyra1JzHBlzLf+Ykw83z2EM3HYC3SmWh2LP0wihgWjjqdvLImRr5ErBFJTykN1k+hesTOyH3UkahdMn/C5m0U61N73wNRIZj7u0gOAAzm9JReeFIy8lEHkxr5+FJQhkyHksfgUsb4OyaTR9OEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540792; c=relaxed/simple;
	bh=725jwlGKxelFyLIG3GE9wCpdPbBBJa5zYJCWAojac6k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=V2uvxRJoVeJMc0EHsPEfTqliRssJQUsL8FRPNLvFyDLRDuWjboz9VMCuHyMqvnKD0PmgN482dO8xQyO7HKg48wgK0oIPePS2tvWdGoQCfygNQkTERyiWuXRySG3pFWcjqZL2TS4A9ribwBZRznYiBuLUuBQwSoGDfP1xUKJB/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq6RFrMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq6RFrMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADACA1F000FF;
	Fri,  9 Oct 2026 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540790;
	bh=nqytJU/d6CoB4xTv7vT5OLlza3C0W6HouNKC3pym+m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mq6RFrMIrdgw9yuSE70w1otB+/rbap7p2LabQxMS4yiYha8kUhMByq41lI2WhBa47
	 UprIiH0LRXOQNlT2DoQSDKhPy2myI4VjUvdX3e2/wr3xh1UdwEUrVWPfcm0b5N7Erh
	 dN99Cwb6pGEbOf819ODf+cIrvMiluJXOlkcXFVzmv5zeRLgCn78y17shhwW2zU9yMR
	 jRh7L9kmm9DFOWgqR7l6VtNd9quNiG5Ob9dknx+QhN5w7OCLqyZXMuo8sXGAHIRbRZ
	 x3UXmGM0gkQ50MQs3cpyDcP7ovX4fBC+N9TEB+vkL/Is0Bn4Z5sASlgA5B0gQ3/mZj
	 SBA/F3DspElSw==
Message-ID: <sashiko-outbox-165207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-7-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-7-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:13:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: xhci: dbc: UAF due to premature IDR exposure and missing TTY =
hangup on error path
--

commit 99c18a1b8449e8389ccac896ceadcc979dbd6a57
Author: Sang-Hoon Choi <csh0052@gmail.com>

xhci: dbc: lock the minor IDR on registration failure

This commit fixes a race condition during DbC TTY registration failure
by adding mutex protection around the removal of the minor IDR entry.

> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtt=
y.c
> index 3d51e8d82659d..2249cc16800cc 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c
> @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_d=
bc *dbc)
>  err_free_fifo:
>  	kfifo_free(&port->port.xmit_fifo);
>  err_exit_port:
> +	mutex_lock(&dbc_tty_minors_lock);
>  	idr_remove(&dbc_tty_minors, port->minor);
> +	mutex_unlock(&dbc_tty_minors_lock);
>  err_idr:
>  	xhci_dbc_tty_exit_port(port);

[Severity: High]
Does this error path leave concurrent TTY sessions pointing to freed memory?

Earlier in xhci_dbc_tty_register_device(), the port is added to the globally
visible dbc_tty_minors IDR before internal structures are fully allocated:

	mutex_lock(&dbc_tty_minors_lock);
	port->minor =3D idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
	mutex_unlock(&dbc_tty_minors_lock);

A concurrent open() on the device node routes to dbc_tty_install(), which
retrieves the port and installs the TTY without verifying port->registered:

	port =3D idr_find(&dbc_tty_minors, tty->index);
	...
	if (!port)
		return -ENXIO;

	tty->driver_data =3D port;

	return tty_port_install(&port->port, driver, tty);

If xhci_dbc_tty_register_device() fails later (for example, during
xhci_dbc_alloc_requests()), the error path frees the kfifo and destroys the
tty_port.

Because tty_port_tty_vhangup() is not called here to terminate the
concurrent TTY session, does this allow userspace to subsequently call
write() and access the freed xmit_fifo and destroyed tty_port?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D6
