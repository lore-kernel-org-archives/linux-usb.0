Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694136;
	b=OvoYS0XlRP6gkQFy2zs1ucRddfUcFLLoVgAXGcJCJBiJcBnLMKYPkQ3DVj4ZkZpTslkS
	 pR8/Mo445MqjD3XD9R6RXTsE/EmKfG9KHVKKR4q8N+GGk+aVnzpjixdlslumCALHf2sBk
	 a/C0x7W3eGVbBMfoNCUuhXcQCJ26VpRmCjzl70UIH0+YoiqXIsu77Xlh8/JejQ0d1ttMj
	 TI5x/ZbVDlSe7lX21Mhk3wjn3MQq7YSr2zAeadkGYMc2ClT0QnGdqgAs774E/kFDqH4cJ
	 CaVE0x+iFG2vBp46oCqLddAubyS1Jon9QPc8kVJTuf4J1Wb7cSQaZq/qr60MhcuH7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694136;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6j8wqR1yJK0yMSEjqwxPcnxN+1MTL5ydPMcDX1z4OEw=;
	b=F3cElwVtWIlRSai/iYF+lH5Y0EGxIg1Jj9PJagXNbMJh6ofIwovdb4nuQLlhYL8ZaeYe
	 xzuixZT3xw7WR0ABVuInHWXfq+fofk0xnxepAdQbJjKkfGLGOX7s7NBXLU1WryZsNppHc
	 IUCwNbMjZNYKHPoR6zyxR8Wc7WtPa21IiOQ73/dL1uC+ti24b4E1kIPVD6R0aPT7cRGbY
	 0nNvQPmpbWSHdLSnmQfQ8dftHf6MjA2cxACwGuNZTGmfl5oeB7h759jmEFbGmOt+mDcaf
	 lJQF+KOdDmEpuTqUbCgSU4uC6tCPvs63YK29tyJHNTHaQYvUFQBUneXJYXV60/WdsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=PHipYCLV;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AF606A327;
	Sat, 14 Nov 2026 22:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646AF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=PHipYCLV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6j8wqR1yJK0yMSEjqwxPcnxN+1MTL5ydPMcDX1z4OEw=; b=PHipYCLVeHMvu1PKqZ7eHbTb3S
	yc85xjkMNWk0rip6S52OntxtRFqL8uMp7H3BvJMm7YiS5pNzoZXgYJuh/Ryv7oqpLLeFVY+go3TZD
	4avWL35CC5d5MpYfN0PLouuwu5gU9d7NzQO8KnFPbpOvxJ77m804a0DM9LdP5KYlMj4c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLvP-00GXcG-Jk; Sat, 14 Nov 2026 23:08:43 +0100
Date: Sat, 14 Nov 2026 23:08:43 +0100
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
Subject: Re: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
Message-ID: <2a97f1a9-4d44-4837-9c40-57da3db9b73a@lunn.ch>
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-2-artem122novak@gmail.com>
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
In-Reply-To: <20261114050954.275495-2-artem122novak@gmail.com>

On Fri, Nov 13, 2026 at 11:09:53PM -0600, Artem Novak wrote:
> The MDIO bus reset callback returns success even when reading or
> writing the PHY reset control register fails.
> 
> Return the register access error so callers can detect a failed
> PHY reset.
> 
> Fixes: 809ff97a677f ("net: usb: smsc95xx: fix external PHY reset")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Have you ever seen it fail?

net-next and no fixes tag please.

	 Andrew
