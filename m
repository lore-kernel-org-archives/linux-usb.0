Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB76535DA42
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131250; cv=pass; b=LZilkDiw7/TZgj++ngg8rZerriq9Avk89h3Umod+qcm0DU8dbAt7UiUR6jDibZo5JcwI4wv2litcvEAZrFdE0qQf6URsdbTJNSywaouTFm9UVZmELudqSI1Hua/KayzPQrMMqm8aglbRG6al9IfAFcJCMcwWKf49HXpYWliuNDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131250; c=relaxed/simple;
	bh=U6y2778gV/zoZJ4mqp5v2pm/RGDs0J8HINfVltgsuYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZajRb1MZahtMpecB8SdNUMx2jRXjqhZ1dRoXru0bNmLkKKqr+Zp/6uf0IJAAoqg7GNgWztmrctRpzm8m6bmfwBUoNT83SeQl6rulcZ7XlomVgvVxbDWHG3a7L4OAA2QEreUaG+Kab1n6XWZxpmnbgAifUSw/U6LwVg1iBnmFeXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if9oZXL2; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if9oZXL2"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7389cff36bdso993905137.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 12:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786131248; cv=none;
        d=google.com; s=arc-20260327;
        b=gC7LskGp7tL57lcDRpCrglQIXv3XBj4gVUlvCFKSWHbmeAkVjYRJFNlee4V8GEhTLF
         Obp7/1ELKksUkt5TSk3bq3IzRy57LOJ4THtKQyCvySAIPiMdydDrNEmyzu862lrOUR3v
         PRQ3mqoEFkRYrCiDGlR5+j6WYRkLp7VYGhmw2mMCsE3aCXW5hwlKQ/ULnyQySPGRJ8lk
         Khe+CfoRsXO0Ha3LamCyO+jOVrzK2+fEz3w921u/zcIdpDbWDB0Qk+LtObyWVt0lZWe1
         9paFPPsQyST+kPuyUV2UZ5JuaeCb7YajVIet635VRil9L6ZSr4Acd8OHU5ODunA0shih
         OVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        fh=c8t0NZxOmcOtq3BupRgiGECmuSdHr8xcY5Nv8IV3IfM=;
        b=LEm0pPazi1Z87LjC8JATOqxzycfA21SBqwmhVXdgV42/9SdGc52eSIao2CxlWAjVeD
         8R6y/Taht/aoHaSUc9yovpvOZ8pNB+X/pYOSp7prR7PAk1uF5ZhTu1pHO3w408zJAbsd
         FMR7ZGCkSqSB2MQhfvtlKJRlzF9IbAWgWoSOo83qX8nWhU5muyI8loNogq4y5DvtNLWI
         VYHwnrsxawz3aqIXYA8YAXXDuX15DT+3HETOSls28jhJ2HdwUsxQ2wWTEFwTZ/Cyiucx
         LG1gMRlJ2d7LeZAv68DV3vDQgrna4SeRXqYSrCSWh7CSOlvmunRr2405mk5EeQ/Ekrdq
         23KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786131248; x=1786736048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        b=if9oZXL2QnHfigqUiImu8fydZDDmfepU1ziHSDHwg7vyx4Xxy/XF34gEbxEUmIxlYr
         9lnAor71qGZtrcZ1O/AuT3Xh/Tnc00I0GrcxCDbiovj7vYoBlf/wWyIU5iX1MDNuAiQr
         sR2mxMFCsueH4zaYb4l9jPB6vDN/lJ7pzUNYfgfGxdGHxEYSUB3e84igBa/7w/KH9aOJ
         ljGKoZxmOvtGP7U7YTOighKHbaO/0ihPftlNtXN6NW95qC1Wt35lfYcdtYDNkzgNH4Zx
         UkEwMMrpGixtIM0fpafEEGuwKs4sIkmPozmk2RMLVOphB//8Eh5HDdpWeDByOxTwmbol
         x4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786131248; x=1786736048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9caxZJDo+1eTj4vuH9vzEsfwbNVL6i24iyprVwcm01c=;
        b=En7M74exDSrdH9lVicQB/Y9HakgbQ/PdakkuDEszGF4QKOiJtMGUl5pC3u0HMOIY3e
         7S5BujO24uiRk57USYasj/cYXQzzwd/6kXUmDhWdMOeqB/jENqOseXD0oucVqYHdSjow
         5WwHWW57GMOV7yHHYacZ0dL1i3sRZ7D4/J9dTeJZsQo0EPt3xejKH7gG6IzDvLK2ZezD
         iM5IJFF+UUzlSrRo5Gunx0HrYHHcHYisHJ9mh5SkxfjYtURyTZgsAr90lEHBo9nmTela
         cxLLyPZ1IP/vVZnW8gR8/ud00MlZGcLQ1XpPubjU4lANVS1+vbt4EwdD7mTO146aoAaz
         vucg==
X-Forwarded-Encrypted: i=1; AHgh+RpMG9nrMKDFCbgEry03oR6dE4r72IaxMLYUHd8Js2wZnGl1AyBqFUuO7iBsdClfuGICNk2Dbi4CjQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7pNaqzlkyEb56muVkinv9qsl7v+owPAZjxoq1p/xe4jKn/nQe
	LYL/NLEFxNaScLLMRQvNNjEErCKxFCXSRdOC4LxzHnMlFmOLz9aXosZjpEqmf72ZtPeJbg36CSG
	l1jogMyswD+vaafqjBBGuLGcD8MA++qw=
X-Gm-Gg: AR+sD108y42pUPL64cyYL2DihRjhRDb0ZXjyA9F1Jx86lYzAvA1adVjX3uZXt6QLQGJ
	t6LAtvILUyNfsT9P+W+qdKM4iMdazahzTQA3JzcNafpyvi1qqERfGIGm5+Wba1burYCI2E1yIXC
	0645A2KORDuVoA+oj9Z7qONnLw8nXUpJb3rI1XH/gV+LxymvLk258Ne82ffzswM54D3uE46Ys/d
	/JY3Jr+KTRnvfYv4XKwf9LJHvxmQ839zkms43u9yZpedlyV8VP+vw+ZzVDWElZZ9Ep8q8hW+9bP
	6Vtr6gg5mxtRxXyQ56uh2IlcnKkxAjp5i7FE26XuvwPlYQwVGkg4voiQzjQzqP5h6m+pBNlbYI0
	xwYX0QCPV4xJJ+tkk3aZ0oBwqTvJdQh3xjYrwPGrRYT86bA+n9FQHoWTStM9wGnahJCvD/c3N78
	/da2b1C3F7wNyjYbBIWqV1dAgmqidZKXuxerDN
X-Received: by 2002:a05:6102:d8e:b0:739:478b:5bf2 with SMTP id
 ada2fe7eead31-760e8f347d4mr6463052137.13.1786131247763; Fri, 07 Aug 2026
 12:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch> <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
 <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch>
In-Reply-To: <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 13:33:56 -0600
X-Gm-Features: AUfX_mxMpD-qand8wklMDqDrRd_xxDI0iY7G3-8rmiKaEvXH5AFL93SLf7_FiGM
Message-ID: <CADvTj4pJG56UERve8BfbYzjCLO4KBDDuFviTcz1ivuwUFRMdxA@mail.gmail.com>
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

On Fri, Aug 7, 2026 at 1:16=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Aug 07, 2026 at 12:48:43PM -0600, James Hilliard wrote:
> > On Fri, Aug 7, 2026 at 11:15=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > I guess it can also be used like this for live dt modification:
> > >
> > > A guess is not good enough. Give us a concrete, in kernel use cases.
> >
> > I searched the current tree for callers of the OF changeset and
> > overlay APIs and for OF reconfiguration notifiers. I did not find a
> > current in-tree path which adds or removes a child below an already
> > registered MDIO bus.
>
> So lets wait for a real user to come along.

So should I just drop the final "net: mdio: support dynamic OF device
changes" patch and keep the MDIO hardening patches?

>
>         Andrew
