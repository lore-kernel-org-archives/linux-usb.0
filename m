Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A824A05D;
	Sun,  5 Jul 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244155; cv=none; b=PeoR67S6s8nEzOScqHbyElBySmW8H+ApLZDzS2TQV669lJv6oFHfd401Yzu7d6VkVjbJhKi4b3/mxlvXOJnquq082bhhDP69S8QLN408f+n4PrxSG7AjOOgumZ6t2ovTDjPhZ2oAe9gNvmTDIINn8n0ix285+TJ7C5SeSVEGUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244155; c=relaxed/simple;
	bh=o1BJHUBsPXb8Ud96OJ3zZlbU/KK4SIIrjGn5vrio3bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7UyFa8eLxjP/u+wjKH2KLNvak86PsBrVVonBLDKuGoE7eyx5koIliJ90KemlwJ+PBOtXKO1wZdOlxbJhNrYgiyc8oQHoH1PhbsyeOAR1MrHo8uNySjvv0QktI+x5XEVNWn7GfriqxSN3Ctvu4kl7TxU6i7gqRY5oiUzHqrUzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/IhxcFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/IhxcFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30451F000E9;
	Sun,  5 Jul 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244153;
	bh=ZUAr26t0ojsub7u6Y2sX2AnXHej3bubC6EbR5cuucDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/IhxcFIZ3ialoR579LXwaYa9cYQ5F0VQNoFru6ywKtuCpZvEWhHTsfYT/z/iA6M4
	 q6ejThERW19SIX533KJfDsWpBv4sZSTHJbcxHTDmqMHmIR1sEUfHT69SgsV3TaLDMz
	 qee91Qq8MJSEH+mANb93JpqR3oHIGuaI0AkyMb33bBIV2zGUdGiJqzF5s85EguIKOp
	 DFnUQ3IsEXS5w59PH9z5ePMnj1B2dyViu0J+6kzhBCwE0IXfALOxB3gWt/+vNA6lnI
	 UMAwg0wdCwyST2RcjlnUM55Pu2UlrsejGPjIj7qyTbkEhnLNikJFAguRCDJ7oEfJiF
	 yhc9a3Drgc6Rw==
Date: Sun, 5 Jul 2026 11:35:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260705-vengeful-axiomatic-goshawk-c4919f@quoll>
References: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 09:57:45PM +0530, Krishna Kurapati wrote:
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed..026fc715eebf 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -60,6 +60,7 @@ properties:
>            - qcom,sdx55-dwc3
>            - qcom,sdx65-dwc3
>            - qcom,sdx75-dwc3
> +          - qcom,shikra-dwc3
>            - qcom,sm4250-dwc3
>            - qcom,sm6115-dwc3
>            - qcom,sm6125-dwc3
> @@ -386,6 +387,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,shikra-dwc3
>                - qcom,sm8350-dwc3

Why is xo clock optional? If it is not there, this should be rather in
"if:" block for Kaanapali.

Best regards,
Krzysztof

