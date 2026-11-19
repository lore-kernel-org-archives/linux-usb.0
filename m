Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096680;
	b=UbX/TlDe0j+fAjm8Byd5dKqPDjO39KxELW+glGFBbGq2hGYcRlfKb6K8FYoRFNIZCLem
	 pIjYN6BFbLpc2Ox93HeDnqC6lANfSbtK50EHmuDkiTiH1imG6ScgAeoZ5CRA1UaF4Vs+i
	 7jCw/Bq25kkEhgvgsFmF6ihAR/R+izJBaz8mPUKcwb5qiXzBEyiOUWm0uHXwdbIEycEEi
	 7UJNpAATlq3nZVYADvdPMgDrjgg/rN4IMnjDurSPcuue8o6tZPEK7hezJSR0Rsl6FaH1g
	 TrE0FQLU7g25+XyVsfq6UPWddqRzu/LlAsGAqDUne2DKW2TcnVVd2vxGeSwaBosGgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096680;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=x9Y9tQjBdLrfIJ3ZnwR1GSvIi6f1WsQxYqUW4NGAlF8=;
	b=tMtPvX6OatPvOBLu61roI1KlERTkfjucwClZoy9ZJ1mICJm5O030norFbj7xZxSnPrvS
	 RipmgaKSipfgTw2M4g6Zum7RjpsiJBj/h7GydsKEFnYDst/VWLtK/fhxs41aCSqSOxvE/
	 tr550GjOOt7LfbjClPN4hBwfreSzmfNQSSdcRFq9dJstaU5ZhMOrvXW8yQBrD+n0Bf+0K
	 sfh1LrAFulhO6iWgABe/4mfcDfOQZIUe9yEfmhtWlOBaDCVZCxfpkq0NUuXi3k2+6qeqR
	 CyPBmMdegTEdLX4EvJg2QTwp2lMoDqHQuLG3cbxw6m87rV6TRLvZpvsBFrB7qHJHVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=CnikS7YZ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ECB606A32C;
	Thu, 19 Nov 2026 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ECB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=CnikS7YZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x9Y9tQjBdLrfIJ3ZnwR1GSvIi6f1WsQxYqUW4NGAlF8=; b=CnikS7YZ/nww+ymXTnk4rS2AND
	Ozq/uS0+TxbH6PcdAZ+CMR6Uqd2qu2vXPGPKp4eScjwvACqrwByTupKm0/CFHvbEfCcnegp7LUP61
	PDs/1JpAyn+pgPXHInSH86i9SOIr04sW9HVsYzy32HFfXAuXTCFq1ySvDr+R4VmlTt1Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU2e8-0002yB-OT; Thu, 19 Nov 2026 14:57:52 +0100
Date: Thu, 19 Nov 2026 14:57:52 +0100
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
Message-ID: <1543707c-c121-4c35-8849-c4db1a71fb57@lunn.ch>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
 <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
 <b53ecd5dc96f4890956f051959b74e32@realtek.com>
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
In-Reply-To: <b53ecd5dc96f4890956f051959b74e32@realtek.com>

On Thu, Nov 19, 2026 at 07:18:16AM +0000, Chih Kai Hsu wrote:
> On 19/11/2026 12:42 pm, Birger Koblitz wrote:
> > On 18/11/2026 2:42 pm, Andrew Lunn wrote:
> > >> I plan to add two new functions, rtl_nway_restart() and
> > >> rtl8152_get_link_ksettings, to replace mii_nway_restart() and
> > mii_ethtool_get_link_ksettings, respectively.
> > >
> > > Ideally, you should port this driver to phylink.
> > >
> > >        Andrew
> > 
> > Indeed, all of the (integrated) PHYs on the adapters supporeted by r8152 I
> > looked at are already supported under drivers/net/phy/realtek/ It should be
> > straight-forward with many immediate benefits.
> > 
> > Birger
> 
> I agree that a phylink conversion is a better long-term direction. I'd like to
> keep it out of this series. This series fixes and completes the existing RTL8157/59
> support. The phylink conversion is a larger change. r8152 has no MDIO bus and 
> accesses PHY through OCP registers.

It does have an MDIO bus, it just used OCP registers to access it. But
there is no reason you cannot export it using a normal Linux MDIO bus
driver.

> , and the MAC code also does PHY configuration,

Which is a layer violation.

> firmware patching, UPS and EEE handling that would need to move or coexist with
> the phylib drivers.

Or just thrown away because the it already works in the PHY drivers
and phylink.

> The two helpers here are self-contained and will be removed by
> the phylink port.

phylink_ethtool_nway_reset and phy_ethtool_nway_reset exists, so there
is no need to add yet another version. phylink_ethtool_ksettings_set &
phylink_ethtool_ksettings_get and phy_ethtool_get_link_ksettings &
phy_ethtool_set_link_ksettings already exist, so there is no reason to
add new ones.

I'm tempted to just NACK it. The best pressure i can apply to make you
move to phylink is to not merge your patches. If you are adding stuff
which should really by done by phylink, i think it should be rejected.

      Andrew
