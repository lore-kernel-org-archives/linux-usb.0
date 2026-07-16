Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9B13D53C
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784176309; cv=pass; b=WTKHf7AMD/F7KtR+kVj37ToD1Hzub3Y/vdOlIFMHnHctBn5Jz9z9aYLwNaAHAAzM7V4mXN+YoC7txXsBfaodJ+jlxgjpq4JEzEMJE9s+dpz45bGx6hBulndEhSNxccLrUt3apELApBPsOyAF+Uwa6ZYMgYbHwf5jmLVmYf1lk/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784176309; c=relaxed/simple;
	bh=nhYyNn6r73D9XtB76IT5BMo5NhG30UFFcOOZMpuXDho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6pyQr0cyLioqIJixavDVqIcKD+pm9LtdiqrTrwuC3Xnkgf8JbKf1/ETweNcPT3dkn80koXUrQy/5VNBkzsy/fyUJEp3ICkZ6g4m9CUFf6zsNArLoTfAHVuERM7M3OL4FMRN+e6Nnv809MrfiZB0EwtFfFfLPzyuhvBNG2qm7B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BbIlmPiT; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BbIlmPiT"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ea0b7d137so53457827b3.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 21:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784176307; cv=none;
        d=google.com; s=arc-20260327;
        b=Nl4olDPEYvTBzgy9Td7/oB5Q1mS20kEKA5XnnJx7vw68kiDuVmdxVC5HKhIyUiw0fY
         H4u4tpj99WI+8+sg7EURyRmfdxIF5q9MNlNDhWT9/MPa+GlBdh+MyfxhT3EtNukLlMmr
         DuKIO6CnZjxMPjAl9mUgNrC0AQBogVigTvWe2ypSjZ6MiprjzTtMeOR6BM1GecnYt9i/
         drajzXq9R7+86GgE/waC3cUoeOvaEHdFJJlDtqKV0AP0JfMESAKuJnUlhXOVWMxLtrCH
         RukLGjWEnw4qaS1tR922bzmxtCQvAN+yefRUCc6v5bRaS8a/hdImpr3P3AtaE0UOMyRJ
         4WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        fh=lvyUYgvtDAjB0udUwGcnSNy1OcXlaTc+hMNO4LOxuNs=;
        b=QzU2dtSszI03G06EgQwymNiMnBsqqYo3qdTBZ17BgfS2avS5okPuYFzQECx9ihjgZV
         N1UsMSHLj5w4s9h6gbhwBLQIa+6E/CjHHJBCspjFpg9vmnSAZkYkULeVCXbgUVIdFHui
         Qrxvcsdrcr8nGhgT5q/SvfxXdNMoQqdTah0vGCBh9CKNdzRxusE2hNyqZZOsP4dYqIVU
         KWh2IKzq38W+voxtvxjz/fuTGZ9Fgta++si0GEXEnKWGg3op29Q1Mzno8CqkuIe64fzo
         09FSJwcZn7IDZ+E3bhQwRKWIGls4wYOKYL3zmRyo7cpENjcsWM/sbjNkORjNYIbfJJzG
         svpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784176307; x=1784781107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=BbIlmPiThl4qtC2ZN7JQZl+L2ZooPvu5YEwEDvQfZB+ebI+hS/c29Vq0ahKfNxgu3H
         Y2dKQR08UIvbW04KcyCZxX8NOGetwY5g3XdreHta5FewJNT1+6IGkqv4QqXcQKnXrya3
         CREYMhgoOS0wLEmkqgUzYoB3Kjlg3MA3uZjMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176307; x=1784781107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=iqxHFjd2Ejt4J2wgN82JYga88LY+XgsJz+0WKSIdgAoggw4eFkG/tuumpLLSwJYgvT
         jecK+/I2XhpzSLdmK6N8S/WHTqBvsGfj6CxEr/pDpFlKgcvcY3D6gkJcvzkhLy3CB6uM
         NvJSSqit4cBSDLkppz/QkhJC8vgL70+WKxRM+89gnqQsj4FuPp6EfG8FDeuNtmbK9jCj
         uNdg7Y16gc6nkFN8dxm5WD5KMBKCFVeqQVV2u2gCb8YU13HfGKmiCzSNeMJXevtvnCU3
         EKC1zVRgzf0NaHVPfgOsdV1UYVGGWBHUKlv1j90D/rSkB9CWk0p+PuulJpJg2MMhQNRm
         fWMg==
X-Forwarded-Encrypted: i=1; AHgh+RqFQmiX1NKwjiq6QeYHhT7cav8gvyK8gvQWyEL7f0WUAFosvluKjGVa7+n7FBT9/BZSBCeK2QCRE6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQyFDhWQSoqM+maIRp9ybUGDct5O4/gzawqlBl9SGgEcZe7wZ
	rRyjuj3HmwqO9/8foTYkcx1nSs93H8odaocEvufoNnrROBWh3QihPNHqTUzEofh5DYFyP9tJXmG
	6prDlffeJjoS+H5LK1Xpjujm6Xhr9G8iigYJuBeB8
X-Gm-Gg: AfdE7ckshDO95xG0koVOHcT3DopO3XqldGsJXnQyZ1a8XOXWF7XjuLO9RkvKTybN8Pz
	woPOnVOuZCTvVerc3t8YyZI8N2EH3+hFvhR7Wk9QhOWdJ6iL+JPat7Swi51i/hstgqj1OQ5M+Ls
	HyXD4GmukCWKiz0+E4d8pFzAXDJ7K+MfigGTh53+EtAEkVSKAOVnXQHxNUYmcyBf5OPmTODUapq
	1ZgpIrNR8jQsYE3WyGx7If3O5HrUUfYggqEveA0mag+9uHnuRZf7+G9gtQpRvCOp7MNYDFMqu8i
	x1LahpgR71idNbxb
X-Received: by 2002:a05:690e:1c0d:b0:668:19ff:7eff with SMTP id
 956f58d0204a3-66819ff937dmr2943635d50.38.1784176307120; Wed, 15 Jul 2026
 21:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-7-wenst@chromium.org>
 <aldQ5odptfmK5aCw@ashevche-desk.local>
In-Reply-To: <aldQ5odptfmK5aCw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:31:36 +0800
X-Gm-Features: AUfX_mzQbv55XMQ4uR8jO2hQgRvrbYnVnLlttvP6FASpWrSMQxMLCCNzy4VYT9I
Message-ID: <CAGXv+5FAHZP-u1ZyWSUkUrOx7R5-YgBs5y9V4mGTycyrJG3UKA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:36PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> What about adding
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>
> to the top of the function, and...
>
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1,
> > +                                                         FWNODE_GRAPH_=
DEVICE_DISABLED));
>
> ...shorten this a bit to

Makes sense.

>         if (!is_acpi_node(fwnode)) {
>                 struct fwnode_handle *ep;
>
>                 ep =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_=
GRAPH_DEVICE_DISABLED);
>
> // Is NULL or error pointer is fine here to be set as fwnode in port devi=
ce?
> // Perhaps add a comment?

fwnode_graph_get_port_by_id returns NULL, but not error pointers.
And passing NULL to device_set_node() basically erases the current
associated node (which is NULL anyway, since we just created the
device) so it's a no-op. I'll add a comment.

ChenYu

>                 device_set_node(&port_dev->dev, ep);
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
