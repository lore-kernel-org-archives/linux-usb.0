Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782502;
	b=F4UB9SIEG77zfrmFGfTVrETTwfACZwBCy0ot/dBoevyqqcKTe36g2VJlGo3MUHCwXmW4
	 jl/QWvzJhmf30CCIBIM/gIe9mjRLXf/h5hG/KPDpJOtziaTO1dQm9Yp5lMmZwXYQWdUGL
	 rXMYA0qUIuJHwvdR1/9/uqZox9kW6U7rTxfNvbFrFUC8UJo9T2DzGlrE39N0A0u6KHnUE
	 4sSMN/Az+xjX0N0sYdpuTUFXc9dfqqg8VekCDkPRzkNSn+xb9GxmwIhRhJ/+JElDSs5Mt
	 ixh0dI5q1yLKCIC6DvqqREdrzYwBu7eHFhmZdlsu7IBzMCi6nn3RPzWAf3ODP6fWunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782502;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=apcPZdRIJS8NBskwZ9fbR6XsezcbAcRddguLus0AxRc=;
	b=MTGb8JFAHC8rpAmtdqbqwWXOy3Nj1MmR7kyksTKZqAzaCQsih5Mmh+FjdofFuzdFQWS/
	 VA/04YwraUfgMdqivnRe8CDOqj2ReQbEC3b5TLBETq/ND1l4/RbABETGifzH4l+SjJTg4
	 SFfLSZTxEXErBvgJpqH4I2x9IRZLchGXcuE8cOyWaQhjjHl5Pkb9MxwGXuhreBqFToYWY
	 xL9OlQ3mYtTaLao36TJ2wfSlRr+l5e5r9jXH1s9d+Wl6nJLGSM0vmjaY2jnEFDvcoYg2f
	 /IBNesyvn8z/ZKlE5iI07yRdv2NTxvcjVHFNYHEHLVbwxDZcMF4yNFFSw8FJftiFH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXcImuoZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30226606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXcImuoZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C591F00897;
	Fri, 27 Nov 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782501;
	bh=apcPZdRIJS8NBskwZ9fbR6XsezcbAcRddguLus0AxRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kXcImuoZCfl/U+wTGa2GPO1Ho99vwcanQF36Zx+km27shKa7T9KrKHUiqkzWgJz7N
	 2NJpIb7ifg3/xyrc9DYvgWQN5F7XEXppl2S9IJh3lB96cBsASkzTy1ji0TjNrvzmJr
	 IZdo56ypssMdME2MGOqbuZWvzM9JxJgZlEiM7zF+X62AP3zG2/kCZQ5u8plMfapIv0
	 jM2UkF1zaTa5MBnuSDYNdfN6nUSr2ixyPYNRKa00Ah/rIgyeclIK/lzuL5oZG/2sJa
	 6IpxWWv3VToKiiwz1ISg1d/7jGBrwiyv1m1J/x9GDbx92x7WLOBk8Sf3RkFSStt/lv
	 EiapdG88wycsQ==
Message-ID: <sashiko-outbox-237393@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 00/10] xhci fixes for usb-linus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
References: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 12:28:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 10-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127121755.2814=
20-1-mathias.nyman@linux.intel.com
