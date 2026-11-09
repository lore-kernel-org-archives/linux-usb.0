Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195967;
	b=WCRpAp+bB007gzzjDeolucEUD0j8E4kyp1ux4/vKwPrMZbN/gmClDRcHfrCVNoqsw+e4
	 08ysCdlmFfXyKsOgP4MlPZt+mKLlK+k8fx99wrAVUKnJnEVlySTHDyyouruKHQKY41HEE
	 Y0mA3+sIyugpEnM4h9w4RVDAEIY34z0V7cFr9292e/EYaTDOpynZo9ovXRxt5NB2uip4m
	 3Z9/GV0DkayKsEX+JYXmGbuMVGMXF8QRGKbeTvcXA9rY7faoc6PROD31RRfxwdu3elxsu
	 C7MWrmnvbfXw5GLrXwv4tkHPorMZ7QJARc6TrzhYR6uO7rasn4HBaDypavriWikf8gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nH4e+ShaHxg0yD7t+cKfkO7S7Rl+fkjW9TwRh1qSvFw=;
	b=X46QUZuUJQHf7djEunBIiMeIjSJxT8yEYuI6Iw40XENjtJUXUZ24CkBqavfc74jRKnTB
	 0jEHcd46yyXo8aS8N6Ulkm8pIU840r3MlGUYyMsKypmF4Dk3j6yOg/enJf86TwBfDb6q0
	 /YTklrmVtJwS4vLqXTI+ywMgN/IP06LW5kPrwYQS9CE19k1vUlsmHBPiCMVXTiqSBUg7f
	 j7XW8pV0oa+eAxnhhlRhAVckSEYZ8VTY9M5owcQFfWh9SDa8zaxgI/3teoVUxVQS2Qb1E
	 nljM+A7WFfsFhTINq6M/qYRY0ZmJoXJD5AGjTYS+MuWk4uKHSv1ondHz5X5UL8r6RmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iugLvctS;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB5606A322
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 03:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iugLvctS
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b5e147f101so75519b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 19:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794195966; x=1794800766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nH4e+ShaHxg0yD7t+cKfkO7S7Rl+fkjW9TwRh1qSvFw=;
        b=iugLvctSPvvFWyQfZeYytbNlbvrkcDlf80fqBY9HidkESaEshGf2IMnSu7fa90l5fi
         gZb0XvgH1f4SWiw32sZANR4o4mo9wZEH6xVgEhkIQSgBX8q/8FdWEKVzqSAWsKr3we6P
         hxe+XDJIIc2FLjrLmzSe/bGCiHWxw0/+52JWFqIc1W4qyGoP0DdkCwTRBNdDgOvITmzW
         KX+0I18pBoPRlBzr3m88afhLhifWZlIFrh5tuGwuokkG5yn9DtIWW3+5AB1qnF10nFnL
         KFtM46F3fP2kC6ZXPF1MSXtgxlLjOfzlu92bDL0LV9ppwx9NNBhnzdcC3t04ILUcs36d
         QhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794195966; x=1794800766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH4e+ShaHxg0yD7t+cKfkO7S7Rl+fkjW9TwRh1qSvFw=;
        b=ql+gHfWxNyC6vWYCzAQK22LKwKvz2Cw6jIbPbQYeX1iYO4jVD0/YD2YiD0hje/v1rj
         gTCysb3CGXsVqNfi4oPN4rgdiIOWVKgOddxqKlJsMezKuIWepeUwDbnIjTaUjYdLIGoV
         RM4NU5ZcHp/UdsgDi4SVq9w4jS/unXaixcLpyjJXNonHysUKAu1OnIX3x2ZXN+PUPsuo
         rTYwdVYnC/eOHiEak48UmbC/34YGRNAA1LISYfqAkkkrWH/gSn9JHB5Vmc2+Xv0FOiTg
         wJiY8MKlpsPbNecg/pkZtmlPF+Yo3wTmeEGXP81MEnsBUsHWsc362TZH+v/Q6/3sjFWT
         vSbA==
X-Forwarded-Encrypted: i=1; AL+hErGvHlKllJuYSUFEvdLF5uhm7FsPBQy5IC2TWMZzHmM8qAT/kaj8ZTjw/MoO9E0yOWt21adqBwGNQkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z94tw5E5EdT/WWYM0BFiDK90fCLkZJHj4a15YRerz6zYY02/Qy+
	hipsA/NZZSw7O7RItA73a1YkdLjPlFe5dSe4U7Lyt0oJec1IovqmISXm
X-Gm-Gg: AYBFou2MvaLo5gDRHmdXQGwm2PFVN/C/MdQeHxQ/k9HuHCSR+Jjhe7eJMXDurcYcUG+
	zAvkNKizQbhEkS0mh/a3rzJy8Fr+who+3rdCrfToQSrBY7AcLWqMSNt1+AGuCYIbYpWvrwVjyO3
	UdNSo9mW6DkIvCEz1zc+OUI6x1a9qicw7UtuOFc0zQRlvso/ReQcmy8wVlTy0BF5WiOTMnr70I5
	YLzud+FKvN3hTGIS9xg0OeA46RKLLDj1GhwhDhkhaPadloT1HyQDCpXuJDkFmvZEMkI3g2CgIV1
	KYP+QUqNdbsDJ0I1aye/EAB+bFZxMdRJaTgIks9zEDPiPdwt9enTq14TuOeKbOq9WgOTOSkOOs+
	sIiSLQraFh1kpbia4spNLFr3HdAIrXPAigha6OassvGZtQbNIVc83jJWV06HVIhJrSW9MRsKrvB
	v8Rzh6NCtRZa63KkX0K1MNseAGyFB+l631ShzMDnncsydxkqMbIE7W9hiX51UCOo/3eY2PO4ke/
	xDZeFEsKaVue822tIdHMADvgfuALNqhrUCc1OdbONhoSDa4qplP7HmTbqnasJEMLqH3R0zw9LO/
	z+v5FsZ7OR0QwQgnzgdLI3nMoBj6s1PPIOgyJ1AQo+Ae92zyZmz/Te4=
X-Received: by 2002:a17:90b:3b86:b0:3a8:9db2:a59 with SMTP id 98e67ed59e1d1-3b12cb48076mr4663253a91.0.1794195966295;
        Sun, 08 Nov 2026 19:46:06 -0800 (PST)
Received: from [10.188.246.87] ([61.171.219.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969627a6sm1066853a12.24.2026.11.08.19.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:46:05 -0800 (PST)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: fix double put of gadget device on setup failure
Date: Mon, 09 Nov 2026 11:46:02 +0800
Message-ID: <179419596286.2244.11782596409403661076@gmail.com>
In-Reply-To: <179250629747.20696.17364135141613638741@gmail.com>
References: <179250629747.20696.17364135141613638741@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Friendly ping on this one. Sashiko reviewed it and found no issues, but I
don't see it in usb-linus/usb-next/usb-testing or mainline. Could you take a
look, or should I resend it?

Thanks,
Anfernee
