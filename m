Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEE3B992A
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543454; cv=pass; b=ovnMAfoDvj+5kyE0gp5WHhUWVDX6ob3jhHwT0nVgjJ9eWMw4kRUpxktM4D0F4/zE/z7e4ytQthqMp7yoH83OcAXhMUZA5OGJmBysQ1NNec4TlCBjLquwUCOto75M9S8Q4wo+vZbhWm4ocoxKpTqxLPtEnqcHRr+dZXKlpNKxtaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543454; c=relaxed/simple;
	bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2ss/KtS9HwBpF2Q2MIhU6xDfn0fgnPJNOCE+8637ZteoZZ0GhqOcgvkoFpwq7qBcduOZ0MPyidkJrfNujCavZ3zRYp9WevrftagnEOSmreMGQ1dsLnNCMQl08kR3/jK3cfZIL10ELyX+6XClqYPQmb4sdCO1/Q14KNH4RApZBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSwhkhlf; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSwhkhlf"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf5e6878fso2781547a12.3
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 14:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790543451; cv=none;
        d=google.com; s=arc-20260327;
        b=CS9Anqj3IKFpJdSTeDXwstM1bKfwr/Md7LXGgvORWBggOvPjRwj/BYVXHSWDnMfbra
         c3Esg/EE0TCPM0XXqf9zB3pvbpJRzJdZC6SB5pw1NeepkJuhq3s5trrj/NPCAolFn9Mq
         mBuJjpHy6VT+JafTEjli0s63GPPda5yREYz0azWRRUP6HnboLiY1fYWO8IF4yaFdPWWE
         8OM+A5v1DXPgLu4vaNpNpxTP3/jjUjWhvpl4+94vPrS3oGOQpHRvWzFSmDlebGxKs7+0
         an9sidx7shY8/sIdmnzIQF8KSiLgiTbaHJTM7Tl+UV7klEtFAoNFiE6ujU/esUB11QL5
         YrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        fh=pQcRkoGS10NZuaJp+UOESi62rvOsODxyyNP5qysCSYQ=;
        b=enyIpXKXrqkj/xGeaDqZtaZLeEv6cfBtcBQmvl77u/7VFNgfCBQuTGg3o9YthiROgH
         r34TsjgY0KPAt0ZFKFSEeklK9m/HYz1iRHIOqzE0IVtF4Xx2pBtEum+LMPvs2Y9VDNCl
         Gv+B0kKiE5qASfYuysFZnEY5SM0tMfR1+tdFkF3Ka7m5XiUYPpGExI5RDHmSPklr9s2F
         ooLmtRknf2Vad0Kl+aJEXDsw8qw9fI4zNEhj8/9wwvQ0Chix0o0HxXono2Aj2c6lS+h8
         UVtb65SsgP93PkUVmk+oyVXsL/BkzJrp6r6tb2+qIzC4AmpWrSRT9pBqdcdpwavAouea
         866Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790543451; x=1791148251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=oSwhkhlf5AxBUNHBP9ueBnjtMWNC2CFksnniRllzgebZw6iCtl3TTIv8ZjsUMJPLMh
         Qjse3mO5n1MNPjgtM8Hjq1jtuKXq3f/q+IQisE0iw2DaReXegMd1x8v0YHfI5Jh9Swy1
         QPGfOlkjzkdvHoz/lSbRY2+l5s0Y4EF106rQ5PqTGflvvJFlesu+WqE1ASShoRFvs96+
         Szo8TF6uS0yn3ORZTPuHe6aavRYQTp2CP194yJYPbKi7hvFY+unI3RHSRlJFr+kbZ0Nz
         EJ5IieKyOoQt1qfcXBbI1NiR6FEjoTEM4Qfr0eg6NkLhsUzwuomQw0cxyvtOfzUrQ6ua
         xbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543451; x=1791148251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=TJpJz5w2N9UDSRCdTb88Kp8MA4bj+RpjD4o0XhIDPQmO5IB6dA0Lc7QSmVBbHe69uW
         Txk89UXQovhVvLafBlhaMV8CatzvvzTSkZSVC4JL1Fw0xg2SrkqB2hPLvAX+8M0bADeZ
         F0iNsV3+9VabGwySAduVUYNwDUdN3CVCQr0EoA5IeYFtvZS6GmPGBq9/BF8FR+tvm8ny
         v7c7ql4r+CwXYXj9l5VOAlgHVBzUUwQfUV7C+Y8giy4S/a+AGN4a8cpMAegcw0qQkhAl
         KpxKBcwv4T0ynR5czPtcmSGZYRtC80T/wruukHCsQlvRyeFr9n6n6xdU7U0KPT8FayFI
         9IGg==
X-Gm-Message-State: AFq9FYJsSP7/8X49BqCiEj4lme8Y1Z6ZWW8us59RPOGqMQ5EgKZ0G7VJ
	6CmLf82TSKOZHQ2WTADzGWDSOJXDSXi2kTNRuhlIegyQGX8ETsnmiGwn0qsk8j4MkBEoofpNIaZ
	4xDJSz8Liux4vT7F9jERsRm71ppbvhO4=
X-Gm-Gg: AYBFou3cMdKtcUa+s5vkNC5Qy7YbjolRoNK2xGoQAYpF6uoUshsr0rJr92Etm6AnGNq
	OdvKkZW+Sur5nzIQ8qQaBCgeOLK9cTnvwXNbjKoMsPR8Y3CpaAtuCckKvbc9ojQZF/CeaJOjqS3
	W8GWQQKyEqdZt4+d6+C271aG9GDjb9nSF+bEIxIRS4NkYJslG1exyQhaiUc+7IM4J8ceKrUkhRP
	1XBAqPNRMu6xfY4flEU0Qjqa6lhlvdItkDX5Idgr5/S0kR4nrTc6d75aszpt32I00emeWhTMDFV
	lCJdDgp2XtSGVZ2GRJs6S/ePn+puDnxOyczZahvN7ihXVTuYj979R4gdqP0qBFBayICvIdp/1qI
	q/nOiK8mqDMwMpoaVTkK74l0Dds1gHtglP4sd+dmqRRz8aWLecoPt3rofSaE3XsbYk+WGCoQaYH
	0pv9P4DonLYv133d0rI4W4fc7J9C4hxcybDGwAIjTjeZmlYmJUkk7JM75tsPPfdwIrOg==
X-Received: by 2002:a05:6402:1e93:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6aac8ecf40cmr8425968a12.8.1790543451233; Sun, 27 Sep 2026
 14:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924233831.127617-1-rosenp@gmail.com> <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
In-Reply-To: <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 27 Sep 2026 14:10:40 -0700
X-Gm-Features: AclHuK9nXtwhKZKT8OEvWTXnJF3sAiZwWnAZputjHhM41eg1WXS42W-4ztR4xkU
Message-ID: <CAKxU2N8JeJi=cNkXKKdCS7HChvhGHziCTz3j-wm27Nr04RMD-g@mail.gmail.com>
Subject: Re: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/09/2026 01:38, Rosen Penev wrote:
> > bcma-hcd currently drives the USB power line by grabbing the
> > undocumented "vcc-gpio" property from the controller node and poking
> > it through gpiolib. Besides relying on a non-standard binding, this
> > cannot work on boards such as the NETGEAR R7000 and R8000 where one
> > chipcommon GPIO powers both the USB2 and USB3 cores: the two
> > controllers each request that GPIO exclusively, so the second one
> > fails with -EBUSY and its port stays dead.
> >
> > Instead, switch the driver to the standard regulator interface and
> > express the power rails as regulator-fixed nodes bound to the
> > chipcommon GPIOs. The regulator core reference-counts enable/disable
> > requests, letting both controllers share one GPIO without conflicts.
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.
I will make this change going forward.
>
> Almost all your patches for months now do everything to escape my filters=
.
That explains a lot.
>
> Best regards,
> Krzysztof
