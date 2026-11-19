Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117278;
	b=pT0TIir95osNxSs/6yWRBzmtOZQW+9kbppIYH6vkYdFxyUNIRwk0U1OJrqZ8o6w0Aifm
	 l+xbSlSVpugkuAPM1nfR0M/n52hkMzoYgaLsDSN+uqSDuSxKuLtBz5Sq388SCaSF+ZMir
	 iu7U4EPa2HRJJitwrgOiA1eSzoH3kwjPq7CJekNiEGrJ16X03pEGlWT4qbrTv+yZOVaym
	 w5ETPpRJKU+CbyrUj1T1x8oxhHoCEhUWP7shVLTq+uuWgApIy4BHI54/NS++xma3N/50F
	 pqonTWxCLxr09CYVvYL5ASq/bwmPgTwYaLyYtAZXw3IyybM0jwYPc0wNmTklCZiI+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117278;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ErhRgV/YsEwprii/iEkN9e5sYE/6u/us4xd93CvjwiU=;
	b=LY6mZjD9GKLAsZr0/HQ/K4sA6ouTD9/ILXjXHpt3n89ssNNw7sA8BixB+GhcjmHqvDIb
	 1h/FOn+UeV/RspYmMEIOdKN6HxGjFjDVQNim6ddqM2sL52GRhiwBWaDeQ6CbotnV0bmrK
	 fJAso9iAsnYyU3Qmw90DJVDVbQmLejYGVbkXVNm3Ue97hn6jwzBnpmXkOppTEwgmKAFS/
	 AU7fdtAwHRU2ut9lIc88tAebqJSU/jvfQ/n1zPxnV0xuHMb/KQvBMn2s3EQZhmzfn02zu
	 5rLcpKVFo6CttaPwA6LyUZ6RKVFD6/Yf2Z6PtswBejYnCy2ZxKliG6Wq2qObBmVAKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tnjjK6UX;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C80606A325;
	Thu, 19 Nov 2026 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C80606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tnjjK6UX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ErhRgV/YsEwprii/iEkN9e5sYE/6u/us4xd93CvjwiU=; b=tnjjK6UXsgUsUi9KjhJtLPJtsA
	8UvqXWr1Srwwx6JUdWlgpyP/ZAKpRvajI6CFOcVdE41Xqwsg5YM5FBk7uvCeH3yUCuwRbdaNtDgV+
	dJECyns/rFFHNw4954+sJ3Wa4Pqj5tfTSG6oV48x1OSFhdEE2N01cQlE5eUMoNgnLzKM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU80H-0006qy-Rr; Thu, 19 Nov 2026 20:41:05 +0100
Date: Thu, 19 Nov 2026 20:41:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
Message-ID: <29ba76c6-5feb-4f07-90b6-20468b62d602@lunn.ch>
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>

> -	desc_hdr = le64_to_cpup((u64 *)skb_tail_pointer(skb));
> +	desc_hdr = get_unaligned_le64((__le64 *)skb_tail_pointer(skb));

static inline u64 get_unaligned_le64(const void *p)
{
	return le64_to_cpu(__get_unaligned_t(__le64, p));
}

You should cast to a void *, not __le64 *. I'm not even sure a cast is
needed:

static inline unsigned char *skb_tail_pointer(const struct sk_buff *skb)
{
	return skb->head + skb->tail;
}

The compiler should do an implicit cast.

	Andrew
