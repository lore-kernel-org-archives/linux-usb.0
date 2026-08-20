Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D033403EE;
	Thu, 20 Aug 2026 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207073; cv=none; b=WrG9zXmyJvU7Biy8NGpGJd7xd3QWS57t/KJs0UF1+tMkXDWfuuKszqyZfdHxHz5p6BY5fjf2BJrencNFdDQ2DvyyZf4H/D/A89mojSipmTn/NFBXA7Y+9yWJ29RFwNYkc1xycsGaWGsfsmr/CA4nb6xlgE+xSzc89zPZmmO54Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207073; c=relaxed/simple;
	bh=mlZTKn7Wh/CrwHj/fF+ybvrzn/NEwEV6wLKYLNCAOy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5vLaiQwy5g0/LS97hNPqSEucPlWzisQSjh1+zMmTftXpgo7BhVPepGfhhwEzIXUsNCXnFzQO/gx+FONGdRagpYVyou9rioaoVsPNkkHiwhgblK8/FcSvSzz+mLKWR6N8FjytRpYHSARjSUfbTjXpv5jsgEojinhS9g3rd36T60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZRpMfJ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZRpMfJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E841F000E9;
	Thu, 20 Aug 2026 06:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207071;
	bh=4Tr2TvcHct2iaowxE/CIb0nWUjbsxs6pAqdqYk4x4Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hZRpMfJ7DC5PtzFxOh2c9L393T64/qALJf9bks2O/MwvjG0Z1NsP6A21dD3OaTGx9
	 IEX1/jgaYrcfQFEfIWKjxQAV4lBiuNcGjOE0Xgs/WSkWgb+X/15Fpxx6UcLRKdyjLS
	 AAgE/TZwVOwPWnSlD5hToIJ9e8Y0gnGe1wj2YrDPqnEvvmwkpo4IVJReerFhymLgGI
	 3409c/nYB7KOtXY3sibj4efgSiLyb4EBxdwqhNJnYv5vpxvPh92psCml+Kx79+Rb+y
	 lDa5XYk/nHlz/M1PeBYXE9fbFKDr2brVnAreMTWi8EyhJ2ZriyDtOfMhmJuhcAf2YF
	 5h2vd7/GM4Tuw==
Date: Thu, 20 Aug 2026 08:24:28 +0200
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
Subject: Re: [PATCH 01/10] dt-bindings: usb: qcom,snps-dwc3: document the
 MSM8974 controller
Message-ID: <20260820-curly-loon-of-whirlwind-ad53fb@quoll>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-1-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb3-v1-1-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:31PM +0300, Dmitry Baryshkov wrote:
> Add the qcom,msm8974-dwc3 compatible. The controller uses the same four
> clocks as IPQ8074. Unlike other controllers, it has only 3 IRQs routed:
> core, power event and HS PHY.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

