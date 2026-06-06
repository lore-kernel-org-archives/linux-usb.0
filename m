Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF53C465
	for <linux-usb@vger.kernel.org>; Sat,  6 Jun 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762874; cv=pass; b=tefnF+/5mBuYkIdKYwmykQIBLkoKOmH5OJQB2Y4HLnbUTQeofYPGoaL+pBBURmp+5xSh4bWYokoFKcvMUj+7AtU1VAL1udMeyAxsvApd0yj9hB7WxNpdBL2cXNbcu3Jv/mkTzRjvUKFr6JqB67DU77PEuu7v8VTxia7VBTwaB5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762874; c=relaxed/simple;
	bh=voskKoDWPHE+Uu9qrc416JkEFOplRaD/gEc3pV0HX6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbMXXdOPoZbL8NfiueKGY9IyToiewyRsK6TzBhHnbX5nQ1hdFqjzLP+dLwijMxL5vGFW64TtDBNzLS59Y4NtW6FWAC+7K/rTiXK4PlPq1b+o3xSgyLOKw6jY7gC8XEAyF8I5F2ksqoE1gs1YJEn5hXPwEazg+b3sxy0YHasR2bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Se7OY8Rx; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Se7OY8Rx"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43d2c7b5a6aso2435938fac.0
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 09:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780762872; cv=none;
        d=google.com; s=arc-20240605;
        b=kB910/qXTgSDJ1ygBU5gksic/01CkbI84s02MngWYnrjtAhP+utnZW8uxHrSikvvrQ
         bAmzH5rxthHws0jCcmpRoai6snpa6fu8oCtwueM5F/zkIlmIHdAyXPR837YRfbtqzqVT
         fNkqBcE86Lxn2GjbXR04aC2vqbgislH1bgIiZjfq//zSxrPsDeF71HdTUyWg6w+kihB+
         I7GXUtD3GWt2ZPYLtLepOEdMoFkToBuLcYvIXRTwf1SudSN+ItN1EVTHq8T1WLlupSNR
         uKzz3Kl9fL8mlYy5FuORJlGLI1BxqRvmEM0zm72BMY1/cVGVC205BLGByoBNuDL/Y5mh
         7ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HK40qccduOwQq/qFGZ7tmPfZl76Rn6FHYBs8acZC5LA=;
        fh=42sIzb7E6Vihku2tQi7hgo28LxxYtywTmv2BxYUE6n4=;
        b=AC/v8ivoJQ951ipNjCUWq0XL09bQOr1G4qLhvmIP0zTlMihUkHlNgB8ElTq7tFWPru
         pE5j0e+JhJ7/rkPYpNmq7UjP2oaVQVpHKnUwUjJtpu7f4BuGxhoyeJwhANPJQaW3+HFg
         wLVUfuPq7OngdquSRJaXE0JFjMP5Nf+1CSZnIuTdDnAK3KY6xNBMYV2rKx3Bh0SA2olC
         hs/wtzUqHw8iW3C0AGYK5n/iwNhsRCOHnk33VkIFLuVHUCCupV18N2mGdJCId1Rg6l5M
         bwlPllPbbqn6K2PfvPrQKXH8NAirjNoYrfjtdl0cMLFeY/gqeTdYLCaR78IUPeK4mG3c
         JstQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780762872; x=1781367672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK40qccduOwQq/qFGZ7tmPfZl76Rn6FHYBs8acZC5LA=;
        b=Se7OY8RxN5v1NkYlWCPsmtPgMEJkv7zfry+scZK1O85vr8ZHKHeDc8UX0o11ez9hqZ
         CAcAyjA8IO2OSoGOvvamRi95RAIxLcqg9KYsE2kFwghxcqTBTCJS3pc/JBVKQEzU/xjG
         nt3N9HZOEq/+mbnJWNh0U58Eo2J5JasgK+GsBgB3YurfiP9vtSL+dAZOzY5pO1QuTA7V
         43ks08xgXuHltlQ/zB9NR0Erig56uWyprJL4DjqPjzY4yQDKacALmRO9f3KdptEwA0Cs
         Kp7GSv0LVvH832hmqyD0W581EEbasEF7fUG44VE9P2nC/M+ZkhoN+tvm3Gawj4IMav6D
         jLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780762872; x=1781367672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HK40qccduOwQq/qFGZ7tmPfZl76Rn6FHYBs8acZC5LA=;
        b=ae6vEsz0+MKA4iPLdWrTwdrZgVCRFuIowAAdy+itkL0j5MVueyAmTSA8hL7I4bLh8x
         9ofl9QRcATP2lYOr0yrGgIyOeON+Vzk7hHx1YA36fIfPm0Z1C1NtBHcnUm2jy3Dsfw+Q
         zRIE7K+z4lJeh+f2HD3LUDnKNMI8f9BFfpteOsN1WBB/0zmErPXClvnltnvDtUExPcWQ
         g0E7KqyNgMtEblvKWugZS6cUmnEMKW7EctO4dkR8ivYGKAuDGQdO2Ni067PLUVDjjhRX
         Wo9xfvlr6slZTUz2lzjbXVDmc/zW4vkyMotoOud0a/gvqvEmI88f7WThj7vgTUkDNf8U
         o4dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gMsQpyDzzZLt0zNXa43Pxx6b/arY+nJ3FfnW3JVSgCZo6dnn4Hy2CANXAkszUr1LLUWyJtk5Niwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbv5qKkdeOUUgmsLrP386jGjGBL3/9zv3ICPyiPyKuoIBJcNgU
	JSydWjQBk/IuaTKgRzyb8fIdf8brIaiXHhkNAUK4jv+0+hyrJUroaYcsaUUEFtd+bU+AjsVf751
	kaIgVEEDWhBh+S9QdaFdIjtmDFztk2AOPJMfmXrp3
X-Gm-Gg: Acq92OEVaRluubs0Rsdlfr5QnZWnt4CgFHYSczaRt5YfYDfowRFs5ZowOiO9KYjrvy5
	Gs8sXbsE/o03Vl3hXfT+DR5dvOORvOj8h+aoVKKoyC98m2+gup0q7Q580WjxOWaZt8EDvTOol++
	cUMoZZYBr5f+Yz3AFMHVYxjenjo9px4SF2dA01h/zBDR+SHchl36RvOi6WJbCk1VkWtS3su+YNB
	lQstl5krwKAOXH8YCHsOzmsenuh6VgrCWM6JY1+y7JWUuFIKkUhaL2M1J8/7vTjYLW+9wSJQGoN
	t0nuSqCS6d9zqH3MkU0F01uJCP/GvbPMwQhUwGWY5kCaXfzvzIVmo1mqW3zo
X-Received: by 2002:a05:6820:188f:b0:69b:bf80:2db3 with SMTP id
 006d021491bc7-69e68c589cdmr5366672eaf.44.1780762871265; Sat, 06 Jun 2026
 09:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah2Kwlm6Gm0rMvKt@kuha> <20260603031827.3692374-1-lucas_tsai@richtek.com>
 <aiLJKjtKMmjxdyyI@kuha>
In-Reply-To: <aiLJKjtKMmjxdyyI@kuha>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 6 Jun 2026 09:20:34 -0700
X-Gm-Features: AVVi8CdQddCq6ZycOoR9n0u_uU8osQg36GRCK8ooDk3CW6J_D8RbNXg1UWWEZx8
Message-ID: <CAPTae5Kpee+E2d0fwssEz=8dmGOmM09DmSma4nrSUJk5ygWbsg@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: lucas_tsai@richtek.com, cy_huang@richtek.com, gregkh@linuxfoundation.org, 
	kevin_hung@richtek.com, linux-usb@vger.kernel.org, ren_chen@richtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 6:03=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Jun 03, 2026 at 11:18:27AM +0800, lucas_tsai@richtek.com wrote:
> > On Mon, Jun 01, 2026 at 04:36:02PM +0300, Heikki Krogerus wrote:
> > > Hi,
> > >
> > > I'm sorry to keep you waiting.
> > >
> > > On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> > > > From: Lucas Tsai <lucas_tsai@richtek.com>
> > > >
> > > > Add low power mode support,
> > > > add the op to enter and exit low power mode,
> > > > this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
> > >
> > > What is VDD Iq?
> > >
> >
> > VDD pin is RT1715's power input,
> > and Iq is the quiescent current,
> > so the low power mode reduces the baseline power used by RT1715.
>
> Got it, thanks. Please add that explanation to the commit message.
>
> > > > while disabling VBUS detection and PD BMC
> > > > but keeping CC detection and not affecting DRP toggling.
> > > >
> > > > Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/t=
ypec/tcpm/tcpci_rt1711h.c
> > > > index 4b3e4e22a82e..48d6a6823ab9 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > @@ -20,6 +20,7 @@
> > > >
> > > >  #define RT1711H_PHYCTRL1 0x80
> > > >  #define RT1711H_PHYCTRL2 0x81
> > > > +#define RT1711H_BMCCTRL          0x90
> > > >
> > > >  #define RT1711H_RTCTRL4          0x93
> > > >  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0=
.75V */
> > > > @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct t=
cpci *tcpci,
> > > >   return 0;
> > > >  }
> > > >
> > > > +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> > > > +                                struct tcpci_data *tdata, bool ena=
ble)
> > > > +{
> > > > + int ret;
> > > > + struct rt1711h_chip *chip =3D tdata_to_rt1711h(tdata);
> > > > +
> > > > + ret =3D rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x0=
7);
> > > > + if (ret < 0)
> > > > +         dev_err(chip->dev, "%s lpm fail(%d)\n",
> > > > +                 enable ? "enter" : "exit", ret);
> > > > +}

Any reason why cant rt1711h_set_low_power_mode() be called from
rt1711h_init_cc_params() and rt1711h_start_drp_toggling() ?
rt1711h_start_drp_toggling() can enable low power mode.
rt1711h_init_cc_params(), which is already aware of CC status, can
disable low power mode when a source or sink is detected.
This approach would avoid adding a new callback in tcpci.c.

If the above works, you could optionally rely on runtime pm callbacks
to call rt1711h_set_low_power_mode() and increment/decrement the usage
count in  rt1711h_init_cc_params() and rt1711h_start_drp_toggling().

> > >
> > > Why couldn't this just be done in the PM suspend and resume
> > > callbacks for this driver?
> >
> > Entering low power mode or not relates directly to the status of USB-C =
port:
> > enter low power mode when USB-C port attached nothing (unattached),
> > and exit low power mode when attached with cable or device.
> >
> > In the other word, it is possible to have system suspended and USB-C
> > port attached at the same time, so it is not suitable to bind the flow
> > of low power mode to the PM suspend and resume.
>
> You don't have to do that in the system suspend callback, but you
> still should do this in the runtime suspend callback, no?
>
> This is not a major thing, but mctp.c is a bit bloated, I want to make

I believe Heikki was referring to tcpci.c here.

> sure that adding this kind of callbacks is really necessary.
>
> Badhri, do you have time to check this series?
>
> thanks,
>
> --
> heikki
