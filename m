Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794640702;
	b=A6Ri26loV9B1yZYgQ8hsRKQBD6hxbeeaPecduy7Qs+dR1TouMvcbxPXRt7j3Mo4G1tCd
	 2rspjdbZMo+3XCtWJbwzKBo2avH+h8NYWAkK28yCzI8eAO9kj0B38+sZq3presT9FMFMm
	 5HXZjVdP3TQJo4qFKYLzUY1YKWGQ3rrBjxLmZIfsI4O59ZDqwxU25EMdJoKDrXhWK1ULF
	 wllm5+BYGZJxkf5LHY+JC1hmREyR4vjs/cS4oezTPHFRQwoa7hFsj8rp4GmAMoMfN1nno
	 bEfs6urcX2dq8a7gFvfbUdeLst8TtjPxlC4td1LOxO3LEKytQNI7QrRDjBZiO5gOTwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
	b=18Cwx+tG3XEi18wVVkq4ACnvrdmkq+6/ZyiExgeQrETtnjkUv6UgRRKeJJZjP0N1hpPT
	 NbF+VRtRWJuTiyhwLUjLXQXZ8kMNePXhrsplXWzmdojDD9xNaRw1+8Bksan8GxpE+H3AF
	 XfFIrbnEebJmU1cpfYmNNVOQPMA2uoQqbXsrKKiqHjD30ro45wPN0w/l4hPb6VCftarn3
	 tnCtDAr6JevlsCDqVHdSh73AeFNjL3ozjsbEDO7/m4MooFc0kulL70jYhqOuT1uWT/cN0
	 K/Ujo5ewG/P7qSWQx3FxfNhuJbX+dDUOEYuPvXWesr3LClm/y9QzD0SiFeQE5F81K9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D39606A331
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D39606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2048642a91.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 23:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794640701; cv=none;
        d=google.com; s=arc-20260327;
        b=ch82bi3nuXb16rYtfob3bQAltZa3xXc2sQ+e1PeAHVsd2i3fXNJXg2hzplxcyFVEnL
         rg6y6BZXx08OxdgnJnx5Sv/Ev8cVcLxTijgATAft8j1z9MzkvBFtg5p+/OLQR3qhlQ6Z
         siggSiUh1/Z849ggTopytf+DHbvlEXXF0NHRif0//9LEhaWuxN4Wq1Oq2vwESch0JA5c
         E9j648uSGFG24iCq+iMJlYyOQTJGRUTAp+qNATBhSfNT3tU3R1pR/f7wCT1udm9PNQow
         vvW4nGYSx3ID1WhOQcsMj5RujxoJOSgQlIBYvjG5fqbQvaQ2bX4pxUSPfvgHD9k6UWZ9
         OxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        fh=MB7A1+td7XDo9I5+at3UB4YahT9xME8AbnL/WeBONWU=;
        b=IGI9VCNZLqhKO0REUavOEFJZR8US+DJxzgtPDcf2THdKZWWR09M0iiCUW32RxajZ7+
         ivIQ49JonT1raiuOLLJQmA0t6dalDp/QlfhYlb2/ziRbyBszDTcOoxnORkxuAFsME3jh
         aBd1j+BKYUs1v3/Ra5nNFZMSxWdLTgwiQOzeB1aWjOP+YwRdD1QmHYvyqG8HwgQQjVtT
         KX0SPslxDufgyw4WHtR76XPACoBzMjN01YevH87ARInZN0DHhBtsQozAoURzH7vVsoIp
         wNIwoF2n+QxFjG+jyAkhWIJwGk+jPSatUEH+JqaWA7anPJxPbIyLpIVugr3PF8oZzYa2
         2XUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794640701; x=1795245501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=RwxJcI4o5k4txShP1ACyIu2E3HSVbFXc/DavqXi5iM2Nx+c1HmXr5bZ1djK36fDlqp
         OxFJondbxtCAKlN8o3/OWNKPZ6VUwc4Grd1hw9EHAWwG3e/zh2YbzMxLwomCPQ0WBDev
         yNDeQ+SunL8l30yurKTQ+3hPqn6zr9Us5zYsW6m4gxNmHG8IUw3OSMqRmUCa/CQQIQKt
         apo68HElI3KFO2WPJ2zow7y9mMQ0In36lpUJiLjz/q7VWlLk7+ecpXeZLkYNc7AeqblN
         uVZuZ999V1FmK+Fq1YqFccnILkvPCqxgrjmvVzyZcE1lfSlwzNQxT9pDa0hQ6I1bPIKL
         YjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640701; x=1795245501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=rXSeKc+DPNSqVOkgMqF0/NutZ7fY0TI/XdwoRUJMQ895ifG2oNFz9EWY6Udrulv8zq
         58NHCYtzo6USwHxh12mFQXWT2PzP3eDE3ubOD+mfG/LMIb+T9l5hsNQwkqcLdXS+kV4x
         VFcAFQDs1OUYfcJI4XCSZTJHtSDeQEIIfpmyQUu+hxxkW/pufqcQvZjnxBOBFfDVQhAD
         Xmc8aB578P8mddVoyHIb7+T7RkHX6QY7knmi3vEUernFUgn6AtOKMA+75OJPfkaNXl6W
         2SXq+3De/KZSnXikeyqcfZuppkoKX1I6QUAzIlqr2rVIvDGsuIQkB5AgGlNxSID6FIAG
         sJqA==
X-Forwarded-Encrypted: i=1; AL+hErFvubKL+13M07KtSKtOukRm2j5vyIZ62xB4uxtRfbd99jmDZCG2frdWr/bDAUDCxnKucb4+wcARrS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YmpbVuafqS/gJCJ1cb+PRRwZ8hxy2Zo7X5yP1lKGqy137uCYE
	Q8M8nwmnkBVuhhcHjgTA0Kns62dE6k4ISx4awfbiCcOGTi8mFoop4TGdeYMW3nBlOQ0SbzdDGmp
	Z0dCVrsX9g6dmderSLIPZLL33LQnbdJGaIvIZtNQ=
X-Gm-Gg: AYBFou1N5Vc0aQ3PcXojzl/ivYoqP9Fi7DNkmqOgqL4WUAqnUpURQ3h0UKZbvQbL8dc
	Q66wSKDbKjZa04XeSts9IjRpdeMRQXDTsx5gz9kFeAJcsIOv8xV48LUdbEJTMOISNxrvhGyv8ZC
	9K/r+rJLppSt8um2zdDAletDfAnEkMoLih+lKYWv8ohj2WUiekcRyXZcpK6JEl/DIKC9bBdjT1Y
	c5kf09oZqVe0n2XnNNNqbKayvmhe1ZrmABM2YVAmSorgxIipohbaHrN7CF+tUvyPgpkavNQs6Sv
	+dohLuy27ufvyFf0XdSAbBf+oJ+jIeCNI4juh4KtDBruqRGuUiQmG7YiYWLla2flNqmTD8vncQ+
	8vNJR+nVwU5emAgywJqRqTKXGAPeoPnGJkFAMDS33lJjlcvk9vdgY7Pkihj5WzGCSarlK0O5Yzi
	E6WKf7YGJXAwEfwkGgOmza
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id
 98e67ed59e1d1-3b1b0ba3320mr4593791a91.31.1794640701364; Fri, 13 Nov 2026
 23:18:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg> <20261113163219.16603c83@kernel.org>
In-Reply-To: <20261113163219.16603c83@kernel.org>
From: Wei Jie Law <98lawweijie@gmail.com>
Date: Sat, 14 Nov 2026 15:18:09 +0800
X-Gm-Features: AclHuK9uXk6vP5W88YBE9Yv3ZhCaOZI4ovsQnoN4ClZqfcPMhl_ARhhXFj-lIZc
Message-ID: <CAH049wmDwzb+zwQBzuw9+PA7-+My+r0QgbCpOi_snr=+oFpgnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/2] net: usb: lan78xx: do not use
 uninitialized data after short reads
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Woojung Huh <woojung.huh@microchip.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:32=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> Why are you testing this on 6.12 if you're just using a gadget and not
> a real device?

I have noted that the patch was applied but to clarify, the reason for
the tests being on a 6.12 kernel is that I am mirroring my Linux laptop's
kernel version as part of bug hunting and testing (against real hardware)
with a malicious USB device.
