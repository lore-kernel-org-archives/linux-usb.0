Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794694353;
	b=xR+9YtUhI/N1QnNh2KJcRNOFQ1owKD0Yex0YVBb5Gpcht64NzUAvCDL/hZX3U9+6n1QU
	 jLRj/vRkEu4mIYWQxHD0w4x1KYWdgbTwqau9aVVzXreKFd/W2OJxhRXUcrG6glrr8EO5V
	 dfyQoH0XmiPFVFDIOjaixyc7IgrCPSiujq2Q0yq6WvoA4SW6OPvTaOHt4QVvaOAkmh2fj
	 j3CR1o6NkIUqmFucN6/kYzzjt0M0IPehwRbYqiTnRn06KHR7HQYSIDcBlZ0uAHtJ7ytjG
	 Zig86fcAXgfV+rR7lwXxrUgNOkOHkeEU27ttklcMyBZnxLWMHnbhsOJwXupRQNjoO2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
	b=vLDA8c2PCY/VdQZ9Fnr1M7Y4xkoNJAfcfXjfA7oXQtzDW2sU4fcXB1emnljHSTKLGhWD
	 QwaaRHUWvn+ktVH5gWQO70rDX+D8t/t89uxMRo7vVFVvEfzoe7yw+tsR/tSy0VGUtlLDS
	 1TFIPNZ+nflhiFiLUEIFvupkITRxOSTkGzuMkthqj0umkN6L4Me7G4nzllfOD51L9tR4X
	 B4LkHc1Uvg3gJvm9BrCF9VEc9lb00IUI+CLWusKicyiyw/dTrAYeGId5UAogdX2l6iITS
	 hHiJvOFpNAeuXI/SmWUhAFMsEqt9I1nZZ7eIAfQuklE5++s0Us8lCklC4YxwrZQy9PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyX1qftW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF6606A32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 22:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EF6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyX1qftW
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c6ce60697so52923486d6.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 14:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794694351; cv=none;
        d=google.com; s=arc-20260327;
        b=SZSqOKAEE9bSOhDtMI1rUBysApjJIQX7YQv37PEgG2+d4gEjVL0t9gHJJzmH1R9TQD
         9dyeDUUU3rqsiVH2pZ2UWVQCCHAnXncFVqOHzoyh6W8/VZ33A77JqF/p/pJ0I2RRr1XK
         jQnxY2nIm+RcAzlAHhyD3OYKLZ+sEl1BfVUgae3PRBFF0EgkMKFvC0hN5oFziygr9HPx
         /usGe3rLFsoq1sOMyiQ+652b7KBE2qV2zn8GM/p6HQxSuPsMJC7BGJFjA8XbT37BTWG1
         /Lp2RazGRpw87vvTJnnr+4ZMn6SbquXyTY6lZAiGw/ZiAQrvjz5U6/eJ5MxJzHWBygJL
         +EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        fh=v9+0OTEPL6QB+PzHtkOGrjo8ymPNyqDlfEfsvzOKXH4=;
        b=qp6H70cqz97Oyf++XGHcEkpxWfpJ0wldY1sJgGKA8k3wTF2GMgBJlYbP64NnGaDciU
         jTypX3NYwhcmkv1OQXyy5dJfJdi3ojgK+yKGbA/tk5D9pySh+D1r2XWFU61uwPTQ5qJb
         hOFGlypuUwnb0Ci6fAZQ+8X0sSmZ4ioXswI3tF+VNVzbRoChFDT4aXN/MhPlGWQLqjo1
         wIM4rdUJT/H1l84gGbUnqpN/ja98ip0vBYlAWdYfmd1KyuFxKdZ7toONX2FFXdEQfxAX
         62c7RwY+yXrx3lG4iHoqM0eeL5dRWW4lkxhqUCAkXgYd0Wo013ZK5wj2twpWNN7S/+M4
         +noA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694351; x=1795299151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        b=cyX1qftWtwvD+qFdY3iMolNryWltoehzUt9OxCv4PmJSBdrCWDMGnhyf2/7Ir9dikC
         Pc1cMqeWjyjiS1PTtOLjbFu6pKwF6xJa2cmB0ZaJgNpOSHgtIczvFE7OX6+qmIUrpQ28
         5lzdL/Fkq1Se20YLQ+z4Jei4/H9aAq6gPiYbBuyAyn/8yNcyeS63v0iOvkavQukTYVpx
         Lzd869DJ/mYahcxW6wy9ltwa6Z/R9RzG1pfrX41ZI9BCCXVGNdv8PFqr3vP7aFjyVi89
         MsZt3ySSs0qBki0X+QFXXQh17SF79xVBBJbpP3x/1dmZ9UbpFSwPku3UsezS1NXMAjbY
         oI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694351; x=1795299151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        b=et19EI0J2fQ8yZfFlXtTYSSmaYr29V1wxH0JtGHfDBTL2LuZpHTCs7vZxFR5x9Nusg
         iFCPeafXJ2/IG3Q4FyrzitqEaskxgJBa7g1zHp6kR50X8XVc0/APBCojmL63Z3JQ5rGR
         hs5m+78SawM4GMGagl7rfRMf7rd6aViTZoBble/RO2A1KOAFnvNdjEJT6UeyOJfSsOoP
         0stSRlfWBVhO4ITz1v/jUtsl8IRigj40nKVaUGgjdGivUxm9xtNALkrHaAds9jXaPskW
         CuQezH0D/A1wz3phgkeT3eSwgk6WwrnHC91Fdtnc1Y9q37023Fz00QCPSGfM1kZY5qMZ
         1lYA==
X-Forwarded-Encrypted: i=1; AL+hErEtnzrPkkHD+Rm+4IKGfhwYKjn9r/aMGpg3fuVgiar2FiVD/DHkUaaPMAeL3OL6+qA++5bmu5jPWK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+t7rEEOnsqXc/p7x1iEQNXXKxwCJ2NYVpd95qPAeFjhUDzqMV
	f31bZBGy/yhkzEQn5IRDHUv7jHhRHMjsiVw90fnLYvB+t3oh99qtYnNG4g2jVXSMBs2/n475ajA
	mxHqA01BkO+ifIWzb9fXjCH1HEuR9XrWLlccaLnIfKw==
X-Gm-Gg: AYBFou2tsEe+SnzZM6sonGOvmrN5Cvl/TYkaj+g6V1Qjxmdg7FjX1vLBlQGvrpj8hcE
	qaNrTA2HFbydbwjbbJodpXlJvVuRe6htgF/XRBhZX14DzShnL1GY7uKPriaXmm3j1ooG4iHtxg0
	SxNv7OYFWI73AHHipYkzbJvuaXrLSYCr7/YYNim2IgVC200tZSOURQIfhSLzkFmM8LJJ3QW7dW+
	I7QMiwfI4vZ/UOLDKGI0cWCtthT14UTsYvqJCiH++e10GzQtI/pSzS8oYYmlRJpwr1XC46MIa0p
	KrFVQHmqy929VamVufWTw8QnnZA4Qzx2dapgImZRLFvKEynOF9A3ZV+HmKLT6KkMng6En1wAVaq
	c0gJuN36ovkfgNbpil3RsBXIn3ZYKhf43YFL/
X-Received: by 2002:ad4:4eaf:0:b0:91f:2698:2c3 with SMTP id
 6a1803df08f44-91f269803b2mr91524196d6.26.1794694351610; Sat, 14 Nov 2026
 14:12:31 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-2-artem122novak@gmail.com> <2a97f1a9-4d44-4837-9c40-57da3db9b73a@lunn.ch>
In-Reply-To: <2a97f1a9-4d44-4837-9c40-57da3db9b73a@lunn.ch>
From: Artem Novak <artem122novak@gmail.com>
Date: Sat, 14 Nov 2026 16:12:19 -0600
X-Gm-Features: AclHuK_aS08-lQYnPQiyXnO6fkaMqlI5ELaiOLXfFq43C5hcClmdK3mEhy3bEdk
Message-ID: <CAPufuhb4XrwiQoh6O6QP34gaujWm_wMBFvjxt+DGdO3YnqveCA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Yes, I did observe a failed PHY reset on hardware,
but unfortunately I didn't capture logs or document the failure at the time=
.

I'll move the patch to net-next and remove the Fixes tag.

Thanks,
Artem

On Sat, Nov 14, 2026 at 4:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 13, 2026 at 11:09:53PM -0600, Artem Novak wrote:
> > The MDIO bus reset callback returns success even when reading or
> > writing the PHY reset control register fails.
> >
> > Return the register access error so callers can detect a failed
> > PHY reset.
> >
> > Fixes: 809ff97a677f ("net: usb: smsc95xx: fix external PHY reset")
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
>
> Have you ever seen it fail?
>
> net-next and no fixes tag please.
>
>          Andrew
