Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576B171CD
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 05:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314283; cv=pass; b=lQ46SctM3ncrAZCqrUGesgTqpjJazBsMWsUv0CW9b30r2inQIoOX47t53LXMu8Nmi16UuUowtvXtd+c9lf24i9xmdq8BJfNdYHfTIVagrQhnwFyHGDvdrgAgkCIHY+fjcJX0iB4WRfxFvszyGqs6XPGtamdxJ+Sr0oYpJr23v4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314283; c=relaxed/simple;
	bh=7VjnTOkE2DWr8ceJBPiE83WQESE+7EJZsIUBCWqFYOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dY8LUNmlVK9qbCcTzh/oDF6Hk85jPg1eSAx+v02MpvrE8Ss3UWxDgu2XO0pewq+6gBa/SybmW6Q+zBplYiwzhjUKWVKgbFx7akw9vtK/PwWPCPZqeEhBYn54m9ODAlbBc4L75czxX8Lo9x0elUhB4kDsHZmSVnka06XOi61J3p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LYhxGaVw; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LYhxGaVw"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 694423F174
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 05:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783314272;
	bh=K8kU3pkMqrPj7n2+CgUCBlmBs0hPfMAw7hsyrRPmdWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LYhxGaVwFsQ51rlt3UbwmzQNZLwan3xTCOFZXPIFxY9dWdQ4TZg0UPIqdLjJnfM5D
	 Ly8BrlyGFGyfmPDmLiFqTf3eW9lWEy5xQNuDPUVQn/JMTIVsn3i00zJVvKLglHnkpd
	 5yTS+4cTmK7IsbWuXikgAD/q/IexFF7mOsU6qQ0wBAsng9e1ua2nuQgEKGXv1WUKRv
	 0bF/M7PLGSRTgVWSrjAGFFKapoi/UF17qu07m9RR+UY1yhuEkDfmoYLBm6+CBdPoRu
	 sAdqptuS1pLZ1gAxqPwHk6IA03G8VYZLUmZ5/mg5y11Nrjr+59eLAAHNS86AO07ZJw
	 wVa0t3rcSZtN3n3rKYDNxtzNqqLMo6b6dJZImSSmawLD1o7yHDnWDZPSrP0CtnKP3l
	 Lnwwv7EjPCWh35TzjwFJicUjakYX3OWUPzw2oVSKLFhsw22mh61P2GUOifG32TJAjI
	 kH25SPeWt5Ia0kH9Ep67COqF1xWMzv42rVn+599/8BdNjvlu2UaJcc9Blw7mO4jmRN
	 bGw4R5d1hWlVelEfbMSZJ9mIaPjEfp/d/in7OL2dNApTpoxHeLoG9apODkDUmvTKEc
	 Uuvu1QVDMMt/v+WRruwVjVO1p180u3t7fdCV0bKcAy+SBm3QMKASt1P4KoGDAlEaE0
	 xjlhocRTrj+lIAlZY7cmrJ5Y=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4784d0fb9cfso1250474f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 22:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783314272; cv=none;
        d=google.com; s=arc-20260327;
        b=rxvX7GYjJjCx4pS56KAoTlV8hEA0xO/VYx7LrhSyr/0vDj7RiyZLn8BYBgkJEYhX52
         8AZnJpPJr1RdF7nUtIr5mzSMjZPPXcpbBR7jvaPr9z3jbUy81f+xIJ0nWc0NqnrqggRU
         7cvjO/a9G64yPBMnWWg5LONDw393r5xRnzBFoVswzQbXhTa0SFT7x3N1IuGBmO5tZUT0
         m1GWEk2sDhGzJfMqcBv09VB3IbeNd+2gk4n63jzbHvyDJhM1SAlSndJDmfd0WYJAmpdV
         dAg40k1R+zDrJlJnBKfAMiWtCCm5K7AJf77cx96ImkXur1t+C3p7b5An7NbN8MRP3DbU
         rFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=K8kU3pkMqrPj7n2+CgUCBlmBs0hPfMAw7hsyrRPmdWY=;
        fh=Tv/uGjeHS+a+pL+RB7C9X81xhwdhu0p39b6G8qS8oQo=;
        b=sJ/+HVrU2ohtiY3a0xyH/jv8kL1Uzj/+QT8jlrlnCI4u0cmJQUe+sD0n0l8llpj0D5
         hFsunFAS6CAl8aZmOc1w7L53+IfoHusdQg/CitO2IlWeAv9SySYM3KyQyigGpgTGxRaX
         5fno3UTjsnbiOrEmphNsEGNdtioOgCWi+/wVoL+kg1w3tpErcWWB+U6HQE69aB2RVzau
         d8E4+6Fh54w+ShMs4JOz2fce0o5BrBCGXBBkzbkG9Gb2/cr0WUdgZQtExGeuQMMi6bBU
         0G7r3Gzf7Ow5ZST1CZ0alclpX53Q2rdmbu7P2CHBSxsDvvcvaXRO2NS0EbOUJ0V3knrX
         CGMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783314272; x=1783919072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K8kU3pkMqrPj7n2+CgUCBlmBs0hPfMAw7hsyrRPmdWY=;
        b=R4CvhdpZX7KAWYN+6SUKyidhXkKI1rbiyj243HOTuhs7ibOcZgh5gzAbfC6tw590p/
         ZktVvHpqMbU6hhoUSAg8bsYul3E13M9o0JpzCp0sYRjP49//uvLyP54xgn5meIBw63BB
         3Xd7OA3GenD9tJVb6hcqjFhXR2pQpl+3rAO2NR2HN6o7zjZSQz5f/wWLGRjPjm2r1ujH
         VGc9Lwe7cMYsYAasuEXUQCNoH/qF+nzqVQRu3Mv8whpk5HfD7qzwG20R/uvvGzE7lf0k
         pF+fx14fLDcSJVe92uSTlGw929ZJOpya3FABhGcIlXhxNfpxZhVR1rJxRlGTykFRhGDX
         pjDw==
X-Forwarded-Encrypted: i=1; AHgh+RoQ/8BmlQxtTM3Fb/Eg44Eh9Zjof7nGmLDBPwkbRAriuxw+zvTChRhjcYXuGg3wl5p6s9iGEWF6x/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUIIo9kz16x3BjulHV4hhzXzZmBZPIiZKn8LBsnRPT+mpJUHYj
	6ETxhlehazJ0A7DPfvzWMjGBLRegNp1smTfy8Ck9gOGlMh7Q0FhkBhqVJ0e1xjTgJ2OzpzSCo8l
	dfsIr1M7FS+XFJX4Dpz3T6lmlel0QnFgZnpAtwYtS1Mc61UQDDCErchowVkcdeTs6IqcBJ6UsnV
	kJglW2lj600liwm8MvOJeCpslL1I7Ib7wcI3/9NHCPRVQidYYwFrnj
X-Gm-Gg: AfdE7ckT7rFBK5j3Icgnja9+S+Ty/hrRY8TpvxPy6cAmiAUuSoBfNGTunaj0ZjuF8Xs
	GtZyCpzIz1voqa373Q8dyfg3yhPO/l2whpCGUBnUj0MlQxPeus6RVRLcgZ49hroJ+vZ24q3vNQb
	+SuftLzNZNvIE3sAt5VPejsYLGvypvDdHTQMUnwokTZcbkMUi83WBWZY+N/GBFWVEWOyRZ
X-Received: by 2002:a05:6000:250f:b0:477:6da:1b6f with SMTP id ffacd0b85a97d-47aab393501mr10623094f8f.23.1783314271875;
        Sun, 05 Jul 2026 22:04:31 -0700 (PDT)
X-Received: by 2002:a05:6000:250f:b0:477:6da:1b6f with SMTP id
 ffacd0b85a97d-47aab393501mr10623062f8f.23.1783314271433; Sun, 05 Jul 2026
 22:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326011708.1128840-1-acelan.kao@canonical.com> <2026070349-unwound-cavalier-fb60@gregkh>
In-Reply-To: <2026070349-unwound-cavalier-fb60@gregkh>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Mon, 6 Jul 2026 13:04:19 +0800
X-Gm-Features: AVVi8CdBR-5Hlxfms-RqEz9M33XkpNX5dWh848tkiak_HG3Ey-Y6xjr4YTEsLm4
Message-ID: <CAFv23Q=jtz9fYH7zY+ByCOiA_KGNoyCkUh=FJBssqu7D_O0K1w@mail.gmail.com>
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
=9C=883=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:43=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Mar 26, 2026 at 09:17:08AM +0800, Chia-Lin Kao (AceLan) wrote:
> > Some USB-connected devices (e.g. MT7925 Bluetooth on Dell laptops) expo=
se
> > their hardware reset line via an ACPI Power Resource for Reset (_PRR)
> > rather than relying solely on VBUS cycling for recovery.  When the rese=
t
> > GPIO gets stuck low the device stops responding on USB; a VBUS power-cy=
cle
> > alone cannot recover it because the chip remains in reset regardless of
> > VBUS state.
> >
> > Add usb_acpi_port_prr_reset() in usb-acpi.c that, given a hub device an=
d
> > one-based port number, looks up the port's ACPI companion handle, evalu=
ates
> > _PRR to obtain the power-resource reference, and then calls _RST on tha=
t
> > reference to toggle the reset line.  The function is a no-op if the por=
t
> > has no ACPI handle or no _PRR method, so it is safe to call uncondition=
ally
> > for every port.
> >
> > Wire it into hub_port_connect() during the mid-retry VBUS power-cycle
> > (at (PORT_INIT_TRIES-1)/2 iterations), calling usb_acpi_port_prr_reset(=
)
> > *after* VBUS goes off and *before* VBUS comes back on.  The ordering is
> > critical: on the tested hardware the ACPI _RST method (MBTR._RST) drive=
s
> > BT_RST low for 200 ms then high again.  If _RST is called after VBUS is
> > already restored the GPIO pulse races with device enumeration starting =
on
> > the live bus; the device begins asserting USB signals while still held =
in
> > reset and enumeration fails.  Performing the reset while the port is
> > de-powered ensures the GPIO pulse completes fully before the device is
> > given power and time to initialise.
> >
> > After VBUS is restored, add an msleep(100) conditional on _PRR._RST hav=
ing
> > succeeded.  USB 2.0 spec =C2=A77.1.7.3 (Fig. 7-29) mandates a minimum o=
f 100 ms
> > between VBUS power-on and the first reset signalling for power settling=
.
> > On root hubs, hub_power_on_good_delay() returns bPwrOn2PwrGood * 2 with
> > no minimum floor; on the tested xHCI root hub bPwrOn2PwrGood =3D 10, yi=
elding
> > only 20 ms =E2=80=94 well below the spec minimum.  (External hubs alrea=
dy enforce
> > a 100 ms minimum via hub_power_on_good_delay().)  When _PRR._RST has be=
en
> > exercised the device must also complete its full power-on sequence (GPI=
O
> > de-assertion, internal oscillator start, firmware load) before USB
> > enumeration begins.  The 100 ms sleep enforces the spec minimum and giv=
es
> > the device adequate settling time.
> >
> > Tested on a Dell laptop with MT7925 Bluetooth (idVendor=3D0489,
> > idProduct=3De139) whose BT_RST GPIO was stuck low.  With this fix the
> > device recovers autonomously at boot without requiring a G3
> > (mechanical power-off) cycle.  The relevant dmesg sequence:
> >
> >   [    1.448491] usb 3-10: new high-speed USB device number 4 using xhc=
i_hcd
> >   [    6.813942] usb 3-10: device descriptor read/64, error -110
> >   [   22.685978] usb 3-10: device descriptor read/64, error -110
> >   [   22.901715] usb 3-10: new high-speed USB device number 5 using xhc=
i_hcd
> >   [   28.317963] usb 3-10: device descriptor read/64, error -110
> >   [   44.189949] usb 3-10: device descriptor read/64, error -110
> >   [   44.294065] usb usb3-port10: attempt power cycle
> >   [   44.872709] usb 3-10: new high-speed USB device number 6 using xhc=
i_hcd
> >   [   44.888293] usb 3-10: New USB device found, idVendor=3D0489, idPro=
duct=3De139, bcdDevice=3D 1.00
> >   [   44.888318] usb 3-10: Manufacturer: MediaTek Inc.
> >
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/usb/core/hub.c      | 14 ++++++++
> >  drivers/usb/core/usb-acpi.c | 68 +++++++++++++++++++++++++++++++++++++
> >  drivers/usb/core/usb.h      |  3 ++
> >  3 files changed, 85 insertions(+)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 24960ba9caa91..1740e96f73cc6 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -5603,11 +5603,25 @@ static void hub_port_connect(struct usb_hub *hu=
b, int port1, u16 portstatus,
> >
> >               /* When halfway through our retry count, power-cycle the =
port */
> >               if (i =3D=3D (PORT_INIT_TRIES - 1) / 2) {
> > +                     int prr_reset;
> > +
> >                       dev_info(&port_dev->dev, "attempt power cycle\n")=
;
> >                       usb_hub_set_port_power(hdev, hub, port1, false);
> >                       msleep(2 * hub_power_on_good_delay(hub));
> > +                     prr_reset =3D usb_acpi_port_prr_reset(hdev, port1=
);
> >                       usb_hub_set_port_power(hdev, hub, port1, true);
> >                       msleep(hub_power_on_good_delay(hub));
> > +                     /*
> > +                      * USB 2.0 spec =C2=A77.1.7.3 requires at least 1=
00 ms
> > +                      * between VBUS power-on and the first reset for =
power
> > +                      * settling.  hub_power_on_good_delay() on an xHC=
I root
> > +                      * hub returns bPwrOn2PwrGood * 2 with no minimum=
 floor,
> > +                      * which can be as little as 20 ms.  When _PRR _R=
ST was
> > +                      * also exercised the device must complete its po=
wer-on
> > +                      * sequence before enumeration; enforce the spec =
minimum.
> > +                      */
> > +                     if (prr_reset =3D=3D 0)
> > +                             msleep(100);
> >               }
> >       }
> >       if (hub->hdev->parent ||
> > diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> > index 489dbdc96f94a..ee62e3fd8e3a1 100644
> > --- a/drivers/usb/core/usb-acpi.c
> > +++ b/drivers/usb/core/usb-acpi.c
> > @@ -142,6 +142,74 @@ int usb_acpi_set_power_state(struct usb_device *hd=
ev, int index, bool enable)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
> >
> > +/**
> > + * usb_acpi_port_prr_reset - issue an ACPI _PRR reset on a hub port
> > + * @hdev: USB device belonging to the usb hub
> > + * @port1: port number (one-based)
> > + *
> > + * Some devices expose their hardware reset line via an ACPI Power Res=
ource for
> > + * Reset (_PRR).  When such a device fails to enumerate (e.g. because =
the reset
> > + * GPIO is stuck low), the USB power-cycle alone is not enough; the fi=
rmware
> > + * reset path must also be exercised.
> > + *
> > + * This function evaluates _PRR on the port's ACPI companion to obtain=
 the
> > + * power-resource reference and then calls _RST on that resource to to=
ggle the
> > + * reset line.  It is intended to be called alongside the mid-retry VB=
US
> > + * power-cycle already performed by hub_port_connect().
> > + *
> > + * Returns 0 on success, -ENODEV if the port has no ACPI handle or no =
_PRR
> > + * method, or a negative error code on failure.
> > + */
> > +int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1)
> > +{
> > +     acpi_handle port_handle;
> > +     struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +     union acpi_object *pkg, *ref;
> > +     acpi_status status;
> > +     int ret =3D 0;
> > +
> > +     port_handle =3D usb_get_hub_port_acpi_handle(hdev, port1);
> > +     if (!port_handle)
> > +             return -ENODEV;
> > +
> > +     if (!acpi_has_method(port_handle, "_PRR"))
> > +             return -ENODEV;
> > +
> > +     status =3D acpi_evaluate_object(port_handle, "_PRR", NULL, &buffe=
r);
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_dbg(&hdev->dev, "port%d: _PRR evaluation failed: %s\n=
",
> > +                     port1, acpi_format_exception(status));
> > +             return -ENODEV;
> > +     }
> > +
> > +     pkg =3D buffer.pointer;
> > +     if (!pkg || pkg->type !=3D ACPI_TYPE_PACKAGE || pkg->package.coun=
t < 1) {
> > +             dev_dbg(&hdev->dev, "port%d: _PRR returned unexpected obj=
ect\n",
> > +                     port1);
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     ref =3D &pkg->package.elements[0];
> > +     if (ref->type !=3D ACPI_TYPE_LOCAL_REFERENCE || !ref->reference.h=
andle) {
> > +             dev_dbg(&hdev->dev, "port%d: _PRR element is not a refere=
nce\n",
> > +                     port1);
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     status =3D acpi_evaluate_object(ref->reference.handle, "_RST", NU=
LL, NULL);
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_dbg(&hdev->dev, "port%d: _RST evaluation failed: %s\n=
",
> > +                     port1, acpi_format_exception(status));
> > +             ret =3D -EIO;
> > +     }
> > +
> > +out:
> > +     kfree(buffer.pointer);
> > +     return ret;
> > +}
> > +
> >  /**
> >   * usb_acpi_add_usb4_devlink - add device link to USB4 Host Interface =
for tunneled USB3 devices
> >   *
> > diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> > index a9b37aeb515be..4d3dc3bd881b2 100644
> > --- a/drivers/usb/core/usb.h
> > +++ b/drivers/usb/core/usb.h
> > @@ -211,7 +211,10 @@ extern int usb_acpi_register(void);
> >  extern void usb_acpi_unregister(void);
> >  extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hde=
v,
> >       int port1);
> > +extern int usb_acpi_port_prr_reset(struct usb_device *hdev, int port1)=
;
> >  #else
> >  static inline int usb_acpi_register(void) { return 0; };
> >  static inline void usb_acpi_unregister(void) { };
> > +static inline int usb_acpi_port_prr_reset(struct usb_device *hdev,
> > +                                       int port1) { return -ENODEV; }
> >  #endif
> > --
> > 2.53.0
> >
> >
>
> Please see the review comments at:
>         https://sashiko.dev/#/patchset/20260326011708.1128840-1-acelan.ka=
o@canonical.com

Thanks Greg.

Went through the sashiko review. The single finding claims
usb_acpi_port_prr_reset() should iterate every element of the _PRR
package and call _RST on each. That's based on a misreading of _PRR.

Per ACPI 6.4 =C2=A77.3.26 (_PRR, Power Resource for Reset):

  "This object evaluates to a single reference to a power resource. ...
   Return Value: A single element Package containing a Reference to the
   power reset resource."

_PRR is a fixed single-element package, not a variable-length list.
ACPICA encodes this in acpredef.h as ACPI_PTYPE1_FIXED with 1 reference
(as opposed to _PR0/_PR1/_PR2/_PR3, which are ACPI_PTYPE1_VAR reference
lists -- I suspect that's the source of the confusion). The "reset must
affect all ACPI-described devices that reference it" wording in the _RST
description refers to the devices sharing that one power resource, not to
multiple resources in the package.

The two existing in-tree _PRR/_RST users take elements[0] and call _RST
on it exactly as this patch does:

  - drivers/bluetooth/btintel.c: btintel_acpi_reset_method()
  - drivers/net/.../iwlwifi/pcie/gen1_2/trans.c: iwl_trans_pcie_call_reset(=
)

Both are in fact stricter -- they reject package.count !=3D 1, whereas I
accept count >=3D 1 and use the first element. Happy to tighten my check
from "< 1" to "!=3D 1" to match that precedent and make the single-element
invariant explicit, but there's no functional issue here.

Thanks,
AceLan
