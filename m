Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079860;
	b=Jqo7W8yXXBo5uZbekbFVu2p1dJL18HDDRvx4qYiABhldPyxIOtupfMsC8ok8igQK2kKU
	 9MCH9cBqualRRHcD6/y9fDsK4Km3wPvZ/ETT6xOsVH3WXctT6vGoax5DB1iJdLNLgYUm3
	 xuNHnQ/TfXKImANWgYi6cnlN+UBiOoH/1/Z6sDZxw2WPGo7Ze9bfy01P7LbeAIbd12/hJ
	 UI/KXdgxUmUbr9EApgK/cr9IdD5liH6+/+dfdqw+RhqXWRZ5myK1hOXZMhLDmBuLg14QZ
	 lRtUhfpzQYgrbkwxQDtsE2k/87FGnUM5MQDebM1iykWGvepLURhKle+bQ9Z3WqF71nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079860;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6F5+I72vBYAA8E5UbCp2F96IYspRbTENxPbVOPsxyC8=;
	b=AlELULmDbNBxi8rZe0ypWy/jS+9y6XG0SEbBJv+5bIu1XlznyhrFS8U3KxWw9rycuRqe
	 m9cPefxZGL20SMnUgQm63npWlQP2nhegz06sbZ1KS5mwTYMkKJjHeZIVQfeM1SKfH5ORQ
	 eMjRyvRoQJ4GxN2w5l1i9vFSckpJgZljTxRBl4aYPYK16NA2AWnsu1mPZo7M1LKAwA4DH
	 ZCQh1jirquDJUf6JskPt8eOEVTKBJRxAfgZ4G2+wSb1wHY6WsHsKWolGWAQoQIyOI/UzC
	 JHunPoyX40//3d2h5tejWw/jjUZIpYLsteCFivAI8hkmZWnky51ZUa3znROwue7SwAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2cg13Qrx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22860A2600
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2cg13Qrx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C561F000C4;
	Thu, 19 Nov 2026 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795079859;
	bh=6F5+I72vBYAA8E5UbCp2F96IYspRbTENxPbVOPsxyC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2cg13QrxGm500YNktaY032prqeU92NH3cZZ6qYyLpfjIjbeTU5fj/Z4vxWtDmtUEE
	 I02uTm3abNWanUCt1Kq6vsRgS9v+4kgLpw3Z567dv37ik5plSQme9jgaV9Wi4ktZMA
	 SVGjdJVfUleChdYcSR24nc3AZyBHG/uwsx+WItxY=
Date: Thu, 19 Nov 2026 10:17:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and
 reviewers
Message-ID: <2026111926-thirsty-boondocks-d303@gregkh>
References: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
 <aromZGGDP-rTsNCz@kekkonen.localdomain>
 <8efda53d-3f18-40e9-9c16-92ac2f5c3133@kernel.org>
 <asSsCj4bV-DFnzI4@kekkonen.localdomain>
 <av68mbd8j7UdvA02@kekkonen.localdomain>
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
In-Reply-To: <av68mbd8j7UdvA02@kekkonen.localdomain>

On Thu, Nov 19, 2026 at 11:08:41AM +0200, Sakari Ailus wrote:
> Ping.

Relax, there's no rush here :)
