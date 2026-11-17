Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919740;
	b=YuRnxUlJBuL1HRsTKZ3rXlwMo4ewTsdtW3X7wG/7uVQqniI0EWApm+x6/66WXnCfz8tN
	 zPpzDL8bFPn/ujuB4ogKOl9GRTlKIOOXP6OlkTBSRNQS6sWHIkpIDKCsXTwRyOX2gGVOa
	 5HdJ5GC8TrXG+o5lvPEb5pMjDAkR/i6lkpZILU5o1EYwVQ+PxMBreBCAeHSK6P0H0m3IL
	 fcXvNPDAF/rrZYEvQHfG3qO/xL2oqo/4HP4SI4BuJpJqD97c9IPeoyDxqEFBY7eMmXdpy
	 o8MFJ0rRGOIQNnIcFaBUjJD1E0H82/v682tpUbMvz7Slyg3UHgKNVmJF0+Qko+QE+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919740;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5SNlR7Y5JmYAWxqfQcV4lEWRR1OiYuHX+zz3jK4LMhg=;
	b=3vCB8012kx7474RQTCq+llexgeW1EwdWs3klzcrQxXq4MWHh7Hd5mmrWR41JCxyumfT/
	 D7PETkQ+AfZTZJ/cBxDsefafp4X4mtuYBtWLbTt7/UZjJnl9jJuu3VughczgQ0Zna5Wnd
	 QlUcas6FJToTyY3NPwiUgObbvVtDAn7oYT7SG/uwzItolej5RkFuPfI+Em6pC/jcGXEXe
	 5UVmlYJLzOaob8WPK3g9fAga4l3VHrKi0QWqrvz1LaB/Czm3vh62ybMHEryGuctNzwBEh
	 TZI2yecCfyOLa5Y/XLYfoh34K2yP4YJNjMURm/4Foa0ln9MqiHc3R/EMolIg5r5Z7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8ef1SIH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8747D606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8ef1SIH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E861F000C4;
	Tue, 17 Nov 2026 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919740;
	bh=5SNlR7Y5JmYAWxqfQcV4lEWRR1OiYuHX+zz3jK4LMhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P8ef1SIHVsHrCl+tUiQacWy00RHL5lIP/uXT0ipDF+es1rpNmExDoeSbfHV3v7tq9
	 jM25nSCE1Jrs/M/hC5/PZ9XcTJw6uyuk71tvaI6hUgGR9YeNxQeqWvia4umyvbcUEs
	 KOhlAm3zwQfoO7uygW8VyEfGK521oqq3aZdjI8iPUyAMX8PmED3vf2hRvI0Vh4kkCL
	 nPWegFt87DL7N0RASnOa4S/4tsB1sqYHkrJD9IrqpE+a2QsQPNSpAUDQuZtDOITGxH
	 8BsADpfAePmNXmLPoWNsvFpOQLK5glotiNl8gwepAmwKp/Ny0Ym0+FFjob54wKeVxW
	 LOYADTgcZHhwA==
Message-ID: <sashiko-outbox-218794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-9-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-9-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:48:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY
> as module to support USB2.0 controllers on the SpacemiT K1
> SoC. The _UDC and _HOST are bools that decide which roles are
> support.
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D9

