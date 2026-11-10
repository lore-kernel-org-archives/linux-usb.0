Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293101;
	b=HYpWb/7N+yyeaXz6ga2RK4Mc+I6VwTjjRfVsvPPWS8TIGsuoF+UDOyLmkSWPAtLudI4h
	 z8HLOAV55E2Atr0HCM+vf/xZHTqxKZaamN3Ruy3fQbeKV9aQJhaLpBLQT+NXoUg1i9NvO
	 s9RcHcFLr5oxoOFImDvTyssdxChtz5z+9wqBtQGgWMWTv0u01cfc//KNgPYVDWNnqRI1t
	 dYlZb7yF+HV/H7b6UHCwCo6mTRiDoDa6+uZ8gK6OIIlv9uELtyE7+sFjeVjZ6SU5JxQxz
	 YyPpO6HzOQiT3rjyruKBmkOswbaGlpQdMATi21+worVHZdWN950nPxHKL06Rd6W8YXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293101;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RCEO6dS8JVv6qGMPEEhV0CrwdYucxnzedvrv9oS/sa0=;
	b=aPLAsB+ejhxEBbFZcuqmbHQB8xohM995pIv/owWPAyGHs0wIA6kn/TgE7LQImZ3kMJPA
	 twkwh3zVj7Kq/v23hXPmWutKBexdPb6AIl+jzLtDzyegdz6vlCMAn5HuXLCasmUqXe3ui
	 pbOJ0WtYfYgZ9hP4zM7zeP6qYkkK6XUAAnyhgDhjB2qmdDhEUTUSjYnJvgEJw6YDr+nRu
	 MTsYKkphHBklo51tOr4HkYCByAPPj5Imtb90zdYR7X8Rew5KTbC16PJZlUcUpEYE7EzC1
	 a7NMikrVGJhRypirLDT6KiQGqmBo8Ykcz4N6pBBcH8lEb9y3jgXwKXPl5fOxn9sOuUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR5Sy0q+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E6606BD58
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR5Sy0q+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9886A1F008A1;
	Tue, 10 Nov 2026 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293100;
	bh=RCEO6dS8JVv6qGMPEEhV0CrwdYucxnzedvrv9oS/sa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TR5Sy0q+CHQ7AJUKf8zyrVN5X8U87Lq/r97wkL6xVbVN31xqxT6kUjs1WHBwREgZx
	 0enu+CgdUUDjdD3fk/04EPTcN2ueZgG79gpr+nXQg7ijybfmFP3XXK79vrZJaYhjLC
	 +yXNo5KyLzKJyH6Yd7zqSJbD1aI1yrtQ3e/E64TNn0vgF7WEh/09enxyjAnx22DAdx
	 DSQ/YYvzEiXmfa18aYqoWJBQu+IltPEXYWEiRqfFHgjt3U/3ke+0L3LC8rY5qDgK2h
	 Yv0luqVm/R3JjcLJOOlzAuLk38YEDOxgrH2YvCpTIBLFPkXoKwCA0PT50Ip3Z9Proq
	 BDxJFm2Jqr/FA==
Message-ID: <sashiko-outbox-206439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/22] usb: serial: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-20-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-20-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:45:00 +0000
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
5-1-shishunbo@cmss.chinamobile.com?part=3D19

