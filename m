Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864596;
	b=mIdQXOz2BQmobs9VXzCqx2EpN7jgy8Eid4vs+fdA0viXiJ1UtYMND99KrEgnZVt8f4dJ
	 vvjR9BCWy7irzGYrlLBA8xs0N1O0UnvpY0h2PQceoGZqvt4Iyngm4SOUbWtcLKXEISmxn
	 w5WKXcyDn9BpzRPrVHwTu9FXro4D31V4lnCdd93GA+zfOQ6PozK+mrAI5EEwJt9nYA/tD
	 jpolt1gA2DX9IoApCcHMARcjPybvTFJUwaIx58EuZiH35Ed/cGYIb2HEIRDIYYw/AhNJa
	 GakiG5wJopMi+pnTKp85AUT//emLFI9zMtIMd9+s+mZfGzoQUZAkdO61/hT9xfFI5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864596;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bucyzBYbHZo3C+/NuxgrDLRf+n/n5NhSU+j3+yHQdac=;
	b=5IAOLvaCDKeIFEsFCC+mNbYx4OtjtwA1KlnQRSpiuLW6fK8HBdelIT2bJTZjRfgi5M0H
	 FnzhXFb+e17lkn/rSkgcKD35xAV/IHKCIPVch18E6QIUqkXiMqrG0J4QY32dou+rZBSu4
	 /zntKoi3fxadZuYL81lO5OnHe+N5eMtuQAIyW+uXDeaZMm04ShCXuCvfS5NygceqZYceR
	 YRu6FPOBh9HA3VQfGVyAPv+12vE0dKaC0kMdiwYNBSiCSxlOmyNhPbX43UaENmX0wyLAh
	 hDejER5S4HXeeDZMxnn63dMiQbozTznPmW7ftDUt4mJDbhE23ghfVuvbEApF1eOmAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bh/uu0PQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EE606A323;
	Mon, 16 Nov 2026 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bh/uu0PQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E651F000C4;
	Mon, 16 Nov 2026 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864596;
	bh=bucyzBYbHZo3C+/NuxgrDLRf+n/n5NhSU+j3+yHQdac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bh/uu0PQCYj42IBbC5r8DcccH5ApQyHkWQGMIddlEeLi+Xn9Qb8OL2d+N+TK5SuNM
	 y/lKMVfKoi2aq9fpe1hnWsgAINm4gEz/9OWQeeVJS71OnuhDFHN0xaut+KR/9xe6GW
	 yN3s1jaa3WN31G4zDQbW9kB2CpIYcv3sQGUOoc6urohVXY29ovZuL631ou0Q4Ni/8i
	 3VuRHqT4DHrTHNpkEbIvfsbi951/7cXA3c4heIIeVteOFENjj9fpI8zwS26dBq9SdI
	 RBfVd0rxA1tHBio3LvyIqgCQO6PUMCobCr5DSJlYt2OCVapp+OYh6lBdVq5Z/EXaM/
	 dp2ooCj3EEUwQ==
Message-ID: <sashiko-outbox-217716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:29:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D10

