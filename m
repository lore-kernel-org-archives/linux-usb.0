Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA2182D6;
	Tue, 30 Jun 2026 16:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836852; cv=none; b=KsWUFeniIh++y59HdCpME9PMSu88trHQs61ZvBarN2PRtvO/efKZ6vRqQP3iGj9BFwmPDeeABPSGPxXMPY/RCsB9HjXZ1xPVJGmVDixojx34Q12dRGBwnVX/JvrxXsRjttg14t8cjlLtfXtlczLtHSKiFxs4PSejHCptgv1wnD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836852; c=relaxed/simple;
	bh=2iAEWYXw7sNp06aPCuVjvdEvMIHIAJ14sFrs9Se6c48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5T9g2YfY1xZs4SY3ozBBEHUqE6Ale0M84N5STALyvhybCFVeClhmOLxxJ1op97eqZTvfe+waPIdpFv7FYbhdHcgGSWkyvMuNyiNw2YQMiCF96IywDeuAgpzl/xt7vCx/PMg6O+UvAfGw2JGFh/TKTw3jEPmvLLxqayW09+2R90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNZT32yv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNZT32yv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCDE1F000E9;
	Tue, 30 Jun 2026 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836851;
	bh=7kmpKfvvBq7okZKQCv/ehPu4+EnCnsCutR8T0mBIkBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNZT32yvJLdJ9oiNwq1uq8btk5mn6FMFtTNJuaARi7C/6SDjKhP7KSAaWm9UnofMO
	 RKbWmdPmJggcF8ZorMX4J+UXNxkzdvSXNifyDtPl4kHuWYfpKf/4oDzrop5JWRiNr5
	 CYSMoM8TO7KhLRsSuhqyZt/9sHr6WSJfZ0foUPbRL5WXd4z3xSjtukTL5MWzC8D/Zd
	 nlCu9MLjKvvdH1sFVBzrlwTcWh7MUYB5X9sF5pWT0YgPAIjtrlxiSpOe8c/fmVXN9g
	 4ZFXjImzcoQ25PU8LkHgL8I+8Uqkt8t+T3k7A7wj7OZ4N1FJ6gs7yaXSvkhbq60jzt
	 a0xS7JdHkvKOg==
Date: Tue, 30 Jun 2026 11:27:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: generic-ehci: Document clock-names
 in top-level
Message-ID: <178283683796.3902793.5018890843722271107.robh@kernel.org>
References: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>


On Thu, 25 Jun 2026 11:17:45 +0200, Krzysztof Kozlowski wrote:
> Convention is to always have properties defined in top-level part of the
> binding and then customized (narrowed per variant) in "if:then:" blocks.
> The clock-names were mentioned only in such "if:then:" block for
> atmel,at91sam9g45-ehci, thus add the top-level part and disallow usage
> of clock-names for other devices.  This has no practical impact as
> clock-names are not used by other variants, except in
> hisilicon/hi3798cv200.dtsi, but that SoC has it undocumented.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

