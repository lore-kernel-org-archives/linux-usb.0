Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB541D659;
	Tue, 28 Jul 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238973; cv=none; b=nqsaJvjuKbzRQcOOzMZHEg2oMGC8DzKC8p8+xCqIkfnCEtk4I4xl+Hiv2azL0yNbESheaO9ip2dBeqasAKSlBp+JGr+fqcxQgnzzpir1LCOxfcjZXtkD318Pq+C6BGRvqDLpr4x27SXwxI6KBgWZN9rtNo27N/z1lrKZPlyE+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238973; c=relaxed/simple;
	bh=9PMsWJMeqFvSvFkp5mR6/97SNc5PPpwtWCu2cH+prR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=broB6oCauCMPFoSJFfn3ftsD2NJuS3jybxSEatEg5nlCDFQggTQLAoWzrDHlhqVx48zi7i5XhDWVD2+q5pkP1WY35Qn6nAaEt0wgXXGGgfKSc9M7ay0oI0rjdRxCyPaFfpOCMJo0DCAL6oiVhkFfwUFX6cB0rKf5cKYErgpkj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsVoGK2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsVoGK2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CCE1F000E9;
	Tue, 28 Jul 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238971;
	bh=2mNt2dOySp9q/2k8ZxT2KxFZIv10llJBjMWV/L/cx/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GsVoGK2wb55UylrlhljEHCW6xOA2P06B281bDdPLGnIJiLyg5TIR6QznLyTDiOH2w
	 w67Htcf6Qg1/xkaEnXJ58pIoj8kupPnBRbIQRZORHQG9zo6PmMke7qm8lRPkiFuDnZ
	 5fcY3uUXVNzAneEh/kz+xkLClL+0ePRD/eMdb2i5+68mWC3H3E/GmMIvdl8NlOfIV/
	 D9aVsXMu1U7B45wjpk08c+r7F/cs4kOagkEptji/UhVy21T/Rj/hQfAOOjTh68L1w1
	 zqFMPF9VwygJM9F0oEAszZS8wNjNpwCmfbByVNQQ0vVpQ8SwKFqyhMufa4hrFCbHG8
	 3qq86cvdn4/bA==
Date: Tue, 28 Jul 2026 13:42:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Axel Haslam <ahaslam@baylibre.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, goledhruva@gmail.com, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v2] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Message-ID: <20260728-truthful-neon-markhor-8baffc@quoll>
References: <20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com>

On Thu, Jul 23, 2026 at 09:13:29PM +0530, Bhargav Joshi wrote:
> Convert Texas Instruments da830-ohci bindings from legacy text to DT
> schema. Name of binding is changed to match primary compatible property.
> Add required property clocks and optional property oc-gpios which were
> missing from legacy binding.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Based on unanswered review of Sashiko, dropping from DT Patchwork.

Best regards,
Krzysztof

