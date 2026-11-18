Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009346;
	b=acn9vHh74mh5MxMJvGeUTFs70DRPzuMSXsgtqg4bOxKJUfFwR1ftjeAv8AVKjn5tR6U5
	 NCqAknW+sX8+UnM38plEpzFL/5t9TlnliGIrpfHPg3lKWVCEzPG82KcTg9j7jdGUgK0N8
	 ch8g23TqBrHUtqfXbac8IEh6AFNjwbER56i4oB3ElBv/hwop0kiqDhEYqNmlkVEZGAOiQ
	 hf9MJmmeKmdBOhZGyzEITY9uhKHqYseMd6H4mE/mPFRHClhFXD53tnHaqh11NnYE8aLh+
	 o1VSZqNUqd5pTXhoH5do3U+QrGPlg04RRbKMEDfddUiUv0FJjUB12p31a4aL/vEreEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009346;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=sh4rom9HebDa7DENWU6/EprNkkfkvz9BCOVBxOg6B/Y=;
	b=K3K9zgCfoydvwNzChmqC1/+XY9V/DogDwvEu/ChoavpUK7t0/PwFwM6QP7xsd52lkNNQ
	 4D1NgInN5nVL8cuMic1AJoBW1kdpGhgiyR9vN2Ssm3TS6phEWAyoOx/Dz9psddlVdxQTn
	 76IE9lsooD58haNdY5+bGqP2SafEU9bQ/3FL0/B69t6lZ7kiZMYUf3Z4UeWadyAP7+leX
	 qTeJB5QUEgTJ1lz/ponRaHnAOQwd69B+2AT8vTGvg137vwZpEvKiGFTf73OXyIkEy4X6q
	 J/zfdbwAeLpu2hnZF/428Xo8UHEXvV8onp12nuISdJX8iTXuxVfH5KwL/W+7AQdtHEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RY24NxGC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFF606A320;
	Wed, 18 Nov 2026 13:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RY24NxGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sh4rom9HebDa7DENWU6/EprNkkfkvz9BCOVBxOg6B/Y=; b=RY24NxGCpz/fje5zxxCjreIuP7
	EspJUlQxsb5r0Ugkj9W2Fki9l6/NooVTowjB+VbWQyQyTjU9E2zSggxjf+DqDs1BEEGluTWKtgozU
	Uo8KXb5T1uUuuBWpw3aW+qU2tv3/hTOAGR3ECPgA8e0o9ztA0/kVM8vDXxyAf3gDlpVo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTfvW-00HQXx-In; Wed, 18 Nov 2026 14:42:18 +0100
Date: Wed, 18 Nov 2026 14:42:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chih Kai Hsu <hsu.chih.kai@realtek.com>
Cc: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	nic_swsd <nic_swsd@realtek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"bjorn@mork.no" <bjorn@mork.no>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"mail@birger-koblitz.de" <mail@birger-koblitz.de>
Subject: Re: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Message-ID: <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
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
In-Reply-To: <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>

> I plan to add two new functions, rtl_nway_restart() and rtl8152_get_link_ksettings, 
> to replace mii_nway_restart() and mii_ethtool_get_link_ksettings, respectively.

Ideally, you should port this driver to phylink.

	 Andrew
