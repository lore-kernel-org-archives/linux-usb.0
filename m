Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741125;
	b=4SY1eijM5aQ98dGJibE2XJ0vD5lE92zT8hI6en9XO2dM/vxNKrCaUHQwA73lae3DbfaV
	 KiH36AOuG2Sya0eF5NHdP19am8f5oYZnXeenh1WpAdQCeSZ51nGUwX10fhhghYJCigVvF
	 H1cUNwEEER98mIW7N+s1DDPXIYdL/6R6GFnA6Xr9gCaDjGKDAmePdSTRwGzexiBHE1Bk9
	 K1gXv9jI0nzYy2IfP4ikok8HEhvo1dtkOcxDUbO5loyCqQas3nSmo7fgjp1fULsCru/g9
	 k8LXdemQ4BtwzIh/83Bc29fbRh/p9lHZImMER7MfxaVvkAMAc+SUmIxf5oUlbRju2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BwfVwFy0opUQipkb3i/8d29qypmnrfFv8Jl48G6NS8I=;
	b=V4pA+rAHqGIQrLNLWzIgiriDgAdhzOLgEkdRDi0/WMmBATjkZoMvVBg5s9w9vto3qzdH
	 +83bEtNjMBJzncveTROfEZGsgg+ZrlchJ8vjPJhuIO9/iA6KENwd3qeZCtynwSw5AXELp
	 1iF8CMiSuITML7ZM9Vv2S+trYGoouHyMGKystwM/IG8ZPYeItSMd3fYr8nHU2UT8XpU/E
	 yGKaiGTFdvv4fRw+/SrFslfY+0dl8rDrNP4wr58IEWoHv8n5CqjZS1IO2GZ8d/c41R0f6
	 kD7GETy0vdDpNxk1temWvnmJam7JkCSn8pKjZP2vdFZPZHtoyQExWLoqBUuzqXYaptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8cppgS4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3C606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8cppgS4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7921F000C1;
	Tue,  3 Nov 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741125;
	bh=BwfVwFy0opUQipkb3i/8d29qypmnrfFv8Jl48G6NS8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j8cppgS4pEwHuIWVRWvRbQtRLWeUkylQec2Gupy9wouh/xAKAnjWL7kumRJMHb51o
	 EQa2n5qOGk5U02P7km3cPH+zSVoFwXpr0jyz0DtQLrc8UY4Of3BZfjQtdapWkAp1lQ
	 gH6I2vVFml1QcZbwAHZl9ihLXa3TfxdUq4J8K4a5yosUC7mJVm/6smKBjPPJwa2y1Y
	 yYU9+9D6yypB6IMZ5ulsRZUWtfpaj/AGotWjvDPElOv3koc5B23CVsXkbQPTjGBdwt
	 wayV/FppFY61Xviuu3dHssi2UFkWFOmhAOroZsUixV1IlW8pNFoI8TJK4GDdGYihi2
	 4e85XqDqJVwmg==
Message-ID: <sashiko-outbox-196053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] usb: gadget: f_uac2: avoid truncating calculated
 bandwidth
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103211434.996135-2-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
 <20261103211434.996135-2-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:25:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> get_max_bw_for_bint() calculates the required bandwidth using 32-bit
> arithmetic and stores the result in a u16. A result above U16_MAX
> is truncated before set_ep_max_packet_size_bint() compares it against
> the endpoint maximum. The truncated value can appear to fit, bypassing
> the clamp and warning and advertising a too-small wMaxPacketSize.
>=20
> Use u32 for the calculated value, the return type of
> get_max_bw_for_bint() and the caller's local variable, and print it
> with %u. A packet size above the endpoint maximum remains clamped
> before it is stored in the 16-bit wMaxPacketSize field.
>=20
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103211434.9961=
35-1-kaf@nwlink.com?part=3D1

