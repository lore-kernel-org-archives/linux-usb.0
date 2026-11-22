Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345996;
	b=szbW+FlEC/KSDcu6RMyWAdnR+U5qRGUoKZKkKfSfBKCOKkYMDDJg11DiKU+FOG7YUE0V
	 wwtC0KjDN5iCq+g85eWQk+1qEeFtYydXo/SRO8g+Zom8frxwdO4MyQpLqjCwlAn4bJyOb
	 oqOj2YtO0CgBbDcNIvhFLxSirpg6zvnl5wU0A8PAm//zX2DF4t6fEQVDkzE//w1NvhYrQ
	 fjHkSexTOyFsF9qBsyrRgtrj0PosUQd7dxBQZ2kYAX83RPQ4rmjkYhtHW7W4xFMZAmfwe
	 Ikgn/AwkCHra7eQvZcWrlLs8p0haJLrSf/7D+uifqP+aHt036Y3pyJQze5vN5SFIWSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345996;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=fxyk4OWVQQiKEfE4hefRBv7yxsE5oh/elZp9tg0/SejD1KS38+zRCJfZhwV1+2ZKXakJ
	 j1gXGd5mtVKj0+wZZRL5cpbmUsSDCwxPj4gQz09Yte9JSXSnYMcB7Oz1zutqxVgHtNv9/
	 9/fhU8OjrLCpT4XtLcP1cQ+LUUd/qgHEt4iKtPXlgWQU0BxKSiKjzXcW9M6qBE9KlsDLP
	 zgWmdQGNEzE3qQyf/tCZQkcGoQ2TbGt/bvdFAxl2D5ty3JtEaC2VG7qYou82v9d+LprIH
	 x7XpGEaDHua+BE6SdpnMzsQuBbBW7ZFppRr52voNubTaw8xh8UeI11Q2VihEd3y+kwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C16RvE/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460D606A320;
	Sun, 22 Nov 2026 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C16RvE/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341181F000C0;
	Sun, 22 Nov 2026 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345995;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C16RvE/LYheAFMDhoExIcOil2CXN9t0ylm0uvgTteJRE+Haj1xOX4vsx1Vj8L1xp5
	 Qs+0zX71luIdiEoe1G1AvamS8pyjQYsOL0GCp4SxLeAG/gdmN1O5z7eJRKjxaVkQzy
	 ifVieyMd4Mhavu4nRmWqMl7kFnag1rVaE41RTzzLVrBu/QU7GxfZhbrowslJeI3iA3
	 xDhXT/dkEe3Uqh1KI1QsGOMAyC3DKWZl8VMBCDRoZGzgVxGAMhDVAuE/LvoF70XL/d
	 YAtRYdGJMOKK3gTurAku5a9BvjLSitQyIC9HHpXoN4FZeI6ztd6SmF2dEK8EnzLFpl
	 m72dPMTewDgNQ==
From: netdev-bot+sinfo@kernel.org
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] aqc111: Fix rx/tx_fixup issues
Date: Sun, 22 Nov 2026 11:13:14 +0000
Message-ID: <179534599473.3294.5226906063494646334@kernel.org>
In-Reply-To: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
References: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
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
