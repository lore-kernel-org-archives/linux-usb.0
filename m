Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577317;
	b=xsYOyx9pwSHi14ZwJt+wybZrDeqO1BddBofvQgoEd006W/Qa9uf4XBdYDmsSoRAcTywS
	 LE6sMKxo8lCCToWrmvXyEDefw/rLTPEXjpqXLwHJGwmnjsycr+hcU5/71gD+QKUYLFoHe
	 sC9eG9kGNLOnOiD1l61JuTMgeiRlMyxBD+W+F9sWVCDE222Swxa/ib9QBQvrKO76xO27b
	 /Q+V+C8h2ixz+5rWiTrZ0z9ZeWCdT3J2R00vSGH98PMsvcg6JXwXC6ZsN/Kjfps11X3ui
	 eJaTvHEZQSbhIPee4FCEQdpXNSJ30b8DZSJ0UL1us9nsdjpvVWtiz9JonnF+T3AhQMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
	b=cBtZ0DazKkU0SL7N8ef4ENjDW6zSPL6U31PY/cAcFBQn1HECygbJk+/VAkA3kW0wKEKD
	 GM2VPIpOmrkLMkAciL2Ov92ewp76fT3+L0V+QpEEangNCENH2KUcRQhaVru2UJOvVj3Gx
	 UIqg5hL2rwos6f7SqN+y+BbCg7KlY7DVaU4BhU/l4Z2EuDcSEklav8rsTGr0suLJny+os
	 gLpXwq4pnQWFBcO3QYNmqREPjHfbK/geeN/3wjvZASPwILaPuUIKSt5gzvGNYoEA2Lxvg
	 5C8vk8J9YVgtp+bEArDWd27j0pInoh3GJ12JmVLGWm/wndzxHI57xME0ikZMiUvAK0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKrE2NJm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AB9606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9AB9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKrE2NJm
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso3255040e87.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795577315; cv=none;
        d=google.com; s=arc-20260327;
        b=mes1LMRml78uLjqkUD/1X9/EL46SDNiWCXc7dODpwdNKAm7/410QiLeR74fQebX9g/
         y9yghfinSncuckCvKkLU1AOmPhQutpBH4KtMRTXB6fZ32/s+iGPNCJcm59pZQ9m5QI1/
         kAU9UFbA+M3mDkjAmlKGPBAT4KWyYSm722jm21LPlGQZMvRgulXelL2v3tb13Q2iPKKg
         cuUtf3tjBbLN4H/+ipFsIecfCaxAQcn5vrEJ+ZTTl4L5k5ky+QnBdu5+c3FhMRDgwiJQ
         cArT5d7+7CZ9HlNhXuqj6VSpFS0T8ZpZHYZrT6k6s4wVoJQEcLDzQ9lPhJbgR03UyYf9
         +4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        fh=9/QXj01fXAwy8SS79op0BrQmgYk+IDyU05HlzFg5+BU=;
        b=S69r9s1oQ38LQmlLU+BVcBfb14iuQ4gVcCsEnv59Vshtaat1CZiywIG/AbIaLM0Z84
         i2FzV3fzlqZgWlOv6Cm+xrrM1xbLAi4f5X5R8l7bp4Fdth/+4+pM7h8uX3J/N2GsU4qa
         fpnDd8HpUsBeNb+sPfnKRDklub7RP3RWrHXwkpLTRgEcanMxyh1r27oWfMBFVRDZYMtY
         cu4feDH/zj6pjWGCcbq8LpwuPcur9kh7/dU4DaLbob0GO3T7G9+hh2yORgUAGDvUWawa
         6otvn2H9/gSQvakYVJ3I9DC6xjVzRD44uZJ9l7DWvlk8r/t+TZPHlTrgDgQabCuRbOqA
         eKsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577315; x=1796182115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        b=CKrE2NJmlO2x2coP0veBjV43Ou6wO02utmDWOdQSD0IkTjr3J6lG9f9RqRUMJs53A2
         hJprCmuxtWzih2y0dy4DOnGYV8UFqsLFMPI4kG2gOnaPvNpjIhM1Kl6o6+W8BXvYtw0m
         NXxJGK6jX2k4C7T9oqL6OKmnX+rwIQ++IbMcNRyOpuG5ejw0UqUyBEH2QNeB3H1LHV8S
         zTLR/1GbP2eDY+gj9cyba75/ol5+p0UJIi22lqyT7BJxORrSmtnxzcV5xE+EiFnTCJ6d
         xB/pPs80i9Wl7WMnvqO0buCYNyxR17vRt23KyQR/Sz6+CoSICQSpitl2qJfc17VRxke6
         L68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577315; x=1796182115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        b=DYePrl0OIXAUotG9qMbsU1OkNqCU4jLeTBNSvEfV6+mnDeqE5gb5I/1ostG3xItrOE
         YA7BLO57vvhlGcSvln4zYqP4+Ig+hBgiEOoWa7VKijlEKxG6nkVTyRscJv9ZJi8AOAeG
         wMmkgRXFJEpHuKirITPHwhZzySHWcz9CLGwSBNnE7oceUyigo93kK6lG/Ityi8jZIigK
         +7KZrlCshEdd0CtzV70VRpxZ3nPSpv9c8DK88aWQZVgRp3bXCbQWWSJxl1rqWCPu4XeY
         DyaUlltaXvR8Z6CDWrU24ljaX0Hb1QXG6scV+QtHTQ9h/wOt9faQCHQtlVHfeEmkE8F+
         IUyw==
X-Forwarded-Encrypted: i=1; AL+hErGUdDXV480jg0iw2RmUERO5Xml1ZYEN1Y7Hiscu2woPaBTrjAw2Mol5/p88PB1Mgq39OpvhtrQZyCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sQodyuxpQjRbzNztanpVVlr060MDJDpnsuiILVQWEpJzXzPeu
	i18ELq52qwCJRATRi79PP3speWtSx35PC3x83scPMQ/gTGpX0v41Qlw06SXD5iCFP/OSCUbWIDC
	1kirF7xWzKEdGKAvgm+oLyT2Km+1Kmqg=
X-Gm-Gg: AZFdTZf+fx/ln88HpCDTO1a1gxpU8h6MclEMx3j8eJuVz4vdGmwqD4BuhfSLztaid5A
	Gk4dDorE+3fdHcGP7H0WY4IbCp4YqkJdS8VfoxUy8/4bZrA95LGwCJrvPytSjMAMm5gX+KiGGTY
	V9NKSIEgiczev18R4nX3UB6VbwL1g/bFKpzgOMUf2BGXLtNxP3apM0NkFirBWtGaymDif9IBd/N
	3rPT3NxO2NX2q8s0uQDCtiLG0GjML7Ob8yphc3gIskIl762VT7uxVNNfX5V9GAsWpXefW9HCFNn
	DlwsUu8uvwj7ps+1RZ5zahzpLu17c9wlgb66r8B7a5fYZQZpokYXXrtWtfctQr1ksI1uL0S9Ij1
	6jAg98WYRTQ9n3LUGcbiBS1ZiDKvluCgtoOAeKsM=
X-Received: by 2002:a05:6512:8346:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1bc7fea99mr2659579e87.21.1795577314677; Tue, 24 Nov 2026
 19:28:34 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com>
 <20261122-u-serial-console-dequeue-v2-1-820f355827e6@gmail.com> <awP_a5IqlYHPvx-G@qmqm.qmqm.pl>
In-Reply-To: <awP_a5IqlYHPvx-G@qmqm.qmqm.pl>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Wed, 25 Nov 2026 00:27:56 -0300
X-Gm-Features: Aa3M54q3-u3iR8PfW5c1rCzULwKjC42ht9kSn9FSOQhdbTrBvX5w3OxzVNEj4Ks
Message-ID: <CANxzQdFNudKjwSO0cA3Leizo9PmZgDJkZtEfEnBWL7H+xYwCLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: gadget: u_serial: Publish the console only
 under port_lock
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neill Kapron <nkapron@google.com>, 
	Krystian Kaniewski <krystianmkaniewski@gmail.com>, Brian Ellis <brianellis@gotenna.com>, 
	Ai Chao <aichao@kylinos.cn>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 09:55:07AM +0100, Micha=C5=82 Miros=C5=82aw wrote:
> Note that there is `if (port->console) return` just at the start of this
> function. If there is indeed a race here, that should be taken into
> account.

gserial_set_console() and gserial_free_line() hold ports[port_num].lock
across gs_console_init() and gs_console_exit(). The initial call from
gserial_alloc_line() during configfs function creation runs before the
function's console attribute is exposed. That makes the early check safe.

The race is later in gs_console_init(). After it sets port->console
and before it takes port_lock, gserial_connect() can take port_lock,
set port->port_usb and attach a request to the console. Init then
takes port_lock, sees port->port_usb set and attaches a second
request, overwriting the first. Moving the assignment under port_lock
closes that window.
