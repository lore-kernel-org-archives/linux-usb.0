Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610EB67E;
	Sat, 13 Jun 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377714; cv=none; b=DPJAbZJlmTpA60S+EjyObHxKSoaI+55bUZzSwrAYSpEoZ1vAxvaqPwq1KabYkdWqDqsAldFh/Io8lRJ4GQBz2spgjtk9oiozYKf37SE9osxdXGnPHfK0UQIfkDrdv5OeyXYqT0TU9w21kY+X8z4D8m2DKMRjg2xfFbgmYdVAJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377714; c=relaxed/simple;
	bh=LjajmdmOzuACeOv45bqV3fR22ZS4cFO+6tVp6HlGDAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwGkg0DoRagbkZtz0ZEa7xibbRhaaRD7tInTTnyaz/4tT/JCMXnOtc1jQ8mh7M+GZKAAXBYNsFiYO/zGtWswiKon/l2QfdVLtDppB0lPJRU/E2hColLjw2bdAyAIfvljEJrfZQTEokAvbgnl173CEKn+n6JeJl0mA2KH4hbHw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+ZfXxeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+ZfXxeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EEE1F000E9;
	Sat, 13 Jun 2026 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781377713;
	bh=U9BebE2KDpGAjiZCajxFstfd/90NQAQxQhXQGdlCYus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+ZfXxeA/cDb7PF0cVNguYmDA6vjiJuTDSGdQCpVWL5VnKNwcGF5bWnY5QA43/zEs
	 i3jivAs8zblW3mxFZgRMI0RdhN+kZuoUJRezoFANCuYObY5oIwU3o0hAPp0DyKQ0SO
	 TLE6T1Y1vqVg7cjnabk24pxk7GGQNTAqLuFFulRLW8wN+SmzwYFpOjWeSy9RDzPdW2
	 mUENQab7G3z8JJMNOuKDUa9676voZnq2gxWoANBd/OpJPNVaVtDwpX+vWPkAzGEqWI
	 5VerAoa+F9bJMZeV0VEEOkrSngaGmzWktWvKKzaKYGcK39l4cvu0RPtmJwwe/qgg9+
	 gQ/GgoQ/u2v2g==
Date: Sat, 13 Jun 2026 21:08:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bryan.odonoghue@linaro.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ti,tps6598x: add TPS6699x compatible
Message-ID: <20260613-adorable-sticky-skua-6eec43@quoll>
References: <20260613162335.1490514-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613162335.1490514-1-radhey.shyam.pandey@amd.com>

On Sat, Jun 13, 2026 at 09:53:35PM +0530, Radhey Shyam Pandey wrote:
 +  switch and Power Delivery controller.
>  
>    A variant of this controller known as Apple CD321x or Apple ACE is also
>    present on hardware with Apple SoCs such as the M1.
> @@ -19,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - ti,tps6598x
> +      - ti,tps6699x

Family compatibles are not allowed. Please use specific models,
expressing compatibility (my slides of DTS101 talkmight help you if
something is unclear).

Best regards,
Krzysztof

