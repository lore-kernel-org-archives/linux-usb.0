Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633149;
	b=0RspNYrnpt3zd/kpOB/bsDLEbBNjuvE2+EcC65wL3vNykVxTQ5wsCMXXSguwNjtriGla
	 HwAGkmhUYgfxi4Yol5yhUa+gpGsd+zateIp9RFvIWMvRKSPfMdIFkY89pMucxq+X0oRQf
	 YOIDv9zl3BfM+FsSp5aIl1JenKXjgFGzIQZ1+j+kyd365ECI7e1vyc4V4kS2dDVl/nd6j
	 bqFOhhYSFofvX/irdBgLMIOWdNGwefktl7f8GUJRc8T5bPHHhZCEnV4qf9lai5cfEByCE
	 mRgmnCqIoTicnN9EXG06ypLXyU6q6U1dA6B/h1+2yMACNuulcLX8/shsgF/FQve+GKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633149;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=Lq4lj2pTOMq1vMEOeYsWw42ciNVlr9j1WO3Muc9EktEEmlgl9VNHG5qFiIcXmDCdNuks
	 MYZ6C4SBRbTxOnPS3QaFRCZcp9mc9/JcQGbUFEXJMBDOsAh+v2OuiMrSuQr13RSU9+t1y
	 x/y+hg/dxzPnKm86d/pGXvQP66uYVxQeZ7BBdARyEe44LDMDIvGieWyL6gAu2EupDaGFW
	 dTWdKXQoVa3jBXcf+Rw0c76b4XkatfWS2+cZ6SWYRfbRA5sqfFYsySvWMhWEZT3Cbfjmo
	 48/Oop7Ljrrg11Tp0N37AQMWoM3b7DRO7JIvftzWATj0bgguivUaV0uEK7irT/vL69w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LELM8qXl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107C606A32D;
	Sat, 14 Nov 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LELM8qXl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C771F000C4;
	Sat, 14 Nov 2026 05:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794633149;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LELM8qXlfYRFHSTJNtTPL6I8xcCGftzWRT+7F6mI14wjfcoCdzRwvWzKJ/MprhRVh
	 mbIzwqpAby7XSFy+szTaAw5nybTIda3EwUsATq+Xf0miKL/0XW/Dz3ZWKxrjrdBav7
	 Q+oSDgG5ScEQX87GYG5Gl6EFOZMxemkkG/Ik+/gisy29ZY4SKg1b+zS8Oqng7oMEyr
	 dDFvNQ3RmGHybOYDmD4ronGct0lY9ORZqA0uTHOgu7Q8d1JX6NfIZUpN3rmNKVE047
	 Dld7iGsll27/93bdf4PNM4xrlp+c8mOXoZiMBAbOYVIuZQf2fTL5TURbfpANFHBgiO
	 57JYoJeK2QAHA==
From: netdev-bot+sinfo@kernel.org
To: Artem Novak <artem122novak@gmail.com>
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Andre Edich <andre.edich@microchip.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH net 0/2] net: usb: smsc95xx: propagate MDIO errors
Date: Sat, 14 Nov 2026 05:12:28 +0000
Message-ID: <179463314815.2168702.3601648779918603836@kernel.org>
In-Reply-To: <20261114050954.275495-1-artem122novak@gmail.com>
References: <20261114050954.275495-1-artem122novak@gmail.com>
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
