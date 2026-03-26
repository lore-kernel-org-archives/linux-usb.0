Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374103F210F;
	Thu, 26 Mar 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538776; cv=none; b=DIJqtcQVYRo9sk9ijUrHk2auY8sO+pKweVAGeE1tvzod2N496Yh6Qr45VHSF9Oq0yhYnbg8v90KiRAqwnrWuvrAYYywfa3nGxLWQhpK8rhtYevvS01axhyS31kUf5fYlYkiHkJiuf4dndDavMJVErx0ePReXs97lGDqlSPrRI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538776; c=relaxed/simple;
	bh=n+bIFKSjOB2crmf5AvxNH7lVOr7PCQpihLEsRVjMmi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7jpUoBLEZfR1+1F3H/NWj6P4ycryKsUsP2iaBxRGrpzJsBtAY34OpWuJ9rEA98LNOavrSF1dUuan97H9HDZDNUWi1jmr896Q2f2X+UvbWZ9Zrn5Lflzh1QgrgAaYnYv1tL99P5lJclYVn9hFW9sEUCjfqY6I7jppT2XFzmGrc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiQg2z3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiQg2z3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B53FC2BCB0;
	Thu, 26 Mar 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538775;
	bh=n+bIFKSjOB2crmf5AvxNH7lVOr7PCQpihLEsRVjMmi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiQg2z3PfkurTNn6KUVBI3W95j4EtDIUdMOnt/ajBxfnUzKpI7FbeG7N/Hp7xP1qy
	 aBNGJbPw1mvIx8zdLU9X4uZUmaOhHB1mq5fjof7xh+QAzvQS+W9zfg00IsE5D1jSZA
	 RJ9aExSejDG2F+fJ0YX9h7erEVGXC8DjBAMCXvozi9RspGoKy3WI7Oq9YEqZd3TV1/
	 dXFTNJwODrGTyl7KSqEc8pN63XfmF9qQF22hCo+dI23TELjRvettaOMpi/CCRQ7iIS
	 JVpV1mEFUGSKOTb+URSeDkAqNAfLiYRbpviLeGrH8O/SOK52KV40vVKUVVWjS4Jmos
	 aEWIoRfh/G1yg==
Date: Thu, 26 Mar 2026 10:26:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add support for Terminus FE1.1s
 USB2.0 Hub controller
Message-ID: <177453877141.2506202.3743813210780505738.robh@kernel.org>
References: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
 <20260319-03-usb-hub-fe1-v2-1-e4e26809dd7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-03-usb-hub-fe1-v2-1-e4e26809dd7d@kernel.org>


On Thu, 19 Mar 2026 07:51:03 +0000, Yixun Lan wrote:
> Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
> MTT (Multiple Transaction Translator) mode, the upstream port supports
> high-speed 480MHz and full-speed 12MHz modes, also has integrated 5V to
> 3.3V, 1.8V regulator and Power-On-Reset circuit.
> 
> Introduce the DT binding for it.
> 
> Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/usb/terminus,fe11.yaml     | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

