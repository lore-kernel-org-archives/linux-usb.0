Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CB248867
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785006279; cv=pass; b=Dy0x6Vp6tWb9HXmxXIkLSyxETuL9Ijt236KuvJreqJx16bJsoQZIxW58abmVorGtxTFskcfJC4IPCtmDHrztMUXcJBhEhuqDa94XMhNSl2oD/CqkqOIsDP/jJSie1SuS1STR0ZFJoK4AKYwtxCuN5MiViQ22bt9BiiT9uaPAGsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785006279; c=relaxed/simple;
	bh=909KnFnJM92zqh+PmhfhpH+V9GdWwTmvuUc0UgAs410=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM3NS4WmTNVSH1aSg6cuTAmhyUYfnY6350Xu+o5pY2sBeyXgGTtVxoaAXKaVxKQyEspbCL21IKCeOFq+6wtGRv2pPtF2ioXNN8X1b7KeyyWhjHpONneUmCBSSRVOw25MNyY5f1s9/k19f0/zjKetmc6tHwzsJJXoUGtp9gnaktE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaxYdRo4; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaxYdRo4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so194043166b.3
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 12:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785006276; cv=none;
        d=google.com; s=arc-20260327;
        b=rSWrsLDwf1biIXjVydhzHFC+LCd2p7jlKeq0MnohniDsKnZ1djjn0Sn5jwDozfDvYp
         z/+V87gn7sEVT0n507nBZTuvLBzN1jkjnspFnoZxIyqIMPK2q79Pi/m5Od24cuttHq0n
         e1sq3gFAcgYrlfdIprfVen9B8SUocSSIh+dDjhCFUFLLE7KAMw4XrB5QemX5LEvJNrdM
         cDbePixrzM/7FBs/NxWoqo27vn3QKnA+P5l1khA7XvP1HkDNiEV7UhCLvIIc7mEhlSv5
         4XxFFlGNbfjvt8Gn/el9d+WS3cExQQ5gUP+9rEP1ytxDMUluwUFHKqE0c4zcm+Ir1qyD
         XosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uvEXQWW6iRafzzNx5ovfDzwUreA8oA4ZcmkMJOBHy3M=;
        fh=Ko74nwmlBBQfhD72g4wLhq0MG5MccuOItWUdks6RQr4=;
        b=LDPKLABNsBwJgbWT0WHU4vwrCUcxrPLCohBLgrzWK/LoEsIHNC3qkCOFFeuw+2TQN5
         VroyOnPEjizc0AAMsXctb+rp9v+rnQr/1T8rRB4hNy5PpT4hDZPrkvq2eJmPV+v1cEk4
         QlbpVv7Hfaev0srlrWoORLiKwh3kzHCeZODTDNeXE6qGO9oAkMiyfA5gNtFGEc9bAdZd
         SXE9UKmaoliNWwFoK3Ngvi+5iuo8A+f3i1AhShOiwBviUHjNtHPYIRL2VN2DsdbDGY9u
         fKFnl9/EPo6LcfNqw+Ap9PTBFdSRZ3M37KDnSECkWeiSpKhxIh/ZFzggtkabk864vWqX
         2SdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785006276; x=1785611076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvEXQWW6iRafzzNx5ovfDzwUreA8oA4ZcmkMJOBHy3M=;
        b=aaxYdRo4jCzIjLgpTbzHcqQCTMT7CiptiiSkG/9xWgSQ1a1q3HdTbwwtqffS8RjySb
         9O4soAequgz2gbIH1PTJhZ3MW722Ig4fDzL1DkxXbK4N3BnG5+Oa/284oIuzBvTqmfuw
         fBaZmH4MAyeEI0HpGOlpyzvbwCSZIKPScbI9pw46V0RWK1MXVIvF1i4xLK87H9/081Jd
         UlDppyyHb6pHgLUDfvqp1mOiKAi6qmDOCj2cOtmN+8fLNUhDqqqTjXG1RTEDZNAe+U19
         cdbTB1mseU00hliG7PKfrBxaUEZtjdVo92lQ1lr6rMt1TBXLkqYb6EjGkBRGUIqUgUGS
         Eozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785006276; x=1785611076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvEXQWW6iRafzzNx5ovfDzwUreA8oA4ZcmkMJOBHy3M=;
        b=BTBxNW2bs3QvToKmpSQshOlbzWNMv/9/WlPp9Qnr0W1Qz0JWjV/8Gqxa0NinmocsM5
         e9t2Hi0nEZSBrS3IioJv9tKaxHkXB+hfGE9qFm/7ve2sVAV0gNCLyKCRntPqmZXSavh1
         ABE6x5dE5aVpMxcXXrcEE8i++9bim6jbZHeak0V5GDVMUgej39CSmvOOQp9L6mAqKHit
         ruVcD3Zc+pv0oKDnV1dp3/n0KuHq/Rr7+JL4h37fxM8jYuyavltqsn9UaoVZqzUmell+
         uT1MZudPyiL2m/50Al35pCMcwzYJb795D0VZgfXSM3c0kHTPijtwFmLHr97HVvnkKJV+
         LRAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4jdldGddCf4nL9QYJbPCcR/5R6hkLLxCt5mOhT4OFTeTR7HCyH3zHKORKm3Iv2sjf4jRbzRaOQLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaIwM8iM9GFPdqYiVIt7QW5zC2+X37HKf4eWFAmvTvz2OVVRa
	HEzm54BwZcrlbp7dwZc/HkB+zArNAiOR9t5iJ9Zze8mWdFmfnD9xlvTDY03vnpzBQ2/TwSlasnx
	piQM+fuTVVOWMwbenMA2oQLO21foclpX+a0GDWAg=
X-Gm-Gg: AR+sD12mbBTdHwIRJsRrih28/WFCXER6XwWZrvWmTrrT823ql0gTcrGCnBOV81LJHgk
	6jth20fDWLh7RWKhCdxdob5rDwVxVjW/CujWeZY+6OPAMMEnOZwRIu308z9f5Wq9HvXk2336O6d
	XH3eJahIf29ubFgcMZptfTYH5RluCDTVgFwhodNXQj4NXipBbE6wW3uwMsB8oiXEZFPasNxxiay
	PxPzRTYtYb10TWfRjADWKj6BKF9N832bSplwZbJ5JrWFLvRcvs8LY1qa/JePHzA1JxlGUFZ8iAZ
	NwO/dIkYFUVsog8M/4XtIOn9louDEW2TA4G7sZyav62QVD2ftRSQLaKQC07EGtX7kYB13qevcYG
	xCfcX
X-Received: by 2002:a17:907:6d18:b0:c1f:1520:56d4 with SMTP id
 a640c23a62f3a-c1f1eeae3d2mr140419766b.27.1785006275571; Sat, 25 Jul 2026
 12:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
 <2026072535-uncork-gonad-4187@gregkh> <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>
In-Reply-To: <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 26 Jul 2026 00:34:23 +0530
X-Gm-Features: AUfX_mxOiDwd606abVp3JiJhlVM-tbR6arau4ryLEUHC2B25N5Mh_Pqu9JkSGbc
Message-ID: <CAFgddhK40Ek0=ExAYtsTMbVBsx-h4rE7Kp9uBRDRv1eQ53oBYw@mail.gmail.com>
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read quirk
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Jul 2026 at 20:19, Ishaan Dandekar <ishaan.dandekar@gmail.com> w=
rote:
>
> Hi Greg,
>
> Here is the follow-on patch adding the ShanWan Wireless Gamepad (2563:057=
5)
> to the static quirks table.
>
> Note: This patch depends on the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag
> introduced in Nikhil Solanke's pending patch:
> https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@g=
mail.com/
>
> Thanks,
> Ishaan
>
> ---
>
> From ecd1aa9afd8bc00a3e0b36cbe49b427f390e5de6 Mon Sep 17 00:00:00 2001
> From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> Date: Sat, 25 Jul 2026 20:03:28 +0530
> Subject: [PATCH] usb: quirks: Add ShanWan gamepad to quirk list
>
> The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
> EPROTO error during standard enumeration because it expects a 255-byte
> initial configuration request. Add this device to the quirk list to
> use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.
>
> Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 87ee2d938..696bb6548 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -588,6 +588,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
>   { USB_DEVICE(0x2386, 0x3119), .driver_info =3D USB_QUIRK_NO_LPM },
>
>   { USB_DEVICE(0x2386, 0x350e), .driver_info =3D USB_QUIRK_NO_LPM },
> +
> + /* ShanWan Wireless Gamepad */
> + { USB_DEVICE(0x2563, 0x0575), .driver_info =3D
> USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
>
>   /* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
>   { USB_DEVICE(0x2b89, 0x5871), .driver_info =3D USB_QUIRK_NO_BOS },
> --
> 2.34.1
>
> On Sat, Jul 25, 2026 at 10:53=E2=80=AFAM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> >
> > On Sat, Jul 25, 2026 at 10:35:47AM +0530, Ishaan Dandekar wrote:
> > > Hi Nikhil,
> > >
> > > Thank you for this patch. I can confirm this exact 255-byte config
> > > read issue also affects the ShanWan Wireless Gamepad (dongle ID
> > > 2563:0575). Standard enumeration causes a -71 EPROTO crash and drops
> > > it into a generic Android mode.
> > >
> > > Your logic prevents the firmware crash.
> > >
> > > Tested-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> > >
> > > Could you please fold the following device ID into your quirks list f=
or v2?
> > >
> > > /* ShanWan Wireless Gamepad */
> > > { USB_DEVICE(0x2563, 0x0575), .driver_info =3D
> > > USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> >
> > Just send a follow-on patch for this device so you can get credit for
> > the change?
> >
> > thanks,
> >
> > greg k-h


For git send-email setup, the kernel documentation has a good guide at
Documentation/process/email-clients.rst. The key is making sure your
mail client doesn't reformat the patch content. Gmail will change the
tabs into spaces and wrap stuff, which leads to patch corruption.
(this is what seems to have happened in this case).

Also instead of sending it directly, you might want to save your email
in a txt file and use `git am email.txt` to verify if it applies
cleanly

Thanks,
Nikhil Solanke
