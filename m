Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185043;
	b=DU7X3j1uX+1tO9TQPnmQy6wbJwVOlg0sYIbE8H4WxfGyw4WQlMPY6Vv8A+ZoIWLGxzhY
	 dkMr7k/u+vgJpebMVbRjSMqwNvvqh2pgYy0HQpQ+IxBVl6ZvQgcWnuWSLcsQsd4XIhceW
	 hXLKwm0Oh8afBDjTvMRT+1Dms1me+Vojc912dvx1c1+vY7/ZWlcUEHFM+ZS/dcAhtYUp/
	 tOcLMPbLZyq9+FcmPG275KhrKUMTmi+qVrFKUOpUHMek/BpHU6kxD03beZIpI+oAmi1CY
	 agC/d178g3irCfl+CUHpBplsWUuPaU4/sMUL4GSroUyk20IUeBxbqDKArZL6Ux73Klw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185043;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aj3emzS/ULQmcfGid2KxL/IqfTBrfF8UP6CSM6DzFW4=;
	b=YOjCjMvKplTDJMP9kP1GyVEWQdZ6G54IZOpCcowuO2hZH6UqO6jR61pD03LMhGuVOoXx
	 +28TGVmr/rXJExhlvaS3+FjRHXzHqlXNcbdsOctrK0E2+SMNb5+7NMm6yLJQ1FHB18JVI
	 jWDJWg3BfWS8A+l48ZGK8drvFQpmM1gXQ7HNScPavUFDOTXWYYBOUJtMeeimR6V4enWnP
	 ETi1BfxLLGGyLCfg29ZNMbHiS3hWnbFgDxVQdHu85vDAdk3fDBKlnZOKX+9kC7HvXU18J
	 R/j88EiwSvqN6JdvtZnKKxKlMRLZALBznlISBp9igKvXpyn/BRwRNsrsDcbyzzeIfFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJxh45YI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A4606A31C;
	Mon,  9 Nov 2026 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJxh45YI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1BA1F0089F;
	Mon,  9 Nov 2026 00:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185042;
	bh=aj3emzS/ULQmcfGid2KxL/IqfTBrfF8UP6CSM6DzFW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJxh45YIAqK9SIg564X0Kr9G31OMyz4wsku0b8q9khD2DCMm8BUMp44whxI81sDv/
	 M+J8Xiehax+BDsJY2Enyhq2Q417Cm3510xN/7CkaXEd7v+jsiS7LVnmUuTfSAzH0H1
	 g2xZlUjLEnFM3RrnUbbiBJp16/rh5vzqH9G1wNW8NOPV+eAxTSqSHAjlnYH1WSmVHT
	 cObx6L4OsU913Q6M8xfJKhtX50MNBUCvJuiKWkjMg9gztb/vyWdVeOfRI6TNoFTYql
	 krtFvI3n6i4u3xId5Cdwfv5qTQmbAwmCUwgssZdQhclRAxBmfBUnU/L3oqn5F5MzLI
	 6qy7+z/XPYyoA==
Message-ID: <sashiko-outbox-204248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:44:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Inline Crypto Engine on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D11

