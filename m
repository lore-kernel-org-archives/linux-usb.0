Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905630;
	b=LoKOWN+aZjqUro3qmQCExl6mTgTnEpeg8q2UcbYoR95CFLgKPdIXxG4VaZxXHJzSef+2
	 vYnXwdmrsYildzGmnkS6P0SUo6IXHoQh3hQdgT/WG/X0BvGxoNklnC3m+6ONUrLb+6aPq
	 HLySvpH1XGdnc4WTQTvHuzBaypFnx2UP+uBXmS7waS7lS9fdQ6QJzBhyM6FxkQti+KZnk
	 RHQtRwx4Dul13qX+ixYwXYYXuY8ZYYWdzLTpLnS1+btOQ6zm2ajSgq0LQ6qO8jVTBNth1
	 niXltqV1nIv8lz4gS7+/NeA99dWfNNd5RXkB2Cy1ppbkp761sRNBO9+HMw047oclgPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+vt9qDBsCoi2dykr5PYN8iCPLBKPLl/rMIxfi5oIqFI=;
	b=eNgPOsuW7y5gvWPtWB025tf+o7GhPxMzaqpYKyRrFULsEnsR1DU92Xh9FbaNhWIRSW5I
	 Il5MVwnAb94SOkaRcHaL66pX2SDMs0tL6XdCX85SPSWVveRXqMI1Lox6Nlz1a5fZEfymy
	 L1UdvDYPDB8Cb5KpxpMXPDgBMC/yd+Lv3pDbpBQglS3RpWoWmqgLemppkN2aTWZNUuMgG
	 qIi9qlj9mZr9sd2sskHLjMV/5LSl3jLLwZJfOeI4oWHxT1XEB7D3HRiJZFZ3tRpQUe8fi
	 xg3qA0bHTsek4e1hozpFlr3WH9fu1/ZNrHYmoy/Hd7u0YjMafUgd65Fys9k5mQaH0ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=touhey.fr;
	spf=pass smtp.mailfrom=touhey.fr;
	dkim=pass header.d=touhey.fr header.i=@touhey.fr header.a=rsa-sha256 header.s=goog header.b="RaK3//71";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D19606A32F
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D19606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=touhey.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=touhey.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=touhey.fr header.i=@touhey.fr header.a=rsa-sha256 header.s=goog header.b=RaK3//71
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso2436137a12.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 11:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793905628; cv=none;
        d=google.com; s=arc-20260327;
        b=fGbVZlGHYH34MNSnPkieDWUFg6vZf9OCulA59JmYXULGcOfWSGuAJvJXsc2VBU2HWQ
         p5/MgBTAuoTNutJG4pXxbD/nel7yFhGbsIDyj3TywyrLUpxDJj5a3r/QjwaXz7fZ6CR6
         Yu4Atf7YKpiaqvR4tsf64E9m3p8xukiTL9TgZBg8xhJlY+ALmue2hLyouHQyQE2oDx8d
         nK2OIqzrsVECgib9Odx5ggEDmv0z93DSFG8bTy3DP5XmXZ5xZ+UcGsshd5Ygd5ZeO2Ai
         X7n1vv1XO4mvQJuht9FxhlhJcEDUwc+9F2ojfz7jRQx4T2A0gUIojST0NGM3sh88gd9h
         3+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vt9qDBsCoi2dykr5PYN8iCPLBKPLl/rMIxfi5oIqFI=;
        fh=l3kX/a6ugSzDjcdInIyrIkED+cdqQ+YVVW4y2jxhn2g=;
        b=EKnyaGPbwha8a6mRAWI4O74tq5Zh4wk+cH+BdtjWDWaaIFNU7HyjpFM88OWayh5pKr
         VLoig1tey/rWZyL9k20sIVnwwdfCND1pye1YDv2KVV/HLSNBouESGv57kuOr4j6Dj6+v
         Mv2ThMLQhg+NPiVMJmLkrlEXyv6I4aVetqvQDH61Kz33q23mUwjwLaRJUBX4ePaQMqQB
         N51Hht2/7s/QaqBJGVooeSqdCqBmMp8PQp+sKaMJGlKMGl2SR35t2LuM4GzCfrrbuxSt
         k3qD64B18YTKJe6ryMpbxYl9vqpleKG/7ziEyBvpPIfooY6RslrAYU4IjGRdRwj4/q+Y
         6QmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=touhey.fr; s=goog; t=1793905628; x=1794510428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vt9qDBsCoi2dykr5PYN8iCPLBKPLl/rMIxfi5oIqFI=;
        b=RaK3//71DoQ2xvljtddR3HHDkOOLO6w13Fs2cLCD0X7zwXQCdv+ENUJtr9uRSpnZjC
         scUfiCgScNR4JXOU1EuLO0LfUdpNdDqihE1dLmk2qk323QPNkggozeJL4l/UaJpo6ZJH
         ZjSpLbPbdQJNs3WBndt6Vrs8cabwRcFWsqZVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905628; x=1794510428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vt9qDBsCoi2dykr5PYN8iCPLBKPLl/rMIxfi5oIqFI=;
        b=u1R3mpv/62xgK1IFpLqzsIj5503+YIXTPN1U88JREfqrB3zazNeLtwWw5jqDorHcdV
         CFjCxkIz1qBbDGObr0LbycmnRNoW8HfbkdxZBhJTxA5iSVJ1S92rgfw6LHlij1U5wHfi
         pC8svq58eC+8zT9z77kHCpY+rj3d9LYBIq8Wjau210DiAgf+sDKwGEnnWXZSq8QUUyPO
         rWbt5VU69OzqIHDF2dLJ3on9per0L1+cryIiUlBL619oalGVt7t50OjxkOKsEnnugwHS
         lWcOmpjMVurnZJupBKdJ8UwqjsEuD3KjJ8ayLFAwc+U2lUCEYGt088+5kjCbSvz5OuIn
         lMLA==
X-Gm-Message-State: APuU4Z++Wp/KVitA8fmJsIX71cAKUaGe89lVCojH/kMiXrADioDqRFe0
	gEBIXiaL75+4h5wYFJERds32cQxGqqU9yKzk5xNTHasuPqizDUArpASVWLngrnrPpTEz+mptjKV
	UAlzpb4rJzHnCGH4jQT6lE9UM1X07kts5jjw/DLDlCQ==
X-Gm-Gg: AYBFou0m7C7pxk2t5YwNtkGqqE6e6JZWgg973s+tJcI7mXuKzLao6azG6gKo5zjvdQc
	32CS5tS2XlWMVK9o4Y5Vt1sMMH+IPOTAOh8wkqOeBVSCz5UjrddRuYBxTveZ6FfnnNCF6k7q+DZ
	D3tU3gpPNJHHtoiI+kRn2jOlm1IWI5heIEA7z+biAKuhn7exF9inRDPx8hPa2kJpm+fVsv8x6ef
	DiWDzRok4h7EEEkxAqEKUj53UenT9DKOURFMZZLUaD/527k0o2FGKqdueyfCVlpK9kQj7+tEfCR
	8d0KbO8Wsj5N2YTYIatG9CZ9NfubFOQ6M9sR8WbvDmFArgoH9jFw7AgCOp0kZmRnzIdrj6f1bki
	DEtbLrrzwzYjC5ShdjdzKsp15U+brxugMJI3FHj5u9YpL5xmAEFD8RONg2RLzgdy0b2oKSHVMo+
	MIl523xvhzTBnea+fFOc+4vzbFtUc=
X-Received: by 2002:a05:6402:1c0e:b0:6b3:cbdb:bd93 with SMTP id
 4fb4d7f45d1cf-6b59780723dmr89799a12.29.1793905627744; Thu, 05 Nov 2026
 11:07:07 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151348.19009-1-thomas@touhey.fr> <ba500bc9-461e-45b6-b889-3d82107e1967@rowland.harvard.edu>
In-Reply-To: <ba500bc9-461e-45b6-b889-3d82107e1967@rowland.harvard.edu>
From: Thomas Touhey <thomas@touhey.fr>
Date: Thu, 5 Nov 2026 20:06:56 +0100
X-Gm-Features: AclHuK8-1PIEnk59gWxQUqMo4esGROZ85R-HwoH5pw-2LJWR2V-WL7lREhVWcCU
Message-ID: <CAFCjBVEOGg0GwpzLpQn2gLB+NE3qY6E2KjOZ9FNyF0xrzS_KXQ@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: add quirks for CASIO calculators
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, thanks for your review and response!

> How much storage space do these devices provide?

Usually between 2MB to around 32MB (usually around 15-20MB on modern device=
s).

> Do the calculators' Mass Storage interface work correctly when the quirk
> is present?  In other words, is the non-zero dCSWDataResidue value
> simply wrong, or does it accurately reflect the fact that the device
> hasn't accepted anything beyond the first 4 KB of the data transfer?

It does, the dCSWDataResidue is wrong. We made two experiments, one on
Linux and one on Win32.

0v0katai (quoted in the commit) tested this on Win32 with the default
driver (USBSTOR), which seems to already ignore the CSW residue in
this situation. They wrote a random 1M file it, read it back, then
compared SHA256 hashes; they were identical. The writing part can be
found in the attached "test-win32-write1M.pcapng" file.

I tested this on Linux by applying the quirk using "options
usb-storage quirks=3D07cf:6102:r,07cf:6103:r" with modprobe, starting my
Graph 90+E (French variant of the fx-CG50) in USB Key mode, writing
the file ("test-linux-00-write4M" file), detaching, reattaching,
reading the file ("test-linux-01-read4M"), then diff-ing both the
source and the obtained file. Identical once again. :-)

Let me know if there are additional tests I should run!

Regards,
Thomas Touhey

P-S: Resending with all recipients this time, because I answered to
you only by mistake. Sorry, new to the git review process by e-mail
:-)

Le jeu. 5 nov. 2026 =C3=A0 17:02, Alan Stern <stern@rowland.harvard.edu> a =
=C3=A9crit :
>
> On Thu, Nov 05, 2026 at 04:13:48PM +0100, Thomas Touhey wrote:
> > CASIO calculators using USB Mass Storage, bearing
> > product IDs 6102 and 6103, always report non-zero
> > dCSWDataResidue for requested transfer length
> > >4096 bytes while bCSWStatus =3D=3D 0.
>
> Do the calculators' Mass Storage interface work correctly when the quirk
> is present?  In other words, is the non-zero dCSWDataResidue value
> simply wrong, or does it accurately reflect the fact that the device
> hasn't accepted anything beyond the first 4 KB of the data transfer?
>
> If the latter is true then the quirk won't help.  Instead it would be
> necessary to set the device's max_sectors value to 8, limiting
> individual transfers to 8 * 512 =3D 4096 bytes.
>
> How much storage space do these devices provide?
>
> Alan Stern
>
> > Information about an fx-CG50 (OS 3.11):
> > T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D06 Cnt=3D03 Dev#=3D 24 Spd=3D480=
  MxCh=3D 0
> > D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  =
1
> > P:  Vendor=3D07cf ProdID=3D6102 Rev=3D 1.00
> > S:  Manufacturer=3DCASIO MassStorage Device
> > S:  Product=3DCASIO MassStorage Device
> > S:  SerialNumber=3D0000xdPUBVUq
> > C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
> > I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driv=
er=3Dusb-storage
> > E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> >
> > Information about an fx-9750GIII (OS 3.71):
> > T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D06 Cnt=3D03 Dev#=3D 25 Spd=3D480=
  MxCh=3D 0
> > D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  =
1
> > P:  Vendor=3D07cf ProdID=3D6103 Rev=3D 1.00
> > S:  Manufacturer=3DCASIO MassStorage Device
> > S:  Product=3DCASIO MassStorage Device
> > S:  SerialNumber=3D000000000001
> > C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
> > I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driv=
er=3Dusb-storage
> > E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> >
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Thomas Touhey <thomas@touhey.fr>
> > ---
> >  drivers/usb/storage/unusual_devs.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/u=
nusual_devs.h
> > index ac22fa318734..492b5f050f0b 100644
> > --- a/drivers/usb/storage/unusual_devs.h
> > +++ b/drivers/usb/storage/unusual_devs.h
> > @@ -1168,6 +1168,25 @@ UNUSUAL_DEV( 0x07cf, 0x1167, 0x0100, 0x0100,
> >               "EX-N1 DigitalCamera",
> >               USB_SC_8070, USB_PR_DEVICE, NULL, 0),
> >
> > +/*
> > + * CASIO calculators using UMS for "USB Key" mode always
> > + * reports non-zero residue when the transfer length is larger
> > + * than 4096 bytes.
> > + *
> > + * Reported by Thomas Touhey <thomas@touhey.fr>
> > + * and augmented by 0v0katai <0v0katai@gmail.com>
> > + */
> > +UNUSUAL_DEV( 0x07cf, 0x6102, 0x0100, 0x0100,
> > +          "Casio",
> > +          "fx-CP400",
> > +          USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > +          US_FL_IGNORE_RESIDUE ),
> > +UNUSUAL_DEV( 0x07cf, 0x6103, 0x0100, 0x0100,
> > +          "Casio",
> > +          "fx-CG50",
> > +          USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > +          US_FL_IGNORE_RESIDUE ),
> > +
> >  /* Submitted by Hartmut Wahl <hwahl@hwahl.de>*/
> >  UNUSUAL_DEV( 0x0839, 0x000a, 0x0001, 0x0001,
> >               "Samsung",
> > --
> > 2.56.0
> >
> >
