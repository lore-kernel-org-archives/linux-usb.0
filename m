Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180911;
	b=DrTKE3PjsfQsVRPrsgAbc2QxeA3eCY7AmWEGiaWuhlKMFtyMxox9cFM6GV4A3UexGFva
	 fizX7kKnV1BS/hG6SpFdgpBb0fKfPuJtiq1OcletiPhFIZ+tThpnmkvfbcZz2JZsb9ppC
	 Ppwa0zOPVNs637XNqaYktSoaM1nTH2S+0D9kR2XtRsFGNiYq0mcHvAKj24OHHSOknL0o7
	 5Q06tPx5ZaPnFJ96N66HSU7WjpANC1BSVoqy+M9btzzTi3o/wWgfkx/5ctEYK5OJpFNDY
	 jjG3qDs4Ha8adHsVi37cgaC25uP+N2Llu5TIXUmWKV1zN8F93zfWwnOVTzDHbj+bOHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180911;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fFY2JiL4Gjfohkv1qNJ9dcQMzcXH5V6E4XAVqKS4phI=;
	b=pWMjGj8v/ju5ZWGRWPpbboEf3dBWfL2Jkr3ZPMb9XMLwxUbJG7RqfVksdP9r2v+btHMx
	 ildENE+2/a2c6gYES6VQD24DX6JMwiG8RhepQEIAU9osjsqX+YYNlZBmXadH/ELPqvDDX
	 KjTszx81/gztyqDHb5ADARJ0GfF2RSC7+RFzL6doOCHwMWfQrEmNJxyf6AmKmQaq8xQqQ
	 rca9V6AolxoRuuVmUr4BL1OvQwyTEn2Rz5PstOMl9w3ehrVjJowBmRpfTJbONvSXFjab0
	 ++5vTGx5hbyZec/jg66wGNoCC0t/yAW8xYT5PyyN9E/nbwsWWcZSgp90uGzvenJtTIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=o2MXrZNW;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E807606A338;
	Fri, 20 Nov 2026 13:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E807606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=o2MXrZNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fFY2JiL4Gjfohkv1qNJ9dcQMzcXH5V6E4XAVqKS4phI=; b=o2MXrZNWZdpZsN9juj+n09p61O
	nRr1FtIW8/cbyrSAtJN2SYPNU24A+nN3PuIpM4RuWn1BxE7y+ERsHTCUjfY+yLoyg9k5Ift74QMQe
	bCQeMud7Uf6VAVPDWg0ALMrFIb3HMw/OLNazNIcS8fqKD9YsHAE3S+nuCWfzF7Vd5Rn4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOYX-000ITq-EW; Fri, 20 Nov 2026 14:21:33 +0100
Date: Fri, 20 Nov 2026 14:21:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chih Kai Hsu <hsu.chih.kai@realtek.com>
Cc: Birger Koblitz <mail@birger-koblitz.de>,
	"netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	nic_swsd <nic_swsd@realtek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"bjorn@mork.no" <bjorn@mork.no>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>
Subject: Re: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Message-ID: <78ed468c-798c-44b2-9f97-8645af0f1641@lunn.ch>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
 <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
 <b53ecd5dc96f4890956f051959b74e32@realtek.com>
 <1543707c-c121-4c35-8849-c4db1a71fb57@lunn.ch>
 <6a2c635ba56d4deab25a25db9af91c10@realtek.com>
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
In-Reply-To: <6a2c635ba56d4deab25a25db9af91c10@realtek.com>

>  The root cause there is also that
> the MII library does not check the errno, so a future patch could make the MII APIs
> check the mdio_read() return value and propagate the error.

The MII library is deprecated. It is not maintained. It will not be
changed unless it is really broken, and by that i mean it breaks
802.3.

All feature development work should be done on phylink and phylib.

	Andrew
