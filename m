Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437174;
	b=wr72aHVqwSxk0oOtbzUoNiE4+5gce1SSsXcprGT1gnkT1pONLvVR6uuXsS5e1uQJNJ3p
	 Tiu8zU2no9IV4Z1N9bKsh0LnTxPbl+tumeMdg5Ar4ebCHUwve5EAMne53rbaoEeNNbRea
	 QROn7zJc61aRVD/DmpdUsQnHna+lwmeYmAwQmSTOpRK3Txhju86a+axCsWiSjeuVyKwmX
	 sEUCqHLy19ds8Ya9PXJa9tpGKCoELXQRKJvd/XPShxESBdgrAOoN3MNpzFCBJdz4eGvhh
	 hGWLCBisxwBWC1Pw7wwE/YdFy1bnLBrmrrtPwvwxLtPOHup2bheJZp6H/5al9hQxotQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437174;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=Y065yfkwND3HviRSwt4vdtJhB9/Ujxm3MyXVVJw2Jp//MELDNe4g/swzwBquIXR9tmxW
	 X8JnSVAnVLgOjSBVWI8HlpZDuPWLaZcLrekbSmC5veF3u+fKkmuLM+zdsdYKbgcBHzkmH
	 qCtzOZzzH6ju2UHJYS3vEwEeChDmRdEGLd0yP1Qe3T/fHb02IG/6aVyWUIa/2xVf6zGNt
	 NyXSzeuc/OhA17Mm+yQqo9MoL/Sdfg8Cr8eRYl3Ko2dc92jd1yvSJmMk0ByJsnIqy8m5h
	 q7UYJ9LdBe4lBOs616SYZX8CLuuB1kD4jPMbI8isN65tF1xSelNB3A+y7wK+fyCp3CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0KzZgMC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72226606A31E;
	Mon, 23 Nov 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0KzZgMC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCA41F000E6;
	Mon, 23 Nov 2026 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437173;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b0KzZgMCqvnw1ErmK/Xapo8VnhGGMrjw8Ph77dYz0SNC9DExgGrR68PcNeysnMgUX
	 78yruY06PSRasgQKiewoGaUJVovD/CmywfX8JbqQYcoqqy777HVmySq9QHMF8KyidN
	 WEPrXe5V98wrDNqsiX8oZjZvFAMP+nY2q8fntkTha4JnBXbneDkAYpU0uwL9G5cGbV
	 gV41hOB4F1oEoyaDnkL5juCMThbL6N08h7WmNkTpCPn0hYz4HUlvbD5DgcsGsHtv8d
	 hbUCvaPPRGB12X98h4HLVP+63YxNEisXT5vscLwiQgZhJYKMBiPJt/0qiq0HZFXzRy
	 TEDjRTKKrNi7A==
From: netdev-bot+sinfo@kernel.org
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 hayeswang <hayeswang@realtek.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@google.com>
Subject: Re: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
Date: Mon, 23 Nov 2026 12:32:52 +0000
Message-ID: <179543717277.3294.8933849621988482320@kernel.org>
In-Reply-To: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
References: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
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

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
