Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39DC3A63EF
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715616; cv=pass; b=g8CpAv39bftlaJb2n+aZUD5kNvnaYlBn9wvfiy5eOI4JdOLYqraXwTGD/SJWpuGTnEhdI9iV6V5Mp4pCDQdcbyr/GENURt18zwzP6TmoXh9DvoU0/R00FsSL1CLTEY+zjVdNwmss1zypbNip5hcvTPYl4RcMd+IHWY5hLHcRFx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715616; c=relaxed/simple;
	bh=wtT+R2QEQMbY0+UAKHyPbJ02qh8DU6NUrzght/3Gr+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6Y6oU03NjFC+Ul3v7KdoKNlvkD5h1xKTzGburv2XTCrVgw/uYMg/JR4EpjvYnqi7h9fOIF3z0KyyE7n3/uaIh9eQ8WTOtEeBZm611kUaa6WN8KvuP1ebDe7Smg9JJ3L/+B0Rfm614CXIM9VjaNa2yvZz4TJZYk6XbOGy0Ab8H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q/wPAOgr; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q/wPAOgr"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664b2c00e12so1910423d50.2
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 23:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782715614; cv=none;
        d=google.com; s=arc-20260327;
        b=a3AnrFzjm44RClvBWINAlV+HQA4mTVYEwRBqmlDib/9ySV+4qSevvhHnMVx1nYynr/
         6zgoagVr5xBkg3gB/YSsf9Govf34QHMX6PsRLnGFSSSVc6uSaOkS0MmEbTvUWp7t5fNh
         Ct+0HtEq9yuFtGvPSHgpsRlerDI0PutW0r2W05b+TxywlU9XwtCFaR4TTLzk9CyFDahp
         IJOGhOcR+qjSxVuNlbLPuB8yIlphlOLFN1fkzGvJYcWcR3vP2le5vOszggCFwUHPLp5Q
         PepWD89/LVrFnM0SBusqBLM6CF97+XZ4lMzBClGiFLe+e8EG/USigfpnfjWlooRo3N1h
         Z13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        fh=qTd19pBRmWhXeIfNT0Y0E16QizZcvFr5iEKF9Sb8R5w=;
        b=HzyEdAEwMCj20P10e3viwssZKWPp8yaJG6DMfwlBCP1uBQqnryz1MZFYDzbpaPyxG8
         qRHtBsUNmnQ8yCoawLPx/BPBse6tAU4u9XJDanqlve9pWpN58p7RBkPSfQP+tuCPcaNd
         yfyOi5piEqEznHAJfVLBq5QqUDps/lLYo27FjsNS44zSLIvru15zyp4BADOd9jAsD98k
         xC3LG70D2IRz9ApNjEXnWxITeAbdvQjyj7uj8YiFIOjD+byCoUAvOzgOO3vX+gRaFWHE
         F2W1bcd6aMydU2TOEtQsHqCIV0MLIwnUTC9ybpyamnN65AygNkReMYkqbH89I2+cQGbs
         jq/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782715614; x=1783320414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=Q/wPAOgrjHthVssKFodjWVx3k9XmfpfyW2y3hGXc9wncZljjfv/zuhGIDv24uulgSV
         PavgeIgqEgr14M610VzlDpLik3vcHZsQjbvyHFX63RI03m76M5UmptHzDU63GqPHixBA
         FAe65nc4nXaDvGO0SxZv3c8XYT8RekIJlN9Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715614; x=1783320414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=oQYiFSC2nk4BKrAioCdKdQTB+9z1YG+ta591V8N0k9sS4RZ6Wojak9qqLkTGm9jEEj
         axdnzxbxzDuRVSApndBwkJxOkbqCUNvAgHnYSasXusSx8Pg1TGqdTkayIr8hYk/+Z63B
         E+GPAgha077ux9S026kMGpv1F9Rh3hlPpOOt4ovb4MqwC+ixMyovYyRXjKJxl4sh32Yb
         lFtHTjzAdMaxtUONl/kUpdbZ8VuQHQtMKMDofDjVr9JqemomE1g0P5XwsbR4BuW4qMhO
         40d8X3gy+Ax/otlH0Xy4DOhEngLIg/k4O27ASgzGx8qcUlREDfeOxfPyZD+dwgdrwKyG
         ISgA==
X-Forwarded-Encrypted: i=1; AHgh+RrVXOYcEN9Ry9tSHxXN92DUuVn40AtS2yc0i6wual/X/bH2YEtH38wd9HxxYWFGqNBkxmJT0Olmip4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzll/iey5+KIO7OAilNEIhD3lUzeAQjGqDd7OlONf5aXvC4AwRO
	p9xGlI24B6Ce2aO/E7LaI1xH23PRCpd0u15xCeie6Hv96MHbH2la+TiZIlXUnJyx7WY01PFcfeW
	sW2XFv3l4VfYuJ8/iV8oRyZNN8jaXBNlZGPJrArdV
X-Gm-Gg: AfdE7cljwyecVMOjFNINI5Nxmgj8eTonqom3zKe44OIZAob3CLuetH+bjS8znpxgBit
	kN0Ckcrh9okz+/XdJ/g7G+MkMHbFznEedcsDZ58HQr0tSaMhBgvNcJu8nVaaX/c++PRArH9Xaj4
	YK8cLB3hjEySBshsmDZ+UNw/lz8f5sx9VVED/WsTRzQ8VldhzoMHrSx4scH0ZF6Go1a2LU0spXS
	383vJrFuzdD5UXm3xSC2i+w2LZZLnmZLXKQFSgq1RepwWhRDLt6/YRvEWhTpDxT+goKE3guu1Gh
	VKpYn1mdXouLh1foE3X7+c65O4U=
X-Received: by 2002:a53:d24b:0:b0:664:ae6a:f07 with SMTP id
 956f58d0204a3-664ae6a108dmr6236222d50.81.1782715613698; Sun, 28 Jun 2026
 23:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com> <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
In-Reply-To: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jun 2026 14:46:42 +0800
X-Gm-Features: AVVi8Cf2Jr6SG6fphp7pdwOmuJjdBOlHCbVmzmc43-YAOHTJXjsvshlXzGC6cxU
Message-ID: <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
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

On Fri, Jun 12, 2026 at 4:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> s=
aid:
> > > The new M.2 E-key connector can have a USB connection. For the USB de=
vice
> > > on this connector to work, its power must be enabled and the W_DISABL=
E2#
> > > signal deasserted. The connector driver handles this and provides a
> > > toggle over the power sequencing API.
> > >
> > > This feature currently only supports a directly connected (no mux in
> > > between) M.2 E-key connector. Existing USB connector types are not
> > > covered. The USB A connector was recently added to the onboard device=
s
> > > driver. USB B connectors have historically been managed by the USB
> > > gadget or dual-role device controller drivers. USB C connectors are
> > > handled by TCPM drivers.
> > >
> > > The power sequencing API does not know whether a power sequence provi=
der
> > > is not needed or not available yet, so we only request it for connect=
ors
> > > that we know need it, which at this time is just the E-key connector.
> > >
> > > On the USB side, the port firmware node (if present) is tied to the
> > > usb_port device. This device is used to acquire the power sequencing
> > > descriptor. This allows the provider to tell the different ports on o=
ne
> > > hub apart.
> > >
> > > This feature is not implemented in the onboard USB devices driver. Th=
e
> > > power sequencing API expects the consumer device to make the request,
> > > but there is no device node to instantiate a platform device to tie
> > > the driver to. The connector is not a child node of the USB host or
> > > hub, and the graph connection is from a USB port to the connector.
> > > And the connector itself already has a driver.
> > >
> > > Power sequencing is not directly enabled in the connector driver as
> > > that would completely decouple the timing of it from the USB subsyste=
m.
> > > It would not be possible for the USB subsystem to toggle the power
> > > for a power cycle or to disable the port.
> > >
> > > This change depends on another change to make the power sequencing
> > > framework bool instead of tristate. The USB core and hub driver are
> > > bool, so if the power sequencing framework is built as a module, the
> > > kernel will fail to link.
> > >
> >
> > That bit needs to go away I suppose?
>
> Yeah, instead we need
>
>     config USB
>         depends on POWER_SEQUENCING && !POWER_SEQUENCING

FTR:

Somehow I remembered this incorrectly. It should be the following instead:

    depends on POWER_SEQUENCING || !POWER_SEQUENCING

and the dependency issue mentioned below then goes away.

ChenYu

> But I ran into a dozen or so drivers that have "select USB", mostly
> input devices:
>
>     config TOUCHSCREEN_USB_COMPOSITE
>         tristate "USB Touchscreen Driver"
>         depends on USB_ARCH_HAS_HCD
>         select USB
>
> Kconfig complains about unmet dependencies.
>
> > I see Andy has some suggestions but in general I like this approach muc=
h better
> > than adding the pwrseq_get_index() function. Thanks!
>
> Thanks!
>
> ChenYu
