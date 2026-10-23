Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783911;
	b=AEZpabpdjcfiMPXNDspwGVxMoxJ0bacIOwv8utlFhHjPfxqOPb/ApGkGyzKf1iRroxhY
	 WaBLCajOIWQbEdWYSckyMaOoU05urde8w7GmoKG88Pxap36UrzMHN4kk47hItZRyncx3R
	 kOOOVWJWZkbT8u6DrHII8ZcayeaIG8fBqJJFqF8i4dv8f3tm8/RA75urLedlQeHbxcq+s
	 F1EngUajtv73Ox7zkqYyQxtXwwh3j9QmiAdbDlQbELb8janhavYWOTl2AHObuhXVb/o7a
	 WVYdR/Rn9MO7Mcss9WJdrRXWSirG58DTWM58XWxmWNuRZtMmZPRY8neJ6cYhEPqePLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783911;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
	b=owvmxgC5PwF8J0Q1Z5RXWvP2Wp4vg+/AIb2ZXq/DQYioGjq39wlPwcHu70N98MnvF8d7
	 lzSRHwyhAZCu6OqQpguXIZGnSHeGSYzphDOibiL+BJmdP1S2c8udyRzkGVkhTOwMxBjD+
	 z6P415OdzSLqMmFy9aGqjP6ZD/FaP/xmV7xEaZZp8aUelLUoD27QRD0XejKGPL6FNWSN/
	 YMym7EGyO4eh8T4GK8hp+ueWPFPsDXjF+OZuxnNg/XXi+rm8ZXl0cqt39RTiipq0eSuZy
	 QUmVYrbi2is5MriKKtNI8VZg7mLRT6cLa5bGBxgmyLokW8H3TAlFCcEdXRyHw1luQ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAYSLIdx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gUYAvBCi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65C606A320
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 19:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF65C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAYSLIdx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gUYAvBCi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792783909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
	b=GAYSLIdxoGvHpj373NZwI1t07H8cNAYhcRIBSiFq8VAZcb18BXx2WwIbElFaSV/uRLqBxx
	d7o/VuC8o9UR6IzUDl4Qypxp/tv5TdUxZH6D/Uz5ltDIgT8xOmK0lWdM7PvbrNUNRoP4eA
	oD48u80EWGR9veIx/xrkay5w8ajPBsY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-6pYetJh_NfazXDXci0SJkg-1; Fri, 23 Oct 2026 15:31:48 -0400
X-MC-Unique: 6pYetJh_NfazXDXci0SJkg-1
X-Mimecast-MFC-AGG-ID: 6pYetJh_NfazXDXci0SJkg_1792783907
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so33869585a.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792783907; x=1793388707; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
        b=gUYAvBCi53mrJvuQLgUj4gamXq7LrhGpMAgK+Hf/aasJqBng2+bBmzExN0U6uXgRtk
         VU9kLXvRbxEyNgp1z/5bc+NzPUqBjwQb4NR3e3jSbaKiK3Himj7+3a6B1qsAHFmkC0q6
         N/0LYOv36nX9e2ug0x7NQfPcQpf/ymPoaBtqghxWFg8iZEFIiJVxexELdhzjznlt3FNG
         VBbI97v+zxt9b+VNXmOnIBz+dLHbJwAnkEmLz0mLDZz2R9DwRZ9CPs9PQc8lutFwa/dJ
         V7Ba0qSYNbi/evsJJhSgsJ9SQ3Z9xv7MZeIsdJqj9KlWWBlhSpuhQSICBZZs9aZbFefE
         BXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783907; x=1793388707;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eildQREft99H7v88HxbeXxFVawAYtvAnxQSW518LNL0=;
        b=UEu5iAaXtVYBOuHJFJ9ZyENoy/tTY7O0BPqqo8GwAgCQtxkRmZ1QNg/O9dSxSDc4oI
         nQ2IWIxPXqF042V0tP8DcsQvwCxfc/SwUGIsxFtcsjy69yDEIpzDhFQCMEeBk/FCovvU
         AfG8p/RyZWnUH39HGcOuvBCBR73q7iWMWud8w/cxj2q07chs2JWRDfjZBNW9Fa9MKHcH
         /zBCZn4mTEvA/B+zhJXYJJJ8wc2dfOn+My1G7+/8uCh/GRq5QE04jCYp6O8ZsO9GHLZm
         0FNb6rkGxyZQQ98vojp8RFLyQ4vdPYkKHTfeWkxDvtqN3tc3VfH+kKurCIbKzcZg+4PP
         KpXA==
X-Forwarded-Encrypted: i=1; AKwUvBz224OfBEj+DEUd9jOH/Mc3R1tpC93mSzJ7Y3+st5UUO7twlg1/ewzLd/8x7CXNYyZQrIAzxct7F0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk82Sy1XskKJumt+OREiFAosHlLe2s2v+/un+JKz3L6AVcBZuP
	pBAVKfc42CMCPozJ10OR8b5ENgL85ToB+LuP4G0nCCbmpEy+Y9WI9Fa9tKzCvf1gYMaJQ8aAZSV
	SeOECp1Hm7Y7cv9jUS6SUfW/6AOqFA7EwONe45inlOQ48hwQ9grgAQZZePidaMQ==
X-Gm-Gg: AYBFou3rai/nE14F/kzSSSYzGaJQMsAt5LGKcblVuAA/dSyX7iJNsBflsyFOLPf6+EZ
	NqaOLkNsGMgxEqeGriSJxv9vFfppyIw4xYJsbbcr4i1wesE759JFivaiS5Uri/rvsDZQ5c57eVa
	7Fq8YdjLg6rHOU3zJzKZ3Hh104r7amchLa6Da5OK00+gl3r7plLvHsLx4ai6TOgrGVhxcShcoUv
	Mv0HxYV4eDhhnjU7VXjMCrmXnlpslEurV+ZE/524vOvLLpoaKglqgCYjaNRqBzqDxD5WZU5Dqdj
	s5+48M+US24zI4QbAIVlpebvesG6MyFQEgV1fKH06WDtvyK6+6P8uNPqWJYhsoVGOzSH0DA=
X-Received: by 2002:a05:620a:2909:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-940ef8d90admr5918885a.32.1792783907506;
        Fri, 23 Oct 2026 12:31:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2909:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-940ef8d90admr5914485a.32.1792783906961;
        Fri, 23 Oct 2026 12:31:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b12ed6sm95633485a.25.2026.10.23.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:31:46 -0700 (PDT)
Message-ID: <8b131d2c06adfaf9ce1d6e8cf6c09c749d0e4d1c.camel@redhat.com>
Subject: Re: [PATCH v2] usb: core: Add quirk for Gigabyte Aorus Waterforce X
 II AIO coolers
From: lyude@redhat.com
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: A1RM4X <dev@a1rm4x.com>, Alan Stern <stern@rowland.harvard.edu>, 
 Christoffer Sandberg	 <cs@tuxedo.de>, Kees Cook <kees@kernel.org>, Rodrigo
 Lugathe da =?ISO-8859-1?Q?Concei=E7=E3o?= Alves	 <lugathe2@gmail.com>, Jie
 Deng <dengjie03@kylinos.cn>, Werner Sembach	 <wse@tuxedocomputers.com>,
 "Stephen J. Fuhry" <fuhrysteve@gmail.com>, Nikhil Solanke
 <nikhilsolanke5@gmail.com>, Vyacheslav Vahnenko <vahnenko2003@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 23 Oct 2026 15:31:45 -0400
In-Reply-To: <20260824195419.234898-1-lyude@redhat.com>
References: <20260824195419.234898-1-lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Friendly poke

On Mon, 2026-08-24 at 15:53 -0400, Lyude Paul wrote:
> The "Aorus Waterforce" is one of those fancy gaming water coolers that
> comes with fun LEDs and an entire dedicated LCD screen. A minor issue I'v=
e
> noticed with this cooler on Linux, is that we fail to actually
> reset the device when coming out of standby, ish:
>=20
> =C2=A0 [=C2=A0 281.652184] usb 7-10.4: reset high-speed USB device number=
 7 using xhci_hcd
> =C2=A0 [=C2=A0 287.179843] usb 7-10.4: PM: dpm_run_callback(): usb_dev_re=
sume returns -5
> =C2=A0 [=C2=A0 287.179854] usb 7-10.4: PM: failed to resume async: error =
-5
>=20
> Generally this isn't fatal, as even when the water cooler doesn't resume =
it
> will still reconnect itself moments later:
>=20
> =C2=A0 15:48:12 GoldenWind kernel: usb 7-10.4: USB disconnect, device num=
ber 14
> =C2=A0 15:48:12 GoldenWind kernel: usb 7-10.4: new high-speed USB device =
number
> =C2=A0=C2=A0=C2=A0=C2=A0 15 using xhci_hcd
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: New USB device found,
> =C2=A0=C2=A0=C2=A0=C2=A0 idVendor=3D0414, idProduct=3D7a5e, bcdDevice=3D =
2.00
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: New USB device strings: Mf=
r=3D1,
> =C2=A0=C2=A0=C2=A0=C2=A0 Product=3D2, SerialNumber=3D0
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: Product: Castor3
> =C2=A0 15:48:14 GoldenWind kernel: usb 7-10.4: Manufacturer: ITE Tech.
> =C2=A0 15:48:14 GoldenWind kernel: hid-generic 0003:0414:7A5E.000D:
> =C2=A0=C2=A0=C2=A0=C2=A0 hiddev98,hidraw2: USB HID v1.01 Device [ITE Tech=
. Castor3] on
> =C2=A0=C2=A0=C2=A0=C2=A0 usb-0000:74:00.0-10.4/input0
>=20
> My guess here is that the device simply doesn't support resets properly -
> since that seems to be the only quirk I've found that actually works. Not=
e
> that the device still ends up disconnecting and reconnecting after resume=
,
> but this seems to be normal behavior.
>=20
> So, let's fix this by adding the USB_QUIRK_RESET quirk for this USB devic=
e.
> This seems to work perfectly fine and prevents us from getting the
> aforementioned errors on resume.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> Totally forgot about this patch until now :).
>=20
> Previous version:
> 	https://lore.kernel.org/all/20260203221452.198682-2-lyude@redhat.com/
>=20
> V2:
> * Don't forget to sort quirk by vendor ID
>=20
> =C2=A0drivers/usb/core/quirks.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b931c..6c4a52a693c05 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -217,6 +217,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
> =C2=A0	{ USB_DEVICE(0x03f0, 0xa31d), .driver_info =3D
> =C2=A0			USB_QUIRK_DISCONNECT_SUSPEND },
> =C2=A0
> +	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO coolers) */
> +	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info =3D USB_QUIRK_RESET },
> +
> =C2=A0	/* Creative SB Audigy 2 NX */
> =C2=A0	{ USB_DEVICE(0x041e, 0x3020), .driver_info =3D USB_QUIRK_RESET_RES=
UME },
> =C2=A0
>=20
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91

