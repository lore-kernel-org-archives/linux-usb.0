Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20183CC7CD
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841332; cv=pass; b=eIRcph/ZI9Jn0rPjTnHE4dt0qx0i2bh04kccEep4rpOJfUSYu3cVrMZy4fxK2CAFW3nxdMho0+e6VYJYBVvQf1bxziN5ZrjwCKoYFIIyXz6H8bxgysbOGSru0VAI6qpwmhTkJ7KPGBoVwrNPkrfmKr+1yEo4qPUX61+REBXrvxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841332; c=relaxed/simple;
	bh=XCl8xyjwz1MPEFOUUNwzlCG1qvgeKDlzz49S+/GUXKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CX9/dBG5QOcNpUMGuRBNi95Y8VrCrc67Pc0JnMhYcl2lBIqCg5+kfAFJlAuNJEo6qIoyxkc6ObKb+sEpQ/V5qLTuVT1dzev4i5uGb7bNdEXp8z3gO/oCOspRb2/z33jVrejuOtzYl/PWmKaYyLpd+wvQsFhwgzALNK8NuQpV1r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6H8uvWI; arc=pass smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6H8uvWI"
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5d4129be80fso906840e0c.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 00:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841330; cv=none;
        d=google.com; s=arc-20260327;
        b=sYVhmv+9f2s5BXBY2ELLspRtGpVpBlTwO2hNgLIL0fR5IlMqZckdBp2Ok4ISHEASxS
         secJztBmQNKV8A+mhoUCaDsajEoXnr8LlRN03xF+ZbZuBCvAHQ12Cp7AWfd1upwlo2mV
         mcTkyQwc93ExBYmzpQX4D8+E1zB4CaDQjc2MyD6lY/LuShiR9SK6Qs/TDtwwe8PRnogc
         Uji1gBzdT6sEHmi+Zr/x6ZpVwRKPnDV2zcq0xa/KzboiVDHoUXpve4TZtI6cPxvBJcDS
         G/56wWEvpXdexfc7HSJ/DBpY3Cz3kSRK4H9VHHhuff1bMxGyaj5Evp4m/yzH19SV2e8j
         eS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5BYYGSPF6Zoletn6ltYDxBcpmXppLLT7dUQEfUfHyI=;
        fh=y8RGI6gDHS7l+p85cKw3zoWbVRUjOfS2mj3VxVQhOdw=;
        b=kXB3erpoVqSvsTANpDdffAlUlR2xtVM54IIjZosKvXOsFM0sQSgYaBf5WpeuM/aDjT
         UZrtbHkFaGzLgo1bbhuJYrFIk7VpQfk4ILutw5UVU6Yr3jPHfuxvbeJBdCnY4Ir7XuRW
         a+IbTds33J6kVzneIci29XCRDnD3NXLQqRiN8BoFP7GmWxOlIFOJrett10A9nvySK2ls
         oedKcfq1K06J4Lcf+KzoiC+Ngi2kQUFr8ssGLvwXwEflA16j45vAa51UfAYWp8y6XkP2
         /bOM3bdcQ3rebwO7eZW91sBQ1vGzofa4KMJLmlodAOGPtV0UfRAteWX/6ICx5uUctVr8
         zuhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841330; x=1791446130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5BYYGSPF6Zoletn6ltYDxBcpmXppLLT7dUQEfUfHyI=;
        b=p6H8uvWIpALTOG2og0xDKvwDf49VJ1tdURb+lIyJ/iH5GcFB66nl3b8NxsJ941n2EQ
         46bjJrjjlzpOWyreWxtU1wwCViVroX8640S5dl+X173erHidFMmYpSoa3P4nxwnHnXog
         9l5j790c9QmnjJNcg0AW7993gRl5lgucZTVcBFgGXqqW5LLTwM97OrLG/tLbbovkSUUm
         4BjdLjHQm/4eXH6xa/dYMKqnuVO+9QQiEjXOjMY9OuxmVb85V1hyH8AetCbZolTXqcEM
         bDRx9tTHWPX7drh+THHcSYOdvG28ZP3FGLcbeQBAKuSRvYKcYrrLQ9F4yqfmV7je5Rxc
         50Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841330; x=1791446130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5BYYGSPF6Zoletn6ltYDxBcpmXppLLT7dUQEfUfHyI=;
        b=ZLEUp1iprKbDcvf4f13Qbw3zlLXyPxmVv3BNgHWTM2nxOzlg3TRcIBgdqIrZe2br5E
         TKuszz8Te50Z2PtyhmxYCPF1ydk+0VJFf4rtBBZrM1jLm+L4CEubte8baUGCCMDm1HkU
         1JKk/4ofKsvhNUZQxhS5sY0xeXOc84uzo0Z4Gy2bn2vkLHNFwzqMEmIau8LJ3NbpWam4
         37eGQZ37R8RbYd3hDqqktMbUwU1gcRkJL9KOfLaVgWSqkOVcXQewQFCm70uWaoSMwz3/
         UxApWArIKPWSFfJveHg+gGJuqeuVvvu55VCxTxKfSANq14CZkxJnKR48hZXOG4qrTYz6
         dBYA==
X-Forwarded-Encrypted: i=1; AKwUvBzwg8sHsIJrSRaChz1OUmxhjRMeYZgG7JAYEARU21TYtkwAaq4zmmtGW8klAaWgGBuOzNvTOJTVd2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmkow41kaDeSEyXASYp5wd2PRURdlTBLrsP/JGkV1qz0tQ1sRk
	2WGKV6bXne/3RUgj3tMGSg6SQFlrFaonGvsYSi1MUiCZTyzxOh8qnjkvRu0a83Yo8wFHjfKDsEJ
	u0UDw8sv2otjwZ2jBKSi4TNfKpfRG0s8=
X-Gm-Gg: AYBFou0RL+IgOn1EYgfhT6vBY+4q1dBHh3d65Ap8gUudP+FUSCPMBvsw+tijK3JX1av
	qq8xnIp330G03scnzmm4txU1/He9P1qN6jJuXRkOIToYucInQrHjIX97xG8RnlH4HHaPN3OyNpx
	yVDfKozcJrIKOEHvn8x4l8PC/NiSYbpYLqGG7GMLY5BMkmQ7pmmUYqzxQhdEsXNTBMAIMVNdilD
	2OmWc/6d7Ao2lK7Y/oHZPc5IJwaLqECxhyw+yytCRp6nunO2rvdvo67RYAq3JxSx+/qN54KNQyV
	Ob4vDCjNrR8dGr3mTNIZJHq102iPB+Yo46KZpPAg2CtPgd7wN3/Hk2vnYwp8ft50aQ4=
X-Received: by 2002:a05:6122:62a6:b0:5c9:a60b:e5ba with SMTP id
 71dfb90a1353d-5d67d65ba04mr1209917e0c.10.1790841329348; Thu, 01 Oct 2026
 00:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFpUU0sqt2VzdGGUcx3fkLyyDSynOhNgAraT7-gL53oBq1aMfw@mail.gmail.com>
 <20260911090800.GZ106095@black.igk.intel.com> <992676e6-6769-d72d-9ef6-94c1ba758992@linux.intel.com>
In-Reply-To: <992676e6-6769-d72d-9ef6-94c1ba758992@linux.intel.com>
From: =?UTF-8?B?6bOl5LqV5Y6f6IyC?= <monogokoro2026@gmail.com>
Date: Thu, 1 Oct 2026 16:55:17 +0900
X-Gm-Features: AclHuK9dURNIpTpFFdfJheY9SY2S733ZRrXjiUeK5gVq-RK-4PMato9U7MvWTGI
Message-ID: <CAFpUU0sXiJyZ=pUo5n+88DwPc4Rxq_c8LTiO81=ZzfOaEqkCRA@mail.gmail.com>
Subject: Re: PCI: Resizable BAR never considered for Thunderbolt/USB4
 hotplugged eGPUs
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pci@vger.kernel.org, 
	bhelgaas@google.com, linux-usb@vger.kernel.org, westeri@kernel.org, 
	andreas.noever@gmail.com, YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you very much for the detailed reply! I'll try the patch when I
get a chance and share the results.

Best regards, s-tory.

2026=E5=B9=B49=E6=9C=8829=E6=97=A5(=E7=81=AB) 21:17 Ilpo J=C3=A4rvinen <ilp=
o.jarvinen@linux.intel.com>:
>
> On Fri, 11 Sep 2026, Mika Westerberg wrote:
> > On Fri, Sep 11, 2026 at 05:58:26PM +0900, =E9=B3=A5=E4=BA=95=E5=8E=9F=
=E8=8C=82 wrote:
> > >
> > > I am reporting a case where a Thunderbolt/USB4-attached eGPU is
> > > enumerated and links
> > > correctly but can never be used for compute, because its BAR stays at
> > > the power-on
> > > default of 256MB and the Resizable BAR capability is never exercised.
> > >
> > > I am not sure whether this is considered a known limitation or a bug
> > > worth fixing, and
> > > I would like to ask before assuming either. I have the hardware and a=
m
> > > happy to test
> > > patches.
> > >
> > > Environment
> > > -----------
> > >   Host:      ThinkPad X1 Carbon Gen 13 (21NS0000JP), Lunar Lake
> > >              BIOS N4BET77W (1.47), 2026-06-30
> >
> > I don't know if we support REBAR or how well in PCIe side, Ilpo probabl=
y
> > knows that. Typically there is just certain amount of resources allocat=
ed
> > for each PCIe root port that gets tunneled so the way to do this is to
> > increase that in the BIOS. Having said that most of the vendors don't
> > actually allow it to be changed.
> >
> > >   Kernel:    7.0.0-31 (Ubuntu 26.04.1)
> > >   Enclosure: AOOSTAR AG03, connected over USB4 (not OCuLink)
> > >   GPU:       Intel Arc B580 (Battlemage, 12GB), driver xe
> > >
> > > What happens
> > > ------------
> > > The card enumerates, binds to xe, and its edge connector trains at
> > > 16GT/s x4, which is
> > > the expected ceiling for a USB4 PCIe tunnel. The link is healthy.
> > >
> > > BAR2 stays at 256 MiB. The card advertises Resizable BAR support for
> > > 256MB..16GB:
> > >
> > >   # cat /sys/bus/pci/devices/0000:24:00.0/resource2_resize
> > >   0000000000007f00
> > >
> > > Level Zero (intel-compute-runtime 26.31.39395.13) prints
> > >
> > >   WARNING: Resizable BAR not detected for device 0000:24:00.0
> > >
> > > and then drops the device from enumeration entirely, so it never
> > > appears to any compute
> > > API. The integrated Arc 140V is enumerated normally.
> > >
> > > Why the BAR cannot be grown after the fact
> > > ------------------------------------------
> > > Attempting the resize by hand fails for every size down to 512MB:
> > >
> > >   # echo 0000:24:00.0 > /sys/bus/pci/drivers/xe/unbind
> > >   # echo 14 > /sys/bus/pci/devices/0000:24:00.0/resource2_resize   #
> > > 16GB -> fails
> > >   # echo 9  > /sys/bus/pci/devices/0000:24:00.0/resource2_resize   #
> > > 512MB -> fails
> > >
> > > BAR2 is placed at 0x2010000000, which is only 256MB-aligned, so a
> > > larger size cannot be
> > > aligned to the bridge base. The prefetchable window of the Thunderbol=
t root port
> > > (0000:00:07.0) is only a few hundred MB and comes from firmware:
>
> The usual result.
>
> > >   PCI: Using host bridge windows from ACPI; if necessary, use
> > > "pci=3Dnocrs" and report a bug
> > >
> > > I measured 711 MiB and 448 MiB for that window across two boots.
> > >
> > > Things that do not help
> > > -----------------------
> > >   pci=3Drealloc                  no effect on already-populated bridg=
es
>
> This was my discovery as well which blocked my Resizable BAR aware
> resource sizing from doing anything. I did some work to solve it but then
> got regressions from the earlier resource work to address so I've not had
> time to look into this for a while.
>
> Solving this is among the last few blockers for the resizable BAR-aware
> resource sizing (sans the yet to be discovered bugs in the resizable
> BAR-aware code itself).
>
> > >   pci=3Dhpmmioprefsize=3D32G       makes it worse: the Thunderbolt
> > > downstream port the GPU
> > >                                sits behind gets no window at all, and
> > > the whole card
> > >                                disappears from the bus:
> > >
> > >     pci 0000:22:00.0: BAR 0 [mem 0x00800000-0x00ffffff 64bit pref]: a=
ssigned
> > >     pcieport 0000:21:00.0: bridge window [mem 0x00800000-0x00ffffff 6=
4bit pref]:
> > >         can't claim; no compatible bridge window
> > >
> > >   pci=3Dnocrs                    the machine does not boot: the NVMe
> > > holding the rootfs
> > >                                fails to get resources and probe retur=
ns -ENOMEM
> > >     nvme 0000:04:00.0: probe with driver nvme failed with error -12
> > >
> > >   thunderbolt.host_reset=3D0     no effect here, and I believe the
> > > reason is that the
> > >                                firmware never enumerates the tunnel a=
t
> > > POST. The eGPU
> > >                                first appears 63 seconds after kernel
> > > boot (16:05:11 boot,
> > >                                16:06:14 first sighting of the card),
> > > i.e. purely as an
> > >                                OS-side hotplug event. There is nothin=
g
> > > from POST to
> > >                                preserve.
> > >
> > > The BIOS has no relevant setup option: under Config > Thunderbolt 4
> > > there is only
> > > "PCIe Tunneling" (on/off). No Resizable BAR, no Above 4G Decoding, no
> > > BIOS Assist Mode.
> > > I have filed a separate request with the vendor about that.
> >
> > BIOS assist mode is a workaround for early Windows systems that did not
> > support native PCIe hotplug. It should not be used in any modern system=
s
> > and I doubt it's not even capable of what you are doing.
> >
> > > What I think the underlying issue is
> > > ------------------------------------
> > > On hotplug, the PCI core reads the BAR at its power-on size, sizes th=
e
> > > bridge windows to
> > > match and assigns addresses, all before any driver binds -- and the
> > > ReBAR capability is
> > > not consulted at any point in that path. By the time a driver could
> > > ask for a larger BAR,
> > > the surrounding windows are already committed and too small to grow i=
nto.
> > >
> > > This looks like exactly what "PCI: Allow BAR movement during boot and=
 hotplug"
> > > (Sergei Miroshnichenko, v9, Dec 2020, 26 patches) was written to solv=
e
> > > -- the cover letter
> > > explicitly lists Resizable BARs as a use case. As far as I can tell i=
t
> > > never landed:
> > >
> > >   # grep -c -e rescan_prepare -e rescan_done -e bar_fixed -e
> > > movable_bars /proc/kallsyms
> > >   0
> > >
> > > Questions
> > > ---------
> > > 1. Is ReBAR-over-Thunderbolt-hotplug considered a known limitation, o=
r
> > > is this worth
> > >    treating as a bug?
> >
> > I would say here that it's not even related to the underlying transport=
,
> > could be something else than TB too, as long as PCIe goes inside.
>
> It's a known problem, but fixing it without introducing regressions is no=
t
> easy. The solution must be able to fallback gracefully to smaller sizes
> as needed. Without that, a regression that will surely come up soonish
> would just lead reverting the improvment.
>
> > > 2. Is there any current plan to consult the ReBAR capability during
> > > hotplug resource
> > >    assignment?
>
> Yes, infact patches already exist to consired ReBAR during resource
> fitting, but they just don't run as is when a bridge is already assigned
> so more work is still needed once I get the most recent set of regression=
s
> out of the way first.
>
> > > 3. What is the status of the movable-BARs series? Is it abandoned,
> > > superseded, or waiting
> > >    on something?
>
> I've no plans on basing anything on that work.
>
> > > 4. Is there a kernel parameter or sysfs path I have missed that would
> > > let the BAR grow
> > >    after enumeration?
>
> In some cases, removing siblings that pin any of the upstream bridge
> windows in place prior to executing the resize may allow the entire windo=
w
> to move elsewhere.
>
> There's even a patch from Geramy Loveless that would do this automaticall=
y
> for empty siblings [1] which is definitely worth a try. It does not work
> universally, however, so YMMV (I don't see your /proc/iomem anywhere so I
> cannot tell whether it likely works in your case).
>
> Somebody was against Geramy's patch as it didn't (and kind of doesn't
> even want to) ensure the unused siblings would be guaranteed to be
> allocated at least some space after the resize (any unused hotplug
> reservation is "optional" so it would be a major change to alter that
> differentiation to address that review comment).
>
> But if that patch works for you, sending your Tested-by tag to its thread
> might actually be helpful.
>
> [1] https://lore.kernel.org/linux-pci/20260428225146.3104063-1-gloveless@=
jqluv.com/
>
> --
>  i.
