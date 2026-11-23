Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439179;
	b=f26sQq4M3A6nAMWr1k+Nn+lsmPbKRt9ArNqcEL9pJPAtW8tq+4UFXgxr9xGXBUZwReCE
	 Xs5Zsa318fm0kxWjN7/H2r1I0wYDcm4JSYWeHBcjJZHuccMkzepNbPhA6KOKQHSc+QmJ5
	 RwNwgm/J8sf2jqy1LQ9x7/kGVLiNlWhGSOI7SvGPRkYx35zRjwSsgEUfKRdr+yCyUoTqJ
	 a0cEsIkq9QilcgA37HNPn4yB2XPTJmMkGmG2W9o+PH611091OE4HPiOGH4ibNVl9ebMuz
	 eulLVRICV4sE8a2w5MV6d3rRZqfQfPuAFk0g2oGwQJfOEOcsj3A/QF1MHT+qvWwVMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=meBH/t4p9IF3muIRkT8am4J22IoXWUdTK9aij1hznyE=;
	b=m3MyQSIfH7fUfWMb2LgYA0NSJGZMcpALKye9b0XLx/S+Nzi72JndsfoJy6Udblgzz2D5
	 rzth3G0hOHgIfZ8qkS5bFDx6J47YDG/M0MOsIvaptI+YImC9v6EHqGoK9r27G20oO/rxE
	 e7La9twYvsyeOdXxwbOevWkaPD9sK0jw14ihAZDLbcjfnPlpgsmtfiqAOz/9FnqIZmGDu
	 YBobd13Vome6EcCQeKAups38iCgrhzrct6Vw/drO2UHD7VbuEeJa1Vt6TyuaCFigoRqKE
	 +4xJaHrH6gjZxQlw+ShYA/844F1E+Hn7b2oIUII0gw7Vvz6DBP9O9vR45tZSeG87DFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+J4VhiN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0F606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+J4VhiN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6C41F000D0;
	Mon, 23 Nov 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439178;
	bh=meBH/t4p9IF3muIRkT8am4J22IoXWUdTK9aij1hznyE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+J4VhiNREbSm4bwE2ggFnGEtJGoody+9Xx6p9McfOFZsscwXcqFe6bz4nTU2TDgH
	 F3SGa1lwcGN6T2QUOe0POJcomCnmBqYjYe2g3WFfXeLxNvxBaDYSxgTWfbW2kmW2Uk
	 LoprguVvUK9VKBpPsRJ+F8PRlWSY3hVwomX9u5btlPVbM2kV8iLjJ9tgqCTM4nqpJC
	 w51PX/8/GJApBgsXvcUrRhVk8EjCZen3oq3aqVTKfZD4CQ4MWGozL5hSHikSkyhstf
	 Pr27B/zduVQcW+lsP2iYE4W1ArP7Zu6X+PxMRwzcajGS0y4gQ6k6MiZoWLL9z3dZnu
	 2PjQ/HGJOsGEg==
Message-ID: <sashiko-outbox-229286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] usb: typec: tcpm/tcpci_maxim: lockdep and PM wakeup
 fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org>
References: <20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 13:06:17 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-max77759-w=
ait-v1-0-6fa54a751bb7@linaro.org
