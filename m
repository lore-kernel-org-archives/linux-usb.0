Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0974389E05
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262498; cv=pass; b=sCBa7ByeU8vobIgokxcaiFEVfXivM7uuNICAPHd5b+Ii731S1enVHis7U70Y4ajIFdnNjU0GwplWqZj5IV0PJ9dK63BhUp6eul2FgE+YEdH8rkKCVCZ/PrAPiXtkRmFBOmdSB1IUVKBeaBRWiXD/kjtI9DlFjp493wtFe+XZIOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262498; c=relaxed/simple;
	bh=aVd9zn+nnlYjjTIKfjOQOCG6eIFAT0xCBifX76MvyC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VotCMHgCtP/1InJ+lV5wiueNYjBJa+ozPATI1OX525IAGjmbklk3Xorj62Cl1Qtt4951KwtmQefNUkwJinIBl19SvFnmhLiFUb5WVSUl1xJnpaoRNsYfBiap/+Oor48JYv7kvhJcJUJzVoLyhq+CIz9aUh0h+RtNsLPQ4HSxp+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZAQ88Oo; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZAQ88Oo"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4949f037131so604282fac.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 11:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792262496; cv=none;
        d=google.com; s=arc-20260327;
        b=VVWqgdxGIts8ZNBGrl/Uo6gMoO4Uj5irCIdozMlLL+eBnfQmyt6rBCnTdUllemziUf
         4PJphctgXhinsaezpAc3Fcagc6Z/qyK6RQLpbA3QJy+qhT/Kzh3Xlb4BCGQbrf9mK5Fl
         aEDHQfXVxB6uymn1rj8YMrEGZsGI9U3chPgHH+gkCuchVR3NHOcA1eNkmn48/LJVyTCF
         aJZSgg79OzTyY6/l6FlTDvIFSnEmbqa0nTeQ9fvhPgp4mjQ7/iUPoBpDQ84Cx/8v7lpi
         cP6gd8PkUEDGQZHQsPf10cr4VbYZJ52fDUZ1QtQb6pzLtdN+uLrT3kh/xp8FR7uZuCgP
         /2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuCHF4M7KM5gtzDwGQMdIUh/XOE17Hs5Gj3VaH+EzX0=;
        fh=1Qr2OI9qfsGe+6c62EuwjoCq1qAItAYtIl5+pyXHaPk=;
        b=SVwZ/mH6wPNe5Nw9g7/adw9QBR+vIbl70fMhMs1OFZKFKhvDSpiodPtO+Imcw1ZddZ
         3c1qnr3j4c4yl9RU3hM697S/gjdHjsGGz5/TJWcnrI0X0vhsgIinCmZ/9oayWKcVGZN7
         Sw2sbPKjhxpPiVRj7n5FSNBW/xCsyxsAWINRpy1k88e31IEtal1nie/vQnAbwNAGX4Kw
         vqcKrUb+BaOzNilMu3HS5CSZKGzvIiKnavHXAQ5n4zLJjIcQ0byUwwsuC3+9T7BfTEdc
         CR6d5EZDOeaCcDel/3m95Fj+mmCEHDSYMGy5JeZ4K/AOyS8iQcfGXlKE7RDhUdQiH6dh
         yEVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792262496; x=1792867296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuCHF4M7KM5gtzDwGQMdIUh/XOE17Hs5Gj3VaH+EzX0=;
        b=LZAQ88OokA3FM02ia42HR9utf7mW7SMStlQJljOV3cnHCS10nXGluc4Ni3uFXb2JsD
         mWE5fyK068Riq4zHfgvX8KYZwsuSijivjvXX9DVrQzEtbFbhmHwGemuwFQHDCFY6YYlT
         pJbTx5zmV3N58UpoT5UBDYDgjGhkNP5FtwlzePWBvixn0+1mvBBkQpHCQaM9aVGITi6O
         IVD1aDGF/qjUOQoCr9mv7IAxFRyKqPUWZiRI8vKfW0L4zdB09YXmXXMsern4Zkn96Sy8
         ss2wc1K1vVfrRJJVdiUdMZ2FYC+fIv5EtbY5j6gQCxEjfJfHiVX3i7/vwV0t/1o6icZm
         K/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792262496; x=1792867296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuCHF4M7KM5gtzDwGQMdIUh/XOE17Hs5Gj3VaH+EzX0=;
        b=kzkjn9RlpKO9bysMUDFrnzA2F+P6ATYy16buQTnuKq+qtUfTvjvh/hPesYSBcIitdm
         Me/KiZf0iMHe//tOegmNf9AFWF9nWxTo0GYLxM0iluRiMW86lzM94Wz3kJkObKdVKyGC
         1u4WPO1JfRZ/MIgLcIlexrw05mvAUAKeZISDNwX1B6zWEDnoQ1wyTd/WDTBwYY2lH/JT
         0Nq7kk5t4qHAgIG7iYKQB14LPWLS8FzBvKTPuEsUzlvAMcUa8hwOc4utMFRMZIZMjBTM
         GFsSARoybCDYslCblynfUsiBJfGIBR7SWvAl4GsHKhImEW+OxvoDy9Sc68eGBsV3xVXP
         msOQ==
X-Gm-Message-State: AFq9FYKCgzS1T5jHShKFjs5rUx2csMsfDLku3lmJM2SGYRWd7ujvZPql
	BgesDLLPZeq36yuHsGA2nx5Ap0ABqz2E87EyDq5sbLUmvTqSU4su5xXwD+zufTsd0RWNHPrcmLu
	clj5rkRrtb+qPyApQTHIqxidX2YKHC5XC14dL
X-Gm-Gg: AYBFou24V3Z13Mov1j+saf12kY/UV3gH9aeJJpwHLs0/l8t+mlh5bFN/OA/uISf5hAu
	KgvsLsX5fsGuwyk4aAEGxqf9WXceA4l0T+un2ts0LkNQ4SPgH/zXOPVrfVtQLY87XR6OedZn5Pf
	HGCd+8wf/f7KGfsrdSnAROaRdNNty4Q4frcMnhrtgdH949AVoSJOg41ZagBquXlSbP6h8ty1iv4
	EI6R2c4JkHZ/cnegUY5OZaNO1U147ClMTRypc8sw02FxtudXOUncP0VJJen7ISelROgbtTyVM2l
	xVPZrnlIZ+PR9n0Zc0gMG9jPdDlFnN4dhRw0PTYM/S9EaKNLD9RP7vLJEFXmwTSaQN1/2ATQ11m
	8QHVS3SWo1I+H
X-Received: by 2002:a05:6870:c275:b0:4a7:4ba7:21df with SMTP id
 586e51a60fabf-4a7575b700amr2891865fac.5.1792262496518; Sat, 17 Oct 2026
 11:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7Xih7O5gP=1fQXmeFhrNUmzxA=L+8+q=wbjNb_vwKVxQOBCw@mail.gmail.com>
In-Reply-To: <CAK7Xih7O5gP=1fQXmeFhrNUmzxA=L+8+q=wbjNb_vwKVxQOBCw@mail.gmail.com>
From: Herbert Guariente <guariente.herbert@gmail.com>
Date: Sat, 17 Oct 2026 15:41:24 -0300
X-Gm-Features: AclHuK-Z5i3XS84HKZbqvZ0sxy4dTL-u47Qh_eZUMbykJPFO9o4AlhhEDE1wiUE
Message-ID: <CAK7Xih6UxekKoz_TPxOEp4n9awt67FZvBOckvuGbwqzFSeWukQ@mail.gmail.com>
Subject: Re: GameSir G7 SE (3537:10a0) disconnects during enumeration on
 hot-plug, works when present at boot
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A follow-up to my report: after sending it I found that Ali Resool
Tuama has already posted a patch for the same controller:

  [PATCH v2] USB: quirks: add USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE for
GameSir G7 SE
  https://lore.kernel.org/linux-usb/20261002-master-v2-1-24b05d8792b5@gmail=
.com/

His analysis is more precise than mine. He found that the size of the
configuration descriptor request decides the mode (9 + 80 bytes versus
a single 255-byte request as Windows sends), not the string descriptor
reads I suspected. Please treat my string-descriptor hypothesis as
superseded by his findings.

One data point that may help with his patch: my unit runs newer
firmware (bcdDevice 6.64). It shows the same behaviour from the same
3537:10a0 identity, but its GIP identity is 3537:1069 rather than the
3537:1010 his unit reaches:

  hot-plug on Linux:       3537:10a0 -> disconnect -> 3537:1082 (HID)
  enumerated by the BIOS:  3537:1069 (GIP, ff/47/d0), bound by xpad
  hot-plug on Windows:     3537:10a0 -> 3537:1069

So the 10a0 quirk entry should cover the 6.64 firmware as well. I
can't test it with usbcore.quirks=3D3537:10a0:r yet, because my
distribution kernel (Ubuntu 26.04, 7.0) does not have
USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE. I will report back once I can.

Thanks,
Herbert Guariente

Em s=C3=A1b., 17 de out. de 2026 =C3=A0s 15:34, Herbert Guariente
<guariente.herbert@gmail.com> escreveu:
>
> Hi,
>
> I'd like to report a USB enumeration problem with the GameSir G7 SE
> wired Xbox controller and ask for advice on whether a quirk could
> help. I have not written a patch; this is a report with the data
> I collected.
>
> Hardware / software
> -------------------
> - Controller: GameSir G7 SE Controller for Xbox, firmware bcdDevice 6.64
> - Host: Dell Latitude 5440, Intel xHCI (0000:00:14.0), port 3-4
> - Kernel: Ubuntu 26.04, 7.0.0-38-generic (usbcore built in,
>   Secure Boot + lockdown enabled)
>
> Symptom
> -------
> The controller has three USB identities:
>
> - 3537:10a0 is the initial XInput identity (interface ff/5d/01 plus a
>   HID keyboard).
> - 3537:1069 is the Xbox One GIP identity (ff/47/d0). xpad handles it,
>   and this is what we want.
> - 3537:1082 is a DirectInput HID fallback (gamepad plus a fake
>   keyboard/mouse).
>
> On hot-plug under Linux the device always ends up as 1082:
>
>   usb 3-4: new full-speed USB device number 28 using xhci_hcd
>   usb 3-4: New USB device found, idVendor=3D3537, idProduct=3D10a0, bcdDe=
vice=3D 6.64
>   usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
>   usb 3-4: Product: GameSir-G7 SE Controller for Xbox
>   usb 3-4: Manufacturer: Guangzhou Chicken Run Network Technology Co., Lt=
d.
>   usb 3-4: SerialNumber: 000098C304D8C90D
>   usb 3-4: can't set config #1, error -71
>   usb 3-4: USB disconnect, device number 28
>
> Herbert Guariente
