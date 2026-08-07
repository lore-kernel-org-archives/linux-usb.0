Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3918A6CF;
	Fri,  7 Aug 2026 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786084306; cv=none; b=kaJILntWk+YdTHJ286PAsokP9XL6zkHLQZpkO/63AcHnSzGU3jq512v3T6SFEh8E/akG1IY5B++cJRbq2tjM6D5v5If8SSWQKRg6CrgR3n9iW3kZakYKTg8cXdf9BGbEK5f6YD39IEQmrlxPOyNUAD2j5U5bCoA9RjLF7/Cj2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786084306; c=relaxed/simple;
	bh=f77/Aie+j2a7W5te7idZYHtJec15KZxTt/EWCz1iiUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz9eJiJ1HIqodr4spsFYLoiYZJuPzUGwYya7Il/Isnk7hCz4yq/tWPVSZ5fHCrlbU5g2K3IpD0HAGk/8onJ7qD1DqxbaMstvvhrSxL+6JQLdvp7fjqbQZaU5RIazeTfSQFiLoaOkZPfRMvRUifBVAZ+K8sFvsDI9EB8b7h2sDEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/v8KbV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/v8KbV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096C81F000E9;
	Fri,  7 Aug 2026 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786084305;
	bh=E8JHxhBY+k1bnm7u+KEz/Vs6UoyyXTkYLJImTs/oA34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/v8KbV0MmhEJV7D3vtX+kwUmTxcPCMLhgvxJLhfdnk4nXV+6s6IsBLVh7P7y5fws
	 /Vba/ZpoqAVwziFskQkPKmFDhAVNV1Y8gkHVIM6i685+81egmCdbgsCDabnkhMmam7
	 f5nmIb+dVqdAff18vBr7AE0m4EYWPq6pT+tDSYXMujLp4Vz1H5RCsL5vXYVv/1lG+q
	 l50rT0gDzWi4UCxhmfv1oCCSVciFHVO6S8ux1RzlrrVuj1KBp7iloby5PdeJls16cB
	 bDa66ENhpw7iPWws+L2Z00jER+Yap6fjvHFBuOKrc/p4AC8VgwFGn8a5DqcmlyrWho
	 0ELXjQi6DPNCA==
Date: Fri, 7 Aug 2026 08:31:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
Message-ID: <20260807-athletic-gregarious-petrel-ca6d7d@quoll>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>

On Sun, Aug 02, 2026 at 08:15:33PM -0700, Elson Serrao wrote:
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> +			eud0: eud-path@0 {
> +				reg = <0>;
> +				usb-role-switch;
>  
> -				port@0 {
> -					reg = <0>;
> -					eud_ep: endpoint {
> -						remote-endpoint = <&usb2_role_switch>;
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint = <&usb_1_dwc3_hs>;

Your patches introduce new warnings:
'/soc@0/usb@a600000/ports/port@0/endpoint' is not bidirectional

> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						eud_con: endpoint {
> +						};
>  					};
>  				};
>  			};
> @@ -4972,6 +4978,7 @@ port@0 {

Best regards,
Krzysztof

