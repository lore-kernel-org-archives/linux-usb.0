Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823524;
	b=Q55EBe33E7A7rbtazqWhmt7vchtbd4LGaohxOykRb12gc+wUyWpKeLDfaX6CAeDhQW2L
	 v/sa0flW4+p3fJ1T6LAifDC/Q2cri7N+iEl2GXgCzD+nKZxP+wA0WQRkFruwYie5qohZL
	 YyWDNOtoqp3vEaH4Jkw+3CmkI0ivx9bU3vL3QP0daMrB2789be7zq/llcoit9IsUXqVS9
	 md5RUnVJ4Ynl7R9dJH40Nyhtpt1hqUMzJ+bgNdWRMp2xnytl1nz8vZVUn+lWj7vmu9i1u
	 x+o35AZsaqcRSOSUWzyKAd3GcCB+XXz/Yt8yOPFfQfaXD1ino9wfjlkAVogpYSeq0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823524;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=romsYvhqKfhvHWXsB7Wnx1f1BkUnayG6Njb1CSJzsbs=;
	b=YS8M/zXWGw/jwGl0OnL0gooRp8gZvvnCUePoOJLjyvatc39hbOyt8r5gb8zwV9F3TcWf
	 2ljPZJLHNa5JA095GmhzOfumxv1cSVDWB+HF4iYBUHfcAuWiw4AcVaXhjdwLiQ0rtSLiJ
	 yYlWzoD6YCmjAmFPrI2gf8Amid9toFY0xU0NC5q/bwG6uG8J5aH90tYLMwIEUlwu/lule
	 jdPe9sgBDETbclTs9q1QYYF7Os/b0pShb7z9mWXNWHdlNQR3puaP5ZxpQz2Ch0YbIBWPS
	 VM030w39vMlnEyO3id2/6pglqlvQ0+f1N6D9XeSXOWxcNz0cntm7/t3jWN060Z2+/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtBwehEQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB06071A2A
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtBwehEQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0104C1F000C1;
	Wed,  4 Nov 2026 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823524;
	bh=romsYvhqKfhvHWXsB7Wnx1f1BkUnayG6Njb1CSJzsbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EtBwehEQseYfG/uRLWJxskDvDEDo4oAluyz2o7zTgtzoTp3KdJut9Wc80ysQP+Ucd
	 FYN0FaTFVfzSiVHEGZ3wl538Cl3We1lbNcW4Y1jHQD2aZKazVrMv2egpFNf6NAmvfh
	 8wUdgq2kfBuxYbhy7sAsgaZB9jWpDGxR4yedOxojZ8ujPHqufkZCCuEWON3f4NlSPy
	 dx002VRdiS7x+6JMyS6mTF2JnvImD+xYPa8I+ereSyKFaC7mD50oonnrpA7H+WOX1X
	 EGKB4ESeopasakNnm+NO0mSC/QtJCJt8zaypXUTY8oLi9il0jkMFfKtY2+txBLujQ6
	 0bO6a57fEYB0g==
Message-ID: <sashiko-outbox-198002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ACPI: glue: Change (un)register_acpi_dev_type()
 to void functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <2080936.PYKUYFuaPT@rafael.j.wysocki>
References: <3471545.44csPzL39Z@rafael.j.wysocki>
 <2080936.PYKUYFuaPT@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 20:18:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> The register_acpi_dev_type() and unregister_acpi_dev_type() return
> values are effectively ignored in all cases (either directly or up
> in the call chain), so make them both void and adjust two callers of
> register_acpi_dev_type() accordingly.
>=20
> No intentional functional impact.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3471545.44csPzL39Z@=
rafael.j.wysocki?part=3D2

