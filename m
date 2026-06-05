Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655033F4DEA
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654606; cv=pass; b=NhqBcT3YzD928ngdmDUWeEBumL7i4iZG0455LrzhlrsX8tl68VNW4bccxcCzfKFZkXKJefh4LQc5mGuQRRplzPeFgErI9rL+s5JAjwEjkB3hAB1otfrGKHA5mxNDIE/kygAzrN8Ure3xYLlyk76DxDYZcD9zpawKqLHWWLAkrjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654606; c=relaxed/simple;
	bh=eW/4bH4BEu0lehjuJo0yaNWhzpX5RCdDYj1gVURcc8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUBHxkuSSZ5A85XZltf0B04fwGutCVQPvkilpcRR/v2P8DgscC7yemSdZ2vKzxZXoafwFMpRAU9I+/X1OyB2qSyDGNWgs18MPVMziwVVLF+cBQ0BqyRXPi79ib5P7bWyH6mjZ6HmnGEUItlzro1ASh0MYti4QNYCwRmdDT9eqRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=gJRtL3rh; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="gJRtL3rh"
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7A2303F8DD
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780654596;
	bh=OOXty8qEu0jGwfJBUKX0rnJ5Z42Xx4deAk+pDHGT8oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gJRtL3rhxuCYi+VQL5hxoPgG4cNgzqmbHTs46ZDa1+lLWQMTltID/ovITu89H5NrG
	 mfHZjBk3cCR79TlKbogyAUgA7kZk89m2ij1Fq0xjOy5aw7tyxXQo6Qwhougz6hHn7Q
	 B01+MCz2bSv5Y9nxSTNmuODo2U9kQfQ9DLkha3/e5tgup95Pj3SnmoyPmIiaFSGDbw
	 esj7dTFoxJNvpv9GbgA5EMBuckZECPEX03F8OR7+oBsHiu7Q72yNZvPgjKaRBHl2jJ
	 9fekAVlofNUK3VNjtZY+R58999I/oyDwXMEBfEiBDNPkhLFILd/flfCFn915ZqH52a
	 mbfgZtodm5lT5oeCOJKSVRaJJmTW2jIhJa9tFClpNIndMdEZhOUA3deiPZSuSdXgdz
	 IH/X+KomwppyKkLylEYak6m1CLXKPXjuxsmTBeuCV3hHhcyLz3bThm7pRu1Y10Fk3m
	 gyajc1Juww49LNa8T80CxjUbypxCchkW2IrwhWZ3AQg3YTuojuW58UTdhrGfLbz9Qk
	 cuOspBDzPM/v8kKtV/d/r1D2NDl8aPU1pfPhVwfxtGpnAIQH+CPEjEsgmMoJuyBrs2
	 qMllpmXw1W5wAJOhw7yW8Y6rtRMrIR2hDQ/wjdpYVrdWJsUWZN5BG7ySnyGQRghYvh
	 glDyTH8AE1saO2qilFi1tzu8=
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4866b462d5dso355053b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 03:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780654595; cv=none;
        d=google.com; s=arc-20240605;
        b=bUJGFm3EotWkmoU1CH8tIuygGFtRUkW/IYRRd3+ywQsfGwEXjHkJSTbfxtTTAU/9yf
         iG5/3KbPfHgsDG3oKCWnYAIPykVfJnqLET13i8aP4mFWJstwVuEfLlc1m7i5MNNCd+2E
         bD5DqLAueEC/latglMT6pU6UDh3cpQIJWQxwQfZEC5qaKdIjV0ptrsS9Q+ZoKhbxR/Cp
         t8tryqRlOx0bq5un9DhNUWujrjU/WCA34w4kDC4Or2oFhaAmEUyAtdrHzI89b1kU6og/
         fKzL6bXk3VBqDONlYFJfjbwQNhU2h6JJFaWvf3Eojc+8dlo8gPRTAo5WlnbVd/6sGMXs
         YAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=OOXty8qEu0jGwfJBUKX0rnJ5Z42Xx4deAk+pDHGT8oU=;
        fh=J9qyWp1urhWyi9NcaeiiagUQ7/sYSxhkFF2Pvbz7mX8=;
        b=LuzQpBLCB/aUvuIjVD7w8ccHGwYfzTnpxyM1ZfNklTFLAupRcTZmMg/eXAlE4MOlwx
         MnRKkzj1bOSMv2TTJ94rO+gDH5HUkslagKWqdivvmSn6zBLmHTrhEwh/Gfh35UUAf2qM
         SXUsqlkwXs5lfxH7YudPG7zSAh3k1lwpz1HZYBq5ErmTT+lwNSW1+56mauv8/vWe+3gF
         ka0wpc+pWM4Wghis8QZMlEjes/K6dlMly/g7e7rv+adD9r7jKdPXxQmQfLFXhdgJiCL5
         2sGdxQy18GnDYO3PQyXQJ5LkNEojU1jn1uWMUH7zcL3m4A36jxvZLqgC2hZZAUZR1+p2
         k9Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654595; x=1781259395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOXty8qEu0jGwfJBUKX0rnJ5Z42Xx4deAk+pDHGT8oU=;
        b=RABV1xhfIEgkTXyvtnX7VmkGHzmg7t4iJta68AAsAqy08ExZ5wK4GkOyijA2R7qq77
         MwnlHSpiSiAi4J5KGeu+tyb3MjnvOyd55GAzyb2Vd+SKhVD+eQcNYOoqbvJioCAB0KBK
         VaozuQ2uUWQffU1qD6Fh8Lt+6RgrSd5IIkM6AGZAm6duVh+mr3Y+v6SDQxQszZKHPoNi
         +s4fZqx73UHjf6Xun2uBht9AbdB/X6KIVJZryWE8lmuYzPGWgrP+lQnxfPzON+wqMJ2z
         Lq/p66ar2c1ZoJcrR3j2v6yt50TL/LN07GB8Yh2bmQ+EcljY2z/OEyFMUacDlmbGgWPQ
         nW/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Koq5u2fU5QCbfQZVwK5MAb2XI55qUawKjRQHxjIbeNbqzuIqBnGHGIOpBs9dSaYoHGoBzMMjlXCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1O1XVzTd7EG4SG9wohyfulAuSGxGCozI5vIkV1D7m+fkx+gCW
	E3TM7ZcEu+IzD9Hq25lPNHwLu+Zc2eJsjsmNKXRMz52Hgl8dClSUOPfV3BalXqbf56KZG67geJG
	3fd/WCyZkmLNjNiU6qskPl4pL6prrjkyCnzZy9Hes27YXkkql8B57hz+FEZPFqLBWbJxn5p9iAx
	k5E1Kehec+YRR0SQVZSVOwz0gHalTgwloZKWVogKF7C26rG+HgilXh
X-Gm-Gg: Acq92OEFdD6dSW+gLdp+/saxCGBnRayyDDRGb3k3ic2clvGbMZvUzNkX4oI/tKNMPGQ
	Q23OSCrYe+Qw4TubD1rhux7wZJmNG4cpyAqlu8GXEkov+G184eJGFZNc6101YzQx/pU6u6oK7U4
	RA9s5QYS+HT8OYe5pliV6yTcgrZWBdYsADIbWBWilxmTQX3kvVsy4U2LY/WUd2YHtnD6eMznFSN
	JJezUVZ6WU01QJaujoPvi1xEaf+rYzr6jJh+9QVFqNvpijpnY5LGH8AaiO10+si1COdCf/9DpGM
	dddSfV/zwaN3B7/Y0O6gFTEA59FqEXA9Fm3VL1SRlSLO
X-Received: by 2002:a05:6808:4f69:b0:486:5409:d9e0 with SMTP id 5614622812f47-4868dcb4877mr942540b6e.1.1780654595067;
        Fri, 05 Jun 2026 03:16:35 -0700 (PDT)
X-Received: by 2002:a05:6808:4f69:b0:486:5409:d9e0 with SMTP id
 5614622812f47-4868dcb4877mr942520b6e.1.1780654594670; Fri, 05 Jun 2026
 03:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com> <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com> <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
 <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
 <20260601070439.GO3102@black.igk.intel.com> <CAO4Mv0bnSd8Vm1raj5bnUqywkuKNjtM-W6zPr0dzGJDKwi0ZNQ@mail.gmail.com>
In-Reply-To: <CAO4Mv0bnSd8Vm1raj5bnUqywkuKNjtM-W6zPr0dzGJDKwi0ZNQ@mail.gmail.com>
From: An Wu <an.wu@canonical.com>
Date: Fri, 5 Jun 2026 18:16:23 +0800
X-Gm-Features: AVHnY4LTu_8kupABM7JqRUAMUXFoRWeB1aU-KNSHXqdLo7rqw6XgXXaQMbQGITw
Message-ID: <CAO4Mv0YdUm_36fJWrvqtGDp6nsQHJFteh_TKFjM31Exygj2-4w@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika
    After further consideration, we've decided to drop this patch and
probably to note it as limitation. Really appreciate your patience and
sorry for the noise.

BR
    An

On Mon, Jun 1, 2026 at 4:18=E2=80=AFPM An Wu <an.wu@canonical.com> wrote:
>
> Hi Mika
>     We tried putting graphic modules into initramfs and the size
> increased from 56 MB to over 200 MB. We will discuss with the team the
> possibility of fixing this in userspace and follow up once we have a
> clearer picture.
> Really appreciate your time and patience.
>
> BR
>     An
>
> On Mon, Jun 1, 2026 at 3:04=E2=80=AFPM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Mon, Jun 01, 2026 at 02:50:21PM +0800, An Wu wrote:
> > > Hi Mika
> > >
> > > Another approach I considered is using register_module_notifier() to
> > > detect when a display driver module is loaded, then retrigger the DP
> > > tunnel setup. However, since struct module does not carry any device
> > > class or subsystem metadata, there is no generic way to identify
> > > whether a loaded module is a display driver. We would need to maintai=
n
> > > a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
> > > which is fragile and not scalable.
> >
> > Indeed. Perhaps not to try to solve this in the kernel and instead do t=
his
> > in userspace?
> >
> > Have you actually measured how much initramfs size "increases" if you d=
o
> > include the relevant graphics drivers and their dependencies?
