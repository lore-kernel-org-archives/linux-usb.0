Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940437;
	b=dGaIcGKBZKfsDCOTiB+q0uSEB+guKbfeV3IiB2S9kt7RJpLR7n5JPPaPV39p3Y4o3Snt
	 CbFXiTCqZPYbONVWHwIi97mJ/qYyXL4X6R7yundComUwHRGE8u7Ff3mGw4rm7MqRVjGcL
	 WHwPUjuB0AMbDS/W9P5TCPSE+XoGczw4EPFTbQLskiOJm4fdfMuiOzFNan+pNZBgiJiH0
	 WQFzGmlNF1xWKmS6TcymLDf33Aw9l3zBGC+WJlbIvrgTlKqqjXgYKuF3UseCBiV504vQ8
	 BABDipS7FNu5zcDK+z27DBfss1PD2KIgiVvJC/FBGsdpZyU2thx3jqRKzwOWgmEBrNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=lZKjDL6CpxCM9e6AV+6lvNWYNiGAjoUjrRaSwC+WN9qZB4x5qWWVGh1+p2PHMktnvRaS
	 /vSQISavAoUGOQICKNmsM+jCbQ/DKzMBmkJpSWd4uaH3nPQ9jiAzPVY61rrS0Tz2YFl8Y
	 1827zGEl4It7VUG+Y94OcyIprGnOojenc/q2r/PvAQTHb8Ew5wQmaIM0lH5bylcUSK/ix
	 DTCRNpcT8qxCKNZyfeGMHvvVYc5uwdwXbllUSDQmD/albyrEetTpi+Wrg5gj4KlezTbXe
	 lqncSjb4ytpJwBTr7yEBvBRvh2C6SaKPYo2KK3yr7ph80/5k/ffv/0aNNyTvgq+fiyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvdGvt9A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286C606A8B5;
	Tue, 17 Nov 2026 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvdGvt9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2821F000CB;
	Tue, 17 Nov 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940437;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GvdGvt9AWhxa6/h1i5YNy6vp7nWqjA1SiBWYlqEh6eHs32VRkDsO0ud0GIqu9cx16
	 cgsBMMzS+Rt1CPgruLL6fw+XHek1WqqG3V/csz4Ffl4P1pkKqayPlt0WecmjkqmZjA
	 8lyUDQODUm1S+pyjlcPoW12ZYIOuUvZzxld14aByqeTFIJIP1vpmWdYfjlqu6zd/Cm
	 GH8tFnerX7y2pvR55sDkzpMMfYMFNFWhJyjojAEnZV+SMsBAhw7w8dW3JrvC5y3K/D
	 eBT4Pn4aLoedk0+h1xaSfRRA3iyQe7IH+Rsfs79VIRfJ7/erSX78lTQAwvh7MkNvPO
	 Mkk5bqcdGlDQQ==
From: netdev-bot+sinfo@kernel.org
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net-next] aqc111: Correct endianness handling in rx/tx_fixup
Date: Tue, 17 Nov 2026 18:33:56 +0000
Message-ID: <179494043647.3291.5606133763335638052@kernel.org>
In-Reply-To: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
