Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE84B1CF0
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401801; cv=none; b=PgxKHEhUAuBrErtdq7p1pbnLfLCHGkiLsxCK9nLIojFqP2zmT75v7NFJrfzA5ElE9mMhHTnaUgyFKgjkFEhGdRGkTP6nLFyAKKzIkCPuH3Nk+yZzqFhi2HTNri/VhpQVyn24/JdOBz0fB9hT5aPQ0qhzM0JVidPHwwelc423tIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401801; c=relaxed/simple;
	bh=GoSnbJATzwhVz9Y9sjvX+/3VJfEcb82bv5B2qIewsKQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KzqxuH3xFqUNh++e8aXuqAWBy84XPvPe5zZzTjeOdVp/AmKv2yFBCp5htNpVJPIiONC9daT5w9tc231R9tQix1WvZZWRD1FCtUgPmiMjL/gWKGUZo+JFtZBGGmLQazslcjJPAKezv32StuZX7ojd/YSyE+wmVfLSTwkl6y596oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Prf5Qnrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Prf5Qnrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39EA1F000C5;
	Mon, 19 Oct 2026 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401800;
	bh=MEz/cPBkqCPY3QWnRxxGun2yyZfa6C8961XRSfaSK4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Prf5QnrtnLN+dUmMLS/pTzvN8SdunieizXZ9st9is5M9CbnuzmLTRPO+8r8VghSHY
	 SGd6u+CatgcYPg5c3NXb8tVqr4cEbdGOl0MsQNe+92hRVbw3ut3VirZN0cG319TvaF
	 Z3e011UAYUDk4hzkat5zeo3aabRYCFValDSWD6ipjbmH2Iw5bX1jXUqh9JCLz4pZK4
	 TB3Ado8+8zdRE65kWzkWDXYozip6EaNs1CAc9iV8gMS+OhtfytsR5WLgeVtdfYxCgq
	 Tx7HKtCJGRz9NjYPsCSQo+U1bz4sNBNPPyFKXNd2fWiI8TGLpncEvfZk0w4uyJ1b2/
	 uKFIZEhKsib6w==
Message-ID: <sashiko-outbox-176892@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: gadget: u_serial: keep the port until its
 tty is released
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019090904.3264978-1-mehmet.fide@gmail.com>
References: <20261019085855.3259716-1-mehmet.fide@gmail.com>
 <20261019090904.3264978-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 09:23:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: gadget: u_serial: port reallocation race between gs_install()=
 and gs_open()
- [High] usb: gadget: u_serial: unbalanced port count in gs_close() when gs=
_open() fails
--

commit 80163fbde5c8a63d71508c20f74ff07e66b93936
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

usb: gadget: u_serial: keep the port until its tty is released

This commit adds install and cleanup callbacks to gs_tty_ops to take a
reference on tty_port during tty installation and release the gs_port via
a tty_port destructor when the last reference is dropped.

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index cdd1dfc666c4f..19eea724280b0 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -908,7 +908,39 @@ static int gs_get_icount(struct tty_struct *tty,
>  	return 0;
>  }
> =20
> +static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +	int		port_num =3D tty->index;
> +	struct gs_port	*port;
> +	int		ret;
> +
> +	mutex_lock(&ports[port_num].lock);
> +	port =3D ports[port_num].port;
> +	if (port)
> +		tty_port_get(&port->port);
> +	mutex_unlock(&ports[port_num].lock);
> +	if (!port)
> +		return -ENODEV;
> +
> +	ret =3D tty_port_install(&port->port, driver, tty);
> +	if (ret) {
> +		tty_port_put(&port->port);
> +		return ret;
> +	}
> +	tty->driver_data =3D port;
> +	return 0;
> +}

[Severity: High]
Does setting tty->driver_data in gs_install() cause an unbalanced
port->port.count decrement in gs_close() when gs_open() fails?

When gs_open() returns a non-zero error, tty_open() cleans up by calling
tty_release() -> gs_close(). In gs_open(), the function can fail and return
-ENODEV or -ENOMEM before incrementing port->port.count:

drivers/usb/gadget/function/u_serial.c:gs_open() {
	mutex_lock(&ports[port_num].lock);
	port =3D ports[port_num].port;
	if (!port) {
		status =3D -ENODEV;
		goto out;
	}

	spin_lock_irq(&port->port_lock);

	/* allocate circular buffer on first open */
	if (!kfifo_initialized(&port->port_write_buf)) {
		spin_unlock_irq(&port->port_lock);
		status =3D kfifo_alloc(&port->port_write_buf,
				     WRITE_BUF_SIZE, GFP_KERNEL);
		if (status) {
			...
			goto out;
		}
		spin_lock_irq(&port->port_lock);
	}

	/* already open?  Great. */
	if (port->port.count++)
		goto exit_unlock_port;
}

Because gs_install() already set tty->driver_data =3D port, gs_close() runs
with a valid port pointer even though gs_open() never incremented
port->port.count:

drivers/usb/gadget/function/u_serial.c:gs_close() {
	struct gs_port *port =3D tty->driver_data;
	...
	spin_lock_irq(&port->port_lock);

	if (port->port.count !=3D 1) {
raced_with_open:
		if (port->port.count =3D=3D 0)
			WARN_ON(1);
		else
			--port->port.count;
		goto exit;
	}
}

On a failed first open where port->port.count is 0, gs_close() hits
WARN_ON(1).

Furthermore, if a process already holds the tty open (port->port.count =3D=
=3D 1)
and gserial_free_line() has cleared ports[port_num].port =3D NULL while
waiting in gserial_free_port() at wait_event(port->close_wait,
gs_closed(port)), a second process reopening the existing tty via
tty_reopen() -> gs_open() sees ports[port_num].port =3D=3D NULL and returns
-ENODEV. The resulting tty_release() -> gs_close() sees port->port.count =
=3D=3D 1
from the first opener and runs final-close teardown on the active port,
resetting port->port_write_buf, clearing port->port.tty =3D NULL, setting
port->port.count =3D 0, and waking port->close_wait while the first opener
still has the tty open.

> +
> +static void gs_cleanup(struct tty_struct *tty)
> +{
> +	struct gs_port	*port =3D tty->driver_data;
> +
> +	tty_port_put(&port->port);
> +}

[Severity: High]
Can a port free and reallocation between gs_install() and gs_open() cause
gs_cleanup() to free a newly allocated struct gs_port while leaking the
originally installed struct gs_port?

On first open, tty_open() -> tty_open_by_driver() -> tty_init_dev() calls
gs_install(), which locks ports[port_num].lock, takes a reference on the
current port (port1), unlocks ports[port_num].lock, binds tty->port to
&port1->port, and sets tty->driver_data =3D port1.

Before tty_open() invokes gs_open(), neither ports[port_num].lock nor
tty_mutex is held, and port1->port.count is still 0. If gserial_free_line()
runs in this window, wait_event(port->close_wait, gs_closed(port)) in
gserial_free_port() returns immediately because port1->port.count is 0, and
gserial_free_port() drops port1's initial reference. If the line is then
reallocated via gs_port_alloc(), a new struct gs_port (port2) is stored in
ports[port_num].port with kref =3D=3D 1.

When gs_open() then executes, it re-reads ports[port_num].port instead of
using tty->driver_data:

drivers/usb/gadget/function/u_serial.c:gs_open() {
	mutex_lock(&ports[port_num].lock);
	port =3D ports[port_num].port;
	...
	if (port->port.count++)
		goto exit_unlock_port;

	tty->driver_data =3D port;
	port->port.tty =3D tty;
}

This overwrites tty->driver_data with port2 without taking a tty_port
reference on &port2->port, while tty->port remains &port1->port (and
port2->port.itty remains NULL). When the tty is later released, gs_cleanup()
calls tty_port_put(&port->port) on tty->driver_data (port2), dropping
port2's sole reference and freeing port2 via gs_port_destruct() while
ports[port_num].port still points to it, while port1's reference from
gs_install() is never dropped.

[ ... ]

> @@ -1258,8 +1300,7 @@ static void gserial_free_port(struct gs_port *port)
>  	/* wait for old opens to finish */
>  	wait_event(port->close_wait, gs_closed(port));
>  	WARN_ON(port->port_usb !=3D NULL);
> -	tty_port_destroy(&port->port);
> -	kfree(port);
> +	tty_port_put(&port->port);
>  }
> =20
>  void gserial_free_line(unsigned char port_num)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019085855.3259=
716-1-mehmet.fide@gmail.com?part=3D1
