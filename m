Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A41E531;
	Wed,  6 May 2026 01:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030396; cv=none; b=R0yv6QtFvBml31W/GrrOJb4qzv9FdpabViSIbjqGCIExk3aHLnjIkdu/mKNHcJXh96tI7g6Q2NI9X9G7v/iGZ/Aqc8WOJBksu5g54O96S7BfB/h8vDOWWzInA4Y2jq+aKhanPnRpMeyJ4diu3Bht97xz9v0DC05D5gmGRY9GEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030396; c=relaxed/simple;
	bh=Lo2J3ckp1HHEUc7MJLC2C5rpL8Id65rwctqCEandc1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mofvg0kYiX9o/v9oiHs9RogteoRKHIaB2kH0xZOOLhXPvqFqpIAu4eQWM5ZW49LjjAqJBTLg7YwtjlLLhRkJ1WGJFAE8vaITgUKVyDvn+Eo2zsE/tEYNM9azat2eBB+1i2MzT1yAHzRWxLozavleBJMs/VZU8bOcW3daead8x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awwUcUyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awwUcUyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88F7C2BCB4;
	Wed,  6 May 2026 01:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030396;
	bh=Lo2J3ckp1HHEUc7MJLC2C5rpL8Id65rwctqCEandc1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awwUcUyW/UELBpZuRTUrQscWsE2Cg7oiPFXIPoGfTnZHPzN5o8ryEGm0dmTrCRabV
	 MdPZcjNr8hXmvRmV8j0E4W4f8jHTcbov/b3Ec76PyDbeQi03r18aIXaC71qzUGDpgM
	 uOfAm1GqEZeIhRXD2xbFwzKrvOU5dyDeyfuoqV/Bfxcyptrc77qE9PatjUr79oomlR
	 gEmiJ2AKU9AhDKD2gYHiNYvnD4Qdms9SqMltUj5CS675xbiZejsTTtf2O3/4xHOWG7
	 yTxC2x9LFi+q+iS5g4zsp1SdYwJfApuuGEvZCAGJw6kGuxzVZWVM6J59rp5tVwOurN
	 fl5U9cFeeUQFQ==
Date: Tue, 5 May 2026 20:19:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, vkoul@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, conor+dt@kernel.org,
	konrad.dybcio@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Hawi QMP PHY
Message-ID: <177803036501.245983.2853371804362184732.robh@kernel.org>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-2-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427214217.2735240-2-ronak.raheja@oss.qualcomm.com>


On Mon, 27 Apr 2026 14:42:14 -0700, Ronak Raheja wrote:
> Document the Hawi compatible string for the QMP combo PHY.
> 
> Hawi uses a new QSERDES V10 register layout with a new COM AON module
> and hardware-specific PHY init sequences compared to previous targets,
> requiring a dedicated compatible string.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

