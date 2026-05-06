Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987E4A13AF
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088645; cv=none; b=JHzwWVlsjmEl6QrPvAyHSC7qRW920tuO6KIsYk/SGoh79dtnSZNz1vkoUJd6U/NRBptDhkcBgqRC74dlVuHsejZA+8MNHRmXsO0jd7BWtm7KEQvPhLft7mTKQkCeoBoKryeKzgDV6kJ6ceUkN2wQKwfZ/LW8mQmJLUhhgY5qt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088645; c=relaxed/simple;
	bh=8VWPCEDnj+/P6J0X59nHrjW4qPwFrHDPN+KRkXpZZkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWN2Fs87NX7zU5bkdY0cf6LE89dvpi+OE5FfFZruH/9REAyqdCrEAlUatLggXtAAAhPiekIdmeMFZv9U0dJ6VH4nWBOwKgBlEXjupAsY7MHPsbpOkqUp1fQ/fsuvnmgQEJPtL8fpAsCTKfc8Jg0GYhwsHbFsIHuoLdSwqKuvsdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8BzRc4p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8BzRc4p"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e1860558fso2537751f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778088642; x=1778693442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKwpNy1Yi1fg22CVE/tQGy7pqcxuIVEKF1UjHEWG5uM=;
        b=O8BzRc4peX0XEIvZvwfAIORoGUkzomY+6HhS8FNAyXCIVBU+bBa6icYoCwW62iVDqw
         8yhvkPCoZ4JC2jV/jV86MOSHgXNufv2d/nXBsqR12TUhdel5dgz/EKDBeEG0pSTyPSAa
         8MVcREj1V2qHRD1s5uHlR13/W1tkBG2DJqE9PIbG2lTdQUeebbZghjvnLBLHn+cX+NPX
         PJIzNlzMf8BHVbjobPdXnYtPibgopuecwQt+l54Qdcolc4J2rjk5dTEvxXD8kOfpzufl
         jxhN/sOdW6Y3tvmjbqpT/39q+2MwmCUVGH1NyYhMkDrJjLWvXV+ZEzyEOJawpWzvnHzM
         vq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088642; x=1778693442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKwpNy1Yi1fg22CVE/tQGy7pqcxuIVEKF1UjHEWG5uM=;
        b=rVDbysKrC9UYio3V5VMVgGOtgSXmShM3c2DBwSBJB7O9RPhA9sg4/ppf0H+u7eTC5j
         h6Ie3V4QANYzF35B6XZKoA9006W6arhk7qGY0ONP5EffZCiPl/4reLtjR2JC3ypqE/4m
         t2OQixKfIS5ch/m6/gZZh3Ae3fAfadOAUOTeN32mlvESGSY7HuhlQkwtTKzykUYrvMWM
         EGLgAbgXzBl4Xo6ml9ExuAVvCZIyBUgBKnPCWZbse8h2pk0FDTb+MCM/U8yl8zXTVspX
         VWacljyp/OEC+Nxjea2jmloGMEOUtMqSBzExxTxE0Ctg5YCOnCyUscWKrbeKX2OL1JGI
         N3ow==
X-Forwarded-Encrypted: i=1; AFNElJ9pMSDObwbkydWpyCco2TActCMLE0LG0a7opokSRpLgWXofFq69hm8bB5x6B69wnw7Aa84BPVbxw+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlT9Y+qNaI/V3SZOLn149GHoaPYfFPj4muVKocp0JJfZGbiQwB
	ms0QY+aLxD+a6T3Uq+JLaZBH1rLzhKqn2pOpqd5OfyaG9NjZXxMCyAI40OSiSA==
X-Gm-Gg: AeBDiet7lLy3vvnjetmfVZxiRW0Jww+I0PKz4dQ/rfepKVeJUKbhVP1VjVk8Gt+xZlw
	sDO2jnJmduJpT7zQtJ39LZ9P0aHef7pixP+BJyDt4yHyAA4nwuY/1IzmOSJUUyoHkDBkHuuYpQJ
	RzsXW6mFzqz1ZQ+oAEAFfXZFaClq5i9z7RtBGNMy8MElGWY7XD0n4MWo9jKynrUUWSMD8QVeNNG
	B3NV31siFZ1WvTpMbbHJmezbmpApHC1oTxNOSo20L4honHSU/czELhuhSlbb8NZyrkEngf+912A
	ajPRrsnRgTqfG9NTQj6ALgPQn1u68PqOc2hjlArpNIiS6k6WoXMb/3z4q1srfFZd+Nj93bebCFV
	hLnOgxeQka+GGSuCgJEcQxPitoP9hbWxO6BKyfjeKhJ5F/xNi3skeOmpyRPDLp93m67nWrx5y2M
	e9MIMZJpVS8bYqWWL/cglGsurHjS9z3W8l/YYD2ihhmaaUjQ==
X-Received: by 2002:adf:fc0d:0:b0:452:6aa0:1d11 with SMTP id ffacd0b85a97d-4526aa01d20mr1744686f8f.19.1778088641880;
        Wed, 06 May 2026 10:30:41 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm13464048f8f.34.2026.05.06.10.30.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 10:30:41 -0700 (PDT)
Date: Wed, 6 May 2026 19:30:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
Message-ID: <20260506193037.6de9e355.michal.pecio@gmail.com>
In-Reply-To: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 6 May 2026 18:06:20 +0200, Paul Menzel wrote:
> Dear Linux folks,
>=20
>=20
> On the IBM Power S822LC (8335-GCA POWER8), rebooting into Linux 7.1-rc2+=
=20
> with kexec results in the warning below:
>=20
>      [    0.000000] Linux version 7.1.0-rc2+ (x@b) (gcc (Ubuntu=20
> 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #3 SMP=20
> PREEMPT Wed May  6 08:50:5
>      [=E2=80=A6]
>      [    0.000000] Hardware name: 8335-GCA POWER8 (raw) 0x4d0200=20
> opal:skiboot-5.4.8-5787ad3 PowerNV
>      [=E2=80=A6]
>      [    1.593760] NET: Registered PF_UNIX/PF_LOCAL protocol family
>      [    1.593859] pci 0021:0d:00.0: enabling device (0140 -> 0142)
>      [    1.627080] pci 0021:0d:00.0: xHCI HW did not halt within 32000=20
> usec status =3D 0x0
>      [    1.627094] pci 0021:0d:00.0: quirk_usb_early_handoff+0x0/0x300=20
> took 32465 usecs
>      [    1.627123] PCI: CLS 0 bytes, default 128

Hi,

Does it work any better if kexecing other kernel versions?

What if you increase XHCI_MAX_HALT_USEC by 10* or 100* ?

Does the controller work normally after this warning?

Regards,
Michal
