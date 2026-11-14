Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694233;
	b=Xm3RqLdFf8vh4EUaW/5yD7xcwwg951YWyXqtLYXum44A8Wd6BgpaayT1u3wtfMA+Alo9
	 y1FZh9LCv7zdQtmgajIf5OiwNcA/+V9FMKrYUvbUux3Z/JD2lf2Rsfkp716BoTdhzOZ2a
	 3KwP0zO2OH2VHlk51SjONJ2LbVCJihVRrcYledlwME/3CoFZeCzHTBsQ3zVJbCbvGbz/c
	 /tLL4Tmgfw5gbYUG+FrnMzJXKIgPe1Q/itDQNhyOKIQWZBV4JAw3wHprFFTCtZfaBWpGX
	 teOx7skns+F/Zm9jqinGrBhBS6KFI4zimgVjh8qL3yuGvC9xj7jryHyJD8I4YX1WMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694233;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=X/twDhjj+yg5LTImuxRYAzCbS0loCijLCJDG1B3UM7w=;
	b=UCl2TIcdVXoWbt1JfDL+SmZrlHn1YH1+D/CnoB8fzS81piYWeXxDVSLcvL2WygZJ00p7
	 qrjFX+SOqwxL/79RicJkH4mNSrn1OIduj68qNxNf3n2973AlHpQ8n6mHxxq1FOta2o1je
	 6muJ5h1KuAbbrtxmVLejzoBGqP8TIAdccLUob6DOEEwgd31ldFQzJC3dSfGeM0o1VYbpf
	 WNt6wXXP2j6Vv6DRdIwgFEq/Nt43FuJ0+jmrFeydoybRbX48wPG0jC4EUkvo2KvDZBTi1
	 /5NyweaDePnvwvQ8lVPi0Cb5CZBprqkKfkjg7eLhVdguo6RdUz1oR7QDzZBjNyXp5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XGZ+TCna;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BD606A331;
	Sat, 14 Nov 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6BD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XGZ+TCna
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X/twDhjj+yg5LTImuxRYAzCbS0loCijLCJDG1B3UM7w=; b=XGZ+TCnaZBHqOE1ClTlSrdMD5P
	cx7y5N+/BG0kQt5TfDbeC9sqVh01JTCEax0Re3bgQRabM3vsZ648+dCo1z8CAhgbEn/E4gqQwI1PP
	PJUN7rRoBp/zPal7oVtReCVbfFMc5h4x4UJta+nob4FfQ4VQmTs/FtwaaLpj7igFMbuI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLx1-00GXdT-N3; Sat, 14 Nov 2026 23:10:23 +0100
Date: Sat, 14 Nov 2026 23:10:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Novak <artem122novak@gmail.com>
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Andre Edich <andre.edich@microchip.com>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
Message-ID: <8513f7d0-eab3-4288-a097-ecb4e6c69ee2@lunn.ch>
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-3-artem122novak@gmail.com>
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
In-Reply-To: <20261114050954.275495-3-artem122novak@gmail.com>

> Return the error from the helper and propagate it through the
> MDIO bus callback. Continue treating -ENODEV as success during
> device disconnect, consistent with the MDIO read path.

This is logically two different things, so should be two patches.

> Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")

net-next.

	Andrew
