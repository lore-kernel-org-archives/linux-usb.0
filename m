Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383C1A0712
	for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782066536; cv=none; b=nWy4m5oz1cA+QTu+Nx939/JynEInYSQhFBB9W5NoInEdtOHCNtAsYH9QtxMgLrtwoPDpEhUORBRhrdHBDed+GV4oYzPp4LAGkfcOUYobH6cwFwyVuBCRyB1AMpjBwFPyDgIdB3aIn1xDfGsGnKCBjJ4ofvQTIqAyTdLu+ss4Wd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782066536; c=relaxed/simple;
	bh=BzVxnKiiax6C8ZODDTczMQkgEKVjtUuD2l25qZs1/QE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zc0S8swTv8N1ifYZRBShWMFMau6SKcq1eVCn5FTya9JimZv4rSKnmsSl8QmmHy02Qk7iIcBDjNUdHjOBOAhvPHD9xQLR8Imb1ysz2yzLyUGbt0xKDdQsf6QJPbhpnP+rC8Clhl6GcGnFRCkcv2jj7CW9Vqp9j5KsurS5oBtvTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8mpQZT6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8mpQZT6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so3926263e87.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782066533; x=1782671333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/02yDBO9Bi+LYqUs3Hl9o2/T+4GiUdnctlfTn3Do1Q=;
        b=C8mpQZT6c3Cbd3TajlCFyJRts4IWbSkAszCGrJRZA2OUq4GvwcWvN70eXK3FF5Oy3X
         ZcypwEfOHdx56B0T/kwFg6ZI1GXHhzHJmL0hZUenE2prJevkT/KxL/Pz8x6uFKbvsAzU
         +q7nBk+iwlt1HPYb34jG2aOxYZaX8n/uSwma8ejeOcmDFESNPsaZjXGoHBwC7YB1SO/P
         6n6uZKDWbT58sQclrxQCL18dPSqkmQ/PouqW7wpU6GiIXTu1nJm38EwqPfA3w6QGzgAF
         I+qSyOIw6bha/iT33LGtEo0HNXa9HlSPsDszWrb6nBw4F3mL1BMc94E3miLennrzbiln
         a3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782066533; x=1782671333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/02yDBO9Bi+LYqUs3Hl9o2/T+4GiUdnctlfTn3Do1Q=;
        b=hWVgjB6rg4RstkhFhaKzTAhr0bTWoUo6xeXhtYQJ28QGmEvUL7gd7e7a5G8XtOOqHd
         iAVcc3MamnXGSD+7U7k/BSnQ+YmVXmzkawJqEmO20fVZSVHZL8/kpj/T9oWa/wwpn/X1
         0UNN7tE+eQQfaXBvXeSHgg/Pkd5mZ+jWLi2u63yMB2Hg06OP1396zianMbRXKMbcC7tX
         tccSBnFXtdjycq37vUjeMcjHC+kABx5wpBjOoQC/sQLmE92WzyzA2oudG+fxZOj18DeX
         sRPIPMCx379GRdhqVmHwDYFBym8S1QBXpfQmgSK5K7ztFd3PBp6l+y4hQU07SLoeq14G
         FqZA==
X-Gm-Message-State: AOJu0YyWDEjCMD0ApQZKg0nN2dY18MAFuTWoM7jd1apIKKBiCguJC+B3
	vP40NwDwg1Zlrq8oX3c3ZF7gI9vWalrwIgLTBeDYWQNktF1LVjQo8Wzs
X-Gm-Gg: AfdE7cnkYEdf11PiCqskWpEuzu/4gT+Oz8YpnFqxY6g+ASWY3iiVQtmInsAyjCrdKaT
	DHt48l+lUcOKQTrYvNxCbEAtZWjK2vX1+pmWODJFqATFJj22bYC42Mdh87EEtoaze4hAFYNIbGE
	7M9M+ZJECql4G4qWB77LELQdVFwf3lL40rte9iXcXywHcOG3bpzZbxgG+9oPP//qoMP1tRLai66
	vVCCffWDkxFDkWBCk/xwOYfX07tk3Nrq5ZusXpBwAqkh7HsQ0UWVK21vimMmbc6quTJPGCFxLmG
	HXSxUokVfoGCvhkNII+t+237QdgRtOmzAt0AuuneeZNVw4/olVkjlC9WfrKLopZFkhELmCC3PtW
	RK0n31U4KG75oNtxhoEthQ1ovy3bjMMkPqZvBU42JWDQab7IYz83CBkH6WZVj4Ur+EmxSG44NRn
	tRzdgmbUz+/8ZtzADj+7b2lw==
X-Received: by 2002:a05:6512:2c04:b0:5aa:126b:4504 with SMTP id 2adb3069b0e04-5ad576eacd2mr2961732e87.23.1782066532995;
        Sun, 21 Jun 2026 11:28:52 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c26ede8sm1179232e87.29.2026.06.21.11.28.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Jun 2026 11:28:51 -0700 (PDT)
Date: Sun, 21 Jun 2026 20:28:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ingo Haenlein <superscalar@gmx.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] xHCI: AMD Strix Halo [1022:158b] isochronous full-duplex
 USB audio instability (frame active: -18)
Message-ID: <20260621202845.77536cd3.michal.pecio@gmail.com>
In-Reply-To: <48aadb68-b4d1-4dd6-82ca-76d0846b4ae1@gmx.de>
References: <48aadb68-b4d1-4dd6-82ca-76d0846b4ae1@gmx.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 21 Jun 2026 18:30:23 +0200, Ingo Haenlein wrote:
> Hello,
>=20
> I am reporting a reproducible isochronous full-duplex USB audio=20
> instability on an AMD Strix Halo system (HP ZBook Ultra G1a) under=20
> Linux. A detailed bug report including kernel logs, USB descriptors, and=
=20
> endpoint data has been filed at:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221650
>=20
> This mail summarizes the findings and forwards the issue to linux-usb as=
=20
> the problem appears to be in the xHCI host controller path rather than=20
> in snd-usb-audio.
>=20
>=20
> Affected system
> ---------------
>=20
> Machine:=C2=A0 =C2=A0 HP ZBook Ultra G1a (AMD Strix Halo / Ryzen AI Max)
> Kernel:
> 7.0.12-zen1-1-zen (linux-zen, Arch Linux)
> 7.0.12.arch1-1 (linux, Arch Linux, vanilla kernel.org sources)
> Controller: c5:00.4 AMD Strix Halo USB 3.1 xHCI [1022:158b]
> Driver:=C2=A0 =C2=A0 =C2=A0xhci_hcd, CONFIG_USB_XHCI_PCI=3Dy
>=20
>=20
> Symptom
> -------
>=20
> During continuous full-duplex USB audio operation, round-trip latency jum=
ps
> discretely. Kernel logs show:
>=20
>  =C2=A0 frame active: -18
>  =C2=A0 retire_capture_urb

Not sure what you mean and I can't find these strings in USB audio
drievr, but -18 is -EXDEV i.e. Missed Service Error in xHCI.

Will you see messages about it after enabling dynamic debug?

echo 'func handle_tx_event +p' >/proc/dynamic_debug/control

> The Audient iD44 MK2 works without this issue on a Lenovo ThinkPad X1
> Gen 2 using the same Linux audio workflow. This confirms a
> host-controller-specific problem.

And since it's unique to a recent AMD system, maybe this?
https://lore.kernel.org/linux-usb/18b4e4f7089aa4f1.da8dbe994ae3bb77.445e21b=
98b0b205b@GordonMsi/

Regards,
Michal
