Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758342;
	b=n6WSPxF9vZ1C/M6EiRXs+b2l2B+4o9SIS95ZZVoKak2ni+rarM8jdynWoLBIx0+RvQyc
	 dWzEb6N7quqhnKFhpm0mS22M1o+NwWV/TURtplv8NP6uvlou39fIwdr3W78McvfEDw5K9
	 MLMJYEZNjzTbtOA9YvNOaxhu187ICaojp1NqEtify+efDMnIrxMHNUAz5K2cdKVK/WSq1
	 WwsGq88h/q/0mSgFCk4luVxQ5CISDx8rCTsVFFFNtsfo7MyAV4mw+mx7tdE6SDugeJbmr
	 CiBybAY+54ILmXcufsF2m0qho18PcIYdfeGWwrHUTppXkGAmDWyGXPUEXKeXvvbRL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VfNXXhjPYCg1KduWNiSfXox7uJ5VpapIp9+u4dlyAwk=;
	b=tKPxtcNJLDlSW2BVkyp1J0ezVbNtAzFDA2ZLQo7j4a/CyV4sYNyWcN/0fWsr+YpS778p
	 BLHYIq/52jP1aYQapIKGIf54VMgGf/iFX6Kac6gd3+UihALC15ZNpOM/TKhuEx7NELHkx
	 Qa3iS0DBUgUxlHRV8HfkpB3h0/c7R5ZNGZnYqWVuQ1Cw9WpzLKRzjrowKhD12CAGRHvDe
	 mbj7vQzUKhoicXxEAG7C+mi3itXaMfC4A666uOa9CVpg8a4SHE6i3wGKziTlfnZFFHG7D
	 nzu/3hWV0mVgrgDMmwoscoxkP9j6v5bJ/F7aWt4h0wwpqKamHu+jip7F4LRjlVXqYeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oy7bcAck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C1606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oy7bcAck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9FF1F01829;
	Fri, 23 Oct 2026 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758342;
	bh=VfNXXhjPYCg1KduWNiSfXox7uJ5VpapIp9+u4dlyAwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oy7bcAckCPRuc7T0uoQXrp9HLR8jJJItHQiNk4t3dM/ft6yWb682uxxOlrG22pU3i
	 9doJCV8FVWzz8dIylqGUS7e+Wrw7q/2yjZew/c0lXVFUH6Bx/v70MV6FKWdzVw1Am9
	 ifUsQXEetlgMfVp/igVCnT/rHH5YwLawxe6fy0TfoBYo4Yyv0+GuUqxtsfSdgRXUAH
	 CgLKBzIsiei416YkPEgTcT3P9x4tF5JQ0JkzzOixMRt9aaAQ6W19sJladeQ42lut/E
	 t6LKyyGJPZgGwByqSS54COf5L0FEESW9As0cZqHZOkWnTMtboeLFJ4NOGU/QUewV2z
	 eQJSSrevB9n9A==
Message-ID: <sashiko-outbox-182764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] USB: serial: io_edgeport: drop redundant
 sanity checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-9-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-9-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:25:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The serial and port driver data is allocated at probe() before
> registering the ports and will never be NULL when open(), close(),
> write(), throttle() and unthrottle() are called.
>=20
> Drop the redundant driver data sanity checks.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D8

