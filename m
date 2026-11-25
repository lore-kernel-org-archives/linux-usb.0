Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620602;
	b=hxMmnij0maOYqE/3hFnjEcc6GXzxPjfBpnt0mFI7OKtdTAmoCgJwDaquh5wp7rom1+75
	 5LLmN+JOK4d4orcWjqXruK/idF38Q5JkkfXd7RYeehOFvnfotnulXRbdHepdX5guxWtNk
	 Enjka558tafjE9LPn3rwhI9Uk7vn7+YQdgK2me4fbr866JWHgwe+jyNv2vGTjwmyLk7Sf
	 uhra+u7x1AHiAa/RmC1SwTRAGmo3xMNDloZDikF540Jjh8EHoX5ucW80DOFOsPBDL5AHj
	 LWkOwP+RVyuv83O3VrONPnrmfXP+TatbuW1QB5uHlY5e43rIUNznqbFRcVVSF5/E0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j7p6fjmx6pnYFlqsVMTTxkxQBFnZvgE1xEOkX6j+Nj4=;
	b=RUYWELqkpe42fcvhCS4cjfeAD4tNlutpusmujsFIMbiO06Kr43Gs5x+/+g3kkJwDYqyp
	 8VJymQPb0HryXK+pDtX3RYYq9oFG6uBKniwKbIkTUiXoP60rDkOZ0iGzlbGviSSmv3OP8
	 k7RnpKh6gw1TLzH2Tkzfrn8FjwrA8UztMkCgTaz5o+wLVgpeTy2awJacmFQHC0Uvun0Dp
	 Xb+95ZXFB3DWyCbjUi8/WgY0toQuTdK9lk5qFIHYc0IpQc9UArWLOElJ4S78vd8UazYM9
	 cKTx2obzDcRGspicOAwxqMhDbZc4sjcgKLiIIZVAS4VrjIS8In6D20xBm+N5BnoQiJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msDUk2wo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745C606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msDUk2wo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7101F000C4;
	Wed, 25 Nov 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620602;
	bh=j7p6fjmx6pnYFlqsVMTTxkxQBFnZvgE1xEOkX6j+Nj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=msDUk2wopOkWLRPWfKHwM3bRe7AqKjL0a6OJzsqbNDFwPJX4Em+3kQamq69j0xMnH
	 uqZApEITRomRH56vPHMkAcLZaimHGftGMJpjVYjjnI8aBYKO2/3Th23d/ZlXqSew2C
	 sZLZMEGufKz8sJBKQNFbI+RCC6kJDL/uJc5w/sDUEBo3NWJfMz+jEP9VuHt5czI00F
	 SqHt8XhFNeZYt/FQFVsy5mhTdx5VhMspZw5K9t8eLXNrLajWQWCjNRvKkd7w9VgXlI
	 YKoWRpHEwjI+fMpHsaxMR8+UVMM1tqzKsJyhmfON0eQ0RoJa8+yR5I9C5vBKTgYKOX
	 Bpa1n83hjxWHA==
Message-ID: <sashiko-outbox-233654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] usb: gadget: u_serial: Fix the console request's
 lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabricio Akio" <fabricioakio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
References: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 15:30:01 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-u-serial-c=
onsole-dequeue-v3-0-b47f6e401dc1@gmail.com
