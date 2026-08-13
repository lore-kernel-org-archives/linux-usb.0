Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11F351C31;
	Thu, 13 Aug 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612188; cv=none; b=poToOqTF0jpwx0AK3GAtuH/jFz1AimOiwVIXFo52qAt/jGh8IiWJRAdaRbCIne0bQ0LFYo5XxGXmXWIj3ZakQfoMDZ3JH0rlx0cnaOWBqChdZqIdC2QrmWBXZ32teUIC8sraZzmCrZgEWWfnrdoE/CS2Nnev30ZUteg+icXXwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612188; c=relaxed/simple;
	bh=UKURWOEBPhjx6s0HvVjzHTLbcuSIMwQ5K7QdtoOphtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRHn8TfZtDLKLoG83f/yot747wadRFopzjJSB+t8aEIOuwpvDeKdbgISR8mbE4rEBRrnjhn3QDvxiKjBvwpEoVnJGu4CRu0S0WKlZryUFsT1PRQeEuOwKvMwKkBRYUZdJNKEGsPutthGi0Z8BPqlDMeE8+7cQVi5d6pNgC/FkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq/9htuF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq/9htuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CA91F000E9;
	Thu, 13 Aug 2026 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612186;
	bh=55pjWL2dqRqVF3ySND1g9Z5pqwOJeqbt+9oVpOV21aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qq/9htuFdn6XUwYLQBuwvcIaZi7RzOMt7XPIRP3aBBdq7l0Oxcq6N2zEYBPv4C1mz
	 jGaa7DhNfOUVPhZnB7C8EXj3tFmil3rA5tzR9ztEiGg/R9Io5SYo1apCDM/jCF/PQl
	 +n5m7zXmCour3VItlMEtX6A/poVVhlytrg/gNiTHqfM8lImJYDXHk+PPR3h7G1/2pO
	 czwshBMMlS0SpPgaQYInuD/NcP33l3b+yEmHC1mKF/DYu+jZ90sUcfPo/iYnf6PmC5
	 qjXQ8dq101Lvd73qAiYKrmbtVioGPv3H0sP9DR9ORbtci6h4IEOz2CqIJNSYIi+eAX
	 QYRYyJ0zGZYzQ==
Date: Thu, 13 Aug 2026 11:09:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <quic_ipkumar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 07/14] dt-bindings: usb: qcom,snps-dwc3: Add clocks
 for USB3 on Qualcomm IPQ5018
Message-ID: <20260813-uptight-peccary-of-pizza-6edeab@quoll>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-7-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-7-8f355d7ff0ef@outlook.com>

On Wed, Aug 12, 2026 at 01:34:42PM +0400, George Moussalem wrote:
> Add aux and lfps clocks in Qualcomm IPQ5018. These clocks are required
> only for USB Super-Speed support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Please do not mix subsystems which explicitly requested not to be mixed,
so all USB bits should be separate.

> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

