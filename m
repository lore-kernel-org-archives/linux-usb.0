Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5542F353EDF;
	Thu, 13 Aug 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612347; cv=none; b=HcpXrpYOlvrvnmhYB13kZ56vF1j7lTVB/WUgDyZAjHs5DyNMQeGu8IhU3Oz+1CMk6AY9FSmkH57NWnYEerT0gRVzyHstPIU+exbsY2rum7cSnaaTajbgdVS8VaHV/oeNar6eFVfDYiTFo5Bx9dFmHil89KrQtp9+gR43FYMBFlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612347; c=relaxed/simple;
	bh=4ehS1cQbZM8hpxw7DJQsGBr1TWORnYjYQX91dRdrAg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRZiytbLECJOCZ61H2/S1bSAGVQFb7g02VTNtLXpsOLF9arvEDjYWuAtwiRYQz25FniInksFE3SjdxEUVgrdAe86MP7e04DaFgdlYJGtuGRJcWzWVqhRlzABVjHAskf8hQoedLjTjAmrItJDbSCo4nagvPqk891EjAYrVlTnc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPLdRXNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPLdRXNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A16B1F000E9;
	Thu, 13 Aug 2026 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612346;
	bh=veOK+fGOB86iI4UeNXXh9Hz7WZFBr6hqVs3K45gN6P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPLdRXNzEh2jCgVgLlyNk0naoNeF6D7UzsVL7YuWf0USIUv4PYlYg80UhgYTkvXJy
	 5QNMk2yHOd4zsGeOLUke2g5GI+LqcR08JQzTWqp1vQomj8Ts92fKrm9fLBra6yDqJ/
	 cZsocozBhZ74OWPx6kpgZUO6MIpKpPfDi5snbjfn7T5eUPa1KJBb5bzBpWztfvTQGI
	 TUS4WiSVi4gjvulGoJhReUh8ttHOz6pJITUCDLIqXkaSj6ECqhvnL1NCJD7mY+pU3x
	 THwCdo44NC0krv/ZoWktbCLIF+7N2WS6k9WlRaUTGdrd9TwFtNaqMLbsvkd1WF65LZ
	 0NHphPLUOlfIw==
Date: Thu, 13 Aug 2026 11:12:17 +0200
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
Subject: Re: [PATCH v2 06/14] dt-bindings: usb: qcom,snps-dwc3: Add clocks
 for USB3 on Qualcomm IPQ5332
Message-ID: <20260813-futuristic-opalescent-seriema-ea2bf7@quoll>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-6-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-6-8f355d7ff0ef@outlook.com>

On Wed, Aug 12, 2026 at 01:34:41PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks in Qualcomm IPQ5332. These clocks are required
> only for USB Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

