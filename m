Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5A2F39B5;
	Mon, 27 Jul 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141618; cv=none; b=Nq1jG2SsYQ7LdMNu4mSA3arnyrFALvze+XSRe1DM2/jDMzOP9d4+n3Lj5wQ24GyKTeXQdBRbENdYOQNSoUdmSt+dM2eRojhIAbIIlpGzu4Q8C1ajV0OriDCBxxtRXSLNdxcwvwfVFpcE5MD/FDked0NkOUVM7Dyv3Nu6QuKO5AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141618; c=relaxed/simple;
	bh=1vq5tElCqjgq78TxKZDpO8iJmdtYJwEC9y7NY/io2yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwMivUcXT3ZNhqTWbG5svmtXXVTA0R0LULqEH7hU1KWDVd1EJx0EnnDAZbrNRS8IAvruwpFHCh+rSr0C8FXTsLru6R+cH2bna4XydWke/BHpIbWcSRAjaM4PguCirIcPtqKe4csEsEQhfuHYYcJv6DXmaZut5XP3RgEYfPxZtl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KR1QwAc2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KR1QwAc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC011F000E9;
	Mon, 27 Jul 2026 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141616;
	bh=ZP4KdcXkeXYuZa2glRkDOsikFgVQzKiGkb82a7T8evI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KR1QwAc2mmPmcZl0j7etDSDuKcYJ2fJqB2WtvCD1McOS7StM8onZzGxrIXdBCqsCG
	 mdy4F3jFL5wRNldL1oU1+6Fh0haoFlmZQ8vuIN5OuifWbJbzcsPUBuRI6zQu+HCIT5
	 DZiaMXg4tWiiYK6ebudVIJolXaVu+WCMsSqFY5blKHpHwjHcedw/vwHQnR0nmjoXCk
	 fM8fZWFMdsAyYkvL8znRDIjgRMHCuDUktFVh78rEWB9rVElYHeo4bKYGuhJLYGix8X
	 /23bSg2uVe1FLZvvwgAdvDO6iHNHnUwUmylU8zWZm4qUPDbI/lEM9zgGYGLnVooGFe
	 Gh33i3RWpXKiA==
Date: Mon, 27 Jul 2026 10:40:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bling Chiang <Bling.Chiang@ite.com.tw>, 
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Message-ID: <20260727-scrupulous-impartial-ferret-cffce7@quoll>
References: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
 <20260724-ucsi-itepd-v5-1-d1a83e5c9c77@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-ucsi-itepd-v5-1-d1a83e5c9c77@ite.com.tw>

On Fri, Jul 24, 2026 at 06:09:19PM +0800, Amber Kao wrote:
> Add device tree binding for the ITE IT8851 and IT8853 I2C-based USB
> Type-C Power Delivery controllers.
> The IT8851 supports one Type-C port; the IT8853 is the two-port variant
> sharing the same interface.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
> ---
>  .../devicetree/bindings/usb/ite,it8851.yaml        | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 ++
>  2 files changed, 159 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

