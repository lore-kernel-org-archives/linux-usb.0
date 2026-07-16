Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0214D2749ED
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199256; cv=pass; b=dxfqnrZ0JfnpZ2RPwvShTjf4GHn9gxvtMBJ3FnJSqGRz58pwCnk20OdojIBVu87l2satSCXfS/IEOLyqR7DVndR0IFqjQ4BhHNXmbOhhLxjEXKE66U/LLn7HB8fP+QpzTxk4SUOjx+SfAvl7V1b/gJqFpwxKUn1HdgKgQ0Z3izA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199256; c=relaxed/simple;
	bh=3j/moiupjcRobjxa4ND+wmxO9Q9vks2r/SEqOUGkRGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYUes6TGVhfalS83h1f1gAnbgwe199gGrhbTNCGIDtJiUtXWHKxKbOzbiUXvscMBGnJPC8+fSUq4pyeaTGdhhgrjaudOb1V0JvSFGCYnxEGqmiV2cMwzXSVnvj3DO6ZAEe73cKfkWXzMLLx6vNWoY1qhwuJnTHsCHgsam05VNHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f6SqFLJM; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f6SqFLJM"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664db84f074so9514367d50.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 03:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784199253; cv=none;
        d=google.com; s=arc-20260327;
        b=A0cHB0HLAJFWRDZTR4oAnxVgJpXFyq6S3xwcvTw/Nyf82xWs/xKLN88Zc5fs00IwSP
         JtU0MGHCgHhz1vVtieqCr/MoEYHRPX2c9QtLRtmaNzgzt85WKhiNp3QEmY4J4+Ib3qCV
         OecwxZvm3Mmuk9tpYqLLEv4PnA0fqd+GTG6VgsUgbL5gUYaBwSfgOe5MrOkSYEg9bbQ0
         BAsUJROyL4DAePjy3gxC4Ww+X5tyMYIqqI31nItZkh+BUK8EJbu9L8Yn8hPjKHs+0qDB
         Q3wTMinnq177t4zq4E1CtRYxckbLJ25mDJbF0XaR8WyFGik4Xg0l/QlS5w696VqpnUjd
         fFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        fh=zEov1kMTAPJxfuXqbrP3oW3pENUM+7od3ud1rmEQHLc=;
        b=Ij+1SinItxP4xtdM20j9XCKkySdiajB6JVFqEqm7dKhWHIHYw6MWaIOSQgp2y4JEqQ
         FFZGDps2ZzwtWbPJU7ln8Xf0ndWTRoREv88WLUWXsn3KJpJJjSGwRdJG84P/wPcQojJd
         yjLnTiZaEfgKve35cZHbtNERjkEVW5nsHCZGYSyGpEqcc8N1poK0VM4qs0J4W9VdD0CR
         g/263bOBnzzpsuKjUMZY7n7fE518j8hx+C1YmUJbMHwy6qGsSBLncx20o7w8Beto22e2
         1qt8VueqkIBV0hZCiH/w9f22OY5EeiaOxeqZw6xQeqzqGwT4LCZKBdxjDLUJeNz86XbW
         lwDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784199253; x=1784804053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=f6SqFLJMBNv2J9+tN/SD+Mr0yiaGb7JzeUKkBHV6RygNbuQRQ+NCsySqqILI9W7nIw
         x6RX3bYWzZ3ddMN6lpYiMZp6cYmrxXGOs2ZgTnKPiAbfnXEessYVbPaPRRRdKua5cQKr
         eigeNCk5drspqqnuGpUZCzI9t8ifNG6qq4nV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199253; x=1784804053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=hHIzWeCUNk6qgICohl7Dq/PNhoqsOs2Ee4kLZvrV2kXtDoTI5XFzKRd1XNHqs5J0Zv
         +/Jgw7p+PWueBfhBpS/ZngGHDFK7zZObuq2kQR3wl4fmj0muMhhlvN9ByEyQkx34CDG8
         4oO/UqLfRCQO2GAqdaAAPNkGwXmTOACt21RfQ5sO/vLJc1RXiTQs+RzheefsEl+h7ubD
         x+9n52fNqaxDhtNAjXOV+VoIMEN/TCsijNsWFohvGJ/MyamANBiL6Y21D+gF0823XL/I
         w+0X5nDkJgkocS1S7mMOTrUdcJwWS/71N3oYMtWHXCroIHZo8cYutVyEP6VrmfZUAgug
         Ju0A==
X-Forwarded-Encrypted: i=1; AHgh+RpCDODplQdph/wwOsNsEqX0TqYtoKUCRx/bx7MZA6GFjKBuETmTGbfL3RntyL7T23pbKAsDE39Ohz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIGa/TtVOsSy4rJMlZNL1bXDm1QYFVjJjJo5XKELsnzezsenF
	Gr/6P+XzRFbvypXI8P3QmncPPq3M6Tlkyb5767xk9BMGom52njIDOPIblwT6YImJ24HjY0LXSjf
	B3GKt2ETl62ULGhMHveCf/fGgKgnl2UN7+01qT+26
X-Gm-Gg: AfdE7cnsBZh2gmn12X2x/gMjwG71Y1DnbADzU8dZ2mrrfxBt/c611F+U7lCFJ+fj8c+
	UsawNbapkJP9e21/VCOU9C4VwejrE5yKCQFS5E0O3XgukVnwswMB9Vf240bZ9GIEdDDV7rDjmuO
	7S2EDYwENeWD/HFgt4SBD0aaHBNlMAihxRBCi0HrjSaQDxNAdBMem2LpV5XewXhiB7BqcefbHKk
	Lh8cRFR+ST/l6UgwpZAYDVcNzn9XDvtBfeWuvhyE4R6dhMLTb+OLIxApZ2nDOzqFlRw6KdcQOTz
	tuRkfM95y9k5XBye3Rqip3f+CvU=
X-Received: by 2002:a53:bb82:0:b0:667:d905:3ff9 with SMTP id
 956f58d0204a3-66813443847mr3043941d50.88.1784199252963; Thu, 16 Jul 2026
 03:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <20260715092814.21C6C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260715092814.21C6C1F00A3A@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:54:00 +0800
X-Gm-Features: AUfX_mxnCgjcslak5RN3FLmB9cGAZkDHT2GeqTyJ6cvjjM1YOC7J0D8IvenEsBs
Message-ID: <CAGXv+5HM2ojf_+bbybfaNi5-TLC876-DRudnvQnOxMzHEpux8g@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Concurrent sysfs `disable` read or write can dereference an `ERR=
_PTR` if `usb_hub_port_pwrseq_get()` fails.
> - [High] usb_hub_set_port_power() accesses the dynamically allocated hub-=
>ports array, which can be freed concurrently by hub_disconnect().
> --
>
> --- Patch [10]: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key c=
onnectors with power sequencing API ---
> commit e0346a1be7fb5d1254f3498bb6d857dd5db5a9d7
> Author: Chen-Yu Tsai <wenst@chromium.org>
> Subject: usb: hub: Power on connected M.2 E-key connectors with power seq=
uencing API
>
> This patch integrates the power sequencing API with USB ports to support =
M.2
> E-key connectors. It manages power sequencing during port creation, remov=
al,
> and power state changes.
>
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 10f15b40fcc55..298fb68c6afc7 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
>
> [ ... ]
>
> > @@ -887,15 +898,22 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >                          int port1, bool set)
> >  {
> > +     struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
>
> [Severity: High]
> Can this code trigger a use-after-free on the hub->ports array?
>
> The sysfs disable_store callback uses sysfs_break_active_protection()
> to avoid deadlocks, meaning it prevents device_unregister() from waiting
> for the callback to finish.
>
> If hub_probe() fails and triggers hub_disconnect() concurrently,
> hub_disconnect() will call device_unregister() which returns immediately.
> Then hub_disconnect() unconditionally frees the hub->ports array:
>
> hub_disconnect() {
>     ...
>     kfree(hub->ports);
> }
>
> Meanwhile, disable_store() can continue and call usb_hub_set_port_power()=
,
> which now accesses the freed hub->ports array. Prior to this change,
> usb_hub_set_port_power() only accessed inline fields of the refcounted
> hub struct.
>
> Is there a way to safely access the port here without racing against the =
array
> being freed?

Before calling usb_hub_set_port_power(), disable_store() already goes
through many steps to acquire the hub device, acquire the device lock,
check if the hub is going through the disconnect process. AFAICT there
is no race.

This review comment in a previous iteration led me to try to rewrite
parts of the patch in various ways. Maybe it's missing the broader
context from the existing code?

> > +     int ret;
> >
> > +     ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> > +     if (ret)
> > +             return ret;
>
> [ ... ]
>
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index 19913ad3598b3..430fc90232502 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
>
> [ ... ]
>
> > @@ -831,6 +879,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
> >               goto err_put_kn;
> >       }
> >
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
> > +     }
>
> [Severity: High]
> Could this temporarily expose an ERR_PTR to concurrent sysfs operations?
>
> The port device is registered earlier in this function via device_registe=
r(),
> exposing its sysfs attributes (like disable) before usb_hub_port_pwrseq_g=
et()
> is called.
>
> If acquiring the power sequencer fails and returns an ERR_PTR,
> port_dev->pwrseq will hold this ERR_PTR. Because sysfs unregistration wai=
ts
> for active callbacks on the error path, a concurrent read or write to the
> disable attribute could access port_dev->pwrseq while it holds an error v=
alue.
>
> This ERR_PTR would then be passed to usb_port_is_power_on() or
> usb_hub_set_port_pwrseq(), which call the power sequencer APIs:
>
> static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
> {
>     if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
>         return 0;
>
>     if (on)
>         return pwrseq_power_on(port->pwrseq);
>     return pwrseq_power_off(port->pwrseq);
> }
>
> Since the pwrseq_power_* APIs do not check for ERR_PTR, would this cause
> a panic when dereferencing the pointer?

Similar to the other comment, the sysfs callbacks try to acquire the hub
device and its lock, and then checks the whether the hub is being
disconnected before even proceeding to read out the status. The hub
device lock is held for the entirety of the probe function, which
encompasses the creation of the USB port devices and hub_disconnect()
in the failure path.

So I believe such an issue can't happen.


ChenYu

> > +
> >       retval =3D component_add(&port_dev->dev, &connector_ops);
> >       if (retval) {
> >               dev_warn(&port_dev->dev, "failed to add component\n");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D10
