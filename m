Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9523D7DF
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243199; cv=pass; b=euLx7kBSNb5z8UDHQ0O3OGBxMMtzNQW1+8C5XUi0FZOVjr+chfXlaXdJKaWstou4ZwykLfVgsCw2zEhiMenV7rZ54grzugMnnGGJcHBUT82GWYNbKasw46XHraBdn7bXiuzLjh7Nmnj4SCt2vlBdrcmiYghuRfkhNSolg1tBW38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243199; c=relaxed/simple;
	bh=uxhicmxU+8eIG2C29hx4vflsMsbZnUfDPDvn7qOTo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktY5HWKWH9LmAkpw1YgJMGP4OntFS3iNq6XNsWAXa0qfCHzqzZSpF6qMqx/Hu5tAJyQkA0wpr0/1O8P/qcPjszc7kvxdGRVjQUsn/fj/Fw7fHlFV8K9d938ETSowe/MTwVsYs5E/Hh7x1brJmc+edSEh3216H1GN99sIqih1G1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fZo+warr; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fZo+warr"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e0aa486af8so12736637b3.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781243197; cv=none;
        d=google.com; s=arc-20240605;
        b=cpalWxIuZdOigzhFYbHXF2+rSazFAQzM+CEIvNHgLXUs2lI4g4sB/fKqOIQu4roS+B
         M6a+zjJRsOtepqaMfyKedfvv+SNbfoBU5TdCe0sKWIAv377Q+yWmmCl21l1mJuEHr4at
         il1vVXcqUcoCfdVGONoUHsv+8kBLlRKGewbCNipYtczeoQOJ2WjhqRuDBbGUqF6D6Ubv
         UOvQlJE78RH4fpP9doR+fETTwx7g17wxOMwhmpfiRFeWZkS344j8Y0w7Wtqkj32HxHQp
         DHdcb68aTyh7uzCFY/DeKeYHxDulfLw/sCr3XASsHssOmh3/tSCfUN700kVCggVRHGh+
         0SXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        fh=emwwGRLj9PoQhoTFwaeK+oWqhmAkECYjiEYQNL5K3V0=;
        b=eFzkjMIwqvbRclOEoV3a8pOkrCY893+j+H3E4DtTT2ThxP/hg4Lm9t94cIcWDKU5J7
         cyQ8nLhoyAeM5K5MMGAHxkMfJE1oKdw6ObcJ4OY/uasFlJBRyEIut1iZ38Cvck0b3ndd
         QIEFOUvNZwiQHq2/65fEdzgKjGhITz++iIcRq25Ec41/fre6M6QZKtVFsc9G/a/wEjck
         BdvT5RXbvqdXT64Rdm96+a7E91Nm8pWmErkMEXl6gUG1PFf2jHByZkCK/WTnmpRnnKzi
         REHto/knlsfi5ff+9ij4XkcjweLj9jZi3VFdwmCDxSYS7aDDlP4ysOxSH8P6hxVYObHm
         S55g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781243197; x=1781847997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=fZo+warrrCYk1a41/ryhx5xh3MVD3vgwycLGsaleyAecG4cRy2k4u8MiUX6+LC8b/t
         D4MczgmKUGOjpZE1Dz7V7xrUOCZSG7PBGNlAj2xhqCkIMgqYmcDOuiuuOd2+bRWNssq7
         YbD3pZJ7HT6EUUZK64WOhdFga6L8gjyWea8TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243197; x=1781847997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=RnUx9uW40CatmlBMZRl1OYVpDVFzae5VY8VV9pJmR1MphABof4da5ESpjb8tVPPmqN
         ApR4tSwhuHe57oG76WeFWYbPXtcgpraJSf0SSA6MKFvCVNSEvGjV0NSspFt+ejDjo3DQ
         bystK94KDt2hor3I69OHdp7nPqZTH7pDbA3wH0ByoM1u93M7tsP7oB8ceSUuRj2HE/uP
         eKuZoU70sjpPhnHkvt/NKbZEerkBHQzhTWqODxa6s0lXnAGOW+ieW2YqyqhK1oMCQwvS
         V/k3rZp0zH5cYA7qPSqZtTzzynsY1NskXNPCk+Iazyi7h2bWMfMWjNQgISqBHKty0ptN
         VhZA==
X-Forwarded-Encrypted: i=1; AFNElJ/UUl5Z/kWze72VZbC3DTRbCk21RZiRiEjUoclxsA9dYhJgEyl1ZVeYKDfQMa7Jksc6zwwC2jboc7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFVWXxQGtweX3B23+wMTzR81+XxbedAv0b5KPP3tJP4K7f1qp9
	TQyH56W0t40ykGd0TzxgTEYlQa7J8ww0AKVKSl43DidyVG+FA1MjQ06Faw4PA8Nj6DWvNF7er4w
	yztVWiwmP0b7Ehne8uEnR0cVF1/euY37hz2pXyk1t
X-Gm-Gg: Acq92OEKFCzZ1eryUmtfrJDKmyTN0iBY45EwCXHMlUGz8uyClj24+0HyKc3u4r9U3cc
	taJl25GmwE1Ui8+4E5Tne2++P12fqQ44WetzfIXCU4I7j9mSKp1h/1VdH9ay9Qjowjt29bMssyd
	f53uMiTa5eOrZiF2//Oqpe4nko3DjQqjBSUzR9VKvLI19tnmbBoJJRJvhawUQ9Zkmk+GC0PHFRt
	EOCA0QDZg0PUssgcuVt8EHPEZlxdqOAu2mkr9RUHwm4tmrmBzrY5D8vaDMzUz+MJ2QO6prZMZP7
	vNRlvH/S
X-Received: by 2002:a05:690c:4441:b0:7cb:93d1:d804 with SMTP id
 00721157ae682-7f7cc52611amr7898237b3.7.1781243197392; Thu, 11 Jun 2026
 22:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local> <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local> <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
 <airY6IMz2KFz_z9j@kuha> <aisEccAOm3qoXjxd@ashevche-desk.local>
In-Reply-To: <aisEccAOm3qoXjxd@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 14:46:26 +0900
X-Gm-Features: AVVi8CcqLILhEQ5p8_o0FiDM5Wwe_hy_cZp3NZb3BqN3lFzIwdQDiPu3OCyJS60
Message-ID: <CAGXv+5Hf_V4=mkAc3pN8_K9i+FfH2Wv7HVJBq71-f8sMFYL3fA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
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

On Fri, Jun 12, 2026 at 3:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 06:48:56PM +0300, Heikki Krogerus wrote:
> > On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jun 11, 2026 at 10:37=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote=
:
> > > > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > > > > >> When a USB hub port is connected to a connector in a firmware =
node
> > > > > >> graph, the port itself has a node in the graph.
> > > > > >>
> > > > > >> Associate the port's firmware node with the USB port's device,
> > > > > >> usb_port::dev. This is used in later changes for the M.2 slot =
power
> > > > > >> sequencing provider to match against the requesting port.
> > > > > >
> > > > > > Okay, would this affect ACPI-based systems? if so, how?
> > > > > > Can you elaborate on that, please?
> > > > >
> > > > > Is it possible that there's an ACPI device node associated with t=
he port like
> > > > > on some DT systems? I don't think so and there should be no impac=
t IMO but I
> > > > > also don't know enough about ACPI.
> >
> > There are device nodes for the USB ports in ACPI, and I think they get
> > always assigned in drivers/usb/core/usb-acpi.c.
> >
> > > > The API is agnostic. There is a possibility to have software nodes =
associated
> > > > with the port. I think the best is to be sure that ACPI-aware peopl=
e who are
> > > > experts in USB will check this (Heikki?).
> >
> > I can't say what's the impact from this patch - I'm not an expert with
> > this side of USB. Is there a danger that we end up overwriting the
> > ACPI node for the port, or something else?
>
> Exactly this one is my worrying, but I haven't checked the actual flow.

Looking through ACPI code, ACPI_COMPANION_SET() is used, which boils
down to

    set_primary_fwnode(dev, acpi_fwnode_handle(acpi_dev))

This is called through

usb_hub_create_port_device()
  device_register()
    device_add()
      device_platform_notify()
        acpi_device_notify()
          usb_acpi_find_companion()
            usb_acpi_find_companion_for_port()
          acpi_bind_one()
            ACPI_COMPANION_SET()
              set_primary_fwnode()

Looking at device_add_software_node(), all swnodes are secondary.

set_primary_fwnode() seems to be able to make the ACPI handle / fwnode
the primary, keeping any existing fwnode as the secondary. However
if we do end up assigning a primary fwnode to the device using
device_set_node() as in this patch, set_primary_fwnode() is going
to complain loudly.

On another front, the ACPI representation of the USB ports looks nothing
like the OF graphs, at least on my X1 Carbon:

For a usb port device on the root hub such as

  /sys/bus/usb/devices/4-0:1.0/usb4-port1/firmware_node/path

looks like

  \_SB_.PC00.XHCI.RHUB.SS01

while a usb port's firmware node link

  /sys/bus/usb/devices/4-0:1.0/usb4-port1//firmware_node

resolves to

  /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/device:1a/devic=
e:29

Neither looks anything like the graph "port" / "endpoint" node names.
So maybe we're in the clear here.

Besides the loud warning from set_primary_fwnode(), the major issue stemmin=
g
from a wrong node is that power management (through ACPI) is likely to fail=
.

If we're still concerned, I think we can skip the assignment if the fwnode
is an ACPI node, i.e. check it with is_acpi_node().


I've never worked on ACPI systems, so this is just me checking the code.


Thanks
ChenYu
