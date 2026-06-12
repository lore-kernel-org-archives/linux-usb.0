Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A03624A9
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248036; cv=pass; b=YL2A8h3ruCexLHnXZRtdar69wfQjPBMzfsQwBrGsh99pFLZmvcwXmoeBrWtGRjb6Qp/YNopDBT5m184GjSBEB/K0hH4X0tvK/BLIMyTmcr+qok6lGRxpMlEjOVuw+/6C4L+aXVqNDx5yd/LaoRPLAi7WZ6n7idWdrCiKZQVQtXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248036; c=relaxed/simple;
	bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3ecZUJjESh7kPREKEgwYSNTgliayg0eYxntL/yUqeLHGOYrQHYZLMnzSu/gs/KA2l9pri5PHzaUcOC2NVlb3/0H5hZK1HzgDm56wlBcklh1D5U6Ll28KuqlaRvzfB+Eg7l479xMUl0YhIPH74PPsujoS6Gxjgx3/vZhUNdEhv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GX6a316Y; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GX6a316Y"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7e2f3646c10so6960567b3.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 00:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248033; cv=none;
        d=google.com; s=arc-20240605;
        b=L6iwnG0cv72t9zEETu8CpLUYpFiv2Aybw1jNLBr4b5kRipz8FHcsNt8OCJ6S7tmr4V
         Nc3xUP1L2g5u2ugWshNMGb4LrqRsGMd9ocvrdSlLdBd+sdwUzOEJ9wGz840q5ivJ6Q7X
         cJ/jn32lcVcyAonngzi3yYmlY243jB11vpKVDbujQA0fApOXA2Ea7hQtC/Q+XRmXJd+/
         yWPoVuk/WkUqjTDI9d7fwfLv59w8FCSYW/krLpwwfEG7MmrgMesvA6/LsyETWqJ/E65P
         qk6APWo/3aKksvqded5pi7Y/yeLeoR63eVuF0ZnGa2rHneAvARWq7zIABArsThQ+x3Z7
         l/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        fh=KTdQDw8RStZoleTzzbndgq6XelYSeyrgxMOBcJUMGYU=;
        b=ZEssEwwzehX6+Fid5xKbOpIG1b5WwjxJYPkxT6T1bzCbj0Jctq2fsj0s0XdA6wA3iy
         v8eiNY1uKi9QeTJ5m+NnPCmApupdc7UmTym7USjBThEa8Qz4c+C3xaY1ZZNiOCXwOByY
         fnainRrpkhgh4vG3IFmam2cGoOq03Wcqip+NeRTznjZqvPHVThR23gcKTTV1gSxbw+iw
         uHH2gJQ+YwhKeFTVBGmEvwDfzwP91662LgZM+bkPXKWGpZvrTGMV/BNYiarW6UtOP0UP
         5jjE12Ey5qs+VWDxXIzy9K4ufjr37rgHZfm3ldM2lhBCCfz4ttal8KYRSGubC8cKo0h3
         dMUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248033; x=1781852833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=GX6a316YJGltvP7NQQNtDlNb59sOQi88Gn9mV1Y8TuxfeZyuhU9puM51+9riltZKfx
         JHWs8YDubZD9ui4RTOdUsaFTPaj91O1gorrBEECB6BwQPfCHQz+vtI56oYtN5Xxwvhzr
         yDJo96lcZ6Yu/IHeXD9RRo3g9YtRxf78bYOiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248033; x=1781852833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=YQfkoZAZTL7rR4Sr6LlNAiLThsVR1PLXxImIMmrFdbYcuqia5Qw6qciPGITricdp50
         xL/eRfIb1vfyI0d75Gwlg7PweUNOm2N54udmsNnsYNcMK07B8wyQf5dWSWYzAtW61Yae
         Xmnp2hJ/p/zuAeSvQBYeqa10IIS3+Aey52BF8ug5R18pvB6Y3PuVAgWPivcJyF9UjmfM
         hwZj0P1g66Pd/hTsDdZHGdW2IF0IiRRrr/liD3pfAyFXk7iXOpkiNcYh47UI6Ok/TJOZ
         nEKQTsNYyAD5Iz9XTT/tFEtSKrOppkqwMdz6Z90BnAAg5kjPmv8iDJCbPndsESPap8rj
         GZxw==
X-Forwarded-Encrypted: i=1; AFNElJ99O/t+Zz1AzCRwQ+hJpFXNVbKUD0DZMaM2eAZxaWLhuFxLyCp3xdPhyqKNClXNP9nkQH+FmeXKW2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlna6LGpfXcfwcxD0/q9CQU2dWnE0j2yBXtmH9VoOR+++Q+8FQ
	xFxKYp21iea0DBDXgaY67h9w/taa5n068lPTy/WxlcjUR+EwEEDS/dPQya0Qw9HB8TGCSf3a0EO
	RftCXzI8jSpIrrJQl0E7a0PuLNUutTQQCUxQ94f4W
X-Gm-Gg: Acq92OETjsY9irlPmLGyRA1aIEJQNtnHYTWMdNEYn8qpsd+RX6GyL51ghmwMC1yLt3i
	0CTanAzwih0SJyjge1jRw+bE9NXevu7d24jk65aoGhcqHKJRtCUZZGVeHn2Z9cKVTKxeU4ELVcT
	9mjBE/PYTjhTczO7CU0CZZbKJHS1k8jj/DstiioOLQjO0+YMQK22mLwdl9yuNSw3j1Nuevs4zSt
	28YNR5ZzNXNX58uQGvUWF6lx81reCSdCdbpagjlmrwZLdI1jRtezWc9U2MabpTgutfrXGPG+dge
	4yNeMgHQ
X-Received: by 2002:a05:690c:e3d1:b0:7d2:6b8:6e4a with SMTP id
 00721157ae682-7f7b6448b2bmr14221767b3.18.1781248032935; Fri, 12 Jun 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
 <ailtMyYhbkOgaZWw@ashevche-desk.local>
In-Reply-To: <ailtMyYhbkOgaZWw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:07:02 +0900
X-Gm-Features: AVVi8Cewi0jX5G3AwANJfv_JfU8wtj5jI6ryJrZRjeBtUWWvLVEyokylnfzsf8o
Message-ID: <CAGXv+5EZp0KvTqMde9da9mUWJyg+6X6Eon9Sqxx0VbikfVr8fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
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

On Wed, Jun 10, 2026 at 10:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> > In some cases the driver needs a reference to the port firmware node.
> > Once such case is the upcoming USB power sequencing integration. The
> > USB hub port is tied to the corresponding port firmware node if it
> > exists.
> >
> > Provide a helper for this.
>
> Okay, if it's really needed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +/**
> > + * fwnode_graph_get_port_by_id - get the port matching a given id
> > + * @fwnode: parent fwnode_handle containing the graph
> > + * @id: id of the port
> > + *
> > + * Return: A 'port' firmware node pointer with refcount incremented.
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer.
>
> Note, the Return section must be last one in the kernel-doc. The last par=
agraph
> sounds to me as a better fit for main description. Basically check how ot=
her
> kernel-doc(s) in this file are organised and follow that pattern.

Will fix. I likely just copied it from the nearest function which happened
to not have a Return section. I did a quick look through and it seems many
of them are missing this.

ChenYu
