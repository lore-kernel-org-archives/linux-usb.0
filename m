Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E33769ED
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254540; cv=pass; b=qbvcIM+jAaeivhC5e36QKPwjVapDfKG8sgHHUTsu4lkXJ2pm5IUhgaYuWIUvXdU44MuXcy9KmEBELbdrfdiG84Y/RxncrTw8eBJ4fqeKYB8tGzIDX1MZgGctCjGBSfbeFJrL6ZMiE4a4BFYeR4IW0WgndWW48z55+qj7CZrDufM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254540; c=relaxed/simple;
	bh=qoVKWlTC8A5exFZISdXU/mz0LuRqilEY4d0H6+v5zeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPpGfHcHTveX3vNIBm2w7dImtzNDRgco5qqMT7qJ+nNnhXCVbyFnsOzUtEai2U27y4qstjEyQXFAQWkYnHRoGy3/DFS+V54lE0f8Wp9rIqK78PsIMugf7E0v3gsLqdOQce0JERxI4Bb73D32LzX9bpMU3ZBIAZ28rTKDiaH4azM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GQLWKGhz; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GQLWKGhz"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7e2fd65f968so7333637b3.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 01:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781254538; cv=none;
        d=google.com; s=arc-20240605;
        b=OCdByGbQ/Jf59i/2yJ6yb457slKAtulxqKj6BUbN6VOpYF4DaiuFdIfD9eGnWp6KJz
         cWD4z3ou+0yiqrpVDXgtAqWMp5IVhnqZlJCXXLFV+B4OTv0YddaMzdv2j3s1q02Gc5q3
         BDtvpXqjVOJUS44zw2AvTzU943gaw+YjShGP14LufB66IWKrbMAB4HsFmZoz38EpI8pH
         i2sODRl6qpZLzheBJcG00PIfhC7G+XvNhXy46P8bQYCSHpK8Oyd59uJF1lx4kZK30tce
         KMi/EZDXcan4q0QY8e8f/2OWYAhI4uN49xM5GrnLBWsQ9XcYBwJIreMey4KA/TVt/G18
         yJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        fh=pnuR96LCNphGFJGdcV+oXdk7i8Wnsnnupdq1cT/WORg=;
        b=im4qd51kTo9ey3V2P0QB8/HwrhbsQ01yg7nHA8w0eVQF9pLl6Zn9jxBjEENZinAol+
         w86JhnwUsh4wXeQH6Y3yj1BgNfqYu3GcWwbKjMwV1GlWMCEWxp5a+u/WvElgkU0t6M7A
         orMvmK8hrFB6jt75FkkWXVVtwLdVCIN43PJ27oP1lF1617mEht3cu7Yehv3yYkmcNkjw
         ekzuAaghMVWKUY9s5plltykE12If6hB609sClp+fkv0cpaLpV4bLm6NO5G9yEjM51VUE
         ZaiqJx7nMAqtWXTv1BjoT7RvrED1gShmgk4e0yBc0ZnJP7As5SWKIwZtD3Wijv3iYoXA
         yb7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781254538; x=1781859338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=GQLWKGhz9Ekn0go48VNRwfQwbhD0O3T3pdwCj1lY/phcvDS5199F34HsaHBTA6xWl4
         zNDr2PavAQ5JcOqyE6v2ppelUimXz6lz+BitYFZE0DMVIMdAKUhj000O4hD+vKkeHyQS
         xdi+6VmxTysi3aiuNpPrDutvuF28IY+97xLP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254538; x=1781859338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=V08WSh2vR0QjXtpygFQaVoGncKaJD4OKQpJRyUkwrUaLL+bXxrPkqgFeB3H5pv+04R
         5yymB99jwytEnWMkimzDQSa9pFzGrXIzIXz3J3ePwuioX5HxPMKGT3vTJ1HfmNCURQ/A
         /tYj85fqoyBUmiHAN2OjaOT1PzitkLO0cm3wg+DjbfXLpVhuQhF4Nu0Pl3WRzQ9+PJVq
         pJx8fPGGLfc+pdVpu9Fca6nH9waeDi3pXjvFbBR4ob4+jcKnSxvxtSHmwhBotT2t7MIb
         MJSKZg8cSCHVIyg3wG4BD7D6cgbUja1vrlc+pkwGoszC8mSDC5MkkPzrU9FkTOAPso+v
         10BQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TffySKMM8hVRXYWlALoF10M91soIQZl1f93mO7G72G05nHnMmHggN/xJi55hhAIngL8hFd8iTFoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgRJuyyzV4sld4DUPMFf0Jt4NGbL94Ih7RE4cRRbN00lcwMp0
	+U8LAQaSCIldIpkhN0ynqlLr0fMFl9QxR2sK6Pc7px6i6W1k8/dJGfuSlF7KC49ZLE0c2RSuOqh
	IGq4fLhYXgf855aWA1ZgZa2mtSJyt7wHSwNLNH8JL
X-Gm-Gg: Acq92OHvAvKCD1HjS4K5djjbe84QeiAFautx91rptLfEJ/VNiEHu76k/VvPfk37k3Zb
	UoYixoby+se9l+YYOMD0YNxZMUCpDDrUOCvsgsdaFtOOeHH3mBUsuT5QrPEyBlryLITF4zbjgng
	1TVoRvA8GpKnPeE9UmoHhH/BFcKkZBTbdZKZ7xHLov9IMfh5jVjufgf41fmDtMGM26Y5FF4VQBC
	UszgVABXyG4/YgLEvR2HN3Ak1QvSOz/DhfIqPRK773A9x8x9uA42DYz8PzZpI55/p9VVIUndak6
	qbxne/bU
X-Received: by 2002:a05:690c:e3ea:b0:7f5:87d3:c38c with SMTP id
 00721157ae682-7f7b7c3b073mr16472667b3.21.1781254537877; Fri, 12 Jun 2026
 01:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 17:55:26 +0900
X-Gm-Features: AVVi8CcqxBgWwqPnctKiq9OR5bHp6we8pjEGtqp_ZFOZvY5Ttt7Fwncjoqrnmf4
Message-ID: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
> >
> > This change depends on another change to make the power sequencing
> > framework bool instead of tristate. The USB core and hub driver are
> > bool, so if the power sequencing framework is built as a module, the
> > kernel will fail to link.
> >
>
> That bit needs to go away I suppose?

Yeah, instead we need

    config USB
        depends on POWER_SEQUENCING && !POWER_SEQUENCING

But I ran into a dozen or so drivers that have "select USB", mostly
input devices:

    config TOUCHSCREEN_USB_COMPOSITE
        tristate "USB Touchscreen Driver"
        depends on USB_ARCH_HAS_HCD
        select USB

Kconfig complains about unmet dependencies.

> I see Andy has some suggestions but in general I like this approach much =
better
> than adding the pwrseq_get_index() function. Thanks!

Thanks!

ChenYu
