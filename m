Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098571;
	b=TSYjpPxVjI5mrvQ6EsjrENKTj2d3CHF2lj0c/qQ+Zx4g95YETUN5AIbn77S3R6zWD0g3
	 m5EqRRq73SQPcB3jqu6x1MBYAWMcXvUg0bH2toR06xmONbgBksSFSAB6V7J5N0VNtErja
	 3FimUHS3Q6g3RzgXHQVRwkYO5faWveIA+oH47paBkPDJhpqY0B5KlEl2DG+3Q3T7mII97
	 uceItu6urahwSYsCqLnHBuIWp4wsLZR3K6FtQVbsweyvLOY3QBIGYCRm3bKwxS4AwTtjl
	 FOarbWd9J/YcY9AoS3pb2VSzULtWHkTyQ4T/rtNvrg659WHgA5riF1PWOEzCLqG507g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098571;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=com+rstX9vaGA46nx6fEcNJL/C2tWrmh0MUAEs4lLmg=;
	b=bpSAMHPtYDUY8Usrkech/0TSc/niulGe2F+jLH/08aWk3y/C7Ro8QbC5X1hqyrNvnm7D
	 xT8LR1CY3X+dKwEIC2PMzUyUGVqafhIWjcb5mJWS1XaJ14Fp+5Bdcjz+VDWH5cdoVKzZo
	 F89s2uGOjpH7Z0Pj9KcCZUv0f1INUmR6hS+DJAshAoscvKgrT7LEcqiLbRzzx9zs8zLVm
	 7wYHJQWNv0PQADndra9qb+Jjyn+iXg44ZShSyCXGwMQbLfpa8lLLxglheYZTLlJ1jJAfk
	 lP4Ab72GLEDepZj0RkmLWw6OalsAl+uUMp5Non5ZqeAVyRYkjyDAgKgJwXUjJCSTLVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrbcPhNy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453C606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrbcPhNy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D7A1F000C4;
	Thu, 19 Nov 2026 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098571;
	bh=com+rstX9vaGA46nx6fEcNJL/C2tWrmh0MUAEs4lLmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrbcPhNywrroKGy2GVZaoMJeBcDc+6PGrpbhMWb49u9V7FE4Ik6uVd5Y2Cre5PqnT
	 PiNQXk+aoCNmXwjW7FJWV0gdvt4KDzy568KiqYybk3NkbiuQQkJ2SYEUk5X3nnvI/E
	 PegrlepmX3PALR47mwzlgsgssZiXdNQYYPTicDK+FIilwjSojdpsjxJVusxMyQi7aE
	 OquNe2joiR+ihgZCIEvyN3FZOPoHXgWGxNLEypH6lJxY8h6kqmFYBOj1to9/w3R2MP
	 NkFjYQUCXmzkbA/gCIwwHp5eo5CUYtAo2BgDVXI9GcNQm7IbFI3Sm4x6Xg+NIbFFJH
	 cHl1kzh16bYmw==
Message-ID: <sashiko-outbox-223302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: Don't print port status error for full-speed
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Jatczak" <jjatczak@antmicro.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-usbip-fix-v1-1-e6c04690115d@antmicro.com>
References: <20261119-usbip-fix-v1-1-e6c04690115d@antmicro.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 14:29:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usbip: missing Fixes: trailer for USB_SPEED_FULL check in
  vhci_hub_control()
--

commit 327e8e6dfc01df8db046632ae205e6b5cd1a782a
Author: Zee Yudenko <zyudenko@internships.antmicro.com>

> usbip: Don't print port status error for full-speed devices
>
> When getting port status for USBIP, we only check for high- and low-speed
> settings, but not for the full-speed, which causes an 'vhci_device speed
> not set' error to be printed whenever a full-speed device is attached. A
> full-speed device is the default status, so we don't need to set any port
> status bits.
>
> Signed-off-by: Zee Yudenko <zyudenko@internships.antmicro.com>
> Signed-off-by: Jakub Jatczak <jjatczak@antmicro.com>

[Severity: Low]
This fixes the speed check in vhci_hub_control() where the default case
was changed to log an error without handling USB_SPEED_FULL.  Should this
include a Fixes tag?

  Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-usbip-fix-=
v1-1-e6c04690115d@antmicro.com?part=3D1
