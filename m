Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB03A7D7A;
	Sun, 12 Jul 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859301; cv=none; b=F9ZIZinGWyLJiJd6hxJO7yhktgJVbqA7Ny2f5d1yxnJq6WocWHXk7DX3ZdMB3CGBRwaUs1iPUJMdiK2tsteXdFL3fi2Zr93Dxo7oAf9YsTNPMEWOV7bkQ75I5VWw9sfetVvbFGyOxuQxm2cg6tda4YFBzrcgW7YH4JbffTZsLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859301; c=relaxed/simple;
	bh=zBuoHJgyKjwMTn3GawD77iFOVO6xlqE976aNZ+y/hoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZXbMKBQfb1ny2OiMDMzn3HmzOrsWGGN5QoQ+LT5aW664x2wCUinnMmZGHqbKO9oZeVICBL58zLQvFL7NGddfwC0+iNt017E52+z3mpnbgMLvw2fvI/7SIliXfdR+YFV77kFvibP1PJEJtaGLgJuwCLrXcJuR54hvdq95GGK5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O00M2lDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O00M2lDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C281F000E9;
	Sun, 12 Jul 2026 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783859300;
	bh=Su0f0fOvCgbDlKnlSpfTJomGI+pCMm3O57CCfD3OJFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O00M2lDih+AwYIjL+yrW85IYDF9mo8bCqaRp1M4tfrFBMT6ZmAXMHbw/rHT+uzEZI
	 ZX9bx6S0TW8aitDiCvMrPqKr3u7TPIRDlMjDFPpMbPwJmdwYokPDHWl/WkNHBeP/Na
	 NLkvvGt42Nyd1EdVs591cKlOcPP2YrytxYj/W+fRj7SlGWUeqt4g3vPNrID5waUAZT
	 g4g9vS53rb5XF8iAwhTFgyd7v6d2ifQALd/5YtcmEmEc1sDLeo9TGkfUoiCbVAEvMb
	 nYHSGWGXIO3Q2r6iFuPYCBMPHC+a2JRfpMWm10r0dYjCEcggp7+oXOrC+K2WjCk2Yi
	 +VVvS7AeQA5eQ==
Date: Sun, 12 Jul 2026 14:28:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260712-fantastic-emu-of-fruition-ba5bfa@quoll>
References: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>

On Sat, Jul 11, 2026 at 11:33:01PM +0530, Krishna Kurapati wrote:
> Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
> has two usb controllers and the secondary controller is high-speed only
> capable.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

