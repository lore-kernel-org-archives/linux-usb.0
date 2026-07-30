Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1D3921F1;
	Thu, 30 Jul 2026 06:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393901; cv=none; b=MX5SYXEGNwn5WXMsn5YKgJ34qrnaillfm5IvGNTzDPvpVGjeLF17SINoGh1xj74DtiC+UEF4mjsjwbp7pK35gYxuL+dSsWEoXrR+/jV6NaNei4W8jPdDu7sAsTnz67H9+iovASPiG6onmOOzmnJe6Q6fLrhFjpoYu+hFascOdHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393901; c=relaxed/simple;
	bh=tiriDDKqjtdVwtLLRZ1YxLB0d4A/4ixIn+HZ2LQRnHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpiepC/TlTivmZL+SvidUUG/ABaTHYll39WlTS/DkBYTq1FPVNxPiFwCz8uM1rhbm9iJg+sZP6hFsoQ7C/yhIyW5SB5v4ZwClpOX38dvHCd4zxW3QC7iCdlzinCTC1hYd1GrGpLCuBk9DiN1XCnOtok0HIXOAznoMh2bOS1/xKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Iz3VIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Iz3VIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FF91F000E9;
	Thu, 30 Jul 2026 06:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785393899;
	bh=PlqTjr/zpKc36pJvnFYLOfQcQob+b1HDhHj754Igfhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X9Iz3VIR6nH4QIegQyw0SkQ2bZaE1+DTEmR4ZizCSL8FfsfS/8kgjo9ikgW7eSvpV
	 I/FDFcm0k4kSiIRoZ6Uy1LN00w6rH4i6+9KDSRCji06wfTw7lyfpfwENaAwLej8OVi
	 NwwRfYjD8JahqYp0BYUElFYNZ1PvpVKInCA7zxcXg0lfPoaveKmlVRbLH8ZwcQCWKH
	 FdlSfPHF+O5qy3srpAhiQ6XjJi776pQn6TRfsOJrsJ+mxAP12OrH9WX7a8vlsrIeGL
	 gINAKav11dXvx6Q3YNbWsYsT/TchNNr8eatYp5I0/wFKD/hxheWB7KbEzrtBEY9Qob
	 fHVMPvaRxK1wA==
Date: Thu, 30 Jul 2026 08:44:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Axel Haslam <ahaslam@baylibre.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, goledhruva@gmail.com, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v3] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Message-ID: <20260730-sincere-horned-turtle-bc5f7d@quoll>
References: <20260729-ti-da830-ohci-v3-1-e30da330780f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-ti-da830-ohci-v3-1-e30da330780f@gmail.com>

On Wed, Jul 29, 2026 at 01:00:37PM +0530, Bhargav Joshi wrote:
> Convert Texas Instruments da830-ohci bindings from legacy text to DT
> schema. Name of binding is changed to match primary compatible property.
> Add required property clocks and optional property oc-gpios which were
> missing from legacy binding.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

