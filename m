Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3052E8B67;
	Thu, 20 Aug 2026 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207484; cv=none; b=BRT1/a2zi8zow4f+UugPDQQ31YGDB9Ki82iLMA8KdTSfoRmiIwYB0nmxrKOheSj8Q56mE+KI0Mjuk2AEHZN1LNwaAii+ye1nsVov/98XaaKo8JUckpTgiWSuibdgfkOkWrliifRWYhgVlKQMcRfI0+F/A2gPQGLXSWLdLxLED5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207484; c=relaxed/simple;
	bh=0rXnyV3lx30HYQ2HYQzIiv7xqXfy33xqwiRmVdB3n+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTNiiR6Ik/ZRgCZUTBB8yujKgxuDAqatjF1lK56Li1uMCT6Dt+HzUJe6k2/MiIEB+MNFDjvDKO3RQX7dXKoJ8rg9prjSwUV6xRioaVhJQuTbaHzo6sXLl+PiirSmfok/RgafjxsIyunA6ypI24uQGy8ivFjCaSB+xiYWCKs2cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaY2PjZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaY2PjZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F94A1F000E9;
	Thu, 20 Aug 2026 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207483;
	bh=900O3VEyybH1aCttG4gYFZ6ZQef1hSFgt0IBxSvtlbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XaY2PjZZh9/4Puww5cBXgf2vNZyzChaDGitUPW55YoiVWeG43wWZkATUbXMPiGFh1
	 AvKoNnMJ5r/dAT7KfQHOKhXcZ2ur8f/+pDxD011cXKdoLb+R689Ss3xEu9ahJqUSxV
	 5iimGhDvbUXtH0yz/xsFOON5tDgk4T7a1on+AHdh076JgIOLaRkVUK6NzMvUHkVJNw
	 mnA+vstJwbWo2BfLTMrTWIi7rBvM6++bGCBH02a8X8mE7kQF28HqiDEfWZplpFq5OH
	 i4rfpo9m42tmpqA1W/qFkXgJ07mEL2kFt8Fo14Cwsq1mHzIdVcd/Y9P/TJ37pTNHes
	 MRfYRvVQef6yg==
Date: Thu, 20 Aug 2026 08:31:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Andy Gross <agross@codeaurora.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY
Message-ID: <20260820-copperhead-of-pleasurable-wind-3db2a8@quoll>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:33PM +0300, Dmitry Baryshkov wrote:
> The MSM8974 DWC3 wrapper contains the same QSCRATCH-controlled
> SuperSpeed PHY as IPQ806x (SS_PHY_CTRL at qscratch + 0x30 with an
> identical bit layout, CR protocol port for the lane registers). The
> SoC-specific params differ from those specified for IPQ806x, so add new
> compatible for the PHY on MSM8974.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

