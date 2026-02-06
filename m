Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9851241C8C;
	Fri,  6 Feb 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390470; cv=none; b=mVVREsLTrJzLCWJcsw2iHuXEdCxC4+qhRLiB2u6Alw0qwF/sIDm3dryW1/QZHtg2untnDSmkiRndwdJQ0ng+A8eyrhFF+drlrdwkgoSruZQln5JSv4sKJqHXHGYrj8jTIh/mOt4S9mq+FcYqlvzgIw6E9fox29pAChf7/7Bwu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390470; c=relaxed/simple;
	bh=uostbRf/nuGLLsYAVwpXsZgczt0tkhlfW1EXTWZO3FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKyoUFocBPzI/ae0D3iMm/1BajOJfq8ozfwwO49XEfsYqi4KSp9xn4FSASBsktUGBH0bl2T369elNFzbXWgdyVuEHHvxhrS/jltinWoHnOVk44xVxNPxeSgTiaWGpXk0GmfGiH01Q/OPfrzEOs/nhYWdZqtasPsNRBZMeL5pGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qlrdx+nV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qlrdx+nV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFEEC116C6;
	Fri,  6 Feb 2026 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770390469;
	bh=uostbRf/nuGLLsYAVwpXsZgczt0tkhlfW1EXTWZO3FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qlrdx+nVpZGEEg+jH4AdgTe5DsnTkKsPFkvbWWtdbYtVHI6hi8BasVnb5QpNPU2aO
	 BUUCpSkxyS+9RmxDc8SH/P0S64r6sSuwlRdE8sDC6ffLTms0A7Zsv+mv02bBTpYwUt
	 7WltfRbVSo8PMoQTwf7D+FhS8DwPKr/5Riyhh0AR/Aou09vOO8chInUSEZQi1krZNS
	 hNVMIvKZK6lSVTBIq/YKHbRgMu/OP7lnVQDHjrm3tbCc1nbBYb2ftMOCYWAu/JFWEL
	 KqY5Oh7xAFUOmaXuQtMXo5pz4mrQsDp8IcOS9GhD0uQ5IvAzQK+LESdy/ZIuVj/5xR
	 C99yHsAF7/iyg==
Date: Fri, 6 Feb 2026 09:07:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Felipe Balbi <balbi@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: ti,dwc3: convert to DT schema
Message-ID: <177039046817.228709.18017032250520113965.robh@kernel.org>
References: <20260127-ti-usb-v2-0-9dd6a65b43df@gmail.com>
 <20260127-ti-usb-v2-2-9dd6a65b43df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-ti-usb-v2-2-9dd6a65b43df@gmail.com>


On Tue, 27 Jan 2026 17:42:14 +0000, Charan Pedumuru wrote:
> Convert OMAP DWC3 USB Glue Layer binding to DT schema.
> Changes made during the conversion:
> - Drop the ti,hwmods property, as it is not used by any in-tree DTS files.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/omap-usb.txt |  80 -----------------
>  Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 100 +++++++++++++++++++++
>  2 files changed, 100 insertions(+), 80 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

