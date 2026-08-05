Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558703DDDC4
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 06:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912517; cv=pass; b=AaB8U9WUX34bhu4DGEyeLx/deIdC2h1+oHPK0bBK5GB4cI4oEo1PJ1gd9BEPLs9t5UA4Kis6OIyxW2rcJ70Hz/WEURKW1Bcqp0AJsbvsfZG/yzfSLFw3KyT7G9mShWnwxUlEtbuMyjjCpO0GYuxMGtH3t7kLPrHVLtJdYYA88+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912517; c=relaxed/simple;
	bh=zX9W4WlSLffcK18o88Do8oN5udTcUrmnH3VmfZ2omYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccPVYh05eFM1tvXGcgRzlJ9+A6ZV+5Zpo8mgX6k5il04qqMclXszdDI4r/EMTSk2hqr1PR1AyjMtdorQOP5dgFgavkVwMPH1YjSnF5xeEXpNO9NHaI+chDC/YHh5q4YpH7MZDsM3dJN48IagVaFQ9ZWvMAJ4UFsTgyJcj+JO/Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8+f4yQY; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8+f4yQY"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ee4399c3abso507040a34.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 23:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785912512; cv=none;
        d=google.com; s=arc-20260327;
        b=lQT2fGWGYhCLETVWXkcqKEPKwpAnV5Nd3TA0jgOcF7fFXaXPMV2ohZTrcE+IXZ4rfL
         tlniSt8C8cfyAyy6oNeTbfuJ+ht+EDIhbwkdZaI8Vk/F1so9+3fGLB2JjTCw9qe+9Xc3
         Ii6R3EjRMMObzZXdmWuK6lYEm+IWhYvu1TTLuBxpYf+iXWrek2x59+7NUdTN+XY8elZ4
         E5dovdrTxBZ2yVHdzji+IkNxsCeL7RZLN+I/6wlnzv+Bt7uXgdEQjNCiATMUg3ZntRbe
         71WvIZVgbnblBEmjSrxg5yOnoIPZONezQSb7D3n4HttHj2CJ+XEHXKpxsP6bBXCWWpaW
         xekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Xv6Lh9Vxa7VZjoa3LMQUcV3QtVtWuQt/nGnygeIYR4=;
        fh=3qsyWHk8Z16YcchumrSVXc8jwsrFqrMV4GVeBZvSy9s=;
        b=PPuYJ67/44MWLl+y5Qr1OW+8gNLFi/Er9fKglGjcaNy4mdLLxeGNcbsxCNrbgpmpI1
         NOj2qoUpMd9/5gkrkE4WwNNXx9YwJYma/xLLZUGLZatpUOGSslU+Eu0gRLQ/4F5TqL/M
         f6iTMhovob/yBCMr22YOSrGNmeEACb7oc3v0X+jIVczrWs6UviZ/ptaAT/Y0Yb9wASMH
         p/qzCgVqkkdlMDKUfCzykqyx4dC6TGTYO9S06JDs8fBGfMfl8c83tJDkdoaMWuPhyLM2
         8c8mbU6N3yl+09OK5bOF5n+mM4ggBOasExGF8qXOsrLIxgxN6OV3qU4mhUEZbRl2nbPA
         cKjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912512; x=1786517312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Xv6Lh9Vxa7VZjoa3LMQUcV3QtVtWuQt/nGnygeIYR4=;
        b=q8+f4yQYNOVGCOuJYnVDIQaH/7HQZACPtQm+liespzmBCm+MDCxyGgbv49EcsdCoNu
         OzsiDfxTw/fub6y3Unn6bPzysaKnEdvLmrae9J/an1wsAJVYfrrCowJ41R7fHrmh979h
         NE7057qCQZnzkzUe8A9CmDa8NlZ2ngsrJGw9AGhmQbX3dNeYKbh6GEXUYZWAajKGqM8F
         7qVF1XGaFMsG/HhjmRG5X0H3tVyV82PJ32Vxt/MoqaHGTpScw8CfQJxJV4J9Sqde672W
         hsI5yu6U1z6vGiC94RpN7E+Qauu68zFCaGinfLGbFYzxm08cmZg9CdgsB8C7BJZtaA77
         6S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912512; x=1786517312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xv6Lh9Vxa7VZjoa3LMQUcV3QtVtWuQt/nGnygeIYR4=;
        b=r4Blprz3JDEMp4QWS5SvrzWiqvyZiA1bCJxS/oPU8AUcqCA6AIcXCWIP5QBI075exi
         RZzEi1BHqYh9AaljZryqivip5ZXAgnQHva9gYmvzSxqnq+NkaSp4+nZxCEsWgQqgBZxr
         NWXmXy5qck8v+IhPxYqIdAzeFHlytJfdMr857PFIhy6M4bJ2lR9N1RPgAK+N4nTwkD7m
         aLsG/uzCf2Q6UAJDteInEpDRksiXYq/3q0bUJq81w5P3nbBhdCXz0n109qN2D5g5RrhE
         p/A23OZ0l1V45nIOwCuDS9jI7y55U29Cs+lVqgFyNPz396AKM3ocARJ5hI6l61lYJpAc
         +JQg==
X-Forwarded-Encrypted: i=1; AHgh+RqmgJit2HDrt8EXBIeAfTEvUtTME7vf0CRKGM/K2g2+GY9rlIgD1cJxiQnu/cdRqrBIcdDJID7h3GE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxd/6VfB3+/ca9X0JRyD6VZbiI+QogDqsJ7i6Nyd18OxbgFNi
	bB/1k29Z9yUnyC54jN4VbaBrKqlTtITvm6d3uNhZWfR/qvvcHobq1uW7SO5O09ZvMogI7jx+uVX
	MfZRYq5qtSHOlDbRWnA711Zi3LRl6SmI=
X-Gm-Gg: AR+sD10kFkcIwf5HgErTGZ79cqajawfQ6FGBNnkXuQtN3rPIZiTHumrkGDOYZ/nxrOR
	AwHlJcD9OVewcdTaIBzW/gVZreabNJQ4XBucGaVZUV55Ugd4tU6/+bxprZD4qWysvLuVu1Zg51a
	17kaA38ftaqmoTN1I+dxLh2ZZeRY5rlLWsLWs4QrLJtxml3lEhS+JHvUgNT8+0pDEJoQRrQ+q92
	xm5r0TlYbR0l2tfYFHB1lIpkOXZ1byIGvMh5PyVqzVMvmU+YXmGiSmj17ZLTWqvBxtYaOy8JUjZ
	1d3RQmYdyFOL5ZoklmtswJ1kaZFNb5fRgkLsfY2x4i5dsfrhhAtxwPc7JaCdIA+Q96/7+V6EfQj
	+aA==
X-Received: by 2002:a05:6820:3095:b0:6ac:a5a3:460f with SMTP id
 006d021491bc7-6ae96f1111dmr2536229eaf.25.1785912512358; Tue, 04 Aug 2026
 23:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720150207.1963786-1-charles.daoust@gmail.com> <20260805075429.08416607.michal.pecio@gmail.com>
In-Reply-To: <20260805075429.08416607.michal.pecio@gmail.com>
From: "Charles D'Aoust" <charles.daoust@gmail.com>
Date: Wed, 5 Aug 2026 02:48:21 -0400
X-Gm-Features: AUfX_myCbyWaGmHoIJb8Tebqi3WNBU8TWiYaZdPYl_JynhHI19QT4zP5Jqfjl3Y
Message-ID: <CAAhWKQRBrK0Bu_wEPV6chU=p6Y=kXix9H2Ys2k=M+PxbAL3Wqg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: add USB_QUIRK_CONFIG_DESC_READ_255 for Razer
 BlackShark V3 Pro
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was indeed AI assisted. It's hard to tell if this is sloppy QA,
obviously, but initially I thought it was an actual lockdown in the
firmware to prevent non-Razer software from accessing the device.
Turns out you're probably right.
---
Charles D=E2=80=99Aoust

On Wed, Aug 5, 2026 at 1:54=E2=80=AFAM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Mon, 20 Jul 2026 11:01:26 -0400, Charles Daoust wrote:
> > From: Charles D'Aoust <charles.daoust@gmail.com>
> >
> > The Razer BlackShark V3 Pro wireless headset dongle (1532:0577)
> > fingerprints its host during the first enumeration after power-on: if
> > the first GET_DESCRIPTOR(CONFIGURATION) request asks for 255 bytes, as
> > Windows does, the dongle enables its vendor HID command channel; if it
> > sees the 9-byte header-only read that Linux issues, it disables that
> > channel for the rest of the power session.  Audio still works in that
> > state, but battery reporting and all vendor commands are silently
> > ignored, and nothing short of removing power recovers the device:
> > resets, re-enumerations and byte-exact replays of complete Windows
> > control sessions were all verified not to help.
> >
> > Both read lengths are spec-compliant (the device truncates the reply
> > to wLength); the firmware was evidently only validated against the
> > larger request.
>
> Hmm, so is it fingerprinting of the host or sloppy QA? ;)
> Out of curiosity, was this patch AI-generated?
>
> >  The kernel already accommodates this class of
> > firmware assumption during enumeration: hub_port_init() reads the
> > device descriptor with a 64-byte request because that is what Windows
> > does and what many devices expect.
> >
> > Add USB_QUIRK_CONFIG_DESC_READ_255, which makes usb_get_configuration()
> > request 255 bytes for the initial configuration descriptor read rather
> > than USB_DT_CONFIG_SIZE, apply it to 1532:0577, and expose it as
> > runtime quirk letter 'r'.  Devices without the quirk are unaffected.
> >
> > The trigger was isolated by single-variable bisection on otherwise
> > unmodified kernels: with only the widened initial read, the dongle's
> > vendor channel comes up enabled on a cold plug with no interface
> > drivers bound (bare enumeration only); without it, it never does.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Charles D'Aoust <charles.daoust@gmail.com>
>
> But anyway, FYI an equivalent quirk is now sitting in Greg KH's queue
> of fixes for (presumably) the 7.2 release.
>
> I suspect that Greg would accept one more patch to enable the quirk
> by default on your device ID.
>
> Regards,
> Michal
