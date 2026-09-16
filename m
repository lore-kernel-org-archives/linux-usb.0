Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9C3C98B5
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551965; cv=none; b=k4wTVxPEB44eqSGavOgrBYrc6bHoU5jBmq41yIA8nNUPmlUlF9rGaIVFN0yOELB0jK64E14LuCTiT7J+yEywyDaBVcjv+V/PUEj/LR0zk/QrRclr5+TU2gSsaEV0V/XNV7UXspPJbxkmzUnPyf9W1MBBATa3DdouyE0yZL7P7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551965; c=relaxed/simple;
	bh=zgugq9bF5a+yimXJQ9CJ49FLry0pnjlitUad9lusJRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ty3BWiE0KiC/HuNzAaKDL1XsCw6MlNO8Xj7jotE6mr0Ar92dYD7n3ff2mW2HSoWdRdb093iPeQzZ3Ug0KZcag4yBZZk/MhPWFGNfuNZJDPyLgz42rt5IDDAiN/+PqSanRySn87NmxzrwL2FiqC+HcaCQAF1mx7QOXe3J8aMm6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3c7G7mz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3c7G7mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285DA1F00898
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551948;
	bh=zgugq9bF5a+yimXJQ9CJ49FLry0pnjlitUad9lusJRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W3c7G7mzlSw9gbqfMBSWaPV/kzLBT7B5U7UEJ4ydjnGtU/D2GPOvPAtZVs875p5B8
	 rrx0ojuBgZlWS50XR+UBOYUYUEDZaHx4k5Koak9QrGfijB+RyV/wh4qGlBQnoNYpjq
	 5B4jcmwOkbmBD2fZN3piHLSiJKSXX/VAQj41+bkPPamA3zglJogfiu5rS+mCnsi+9Z
	 81EFqnOLmGqNE4FrvTp/d5xVU9+3sdO4D7wC88cBnCoLTUFx9WWOX3UnkZPdYJCBjc
	 QDG1O5Eei6d7s5UGEjXBJzpp+JuvNOtXgsCtHoVyNpsa1PIa4vswIDODYV7Vjs+mlL
	 cwwBIfNlKnvCA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so916445e87.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 02:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5Ukc91czr8H6iAXJwNJQclBfM6LJ7Qn4i030jBFDWtltun4J/XEIdSnCirY1V6ATPfwRwYONfvKs=@vger.kernel.org
X-Gm-Message-State: AFuF++k5JVZ7JrBqBvgAj3lnAmLsKjKpdloenNwT+ikt9WX1j/exCGkh
	415Zry3WVdszY80HnAWPsDh+fqSNKh6NtJ+JziZWHcNlTgjVcs4mvpIl1KBtoT1N+BDU+vfdrKG
	L1qDwUiTi0qu2F3fuB6nZjFX5vu+Pghg=
X-Received: by 2002:a05:6512:1290:b0:5b0:c95:cdb9 with SMTP id
 2adb3069b0e04-5b8b661e54dmr561873e87.23.1789551946817; Wed, 16 Sep 2026
 02:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916082623.3972767-1-arnd@kernel.org>
In-Reply-To: <20260916082623.3972767-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 11:45:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
X-Gm-Features: AcwNN1VLg9mt0BIjlYKxJHsgzgkG3OqyDxyCoNNUv41KC2ewOWQB23tO-mD8VnM
Message-ID: <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix link error for CONFIG_USB=n
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:26=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Calling usb_hcd_platform_shutdown() is not possible if CONFIG_USB
> is disabled:
>
> arm-linux-gnueabi-ld: drivers/usb/fotg210/fotg210-core.o: in function `fo=
tg210_shutdown':
> fotg210-core.c:(.text+0x40): undefined reference to `usb_hcd_platform_shu=
tdown'
>
> Move this call into the hcd file to ensure this is only used
> when USB host mode is actually available.
>
> Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Good catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
