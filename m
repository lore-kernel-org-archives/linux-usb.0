Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1223563D4
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612884; cv=pass; b=hN6QeD832K/w1DVgcQ08nFMxuhmLPGnp2KDpfvC5BSNPas5eTEDvIorZ0enBswTGzskgK32e2hasII58BhwDlg6nvyGfJRWv6hjtIVPqs2zCBd2deRzXDCFoA28XzXHwCGbDETQSEtoki8yJJkH2wxdqTmdfF1GbGtbwwZWPK24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612884; c=relaxed/simple;
	bh=G8zzM9qmYpt775/3br4OAMATnmvr5g6ud1SGUCgAwUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYqQN0caOIp6B9dz4IN+AUeNpk+NbHnP1rnEvyk//15E5PUooGj4VsHFa7FTtYXu0NFiihPSjAxm1xxJHLb/UA9RHuqNNPxMuzLtEbepUa0IkRm2hCzHyeP+cQut4rurfvS3lfyQGXtCQEWdz5LJsAiH2FEtS76koPwbGID79Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKg/OM5F; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKg/OM5F"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso219279fac.2
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 19:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789612868; cv=none;
        d=google.com; s=arc-20260327;
        b=lNTMI5V5Y4KDyFbcGc/J3SV8KYVn5CQiHldqIIkO4gavnWAXfsXQuCaZv3P46J7oCd
         j6/zc1dWZPZDga3mlIjfLXGVV9jM20pHd5e2OFCAqKGUoP6iK5q0A4FtdULLxLj1SuPn
         sP0zt7cqFFBu2xoHlk/xVPDX/ZcorUN+ChjW4KCN2vhSLeCOsepKCmjhmBVMOc3YN48N
         +xi/u77kx5DNdt0Iotrbn8rroSW1z7G0ap3/F+Ac30rGD1D9GTIC6NMoJ/3aV+Fco93B
         xjBUheFhBaw5aMqtIudlfs73vF8Ka61JlxaJx8JEIUooUYARaeJ89LUSU3LsYoP7oxuG
         Zsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ci3fgQ24cEgXmWvhEyM+zaW4qg0yEAvWrv2qFkjZsCc=;
        fh=bKgBQo3W9BJj3FSVwsqaNhv2utYjesPAie1B40yXZbQ=;
        b=amYeKqX4ZE/oREJLG0SwR3kXfk65jL5MQtbvgKM4wQVCpbyKjm2IBut7qzv+qXYXVp
         TPDYI0rSOyj9qA+vAP18SXHhkomq6zdDk5rC3jSXPqgaezWMsWS8G4g6JnTYLMYBi9dl
         j44Jmlte3ZRqq4DypLGGvNz76hLkQtFJwpzbje8mShw2Jnk5dyruNFlqstr8faB8rs7O
         HY+c/sk9PbTa9DrwjbjO6YX5GAUV+9GxWlC7oVS6npI1FRygrRf8cc9eunwC+7OLcefn
         NqtioJx7TWDJSGFKooKqMkWnkQQZrbNzvB5HXWP0BmAz+on2tY6hEbOFlaBumlp77A1p
         LmQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789612868; x=1790217668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ci3fgQ24cEgXmWvhEyM+zaW4qg0yEAvWrv2qFkjZsCc=;
        b=qKg/OM5FPYTdEVjiGTDckH4DR+zs6zxMnwqIaYDuo9U6xBfnmGjtvt/vhUU11WtRuD
         6VVFqUpNtE9Qf/VO5Ja9A3m09W9o+q3g/ZKISoxCacvKCQb85WlXFLj67Z7UpyXjgVlM
         TEVhPMcR3bDchZqNTbjKijcmoyYqXrTS88WEhNRQjgcdmXCpvFWzbGUfHC89a9+LTidx
         nXUyFs2L+ScIxpx2b9RSGZvAU/XRYks0AFkioD5tXUcNVG/2iM7DQvCoiGyt3DV56lo5
         CLOHDWDA/GAptTogGkD04gwefVZYn+YtF+pXLHqBTFGRCHXzpiuoHSBY9mk7v8fWlJ3K
         PYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789612868; x=1790217668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ci3fgQ24cEgXmWvhEyM+zaW4qg0yEAvWrv2qFkjZsCc=;
        b=gGFhN4nimVeGbIfIlscDzRNO5cK9xTDIpIsFuWytsgXa/YfsnK5t+jSfTyx//EBZXi
         X5pX2BcoTdWNi7UQxMoUSvEEBOOnBApk8S+J+u/a1WdO3NbAPfZSiYPibFSjnkYi32xp
         tLKOc78PkPtjlGz4YWdvzUE6UfaqgREx8YxgrgSW6/jB8UHEurfux39YTKZrT2S2bycH
         5Pb0g1PYElaIzkpcgD3WyzYcmr5t7zoM9GSIfhPWlVu9LCRiuuaGy/RuVoxd8WW/ABcL
         cot1bApGYVdO9rysjdc7KW95ny39+y68U6t4LEj9etPBOwwpKlvHXsBp/OMP+T/ay/A9
         dDew==
X-Gm-Message-State: AFuF++nxgTFTeT46JgF988//IizaSPjeVzKpt6cYyW2yYcMwnTT+Y9Po
	BAN5S2Phm7QySbn+T8nPkB3IRJv6wiHrqS91ouA+VA7WYlW5MMwJZS9dZk8ZkrNLSp/+VVsjEZU
	d5nTldLRzSiwPBPIj0IiQaNpNvQqhU4I=
X-Gm-Gg: AYBFou3Vk0EVM/IQ4lmDtRlv2fgBdWKmHzerBqsLTexPnzgZ7rEAMeES2r4gnIEpJy2
	UazAOTd0f/Xe3+BbTaL90bHwDeFe0pCtaZwRJHld7ULxFPjFKUhOTBMsNgtVCAH39bP8l4Wm9Dq
	tRJ0w564j3KwCcREU8MkXAfpHvBCR0z0eGaCXR8sbRIFrxjv3+5IebB3DpCQGcQ5kbEcbFqDEZE
	Qiu2HZwF2nZzxTTPks/B7ZSllJxulqk6Vk3EEZDOANqtQAVmjhxqYbELhU+kuDToDKwdsE1esKn
	ZgikkAXGA3lbOVrrvvzgvtv8CYR0YScDHSfpnXhYfeLWkar/9m406HFvdApe4/NWpnbIvr1xi+a
	iu9pJwpCRO/c=
X-Received: by 2002:a05:6870:b2f3:b0:46a:8e29:4a03 with SMTP id
 586e51a60fabf-48475e85744mr4777594fac.13.1789612867858; Wed, 16 Sep 2026
 19:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com> <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com> <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com> <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com> <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
In-Reply-To: <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
From: Ben <benstaples10@gmail.com>
Date: Wed, 16 Sep 2026 22:40:55 -0400
X-Gm-Features: AcwNN1Wo_wbDrQuY_zaZxVqZKgJMXWVlP1PCoE-H7BsPBQHHtsOW95CCDdibFwE
Message-ID: <CANcA1gA-SVC=GJnw6u7cN-YNd8er=RYynqeDZgKKmvkmM+8BQA@mail.gmail.com>
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org, 
	YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the spam to individual emails, apparently I still do not
know how email works.

Ben

On Wed, Sep 16, 2026 at 10:18=E2=80=AFPM Ben <benstaples10@gmail.com> wrote=
:
>
> Mika,
>
> The TCM bit is set.
> I have tried two cables. The cablematters premium 40gbps thunderbolt 4
> cable as well as the apple thunderbolt 5 pro cable. Both the 1m
> version. I believe they should be passive.
>
>
> > 0x00a2 0x00003701 0b00000000 00000000 00110111 00000001 ..7. PORT_CS_18
> >   [00:07]        0x1 Cable USB4 Version
> >   [08:08]        0x1 Bonding Enabled (BE)
> >   [09:09]        0x1 TBT3-Compatible Mode (TCM)
> >   [10:10]        0x1 CLx Protocol Support (CPS)
> >   [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
> >   [12:12]        0x1 RS-FEC Enabled (Gen 3) (RE3)
> >   [13:13]        0x1 Router Detected (RD)
> >   [16:16]        0x0 Wake on Connect Status
> >   [17:17]        0x0 Wake on Disconnect Status
> >   [18:18]        0x0 Wake on USB4 Wake Status
> >   [19:19]        0x0 Wake on Inter-Domain Status
> >   [20:20]        0x0 Cable Gen 3 Support (CG3)
> >   [21:21]        0x0 Cable Gen 4 Support (CG4)
> >   [22:22]        0x0 Cable Asymmetric Support (CSA)
> >   [23:23]        0x0 Cable CLx Support (CSC)
> >   [24:24]        0x0 AsymmetricTransitionInProgress (TIP)
>
>
> On the options, noted. I will keep them as standard as possible.
>
>  And yes, this is a PCIe add-in card. I poked around my BIOS a bit and
> was not able to get it to be recognized on boot. All boot provided to
> you were performed with these options set:
>
> > USB4 (ASM4242 Controller) Support Disabled (mutually exclusive with Thu=
nderbolt Setting)
> > Thunderbolt/USB4 (Intel JHL8540 controller) Support: Enabled
> > Thunderbolt/USB4 (Intel JHL8540 controller) Security Level: No Security
> > Thunderbolt/USB4 (Intel JHL8540 controller) MMIO Resource: Full Size
> > Thunderbolt/USB4 (Intel JHL8540 controller) Wake Up Command: GO2SX
>
>
> I also have IOMMU enabled.
> I tried a boot or two with different MMIO Resource settings (3/4 and
> 1/2) but that did not solve the problem.
>
> Best,
> Ben
>
>
> On Wed, Sep 16, 2026 at 3:51=E2=80=AFAM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Tue, Sep 15, 2026 at 11:01:20PM -0400, Ben wrote:
> > > Hello,
> > >
> > > I've tested the plug after boot method, and it seems like it is worki=
ng to get
> > > the dock full resources and stay stable.
> >
> > Okay.
> >
> > > For the second question:
> > > It appears to me like the dock's xHCI is showing up as a distinct PCI=
 device.
> > > (0000:0c:00.0 Goshen Ridge) instead of tunneling. I've compiled toget=
her some
> > > evidence towards this from my investigation in attached md file.
> >
> > Your Thunderbolt/USB4 host controller is using firmware connection mana=
ger
> > so we have quite little visibility what it is doing. However, I know th=
at
> > it follows the same "rules" as the Linux software connection manager an=
d
> > only enables the device xHCI if the link is not USB4. So if you are usi=
ng
> > passive TB3/4/5 cables you should get USB4 link and also active TB4/5
> > cables.
> >
> > You can verify this using tbdump from tbtools [1]
> >
> >  # tbdump -r 0 -a 1 -vv -N 1 PORT_CS_18
> >
> > Look at TCM bit. If it is set then the link is TB3 and you get the
> > integrated xHCI for that reason. Of it is not set then something is wro=
ng
> > and we need to investigate.
> >
> > (or -a 3 depending on which port you connected the device, tbadapters -=
r 0
> > shows the active adapters).
> >
> > [1] https://github.com/intel/tbtools
> >
> > > Also, if it's useful I tried a cold boot with connected dock with pci=
=3Drealloc
> > > as a boot option after gathering these captures. The control died in =
the same
> > > way as initially shared.
> >
> > Better not to set any non-standard command line options. They typically=
 do
> > more harm if you don't absolutely know what they are doing.
> >
> > In your case if this is a PCIe add-in card then it still requires prope=
r
> > BIOS support for resource allocation and power management. Otherwise it
> > will not work as expected.
