Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6836195A;
	Wed,  5 Aug 2026 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915365; cv=none; b=BikIEfFuywYjyxPoHFJxEqYtHUK9Ioyv/3pTUpXfl93+vOVabqle2AYfRHbR+RR8/KbAbrfWh9F3A5uK/6KUV3hK9IOSUxNX7uwSgc82NDUb2/m1J4+JrP4RGhhyE3PKUHnR96bGQtZNERq+Hxq/hV6EPqaaztI6AX6lUy8gA2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915365; c=relaxed/simple;
	bh=Aiy/Xw0ddsio/ejOdZdoi3AUlPLAmTj5gtQ49Yavl78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwFfmM7VvwInLgicoKGdk+ZTWy4AzsMYbk4UH/mj/Kz+nTuid+1cBF2ycNO7fSY2KRFz/ZcIbFRjSBzvxHMz59CEOongquuoht2olXquGFPeOlfaI4oO6yJYiCS+ZiX8hVjTHTMCm3HDcbNIXMNmEyuCtTwiPurhAPUh1ih3Osk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz6gaU6A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz6gaU6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBC41F00A3A;
	Wed,  5 Aug 2026 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915364;
	bh=Aiy/Xw0ddsio/ejOdZdoi3AUlPLAmTj5gtQ49Yavl78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gz6gaU6A9NhrUXP36BBtqxDFGmaxmpL+aOu6xIvMz99zIw9lcXaq9VQvrBYNArfjn
	 3DaHBXSLty/5PpRyvsdxeAqDjEIbrDwPeiv3o4bbaQkOMsDC0aR+jPNV8P9B5tqGmf
	 Z+vKb5PPRpJubqXkorMlTDPB9MCh3AgErQT3f9+C0sSNxtFC8rGcxHe/m2HBQx0Chh
	 GcIxhOilV7fQqFEVuQ0fYaaWix7HU6g2bb0ycG417hn1N7JrCUCyHno096W6SkY5BX
	 rugJVgG4o8qc6BRQ25C1WPV9ffyMdh1ys0KRmcJRTTcnpjXM6AnZTIlvQjU/HgF/Ws
	 AZWiZzQWRbJ4g==
Date: Wed, 5 Aug 2026 09:35:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for
 non-MP controllers
Message-ID: <20260805-independent-dashing-urchin-0b9776@quoll>
References: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 09:43:04AM +0530, Krishna Kurapati wrote:
> Glymur DRD capable controllers have HS Phy interrupt. Fix the binding to
> indicate the same.

HS phy irq is listed in the existing if:then: block, so what do you
exactly fix?

Best regards,
Krzysztof

