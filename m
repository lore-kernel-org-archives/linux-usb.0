Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792615527;
	b=HhVQRII9qvo+uUhKfc/+oh1r6r85SuFvPfvK2ggME9nMMSXe5/FIVcLTyMfYCdXfalkq
	 0M4nkZPMNqX18/9CJ8jmaHTQvoRUEC5FfOaFnZMnPvS4cc0iN9K+jXcWC7rkcPB5OmuS2
	 56gdgrrKOUjcsNaZusOdXF0WMdy5NrperFreuwBRiKKR4DcerVEN8GgKVlt/6ClwJVovP
	 bnuk19+sdGx9zI7oijMcigGd2qRXNQToWkQXyrKZpRb9wIaOSKuanjPHkwqvOeDz9zyZJ
	 gMU+kK939vzWmreTbivMhUVCy4DQO72ZCbs7UbvzdUxZ8wgEZ+W/HWe9SGdg3qU70kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
	b=E+8BNBZvSlmD19LHoyXqPeqrzmwAivsixS+dghVZdKFtLaq1t1Li/UNNeoDKbqws4Pm9
	 ulWlg+jfyNbWxGxGgqcLBYnBBwmeEi6gOyi1ww3VeF2LfsuIIsSknMtY6sBNWgC+bgy5C
	 5/+LmG8am3J+/X3Ka7bY2UQsyWYHdlA/6tmNF9wm0qe2NDKJkfkFvx8MIp5ZRUnCMTSfz
	 bCFDxRJAwjZg/YBYYDb5LpjLkXj0aQPf9bQv6pmCvXke4tC/zl1SRYPbvb3AhiC8B5rfH
	 imHQn8F9Gz+8fvM5hGg1PXGSfT+HO82nK6bQSytcjvyx+pQLHwcjyF0Wc/4prEJWjKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2GTVLdo;
	arc=fail smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160E606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 20:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0160E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2GTVLdo
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fca0709caso1003912d50.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 13:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792615526; cv=none;
        d=google.com; s=arc-20260327;
        b=OBdH7DzN4Giioi8wBXMpAy9QTN+q5JeeAEg/mB0kj0XKXlI15/cl//bo1lzlGvuS+U
         mCSgpw6h3lK3h64sT3vPchwkYFKB+0atKuF8ELa8TWkyD1g4hnYNz+gBtVXv7jwTm5Rj
         bXFhkBB6yw/ZtpAjK2RGPylOy4iGAD12/pWySwNX5zfXBDql0AKqhWTlrZuGdyreasco
         YhztUfpxI1R7WGqUheAcV1jELOG11LqW9E5carLi+X0Umr4evbdKA25pLWemDwyCxzCY
         s3gt9jRNjWTHH5YKYRCZkCMfetiu1z138I2h5uDUA8VADbqlKxxEiz9uHhRfSD+aNDk0
         zLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        fh=TPYjAxJaCdPVLM7Ai76ltamYPfwb33ajaZe4RFGEM88=;
        b=VRkRgzYEo/40cJcFaaU/qAQEs3gA9SFtDBwpG+l4nqBEi7rwG0NXKgoIcgHqzIGNCM
         zxZDKbfGTiBXYs3WHMILWLrDEuBP5Od8l2S8iNClj8nuhYVklFmdjMKmnYwqzCoWWQUS
         EP4FtvYSzKQTFX0r15VoZzBRGiXABp/LL0XSl3QxqXcLRUgZFDOwnJujNVYLqu39ZBF3
         ZbOlvFpBRtnkjAVbOv/Fe3dKGu1u155ioC5PithJIeHDvLWp6O+6RHrFZRXqEQvfuWgy
         anHgsZKSSkmVvMobW++p9aDY8NCXyBJdXs8dXA5n6fMdIcP1MfSB3AT+sw0fqTicH/dg
         lOxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615526; x=1793220326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        b=E2GTVLdoEoKP4/36dM6Rt+ujq8xHjhA72Dki1Ri7kLFvWK+VxAEg+MLJX98lJ4ED5/
         ve3Ei8uNci1YteC/PxUpHGMQi6gBts5H5BmOQ5Q8S01U3waEOAUaBXC7PdH4sYyKbrBb
         85gL+hDJPSnI07vs4QEFIaQiipQiHJIdr6bOTAv5di46twuhRyfJrQBkvSP8hvNVqswR
         gG9VjRrhmJSEJdTpyhMtkYVbYyu6KGvnxxP3kVOt8mwo2oQYQaOZOHLTEXcLQsO12WO6
         DK7kU9vJZ7UryCuXiJjzb8OgEU846DLsJ90OvMM4vBlnKBOpWhUhvSePck1umrje15jn
         K4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615526; x=1793220326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        b=Dz5k1Ek/Xb/KasdivW+397mY1dxXmHtI9VX/Lyl8h+w0CaarcriZ7niBLr2jd0nGwQ
         of1LcQlRwoRBP6LOkqlYvifk+V3HaO14zaygbk/JtvmDKm/jH+rVIiFkLbt5HNjqNlL3
         W8Y3/OSaWIp4wShNNC/HRvsz5opTfj9HyuqOFIl3PxF6LD6HpraNkPM2Pcdw3+O1LYWF
         /9NRrphC7kA5NoVcxn7UOG1Kh/T8Bpn+iUgY9/ERTb6Tox32uVcg7ascvtiYPwgCuzgT
         /S6u8+tjY45HKAzuyzE8AHo9LSNz84p7Yl4EV28g06O8A0N38P95TuCmRXqYJDfAtzdZ
         Gpjw==
X-Forwarded-Encrypted: i=1; AKwUvBxiAqa/cP8vQPMtpmJIN3/OPjkcxSb3QvV1mlsXoBQnS6BMWtYnNw+RizEaZcu+HoNjHeBBCKTx5wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYbg1CweyDbuVg3TXJTJn3dRK6jWDTDqBtsV91kSIIB115wS6H
	Vfs2hyyk2AfMx2jJrdPZa4TCDvAW+lsM/TrBxvWy0SErHvUluTXGi+Lbmj75O9RoKxvTxqnOXGP
	hpY+jc98uRI++tCkBOH5pkw5C6A8B5r4=
X-Gm-Gg: AYBFou3N/J1MWlRecV8aTn0Mj/1FxvJvrcK/sjjM87VTGmsJge/tVjQl4j/o6r26SKe
	F11yuyuK6Ze2zxtZ70hh4UYyPuxOgF3Art/o/5Xk+pXX9R0lUqEQhjuGCNbfoEjWekmS6JiYhvS
	z7opLmohRV49jXiL5P1lQxdunYjpNPEkeCSOuDB0cS2ewNl1lukt/jXp1DBFfsjZHjvFW2uR15E
	2WMLcq/JDNg97bkrf2+PQzm+/sxMir9sFZNj/ayZxrgkGKXPWiCaF4JEPg4tzE7+/Kk8oATgbGk
	kGVaE0hwQ0WsfZsQcYMgbZF08ZtQcBDxnzjlf271e0D3J6pppjIxvP5w4WFcfFX5luGMi8bsSKn
	kiWnKxmWUMURy7iS/qTMkWCksFpsFbSmTUo3sJDONq+YeKnPDHJRLC8PohdSmwY23brI=
X-Received: by 2002:a05:690e:80c:20b0:671:26c4:3ac6 with SMTP id
 956f58d0204a3-67a0e4cfb65mr1060933d50.37.1792615525992; Wed, 21 Oct 2026
 13:45:25 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020202614.30277-1-stefanomunari.sm@gmail.com> <1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch>
In-Reply-To: <1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch>
From: Stefano Munari <stefanomunari.sm@gmail.com>
Date: Wed, 21 Oct 2026 22:45:14 +0200
X-Gm-Features: AclHuK-ZK4ETNJ9EthtOCxXQFK-JYsgPoO094x_9rBDc8C162jyjBrY68mcMpzM
Message-ID: <CAAcd9sOF5weSUoxLtj62t4fGNH-Ar90J9CHh=DvCgwSkrtH1pQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix error handling in lan78xx_open()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andrew. I'll send v3 to net-next without the Fixes tag once it reope=
ns.

Is the Fixes tag being dropped because the bug is unlikely in
practice? For future patches, should similar bugs go to net-next, or
are they not worth fixing?

Stefano


On Tue, Oct 20, 2026 at 11:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Oct 20, 2026 at 10:26:14PM +0200, Stefano Munari wrote:
> > A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPE=
N
> > set. A subsequent open enables NAPI again, triggering BUG_ON() in
> > napi_enable().
> >
> > Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.
> >
> > Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
> > With the fix, the injected allocation failure returns -ENOMEM and a
> > subsequent open succeeds. Verified connectivity with ping and SSH.
>
> Memory allocations for small blocks generally don't fail, so this is
> theoretical, and very unlikely to happen. Please target net-next, and
> drop the Fixes tag.
>
>     Andrew
>
> ---
> pw-bot: cr
