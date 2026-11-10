Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293046;
	b=IGaZOAqCd6P4AhEbEVv163H4yeRms+T5G826ixVbFoZDCYot0BkmZ+MnnW+2ViZj7TNH
	 nyzmF1Eofs32zBjKv9shn2ebTA7K1mIHH6BrMLOg+JvU2veSO+bMEtIyVY1r6LJiWlLBd
	 SoJfQJ8+qc+D4xhSccg8zqz58hhOAeCtxtLek+0/S57J9rNEf+imehPJG11YH2IwcdvdB
	 dGXEmMJZXof0BO+IpzKcCyVjPhtWTC3oK6CbMYBi6aEhsDfu53HAUMYhPhSFSSgjrncpG
	 6FsR7FTCyD+PTDMKWd1Zokhu8A4BUMt4J7rPdS3tOTpdL8IVeE2nPNMANmjdX8sOi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=adJy4E/PmexSmLccR0K12ASPAOGCeIO3KaVrpyL4eyI=;
	b=iN2pcQ14ehQVTpLGE1rw5F7lrY/pDogRRURyz0fvmUJubF+mZEY+7mX1xEA5Wim3pIMh
	 oJC5YuT+AnMJME6rCc0PwyzvFmFMbJ5n+hu+WBecfFInF3srjtvV9Y1Cka3HiHrJadLWn
	 RNCAr+8Pq6PAkWYQ4qjjsoxkZQOX6J83hmgu4J+O9UQD7Lk3NqC4oRolhJ5TRini1d5mO
	 +ekMu277C/NcKfYsxJp3RNZzGxrs1b4VO9vb0qRDNE3Elfh+eL19PoHESCKcnobBl8mk0
	 YgqNGNF7UfJNkO3QcYGzlf9nXtdPr42e8fayMUSA8YDNnVZLHx+o4x59UvcrGUv9cQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENWOBBJz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9E8606B1C9
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENWOBBJz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A34F1F0089F;
	Tue, 10 Nov 2026 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293045;
	bh=adJy4E/PmexSmLccR0K12ASPAOGCeIO3KaVrpyL4eyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ENWOBBJz2JHWyG+71WUgdUsyd76E8rwpuJd1hBsV/vPDcZ2lBZ0bnOrvXUdrXFjMN
	 bgwqZ0yNX3wGofwfeSlDM/triirk9D+Q4IlRrMHxMXTyNrzKJR2Q/sfgCPIW/cw3mo
	 R1SmqVMA/8qcEivZ0ITd1kEsApfXTmaVC/fdNjxRV3aftxbeGtejGisRqHFJtEBILG
	 TwebdEOGMOpwwpg8/g0UGwH0u0Z9GfXdQYeIYySD8oQBRs9wePVrwvj/ggha1vFT9s
	 LUDXknMaIq7rpdFYjlKLu0KFW9oO03lfTHNQLbJy3TWnEKZNvNwnM7QCh3QC2QSVkX
	 mwXB8+514sVbA==
Message-ID: <sashiko-outbox-206432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/22] usb: image: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-13-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-13-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:05 +0000
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
5-1-shishunbo@cmss.chinamobile.com?part=3D12

