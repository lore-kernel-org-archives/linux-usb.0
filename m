Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353378;
	b=21wCnj37MWOZVlJb05AJBt2Are1EBnXpVd+k6e0HAhHWU1CWtEgcU/+btTblgyGzXAcQ
	 X8fGuBNevLk9h8bWYr7vypI9QoANPFg3wNRv6aZoaytgs2DVFnLXG81s8b/QtGBKY5De9
	 Wi0zQJPCe/PqM54A4Oir+N9KSxsLA1dFt+xffg52nfA3UjZoHEq2S8i01394Brlnyo6Dd
	 dqTHYf+vE7yxfES/eoms82BQ1Pe8qyUwXYFicewH9SjGn4H+8lk36ZpReeggCSbJsLq8Q
	 FqGnx55hYMphcfV1lDEbzuD38CtlpeOk26dV7H+HZqlzkz6blVyROvIbbWPFAWUKmdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353378;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8uTa57QrLUZIYv+aCkNQf+/7dukLIiXqSVvuzYAIwP4=;
	b=qQMGjFNKaalPStujRk+C+Ob98DEwbDM16H2Sj+CW05iDBZpsIHUxq31522VvXf7RV05n
	 UtWYWElgduy0gi1Vu7w+hhnzm5BJ5PtXuN0vtOHZF8jZRDUTQuoOrvVv6P4ckUNBCg75Z
	 7sOpv2UHN/zpj9FbHmt5bDybjJiIuzx/VvaIv52+NoD0MEQeRdFiRqyIRkv8iuhq5+QpF
	 fkfskgLnVWOMvXoW5tzcs9VQ9zQiu2HSZ1SnszSXGn+T2jM6M0DMuBX4/y793RcMpfMj/
	 2Pkhv+GjySDa85/4jr0pO325Pw3jt7t89VYr7+8Xt9JHTDLfT6ICTk1gVB/wjvX5dyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSibbDkC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE83606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSibbDkC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6004D1F0093E;
	Tue, 10 Nov 2026 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353378;
	bh=8uTa57QrLUZIYv+aCkNQf+/7dukLIiXqSVvuzYAIwP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSibbDkC+WBoD7SiGcgPUW5bRDT1q5cyPA0cqWsiRYMsAS8TNNicHc803tcxKsoAM
	 c7u17W1yj7j25EBtcsrTgGIpCNyFtnNrcblpaMGvIJXJCmUMJM7u1BDdmIFCi8aOu8
	 4/ENaTgjceWJao3ZMwckgBLbipf7VlXZUXtMpDlyhbcvaQiy5a1jFuUssApWUpJqM+
	 kAKUK/LY5ZYc0FCGReAdKTgMLGlxrZFEVRmya1+HPMLtTg3j0JR/S5pAjLQPsc9nZe
	 KSjjUW/A9OxyaTSHBhhlgV4spQYp/nbZ8GSBaxdsEOzMPN1u/LCcwXQ2aUANrcdz4Q
	 4LCdcsElZX9Og==
Message-ID: <sashiko-outbox-207913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/22] usb: atm: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-2-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:29:37 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D1

