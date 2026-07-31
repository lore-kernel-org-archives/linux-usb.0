Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451202E974D;
	Fri, 31 Jul 2026 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785538394; cv=none; b=TijtvX4IFmANREaH9Jm9gXJ62GOTaWiL5SIzMaFbQ6FtAFTxk34BKF914GJkxHK/GcEBEvzjJozN/LUy9OZjlA2muqaocFbtS9kfJoxbpl8YWAzHmBrcodnHAm/p2vR3waPyVkmO1Hh7WuFVR6228TyBH4+p1jnlDcTGs1YDsxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785538394; c=relaxed/simple;
	bh=RMGBvSlymPrwRwCTFLWYvKx8tvr81bh3sjfDFMH38S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJudu384EUdaBfyrtUbVh5dScTrVXcXREGthT6wuRojmsKmgfKBg9gllqr5SmEYYK55B+le++KxBvEN+OHTO/HTwRECC8VrthymUmu1TTPEXUCNib8V5LQFWQXqqzldSETKzo0k2dnbIeNpECl5X90xq5mJISlDC8SC+lFf/6ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLonS8js; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLonS8js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78E01F00AC4;
	Fri, 31 Jul 2026 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785538392;
	bh=M0c1Ce+dtyoHDLG8T3KU81xzpKWn4K94rECOvEzT1lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLonS8jsGvJbP3MHsKianCYEW4AEJA440IeWy/cfPgnE7zQHnxaQsyWpwC8NhqYpv
	 R4hAO9JPmqRMGs6ngLFXhJ3wyWvq8EaQYd083KHWjCoOn/+qGh7coWcxIRreRLKx6J
	 0+4cwBgrG/nGOccKUaceWCFxR0jqA9hdE/B4TMWCZWoS5u7MRpMVpavhsZXFmP2lGv
	 9C2VvPtd7z57jC0O4t/9QzCbu2LBOjsQuSEHzFw60WiWqdtWOC970SbXtaSl5fECDQ
	 yzxFZUasZPhIPvljuHLJFnSOCNU3KhB2tdWb7zgYFMfCKBp/G8dPyRCRxpqyaAc4an
	 rdmA3N0e8t3qQ==
Date: Fri, 31 Jul 2026 17:53:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hongyang Zhao <hongyang.zhao@163.com>
Cc: linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Roger Shimizu <rosh@debian.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add Hynetek HUSB320 Type-C
 controller
Message-ID: <178553839083.2097911.2444017921812331593.robh@kernel.org>
References: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
 <20260720-husb320-v1-1-4a1e259d7dc8@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-husb320-v1-1-4a1e259d7dc8@163.com>


On Mon, 20 Jul 2026 16:17:11 +0800, Hongyang Zhao wrote:
> The HUSB320 is an autonomous USB Type-C Configuration Channel
> controller supporting source, sink, and dual-role port operation.
> 
> Document its two I2C addresses, active-low interrupt, optional supplies
> and enable GPIO, and managed USB-C connector.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@163.com>
> ---
>  .../devicetree/bindings/usb/hynetek,husb320.yaml   | 171 +++++++++++++++++++++
>  1 file changed, 171 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

