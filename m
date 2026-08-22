Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4B348453;
	Sat, 22 Aug 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385388; cv=none; b=NrBoRmQ9iDNNjG0WiJxataPTyY7ONOTTl670AxyhiLCQF/njpiojnuquZmQy2eG9JZ78rRyRg0rjdsmgcCRcwOJi0UqLjXWXAWmcF3LycNFhclinluYmta6skQi29NwhDE+R29TVX5ijnNc4HX8rRWQAGg+qLkn65dP5Z5i25J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385388; c=relaxed/simple;
	bh=tUOfUYD7piQb2iuK2TuRyMHcxUENvhs6o+cfpEs7H0I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=njSf5Hd8xSsQ8/N0DfM8KRwozVYusy+dybTn8b8IOlRh1RupwpHIfu01Ri7MXIxYvVtJbLpNVw3tjmtt+/JS9PS5tmyNDfNS3cVSOMJIz5IKKmCi1T7WZbfBQoDBnxnxijsYjtOJBh/0z67d+jL0Ps0GUPhCLUk1YuuSvO+ODIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Bahs9m1N; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Bahs9m1N"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8C0B11C810;
	Sat, 22 Aug 2026 09:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385380;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hhrZlTJD57f4/yzbAXHLJ0B7LqCOpZLSDj7R+HVhpXI=;
	b=Bahs9m1NLSG1dC/urzlh10sXJ86yJTr5lz6BX8w85ZkLH+ojN8I7L5Om5CRjUnWYu6JmoN
	tI4yG0Y1eLX0bxBtz3fn3ZsXu+Yn9lPOVrAiRaHRJ4QLFEhhilanU6Mt0SkO1g3Xsldbdg
	bBze2aDVyPjyA8GeMqlUgLyQRtK0JI7+m5i02cCL6pQdJQW6h9R4V4U4TyTgsKF/saeoYP
	FX1qa2ZIgsxifnb1w1RQfCdB5XxLE5ev3pya6kjt9nFezkOeDUCXjm7czj/Me0I8zbN2xV
	M6CyeGUUkMDjMR7K9b6D7FeG4FrNu0FNcc64YmSaLwb5HiSEhl8nhZ+9aUfELw==
Message-ID: <ca72ed6d-1565-4312-bd9b-891874a80afb@nabladev.com>
Date: Sat, 22 Aug 2026 06:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH 05/16] dt-bindings: usb: add FUSB340 switch binding
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-5-c5e27cbc0795@foss.st.com>
Content-Language: en-US
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-5-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
> Document the ON Semiconductor FUSB340 SuperSpeed switch as a USB switch
> binding with enable-gpios and select-gpios controls. The switch can be used
> in Type-C applications where a reversible cable requires a switch.
> 
> Assisted-by: GitHub-Copilot:GPT-5.4-mini

Use gpio-sbu-mux , there is no need to add more AI generated duplicate 
drivers.
