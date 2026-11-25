Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616325;
	b=obOwMUVDWtbGICgfgYNdaMNLsJDyLQS9Q2WT3plUP0q4yxTPMm87lSrHzYPGz6Gwv7QK
	 ZbALEiV6rUU8GcMkTVLYJvk5gjakIoIKD2me8kcOYFoyk6KThvFJEU+ta7L+mGI3wPoSZ
	 2j2q3WsYZM18uJUwAQZlulDj8vZe/WsLccsxgXRlaK1CeGuiQ/RWN4DNiVyaV+A+hULFH
	 eMpJ9kcTgb6goIR94cPm/WjpRkmfs+Gyuch5TNvDO5mLJvpIl3pbDHyoBBblULwhAJwrI
	 1vauaE/9PmdJCOblIiVbOGHucx8Q7UvzdLd4yl1SV+seIxh68h5BVsNevEBj9gJ5r3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=caTn990Xem//D/rTS3gZDu77oaeupVvkz75uHxtAfrQ=;
	b=5RIi/LS4dWswxv8kZrZeStRsEBmG3j79kAQvWFJG+h2T+6DhZk5qtlf46/KIrQ3r33gV
	 vSFisc5dTquKrJSoaEipZp0Txay13EqlI91cSXgL8Lt5U9TTeGyfjcF9S6Lxdv28tZbfo
	 /mFdJzz1CndHCEzwxAyBIZ9NqpWJxQvXcgRJ5HCVYd4DiHmGajl8O4GfLoHEO0xI70V8G
	 fN2APixS4EQo/yVwvj2azvBE1yy+2vzB60aRKgm/e5LVCPu8uaG9NjhKcDph3+Pf3RaX+
	 CWgO3A+KQRDbho3IO6+KQSIKzb9O6GhjYOKiPAGRs9SnnZpDXk/gRf0zZ8nETZuRUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVo4xnAM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD9606A32E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVo4xnAM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245451F000C0;
	Wed, 25 Nov 2026 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795616325;
	bh=caTn990Xem//D/rTS3gZDu77oaeupVvkz75uHxtAfrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVo4xnAMXP2+s2ibxcjfa4nsajphYrZWYYpmyTK7yCvAvcWMwLBnP5ySkxucKdpm0
	 2Jnn5JIHQlbDJppPI4UjvnUztA38ab5lgGfo9uMujMyE2PNaK26c+mMebANohI12WE
	 48ErIlgmIKSxH4cs7Gprm2PQA+/yORmoLQhiahZ9xmGYI9ITgnojQB4uQG4Df/HkX3
	 wnL6rpHN573wkCVmJWzBr1ZOof3CDQ84kfVTPDvET41ovdWoFgLwjObp8t13ekYfDU
	 PVecZylBgQ4I5qgNmXHrDdNRN0evsXdjq8tlDBU8wn1ldUFIvQlWq1XPG5iUlnJ5JZ
	 G2spCyDFbIECg==
Message-ID: <sashiko-outbox-233547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/3] usb/phy: sunxi: Assert reset before deasserting
 on init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bobek Brzeczyszczykiewicz" <admin@roadbobek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
References: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 14:18:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-usb-sunxi-=
reset-fix-v3-0-855c43694f78@roadbobek.com
