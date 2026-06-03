Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888283955E4
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469735; cv=pass; b=Kdpcf6xUC8RK78LxMgNC5Rqc22SJQojByrK3652b4oJFaN70yJZ8suXSwFD8OKzKfWMI3b3yCRMfo3yNtHXoNIYRhA/krhCsl/ikT+fLukxfjq3Y/hizpk05cFg0YLa/9ky18JyrF6nPwNnWAqmV3lqiTLGZRO3ReV4ndeDujn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469735; c=relaxed/simple;
	bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hETIuGLq95UCqh5yf+GjwmTZBr+sC7k6khOoYvAT0Ti3+B2B1sCeTRRI9a/iZYoY8JfBWGmAA8fW7RV+h7V3EgSk1lHW5zkkc3n9PXqhmv5X7A9V++AfW9zK5WXRbq3o8ayEQo2SuGxg1EncD8LXITZgZ92KDG89j1zM/BYxEs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pg+unfsQ; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pg+unfsQ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3967717c951so43916781fa.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 23:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780469732; cv=none;
        d=google.com; s=arc-20240605;
        b=BLwzqIvxzBEx90DFwqymi/5NKRxx9NvDxeC9SJCujDDNlUzKvlQ4cW+O6PjIVtBJKn
         4xMknoL+Z1HSUnHaK2ISgk0Vjmp94qw58emlaB6abpGx7PLC5PpB4Nu8co5hGF2N/xWF
         Nd7HgqkFF5fb57ESSH+MmvxhWU+kngrCogERAmU+jOsbHDwYbHzGX1yoNYfmzm3n8O/4
         x9BxCv3isg/7wzn9MEDAPU/HPT/gEZU7XImmaIEE6dAhL9wI8Aw+zV7nUSTuDbubcDO7
         xnYuuPIX9gvzhn8HeMfLrTVBE7RItd9IX03Jct3aAB8AXzr/miXRvAIX9pqbVC8wL0rk
         oLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        fh=pfB1BBpEN6dLKZRyloRZYP4CQqtgiivEoZVhxXBg0U8=;
        b=es7dKLzrFJ6wiXqfv/PbeCoEhqWkehWmPK9IvPeKx8vNBJG0pi31y65JNzKyXvBIJR
         yhSH60nRVhXeBbPStoegD6Qw29ktAxmL0tadXnHJGbQllJIFEPOPYpho2mjRjeTzx1t/
         Ws8wg1HIEwXpQKzaiEdNkXkW8ZgDok/yjkrp0vwOvwD0fDyq+THLhNKLF1uhF0VHG8PN
         BQU+rFAQK1u/abM8fdV7tSoMPmluq6Dp7eD9FeNmkGO2dpri3Nu+FTnxM4OQ3ifTYl/Q
         YasnHVxb7/2cnz6TQB/u0laiSbgQfK8a5fSnzIkgj7Bq3wmcQqyOxSx758MefwEce6Iy
         3eQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780469732; x=1781074532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        b=Pg+unfsQIf2JKznDDrA5Wrd5+atGJSPKJv8JIxcNffuJnkxZBXq3v2zvCRrtJB8p8n
         +DfPkluAPxFERGqdqRbCR/fJS0wagwDtEHXYCe8zNfxOObu93K2ulx6phcP84DimehJo
         6vUPOq+AUez28slv12ZkQ3e2t9q5Bj6+QUIFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469732; x=1781074532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        b=dCHzbKw9ULoXLah98H7yVAk72iGDJKgCgRVTRb/J4r+zQc9gFlNvpi0rK30M2Ox3l4
         jjtklmlFnj2GdKo/drrA5haqjcSqfq78InZGorDv2Ljnm28sB5b51/dcRamN1IBHOIhd
         exvWQIY5qSiymTSMfDOWSkohi2zdcxrt70vMMQSEdpX65WO5WBxcdZzNrtBcvcFjb85q
         bsagfv6aYnU/IFmEaJzxwlRpiTwGZbEETXkA2NrE/oHpeBwi6TO7qWaR0TDgnzh6+wyf
         Rvr9VB2CZr13yreOSqrumkZDaFuWCwHFR9ELWaR97FrAQgnTSYMOI/Y5Ed2tPg7V8qi4
         T/vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8p9Trn6lt/BK7XnIbjGKAh+5a/lbX2qm86qzVqxbxTy/kb4Xb4S/PeSHdYH9EQiH39UHPsJFvbJgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLHUDl2s/UpcB9auE180GjgZU5AEw3yPJml0P04NnxiBw38eU
	GTsSgNZJRY6vX9i30uAjPvkSAaLYg/9cn54xj2e5GXrmUtxGwowHNi821mf+6P9pdmgOwI21ybe
	wsTSnVpSbVX8yeEzCSihXspb2hx+xl0UGohe6WVp+
X-Gm-Gg: Acq92OGOszNgo0O5go5laGjBsoJgfuZifeX29weXtRJ3qn1JYnUzu/RRKMfVY26nc4/
	6qxHmC3IZgj+FlIXNrmp3sHOhSEIy6D/A+J+Cv4VVJVN8C2SFvHinJQoyYHUfvWydgI6LIIk36L
	y1+1MkCcBZrfB97CnF8hGvI5SS32xyfxaxRx5oItkcpDGjDqVaBnSCAmbaqNH2EIdg7BSl8KWBl
	ON4QkfyT6RUhS+gscmTgYopLJITppjNsuNRCEopzq0va+AZZnWf3LeiTwzOpSi8OkM+I1R0GzwZ
	Ob03Oe9sBjKvtBsXOfTKU1XQxKn+a45gRNOhL7zxqXARoElD
X-Received: by 2002:a05:6512:2310:b0:5aa:5f81:51cc with SMTP id
 2adb3069b0e04-5aa7bfd939emr598153e87.0.1780469731666; Tue, 02 Jun 2026
 23:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
In-Reply-To: <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Jun 2026 14:55:20 +0800
X-Gm-Features: AVHnY4LlLDHphsEQE3sATrymTCUnapNz7ZFd_5P8UcLWbDeGGfHP5mUv-LY1yqE
Message-ID: <CAGXv+5FhUuV_0fdOMDowffA-1jtUoNOcxZSZE-pd_T4V5Qg3Jg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 4:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 27 May 2026 18:21:00 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> >>
> >> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >> >
> >> > > >
> >> > > > I expect some discussion on this patch, because a) it adds some
> >> > > > OF-specific code into an otherwise generic (core) driver, and
> >> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up =
powering
> >> > > > on the port twice, which negates the port reset part.
> >> > > >
> >> > >
> >> > > I understand that you do this because the port device has no OF no=
de
> >> > > assigned. If we wanted to call pwrseq_get() for the port device, i=
s
> >> > > there really no other way to associate it with the correct pwrseq
> >> > > provider?
> >> >
> >> > I suppose we could tie the "port@X" node to the usb port device, but
> >> > AFAIK no other subsystem does this so we would be introducing a new
> >> > pattern.
> >> >
> >> > In the M.2 pwrseq driver, we would have to match by port node instea=
d
> >> > of its parent device node. We may end up with different behavior for
> >> > the USB target vs the other targets.
> >> >
> >>
> >> I imagine, we can check the bus type of the parent device to know if
> >> this is USB?
> >
> > The "bus type" type is probably not exported. However since the DT bind=
ing
> > explicitly says which port on the M.2 slot is for which connection type=
,
> > I think the matching can do a special case check for the USB port.
> > The next obstacle is that the target string is not given to the provide=
r
> > match function.
> >
> >> > Also, the "port@X" nodes only exist for the OF graph connections to
> >> > connectors and/or muxes (this series doesn't deal with the latter).
> >> > For directly connected devices, there is a "device@X" child node
> >> > directly under the USB hub node. That node is what gets tied to the
> >> > the USB device.
> >> >
> >>
> >> Is this a problem? I don't think I understand what you're saying here.
> >
> > It shouldn't be. I'm just saying there would be different behavior on
> > the USB side for connectors vs onboard devices (like hubs) device nodes=
.
> >
> > I talked to Greg earlier, and he said not to touch the hub driver; the
> > hub driver should only deal with features from the USB spec. The
> > "onboard USB devices" driver is what should be used. And this would
> > be a proper case of adding an auxiliary device to the M.2 slot driver.
> >
>
> The onboard USB device is what initially inspired the PCI pwrctl code so =
it
> doesn't surprise me we circle back to it.
>
> > However this seems to completely decouple the power sequencing from the
> > USB core. Take the USB A connector for example, it was recently added t=
o
> > the onboard USB devices driver. However the connector has a device node
> > that is not a child node of any USB host controller or hub; it is conne=
cted
> > through OF graph. At the same time, since it typically sits at the top
> > level of the device tree, a platform device is directly created and the
> > driver subsequently binds to that device. This is totally different fro=
m
> > how the hub and other directly connected onboard USB devices work. In
> > the onboard device case, the device node is a child node of the USB hub
> > or controller, and the corresponding platform device only gets created
> > when the USB hub driver probes, thereby sort of tying it into the USB
> > device topology.
> >
>
> Which is precisely what we do for PCI pwrctl. Though I'm not sure how we =
could
> replicate this behavior without touching the hub driver.
>
> > If the power sequencing ends up not connected to the USB subsystem, the=
n
> > maybe the M.2 slot driver could just check if the USB port (port@3) was
> > used, and just enable the USB / BT pwrseq target at probe time? That
> > would mean less changes needed.
> >
>
> That sounds sane to me.

Mani seems to be against this idea though, since as I mentioned it decouple=
s
the timing of the power sequencing from the USB subsystem completely.

Ideally we want them to be linked.

So I will take a stab at option one for now, incorporating changes you
requested:

- Drop the pwrseq API change
- Use the firmware node API instead of the OF API
- Tie the usb_port device to the "port@N" node

And we'll see how the USB folks like or dislike it.


Thanks
ChenYu
