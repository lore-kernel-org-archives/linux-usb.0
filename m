Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99B3D567E;
	Thu,  6 Aug 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001363; cv=none; b=tIUHntjZLxq+JIxqicyARDcpbignAeL2P6CVHnnCCOLJerKYZcc+RfsBJo7rgrCKXjZxovVh1yraEQ9TUqS/0sRBvDCIG0q/wJqCb8RRFnpyY2oruEzEgLP8z/iW+vWhBCfpXFsv1QOhlF1w0mD4D01YJyo1nyDJ2x4hpCQzUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001363; c=relaxed/simple;
	bh=4T2FXKHxY00qh3G/hEeKJJIMF+lB8NfLdh5iUnr18h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC6bVrLO60RYeNt74hGOZrf48vcabYPDe6JgqGKmpS//cAotCh3qN+YXgXwrdWLYN7tBi6KZiYFwBXyI3+CM0q5JY7HJ2zzsheDtM5oT54T5J+HTjGClWLTYgdl/sE/UPGnhojWmGeseyIWZMzL7lOVsOuZyFzaOxanFASr82SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvaEjJqh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvaEjJqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884771F000E9;
	Thu,  6 Aug 2026 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786001361;
	bh=/lWlSnIFOaBmTJ+rj11kLjj0tBxcQ9ndjOpVg3VzH3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FvaEjJqh9ccrzTYJPFCt6EKe+GQqqQ+cexK7CDh7CIDHlJrmed3E//dKnj5EqOs1y
	 pXMlEmSl+Ch4PBo2ZBTZAT23d60kGaGn6tA8Mrsps22NeAvMJjfkZ4OVOWS5Cj9zQe
	 bKLWcMFbKvn4ld8nPRGF5LMtOla/zyd5z132PhqMlQBuzO7QftQrMmdtxugDeq2jqD
	 03clUoBaSzsCgbPMII04ANe9S/vBGDPwORzcoK8uhTgNggwgqwwcZSnRVOCexYGfAx
	 gIltRe+BqOKRgyjg+neDllZ/U56wIZBc92F+rZMXhuLI5fLaa/Ywk6IncY6lDHJoNM
	 mYYa7JBFwYXmw==
Date: Thu, 6 Aug 2026 09:29:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: usb: generic-xhci: add Axiado AX3005
 xHCI variant
Message-ID: <20260806-meticulous-fierce-fennec-a4e9ae@quoll>
References: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>

On Wed, Aug 05, 2026 at 10:09:33PM -0700, Swark Yang wrote:
> The Axiado AX3005 xHCI controller is software-compatible with the
> generic xHCI programming interface and uses "generic-xhci" as its
> fallback, as do the Marvell Armada 37xx/8k controllers.
> 
> Add "axiado,ax3005-xhci" to the existing compatible enum instead of
> adding a separate schema entry. Since the enum no longer covers only
> Armada parts, drop the "Armada 37xx/8k SoCs" description rather than
> leave it inaccurate.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

