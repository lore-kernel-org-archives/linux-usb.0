Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649183;
	b=1bF975ZXXdBdglSWIe3xB9QuSI6VD9RWszLLmDcz+0cysLe9jK6lwpFjhXVjJkOPkrmA
	 TVG9AAhj7Y78jyF34DTGUVqTjt2+sSpTXz0HMbaUa8fhwfnYzsQVZG37ODgOuRmeofh/N
	 wS4uSVeBFglb5Fa8lbpmmjiQJhbXcx7VbY6YXhTE3Djzggp+m6DTJDt5f35UZRnm03zt+
	 qGOB/yGJHZUUoIq8BOlGjlMqU6uXDHn/4Kqhk11rDeJjuuwWIgOsGTLLdmbKoJig3H021
	 NwkMyNeowLk16Q94NJEq8VV5lsXJ8Ll02//FQsXCz1A0V7YH2sr9UZrJwpwkp1XTFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ke3qGrXUIq3mbZM0UrSgyjlKlkm+IeoLGU4O5RroKBY=;
	b=Pi2VyQHPXRSmAj93FFC7g8FSLejra9PAXtArzGrfHjZLx1T9fBNkAdYjLbqyst42RT8H
	 +PucngXl6sDbu8PZwj9NVLMN/xu5N5FnsPzYR6wRyCxLhXYPWCaDlqYmrAVRBuaHRLJKv
	 ADtSPyLFalDLSGikjbRgJQlOQEdKN0c7tOlSoZj+WPAHuYUQfv/Fr7/WI/uLUGwbVhSuK
	 hlNVYgajv+Y/K3n+iFoI4a5/ybKiargjY41SeV9w5//vVLOGC70/yHbzKzKSI+zPXzXcu
	 zU2WzWqBPC3D/ztTqPDllTUZIQpRXD4xgmxsCIwljIBlVgfaoD0C/WeUJiyBayfIKdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cx73kc8S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062C606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cx73kc8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEBA1F00A16;
	Mon,  2 Nov 2026 19:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649182;
	bh=Ke3qGrXUIq3mbZM0UrSgyjlKlkm+IeoLGU4O5RroKBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cx73kc8SqXiiLIxD0Z20XEd1c/qbqFd/EuEeNNc0cIQc76vPmnhNGiI0oBbbr03ji
	 6hYCXFgKpTl5GOigT8JXwLnyNYyXaQVo5bogvu0Km1/KboQmuG3x5qbpqgowQOG6Yf
	 rki7qneaPkuH+d0Yxv9vII829n30da28h1H+5aTBzrxdYwfBbn5jsdPa6xz9O8YLDo
	 vW2jYc/kbkM9iqE/97o2P4xlq90wRNSQDa8oCi1pjZ7vQmMef2I7DxsvlTys5a4RnQ
	 BRtUpyyUTl8dtzZJfF9+3CBv/swRo8uVHckrPBweJlNp+c4GgxbaQsfjM7r1O9g+Wu
	 vV953N5+ucKWQ==
Message-ID: <sashiko-outbox-194034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: fix gs_port use-after-free on
 open/unbind race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varun Singh" <varun.singh10011@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102193436.6044-1-varun.singh10011@gmail.com>
References: <20261102193436.6044-1-varun.singh10011@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 19:53:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: gadget: u_serial: port_num reuse in gserial_free_line() while=
 tty is open
- [Medium] usb: gadget: u_serial: gs_open() succeeds on removed gs_port
- [Medium] usb: gadget: u_serial: kfifo_alloc() failure in gs_open() hits W=
ARN_ON(1)
--

commit fd523a33aec5b372a5000905654db30970d6bfb6
Author: Varun Singh <varun.singh10011@gmail.com>

usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race

This commit switches struct gs_port lifetime management to use the embedded
tty_port kref via tty_operations .install, .cleanup, and tty_port_operations
.destruct callbacks, and removes the close_wait waitqueue in
gserial_free_port().

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index cdd1dfc666c4f..906137033eca6 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c

[ ... ]

> @@ -610,17 +609,9 @@ static int gserial_wakeup_host(struct gserial *gser)
>   */
>  static int gs_open(struct tty_struct *tty, struct file *file)
>  {
> -	int		port_num =3D tty->index;
> -	struct gs_port	*port;
> +	struct gs_port	*port =3D tty->driver_data;
>  	int		status =3D 0;
> =20
> -	mutex_lock(&ports[port_num].lock);
> -	port =3D ports[port_num].port;
> -	if (!port) {
> -		status =3D -ENODEV;
> -		goto out;
> -	}
> -
>  	spin_lock_irq(&port->port_lock);

[Severity: Medium]
What happens if gserial_free_line() runs after gs_install() drops
ports[port_num].lock in drivers/usb/gadget/function/u_serial.c, but before
tty_open() calls gs_open() (or if an already-open tty is reopened via
tty_reopen() after gserial_free_line() has cleared ports[port_num].port)?

Previously, gs_open() checked ports[port_num].port under ports[port_num].lo=
ck
and returned -ENODEV if the line had been freed. With that check moved only
to gs_install(), gs_install() unlocks ports[port_num].lock before
tty_init_dev() finishes and before tty_open() invokes gs_open():

  tty_open()
    tty_open_by_driver()
      tty_init_dev()
        gs_install()
          mutex_lock(&ports[port_num].lock);
          ...
          mutex_unlock(&ports[port_num].lock);
    gs_open()

If gserial_free_line() runs in that window (or before a tty_reopen()), won't
gs_open() now allocate port->port_write_buf, increment port->port.count, and
return 0 on a gs_port that has already been removed instead of failing with
-ENODEV?

>  	/* allocate circular buffer on first open */
> @@ -629,16 +620,17 @@ static int gs_open(struct tty_struct *tty, struct f=
ile *file)
>  		spin_unlock_irq(&port->port_lock);
> =20
>  		/*
> -		 * portmaster's mutex still protects from simultaneous open(),
> -		 * and close() can't happen, yet.
> +		 * The TTY core holds tty_lock across ->open(), so this is
> +		 * serialised against a simultaneous open() or close() of
> +		 * the same tty.
>  		 */
> =20
>  		status =3D kfifo_alloc(&port->port_write_buf,
>  				     WRITE_BUF_SIZE, GFP_KERNEL);
>  		if (status) {
>  			pr_debug("gs_open: ttyGS%d (%p,%p) no buffer\n",
> -				 port_num, tty, file);
> -			goto out;
> +				 port->port_num, tty, file);
> +			return status;
>  		}

[Severity: Medium]
If kfifo_alloc() fails here on the first open of a port in gs_open() in
drivers/usb/gadget/function/u_serial.c, won't the subsequent error cleanup =
in
tty_open() trigger WARN_ON(1) in gs_close()?

Because gs_install() already set tty->driver_data =3D port, returning an er=
ror
from gs_open() before port->port.count is incremented causes tty_open() to
call tty_release(), which invokes gs_close():

  tty_open()
    gs_install()
      tty->driver_data =3D port;
    gs_open()
      kfifo_alloc() -> fails, port->port.count remains 0
    tty_release()
      gs_close()
        if (port->port.count !=3D 1) {
            if (port->port.count =3D=3D 0)
                WARN_ON(1);

[ ... ]

> @@ -1241,25 +1271,11 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_l=
ine_coding *coding)
>  	return ret;
>  }
> =20
> -static int gs_closed(struct gs_port *port)
> -{
> -	int cond;
> -
> -	spin_lock_irq(&port->port_lock);
> -	cond =3D port->port.count =3D=3D 0;
> -	spin_unlock_irq(&port->port_lock);
> -
> -	return cond;
> -}
> -
>  static void gserial_free_port(struct gs_port *port)
>  {
>  	cancel_delayed_work_sync(&port->push);
> -	/* wait for old opens to finish */
> -	wait_event(port->close_wait, gs_closed(port));
>  	WARN_ON(port->port_usb !=3D NULL);
> -	tty_port_destroy(&port->port);
> -	kfree(port);
> +	tty_port_put(&port->port);
>  }
> =20
>  void gserial_free_line(unsigned char port_num)
> @@ -1276,8 +1292,8 @@ void gserial_free_line(unsigned char port_num)
>  	ports[port_num].port =3D NULL;
>  	mutex_unlock(&ports[port_num].lock);
> =20
> -	gserial_free_port(port);
>  	tty_unregister_device(gs_tty_driver, port_num);
> +	gserial_free_port(port);
>  }

[Severity: High]
Can removing wait_event(port->close_wait, gs_closed(port)) from
gserial_free_port() in drivers/usb/gadget/function/u_serial.c cause a newly
allocated port at the same port_num to attach new opens to the old, orphaned
gs_port?

When a process holds an open file descriptor to /dev/ttyGS0 and the gadget
function is removed via configfs, gserial_free_line() sets
ports[port_num].port =3D NULL and returns immediately while the old tty_str=
uct
(tty_A) is still open and installed in gs_tty_driver->ttys[port_num] (which
is only cleared by release_tty() after the last file descriptor is closed).

If a new gadget serial function is then created while that old file descrip=
tor
is still held open:

1. gserial_alloc_line() -> gs_port_alloc() checks ports[port_num].port, sees
   NULL, allocates a new gs_port (port_B) at the same port_num, and
   re-registers /dev/ttyGS0.

2. When a process opens the new /dev/ttyGS0, tty_open_by_driver() calls
   tty_driver_lookup_tty(), finds the still-installed tty_A in
   gs_tty_driver->ttys[port_num], and takes the tty_reopen() path instead of
   calling tty_init_dev() -> gs_install().

3. tty_open() then calls gs_open(tty_A, filp), which reads
   port =3D tty->driver_data (still pointing to the old port_A), while
   gserial_connect() binds the USB endpoints to port_B in
   ports[port_num].port.

Should port_num reuse or gs_tty_driver->ttys[port_num] teardown be prevented
or synchronized while an existing tty_struct for that line is still active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102193436.6044=
-1-varun.singh10011@gmail.com?part=3D1
