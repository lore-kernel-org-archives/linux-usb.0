Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B44772A8;
	Fri,  9 Oct 2026 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531314; cv=none; b=oXbJ8LVjsL+PL0O9oplkwL0dXYXaLZ4A364t7r6bzQkDVfxcAfXog2ZBy04sfEszB1CSJGe3c76187zlNNq3Gep2PofOjwJOAHFf4QP2CaGP6zJR0x+5aKmKtTja1DxzM8GHIbAlWYzBk7LLwDl0ujPUQ0T/QnyhsCnTuhkMf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531314; c=relaxed/simple;
	bh=6LGE7jmMaSe5h9TuOjFKg1kzwl3G/hd82vTvRitIjWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f4PSOqe82oOJUq5M9alaUArZqiAYhyDkapttA5AP/6lie87OSfFikihPNGnx7f6pta9S4Bj3xVo2gjD3Cr3LRqJwMuzcb0yzA2uVVCVcmEn7KMP3fzGtonMtcH5g4bqo2g28xxP77z8/kDIoKHXGh0elq1gVJBGEz64pXxPibbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4yTqub5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4yTqub5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8343B1F000FF;
	Fri,  9 Oct 2026 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531310;
	bh=6LGE7jmMaSe5h9TuOjFKg1kzwl3G/hd82vTvRitIjWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4yTqub55PhoTLu2E0asTSDytsEro9omJ65omPXyF5H2/FQSVLPwtwDrhwxOLizkA
	 wgieut5yAIYYE7Hj58dCNN+eGE1dfO8qXfkxARr3SnUSt2LLpeB5QlQggFL+xsqNRZ
	 2WKg5JHh4QwO9yGkYNgW8yyjS7vYnSxTv836uQ/EcE2RB5HgrFUJCqDHP4oHGKGNOJ
	 ddxDRoiR7sY0GlpIlyJ+wZGEBWNrmLyVQR2KUaBqPUKfqyZ7AjTx+gdwjhoX8YHRnQ
	 tDWX9No9GPefGTOOyoRJguzIO51T2+VbkhnA4tOpkbRNTGtKiVnmveHz0vvsChfKXQ
	 4h9wYf2+ZYifg==
Message-ID: <sashiko-outbox-165010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] riscv: dts: spacemit: enable USB2.0 controllers
 on OrangePi RV2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-7-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-7-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:35:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
> mode, its vbus output is controlled by gpio 126. And the usb2_1 is
> connected to the USB2.0 connector pins onboard.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D7

