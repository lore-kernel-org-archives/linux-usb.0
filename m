Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873642DC32C;
	Mon, 13 Jul 2026 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927748; cv=none; b=lIWsCghrDQ/OrNKLvYk0/lKFp1ujjNQu+ErDdrVdL5bV+AKgZ9tRwogO5kE3KV0K29j2Vkt5tYZXpY09bKCwVLOtu4VdPI4vhEGxoLxKxc+Ai+SKzoD3h10nx1g6lUwndobPAS0kXj5cVrMuBqpaWmfRW5qLQia1w3KX93pivCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927748; c=relaxed/simple;
	bh=QZryj75baiRfBnWWWhy/q/bDFrIOd6fvuO2IJHZefNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imb5tLhnSGztUO95xMP8nZ7HQOJZMhHYA1ySLMfvrgueLbez2E9KzFaGbP3BEyiK1Zg7m/o6a/GmP8wnuakj1WRtPyOlDd5UHx8d/1FA9kOwhbx0AASPxAcQtHvBKRXhqhiH70RK135Tz6JP4HEWSqGvSLsDMqVQKoTL61a4rJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSNCksPf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSNCksPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338851F000E9;
	Mon, 13 Jul 2026 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783927747;
	bh=q1A9eF+k7sM0DhedSIhGHmF2na9e3afM7t2StqoDgjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WSNCksPffc72LeGiYWYJ5h8jlyuGi28/AgqtGJaxw/JzVRYkwsZhGyThTKq2xvLf2
	 II7+wxPobG9kNz/f1vVReib1wFu0Jfj2lXkZXgg+MLu7F01ZNjsmjuPDHHWJus+2qa
	 d0/SFBh6nxnOfSU/Ahitextzxyad1fOI/Edwq0PZyjB6nhH/5H/6S2Axme1vahGgIu
	 VYvinLy99dbhvnUEEDVHJXpN9uLGWDORShVyo+kqK25IO8VpguDBEvxrpnOLJv8v80
	 2OLlI0wyycsD5YCuFmNJXox3Ytk/gpdQnmCAUnNGtm9SUesQAG+uAKNvs257yP2x+O
	 Rm5H0WU3o8I+Q==
Date: Mon, 13 Jul 2026 09:29:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: usb: cdns3: allow iommus property
Message-ID: <20260713-chubby-honeybee-of-excitement-1af4a0@quoll>
References: <20260709205331.636449-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709205331.636449-1-Frank.Li@oss.nxp.com>

On Thu, Jul 09, 2026 at 04:53:30PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Some SoC such as i.MX8QM have iommu support. Add optional property iommus.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

