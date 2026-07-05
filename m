Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DC2309AA
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783241985; cv=none; b=si5dyCF/84lk0vzX78DqL4fRay+fBQDycOG4gVsXXZoeZinjvbkvOkqXrCxdSG3H2QIFMQAhb1F96bkUJ8nhR6as65WctTOQzBmW0tWG9q2qwCBxkA2CEcTKEQXjbJM8wEC20NNgJhOwB2ztvYODWaNYKXz6gCRc1sJY+iRweCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783241985; c=relaxed/simple;
	bh=U5LrNIxOgFZ/598tnzagzSlsJRukUp2B0aVS8vEH1A0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9OxK61LvZihS8oZv/ipfC3h5w23kY3RsfZg3CuXIM7tUenKHA28LL8z6EbHpHBYaU0065w5POfHhXKTaru8CIdHcB5DTj8wKFQjJESRBRdVdFnECbyKoiLGgDPGBNdA7nlMnMjQ4TRlj6nChA51EMgLHxCf8Q+q4v8lEFvMc2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LROZUPnb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LROZUPnb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47362928f65so1956256f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783241982; x=1783846782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX0UGAN7HhoFOH0Vfo0qTeB0ju+/AOy9gmlZ/JKILKk=;
        b=LROZUPnbnzvhF1Y20TF9wvMVVen90rulSnUXnE2aAKNzCpgRlMDYn8s8/khhhiq3UL
         PMmyHAsAB/2rskIy5o87bpdU1UkAW2cr6yRUl1Q0wmIk1a/T1K2Axfs/MrziIRttkFN7
         9dWILzTxT8VuSRG0PQmfu0m2UCL1jNqObiFK9BdZhTDfQVBiUsSa1Bygbjlol/APWkFr
         Cg15u7O8J2ppNGbgLf/EGU1+5cAGQFW2Gn1ko9969MeIFBVXyHrr3rYEbQd7DkqmpeUs
         kWkKiTyrTPyZvEHqJ//sNjjg+eXvVcbuYqjwqljryiaFR31bxqWWWb6MC8g7XkSFTNru
         ayTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783241982; x=1783846782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HX0UGAN7HhoFOH0Vfo0qTeB0ju+/AOy9gmlZ/JKILKk=;
        b=o6LM0Q1UGj4IRg71FddgZLy/jBnqbjH6toq7TDGu3t65OLdXwI4oyOThsoLF8ZS0hK
         SmVum1w9oFSJ6c5ZN1M1U312RSXclldgNKnA9fLCS0VWwPESE3bEoHPt3nOjm+b25MjP
         NUOjJrwk1C9HQsLlsYUkQVplTbpC8ecXMPQLv/pe/ONjGiLZngeUQHkIfw7SOuF6EspQ
         9kuKEtereugoqhKzSu8OsufPaUUPV5jalEuikh8OVWSBZmDJLkkq0pje6bW0DJQAiDe3
         WiReN599Dw7VBIBq4FfwDQa6I9vmwcvGNRAoe1xV/P8vHCf5DNIyTPJ0ujkoCgxptScj
         knqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0G9a1sFXRAQGYZcqb2POfTplZ9619b3C4K0S4HKArZBbR5XiChmGJbcnLWoeZP5VGoyxp4hji3Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNC/ZGYDmN4f+2FQyTGj/r4qU19VmKVGm4pSAj57i/OM94sbdF
	5CYfwgGyTo6Mt/dvXbyPbd6iWjPuOPY9WHfU98PrBvtlbt/fupwjawoLQ00SVw==
X-Gm-Gg: AfdE7clf5D2+naMaokMK8JM359HsNkNM2KsMJcygUsT7lw+5yqsDZWpHNeUkoXAvQ/T
	n9g2txinL4GW7GkQ1uOhBhj8WEu58RVERu03FhxKnrEXm1WKFAl66OPbM9RN86WZ+aitRw0DCPS
	SxzLNAyeH7q3yaUn8e6mhR2N5pdGWyO+jEimAtazN7qg2mT3WzmhSjk5qJ3p9/PWZ/0xK17sm2f
	G4ON8SK7NjQy+op902IEjpdpZVoRi5vLcrnxU/KHStB6H0/gRGdvL73ANX5gW8fhxvNiTeflYL8
	F8XxB0sZ1CRkNZYqSMtrqbFrLwsObVFkJdSYGDpTEGANY2OeErLtjoqlHml+2Vfqi5NKOsNGgX2
	rS0BndHKaBcW/LiN4rD3NVz83SedlkjDAeI9qhFeXK4QdYuCd2ftMR46n5WaFlE4NNmCLWxLppf
	1O6BO91RPYXh/DZAn6htas0eHs
X-Received: by 2002:a05:6000:29d4:b0:474:6301:3e3d with SMTP id ffacd0b85a97d-47aabb4d052mr4525411f8f.11.1783241982378;
        Sun, 05 Jul 2026 01:59:42 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm14522801f8f.33.2026.07.05.01.59.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jul 2026 01:59:42 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:59:38 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>, Mathias
 Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
Message-ID: <20260705105938.797e87ac.michal.pecio@gmail.com>
In-Reply-To: <2026070255-rerun-unstable-a90a@gregkh>
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
	<577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
	<20260702105152.415afeaa.michal.pecio@gmail.com>
	<80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>
	<2026070255-rerun-unstable-a90a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Jul 2026 14:22:25 +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 02, 2026 at 02:20:05PM +0200, Michel D=C3=A4nzer wrote:
> > That reminded me that I'm using (an older upstream version of)
> > usbguard. Unfortunately its GUI notifications when it blocks a USB
> > device aren't working reliably currently.
> >=20
> > Manually firing up its settings app revealed that it was indeed
> > blocking the USB3 hub. Overriding it to be allowed fixed the issue
> > with the bisected commit.
> >=20
> > Looks like a false alert after all, sorry for the noise, and thanks
> > for the help. =20
>=20
> Thanks for letting us know, and this isn't the first time that
> usbguard has caused a problem recently.  Did we change something that
> broke it's functionality?

A few weeks ago we corrected a small inconsistency in USB 3.0 root hub
descriptors to avoid some warnings. That's the bisected patch.

Apparently, usbguard can be configured to reject all devices except for
a list of descriptor hashes. Not sure if there are other whitelisting
options besides hashes? Using this method for root hubs seems to bring
no security benefit (you trust the kernel, right?), only trouble.

Now, these systems require user action to authorize the new descriptor.
Otherwise, usbguard runs amok and disables USB 3.0 root hubs with all
children, AFAIU.

Or is there more to it and the issue is somehow magically specific to
Lenovo USB docks? Both affected users complained about such docks, but
maybe they are simply the only USB devices used by usbguard users :)

Regards,
Michal
