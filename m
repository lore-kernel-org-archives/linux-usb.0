Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6D6368276
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787088567; cv=none; b=thAgs/u3lHzvpbtH7OYfLepV5f7zcc+UtNOxywwEaj4q3iyz+p0hVcSU7u6dXKtaB0FgxW94g+xKa9R+mNLzgq136BSJIfu8tsu67cJP+Jkrgb08AwPIUG596knDzUPGU6xHl8YKeYyvBeTGXEiejz/IJClUx+52zRoXJvyi5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787088567; c=relaxed/simple;
	bh=ewuNWNUfbffTEKmpljj0H+UsvOVh2anmkonM1q+K7Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofbS1RsEuC5XOpiJqnSGwoAUGkht8YxBQ+vMnXcCz+WD3in87oAU3QCQExYaGuZOg+mW3HZQ+C7HpGiBzUEjCoTgufT+fMBZJRdYkLhz89+1tjwoRpFoLJxL0FoLB3rFeMelh02+xR/hRpe2774Jo5KwMfzVgkgqUSB2p9b3cXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4Y38Nnc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4Y38Nnc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fde295992so161325f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787088564; x=1787693364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFSZRh91M7soUNAsn/zdF6i5hVPwmo9/9fhGPbtc9DA=;
        b=L4Y38NncCTzf2AQ4j04oygGyfQ3Y0HEIADVn92L95G3HW04vT9oGzTGdwbrfNqcQlM
         z6hYBT4Fxhz0/IIk0/R1JbdfCfw5/x9HtKB0A2btD73LYPqIBitmu4gK5kj152YPRIJC
         q7n29N9VTvT0LxmagjXF8WVAO9aC/xn9ORw41Kiq3XwMyAKZZjxaLWTibkuT4mAw7je/
         GVd9Hfgm6ute2vmAVE8i3rsYaKRZg664Qg63Cvm6RLd4+UZN3SlZrPCOG37N4fj3URPV
         xQ/gXAHDZ+DzepjBS95TLjZioHagM0JToVsNAe11btz+6AJiIIpQr4hUJdYenICPuIVj
         6h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787088564; x=1787693364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFSZRh91M7soUNAsn/zdF6i5hVPwmo9/9fhGPbtc9DA=;
        b=kJFKwP6dIlf3v10ahqAEmOMJvfz3qLKfuDJjJBTFzDvmZ7g9boa8jpXbwqqI6Ef4KG
         fEHZC1BKgRPt5Y+8ks8pCRHizMDEfD62zZCtQ/tCW1fxyO3FdaRokYcV9BCJaet2vR6h
         Q3VqQMrdPfvU+yG4i5nkDJyrx10Tw566tjRtWN0jg0thL3ZCZnw4JLy+x5Uwt4LQUMzs
         ovFhCJ0IU8J01e6I0xFSm9CW4p+iRiMmCaSrJrvNOjFV2AeJcJCf1jCq1dXLe23wRwWj
         6Rs1PP4zFuYg2ygEHMwiLtUAWvzFuWkxT9q0Y6DUuXPGb//gN3mGW6qd/ocXmeqY7Jx5
         M2AQ==
X-Gm-Message-State: AOJu0Yy8gzuCK+Hm3rX6p/E4hfOs+dojMloWzJm19I1V1/cXqbhi33D3
	J/VsSmU40eagFJFqUs8yGeqJm+k2j+VbIpb6v2Qizm/OgYaJWfvc0iXU
X-Gm-Gg: AR+sD13zGirke+xI6dYVD2ux8b2RH38Y4/TkLKJTDOFDuX3qHim9HuGK4Oq1/W/6LGq
	mtKk8e+trSRqgeWbdtPpAH0HPxWym7Z1ixatoTRSUVXgPv/prNKVDjxiTIvBCxxwoaa8hqHuwyH
	r8q7Wkjx+hJmXHB4/b+3xcdTjd1qi4z4Z2w94pJ08+s0mMenC/lJ6HxR9CrOMIs4e5iOKG8zEu8
	KyJDxreq5XwWlAQ6MJLow9zXPfM2SBrDDIZB7NrAOgjN8ja1xnJ9FhIZqWA13Aib+av8FIFjuej
	UmCL3ncz/KrfQtvYw8/uktZ4RXHCFMG58UZzEdwGB6lcX/N9b7c0Jl89MxaA12N7Zue+3u9ef97
	UBC0wqq56NQEvJs0SRUAzGMTl9b9Z+aPmjScgVLHkhqzSVKhmSH3cwnKbL9yRvIO+zV7iZhnEYS
	y5p/ZI2Rbbtzt72WnoeJcZE+ZXlUfoFJbd1RVi1mUg/1UiMBrbKkSxcJV1h7TbsGKT+hTi0NB+Q
	+zIVg==
X-Received: by 2002:a05:6000:715:b0:47f:7fe0:a287 with SMTP id ffacd0b85a97d-482b0f3c28cmr473564f8f.2.1787088563579;
        Tue, 18 Aug 2026 14:29:23 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441b0fsm126507f8f.4.2026.08.18.14.29.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Aug 2026 14:29:23 -0700 (PDT)
Date: Tue, 18 Aug 2026 23:29:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260818232945.2c67b15b.michal.pecio@gmail.com>
In-Reply-To: <358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
References: <1551785954451@mail.yandex.ru>
	<20260815215259.014cc324.michal.pecio@gmail.com>
	<fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
	<20260818000909.31af0ae3.michal.pecio@gmail.com>
	<358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Aug 2026 20:31:17 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 wrote:
> Hi Michal,
>=20
> I tested the suggested commit:
>=20
> 3d9eeb336131bc5a174367c384fa00c15c8744fd
>=20
> on top of Fedora kernel 7.1.8 with the earlier commit
> 7c0c31c66a7f9daace156bac427aafb2f4bbb5fc also applied.
>=20
> The resulting kernel was:
>=20
> 7.1.8-200.xhci3d9eeb3.fc44.x86_64
>=20
> COPR build:
>=20
> https://copr.fedorainfracloud.org/coprs/vertigo-red/kernel-xhci-deq/build=
/10875339/
>=20
> IOMMU remained enabled in translated, strict mode:
>=20
> intel_iommu=3Don iommu.passthrough=3D0 iommu.strict=3D1
>=20
> There were no DMAR or IOMMU faults.
>=20
> A journal-cursor-bounded run with dynamic debug enabled for
> drivers/usb/host/xhci-ring.c timed out after 45.026 seconds:
>=20
> rc=3D124
>=20
> The v4l2-ctl output contained 22 capture markers and reported 239
> dropped buffers. During the exact test interval, the kernel logged:

This looks like high data loss on the isoc endpoint.

> * 8,781 "Spurious event dma ..., comp_code 13 after 13"

Probably harmless. While it could be some unknown bug, it usually
is just a normal condition when multi-TRB TDs are present.

It may go away with certain other combinations of video format,
resolution and frame rate (namely: those where alt settings with
power-of-two packet size are used, and you can know selected alt
setting by passing trace=3D0x400 module parmatere to uvcvideo).

> * 6,309 "Miss service interval" events
> * 4,073 "Found td. Clear skip flag" events

This number of Missed Service Errors is excessive and may be the main
reason for data loss. Unfortunately, I don't konw what causes it. Some
users reported seeing correlation with CPU load (it may go both ways -
either high or low CPU load causes errors).

It notably shouldn't be affected by scheduling patches in usb-next,
because uvcvideo uses URB_ISO_ASAP. And you say the bug is very old.

Maybe it's something to do with multi-TRB TDs? Would it get any better
in video modes that don't produce "spurious events"?

> * 23 "Giveback URB" events
> * 0 "All TDs skipped" events
> * 0 DMAR/IOMMU faults

Good, the "All TDs skipped" and "Event dma" bug is fixed now.

> There is also more information about the two endpoints:
>=20
> * 23 "Stopped on Transfer TRB" messages for slot 4 ep 6, corresponding
>  =C2=A0 to the camera's USB status interrupt endpoint 0x83

These are very fast submit-unlink cycles, it doesn't look like the
URBs are unlinked due to failing to complete for a long time, but more
like uvcvideo "changed its mind" for some reason. No problem?

Then it's 45 seconds of Missed Service Errors, which looks like the
actual problem and the reason why video frames are being lost.

> * 5 "Stopped on Transfer TRB" messages for slot 4 ep 2, corresponding
>  =C2=A0 to the isochronous video endpoint 0x81

And 5 video URBs are unlinked when v4l2-ctl exists. Normal.

> For comparison, the camera works acceptably under Windows on the same
> laptop, including stream restarts. Windows uses the standard
> usbvideo.sys stack together with a Realtek Device MFT named

Windows must be doing something differently. But again, the problem
seems to be with xHCI, not any control requests sent to the camera.

Regards,
Michal
