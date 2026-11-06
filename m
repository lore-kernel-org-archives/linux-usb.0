Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958081;
	b=0k/gwQ/TRz76HFR6eV1U4DTQg4V5Ne0LWz6bTn4JH69o1YHpTZTP/UmTsWfIX84txuNV
	 v3mtXTDpub5eNJgtdMhED+nnlSdE+v129q8FjKUsthdA7ADDJO5alWpm+3k0umJd5n2qz
	 jDuQAmceFQ8cPtCv0cQzMcvoMM65phxj18Bnn2nKFeOFnGBwx+opg8gw+++UaezzB1tKN
	 pvVUq106RTFL64ZdSv9NbUJopffZKpSIDC0UfSeskuUA4AyeDDyeJtyTrnAJynix1bQz2
	 lUVvHBOduoqRg8R5M29g4IXfIoeX8mWeJZ6iIEfHd5Wne1cr3aL6KCs+yxtgdzAEVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6aXvJzfgdx7nDmfab2ykupEIjxJMpddUhyJeRrIzrCQ=;
	b=x/em14dMRZd8qpG5SW4ejR3qq3n0c0dzdHRYo3EfUbZjNWVum3UK4vxYgg0w4tU6fmQq
	 kppjbZKiXe3mUVElt56o9q33TBt3Y3MZFPs2pnkeEb48DIo5/TG82NE+EW6+YeQaOMLnJ
	 ab3Xin/PWru5ggxVAa4mPES/YmQJeTYr7kxkLXhN6xuXRpOMuie7025avdUZPFYN50Wpw
	 4TZgfGTTbb+kNtb3JjlK9wsFon/2YIRZsQU6pkaXPeQynlXJbCwapvc16P6FX6D17NpXB
	 AUMlgoZhv7jMJhWvHmoUIPX4sYI4Ye+CtB8Cf/5xaW/T7tIsusz7M0KPmTYNs3ezqxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtX+ku5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A69606C3F6
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtX+ku5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7100F1F0089F;
	Fri,  6 Nov 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958080;
	bh=6aXvJzfgdx7nDmfab2ykupEIjxJMpddUhyJeRrIzrCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LtX+ku5Hex4GqRMLhuhVF50LXtZtDJurmpHaVUX/oAdAmyOMnLRBAy+3kQIte2J0U
	 CukYDiXn6RrejH3VzImBWf5edQaNJP0l6/il+8ZMMhtuRLW/aU3FOX+Szpm5YnmeX/
	 NVvCh/FX3c5O/LGDOfT08pEc7MUuQJthWhy1sgsWyE8gu/fWipUojGKAFMTlSv8iXG
	 NZtm5qAQgavZ9RBboW9yQMcoKYCg6dn/2fYU37YcXwzEK2W9SAVpOEo6HNPfsRbLk6
	 2TE+B577iyI1UGotNwCFiCuFU5dwrf0f6zj+hLUT9AF0Uq+kRSq23oW7wBxDSvalDq
	 k2KqXArXY5uLw==
Message-ID: <sashiko-outbox-201140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/25] phy: metanoia: add USB2 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-22-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-22-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:41:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a minimal reset-only PHY provider for the Metanoia MT2824 USB2 PHY.
> It deasserts the PHY reset required by the DWC2 USB controller on init
> and asserts it again on exit.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D22

