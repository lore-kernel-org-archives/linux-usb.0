Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8369D3AEF4B
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326423; cv=pass; b=XeKMPRHLzgmeg6RBlF+sZEJcv4SJhZvsCOaDRn5qaNIMQOZwva+Q8CU1TawuaSdDDbCBhWiSTCFrb7JR2M/4i6wgmJAh1Lf6W3Ngi8RtVMX2XvIsjjcJM4Sy4LBd7oBzniCw5Ij7rXKnwg729HbkXIF7tGd3QKBWqUF09R1K5Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326423; c=relaxed/simple;
	bh=F5BiOJ4ZVPB0hReR6+QT2X56ER4OblKiNGWmP4G1a1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYr1ejr2g1gn7QqMe5NvyGXmQ7dC/f7bKVj+LaSXdDreR2CGqIPTG4mL4ifOZ1yd0+DvReQzTEmDhlV1X+cVUdJXZSTokQwvJoyHN48XXgxJQXZ2Wfp9nRkO1w1PNpxKZ1fqSluU/x0M+CQFxYD18FXCZtOANoe6fG8dQh5qVNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=hoYAebUA; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="hoYAebUA"
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A1D63F1B9
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 08:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783326407;
	bh=aX1mlmy5SJCEXMM2E6kyGyXqQQFC0bGn2WU2m1EG4V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hoYAebUABnhIcxZfGZEaGgn08RXplte4zv+ozbkASrIWHXwM16jar8y3TB6YEuYtX
	 OH2nopEjhVEGiV/chWjI9rI9dSaFBEprg7mw5KtGA2AuIUAsMtXPKAAwOOGaXEcz62
	 GguxqmRL8+R3yw6ezRXszKR0tO2kaAyLf/k/R6ILgCL9gdJoa5vEKepkEIefTtieAF
	 VTkJuF86EjfTcuJNkgRhpIKmxajARLtLEjmABAvLWfNUeJH3QdEbHcZ2JgQ2wW9lGH
	 QVJFCOcNBZFyDQgYtLaWhpoVyGmYb2QIQWOO76NVd+CVI/R4nAb8A6rTLUG+zc1Bgx
	 DMgbgS661xMIot6o8B7J+AjKycuADvDvMpnnWt4KEnBw/dfRv0Vz5I5GpiSltpgxY+
	 XKUsrafCxskjKWq6JTAqEW9g2Ztx5W6Zlh4vnCFNgGAsI02OuiW7d4gSBngwy20rRE
	 /m0gQX/DpZe39NpHOAWgSbe+pDbCpWDvCbwV1rAQBETpDPaLuoHhXjg4s6gnuJ6Wph
	 RgSxoHWkBVfI/+rQmCCiF4jF/18AgGDXsrWXsBc1FsLIaRWN4YPmdPNqVrUoZKgaRD
	 EijEciVnmwGBNXIXurFVb26QYQwU14pyl3RkP1rqeX5gYI0R00Tf4+pi54bVdUucyu
	 2nuhGE+BZe9audH+5R4fbyzo=
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4767036f8faso1553716f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 01:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783326406; cv=none;
        d=google.com; s=arc-20260327;
        b=jz4LjrF94+OHW5wRxaFxwTJV91KvECAoku0IRYPPfcb5SD88zMIJJdXwCThP1GtPkb
         1QYgu6W3KTFhpm3DOd+4ZO8Df/76ztSzSFIJYoiJx9NiFRkaGAfayK3zSrLy9NHW8Gpz
         x1C2ZFjtYtoARlm84mWqqxkGuTznMlYSU/X4Jj0G5h22uLR9FdxL1pMjsP5jb9AGmYfL
         xMjHvBlwS0lYihJiJKIC8ud+H8FtcWfKTbnfExjY0Z9WXpJTVZT8V8owO3847NCDg+tV
         7D3dto4dun73Ua8xIQyyEDCz5Q0dziiqJeMIES2+KUupay/tDlBLcwDIi5I54mmSPNb5
         42vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=aX1mlmy5SJCEXMM2E6kyGyXqQQFC0bGn2WU2m1EG4V0=;
        fh=DNBMVD7znKc2d5tyHE5t6o9VolVm+1uykfPi9ed7gKA=;
        b=crHMSIfjGJb0BXwvZJ1f1peEZEuVcn/AKkG3qXqFkFCiSTfvgUZSi9FS+544JzHPkh
         TUE2Xe7yOgGX5U3LtGiUi7HvrrFi2eIbvUJe+tukmcQaRBzg10WaeFQij4B/u/2fvc+j
         6TDkB1VRXQDg5dNXdoDe3H67F2jkwZ9LklMRRlHO7yGw+Ffon+oFeK8mzwEeX2WZrX0k
         gZyfrduMbC9Y1OfXECDRXZPIWc6AisgSNHkgn2CBn99mz6sqh9XaMFpkdwX8fdSjVjBN
         ePme9FGO9uiaahIgWKcajIQd9KMeQwqogybTRi9J5Oz6ot3Hfgzu/l10P0sFSw4oEKba
         7dFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326406; x=1783931206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aX1mlmy5SJCEXMM2E6kyGyXqQQFC0bGn2WU2m1EG4V0=;
        b=GeJZAZ4GQx+ufbziDQVvWMjYO6uVRVZ7AighK6EGf5EAQn8ztsG5f3h7YyA2k9KiJc
         ngHbgXg9402wfpmyY5gzuJok1dPQZE5DNPIoQ8opyDArFHPekOHMFdWjkqpjs841UO3w
         RHHee6QplBYGhXIT3vkZQDxCvlY2LlHTVpXaTwgRk2Rk0k8WhdnUGXMjjFDlOV5y4Qav
         OD/9c3FqUFXVgxvgBBFBe1uqLG0XVsz/24qrJWNzetsv8t9jOONq/y5Vjf3fPIBmHshG
         RU8xYoYQrbquYJnTEzLXQhatBxjpZoqUAXqaFArUbPnCuP5ixpeK1cvrg7sV0UL+GAch
         zNTA==
X-Forwarded-Encrypted: i=1; AHgh+RoUvD7Q9alDo4wxQA/xdUkRLUKr5ChJadQhKrYKwqfG3BDL+RfnNwnSM/OcvV9ur1iOEq2aN7xMkYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBagIDWpdJBDLDEr6K8PYgGdwvTRXzXaqlHi+tegKxJnS8TnRt
	J3sRmoAJy5WD8vIXdL88Hym0BsOkLfPGqgQ0v3U9W3aWatzxn6u8WxwkXQrP8c3lcxQzW9K6uwf
	VqOjpXaarcY7wIIqQX8uiuHDCGePevJxqwGw1f1d54H+D3USHVyMbHEVC00DsxkPb3XPyhMLPGZ
	i72IviTtuNGuXn7PqW6SNyNppYpm2HlzZ9HZMbbgN7mBASAFzygvc3
X-Gm-Gg: AfdE7ck0jWuqYOyODrLy/WePlogh6DmVGHBaQA8GKimTj2psaxNQIEmGMsnL6mhrLGz
	8MoFsYXBkJM4S66Ryc6XlVEWVZkGaK1U0mk3oZz7rd3O63qmURciipXCC3nDxdYiCBMNJc7/Pai
	8Z/X9EJmun6g73Op58OrSsjQEbwsLKp06sOmvEzgt2+/0A0Pdfz3XKQkK+9alGkiKNqdb4
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-47aaaec02c4mr7243837f8f.37.1783326406538;
        Mon, 06 Jul 2026 01:26:46 -0700 (PDT)
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id
 ffacd0b85a97d-47aaaec02c4mr7243801f8f.37.1783326405887; Mon, 06 Jul 2026
 01:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326011708.1128840-1-acelan.kao@canonical.com>
 <2026070349-unwound-cavalier-fb60@gregkh> <CAFv23Q=jtz9fYH7zY+ByCOiA_KGNoyCkUh=FJBssqu7D_O0K1w@mail.gmail.com>
 <2026070612-customer-blitz-3e90@gregkh>
In-Reply-To: <2026070612-customer-blitz-3e90@gregkh>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Mon, 6 Jul 2026 16:26:34 +0800
X-Gm-Features: AVVi8CeLGXbfftld7ldm4kySUq67xWtwN_Wjwy19KW0epijiAx2uJm70SH5e-g0
Message-ID: <CAFv23QnXNEhxUh82E5710nmWDp0ZCRQbZB+O_-TdiGzTAPqjKA@mail.gmail.com>
Subject: Re: [PATCH] USB: hub: call ACPI _PRR reset during port power-cycle on
 enumeration failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Kuen-Han Tsai <khtsai@google.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Chenyuan Yang <chenyuan0y@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> =E6=96=BC 2026=E5=B9=B47=E6=
=9C=886=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:38=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jul 06, 2026 at 01:04:19PM +0800, AceLan Kao wrote:
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> =E6=96=BC 2026=E5=B9=B4=
7=E6=9C=883=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:43=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > >
> > > On Thu, Mar 26, 2026 at 09:17:08AM +0800, Chia-Lin Kao (AceLan) wrote=
:
> > > > Some USB-connected devices (e.g. MT7925 Bluetooth on Dell laptops) =
expose
> > > > their hardware reset line via an ACPI Power Resource for Reset (_PR=
R)
> > > > rather than relying solely on VBUS cycling for recovery.  When the =
reset
> > > > GPIO gets stuck low the device stops responding on USB; a VBUS powe=
r-cycle
> > > > alone cannot recover it because the chip remains in reset regardles=
s of
> > > > VBUS state.
> > > >
> > > > Add usb_acpi_port_prr_reset() in usb-acpi.c that, given a hub devic=
e and
> > > > one-based port number, looks up the port's ACPI companion handle, e=
valuates
> > > > _PRR to obtain the power-resource reference, and then calls _RST on=
 that
> > > > reference to toggle the reset line.  The function is a no-op if the=
 port
> > > > has no ACPI handle or no _PRR method, so it is safe to call uncondi=
tionally
> > > > for every port.
> > > >
> > > > Wire it into hub_port_connect() during the mid-retry VBUS power-cyc=
le
> > > > (at (PORT_INIT_TRIES-1)/2 iterations), calling usb_acpi_port_prr_re=
set()
> > > > *after* VBUS goes off and *before* VBUS comes back on.  The orderin=
g is
> > > > critical: on the tested hardware the ACPI _RST method (MBTR._RST) d=
rives
> > > > BT_RST low for 200 ms then high again.  If _RST is called after VBU=
S is
> > > > already restored the GPIO pulse races with device enumeration start=
ing on
> > > > the live bus; the device begins asserting USB signals while still h=
eld in
> > > > reset and enumeration fails.  Performing the reset while the port i=
s
> > > > de-powered ensures the GPIO pulse completes fully before the device=
 is
> > > > given power and time to initialise.
> > > >
> > > > After VBUS is restored, add an msleep(100) conditional on _PRR._RST=
 having
> > > > succeeded.  USB 2.0 spec =C2=A77.1.7.3 (Fig. 7-29) mandates a minim=
um of 100 ms
> > > > between VBUS power-on and the first reset signalling for power sett=
ling.
> > > > On root hubs, hub_power_on_good_delay() returns bPwrOn2PwrGood * 2 =
with
> > > > no minimum floor; on the tested xHCI root hub bPwrOn2PwrGood =3D 10=
, yielding
> > > > only 20 ms =E2=80=94 well below the spec minimum.  (External hubs a=
lready enforce
> > > > a 100 ms minimum via hub_power_on_good_delay().)  When _PRR._RST ha=
s been
> > > > exercised the device must also complete its full power-on sequence =
(GPIO
> > > > de-assertion, internal oscillator start, firmware load) before USB
> > > > enumeration begins.  The 100 ms sleep enforces the spec minimum and=
 gives
> > > > the device adequate settling time.
> > > >
> > > > Tested on a Dell laptop with MT7925 Bluetooth (idVendor=3D0489,
> > > > idProduct=3De139) whose BT_RST GPIO was stuck low.  With this fix t=
he
> > > > device recovers autonomously at boot without requiring a G3
> > > > (mechanical power-off) cycle.  The relevant dmesg sequence:
> > > >
> > > >   [    1.448491] usb 3-10: new high-speed USB device number 4 using=
 xhci_hcd
> > > >   [    6.813942] usb 3-10: device descriptor read/64, error -110
> > > >   [   22.685978] usb 3-10: device descriptor read/64, error -110
> > > >   [   22.901715] usb 3-10: new high-speed USB device number 5 using=
 xhci_hcd
> > > >   [   28.317963] usb 3-10: device descriptor read/64, error -110
> > > >   [   44.189949] usb 3-10: device descriptor read/64, error -110
> > > >   [   44.294065] usb usb3-port10: attempt power cycle
> > > >   [   44.872709] usb 3-10: new high-speed USB device number 6 using=
 xhci_hcd
> > > >   [   44.888293] usb 3-10: New USB device found, idVendor=3D0489, i=
dProduct=3De139, bcdDevice=3D 1.00
> > > >   [   44.888318] usb 3-10: Manufacturer: MediaTek Inc.
> > > >
> > > > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > > > ---
> > > >  drivers/usb/core/hub.c      | 14 ++++++++
> > > >  drivers/usb/core/usb-acpi.c | 68 +++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/usb/core/usb.h      |  3 ++
> > > >  3 files changed, 85 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > > index 24960ba9caa91..1740e96f73cc6 100644
> > > > --- a/drivers/usb/core/hub.c
> > > > +++ b/drivers/usb/core/hub.c
> > > > @@ -5603,11 +5603,25 @@ static void hub_port_connect(struct usb_hub=
 *hub, int port1, u16 portstatus,
> > > >
> > > >               /* When halfway through our retry count, power-cycle =
the port */
> > > >               if (i =3D=3D (PORT_INIT_TRIES - 1) / 2) {
> > > > +                     int prr_reset;
> > > > +
> > > >                       dev_info(&port_dev->dev, "attempt power cycle=
\n");
> > > >                       usb_hub_set_port_power(hdev, hub, port1, fals=
e);
> > > >                       msleep(2 * hub_power_on_good_delay(hub));
> > > > +                     prr_reset =3D usb_acpi_port_prr_reset(hdev, p=
ort1);
> > > >                       usb_hub_set_port_power(hdev, hub, port1, true=
);
> > > >                       msleep(hub_power_on_good_delay(hub));
> > > > +                     /*
> > > > +                      * USB 2.0 spec =C2=A77.1.7.3 requires at lea=
st 100 ms
> > > > +                      * between VBUS power-on and the first reset =
for power
> > > > +                      * settling.  hub_power_on_good_delay() on an=
 xHCI root
> > > > +                      * hub returns bPwrOn2PwrGood * 2 with no min=
imum floor,
> > > > +                      * which can be as little as 20 ms.  When _PR=
R _RST was
> > > > +                      * also exercised the device must complete it=
s power-on
> > > > +                      * sequence before enumeration; enforce the s=
pec minimum.
> > > > +                      */
> > > > +                     if (prr_reset =3D=3D 0)
> > > > +                             msleep(100);
> > > >               }
> > > >       }
> > > >       if (hub->hdev->parent ||
> > > > diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acp=
i.c
> > > > index 489dbdc96f94a..ee62e3fd8e3a1 100644
> > > > --- a/drivers/usb/core/usb-acpi.c
> > > > +++ b/drivers/usb/core/usb-acpi.c
> > > > @@ -142,6 +142,74 @@ int usb_acpi_set_power_state(struct usb_device=
 *hdev, int index, bool enable)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
> > > >
> > > > +/**
> > > > + * usb_acpi_port_prr_reset - issue an ACPI _PRR reset on a hub por=
t
> > > > + * @hdev: USB device belonging to the usb hub
> > > > + * @port1: port number (one-based)
> > > > + *
> > > > + * Some devices expose their hardware reset line via an ACPI Power=
 Resource for
> > > > + * Reset (_PRR).  When such a device fails to enumerate (e.g. beca=
use the reset
> > > > + * GPIO is stuck low), the USB power-cycle alone is not enough; th=
e firmware
> > > > + * reset path must also be exercised.
> > > > + *
> > > > + * This function evaluates _PRR on the port's ACPI companion to ob=
tain the
> > > > + * power-resource reference and then calls _RST on that resource t=
o toggle the
> > > > + * reset line.  It is intended to be called alongside the mid-retr=
y VBUS
> > > > + * power-cycle already performed by hub_port_connect().
> > > > + *
> > > > + * Returns 0 on success, -ENODEV if the port has no ACPI handle or=
 no _PRR
> > > > + * method, or a negative error code on failure.
> > > > + */
> > > > +int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1)
> > > > +{
> > > > +     acpi_handle port_handle;
> > > > +     struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > > > +     union acpi_object *pkg, *ref;
> > > > +     acpi_status status;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     port_handle =3D usb_get_hub_port_acpi_handle(hdev, port1);
> > > > +     if (!port_handle)
> > > > +             return -ENODEV;
> > > > +
> > > > +     if (!acpi_has_method(port_handle, "_PRR"))
> > > > +             return -ENODEV;
> > > > +
> > > > +     status =3D acpi_evaluate_object(port_handle, "_PRR", NULL, &b=
uffer);
> > > > +     if (ACPI_FAILURE(status)) {
> > > > +             dev_dbg(&hdev->dev, "port%d: _PRR evaluation failed: =
%s\n",
> > > > +                     port1, acpi_format_exception(status));
> > > > +             return -ENODEV;
> > > > +     }
> > > > +
> > > > +     pkg =3D buffer.pointer;
> > > > +     if (!pkg || pkg->type !=3D ACPI_TYPE_PACKAGE || pkg->package.=
count < 1) {
> > > > +             dev_dbg(&hdev->dev, "port%d: _PRR returned unexpected=
 object\n",
> > > > +                     port1);
> > > > +             ret =3D -EINVAL;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     ref =3D &pkg->package.elements[0];
> > > > +     if (ref->type !=3D ACPI_TYPE_LOCAL_REFERENCE || !ref->referen=
ce.handle) {
> > > > +             dev_dbg(&hdev->dev, "port%d: _PRR element is not a re=
ference\n",
> > > > +                     port1);
> > > > +             ret =3D -EINVAL;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     status =3D acpi_evaluate_object(ref->reference.handle, "_RST"=
, NULL, NULL);
> > > > +     if (ACPI_FAILURE(status)) {
> > > > +             dev_dbg(&hdev->dev, "port%d: _RST evaluation failed: =
%s\n",
> > > > +                     port1, acpi_format_exception(status));
> > > > +             ret =3D -EIO;
> > > > +     }
> > > > +
> > > > +out:
> > > > +     kfree(buffer.pointer);
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  /**
> > > >   * usb_acpi_add_usb4_devlink - add device link to USB4 Host Interf=
ace for tunneled USB3 devices
> > > >   *
> > > > diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> > > > index a9b37aeb515be..4d3dc3bd881b2 100644
> > > > --- a/drivers/usb/core/usb.h
> > > > +++ b/drivers/usb/core/usb.h
> > > > @@ -211,7 +211,10 @@ extern int usb_acpi_register(void);
> > > >  extern void usb_acpi_unregister(void);
> > > >  extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device =
*hdev,
> > > >       int port1);
> > > > +extern int usb_acpi_port_prr_reset(struct usb_device *hdev, int po=
rt1);
> > > >  #else
> > > >  static inline int usb_acpi_register(void) { return 0; };
> > > >  static inline void usb_acpi_unregister(void) { };
> > > > +static inline int usb_acpi_port_prr_reset(struct usb_device *hdev,
> > > > +                                       int port1) { return -ENODEV=
; }
> > > >  #endif
> > > > --
> > > > 2.53.0
> > > >
> > > >
> > >
> > > Please see the review comments at:
> > >         https://sashiko.dev/#/patchset/20260326011708.1128840-1-acela=
n.kao@canonical.com
> >
> > Thanks Greg.
> >
> > Went through the sashiko review. The single finding claims
> > usb_acpi_port_prr_reset() should iterate every element of the _PRR
> > package and call _RST on each. That's based on a misreading of _PRR.
> >
> > Per ACPI 6.4 =C2=A77.3.26 (_PRR, Power Resource for Reset):
> >
> >   "This object evaluates to a single reference to a power resource. ...
> >    Return Value: A single element Package containing a Reference to the
> >    power reset resource."
> >
> > _PRR is a fixed single-element package, not a variable-length list.
> > ACPICA encodes this in acpredef.h as ACPI_PTYPE1_FIXED with 1 reference
> > (as opposed to _PR0/_PR1/_PR2/_PR3, which are ACPI_PTYPE1_VAR reference
> > lists -- I suspect that's the source of the confusion). The "reset must
> > affect all ACPI-described devices that reference it" wording in the _RS=
T
> > description refers to the devices sharing that one power resource, not =
to
> > multiple resources in the package.
> >
> > The two existing in-tree _PRR/_RST users take elements[0] and call _RST
> > on it exactly as this patch does:
> >
> >   - drivers/bluetooth/btintel.c: btintel_acpi_reset_method()
> >   - drivers/net/.../iwlwifi/pcie/gen1_2/trans.c: iwl_trans_pcie_call_re=
set()
> >
> > Both are in fact stricter -- they reject package.count !=3D 1, whereas =
I
> > accept count >=3D 1 and use the first element. Happy to tighten my chec=
k
> > from "< 1" to "!=3D 1" to match that precedent and make the single-elem=
ent
> > invariant explicit, but there's no functional issue here.
>
> This is going to require a review from the ACPI maintainer that this is
> the correct thing to be doing, no matter which way it ends up.  So
> please submit a new version and cc: those developers (and tighten up
> your cc: list as well to only those that are relevant.)
v2 is submitted -
https://lore.kernel.org/lkml/20260706080117.3754550-1-acelan.kao@canonical.=
com/

>
> thanks,
>
> greg k-h
