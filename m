Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60838D40B;
	Thu, 20 Aug 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207324; cv=none; b=XJEwXC+1RuMU7bADARfq8RhG4EseyXcp7BoNs1PfyWH50guiErsQ2Q2k7OBwQdw4VfZGYbuaxiofr2AMrwmMu7y7e/sFhNmKn3wE6XrPJvnc/ZyKEbjP09gmD9nYMjlzzx4Opg5EWQdu75xg7u5JZtjtjp0Q2ttLNQP0s4CNAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207324; c=relaxed/simple;
	bh=J1AKMCBE3bPIPaNggPzo1OJ/xteef9PUl4v19wG9cAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOjy8tEcNr4kNE9eR+PfcPR2LB22CJjnB23hwP5gerIRYy02ViaONuoucPz4io2rf/GVtyin6CQTaCwTeBVNS5uDXQw/4vz6Bm7Iy4QwNtnEt9bTw4P2XzeRPMG/2DCqpEjJINhBkhltWR2PpFttMf06QPy48iou4kvg4WKz1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/xXRtJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/xXRtJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC01F000E9;
	Thu, 20 Aug 2026 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207323;
	bh=vlmGlFNqeaPwl+5piuF9Oww2cxWSjILVLUIq05ajKx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/xXRtJPdu+wNOhk2rzvGUPK0kAKkpbyZJJQQP9+bQSM+6126S3dkhDTQJAgRABoC
	 jg0GjJSsTuxAw+AfW3Q30OIu77nAaz6HblQS9iRTbDpFJkHataH95fj0hqAILXBdKB
	 T/o8Y2a9n1foi842cogUUwUMZfabd6f50AQsxpRtsTtS/jZTfbiM6R6BmZgrC+xBC3
	 kxLtitc7foU50DulIUpAdeCeddIw39V9+8u7u990YN6aYOzVTcsONnb36Ml0S96a7C
	 8HSOsZCYTGRg4/bbO7RXax715Td8F3d6OtPXQVSFNvnBV+bsPV5DQNGyVVmGrJll1K
	 puoLWTVMeqMYw==
Date: Thu, 20 Aug 2026 08:28:38 +0200
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
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,ipq806x-usb-phy-hs:
 document the MSM8974 HS PHY
Message-ID: <20260820-chirpy-hoatzin-of-education-2c9108@quoll>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-2-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb3-v1-2-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:32PM +0300, Dmitry Baryshkov wrote:
> The MSM8974 DWC3 wrapper contains the same generation of Synopsys 28nm
> HS PHY as IPQ806x, controlled through the QSCRATCH registers, but the
> binding only covers IPQ806x, leaving the MSM8974 controller to run on
> bootloader-configured PHY state.
> 
> Add the qcom,msm8974-usb-phy-hs compatible.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

