Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685399;
	b=oweVTb+tGfEeXGJFtGbY88GU4wzIAN0CgltLho3OFkpf/ABUkL4af3qm0O0s3y5pwyHb
	 XkpNhnV5SOBlH++Y5zp0xw6QBotKlhSqXjI6GCN2uR4ZTepCgjD4NQh++uGfhZJMUQLll
	 qUoGBUkQcU70rtDmzZhA92ZmOgDaqi8Y4K1le4iJDprqCu7DB6dtibOV9lTL6rc5TbQEG
	 wezRpJSD9TukDOnp7uec8rS0JccEHrCds/TgCuwINv6HcXrcNcRLLUqOBZ4yujo7c3Lhl
	 /mDmvuKabi3X5Nr1gZP2IXZUjc8qg9LFop0yQmk0x+JTUuV8KvThTBcR7SENjlWOySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8uCRnxIG5zpwA/M8Xn3nQjWVw6Tj1UPGElVF2Li8RzQ=;
	b=Tx/FSUwOSNykJwMp9zE+x/OnibWbLTwffrP6OjcPPMxRe+nZMh9Xxs1HwiqgcCoHy6H+
	 Ayhxw9NU/h75BhdUjBukdryiROmyS8Me6vZF7hIiRf6MrT840FNy6zi7SW1uA2H32ICNw
	 xHjdf3PPc4JjZQT5em+ARv9/ZfLxxy54ak8wDT6W4pQ2FyBwHJZYePz17hYbzvrEWYQSK
	 iyv996CgeMWDUss5TCDki4Nwy5NavEbIuQJ0jvimKTffWr7FL/N1ctMe+Kud0+8xPYE5n
	 MmSysWVBlLuzYbn2QZm5/al4CYmj4LVwsH3z/OuuyseT3VQ9eRtXQAupgE6NfN7RgYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXbnJe6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB189606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXbnJe6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CEB1F000CA;
	Thu, 26 Nov 2026 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685399;
	bh=8uCRnxIG5zpwA/M8Xn3nQjWVw6Tj1UPGElVF2Li8RzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RXbnJe6WUzWnNWkyeAfWr6pJJVMJpXw14Vge+HI89JqgzAwegKNvaXLXaHypZZAJ7
	 SoJfaGpiinfQR8TjJNj98zyC1qV+7gMaBzE10Ia4PVhGBhyIwdYKR17NMGR3Fbd9St
	 owqlufeY1ker6wVnCMiQ9Nz0+77FpXgijriJTz/gXF84NGnASjA055fxQ5ySodWDOW
	 wTWxnZ7u45kG1wmuc+KulVQqtVnneyk2WHPMYYrG4ntcvtjhJ1fNl4d5Vtp5oB6zZP
	 CeSdXabu/AfAxOSEN3PW7Gzje7j5Qsu4a8LhulKayQVIhvrRDZvZbTuvVjkb6/wHQS
	 qwA0Pf+SQfJmQ==
Message-ID: <sashiko-outbox-235138@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: Find a Type-C partner after a warm
 reboot on the Orange Pi 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-tcpm-attach-reboot-v3-0-1c97dfa5024a@gmail.com>
References: <20261126-tcpm-attach-reboot-v3-0-1c97dfa5024a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:29:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-tcpm-attac=
h-reboot-v3-0-1c97dfa5024a@gmail.com
