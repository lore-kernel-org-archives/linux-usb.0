Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353580;
	b=Au7BDlg8erhwUIOiX7uiy64UQ4TK1wg2upBrJt+OFXniE0aE7eOk+u4hqrkdLaawAa06
	 I1kmRy2P9s7nECwOnAIlbpHUyx1nWDFIyuRZ0Zu0CDK9qpOfpd53aKN3bVk33AtDdKb3t
	 ND4ed8GDL7wWImTrKssCN2UESkM2cfs22Qn117iET0CkVwpA91KBkQQBX7PJu1QHTTO/m
	 /q30GXjpsbnP6AaWgOPhGlOgxllsvVJ8nvtFfAdjRqPwC6axI+Vjk0jkSKAEEuDmbbEYe
	 KfoFzyt7bTrZ+rpwdVJhbPzQ58DW58XksIElGtH4sXwoDRZMRhjRwlbys9newvyDpOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353580;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bh/1d58wr8LUQZsWYAWTLHBLHFaN9cEiFiph/klWbqc=;
	b=pxn8gmxx6GJGfrRtrkmfox+X7G8pePMg/6lyV/qDognxXaP7ipK5JA/g3dh0Va0V+8tv
	 fSS9x/OjmTwrZlL73md5HyF8zGRDhTW/L8MBKmf8rY5F3eFUoI2+pCWBNw9nYCNKfbmnJ
	 odLyNP3rPVmVZdXZBSuP91t7CrAnw6+QdCfSQnH1Pmw2r6CsbsPwHFAinAoceds6B682J
	 ikss3+8Ewar200TE0kV5mZvaNWIQ8CzYRZtJ/a41vtJdHiwRbW80CiVklIBVWb+oLEeO+
	 6qv8i4RW4WmGyq6JRe4JHAnpbEPtJSrQfX8XjMHr6W/9z/ixYZseWabBcoGrdMDvTyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zew22YtZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADFC606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zew22YtZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D3F1F0093C;
	Tue, 10 Nov 2026 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353580;
	bh=bh/1d58wr8LUQZsWYAWTLHBLHFaN9cEiFiph/klWbqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zew22YtZUMtSWwTOyTvTkYs2r4a+0RjlhLJ7/cZ6dGlNQl/J3If8rRhvXEIncm2/I
	 JiaObtJ8+bdtTWsVoTO3Xyk918hhF9KVVIs5sbUS+ryQ8fBLBamIWj7/kTXCg0CcH7
	 1p9Y4TGyJ3q8lzyeAcQEX3YNtdculWOwmCroSx1QmFJzIk+ehFsjyixEj+tOiVnfZn
	 BfSiAujXvtmg3XFf0mAdyiSk5hSxB9t7HRnjJmQP5NkX37In8PsZ9fxZs3p5nAzxCF
	 PRbYo9HK3paUJCJ/v0WXXddHrfXayJlt+iymQI4HHe6zjw72oSdatUqLjjqLVo54QX
	 LcWVtANR8EQGw==
Message-ID: <sashiko-outbox-207929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/22] usb: gadget: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-11-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-11-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:32:59 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D10

