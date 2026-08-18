Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD503A718C;
	Tue, 18 Aug 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041169; cv=none; b=nYjhJ3Ou2vwJYPf85K1fsg5zGWgLPhzupp9ih6UBbnUV0KDyJK5nCAdPhdpwA/VUXbTBgbeaZuA97SCMDjFfq9iTsqoPQWhik9OhSbzEFaWD4CezBJ5Ybf4hCdiw97vptaUBwPRfAD1GfJhukztfIEWeCmCNhPvWfTrTDsPM4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041169; c=relaxed/simple;
	bh=MOuxaYpchPWrPFl2JbglDCaF/iTtS9533e3ieIFdCUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIheXy70tpNTlWftF3fgLz0DUl8SnrIOiSV/eKU1kBlPcckbyIfgbQZba1UgOZfdOTJOvBAsjmYVz7agyyon4fZabqOI8CRn3xzMy21VYLpMFPK62/wJHc1UMADKKvexUrvg8ltohcCD4lZ3jLQ9GWl1hZf2eZNTd4HKrItX2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjl47PwT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjl47PwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F251F000E9;
	Tue, 18 Aug 2026 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041168;
	bh=uPCZE5UQS1reSBivMfqpeYb6NJuDBFdvhISL7AQJN6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sjl47PwTF/cLPjJlGU93edPoLyfmJ14vkTClpNmoHwdkcZuQ6EvIx49piTlQaxT1A
	 DRuEapnf9CTV15na0Dss8mLDfrzUDlzPzyoX8wBERTUD/3NRsWSDfjNalDLvGPaDR2
	 PKO/2Icgi0K9kT34lJnP+DkoLjmV6OhpUq3T5ol0q7QzDDxw9oRhYi6T4wi3QTZNh/
	 6uTIm9+lUTLa//UozQURz3I6dNWs0b5yBE4i0/ifJDFXu3SM4S8NJNX5iU3JNK5xij
	 KDsp+2Hh90aDjHKp+GPwmzK6ZdPEKuPMPH5QMJdshzpxesAHroAl/79DRZ8YoyoOaw
	 0ZELrQngIEf2Q==
Date: Tue, 18 Aug 2026 10:19:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Francois Choleau <francois.choleau@st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 8/9] arm64: dts: st: Add USB nodes on stm32mp231
Message-ID: <20260818-brawny-ultramarine-jaguarundi-e314c3@quoll>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-9-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816213849.1044073-9-marex@nabladev.com>

On Sun, Aug 16, 2026 at 11:37:10PM +0200, Marek Vasut wrote:
>  
>  		bsec: efuse@44000000 {
> @@ -1062,9 +1119,31 @@ exti1: interrupt-controller@44220000 {
>  		};
>  
>  		syscfg: syscon@44230000 {
> -			compatible = "st,stm32mp23-syscfg", "syscon";
> +			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";

Obviously fails dtbs_check. Use tools, not humans, for this.

Best regards,
Krzysztof

