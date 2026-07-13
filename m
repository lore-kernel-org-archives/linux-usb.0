Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD3478F3A;
	Mon, 13 Jul 2026 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929121; cv=none; b=qturnTuRHMQLqTJwfZMsNkfcYw+tzAYdRG0EDQndnNg+irXr0i7VdnIKoDHBZ2KRwKQzSsCXF0pLyf1GGVyApCQ6oZqdME1lPdaK+YfWckqkAiqWv+UT3aAE+2os+ICrQSInT76Dqj1dX+Ko5elLoP59aYiiUK2+s34GyhJth/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929121; c=relaxed/simple;
	bh=N5UgyXYij1BjJXL8F2sLcW5rO/6DFfwZK6soBWzpi2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avZtohD+9rk3fMwQFUymT2P9WUN1+kYiELTwC08K+R8pK9XpBmUxkdBH18EIDomYKq1fud4mRsWsV073F60MMrBVy8uc5gKNiksK3jwdIMpwO7KT9Q+/5MBV1yQ6I6hCQvKrImVge8Y8+LxifooO+ZbSw35uvX1uRlPb2Dp/BZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fun0OeHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fun0OeHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934381F000E9;
	Mon, 13 Jul 2026 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929120;
	bh=td12MSWMVfirqIyWvoYyv4DJRQWRMElWGYTnstghCDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fun0OeHfrNcP0OhxCb0ccs3/D8FZ0diYxfPQAoLINaQvby5ffHo2dO2d7JFwOTdxU
	 GxEysQ2E7kG1cCoovuYHgagr0Wx6JxTJio1wn4XsrCXZ2/HZiQlgWg7ni/QIIt36uq
	 CAv1rlEUz3Fx7mBYXZDvXDT8vhvbcH5BiysNwY2X8lCSv5f+tC79SQNbERSw7d8oSa
	 LAv+pEfoLvI7mQdkX5c1lZLAWRImqeZ0OvH9Dkx1Y7HQt8hREPiPnPQGOd9Cao7i39
	 Fj1ZkgZDmKXINPUKhbCVu0x7ldFnF0YItcxmBr5llUiBie0y3XFpgx+c9tG/PnrEDg
	 2ZmHAvefG6KiQ==
Date: Mon, 13 Jul 2026 09:51:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-binding: qcom,snps-dwc3: Add Maili compatible to
 supported device list
Message-ID: <20260713-adaptable-tough-seal-902a80@quoll>
References: <20260712-maili-usb-dwc3-binding-v1-1-fd6697fa1e21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712-maili-usb-dwc3-binding-v1-1-fd6697fa1e21@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 11:18:35PM +0530, Krishna Kurapati wrote:
> Add Maili compatible to supported device list. Maili has one SuperSpeed
> USB controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

