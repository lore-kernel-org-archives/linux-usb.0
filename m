Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B63515FC;
	Tue, 25 Aug 2026 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676591; cv=none; b=RU1ckLBRDG2K8RskEWtSfSACO24hu2Jt22gndod+zdDEfFq9oXTIufl4EOR5Lfgo7gY7oFg79qSROTMiSy7A6m2fvekXuu+Zzq3dMhOttaEkuvRRhaWiiEnJrwMRf7Mt7Ey0xs35UAhVNg3bVICCBfXWBQP+wSZWk7Xv9pWp/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676591; c=relaxed/simple;
	bh=HycxXDkfLEGOJ+adi9Jv1JoXfme/XbbsdtP1ik/HXus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZt9g6D+NW9IXYW2mNQEYeNVcSExVSB0JWOCiq9Ctg6eZWPZEvy6DETcpefhjy8My5lZPKvvWZX5mco+4fFUl/kJ9LgdmEYmyLKhwqo4LCcT0HTn8w6oLMVOKHh6sUdIYQsc7u0e0Eh/bHocKMbWxuwoyA2nDAZg0Ia/EByBkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atm8KEDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Atm8KEDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DCC1F000E9;
	Tue, 25 Aug 2026 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676589;
	bh=HycxXDkfLEGOJ+adi9Jv1JoXfme/XbbsdtP1ik/HXus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Atm8KEDZLcp12DPdZLtb0W7T0h6L9juMK/Wvmso54H8BDYJArDZ3DzwwAUGdrhIwE
	 RDqwoxC4MofBXG8H/75pJmlVNktIDw/XyG68qdMCH/hcbSLqG35LG2Ui/OXIOFwHME
	 QvEBTFiUfj8bEL3pIh0tSxfkNrRZqup8o3bmo3bB2T6eqOq3DT4fJsOUMpnYVcHPPa
	 zi4UQ1idJdnik4QL2pIhKWalh4ryPa2K2ffU+lNOpmXIJFnO0T7L1yAiSzTVKEfvbK
	 G4hDd7UQ5MRElBLOFyxBSMLHFckxeGCYrmW9mQFF7tBVRBZkuq3knuONYWMNCpatvU
	 /g270Ca9gXfPg==
Date: Tue, 25 Aug 2026 17:49:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Marek Vasut <marex@nabladev.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible for
 FUSB340
Message-ID: <20260825-stout-maternity-c3ecec3f8676@spud>
References: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
 <20260825-usb-fusb340-v1-v1-1-2191179b0661@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMZsYu+dKFY8n4Cd"
Content-Disposition: inline
In-Reply-To: <20260825-usb-fusb340-v1-v1-1-2191179b0661@foss.st.com>

--rMZsYu+dKFY8n4Cd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rMZsYu+dKFY8n4Cd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3HqAAKCRB4tDGHoIJi
0k4AAP9PmQTT4+9uUXdlUM9EYkkniPvfr2zkCf/WcJLQk2XAUwEA9YoafK+YlOVg
CpXCfB7lHz47JcQybS7XV9GnC8BHnAI=
=wZMd
-----END PGP SIGNATURE-----

--rMZsYu+dKFY8n4Cd--
