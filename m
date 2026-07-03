Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2243C4565
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084650; cv=pass; b=NquXWDiWlNXm66mCa6h+90vCArt/KGOtL46EjDtnPMjb2YuDdJI2pfwwCaSh//yxAMI0+QPi0Xm4BL4qogLJ9KyTdiMdPCDpr0OxJAYLRej8ve2+sBpdzYqru2Aj5Cg5fkyHmBXO4BIQ1kjnvpSkhHE37+fRShxZSsIKVu0gXQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084650; c=relaxed/simple;
	bh=3AQ8P2Il+2wWlMlJMTJ9+9roF3hePCnmEzgS9nHgr5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5C3JS5+qw+f7YjrFJ78xcC4KpCzDtIDl4XKLnUt4qHwCwabZDVnN3OSW9WyTeu3BT08py7GG2GfKFG5VAq2+e1uYKoxajOAYn3E9bc1y0h0XEtKRDIAt4shjyT9i0ExqJLkk/vUVxvgyUlFsNXStbwmWAaZRsL2ipK/IeddYqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kOR08oau; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kOR08oau"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664c7dc6830so449259d50.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 06:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084648; cv=none;
        d=google.com; s=arc-20260327;
        b=S4aECMZDaLKlDkXw+xZTNSxHTkgjojXYfXWgfD71gj75aRk8MzQPhKWYcSqZ9GgrfZ
         cZRiN4mDhPf9e4yegERu2+9df0PAySMkJeXghZXd2agOzjZ/o8FavhRc3Wu/30FwC68+
         GIludShOFOk/Q006sqJtYJxK7pK6Y4aVe6K55uqqHAx9R5v0YSY0/4RVQZi7mJ/T+rgr
         eYkmVtXggjPYFNeXz+NEFPtDZV5sRxayiBhlBQb/HDmlAqGXKDRSHt0AzyORxzBMbY2D
         75/QLZB5fT6kfr/vniKtQ7cbII+pYg//hXhdhAa8jI+oJ1WPpXNf00TQLb0UNcQ73Il/
         eiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        fh=X2pxYgBEb5H26HF7xCvu57YVvqKS0pwsd9zBGl8bStE=;
        b=XJJrPFL9+V+OrdRu5tbkyv1QAXdTz95SKnJyczr+LcHxujAX4OFIlNtrsipBI2TUGd
         GXQM4RKArlpA6IqtAk+XUK/ooYLipsTPlKm1BihlR75woNMit0UtRTXgFsvmj3dDdOw9
         hi5l0VWgOdcAmncrBbt0vml98Tp2XzLwW1oBZYeXN3ECRIhfSToomGg1S4+u7bIQQbfG
         AdKOhH2UZVZsOOtcEeiOM8RDVNtMXTE+yeN9llPdLLUMJbTnH6hgNrEcqtkHTIeltdEx
         uC0xzyaonALaLPeXTffeZxz0O//OpbMHo9ab5hpANq1KGzIzYfeBUL5Nnwp47MdBiae+
         adtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084648; x=1783689448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=kOR08oauuwV5CLqCy06oOJwcI6DpRd1hNhBsKq/nfPh6QJN16cVAx7Mip3GeT8ANUp
         m7qaeRrH/XlhHNvaMrYHCKdwyWD9TZVycZzUJIJPXPCLG9121GNkBTf2uT+rmCH/3xyk
         TaW8UgqV8xCVN/aNj3+aeNcKMEa32VisLPT1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084648; x=1783689448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=ja+BnU3zFHhJ8K+GPHscVoQo6J7r2eU3PuxzHtgkDa78ZyJFJa+P4fRnHbheWbHniA
         imi02lOZU2y3TtxhO9gZfdEBy9c5ZY7GWNBcAVutk+OMTDj+EgZITtxyNJf54QWvIkb1
         C1oW8r+5wPPHSU2ddRnKAFI6X44JrhoDrTjOYr0toO4zYMcOVw8cOJF7gTn046brSwzf
         +Ww8dmgHBlFyzAPjKH0G0xzw11uUw0xn9qEUaTQz+fb6A/Pj40mQY/VKo0pw8iUQaA1e
         WJ2W8SFoccTotGxunOxX5bQrj3VsPyttOcaFh2y6zV8xNiMBsfo6eUA4D2up7UaK+LGT
         zzMA==
X-Forwarded-Encrypted: i=1; AHgh+RroRp8xUh7Soiin8VC+id3mqHi7Kia8MyfOakEQ3x0av4VRTXWxpcwujLRC6fXWbUV40eKkCygJGOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Ho/1Kd9dyeZGQX8eqS71vNCsTbOEYdeGDDNzSX07nz5vBw25
	wbIeXnhmeL4oCbcJDMY8Vppid+05twpU86SAiXeVd6kM39UgHIUATKqSeECkh1EM72g7X64GLRw
	u4az6iNhmaBtz5ZW6qJatQ5m7y4UYQQbIxMVqQo2J
X-Gm-Gg: AfdE7cnk62wdARasN4oNVvHo28xNJNa+DlExi0UZw8yC8N/dSlEQ2jYxobSRQpJWy6G
	MXWbsZObgXVBBcr66xReV8INquJIUA4OTf1wDF8W0F/EvCldk7kRkyZRaWTPsTC4eqw1LSgoJ/g
	u2+gK7c91LxODC5HPnBKG1R8Gtr5nDqNM1FjvpBLVvcVN6pfkXgZXZ4VIoGCqPT0YZHSPrs2XFC
	u3iCT7iS5du1+MJvCqUwGiY8XHZ55NKiIyUtzQF1vc7sNvbqDDfHLxqWTAJVDd6pwQxPyIVq837
	O6I/W6dPIZUOYTPA3LHsJMmj4kI=
X-Received: by 2002:a05:690e:4805:b0:664:de7a:a014 with SMTP id
 956f58d0204a3-66521a07484mr6637877d50.34.1783084648062; Fri, 03 Jul 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
In-Reply-To: <ake09vk4fEv1D9QC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:17:16 +0800
X-Gm-Features: AVVi8CfejZEcwq-X4tSLhB9B5zlOpwIE7AknFvssi26xknUZgb1hl9QfxXck8os
Message-ID: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
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

On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > usb_port_is_power_on() currently takes |struct usb_hub*|, but only need=
s
> > it to tell if the hub/port is SuperSpeed or not.
> >
> > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > state tracking field in |struct usb_port|. Either structure can be used
> > to identify whether a port/hub is SuperSpeed or not, as the field in
> > |struct usb_port| is inherited from the hub:
> >
> >     port->is_superspeed =3D hub_is_superspeed(hub)
> >
> > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > |struct usb_port*| so a subsequent change can use it.
>
> At a brief look this will be the only function that takes usb_port
> instead of usb_hub in the entire hub.h (I don't count container_of()
> as a function). With that being said I would rather see it to be moved
> to port.c altogether (yes, it's more invasive change, but looks more
> consistent).  I would even dare to move struct usb_port (and container_of=
()
> accompanied with that) and this function to port.h. This might require
> a separate patch, though.

I agree with the reasoning, especially given the function name. However
I wonder if it would cause problems given the linking order. I'll give
it a try nevertheless and report back.

ChenYu

> Perhaps something like: 1) "move struct usb_port and associated APIs to p=
ort.h";
> 2) "...this patch...".
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
