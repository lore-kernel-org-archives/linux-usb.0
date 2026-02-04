Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A51D61B7
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770176805; cv=pass; b=UOCM0emzXXOI0QTFmHJQvG0iqQoYzL0HSjD0KXWW3wXGN1vpC1Ay27XEsyKz0rWM6gGiGviwzFLG7/alqWgR66UusfLDZ3qJbSECxJcVZSKniAASMwdLFy7EmDhO5/enMR4O2oJ6tUNLWMqMOInXKAU1q7GuPrWZeq9GTNSk70U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770176805; c=relaxed/simple;
	bh=+zZ69uJdXjUv4UzmPsfk6198FDhvAKQzPdCVmWWhBg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIVvTWbuRJ0yJtmoKwjaVStqKiW37X56BJ89m3rmyu+m7z3G8TjdxZ0CLjQNkOi4VOa7tCdmg/nmdRqlsqjXVEl+KJApiO7WtQ7D3FMzxh+VHY7xMB7GMyNH9VLwfKQhgK7HlKXEI4zQksL9cgsac97qZ99pQc098te2A4AWQjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxwnGbCt; arc=pass smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxwnGbCt"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c7146b0854so707405485a.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 19:46:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770176803; cv=none;
        d=google.com; s=arc-20240605;
        b=KVZYW/7YS31WgV3iE81aeYDR8MmfrSwBSltpMeCh10i42V/VTg1c0CxXKYYyjinSZr
         uCrDNLVBAgwzsoUP7++rUtFpITV6zkZkmVQ0mysUwGSgQVjAPjwF57kjTUKAMax9DLfD
         Gb9Ypx5lcmpFFYpZ3L6COXgTV8ujomTn83TqqzxswMm1P291YyTUQGIexqNUk9Tzf2l6
         97zgDNLUKnZL/3O8uxySBmW/dwyrR12Zdiu6I1nw2yMvOK+oxVtbjc6CxUmRYfxnbm4e
         RuoY43UPSA8+JsW0KG196d+yglPGOXpZ1x/a3oG2qqIY4E5pBsM9acbSwc+EpV0kY0cp
         bHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zZ69uJdXjUv4UzmPsfk6198FDhvAKQzPdCVmWWhBg4=;
        fh=65PHb0nD7dl9Z6MWAtojt2ypKBNvvI85mDLKSNgEhFo=;
        b=h6/A7bQmJHYvd4LN4oJQoZbd+pUiMSapbVSbVn4hYCB80jX/E0L2lW5M7C56qtLenY
         M3out0ikUSW1sipnNCGgQAxkZhY+IHEkGCw6D4jTXq8Hd8g2AQBA/9XpxPljJtsk6Hqj
         SHZZawPI1meCjNnPeJp1qnQWfohFll7YKaCdkz21aoY34xjnw7KqZqVdEYDPnTPBj3mP
         jVFwpcIi7/J+tUPwtxgM7+r7GsIvubyKkoOZ7cs7ghEXlmIq8E+HBghVZmlhVZRQsxEC
         /FAqDIQ6InmoYMZSDbHC8ICpZ27UhTd+FaZN+dH9j/W948eNfb6TzWhyGtHf66md/i7Z
         LMwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770176803; x=1770781603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zZ69uJdXjUv4UzmPsfk6198FDhvAKQzPdCVmWWhBg4=;
        b=ZxwnGbCtvsGKLAOXYinkyIhDTj7+3xhPmWY5LYOdl7qEK6TWfG8YA7xa/D4gh/KZZB
         62mL/mseYDF2WMXS/jCfu70U9Qro4hc8TnEThmF6kbcclJT8gtdbdoEiZEVPnCct3Ojc
         Lzy4MyhEbHUc2CNFTMyXCAUe2W2QLb1C1j0x/r1lPnC09IkUxfYr1PKo85XSCHrPZHfP
         f1BVpeW8nPGjyPe/EtGj3yO/QESg9M0jEIr8PCqf1T+hvtO1ByYF2JT2xLYJnod9T3dD
         WXiv/qegpinYeNO7pYfjoewjFniBtYOxyP7CVeEdBDhrifmWAzJBQ3nVLZmNtCH6Ofnn
         ksSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770176803; x=1770781603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zZ69uJdXjUv4UzmPsfk6198FDhvAKQzPdCVmWWhBg4=;
        b=PlJepdo/SXxfCB6nElX7LIDEVzj6Bk3xZ0JHN0X4mn7m7TG7c51He2nSvieddlQEZ6
         1Z/ge0gErUlWm+XrQd9TcHyx+8Z6Dlfgz9lr11vd2MGZXrIhNZmImR5ye4o4+3NzbaO9
         FCZc93RbI1ZPENmiQNBi47irOMC6WJaqEmlYx01HBTRVNpZvGHfBsErHEuzkc9pempfz
         2tQ1KWaWXkrwWkUUD+q3QmVwBybyt4+mjWFhbhe2e72PFjNBxtxAnswN2Hkvt72Yz7yS
         h3hZhjwUfMMfE0ex7nWIREMUkoGkXPWAxAU+5UgDw/I7H4qrYnNOLOZsvkVDdFcg+QEL
         pFVA==
X-Gm-Message-State: AOJu0YxKGrXKIwMnHeocWFCyjWs7zyhr71f/2fmkx8LdJXDnVGF9Q75C
	My6WGzDqjq2GVnsvEIqI2PaOXRO4i3owRsst7xuXiJ2gylfx32bAdcba630iE+5Cw692sH3w0SD
	J2PpmCoARzw+lujaicBGmTkhKorw0rO/oeZj7
X-Gm-Gg: AZuq6aIVQhmGfPb+3XfL/1atRqlzrssi8jP6rkp8izlNOiq1/5ci1Mjnhkc6TsroVNs
	H8+Y/sJOhT2aci6eYhrGGx0UvFZnWyCarSD1byPPxcokgPhVkmJr9OfFM8PcmAy5yXfxOz7db3u
	qiSsH78T3SDjpAnoo8OMwghinemA9z5wr0f4aVLFvlT/PsvpN5C205UKGNbGQxbir+Wkrri9Odr
	7OP/BLJvjz7d4Xm/06K1GqdA9aLJLRFXrp6UpU792zIgKg2sGut9TA5SB4S/UUhBO9cIYecHnqy
	2KYVRc+A55z7ND87Q4J382566L4yroCPb5nhDvbMhUkDyGmTDnwfqnwz
X-Received: by 2002:a05:620a:2a07:b0:8c7:fdc:e871 with SMTP id
 af79cd13be357-8ca2f861783mr230977685a.34.1770176802874; Tue, 03 Feb 2026
 19:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203013924.28582-1-enelsonmoore@gmail.com>
 <20260203194317.07432b29@kernel.org> <20260203194447.0ce4ffd7@kernel.org>
In-Reply-To: <20260203194447.0ce4ffd7@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 3 Feb 2026 19:46:32 -0800
X-Gm-Features: AZwV_QjJJWZn3YATkwJHIc0Jls6kF3BwllQz6vEvZ-iE5Q2T_u_GTfWm_amU-cY
Message-ID: <CADkSEUgoOyeUqGHXqimczdo1M0S6C20GOpKH5OuEeaRhFnSTDA@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: usb: sr9700: remove code to drive
 nonexistent multicast filter
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Eric Biggers <ebiggers@google.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 7:44=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 3 Feb 2026 19:43:17 -0800 Jakub Kicinski wrote:
> > Not sure these annotation on the get are useful
>
> * annotations on the review tags
>
> synapses misfiring over here.

I will start moving them to the changelog in the future.
Do you want me to send a new version with them removed, or are you
going to do that when you add your tag? Either is fine with me.

Ethan
