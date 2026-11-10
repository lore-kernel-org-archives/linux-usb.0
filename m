Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293068;
	b=jmWagffdOhpIol2524UicGGK4TxyqO9Cj7d4bmZTczqprfgtnlK8uMWjnDoFIMQUjOWw
	 p/cfc5yhCkbXJl33Cnu4PyYCfxOZc8BTe+tbCH6tUI2w4VZs0KNtvusgR15UoYF5ubt6D
	 mXd4DzIpYEUJRET5TGoqkwGYMhQCTNIeqL7Y0yYYfw+giwiCfPC5JSbE3x1c3hY15nkgi
	 0kRvzxkFq4cv+E0+DbVMuB1ylfaMI3N9KSi7xjY02+Umq4Xi96cCGP7aXCej7svE8bavM
	 Ook81mUXJ+FNtsQjJcXq1jFVadiUy1AF+BHQGnlrhHvvHTvGWQ61oBMLD87tHFb2dow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293068;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OTV4PP6SkN7mP3dLEBxLB4pTufQZ9qN1QH/qMo2ny9w=;
	b=ZCUlTqvLxrG1zxDJ50wZSpOisWRUu2rJxJfsmawuNqnD41GlJqTIcEh+WCLwoPOXr/aN
	 R0433VyVPEahkrQPoWSPdcL3yBKzBaxIkxO+TFj7KifLsng+z/jZyrS8vL7w9tO2mRCnS
	 9Bog5RyB25BOsw6u1OVyLFEGsadbcZmlhRFrg+p/97FsqzHS+gqKpMXoAyzgrMgGO95ZD
	 4ToBHBFumqi2F1xtEf9XZK48qQlWj4tXVpqICbx90KXyFTJyeGzAaPQq6XtDqHeEjbqJL
	 VWTcytRD9ByagFfZ6r4T/Gu1LwahXIS9/v74uo5s4lRg4yorzfQT7w/U3Phad44GN7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrQMqzzK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372F606B1DA
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrQMqzzK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE7B1F0089F;
	Tue, 10 Nov 2026 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293067;
	bh=OTV4PP6SkN7mP3dLEBxLB4pTufQZ9qN1QH/qMo2ny9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HrQMqzzK2Y66D3tbtvEuHq8lPhKBnLSlACwOM4UEM3iH50YGBAdSO4TbxxEjiSpEd
	 nDkFzWWWkDgCNn6q4PIt3yWG5eukZpp3zaah+Do8iperGIeORFP53u04Fy3E5fzxe/
	 bH+vk0TAotO8HLvHPivDQIrfnXpLXqLn3AFUi2L/kE+zqYHTCXG7afeIGmL/iT1Y0b
	 8Y/t0emo1cYiE0T1ggJc8oJ5WNQGAu1f322/BqbzEi0eRn1OMB/1NpD6hwM4O/9qCJ
	 Te4smFj3kQh4ayVSz2/MVkjGND33KrYhp+GmMcOqIrf4Ox6cV3rzIz/d7G6jXgOwWF
	 RpN/BiyrffpfQ==
Message-ID: <sashiko-outbox-206434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/22] usb: core: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-7-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-7-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D6

