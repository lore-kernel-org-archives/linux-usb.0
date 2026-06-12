Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF92737E0
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248832; cv=pass; b=TU9vWo+lRE0YK1ldXkbAoe8nVq+oTNOwLlE07O6dKmpbRLoeo6wlKJKWIaa3eB4C746ikKiYAqSW+CktF+9+BWcEUEBsX9Bv8UWjwNhHd3z7um8q2hzFGSqJ1RrsUhoHZjtzh5tBhcW7g8/YwjjsIVAmAW2RPLdDJB8c2glWOM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248832; c=relaxed/simple;
	bh=IkWHCCFQX7aMDTxBgQKIawFEFZfCBBbHv2LydgIraqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0V+z6E3I82AjbRZKjK9vpIju555hwybl1l0vbzgaP+Q1mDg5afjOget8ItGpKPvaiSM+CSKbnUHrdwT1d6Flc82nT3QgzZot7xT4oQZfxCeXQXDvS3XYdWsbSt8JOI2YSqTk6lz8vSVnQBJYpw+FqsMfK8CIoMgug9jNPSRHao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oj4GuGzD; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oj4GuGzD"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7dfceeaf168so7279127b3.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248830; cv=none;
        d=google.com; s=arc-20240605;
        b=NHEL1HL9/IjQa7gSPEQInVqgkCwMkM8cN1yH2ddt3ootEFlVOgQ5U5fScZXJCXnnW+
         bBtDGOh+ZmuphmQhNScwgJL2fG/xTlFQT8nDeQaFYpmZeOgTLUpeBv5yMdYWCMLWZHnI
         du7dA1EQ3r1Se3uussQ6TOBJd+eE0jMyfilbfUk7P6C0DzwSQU8sE3HpnZe3l3dVpqTt
         GKDrNQdW4qy+lRyo6YKCS8OEXBI07FLL42LQ7ydoysHVZWuLBgB1Jy7sbMfzktNHWYz9
         LJkS7K4OAiwx35a1pL+ciJ0ccWCZFRciKHVrCnNu86d08+Or8sajW/7kvarJmXKYJKYp
         F7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        fh=8VI4TD5QUkdnnyIDT5DYIfJ7R89elNJgxt99AO0qXt4=;
        b=HVKnA9AItrADIsTHR/GBt+IUFkML6cfgOM84oUpLbIugO1iD3BXUXDu36EvoIYzI59
         SbvdlGSqSUpR5+PpYEPT/HaytYxOFD88w1IgXcm7d0DtBQiKSkl3i46MT8IT9lWRjSZS
         V667q1EI2//YQTSLoJdBrG0PWM2OK77fDiw2XzkLCWwkMeF2+Ry/4KjRs5MB75cZuQUF
         yMqv49tQ9GZpl9d/gqvC7Nn3eV2GqJwHQe8mux+270a71D4iUFxaeB4JaTl9/m6fchO7
         hcJ3nTwAa0swIGnBQZA5hhA917N6ZoU4iCsBm3Sj/2m9Ku6Dr0Y7BcY0nFAqFcadazrq
         0/1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248830; x=1781853630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=Oj4GuGzDu9GI26DqlprSNV/s5e3UxGAX3WAvF5EG3Eog+1hSTDfzsXpVg87iTTjNlf
         v8jWX1Dd+SPcZvi25Y2OkVchGb6xU6Sg8YfVmgsfJ99CLZH8s5qOmu3/P68rcrtYPtxS
         k85chdfol8gkgjb95XHASHkvZ+YTtvZKmW/tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248830; x=1781853630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=sICYt9DVJ7wMpHY2bKwM1fVnrsgtQk3Uuc38v2eqkUi28oXygsUpiMuzkOJPrnVjWZ
         lLI4tvVbfb0jQY5DWFwGBaGaS4CnPR6HEfPWw5HZyOvPfkmwCS9tNbNZQpbgBnIWXiLd
         t4NOQIYJHje/+eYFkPNRE/oF0RX5MUcZd2T0dpfeulGWQCCxgjYYaH2gT9wzm8o0jKoY
         4jQS672lK4AMpQQZTX+ZBd9Lwfkbj572bveUDD6FfsnpmD5VN3qcGxxBUiHKFXgJlL9a
         x7gNXqPZXEgwL/UPZ3S3IG2Lq7/BzJkmU2RYOkdlg0lpnmg0vJbxMrV2Csrfn2r7coBf
         EIlg==
X-Forwarded-Encrypted: i=1; AFNElJ/mK0VjDCcEYBrQYW+JhJT/9NYEo2e71i4xiSz0+u5KLPG94ls26ksIY5qSakAnFr6nP0lGZQBhf1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXPPD4WrtLpoV+Z2ryBXHPF4MsSg8Rs6EK3UlbK4YnTslnGB/
	4K+SQ8EYJGA4T6otpYGN/gtuNBrIZe2ir3vg5r5VZuiB8XpNuYcQRnsNuejDkI7QUwJhFIrInfm
	lZMYtMb+t6x2c+kjk3LdNc0ELN79/genLmXr5Uxch
X-Gm-Gg: Acq92OEZZkJVm8tVXOM+hFYVXdoITj1g1Ji0IoxUQdoDlgXtsze+joSN8LhfUld4TGW
	52Bqa423RBg8ZHQclWcs7fxrl26bkdbVY4/EIPyDp9gSPWjAhQDfzdo3o0xy/Xiqf7j7illrHV9
	DHoGrTpK+PaLzRwmK3uW+rvJC/oNNnwaF1DveRsGLQ4Z/nXmsWDwwlIKd13RxtjrwA5+qLFVTfi
	Grc1NH9Q7Acm169tmqZmciAyvozN5/i95AFRiRi9Z0NXaZpoCBydFA/al7FbdXx/FiteaLeFTd3
	ApYlfMFo
X-Received: by 2002:a05:690c:c4ce:b0:7ef:81dc:c0e7 with SMTP id
 00721157ae682-7f7b6242881mr15277067b3.19.1781248829675; Fri, 12 Jun 2026
 00:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
In-Reply-To: <ailv8HpnrCH3Zb8C@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:20:18 +0900
X-Gm-Features: AVVi8Cfix6rlRxpmlL_G61si3smqjEz2qk3oIH1X9DTqc3HutmT3uL6lEMZg0_I
Message-ID: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
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

On Wed, Jun 10, 2026 at 11:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> > Due to design constraints of the power sequencing API, the consumer
> > must first be sure that the other side is actually a provider, or it
> > will continually get -EPROBE_DEFER when requesting the power
> > sequencing descriptor.
> >
> > In the upcoming USB power sequencing integration, the USB hub driver
> > first needs to check whether a graph connection exists, and whether
> > the other side of the connection is a supported connector type. The
> > USB port is tied to a "port" firmware node, and this new helper will
> > be used to get the endpoint under the known "port" firmware node.
>
> ...
>
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
>
> Yeah, you see, even here is inconsistency with previously added kernel-do=
c.
>
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     struct fwnode_handle *ep;
>
> Unused?
>
> > +     while (1) {
>
> This is usually harder to read and follow. It's like "pay much attention =
on
> the code", but here no rocket science, no code to really pay attention to=
.
>
> > +             prev =3D fwnode_get_next_child_node(port, prev);
> > +             if (!prev)
> > +                     break;
> > +
> > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > +                      "non endpoint node is used (%pfw)", prev))
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +
> > +     return prev;
> > +}
>
> So, this can be rewritten as
>
>         ep =3D prev;
>         do {
>                 ep =3D fwnode_get_next_child_node(port, ep);
>                 if (fwnode_name_eq(ep, "endpoint"))
>                         break;
>
>                 WARN_ON(ep, ...);
>         } while (ep);
>
>         return ep;
>
> But also big question why? to WARN*(). There is no use in the entire
> property.c.

Will drop. This function was lifted from drivers/of/property.c then
adapted to the fwnode APIs, so it still has the structure of its
origin. With the WARN() gone, rewriting it as do {} while() becomes:

do {
        prev =3D fwnode_get_next_child_node(port, prev);
        if (prev && fwnode_name_eq(prev, "endpoint"))
                break;
} while (prev);

return prev;


Thanks
ChenYu
