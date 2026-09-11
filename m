Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8814AEBEE
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150287; cv=none; b=P7FQfu0FQMpaHwzy0+qAVvRV9V4K3RyL8s1UZ5g2AtYkQyuVAEuYbFUMJic0T90rVOq456vSTiOesTyJsdhieWLs+RJroK9KmfhvGNjuixfYffsh1uE6GV3egOK08zounT4f6AOC9LE3q4DDkBvlBdbrRAd6vqQUzh/wVUkbdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150287; c=relaxed/simple;
	bh=HCQbWa7LkKEX50QT3DwF/c7T/iKLPW1K21LgtlRNWgc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6JTdT2JW/OTjAB7wNlitCOQzD6KTIWnF5dYt+L7QgOhZAx2GDUW4xAvOb+p1FJWfZqoF6qByTXJ+l2Iz0xP+kbM1vFWY0X+g0FIldHq36M86kuvVCstPYZsRPPHqCH+A8mNsuGrCPCaSpjP3LgYuPZISYgLLja3hfQD68iQEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt9SXcB9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt9SXcB9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so1475215e9.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150277; x=1789755077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iFhVzmJnHThQ931GRzwOosH5WkLdTobwxrbVY8PCx4=;
        b=Lt9SXcB9iYPCtFYeg07KKMQR+9/oRFQx9ogHUpekAL0nOWo7W38FJq/xgLqEju6dSc
         PbJns6rsmbTsq+wUdA/p1UhgN3Klg87jLWlYxT8PhqIChgol7v/6Y6+ke+FxupoBe7IZ
         7xfncVhWdYUW4GqRK+9YhsxJc3+mWOZSMHLRTNYnH1Wp80t7/k/eBtroj/d2IXZGxiCZ
         c9Ajt5IMnrunDApTPuwOA1HcVIhjlTNUftO4n0Hg8ALcETsxecdskKi1VcGd3SGlmJC5
         hKHO7CbCaG+9qNOfRb3v4/PjXg6gtfZdKxEfrIVJh0de4Gb4sLTDznnae6OrIT4yn756
         kPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150277; x=1789755077;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iFhVzmJnHThQ931GRzwOosH5WkLdTobwxrbVY8PCx4=;
        b=qRpPk4hQotwy1pv4xFdDVP54ceOJ4bM+Ks0sAFcevgpJ9hgZKmEbnV2vudXmLDgyJO
         ROkff2vwV/BmluOFdly8+13rTueajbscu4BRe0/KImo7fXExpUH1/n2/zOeRn1uEEoDU
         QzHCGi1dUthx46xc49VsKaQ/wy8ULK/jyua5ifaFbtEaynOy0wz/gypw6C1ha4o0wSVM
         w8cUX+PSAKwuvvBINn4ht6QVlL53OP3BBd7tfBHo+x0pWM+Rp3jUEvRnN558kw3OjfgK
         h2p8MUeB1JyRJS8EF28uyOVkUD846v0Sner3YM2UHD0Z3IraUPRv0lWet4tHR6Q1Ys5w
         p50Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrj9+dFbWTWgji/MoeHp7Arrsfh8eARShC7kGT09d6wMhftl4KWjV95KWcF0/YculR6ZI75/omvvo=@vger.kernel.org
X-Gm-Message-State: AFuF++kzOokb+ccP+6hIBn/VWbnODlArstxR5L41qGq+XzwB3IWSbfvq
	qx2CQMH52LzUVhJ0i9f60h2XS2nLKpF7Hc+J9vt+AGDuzwiXdbGCpfFdmk6wNQ==
X-Gm-Gg: AYBFou2OS59CcbKTf/pQ4c8+DCZUgSzOJmLd/gyG37OryekchZzXYc9jgUMCqjx+3A8
	UBnPEqHNKnXEDN1g3VTPIU8AQcWRirOpHH3Z+q+NcEe7BHUsM5SSr4X8iDOeUdE+I11+s44mpKl
	SL4NeejCX4vHWxyeYZk68fFAdZ2xirs+QLdDU+CxEWEK1nlCwDqvKCqUmVE7n4YuK6mcW947C52
	IP8omzQGQ5ByGRcTprsI4UpQ/aTj6STis5FcsnDkEDd9mFzCwMVvLJnsd8HdFV1cXJBcVVGBldc
	XUPCW2cwuF3USdBml7yAnctTrP/c5gCmxKdiQc0aOzLhDQgb4761A7abon8msQcAoEeMspJy0cQ
	NSpQiAk8vhJy3Hx3Ey7uEhDZJlRtp/4vHTKd4C8oMNH6S0WqP2dQ9hHq7HV2SaZqQaWiy9JWJ5H
	BN5uVzeYGCRjZe4p3qy+vm9Uj4iTTzDom29Q8F34mWMdtxlY7NaUpigZl90yWyBVP6MhkFgGJWM
	ouTyteUdA==
X-Received: by 2002:a05:600c:3b02:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49e61649b8dmr68492305e9.0.1789150276731;
        Fri, 11 Sep 2026 11:11:16 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm134624405e9.14.2026.09.11.11.11.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 11:11:16 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:11:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined
 state
Message-ID: <20260911201113.42cce0a6.michal.pecio@gmail.com>
In-Reply-To: <CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
	<20260909125842.528340-3-festevam@gmail.com>
	<20260909164339.7252469b.michal.pecio@gmail.com>
	<CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sep 2026 10:58:27 -0300, Fabio Estevam wrote:
> Hi Michal,
>=20
> On Wed, Sep 9, 2026 at 11:43=E2=80=AFAM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> >
> > On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote: =20
> > > Currently, TUSB73X0_PWRON_POLARITY is set when the
> > > "ti,pwron-active-high" is present.
> > >
> > > However, when "ti,pwron-active-high" is absent, its status could
> > > have been set previously by a bootloader or by a previous running
> > > kernel. =20
> >
> > or by EEPROM.
> >
> > Do they bother to put the chip in a wrong, non-default state at
> > boot? =20
>=20
> I was working on a hardware bring-up with the TUSB7320, and I never
> saw it happen.

That could practically only happen due to a bug. Seems more likely
that EEPROM or boot FW may set the bit because it's required by the
board and then the kernel could clear it for lack of knowledge.

If there is ever a need to support clearing the bit, it would better
be done by checking if the DT property is specified at all, and only
then tweaking the bit accordingly. Otherwise, leave it alone.

Regards,
Michal
