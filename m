Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378742;
	b=TLk2fngIkLVX/sLj3GLynvhPyyn7+5Yk/Y1PlN3hV73Hosy7EYeQN1GKPI9jKUiqnR6K
	 CpH9zuUeLFu6i0PxNyiZqGbCCNwXw5k/m6Rjd+Vm4GqQfw6/EPM43hNomZ7vPoqKbkjUN
	 t/aPbanlzPrjI7bo2fP2aYdv87/NIdrCo7QITpKma5Sxxeg+d415dU+/i+tzosG1EW2XS
	 lH1m1IB3X5Q2GYpZTmJ/wS7iKJg5KCs3RkN+tC1ZrwsNxbr5yBULQa8zBSxXGmawoeZ9u
	 8i3djQE1eKBbDdhlZ9itmgjN1JTPXW+VvzrXvCEhAkoUrUTxsIPDE9A7/pCV4zLMnSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378742;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZU/UqtQmZhBw16Y4tN7Mwl4xGa6Z4F5z2d3tLlAl2A4=;
	b=q8McqMz1Sq/fAp2OeNO4dj/yZokiPoO1YO6H0Uhwei0k90ayl8u/jvZfMAH7xuXMikGc
	 /v7Jj6LQb7fx3HplgC8oBBZDYo+6BdXoH6V78kLIepyCyadGchYM5zRs3mLGstFKIZJQN
	 Pw/TsjNBMf6TR+BN/CVkD8TrNuUcFvk2Vt+/wV1ONKdT10y0EFHh2zlhSPqyKn6FUUZsy
	 lf6a8UvWeydo31QetHKc+mSzcZdJSWFLwQNWzBwK+7s76Lq/PrC85h98G9GHBsHo+DJ1m
	 ViH7wNtRAZZqJQx19eW0BAyF2Ow2nVWc3QeXl9lDb9FnEkQKNbxuZUiV7oBhClIEkTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhqJ84+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CFA606A320
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhqJ84+h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379B81F00A05;
	Wed, 11 Nov 2026 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794378742;
	bh=ZU/UqtQmZhBw16Y4tN7Mwl4xGa6Z4F5z2d3tLlAl2A4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhqJ84+hduST98D8RLN/mCsUHkHB2GCEjsvfpZWLc9oU3VK1kJAv+1DOFzCiDJkEj
	 jmo3hTrABvyENn/4xX13tpVERF82g21fmcSWNWWdByxOKu64A2jyyKzlTNoK/o1ewc
	 TleX1ScDTUkI1fvjHZHjCBdLv6CxGxmGlHmvn+yZ4nSehM1SsZ3zPxFt+IuZA/MOVo
	 XVm/rFFhDR4do0rsdtaYtyigxmBuXUW/j/pAKO8ISZAEJJ3xssouQzLi2Hd+qCd5qj
	 XiEz7a03W2p6idIqSG3zkiBiUgmT+VaK61VChKfBawCuCybMLj8BaNJzsUVEpO+ndS
	 3Nx7qHz9wBCPw==
Message-ID: <sashiko-outbox-208443@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbmon: mark concurrent accesses to the monitored
 flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111062752.16802-1-zhujun2@cmss.chinamobile.com>
References: <20261111062752.16802-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:32:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> USB submission and completion paths read bus->monitored without taking
> mon_lock or the monitor bus lock. Adding and removing readers changes the
> flag under those locks, so the plain accesses race, as reported by KCSAN.
>=20
> Use READ_ONCE() for the fast-path checks and WRITE_ONCE() for the updates.
> The monitor callbacks still serialize access to their reader lists using
> the existing bus locks.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111062752.1680=
2-1-zhujun2@cmss.chinamobile.com?part=3D1

