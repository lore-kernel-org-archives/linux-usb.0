Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366C334C1D
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785051186; cv=pass; b=mcjYKunm+RKTzmfzsvnsQquBfnqSfEbVjQwJnscvv6R6b9MLBhvCQg/izdcqtS7+EYuubPoW5BBE0yHIHDxC2qDs7eTGyTIa1v8Py61UPCtLLR4h/9QMROp++FNeeh0P2xAUMFyZvXHuvmE78r9Q6a6KOd3oxNwOjBqz0fEzQb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785051186; c=relaxed/simple;
	bh=6HH9cMBt7GUMmx3pXIrBjnnBE9GcVYR4Y05wgv5sHxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joiygg5EnT2nva5RSUMLOPYP4HaFkFmSsLeGDCI8Q9SnnlaDAPAyIsNf1J+uDDcAEBfou/odboiZAZ51rQEcvARV80HmA4Tjo//vTW6X3x/ULhWY3wg48bKqzV2DLOuENUFYS6DkybKwhlNoxjFkIQeQ0CHIYn+M+W8yyJrUz4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqwHmZeO; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqwHmZeO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2012219a12.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 00:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785051183; cv=none;
        d=google.com; s=arc-20260327;
        b=ReXCw9+f1JS4jYKzG4WthDtYU4Cdw7l6fAkURRTq/QzdybOoeSiSecvUijJ0BOyxAc
         vUTREXqdy+lQ2a2n0wtpVEdisFuctd+8dDW773rwhAWcJBNTPchXrUmibB8EhV3LEygV
         s8sTpTCxe4Zn++MqaZiO7Sboa5BcKtx4AKvMcQQyrU+mxc/g+D4ZSbwRCA8BTRjmEkKQ
         AZ6iZ8zYkl9yTYz43H9ZN6G8fPiMnt+9XVPwJ2b7E2I9lfvGS1486ejraXa6xw3vT12S
         5YljdGRwsOemLL1T57/pVVxdVihiP2fvslknFPA+7JmUDm+xPMKcNoPOOZR/hoXojX3O
         UBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B5p5HfuZ9T8Sd8UslFZSjCp4DIlb+MCzLrjbm/ciTL8=;
        fh=+vjGDEcgTdDFyBC1yJgNGOVVsPwZE00e7TRviBcLabg=;
        b=dW5/0ZtL0oOQkIw0UD3wjLtuDr5opT6aELgPpFQfxl+c7on8MM6MvyjkNIAC5ePMJs
         EZh4zFI969RsdoHhBY7OogbD4pPmx26vhX7kfoBtYZX/ui+qizANg25fxDt+6NZ3OwVi
         9gRCi4W/36wWA/qD4q1ggVeMS3sXO73E7u052jNa5gc4nOgDsRgG9piWh2SrmYrnlLNe
         Vq2GqftXWe0GPsxyJfCo2/8KQbLhV22qC3/daOc0u6ZX8HRi7wIVnwMLWAHwOP+X5kLy
         U2gbJzBSijUH9B6+5bDtsAg9jaWx4v95pPgnt/tiFO/svRbd6tvVupJyvSgYA8IlXUqX
         fTsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785051183; x=1785655983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5p5HfuZ9T8Sd8UslFZSjCp4DIlb+MCzLrjbm/ciTL8=;
        b=BqwHmZeOeUemyjX2JtRv/qC2+awFOwfgoM5Ey+uHHnusX/8GUxRGNq5gGZ9LCY7kHL
         9+uNgCrjQsok23NNicv3kb3n/vBaJAQxZPKWXKzZCiSxwDPp9UpDhl80Y7no0stgnKS0
         Qjg6sUCTx0hO95MErDnUqMxPNwQPnTzylKFumoACf4TJdlVbgJybzREqbokLWrKMhCNz
         7ArfLE27miYSiJON0gE/yXEvG1rxBjy68sByyEYJq0r23npekZYHqzOxnlrM0xxv2q/Z
         ZQdz4u8773sHRMX2K8FOpr8qil8F0KVHzvPeGy9/fee1nO7wsEwT7okaNbMLUDBMk5Q1
         xiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785051183; x=1785655983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5p5HfuZ9T8Sd8UslFZSjCp4DIlb+MCzLrjbm/ciTL8=;
        b=ZofpB1JUuFuWnUUanF9vVrsiyBAsOg0JrKleaRQcYfN1fcawiHA5zoKDK3+hXIPahH
         IFcovG3uGNDfyJktAb7/7I4EYDxjbbeJAAG3vgETJKWAdogJtPdh+6GH/xuqmmN6jvLd
         rcW4EMf7OraPOiqAKHI7hx/vbe8zYteh+rIbWDJc6JBYUPsA0CBH8RgxkikTTqcbbNqh
         QZ+I1RlU7SxtAFZoW2f+1ZitVXGMB9ilB1jM4GTy8ulQplCzaboVYBWbXu5rnVMh26Mk
         X8V8Ozde0ldGeOH33O8acxGJIP1eYVEuPidEsuy3VTKCpuRjJ7xj6jx+mX5sTMBED2eI
         slJA==
X-Forwarded-Encrypted: i=1; AHgh+RrqMUflAjGvnxfTOqySKaVk/tjDaDTQXkJqub43Q1rOs6CG0uI3rg7ppXMLHmS3Wm0viJkS7PLMKIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypm5Udd0tP99wQN8/UpzyLjJfv1sIOU4Bq13PtPyKkrAQzHbWB
	xUozFVC+op43N/UfhJQR/4cA9FG1E+MJzRF0BK1AP7j5BKFh+Pf3z1eFOp+hk3/MlWglYB8SAMi
	MIPBjeTQtZu1ZkR9RfzFHCtb0e6hDn2w=
X-Gm-Gg: AR+sD11zGMNm1jX1UWsAFDmCkuSTfxGwq6m/MS7TX9Eb5CUfQwVBHMi2OmceM0zWriD
	1aa+M5dhTJmj+8Cdi/GN8oUDEz3sQByiuYVbZkgTSBI4lHJ96mVZ7wNr6CmuA45rlEaDGHpEOrD
	Z5dRfD8Yx5WI6IR69IkRkU1Q2TD4VM9avCLLWMKNY9aclllNhoxGN66JuGRRmMOGpVeC6MEq3Ak
	TTgtL9wptlxaMeRfNXHp4aiz/c3t4YZ7/nl1Q3I3jzN99SiWhT6k0aiH7PpwbY=
X-Received: by 2002:a17:907:6d0b:b0:c16:13c3:b1ef with SMTP id
 a640c23a62f3a-c1f1eeacc81mr181433366b.24.1785051182770; Sun, 26 Jul 2026
 00:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
 <2026072535-uncork-gonad-4187@gregkh> <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>
 <2026072500-moaning-importer-e8ee@gregkh>
In-Reply-To: <2026072500-moaning-importer-e8ee@gregkh>
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Date: Sun, 26 Jul 2026 13:02:45 +0530
X-Gm-Features: AUfX_mw-VKpPPNd7ycgcZ6QS32FZxCAkWlFySy1SHAyIttwrv2wgEsVEMsvKIYE
Message-ID: <CAG0uPa_w9jjqwQkgJD1eyjN8b1CUBRRURcfEgfouZi7PRSxseQ@mail.gmail.com>
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read quirk
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nikhilsolanke5@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg and Nikhil,

Thank you both for the guidance. I am setting up git send-email now
and will verify everything with git am locally before sending anything
else.

Regarding the delay in my response: while testing the usb: core:
quirks patch, I realized the quirk alone doesn't entirely solve the
hardware's behavior. After running a Wireshark capture on the device's
Windows initialization, I discovered the controller drops into a
fallback state that the Linux xpad driver was ignoring due to missing
VIP bindings.

I didn't want to submit a partial fix that leaves the controller
broken or mismapped for end users. I've now patched xpad.c to properly
claim the interface and route the X-Input protocol.

I will be sending a properly formatted patch series shortly using git
send-email. Thanks again for your patience with a first-time
contributor!

Best, Ishaan

On Sat, Jul 25, 2026 at 10:59=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sat, Jul 25, 2026 at 08:19:21PM +0530, Ishaan Dandekar wrote:
> > Hi Greg,
> >
> > Here is the follow-on patch adding the ShanWan Wireless Gamepad (2563:0=
575)
> > to the static quirks table.
> >
> > Note: This patch depends on the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag
> > introduced in Nikhil Solanke's pending patch:
> > https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5=
@gmail.com/
> >
> > Thanks,
> > Ishaan
> >
> > ---
> >
> > >From ecd1aa9afd8bc00a3e0b36cbe49b427f390e5de6 Mon Sep 17 00:00:00 2001
> > From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> > Date: Sat, 25 Jul 2026 20:03:28 +0530
> > Subject: [PATCH] usb: quirks: Add ShanWan gamepad to quirk list
> >
> > The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
> > EPROTO error during standard enumeration because it expects a 255-byte
> > initial configuration request. Add this device to the quirk list to
> > use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.
> >
> > Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> > ---
> >  drivers/usb/core/quirks.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index 87ee2d938..696bb6548 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -588,6 +588,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> >   { USB_DEVICE(0x2386, 0x3119), .driver_info =3D USB_QUIRK_NO_LPM },
> >
> >   { USB_DEVICE(0x2386, 0x350e), .driver_info =3D USB_QUIRK_NO_LPM },
> > +
> > + /* ShanWan Wireless Gamepad */
> > + { USB_DEVICE(0x2563, 0x0575), .driver_info =3D
> > USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> >
> >   /* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
> >   { USB_DEVICE(0x2b89, 0x5871), .driver_info =3D USB_QUIRK_NO_BOS },
> > --
> > 2.34.1
> >
>
> This patch is corrupted and can not be applied, please just send it with
> git send-email so that this doesn't happen.
>
> thanks,
>
> greg k-h
