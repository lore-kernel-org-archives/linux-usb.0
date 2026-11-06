Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957881;
	b=YZem39OaX2GJtd2NmMBrrReRLamgJxjWaSpdn/csOepLha+mXFTIgCizmAuop3aDt8c9
	 Z9vS2xE3+5W8URrsSU/Hze0SHV7CywBiX4g3Ip4ZZ5JVyo4u6thV8Xmgs7m8ogzVNrC0a
	 yayyIEDrrk8DStdUHpN3G83KOabJS9VTII4HDip+AynfcnfYK3vO1XHs25zScXoE07G99
	 mtAmlNxnLyOXET5ZmYmBZXZ0IwY9pLEkcboXCJTC7GrMWI5QIVKfBEeqK/NvALwcKR81p
	 8jNRtmrh/FRc3+67NdFQVV1QjputxNOjXG17mnG8GPBDpmN1h9PHNwIHAZjWpgJc7IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4hmEP7hbMFUACOQnhmB5+gluHr/2LJzh7JCVpRZr3jI=;
	b=LSSHfapEDerD+bDlewVMSBFvbjyazLs469lvYXtvbOPKFqPnY84N69+HBf9HIN0ZBGRR
	 zmtQxk+tviDQ/v7aAZ+3LcSSrOiC9loOQsJYP/jcJ3ZgcM3cGDkJMLtBTzz/mjh4FU7CT
	 NMqrqBsinV3r1cuJxrWA+iSP884RoFPMpVkusEsRiYPR9C46u4xa7joBP9BK2whz1VliE
	 8jg0CBFrfmQcnu6JQkjK3O55SMzG9rvbBvH3r/shqjsDbQbnpM6W9UNGLdczA56/bWpns
	 vA6ENA9MC2wtJIwwp/U85+ORqMi86dTPjTcKi9W2u952NsrP7sm0RY87tZVC/9rCphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7qOx0CZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C493B606D803
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7qOx0CZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C94B1F008A1;
	Fri,  6 Nov 2026 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957880;
	bh=4hmEP7hbMFUACOQnhmB5+gluHr/2LJzh7JCVpRZr3jI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7qOx0CZGxjOxAJfKDfeg0dd79h7/ae+ePpCuuY5Vzs+SpRqVGF8xROY40AdsF3HP
	 FdZ7cSzXJA9ptoZtJJETB7mflcSsNfRiZbucPX8XhGBgKZiLMmB9rc8z9NJkdHkNXt
	 WcUiRg3fojsF+uGy0xyzoXw4uhFZUyFvhKYGwKZyvP1Y9lwxS2UFebGezwOdfN++Ss
	 v7TIQR/aerp0/O8AeoTKcQxyBtHSLePrMzf4o2HMWD1VQnwzR2vm8d+eYqtQGQmnkV
	 FwZmetR572FxuW8DeAgUQ8RHo1NoDr5fMjipR1AhwU9ka2+eGWMflEZ+jQjePlSJzM
	 VadWOQVjeJxHA==
Message-ID: <sashiko-outbox-201135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/25] riscv: add ARCH_METANOIA Kconfig entry
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-15-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-15-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:38:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for Metanoia RISC-V SoCs such as the MT2824. The Metanoia
> MT2824 is built around Andes AX45MP cores, so select the Andes errata
> workarounds.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D15

