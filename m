Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0CE36215F
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323382; cv=none; b=n6oELi1hwpT5qlGkwO2GDIDDH0RZLfskLcRJghllLp6X6WIN9DG/LRHMmE7Rf3SycPTSD6OeajRWLD87wlL/MQxsEV1uMJhzdoPtZGe5yO+n1MUDWi9hUceWKAsVduGrcAcRgpi+8LjY2dnvlU5CmPgbwJemDWc2mBwNO62Najk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323382; c=relaxed/simple;
	bh=M+ZrfpMpOAvEiG18evASm296Y9dE9aa72dNu8OVc2gU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aodWimpVt1vuVDQBOGtqLBnyaqNlroF9vR7Foj1D2p2qI3rBtHmtI0cJeSU7rx53iIxJs07saOeRz4fPDLj7+3zL+y+9xXHFQH/Iaz5eO0UyrbRRh9nk0taBbt1uC0Y9jfEhxlk8/QzFqjl6quL4d/0n2eLKoVVWn8HNXQ+N54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfuwGzHx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfuwGzHx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso858169f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 14:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791323379; x=1791928179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cu+GVkCajxPYQmFp/AWJCNy8qQQm8s58jI6EnwyitRY=;
        b=MfuwGzHxkkIpAHvfAqWShKpF/VOy8g9eTMV/sRmKkSa7I4AafXkmiuKXO4QjBbhTjJ
         vfl1UDHlluQHE8aCWX8qB3wRp9avWDZ4FAf/QtRdgyoH2zTLok4mQg6lt/69Cjdp6mlU
         K9oDUr+Fmf9fNOVlq0nojXJ4won+xiww9p9r1qvqwkWFmKumnZ44VA9GxEpMEGUbn43R
         sCR4nBsGPVYemFtguzzzRkwvmb090ZTOZZ/kwc2cdMe6ElJp/Ihyycej7JmwJDmSapZ+
         QqVBjWZ+pQb9AKKimWybQICTyoPgBxR5Gv6JzpD9L7MMN9eZ8ZS3YiE54hWE1cU+Mq0V
         nD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323379; x=1791928179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cu+GVkCajxPYQmFp/AWJCNy8qQQm8s58jI6EnwyitRY=;
        b=ryMc4IvxJ1BL6Qgykhvy3A4FgVa1ZpYVsNCC9yGs2fvPSiMlpbTrehPF5eeRBOPvKr
         v6QLoEBulhXdcDv6wWa5UHCoZKlmQzPcs3L1TkdK4vF8aYP4vBtnBnzl07SeRZgMHvf4
         MsE/leigVk4lRWCn+PPRYyhwRv05db5HALi33SRMrvgy43e4Gf2rSZ/ogM7gLzK6GPJ4
         BKcR6BSmM1RiKpMCc4OVAt5DHrVYmcCAS6o6wnrkwnzFVqVc+g8416NvkMyiNoI5Nf7v
         gWpF/8HZicsI/QrnUt4SpNGSjGNvwmlpzKEkhCHPiAPwNzxoM0SonToD9hDSr/v89hM7
         +3pA==
X-Forwarded-Encrypted: i=1; AKwUvByy1YX48JseBTEMNEnzwDKa4nVVPgkERZE2rSOL1er6dru0JU7FoFFJNlb+a0VJJf2ludUQ65EugE0=@vger.kernel.org
X-Gm-Message-State: AFuF++kqoOuiNXStiRYRaqKuCwSQzc9LmDxa1dGa1EX0exNcev/k7ANA
	HZ5bz5PeNRBiLzsYCoJbvsQEBds5zi0Kdu/9XNPKioCu3NYwYz8YzUZY
X-Gm-Gg: AYBFou0V5jHEGOD6LODRq/3ihjTW2IvK1JOrdEcn7Ip9bxHaOfYEM51sUKOMwjwLf1G
	6J188FochYo+ydYtu0oMWjDUvmyptFc6LGqzdymapYZwt/zpJ4cyFtpM6xQQaXu9KC2G4uLIVw4
	21Ch1Tyc/clC0BbI1XNgCiwPhcBohp3RGqvko8EFHB3ASN8iEjTH3AcF/Lm2z8iWuK4pqFjBUHt
	X1bDaM+FLubTE62DJr+OrBY9IPHLgDxgYkYNJiwi+dVJ04d76qyVxCr35U2dgWVsHM0eP6HhW4V
	Dwiu32bXwL9ZFestTqZBe3lNx2D5gPpzcvPhKI3t63jdB/sUXRI/ipSF1CTD/qs+68nBV43F40f
	XP96pE8voBPZ1KJeqvbz4AtaozYQIhLCpwCaBfTkbj6oquiKYTfqztaIAaStGFyG75HmaXh3CmD
	hA/3rmxetgIVjScz7o8zLqFqWeU4Yt5SkYWlG7PbDDCl9L/EGQwzmsbPOrm8y9742+0KeCyVDre
	uMmSuEn1w==
X-Received: by 2002:a05:600c:154c:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18043b284mr2285345e9.9.1791323379475;
        Tue, 06 Oct 2026 14:49:39 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm97768435e9.3.2026.10.06.14.49.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 14:49:39 -0700 (PDT)
Date: Tue, 6 Oct 2026 23:49:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
Message-ID: <20261006234935.0c40c635.michal.pecio@gmail.com>
In-Reply-To: <eff5ca07-26a9-40bd-8668-6e6ed69fe587@molgen.mpg.de>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
	<20260506193037.6de9e355.michal.pecio@gmail.com>
	<69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
	<20260512012006.66aeb0c5.michal.pecio@gmail.com>
	<6106b5b9-17d2-48be-8215-3320f3d1d261@molgen.mpg.de>
	<20260512102233.290d3665.michal.pecio@gmail.com>
	<eff5ca07-26a9-40bd-8668-6e6ed69fe587@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2026 17:32:09 +0200, Paul Menzel wrote:
> As a further data point, adding `ppc_pci_reset_phbs` to the command line=
=20
> also gets xhci_hcd to initialize the TI xHCI host controller:
>=20
>      $ lspci -nn -s 0021:0d:00.0
>      0021:0d:00.0 USB controller [0c03]: Texas Instruments TUSB73x0=20
> SuperSpeed USB 3.0 xHCI Host Controller [104c:8241] (rev 02)
>=20
>=20
>      [   14.050249]   Issue PHB reset ...
>      [=E2=80=A6]
>      [   19.339822] ehci_hcd: block sizes: qh 144 qtd 96 itd 192 sitd 96
>      [   19.339919] ohci_hcd: block sizes: ed 112 td 96
>      [   19.340538] xhci_hcd 0021:0d:00.0: xHCI Host Controller

Hi Paul,

Are you still interested in this issue, or happy with your workaround?
Maybe both?

I have some updates:

We learned that the kernel does dodgy things with the FW handoff
protocol, particularly with TI chips. This may possibly matter if
FW is involved. I could supply patches to test this hypothesis.

A suspiciously similar case has been reported here:
https://lore.kernel.org/linux-usb/b43b9d21-4134-4e4c-89d8-f867207b125e@linu=
x.intel.com/T/

There is a new workaround: PCI device reset before kexec. Weird.

> No log `xHCI HW did not halt within 32000 usec status =3D 0x0` (or 0x10=20
> with the other patch). In `arch/powerpc/platforms/powernv/pci-ioda.c`,=20
> reading the comment in `pnv_pci_init_ioda_phb()` suggests, that PHB=20
> should be reset also in the kexec case:
>=20
>          /*
>           * If we're running in kdump kernel, the previous kernel never
>           * shutdown PCI devices correctly. We already got IODA table
>           * cleaned out. So we have to issue PHB reset to stop all PCI
>           * transactions from previous kernel. The ppc_pci_reset_phbs
>           * kernel parameter will force this reset too. Additionally,
>           * if the IODA reset above failed then use a bigger hammer.
>           * This can happen if we get a PHB fatal error in very early
>           * boot.
>           */
>          if (is_kdump_kernel() || pci_reset_phbs || rc) {
>                  pr_info("  Issue PHB reset ...\n");
>                  pnv_eeh_phb_reset(hose, EEH_RESET_FUNDAMENTAL);
>                  pnv_eeh_phb_reset(hose, EEH_RESET_DEACTIVATE);
>          }
>=20
> At least, I=E2=80=99d assume that kdump and kexec are similar, that both =
do not=20
> shut down PCI devices? (Commit 361f2a2a1536 (powrpc/powernv: Reset PHB=20
> in kdump kernel) from 2024 adds (some) the code above.)

Apparently, we try to shut down PCI devices on kexec, unless loading a
crash dump kernel on panic. So as I wrote in the new thread, we already
call xhci_halt() before kexec, the xHC should be halted, and for new
kernel xhci_halt() should be almost a no-op with guaranteed success.

It seems that we are failing to actually halt it, or something (FW?)
touches the chip during kexec, or something else is quite weird.

Regards,
Michal
