Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836823B530A;
	Thu,  9 Apr 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749050; cv=none; b=K6TLBTD28bys4/k+/15IO11n+draxIMJ7qbY55CEuO4cgEDOOvkaNWfrCAh3OMyPlZ2EF9fzBOnKOzLfL/g9p6f0ODReTbl3FB3gpHeB21zRfXoZEeIV/wa+Xx4k1uuUkg6vMSZg4KU4rWxy++oABl7ychOiXrDAtQXSDJjP1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749050; c=relaxed/simple;
	bh=rikDfK+shKd09V2l35XVq5CBnpCe/aw1H7beoHy6Ql4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CteZdpdgYxpRgK4pniY2OM5Wry1MMSnHjLtG2kjYsTwNZKTO+0qMBoiL2WVB6Uyz2/PaMbZg2RVL7XuS3ZO9uB2ZXjWO9buKYP2D2pBApOUBubo0eHuNdYY73Mhwv81lHE7L2BLSh9/j/1MzP8CKKstGBg12ame372yZjzneWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsGA2d3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsGA2d3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9144BC4CEF7;
	Thu,  9 Apr 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775749050;
	bh=rikDfK+shKd09V2l35XVq5CBnpCe/aw1H7beoHy6Ql4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsGA2d3/597aULA4H/+WgW+iraVrBsEexJx4xUEkLWexkvZ8GQ/DcQz8I11TfYuZn
	 NNbyPTOS/zHiNWjxrCS7vhE+ZwwE6uS3CGdCiXvpYQRm6K1u2ghjYpgNZ1zC8XstzY
	 P2gZiYhnIUpPQ6wlwzZWSxNRU86G7VboOWbWjyr5jeWplfAI35Ulr9yKDB3Jjv7wK9
	 HyIseL5scJr4UbZ7DAEVdgpRrfM6iXGSxpCOLHmI+4T77MOsZIY7OvHB/i3GRgxkSE
	 3R3jppd3Pjl5ECLjWk67pgTD1ZyJGfgCL2cgmwNZKd2fHqVI6qs9q6SydXBkRynsDM
	 vqPp43XD+RsWw==
Date: Thu, 9 Apr 2026 16:37:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive
 JHB100
Message-ID: <20260409-perish-speckled-1da7daabca31@spud>
References: <20260409101227.39417-1-minda.chen@starfivetech.com>
 <20260409101227.39417-2-minda.chen@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Szp9bcjGEHcZXrrN"
Content-Disposition: inline
In-Reply-To: <20260409101227.39417-2-minda.chen@starfivetech.com>


--Szp9bcjGEHcZXrrN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Szp9bcjGEHcZXrrN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfHtgAKCRB4tDGHoIJi
0ruUAQD6OB0ravXsS1Jql8tR5OC6wdPHYpO4RoAIhNutXhDgsgEA4Z7ixGEGkxES
gu1p6GmVUiXhHtQXoSnNwpvCo7YNogQ=
=xgYU
-----END PGP SIGNATURE-----

--Szp9bcjGEHcZXrrN--
