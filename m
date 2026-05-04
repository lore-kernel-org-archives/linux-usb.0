Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350A37D113;
	Mon,  4 May 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889597; cv=none; b=I3YKyfvguiTuml2Fp4LhJzj4clage+ywCyozy6JhM2cz3ILSjkc/ymJ8Epa68PO+fYLXV89Dnr1QSTvfPnUZnI6fgqxD52aUOZ0utsB1qc87ABU8ItanRT1RiWG6KXEWRaaIyWl+UBzAQimEXiIjoK6IiaY3BS6Ao7kxTFU4v5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889597; c=relaxed/simple;
	bh=HZUUPBL7Z4E9vSMrCphwJqkVEsdGZieR22pOXMD+3Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4nuyL5Igt4SJueBgxNCOuuIIdaqRv4hEdtp7C91YUmXMOEKEcY8atEknhKx+FuqSQPv0jOUnIx/Q0GzmoBV12+NTOKRVbgc95ueF77WgdN0Tv7obcaK8NC1ofkWRrnh+Nj0y8GTNcEJh5p1CQVcuxv290zC9rlGa5KIl0rBiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/GLT+GK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/GLT+GK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AFFC2BCB8;
	Mon,  4 May 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777889596;
	bh=HZUUPBL7Z4E9vSMrCphwJqkVEsdGZieR22pOXMD+3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/GLT+GK44wPcHIXfRtvkjC7/q+evcpPHeKcU14aKbUIa/LhFHLk1++/Ao80wicWA
	 tXs4MMcHFGs5DOTK3l93md3lsGNuPoUcHWrHrAwebu1t0sPhyK+1HJWNKE7u4UIqG1
	 o4jBLdWknmHNqr9DCd3g+NcYDSIg0TBbgPCpFOidxI5gOPwoeFeitjJkrUikXyu1r1
	 8aaTAd0ZXwuIA4f7DLcrNZ9e6nyMqPuA8mn7Dlzgj6ITB8tQpEXAlpjNH5uWDxek+w
	 1YjGBADx58oK9xp3jMuiYMaO5ncUlvKFsrzyybAOaYjBr5WQZX2Ipwh8Ow/34AsiSr
	 gkVNgTzPwKDWQ==
Date: Mon, 4 May 2026 12:13:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260504-amphibian-cunning-horse-dbb413@quoll>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
 <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>

On Thu, Apr 30, 2026 at 05:20:26PM +0530, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Introduce the compatible definition for Shikra QCOM SNPS DWC3.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Please do not mix subsystems.

Best regards,
Krzysztof

