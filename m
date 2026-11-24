Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540703;
	b=1VF7YdX4kw6/AaWYYN3hv5h7yIP9XRCIg6mMW+GQkmD16tAKmhK9638Ra4kOFZR405EB
	 JH/zwvgyZIhlpuCWgZ3CxaUyl2Srks7/Gwt3IUK5MmeSc/HJyh7cZ6DPpYcTOAUBljHBL
	 uxqRhDHFebJ2RXpIJ/6wQjEDWQ/tHFRnx9nUE7E5r2dBH52hGccgEYnc7LouLFvl3s8uD
	 zvX4fLIw4iKnYit+EhBcgo9GVZa67c9IeVsEYlDzjqb+fWm6peFg5MCEHe5bSoUvMYyLo
	 QDz4Nccw5qZz3EwmAeSt8vs78DEdiRiVJZWxw8xWsENJtKNRe2W6tKiMMdguCHu5Lsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540703;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=u4DBjRxqRaubQ16JLS1z0SFUAWTxg198MRrLFBRDLOPjf78f3OhqtZTnYAIgdfMviOr9
	 C5P0D9JDq9WLayDexNzeTJV8z0YgOytarlCxkf54CNDLhStnJ8ngj9rz+JGRjGv/iYBXR
	 G5PiWsEgMcvjXHd7DYPV67XrzBu5SNBFr4Czrou7fthSXkCiDtp/LRSl55NzOtffG/YMG
	 DnZn6wCIjtsSYNyTZXqIFvOuxC9MnNIXUsMcMrjJS7rR6zDYm64EnHoc3mXCQIeacgjiG
	 wBPGIa9fIzbeqi1VQYnN3pzW9yND4TkymGie5IIQykHaiLTmgVbGpc5WLo9jXv+dERw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEx8F4jI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485D606A31E;
	Tue, 24 Nov 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEx8F4jI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327F91F000D1;
	Tue, 24 Nov 2026 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540702;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mEx8F4jII/CcQopaH5GYBs/XSZRwb4RqyqyY97YOvzjxo+kyHzxRcWhK1rcE4ZsUY
	 ngiaJx/bHOqR786pGY3J2gCZy+WajIwfMCKn5LaCD9gkPNoPKY8LK7n2WHwHFzRi3h
	 Hhv7BeJEQV2BF3Gg1E/mIRKCyTE8oMW2aZTiuMMQySD2thyMt3pIDbWUHZ0oOMdD9y
	 rZgy/fZ0bL5ACZILMZBhkhf0+OrqdgT4fQJMy+ERRUqKW4Vfalta33W/pd7/FZgJgG
	 rrZr/uCdRzwsHhR5fMOxKfzvpPe0uftd5zWLCM/5szp/UTaHqjQiahUDeI500rS+5C
	 NpvCnbOeR5JaQ==
From: netdev-bot+sinfo@kernel.org
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: usb: aqc111: Fix rx/tx_fixup issues
Date: Tue, 24 Nov 2026 17:18:21 +0000
Message-ID: <179554070167.3294.10584370925975655772@kernel.org>
In-Reply-To: <20261124-aqc111-v3-1-10f2c124d808@birger-koblitz.de>
References: <20261124-aqc111-v3-1-10f2c124d808@birger-koblitz.de>
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
