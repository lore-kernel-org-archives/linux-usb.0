Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579820;
	b=P9cQC05wbySlt8lPJwCpzcGyj1Fj9NezWjy0DCWl16ovB94937aBAxafsx8jISQU+jfh
	 eWSGCAiE9XDjh50OsAzaemjxM/IlDNxKrPngNt91oxn+0a5eVUSbHkGwdIO0oSBfftXHa
	 5nuLfeP2vi7khm90UPCsJZF+6vNJkksgKdBeW41HjnCP3z654uenO0JLiXVBAXM2kA4bd
	 v71OGdx55yfA+BV2NiKBGUOoH+QcJhoyFS53nZXvUHj7ziIhJYG9HsOjQQsBS800T74Qb
	 y4JnioADqz+eMVvvwXUhHsW4I3kItWV3PHvrcTCXxzDglA4K5Lus+Td9QylKKOqNREg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UxUimKjcc7JXPHKa63DmAX6AnfOnx7e/8ffIBVucSCY=;
	b=nlJwqvs0bRmSayv+ZxjEFIpqIXZHwizocogZrvh6eku4kwp4k3ituP1pL2i+lf8/pvEr
	 qLD/QFI7NyojKe4ZKB2ylkp29Va06M6gOXTRZiRqGylJOGgIVXYLgBoMudcdP/jDGGtqb
	 4Z9GdRuZA9p25PGQfJOWwGZfRgOEFDDPf8VpADCByGyc46CpFkMmOexQCvPiMsuphT7WB
	 b3oRpdS7UGa0onL0B3FKiB8MgrEa4WFBJgm41NSU0n6n0y0F61EnaZ9ZDKlGvIGjim9ny
	 gfbe1Nj/ilm4uiw1uBdY5TWTJbt1/yhlSzauqZ/UzPCN6Zy4y9pqz1oGOTIixq98sFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFwGVmzh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7ED606A327
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFwGVmzh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08FC1F000CD;
	Wed, 21 Oct 2026 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579820;
	bh=UxUimKjcc7JXPHKa63DmAX6AnfOnx7e/8ffIBVucSCY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=fFwGVmzhPK9tP74qi9qiOwx+sHguIM8KEAQU6HdfjVRPDISJfRoWji0nK2XB74Qth
	 bx6kMvJHE46D0vk3qB2ACSxCoxchZsC5ZtJH64Jy6wQY9wbO/DTGDx81q6lu0czrE+
	 9nHAzggaku7TAULR0MeWTvwwcfdmj9KlMpmgXiXfVxwMKT5j1H8xhtqbnl1KQgrjBs
	 A+yRvHXilyenVqdsCxFr6n7KGR84PiYM4K0EplUvx089JQxvoQ9oSKrtg8VqIlKen5
	 3E6G5AVz4o9M0ZMmURHA3+seJb8gcf1i/hxU3eW9munkys23HjgDObxLkyKfMXuDUI
	 QWwdwWJhEYZOQ==
Message-ID: <sashiko-outbox-180121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: dwc2: initialize debugfs command buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261021104720.4106961-2-yaojiale02@163.com>
References: <20261021104720.4106961-1-yaojiale02@163.com>
 <20261021104720.4106961-2-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:50:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> testmode_write() copies user input into an uninitialized stack buffer
> and compares fixed command lengths. A short write matching a command
> prefix can make strncmp() inspect bytes that were not initialized.
>=20
> Zero-initialize the buffer so the copied input is always terminated.
>=20
> Fixes: f91eea447ac3 ("usb: dwc2: move debugfs code to a separate file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021104720.4106=
961-1-yaojiale02@163.com?part=3D1

