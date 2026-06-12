Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B437E301
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255869; cv=pass; b=hNiNvUurU55N73D5/RIY6NVhC+wk4S5sPPaPdP4iTL1FwB2ECDFIYTjjcKHfPXu2/2fw2D7lxkHMaH7IEUkrmL7VRxAjqvkjWh+6qPsOMqRAPjapI7yRrLKO5QnNoGEat84n4KurDu1KkPtpDwpsbbpgurCGg5e44CSbAEW8cWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255869; c=relaxed/simple;
	bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0OXPM4lVlpcq/COA20diY5L6gK2ACqqY4W1L+55NnVVPpX5NOprhYbv0/m/njAB9X7tHzmWHYscIVGU+YIWXspxyASXnpEjcqGBuvKasJt3e0x59CMT6FcdfEjlDW6NIt9MPfTCDx/rew3X+l8lkM3X9OtBboZEAtgtRtkmw5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cp45EbXQ; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cp45EbXQ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e1c3f47d78so8231537b3.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 02:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255867; cv=none;
        d=google.com; s=arc-20240605;
        b=BAe6M7jhhh81/hhNcXPceNwjieO4IzbTP4ghYe6aORd19NL6GJngsc0iufA6ZiT3eQ
         43iK3Ws8DxTEyQJSJvxLiZAdRuFENEvs977MrOibcsCHgmhw/vyjqG7e5rfAkDNn5rNz
         51HjeQUBpMi2hHmzExqRisggBkqqzZNCc9PDYt4SU08KLou6YX/3o4dTSMESmldZgHWZ
         MmGbf7FB/GIetoB5hdaMpZw7fXM+gYTspDCzCWU3RZaxtIhdsuMaggrHI+FkOrFizs6k
         dS0qzWW4GzjBOoOqQuFRSBWm6DB/2PCPZaEm6sJ7l6hu384stK1N1sk6PjBZaqsVtmWN
         UnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        fh=Gxk1M+kPcHMIbkSUqyEYVbiSCa4cGvLNVaVpbntzB2U=;
        b=Xd4kGJeGI1GyuQ36MV3yggbW/zwoU9BVFRs7Jmf4loynf0LMtg3NykFv+F5S3z0I95
         daXDUZBl4Es+cg6eRtV1VhVYh2Ne39HRwdh3ISM9Av8CF1PKNUVefimq/9//wK7Y0m0l
         EXx0EJKGK6sUAzb2spehpFwbThBHNLynuRYoV06Rzbd/x/WAUikUGpmRYMrSbtBFo0y3
         9wGCpEr0Vlf7Qnz945anApbGGW3SsjlBOb0BpLPjTnePKarbkKkKqUgOFOmv+RpoHo6l
         H1YSdZpEFmxwx32aazHITAhO+EQNB4q2ctLaEagQ5T80Cch81FMGEfetUWR4GK+m8UPQ
         PXaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255867; x=1781860667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=Cp45EbXQPotQHJV6pD9Z1tRcMMw/E1UVxgnMhXoZBjFie5UhROaMkWEwt2QF5D70y8
         YOD/NxeL/50JCSOtVLg3QZOu3/P+oUy7rMUa01zQtjLxNz547rc1kAL0UpiWXQfOIV15
         NmZbH96i2TJi0/uf3Vwh2QluHzpV4IczZXOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255867; x=1781860667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=Dvs+eb61F2rj8hU8A2c7CmMxA1DvnYUDvbuwEjLwH2zQ5hVKiu/bWVkXvXWXsgtMwC
         zfjUUKr4HmfBctrLcVdZ+upuQste3wsGnrsuwPr+Wd5PaGsUD8m3+ar4cy0oNinJ2pAh
         ta1FZNVDJZbsPkHXaERkXVhSXdMempQw7F/QmGuzgMFHLVR8T92vpN7A5NQxirPh7Bmy
         C4TWtQ/pPLXgrI2roAjwLsKKwrnQppol4RkYHvP23h2vJEx3AuYNz/Ku0n5toQxn7uq7
         lHwmQ2dc7yolKfa9lj5HgTnTVK4MXSfdeOTvE0I9cjNq0DaEfByUyLlRVsnCYSykZARh
         110w==
X-Forwarded-Encrypted: i=1; AFNElJ9EdK78sW5qtkTazEcPgCbXoRIP0H2+w0p5/QuXVswQgQxuEC13nHCwyMtiwnwrMDCL6ma48+xhMXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1s8aSFKj2qFaSRpdrp4179VvUqsxmntJvM+XD2rkRNA0uLUt8
	QRUcfhP69sqxlqX1zW4vBHYSoj0IeETjN2JHHU2/u/dEyOJXM9q1AWFhvn4gYDJCIW0uQjTjQ2X
	/db9jjzgL9KnkdyhAUTRy9FiXoEzL1pP7eAyBimlb
X-Gm-Gg: Acq92OH7Aa/0zDcNuRZvQRQ87sj4rAg7vEL3IDV5zahu5NKrkF48Q/Mme/ltZ2n7y8B
	aALoMETs65NuN3lQpur/AmkgwqjlkPha0bfoQFW/fR1DCC2vF4aCBr9h2xUg+ZiB/zDFqjV4Jw3
	i8pbQ7z6EAgx9YiXDt8w4PI61GPwqYPL4UZ5iPkEnvPQYI/oEhN9pPLiM2l4+s0GRwvriLmLfxd
	oynX/QiN5nIV3aC1Qk/KlX5/F8tx6pBpip7wRjRBYnproYJ/dHKo4e1jGtHNR3b2QMUhFu+5xVd
	vc3/Wto4
X-Received: by 2002:a05:690c:3a0:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7f7b8d248damr20618557b3.36.1781255867482; Fri, 12 Jun 2026
 02:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-12-wenst@chromium.org>
 <ail2VcubjT7HNGUC@ashevche-desk.local>
In-Reply-To: <ail2VcubjT7HNGUC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:17:35 +0900
X-Gm-Features: AVVi8CeDuG6qw5zFxFcHgtnnMaKWsSajO4ZT4D-k-SPwtRIr1WJR_hE6bMB1VZI
Message-ID: <CAGXv+5GNfWFinO1E=5X46xnBsQpY-_i45mq60eeQu=U3Z0MtDA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
>
> Why can we do that? No breakage? Only internal names? No ABI affected?
> Please, clarify all this in the commit message.

Will do.

In short, the target names (which are not modified) are used by the
consumer, while the unit names are internal only.


ChenYu
