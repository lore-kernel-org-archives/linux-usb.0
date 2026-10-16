Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4B22E62B3
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 03:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120101; cv=none; b=UbIm2SRoywDNmmpmP4rw0UkIPAPO5vVYG5a/fDMvfGIdcZIQwLu+1G0emqMjxl0Rh8enzgUUuiD2Nwq7esZtD8NZPRWCgRS0FzY9NZSY8SX1RJvvJlIUCc7h8dhC3lcnu7GazgDeV48ygtIJuB9R1Dj2ShMtJ+pYY7kDiAD31Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120101; c=relaxed/simple;
	bh=10nqLsQTTfQgYbUM797LDF87efLT8v1IfDqqCZil33o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcndfvOSiubdc5/lVSuLg9xmAcUgsUG44AWV+0u0JPxqnh3/T8ttK1gWuubjwLcKsqhZsBlIypK3DtnJNoXYI4+/wjppvMekHg4umeSRBGkJnf/DO6c2DW7ZSUKxpCarX2UNT0MZH6WY6L9KZfcTrQ+7JY+LLziwMaGiMe0C19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4786555ad.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 20:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120100; x=1792724900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7sEcXH37f0tH5wRZjkmvVXjFOaB+9cAQdh/V2489cI=;
        b=SOnoOxH74ATuE0Q9tqLkX/yHO3nY7ehHo87ELUkO+scssjRRpudIXJsDitBxJwIxoA
         NY8r9KMvbEJrQ8uz3t/kHWGycsDA4SdDcEjjNwCcTpbULV3xTsFHkhGr/8GuOlT9ccV+
         MtD+Ug13F8mmKjq+OI+7mE0Khjdy+bAaj+z7Uhjw9f80UjMS/iwCZWEoNlvAyu+hRkxf
         0MB51hQNfmX0e1VNbH7XPwdzRjfkGThInqRq3bFQovQHjGmrB2hAeWoLU6oU8P4BLJun
         WSFg4kU7ghmA4ZhQ3IGooNFjwP8ugzLQDqRp5FAAX8+fgOVa33mae4ECXuDxiMy9qKm3
         zJ+Q==
X-Gm-Message-State: AFq9FYKLxY0uL89ERgF8Rx7Atdi5hJfoI6pgL1ejnQOu9Xh/wtHcUc6q
	L0Ix+R0RKME3F8qLMN07+RzXRvV6frqjoJ3WnruNgh3ZB185l3bUY6PJGIFsyksrFqA=
X-Gm-Gg: AYBFou2vMCa58fmt0M96ESdr1uS/YLHM7EFeO5DenpwakPMKdFP3UzebxnnWLGMDOk5
	knbdrGarNT9uAX5dt9OqnwTUzNaEPsnfk3S275zWo50sqIyTHDTlt6J4ra6FOdmvsEgY68MudN4
	SKISs2oZ8oa/Sr94FZijl/eUPKweVYmhoVUqydkB4zubARKRnQtPo1uWTUgZI5fEfJsdBx0BEiG
	c+J5pzJNLTwhBZB9xC/Q0GJF26nhhRtU1yb7Dl+nRf+GnomZMOq0Ei8u2+AuiGt9NuUS3+7RfBS
	m3k+k+Tlsfz7xXOtkiFDR3dErSCfynscAXnK31gLV+xM1641UAe381Rt66z2fe1KUwiZVCIJS9J
	GQqXYycvJQXpUZz57h7S3mPLVT438ukhMwQ8iV7sPPkf8hN83mt6j7FWsNXJnI6u5rrwcyZ6Xvk
	hVQJkCwQReXLeDg2wdccvbHg+KVDMwxL6XJkt/4IzpNjJj2PQSavsgVDpribk0/21wvdecWuEzl
	wiRiDaGW0yGd2WqHxz2QVnlljjo/FObsrjhbJLbfEQPevozPB5KaE29KLeKE7hy7EXzJJqAmmnO
	wWk=
X-Received: by 2002:a17:903:1a08:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2e977568618mr14326925ad.28.1792120099672;
        Thu, 15 Oct 2026 20:08:19 -0700 (PDT)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e835063sm3309315ad.33.2026.10.15.20.08.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 20:08:19 -0700 (PDT)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so739165eec.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 20:08:18 -0700 (PDT)
X-Received: by 2002:a05:693c:8097:b0:35d:5e81:1d87 with SMTP id
 5a478bee46e88-3602ddd6208mr2385682eec.12.1792120098234; Thu, 15 Oct 2026
 20:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev> <sashiko-outbox-173543@kernel.org>
In-Reply-To: <sashiko-outbox-173543@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 15 Oct 2026 23:08:06 -0400
X-Gmail-Original-Message-ID: <CAPY4CJ7BEa_cmAYiVUdWmRnO4H6ddQJTO_bEZSBSEFh=kChm=w@mail.gmail.com>
X-Gm-Features: AclHuK-6Dfqf-lD7fob5OF5YK8VRSOSLqirzEsT7JpUiorRplDbN6X4TAeDIG8s
Message-ID: <CAPY4CJ7BEa_cmAYiVUdWmRnO4H6ddQJTO_bEZSBSEFh=kChm=w@mail.gmail.com>
Subject: Re: [PATCH] usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300/CE2600
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2026 01:22:42 +0000, sashiko-bot@kernel.org wrote:
> Since this hardware selects host mode via USBMODE_EX (offset 0xc8), the
> standard USBMODE register (offset 0x68) may read as 0. If it does, will
> tdi_in_host_mode() falsely return 0?

Yes. USBMODE reads back 0 on this core even while it is running, so
tdi_in_host_mode() returns 0 and ehci_halt() returns without stopping
the controller. I confirmed it on hardware: after ehci_shutdown(),
USBCMD.RS is still set. v2 will read host mode back from USBMODE_EX
for this core only, via a new flag set by the CE5300 quirk, so other
has_hostpc users such as ChipIdea are unaffected.

Testing this also turned up a second problem: ehci-pci reads SBRN and
the port-wake bits from PCI config 0x60-0x62, which this core doesn't
have (those bytes shadow a BAR). SBRN reads as 0, so the controller
reports "USB 0.0" and ehci_shutdown() returns early, which hid the
issue above. v2 will skip those reads for this core as well.

Thanks,
Joseph

On Thu, Oct 15, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: ehci: tdi_in_host_mode() fails to check USBMODE_EX
> --
>
> commit 493a630291d0b5961a888e40fa36840fea16fbf5
> Author: Joseph Telaak <joseph@telaak.dev>
>     usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300/CE2600
>
> The TransDimension EHCI core in the Intel CE5300 and CE2600 SoCs
> (192e:0101, revision >=3D 6) has the Moorestown-style register extensions=
:
> host mode is selected in USBMODE_EX rather than USBMODE. This commit sets
> has_hostpc so that USBMODE_EX reads back 0x23 and devices enumerate.
>
> > diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> > index bd3a635555942..8c71c3de3082e 100644
> > --- a/drivers/usb/host/ehci-pci.c
> > +++ b/drivers/usb/host/ehci-pci.c
> > @@ -145,8 +145,16 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
> >                       hcd->has_tt =3D 1;
> >               break;
> >       case PCI_VENDOR_ID_TDI:
> > -             if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI)
> > +             if (pdev->device =3D=3D PCI_DEVICE_ID_TDI_EHCI) {
> >                       hcd->has_tt =3D 1;
> > +                     /*
> > +                      * The TDI core in the Intel CE5300/CE2600 (rev >=
=3D 6)
> > +                      * selects host mode in USBMODE_EX and reports po=
rt
> > +                      * speed in HOSTPC, as on Moorestown.
> > +                      */
> > +                     if (pdev->revision >=3D 0x6)
> > +                             ehci->has_hostpc =3D 1;
> > +             }
>
> [Severity: High]
> Since this hardware selects host mode via USBMODE_EX (offset 0xc8), the
> standard USBMODE register (offset 0x68) may read as 0. If it does, will
> tdi_in_host_mode() falsely return 0?
>
> drivers/usb/host/ehci-hcd.c:tdi_in_host_mode() {
>     ...
>     tmp =3D ehci_readl(ehci, &ehci->regs->usbmode);
>     return (tmp & 3) =3D=3D USBMODE_CM_HC;
> }
>
> During driver unbind or system suspend, ehci_halt() relies on
> tdi_in_host_mode(). A false 0 return causes ehci_halt() to exit
> immediately and completely bypass the teardown sequence (clearing
> CMD_RUN and waiting for STS_HALT):
>
> drivers/usb/host/ehci-hcd.c:ehci_halt() {
>     ...
>     if (ehci_is_TDI(ehci) && !ehci->no_tdi_mode &&
>         !tdi_in_host_mode(ehci)) {
>         spin_unlock_irq(&ehci->lock);
>         return 0;
>     }
>     ...
> }
>
> Can this bypassed teardown sequence leave DMA and IRQs active on the
> newly enabled core, potentially leading to memory corruption or a system
> panic? Does tdi_in_host_mode() need to check USBMODE_EX if has_hostpc
> is set?
>
> >               break;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ehci-ce5=
300-hostpc-v1-1-3cae67c11946@telaak.dev?part=3D1
>
