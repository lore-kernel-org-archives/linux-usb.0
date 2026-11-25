Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579128;
	b=qDjMhe7JoKXvBcgkI79qi1L4xlhssdIDKvMowMonhnXM6g5nnuUsOYNc5YQTd34TXXWQ
	 0G4+vnbIRC8hRz57MiM65UG7W7j7SquQriz0COcyMDDL9ga//q21OxHthKh1T/jPXQwHZ
	 VkdlbIDMa19XUsWZFgR/voQ32SdjDSk+wQzuoL/ZRMhHiGD3PQtHcp+Mv+RQjCdAMJKxV
	 LYiWFIWw67OrZUqjBz/LA+lmUs9uRpAi8HfjQi3q6Bjt8/o90UCnofzT4eOMTO9F7PJgh
	 +/digsK1XXv0XGveMAmCSv2J+vdAiHqgJHHMkAjuZZIzAYJA39pOofj44lVJO3E3Iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579128;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2klLT1Ea81TRcptAtBcc1nz27W4K/KtipsQzEqpE208=;
	b=1GDOEUT5UZIBE+5kGP7Ba+83FTT/lKQKhXXlaim+gsvuMlu5Qsr4ZcCm5aTAwgNzk8Eu
	 rl/7GYT3H8VWYGtlIQlQlq1WbqBdf+PJsy2oHKd5+Sd7AxwOkEdhSVyzNxP/2Bp6y5FbY
	 EozBm+tIkg+bOFUbtKm+aEXXgXVn0fk+NGJn/fEnsoaH20slVAw/yWFDSQGStPYdo0uTv
	 8kyOtgkGbVk91rVLJPLeFEvgE/kRxWT6g7KWqZi61pOgR7RlxELKUC/1D7AKmqQZ2e3Mj
	 yz/AGgbpQ/0nXyM7WnTRaOEsMkz3QssilKSJbr4hP9TflkXUzgbllVr716XCu23LPSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWi4oAZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D1606A332
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWi4oAZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1D01F000C4;
	Wed, 25 Nov 2026 03:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795579127;
	bh=2klLT1Ea81TRcptAtBcc1nz27W4K/KtipsQzEqpE208=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FWi4oAZsDlZo9WzVuzY2XN7owb+FncGuKNS1AsOiBGjz0JERCpKcNxtpfO0TDaj3f
	 /R18sAIFW8Wl3EGdjZy/APZKfSRDgr66JNc8UpttiTyLaQUj7kmUNWr3Kl01ZXmzjT
	 viiecuc2jt8GfftfBcv6etUly1dqFp1HHmI6q2wyrZQMf+7R/3apXMyF3R+uFp1K2E
	 Z0NTVBDfTiUhH2zFyClHC+nIAY+9aFiXHdG6IlvCR5g1wYf0n1aCVZoDw3nBtLGK7R
	 iO8PkF7Zc8aY7eqfeGbiXoqOaISdncJfMCImLkbQPqMot8/nCji51xcp8rQgIdJ2lb
	 dlDrzOYC2KHNw==
Message-ID: <sashiko-outbox-232542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 00/14] Add initial support for Qualcomm Halliday and
 Samsung Galaxy XR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 03:58:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 14-patch series:

- Patches 1-12 and 14: no issues found.
- Patch 13 ("arm64: dts: qcom: Add initial Halliday dtsi"): 2 potential
  issues (2 Low)

A detailed review has been sent as a separate reply to patch 13.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-halliday-d=
ts-v3-0-5c8311c0b70b@gmail.com
