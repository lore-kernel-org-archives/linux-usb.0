Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826170;
	b=LMP8ZTvyqUZck9brZzcMWzGo3pQiZS9FJ02yVHXdZt6XFCPK9wz+0RPxELUBjnFDP0lc
	 jvMKyDJSzPLvpMJ1c/FB4WWCAs1JFHXNZgkgXH+et7fHoLp6vqjQvoLDkB/tJnADOKCEt
	 j7Zr0XXRnO3oqDq6N+0doo3PSS7/0eUgtrpNupKzZcSFUhdyen7LwT9G4EH7Yfg61woP0
	 QsRP9TLu3ghwvqVQkQWzKGvVT1bNdPVwimAFsr5Png0y5PistU5/M1fCmTgJ8se3PK0Ta
	 xJBXDPb3TGQX2xZZBeRdehasTJektrf5mUPZKxp0Ga+YrE/bK0272vP1MxjKmUxxWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Nl2IZnJMPfKPwJbvcPDh/dYxpAeOF2lS7rPQxfQtamU=;
	b=KWqkoTQDH3LTO3U7S31848bW61dLXVme9R5wHAydGhL7YC5nOE7gQVm8q0ZuXYinp703
	 sHXGD0BlcP/STm3s2Y0Ms4BvH0oTqp5hIUUNqzOshLr2SZaLuxUWsTZNQFhZcyb+KWHug
	 Ktk6dMwoauqqBL7Dai3UhKCy3zDHi4DxVMgDy8H2TorLlLmy0GkgYldqjctyEBgrEKYNK
	 op/W96rTaJC4FMdbvJthMaL6MYYJ6uXyugbNkNec1JDVOUeHkAIGbh7wjYZyH4a9newEp
	 ocinvSVw9IHXZBoPqrscvfiytgjZsh49V0uRRlwO48sCZ0tJtEn0QFLggpIzRAQa1FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbII8lBA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF6606D4CC
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbII8lBA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC6E1F00A16;
	Wed,  4 Nov 2026 21:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826170;
	bh=Nl2IZnJMPfKPwJbvcPDh/dYxpAeOF2lS7rPQxfQtamU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SbII8lBA+Oxh2AGWbGLV1zUwLcgl+SHwaXG6h5IPnQi5nxOSlr1X/do4diCbw+D6B
	 krPIzQrR2+Sx1UHhg18I/FjToy2oMigmIdVn88kpNMUpkRjrZuBvT19tEms1UBZjos
	 Pwyn4SPxwW4dI174eXQ1wJetmxsSrLUp9ME8ykP4RXaYK/FXRnLS5Os51rjBwYwMKP
	 8UTcKrgQmXnw10FEsSgUtzkq8HO/Y9b0beFz8Ct8jwNUAbo1NOF7PacbrV0Qe5N70x
	 ffKZ6g1JcKkfr/i1kyNM4ql1FWzy96N9dBSoWkrz0kmmavmD0vSPU5xaoFx+gk1MT/
	 BW97JD2NMvXGg==
Message-ID: <sashiko-outbox-198037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Retry if notification enable
 timesout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 21:02:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Found on Thinkpad E14 G8.
> When UCSI notifications are enabled the FW does not ack the enablement
> itself. Future commands will be acked correctly.
>=20
> If this happens try enablement again and confirm acks are working
> correctly.
>=20
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104205654.3518=
943-1-mpearson-lenovo@squebb.ca?part=3D1

