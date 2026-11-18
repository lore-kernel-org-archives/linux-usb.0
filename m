Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014255;
	b=gv8ox1GtroTIcNLkg/2TYjiOc5DuFtjdjN4CokRHV/lz5SMWZomvPtXB71OZFdG/WZHw
	 rA3EJO1B2w3IRy/XGRE1W7Hq7dxR6c/4YkA85VB5HqKUcQg8vypf6VRb1J1h34ebXjwuo
	 3U8dPNNxJdRzBjUZuuY85qe6B8+bJzVT86ljr0J+nA4gWIv+arWxR7Z8xOKPGsw60dkgi
	 WLwWL1OSqac9KLsxDWB4naG5DD87IZ6xD3t6wtD3eHvR9N+ikVlGROYzdrf6rAbItdkkI
	 u6NKTbCN0jOukh9yPptoGVgzKb/2JkiPmL3+shE0DfYI5ZJ8y5XeD05t/Okomui16Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
	b=3hfAmZkY5/syxLQAttVdMc8LuTyH+8eW9OXGIRhFwVMI9t3RXN+VRPwb85VyzAqE/Z45
	 p01b9/XM0B8i82pMJR8vEkMdgmCwobFdybN+urp9m8BR37kQMyDMA58Rgjk2Tfm15TpGz
	 xUR8NMzxXTcNmx2sCgzYjDqUnpGkLL8Ketl76p4a9mhwBVefeaa0+6J5HJDYqkkq3qsnA
	 GfNym6CkHnpww6OAn9vn9k+zWSUqWe5UjpIGTyWotFZHTX/M/Op5iVoZLEboKznXCm3KK
	 coEgCSfqL3uT6a+nMPZ6EujbBm5Hiifx4dNqta7tbVqV8wG3tIJwumsr7JVFDHKXG0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZgNY5oh;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E56606A33B
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 15:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E56606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZgNY5oh
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50692e6c0aso17353666b.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014254; x=1795619054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
        b=BZgNY5ohqoEFQkAOL/iufDJibOewT3UgU2WVfwz5xpbqpBVbkYqnhc5ABRsYqWLPj7
         8GTikK+xnUaXefdEgttPL5Dir2FKlQPUJi8SXvikn6YoJ8UbiIxeNQg7jnDHaaDw3Osc
         7HMiGLt7nV5j86eNOAMOXcwjFXjU5ruEQXU4NglemLKDqQEaYmweQOhUf6y5XignaU7O
         piEJezvPTns6OaohWw2T+dnTPhfD44fRRmw2aW3DQLnvkEuv9wCRY/p7kGA0jZIVhCLa
         ud9DSv7W/UVw0VCagPDTiXYbdGPHJa2o2Mgq0t6CGcMtFx8rf8QAjg9T8icFuXsQLdxF
         VUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014254; x=1795619054;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
        b=VOyFK/V4u3RkEq/uyxn2y9VKoIvxKaeSqYgyJAIWYsyMb1yBkLg63Je52t8S8IuclK
         MZEn7xxdyS5opN7h334HS7fb4RxqsScketblotlvkkq0Q3X4NEKGjO1GjlEknEn97G0P
         4PlZLdxJBisAitPkZXZ4YUJPNA8caSonSE9H1MgHjs48SKG136FTu6AKxF/lox5ZB10d
         a81kfzZlI/YsBU8M7Hpzr3hNYDPuCmhIyImYM1eKjKYpJfq06Jj8jCVInR94OR4QeyLu
         u8Lw2gR7Z4JkhHeg4XfethM6++lfElzVLYxyIACW8zEzuXclcz1nf4X2SNHG+9uY1gwC
         L0Lg==
X-Forwarded-Encrypted: i=1; AL+hErHJVpXr9LaHRQdjYxnLDAr7bCvX4U9HFVCTq/kHlu1ALfBtuJ6czVIyuD2JiCpOrwVIFszV2fA6UPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zF8F/DzRCbW64nDB25gk5rNSvYHNgOHk3CXYbOgPa8qCBjI1l
	AgHBDBLpsKrmNWChf79GpkNb7hzApA56/8iqK2W27GlcUqJZBg9XeUZC
X-Gm-Gg: AYBFou1E+mlQPfpp6OnHrGDfMr2OQ4qs0hYmoShnoTR0Xsgx17M7YxA/Mh/K+L1jzJ/
	cesGRVCeHckQ1fk/+wLaj/Zjz64NJOKnwmihXz+7JaCwOuNF4rmfaCdRdQOigRJ5KdntXohl0v9
	mugK3Ap4QOnf+qAh6ZG7fwG5nBTa0brp83X6w1lrTO7qh4zMcgmsbTwZGvMlDL7Gh1i9GxQABvF
	dz/aJG2H1XtdJtHETiNTODJayiQyWGwcJkWJSE/QDfiZZK0P6/dsfN9om/Tu/r9WlUOHetH0BxI
	AdGwJZQAYlX4/97LNCBsGPsG6OMn9wzSp8D9pW+7iOqZY5KeQrtwcpGcAqRez4F2qMd2VgATo4i
	vTvJroI3NcA1f1EunLBTIEEhse8UTC1KJSaiQ97QU72Axz9/70bsYek45Sk+9gmQSJqDj8Mpprs
	8ZZZd3R17ockpAxir2mPYelzUtwkyu8MsRTvOFTAH1NqoKviP+d7upYhc4mvKxAjiHL99Zq/Xj4
	eScZy/Y3Ja5yhTRCjMInSzE4II8jgjwHycNyb0IvSrURbvEcZe4mwLX6l1/nwrrVytXB35VZLsT
	gFv/CiFYfj5UXx/YSRN9sDsmT556jAeiQcJ7Lr8xl67NTwLeLefolpCDQC1DE0hRkLZGbFk1rFj
	FBAY8MzyeFsBwBA==
X-Received: by 2002:a17:906:7085:b0:c2e:8801:9139 with SMTP id a640c23a62f3a-c510deb9e53mr253754166b.1.1795014253543;
        Wed, 18 Nov 2026 07:04:13 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d52sm7516566b.14.2026.11.18.07.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:04:12 -0800 (PST)
Message-ID: <b6b45a76699f8b5dcfb2fdb1ee682bac0ed501df.camel@gmail.com>
Subject: Re: [PATCH v3] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 18 Nov 2026 16:04:07 +0100
In-Reply-To: <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
References: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
	 <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 08:41 +0100, Tomasz Paku=C5=82a wrote:
> On Wed, 2026-11-04 at 03:44 +0800, Shengzhuo Wei wrote:
>=20
> Works as expected. Thanks!

BTW Jiri, I'll re-send this as part of a series shortly as I ended up
doing another big overhaul of most of the driver code. It's currently
waiting for Oleg's review.
