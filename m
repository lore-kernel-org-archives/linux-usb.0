Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70233C53D
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120880; cv=pass; b=r8VtMMX59g1q0pWc+VqALuu8ce4zzgIjAUE3YdsjtOko8whozQfzq8UXWPQbMY9vWLvUewl2h/HyQcsIztPi1Vx2E9PDnFTGaeQw3E4p6hN6BQ4ALjSDfpblY5pS4r37FyMbipKD/b2xM3pKcbUB4iACRu2b9SkVhF9yAQGn4tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120880; c=relaxed/simple;
	bh=H4YOFrL1KfBu3NDle8YUdni3Mk4BFwaMFq6LZ90tQgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObUu2ltHh3UZN32lWeinwFJIF9JnAXy3uWVGxHZ1uUPWwzxm25zUqx/oCeppI3BKiEOmj6j5q5YaxkTwhPIYEJAmb5pjolNjJ7x5KEYpCJg79We6HKmRLqfJLDmdXmPwuEUmJNt/ZXtOndFmayD7tdG4ECfusbqv5dmGYdWMT2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQWRLutR; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQWRLutR"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-969524c1a63so2517563241.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 09:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120878; cv=none;
        d=google.com; s=arc-20260327;
        b=oy8Rry+Mf++tq/+ayrgsoMFye/pBmXhgg/RYK3NQZoJQ3uzu82AJLNeL/4DfLZqpGu
         Y1mk1DNhD+fGFdeJnhPDddKsAogyU7vgKogT6us6QNH3P3RPrW2CyAnNy1OCDtXCIyP9
         U9y39lQqn3I7lpyG88WM9p33qvyINtNJT8sc0/dLItq2rLAqJFcBK1wg/73EKqOSGCCF
         w2GJQRJuZAoDf5f5GQh77aKTGMgv4B4ljCzNGqsIE65JzbY0w/q0KUS0kb8xK87LJ17A
         F8ZdgNXTU1uPJrU12CE0eKryGfo55Se31qOpvb8u+HpxBD8S2fZqzobN4Duya4IebKr4
         tb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        fh=y8GB0zBUGQTernFWd6QRloV+jPN161pv6YdeDPoTBeI=;
        b=LaE8vbUTfhpWc1uLQ1OKhHym1oHhr47d4Q1J/sfq3RNwoPuS9c3ZX+tSvcn9U2T3b1
         uMKOUKF3KKItJc9Q5QoNvD4Tm48EeeHNKlv3IvmQ2vIXlIVyV9q6u3l2AHTpzQyMGUqh
         lFZ2Em4LjQWs56oowVEI+tZqk9+aNB69LhpA7hgSHbcOI1YI2T15ID5f15mKC7DqrffL
         84JuvMU3xTim7BUISh+mWyrarZ+oKEd8dv9vlMLveZtCT9SWoCpzmMfRcJXv5jK+2trt
         Jros+TOfZhEwr130bOEiOGhcv6V9vYOc3nGsQuN7w/2LH9B6qZHqf1h8Gre0bT0MUQsj
         3Mlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120878; x=1786725678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        b=bQWRLutRFUKY/OF/6kmInYCWZcLyGaNyhItdMuuSNqAsCkK5solo5inhvi1d1BllN4
         f2FoUM7mxHcL13xsdSR/PjkSNpSbqJj/E0MbKsRafc9xqsmfzHCyWRDEBQgN4b+JLK08
         UYTx5SRS4fJuAJpBFSxSuNzed4SPx8gdwyYj9WsGBB6ueJggMvg9FWBWELo6wWhOn3rA
         y1wE/RT0j5aT2IJEjyV1D4zko8RrVkwsyjdXrAGkhLFYzeBU+1Gc6EYCzu+62B5DJ6Gy
         HfDT1izxLFumQm48VEMQWq8NdYgygHFzGxLO+uJr732wFlpsz0FiOW8K3ymk2DOyCMxc
         APhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120878; x=1786725678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        b=GkncrKssac5FHumAU82Jzi6lbDQ19+5EJJKm2UucRFEyGPs3I3949UeOoo2jO4WBiw
         H7Rw9r78rFjcs0M6foaxBmbb2/FLwmR3ayzmDw04OJZYXkbWqUTqU6EHQ1qrv0GAtdHc
         UNLT97CX1dpD4TPgXuUExyFw9TKmfyI7uQ8+vdQPVIJmfd1oe4mJH8rhW/U3Bsp/3ERs
         quQlE2QUDZRs0amw0op4FzpNaX0tvGG81ux93FyOzYyUrXejAphSWibzXt6Dqdw2oN1G
         Vwz1X4ETC5YO6JwkcNSvG+aCv3pkMeE5IB8ikC6w1XNykVYM0u88jgmvkJ2TZ1lzMdO1
         4mhg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx69hHnkx9LkKbqdJ6j1ErYzjdqC0Icm0fULb6W7cLyX1pQrn6PlPIukXk4gbQhJM2Yvu+RgRQAuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIl17CAra5Qm98X5kpfxA4DkFgnbMZFKmkAb3jkHV4HDWv0ki
	ss0R2UzPDaI5S2cV7OGxGg1ylAA/tXDvHud4PEG+fE6SnYTgM+/gWQLPlmhTuZDpNa9D0Qm58h/
	+Isvoi0/GAjRn0tPHg9QDKCfKH1eMZeQ=
X-Gm-Gg: AR+sD10IDtFsoYhIkTyrQzEiYZJyu7qLu/PYa4+DR8E+Y+F2bXT3hKF5gzsE0R1SSTD
	4AWFcrRqFMIptNmeZ0pHZ4VgLdArnSy/0G1moFstaOMsft5Fh97Hc9iQwmpL5hlk9uJa77UkLX6
	b7oxc12yUBKdacAS8pId+fNa2BKP9ODeJUUpzLgpTUT/bhQDLtkDDYPu7P94LQxG+4frRi8UnS9
	8HP2ugux28h6Lx1Z2qD+cZIjuHPJWg5+ZrlmlRfQfH9wET5wV9Z9kyJ6Csza2QzpqvQZ+Wt/Wtp
	Vt8RedXUTbrgFCwHgeraRy5GviBXSFXKFNXkGFLa2y42w7+UNpzLUjeyA4RajEdjKU+SL+Ay12E
	g1l6ZaOSlyFo0jD+mxXSa1X8iCOiIGXRaktes0qgKV3qkMWISqRtyKhu62Go+5pdWRSrWYbH12z
	7lCKm15W35EIpnOlk4oVJzxjLWC69RPUxWdkRy
X-Received: by 2002:a05:6102:578b:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-764e72c3a27mr698784137.11.1786120877713; Fri, 07 Aug 2026
 09:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch>
In-Reply-To: <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 10:41:06 -0600
X-Gm-Features: AUfX_mwLDixIRmddCRIK4ioEeGf1D4LRV-vMQxIFETRbvqYEEeJik4zuAKwk_IU
Message-ID: <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 9:10=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Aug 07, 2026 at 08:59:47AM -0600, James Hilliard wrote:
> > On Fri, Aug 7, 2026 at 7:16=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Thu, Aug 06, 2026 at 09:54:19PM -0600, James Hilliard wrote:
> > > > MDIO buses enumerate firmware children only when the bus is registe=
red. A
> > > > later devicetree overlay or status transition is ignored, unlike on=
 I2C and
> > > > SPI buses. Supporting live reconfiguration also means that populati=
on and
> > > > removal can race address scanning, PHY attachment and bus teardown.
> > >
> > > Please make the bootloader work around the issues, and drop this
> > > patchset.
> >
> > This is just fixing OF_DYNAMIC for mdio now, it's no longer used
> > by the AC200/AC300 PHY patches anymore.
>
> Meaning it has no users?

I think OF_OVERLAY depends on OF_DYNAMIC?

I guess it can also be used like this for live dt modification:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/t=
ree/Documentation/devicetree/configfs-overlays.txt?h=3Dtopic/overlays

> We don't add code unless it has a user. To do so pointlessly adds
> Maintenance burden.

AFAIU the patches other than the last one are still relevant regardless
since they are fixing a bunch of generic mdio safety issues in code that
has users since MDIO maps already change at runtime through non-OF
paths(i.e. SFP insertion/removal).

>
>    Andrew
