Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138013;
	b=5OkAD7aIpgujY0sHNSANwfv+21TKedxhcaeAsDoR7ACzQ4czCXQ5BDtWpi17c60urHVt
	 Cc2gI7KImX+ImVbpnQ3SLuXznI45Qh4Odupm1wJSsrbwCja1qkHM9uZ8LQiSZXG3DdaA1
	 KkMzhf8jQ2/uq0uCt1Q30Scl0MeKVqLn4wvY2a6SY82hLX9yiWhY2uY4JT69/EOti6Noh
	 cUl8n4pcZimKfFjz8fjPA+gnvfL3HFv0zVvxrxgpa1FjOM2gLg0hAtRkMdSJBO+YQEdVl
	 C+SE80QBkksDYMvN8qh3I0ygJTJvsCytrfUFmvphEUV18UWgCdVYd/PNAqomQa5mxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138013;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=vDtv1v7S/fGRhf8Uri9P0hk2HgA7QHlCah02IQxDa59uW5qRJfTt/nIf1OxBtcfaXno+
	 SJs0LOlumz4fLnnX1NmR9c5laLceWoVojy8C9nu9BTOAWxXMvg3u2bjDnqDReIL+NdohC
	 jHoXjQOd1ZOFmyf7XApIi56beN9Mi5isInh1Umhfu5FKe/9Oczt00a/fGAVeKonWaDreT
	 kAH2IqI43jfmKGBraqJqmszsOiBFNrhmzVBFzn6DvDcaxb5nEE7t1umuQPtg/dsOMtv19
	 IDCwOy2Juj24JTJVIeTFgYSA7MeQgMGwLqelmdfdY46aLwV9lGMvd34ufqNwKLNJnhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQ8xofOZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F9606A32A;
	Fri, 20 Nov 2026 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQ8xofOZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEEB1F000C4;
	Fri, 20 Nov 2026 01:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138013;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TQ8xofOZqFaKi0pt6rZxlY463LZWNBYcoYbozOlQmpJj7bprte+8Rx40rdJKQfOtD
	 JlnnbgtR/2vhFm6cw0usrDuWEeulcKR+ZuxGAbFfk3E9BcICaecx6ByH8PubJPMJm7
	 cwsLTSrfS7K+YZFxe++tRg5wKR/WatbPjriKV6GkNPMWMiYo5w7+RLySKDDFMl7o8R
	 76mW43LTXDMNANaNyOinh0qXPRGiJ1pMTperHr1KT6l/p1bK0zRciTv/xxcpFb+Uue
	 re9+Av+Iow74NdV3fqUlo+6dKNjrvYufcxfdJqC/kLh4ccS5n/sJIlt4W7DP/rO4en
	 Xru9oTJEx+PLw==
From: netdev-bot+sinfo@kernel.org
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: hso: cap the MTU and drop oversized frames
Date: Fri, 20 Nov 2026 01:26:52 +0000
Message-ID: <179513801218.3291.4900870389760727017@kernel.org>
In-Reply-To: <20261120012309.19-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
 <20261120012309.19-1-chenaibing@cmss.chinamobile.com>
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
