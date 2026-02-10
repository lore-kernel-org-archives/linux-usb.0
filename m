Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF5284686;
	Tue, 10 Feb 2026 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690297; cv=none; b=dKJM+GQsJBLE+X/0tRb4WPXO4DsW7o+PZl5R1cKPiexpY6Ym2YQAoVxsJp9yL7TYCIgHKzlOBhsi0NvL8/7IRiFsNqVLECcXs3ubxiBg1ikyFPjVRiLAQbx5qtkHkZK1TNOr+l7ODf+OZiW6cYnwyFJ4IL4aL+HKghHHZ/qXysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690297; c=relaxed/simple;
	bh=qvzkgIsUupXyFBmx94KHEIrSTpQoQW9SEGt5veYFylE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/lB5+KcxM3WEeZiA+U+KQs634l2Jb1hkuLRNYModgae0aWhjcF+vXAvDE7LW96wTt+UgPhZwKVJht6HZL+UFVRqnIYqElDkITUC/o6tOUWnAwEy3Drjl3JlIN2hcz/dxx8Kin58ZxtiBkYHSgkuIXv5yQjYCQpPuYgN7JncnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpUfiCWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpUfiCWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D93AC116C6;
	Tue, 10 Feb 2026 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770690297;
	bh=qvzkgIsUupXyFBmx94KHEIrSTpQoQW9SEGt5veYFylE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpUfiCWNb0vIktuuKWDP6Fl3XWl+f+zThcHDJq4SLtV6wjdRsodxX3StIrah3IjVS
	 lLyr/fNF07JG/tVAe3JyNDP2l68nIHnCI29Y73uRuwfYi/M1xI/P4IOUx4WzRgu20e
	 8jNRqleE6NsTtCQbEAkUggssnnhuL5fDWEq36grrGmUiivUIYhJzVTaEfMQor9D1ut
	 +zXBzGcxexfCOSQcM5MCcLZJu3Sfrp6XkU80bj3OHmkI8Bbx0cDfu0RfDDNa6hfqC7
	 NeozwEYjDFXg8tQA+dE3mf1zu4yfP9Mx3c1BLVHy3pSVSnIFKIsRNnjpLlyOiP1c7I
	 uvZYNzwPcyA2w==
Date: Mon, 9 Feb 2026 20:24:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Message-ID: <177069029377.2355609.7155450591040552968.robh@kernel.org>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>


On Fri, 06 Feb 2026 18:18:49 +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-child
> relation. The new binding is used to describe flattened usb controller
> node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
> needed modifications.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - rename file name as nxp,imx-dwc3.yaml
>  - rename compatible as nxp,imx*-dwc3
>  - remove status property in example node
>  - remove select block
>  - modify commit message
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
>  .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 +++++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

