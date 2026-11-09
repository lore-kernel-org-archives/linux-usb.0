Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234824;
	b=i5iozLuapgdSrVSsrBZxmc+qMA8XxsaMVZVCjNUDJusswOKn+AqFhAHk6iRhO7Yg60fs
	 L2xd8Tqs7Uo6tafs+t1OSMrRCuwmeVvSMzVoqE2pqodHvCi1QlklGLCAf4Qv3C0VX/r9w
	 aFHOf2Ei0JsmoMP0DgCmtr/rIYldjitR6+0mjGiaQN0a22Ipecx3jY27GTx2f5ybHY2bW
	 W7i02m3h1Wb9LsiRFiRZmF7YVDeFJNkElEDmOiVPBME8trZEBEc+wHOnOGVVbgj9TUs+7
	 cEXlvLz/IOyHENqdDSphUh+Q91vf4+zLOOThvWOBE0DZXxwHBOw3xRGZ/CLOGni5ccw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZBTdSXjoB0i/wDPeK2YIB9vTqWacmntHAbc6C/R0FMY=;
	b=BfwOm/4bqgyd/qMU3xw+ISHeQOWpNGX7kcE+YBzW4YuU4Q4qCkGZbPzZNIvOfQ5fkVWt
	 PfA9BtMPRSt6xYEoodryjofaRZBwl6czN+s8rROXQmc4hMGTTD5s9GS3bMeKksxzwUJec
	 tyv0LyTh3ovnpPoTo9zDfj15cGQUTAEr+q1JjTPeiQUM5umznnraDpw/10v1RhhCt3fno
	 kGd/s1Fh//HOs4r6xPaCL+cCXPy73Tegf5zzS28o66OvlaFiXdO+iOglBnWxtJsxoCwDA
	 emRu/zDBZmNOb2NohgxJtDLGSW0PGVshR9nLx0xLy+DWiI+ZOuaKNWYk44SmVAWIvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4nESAEu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC62606A336
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4nESAEu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE401F008A1;
	Mon,  9 Nov 2026 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234824;
	bh=ZBTdSXjoB0i/wDPeK2YIB9vTqWacmntHAbc6C/R0FMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4nESAEuninYEfDm+k3yz4Zdaljjxph7UKfHFm/EgEB+ZAv1VUf/aksF0cSLUxo6R
	 p37Nw+zGSP5knjcce9CN6zlk4tCN1f9c6O8r32z+1AzlQU7h56XuHS96b3CQCMYDA0
	 J0mZNFx/W9o18FQUysnG0TKK0jdT4HlQ41+j9oxQtMoGV+2zhUmZRfSEDs+yE6srcq
	 baJE7R5CVc4+GE+HcDhJD47Hsw8bAoRYYwagEqLOosTHCGeAFHLtleLqCv9jw1SyhZ
	 BGvWpF1pRj913EQGqV1uD4Kt24H+6g+Jso6ZJVpK9Axf5HV+rkNtOKPXL7c+juKpQB
	 XU4LDNXM+q/ZA==
Message-ID: <sashiko-outbox-205111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: gadget: u_serial: fix gs_port
 use-after-free on open/unbind race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varun Singh" <varun.singh10011@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109141110.3538-3-varun.singh10011@gmail.com>
References: <20261109141110.3538-1-varun.singh10011@gmail.com>
 <20261109141110.3538-3-varun.singh10011@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 14:33:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: gadget: u_serial: tty_struct UAF in gserial_free_line()
  via vhangup
- [High] usb: gadget: u_serial: premature teardown in gs_close() on
  failed reopen
- [Medium] usb: gadget: u_serial: stale tty in ttys[] blocks open after
  line reuse
--

commit ce18206b8942dfa93fb6a098764986e87bedbf4e
Author: Varun Singh <varun.singh10011@gmail.com>

usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race

This commit switches gs_port lifetime management to the embedded tty_port
kref via tty_operations.install and .cleanup callbacks, removes the
close_wait synchronization in gserial_free_port(), and hangs up the port in
gserial_free_line() when tearing down a serial line.

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index e172050f13927..f279a2c6507c6 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c

[ ... ]

> @@ -615,8 +614,9 @@ static int gs_open(struct tty_struct *tty, struct fil=
e *file)
>  	int		status =3D 0;
> =20
>  	mutex_lock(&ports[port_num].lock);
> +	/* Reject opens on a removed port, or a stale tty after line reuse. */
>  	port =3D ports[port_num].port;
> -	if (!port) {
> +	if (!port || port !=3D tty->driver_data) {
>  		status =3D -ENODEV;
>  		goto out;
>  	}

[Severity: Medium]
If a line is freed and reallocated while a process still holds an open file
descriptor from the previous instance, does this check make the newly
registered /dev/ttyGS* device unopenable until the old descriptor is closed?

tty_port_tty_vhangup() marks the old tty_struct as hung up and kills its
line discipline, but it does not remove the tty_struct from
gs_tty_driver->ttys[port_num]; only release_tty() clears that slot when the
last open file descriptor is closed.  When gserial_alloc_line() reuses
port_num in the meantime, any new open() on /dev/ttyGS* finds the old
tty_struct in gs_tty_driver->ttys[port_num] via tty_driver_lookup_tty() and
calls tty_reopen() instead of gs_install().  Because tty->driver_data still
points to the old gs_port while ports[port_num].port points to the new one,
every open() on the new device fails with -ENODEV, and tty_reopen() also
reinitializes an active line discipline on the hung-up tty_struct via
tty_ldisc_reinit() that remains attached until the old file descriptor is
closed.

[ ... ]

> @@ -693,15 +692,14 @@ static int gs_close_flush_done(struct gs_port *p)
>  static void gs_close(struct tty_struct *tty, struct file *file)
>  {
>  	struct gs_port *port =3D tty->driver_data;
> -	struct gserial	*gser;
> +	struct gserial *gser;
> =20
>  	spin_lock_irq(&port->port_lock);
> =20
>  	if (port->port.count !=3D 1) {
>  raced_with_open:
> -		if (port->port.count =3D=3D 0)
> -			WARN_ON(1);
> -		else
> +		/* A failed open can still reach ->close() with a zero count. */
> +		if (port->port.count)
> +			--port->port.count;
>  		goto exit;
>  	}

[Severity: High]
Can a failed reopen in gs_open() decrement port->port.count or run final
close teardown in gs_close() while another process still has the port open?

When gs_open() returns -ENODEV before incrementing port->port.count,
tty_open() calls tty_release() -> gs_close().  If another process already
holds an open file descriptor on the same tty, port->port.count is at least
1 when the second opener takes tty_reopen() and fails in gs_open():

CPU0 (process A)                  CPU1 (process B)
tty_open()
  gs_install()
  gs_open()
    port->port.count++ (now 1)
                                  gserial_free_line()
                                    ports[port_num].port =3D NULL
                                  tty_open()
                                    tty_reopen()
                                    gs_open()
                                      returns -ENODEV
                                    tty_release()
                                      gs_close()
                                        /* port->port.count =3D=3D 1 */
                                        kfifo_free(&port->port_write_buf)
                                        port->port.count =3D 0
                                        port->port.tty =3D NULL
                                  gserial_free_line() continues:
                                    tty_port_tty_vhangup()
                                      /* port->port.tty is NULL, skips */
gs_write() / gs_put_char()
  kfifo_put(&port->port_write_buf, ...)  <-- NULL pointer dereference

If port->port.count was greater than 1, the failed reopen decrements an
active opener's count; if port->port.count was 1, gs_close() frees
port_write_buf and clears port->port.tty while process A's descriptor is
still open, preventing tty_port_tty_vhangup() from hanging up process A's
tty and causing subsequent writes to dereference a NULL kfifo buffer.

[ ... ]

> @@ -1277,6 +1302,13 @@ void gserial_free_line(unsigned char port_num)
>  	tty_unregister_device(gs_tty_driver, port_num);
>  	mutex_unlock(&ports[port_num].lock);
> =20
> +	/*
> +	 * Hang up the tty before the line can be reused. Drop
> +	 * ports[port_num].lock first: it takes tty_lock, which gs_install()
> +	 * already holds when it acquires that mutex.
> +	 */
> +	tty_port_tty_vhangup(&port->port);
> +
>  	gserial_free_port(port);
>  }
>  EXPORT_SYMBOL_GPL(gserial_free_line);

[Severity: High]
Can tty_port_tty_vhangup() race with gs_close() and cause a use-after-free
and double free of struct tty_struct?

tty_port_tty_vhangup() calls tty_port_tty_get(), which locks port->port.lock
(struct tty_port::lock) and calls tty_kref_get(port->tty), assuming
port->tty holds a reference via tty_port_tty_set().  However, u_serial never
calls tty_port_tty_set(): gs_open() assigns port->port.tty =3D tty without
taking a kref, and gs_close() clears port->port.tty =3D NULL under
port->port_lock (struct gs_port::port_lock) rather than port->port.lock.

When gserial_free_line() races with the final close of /dev/ttyGS*:

CPU0                              CPU1
tty_release()                     gserial_free_line()
  gs_close()                        tty_port_tty_vhangup(&port->port)
    spin_lock_irq(&port->port_lock)   tty_port_tty_get(&port->port)
                                        spin_lock_irqsave(&port->port.lock)
                                        /* reads non-NULL port->port.tty */
    port->port.tty =3D NULL
    spin_unlock_irq(&port->port_lock)
  tty_release_struct()
    release_tty()
      tty_kref_put(tty) -> 0
                                        tty_kref_get(tty)  <-- refcount 0->1
                                      tty_vhangup(tty)     <-- use-after-fr=
ee
                                      tty_kref_put(tty)    <-- double free

Using tty_port_tty_set() in gs_open() and gs_close() would maintain the tty
kref and serialize port->port.tty updates under port->port.lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109141110.3538=
-1-varun.singh10011@gmail.com?part=3D2
