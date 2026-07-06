Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4E3EDAB3
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336102; cv=pass; b=tUc5lNHGHSX3la/lnfrJwBaIuBvsw7xfUBAMIwsJfkjVy41tpKTP6shGzwaPl1dNYtq+O4NCkoksxy2TCugJer1Ndop2rf6IEOMYs882fhkls3NfAE4N146bsS47eoyN60fZgOzeyTn6YABOquhk0zqvIZKZcQE/QYNuiNBq0eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336102; c=relaxed/simple;
	bh=4F/mamksgE6M36asyjHLz+r3WuYlAy4EjSD04V58GmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkadgPpFOslO06UEN8Nv2svMW0HSiZ9HVyVzAnJhQOo06X+sCZevQujYJSenZDvxPcSFYYyXUyRZJvwi77x1+FBFmJZF/CNBMpFqBUo/TvKs+ogX0E9sgCt2tNUOlX7vJ9g8+OJyT9IH+JsvgA0PsgiSZyksNsB4oj86TiuK6EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VK26Hj31; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VK26Hj31"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6675db463b9so840093d50.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 04:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783336099; cv=none;
        d=google.com; s=arc-20260327;
        b=VXTOSjQ3cuuMWRVPXKbvEJ1370HFTAEDEzOSiwGMRJZoE46IqSUiri3xUK3Wm+pK54
         Kv2gm3FGtK8QP0z9yf/S4BTONjMOxhhvy4IiwFVMi2igQvysCmctJS6u5Ztm2lCNW0ec
         16mOY42Ac/oB2g29YbDCoDjix18ohLAEosl9YL6Tqh25OePpzE8jm2EQmhNn6lyneZ1R
         DLhIR9UH7KJ83pRu8vjj0OFQ6wrmnk6TesfxsrV6CIwWNOQAzZ/XF5etLx4XIC6/r1OX
         dcuEnbnvkCU84r/khtSViDioVEmc5jfUFC+Ivf4zOmwcZ5KHZbdqarWgYmAajI7PPgUQ
         bwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        fh=nbKm3rZ1w1PQjL6zYZuAqkH1w63ypzWMUiFkH2bJ4Mg=;
        b=KjkiA4w4GebmULwEH862amWmQ4EPTpDoXl6QTJMmYfOEJnip3/6LR+eAkaPpbfbryR
         tPRiK7JlfK4roEonfGz+Bcjfn6RXuMnXdmmK5ZJMVWQxkjYry3769BJwn00bai47wlp7
         M/NudzvWqg+hduKhnhqc0z3fnc//oh8a4i5kNL7BsJvI9EvpEQe+lv7xDBWH1N6+QCu1
         RAA2r/+gRCbQvBqa29+v9PkzyJEhdtoPRXuhafB6Qh44mOtIBNKZpjPzx0VfCCJHQtBu
         BgCktxxqNyRxPPCjZs4nH1IGjHw6/1AkQVLf8FqoxGRBJiIAQ83odv8Z8U/t2zON2Jxi
         LpXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783336099; x=1783940899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=VK26Hj31UayrVs/4ulgCbhVpWYBWmOwQVZ1cZulYxavWOit5dV5tCoKEG/g9vtbHcq
         jhq50FZ57MBVX950hnpmnOE0FU+iWtFgnmz5tmrHk7jVAY81/sx7woV1a6TxIltEifKE
         kYm0CCbgjBlkFhMAdJOKvmmF1T8y4EHhE9Dcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336099; x=1783940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=qAW58Ds/oojvARLIRpFqmeJDoOva0V8WrBoUmJbPoRpRf4Rs8Y0QYX8bF8ylnDzTdd
         fKgB1xlG4+Gwkarhuj8gnvMcuxL0aizlkBlGOcTU5B0tfkt4A93IJPFupA7MyLqjfMvx
         asyEmHVBUWmzQa/bhvPo6Kqwdldm1e34qnpBGDeUw6Q5+1rKHF6zgesi0C3VB0fw7uTq
         Ld9/N+zAC65DeLyD1W/vmrUa1uzeM1cjEdjL/VLoKWs7nOzd6JXo1pam1ztPG03cegpV
         A3q9vH1q7wgxX3wBkLDkI9cMQsFbmPFVVF43sXFwx+6K/FDN7WaroIw/y3Ol0WrpieBc
         kcxQ==
X-Forwarded-Encrypted: i=1; AHgh+RodyXTG57VtHwxScx43/JbqsbIjBsUpPG7JQEWgc1sKMteZc9/Be+pfG8D173vJMb3Pt+jvB1QvfYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaC1JyYbUp80J26iShujg02avnkD3hf2MfCNYFAEXl9Rss5Pkd
	1wc5RZjyOzywKp05k+asg6LDQRgJOqd+Twq0xTKGtEl68H+forrXF94gNzo4lmur6ATvAXDnImC
	2B1emjBKltUpJjjORdopr7IbasstrxsJFoZt8WRfpwAl9oLweOcRhyw==
X-Gm-Gg: AfdE7cmAy+RykVF+7WBctxQxu72Yfm7lHdbZ2uLPG7oRvlZFVxuZ1tb9ni9vuNQCQLc
	TC73HlouuzDFCBTyyuFMk8eQRzz1bIBOmm+jkHVCEhObyuBg0KuNj4lkgZhg/GmY6tU+N7pFe6l
	iL61gT/VVk5oR9pDbuCMNX3lMzvY/2n1kjjUUv9Gq+Hoqhl74OxQ7olUAq7+psXeKP5WR0IvvhU
	Hyt0dEpeG6KCCayDdU3kqMDo9s/A5Ja+wKmdKPtaI9pNxaDEHRPKqMev3tY+vGdrjU/6GjK4u6+
	cgvEWo7gfyM3xGgZs9iA6cx6qSQ=
X-Received: by 2002:a53:d016:0:b0:664:c436:e525 with SMTP id
 956f58d0204a3-6677fd49ec4mr103596d50.58.1783336099517; Mon, 06 Jul 2026
 04:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local> <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local>
In-Reply-To: <ake6FNy83LLtCs3b@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 19:08:07 +0800
X-Gm-Features: AVVi8CcaHXwr5vK-Mk50Hl5ytWXCTbNUaYqO2byI6p2Q5_6clKTL9yyyDNsH5MY
Message-ID: <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > > > usb_port_is_power_on() currently takes |struct usb_hub*|, but only =
needs
> > > > it to tell if the hub/port is SuperSpeed or not.
> > > >
> > > > In a subsequent change, usb_port_is_power_on() needs access to a pw=
rseq
> > > > state tracking field in |struct usb_port|. Either structure can be =
used
> > > > to identify whether a port/hub is SuperSpeed or not, as the field i=
n
> > > > |struct usb_port| is inherited from the hub:
> > > >
> > > >     port->is_superspeed =3D hub_is_superspeed(hub)
> > > >
> > > > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > > > |struct usb_port*| so a subsequent change can use it.
> > >
> > > At a brief look this will be the only function that takes usb_port
> > > instead of usb_hub in the entire hub.h (I don't count container_of()
> > > as a function). With that being said I would rather see it to be move=
d
> > > to port.c altogether (yes, it's more invasive change, but looks more
> > > consistent).  I would even dare to move struct usb_port (and containe=
r_of()
> > > accompanied with that) and this function to port.h. This might requir=
e
> > > a separate patch, though.
> >
> > I agree with the reasoning, especially given the function name. However
> > I wonder if it would cause problems given the linking order. I'll give
> > it a try nevertheless and report back.
>
> Thanks!
>
> In case it won't fly (but I still think it's better to split), can you at=
 least
> group usb_port APIs and struct? Means moving the proto closer to that str=
uct
> usb_port followed by container_of().

Looks like it works out fine. port.o is linked in after hub.o, so moving
the function from the latter to the former doesn't cause issues. One might
even say that it is the correct thing to do.

> > > Perhaps something like: 1) "move struct usb_port and associated APIs =
to port.h";
> > > 2) "...this patch...".

There are still some left in hub.c:

static void usb_lock_port(struct usb_port *port_dev)
static void usb_unlock_port(struct usb_port *port_dev)
static void port_over_current_notify(struct usb_port *port_dev)
static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
                                          struct usb_port *port_dev)

These are used only in hub.c and moving them probably makes things
messier?

OOTH, the following bits are in port.c but declared in hub.h:

int usb_hub_create_port_device(struct usb_hub *hub,
         int port1);
void usb_hub_remove_port_device(struct usb_hub *hub,
         int port1);

Any preferences for these while we're reorganizing the code?


ChenYu
