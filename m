Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778630;
	b=yeZrWGiQ6vu2cjM/T8JcIbwHMt2prVtMkag5fZDjKPk1jAEV0dPb/PnJuQtPiAOFCxdn
	 vseIBFJXl/tJ9o4zAC5y8J3joa8ktpa3FuRLmIjwjjO6dmXPX58DlfhliF3ii6Uwm6bz7
	 vdVENtf5idb8US675KRx4UcYaSwuPlRZCx3PeWDynOa6ury4Z9YOkkO/6hchb2buoK+mP
	 YcwFajrc3c1li2Scad+yWB0xlR+IDKv8DlsU6gIkg+EUU220LELU6Nd+ZSscOlZIxQmhS
	 A6nZMjpphR3SUNJI5ILAZkOeC1LhsUJksOy19hIVLi9Kkyn88USfjaUJ/9JeQfbDWtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZQd3Qiz/jmFo9PlHrp7EsMRO4Rp/8Mfn3Sx6P/4aWTc=;
	b=1lj7KwZGUpj4NbUjyMIFH+7CqppwcDbGhbDRqmWsJ0xalVQyLeq0k5cTws3zG1TmyXTZ
	 6LWAjh7+E9QpuB1v+fBG8mrYOGeP1xsku9GO/W4hCT/f18saybbqGJE0kLWSfaOL5DBUQ
	 HYNsEVLH7R1Z14FtexGVpmom7R6y7Vm9r7qp8xLONuhwFyZcImb/IkOWJYeZ6rb8cJWwn
	 5xxDlLUt8tYa58723bZ0FsOLwYCltRfFGNDc7pacH0t+2A13BYFz/tVWnjpZ3GGYoKfZO
	 upZiKXvtE1qRbsSJ5DU+dZFAaUFsxLY4xsExiSC7t3Ywc+q94QsYSwv6rc3Pz/UvHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc+vUUxC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02A606A32F
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc+vUUxC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102A21F00A02;
	Wed,  4 Nov 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778630;
	bh=ZQd3Qiz/jmFo9PlHrp7EsMRO4Rp/8Mfn3Sx6P/4aWTc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=hc+vUUxCvM3x9a8t4Muof1ZRsDZQDgOf4H0OQJ8F7rdQG953m4BQ12NrwyQwOH9QK
	 vI8kIZhKQhAPbyAI8KMDZgj3o2ed9/uT34D80j8Dbuw2xB5iX8FXPAT96iHmDYHc65
	 3AH6ELwlXRj/EHzOYIu7uahwVoldTvflW/w/sth+JP2e1hbX8TT30N3HzvEgdDUyie
	 wn7j4Zae0ImrJrLrC6mWLywvJMIp5dto2o5UqRVhIqawdbVIJfREMOFiZBJfZ3C5Xt
	 C2x1wZpjySbsWQh4U0EpuIAzBQEjR8Ymv5xsryUMeXI+mZDzaQJx+gB/vrbVwZeCWs
	 lt+Nafd74Q7ug==
Message-ID: <sashiko-outbox-196831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: ti,tusb1046: document HPD_IN
 override
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261104074202.76712-2-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
 <20261104074202.76712-2-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:50:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> For boards where HPD_IN is not asserted by hardware, the TUSB1046
> can force it high over I2C using the HPDIN_OVERRIDE bit in the
> General register (0x0A).
>=20
> Document the optional ti,hpd-in-override property to force HPD_IN
> high when DisplayPort mode is selected.
>=20
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104074202.7671=
2-1-blfizzyy@gmail.com?part=3D1

