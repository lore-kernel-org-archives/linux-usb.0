Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353532;
	b=z6cWgjQkGGa7OeFSmshHPgyiFnXhQI/RNk0iEGoZLUIXCy27HRND82cDb+FGYs7reHrU
	 fF5qQ0pD+BFlmW8UfnozVlakc02KO1r4RNPBK9Qe3l9ryHnZvLFj7UjBCQtsfgTdvsIYk
	 Qk9kOP9R6Rl+e9nn+sy1y8PXyISy0Yi7CHg9PEvzIvXdUqbxoXs4sNT0iUy/dxttuyBpe
	 DubL7m8kGGxKezPkIdSH65qW70jTwSkIm2AbdS75UH+zm5W9v7Eo9B7zk7tfnCRRIpWwr
	 jUc4NwGz0k2DXkxtN74mNqNbUNjB/BuPxuIr9SWaGtAjzfjKseJiMrgeY6y7KDyBDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353532;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QmwXZAZj0cdhhYmLWTR9vxhrcKi1iyyvta20HG9BiiY=;
	b=Cs9T1pGfXgexF68o6wkjB/lf9WZNrIBXymaUFf0iAUT5Dc5KI02g1lQ0in9u8x38S8Mk
	 wx/xGCC/64OJYDyH8A+p8BlFGjQxCGGt27l27YOK0T6Coxt043326r7A6XWTFmH3kIiAr
	 ELzXyI1ND6KoDOTMS8TFGOdog5msipMlC6vMxk1nt8dOoHNkbmTh3eZOjh9gK0zjswuBo
	 C40uB8SE0xci08ezqiRYf7TeKLYYEY1sPV7Y3GuBN0yMEbz5JsvVumQ8Owlgnv344Jp1+
	 KV5s38hsvEtmgxv5yU/LUZGPhXy/CuzOdSU9F9hN+EA4vO4K1nteLZPKxwSzEa5S6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwjYexwS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B5606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwjYexwS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844B71F0093C;
	Tue, 10 Nov 2026 23:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353532;
	bh=QmwXZAZj0cdhhYmLWTR9vxhrcKi1iyyvta20HG9BiiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WwjYexwSk2WJN4oD0+G6qjZ7E05sVbgscusZxC/vEqbJY7tXdKPq/PhKHnkNyk6Wm
	 aitR3l8ffciKGqNH4RxziDk3o9kpL52K67LsxLK0V4CmTAFUV9ll9BiRWlcvQAMvb0
	 MNoSumcsxhN+7TSBm3QfdiotjbDqoginbiV0tQ+lL6RwSZkkYEU2lsOeD/m6Gy/0X0
	 drQbtrHgVje+J0qnu3+AJErzuhKon2Zyp4DtM7si4BTxLuay6t3cbGqmAWyY+EjdTh
	 fHRkAHir0D48M+8/LDSoB7vBgCfkLiVVRRB/HERAw+lkgMB4KfUBxQTJXrtkpkU9bu
	 hspaXVZB/Ri8w==
Message-ID: <sashiko-outbox-207925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/22] usb: host: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:32:12 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D11

