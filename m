Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020151;
	b=GjyM3jxJ9bK/MArRY+5f0mzO3z290w0bOfV9NLsTYyhSL3KSZ90LcsTNnv6RS6mGPs2L
	 NagoWMcdpNyjuRxhc+4gJOpMzyI6mKv82/rgl0GPANAlrnSSSxbyGyovIIM8HVRw0e5Ul
	 H4vvOxNg4r/X3NmbCfD8a/TY/uBgfxBvjljd2jIVQ06EFco0I1V+GajUqxeUseM4fdGRe
	 9WGdCkQK5Ui7tVevBNiR1g5PtJoB837Hs88e4djej+k5nEqhrGlsW3VbYY8nVTHbvUF4z
	 pTddj4PJhBgUxlbVdY1aTW7c/C8uPG+fnCUIYxpsYg5CJgEWdiky36+LU9ot6YFYtlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020151;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mqewyvM+xTwHwNVbHo8A+a7U2L7f4JKm4mjUkqZmHhI=;
	b=VcFuLAcgXfAvYgPnKOKtIYPj+0irr3g/SvlXAPU4I9dMDCEqlVz0uyeF70A0LThw3T5c
	 cGaF5cuE076k3QQxzOK3OMLhme3D+Gaj68NpsYSI9COrG2aJYWQtFu1T2XW/R9mjCdHGy
	 8ZKj90haUoG2NU3RCMPfVhHbZG7uORMEHcBwilKh5iaGdlEAO/rlL2H5dRd6VqL19FSA5
	 y+V0jx+tjADN9wKRaEz8ZrzeLDVbUDOtHboyWGTOyIyoCB6uDBmUKnIJCZMyQIPDuU9Lq
	 JEXYfN17SCKmPPIfSEjqE9l5pOYKZV9gcYoCXZiVTIMmSBihHTkFUQjr/affVT8LLYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ViD2Yut0;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=Xo8acUbO;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD00606A339;
	Wed, 18 Nov 2026 16:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD00606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ViD2Yut0;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=Xo8acUbO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795020148;
	bh=brBAKiw0fRzbnx646PXODeFFtM5LjDCKovENSeKDJLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ViD2Yut0D2YfdCBrBJquoR2loPFezw1CeOcw3hfUcZ8o3MLtGmrnH7+m0OOOZBr5k
	 L5A8/NhHdhj748CKXY0fntPBARS3AEd5qOiEqRYqA1c9CMzoU5M+t0jC9mCqartws7
	 uK7uRNFihRIVeiVyj/nkMOp5rnRpDWK8Blv9dVkqXll5gC8UEMSD7j5FWBTVM5HS8q
	 vq8GaskfEP20TODWq3ARFIbpiFkR6qC8tEldTL+cfWHmQYi8BMP4COJj4LxKgVkr7J
	 L0Z7vR1KgalC2FexMh94iuX86aVQR9ANdF0eBpIX4Hcc621lu+w29ikx6lE50fBWbs
	 zkThyBVUWOEqQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 3546F48D5E; Wed, 18 Nov 2026 16:42:28 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795020146;
	bh=brBAKiw0fRzbnx646PXODeFFtM5LjDCKovENSeKDJLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xo8acUbOBrW0rl93+XHU9n/VTHjoIosO7sXdwsyyn8Jt+YhprVImLrXmao5/yLr1S
	 98lpkoQz+00kx2DSTSUAnvWxC2DQxT0IgKSzPPJgCl7w+bjhCPyRRcwY4TPk73+xD9
	 MPN+v1eyoKtn0qMfAKog9bpabWLfG1T1LB4oil5XijFI7dlO1e7MJYZdnzj7LPsvXG
	 vOAlwey4Jxz5vjV2tUV+mCh8gBNMeGw6Oqz/Z08ZZwzPB4VC9SR5n20TjkIzc+T6Cm
	 ojJ97jg8/hfwsQmqSdHs2QiRlZH5w6CD38AXfb7mhAn1Hvq9S9KD8lnyvYvarcWehS
	 cZXNHJuS4+mPg==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id AE2AC48D57;
	Wed, 18 Nov 2026 16:42:25 +0000 (UTC)
Message-ID: <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
Date: Wed, 18 Nov 2026 17:42:19 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
To: Andrew Lunn <andrew@lunn.ch>, Chih Kai Hsu <hsu.chih.kai@realtek.com>
Cc: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 nic_swsd <nic_swsd@realtek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "bjorn@mork.no"
 <bjorn@mork.no>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 2:42 pm, Andrew Lunn wrote:
>> I plan to add two new functions, rtl_nway_restart() and rtl8152_get_link_ksettings,
>> to replace mii_nway_restart() and mii_ethtool_get_link_ksettings, respectively.
> 
> Ideally, you should port this driver to phylink.
> 
> 	 Andrew

Indeed, all of the (integrated) PHYs on the adapters supporeted by r8152 
I looked at are already supported under drivers/net/phy/realtek/
It should be straight-forward with many immediate benefits.

Birger

